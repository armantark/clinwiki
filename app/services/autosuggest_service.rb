require 'autosuggest'
require_relative '../../config/initializers/function_words'

class AutosuggestService
  def initialize(word_start)
    # we might have to limit this to prefix matched words because right now we're just sending all the data to
    # the front end
    prefix = word_start
    top_queries = Hash[WordFrequency.where("name LIKE ?","#{prefix}%").pluck(:name, :frequency)]
    @autosuggest = Autosuggest.new(top_queries)
    @autosuggest.blacklist_words FUNCTION_WORDS
  end

  def words
    result = []
    @autosuggest.suggestions.each do |suggestion|
      puts suggestion
      unless suggestion.nil? or suggestion[:blacklisted]
        result.push Hash[suggestion[:query], suggestion[:score]]
      end
    end
    result
  end
end

