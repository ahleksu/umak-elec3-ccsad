# Lab 2 Submission (EXAMPLE)

*Note: This is an example of what your submission should look like. Do not copy these fake answers.*

## Instance Tracking
**First Instance**
- Instance ID: i-0abc123fake456789
- Availability Zone: ap-southeast-1a

**Second Instance**
- Instance ID: i-0def987fake654321
- Availability Zone: ap-southeast-1b

## Questions
1. Why did the group stop at 2 instances?
   (Example answer): Because we configured the maximum capacity limit to X, preventing the Auto Scaling group from scaling beyond that number.
2. Why did terminating an instance by hand not remove the cost?
   (Example answer): Because the service automatically attempts to maintain the minimum capacity, so it replaced the deleted instance with a fresh one.
3. Why is the target value 40 percent and not 90 percent?
   (Example answer): If the target was 90 percent, the server might crash from overload before the new replacement instance finishes booting up and passing health checks.
4. What did the automatic cutoff protect us from?
   (Example answer): It protected the AWS account from accumulating unexpected charges if we forgot to clean up the running resources after class.
5. What changes when a load balancer sits in front of the group?
   (Example answer): A load balancer provides a single entry point (DNS name), so users wouldn't have to manually type the IP addresses of the individual instances to reach the application.
