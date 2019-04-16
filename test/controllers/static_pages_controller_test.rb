require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  
  def something #the book mentions the name to be "setup" and it mentioned it to be a special function i coudn't figure out why it was called a special function, maybe because it holds an instance variable that is used in test and we coudn't place it without defining  a function 
    @base_title ="Ruby on Rails Tutorial Sample App"
  end
  
  
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end
  
  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end 

end
