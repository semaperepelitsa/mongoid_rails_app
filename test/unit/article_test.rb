require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def test_order
    Article.delete_all
    a = Article.create!(title: "A")
    c = Article.create!(title: "C")
    b = Article.create!(title: "B")
    assert_equal Article.asc(:title).to_a, [a, b, c]
    assert_equal Article.desc(:title).to_a, [c, b, a]
  end
end

class CommentTest < ActiveSupport::TestCase
  def setup
    @article = Article.new
    @a = @article.comments.build(title: "A")
    @c = @article.comments.build(title: "C")
    @b = @article.comments.build(title: "B")
    @article.save!
  end

  def test_order
    assert_equal @article.comments.asc(:title).to_a,  [@a, @b, @c]
    assert_equal @article.comments.desc(:title).to_a, [@c, @b, @a]
  end

  def test_order_after_reload
    @article = Article.find(@article.id)
    assert_equal @article.comments.asc(:title).to_a,  [@a, @b, @c]
    assert_equal @article.comments.desc(:title).to_a, [@c, @b, @a]
  end
end

