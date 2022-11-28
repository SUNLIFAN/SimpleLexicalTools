lexer grammar PyLexer;

DEF: 'def';
IF: 'if';
ELSE: 'else';
ELIF: 'elif';
WHILE: 'while';
FOR: 'for';


ENDMARKER: EOF;
NAME: ('_' | LETTER)(DECIMAL_DIGIT | LETTER | '_')*;
NUMBER:  ('+' | '-')? (
            ([1-9])(DECIMAL_DIGIT)* |
            ('0x' | '0X')HEX_DIGIT+ |
            ('0') OCT_DIGIT+        |
            '0'
            );
STRING:  '"' (.)*?'"' | '\''(.)*? '\'';

NEWLINE:  ('\r' | '\n') -> skip;

WS: [ \r\n\t]+ -> skip;

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
PERCENT:                 '%';
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
DOUBLESTAR:              '**';
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
DOUBLESTAREQUAL:         '**=';
DOUBLESLASH:             '//';
DOUBLESLASHEQUAL:        '//=';
AT:                      '@';
ATEQUAL:                 '@=';
RARROW:                  '->';
ELLIPSIS:                '...';
COLONEQUAL:              ':=';

COMMENT: '#'(.)*? NEWLINE -> skip;

ANNOTATION: AT (.)*? NEWLINE -> skip;

fragment LETTER: [a-zA-Z];
fragment DECIMAL_DIGIT: [0-9];
fragment OCT_DIGIT: [0-7];
fragment HEX_DIGIT: [0-9a-fA-F];

