from django.db import models

# Create your models here.
class Customers(models.Model):     #learners tip: first Letter stays capital in the name.
    Customer_id = models.IntegerField(primary_key = True)
    Customer_name = models.CharField(max_length = 20)
    house no. = models.CharField(max_length = 20)
    street_name = models.CharField(max_length = 20)
    city = models.CharField(max_length = 20)
    pincode = models.CharField(max_length = 6)
    ...
    #