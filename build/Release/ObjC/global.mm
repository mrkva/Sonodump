#import "global.h"

extern id GLOBAL;




@implementation global

- (void)awakeFromNib
{
[self _AwakeFromNib];
}

-(void)_AwakeFromNib
{
ObjB("global.NSObject", "AwakeFromNib", 7); _ALERT(NSOBJECT(@"AwakeFromNib"));
ObjB("global.NSObject", "AwakeFromNib", 8); 
}

+(void)initialize
{
SInt32 systemVersion;
if (Gestalt(gestaltSystemVersion, &systemVersion) == noErr){
if (systemVersion < 0x1060){
[NSApp activateIgnoringOtherApps:YES];
NSRunAlertPanel(@"System Requirements", @"Sorry, but you need Mac OS X 10.6 or later to run this application.", nil, nil, nil);
[NSApp terminate:nil];
}
}
}
-(id)init
{
if ((self = [super init])){
GLOBAL = self;

[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Application_stdin:) name: NSFileHandleReadCompletionNotification object: [NSFileHandle fileHandleWithStandardInput]];
[[NSFileHandle fileHandleWithStandardInput] readInBackgroundAndNotify];
}
return self;
}


- (void)_objb_myinit
{
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Application_stdin:) name: NSFileHandleReadCompletionNotification object: [NSFileHandle fileHandleWithStandardInput]];
[[NSFileHandle fileHandleWithStandardInput] readInBackgroundAndNotify];

}


+ (global *)objb_sharedSingleton
{
static global *objb_sharedSingleton = nil;
@synchronized(self)
{
if (!objb_sharedSingleton)
objb_sharedSingleton = [[global alloc] init];
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

- (void)finalize
{
[super finalize];
[[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void) Application_stdin:(NSNotification *)aNotification
{
    NSData *data = [[aNotification userInfo] objectForKey:NSFileHandleNotificationDataItem];
    if ([data length]){
 NSMutableString *s = [[NSMutableString alloc] initWithData: data encoding:NSUTF8StringEncoding];
 if (BOOLEAN(STRING_STARTSWITH(s, @"DEBUG_STEPINTO", NSOBJECT(NO)))) DEBUG_STEPINTO();
 else if (BOOLEAN(STRING_STARTSWITH(s, @"DEBUG", NSOBJECT(NO)))) DEBUG();
    [[aNotification object] readInBackgroundAndNotify];
}
}
@end
@implementation APPLICATION
- (void)reportException:(NSException *)anException
{
  NSString *s = [[NSString alloc] initWithFormat: @"\n\nException in\n file '%@'\n at '%@'\n line '%@'\ncallStackSymbols:\n%@", ObjBF(), ObjBS(), ObjBL(), [[anException callStackSymbols] description]];
  NSLog(@"%@", s);
  ALERT(ADD(@"Exception ", [anException name]), ADD(ADD([anException reason], [anException userInfo] == nil ? @"" : ADD(@"\n\n", [anException userInfo])), s));
}
@end

int main (int argc, const char *argv[])
{
[APPLICATION sharedApplication];
idAPPLICATION = NSApp;
return NSApplicationMain(argc,  (const char **) argv);
}
