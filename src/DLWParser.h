#import <PEGKit/PKParser.h>

enum {
    DLWPARSER_TOKEN_KIND_A = 14,
    DLWPARSER_TOKEN_KIND_ADD = 15,
    DLWPARSER_TOKEN_KIND_B = 16,
    DLWPARSER_TOKEN_KIND_POUND = 17,
    DLWPARSER_TOKEN_KIND_SEMI_COLON = 18,
    DLWPARSER_TOKEN_KIND_COMMA = 19,
    DLWPARSER_TOKEN_KIND_C = 20,
    DLWPARSER_TOKEN_KIND_JUMP = 21,
    DLWPARSER_TOKEN_KIND_D = 22,
    DLWPARSER_TOKEN_KIND_PLUS = 23,
    DLWPARSER_TOKEN_KIND_JUMPN = 24,
    DLWPARSER_TOKEN_KIND_SUB = 25,
    DLWPARSER_TOKEN_KIND_LOAD = 26,
    DLWPARSER_TOKEN_KIND_JUMPZ = 27,
    DLWPARSER_TOKEN_KIND_OPEN_PAREN = 28,
    DLWPARSER_TOKEN_KIND_CLOSE_PAREN = 29,
    DLWPARSER_TOKEN_KIND_STORE = 30,
    DLWPARSER_TOKEN_KIND_JUMPO = 31,
};

@interface DLWParser : PKParser

@end

