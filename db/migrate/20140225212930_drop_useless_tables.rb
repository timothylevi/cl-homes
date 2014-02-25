class DropUselessTables < ActiveRecord::Migration
  def change
    drop_table :community_posts
    drop_table :events_posts
    drop_table :gigs_posts
    drop_table :jobs_posts
    drop_table :personals_posts
    drop_table :sale_posts
    drop_table :services_posts
    drop_table :subcategories
    drop_table :watch_lists
    drop_table :watches
  end
end
