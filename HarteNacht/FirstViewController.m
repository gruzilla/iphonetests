//
//  FirstViewController.m
//  HarteNacht
//
//  Created by Matthias Steinböck on 09.08.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"


@implementation FirstViewController

@synthesize textInput;
@synthesize label;
@synthesize name;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload
{
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc
{
    [textInput release];
    [label release];
    [name release];
    [super dealloc];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if(theTextField == textInput) {
        [textInput resignFirstResponder];
    }
    return YES;
}

-(IBAction)buttonPressed:(id)sender {
    //NSLog(@"Button Pressed!");
    self.name = textInput.text;
    
    NSString *nameString = self.name;
    if ([nameString length] == 0) {
        nameString = @"ma";
    }
    
    NSString *greeting = [[NSString alloc] initWithFormat:@"Hello, %@!", nameString];
    label.text = greeting;
    [greeting release];
}


@end
