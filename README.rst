kubeRobot
===============


.. image:: https://raw.githubusercontent.com/valdemarpavesi/kubeRobot/master/docs/kuberobot.png

.. contents::
   :local:


test kubernetes api by robot

https://kubernetes.io/

http://robotframework.org/


first testcase
--------------

.. code:: kubeRobot

	# robot kuberobot.robot
	==============================================================================
	Kuberobot :: REST kubernetes.
	==============================================================================
	Get Requests                                                          | FAIL |
	InvalidSchema: No connection adapters were found for '127.0.0.1:8080/api/v1/configmaps'
	------------------------------------------------------------------------------
	Kuberobot :: REST kubernetes.                                         | FAIL |
	1 critical test, 0 passed, 1 failed
	1 test total, 0 passed, 1 failed
	==============================================================================
	Output:  /home/kuberobot/output.xml
	Log:     /home/kuberobot/log.html
	Report:  /home/kuberobot/report.html
	#

Reports
-------

<https://github.com/valdemarpavesi/kubeRobot/blob/master/report/report.html>
