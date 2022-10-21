local ls = require "luasnip"
local utils = require "luasnip-config.utils"
-- sets the jump/expansion key
vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true }
)

-- Sets the jump backwards key
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true }
)

-- Keymap for cycling through a list of options
vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)


-- Snippets

-- Shortcuts
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node

-- Functions

-- Returns the node with index idx
function rep(idx)
  return f(function(arg)
    return arg[1]
  end, { idx }
  )
end

-- Converts the arguments to a list
function args_to_list(args)
  local parts = vim.split(args[1][1], ",", true)
  for i, arg in ipairs(parts) do
    parts[i] = "  " .. arg
  end
  return parts or ""
end


-- Snippets for all filetypes
ls.add_snippets("all", {
  s({
    trig = "dt",
    name = "Date",
    dscr = "Insert the current date",
  }, {
    f(function()
      return os.date "%D"
    end)
  }),
  s({
    trig = "dtt",
    name = "Date and Time",
    dscr = "Insert the current date and time",
  }, {
    f(function()
      return os.date "%D - %H:%M"
    end)
  }),
})

-- Snippets for python
ls.add_snippets("python", {
  s({
    trig = "fn",
    name = "Function Definition",
    dscr = "Define a function",
  }, {
    t("def "), i(1, "function"), t("("), i(2), t(")"), -- Function signature
    -- Return type annotations
    f(function(return_type)
      if (return_type[1][1] == "")
        then return ""
        else return " -> "
        end
      end, 3),
    i(3),
    t({ ":", "" }) , 
    -- Docstring
    t({ '\t"""', "\t" }), i(4, "Function description"), 
    -- Arguments portion
    f(function(args)
      if (args[1][1] == "")
        then return ""
        else
          local parts = vim.split(args[1][1], ",", true)
          local tbl = { "", "", "\tArgs" }
          for _, arg in ipairs(parts) do
            arg = "\t" .. arg:gsub("%s+", "") .. " - "
            table.insert(tbl, arg)
          end
          return tbl
        end
    end, 2),
    -- Return portion
    f(function(return_type)
      if (return_type[1][1] == "")
        then return ""
        else return { "", "", "\tReturns: " .. return_type[1][1] }
        end
      end, 3),
    t({"",  '\t"""', "\t" }),
    -- Function body
    i(5, "pass"),
    t({"", ""}),
  }), 
})

-- Snippets for rust
ls.add_snippets("rust", {
  s({
    trig = "fn",
    name = "Function Definition",
    dscr = "Define a function",
  }, {
    c(1, { t(""), t("pub ") }), t("fn "), i(2, "function"), t("("), i(3), t(")"),
    -- Return type annotations
    f(function(return_type)
      if (return_type[1][1] == "")
        then return ""
        else return " -> "
        end
      end, 4),
    i(4), t({ " {", "\t"}),
    -- Function body
    i(5),
    t({ "", "}", "" }),
    i(0),
  }), 
})


-- Snippets for R
ls.add_snippets("rmd", {
  -- Insert R Chunk
  s({
    trig = "rc",
    name = "R Chunk",
    dscr = "Insert an R Chunk with or without options",
  }, {
    t("```{r"), c(1, {
      t("}"), 
      t(", echo = FALSE}"),
      t(", include = FALSE}"),
      t(", eval = FALSE, include = FALSE}"),
    }),
    t({ "", "" }), i(2), t({ "", "```", "" })
  }),
})

-- Snippets for LaTeX

ls.add_snippets("tex", {
  -- Block statements
  -- Begin Block
  s({
    trig = "bg",
    name = "Begin block",
    dscr = "Starts a begin block"
  }, 
  {
    t "\\begin{", 
    i(1, env),
    t({ "}", "\t" }),
    i(2),
    t({ "", "\\end{" }),
    rep(1),
    t({ "}", "" }),
  }),
  -- Align Block
  s({
    trig = "al",
    name = "Align Block",
    dscr = "Starts an align block"
  }, 
  {
    t({ "\\begin{align}", "\t" }),
    i(1),
    t({ "", "\\end{align}", "" }),
  }),
  -- Align* Block
  s({
    trig = "a*",
    name = "Align* Block",
    dscr = "Starts an align* block"
  }, 
  {
    t({ "\\begin{align*}", "\t" }),
    i(1),
    t({ "", "\\end{align*}", "" }),
  }),
  -- Equation Block
  s({
    trig = "eq",
    name = "Equation Block",
    dscr = "Starts an equation block"
  }, 
  {
    t({ "\\begin{equation}", "\t" }),
    i(1),
    t({ "", "\\end{equation}", "" }),
  }),
  -- Equation* Block
  s({
    trig = "e*",
    name = "Equation* Block",
    dscr = "Starts an equation* block"
  }, 
  {
    t({ "\\begin{equation*}", "\t" }),
    i(1),
    t({ "", "\\end{equation*}", "" }),
  }),
  -- Code Block
  s({
    trig = "code",
    name = "Code block",
    dscr = "Inserts a code block into scope"
  }, 
  {
    t("\\begin{lstlisting}"), c(1, {
      t(""), 
      sn(1, { t("[language="), i(1), t("]"), }),
    }), 
    t({ "", ""}), i(2), t({ "", "\\end{lstlisting}", "" })
  }),

  -- Math statements
  s({
    trig = "fr",
    name = "Fraction",
    dscr = "Fractional mathmatical piece"
  }, {
    t "\\frac{", i(1), t "}{", i(2), t "}",
  }),
  -- Boxed statement
  s({
    trig = "box",
    name = "Boxed",
    dscr = "Inserts a boxed statement"
  }, 
  {
    t({ "\\boxed{", "\t" }), i(1), t({ "", "}", "" }),
  }),
  -- Add a figure
  s({
    trig = "fig",
    name = "Figure",
    dscr = "Add a figure"
  }, {
    t "\\begin{figure}[", i(1, "h!"), t({ "]",  "\t\\begin{center}", "\t\t\\includegraphics[scale=" }),
    i(2, "1.0"), t("]{"), i(3, "image.png"), t({ "}", "\t\t\\caption{" }),
    i(4, "Figure Caption"), t({ "}", "\t\t\\label{fig:" }), i(5, "figure_name"), 
    t({ "}", "\t\\end{center}", "\\end{figure}"})
  }),
})

