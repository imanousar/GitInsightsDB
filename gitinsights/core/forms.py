from django import forms
from django.forms.widgets import SelectDateWidget
import datetime


class UserForm(forms.Form):
    username = forms.CharField(max_length=45, widget=forms.TextInput(attrs={'class':'form-control', 'placeholder':'username'}))
    fullname = forms.CharField(max_length=45, widget=forms.TextInput(attrs={'class':'form-control', 'placeholder':'fullname'}))
    date_of_birth = forms.DateField(widget=SelectDateWidget(years=range(1900,datetime.date.today().year ), empty_label=("Choose Year", "Choose Month", "Choose Day"),attrs={'style': 'width: 20%; display: inline-block;'}))
    email = forms.EmailField(widget=forms.TextInput(attrs={'class':'form-control', 'placeholder':'someone@example.com'}))

class ContactForm(forms.Form):
    name = forms.CharField(label="Your name", max_length=100)
    sender = forms.EmailField(label='Your e-mail address')
    message = forms.CharField(widget=forms.Textarea)

class RepoForm(forms.Form):
    owner = forms.IntegerField(widget=forms.HiddenInput())
    stars = forms.IntegerField(widget=forms.HiddenInput(), initial=0)
    forks = forms.IntegerField(widget=forms.HiddenInput(), initial=0)
    name = forms.CharField(max_length=45, widget=forms.TextInput(attrs={'class':'form-control', 'placeholder':'Repository name'}))
    is_public = forms.BooleanField(
        required=False,
        initial=False
    )

class TeamForm(forms.Form):
    org = forms.IntegerField(widget=forms.HiddenInput())
    name = forms.CharField(max_length=45, widget=forms.TextInput(attrs={'class':'form-control', 'placeholder':'Team Name'}))
    description = forms.CharField(widget=forms.Textarea(attrs={'class':'form-control', 'placeholder':'Team Description'}))

class IssueForm(forms.Form):
    LABEL_CHOICES = [
        ('bug', 'bug'),
        ('feature', 'feature'),
        ('documentation', 'documentation'),
        ('help', 'help'),
        ('other', 'other')
    ]
    repo = forms.IntegerField(widget=forms.HiddenInput())
    title = forms.CharField(max_length=45, widget=forms.TextInput(attrs={'class':'form-control', 'placeholder':'Issue Title'}))
    description = forms.CharField(widget=forms.Textarea(attrs={'class':'form-control', 'placeholder':'Team Description'}))
    label = forms.CharField(widget=forms.Select(choices=LABEL_CHOICES))    
    state = forms.CharField(widget=forms.HiddenInput(), initial='open')
