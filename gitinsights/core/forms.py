from django import forms


class UserForm(forms.Form):

    username = forms.CharField(max_length=45)
    fullname = forms.CharField(max_length=45)
    date_of_birth = forms.DateField()
    email = forms.CharField(max_length=45)
    created_at = forms.DateTimeField()


class ContactForm(forms.Form):
    name = forms.CharField(label="Your name", max_length=100)
    sender = forms.EmailField(label='Your e-mail address')
    message = forms.CharField(widget=forms.Textarea)
