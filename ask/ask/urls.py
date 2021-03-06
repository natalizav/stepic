from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('qa.views',
   	url(r'^$', 'list_new_questions', name='home'),
	url(r'^login/$', 'login_form', name='login'),
	url(r'^signup/$', 'signup', name='signup'),
	url(r'^question/(\d+)/$', 'get_question', name='question'),
	url(r'^ask/', 'ask', name='ask'),
	url(r'^answer/', 'answer', name='answer'),
	url(r'^popular/$', 'list_popular_questions', name='popular'),
	url(r'^new/$', 'test', name='new'),
)
	
