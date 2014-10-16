// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//




#import "BAAlertController.h"
#import "BAAlertView.h"
#import "BAAlertViewBlockAdapter.h"
#import "BAButtonBlockAdapter.h"
#import "JBLog.h"
#import "JBMemoryModel.h"


@implementation BAAlertController



-(BAAlertView*)typedView {
    
    return (BAAlertView*)[self view];
}


#pragma mark -
#pragma mark UI/NIB callbacks


-(IBAction)onStandardAlert:(id)sender {
    
    Log_enteredMethod();
    
    NSString* title = @"Standard Title";
    NSString* message = @"Standard Message";
    
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles: @"OK", nil];
	[alert show];
    JBRelease(alert);
	//[alert release];

}

-(void)onBlockAlert {
    
    NSString* title = @"Block Title";
    NSString* message = @"Block Message";
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles: @"OK", nil];
    
    id adapter = [BAAlertViewBlockAdapter
     adapterWithClient:alert
     adaptee:^(UIAlertView* alertView, NSInteger buttonIndex) {
         
         Log_debugInt( buttonIndex );
         return (id)nil;
         
     }];
    
    [[self typedView] addAdapter:adapter];
     
    [alert show];
    JBRelease(alert);
    //[alert release];
    
}

-(void)onAsyncBlockAlert {
    
    Log_enteredMethod();
    
    NSString* title = @"Async Block Title";
    NSString* message = @"Async Block Message";
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles: @"OK", nil];
    
    
    __block NSInteger selectedButtonIndex;
    
    id adapter = [BAAlertViewBlockAdapter
                  adapterWithClient:alert
                  
                  adaptee:^id(UIAlertView* alertView, NSInteger buttonIndex) {
              
                      selectedButtonIndex = buttonIndex;
                      return nil;

                  }
                  
                  asyncTask:^id(id adapteeResponse) {
                      Log_debugInt( selectedButtonIndex );
                      
                      return nil;
                  }
                  
                  afterAsyncTaskDone:^(id adapteeResponse, id asyncTaskResponse) {
                      Log_debugInt( selectedButtonIndex );
                  }
                  
                  afterAsyncTaskFailed:nil];
    
    [[self typedView] addAdapter:adapter];
    
    [alert show];
    JBRelease(alert);
    //[alert release];
    

    
}

#pragma; mark -
#pragma mark <UIAlertViewDelegate> implementation

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	
    Log_debugInt(buttonIndex);
	
}


#pragma mark -
#pragma mark UI lifecycle

- (void)viewDidLoad
{
    
	[super viewDidLoad];
    Log_enteredMethod();
    
    BAAlertView* myView = [self typedView];
    
    // standard (synchronous) block alert ...
    {
        
        
        id adapter = [BAButtonBlockAdapter
                      onTouchUpInside:[myView blockAlert]
                      
                      adaptee:^id(UIButton* origin) {
                          
                          [self onBlockAlert];
                          return nil;
                          
                      }];
        
        [myView addAdapter:adapter]; // to 'retain' the adapter

    }
    
    // asynchronous) block alert ...
    {
        
        id adapter = [BAButtonBlockAdapter
                      onTouchUpInside:[myView asyncBlockAlert]
                      
                      adaptee:^id(UIButton* origin) {
                          
                          [self onAsyncBlockAlert];
                          return nil;

                      }];
        
        [myView addAdapter:adapter]; // to 'retain' the adapter
        
        
    }
}



@end
