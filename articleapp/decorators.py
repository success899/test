from django.http import HttpResponseForbidden

from articleapp.models import Article


def article_ownership_required(func):
    def decorated(requset, *args, **kwargs):
        target_article = Article.objects.get(pk=kwargs['pk'])

        if target_article.writer == requset.user:
            return func(requset, *args, **kwargs)

        else:
            return HttpResponseForbidden()

    return decorated