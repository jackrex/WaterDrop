//
//  SettingTableViewController.m
//  countdown
//
//  Created by JackRex on 5/25/14.
//  Copyright (c) 2014 JackRex. All rights reserved.
//

#import "SettingTableViewController.h"
@interface SettingTableViewController ()

@end

@implementation SettingTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)done:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.section) {
            case 0:
            switch (indexPath.row) {
                case 0:
                    [self appstore];
                    break;
                case 1:
                    [self openApp:@"https://itunes.apple.com/us/app/2048-flappy-2-flappy-2048!/id870049326?l=zh&ls=1&mt=8"];
                    break;
                case 2:
                    [self OpenMail];
                    break;
                default:
                    break;
            }
            break;
            case 1:
            switch (indexPath.row) {
                    case 0:
                    //TODO: share it
                    
                    break;
            }
            break;
    }
}

#pragma mark - share
- (NSString *)appUrl{
    return [NSString stringWithFormat:@"https://itunes.apple.com/us/app/time-drop-water-drop-timedrop/id856824051?l=zh&ls=1&mt=8"];
}

-(void)appstore{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[self appUrl]]];
}

-(void)openApp :(NSString *)url{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:url]];
}

#pragma mark -open mail

-(void)OpenMail{
    // Email Subject
    NSString *emailTitle = @"FeedBack ";
    // Email Content
    NSString *messageBody = @"<h1>I have some advise !</h1>";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"jackrex1993@gmail.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:YES];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
