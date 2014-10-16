// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import "BAPickerBlockAdapter.h"

#import "JBMemoryModel.h"
#import "JBWorkManager.h"


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface BAPickerBlockAdapter ()



#pragma mark fields



@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -

@implementation BAPickerBlockAdapter

#pragma mark -
#pragma mark <UIPickerViewDelegate> implementation


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if( nil != _pickerViewDelegate ) {

        if( [_pickerViewDelegate respondsToSelector:@selector(pickerView:titleForRow:forComponent:)] ) {
            return [_pickerViewDelegate pickerView:pickerView titleForRow:row forComponent:component];
            
        }

    }
    return nil;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    
    if( nil != _pickerViewDelegate ) {
        
        if( [_pickerViewDelegate respondsToSelector:@selector(pickerView:didSelectRow:inComponent:)] ) {
            [_pickerViewDelegate pickerView:pickerView didSelectRow:row inComponent:component];
            
        }
    }
    
    if( nil != _asyncBlock ) {
        
        [JBBlockJob executeWithContext:nil block:_asyncBlock onBlockDone:_asyncBlockDone onBlockFailed:_asyncBlockFailed];
    }

    
}


#pragma mark -
#pragma mark instance lifecycle





-(void)setupWithPickerView:(UIPickerView*)pickerView {
    

    if( nil != _pickerViewDataSource ) {
        [pickerView setDataSource:_pickerViewDataSource];
    }

    [pickerView setDelegate:self];
    
    
    
}

// 'pickerViewDataSource' and 'pickerViewDelegate' can be nil
-(id)initWithPickerViewDataSource:(id<UIPickerViewDataSource>)pickerViewDataSource pickerViewDelegate:(id<UIPickerViewDelegate>)pickerViewDelegate {

    BAPickerBlockAdapter* answer = [super init];
    
    if( nil != answer ) {
        
        [answer setPickerViewDataSource:pickerViewDataSource];
        [answer setPickerViewDelegate:pickerViewDelegate];
        
    }
    
    
    return answer;

}

-(void)dealloc {
	
	[self setPickerViewDataSource:nil];
	[self setPickerViewDelegate:nil];

	
    JBSuperDealloc();
	
}

#pragma mark -
#pragma mark fields


// pickerViewDataSource
//id<UIPickerViewDataSource> _pickerViewDataSource;
//@property (nonatomic, retain) id<UIPickerViewDataSource> pickerViewDataSource;
@synthesize pickerViewDataSource = _pickerViewDataSource;


// pickerViewDelegate
//id<UIPickerViewDelegate> _pickerViewDelegate;
//@property (nonatomic, retain) id<UIPickerViewDelegate> pickerViewDelegate;
@synthesize pickerViewDelegate = _pickerViewDelegate;


@end
