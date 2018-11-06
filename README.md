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

デフォルトの設定で使用したい場合は，スクリプト郡を以下の場所に置いてください．
> usr/Desktop/IPACardSet/Code/
その他の場合には，各種スクリプトの "%% Set your environment" 下の部分を変更してください．


## 音声データのダウンロード: DLSnd_IPACard.m

ローカル環境で使用するために，あらかじめ音声データをダウンロードしておきます．
音声データは，全てWikimedia上にアップロードされている二次利用可能な.ogg/.oga形式のファイルとなっております．
本スクリプトでは，「IPAカード取扱説明書」に記載されているクレジット情報をもとに，各カードに対応した音声データをダウンロードします．

1. はじめに，Matlabを起動し以下のDLSnd_IPACard.mファイルを実行します．
> DLSnd_IPACard
1. 以下の画面になったら，Return/Enterキーを押してください．
> Start downloading files? : RETURN/ENTER
1. 音声データのダウンロードが開始します．
> ---Downloarding: IPA Card No.001---
> ...
1. 以下の画面になったら，全てのファイルがダウンロード完了です．

