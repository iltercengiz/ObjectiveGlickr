//
//  UserTableViewCell.h
//  ObjectiveGlickr
//
//  Created by Ilter Cengiz on 17/08/16.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserTableViewCell : UITableViewCell

- (void)configureWithUserName:(NSString *)userName nsid:(NSString *)nsid;

@end
