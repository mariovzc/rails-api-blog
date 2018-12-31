class PostsSearchService
  def self.search(curr_posts, query)
    posts_ids = Rails.cache.fetch("post_search/#{query}", expires_in: 1.hour) do
      curr_posts.where("title like '%#{query}%'").map(&:id)
    end
    curr_posts.where(id: posts_ids)
  end
end