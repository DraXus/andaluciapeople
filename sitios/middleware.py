from andaluciapeople import settings
from facegraph.canvas import decode_signed_request

class FacebookCsrfMiddleware(object):
    """
    Facebook CSRF protection
    """
    def process_request(self, request):
        signed_request = request.REQUEST.get('signed_request', None)
        try:
           if signed_request != None:
               signed_request = decode_signed_request(settings.FACEBOOK_APP_SECRET, signed_request)
               from django.middleware.csrf import _get_new_csrf_key
               request.META["CSRF_COOKIE"] = _get_new_csrf_key()
               request.csrf_processing_done = True
        except BaseException, e:
           print e
           pass
