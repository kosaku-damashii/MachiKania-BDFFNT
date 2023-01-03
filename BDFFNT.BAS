REM
REM BDFFNT
REM

REM === Sample Code ===
USECLASS BDFFNT

USEGRAPHIC 5
PALETTE 9,255,165,0
CLS:GCLS

G=NEW(BDFFNT)

GPRINT 0,0,0,7," 0123456789ABCDEF"
FOR Y=0 TO 9
  GPRINT 0,8+8*Y,0,7,CHR$(ASC("0")+Y)
NEXT
FOR Y=0 TO 5
  GPRINT 0,8*11+8*Y,0,7,CHR$(ASC("A")+Y)
NEXT
G.SETPCG("PCGNUM.BDF")
G.SETPCG("PCGCHR.BDF")

FOR X=0 TO 15
  FOR Y=0 TO 15
    CURSOR 1+X,1+Y
    PRINT CHR$(16*X+Y)
  NEXT
NEXT

WHILE INKEY()=0:WEND

CLS:GCLS

PRINT "Honneamise Fonts"
PRINT
G.PSTR("01234")
G.PSTR("56789")
PRINT
G.PSTR("±²³´µ")
G.PSTR("¶·¸¹º")
G.PSTR("»¼½¾¿")
G.PSTR("ÀÁÂÃÄ")
G.PSTR("ÅÆÇÈÉ")
G.PSTR("ÊËÌÍÎ")
G.PSTR("ÏÐÑÒÓ")
G.PSTR("Ô Õ Ö")
G.PSTR("×ØÙÚÛ")
G.PSTR("Ü   ¦")
G.PSTR("¶Þ·Þ¸Þ¹ÞºÞ")
G.PSTR("»Þ¼Þ½Þ¾Þ¿Þ")
G.PSTR("ÀÞÁÞÂÞÃÞÄÞ")
G.PSTR("ÊÞËÞÌÞÍÞÎÞ")
G.PSTR("ÊßËßÌßÍßÎß")
G.PSTR("Ý    ")
G.PSTR("§¨©ª«")
G.PSTR("­®¯")
PRINT
PRINT "Please press any Key."

WHILE INKEY()=0:WEND
END


REM === CLASS "BDFFNT" ===
OPTION CLASSCODE

USECLASS UTL

FIELD PRIVATE Z1

METHOD INIT
USEPCG
Z1=NEW(UTL)
RETURN

METHOD SETPCG
VAR T,S,C,P,D,E
FOPEN ARGS$(1),"r"
T$="CHARS"
WHILE 1
  S$=FINPUT$()
  IF 0=STRNCMP(S$,T$,LEN(T$)) THEN BREAK
WEND
N=VAL(S$(LEN(T$)+1,LEN(S$)-LEN(T$)))

FOR I=1 TO N
  T$="STARTCHAR"
  WHILE 1
    S$=FINPUT$()
    IF 0=STRNCMP(S$,T$,LEN(T$)) THEN BREAK
  WEND
  C=Z1.CHRHEX(S$(LEN(T$)+1,2))

  T$="BITMAP"
  WHILE 1
    S$=FINPUT$()
    IF 0=STRNCMP(S$,T$,LEN(T$)) THEN BREAK
  WEND

  S$=""
  FOR J=0 TO 3
    P$=FINPUT$()
    S$=S$+P$(0,2)
  NEXT
  D=Z1.CHRHEX(S$)

  S$=""
  FOR J=0 TO 3
    P$=FINPUT$()
    S$=S$+P$(0,2)
  NEXT
  E=Z1.CHRHEX(S$)

  PCG C,D,E
NEXT

FCLOSE
RETURN


METHOD PSTR
VAR A,L,C
A$=ARGS$(1)
L=LEN(A$)
FOR I=0 TO L-1
  C=ASC(A$(I,1))
  IF C >= $B6 THEN
    IF C <= $C4 THEN
      IF ASC(A$(I+1,1)) = ASC("Þ") THEN
        C=C+42
        I=I+1
      ENDIF
    ENDIF
  ENDIF
  IF C>=$CA THEN
    IF C <= $CE THEN
      IF ASC(A$(I+1,1)) = ASC("Þ") THEN
        C=C+37
        I=I+1
      ELSEIF ASC(A$(I+1,1)) = ASC("ß") THEN
        C=C+37+5
        I=I+1
      ENDIF
    ENDIF
  ENDIF
  PRINT CHR$(C);
NEXT
PRINT
RETURN
