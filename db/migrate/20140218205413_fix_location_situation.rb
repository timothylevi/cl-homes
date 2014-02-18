class FixLocationSituation < ActiveRecord::Migration
  def change
    
    add_column :community_posts, :street, :string
    add_column :community_posts, :cross_stree, :string
    add_column :community_posts, :city, :string
    add_column :community_posts, :state, :string
    
    add_column :personals_posts, :street, :string
    add_column :personals_posts, :cross_stree, :string
    add_column :personals_posts, :city, :string
    add_column :personals_posts, :state, :string
    
    add_column :events_posts, :street, :string
    add_column :events_posts, :cross_stree, :string
    add_column :events_posts, :city, :string
    add_column :events_posts, :state, :string
    
    add_column :housing_posts, :street, :string
    add_column :housing_posts, :cross_stree, :string
    add_column :housing_posts, :city, :string
    add_column :housing_posts, :state, :string
    
    add_column :jobs_posts, :street, :string
    add_column :jobs_posts, :cross_stree, :string
    add_column :jobs_posts, :city, :string
    add_column :jobs_posts, :state, :string
    
    add_column :gigs_posts, :street, :string
    add_column :gigs_posts, :cross_stree, :string
    add_column :gigs_posts, :city, :string
    add_column :gigs_posts, :state, :string
    
    add_column :services_posts, :street, :string
    add_column :services_posts, :cross_stree, :string
    add_column :services_posts, :city, :string
    add_column :services_posts, :state, :string
    
    add_column :sale_posts, :street, :string
    add_column :sale_posts, :cross_stree, :string
    add_column :sale_posts, :city, :string
    add_column :sale_posts, :state, :string
    
    remove_column :sale_posts, :location_id
    remove_column :services_posts, :location_id
    remove_column :gigs_posts, :location_id
    remove_column :jobs_posts, :location_id
    remove_column :housing_posts, :location_id
    remove_column :events_posts, :location_id
    remove_column :personals_posts, :location_id
    remove_column :community_posts, :location_id
    
    
    
    
    
    
    
    
  end
end
