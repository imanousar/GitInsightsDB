from django.contrib import admin

from .models import *

admin.site.register(User)
admin.site.register(Org)
admin.site.register(Team)
admin.site.register(Repo)
admin.site.register(Commit)
admin.site.register(CommitFile)
admin.site.register(Issue)
admin.site.register(LanguageRepo)