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
    @user.tests.by_level(level).uniq.map(&:passed?).count == Tests.by_level(level).count
  end

  def passed_all_in_category_rule?(category)
    @user.tests.by_category(category).uniq.map(&:passed?).count == Tests.by_category(category).count
  end

  def passed_first_time_rule?(title)
    @user.test_completions.count { |x| x.test.title == title } == 1
  end

end
