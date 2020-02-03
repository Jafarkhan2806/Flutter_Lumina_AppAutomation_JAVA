@SortingOfLocationsDisplayed            @Platform
Feature: Locations should be sorted in Alphanumeric order
As a user I want to verify if list of locations are sorted in Alphanumeric order

Background:
Given user launches and logs in to the Lyric Application
Then user should be displayed with the default location in Dashboard screen
And user creates the following "Locations" after login:
| Locations			|
| Home              |
| wld               |
| Wld1              |
| WLD2              |
| wld 3             |
| 12345             |
| WLD A             |
| S2                |
| S1                |
| S3                |
| S23               |
| S 21              |

@AlphaNumericSortingOfLocations			@Automated
Scenario:  Verify if order in which locations are displayed when tapped on location drop down
Given user selects "Location Drop Down Arrow" from "Dashboard" screen
Then list of "Locations" should be sorted in the following alphanumeric order when default location is selected:
| Locations			|
| 12345             |
| Home              |
| S 21              |
| S1                |
| S2                |
| S23               |
| S3                |
| wld               |
| wld 3             |
| WLD A             |
| Wld1              |
| WLD2              |


@AlphaNumericSortingOfLocationsBySelectingAnyLocation			@Automated
Scenario:  Verify if locations are sorted by alphanumeric order when user selects any location from location drop down
Given user selects "Location Drop Down Arrow" from "Dashboard" screen
Then list of "Locations" should be sorted in the following alphanumeric order when default location is selected:
| Locations			|
| 12345             |
| Home              |
| S 21              |
| S1                |
| S2                |
| S23               |
| S3                |
| wld               |
| wld 3             |
| WLD A             |
| Wld1              |
| WLD2              |
When user selects the following "Location" from the location drop down:
| Location		|
| wld			|
Then user should be displayed with the "Selected location in Dashboard" screen
When user selects "Location Drop Down Arrow" from "Dashboard" screen
Then list of "Locations" should be sorted in the following alphanumeric order when a location is selected:
| Locations		    |
| 12345             |
| Home              |
| S 21              |
| S1                |
| S2                |
| S23               |
| S3                |
| wld 3             |
| WLD A             |
| Wld1              |
| WLD2              |


@AlphaNumericSortingOfLocationsByDeletingExistingLocation			@Automated
Scenario:  Verify if locations are sorted by alphanumeric order when user deletes any location
Given user selects "Location Drop Down Arrow" from "Dashboard" screen
Then list of "Locations" should be sorted in the following alphanumeric order when default location is selected:
| Locations			|
| 12345             |
| Home              |
| S 21              |
| S1                |
| S2                |
| S23               |
| S3                |
| wld               |
| wld 3             |
| WLD A             |
| Wld1              |
| WLD2              |
When user selects the following "Location" from the location drop down:
| Location		|
| wld			|
Then user should be displayed with the "Selected location in Dashboard" screen
When user navigates to "Address" screen from the "Dashboard" screen
Then user should be displayed with the "Address" screen
When user deletes the existing location
Then user should be displayed with the default location in Dashboard screen
When user selects "Location Drop Down Arrow" from "Dashboard" screen
Then list of "Locations" should be sorted in the following alphanumeric order when default location is selected:
| Locations			|
| 12345             |
| Home              |
| S 21              |
| S1                |
| S2                |
| S23               |
| S3                |
| wld 3             |
| WLD A             |
| Wld1              |
| WLD2              |
When user creates the following "New Location":
| New Location	|
| wld			|
Then user should be displayed with the "Selected location in Dashboard" screen
When user selects "Location Drop Down Arrow" from "Dashboard" screen
Then list of "Locations" should be sorted in the following alphanumeric order when a location is selected:
| Locations		    |
| 12345             |
| Home              |
| S 21              |
| S1                |
| S2                |
| S23               |
| S3                |
| wld 3             |
| WLD A             |
| Wld1              |
| WLD2              |