//
//  CollectionNodeFlowLayout.h
//  DeclarativeLayout_Texture
//
//  Created by 闫士伟 on 2018/6/29.
//  Copyright © 2018年 闫士伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectionNodeFlowLayoutInfo : NSObject

@property (nonatomic, assign, readonly) NSInteger numberOfColumns;
@property (nonatomic, assign, readonly) CGFloat headerHeight;
@property (nonatomic, assign, readonly) CGFloat columnSpacing;
@property (nonatomic, assign, readonly) UIEdgeInsets sectionInsets;
@property (nonatomic, assign, readonly) UIEdgeInsets interItemSpacing;

- (instancetype)initWithNumberOfColumns:(NSInteger)numberOfColumns
                           headerHeight:(CGFloat)headerHeight
                          columnSpacing:(CGFloat)columnSpacing
                          sectionInsets:(UIEdgeInsets)sectionInsets
                       interItemSpacing:(UIEdgeInsets)interItemSpacing NS_DESIGNATED_INITIALIZER;

- (instancetype)init __unavailable;

@end

@interface CollectionNodeFlowLayout : NSObject <ASCollectionLayoutDelegate>

- (instancetype)initWithNumberOfColumns:(NSInteger)numberOfColumns headerHeight:(CGFloat)headerHeight;



@end
