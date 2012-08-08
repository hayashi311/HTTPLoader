//
//  YMHTTPResponseParser.m
//  HTTPLoader
//
//  Created by 亮太 林 on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "YMHTTPResponseParser.h"


@interface YMHTTPResponseParser()
{
    NSString* parserId_;
    NSMutableData* data_;
    NSURLConnection* connection_;
}

@end

@implementation YMHTTPResponseParser
@synthesize data = data_;
@synthesize parserId = parserId_;
@synthesize delegate;
@synthesize callback;

- (id)init
{
    self = [super init];
    if (self) {
        data_ = [NSMutableData data];
        srand(time(nil));
        double now = [[NSDate date] timeIntervalSince1970];
        parserId_ = [NSString stringWithFormat:@"%f%d",now,rand()%INT_MAX];
    }
    return self;
}


- (void)parseWithRequest:(NSMutableURLRequest*)request
{
    //NSLog(@"parseWithRequest");
    if (!request) {
        return;
    }
    //[request setTimeoutInterval:10];
    // NSURLConnectionオブジェクトの作成
    connection_ = [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response
{
    // ヘッダ受信
    //NSLog(@"didReceiveResponse");
}

- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data
{
    //NSLog(@"didReceiveData");
    // ダウンロード済みデータを追加
    [data_ appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection*)connection
{
    //NSLog(@"connectionDidFinishLoading");
    if ([self.delegate respondsToSelector:@selector(parserDidFinishLoading:)]) {
        [self.delegate parserDidFinishLoading:self];
    }
    
    connection_ = nil;
}

- (void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error
{
    //NSLog(@"didFailWithError");
    if ([self.delegate respondsToSelector:@selector(parser:didFailWithError:)]) {
        [self.delegate parser:self didFailWithError:error];
    }
    
    // NSURLConnectionオブジェクトを解放
    connection_ = nil;
}


@end
