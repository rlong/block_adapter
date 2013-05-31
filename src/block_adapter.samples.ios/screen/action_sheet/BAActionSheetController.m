// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//



#import "BAActionSheetBlockAdapter.h"
#import "BAActionSheetController.h"
#import "BAActionSheetView.h"
#import "BAButtonBlockAdapter.h"
#import "JBLog.h"
#import "JBMemoryModel.h"


@implementation BAActionSheetController




-(BAActionSheetView*)getTypedView {
    
    return (BAActionSheetView*)[self view];
}


-(void)onBlockActionSheet {
    

    Log_enteredMethod();
    
    UIActionSheet* actionSheet = [[UIActionSheet alloc] initWithTitle:@"Block Action Sheet" delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"OK", nil];
    {
        id adapter = [BAActionSheetBlockAdapter
                      adapterWithClient:actionSheet
                      adaptee:^id(UIActionSheet* actionSheet, NSInteger buttonIndex) {
                          
                          Log_debugInt( buttonIndex );
                          return nil;
                      }];
        
        
        BAActionSheetView* myView = [self getTypedView];
        [myView addAdapter:adapter]; // to 'retain' the adapter

        UIToolbar* toolbar = [myView toolbar];
        [actionSheet showFromToolbar:toolbar];

    }
    JBRelease(actionSheet);
    //[actionSheet release];

    
    
}

-(void)onAsyncBlockActionSheet {
    
    
    __block NSInteger selectedButtonIndex;

    UIActionSheet* actionSheet = [[UIActionSheet alloc] initWithTitle:@"Async Block Action Sheet" delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"OK", nil];
    {
        

        id adapter = [BAActionSheetBlockAdapter
                      adapterWithClient:actionSheet
                      adaptee:^id(UIActionSheet* actionSheet, NSInteger buttonIndex) {
                          selectedButtonIndex = buttonIndex;
                          return nil;
                      }
                      asyncBlock:^id(id adapteeResponse) {
                          Log_debugInt( selectedButtonIndex );
                          return nil;
                      }
                      afterAsyncBlockDone:^(id adapteeResponse, id asyncBlockResponse) {
                          Log_debugInt( selectedButtonIndex );
                      }
                      afterAsyncBlockFailed:nil];
        
        
        BAActionSheetView* myView = [self getTypedView];
        [myView addAdapter:adapter]; // to 'retain' the adapter
        
        UIToolbar* toolbar = [myView toolbar];
        [actionSheet showFromToolbar:toolbar];
        
    }
    JBRelease(actionSheet);
    //[actionSheet release];

    
    
}

#pragma mark -
#pragma mark UI/NIB callbacks

-(IBAction)onStandardActionSheet:(id)sender {
    
    
    UIActionSheet* actionSheet = [[UIActionSheet alloc] initWithTitle:@"Standard Action Sheet" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"OK", nil];
    {
        
        BAActionSheetView* myView = [self getTypedView];
        UIToolbar* toolbar = [myView toolbar];
        [actionSheet showFromToolbar:toolbar];
        
    }
    JBRelease(actionSheet);

    
}


#pragma mark -
#pragma mark <UIActionSheetDelegate> implementation

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    Log_debugInt( buttonIndex );
    
}


#pragma mark -
#pragma mark UI lifecycle

- (void)viewDidLoad
{
    
	[super viewDidLoad];
    Log_enteredMethod();
    
    BAActionSheetView* myView = [self getTypedView];
    
    // block action sheet ...
    {
        
        id adapter = [BAButtonBlockAdapter
                      onTouchUpInside:[myView blockActionSheet]
                      
                      adaptee:^id(UIButton* origin) {
                          
                          [self onBlockActionSheet];
                          return nil;

                      }];
        
        [myView addAdapter:adapter]; // to 'retain' the adapter

        
    }
    // async block action sheet
    {
        id adapter = [BAButtonBlockAdapter
                      onTouchUpInside:[myView asyncBlockActionSheet]
                      
                      adaptee:^id(UIButton* origin) {
                          
                          [self onAsyncBlockActionSheet];
                          return nil;

                      }];
        
        [myView addAdapter:adapter]; // to 'retain' the adapter
        

    }
    
    
    
}



@end
