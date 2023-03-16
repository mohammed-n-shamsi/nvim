# Custom Plugin Mappings

## Buffer (Neovim tabs) Mappings
<Space - ,> :- Move to a tab to the left
<Space - .> :- Move to a tab to the right
<Space - <> :- Move a tab to the left
<Space - >> :- Move a tab to the right
<Space - [NUM]> :- Move to a tab designated under [NUM] (0 is last)
<Space - p> :- Pin the tab
<Space - w> :- Close tab
<Space - b - [b/d/l/w] > :- Sort buffer by [buffer number / directory / language / window number]


## NeoVim General Mappings
<Ctrl - s> :- Save 

## Traversal Mappings

### General Navigating
<Ctrl - p> :- Find files
<Shift - p> :- Grep files
<Ctrl - b> :- Search buffers
<Ctrl - h> :- Search tags

### Code Navigating
<g - p> :- Peek definition
<g - o> :- Outline
<g - r> :- References (finder)
<g - k> :- Hover (Rust only)
<K> :- Hover (everything else)
<g - d> :- Goto definition (trouble toggle)
<g - D> :- Goto Declaration
<g - y> :- Goto Type def (trouble toggle)
<g - i> :- Goto implementation
<Ctrl - k> :- Fn Signature help

### Errors
<Space - x - x> :- Launch trouble toggle, NOTE: 'K' will launch pop-ups to see full text
<Space - x - w> :- Launch workplace diagnostics
<Space - x - d> :- Launch doc wide diagnostics
<Space - x - q> :- Quick fix
<Space - x - l> :- Loc List

## Actions

### Commands
<Shift - f> :- Format

### Comments
<g - c - c> :- Comment toggle line
<g - b - c> :- Comment toggle block 
<g - c - 0> :- Comment toggle line above
<g - c - o> :- Comment toggle line below
<g - c - A> :- Comment at end of line

#### Visual mode
<g - c> :- comment line style
<g - b> :- comment block style

# Standard Vim Mappings

## Traversal Mappings
<Ctrl - o> :- go back
<Ctrl - i> :- go forwards
<g - g> :- go top doc
<G> :- go bottom doc
