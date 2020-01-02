from django.urls import path
from . import views


urlpatterns = [

    path('user/', views.usersView.get, name='usersUrl'),
    path('user/<str:username>/', views.usersView.selected, name="selectedUserUrl"),
    path('repos/', views.reposView.get, name='reposUrl'),
    path('repos/<int:id>/', views.reposView.selected, name="selectedRepoUrl"),
    path('orgs/', views.orgsView.get, name='orgsUrl'),
    path('orgs/<str:org_name>/', views.orgsView.selected, name="selectedOrgUrl"),



    path('', views.indexView.index, name='indexUrl'),
    path('contact/', views.contactView.contact, name='contactUrl')
]
