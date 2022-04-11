module TestsHelper
  def test_header(test)
    if test.new_record?
      t('helper.create_test')
    else
      t('helper.edit_test')
    end
  end
end
