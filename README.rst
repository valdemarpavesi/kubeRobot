kubeRobot
===============


.. image:: https://raw.githubusercontent.com/valdemarpavesi/kubeRobot/master/docs/kuberobot.png

.. contents::
   :local:


test kubernetes api by robot

https://kubernetes.io/

http://robotframework.org/


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

.. image:: https://raw.githubusercontent.com/valdemarpavesi/kubeRobot/master/docs/passed.png

Reports
-------

`report.html <https://rawgit.com/valdemarpavesi/kubeRobot/master/report/report.html>`_


Requirements
------------

	- `read api docs <https://github.com/kubernetes/kubernetes/tree/master/docs/api-reference>`_

	- build api testcases

	- execute

	- generate report

Following kubernetes workflow

tests will be executed on branch myfeature
-----------------------------
.. image:: https://github.com/kubernetes/community/raw/master/contributors/devel/git_workflow.png
