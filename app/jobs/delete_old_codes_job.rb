class DeleteOldCodesJob < ApplicationJob
  queue_as :default

  def perform
    puts "Destroying all stale codes"
    Code.stale.delete_all
  end
end
