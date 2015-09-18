# github
githubは本当に素晴らしいです。
githubとpull requestを使った開発方法を是非とも学ぶべきです。

pull requestの使い方は
* [Github で初めての pull - request (プルリクエスト)](http://kakakikikeke.blogspot.jp/2015/03/github-pull-request.html)

などを参考にしてください

## 空のプルリクエストを作る
時々、議論をしたい、テストのみを走らせたいなどの理由で特に具体的な変更がないプリクエストを
作りたい時があります。
そのときは
```
git commit --allow-empty
```
で空コミットをを作ると空プルリクエストを作ることができます。


## 後でプルリクエストに変更を追加する
プリクエストを出したあとに、更に何かを変更したくなったり、他の人からa変更を促されたりしmす。
このとき、プルリクエストの内容を更新するには、新たなプルリクエストを作る必要はありません。
そのプルリクエストを作ったブランチへ追加のコミットをしましょう。

```
git add new-file
git commit -m "modified new-file because of some advice"
git push your-remote pr-branch
```

このような変更は他の人に通知されないので、変更をしたら変更したことをそのプルリクエスト
にコメントしておきましょう。
