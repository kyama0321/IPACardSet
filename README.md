# IPACardSet
Matlab scripts for the IPA Card Set

# はじめに

このリポジトリでは「IPAカードセット」専用の音声読み上げスクリプト(Matlab版)を公開しています．
IPAカードセットについては以下のリンクを参照してください．
[IPAカードセット - TwiFULL Press通販部](https://twifullpress.booth.pm/items/803305)

# 動作環境

ひとまず，自分の手持ちのiMac/MacBook Air上のMatlabで試しています．
- Matlab 2017a
- Matlab 2017b

現在使用しているMatlab標準関数の都合上，以下のMatlabでは動作しませんでした．
- Matlab 2016a

# 実行手順

以下では基本的な手順について説明します．

## スクリプト群の配置

デフォルトの設定で使用したい場合は，スクリプト群を以下の場所に置いてください．
> usr/Desktop/IPACardSet/Code/

その他の場合には，各種スクリプトの "%% Set your environment" 下の部分を変更してください．


## 音声データのダウンロード: DLSnd_IPACard.m

ローカル環境で使用するために，あらかじめ音声データをダウンロードしておきます．
音声データは，全てWikimedia上にアップロードされている二次利用可能な.ogg/.oga形式のファイルとなっております．
本スクリプトでは，「IPAカード取扱説明書」に記載されているクレジット情報をもとに，各カードに対応した音声データをダウンロードします．
全てのクレジット情報のURLは全て "ListSnd_IPACard.csv" に記載されています．

1. Matlabを起動しDLSnd_IPACard.mファイルを実行します．
  ```
  DLSnd_IPACard
  ```
2. 以下の画面になったら，Return/Enterキーを押してください．
  ```
  Start downloading files? : RETURN/ENTER
  ```
3. 音声データのダウンロードが開始します．
  ```
  ---Downloarding: IPA Card No.001---
  ...
  ```
4. 以下の画面になったら，全てのファイルがダウンロード完了です．
  ```
  ========================================
  Finish!!!
  ========================================
  ```
5. デフォルトの設定で実行した場合，音声ファイル群は以下のディレクトリに格納されています．
> usr/Desktop/IPACardSet/Code/Sounds/
  
  
## 音声データを順番に再生: PlayTrain_IPACard.m

IPAカードで記載された番号の小さい順に，音声データを再生します．
現状版では，
- All: No.1 ~ No.111 
- Vowels: No.71 ~ No.98 
- Consonants (pulmonic): No.1 ~ No.59
- Consonants (non-pulmonic): No.60 ~ No.70, No.109 ~ No.111
- Other symbols: No.99 ~ No.108
というグループ分けが行われており，この中から再生したいグループを選択することになります．

1. はじめに，Matlabを起動しPlayTrain_IPACard.mファイルを実行します．
```
PlayTrain_IPACard
```
2. 以下の画面になったら，再生したいグループの番号を入力してください．
```
========================================
 IPA Card Training
 Author: YamaKatsu (@kyama0321)
 Date: 6 Nov. 2018
========================================
   0. All: No.1 ~ No. 111
   1. Vowels: No.71 ~ No.98 
   2. Consonants (pulmonic): No.1 ~ No.59
   3. Consonants (non-pulmonic): No.60 ~ No.70, No.109 ~ No.111
   4. Other symbols: No.99 ~ No.108
   
   Select training course(s) -> 
```
  2.1 全ての音声を再生したい場合は，
  ```
  Select training course(s) -> 0
  ```
  2.2 特定のグループのみは
  ```
  Select training course(s) -> 1 2 3
  ```
3. 以下の画面になったら，
