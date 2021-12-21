//
//  UABuilder.m
//  NonWVApp-OBJC
//

#include <sys/utsname.h>
#include "UABuilder.h"

@implementation UABuilder

//eg. Darwin/16.3.0
static NSString * DarwinVersion(void) {
    struct utsname u;
    (void) uname(&u);
    return [NSString stringWithFormat:@"Darwin/%@", [NSString stringWithUTF8String:u.release]];
}

//eg. CFNetwork/808.3
static NSString * CFNetworkVersion(void) {
    return [NSString stringWithFormat:@"CFNetwork/%@", [NSBundle bundleWithIdentifier:@"com.apple.CFNetwork"].infoDictionary[@"CFBundleShortVersionString"]];
}

//eg. MyApp/1
static NSString* appNameAndVersion()
{
    NSString* appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    NSString* appVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    return [NSString stringWithFormat:@"%@/%@", appName, appVersion];
}

+ (NSString*)getUAString {
    return [NSString stringWithFormat:@"%@ %@ %@", appNameAndVersion(), CFNetworkVersion(), DarwinVersion()];
}

@end
