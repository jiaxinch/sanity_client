//
//  AmountCell.m
//  TableViewDynamicStaticCell
//
//  Created by Ruyin Shao on 10/15/17.
//  Copyright © 2017 isoftstone. All rights reserved.
//

#import "AmountCell.h"

@implementation AmountCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)dismissKeyboard:(id)sender {
    [_amountTF resignFirstResponder];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end