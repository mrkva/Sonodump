#import <Cocoa/Cocoa.h>


#import <ObjB.h>

@interface APPLICATION : NSApplication
-(void)reportException:(NSException *)anException;
@end
id GLOBAL;

@interface global : NSObject
{
}
+(void)initialize;

-(void)_AwakeFromNib;

+ (global *)objb_sharedSingleton;
+ (NSArray *)objb_DebugNames;
+ (NSArray *)objb_DebugTypes;
@end
