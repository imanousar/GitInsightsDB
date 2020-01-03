from django.urls import path
from . import views


urlpatterns = [

    path('users/', views.usersView.get, name='usersUrl'),
    path('users/search', views.usersView.search, name='usersSearchUrl'),
    path('users/<str:username>/', views.usersView.selected, name="selectedUserUrl"),

    path('repos/', views.reposView.get, name='reposUrl'),
    path('repos/search', views.reposView.search, name='reposSearchUrl'),
    path('repos/<int:id>/', views.reposView.selected, name="selectedRepoUrl"),

    path('orgs/', views.orgsView.get, name='orgsUrl'),
    path('orgs/<str:org_name>/', views.orgsView.selected, name="selectedOrgUrl"),
    path('orgs/<str:org_name>/teams/<str:team_name>',
         views.orgsView.teamSelected, name="selectedOrgTeamUrl"),
    path('repos/<int:id>/commits/<str:hash>',
         views.commitView.get, name="selectedRepoCommitUrl"),
    path('repos/<int:id>/issues/<str:title>',
         views.reposView.issueSelected, name="selectedRepoIssueUrl"),
    path('repos/<int:id>/progLanguages/<str:language>',
         views.reposView.languageSelected, name="selectedRepoLanguageUrl"),
    path('repos/<int:id>/commits/<str:hash>/files/<str:filename>',
         views.commitView.commitSelected, name="selectedRepoCommitFileUrl"),


    path('', views.indexView.index, name='indexUrl'),
    path('contact/', views.contactView.contact, name='contactUrl'),

]
