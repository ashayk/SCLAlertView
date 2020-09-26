//
//  ScreenUtils.m
//  TMNMT
//
//  Created by Alex Shaykevich on 4/02/2015.
//  Copyright (c) 2015 Alex Shaykevich. All rights reserved.
//

#import "ScreenUtils.h"
#import "SDiPhoneVersion.h"

@implementation ScreenUtils

+(CGFloat)constantForIphone4:(CGFloat)iphone4Val iPhone5:(CGFloat)iphone5Val iphone6:(CGFloat)iphone6Val iphone6Plus:(CGFloat)iphone6PlusVal ipad:(CGFloat)ipadVal {

    return [[self class] constantForIphone4:iphone4Val iPhone5:iphone5Val iphone6:iphone6Val iphone6Plus:iphone6PlusVal ipad:ipadVal def:0];
}

+(CGFloat)constantForIphone4:(CGFloat)iphone4Val iPhone5:(CGFloat)iphone5Val iphone6:(CGFloat)iphone6Val iphone6Plus:(CGFloat)iphone6PlusVal ipad:(CGFloat)ipadVal def:(CGFloat)def {
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return ipadVal;
    }

    DeviceSize ds = [SDiPhoneVersion deviceSize];
    
    if([SDiPhoneVersion deviceSize] == iPhone35inch) {
        return iphone4Val;
    } else if([SDiPhoneVersion deviceSize] == iPhone4inch) {
        return iphone5Val;
    } else if([SDiPhoneVersion deviceSize] == iPhone47inch) {
        return iphone6Val;
    } else if([SDiPhoneVersion deviceSize] == iPhone55inch) {
        return iphone6PlusVal;
    } else if([SDiPhoneVersion isIphoneX]) {
    
    }
    
    return def;
}

@end
