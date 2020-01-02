from django.urls import path
from . import views


urlpatterns = [

    path('users/', views.usersView.get, name='usersUrl'),
    path('users/<str:username>/', views.usersView.selected, name="selectedUserUrl"),
    path('repos/', views.reposView.get, name='reposUrl'),
    path('repos/<int:id>/', views.reposView.selected, name="selectedRepoUrl"),
    path('orgs/', views.orgsView.get, name='orgsUrl'),
    path('orgs/<str:org_name>/', views.orgsView.selected, name="selectedOrgUrl"),
    path('orgs/<str:org_name>/teams/<str:team_name>', views.orgsView.teamSelected, name="selectedOrgTeamUrl"),
    path('repos/<int:id>/commits/<str:hash>', views.reposView.commitSelected, name="selectedRepoCommitUrl"),



    path('', views.indexView.index, name='indexUrl'),
    path('contact/', views.contactView.contact, name='contactUrl'),
    path('search/', views.searchView.get, name="searchUrl"),

]
