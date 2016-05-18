#import "StimShopPlugin.h"
#import <Cordova/CDV.h>

@interface StimShopPlugin() <StimshopDelegate>

@end

@implementation StimShopPlugin

- (void)test:(CDVInvokedUrlCommand*)command
{
    NSString* APIKey = [command.arguments objectAtIndex:0];//take value frome the call
        [[StimshopSDK sharedInstance] takeOffWithAPIKey:APIKey];
        [[StimshopSDK sharedInstance] setDelegate:(id<StimshopDelegate>)self];
        [[StimshopSDK sharedInstance] setActivatedChannels:channelTwo];
        [[StimshopSDK sharedInstance] startListener];
}

- (void)takeOffWithAPIKey:(CDVInvokedUrlCommand*)command
{
    //run in a safe thread. optional.
    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;//result set for func
        
        NSString* APIKey = [command.arguments objectAtIndex:0];//take value frome the call
        
        //call SDK
        [[StimshopSDK sharedInstance] takeOffWithAPIKey:APIKey];
        [[StimshopSDK sharedInstance] setDelegate:(id<StimshopDelegate>)self];
        
        //call back part
        if (APIKey!= nil) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"APIKey is null"];
        }
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void)startListener:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;//result set for func
    
    [[StimshopSDK sharedInstance] startListener];
    
    //call back part
    if ([[StimshopSDK sharedInstance] isListening]) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"start listener fail!"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
 
}

- (void)stopListener:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    
    [[StimshopSDK sharedInstance] stopListener];
    if (![[StimshopSDK sharedInstance] isListening]) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"stop listener fail!"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)isListening:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    
    BOOL listen = [[StimshopSDK sharedInstance] isListening];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:listen];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)isDetecting:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* pluginResult = nil;
    
    BOOL detect = [[StimshopSDK sharedInstance] isDetecting];
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:detect];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)nbCodeInDBB:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* pluginResult = nil;
    
    int number = [[[StimshopSDK sharedInstance] nbCodeInDBB] intValue];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:number];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}



#pragma mark - Stimshop Delegate Method
- (void)didDetectWavWithCode:(NSString *)code
{
    
}

- (void)didStopDetecting
{
    NSLog(@"[STIMSHOP SDK]stop linsening!");
}

- (void)didStopWithErrorMessage:(NSString *)message
{
   // NSLog(@"ERROR : %@", message);
}

- (void)didReceiveWinUrl:(NSString *)url
{
   // NSLog(@"URL : %@", url);
}



@end