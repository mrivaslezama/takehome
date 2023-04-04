require "application_system_test_case"

class ConnectionsTest < ApplicationSystemTestCase
  setup do
    @connection = connections(:one)
  end

  test "visiting the index" do
    visit connections_url
    assert_selector "h1", text: "Connections"
  end

  test "should create connection" do
    visit connections_url
    click_on "New connection"

    fill_in "Description", with: @connection.description
    fill_in "Origin", with: @connection.origin
    fill_in "Tag", with: @connection.tag
    fill_in "Type", with: @connection.type
    click_on "Create Connection"

    assert_text "Connection was successfully created"
    click_on "Back"
  end

  test "should update Connection" do
    visit connection_url(@connection)
    click_on "Edit this connection", match: :first

    fill_in "Description", with: @connection.description
    fill_in "Origin", with: @connection.origin
    fill_in "Tag", with: @connection.tag
    fill_in "Type", with: @connection.type
    click_on "Update Connection"

    assert_text "Connection was successfully updated"
    click_on "Back"
  end

  test "should destroy Connection" do
    visit connection_url(@connection)
    click_on "Destroy this connection", match: :first

    assert_text "Connection was successfully destroyed"
  end
end
