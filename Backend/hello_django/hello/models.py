from django.db import models
from phonenumber_field.modelfields import PhoneNumberField
# Create your models here.
class Customers(models.Model):     #learners tip: first Letter stays capital in the name.
    Customer_id = models.IntegerField(primary_key = True)
    Customer_name = models.CharField(max_length = 20)
    Customer_address = models.CharField(max_length = 100)
    phone_no = PhoneNumberField(null=False, blank=False, unique=True)
    billing_amt = models.IntegerField()
    people_accompanying = models.IntegerField()    #tbd
    Timestamp = models.DateTimeField('Entry time')
    bench_num = models.ForeignKey(
        to='Bench', on_delete=models.CASCADE,
    )                      #leave foreign_key for now.
 
class Bench(models.Model): 
    bench_num = models.IntegerField(primary_key = True)
    isOccupied = models.BooleanField(verbose_name=('Table available'), default= True)
    waiter_id = models.ForeignKey(
        to='Waiter', on_delete = models.CASCADE,
    )
 
class Bench_meal(models.Model): 
    OrderID = models.IntegerField(primary_key = True)
    isOccupied = models.BooleanField(verbose_name=('Table available'), default= True)
    bench_num = models.ForeignKey(
        to='Bench', on_delete = models.CASCADE,
    )     
    meal_id = models.ForeignKey(
        to='Meal', on_delete = models.CASCADE,
    )
 
class Meal(models.Model):   
    meal_id = models.IntegerField(primary_key = True)
    meal_name = models.CharField(max_length = 20)
    meal_price = models.IntegerField()
    Rating = models.IntegerField()    
    Est_Time = models.DateTimeField('Entry time')
     
 
 
class Waiter(models.Model):
    waiter_id = models.IntegerField(primary_key = True)
    waiter_name = models.CharField(max_length = 20)
 
class Waiter_phone(models.Model):
    waiter_phoneNo = PhoneNumberField(blank=False, primary_key = True)
    waiter_name = models.ForeignKey(
        to='Waiter', on_delete = models.CASCADE,
    )
 
class Bench_meal(models.Model): 
    ComboID = models.IntegerField(primary_key = True)
    isOccupied = models.BooleanField(verbose_name=('Table available'), default= True)
    Ingredient_ID = models.ForeignKey(
        to='Ingredient', on_delete = models.CASCADE,
    )        
    meal_id = models.ForeignKey(
        to='Meal', on_delete = models.CASCADE,
    )
   
class Ingredient(models.Model):
    Ingredient_ID = models.IntegerField(blank=False, primary_key = True)
    Ingredient_name = models.CharField(max_length = 20)
    Ingredient_available = models.BooleanField(verbose_name=('Ingredient available'), default= True)
        
       
