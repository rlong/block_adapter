//
//  JBActionSheetView.h
//  jsonbroker.samples
//
//  Created by rlong on 17/05/13.
//
//

#import <Foundation/Foundation.h>

@interface BAActionSheetView : UIView {
    
    // blockAdapters
    NSMutableArray* _blockAdapters;
    //@property (nonatomic, retain) NSMutableArray* blockAdapters;
    //@synthesize blockAdapters = _blockAdapters;

    // toolbar
    UIToolbar* _toolbar;
    //@property (nonatomic, retain) IBOutlet UIToolbar* toolbar;
    //@synthesize toolbar = _toolbar;

    // blockActionSheet
    UIButton* _blockActionSheet;
    //@property (nonatomic, retain) IBOutlet UIButton* blockActionSheet;
    //@synthesize blockActionSheet = _blockActionSheet;

    
    // asyncBlockActionSheet
    UIButton* _asyncBlockActionSheet;
    //@property (nonatomic, retain) IBOutlet UIButton* asyncBlockActionSheet;
    //@synthesize asyncBlockActionSheet = _asyncBlockActionSheet;

}

-(void)addAdapter:(id)adapter;


#pragma mark -
#pragma mark fields

// toolbar
//UIToolbar* _toolbar;
@property (nonatomic, retain) IBOutlet UIToolbar* toolbar;
//@synthesize toolbar = _toolbar;

// blockActionSheet
//UIButton* _blockActionSheet;
@property (nonatomic, retain) IBOutlet UIButton* blockActionSheet;
//@synthesize blockActionSheet = _blockActionSheet;

// asyncBlockActionSheet
//UIButton* _asyncBlockActionSheet;
@property (nonatomic, retain) IBOutlet UIButton* asyncBlockActionSheet;
//@synthesize asyncBlockActionSheet = _asyncBlockActionSheet;

@end
