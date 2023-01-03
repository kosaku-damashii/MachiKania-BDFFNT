# MachiKania-BDFFNT
BDFフォーマットのフォントデータからPCGを設定するクラス

MachiKania上で動作する、FontEdit (http://www.vector.co.jp/soft/winnt/prog/se513740.html)を使って生成したBDFファイルを読み取って、PCGヘ設定するクラス。<BR>
<BR>
FontEditの「Name」に16進数で対応する文字コードを指定する。<BR>
![image](https://user-images.githubusercontent.com/62051355/210295932-831460ec-e95e-4b98-b068-d7618574ad80.png)
8x8のフォントデータのみにしか対応していない。<BR>
濁点(0xDE)、半濁点(0xDF)の文字が後ろに付く文字が来た場合は、0xE0以降にあるフォントが表示される。<BR>
BDFFNT.BASを実行すると、サンプルプログラムが実行され、下記のような映画「王立宇宙軍 オネアミスの翼」に登場するオネアミス文字を設定した後のフォントの状態が表示される。<BR>
<![image](https://user-images.githubusercontent.com/62051355/210296219-c41e04ef-e7e0-48b0-b656-2c612d56990d.png)
>
