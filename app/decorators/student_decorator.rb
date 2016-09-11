class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
  	subject_item_notes = self.subject_item_notes.where(subject_item_id: subject_item.id)
  	return "0.00" if subject_item_notes.empty?
  	"%0.2f" % average_note(subject_item_notes)
  end

  private

  def average_note(subject_item_notes)
  	Float(subject_item_notes.map(&:value).sum) / Float(subject_item_notes.count)
  end
end
