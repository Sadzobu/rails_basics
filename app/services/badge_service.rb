class BadgeService

  def initialize(test_completion)
    @test_completion = test_completion
    @test = @test_completion.test
    @user = @test_completion.user
    @awarded_badges = []
  end

  def call
    award
    @awarded_badges
  end

  private

  def award
    Badge.all.each do |badge|
      @awarded_badges << badge if eligible?(badge)
    end
    @user.badges << @awarded_badges
  end

  def eligible?(badge)
    send("passed_#{badge.rule}_rule?", badge.rule_value)
  end

  def passed_all_in_level_rule?(level)
    number_of_tests_in_level = Test.by_level(level).count

    TestCompletion.where(passed: true)
                  .where(user_id: @user.id)
                  .joins(:test)
                  .where(tests: { level: level })
                  .uniq
                  .count == number_of_tests_in_level
  end

  def passed_all_in_category_rule?(category)
    number_of_tests_in_category = Test.by_category(category).count
    category_id = Category.find_by(title: category).id

    TestCompletion.where(passed: true)
                  .where(user_id: @user.id)
                  .joins(:test)
                  .where(tests: { category_id: category_id })
                  .uniq
                  .count == number_of_tests_in_category
  end

  def passed_first_time_rule?(id)
    TestCompletion.where(user_id: @user.id)
                  .joins(:test)
                  .where(tests: { id: id })
                  .count == 1
  end

end
