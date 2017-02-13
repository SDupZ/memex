from functools import wraps

from memex.celeryconf import app
from .models import Job

# decorator to avoid code duplication

def update_job(fn):
    """Decorator that will update Job with result of the function"""

    # wraps will make the name and docstring of fn available for introspection
    @wraps(fn)
    def wrapper(job_id, *args, **kwargs):
        job = Job.objects.get(id=job_id)
        job.status = 'started'
        job.save()
        try:
            # execute the function fn
            result = fn(*args, **kwargs)
            job.result = result
            job.status = 'finished'
            job.save()
        except:
            job.result = None
            job.status = 'failed'
            job.save()
    return wrapper




# two simple numerical tasks that can be computationally intensive

@app.task
@update_job
def get_latest_30_advice_animals(n):

    return 2 ** n


# mapping from names to tasks

TASK_MAPPING = {
    'get_latest_advice_animals': get_latest_30_advice_animals,
}
