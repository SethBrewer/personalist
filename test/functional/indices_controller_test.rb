require 'test_helper'

class IndicesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:indices)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_index
    assert_difference('Index.count') do
      post :create, :index => { }
    end

    assert_redirected_to index_path(assigns(:index))
  end

  def test_should_show_index
    get :show, :id => indices(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => indices(:one).id
    assert_response :success
  end

  def test_should_update_index
    put :update, :id => indices(:one).id, :index => { }
    assert_redirected_to index_path(assigns(:index))
  end

  def test_should_destroy_index
    assert_difference('Index.count', -1) do
      delete :destroy, :id => indices(:one).id
    end

    assert_redirected_to indices_path
  end
end
