require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "пример приложения Ruby on Rails Tutorial"
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Главная | #{@base_title}"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Помощь | #{@base_title}"
  end

  test "should get about" do
  	get about_path
  	assert_response :success
    assert_select "title", "О программе | #{@base_title}"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Контакты | #{@base_title}"
  end

end
