if exists("b:current_syntax")
  finish
endif

syn match QuickFixFileName       '^[^|]*' nextgroup=QuickFixLineSeparatorBegin
syn match QuickFixSeparatorBegin '|'      nextgroup=QuickFixLineNumber
syn match QuickFixLineNumber     '[^|]*'  nextgroup=QuickFixSeparatorEnd contained
syn match QuickFixSeparatorEnd   '|'      contained

let b:current_syntax = "qf"
