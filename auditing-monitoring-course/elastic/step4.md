## What is brute force attack?

A brute force attack, also known as exhaustive search, is a cryptographic hack that relies on guessing possible combinations of the target password until the correct one is found. The longer the password, the more combinations need to be tested. Brute force attacks can be time consuming and difficult, and sometimes impossible, to perform if methods such as data obfuscation are used. However, if the password is weak, it may take only a few seconds and require almost no effort. For an attacker, weak passwords are like shooting fish in a barrel, which is why all organizations should enforce strong password policies across all users and systems.

You can learn more from [here](https://www.forcepoint.com/zh-hant/cyber-edu/brute-force-attack)

<br/>

### Scenario

A developer have access to our remote mysql container, but he is not a database administrators, he don't have privileges to access all the tables. He wanted to steal our company data, he know our DBA username and now he is trying to brute force the DBA password.

<br/>

### Create an detection rule

For detecting this kind of attacks, we could create a detection rules that would alert us when the rule's criteria are met.

You can learn more from [here](https://www.elastic.co/guide/en/security/current/rules-ui-create.html#rules-ui-create)

Open the main menu, then click to Security > Overview.

![Image](./assets/sec_menu.png)

Under the **detect** title click **Rules**, then click **Create new rules**

![Image](./assets/new_rule.png)

<br/>

### Define rule

1. Select the rule type as **Threshold**
2. Enter `db-*`{{copy}} for the index pattern

![Image](./assets/rule_1.png)

Enter `not audit_record.status : 0 AND audit_record.name : Connect`{{copy}} for the KQL query
<br/>
<br/>
`not audit_record.status : 0` means select all with record with unsuccessful login
<br/>
`audit_record.name : Connect` The type of the record, “Connect” means login

(The [Kibana Query Language](https://www.elastic.co/guide/en/kibana/7.15/kuery-query.html) (KQL) offers a simplified query syntax and support for scripted fields. )

Input `10` for **Threshold**, the click **Continue** (The detection rule will trigger if any user login failed 10 or more times)

![Image](./assets/rule_1_2.png)

<br/>

### About rule

For the **Name** enter `Possible brute force attack`{{copy}}

For the **Description** enter `Any user login failed 10 or more times`{{copy}}

Default severity `high`, the click **Continue**

![Image](./assets/rule_1_3.png)

<br/>

## Schedule Rule

For testing purpose we set schedule to run in every `5 seconds`, the click **Continue**

![Image](./assets/rule_1_4.png)

<br/>

## Alerting

Once the rule's criteria are met we can alert it to a connector. In this case, we use `Slack`

1.  First setup an account in [slack](https://slack.com/get-started#/createnew)
2.  The Go to https://my.slack.com/services/new/incoming-webhook
3.  Select a default channel for the integration, then click **Add Incoming WebHooks integration**

![Image](./assets/slack_1.png)

Copy your Webhook URL

![Image](./assets/slack_2.png)

Back to Kibana, Click **slack icon** > **Create a connector**, then enter **Name** and paste the **Webhook URL** > Click **Save**

![Image](./assets/slack_3.png)

Change the Message to `Possible brute force attack! Rule {{context.rule.name}} generated {{state.signals_count}} alerts`{{copy}}

Click **Create & activate rule**

![Image](./assets/slack_4.png)

## Simulate a brute force attack in the database container

Run `docker exec -it db bash`{{execute}}

Run `for i in {1..20}; do mysql -u root; done`{{execute}} for simulating brute force attack (generate fail login for 10 times)

You will now see an alert message pop up in your slack channel

![Image](./assets/slack_5.png)

In security > overview you will also see alert is triggered

![Image](./assets/slack_6.png)
