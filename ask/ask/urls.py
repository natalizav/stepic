from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('qa.views',
   	url(r'^$', 'list_new_questions', name='home'),
	url(r'^login/$', 'test', name='login'),
	url(r'^signup/$', 'test', name='signup'),
	url(r'^/question/(\d+)/$', 'get_question', name='question'),
	url(r'^ask/', 'test', name='ask'),
	url(r'^popular/$', 'list_popular_questions', name='popular'),
	url(r'^new/$', 'test', name='new'),
)
	
