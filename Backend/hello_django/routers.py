from rest_framework import routers
from hello.viewsets import MealViewSet
router = routers.SimpleRouter()
router.register(r'meal', MealViewSet, basename='meal')


#restaurant/urls.py
