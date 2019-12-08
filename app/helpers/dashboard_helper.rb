module DashboardHelper
  def statuses
    %i[published draft new rejected approved archived]
  end

  def transitions(adver, person)
    allowed = []
    allowed << 'send_to_moderation!' if adver.may_send_to_moderation?(person)
    allowed << 'reject!' if adver.may_reject?(person)
    allowed << 'approve!' if adver.may_approve?(person)
    allowed << 'draft_again!' if adver.may_draft_again?(person)

    allowed
  end
end
