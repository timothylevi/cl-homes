class AddContactColsToPosts < ActiveRecord::Migration
  def change
    remove_column :sale_posts, :contact_id
    remove_column :services_posts, :contact_id
    remove_column :personals_posts, :contact_id
    remove_column :events_posts, :contact_id
    remove_column :gigs_posts, :contact_id
    remove_column :housing_posts, :contact_id
    remove_column :community_posts, :contact_id
    remove_column :jobs_posts, :contact_id
    
    
    add_column :sale_posts, :contact_email, :string
    add_column :services_posts, :contact_email, :string
    add_column :personals_posts, :contact_email, :string
    add_column :events_posts, :contact_email, :string
    add_column :gigs_posts, :contact_email, :string
    add_column :housing_posts, :contact_email, :string
    add_column :community_posts, :contact_email, :string
    add_column :jobs_posts, :contact_email, :string
    
    
    add_column :sale_posts, :contact_phone, :string
    add_column :services_posts, :contact_phone, :string
    add_column :personals_posts, :contact_phone, :string
    add_column :events_posts, :contact_phone, :string
    add_column :gigs_posts, :contact_phone, :string
    add_column :housing_posts, :contact_phone, :string
    add_column :community_posts, :contact_phone, :string
    add_column :jobs_posts, :contact_phone, :string


    add_column :sale_posts, :contact_name, :string
    add_column :services_posts, :contact_name, :string
    add_column :personals_posts, :contact_name, :string
    add_column :events_posts, :contact_name, :string
    add_column :gigs_posts, :contact_name, :string
    add_column :housing_posts, :contact_name, :string
    add_column :community_posts, :contact_name, :string
    add_column :jobs_posts, :contact_name, :string
        
  end
end
