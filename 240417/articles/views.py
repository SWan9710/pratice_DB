from django.shortcuts import render, get_object_or_404
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from .models import Article, Comment
from .serializers import ArticleListSerializer, CommentSerializer

# Create your views here.
@api_view(['GET','POST'])
def article_list(request):
    if request.method == 'GET':
        articles = Article.objects.all()
        serializer = ArticleListSerializer(articles, many=True)
        return Response(serializer.data)
    
    # 수정사항
    elif request.method == 'POST':
        serializer = ArticleListSerializer(data=request.data)
        if serializer.is_valid(raise_exception=True):
            serializer.save()
            # status = 201 로 써도 되는데 코드 가독성을 위해 아래와 같이 작성
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        # 아무것도 없는 빈 객체를 반환해도 된다.
        # return Response({}) >> 개발할때 협업하는 사람들과 조율해서 작성
        # is_valid에 옵션으로 raise_exception=True 적어주면 아래 코드 작성할 필요 없음
        # return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET','DELETE','PUT'])
def article_detail(request, article_pk):
    # article = Article.objects.get(pk=article_pk)
    article = get_object_or_404(Article, pk=article_pk)

    if request.method == 'GET':
        serializer = ArticleListSerializer(article)
        return Response(serializer.data)
    
    elif request.method == 'DELETE':
        article.delete()
        # status = 200 으로줘도 상관없음
        # 이부분은 모두 클라이언트 개발자와 협업하고 조율하며 작성
        return Response(status=status.HTTP_204_NO_CONTENT)
    
    # 수정시 필요한 작업
    # 1. 기존 인스턴스 가져오기
    # 2. 새로운 data 만들기
    # 3. 새로운 data를 기존 인스턴스에 넣고 저장하면 됨
    elif request.method == 'PUT':
        serializer = ArticleListSerializer(article, data=request.data)
        if serializer.is_valid(raise_exception=True):
            serializer.save()
            # status 코드는 생략하면 200을 반환
            return Response(serializer.data)


@api_view(['GET','POST'])
def comment_list(request, article_pk):
    article = get_object_or_404(Article, pk=article_pk)

    if request.method == 'POST':
        # article = Article.objects.get(pk = article_pk)
        serializer = CommentSerializer(data=request.data)
        if serializer.is_valid(raise_exception=True):
            serializer.save(article=article)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        
    elif request.method == 'GET':
        comments = article.comments.all()
        serializer = CommentSerializer(comments, many=True)
        return Response(serializer.data)
    

@api_view(['GET','POST','DELETE'])
def comment_detail(request, comment_pk):
    # comment = Comment.objects.get(pk = comment_pk)
    comment = get_object_or_404(Comment, pk=comment_pk)  
    if request.method == 'GET':
        serializer = CommentSerializer(comment)
        return Response(serializer.data)

    elif request.method == 'DELETE':
        comment.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    
    elif request.method == 'PUT':
        serializer = ArticleListSerializer(comment, data=request.data)
        if serializer.is_valid(raise_exception=True):
            serializer.save()
            return Response(serializer.data)