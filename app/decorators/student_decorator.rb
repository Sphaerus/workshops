class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
  	subject_item_notes = subject_item.subject_item_notes
  	return "0.00" if subject_item_notes.empty?
  	avg = Float(subject_item_notes.map(&:value).sum) / Float(subject_item_notes.count)
  	"%0.2f" % avg
  end
end
