class FixCrossStree < ActiveRecord::Migration
  def change
    remove_column :community_posts, :cross_stree
    remove_column :events_posts, :cross_stree
    remove_column :personals_posts, :cross_stree
    remove_column :housing_posts, :cross_stree
    remove_column :services_posts, :cross_stree
    remove_column :sale_posts, :cross_stree
    remove_column :jobs_posts, :cross_stree
    remove_column :gigs_posts, :cross_stree
    
    add_column :community_posts, :cross_street, :string
    add_column :events_posts, :cross_street, :string
    add_column :personals_posts, :cross_street, :string
    add_column :housing_posts, :cross_street, :string
    add_column :services_posts, :cross_street, :string
    add_column :sale_posts, :cross_street, :string
    add_column :jobs_posts, :cross_street, :string
    add_column :gigs_posts, :cross_street, :string
    
  end
end
