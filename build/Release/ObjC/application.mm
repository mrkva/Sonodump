#import "application.h"

extern id GLOBAL;




@implementation application
-(id)init
{
if ((self = [super init])){
}
return self;
}


- (void)_objb_myinit
{

}


+ (application *)objb_sharedSingleton
{
static application *objb_sharedSingleton = nil;
@synchronized(self)
{
if (!objb_sharedSingleton)
objb_sharedSingleton = [[application alloc] init];
return objb_sharedSingleton;
}
}

+ (NSArray *)objb_DebugNames
{
static NSArray *objb_DebugNames = nil;
@synchronized(self)
{
if (!objb_DebugNames){
}
}
return objb_DebugNames; 
}

+ (NSArray *)objb_DebugTypes
{
static NSArray *objb_DebugTypes = nil;
@synchronized(self)
{
if (!objb_DebugTypes){
}
}
return objb_DebugTypes; 
}

- (void)awakeFromNib
{
}


- (void)finalize
{
[super finalize];
[[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
