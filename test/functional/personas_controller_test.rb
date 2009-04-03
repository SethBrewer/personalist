require 'test_helper'

class PersonasControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:personas)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_persona
    assert_difference('Persona.count') do
      post :create, :persona => { }
    end

    assert_redirected_to persona_path(assigns(:persona))
  end

  def test_should_show_persona
    get :show, :id => personas(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => personas(:one).id
    assert_response :success
  end

  def test_should_update_persona
    put :update, :id => personas(:one).id, :persona => { }
    assert_redirected_to persona_path(assigns(:persona))
  end

  def test_should_destroy_persona
    assert_difference('Persona.count', -1) do
      delete :destroy, :id => personas(:one).id
    end

    assert_redirected_to personas_path
  end
end
