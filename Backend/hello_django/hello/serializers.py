from rest_framework import serializers
from hello.models import Meal

class MealSerializer(serializers.ModelSerializer):
    class Meta:
        model = Meal
        fields = ['meal_id', 'meal_name', 'meal_price','Rating','Est_Time']  