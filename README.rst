kubeRobot
===============


.. image:: https://raw.githubusercontent.com/valdemarpavesi/kubeRobot/master/docs/kuberobot.png

.. contents::
   :local:


 test kubernetes api by robot

        - https://kubernetes.io/

        - http://robotframework.org/


First testcase
--------------

.. code:: kubeRobot

	# robot kuberobot.robot
	==============================================================================
	Kuberobot :: REST kubernetes.
	==============================================================================
	Test api v1 :: api v1                                                 | PASS |
	------------------------------------------------------------------------------
	Test api v1 configmaps :: configmaps                                  | PASS |
	------------------------------------------------------------------------------
	Kuberobot :: REST kubernetes.                                         | PASS |
	2 critical tests, 2 passed, 0 failed
	2 tests total, 2 passed, 0 failed
	==============================================================================
	Output:  /home/kuberobot/output.xml
	Log:     /home/kuberobot/log.html
	Report:  /home/kuberobot/report.html
	==============================================================================
	#

.. image:: https://raw.githubusercontent.com/valdemarpavesi/kubeRobot/master/helloworld/passed.png

First pod created,nginx
-----------------

.. code:: kubeRobot


	# kubectl get pods
	NAME                              READY     STATUS              RESTARTS   AGE
	hello-minikube-5d89cbb865-znjsc   1/1       Running             0          3d
	nginx                             0/1       ContainerCreating   0          11s
        #	

        # kubectl get svc
	NAME             TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)          AGE
	hello-minikube   NodePort    10.0.0.180   <none>        8081:32321/TCP   3d
	kubernetes       ClusterIP   10.0.0.1     <none>        443/TCP          3d
	nginx-service    ClusterIP   10.0.0.53    <none>        80/TCP           13s
	#



Reports
-------

        - `hello world report.html <https://rawgit.com/valdemarpavesi/kubeRobot/master/helloworld/report.html>`_
	- `regression tests report.html <https://rawgit.com/valdemarpavesi/kubeRobot/master/report/report.html>`_


Requirements
------------

	- `read api docs <https://github.com/kubernetes/kubernetes/tree/master/docs/api-reference>`_

	- build api testcases

	- execute

	- generate report


Following kubernetes workflow
-----------------------------

 tests will be executed on branch myfeature

.. image:: https://github.com/kubernetes/community/raw/master/contributors/devel/git_workflow.png

Jenkins integration
-------------------
	- `plugin <https://wiki.jenkins.io/display/JENKINS/Robot+Framework+Plugin>`_



Vscode Extension robotframework
------------------------------
.. image:: https://raw.githubusercontent.com/valdemarpavesi/kubeRobot/master/docs/vscode.png


History
-------

 iterate over json get api/v1
.. image:: https://raw.githubusercontent.com/valdemarpavesi/kubeRobot/master/docs/api_in_progress.png
