// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import "BAButtonBlockAdapter.h"
#import "BAButtonController.h"
#import "BAButtonView.h"

#import "JBLog.h"

@implementation BAButtonController

-(BAButtonView*)getTypedView {
    
    return (BAButtonView*)[self view];
}



#pragma mark -
#pragma mark UI/NIB callbacks

-(IBAction)onStandardButton:(id)sender {
    
    Log_enteredMethod();
    
}



#pragma mark -
#pragma mark UI lifecycle

- (void)viewDidLoad
{
    
	[super viewDidLoad];
    Log_enteredMethod();
    
    BAButtonView* myView = [self getTypedView];
    
    
    // standard (synchronous) button ...
    {
        id adapter = [BAButtonBlockAdapter
                      onTouchUpInside:[myView blockButton]
                      
                      adaptee:^id(UIButton* origin) {
            
                          Log_debugInt( _counter++ );
                          return nil;

                      }];

        [myView addAdapter:adapter]; // to 'retain' the adapter

    }
    
    // asynchronous block button ...
    {
        id adapter = [BAButtonBlockAdapter
                      
                      onTouchUpInside:[myView asyncBlockButton]
                      
                      adaptee:^id(UIButton* origin) {
                          Log_debugInt( _counter++ );
                          return nil;

                      }
                      
                      asyncTask:^id(id adapteeResponse) {
                          Log_debugInt( _counter );
                          return nil;
                      }
                      
                      afterAsyncTaskDone:^(id adapteeResponse, id asyncTaskResponse) {
                          Log_debugInt( _counter );
                      }
                      
                      afterAsyncTaskFailed:nil];
                      
        
        [myView addAdapter:adapter]; // to 'retain' the adapter
    }
    
    
}





@end
