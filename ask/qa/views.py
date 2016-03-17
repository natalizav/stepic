from django.shortcuts import render
from django.http import Http404, HttpResponseRedirect
from qa.models import Question, Answer
from qa.forms import AskForm, AnswerForm, LoginForm, SignupForm
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login
from django.core.paginator import Paginator
from django.views.decorators.http import require_POST

# Create your views here.
from django.http import HttpResponse
def test (request, *args, **kwargs):
	return HttpResponse

def list_new_questions (request):
	questions = Question.objects.order_by('-added_at')
	page = request.GET.get('page', 1)
	paginator = Paginator (questions, 10)
	page = paginator.page(page)
	return render(request, 'list_questions.html', {
		'questions': page.object_list,
		'paginator': paginator, 'page': page,
	})
	
def list_popular_questions (request):
	questions = Question.objects.order_by('-rating')
	page = request.GET.get('page', 1)
	paginator = Paginator (questions, 10)
	page = paginator.page(page)
	return render(request, 'list_questions.html', {
		'questions': page.object_list,
		'paginator': paginator, 'page': page,
	})
	
def get_question (request, id):
	try:
		question = Question.objects.get(id=id)
	except Question.DoesNotExist:
		raise Http404		
	answers = question.answer_set.all()
	form = AnswerForm()
	form.question = question.id
	return render(request, 'question.html', {
		'question': question, 'answers': answers, 'form': form,
	})

def ask(request):
	if request.method == "POST":
		form = AskForm(request.POST)
		if form.is_valid():
			q = form.save()
			return HttpResponseRedirect('/question/' + str(q.id) + '/')
	else:
		form = AskForm()
	return render(request, 'ask.html', {
		'form': form,
	})

@require_POST
def answer(request):
	form = AnswerFrom(request.POST)
	if form.is_valid():
		a = form.save()
	return HttpResponseRedirect('/question/' + str(form.question) + '/')

def login_form(request):
	if request.method == 'POST':
		form = LoginForm(request.POST)
		if formis_valid():
			login(request, form._user)
			return HttpResponseRedirect('/')
	else:
		form = LoginForm()
	return render(request, 'login.html', {
		'form': form,
	})

def signup(request):
	if request.method == 'POST':
		form = SignupForm(request.POST)
		p = request.POST
		if form.is_valid():
			User.objects.create_user(username=p.get('username'), email=p.get('email'), password=p.get('password'))
			user = authenticate(username=p.get('username'), password=p.get('password'))
			login(request, user)
			return HttpResponseRedirect('/')
	else:
		form = SignupForm()
	return render(request, 'signup.html', {
		'form': form,
	})
