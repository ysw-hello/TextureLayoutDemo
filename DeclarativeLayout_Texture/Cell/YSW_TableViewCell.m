//
//  YSW_TableViewCell.m
//  DeclarativeLayout_Texture
//
//  Created by 闫士伟 on 2018/6/28.
//  Copyright © 2018年 闫士伟. All rights reserved.
//

#import "YSW_TableViewCell.h"

@implementation YSW_TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)updateWithTitle:(NSString *)title desc:(NSString *)desc {
    self.title.text = title?:@"--";
    self.descriptionLabel.text = desc?:@"--";
}


@end
