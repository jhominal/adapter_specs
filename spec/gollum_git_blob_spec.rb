require 'spec_helper'

describe Gollum::Git::Blob do
  before(:each) do
    @repo = Gollum::Git::Repo.new(fixture('dot_bare_git'), :is_bare => true)
    @blob = @repo.head.commit.tree.blobs.first
  end

  it "should have a create method that returns a Gollum::Git::Blob" do
    Gollum::Git::Blob.should respond_to(:create).with(2).arguments
    Gollum::Git::Blob.create(@repo, {}).should be_a Gollum::Git::Blob
  end
  
  it "should have a data method" do
    @blob.should respond_to(:data)
  end
  
  it "should have a mime-type method" do
    @blob.should respond_to(:mime_type)
  end
  
  it "should have a name" do
    @blob.should respond_to(:name)
  end

  it "should have an extension for symlinks" do
    @blob.should respond_to(:is_symlink)
    @blob.should respond_to(:symlink_target).with(1).argument
  end
end