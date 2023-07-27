//
//  ProductItemCell.h
//  SDKExample
//
//  Created by ESGame on 17/07/2023.
//

#import <UIKit/UIKit.h>
#import "Product.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProductItemCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbProductId;
@property (weak, nonatomic) IBOutlet UILabel *lbProductName;
@property (weak, nonatomic) IBOutlet UILabel *lbPrice;

@property(nonatomic, readwrite) Product * product;

- (void) bindData: (Product *) product;

@end

NS_ASSUME_NONNULL_END
