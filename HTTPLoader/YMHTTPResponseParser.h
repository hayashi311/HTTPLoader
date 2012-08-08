//
//  YMHTTPResponseParser.h
//  HTTPLoader
//
//  Created by 亮太 林 on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@class YMHTTPResponseParser;

@protocol YMHTTPResponseParserDelegate
- (void)parserDidFinishLoading:(YMHTTPResponseParser*)parser;
- (void)parser:(YMHTTPResponseParser*)parser didFailWithError:(NSError*)error;
@end

typedef void (^cllbackBlock)(NSData* data, NSError *error);

@interface YMHTTPResponseParser : NSObject

@property (atomic, readonly) NSString* parserId;
@property (atomic, readonly) NSData* data;
@property (atomic, weak) NSObject<YMHTTPResponseParserDelegate>* delegate;
@property (atomic, strong) cllbackBlock callback;


- (void)parseWithRequest:(NSMutableURLRequest*)request;

@end
