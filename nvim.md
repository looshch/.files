# Key Mappings for Neovim Config

- [Normal Mode](#normal-mode)
  - [Motions](#motions)
    - [Text Objects](#text-objects)
  - [Scrolling](#scrolling)
  - [Actions](#actions)
    - [Non-Double-Callable](#non-double-callable)
  - [Changes History](#changes-history)
  - [Macroses](#macroses)
  - [Search](#search)
    - [Window](#window)
    - [Global](#global)
  - [Windows](#windows)
  - [Tabs](#tabs)
  - [File Browser](#file-browser)
  - [Code Interactions](#code-interactions)
  - [Wrappers](#wrappers)
    - [Git](#git)
    - [Terminal](#terminal)
- [Insert Mode](#insert-mode)
- [Visual Mode](#visual-mode)
- [Command Mode](#command-mode)

### Legend

- Mnemonics are in [square brackets] (usually the [f]irst letter only);

- condensed notation expands by the following rules:
  - a slash-separated part produces a distinct sentence with the corresponding
    mapping, e.g.:\
    `N` `w`/`W` — `N` words/WORDS forward;\
    `N` `w` — `N` words forward;\
    `N` `W` — `N` WORDS forward.
  - a slash-separated part consisting of several or no words is enclosed in 2
    slashes, e.g.:\
    `ZZ`/`ZQ` — quit /and write (save)/without writing/;\
    `ZZ` — quit and write (save);\
    `ZQ` — quit without writing.\
    And\
    `N` `;`/`,` — repeat the last `f`, `F`, `t`, `T` `N` times //in the opposite
    direction/;\
    `N` `;` — repeat the last `f`, `F`, `t`, `T` `N` times;\
    `N` `,` — repeat the last `f`, `F`, `t`, `T` `N` times in the opposite
    direction.

## Non-Normal Mode

- `<c-[>` — go to normal mode.

## Normal Mode

`N` is optional.

- `v`/`V`/`<c-v>` — enter [v]isual //lines/block mode;

- `:` — enter command mode;

- `N` `J` — [j]oin `N` lines;

- `ZZ`/`ZQ` — quit /and write (save)/without writing/;

- `q:` — open editable command history;

- `g<c-g>` — [g]et the position of cursor in terms of word, character and byte
  counts;

- `gv` — select the previous [v]isual selection;

- `yp` — [y]ank [p]ath;

- `gf` — [g]o to the currently open file location in [F]inder;

- `S` — [s]ynchronize plugins.

### Motions

- `N` `h`/`j`/`k`/`l` — `N` characters left/down/up/right. `h` and `l` move
  cursor to [the corresponding sides,] `j` [has the descender, so it
  moves cursor down, and] `k` [has the ascender, so it moves cursor up];

- `N` `w`/`W` — `N` [w]ords/[W]ORDS forward;

- `N` `e`/`E` — forward to the [e]nd of word/WORD `N`;

- `N` `b`/`B` — `N` words/WORDS [b]ackward;

- `N` `ge`/`gE` — backward to the [e]nd of word/WORD `N`;

- `N` `G`/`gg` — go to the `N`th/first line;

- `N` `H`/`M`/`L` — go to the `N`th line from the highest/middle/lowest one;

- `0`/`^` — to the first //non-blank character on the line [regex];

- `N` `|` — go to the `N`th column [vertical];

- `$` — to the last character on the line [regex];

- `%` — to the matching [, (, {;

- `N` `f`/`F` `char` — [f]ind the `N`th occurrence of `char` to the right/left;

- `N` `t`/`T` `char` — [t]ill the `N`th occurrence of `char` to the right/left;

- `N` `;`/`,` — repeat the last `f`, `F`, `t`, `T` `N` times //in the opposite
  direction/;

- `N` `}`/`{` — `N` paragraphs forward/backward.

#### Text Objects

`a`/`i` `restrictedMotion` — [a]round/[i]nside `restrictedMotion`, where
`restrictedMotion` is:

- `w`ord or `W`ORD;
- a `p`aragraph;
- contents inside:
  - a pair of `'`, `"`, `` ` ``, `[`, `(`, `{`, `<`;
  - a `t`ag.

### Scrolling

- `N` `<c-u>`/`<c-d>` — scroll `N` lines [u]p/[d]own;

- `N` `<c-f>`/`<c-b>` — scroll `N` screens [f]orward/[b]ackward;

- `N` `<c-o>`/`<tab>` — go to the `N`th [o]lder/newer position in jump list.

### Actions

#### Double Callable

If the actions are called twice, they operate on a line. Their uppercase
counterparts operate from cursor to the end of the line.

- `N` `d` `motion` — copy and [d]elete `N` `motion`s;

- `N` `c` `motion` — copy and [d]elete `N` `motion`s and start inserting;

- `N` `y` `motion` — [y]ank (copy) `N` `motion`s;

- `N` `<`/`>` `motion` — indent/unindent `N` `motion`s;

- `N` `=` `motion` — auto-indent `N` `motion`s;

- `N` `g~` `motion` — [g]et toggled cases for `N` `motion`s;

- `N` `gu`/`gU` `motion` — [g]et `N` `motion`s uppercased/lowercased;

- `gq` `motion` — wrap lines in `motion` on `textwidth`th char preserving
  indentation;

- `surrounding`s: `'`, `"`, `` ` ``, `[`, `(`, `{`, `<`\
  `y`/`c`/`d` `s` `motion` `surrounding` — add/[c]hange/[d]elete `surrounding`
  of `motion`. If you change `surrounding`, you need to specify both the old and
  the new ones, like `c` `s` `motion` `surrounding` `surrounding`.

#### Non-Double-Callable

- `N` `~` — toggle cases for `N` characters;

- `N` `zf` `motion` — define a `f`old for `N` `motion`s;

- `N` `za` — toggle `N` folds;

- `N` `zt`/`zz`/`zb` — put `N`th line on the [t]op/middle/[b]ottom of the
  screen;

- `N` `i`/`I` — [i]nsert before cursor/the first character on the line/ `N`
  times;

- `N` `a`/`A` — insert [a]fter cursor/the last character on the line/ `N` times;

- `N` `o`/`O` — [o]pen a line after/before the current one `N` times;

- `N` `r`/`R` — [r]eplace /the character under cursor/characters till `<c-[>`/
  `N` times;

- `N` `x`/`X` — delete `N` characters after/before cursor;

- `N` `p`/`P` — [p]aste after/before cursor `N` times;

- `N` `<c-a>`/`<c-x>` — [a]dd/subtract `N` to the number at or after cursor;

- `v` or `V` or `<c-v>` `g<c-a>`/`g<c-s>` — [g]et an ascending/descending number
  sequence;

- `<c-c>` `motion` — [c]omment `motion` out;

- `s` — start [s]earch which narrows matches pool on every key press where a key
  corresponds to a dynamic label, and jump as soon as a match isn’t ambiguous.

### Changes History

- `.` — repeat the last change;

- `u`/`U` — [u]ndo/redo;

- `;h` — undo [h]istory.

### Macroses

- `q` `letterOrN` — record a macro at `letterOrN`;

- `@` `letterOrN` — play the macro [at] `letterOrN`;

- `Q` — play the macro at [`q`].

### Search

#### Window

- - `/`/`?` — search/clear search/ [regex];
  - `*` — search for the word under cursor [regex].

  `n`/`N` — the [n]ext/previous search result;

- `q/` — search [q]ueries history.

#### Global

- - `gc` `content` — [g]o to the file with [`c`]`ontent`;
  - `gn` `name` — [g]o to the file with [`n`]`ame`.

  `<c-v>`/`<c-s>`/`<c-t>` — open file in a /[v]ertical split/horizontal
  [s]plit/new [t]ab/;\
  `<tab>` — select files to open;\
  `<m-q>` — send selected files to [q]uickfix list.

### Windows

- `;m` — [m]ove;

- `<c-h>`/`<c-j>`/`<c-k>`/`<c-l>` — switch to the one on the
  left/bottom/top/right of the current one;

- `)`/`(` — increase/decrease width;

- `+`/`_` — [increase]/decrease height;

- `<c-w>=` — [equalize] all heights and widths;

- `<c-w>_` — maximize height.

### Tabs

- `<space><space>` — search through names;

- `<space-l>`/`<space-h>`/`<space-N>` — switch to the next/previous/`N`th where
  0 < `N` < 10;

- `<space-d>` — [d]uplicate;

- `<space-c>`/`<space-r>` — [c]lose //all to the [r]ight/;

- `<space-k>`/`<space-j>` — move the current one to the right/left.

### File Browser

- `gl` — [g]o to the currently open file [l]ocation in browser;

- in browser:
  - `<c-p>` — [p]review;
  - `<cr>` — open;
  - `-` — open the parent folder;
  - `<c-v>`/`<c-t>` — open in a /[v]ertical split/new [t]ab/;
  - `g.` — [g]et hidden files [start with ‘.’]

### Code Interactions

- `K` — show the help;

- `gr` — [g]o to the [r]eferences;

- `gd` — [g]o to the [d]efinition;

- `gD` — [g]o to the type [d]efinition;

- `;p` — open the code [p]roblems;

- `;a` — open the code [a]ctions;

- `;u` — toggle ‘declared and not [u]sed’ errors in Go;

- `;f` — [f]ormat the file;

- `;r` — [r]ename.

### Wrappers

#### Git

- in blame and log modes:

  - `o`/`O` — open a diff in a /horizontal split/new tab/.

- in blame mode:

  - `-` — blame at commit under cursor.

- in merge mode:
  - `N` `do` — [o]btain the [d]iff from `N` buffer;
  - `N` `dp` — [p]ut the [d]iff to `N` buffer.

#### Terminal

- `<c-\>` — toggle terminal.

## Insert Mode

- `<m>` — go to normal mode while the key is pressed;

- `<c-h>` — backspace;

- `<c-l>` — move cursor one symbol [right];

- `<c-w>` — delete [w]ord backward;

- `<c-u>` — delete ([u]ndo) everything till cursor;

- `<c-n>` — omnifunction completion;

  - `<c-n>`/`<c-p>` — the [n]ext/[p]revious completion entry.

- `<c-r>` `register` — paste contents of the [`r`]`egister`, e.g. `=`
  `expression` to insert math expression. To get a floating-point result, add
  `.0` to one of the numbers. In expression mode yanked text is accessible via
  `"` register;

- `<c-o>` — do [o]ne action in normal mode.

## Visual Mode

- `o` — move cursor to the [o]pposite side of the selection;

- `:` `command` — execute `command` over the range of lines, e.g. `norm @`
  `letterOrN` to execute a macros;

- `s` — same as in Normal Mode — Actions —
  [Non-Double-Callable](#non-double-callable).

## Command Mode

- `w` `a` `!` — [w]rite (save) the file. `a` saves all files, `!` saves changes
  in readonly;

- `q` `a` `!` — [q]uit a window. `a` quits all windows, `!` quits without
  saving;

- `wq` or `x` `a` `!` — save a file and quit. `a` saves and quits all files, `!`
  saves changes in readonlies;

- `%s/what/for/` `g` `c` — replace the first occurrences on each line of `what`
  with `for`. `g` (global) replaces all occurrences, `c` enables confirmation
  dialog;

- `cdo` `command` — execute `command` over quickfix list entries;

- `G` `git-command` — Git integration.
