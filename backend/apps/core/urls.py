from django.urls import path

from apps.core import views

urlpatterns = [
    path("", views.index, name="index"),
    path("health-check/", views.health_check, name="health_check"),
    path("exception/", views.trigger_exception, name="exception"),
    path("email-admins/", views.email_admins, name="email-admins"),
]
