from django.urls import path
from . import views

app_name = 'core'
urlpatterns = [

    path('user/', views.usersView.get, name='users'),
    path('user/<str:username>/', views.usersView.selected, name="selectedUser"),
    path('repos/', views.reposView.get, name='repo'),
    path('repos/<int:id>/', views.reposView.selected, name="selectedRepo"),
    path('orgs/', views.orgsView.get, name='orgs'),
    path('orgs/<str:org_name>/', views.orgsView.selected, name="selectedOrg"),



    path('', views.indexView.index, name='index'),
    path('contact/', views.contactView.contact, name='contact')
]
