from django.db import models
from django.contrib.auth.models import User

User = User

class Question(models.Model):
	title = models.CharField(max_length=255)
	text = models.TextField()
	added_at = models.DateTimeField(blank=True)
	rating = models.IntegerField()
	author = models.ForeignKey(User, null=True, on_delete=models.SET_NULL, related_name='question_user')
	likes = models.ManyToManyField(User, related_name='question_likes')

class Answer(models.Model):
	text = models.TextField()
	added_at = models.DateTimeField()
	question = models.ForeignKey(Question, null=True, on_delete=models.SET_NULL)
	author = models.ForeignKey(User, null=True, on_delete=models.SET_NULL)
