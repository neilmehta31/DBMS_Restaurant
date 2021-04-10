from django.db import models

# Create your models here.
class Customers(models.Model):     #learners tip: first Letter stays capital in the name.
    Customer_id = models.IntegerField(primary_key = True)
    Customer_name = models.CharField(max_length = 20)
    Customer_address = models.CharField(max_length = 100)
    phone_no = models.PhoneNumberField(null=False, blank=False, unique=True)
    billing_amt = models.IntegerField()
    people_accompanying = models.IntegerField(max_length = 10)    #tbd
    Timestamp = models.DateTimeField('Entry time')
    bench_num = models.Foreignkey(
        'Bench Number', on_delete=models.CASCADE,
    )                      leave foreign_key for now.

class Bench(models.Model): 
     bench_num = models.IntegerField(primary_key = True)
     isOccupied = models.BooleanField(verbose_name=_('Table available'), default= True)
     waiter_id = models.ForeignKey(
         'Waiter ID', on_delete = models.CASCADE,
     )

class Bench_meal(models.Model): 
     OrderID = models.IntegerField(primary_key = True)
     isOccupied = models.BooleanField(verbose_name=_('Table available'), default= True)
     bench_num = models.ForeignKey(
         'Bench Number', on_delete = models.CASCADE,
     )     
     meal_id = models.ForeignKey(
         'Meal ID', on_delete = models.CASCADE,
     )

class Meal(models.Model):   
    meal_id = models.IntegerField(primary_key = True)
    meal_name = models.CharField(max_length = 20)
    meal_price = models.IntegerField(max_length=10)
    Rating = models.IntegerField(max_length = 1)    
    Est_Time = models.DateTimeField('Entry time')
 )    


class Waiter(models.Model):
     waiter_id = models.IntegerField(primary_key = True)
     waiter_name = models.CharField(max_length = 20)

 class Waiter_phone(models.Model):
     waiter_phoneNo = models.PhoneNumberField(blank=False, primary_key = True)
     waiter_name = models.ForeignKey(
         'Waiter name', on_delete = models.CASCADE,
     )

class Bench_meal(models.Model): 
     ComboID = models.IntegerField(primary_key = True)
     isOccupied = models.BooleanField(verbose_name=_('Table available'), default= True)
     Ingredient_ID = models.ForeignKey(
         'Ingrdient ID', on_delete = models.CASCADE,
     )        
     meal_id = models.ForeignKey(
         'Meal ID', on_delete = models.CASCADE,
     )
   
 class Ingredient(models.Model):
     Ingredient_ID = models.IntegerField(blank=False, primary_key = True)
     Ingredient_name = models.CharField(max_length = 20)
     Ingredient_available = models.BooleanField(verbose_name=_('Ingredient available'), default= True)
        
       