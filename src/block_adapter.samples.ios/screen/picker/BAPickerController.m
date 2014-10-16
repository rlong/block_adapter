// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//



#import "BAPickerBlockAdapter.h"
#import "BAPickerController.h"
#import "BAPickerView.h"
#import "BAPickerViewDataSource.h"
#import "BAPickerViewDelegate.h"
#import "BATabBarBlockAdapter.h"

#import "JBLog.h"
#import "JBBlockJob.h"

@implementation BAPickerController


-(BAPickerView*)typedView {
    
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
    
    return [NSString stringWithFormat:@"%ld[%ld]", component, row];
    
}



- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    Log_enteredMethod();
    
}


#pragma mark -
#pragma mark UI lifecycle

- (void)viewDidLoad {
    
	[super viewDidLoad];
    Log_enteredMethod();
    
    BAPickerView* myView = [self typedView];
    
    {
        [[myView blockView] setHidden:true];
        [[myView asyncBlockView] setHidden:true];
    }
    
    // block
    {
        
        BAPickerViewDataSource* dataSource = [BAPickerViewDataSource
                                              buildWithNumberOfComponents:^NSInteger(UIPickerView *pickerView) {
                                                  return 2;
                                              }
                                              numberOfRows:^NSInteger(UIPickerView *pickerView, NSInteger component) {
                                                  return 11;
                                              }];
        
        
        // simple block ...
        {

            BAPickerViewDelegate* delegate = [BAPickerViewDelegate
                                              buildWithTitleForPicker:^NSString*(UIPickerView* pickerView, NSInteger row, NSInteger component) {
                                                  return [NSString stringWithFormat:@"%ld[%ld]", component, row];
                                              }
                                              pickerSelectedRow:^void(UIPickerView* pickerView, NSInteger selectedRow, NSInteger component ) {
                                                  Log_debugFormat( @"selectedRow = %d; component = %d", selectedRow, component );

                                              }];
            
            
            BAPickerBlockAdapter* adapter = [[BAPickerBlockAdapter alloc] initWithPickerViewDataSource:dataSource
                                                       pickerViewDelegate:delegate];
            
            [adapter setupWithPickerView:[myView blockPicker]];
            [myView addAdapter:adapter];

        }
        
        
        // async block ...
        {
            BAPickerViewDelegate* delegate = [BAPickerViewDelegate
                                              buildWithTitleForPicker:^NSString*(UIPickerView* pickerView, NSInteger row, NSInteger component) {
                                                  return [NSString stringWithFormat:@"%ld[%ld]", component, row];
                                              }
                                              pickerSelectedRow:^void(UIPickerView* pickerView, NSInteger selectedRow, NSInteger component ) {
                                                  Log_debugFormat( @"selectedRow = %d; component = %d", selectedRow, component );
                                                  
                                                  [JBBlockJob
                                                   executeWithContext:nil
                                                   block:^id(id adapteeResponse) {
                                                       Log_enteredMethod();
                                                       return nil;
                                                   }
                                                   onBlockDone:^(id adapteeResponse, id blockResponse) {
                                                       Log_enteredMethod();
                                                   }

                                                   onBlockFailed:nil];

                                                  
                                                  
                                              }];
            
            
            BAPickerBlockAdapter* adapter = [[BAPickerBlockAdapter alloc] initWithPickerViewDataSource:dataSource
                                                       pickerViewDelegate:delegate];
            
            
            [adapter setupWithPickerView:[myView asyncBlockPicker]];
            [myView addAdapter:adapter];
            
        }
        
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
