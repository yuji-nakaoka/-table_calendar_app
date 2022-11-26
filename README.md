# calendar_app　

オーソドックスな予定の追加、削除ができるカレンダーアプリ

それを、riverpod+freezedで状態管理をして作りました。

## package

freezed...Modelを作る際にcopyWith,jsonなど生成してくれて便利なため

riverpod...予定、カレンダーの日付など様々なstateを状態管理をするのに使用

intl...DateTimeをパースする為に使用

table_calendar...カレンダーを作る際に使ったことがなかった為使用

shared_preferences...データを保存するのにどういったものか気になっていた為使用

## noticed
・riverpodのAsyncValueや、StateNotifierProvider.family、overridesなどを使い管理したので、riverpodの色々な方法について気づくことができました。

・table_calendarを初めて使いましたが、カレンダーの管理は簡単に実装可能でよかったが、ヘッダーをこだわりカスタムしたい場合には向かない気がしました。

・shared_preferencesが気になっていたので、初めて使ってみたのですが、簡単なデータの保持をする分には使いやすそうだが、Mapデータの保存（今回は無理やりSTringに変更して保存）同じkeyでの複数のデータの保存、削除、保存データの編集が向かないなど、良いところと苦手なところがわかりました。（今回のような場合にはあまり向いていない）

・DateTimeの色々な変換等を知ることができた

・Stack、Opacity、ModalBarrierを使った自作ポップアップの作成

![B0C4A01A-D3A0-4983-83B5-C5C0C23AEB44_4_5005_c](https://user-images.githubusercontent.com/100943830/204094183-f8725830-aa55-4762-8e14-bd8c8841116a.jpeg)

・CupertinoDatePickerを使ったドラムロールの実装

![EC44858B-5C05-47D0-B0AE-0F296B6953FA_4_5005_c](https://user-images.githubusercontent.com/100943830/204094288-267a1bdf-65c6-42ae-8edb-1b3d41d150c1.jpeg)

## Ability

・riverpodでの状態管理方法の知識が広くなり、使いかたのバリエーションが増加

・データのfetchやjson.encode、json.decodeなどは問題なく可能

・uiのバリエーション知識が広がりました

