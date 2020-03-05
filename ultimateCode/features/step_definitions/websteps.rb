

require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

# Single-line step scoper
When /^(.*) within (.*[^:])$/ do |step, parent|
  with_scope(parent) { When step }
end

# Multi-line step scoper
When /^(.*) within (.*[^:]):$/ do |step, parent, table_or_string|
  with_scope(parent) { When "#{step}:", table_or_string }
end

# I am on UltimateCode home page
# I am on UltimateCode edit page
Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

# When I go to UltimateCode edit page
When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

# I press "New"
# I press "invite"
When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

# When I type "Hello, world!"
When /^(?:|I )type "([^"]*)"$/ do |word|
  find(:xpath, '//*[@id="textarea"]').click
  keyboard_enter_text("Hello, world!")
end

# I click "select"
When /^(?:|I )click "([^"]*)"$/ do |select|
  find(:xpath, '//*[@id="langSelect"]').click
end

# I choose a programming language: "Ruby"
When /^(?:|I )choose a programming language: "Ruby"$/ do |language|
  find(:xpath, '//*[@id="langSelect"]/option[14]').click
end

# I should see button: "New"
Then /^(?:|I )should see button: "([^"]*)"$/ do |button|
  if page.respond_to? :should
    page.should have_button(button)
  else
    assert page.have_button?(button)
  end
end


Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

# Then I should see "textarea", "iframe", "select"
Then /^(?:|I )should see "textarea", "iframe", "select"$/ do 

  if page.respond_to? :should
    page.should have_xpath('//*[@id="textarea"]')
    page.should have_xpath('//*[@id="frame_the_input"]')
    page.should have_xpath('//*[@id="langSelect"]')
  else
    assert page.have_xpath('//*[@id="textarea"]')
    assert page.have_xpath('//*[@id="frame_the_input"]')
    assert page.have_xpath('//*[@id="langSelect"]')
  end
end

# I should see "input"
Then /^(?:|I )should see "input"$/ do   

  if page.respond_to? :should
    page.should have_xpath('//*[@id="invite_url"]')
  else
    assert page.have_xpath('//*[@id="invite_url"]')
  end
end

# I should see "option"
Then /^(?:|I )should see "option"$/ do   

  if page.respond_to? :should
    page.should have_xpath('//*[@id="langSelect"]/option[1]')
  else
    assert page.have_xpath('//*[@id="langSelect"]/option[1]')
  end
end

# the "the_input" should contain "Hello, world!"
Then /^the "([^"]*)" field should contain "([^"]*)"$/ do |field, value|
  
  field = find_field(field)
  field_value = (field.tag_name == 'textarea') ? field.text : field.value
  if field_value.respond_to? :should
    field_value.should =~ /#{value}/
  else
    assert_match(/#{value}/, field_value)
  end
end

# I should see this programming language: "select", "Ruby"
Then /^(?:|I )should see this programming language: "([^"]*)", "([^"]*)"$/ do |regexp|

  if page.respond_to? :should
    page.should have_xpath('//*[@id="langSelect"]', :text => "Ruby")
  else
    assert page.has_xpath?('//*[@id="langSelect"]', :text => "Ruby")
  end
end

# I should be on UltimateCode edit page
Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Then /^show me the page$/ do
  save_and_open_page
end
