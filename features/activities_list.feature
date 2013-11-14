Feature: Activites List feature
  Background:
	Given My app is running
  		And I wait for the "MainActivity" screen to appear
  		And Web page is fully loaded

  Scenario: I can see the list page
    Then I am on the page with header "活动列表"
    	And I see button with text "创建" on the page

  Scenario: I can see create activity page
  	Given I am on the page with header "活动列表"
    When I press the "创建" button on the page
    Then Web page is fully loaded
    	#And I am on the page with header "创建活动"
    	And I see button with text "创建" on the page
    	And I see button with text "返回" on the page
    	And I see "活动名称" on the page
    	And I see input with id "activityName" on the page
