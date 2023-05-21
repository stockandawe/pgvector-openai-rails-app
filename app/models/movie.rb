class Movie < ApplicationRecord
    has_neighbors :embedding

    after_validation :generate_vector_embed

    def embed_input
        <<~EOS
          Title: #{title}
          Overview: #{overview}
          Tagline: #{tagline}
        EOS
      end

      private
      def generate_vector_embed
        # client = OpenAI::Client.new
        client = OpenAI::Client.new(access_token: ENV["OPENAI_SK"])
        response = client.embeddings(
          parameters: {
            model: "text-embedding-ada-002",
            input: embed_input,
          },
        )
        self.embedding = response.dig("data", 0, "embedding")
      end
    
  end
  