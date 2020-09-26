//
//  SDiPhoneVersion.m
//  SDiPhoneVersion
//
//  Created by Sebastian Dobrincu on 09/09/14.
//  Copyright (c) 2014 Sebastian Dobrincu. All rights reserved.
//

#import "SDiPhoneVersion.h"

@implementation SDiPhoneVersion

+(NSDictionary*)deviceNamesByCode {
    
    static NSDictionary* deviceNamesByCode = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deviceNamesByCode = @{
                              @"iPhone3,1" :[NSNumber numberWithInteger:iPhone4],
                              @"iPhone4,1" :[NSNumber numberWithInteger:iPhone4S],
                              @"iPhone5,1" :[NSNumber numberWithInteger:iPhone5],
                              @"iPhone5,2" :[NSNumber numberWithInteger:iPhone5],
                              @"iPhone5,3" :[NSNumber numberWithInteger:iPhone5C],
                              @"iPhone5,4" :[NSNumber numberWithInteger:iPhone5C],
                              @"iPhone6,1" :[NSNumber numberWithInteger:iPhone5S],
                              @"iPhone7,2" :[NSNumber numberWithInteger:iPhone6],
                              @"iPhone7,1" :[NSNumber numberWithInteger:iPhone6Plus],
                              @"i386"      :[NSNumber numberWithInteger:Simulator],
                              @"x86_64"    :[NSNumber numberWithInteger:Simulator]
                              };
    });
    
    return deviceNamesByCode;
}

+(DeviceVersion)deviceVersion {

    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *code = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    DeviceVersion version = (DeviceVersion)[[self.deviceNamesByCode objectForKey:code] integerValue];

    return version;
}

+(DeviceSize)deviceSize {
    
    BOOL landscape = [[UIScreen mainScreen] bounds].size.width > [[UIScreen mainScreen] bounds].size.height;
    
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    if(landscape) {
        screenHeight = [[UIScreen mainScreen] bounds].size.width;
    }
    
    if (screenHeight == 480)
        return iPhone35inch;
    else if(screenHeight == 568)
        return iPhone4inch;
    else if(screenHeight == 667)
        return  iPhone47inch;
    else if(screenHeight == 736)
        return iPhone55inch;
    else
        return 0;
}

+(NSString*)deviceName {
    
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString* code = [NSString stringWithCString:systemInfo.machine
                                        encoding:NSUTF8StringEncoding];
    
    static NSDictionary* deviceNamesByCode = nil;
    
    if (!deviceNamesByCode) {
        
        deviceNamesByCode = @{@"i386"      : @"Simulator",
                              @"x86_64"    : @"Simulator",
                              @"iPod1,1"   : @"iPod Touch",        // (Original)
                              @"iPod2,1"   : @"iPod Touch",        // (Second Generation)
                              @"iPod3,1"   : @"iPod Touch",        // (Third Generation)
                              @"iPod4,1"   : @"iPod Touch",        // (Fourth Generation)
                              @"iPod7,1"   : @"iPod Touch",        // (6th Generation)
                              @"iPhone1,1" : @"iPhone",            // (Original)
                              @"iPhone1,2" : @"iPhone",            // (3G)
                              @"iPhone2,1" : @"iPhone",            // (3GS)
                              @"iPad1,1"   : @"iPad",              // (Original)
                              @"iPad2,1"   : @"iPad 2",            //
                              @"iPad3,1"   : @"iPad",              // (3rd Generation)
                              @"iPhone3,1" : @"iPhone 4",          // (GSM)
                              @"iPhone3,3" : @"iPhone 4",          // (CDMA/Verizon/Sprint)
                              @"iPhone4,1" : @"iPhone 4S",         //
                              @"iPhone5,1" : @"iPhone 5",          // (model A1428, AT&T/Canada)
                              @"iPhone5,2" : @"iPhone 5",          // (model A1429, everything else)
                              @"iPad3,4"   : @"iPad",              // (4th Generation)
                              @"iPad2,5"   : @"iPad Mini",         // (Original)
                              @"iPhone5,3" : @"iPhone 5c",         // (model A1456, A1532 | GSM)
                              @"iPhone5,4" : @"iPhone 5c",         // (model A1507, A1516, A1526 (China), A1529 | Global)
                              @"iPhone6,1" : @"iPhone 5s",         // (model A1433, A1533 | GSM)
                              @"iPhone6,2" : @"iPhone 5s",         // (model A1457, A1518, A1528 (China), A1530 | Global)
                              @"iPhone7,1" : @"iPhone 6 Plus",     //
                              @"iPhone7,2" : @"iPhone 6",          //
                              @"iPhone8,1" : @"iPhone 6S",         //
                              @"iPhone8,2" : @"iPhone 6S Plus",    //
                              @"iPhone8,4" : @"iPhone SE",         //
                              @"iPhone9,1" : @"iPhone 7",          //
                              @"iPhone9,3" : @"iPhone 7",          //
                              @"iPhone9,2" : @"iPhone 7 Plus",     //
                              @"iPhone9,4" : @"iPhone 7 Plus",     //
                              @"iPhone10,1": @"iPhone 8",          // CDMA
                              @"iPhone10,4": @"iPhone 8",          // GSM
                              @"iPhone10,2": @"iPhone 8 Plus",     // CDMA
                              @"iPhone10,5": @"iPhone 8 Plus",     // GSM
                              @"iPhone10,3": @"iPhone X",          // CDMA
                              @"iPhone10,6": @"iPhone X",          // GSM
                              
                              @"iPad4,1"   : @"iPad Air",          // 5th Generation iPad (iPad Air) - Wifi
                              @"iPad4,2"   : @"iPad Air",          // 5th Generation iPad (iPad Air) - Cellular
                              @"iPad4,4"   : @"iPad Mini",         // (2nd Generation iPad Mini - Wifi)
                              @"iPad4,5"   : @"iPad Mini",         // (2nd Generation iPad Mini - Cellular)
                              @"iPad4,7"   : @"iPad Mini",         // (3rd Generation iPad Mini - Wifi (model A1599))
                              @"iPad6,7"   : @"iPad Pro (12.9\")", // iPad Pro 12.9 inches - (model A1584)
                              @"iPad6,8"   : @"iPad Pro (12.9\")", // iPad Pro 12.9 inches - (model A1652)
                              @"iPad6,3"   : @"iPad Pro (9.7\")",  // iPad Pro 9.7 inches - (model A1673)
                              @"iPad6,4"   : @"iPad Pro (9.7\")"   // iPad Pro 9.7 inches - (models A1674 and A1675)
                              };
    }
    
    NSString* deviceName = [deviceNamesByCode objectForKey:code];
    
    if (!deviceName) {
        // Not found on database. At least guess main device type from string contents:
        
        if ([code rangeOfString:@"iPod"].location != NSNotFound) {
            deviceName = @"iPod Touch";
        }
        else if([code rangeOfString:@"iPad"].location != NSNotFound) {
            deviceName = @"iPad";
        }
        else if([code rangeOfString:@"iPhone"].location != NSNotFound){
            deviceName = @"iPhone";
        }
        else {
            deviceName = @"Unknown";
        }
    }
    
    return deviceName;
}

+(BOOL)isIphone5 {
    NSString* s = [SDiPhoneVersion deviceName];
    BOOL send = [s rangeOfString:@"iPhone 5"].location != NSNotFound;
    
    return send;
}

+(BOOL)isIphonePlus {
    NSString* s = [SDiPhoneVersion deviceName];
    BOOL send = [s rangeOfString:@"Plus"].location != NSNotFound;
    
    return send;
}

+(BOOL)isIphoneX {
    BOOL iPhoneX = NO;
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0 || mainWindow.safeAreaInsets.left > 0.0) {
            iPhoneX = YES;
        }
    }
    return iPhoneX;
}

+(BOOL)isIphone678 {
    NSString* s = [SDiPhoneVersion deviceName];
    BOOL plus = [SDiPhoneVersion isIphonePlus];
    if(plus) {
        return NO;
    }
    
    BOOL send6 = [s rangeOfString:@"iPhone 6"].location != NSNotFound;
    BOOL send7 = [s rangeOfString:@"iPhone 7"].location != NSNotFound;
    BOOL send8 = [s rangeOfString:@"iPhone 8"].location != NSNotFound;

    return send6 || send7 || send8;
}

@end
