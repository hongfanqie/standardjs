# JavaScript 标准风格

[原文](http://standardjs.com/)
[译文](http://hongfanqie.github.io/standardjs)

## 更新翻译

分支

- `en` 分支是原文
- `master` 分支是译文

先更新原文，再合并到译文，然后更新译文。

```bash
git checkout en
sh ./get.sh
git commit -am "update original"

git checkout master
git merge en
git mergetool
git commit -m 'update translation'
git push
```

[本地预览](https://help.github.com/articles/setting-up-your-pages-site-locally-with-jekyll/)。

`index.md` 文件，如果修改了相关标题，同时要更新 TOC。如何查看更新后的标题 id 呢？在 Chrome 中打开本地预览网站首页，在 devtools 中运行：

```js
Array.from(document.querySelectorAll('.markdown-body > h2'))
.map(h2 => `  - [${h2.textContent}](#${h2.id})`)
.join('\n')
```

## 版权

原文 [MIT](https://standardjs.com/LICENSE) Copyright (c) [Feross Aboukhadijeh](http://feross.org).

由 [Ivan Yan](http://yanxyz.net) 翻译，译文采用<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">知识共享署名-非商业性使用-相同方式共享 4.0 国际许可协议</a>。
