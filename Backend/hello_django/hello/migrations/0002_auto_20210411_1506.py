# Generated by Django 3.2 on 2021-04-11 09:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('hello', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customers',
            name='people_accompanying',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='meal',
            name='Rating',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='meal',
            name='meal_price',
            field=models.IntegerField(),
        ),
    ]