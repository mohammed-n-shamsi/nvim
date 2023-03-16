

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
<g - k> :- Hover
<g - d> :- Get definition (trouble toggle)
<g - y> :- Get Type def (trouble toggle)

### Errors
<Space - x - x> :- Launch trouble toggle, NOTE: 'K' will launch pop-ups to see full text
<Space - x - w> :- Launch workplace diagnostics
<Space - x - d> :- Launch doc wide diagnostics
<Space - x - q> :- Quick fix
<Space - x - l> :- Loc List

