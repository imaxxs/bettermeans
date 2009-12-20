class Issue < ActiveRecord::Base
  generator_for :subject, :method => :next_subject
  generator_for :author, :method => :next_author
  
  def self.next_subject
    @last_subject ||= 'Subject 0'
    @last_subject.succ!
    @last_subject
  end

  def self.next_author
    User.generate_with_protected!
  end

end

# == Schema Information
#
# Table name: issues
#
#  id               :integer         not null, primary key
#  tracker_id       :integer         default(0), not null
#  project_id       :integer         default(0), not null
#  subject          :string(255)     default(""), not null
#  description      :text
#  due_date         :date
#  category_id      :integer
#  status_id        :integer         default(0), not null
#  assigned_to_id   :integer
#  priority_id      :integer         default(0), not null
#  fixed_version_id :integer
#  author_id        :integer         default(0), not null
#  lock_version     :integer         default(0), not null
#  created_on       :datetime
#  updated_on       :datetime
#  start_date       :date
#  done_ratio       :integer         default(0), not null
#  estimated_hours  :float
#  expected_date    :date
#
