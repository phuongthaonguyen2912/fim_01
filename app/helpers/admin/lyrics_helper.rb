module Admin::LyricsHelper
  def status_field status
    case status
    when "waitting"
      label :status, t("helpers.admin.lyrics.waitting"),
        class: "label label-success"
    when "approve"
      label :status, t("helpers.admin.lyrics.approve"),
        class: "label label-info"
    else
      label :status, t("helpers.admin.lyrics.deny"),
        class: "label label-danger"
    end
  end
end
