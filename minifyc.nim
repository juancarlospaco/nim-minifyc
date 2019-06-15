## Nim C Minifier
import os, strutils

const
  replacementsC = [
    (" + ",   "+"),
    (" - ",   "-"),
    (" * ",   "*"),
    (" / ",   "/"),
    (" % ",   "%"),
    (" ++ ",  "++"),
    (" -- ",  "--"),
    (" += ",  "+="),
    (" -= ",  "=="),
    (" *= ",  "*="),
    (" /= ",  "/="),
    (" %= ",  "%="),
    (" = ",   "="),
    (" == ",  "=="),
    (" != ",  "!="),
    (" && ",  "&&"),
    (" || ",  "||"),
    (" << ",  "<<"),
    (" >> ",  ">>"),
    (" <= ",  "<="),
    (" >= ",  ">="),
    (" <<= ", "<<="),
    (" >>= ", ">>="),
    (" |= ",  "|="),
    (" (",    "("),
    (") ",    ")"),
    ("} ",    "}"),
    (" {",    "{"),
    (" > ",   ">"),
    (" < ",   "<"),
    (", ",    ","),
    ("; ",    ";"),
    (" ! ",   "!"),
    (" & ",   "&"),
    (" | ",   "|"),
    (" ^ ",   "^"),
    ("};};",  "}};"),
    (";};",   "};"),
    (";\n}",  ";}"),
    ("\t",    " "),
    ("\n\n",  "\n"),
    ("\n\n\n", "\n"),
    ("\n\n\n\n", "\n"),
  ]

for cfile in walkFiles(getCurrentDir() / "c_code/**/*.c"):
  let
    oldc = readFile(cfile)
    newc = multiReplace(oldc, replacementsC).strip
  writeFile(cfile, newc)
  echo oldc.len - newc.len, "\t", cfile
