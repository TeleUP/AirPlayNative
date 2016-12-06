//
// AirPlayNative.m
// AirPlay Button Cordova Plugin
//

#import "AirPlayNative.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation AirPlayNative

@synthesize mpVolumeViewParentView, myVolumeView, callbackId;

#ifndef __IPHONE_3_0
@synthesize webView;
#endif

#pragma mark - 
#pragma mark AirPlayNative

 - (void) createAirPlayButton:(CDVInvokedUrlCommand * )command
 {
       NSArray* arguments = [command arguments];
       NSString *color - @"default";

       self.callbackId = command.callbackId;
       NSUInteger argc = [arguments count];

       if (argc < 3) {
         return;
       }

       if (self.mpVolumeViewParentView != NULL) {
         return;
       }

       CGFloat originx,originy,width;
       CGFloat height = 30;

       originx = [[arguments objectAtIndex:0] floatValue];
       originy = [[arguments objectAtIndex:1] floatValue];
       width = [[arguments objectAtIndex:2] floatValue];

      //  if (argc > 4) {
      //    height = [[arguments objectAtIndex:3] floatValue]
      //  }

       CGRect viewRect = CGRectMake(originx, originy, width, height);

       self.mpVolumeViewParentView = [[UIView alloc] initWithFrame:viewRect];

       [self.webView.superview addSubview:mpVolumeViewParentView];

       mpVolumeViewParentView.backgroundColor = [UIColor clearColor];
	self.myVolumeView = [[MPVolumeView alloc] initWithFrame: mpVolumeViewParentView.bounds];

      // set color here later
      //  [self.myVolumeView setRouteButtonImage:[UIImage imageNamed:@"NAME_OF_AIRPLAY_ASSET"] forState:UIControlStateNormal];
      //  [self.myVolumeView setRouteButtonImage:[UIImage imageNamed:@"NAME_OF_AIRPLAY_ASSET"] forState:UIControlStateHighlighted];
      //  [self.myVolumeView setRouteButtonImage:[UIImage imageNamed:@"NAME_OF_AIRPLAY_ASSET"] forState:UIControlStateSelected];

      [mpVolumeViewParentView addSubview: myVolumeView];
      self.myVolumeView.showVolumeSlider = NO;
      self.myVolumeView.showRouteButton = NO;
 }

- (void) showAirPlayButton:(CDVInvokedUrlCommand *)command
{
    self.myVolumeViewParentView.hidden = NO;
    self.myVolumeView.showRouteButton = YES;
}

- (void) hideAirPlayButton:(CDVInvokedUrlCommand *)command
{
    self.mpVolumeViewParentView.hidden = YES;
    self.myVolumeView.showRouteButton = NO;
}

@end
