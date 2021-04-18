from django.contrib import admin
from django.urls import include, path
from django.contrib.staticfiles.storage import staticfiles_storage
from django.views.generic.base import RedirectView
from rest_framework.authtoken import views
from routers import router

urlpatterns = [
    path("", include("hello.urls")),
    path('admin/', admin.site.urls),
    path('favicon.ico', RedirectView.as_view(url=staticfiles_storage.url('img/favicon.ico'))),  
    path('api/', include('api.urls', namespace='api')),
    path('api-token-auth/', views.obtain_auth_token, name='api-token-auth'),  
    path("", include("api.urls")),
    path('api/', include((router.urls, 'web_project'), namespace='web_project'))
]


