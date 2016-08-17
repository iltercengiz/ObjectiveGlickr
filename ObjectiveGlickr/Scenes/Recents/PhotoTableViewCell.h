//
//  PhotoTableViewCell.h
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 17/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kDefaultPhotoCellHeight 220.0

@interface PhotoTableViewCell : UITableViewCell

- (void)configureWithPhoto:(Photo *)photo;

@end
