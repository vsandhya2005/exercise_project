Feature: Verify all values in Problem#1

  Background:
    Given I am on the validation page


  # Assumption made to exclude Total Balance field from values
  Scenario: Verify the right number of values appear on the screen
    When I look for the number of values
    Then I should be able to see the following "5" values
      | Value 1 |
      | Value 2 |
      | Value 3 |
      | Value 4 |
      | Value 5 |

  Scenario: Verify the values are greater than 0
    When I look for values
    Then I should see all values are greater than zero

  Scenario: Verify the total balance
    When I capture the total balance
    And I sum up the individual values on the screen
    Then the total balance should match the sum of the individual values

   # If the total balance matches the sum of individual values then the test passes successfully but as per the screenshot in the problem, this test fails
   # displaying the below error message "Total balance displayed on the screen do not match the sum of individual values on the screen"

  Scenario: Verify the values are formatted as currency
    When I capture the values on the screen
    Then I should see dollar sign in front of all values






