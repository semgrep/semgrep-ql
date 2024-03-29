(* Generated by ocaml-tree-sitter. *)
(*
   ql grammar

   entrypoint: ql
*)

open! Sexplib.Conv
open Tree_sitter_run

type quantifier = [
    `Exists of Token.t (* "exists" *)
  | `Forall of Token.t (* "forall" *)
  | `Forex of Token.t (* "forex" *)
]

type qldoc = Token.t (* pattern \/\*\*[^*]*\*+([^/*][^*]*\*+)*\/ *)

type semgrep_metavariable = Token.t

type integer = Token.t (* pattern [0-9]+ *)

type semgrep_ellipsis_metavar =
  Token.t (* pattern \$\.\.\.[a-zA-Z_][a-zA-Z_0-9]* *)

type addop = [ `PLUS of Token.t (* "+" *) | `DASH of Token.t (* "-" *) ]

type direction = [
    `Asc of Token.t (* "asc" *)
  | `Desc of Token.t (* "desc" *)
]

type closure = [ `STAR of Token.t (* "*" *) | `PLUS of Token.t (* "+" *) ]

type unop = [ `PLUS of Token.t (* "+" *) | `DASH of Token.t (* "-" *) ]

type compop = [
    `EQ of Token.t (* "=" *)
  | `BANGEQ of Token.t (* "!=" *)
  | `LT of Token.t (* "<" *)
  | `GT of Token.t (* ">" *)
  | `LTEQ of Token.t (* "<=" *)
  | `GTEQ of Token.t (* ">=" *)
]

type string_ =
  Token.t (* pattern "\"([^\"\\\\\\r\\n\\t]|\\\\[\"\\\\nrt])*\"" *)

type float_ = Token.t (* pattern [0-9]+\.[0-9]+ *)

type dbtype = Token.t (* pattern @[a-z][A-Za-z0-9_]* *)

type primitivetype = [
    `Bool of Token.t (* "boolean" *)
  | `Date of Token.t (* "date" *)
  | `Float of Token.t (* "float" *)
  | `Int of Token.t (* "int" *)
  | `Str of Token.t (* "string" *)
]

type mulop = [
    `STAR of Token.t (* "*" *)
  | `SLASH of Token.t (* "/" *)
  | `PERC of Token.t (* "%" *)
]

type lower_id = Token.t (* pattern [a-z][A-Za-z0-9_]* *)

type pat_3bf1220 = Token.t (* pattern [A-Z][A-Za-z0-9_]* *)

type aggid = [
    `Semg_meta of semgrep_metavariable (*tok*)
  | `Avg of Token.t (* "avg" *)
  | `Concat of Token.t (* "concat" *)
  | `Stri_18c266c of Token.t (* "strictconcat" *)
  | `Count of Token.t (* "count" *)
  | `Max of Token.t (* "max" *)
  | `Min of Token.t (* "min" *)
  | `Rank of Token.t (* "rank" *)
  | `Stri_8bc2381 of Token.t (* "strictcount" *)
  | `Stri_a43e15b of Token.t (* "strictsum" *)
  | `Sum of Token.t (* "sum" *)
  | `Any of Token.t (* "any" *)
  | `Unique of Token.t (* "unique" *)
]

type bool_ = [
    `True of Token.t (* "true" *)
  | `False of Token.t (* "false" *)
]

type annotname = [
    `Lower_id of lower_id (*tok*)
  | `Semg_meta of semgrep_metavariable (*tok*)
]

type predicatename = [
    `Lower_id of lower_id (*tok*)
  | `Semg_meta of semgrep_metavariable (*tok*)
]

type upper_id = [
    `Pat_3bf1220 of pat_3bf1220
  | `Semg_meta of semgrep_metavariable (*tok*)
]

type literal = [
    `Int of integer (*tok*)
  | `Float of float_ (*tok*)
  | `Bool of bool_
  | `Str of string_ (*tok*)
]

type classname = upper_id

type simpleid = [ `Lower_id of lower_id (*tok*) | `Upper_id of classname ]

type literalid = [ `Lower_id of lower_id (*tok*) | `Upper_id of classname ]

type varname = simpleid

type modulename = simpleid

type variable = [
    `This of Token.t (* "this" *)
  | `Result of Token.t (* "result" *)
  | `Varn of varname
]

type aritylesspredicateexpr = (
    (moduleexpr * Token.t (* "::" *)) option
  * literalid
)

and moduleexpr = [
    `Simp of modulename
  | `Modu of moduleinstantiation
  | `Modu_COLONCOLON_choice_simp of (
        moduleexpr
      * Token.t (* "::" *)
      * [ `Simp of modulename | `Modu of moduleinstantiation ]
    )
]

and moduleinstantiation = (
    modulename
  * Token.t (* "<" *)
  * signatureexpr
  * (Token.t (* "," *) * signatureexpr) list (* zero or more *)
  * Token.t (* ">" *)
)

and predicateexpr = (
    aritylesspredicateexpr * Token.t (* "/" *) * integer (*tok*)
)

and signatureexpr = [
    `Type of typeexpr
  | `Modu of moduleexpr
  | `Pred of predicateexpr
]

and typeexpr = [
    `Opt_modu_COLONCOLON_clas of (
        (moduleexpr * Token.t (* "::" *)) option
      * classname
    )
  | `Dbtype of dbtype (*tok*)
  | `Prim of primitivetype
]

type annotarg = [
    `Simp of modulename
  | `This of Token.t (* "this" *)
  | `Result of Token.t (* "result" *)
]

type importmoduleexpr = (
    (modulename * Token.t (* "." *)) list (* zero or more *)
  * moduleexpr
)

type predicatealiasbody = (
    Token.t (* "=" *) * predicateexpr * Token.t (* ";" *)
)

type vardecl = [
    `Semg_ellips of Token.t (* "..." *)
  | `Type_varn of (typeexpr * varname)
]

type moduleparam = (signatureexpr * modulename)

type anon_choice_pred_44fe1b2 = [
    `Pred of Token.t (* "predicate" *)
  | `Type of typeexpr
]

type modulealiasbody = (Token.t (* "=" *) * moduleexpr * Token.t (* ";" *))

type typealiasbody = (Token.t (* "=" *) * typeexpr * Token.t (* ";" *))

type typeunionbody = (
    Token.t (* "=" *)
  * typeexpr
  * Token.t (* "or" *)
  * (typeexpr * (Token.t (* "or" *) * typeexpr) list (* zero or more *))
      option
  * Token.t (* ";" *)
)

type annotation = [
    `Anno of annotname
  | `Anno_LBRACK_anno_rep_COMMA_anno_RBRACK of (
        annotname
      * Token.t (* "[" *)
      * annotarg
      * (Token.t (* "," *) * annotarg) list (* zero or more *)
      * Token.t (* "]" *)
    )
]

type importdirective = (
    Token.t (* "import" *)
  * importmoduleexpr
  * (Token.t (* "as" *) * modulename) option
)

type field = (vardecl * Token.t (* ";" *))

type anon_vard_rep_COMMA_vard_76ab5f3 = (
    vardecl
  * (Token.t (* "," *) * vardecl) list (* zero or more *)
)

type anon_call_arg_rep_COMMA_call_arg_25882ee = (
    call_arg
  * (Token.t (* "," *) * call_arg) list (* zero or more *)
)

and asexpr = (exprorterm * (Token.t (* "as" *) * varname) option)

and asexprs = (asexpr * (Token.t (* "," *) * asexpr) list (* zero or more *))

and call_arg = [ `Expr of exprorterm | `Unde of Token.t (* "_" *) ]

and call_or_unqual_agg_body = [
    `Call_body of (
        Token.t (* "(" *)
      * anon_call_arg_rep_COMMA_call_arg_25882ee option
      * Token.t (* ")" *)
    )
  | `Unqual_agg_body of (
        Token.t (* "(" *)
      * anon_vard_rep_COMMA_vard_76ab5f3 option
      * Token.t (* "|" *)
      * exprorterm option
      * (Token.t (* "|" *) * asexprs) option
      * Token.t (* ")" *)
    )
]

and expr_aggregate_body = (asexprs * orderbys option)

and exprorterm = [
    `Spec_call of (
        Token.t (* "none" *) * Token.t (* "(" *) * Token.t (* ")" *)
    )
  | `Prefix_cast of (
        Token.t (* "(" *) * typeexpr * Token.t (* ")" *) * exprorterm
    )
  | `Prim of primary
  | `Un_expr of (unop * exprorterm)
  | `Mul_expr of (exprorterm * mulop * exprorterm)
  | `Add_expr of (exprorterm * addop * exprorterm)
  | `In_expr of (exprorterm * Token.t (* "in" *) * primary)
  | `Comp_term of (exprorterm * compop * exprorterm)
  | `Inst_of of (exprorterm * Token.t (* "instanceof" *) * typeexpr)
  | `Nega of (Token.t (* "not" *) * exprorterm)
  | `If_term of (
        Token.t (* "if" *) * exprorterm * Token.t (* "then" *) * exprorterm
      * Token.t (* "else" *) * exprorterm
    )
  | `Conj of (exprorterm * Token.t (* "and" *) * exprorterm)
  | `Disj of (exprorterm * Token.t (* "or" *) * exprorterm)
  | `Impl of (exprorterm * Token.t (* "implies" *) * exprorterm)
  | `Quan of (
        quantifier
      * Token.t (* "(" *)
      * [
            `Opt_vard_rep_COMMA_vard_opt_BAR_expr_opt_BAR_expr of (
                anon_vard_rep_COMMA_vard_76ab5f3 option
              * (
                    Token.t (* "|" *)
                  * exprorterm
                  * (Token.t (* "|" *) * exprorterm) option
                )
                  option
            )
          | `Expr of exprorterm
        ]
      * Token.t (* ")" *)
    )
]

and full_aggregate_body = [
    `Opt_vard_rep_COMMA_vard_BAR_opt_expr_opt_BAR_asexprs_opt_orders of (
        anon_vard_rep_COMMA_vard_76ab5f3 option
      * Token.t (* "|" *)
      * exprorterm option
      * (Token.t (* "|" *) * asexprs * orderbys option) option
    )
  | `Vard_rep_COMMA_vard of anon_vard_rep_COMMA_vard_76ab5f3
]

and orderby = (exprorterm * direction option)

and orderbys = (
    Token.t (* "order" *)
  * Token.t (* "by" *)
  * orderby
  * (Token.t (* "," *) * orderby) list (* zero or more *)
)

and par_expr = [
    `LPAR_simp_semg_meta_RPAR of (
        Token.t (* "(" *) * modulename * semgrep_metavariable (*tok*)
      * Token.t (* ")" *)
    )
  | `LPAR_expr_RPAR of (Token.t (* "(" *) * exprorterm * Token.t (* ")" *))
]

and primary = [
    `Semg_ellips of Token.t (* "..." *)
  | `Semg_ellips_meta of semgrep_ellipsis_metavar (*tok*)
  | `Call_or_unqual_agg_expr of (
        aritylesspredicateexpr
      * closure option
      * call_or_unqual_agg_body
    )
  | `Qual_expr of (primary * Token.t (* "." *) * qualifiedrhs)
  | `Lit of literal
  | `Var of variable
  | `Super_ref of (
        (typeexpr * Token.t (* "." *)) option
      * Token.t (* "super" *)
    )
  | `Aggr of (
        aggid
      * (
            Token.t (* "[" *)
          * exprorterm
          * (Token.t (* "," *) * exprorterm) list (* zero or more *)
          * Token.t (* "]" *)
        )
          option
      * Token.t (* "(" *)
      * [
            `Full_aggr_body of full_aggregate_body
          | `Expr_aggr_body of expr_aggregate_body
        ]
          option
      * Token.t (* ")" *)
    )
  | `Range of (
        Token.t (* "[" *) * exprorterm * Token.t (* ".." *) * exprorterm
      * Token.t (* "]" *)
    )
  | `Set_lit of (
        Token.t (* "[" *)
      * (
            exprorterm
          * (Token.t (* "," *) * exprorterm) list (* zero or more *)
        )
          option
      * Token.t (* "," *) option
      * Token.t (* "]" *)
    )
  | `Par_expr of par_expr
  | `Expr_anno of (
        annotname * Token.t (* "[" *) * annotname * Token.t (* "]" *)
      * Token.t (* "(" *) * exprorterm * Token.t (* ")" *)
    )
]

and qualifiedrhs = [
    `Pred_opt_clos_LPAR_opt_call_arg_rep_COMMA_call_arg_RPAR of (
        predicatename
      * closure option
      * Token.t (* "(" *)
      * anon_call_arg_rep_COMMA_call_arg_25882ee option
      * Token.t (* ")" *)
    )
  | `LPAR_type_RPAR of (Token.t (* "(" *) * typeexpr * Token.t (* ")" *))
]

type select = (
    (Token.t (* "from" *) * anon_vard_rep_COMMA_vard_76ab5f3 option) option
  * (Token.t (* "where" *) * exprorterm) option
  * Token.t (* "select" *)
  * asexprs
  * orderbys option
)

type charpred = (
    classname * Token.t (* "(" *) * Token.t (* ")" *) * Token.t (* "{" *)
  * exprorterm * Token.t (* "}" *)
)

type body = (Token.t (* "{" *) * exprorterm * Token.t (* "}" *))

type optbody = [
    `Empty of Token.t (* ";" *)
  | `Body of body
  | `High of (
        Token.t (* "=" *)
      * literalid
      * Token.t (* "(" *)
      * (
            predicateexpr
          * (Token.t (* "," *) * predicateexpr) list (* zero or more *)
        )
          option
      * Token.t (* ")" *)
      * Token.t (* "(" *)
      * anon_call_arg_rep_COMMA_call_arg_25882ee option
      * Token.t (* ")" *)
    )
]

type datatypebranch = (
    qldoc (*tok*) option
  * annotation option
  * classname
  * Token.t (* "(" *)
  * anon_vard_rep_COMMA_vard_76ab5f3 option
  * Token.t (* ")" *)
  * body option
)

type memberpredicate = (
    anon_choice_pred_44fe1b2
  * predicatename
  * Token.t (* "(" *)
  * anon_vard_rep_COMMA_vard_76ab5f3 option
  * Token.t (* ")" *)
  * optbody
)

type classlesspredicate = (
    anon_choice_pred_44fe1b2
  * predicatename
  * [
        `LPAR_opt_vard_rep_COMMA_vard_RPAR_optb of (
            Token.t (* "(" *)
          * anon_vard_rep_COMMA_vard_76ab5f3 option
          * Token.t (* ")" *)
          * optbody
        )
      | `Pred of predicatealiasbody
    ]
)

type datatypebranches = (
    datatypebranch
  * (Token.t (* "or" *) * datatypebranch) list (* zero or more *)
)

type classmember = [
    `Semg_ellips of Token.t (* "..." *)
  | `Rep_anno_choice_char of (
        annotation list (* zero or more *)
      * [ `Char of charpred | `Memb of memberpredicate | `Field of field ]
    )
  | `Qldoc of qldoc (*tok*)
]

type datatype = (
    Token.t (* "newtype" *) * classname * Token.t (* "=" *)
  * datatypebranches
)

type dataclass = (
    Token.t (* "class" *)
  * classname
  * [
        `Opt_extends_type_rep_COMMA_type_opt_inst_type_rep_COMMA_type_choice_LCURL_rep_clas_RCURL of (
            (
                Token.t (* "extends" *)
              * typeexpr
              * (Token.t (* "," *) * typeexpr) list (* zero or more *)
            )
              option
          * (
                Token.t (* "instanceof" *)
              * typeexpr
              * (Token.t (* "," *) * typeexpr) list (* zero or more *)
            )
              option
          * [
                `LCURL_rep_clas_RCURL of (
                    Token.t (* "{" *)
                  * classmember list (* zero or more *)
                  * Token.t (* "}" *)
                )
              | `SEMI of Token.t (* ";" *)
            ]
        )
      | `Type_e6aca0c of typealiasbody
      | `Type_9cc1977 of typeunionbody
    ]
)

type module_ = (
    Token.t (* "module" *)
  * modulename
  * (
        Token.t (* "<" *)
      * moduleparam
      * (Token.t (* "," *) * moduleparam) list (* zero or more *)
      * Token.t (* ">" *)
    )
      option
  * (
        Token.t (* "implements" *)
      * signatureexpr
      * (Token.t (* "," *) * signatureexpr) list (* zero or more *)
    )
      option
  * [
        `LCURL_rep_modu_RCURL of (
            Token.t (* "{" *)
          * modulemember list (* zero or more *)
          * Token.t (* "}" *)
        )
      | `Modu of modulealiasbody
    ]
)

and modulemember = [
    `Semg_ellips of Token.t (* "..." *)
  | `Rep_anno_choice_impo of (
        annotation list (* zero or more *)
      * [
            `Impo of importdirective
          | `Clas of classlesspredicate
          | `Data_cb44f91 of dataclass
          | `Data_3931108 of datatype
          | `Select of select
          | `Module of module_
        ]
    )
  | `Qldoc of qldoc (*tok*)
]

type ql = [
    `Semg_exp of (Token.t (* "__SEMGREP_EXPRESSION" *) * exprorterm)
  | `Rep_modu of modulemember list (* zero or more *)
]

type false_ (* inlined *) = Token.t (* "false" *)

type empty (* inlined *) = Token.t (* ";" *)

type block_comment (* inlined *) =
  Token.t (* pattern \/\*([^*]+\*+([^/*][^*]*\*+)*|\*\
  )\/ *)

type this (* inlined *) = Token.t (* "this" *)

type result (* inlined *) = Token.t (* "result" *)

type line_comment (* inlined *) = Token.t (* pattern \/\/[^\r\n]* *)

type underscore (* inlined *) = Token.t (* "_" *)

type specialid (* inlined *) = Token.t (* "none" *)

type super (* inlined *) = Token.t (* "super" *)

type semgrep_ellipsis (* inlined *) = Token.t (* "..." *)

type predicate (* inlined *) = Token.t (* "predicate" *)

type true_ (* inlined *) = Token.t (* "true" *)

type special_call (* inlined *) = (
    Token.t (* "none" *) * Token.t (* "(" *) * Token.t (* ")" *)
)

type super_ref (* inlined *) = (
    (typeexpr * Token.t (* "." *)) option
  * Token.t (* "super" *)
)

type add_expr (* inlined *) = (exprorterm * addop * exprorterm)

type aggregate (* inlined *) = (
    aggid
  * (
        Token.t (* "[" *)
      * exprorterm
      * (Token.t (* "," *) * exprorterm) list (* zero or more *)
      * Token.t (* "]" *)
    )
      option
  * Token.t (* "(" *)
  * [
        `Full_aggr_body of full_aggregate_body
      | `Expr_aggr_body of expr_aggregate_body
    ]
      option
  * Token.t (* ")" *)
)

type call_body (* inlined *) = (
    Token.t (* "(" *)
  * anon_call_arg_rep_COMMA_call_arg_25882ee option
  * Token.t (* ")" *)
)

type call_or_unqual_agg_expr (* inlined *) = (
    aritylesspredicateexpr
  * closure option
  * call_or_unqual_agg_body
)

type comp_term (* inlined *) = (exprorterm * compop * exprorterm)

type conjunction (* inlined *) = (
    exprorterm * Token.t (* "and" *) * exprorterm
)

type disjunction (* inlined *) = (
    exprorterm * Token.t (* "or" *) * exprorterm
)

type expr_annotation (* inlined *) = (
    annotname * Token.t (* "[" *) * annotname * Token.t (* "]" *)
  * Token.t (* "(" *) * exprorterm * Token.t (* ")" *)
)

type if_term (* inlined *) = (
    Token.t (* "if" *) * exprorterm * Token.t (* "then" *) * exprorterm
  * Token.t (* "else" *) * exprorterm
)

type implication (* inlined *) = (
    exprorterm * Token.t (* "implies" *) * exprorterm
)

type in_expr (* inlined *) = (exprorterm * Token.t (* "in" *) * primary)

type instance_of (* inlined *) = (
    exprorterm * Token.t (* "instanceof" *) * typeexpr
)

type mul_expr (* inlined *) = (exprorterm * mulop * exprorterm)

type negation (* inlined *) = (Token.t (* "not" *) * exprorterm)

type prefix_cast (* inlined *) = (
    Token.t (* "(" *) * typeexpr * Token.t (* ")" *) * exprorterm
)

type qualified_expr (* inlined *) = (
    primary * Token.t (* "." *) * qualifiedrhs
)

type quantified (* inlined *) = (
    quantifier
  * Token.t (* "(" *)
  * [
        `Opt_vard_rep_COMMA_vard_opt_BAR_expr_opt_BAR_expr of (
            anon_vard_rep_COMMA_vard_76ab5f3 option
          * (
                Token.t (* "|" *)
              * exprorterm
              * (Token.t (* "|" *) * exprorterm) option
            )
              option
        )
      | `Expr of exprorterm
    ]
  * Token.t (* ")" *)
)

type range (* inlined *) = (
    Token.t (* "[" *) * exprorterm * Token.t (* ".." *) * exprorterm
  * Token.t (* "]" *)
)

type set_literal (* inlined *) = (
    Token.t (* "[" *)
  * (exprorterm * (Token.t (* "," *) * exprorterm) list (* zero or more *))
      option
  * Token.t (* "," *) option
  * Token.t (* "]" *)
)

type unary_expr (* inlined *) = (unop * exprorterm)

type unqual_agg_body (* inlined *) = (
    Token.t (* "(" *)
  * anon_vard_rep_COMMA_vard_76ab5f3 option
  * Token.t (* "|" *)
  * exprorterm option
  * (Token.t (* "|" *) * asexprs) option
  * Token.t (* ")" *)
)

type semgrep_expression (* inlined *) = (
    Token.t (* "__SEMGREP_EXPRESSION" *) * exprorterm
)

type higherorderterm (* inlined *) = (
    Token.t (* "=" *)
  * literalid
  * Token.t (* "(" *)
  * (
        predicateexpr
      * (Token.t (* "," *) * predicateexpr) list (* zero or more *)
    )
      option
  * Token.t (* ")" *)
  * Token.t (* "(" *)
  * anon_call_arg_rep_COMMA_call_arg_25882ee option
  * Token.t (* ")" *)
)
