# Sending Requests
* [Creating a new User](https://canvas.instructure.com/doc/api/users.html#method.users.create)
* [Enroll a user with curl POST example](https://canvas.instructure.com/doc/api/enrollments.html#method.enrollments_api.create)
* [Enrollment](http://www.humandesigncollege.org/doc/api/enrollments.html#method.enrollments_api.create)
* [Using postman to create a new user](https://github.com/instructure/canvas-lms/issues/1331)



### Enrolloments

#### GET Enrollments
* Send a `GET` request to the URL below replacing `:canvas_url` and `:course_id` respectively to ensure you have access to the endpoint.
    * `https://:canvas_url/api/v1/courses/:course_id/enrollments`
* Ensure you embed your Access Token as `OAuth2.0 Authorization Bearer`


#### POST new Enrollment




* `https://canvas.instructure.com/courses/2729730/invite_users`

```json
{
    "users": [
        {
            "id": 30317999,
            "name": "api-genesis",
            "email": "hunter.sprint@gmail.com",
            "login_id": "hunter.sprint@gmail.com",
            "created_at": "2021-05-25T11:57:29-06:00",
            "sortable_name": "mock-student",
            "short_name": "mock-student",
            "sis_user_id": null,
            "integration_id": null,
            "root_account": "canvas.instructure.com"
        }
    ]
}
```



```json
{
    "users": [
        {
            "name": "api-genesis",
            "email": "hunter.sprint@gmail.com"
        }
    ]
}
```


```
curl -v\
 -H 'Authorization: Bearer 7~AYVo5LOO2zGTLfsQBC8wHlFZV2SJ0FIZJZDW1gShdCOaAuX5tOsLI2H9oBvLXVUM'\
    'https://canvas.instructure.com:443/api/v1/courses/2729730/enrollments'\
 -X POST\
    -F 'enrollment[user_id]=1288604'\
    -F 'enrollment[type]=TeacherEnrollment'\
    -F 'enrollment[notify]=true'
```






```json
{
   "enrollment[user_id]":[
      null,
      "30317597"
   ],
   "enrollment[type]":[
      null,
      "StudentEnrollment"
   ],
   "enrollment[enrollment_state]":[
      null,
      "active"
   ],
   "enrollment[course_section_id]":[
      null,
      "1"
   ],
   "enrollment[limit_privileges_to_course_section]":[
      null,
      "true"
   ],
   "enrollment[notify]":[
      null,
      "false"
   ]
}
```






```
curl 'https://canvas.instructure.com/courses/2729730/invite_users'
    -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:88.0) Gecko/20100101 Firefox/88.0'
    -H 'Accept: application/json+canvas-string-ids, application/json, text/plain, */*'
    -H 'Accept-Language: en-US,en;q=0.5' --compressed
    -H 'Referer: https://canvas.instructure.com/courses/2729730/users'
    -H 'X-Requested-With: XMLHttpRequest'
    -H 'Content-Type: application/json;charset=utf-8'
    -H 'X-CSRF-Token: 3C6awhvyMcXg4rdBfp3vdi3xuDIivbaBdhOCgaQht1i9H6OvYb5Hoo6Q3ngLx6AjZLLaC1CI8eIFW/XFxViYLA=='
    -H 'Origin: https://canvas.instructure.com'
    -H 'Connection: keep-alive'
    -H 'Cookie: ui-tabs-1=0; _ga=GA1.2.1689152036.1620061984; _csrf_token=3C6awhvyMcXg4rdBfp3vdi3xuDIivbaBdhOCgaQht1i9H6OvYb5Hoo6Q3ngLx6AjZLLaC1CI8eIFW%2FXFxViYLA%3D%3D; log_session_id=553c7d87b54a6c588d50d6c64b2cb5f6; _legacy_normandy_session=yzSTEvto62-tA6yD7SW2Nw+8r9_1U4jC2IDC2zUCg-uv9Oq-i-rUPdRS_i_L0ezOiI_VC6NUScKW8VgZG63SC8SWdQD9m1o4D29hKNenaGbEe6aOM6uW_yCAqAN54dzdMPR5ELGiQX32idkE8t4OtmWc8PxjoeGK7lkLiwPEjRHvD_FektoRpl_-bnjvhZFAEXnws7yiG8iY-wvaDTseyF3JdwuOA-VaCGSRAxGSMtQqQ6dN_s-rSPxpJboYCJRExN7apy4h4NjvZRkzrd5pcDdCQuqaIG54-u3Vh0uKJIIyqP6RubMnNpsArKPDH4bR2yTd329-m-L065iy6cBCX5F14CztspG_CUmD0FMsoKin3XQDt8-tEtJVtoKq6214NO2LUITjiiZG_sLJanAsGczWYVF9oEchfrFCxO5EkZG-spOUmrjSEUPncosaBwez8s.g-I6j3iA7ZoBx-W4AftubhAsdJU.YK050w; canvas_session=yzSTEvto62-tA6yD7SW2Nw+8r9_1U4jC2IDC2zUCg-uv9Oq-i-rUPdRS_i_L0ezOiI_VC6NUScKW8VgZG63SC8SWdQD9m1o4D29hKNenaGbEe6aOM6uW_yCAqAN54dzdMPR5ELGiQX32idkE8t4OtmWc8PxjoeGK7lkLiwPEjRHvD_FektoRpl_-bnjvhZFAEXnws7yiG8iY-wvaDTseyF3JdwuOA-VaCGSRAxGSMtQqQ6dN_s-rSPxpJboYCJRExN7apy4h4NjvZRkzrd5pcDdCQuqaIG54-u3Vh0uKJIIyqP6RubMnNpsArKPDH4bR2yTd329-m-L065iy6cBCX5F14CztspG_CUmD0FMsoKin3XQDt8-tEtJVtoKq6214NO2LUITjiiZG_sLJanAsGczWYVF9oEchfrFCxO5EkZG-spOUmrjSEUPncosaBwez8s.g-I6j3iA7ZoBx-W4AftubhAsdJU.YK050w; _gid=GA1.2.319571813.1621891777; _gcl_au=1.1.1744765296.1621892076; _mkto_trk=id:449-BVJ-543&token:_mch-instructure.com-1621892075621-15064; _gaexp=GAX1.2.Kr8AyE1vTTumXxmmuuqxYQ.18864.0; __lotr=https%3A%2F%2Fwww.google.com%2F; _lo_uid=199905-1621892076153-ba99d48cd0f8512e; _lo_v=1; __lotl=https%3A%2F%2Fwww.instructure.com%2Fcanvas%2Fcanvas-certification'
    -H 'TE: Trailers'
    --data-raw '{"users":[{"name":"api-genesis","email":"hunter.sprint@gmail.com"}]}'
```


curl 'https://canvas.instructure.com/courses/2729730/invite_users' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:88.0) Gecko/20100101 Firefox/88.0' -H 'Accept: application/json+canvas-string-ids, application/json, text/plain, */*' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: https://canvas.instructure.com/courses/2729730/users' -H 'X-Requested-With: XMLHttpRequest' -H 'Content-Type: application/json;charset=utf-8' -H 'X-CSRF-Token: 3C6awhvyMcXg4rdBfp3vdi3xuDIivbaBdhOCgaQht1i9H6OvYb5Hoo6Q3ngLx6AjZLLaC1CI8eIFW/XFxViYLA==' -H 'Origin: https://canvas.instructure.com' -H 'Connection: keep-alive' -H 'Cookie: ui-tabs-1=0; _ga=GA1.2.1689152036.1620061984; _csrf_token=3C6awhvyMcXg4rdBfp3vdi3xuDIivbaBdhOCgaQht1i9H6OvYb5Hoo6Q3ngLx6AjZLLaC1CI8eIFW%2FXFxViYLA%3D%3D; log_session_id=553c7d87b54a6c588d50d6c64b2cb5f6; _legacy_normandy_session=yzSTEvto62-tA6yD7SW2Nw+8r9_1U4jC2IDC2zUCg-uv9Oq-i-rUPdRS_i_L0ezOiI_VC6NUScKW8VgZG63SC8SWdQD9m1o4D29hKNenaGbEe6aOM6uW_yCAqAN54dzdMPR5ELGiQX32idkE8t4OtmWc8PxjoeGK7lkLiwPEjRHvD_FektoRpl_-bnjvhZFAEXnws7yiG8iY-wvaDTseyF3JdwuOA-VaCGSRAxGSMtQqQ6dN_s-rSPxpJboYCJRExN7apy4h4NjvZRkzrd5pcDdCQuqaIG54-u3Vh0uKJIIyqP6RubMnNpsArKPDH4bR2yTd329-m-L065iy6cBCX5F14CztspG_CUmD0FMsoKin3XQDt8-tEtJVtoKq6214NO2LUITjiiZG_sLJanAsGczWYVF9oEchfrFCxO5EkZG-spOUmrjSEUPncosaBwez8s.g-I6j3iA7ZoBx-W4AftubhAsdJU.YK050w; canvas_session=yzSTEvto62-tA6yD7SW2Nw+8r9_1U4jC2IDC2zUCg-uv9Oq-i-rUPdRS_i_L0ezOiI_VC6NUScKW8VgZG63SC8SWdQD9m1o4D29hKNenaGbEe6aOM6uW_yCAqAN54dzdMPR5ELGiQX32idkE8t4OtmWc8PxjoeGK7lkLiwPEjRHvD_FektoRpl_-bnjvhZFAEXnws7yiG8iY-wvaDTseyF3JdwuOA-VaCGSRAxGSMtQqQ6dN_s-rSPxpJboYCJRExN7apy4h4NjvZRkzrd5pcDdCQuqaIG54-u3Vh0uKJIIyqP6RubMnNpsArKPDH4bR2yTd329-m-L065iy6cBCX5F14CztspG_CUmD0FMsoKin3XQDt8-tEtJVtoKq6214NO2LUITjiiZG_sLJanAsGczWYVF9oEchfrFCxO5EkZG-spOUmrjSEUPncosaBwez8s.g-I6j3iA7ZoBx-W4AftubhAsdJU.YK050w; _gid=GA1.2.319571813.1621891777; _gcl_au=1.1.1744765296.1621892076; _mkto_trk=id:449-BVJ-543&token:_mch-instructure.com-1621892075621-15064; _gaexp=GAX1.2.Kr8AyE1vTTumXxmmuuqxYQ.18864.0; __lotr=https%3A%2F%2Fwww.google.com%2F; _lo_uid=199905-1621892076153-ba99d48cd0f8512e; _lo_v=1; __lotl=https%3A%2F%2Fwww.instructure.com%2Fcanvas%2Fcanvas-certification' -H 'TE: Trailers' --data-raw '{"users":[{"name":"api-genesis","email":"hunter.sprint@gmail.com"}]}'