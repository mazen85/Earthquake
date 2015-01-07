Earthquake
==========
How to run the project:

Please launch the Earthquake.xcworkspace

Tools been used:

- CoreData
- Mogenerator
- MagicalRecord
- RestKit
- Static Library
- Autolayout
- Size Classes
- CocoaPods
- Storyboard

Project Structure: 

I have created static library for the API calls (EarthquakeAPIManager). This target has all the API calls for the project. Also I have used the target EarthquakeTests to write the unit tests for the API calls.

Utilities class has all the class methods that been used throughout the project, as it can be recycled for future projects. And created the Constants file, obviously for all the global constants… 

I have disabled ARC on most of the view controllers, apart from the ViewController class to maintain the constraints of the AutoLayout.
