require "test_helper"

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  setup { @property = properties(:one) }

  test "should get index" do
    get properties_url
    assert_response :success
  end

  test "should get new" do
    get new_property_url
    assert_response :success
  end

  test "should create property" do
    assert_difference("Property.count") do
      post properties_url,
           params: {
             property: {
               address: @property.address,
               bathrooms: @property.bathrooms,
               name: @property.name,
               price: @property.price,
               rooms: @property.rooms,
               square_meters: @property.square_meters
             }
           }
    end

    assert_redirected_to property_url(Property.last)
  end

  test "should show property" do
    get property_url(@property)
    assert_response :success
  end

  test "should get edit" do
    get edit_property_url(@property)
    assert_response :success
  end

  test "should update property" do
    patch property_url(@property),
          params: {
            property: {
              address: @property.address,
              bathrooms: @property.bathrooms,
              name: @property.name,
              price: @property.price,
              rooms: @property.rooms,
              square_meters: @property.square_meters
            }
          }
    assert_redirected_to property_url(@property)
  end

  test "should destroy property" do
    assert_difference("Property.count", -1) { delete property_url(@property) }

    assert_redirected_to properties_url
  end
end
