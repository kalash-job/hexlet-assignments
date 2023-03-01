# frozen_string_literal: true

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bulletins_path
    assert_response :success
    assert_select 'h1', 'Bulletins'
  end

  test "should get show for published" do
    bulletin = bulletins(:first_bulletin)
    get bulletin_path(bulletin)
    assert_response :success
    assert_select 'h1', bulletin.title
    assert_select 'p', bulletin.body
  end

  test "shouldn't get show for unpublished" do
    assert_raises(ActiveRecord::RecordNotFound) do
      get bulletin_path(bulletins(:third_bulletin))
    end
  end
end