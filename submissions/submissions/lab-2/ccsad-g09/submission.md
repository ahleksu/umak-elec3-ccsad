# Lab 2 Submission

## Instance Tracking
**First Instance**
- Instance ID: i-0ec832b002ebf9230
- Availability Zone: ap-southeast-1a

**Second Instance**
- Instance ID: ap-southeast-1b
- Availability Zone: ap-southeast-1b

## Proof (Screenshots)
1. **Activity History:** Add a screenshot showing the Auto Scaling group's Activity history when the second instance launched.
   
   <img width="1598" height="245" alt="image" src="https://github.com/user-attachments/assets/2cb6fe96-f62d-4fb7-afab-6ef7e4888565" />


2. **CloudWatch Alarm:** Add a screenshot of the target tracking alarm in the "In alarm" state.

   <img width="1918" height="938" alt="image" src="https://github.com/user-attachments/assets/2b8ef835-a36a-4e60-bc98-e27fdbc6cdd3" />


## Questions
**1. Why did the group stop at 2 instances?**
   The Auto Scaling group's maximum capacity was set to 2. Even though the CPU stayed above our target value of 70% while /burn was running, the group is never allowed to launch more instances than its maximum. Once it reached 2, scale-out stopped, no matter how high the load was.
**2. Why did terminating an instance by hand not remove the cost?**
   The Auto Scaling group always tries to keep the number of running instances equal to its desired capacity. When we terminated one instance, the group saw it was below that number and launched a replacement within a few minutes. We were still paying for the same number of instances. To actually stop the cost, you have to lower the desired capacity or delete the Auto Scaling group itself, not the individual instances.
**3. Why is the target value set to your assigned value (e.g., 30-85 percent) instead of 99 percent?**
   Launching a new instance is not instant. It takes a few minutes to trigger the alarm, boot the instance, run the user data, and finish the warmup. If the target were 99%, the server would already be overloaded before scaling even started, and users would get slow or failed responses while waiting for the new instance. A lower target like our [your value]% leaves headroom so extra capacity arrives before the server is maxed out. Also, average CPU can never go above 100%, so a 99% target would be hard to reach reliably and scaling might barely trigger at all.
**4. What did the automatic cutoff protect us from?**
   It protected us from forgotten resources that keep running and costing money after the lab. If a team didn't finish cleanup, or the group stayed at 2 instances, those instances would keep billing hourly, and the group would keep replacing any instance that was terminated. The cutoff ends the group automatically so there are no unexpected charges.
**5. What changes when a load balancer sits in front of the group?**
   Users get one single address instead of having to open each instance by its own public IP like we did. The load balancer spreads incoming traffic across all healthy instances, so new instances start receiving traffic automatically when the group scales out. It also runs health checks and stops sending traffic to broken instances, and the Auto Scaling group can use those health checks to replace unhealthy instances. The instances also no longer need public IPs, which is more secure.
