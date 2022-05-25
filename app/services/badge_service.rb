class BadgeService

  def initialize(test_completion)
    @test_completion = test_completion
    @test = @test_completion.test
    @user = @test_completion.user
  end

  def award(badge)
    @user.badges << badge
    @awarded = true
  end

  def call
    Badge.all.each do |badge|
      award(badge) if eligible?(badge)
    end
  end

  private

  def eligible?(badge)
    send("passed_#{badge.rule}_rule?", badge.rule_value)
  end

  def passed_all_in_level_rule?(level)
    @test_completion.success? && @user.tests.by_level(level).uniq.map(&:passed?).count == Tests.by_level(level).count
  end

  def passed_all_in_category_rule?(category)
    @test_completion.success? && @user.tests.by_category(category).uniq.map(&:passed?).count == Tests.by_category(category).count
  end

  def passed_first_time_rule?(_arg)
    @test_completion.success? && @user.test_completions.count { |x| x.test.title == @test.title } == 1
  end

end
