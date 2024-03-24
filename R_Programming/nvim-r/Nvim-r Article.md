https://www.freecodecamp.org/news/turning-vim-into-an-r-ide-cd9602e8c217/ 
commands taken from this article

#### Sending Lines

The most immediate need is to be able to send lines of code. There are a variety of ways to do so in Nvim-R:

- Send :: Entire File `\aa`
- Send :: Entire Block `\bb`
- Send :: Entire Function `\ff`
- Send :: Entire Selection `\ss`
- Send :: Entire Line `\l`

As you can begin to see the forward slash `\` is the leader for many operations. However, most of these, and the minor distinctions between them, are superfluous. You will likely be better served by remapping a few of them.

#### Object Browser

First up, the object browser. This feature, solicited by typing `\ro` will allow you to see what variables and libraries are active in your current environment.

Objects can also be viewed by typing `\rl`, which will run the `ls()` function in your current console.

#### Documentation

In order to get a better understanding of your code you have a couple options. From within Nvim-R there are two of particular note `\rh` — help and `\re` — example. Each of these will open in a split buffer with the relevant information.

Another worthwhile option is the [Dash plugin](https://github.com/rizzatti/dash.vim). The easiest path to usage is as follows:

```
“ install plugin :: using vim-plugPlug ‘rizzatti/dash.vim’
```

```
“ remap search keynmap <silent> <leader>d <Plug>DashSearch<CR>
```

Now, when you are seeking more information on a piece of R code, or any other language, all you have to do is place your key over the word and hit `<leade`r>d. The Dash app will then pop up with the relevant information. You can also search Google and Stack Overflow from within it. It’s a great tool, especially for Vimmers who utilize Vim for a variety of languages.

#### Viewing Data

Next up is getting a quick peak at your data. RStudio comes with a beautiful built in data viewer, which can be handy for getting a sense of the data. In Vim, it’s a little harder, but not impossible.

Nvim-R allows you to view a data frame by using the `\rv` command. This will either show the data frame using X Quartz, on Mac, or the [CSV plugin](https://github.com/chrisbra/csv.vim) for Vim, if you have it installed.

The CSV plugin comes with a whole host of additional features for manipulating data, but that is outside of the scope of this article. By and large, my suggestion would be to use Excel. While overly beloved by many, it does serve as a good data viewer.

#### Inline Code Output

If you have a line of code and hit `\o` you’ll see the output rendered as comments in your current file.

#### Functions

Instead of doing the basic flow of `str()` + `plot()`, etc…Nvim-R allows for a simplified flow.

- summary() :: `\rs`
- plot() :: `\rg`
- args() :: `\ra`
- setwd() :: `\rd`
- print() :: `\rp`
- names() :: `\rn`

#### Arrows

Arrows can be a pain to type. Luckily, Nvim-R makes it easier by mapping `_` to `&l`t;-. This may, or may not, completely bewilder you. If you’re someone who prefers snake case, then you’ll have to hit the underscore twice in order to get an actual underscore, and not an arrow. However, you can override this setting. I find it useful, and have adjusted, but can certainly understand others being irked.

### Completion

Often I see lack of code completion as a major reason people skip Vim. This notion is incorrect though. Code completion is very much apart of Vim. For our specific purpose, namely completion for R, there are, yet again, a few options.

#### Nvim-R Completion

Nvim-R supports code completion out of the box. You will have to manually engage it by using `<C-X>`;<C-O> for an obje`ct name, o`r <C-X><C-A> for a function argument. For some people this workflow is ideal, but in the current age of VS Code’s Intellisense, and other such options, this feels clunky.

#### Ncm-R

[Ncm-R](https://github.com/gaalcaras/ncm-R) is your best bet for as-you-type sort of completions. It’s a fairly new package, but a much welcomed addition. It integrates with Nvim-R to provide asynchronous completions for R via [nvim-completion-manager](https://github.com/roxma/nvim-completion-manager).

![nWIAYtf-zxwmjx7tXAJddKOyH1cIbjREXj1s](https://cdn-media-1.freecodecamp.org/images/nWIAYtf-zxwmjx7tXAJddKOyH1cIbjREXj1s)

Ncm-R provides rich completions for all of the following:

- Objects from the global R environment
- Functions from all loaded packages
- Packages inside `library()` and `require()`
- Datasets inside `data()`
- Arguments inside functions
- Variables inside pipes `%&g`t;% and ggplo`t`s +

For a basic set up add the code below to your Vim configuration file.

```
Plug ‘roxma/nvim-completion-manager’Plug ‘gaalcaras/ncm-R’
```

```
“ Optional: for snippet supportPlug ‘sirver/UltiSnips’
```

#### R Language Server

If you are unfamiliar with what a language server is head [here](https://github.com/Microsoft/language-server-protocol). If you are familiar, then [this project](https://github.com/REditorSupport/languageserver) may be of interest. It is still in the early days, and largely experimental, but does work and currently supports both code completion and linting.

### Linting

Last but not least, linting. The set up for quality linting is fairly straightforward. You’ll want to use [ALE](https://github.com/w0rp/ale), Asynchronous Lint Engine, as your driver. You can set this up in your .vimrc as follows:

```
Plug ‘w0rp/ale’
```

Now all you need to do is install [lintr](https://github.com/jimhester/lintr). This can be done by using `install.packages(‘lintr’)`.

Now, the next time you open up an .R file you should be good to go.

### Conclusion

At this point, you have a killer set up for R in Vim. There is certainly more to do though if you’re curious. Areas for further exploration include looking through all of the documentation in the plugins I have linked throughout this article. You’ll find many helpful tips and tricks in there, as well as useful settings. I hope this helped to get you up and running with R in Vim!

[**_For more about Vim head to my blog!_**](https://kadekillary.work/)

### Bonus Section

While I know I said you should explore on your own. It doesn't’ hurt to provide some additional settings that can make your life easier.

```
“ settings :: Nvim-R plugin
```

```
“ R output is highlighted with current colorschemelet g:rout_follow_colorscheme = 1
```

```
“ R commands in R output are highlightedlet g:Rout_more_colors = 1
```