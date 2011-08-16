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
	
	NSLog(@"Button pressed!");
	
	[self startCameraControllerFromViewController:self usingDelegate:self];
	
	/*

    //NSLog(@"Button Pressed!");
    self.name = textInput.text;
    
    NSString *nameString = self.name;
    if ([nameString length] == 0) {
        nameString = @"ma";
    }
    
    NSString *greeting = [[NSString alloc] initWithFormat:@"Hello, %@!", nameString];
    label.text = greeting;
    [greeting release];
	 */
}



- (BOOL) startCameraControllerFromViewController: (UIViewController*) controller

								   usingDelegate: (id <UINavigationControllerDelegate,
                                                   UIImagePickerControllerDelegate>) delegate {
	
    if (([UIImagePickerController isSourceTypeAvailable:
		  
		  UIImagePickerControllerSourceTypeCamera] == NO)
		
		|| (delegate == nil)
		
		|| (controller == nil))
		
        return NO;
	

    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
	
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
	
	cameraUI.cameraFlashMode = UIImagePickerControllerCameraFlashModeAuto;
	
    // Displays controls for video
	cameraUI.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
	
	
	// Hides the controls for moving & scaling pictures, or for
	
    // trimming movies. To instead show the controls, use YES.
	
    cameraUI.allowsEditing = NO;
	
	cameraUI.delegate = delegate;
	
	// show camera ui
	[controller presentModalViewController: cameraUI animated: YES];
	
    return YES;
	
}

// For responding to the user tapping Cancel.

- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker {
	
	// remove from view
    [[picker parentViewController] dismissModalViewControllerAnimated: YES];
	
    [picker release];
	
}



// For responding to the user accepting a newly-captured picture or movie

- (void) imagePickerController: (UIImagePickerController *) picker didFinishPickingMediaWithInfo: (NSDictionary *) info {
	
	
	NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
	
    UIImage *originalImage, *editedImage, *imageToSave;
	
    // Handle a still image capture
	
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0)
		
		== kCFCompareEqualTo) {
		
		
		
        editedImage = (UIImage *) [info objectForKey:
								   
								   UIImagePickerControllerEditedImage];
		
        originalImage = (UIImage *) [info objectForKey:
									 
									 UIImagePickerControllerOriginalImage];
		
		
		
        if (editedImage) {
			
            imageToSave = editedImage;
			
        } else {
			
            imageToSave = originalImage;
			
        }
		
		
		
		// Save the new image (original or edited) to the Camera Roll
        UIImageWriteToSavedPhotosAlbum (imageToSave, nil, nil , nil);
		
    }
	
	
	
    // Handle a movie capture
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeMovie, 0) == kCFCompareEqualTo) {

        NSString *moviePath = [[info objectForKey:UIImagePickerControllerMediaURL] path];
		
		// save in photo album
        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum (moviePath)) {
			
            UISaveVideoAtPathToSavedPhotosAlbum (moviePath, nil, nil, nil);
		}
		
		// @TODO
		// upload to page
    }
	
	// hide camera ui
    [[picker parentViewController] dismissModalViewControllerAnimated: YES];
    [picker release];
	
}



@end


