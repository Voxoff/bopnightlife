class DeleteOldCodesJob < ApplicationJob
  queue_as :default

  def perform
    Code.stale.delete_all
  end
end
