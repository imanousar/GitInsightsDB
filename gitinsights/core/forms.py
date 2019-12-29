from django import forms


class UserForm(forms.Form):

    username = forms.CharField(max_length=45)

#    id = models.OneToOneField(Owner, models.CASCADE, db_column='id', primary_key=True)
#    fullname = models.CharField(max_length=45)
#    date_of_birth = models.DateField()
#    email = models.CharField(unique=True, max_length=45)
#    created_at = models.DateTimeField()
