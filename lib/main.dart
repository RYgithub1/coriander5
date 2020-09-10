import 'dart:ui';

import 'package:coriander5/main_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}



//  ------ 【レス】状態変わらない -> フル使うか、モデルを活用 ーーーーーーーー
class MyApp extends StatelessWidget {
  // final変数は1回しか設定できず、アクセス時に初期化
  // クラスレベルで定数が必要な場合は、静的const
  final String nameText = "スアレスです";
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Future<Widget> build(BuildContext context) async {

    await Firebase.initializeApp();

    return MaterialApp(
      title: 'html名Webサイト名みたいなもの',
      home: ChangeNotifierProvider<MainModel>(  // MainModelがビューの概念
        // createがあれば、画面が作られた時に、画面をイニシャライズする、mainmModelとセット
        create: (_) => MainModel(),

        child: Scaffold(
          appBar: AppBar(
            title: Text("バルセロナ"),
          ),
          // ChangeNotifierProviderで大枠、中にscaffold、中にconsumer
          // consumerは、レスであっても、変数更新時に通知が走り変数変更を反映できる
          body: Consumer<MainModel>(
            // childでなくbuilderを選択したのは、returnしたいから
            builder: (context, model, child) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      // modelにMainModelの中身が仮引数ゆえ入る ->main_model.dartを参照する
                      model.nameText,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    RaisedButton(
                      child: Text("ボタンここ"),
                      onPressed: () {
                        // TODO:
                        model.changeNameText();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
