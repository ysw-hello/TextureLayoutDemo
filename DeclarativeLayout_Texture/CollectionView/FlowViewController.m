//
//  FlowViewController.m
//  DeclarativeLayout_Texture
//
//  Created by 闫士伟 on 2018/6/29.
//  Copyright © 2018年 闫士伟. All rights reserved.
//

#import "FlowViewController.h"
#import <AsyncDisplayKit/ASCollectionNode+Beta.h>


#import "CollectionNodeFlowLayout.h"
#import "CollectionCellNode.h"

#import "CollectionViewCell.h"

@interface FlowViewController ()

@end

@implementation FlowViewController

#pragma mark - life cycle

- (instancetype)init {
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -


@end
