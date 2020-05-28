desc "Delete the old stale codes"
task :delete_stale_codes => :environment do
  puts "Deleting stale codes..."
  DeleteOldCodesJob.perform_now
  puts "Done."
end
