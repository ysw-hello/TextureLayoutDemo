//
//  FlowViewController.m
//  DeclarativeLayout_Texture
//
//  Created by 闫士伟 on 2018/6/29.
//  Copyright © 2018年 闫士伟. All rights reserved.
//

#import "FlowViewController.h"
#import "CollectionNodeFlowLayout.h"

#import "CollectionCellNode.h"
#import "CollectionViewCell.h"

static BOOL kShowUICollectionViewCells = YES;
static NSString *kReuseIdentifier = @"CollectionViewCell";
static NSUInteger kNumberOfImages = 14;


@interface FlowViewController () <ASCollectionDelegate, ASCollectionDataSourceInterop, ASCollectionViewLayoutInspecting> {
    NSMutableArray *_sections;
    ASCollectionNode *_collectionNode;
}

@end

@implementation FlowViewController

#pragma mark - life cycle

- (instancetype)init {
    CollectionNodeFlowLayout *flowLayout = [[CollectionNodeFlowLayout alloc] initWithNumberOfColumns:2 headerHeight:44.0];
    _collectionNode = [[ASCollectionNode alloc] initWithLayoutDelegate:flowLayout layoutFacilitator:nil];
    _collectionNode.dataSource = self;
    _collectionNode.delegate = self;
    _collectionNode.layoutInspector = self;
    
    if (!(self = [super initWithNode:_collectionNode])) {
        return nil;
    }
    
    _sections = [NSMutableArray array];
    [_sections addObject:[NSMutableArray array]];
    for (NSUInteger idx = 0, section = 0; idx < kNumberOfImages; idx++) {
        NSString *name = [NSString stringWithFormat:@"image_%lu.jpg", (unsigned long)idx];
        [_sections[section] addObject:[UIImage imageNamed:name]];
        if ((idx + 1) % 5 == 0 && idx < kNumberOfImages - 1) {
            section++;
            [_sections addObject:[NSMutableArray array]];
        }
    }
    
    [_collectionNode registerSupplementaryNodeOfKind:UICollectionElementKindSectionHeader];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [_collectionNode.view registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:kReuseIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private SEL
- (void)refreshData {
    [_collectionNode reloadData];
}

#pragma mark - ASCollectionNode DataSource
- (ASCellNodeBlock)collectionNode:(ASCollectionNode *)collectionNode nodeBlockForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (kShowUICollectionViewCells && indexPath.item % 3 == 1) {
        return nil;//设置数据源委托协议，返回nil，会自动调用UIKit cellForItemAtIndexPath: 方法，实现nodeCell与原生cell共存
    }
    
    UIImage *image = _sections[indexPath.section][indexPath.item];
    
    return ^{
        return [[CollectionCellNode alloc] initWithImage:image];
    };
}

- (NSInteger)collectionNode:(ASCollectionNode *)collectionNode numberOfItemsInSection:(NSInteger)section {
    return [_sections[section] count];
}

- (ASCellNode *)collectionNode:(ASCollectionNode *)collectionNode nodeForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName : [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline],
                                     NSForegroundColorAttributeName : [UIColor grayColor]
                                     };
    UIEdgeInsets textInsets = UIEdgeInsetsMake(11.0, 0, 11.0, 0);
    ASTextCellNode *textCellNode = [[ASTextCellNode alloc] initWithAttributes:textAttributes insets:textInsets];
    textCellNode.text = [NSString stringWithFormat:@"Section %zd", indexPath.section + 1];
    return textCellNode;
}

- (NSInteger)numberOfSectionsInCollectionNode:(ASCollectionNode *)collectionNode {
    return _sections.count;
}

//UICollectionViewCell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [_collectionNode.view dequeueReusableCellWithReuseIdentifier:kReuseIdentifier forIndexPath:indexPath];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


#pragma mark - ASCollectionViewLayoutInspecting
- (ASSizeRange)collectionView:(ASCollectionView *)collectionView constrainedSizeForNodeAtIndexPath:(NSIndexPath *)indexPath {
    return ASSizeRangeZero;
}
- (ASScrollDirection)scrollableDirections {
    return ASScrollDirectionVerticalDirections;
}
- (NSUInteger)collectionView:(ASCollectionView *)collectionView supplementaryNodesOfKind:(NSString *)kind inSection:(NSUInteger)section {
    return [kind isEqualToString:UICollectionElementKindSectionHeader] ? 1 : 0;
}



@end
