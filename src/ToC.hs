module ToC where

import Data.List (intercalate)

import Parser
import ToMon
import ToExposeAlloc

toC :: MonExp -> String
toC (AtmInt n) =
  show n

toC (AtmVar var) =
  var

toC (MonPlus n n2) =
  let cn = toC n in
    let cn2 = toC n2 in
      cn ++ " + " ++ cn2 ++ ";\n"

toC (MonPrint e) =
  let ce = toC e in
    "    printf(\"%d\", " ++ ce ++ ");\n"

toC (MonLessThn e e2) =
  let ce = toC e in
    let ce2 = toC e2 in
      ce ++ " < " ++ ce2

toC (MonGreaterThn e e2) =
  let ce = toC e in
    let ce2 = toC e2 in
      ce ++ " > " ++ ce2

toC (MonTupIndex var index) =
  var ++ "[" ++ show index ++ "]"

toC (MonLet var (MonTuple exps)) =
  let cexps = toC exps in
    let len = length cexps in
      let cexps' = insertCommas cexps in
        "int " ++ var ++ "[" ++ show len ++ "] = {" ++ cexps' ++ "};\n"

toC (MonLet var (MonPlus (AtmVar v) (AtmInt 1))) =
  "            " ++ v ++ "++;\n"
toC (MonLet var e) =
  let ce = toC e in
    "int " ++ var ++ " = " ++ ce ++ ";\n"

toC (MonWhile cnd e) =
  let ccnd = toC cnd in
    let ce = toC e in
      "    while (" ++ ccnd ++ ") {\n    " ++ ce ++ "}\n"

toC (MonIf cnd thn els) =
  let ccnd = toC cnd in
    let cthn = toC thn in
      let cels = toC els in
        "    if (" ++ ccnd ++ ") {\n" ++ "        " ++ cthn ++ "}\n" ++ "        else {\n    " ++ "    " ++ cels ++ "}\n"

toC (SeqMon e e2) =
  let firsts = toC e in
    let seconds = toC e2 in
      firsts ++ seconds

--utils
insertCommas :: String -> String
insertCommas = intercalate ", " . map (:[])
