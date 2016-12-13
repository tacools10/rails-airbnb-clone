class CreateSubscribeToNewsletterServices < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribe_to_newsletter_services do |t|

      t.timestamps
    end
  end
end
