namespace :delete do
  desc 'Delete events older than 15 days'
  task :old_events => :environment do
    Event.where('endtime < ?', 15.days.ago).each do |model|
      model.destroy
    end

    # or Model.delete_all('created_at < ?', 60.days.ago) if you don't need callbacks
  end
end