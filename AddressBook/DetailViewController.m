//
// Created by Danil Nikiforov on 27.11.14.
// Copyright (c) 2014 Danil. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController()
@property (weak, nonatomic) IBOutlet UILabel *userName;
@end


@implementation DetailViewController {
}

- (void)viewDidLoad {
    self.userName.text = [self.user objectForKey:@"first_name"];
}

@end