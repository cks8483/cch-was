# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-cloudbuild-prod
  labels:
    app: hello-cloudbuild-prod
spec:
  replicas: 2
  selector:
    matchLabels:
      app: hello-cloudbuild-prod
  template:
    metadata:
      labels:
        app: hello-cloudbuild-prod
    spec:
      containers:
      - name: hello-cloudbuild-prod
        image: asia-northeast3-docker.pkg.dev/GOOGLE_CLOUD_PROJECT/my-repository/hello-cloudbuild-prod:COMMIT_SHA
        ports:
        - containerPort: 8080
---
kind: Service
apiVersion: v1
metadata:
  name: hello-cloudbuild-prod
spec:
  selector:
    app: hello-cloudbuild-prod
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
  type: LoadBalancer
