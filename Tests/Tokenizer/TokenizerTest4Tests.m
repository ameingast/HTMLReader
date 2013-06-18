// This file was autogenerated from Tests/html5lib/tokenizer/test4.test

#import <SenTestingKit/SenTestingKit.h>
#import "HTMLTokenizerTestUtilities.h"

@interface TokenizerTest4Tests : SenTestCase

@end

@implementation TokenizerTest4Tests
        
- (void)test0
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @"ParseError", @[@"StartTag", @"z", @{@"0": @"", @"<": @""}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z/0  <>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"< in attribute name");
    }
}
        
- (void)test1
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"StartTag", @"z", @{@"x": @"<"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z x=<>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"< in attribute value");
    }
}
        
- (void)test2
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"StartTag", @"z", @{@"z": @"z=z"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z z=z=z>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"= in unquoted attribute value");
    }
}
        
- (void)test3
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"StartTag", @"z", @{@"=": @""}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z =>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"= attribute");
    }
}
        
- (void)test4
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @"ParseError", @[@"StartTag", @"z", @{@"=": @""}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z ==>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"== attribute");
    }
}
        
- (void)test5
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @"ParseError", @[@"StartTag", @"z", @{@"=": @"="}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z ===>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"=== attribute");
    }
}
        
- (void)test6
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @"ParseError", @"ParseError", @[@"StartTag", @"z", @{@"=": @"=="}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z ====>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"==== attribute");
    }
}
        
- (void)test7
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"StartTag", @"z", @{@"z": @"&"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z z=\"&\">" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Allowed \" after ampersand in attribute value");
    }
}
        
- (void)test8
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"StartTag", @"z", @{@"z": @"&'"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z z=\"&'\">" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Non-allowed ' after ampersand in attribute value");
    }
}
        
- (void)test9
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"StartTag", @"z", @{@"z": @"&"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z z='&'>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Allowed ' after ampersand in attribute value");
    }
}
        
- (void)test10
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"StartTag", @"z", @{@"z": @"&\""}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z z='&\"'>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Non-allowed \" after ampersand in attribute value");
    }
}
        
- (void)test11
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"StartTag", @"z", @{@"z": @"&xlink_xmlns;"}], @[@"Character", @"bar"], @[@"StartTag", @"z", @{}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z z='&xlink_xmlns;'>bar<z>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Text after bogus character reference");
    }
}
        
- (void)test12
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"StartTag", @"z", @{@"z": @"  foo"}], @[@"Character", @"bar"], @[@"StartTag", @"z", @{}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z z='&#x0020; foo'>bar<z>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Text after hex character reference");
    }
}
        
- (void)test13
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"StartTag", @"foo", @{@"\"": @"bar"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<foo \"='bar'>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Attribute name starting with \"");
    }
}
        
- (void)test14
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"StartTag", @"foo", @{@"'": @"bar"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<foo '='bar'>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Attribute name starting with '");
    }
}
        
- (void)test15
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"StartTag", @"foo", @{@"a\"b": @"bar"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<foo a\"b='bar'>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Attribute name containing \"");
    }
}
        
- (void)test16
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"StartTag", @"foo", @{@"a'b": @"bar"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<foo a'b='bar'>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Attribute name containing '");
    }
}
        
- (void)test17
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"StartTag", @"foo", @{@"a": @"b'c"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<foo a=b'c>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Unquoted attribute value containing '");
    }
}
        
- (void)test18
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"StartTag", @"foo", @{@"a": @"b\"c"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<foo a=b\"c>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Unquoted attribute value containing \"");
    }
}
        
- (void)test19
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"StartTag", @"foo", @{@"a": @"b", @"c": @""}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<foo a=\"b\"c>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Double-quoted attribute value not followed by whitespace");
    }
}
        
- (void)test20
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"StartTag", @"foo", @{@"a": @"b", @"c": @""}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<foo a='b'c>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Single-quoted attribute value not followed by whitespace");
    }
}
        
- (void)test21
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"StartTag", @"br", @{@"a": @"b"}, @YES]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<br a='b'/>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Quoted attribute followed by permitted /");
    }
}
        
- (void)test22
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"StartTag", @"bar", @{@"a": @"b"}, @YES]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<bar a='b'/>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Quoted attribute followed by non-permitted /");
    }
}
        
- (void)test23
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"DOCTYPE", @"html", [NSNull null], [NSNull null], @NO]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!doctype html \r" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"CR EOF after doctype name");
    }
}
        
- (void)test24
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError"]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z\r" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"CR EOF in tag name");
    }
}
        
- (void)test25
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError"]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<z/" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Slash EOF in tag name");
    }
}
        
- (void)test26
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @"ParseError", @[@"Character", @"�"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#x0" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Zero hex numeric entity");
    }
}
        
- (void)test27
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @"ParseError", @[@"Character", @"�"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#0" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Zero decimal numeric entity");
    }
}
        
- (void)test28
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"A"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000041;" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Zero-prefixed hex numeric entity");
    }
}
        
- (void)test29
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"A"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000065;" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Zero-prefixed decimal numeric entity");
    }
}
        
- (void)test30
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Character", @"&#x "], @"ParseError", @[@"Character", @"&#X "]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#x &#X " state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Empty hex numeric entities");
    }
}
        
- (void)test31
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Character", @"&# "], @"ParseError", @[@"Character", @"&#; "]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&# &#; " state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Empty decimal numeric entities");
    }
}
        
- (void)test32
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"𐀀"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#x10000;" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Non-BMP numeric entity");
    }
}
        
- (void)test33
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Character", @"􏿿"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#X10FFFF;" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Maximum non-BMP numeric entity");
    }
}
        
- (void)test34
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Character", @"�"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#x110000;" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Above maximum numeric entity");
    }
}
        
- (void)test35
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Character", @"�"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#x80000041;" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"32-bit hex numeric entity");
    }
}
        
- (void)test36
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Character", @"�"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#x100000041;" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"33-bit hex numeric entity");
    }
}
        
- (void)test37
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Character", @"�"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#4294967361;" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"33-bit decimal numeric entity");
    }
}
        
- (void)test38
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Character", @"�"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#x10000000000000041;" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"65-bit hex numeric entity");
    }
}
        
- (void)test39
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Character", @"�"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#18446744073709551681;" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"65-bit decimal numeric entity");
    }
}
        
- (void)test40
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"퟿"], @"ParseError", @[@"Character", @"�"], @"ParseError", @[@"Character", @"�"], @"ParseError", @[@"Character", @"�"], @"ParseError", @[@"Character", @"�"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&#xD7FF;&#xD800;&#xD801;&#xDFFE;&#xDFFF;&#xE000;" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Surrogate code point edge cases");
    }
}
        
- (void)test41
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"StartTag", @"x", @{}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<X>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Uppercase start tag name");
    }
}
        
- (void)test42
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"EndTag", @"x"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"</X>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Uppercase end tag name");
    }
}
        
- (void)test43
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"StartTag", @"x", @{@"x": @""}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<x X>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Uppercase attribute name");
    }
}
        
- (void)test44
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"StartTag", @"x@az[`az{", @{@"@az[`az{": @""}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<x@AZ[`az{ @AZ[`az{>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Tag/attribute name case edge values");
    }
}
        
- (void)test45
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @"ParseError", @[@"StartTag", @"x", @{@"x": @"1"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<x x=1 x=2 X=3>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Duplicate different-case attributes");
    }
}
        
- (void)test46
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"EndTag", @"x"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"</x X>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Uppercase close tag attributes");
    }
}
        
- (void)test47
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @"ParseError", @[@"EndTag", @"x"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"</x x x>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Duplicate close tag attributes");
    }
}
        
- (void)test48
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"StartTag", @"br", @{}, @YES]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<br/>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Permitted slash");
    }
}
        
- (void)test49
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"StartTag", @"xr", @{}, @YES]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<xr/>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Non-permitted slash");
    }
}
        
- (void)test50
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"EndTag", @"br"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"</br/>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Permitted slash but in close tag");
    }
}
        
- (void)test51
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"DOCTYPE", @"html", @"AbC", @"XyZ", @YES]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!DoCtYpE HtMl PuBlIc \"AbC\" \"XyZ\">" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Doctype public case-sensitivity (1)");
    }
}
        
- (void)test52
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"DOCTYPE", @"html", @"aBc", @"xYz", @YES]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!dOcTyPe hTmL pUbLiC \"aBc\" \"xYz\">" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Doctype public case-sensitivity (2)");
    }
}
        
- (void)test53
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"DOCTYPE", @"html", [NSNull null], @"XyZ", @YES]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!DoCtYpE HtMl SyStEm \"XyZ\">" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Doctype system case-sensitivity (1)");
    }
}
        
- (void)test54
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"DOCTYPE", @"html", [NSNull null], @"xYz", @YES]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!dOcTyPe hTmL sYsTeM \"xYz\">" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Doctype system case-sensitivity (2)");
    }
}
        
- (void)test55
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Comment", @"doc"], @"ParseError", @[@"Character", [NSString stringWithFormat:@"%C", (unichar)0x0000]]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:[NSString stringWithFormat:@"<!doc>%C", (unichar)0x0000] state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"U+0000 in lookahead region after non-matching character");
    }
}
        
- (void)test56
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"Comment", @"doc�"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:[NSString stringWithFormat:@"<!doc%C", (unichar)0x0000] state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"U+0000 in lookahead region");
    }
}
        
- (void)test57
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @"ParseError", @[@"Comment", @"doc"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!doc" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"U+0080 in lookahead region");
    }
}
        
- (void)test58
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @"ParseError", @[@"Comment", @"doc﷑"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!doc﷑" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"U+FDD1 in lookahead region");
    }
}
        
- (void)test59
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @"ParseError", @[@"Comment", @"doc🿿"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!doc🿿" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"U+1FFFF in lookahead region");
    }
}
        
- (void)test60
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"\n?"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"\r?" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"CR followed by non-LF");
    }
}
        
- (void)test61
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"\n"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"\r" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"CR at EOF");
    }
}
        
- (void)test62
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"\n"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"\n" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"LF at EOF");
    }
}
        
- (void)test63
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"\n"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"\r\n" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"CR LF");
    }
}
        
- (void)test64
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"\n\n"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"\r\r" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"CR CR");
    }
}
        
- (void)test65
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"\n\n"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"\n\n" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"LF LF");
    }
}
        
- (void)test66
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"\n\n"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"\n\r" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"LF CR");
    }
}
        
- (void)test67
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"text\n\n\ntext"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"text\r\r\rtext" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"text CR CR CR text");
    }
}
        
- (void)test68
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"DOCTYPE", @"html", [NSNull null], [NSNull null], @NO]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!DOCTYPE html PUBLIK \"AbC\" \"XyZ\">" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Doctype publik");
    }
}
        
- (void)test69
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"DOCTYPE", @"html", [NSNull null], [NSNull null], @NO]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!DOCTYPE html PUBLI" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Doctype publi");
    }
}
        
- (void)test70
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"DOCTYPE", @"html", [NSNull null], [NSNull null], @NO]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!DOCTYPE html SISTEM \"AbC\">" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Doctype sistem");
    }
}
        
- (void)test71
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"DOCTYPE", @"html", [NSNull null], [NSNull null], @NO]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!DOCTYPE html SYS" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Doctype sys");
    }
}
        
- (void)test72
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"DOCTYPE", @"html", [NSNull null], [NSNull null], @NO], @[@"Character", @"text"]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<!DOCTYPE html x>text" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Doctype html x>text");
    }
}
        
- (void)test73
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError", @[@"StartTag", @"a", @{@"a": @"aa`"}]]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a a=aa`>" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"Grave accent in unquoted attribute");
    }
}
        
- (void)test74
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError"]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"EOF in tag name state ");
    }
}
        
- (void)test75
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError"]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"EOF in tag name state");
    }
}
        
- (void)test76
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError"]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a " state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"EOF in before attribute name state");
    }
}
        
- (void)test77
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError"]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a a" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"EOF in attribute name state");
    }
}
        
- (void)test78
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError"]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a a " state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"EOF in after attribute name state");
    }
}
        
- (void)test79
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError"]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a a =" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"EOF in before attribute value state");
    }
}
        
- (void)test80
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError"]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a a =\"a" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"EOF in attribute value (double quoted) state");
    }
}
        
- (void)test81
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError"]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a a ='a" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"EOF in attribute value (single quoted) state");
    }
}
        
- (void)test82
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError"]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a a =a" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"EOF in attribute value (unquoted) state");
    }
}
        
- (void)test83
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@"ParseError"]);
    for (NSString *state in @[@""]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<a a ='a'" state:StateNamed(state)];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"EOF in after attribute value state");
    }
}

@end
