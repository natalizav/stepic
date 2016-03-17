from django.shortcuts import render
from django.http import Http404
from qa.models import Question, Answer
from django.core.paginator import Paginator

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
	return render(request, 'question.html', {
		'question': question,
	})

	
