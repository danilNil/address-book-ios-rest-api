//
// Created by Danil Nikiforov on 27.11.14.
// Copyright (c) 2014 Danil. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailViewController : UIViewController{

    __weak IBOutlet UILabel *userName;
}
@property(nonatomic, strong) NSDictionary * user;
@end