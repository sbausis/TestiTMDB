//
//  AppDelegate.m
//  TestiTMDB
//
//  Created by Simon Pascal Baur on 02/01/15.
//  Copyright (c) 2015 Simon Pascal Baur. All rights reserved.
//

#import "AppDelegate.h"
#import "TZDebug.h"
#import <iTMDB/TMDBPromisedTVSeries.h>
#import <iTMDB/TMDBPromisedTVSeason.h>

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    TZLog(@"%s", __FUNCTION__);
    
    TMDB* tmdb = [[TMDB alloc] initWithAPIKey:@"" delegate:self language:@"en"];
    [tmdb tvCollectionWithName:@"The Simpsons"];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    TZLog(@"%s", __FUNCTION__);
    
}

#pragma mark -
#pragma mark TMDBDelegate

-(void)tmdb:(TMDB *)context didFailLoadingMovieCollection:(TMDBMovieCollection *)movie error:(NSError *)error {
    TZLog(@"%s", __FUNCTION__);
    
}
-(void)tmdb:(TMDB *)context didFinishLoadingMovieCollection:(TMDBMovieCollection *)movie {
    TZLog(@"%s", __FUNCTION__);
    
}

-(void)tmdb:(TMDB *)context didFailLoadingMovie:(TMDBMovie *)movie error:(NSError *)error {
    TZLog(@"%s", __FUNCTION__);
    
}
-(void)tmdb:(TMDB *)context didFinishLoadingMovie:(TMDBMovie *)movie {
    TZLog(@"%s", __FUNCTION__);
    
}

-(void)tmdb:(TMDB *)context didFailLoadingTVCollection:(TMDBTVCollection *)tv error:(NSError *)error {
    TZLog(@"%s", __FUNCTION__);
    
}
-(void)tmdb:(TMDB *)context didFinishLoadingTVCollection:(TMDBTVCollection *)tv {
    TZLog(@"%s", __FUNCTION__);
    TMDBPromisedTVSeries* proTVSeries = (TMDBPromisedTVSeries*)[tv.results objectAtIndex:0];
    [proTVSeries tvSeries];
    
}

-(void)tmdb:(TMDB *)context didFailLoadingTVSeries:(TMDBTVSeries *)tvSeries error:(NSError *)error {
    TZLog(@"%s", __FUNCTION__);
    
}
-(void)tmdb:(TMDB *)context didFinishLoadingTVSeries:(TMDBTVSeries *)tvSeries {
    TZLog(@"%s", __FUNCTION__);
    TMDBPromisedTVSeason* proTVSeason = (TMDBPromisedTVSeason*)[tvSeries.seasons objectAtIndex:1];
    proTVSeason.context = tvSeries.context;
    [proTVSeason tvSeason];
    
}

-(void)tmdb:(TMDB *)context didFailLoadingTVSeason:(TMDBTVSeason *)tvSeason error:(NSError *)error {
    TZLog(@"%s", __FUNCTION__);
    
}
-(void)tmdb:(TMDB *)context didFinishLoadingTVSeason:(TMDBTVSeason *)tvSeason {
    TZLog(@"%s", __FUNCTION__);
    
}

@end
