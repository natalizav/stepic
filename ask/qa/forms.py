from django import forms

class AskForm(forms.Form):
  title = forms.CharField(max_length=100)
  text = forms.CharField()
  
  def save(self):
    q = Question(**self.cleaned_data)
    q.save()
    return q
  
      
class AnswerForm(forms.Form):
  text = forms.CharField()
  question = forms.CharField()
  
  def clean_question(self):
    question = self.cleaned_data['question']
    try:
      q = int(question)
      question = Question.objects.get(id=id)
		except Question.DoesNotExist:
			raise forms.ValidationError(
        'Not Found', code=1)
    except ValueError:
    	raise forms.ValidationError(
    		'Need Integer', code=2)
    return  + \
    "\nThank you for your attention."

  
  
