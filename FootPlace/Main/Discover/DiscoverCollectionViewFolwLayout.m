//
//  DiscoverCollectionViewFolwLayout.m
//  FootPlace
//
//  Created by wangchengyuan on 15/11/2.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import "DiscoverCollectionViewFolwLayout.h"


@interface DiscoverCollectionViewFolwLayout ()


@property (nonatomic, assign) CGFloat itemSpacing;
@property (nonatomic, assign) CGFloat lineSpacing;
@property (nonatomic, assign) CGFloat sectionSpacing;
@property (nonatomic, assign) CGSize collectionViewSize;
@property (nonatomic, assign) UIEdgeInsets insets;
@property (nonatomic, assign) CGSize largeCellSize;
@property (nonatomic, assign) CGSize smallCellSize;
@property (nonatomic, strong) NSMutableArray *largeCellSizeArray;
@property (nonatomic, strong) NSMutableArray *smallCellSizeArray;
@end

@implementation DiscoverCollectionViewFolwLayout

-(id)init {
    self = [super init];
    if (self) {
        _itemSpacing = 10;
        
        _lineSpacing = 10;
        
        _sectionSpacing = 10;
        _collectionViewSize = CGSizeMake(KScreenWidth, KScreenHeigth);
        
        _insets = UIEdgeInsetsMake(5, 10, 5, 10);
      
    }
    return self;
}

// 刷新布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds {
    return YES;
}



-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat largeCellWidth = (2 * (_collectionViewSize.width -_insets.left-_insets.right -  _itemSpacing)) / 3;
    
    
    CGFloat smallCellWidth = largeCellWidth / 2;
    
    _largeCellSize = CGSizeMake(largeCellWidth, largeCellWidth * 1.2);
    _smallCellSize = CGSizeMake(smallCellWidth, smallCellWidth * 1.2-5);
    
    if (!_largeCellSizeArray) {
        _largeCellSizeArray = [NSMutableArray array];
    }
    if (!_smallCellSizeArray) {
        _smallCellSizeArray = [NSMutableArray array];
    }
    
    _largeCellSizeArray[indexPath.section] = [NSValue valueWithCGSize:_largeCellSize];
    _smallCellSizeArray[indexPath.section] = [NSValue valueWithCGSize:_smallCellSize];
    
    CGFloat sectionHeight = 0;
    
    for (NSInteger i = 0; i <= indexPath.section - 1; i++) {
        
        NSInteger cellsCount = [self.collectionView numberOfItemsInSection:i];
        CGFloat largeCellHeight = [_largeCellSizeArray[i] CGSizeValue].height;
        CGFloat smallCellHeight = [_smallCellSizeArray[i] CGSizeValue].height;
        NSInteger lines = cellsCount / 3;
        
        sectionHeight += lines * (_lineSpacing + largeCellHeight) + _sectionSpacing;
        
        if ((cellsCount - 1) % 3 == 0 && (cellsCount - 1) % 6 != 0) {
            sectionHeight -= smallCellHeight + _itemSpacing;
        }
        
    }
    if (sectionHeight > 0) {
        sectionHeight -= _lineSpacing;
    }
    
    NSInteger lines = indexPath.item / 3;
    
    CGFloat lineSpaceForIndexPath =  _lineSpacing * lines;
    
    CGFloat LinesOffY = _largeCellSize.height * lines + sectionHeight + lineSpaceForIndexPath + _insets.top ;
    
    CGFloat rightSideLargeCellOffX = _collectionViewSize.width - _largeCellSize.width - _insets.right;
    CGFloat rightSideSmallCellOffX = _collectionViewSize.width - _smallCellSize.width - _insets.right;
    
    if (indexPath.item % 6 == 0) {
        attributes.frame = CGRectMake(_insets.left,LinesOffY, _largeCellSize.width,_largeCellSize.height);
    }
    else if ((indexPath.item + 1) % 6 == 0) {
        attributes.frame = CGRectMake(rightSideLargeCellOffX, LinesOffY, _largeCellSize.width, _largeCellSize.height);
    }
    else if (lines %2 == 0){
        if (indexPath.item % 2 != 0) {
            attributes.frame = CGRectMake(rightSideSmallCellOffX, LinesOffY, _smallCellSize.width, _smallCellSize.height);
        }
        else if (indexPath.item % 2 == 0){
            
            attributes.frame = CGRectMake(rightSideSmallCellOffX,LinesOffY + _smallCellSize.height + _lineSpacing, _smallCellSize.width, _smallCellSize.height);
        }
    }else {
        if (indexPath.item % 2 != 0) {
            attributes.frame = CGRectMake(_insets.left, LinesOffY, _smallCellSize.width, _smallCellSize.height);
        }else {
            attributes.frame =CGRectMake(_insets.left, LinesOffY + _smallCellSize.height + _itemSpacing, _smallCellSize.width, _smallCellSize.height);
        }
        
    }
    return attributes;
    
}
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
  
    NSMutableArray *attributesArray = [NSMutableArray array];
    
    for (NSInteger i = 0; i < self.collectionView.numberOfSections; i++) {
        NSInteger numberOfCellsInSection = [self.collectionView numberOfItemsInSection:i];
        for (NSInteger j = 0; j < numberOfCellsInSection; j++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:j inSection:i];
            UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
            if (CGRectIntersectsRect(rect, attributes.frame)) {
                [attributesArray addObject:attributes];
            }
        }
    }
    return  attributesArray;
}

- (CGSize)collectionViewContentSize
{
    CGSize contentSize = CGSizeMake(_collectionViewSize.width, 0);
    for (NSInteger i = 0; i < self.collectionView.numberOfSections; i++) {
        NSInteger numberOfLines = ceil((CGFloat)[self.collectionView numberOfItemsInSection:i] / 3.f);
        CGFloat lineHeight = numberOfLines * ([_largeCellSizeArray[i] CGSizeValue].height + _lineSpacing) - _lineSpacing;
        contentSize.height += lineHeight;
    }
    contentSize.height += _insets.top + _insets.bottom + _sectionSpacing * (self.collectionView.numberOfSections - 1);
    NSInteger numberOfItemsInLastSection = [self.collectionView numberOfItemsInSection:self.collectionView.numberOfSections - 1];
    if ((numberOfItemsInLastSection - 1) % 3 == 0 && (numberOfItemsInLastSection - 1) % 6 != 0) {
        contentSize.height -= [_smallCellSizeArray[self.collectionView.numberOfSections - 1] CGSizeValue].height + _itemSpacing;
    }
    return contentSize;
}




@end
