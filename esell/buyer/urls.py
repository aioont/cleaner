from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
   # path('buyer/', include('polls.urls')),
    path('', views.index),
]


