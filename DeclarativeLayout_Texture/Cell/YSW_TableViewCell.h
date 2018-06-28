//
//  YSW_TableViewCell.h
//  DeclarativeLayout_Texture
//
//  Created by 闫士伟 on 2018/6/28.
//  Copyright © 2018年 闫士伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSW_TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

- (void)updateWithTitle:(NSString *)title desc:(NSString *)desc;

@end
