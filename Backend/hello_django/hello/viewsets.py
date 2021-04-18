from rest_framework import viewsets
from hello.models import Meal
from hello.serializers import MealSerializer

class MealViewSet(viewsets.ModelViewSet):
    serializer_class = MealSerializer

    def get_queryset(self):
        return Meal.objects.all()