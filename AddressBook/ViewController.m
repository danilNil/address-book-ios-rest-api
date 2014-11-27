//
//  ViewController.m
//  AddressBook
//
//  Created by Danil Nikiforov on 27.11.14.
//  Copyright (c) 2014 Danil. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) AFHTTPRequestOperationManager* client;
@property (nonatomic, strong) NSArray* people;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.client = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://localhost:3000"]];
    [self refreshData];
}

- (void)refreshData {
    [self.client GET:@"api/people" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"people: %@", responseObject);
        self.people = responseObject;
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error: %@", error);
    }];
}



@end
