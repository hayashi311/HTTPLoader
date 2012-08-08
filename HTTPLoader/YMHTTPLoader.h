//
//  YMHTTPLoader.h
//  HTTPLoader
//
//  Created by 亮太 林 on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YMHTTPResponseParser.h"

@interface YMHTTPLoader : NSObject

+ (YMHTTPLoader*)sharedLoader;
+(void)loadAsync:(NSMutableURLRequest*)request complete:(cllbackBlock)complete;



@end
