//
//  ProductItemCell.m
//  SDKExample
//
//  Created by ESGame on 17/07/2023.
//

#import "ProductItemCell.h"
#import "Product.h"

@implementation ProductItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void) bindData: (Product *) product {
    self.lbPrice.text = product.price;
    self.lbProductId.text = product.productId;
    self.lbProductName.text = product.productName;
}


@end
