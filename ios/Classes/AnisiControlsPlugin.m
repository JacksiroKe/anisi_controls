#import "AnisiControlsPlugin.h"
#if __has_include(<anisi_controls/anisi_controls-Swift.h>)
#import <anisi_controls/anisi_controls-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "anisi_controls-Swift.h"
#endif

@implementation AnisiControlsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAnisiControlsPlugin registerWithRegistrar:registrar];
}
@end
