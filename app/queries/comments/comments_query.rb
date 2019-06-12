# frozen_string_literal: true

module Comments
  class CommentsQuery
    def self.find_comment(id, relation: Comment)
      relation.find(id) unless id.nil?
    end

    def self.find_commentable(request)
      resource, id = request.path.split('/')[1, 2]
      resource.singularize.classify.constantize.find(id)
    end
  end
end
