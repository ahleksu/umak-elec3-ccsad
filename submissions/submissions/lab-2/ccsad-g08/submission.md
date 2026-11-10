# Lab 2 Submission

## Instance Tracking

**First Instance**

- Instance ID: i-0c034f8f1a19a802b
- Availability Zone: ap-southeast-1b

**Second Instance**

- Instance ID: i-0c034f8f1a19a802b
- Availability Zone: ap-southeast-1b

## Proof (Screenshots)

1. **Activity History:** Add a screenshot showing the Auto Scaling group's Activity history when the second instance launched.

   _screenshots/activity-history.png_

2. **CloudWatch Alarm:** Add a screenshot of the target tracking alarm in the "In alarm" state.

   _screenshots/cloudwatch-alarm.png_

## Questions

1. Why did the group stop at 2 instances?
   Because we set the maximum capacity to 2. The group can never go above the maximum, even if the CPU is still high.
2. Why did terminating an instance by hand not remove the cost?
   Because the group must keep its minimum number of instances. When we deleted one, the group saw it was missing and started a new one. So we still pay for the same number of servers.
3. Why is the target value set to your assigned value (e.g., 30-85 percent) instead of 99 percent?
   Our target is 65 percent. A new server needs time to start and get ready. If the target is 99 percent, the server may already be too busy or crash before the new one is ready. A lower target starts a new server early, so there is still some free CPU.
4. What did the automatic cutoff protect us from?
   It protected us from extra AWS charges. If we forget to delete the group after class, the servers keep running and we keep paying. The cutoff stops them for us.
5. What changes when a load balancer sits in front of the group?
   Users get one address (the load balancer DNS name) instead of many IP addresses. The load balancer sends each request to a healthy server, so the traffic is shared between the instances. Users do not need to know the IP of each instance.
