# Lab 1 Submission

## Part B
**Error Action Name:** Instance launch failed
You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/ccsad-g03 is not authorized to perform: <b> ec2:RunInstances </b> on resource: arn:aws:ec2:ap-southeast-1:548387266019:instance/* because no identity-based policy allows the ec2:RunInstances action. Encoded authorization failure message: wybh6ekb8bM4x1QHFMop3EDpzLB_98Xh7-UVid0b6DmCgaFUfYWca-k2i3ljTaIpnD8WgC4iVsN47R1dRFBmHSI0hvzqiTmZV2Z3K6GHN5Zqh7J7x8KuSLSiECD90mQOHtcDRiYik5eB09CqzQ_mRB8zVEIK8uPZ-YXIV0z66MyM5lapUWqKdC9Y6gfpVlvDIKIAtKJHu0DIAqQtosgXQv1UgXocNXR46Ny1tli8xM2gE61107cQIiaXn5VJkJtEg9KIr2Fz393nAD476ESiJiCSY5zmPI_U0K_1kBuxlXBUHM2wq9hUUkjUYCY-XkjVZ9XRfgqE_HLRD8KjuBGwh0ISKZjKGCoMJkshoXy4hw-_mrP9eNnvQV4l0f0rn7wJXmudpTq8QyIrP59qm8xuervrxHGue9YfPsgTQM9KpJqA-BBXwGuPZBzLIoD3ob2ldao3YFeBze3t9XRELSy8HWZitXWVS1A-7-66ang4C-IFzqhm57vvjj3E5fhjBDkZ9Z8GcxL4n-SH9N4nszKhkQ2lnRp6QHOd165YhFX6K4fFFyV3mzv2uPbjY9aWsJOka6IrH-JqCo6oPvme6Ru2xh66Rm7G_rl8mWY2qddCHPOx1naqSdaU95Ccsn-Um8bAvfQ-u9FqT4T26McHr8cEXreLHYH1dVHyS0ie5Y8tuej7NVUQ9P3g-Vel6axrpGkZZieMbsAdHKuWaQi91Zl01MBJGMSriQtbmw3FrXraEVGFoAvmka68CEKQqIdz3UDqGLjNDmk4foKJBMU6qxfJ-hscfFVOKwJp0RZMmuWhhkuPADq9GTJsmwFs

**Screenshot (Part B launch denial with username visible):**
![Part B Error](submissions\lab-1\images\part-b-error.png)

## Part C
**Policy Statement Blanks:**
- `"Action"`: ec2:RunInstances
- `"Resource"`: arn:aws:ec2:ap-southeast-1:548387266019:instance/*
- `"ec2:InstanceType"`: t3.micro

## Part D
**Security Group Error Text:** You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/ccsad-g03 is not authorized to perform: ec2:CreateSecurityGroup on resource: arn:aws:ec2:ap-southeast-1:548387266019:security-group/* because no identity-based policy allows the ec2:CreateSecurityGroup action. Encoded authorization failure message: aTo40gVpYRjcpkSt8dr0xvtp78BRRZ1wEfGrI8G035U05zGCeH7iMeWbqs4_Vvd-DZ_Pt-gOtz_x0Q8tjG9z-R15ae9hUMEsHv_JnVfv-g2enPShbajiUj1-E-Ul2n9ynHGbQnS1Pp73u4PjBUsjwTVsDqlokyplU2IGWoKZkK42kCvQYQQkDHLC7EYHzuEjLskh9oBPnPY9kCvsDOqysPAsEDB4j8OcUwTrvymY9PAILExALtFzXxJU8ZuWgvystpDNIFqUiZ-Twk7sRb-sM9pKl9XFP-NQSR-alL6ljXx0HU6-4XtCXStvHGaP82dWu2avY-BR4LC_I0WexnWv-fZdkftCobV0zmrsDxmOW3wzP0WKJbDvvfzzItHAS22LYJsYg9KdXx3D5E05WU_O7zZk_AVrT_2basdS1lHsXeHPzieIeyBqMbm2JwmP_kUHAD4rQboCoXIDKiZ-66WW-YgeXnP41_din-rWGr4KIoC0HaOd1hPZxeHg9vUNdrQHvh3-uzI8MoyrTeD_somvW-Vs95UcRqR7qDnL1PhMwQ

**Running Instance Time:** Tue Sep 22 2026 21:14:03 GMT+0800 (Philippine Standard Time) (4 minutes)

**Screenshot 1 (Permissions tab listing <user>-launch):**
![Permissions Tab](part-d-policy.png)  

**Screenshot 2 (Instance in Running state):**
![Running Instance](part-d-instance.png)

## Part E
**t3.small / Tokyo Denial Error:** Instance launch failed
You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/ccsad-g03 is not authorized to perform: ec2:RunInstances on resource: arn:aws:ec2:ap-southeast-1:548387266019:instance/* with an explicit deny in a permissions boundary: arn:aws:iam::548387266019:policy/umak-lab-boundary. Encoded authorization failure message: GGV-Wor_gjLuAhQTYeHDiFWgmnyUkz_pw47QST-AzLP22NzeRoFqtAHO0zO_VwhKM7hF-k3FBHv03jlb41Nog76xZ2tqBbTrB7OoOC0trFN4z9VN9wDmFFbNFOtejbSca0QMVx5rhGRpkVXq29krxLWq5ND_PVGodNYPuV9j7boE6v9Yglbtdv2Q5I2uIoTL5U53fm_FvXee7TOJioQ2eBW_vcGYXnVQUIkUDS3c7JUno9AmbNjIVgpXk9f5ajM61UKSSHHEcIre5Kd3j7zAaP3a8tnQoCGMHDhdP0IVY-xA8M4nnFgUtm9iw539fSm1-D4TV-hV4a5aeIfHvtK8dVv7bNBsneb72fI92I4s758jC6HDpieDCtzKl1S6q0Z4vlzU2EkbnWC78LX04omfEBYgvCiId9G2RsCmR6MSZcLDfPE5AXZGkHKYX2_88FE3Va_wJ1WhDGkXoqc9jmDtFNm3hFz6jrlXIy--RXqVP-g6Chu8alFT90-qJ7O49lhzA2_2SlRuv_YNcU7s_2AVzawpRe08TDgo4-BxYynvXVcWW2xXYRgE6YPkD-vpdvfsVCcdK_fAPqCfSBXBkHOr_mYx6VOuXwxpcLaPK1-JaiEtqkLfB-_DXIq3GxK5xXJEtq5gn5eBfvEYWn-O-lEnvXMob2W_mYnWsE-xLERKGcBe2AGyFPgruGLGOapn4RMsYAINleRm0V6YiZmLC99TeCCWLWpHKIgsqYkMvZa-dY8XyDnYntO4gaHT8Eo3XYONMiIgILg7-0JGyGWhLw_gJQT4RuBoxxo-DEqJWFJEB0txTFzzJwujd2B7RbJ0Xlt5jPJ6QJDd0xJk7pnpf_GKUZ3DaqN3POy7YiAOOUzstP9htn5fCiQo2Tl4hiWaG8nzDCJcpXJLDSsGRR2V4KVcy075vd-muMBSYkw-kGlvIxr0lTkwlGfMxfJXNwL154k

**Screenshot 1 (t3.small or Tokyo denial):**
![Boundary Denial](part-e-denial.png)

**Screenshot 2 (CloudTrail event showing errorMessage):**
![CloudTrail Event](part-e-cloudtrail.png)

## Part F Questions
1. Which action did the Part B error name?
   The action named was ec2:RunInstances.
2. In your policy, which condition limits `ec2:RunInstances`?
   The condition that limits ec2:RunInstances checks that the instance type is exactly t3.micro.   
3. After you attached `ec2:*` on `*`, why was `t3.small` still denied? Name the boundary statement.
   It was denied because the permissions boundary overrides the identity policy and prevents launching instance types other than t3.micro. The boundary statement is DenyAnyInstanceTypeButT3Micro.
4. Why is `ec2:*` on `*` a poor policy even with a boundary?
   ec2:* on * is a poor policy because it gives very broad permissions that violate the principle of least privilege. It allows actions that may not be necessary and could become risky if they are not restricted by the permissions boundary.
5. In two sentences: what does the boundary control that your policy cannot?
   A permissions boundary controls the maximum permissions an IAM user can have, even when an identity policy grants more permissions. An identity policy can only provide permissions within the limits allowed by the boundary.
