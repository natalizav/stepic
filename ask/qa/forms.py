from django import forms
from qa.models import Question, Answer
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login
import pprint

class AskForm(forms.Form):
	title = forms.CharField(max_length=100)
	text = forms.CharField()
  
	def save(self):
		q = Question(**self.cleaned_data)
		q.author = self._user
		q.save()
		return q
  
      
class AnswerForm(forms.Form):
	text = forms.CharField()
	question = forms.IntegerField()
  
	def clean_question(self):
    		question = self.cleaned_data['question']
    		try:
      			q = int(question)
	      		question = Question.objects.get(id=id)
		except Question.DoesNotExist:
			raise forms.ValidationError('Not Found', code=1)
	    	except ValueError:
    			raise forms.ValidationError('Need Integer', code=2)
    		return q

 	def save(self):
		a = Answer(text=self.cleaned_data.text, question_id=self.cleaned_data.question, author=self._user)
		a.save()
		return a 
 
class SignupForm(forms.Form):
	username = forms.CharField()
	email = forms.EmailField()
	password = forms.CharField(widget=forms.PasswordInput)

	def save(self):
		pprint.pprint(self)
		user = self.cleaned_data
		#User.objects.create_user(self.username, self.email, self.password)

class LoginForm(forms.Form):
	username = forms.CharField()
	password = forms.CharField(widget=forms.PasswordInput)

	def clean(self):
		u = self.cleaned_data
		
