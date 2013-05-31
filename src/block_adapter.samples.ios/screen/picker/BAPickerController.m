// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import "BAPickerBlockAdapter.h"
#import "BAPickerController.h"
#import "BAPickerView.h"
#import "BATabBarBlockAdapter.h"

#import "JBLog.h"


@implementation BAPickerController


-(BAPickerView*)getTypedView {
    
    return (BAPickerView*)[self view];
}


#pragma mark -
#pragma mark <UIPickerViewDataSource> implementation

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return 10;
    
}

#pragma mark -
#pragma mark <UIPickerViewDelegate> implementation


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return [NSString stringWithFormat:@"%d[%d]", component, row];
    
}



- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    Log_enteredMethod();
    
}


#pragma mark -
#pragma mark UI lifecycle

- (void)viewDidLoad {
    
	[super viewDidLoad];
    Log_enteredMethod();
    
    BAPickerView* myView = [self getTypedView];
    
    {
        [[myView blockView] setHidden:true];
        [[myView asyncBlockView] setHidden:true];
    }
    
    
    // block
    {
        
        id adapter = [BAPickerBlockAdapter
                      adapterWithClient:[myView blockPicker]
                      
                      titleProvider:^NSString*(UIPickerView* pickerView, NSInteger row, NSInteger component) {
                          NSString* answer = [NSString stringWithFormat:@"%d[%d]", component, row];
                          Log_debugString( answer );
                          return answer;
                      }
                      
                      adaptee:^id(UIPickerView* pickerView, NSInteger selectedRow, NSInteger component) {
                          Log_enteredMethod();
                          return nil;
                      }];
        [myView addAdapter:adapter];
   
    }
    
    // async_block
    {
        id adapter = [BAPickerBlockAdapter
                      adapterWithClient:[myView asyncBlockPicker]
                      titleProvider:^NSString*(UIPickerView* pickerView, NSInteger row, NSInteger component) {
                          NSString* answer = [NSString stringWithFormat:@"%d[%d]", component, row];
                          Log_debugString( answer );
                          return answer;
                      }
                      adaptee:^id(UIPickerView* pickerView, NSInteger selectedRow, NSInteger component) {
                          Log_enteredMethod();
                          return nil;
                      }
                      asyncTask:^id(id adapteeResponse) {
                          Log_enteredMethod();
                          return nil;
                      }
                      afterAsyncTaskDone:^(id adapteeResponse, id blockResponse) {
                          Log_enteredMethod();
                      }
                      afterAsyncTaskFailed:nil];
        [myView addAdapter:adapter];

        
    }
    
    // tab bar
    {
        id adapter = [BATabBarBlockAdapter
                      adapterWithClient:[myView tabBar]
                      adaptee:^id(UITabBar* tabBar, UITabBarItem* selectedItem) {

                          Log_enteredMethod();

                          NSArray* items = [tabBar items];
                          if( selectedItem == [items objectAtIndex:0] ) {
                              
                              [[myView standardView] setHidden:false];
                              [[myView blockView] setHidden:true];
                              [[myView asyncBlockView] setHidden:true];
                              
                          } else if( selectedItem == [items objectAtIndex:1] ) {
                              
                              [[myView standardView] setHidden:true];
                              [[myView blockView] setHidden:false];
                              [[myView asyncBlockView] setHidden:true];
                              
                          } else {
                              
                              [[myView standardView] setHidden:true];
                              [[myView blockView] setHidden:true];
                              [[myView asyncBlockView] setHidden:false];
                          }
                          return nil;
                          
                      }];
        
        [myView addAdapter:adapter];
    }
    
    
}

@end
