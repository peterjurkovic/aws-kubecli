# aws-kubecli
Containerized AWS CLI on debian  + kubecli + aws-iam-authenticator + Open JDK8

## Build

```
docker build -t peterjurkovic/aws-kubecli
```

## Run 

```
docker run -d -t -i -e AWS_ACCESS_KEY_ID='<key>' \ 
                    -e AWS_SECRET_ACCESS_KEY='<secret>' 
                    -e AWS_DEFAULT_REGION='<region>' 
                    -e AWS_DEFAULT_OUTPUT='json' 
                    aws-kubecli tail -f /dev/null
```

Note: the image is quite big, is just for experimenting
