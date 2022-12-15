# frozen_string_literal: true

module Queries
  class Recipe < Base
    def initialize(scope = ::Recipe.all)
      super
      @scope = scope.extending(Scopes)
    end

    def call(filters, **_options)
      @scope
        .by_title(filters[:title])
        .by_time_range(filters[:min_time], filters[:max_time])
        .by_difficulty(filters[:difficulty])
    end

    module Scopes
      def by_title(title)
        return self if title.blank?

        # Notes
        # MySQL LIKE clause won't use index if the search keyword starts with no constant (e.g: %chicken%). So the options are:
        #   * Use wildcard only in the right side of the keyword: "chicken%"
        #   * Index the column using fulltext-search index
        #   * Or we can fully utilize a search engine like Elastic Search for all of our "search" functionalities
        #
        # But to keep things simple I will just use the first option in this code. We can discuss other options in details later on
        #

        where('LOWER(title) LIKE LOWER(?)', "#{title}%")
      end

      def by_time_range(min_seconds, max_seconds)
        return self if min_seconds.nil? || max_seconds.nil?

        # Notes:
        # Since #time is String, I assume, it is stored in the DB with the following format:
        # "HH:MM:SS"

        where('TIME_TO_SEC(time) BETWEEN ? AND ?', min_seconds.to_i, max_seconds.to_i)
      end

      def by_difficulty(difficulty)
        return self if difficulty.blank?

        where(difficulty: difficulties.fetch(difficulty, -1))
      end
    end
  end
end
