Feature: Activity List feature
  Background:
	Given My app is running
  		And I wait for the "MainActivity" screen to appear
  		And Web page is fully loaded
      And I press the "创建" button on the page
      And Web page is fully loaded

  Scenario: I can create an activity
    #Given I am on the page with header "创建活动"
    	And I enter "test" into input with id "activityName" on the page
    When I press the "创建" button on the page
    Then Web page is fully loaded
		And I see button with text "开始" on the page
