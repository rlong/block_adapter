// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//

#import "BABarButtonItemBlockAdapter.h"
#import "BABarButtonItemController.h"
#import "BABarButtonItemView.h"
#import "JBLog.h"



@implementation BABarButtonItemController


-(BABarButtonItemView*)getTypedView {
    
    return (BABarButtonItemView*)[self view];
}

#pragma mark -
#pragma mark UI/NIB callbacks

- (IBAction)onStandard:(id)sender {
    
    Log_enteredMethod();
    
}



#pragma mark -
#pragma mark UI lifecycle

- (void)viewDidLoad
{
    
	[super viewDidLoad];
    Log_enteredMethod();
    
    BABarButtonItemView* myView = [self getTypedView];
    
    
    typedef id(^JBBarButtonItemDelegate)(UIBarButtonItem* barButtonItem);

    // block
    {
        id adapter = [BABarButtonItemBlockAdapter
                      adapterWithClient:[myView block]
                      adaptee:^id(UIBarButtonItem* barButtonItem) {
                          Log_enteredMethod();
                          return nil;
                      }];        
        [myView addAdapter:adapter];
    }
    
    // async block
    {
        id adapter = [BABarButtonItemBlockAdapter
                      adapterWithClient:[myView asyncBlock]
                      adaptee:^id(UIBarButtonItem* barButtonItem) {
                          
                          Log_enteredMethod();
                          return nil;
                      }
                      asyncTask:^id(id adapteeResponse){
                          Log_enteredMethod();
                          return nil;
                      }
                      afterAsyncTaskDone:^(id adapteeResponse, id asyncTaskResponse) {
                          Log_enteredMethod();
                      }
                      afterAsyncTaskFailed:nil];
        [myView addAdapter:adapter];
    }
    
}


@end
