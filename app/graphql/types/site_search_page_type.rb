module Types
  class SiteSearchPageType < Types::BaseObject
    field :aggs, SiteAggSectionType, null: false
    field :crowd_aggs, SiteAggSectionType, null: false

    def crowd_aggs
      object[:crowdAggs]
    end
  end
end
