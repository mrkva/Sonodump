#import <Cocoa/Cocoa.h>


#import <ObjB.h>

@interface application : NSObject
{
}

+ (application *)objb_sharedSingleton;
+ (NSArray *)objb_DebugNames;
+ (NSArray *)objb_DebugTypes;
@end
