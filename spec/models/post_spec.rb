require 'spec_helper'
require 'pry'

describe Post do
  let(:post) { create(:post) }
  let!(:comment) { create(:comment, post: post) }
  let(:comments) { post.comments }

  context "when adding comments via association" do
    it "evaluates .size correctly when the relation contents have not been evaluated" do
      comments.size.should == 1
      comments.create(body: 'Another interesting comment')
      comments.size.should == 2
    end
    it "evaluates .size correctly when the relation contents have been evaluated" do
      comments.size.should == 1
      x = [ ] + comments
      comments.create(body: 'Another interesting comment')
      comments.size.should == 2
    end
  end

  context "when adding comments manually" do
    it "evaluates .size correctly when the relation contents have not been evaluated" do
      comments.size.should == 1
      Comment.create(post: post, body: 'Another interesting comment')
      comments.size.should == 2
    end
    it "evaluates .size incorrectly when the relation contents have been evaluated" do
      comments.size.should == 1
      x = [ ] + comments
      Comment.create(post: post, body: 'Another interesting comment')
      comments.size.should == 1
    end
    it "evaluates .size correctly when the relation contents have been evaluated and reload is called" do
      comments.size.should == 1
      x = [ ] + comments
      Comment.create(post: post, body: 'Another interesting comment')
      comments.reload.size.should == 2
    end
  end
end
