// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import <Foundation/Foundation.h>

@interface BABarButtonItemView : UIView {
    
    
    // blockAdapters
    NSMutableArray* _blockAdapters;
    //@property (nonatomic, retain) NSMutableArray* blockAdapters;
    //@synthesize blockAdapters = _blockAdapters;

    
    // standard
    UIBarButtonItem* _standard;
    //@property (nonatomic, retain) IBOutlet UIBarButtonItem* standard;
    //@synthesize standard = _standard;
    
    // block
    UIBarButtonItem* _block;
    //@property (nonatomic, retain) IBOutlet UIBarButtonItem* block;
    //@synthesize block = _block;
    
    // asyncBlock
    UIBarButtonItem* _asyncBlock;
    //@property (nonatomic, retain) IBOutlet UIBarButtonItem* asyncBlock;
    //@synthesize asyncBlock = _asyncBlock;

}

-(void)addAdapter:(id)adapter;



#pragma mark -
#pragma mark fields

// standard
//UIBarButtonItem* _standard;
@property (nonatomic, retain) IBOutlet UIBarButtonItem* standard;
//@synthesize standard = _standard;


// block
//UIBarButtonItem* _block;
@property (nonatomic, retain) IBOutlet UIBarButtonItem* block;
//@synthesize block = _block;

// asyncBlock
//UIBarButtonItem* _asyncBlock;
@property (nonatomic, retain) IBOutlet UIBarButtonItem* asyncBlock;
//@synthesize asyncBlock = _asyncBlock;

@end
