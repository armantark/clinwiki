class Milestone < AactRecord
  include BelongsToStudy

  belongs_to :result_group
end
