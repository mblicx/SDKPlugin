/********* Echo.h Cordova Plugin Header *******/

#import <Cordova/CDV.h>
#import "StimshopSDK.h"

@interface StimShopPlugin : CDVPlugin

- (void)test:(CDVInvokedUrlCommand*)command;

- (void)takeOffWithAPIKey:(CDVInvokedUrlCommand*)command;
- (void)startListener:(CDVInvokedUrlCommand*)command;
- (void)stopListener:(CDVInvokedUrlCommand*)command;
- (void)isListening:(CDVInvokedUrlCommand*)command;
- (void)isDetecting:(CDVInvokedUrlCommand*)command;
- (void)nbCodeInDBB:(CDVInvokedUrlCommand*)command;

@end

