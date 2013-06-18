// This file was autogenerated from Tests/html5lib/tokenizer/contentModelFlags.test

#import <SenTestingKit/SenTestingKit.h>
#import "HTMLTokenizerTestUtilities.h"

@interface TokenizerContentModelFlagsTests : SenTestCase

@end

@implementation TokenizerContentModelFlagsTests
        
- (void)test0
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"<head>&body;"]]);
    for (NSString *state in @[@"PLAINTEXT state"]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"<head>&body;" state:StateNamed(state)];
        [tokenizer setLastStartTag:@"plaintext"];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"PLAINTEXT content model flag");
    }
}
        
- (void)test1
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"foo"], @[@"EndTag", @"xmp"]]);
    for (NSString *state in @[@"RCDATA state", @"RAWTEXT state"]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"foo</xmp>" state:StateNamed(state)];
        [tokenizer setLastStartTag:@"xmp"];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"End tag closing RCDATA or RAWTEXT");
    }
}
        
- (void)test2
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"foo"], @[@"EndTag", @"xmp"]]);
    for (NSString *state in @[@"RCDATA state", @"RAWTEXT state"]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"foo</xMp>" state:StateNamed(state)];
        [tokenizer setLastStartTag:@"xmp"];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"End tag closing RCDATA or RAWTEXT (case-insensitivity)");
    }
}
        
- (void)test3
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"foo"], @"ParseError"]);
    for (NSString *state in @[@"RCDATA state", @"RAWTEXT state"]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"foo</xmp " state:StateNamed(state)];
        [tokenizer setLastStartTag:@"xmp"];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"End tag closing RCDATA or RAWTEXT (ending with space)");
    }
}
        
- (void)test4
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"foo</xmp"]]);
    for (NSString *state in @[@"RCDATA state", @"RAWTEXT state"]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"foo</xmp" state:StateNamed(state)];
        [tokenizer setLastStartTag:@"xmp"];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"End tag closing RCDATA or RAWTEXT (ending with EOF)");
    }
}
        
- (void)test5
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"foo"], @"ParseError"]);
    for (NSString *state in @[@"RCDATA state", @"RAWTEXT state"]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"foo</xmp/" state:StateNamed(state)];
        [tokenizer setLastStartTag:@"xmp"];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"End tag closing RCDATA or RAWTEXT (ending with slash)");
    }
}
        
- (void)test6
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"foo</xmp<"]]);
    for (NSString *state in @[@"RCDATA state", @"RAWTEXT state"]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"foo</xmp<" state:StateNamed(state)];
        [tokenizer setLastStartTag:@"xmp"];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"End tag not closing RCDATA or RAWTEXT (ending with left-angle-bracket)");
    }
}
        
- (void)test7
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"</foo>bar"], @[@"EndTag", @"xmp"]]);
    for (NSString *state in @[@"RCDATA state", @"RAWTEXT state"]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"</foo>bar</xmp>" state:StateNamed(state)];
        [tokenizer setLastStartTag:@"xmp"];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"End tag with incorrect name in RCDATA or RAWTEXT");
    }
}
        
- (void)test8
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"</foo>bar</xmpaar>"]]);
    for (NSString *state in @[@"RCDATA state", @"RAWTEXT state"]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"</foo>bar</xmpaar>" state:StateNamed(state)];
        [tokenizer setLastStartTag:@"xmp"];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"End tag with incorrect name in RCDATA or RAWTEXT (starting like correct name)");
    }
}
        
- (void)test9
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"foo"], @[@"EndTag", @"xmp"], @[@"EndTag", @"baz"]]);
    for (NSString *state in @[@"RCDATA state", @"RAWTEXT state"]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"foo</xmp></baz>" state:StateNamed(state)];
        [tokenizer setLastStartTag:@"xmp"];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"End tag closing RCDATA or RAWTEXT, switching back to PCDATA");
    }
}
        
- (void)test10
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"&foo;"]]);
    for (NSString *state in @[@"RAWTEXT state"]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&foo;" state:StateNamed(state)];
        [tokenizer setLastStartTag:@"xmp"];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"RAWTEXT w/ something looking like an entity");
    }
}
        
- (void)test11
{
    NSArray *expectedTokens = ReifiedTokensForTestTokens(@[@[@"Character", @"<"]]);
    for (NSString *state in @[@"RCDATA state"]) {
        HTMLTokenizer *tokenizer = [[HTMLTokenizer alloc] initWithString:@"&lt;" state:StateNamed(state)];
        [tokenizer setLastStartTag:@"textarea"];
        STAssertEqualObjects(tokenizer.allObjects, expectedTokens, @"%@", @"RCDATA w/ an entity");
    }
}

@end
