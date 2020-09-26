//
//  ScreenUtils.h
//  TMNMT
//
//  Created by Alex Shaykevich on 4/02/2015.
//  Copyright (c) 2015 Alex Shaykevich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScreenUtils : NSObject

+(CGFloat)constantForIphone4:(CGFloat)iphone4Val iPhone5:(CGFloat)iphone5Val iphone6:(CGFloat)iphone6Val iphone6Plus:(CGFloat)iphone6PlusVal ipad:(CGFloat)ipadVal;

+(CGFloat)constantForIphone4:(CGFloat)iphone4Val iPhone5:(CGFloat)iphone5Val iphone6:(CGFloat)iphone6Val iphone6Plus:(CGFloat)iphone6PlusVal ipad:(CGFloat)ipadVal def:(CGFloat)def;


@end
