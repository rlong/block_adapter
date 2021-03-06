// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import "BAInitialController.h"
#import "BASamplesAppDelegate.h"

#import "JBMemoryModel.h"
#import "JBWorkManager.h"


@implementation BASamplesAppDelegate

- (void)dealloc
{
    JBRelease(_window);
    //[_window release];
    JBSuperDealloc();
    //[super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // set the name of the main thread ...
    {
        [[NSThread currentThread] setName:@"main"];
    }
    
    // spin off some worker threads ...
    {
        [JBWorkManager start];
    }
    
    UIWindow* window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    JBAutorelease(window);
    self.window = window;
    //self.window = JBReturnAutorelease([[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]);
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    {
        BAInitialController* initialController = [[BAInitialController alloc] init];
        UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:initialController];
        {
            [self.window setRootViewController:navigationController];
        }
        JBRelease(navigationController);
        //[navigationController release];
        JBRelease(initialController);
        //[initialController release];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
