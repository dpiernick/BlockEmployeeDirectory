## Build tools & versions used
Xcode 14.0 - iOS 15+.
This is intended to run on a iOS 15+ iPhone. It does run on an iPad but the UI was not designed specifically for it.

## Steps to run the app
1. Navigate to https://github.com/dpiernick/BlockEmployeeDirectory
2. Click "Code"
3. Click "Open in Xcode"
 - OR -
1. Open Xcode
2. Select "Clone an existing project" from the launch screen
3. Search for https://github.com/dpiernick/BlockEmployeeDirectory.git and click "Clone"
 - THEN -
4. Choose where to save the project
5. Click "Run"!

## What areas of the app did you focus on?
I mainly focused on building the UI and features in a way that showcases my passion for creating readable and reusable code.
I wanted both the UI, and the code behind it, to be clean and intuitive.

## What was the reason for your focus? What problems were you trying to solve?
I think a key aspect of developing features in a timely, predictable manner is the developer experience when interacting with legacy code.
You can create a genius algorithm to handle a task, but if it's not readable and changeable, or if the API is not simple enough to use, we're doing a disservice to developers that have to make modifications in the future.
An example of this would be my Utilities folder, as well as my ImageCache class, which in its primary "fetchImage" function, will automatically check the cache before fetching the image.

## How long did you spend on this project?
7-8 hours

## Did you make any trade-offs for this project? What would you have done differently with more time?
I added a filter feature and my original design was to have the selections drop down right below the filter button, but the scrollView was gobbling up any touch events I passed to the view.
I tried two other approaches and had to rebuild the feature from scratch 2 times before landing on the picker in the input view.
If I would have gotten this right on the first try I could have spent a little more time maybe tweaking the UI to look a little nicer.

## What do you think is the weakest part of your project?
I tend to use a MVC architecture pattern which in larger projects can sometimes lead to huge ViewControllers.  I'd like to learn more about other architecture patterns.

## Did you copy any code or dependencies? Please make sure to attribute them here!
I Googled/StackOverflow'd the occasional syntax question or reminder on how to do a process (ex: I haven't built a brand new network call from scratch in a while).
However, I generally interpret what I find on those sites and restructure it / reword it / rebuild it to fit my needs. There was nothing copy pasted directly from Google/StackOverflow in this project.
All Utilities I wrote myself while either working on previous projects or as they came up in this project.

## Is there any other information you’d like us to know?
This was a really fun excercise and I appreciate the opportunity to work on this as opposed to strictly having a paired programming interview.
