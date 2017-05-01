<h1 align="center">
  <a href="https://standardjs.com"><img src="https://cdn.rawgit.com/feross/standard/master/sticker.svg" alt="Standard - JavaScript Style Guide" width="200"></a>
  <br>
  JavaScript 标准风格
  <br>
  <br>
</h1>

<p align="center">
  <a href="https://travis-ci.org/feross/standard"><img src="https://img.shields.io/travis/feross/standard/master.svg" alt="travis"></a>
  <a href="https://www.npmjs.com/package/standard"><img src="https://img.shields.io/npm/v/standard.svg" alt="npm version"></a>
  <a href="https://www.npmjs.com/package/eslint-config-standard"><img src="https://img.shields.io/npm/dm/eslint-config-standard.svg" alt="npm downloads"></a>
  <a href="https://standardjs.com"><img src="https://img.shields.io/badge/code_style-standard-brightgreen.svg" alt="Standard - JavaScript Style Guide"></a>
</p>

<h4 align="center">一种风格规范全部代码</h4>

<p align="center">
  翻译：
  <a href="https://standardjs.com/rules-ptbr.html">Português</a>,
  <a href="https://standardjs.com/rules-esla.html">Spanish</a>,
  <a href="https://standardjs.com/rules-zhtw.html">繁體中文</a>,
  <a href="https://standardjs.com/rules-zhcn.html">简体中文</a>
</p>

<br>

## JavaScript 代码规范，包含检查器和自动格式化工具

这个模块在以下方面帮助你（以及他人）节省时间：

- **不用配置。** 以最简单的方式强制项目使用统一的风格，安装即用。
- **自动格式化代码。** 只需运行命令 `standard --fix` 便可以跟杂乱不统一的代码风格说再见。
- **在代码提交前发现代码风格上的错误。** 消除维护者与贡献者之间的来回打转，节省宝贵的代码审查时间。

不需要选择，不需要 `.eslintrc`、`.jshintrc` 或 `.jscsrc`，就可以用。

安装：

```
npm install standard --save-dev
```

## 规则

- 缩进使用两个空格。
- 字符串使用单引号，用双引号只是为了避免转义单引号。
- 无未使用变量。这能帮助发现大量的错误。
- 不使用分号。[这么做][1] [没问题][2]。 [真的][3]！
- 行首不能是 `(`，`[` 或 `` ` ``。
    - 这是省略分号时唯一陷阱——自动为你检查。
    - [详细][4]
- 关键字后面放一个空格。`if (condition) { ... }`
- 函数名字后面放一个空格。`function name (arg) { ... }`
- 始终用 `===`，不要用 `==`。不过可以用 `obj == null` 检测 `null || undefined`。
- 始终处理 node.js 回调的 `err` 参数。
- 始终以 `window` 引用浏览器的全局变量。 `document` 和 `navigator` 除外。
    - 这是为了防止使用浏览器那些命名糟糕的全局变量，比如 `open`, `length`,
    `event` 和 `name`。
- [更多][5]——现在开始试用 `standard`！

[1]: http://blog.izs.me/post/2353458699/an-open-letter-to-javascript-leaders-regarding
[2]: http://inimino.org/~inimino/blog/javascript_semicolons
[3]: https://www.youtube.com/watch?v=gsfbh17Ax9I
[4]: rules.md#分号
[5]: rules.md#javascript-standard-style

为了更好的理解，看看使用 JavaScript Standard Style 写的[示例](https://github.com/feross/bittorrent-dht/blob/master/client.js)，
或者看看使用 `standard` 的[项目](https://github.com/feross/standard-packages/blob/master/all.json)。

## 目录

- 快速上手
  - [安装](#安装)
  - [用法](#用法)
  - [聪明的你会这么做](#聪明的你会这么做)
- FAQ
  - [为什么我要用 JavaScript Standard Style?](#为什么我要用-javascript-standard-style)
  - [谁在用 JavaScript Standard Style？](#谁在用-javascript-standard-style)
  - [有编辑器插件吗？](#有编辑器插件吗)
  - [有 readme 徽章吗？](#有-readme-徽章吗)
  - [我不同意规则 X，你可以修改它吗？](#我不同意规则-x你可以修改它吗)
  - [但是并没有真正的 web 标准！](#但是并没有真正的-web-标准)
  - [有自动格式化工具吗？](#有自动格式化工具吗)
  - [如何忽略文件？](#如何忽略文件)
  - [如何隐藏某个警告？](#如何隐藏某个警告)
  - [我使用的库污染了全局空间，怎么阻止 “variable is not defined” 错误？](#我使用的库污染了全局空间怎么阻止-variable-is-not-defined-错误)
  - [我可以使用实验性质 JavaScript (ES Next) 功能吗？](#我可以使用实验性质-javascript-es-next-功能吗)
  - [我可以使用 JavaScript 变体吗，比如 Flow？](#我可以使用-javascript-变体吗比如-flow)
  - [Mocha, Jasmine, QUnit 等测试框架呢？](#mocha-jasmine-qunit-等测试框架呢)
  - [Web Workers 呢？](#web-workers-呢)
  - [可以检查 Markdown 或 HTML 文件中的代码吗？](#可以检查-markdown-或-html-文件中的代码吗)
  - [有 Git pre-commit 钩子吗？](#有-git-pre-commit-钩子吗)
  - [怎么让输出多彩美观？](#怎么让输出多彩美观)
  - [有 Node.js API 吗？](#有-nodejs-api-吗)
  - [如何为 standard 做出贡献？](#如何为-standard-做出贡献)
- [版权](#版权)

## 安装

使用 JavaScript Standard Style 检查代码，最简单的办法是全局安装它。在终端中运行下面命令：

```bash
$ npm install standard --global
```

或者运行下面命令以本地安装 `standard`：

```bash
$ npm install standard --save-dev
```

运行这些命令需要先安装 [Node.js](http://nodejs.org) 和 [npm](https://npmjs.com)。

## 用法

在安装 `standard` 之后即可使用 `standard` 程序。最简单的用法是检查当前目录下的所有的 JavaScript 文件：

```bash
$ standard
Error: Use JavaScript Standard Style
  lib/torrent.js:950:11: Expected '===' and instead saw '=='.
```

你可以使用 glob 模式传入一个目录或多个目录。注意 glob 模式要用引号包起来，这样它将由 `standard` 而不是 shell 展开：

```bash
$ standard "src/util/**/*.js" "test/**/*.js"
```

**注意：** `standard` 默认以这个模式查找文件：`**/*.js`, `**/*.jsx`。

## 聪明的你会这么做

1. 添加 `standard` 到 `package.json`:

  ```json
  {
    "name": "my-cool-package",
    "devDependencies": {
      "standard": "*"
    },
    "scripts": {
      "test": "standard && node my-tests.js"
    }
  }
  ```

2. 当运行 `npm test` 时自动检查代码风格

  ```bash
  $ npm test
  Error: Use JavaScript Standard Style
    lib/torrent.js:950:11: Expected '===' and instead saw '=='.
  ```

3. 永远不提交修改代码风格的 pr。

## 为什么我要用 JavaScript Standard Style?

JavaScript Standard Style 的美妙之处是简单。没有人想为每个模块/项目维护几百行的风格配置。这太疯狂了！

这个模块在以下方面帮助你（以及他人）节省时间：

- **不用配置。** 以最简单的方式强制项目使用统一的风格，安装即用。
- **自动格式化代码。** 只需运行命令 `standard --fix` 便可以跟杂乱不统一的代码风格说再见。
- **在代码提交前发现代码风格上的错误。** 消除维护者与贡献者之间的来回打转，节省宝贵的代码审查时间。

接受 `standard` 风格意味将代码的清晰与社区的约定放在个人的风格的前面。虽然不是适合于所有的项目及开发文化，但是开源项目可能对新手不大友好。对贡献者设置清晰的、自动化的期望，能让项目更健康。

## 谁在用 JavaScript Standard Style？

许多人！

<table>
<thead>
<tr>
<th><a href="https://www.npmjs.com"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/npm.png"></a></th>
<th><a href="https://github.com"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/github.png"></a></th>
<th><a href="https://opbeat.com"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/opbeat.png"></a></th>
<th><a href="http://www.nearform.com"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/nearform.png"></a></th>
<th><a href="https://www.brave.com"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/brave.png"></a></th>
</tr>
</thead>
<tbody></tbody>
</table>

<table>
<thead>
<tr>
<th><a href="https://zeit.co"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/zeit.png"></a></th>
<th><a href="https://www.zendesk.com"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/zendesk.png"></a></th>
<th><a href="https://www.mongodb.com"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/mongodb.jpg"></a></th>
<th><a href="https://www.typeform.com"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/typeform.jpg"></a></th>
<th><a href="https://gds.blog.gov.uk"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/gov-uk.png"></a></th>
</tr>
</thead>
<tbody></tbody>
</table>

<table>
<thead>
<tr>
<th><a href="http://expressjs.com"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/express.png"></a></th>
<th><a href="https://webtorrent.io"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/webtorrent.png"></a></th>
<th><a href="https://ipfs.io"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/ipfs.png"></a></th>
<th><a href="https://datproject.org"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/dat.png"></a></th>
<th><a href="https://bitcoinjs.org"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/bitcoinjs.png"></a></th>
</tr>
</thead>
<tbody></tbody>
</table>

<table>
<thead>
<tr>
<th><a href="https://atom.io"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/atom.png"></a></th>
<th><a href="http://electron.atom.io"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/electron.png"></a></th>
<th><a href="https://voltra.co"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/voltra.png"></a></th>
<th><a href="https://www.treasuredata.com"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/treasuredata.png"></a></th>
<th><a href="https://clevertech.biz"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/clevertech.png"></a></th>
</tr>
</thead>
<tbody></tbody>
</table>

<table>
<thead>
<tr>
<th><a href="https://www.apstudynotes.org"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/studynotes.jpg"></a></th>
<th><a href="https://www.optiopay.com"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/optiopay.png"></a></th>
<th><a href="https://www.jlrtechincubator.com/jlrti/"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/jaguar-landrover.png"></a></th>
<th><a href="https://www.bustle.com"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/bustle.jpg"></a></th>
<th><a href="https://www.zentrick.com"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/zentrick.png"></a></th>
</tr>
</thead>
<tbody></tbody>
</table>

<table>
<thead>
<tr>
<th><a href="https://nodesource.com"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/nodesource.png"></a></th>
<th><a href="https://greenkeeper.io"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/greenkeeper.png"></a></th>
<th><a href="https://karma-runner.github.io"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/karma.png"></a></th>
<th><a href="https://www.taser.com"><img width="150" src="https://cdn.rawgit.com/feross/standard/master/docs/logos/taser.png"></a></th>
</tr>
</thead>
<tbody></tbody>
</table>

除了公司，使用 `standard` 的社区[数不甚数](https://raw.githubusercontent.com/feross/standard-packages/master/all.json)
，这里无法一一列举。

`standard` 也是 GitHub
[Clean Code Linter](https://github.com/showcases/clean-code-linters) 中星星最多的检查器。

## 有编辑器插件吗？

先安装 `standard` 再安装插件。

### Sublime Text

使用 [Package Control][sublime-1] 安装 [SublimeLinter][sublime-2]、[SublimeLinter-contrib-standard][sublime-3]。

保存文件时自动格式化，安装 [StandardFormat][sublime-4]。

[sublime-1]: https://packagecontrol.io/
[sublime-2]: http://www.sublimelinter.com/en/latest/
[sublime-3]: https://packagecontrol.io/packages/SublimeLinter-contrib-standard
[sublime-4]: https://packagecontrol.io/packages/StandardFormat

### Atom

安装 **[linter-js-standard][atom-1]**。

对于自动格式化，安装 **[standard-formatter][atom-2]**。
对于 snippets，安装 **[standardjs-snippets][atom-3]**。

[atom-1]: https://atom.io/packages/linter-js-standard
[atom-2]: https://atom.io/packages/standard-formatter
[atom-3]: https://atom.io/packages/standardjs-snippets

### Visual Studio Code

安装 **[vscode-standardjs][vscode-1]**（支持自动格式化）。

对于 JS snippets，安装 **[vscode-standardjs-snippets][vscode-2]**。对于 React snippets，安装 **[vscode-react-standard][vscode-3]**.

[vscode-1]: https://marketplace.visualstudio.com/items/chenxsan.vscode-standardjs
[vscode-2]: https://marketplace.visualstudio.com/items?itemName=capaj.vscode-standardjs-snippets
[vscode-3]: https://marketplace.visualstudio.com/items/TimonVS.ReactSnippetsStandard

### Vim

安装 **[ale][vim-1]**。

为了在保存文件时自动格式化，`.vimrc` 添加：

```vim
autocmd bufwritepost *.js silent !standard --fix %
set autoread
```

也可以考虑插件 [neomake][vim-2] 和 [syntastic][vim-3]，它们都支持 `standard`，尽管需要配置。

[vim-1]: https://github.com/w0rp/ale
[vim-2]: https://github.com/neomake/neomake
[vim-3]: https://github.com/vim-syntastic/syntastic

### Emacs

安装 [Flycheck][emacs-1]，然后查看 [manual][emacs-2]，了解如何在项目中启用。

[emacs-1]: http://www.flycheck.org
[emacs-2]: http://www.flycheck.org/en/latest/user/installation.html

### Brackets

在扩展库中搜索 **["Standard Code Style"][brackets-1]**。

[brackets-1]: https://github.com/ishamf/brackets-standard/

### WebStorm (PhpStorm, IntelliJ, RubyMine, JetBrains, etc.)

WebStorm [最近声明](https://blog.jetbrains.com/webstorm/2017/01/webstorm-2017-1-eap-171-2272/)
可以在 IDE 内直接使用 `standard`。

如果你仍然喜欢手工配置 `standard`，参考[这份指南][webstorm-1]。它适用于所有的 JetBrains 产品，包含 PhpStorm, IntelliJ, RubyMine 等。

[webstorm-1]: docs/webstorm.md

## 有 readme 徽章吗？

有！如果你在项目中使用了 `standard`，你可以在 readme 中引用下面某个徽章，好让人们知道你的代码使用了 standard 风格。

[![JavaScript Style Guide](https://cdn.rawgit.com/feross/standard/master/badge.svg)](https://github.com/feross/standard)

```md
[![JavaScript Style Guide](https://cdn.rawgit.com/feross/standard/master/badge.svg)](https://github.com/feross/standard)
```

[![JavaScript Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://standardjs.com)

```md
[![JavaScript Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://standardjs.com)
```

## 我不同意规则 X，你可以修改它吗？

不可以。`standard` 的全部意义是避免为代码风格 [bikeshedding][bikeshedding]（译注：打口水仗）从而为你节省时间。网上为 tabs vs. spaces 等有大量的争辩，永无定论。这些争论只是转移了真正做事的精力，直到一天要结束了你不得不做出选择。这便是 `standard` 的智慧，它是一些明智的“不得不的选择”。希望用户能看到它的价值，而不是为自己的选择争辩。

如果你真的想一个个的配置几百个 ESLint 规则，你可以直接使用 `eslint`，在
[eslint-config-standard](https://github.com/feross/eslint-config-standard) 的基础上修改。

提示：直接用 `standard` 别管那么多。你的时间可以花在真正的问题上！:P

[bikeshedding]: https://www.freebsd.org/doc/en/books/faq/misc.html#bikeshed-painting

## 但是并没有真正的 web 标准！

当然没有！这里的规则不属于哪个 web 标准组织。这就是为什么这个项目叫做 `feross/standard` 而不是 `ECMA/standard`。

单词 "standard" 的意思不只是 "web standard" :-)，比如：

- 这个模块帮助我们的代码达到较高 *standard of quality*。
- 这个模块确保新来者遵守基本的 *style standards*。

## 有自动格式化工具吗？

有！运行 `standard --fix` 可以自动的修订多数的问题。

为了最大的方便，`standard` 内置 `standard --fix`。多数问题能被修订，不过有一些问题，比如在 node.js 回调中没有处理错误，必须手工处理。

为了节省你的时间，`standard` 在检查到能自动修订的问题时输出一条消息 ("Run `standard --fix` to automatically fix some
problems.") 。

## 如何忽略文件？

一些路径 (`node_modules/`, `coverage/`, `vendor/`, `*.min.js`, `bundle.js`, 以 `.` 开始的文件或目录，比如 `.git/`) 自动被忽略。

项目根目录下的 `.gitignore` 文件也自动被忽略。

有时你需要忽略其它的目录或文件，可以这样做，`package.json` 添加 `standard.ignore`:

```json
"standard": {
  "ignore": [
    "**/out/",
    "/lib/select2/",
    "/lib/ckeditor/",
    "tmp.js"
  ]
}
```

## 如何隐藏某个警告？

你很少需要为了打破规则而隐藏 `standard` 的警告。

JavaScript Standard Style 内部使用 [`eslint`](http://eslint.org/)，你可以像使用 ESLint 那样隐藏警告。

为了得到详细的输出——这样你可以找到要忽略的规则的名字，运行：

```bash
$ standard --verbose
Error: Use JavaScript Standard Style
  routes/error.js:20:36: 'file' was used before it was defined. (no-use-before-define)
```

某一行禁用所有的规则：

```js
file = '我知道我在做什么' // eslint-disable-line
```

或者，只禁用 `"no-use-before-define"`：

```js
file = '我知道我在做什么' // eslint-disable-line no-use-before-define
```

或者，多行禁用 `"no-use-before-define"`：

```js
/* eslint-disable no-use-before-define */
console.log('offending code goes here...')
console.log('offending code goes here...')
console.log('offending code goes here...')
/* eslint-enable no-use-before-define */
```

## 我使用的库污染了全局空间，怎么阻止 "variable is not defined" 错误？

一些包（比如 `mocha`）将它们的函数（比如 `describe`, `it`）放到
global object 上（不好的做法）。因为你的代码没有定义或者 `require` 这些函数，`standard` 将警告你使用了未定义的变量（通常，这个规则对发现拼写错误非常有用）。但是我们要为这些全局变量禁用此规则。

为了让 `standard`（包括阅读你的代码的人类）知道代码中某些变量是全局变量，在文件顶部添加：

```js
/* global myVar1, myVar2 */
```

如果你有几百个文件，为每个文件都添加上面注释会比较烦人。这时运行：

```bash
$ standard --global myVar1 --global myVar2
```

或者 `package.json` 添加：

```json
{
  "standard": {
    "globals": [ "myVar1", "myVar2" ]
  }
}
```

*注意：`global` 和 `globals` 是一样的。*

## 我可以使用实验性质 JavaScript (ES Next) 功能吗？

`standard` 支持最新的 ECMAScript 功能，ES8 (ES2017)，包括出于 "Stage 4" 的提案。

为了支持实验性功能，`standard` 支持指定自定义解析器。在使用自定义解析器之前，考虑一下由此增加复杂度是否值得。

为了使用自定义解析器，使用 npm 安装它（比如 `npm install babel-eslint`），然后运行：

```bash
$ standard --parser babel-eslint
```

或者 `package.json` 添加：

```json
{
  "standard": {
    "parser": "babel-eslint"
  }
}
```

如果 `standard` 是全局安装（比如 `npm install standard --global`），`babel-eslint` 已应当全局安装 `npm install babel-eslint --global`。

## 我可以使用 JavaScript 变体吗，比如 Flow？

在使用 JavaScript 变体前，考虑一下由此增加构建复杂度（以及影响新的贡献者上手速度）是否值得。

`standard` 支持 ESLint 插件。使用某个插件，在 `standard` 检查代码之前，将你的代码转为合法的 JavaScript 的代码。为了使用自定义解析器，使用 npm 安装它，然后运行：

```bash
$ standard --plugin PLUGIN_NAME
```

或者 `package.json` 添加：

```json
{
  "standard": {
    "plugins": [ "PLUGIN_NAME" ]
  }
}
```

为了使用 Flow, 需要使用 `babel-eslint` 作为解析器。运行 `npm install eslint-plugin-flowtype babel-eslint`，再运行：

```bash
$ standard --plugin flowtype --parser babel-eslint
```

或者 `package.json` 添加：

```json
{
  "standard": {
    "plugins": [ "flowtype" ],
    "parser": "babel-eslint"
  }
}
```

如果 `standard` 是全局安装（比如 `npm install standard --global`），`eslint-plugin-flowtype` 已应当全局安装 `npm install eslint-plugin-flowtype --global`。

*注意：`plugin` 和 `plugins` 是一样的。*

## Mocha, Jasmine, QUnit 等测试框架呢？

想让你的测试文件支持 mocha，在测试文件的开头加上：

```js
/* eslint-env mocha */
```

或者运行：

```bash
$ standard --env mocha
```

这里 `mocha` 可以是 `jasmine`, `qunit`, `phantomjs` 等等。
全部列表见 ESLint 的文档：[指定环境](http://eslint.org/docs/user-guide/configuring.html#specifying-environments)。
这些环境所有的全局变量见 [globals](https://github.com/sindresorhus/globals/blob/master/globals.json)。

*注意：`env` 和 `envs` 是一样的。*

## Web Workers 呢？

在文件的顶部加上：

```js
/* eslint-env serviceworker */
```

这行代码让 `standard`（包含阅读你的代码的人类）知道 `self` 是 web worker 中的一个全局变量。

## 可以检查 Markdown 或 HTML 文件中的代码吗？

想检查 Markdown 文件中的代码，可以使用 [`standard-markdown`](https://www.npmjs.com/package/standard-markdown)。

另外，有 ESLint 插件可以检查 Markdown、 HTML以及其它语言文件中的代码。

想检查 Markdown 文件中的代码，使用 ESLint 插件：

```bash
$ npm install eslint-plugin-markdown
```

然后检查代码块内的 JS 代码，运行：

```bash
$ standard --plugin markdown '**/*.md'
```

想检查 HTML 文件中的代码，使用 ESLint 插件：

```bash
$ npm install eslint-plugin-html
```

然后检查 `<script>` 标签内的 JS 代码，运行：

```bash
$ standard --plugin html '**/*.html'
```

## 有 Git `pre-commit` 钩子吗？

你这个问题真好笑！

```bash
#!/bin/sh
# 确认所有的 JavaScript 文件通过 standard
git diff --name-only --cached --relative | grep '\.jsx\?$' | xargs standard
if [ $? -ne 0 ]; then exit 1; fi
```

## 怎么让输出多彩美观？

默认输出简单明了，如果你喜欢亮丽的东西，安装 [snazzy](https://github.com/feross/snazzy):

```bash
$ npm install snazzy
```

然后运行：

```bash
$ standard --verbose | snazzy
```

也可以使用 [standard-tap](https://www.npmjs.com/package/standard-tap),
[standard-json](https://www.npmjs.com/package/standard-json) 和
[standard-reporter](https://www.npmjs.com/package/standard-reporter)。

## 有 Node.js API 吗？

有！

### `standard.lintText(text, [opts], callback)`

检查代码 `text`。 `opts`：

```js
{
  cwd: '',      // 当前工作目录 (默认值: process.cwd())
  filename: '', // 待检查的文件 (可选，尽管有些 eslint 插件需要)
  fix: false,   // 自动修订
  globals: [],  // 全局变量
  plugins: [],  // eslint 插件
  envs: [],     // eslint 环境
  parser: ''    // js 解析器 (e.g. babel-eslint)
}
```

其它选项可以从当前工作目录下 `package.json` 加载。

`callback` 参数为 `Error` 和 `results` 对象。

`results`：

```js
var results = {
  results: [
    {
      filePath: '',
      messages: [
        { ruleId: '', message: '', line: 0, column: 0 }
      ],
      errorCount: 0,
      warningCount: 0,
      output: '' // 修订后的代码（需要指定 {fix: true} 选项）
    }
  ],
  errorCount: 0,
  warningCount: 0
}
```

### `results = standard.lintTextSync(text, [opts])`

`standard.lintText()` 同步版本。如果出现错误将抛出异常，否则返回 `results` 对象。

### `standard.lintFiles(files, [opts], callback)`

检查文件 `files` globs, `opts` 可选：

```js
var opts = {
  ignore: [],   // 待忽略的文件 globs，默认值已经够用
  cwd: '',      // 当前工作目录 (默认值： process.cwd())
  fix: false,   // 自动修订
  globals: [],  // 全局变量
  plugins: [],  // eslint 插件
  envs: [],     // eslint 环境
  parser: ''    // js 解析器 (e.g. babel-eslint)
}
```

`callback` 参数为 `Error` 和 `results` 对象（同上）。

## 如何为 `standard` 做出贡献？

欢迎！查看 [issues](https://github.com/feross/standard/issues) 或 [PRs](https://github.com/feross/standard/pulls)，如果没有找到你想要的就提交一个。

想群聊？在 freenode 加入 `#standard` 频道。

下面是 `standard` 生态系统中一些重要的包：

- **[standard](https://github.com/feross/standard)** - 本项目
  - **[standard-engine](https://github.com/flet/standard-engine)** - 命令行引擎
  - **[eslint-config-standard](https://github.com/feross/eslint-config-standard)** - standard 使用的 eslint 规则
  - **[eslint-config-standard-jsx](https://github.com/feross/eslint-config-standard-jsx)** - standard (JSX) 使用的 eslint 规则
  - **[eslint-plugin-standard](https://github.com/xjamundx/eslint-plugin-standard)** - standard 自定义的 eslint 规则，不是 eslint 的核心
  - **[eslint](https://github.com/eslint/eslint)** - standard 使用的验证器
- **[snazzy](https://github.com/feross/snazzy)** - 漂亮的输出
- **[standard-www](https://github.com/feross/standard-www)** - http://standardjs.com 源码
- **[semistandard](https://github.com/Flet/semistandard)** - 有分号的 standard，如果你必须用分号的话

还有许多 **[编辑器插件](https://github.com/feross/standard#text-editor-plugins)**，
**[使用 `standard` 的包](https://github.com/feross/standard-packages)**，
以及 **[`standard` 生态系统中的包](https://github.com/feross/awesome-standard)**。

## 版权

[MIT](LICENSE). Copyright (c) [Feross Aboukhadijeh](http://feross.org).

由 [Ivan Yan](http://yanxyz.net) 翻译，译文采用<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">知识共享署名-非商业性使用-相同方式共享 4.0 国际许可协议</a>，意见[反馈](https://github.com/hongfanqie/standardjs)。
