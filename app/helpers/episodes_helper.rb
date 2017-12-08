module EpisodesHelper
  def document_path(episode, event)
    if event.category == "appointment"
      episode_appointment_documents_path(episode, event)
    else
      episode_note_documents_path(episode, event)
    end
  end
end


