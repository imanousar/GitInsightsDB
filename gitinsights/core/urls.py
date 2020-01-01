from django.urls import path
from . import views

urlpatterns = [

    path('User', views.usersView.get, name='users'),
    path('User/<str:username>/', views.usersView.selected, name="selectedUser"),

    path('', views.indexView.index, name='index'),
    path('addCommit', views.commitView.addCommit, name='addCommit'),
    path('addIssue', views.issueView.addIssue, name='addIssue'),
    path('addOrganization', views.organizationView.addOrganization, name='addOrganization'),
    path('addRepo', views.repoView.addRepo, name='addRepo'),
    path('addTeam', views.teamView.addTeam, name='addTeam'),
    path('addUser', views.userView.addUser, name='addUser'),
	path('searchCommit', views.commitView.searchCommit, name='searchCommit'),
    path('searchIssue', views.issueView.searchIssue, name='searchIssue'),
    path('searchOrganization', views.organizationView.searchOrganization, name='searchOrganization'),
    path('searchRepo', views.repoView.searchRepo, name='searchRepo'),
    path('searchTeam', views.teamView.searchTeam, name='searchTeam'),
    path('searchUser', views.userView.searchUser, name='searchUser'),
    path('contact', views.contactView.contact, name='contact')
]
