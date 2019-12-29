from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('addCommit', views.addCommit, name='addCommit'),
    path('addIssue', views.addIssue, name='addIssue'),
    path('addOrganization', views.addOrganization, name='addOrganization'),
    path('addRepo', views.addRepo, name='addRepo'),
    path('addTeam', views.addTeam, name='addTeam'),
    path('addUser', views.addUser, name='addUser'),
	path('searchCommit', views.searchCommit, name='searchCommit'),
    path('searchIssue', views.searchIssue, name='searchIssue'),
    path('searchOrganization', views.searchOrganization, name='searchOrganization'),
    path('searchRepo', views.searchRepo, name='searchRepo'),
    path('searchTeam', views.searchTeam, name='searchTeam'),
    path('searchUser', views.searchUser, name='searchUser'),
    path('contact', views.contact, name='contact')
]