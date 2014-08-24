//
//  SettingTableViewController.m
//  countdown
//
//  Created by JackRex on 5/25/14.
//  Copyright (c) 2014 JackRex. All rights reserved.
//

#import "SettingTableViewController.h"
#import "UMSocial.h"
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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"row is %d,section is %d",indexPath.row,indexPath.section);
    
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
                    
                    [UMSocialSnsService presentSnsIconSheetView:self
                                                         appKey:@"534114c256240b5a2f12abf2"
                                                      shareText:@"I am Such a Beautiful App  Time Drop  to recode My time, share it to you    https://itunes.apple.com/us/app/time+/id856824051?ls=1&mt=8 .  "
                                                     shareImage:[UIImage imageNamed:@"icon.png"]
                                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToFacebook,UMShareToTwitter,UMShareToInstagram,nil]
                                                       delegate:nil];
                    
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
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    
    
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
