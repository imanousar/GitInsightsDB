from django.urls import path
from . import views

urlpatterns = [

    path('User', views.usersView.get, name='users'),
    path('User/<str:username>/', views.usersView.selected, name="selectedUser"),
    path('repos/', views.reposView.get, name='repo'),
    path('repos/<int:id>/', views.reposView.selected, name="selectedRepo"),



    path('', views.indexView.index, name='index'),
    path('contact', views.contactView.contact, name='contact')
]
