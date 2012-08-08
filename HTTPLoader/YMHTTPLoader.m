//
//  YMHTTPLoader.m
//  HTTPLoader
//
//  Created by 亮太 林 on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "YMHTTPLoader.h"
#import "YMHTTPResponseParser.h"

static YMHTTPLoader* sharedLoader_ = nil;

@interface YMHTTPLoader()<YMHTTPResponseParserDelegate>{
    //NSMutableDictionary* connections_;
    NSMutableArray* connections_;
}

@property (atomic,readonly) NSMutableArray* connections;

@end

@implementation YMHTTPLoader
@synthesize connections = connections_;

+ (YMHTTPLoader*)sharedLoader
{
    if (!sharedLoader_) {
        sharedLoader_ = [[YMHTTPLoader alloc] init];
    }
    return sharedLoader_;
}

- (id)init
{
    self = [super init];
    if (self) {
        connections_ = [NSMutableArray array];
    }
    return self;
}

+(void)loadAsync:(NSMutableURLRequest*)request complete:(cllbackBlock)complete
{
    YMHTTPResponseParser* parser;
    parser = [[YMHTTPResponseParser alloc] init];
    parser.callback = complete;
    parser.delegate = [YMHTTPLoader sharedLoader];
    [parser parseWithRequest:request];
    [[YMHTTPLoader sharedLoader].connections addObject:parser];
}

- (void)parserDidFinishLoading:(YMHTTPResponseParser*)parser
{
    //NSLog(@"parserDidFinishLoading");
    cllbackBlock callback = parser.callback;
    [self.connections removeObject:parser];
    if (callback) {
        callback(parser.data,nil);
    }
    
}

- (void)parser:(YMHTTPResponseParser*)parser didFailWithError:(NSError*)error
{
    cllbackBlock callback = parser.callback;
    [self.connections removeObject:parser];
    if (callback) {
        callback(nil,error);
    }
}


@end
