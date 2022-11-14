#import "VoyaFlutterPlugin.h"
#if __has_include(<voya_flutter/voya_flutter-Swift.h>)
#import <voya_flutter/voya_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "voya_flutter-Swift.h"
#endif

@implementation VoyaFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftVoyaFlutterPlugin registerWithRegistrar:registrar];
}
@end
