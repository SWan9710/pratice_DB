from rest_framework import serializers
from .models import Article, Comment


class CommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = '__all__'
        read_only_fields = ('article',)

    def to_representation(self, instance):
        rep = super().to_representation(instance)
        rep.pop('article', None)
        return rep


class ArticleListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Article
        fields = ('id', 'title', 'content')


class ArticleDetailSerializer(ArticleListSerializer):
    # comments = serializers.PrimaryKeyRelatedField(many=True, read_only=True)
    comments = CommentSerializer(many=True, read_only=True)
    comment_count = serializers.IntegerField(source='comments.count', read_only=True)

    class Meta(ArticleListSerializer.Meta):        
        fields = ArticleListSerializer.Meta.fields + (
            'comments',
            'comment_count',
        )

    def to_representation(self, instance):
        rep = super().to_representation(instance)
        rep['comments'] = rep.pop('comments', [])
        return rep


# 하나의 serializer 안에 또 다른 serializer가 들어있다면 
# Nested relationships 라고한다.