class PostReport < Struct.new(:word_count, :word_histogram)

  def self.generate(post)
    PostReport.new(
      # word_count
      count_words(post),
      # word_histogram
      calculate_histogram(post)
    )
  end

  private

  def count_words(post)
    post.content.split.map { |word| word.gsub(/\W/, '') }.count
  end

  def calculate_histogram(post)
    (post
      .content
      .split
      .map { |word| word.gsub(/\W/, '') }
      .map(&:downcase)
      .group_by { |word| word }
      .transform_values(&:size))
  end
end
