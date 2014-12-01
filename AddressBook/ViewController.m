//
//  ViewController.m
//  AddressBook
//
//  Created by Danil Nikiforov on 27.11.14.
//  Copyright (c) 2014 Danil. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "DetailViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) AFHTTPRequestOperationManager* client;
@property (nonatomic, strong) NSArray* people;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.people = [NSArray new];
    self.client = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://localhost:8080"]];
    [self refreshData];
}

- (void)refreshData {
    [self.client GET:@"ServerAPI/users" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"people: %@", responseObject);
        self.people = [responseObject objectForKey:@"users"];
        [self.tableView reloadData];
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error: %@", error);
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.people.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    cell.textLabel.text = [(self.people)[(NSUInteger) indexPath.row] objectForKey:@"first_name"];

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailsPush"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *destViewController = segue.destinationViewController;
        destViewController.user = [self.people objectAtIndex:indexPath.row];
    }
}
@end
