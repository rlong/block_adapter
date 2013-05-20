//
//  JBInitialController.m
//  jsonbroker
//
//  Created by rlong on 16/05/13.
//
//



#import "BAActionSheetController.h"
#import "BAAlertController.h"
#import "BABarButtonItemController.h"
#import "BAButtonBlockAdapter.h"
#import "BAButtonController.h"
#import "BAInitialController.h"
#import "BAInitialView.h"
#import "JBLog.h"
#import "BATableViewDelegateController.h"



@implementation BAInitialController


-(BAInitialView*)getTypedView {
    
    return (BAInitialView*)[self view];
}




#pragma mark -
#pragma mark UI lifecycle

- (void)viewDidLoad
{
    
	[super viewDidLoad];
    Log_enteredMethod();
    
    BAInitialView* myView = [self getTypedView];
    
    
    // buttons ...
    {
        id adapter = [BAButtonBlockAdapter
                      onTouchUpInside:[myView buttons]
                      
                      adaptee:(id)^(UIButton* origin) {
                          
                          Log_debug(@"buttons");
                          
                          BAButtonController* subController = [[BAButtonController alloc] init];
                          {
                              [[self navigationController] pushViewController:subController animated:true];
                          }
                          [subController release];
                          return nil;

                          
                      }];
        
        [myView addAdapter:adapter]; // to 'retain' the adapter
        
    }
    // alerts ...
    {
        id adapter = [BAButtonBlockAdapter
                      onTouchUpInside:[myView alerts]
                      adaptee:(id)^(UIButton* origin) {
                          
                          Log_debug(@"alerts");

                          BAAlertController* subController = [[BAAlertController alloc] init];
                          {
                              [[self navigationController] pushViewController:subController animated:true];
                          }
                          [subController release];
                          return nil;

                      }];
        
        [myView addAdapter:adapter]; // to 'retain' the adapter

    }
    
    // action sheets ...
    {
        id adapter = [BAButtonBlockAdapter
                      onTouchUpInside:[myView actionSheets]
                      adaptee:(id)^(UIButton* origin) {
                          
                          Log_debug(@"action sheets");
                          
                          BAActionSheetController* subController = [[BAActionSheetController alloc] init];
                          {
                              [[self navigationController] pushViewController:subController animated:true];
                          }
                          [subController release];
                          return nil;
                          
                      }];

        [myView addAdapter:adapter]; // to 'retain' the adapter

    }
    
    // table view delegate ...
    {
        id adapter = [BAButtonBlockAdapter
                      onTouchUpInside:[myView tableViewDelegate]
                      adaptee:(id)^(UIButton* origin) {
                          
                          Log_debug(@"table view delegate");
                          
                          BATableViewDelegateController* subController = [[BATableViewDelegateController alloc] init];
                          {
                              [[self navigationController] pushViewController:subController animated:true];
                          }
                          [subController release];
                          
                          return nil;
                          
                      }];
        
        [myView addAdapter:adapter]; // to 'retain' the adapter
        
    }
    
    // bar button item ...
    {
        // 
        id adapter = [BAButtonBlockAdapter
                      onTouchUpInside:[myView barButtonItem]
                      adaptee:(id)^(UIButton* origin) {
                          
                          Log_debug(@"bar button item");
                          
                          BABarButtonItemController* subController = [[BABarButtonItemController alloc] init];
                          {
                              [[self navigationController] pushViewController:subController animated:true];
                          }
                          [subController release];
                          
                          return nil;
                          
                      }];
        
        [myView addAdapter:adapter]; // to 'retain' the adapter
    }
    
    
}



@end
