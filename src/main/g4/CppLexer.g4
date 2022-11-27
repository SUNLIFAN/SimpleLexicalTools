lexer grammar CppLexer;

// keywords: one of these listed below

AUTO: 'auto';

BREAK: 'break';

CASE: 'case';

CONST: 'const';

CONTINUE: 'continue';

DEFAULT: 'default';

DO: 'do';

DOUBLE: 'double';

ELSE: 'else';

ENUM: 'enum';

EXTERN: 'extern';

FLOAT: 'float';

FOR: 'for';

GOTO: 'goto';

IF: 'if';

INLINE: 'inline';

LONG: 'long';

INT: 'int';

RETURN: 'return';

SHORT: 'short';

SIGNED: 'signed';

SIZEOF: 'sizeof';

STATIC: 'static';

STRUCT: 'struct';

SWITCH: 'switch';

TYPEDEF: 'typedef';

UNION: 'union';

UNSIGNED: 'unsigned';

VOID: 'void';

WHILE: 'while';

CLASS: 'class';

PUBLIC: 'public';

PRIVATE: 'private';

// keywords end here

// identifiers

IDENT: ('_' | LETTER)(LETTER | DECIMAL_DIGIT | '_')*;
fragment LETTER: [A-Za-z];
fragment DECIMAL_DIGIT: [0-9];

// identifiers end here

// Punctuators
LPAR:                    '(';
RPAR:                    ')';
LSQB:                    '[';
RSQB:                    ']';
COLON:                   ':';
COMMA:                   ',';
SEMI:                    ';';
PLUS:                    '+';
MINUS:                   '-';
STAR:                    '*';
SLASH:                   '/';
VBAR:                    '|';
AMPER:                   '&';
LESS:                    '<';
GREATER:                 '>';
EQUAL:                   '=';
DOT:                     '.';
MOD:                 '%';
LBRACE:                  '{';
RBRACE:                  '}';
EQEQUAL:                 '==';
NOTEQUAL:                '!=';
LESSEQUAL:               '<=';
GREATEREQUAL:            '>=';
TILDE:                   '~';
CIRCUMFLEX:              '^';
LEFTSHIFT:               '<<';
RIGHTSHIFT:              '>>';
PLUSEQUAL:               '+=';
MINEQUAL:                '-=';
STAREQUAL:               '*=';
SLASHEQUAL:              '/=';
PERCENTEQUAL:            '%=';
AMPEREQUAL:              '&=';
VBAREQUAL:               '|=';
CIRCUMFLEXEQUAL:         '^=';
LEFTSHIFTEQUAL:          '<<=';
RIGHTSHIFTEQUAL:         '>>=';
RARROW:                  '->';

// Punctuators end here

// Literals

// number literals
NUMBER:  ('+' | '-')? (
            ([1-9])(DECIMAL_DIGIT)* |
            ('0x' | '0X')HEX_DIGIT+ |
            ('0') OCT_DIGIT+        |
            '0'
            );
// end number literals here

// char literals
CHAR_LITERAL: '\''.'\'';
// char literals here

// string literals
STRING: '"' (.)*? '"';
// string literals end here

fragment HEX_DIGIT: [0-9a-fA-F];

fragment OCT_DIGIT: [0-7];

// end literals here

NEWLINE:  ('\r' | '\n') -> skip;

WS: [ \r\n\t]+ -> skip;

LINE_COMMENT: '//' .*? '\n' -> skip
   ;

MULTILINE_COMMENT: '/*' .*? '*/' -> skip;

fragment DOUBLE_COLON: '::';

TEMPLATE: '<' (IDENT DOUBLE_COLON)*IDENT '>';