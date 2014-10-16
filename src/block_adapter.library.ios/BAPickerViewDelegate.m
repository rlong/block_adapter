//
//  BAPickerViewDelegate.m
//  block_adapter
//
//  Created by rlong on 5/12/2013.
//
//

#import "BAPickerViewDelegate.h"


#import "JBMemoryModel.h"

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface BAPickerViewDelegate ()

// titleForPicker
//baTitleForPicker _titleForPicker;
@property (nonatomic, copy) baTitleForPicker titleForPicker;
//@synthesize titleForPicker = _titleForPicker;

// pickerSelectedRow
//baPickerSelectedRow _pickerSelectedRow;
@property (nonatomic, copy) baPickerSelectedRow pickerSelectedRow;
//@synthesize pickerSelectedRow = _pickerSelectedRow;


@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -

@implementation BAPickerViewDelegate




+(BAPickerViewDelegate*)buildWithTitleForPicker:(baTitleForPicker)titleForPicker pickerSelectedRow:(baPickerSelectedRow)pickerSelectedRow {
    
    BAPickerViewDelegate* answer = [[BAPickerViewDelegate alloc] initWith:titleForPicker pickerSelectedRow:pickerSelectedRow];
    JBAutorelease( answer );
    
    return answer;
    
}


#pragma mark -
#pragma mark <UIPickerViewDelegate> implementation


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return _titleForPicker( pickerView, row, component );
    
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    _pickerSelectedRow( pickerView, row, component );
    
    
}



#pragma mark -
#pragma mark instance lifecycle


-(id)initWith:(baTitleForPicker)titleForPicker pickerSelectedRow:(baPickerSelectedRow)pickerSelectedRow {
    
    BAPickerViewDelegate* answer = [super init];
    
    if( nil != answer ) {
        
        [answer setTitleForPicker:titleForPicker];
        [answer setPickerSelectedRow:pickerSelectedRow];
        
    }
    
    return answer;
    
}

-(void)dealloc {
	
	[self setTitleForPicker:nil];
    [self setPickerSelectedRow:nil];

	JBSuperDealloc();
	
}


#pragma mark -
#pragma mark fields

// titleForPicker
//baTitleForPicker _titleForPicker;
//@property (nonatomic, copy) baTitleForPicker titleForPicker;
@synthesize titleForPicker = _titleForPicker;


// pickerSelectedRow
//baPickerSelectedRow _pickerSelectedRow;
//@property (nonatomic, copy) baPickerSelectedRow pickerSelectedRow;
@synthesize pickerSelectedRow = _pickerSelectedRow;



@end
