namespace :prudge do
  desc "Send release notification email to all users"
  task :release => :environment do
    User.all.each do |user|
      next unless user.email_valid?
      Notifier.release_notification(user).deliver
    end
  end
end