Given /^I am on exercise1 page$/ do
  visit(ValidationPage)
end


Given /^I am on the validation page$/ do
  visit(ValidationPage)
end

When /^I look for the number of values$/ do
  # readability purposes
end

Then /^I should be able to see the following "(.*)" values$/ do |number_of_elements, table|
  actual_elements = on(ValidationPage).verify_elements_present(table)
  expect(actual_elements).to eq(number_of_elements), "Actual number of elements #{actual_elements} do not match with the expected elements #{number_of_elements}"
end

When /^I look for values$/ do
  # readability purposes
end

Then /^I should see all values are greater than zero$/ do
  on(ValidationPage)
  expect((@current_page.text_1).to_i).to be > 0, "Value at text 1 is not greater than zero"
  expect((@current_page.text_2).to_i).to be > 0, "Value at text 2 is not greater than zero"
  expect((@current_page.text_4).to_i).to be > 0, "Value at text 4 is not greater than zero"
  expect((@current_page.text_5).to_i).to be > 0, "Value at text 5 is not greater than zero"
  expect((@current_page.text_6).to_i).to be > 0, "Value at text 6 is not greater than zero"
  expect((@current_page.total_balance).to_i).to be > 0, "Value at total is not greater than zero"
end

When /^I capture the values on the screen$/ do
  on(ValidationPage)
  @values = []
  @values << @current_page.text_1
  @values << @current_page.text_2
  @values << @current_page.text_4
  @values << @current_page.text_5
  @values << @current_page.text_6
end

Then /^I should see dollar sign in front of all values$/ do
  @values.each do |value|
    expect(value.start_with? "$").to be(true), "#{value} does not begin with $ symbol"
  end
end

When /^I capture the total balance$/ do
  @displayed_total_balance = @current_page.total_balance
end

And /^I sum up the individual values on the screen$/ do
  @actual_total_balance = @current_page.get_total_balance
end

Then /^the total balance should match the sum of the individual values$/ do
  expect(@displayed_total_balance.to_i).to eq(@actual_total_balance), "Total balance displayed on the screen do not match the sum of individual values on the screen"
end