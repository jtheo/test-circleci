# Test background jobs in CircleCI

I need to test what happens and how to manage multiple jobs running in background in a Circleci pipeline without using the [circleci's attribute "parallel"](https://circleci.com/docs/2.0/parallelism-faster-jobs/)

The config.yml after installing a couple of packages is running:
*dummy.sh* that will run in parallel another script *sleeper.sh*

This is doing some calls to an [amazing webservice](https://randomuser.me/) to emulate what I have to do in the real task and waiting for a ${RANDOM} number, between 1 and 10, of seconds.

If the ${RANDOM} number is equal to 1 or 6 (just picked a couple of numbers), the script will put a "Error" message in the output of the task that can be later be grepped.

When all the background jobs completed their tasks, there's a script that shows how long it would have taken to execute in sequence.

After that, it'll be called in sequence a script to check if there's an error in one or more of the logs and it'll show stopping the circleci pipeline otherwise it'll show the output of the successful tasks.

The output:
![successful part](https://raw.githubusercontent.com/jtheo/test-circleci/master/img/circleci_1.png)
![unsuccessful part](https://raw.githubusercontent.com/jtheo/test-circleci/master/img/circleci_2.png)

