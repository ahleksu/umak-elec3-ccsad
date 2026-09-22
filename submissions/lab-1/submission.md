# Lab 1 Submission

## Part B
**Error Action Name:**

Instance launch failed

You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/ccsad-g01 is not authorized to perform: ec2:RunInstances on resource: arn:aws:ec2:ap-southeast-1:548387266019:instance/* because no identity-based policy allows the ec2:RunInstances action. Encoded authorization failure message: DJ01OZIOyHv3250frGBXMsMAH4SgdJfSXdrREhsIKjjgG1yiR_-Ns_Z23tMrTyOrdz_AkOQV0YpIFKyBn488dUdkEL6c__sKu3dZjikBQQ0GbYIVKIYfZUTZ9qqMo62SwEels-NiRf3ls3E7K1i3IOmsnmyovmypF74VaCytVR_tHvZdzFHrI6grjmzeyWwgYT-B74BpqXHlNiUW4jxtUJdb8MJHZU_06mEFCuZgOUE6z6MZczZrkhuA7sDxDQlwUkVcJHknwMBCeCh7LkXqVAga0gA6ZSIC5F1V95zZhG16loymb4UseCthiKAHIf8s3eW3SKsxM27tZd2KHb9j4up9O5Rcz-8TqYy4jjOU8buCDm0GA0dEhkaGnRsjGqy1WnOEYZLVteJyKcOgRPVUaeoJH3UZM5EINzFNoKo4VnWCu0ud3brFchn7QNRgRZsmiYKML-gmluh1d52lx9G-rF_J5AiMgsADu_JYjN2u7fh8S2Pab5I5X0whtqWcg5grDvUQXT9WGqKD-lg5Ac_vn-c7WycdDgsP05dX0dY4P5nbdhZQOCXyrTkYAZIjSbrg5cFWVQ3ZDJlqriuC3Ai3Lpho_SkJxOO-oeMoSp-mAdDzLL_nuI3Po71VjFi5ATpPdhNk2ZJiu-ZgRwSlNAA8LiZ6gNrkAJn7_hG3__7AFWAIF9ZLFty27T0azA23tMFNW8YLFN6vsT3PqeEtG4qNTFq6Km7SSRuCEGTt022hJqrpGU2isDnMjemS3-dKn67JUYTuTpoZEiGSkslCYvyxh2emDSl_9mxQN-C8dcl3f3ylLwTnQ8aHT0cXhw
<img width="1471" height="741" alt="PartBError" src="https://github.com/user-attachments/assets/a90e7016-8c11-40ef-8758-cbfea73f632a" />


## Part C
**Policy Statement Blanks:**
- `"Action"`: "ec2:RunInstances"
- `"Resource"`: "instance"
- `"ec2:InstanceType"`: "t3.micro"

## Part D
**Security Group Error Text:** 

You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/ccsad-g01 is not authorized to perform: ec2:CreateSecurityGroup on resource: arn:aws:ec2:ap-southeast-1:548387266019:security-group/* because no identity-based policy allows the ec2:CreateSecurityGroup action. Encoded authorization failure message: f4VTrL4NQaTplzT6hfBVxXhhFMwfSIBdZo1t1Gq3hg1L910JZL-BK7sHSQLW0zjsr791OscvU5Dhh-9EDgDI88nLh9Bg7vHGDif4asngSgEcZcgYzmtOHm3aORBT1ppdvlBwji7_LUj8pz9NRA-V7Q8EdLaWbSUj4ID1sRcOnpyqFhFpI3OMfKacd-ez2pOv8GYtqf5UCzKoU8rs-PgXNL_MgIhT5eiaYxJheVET0DGXiKMA7Uq3FmGp5I4vb8SFRwEhVnRUdCzI3J5QBJz34I6Db5R3c4p7TqJdcrJwGofTkEPS2dLHDLZvDa7I7Fm0Dp4qTwYsSwUijAKYEygCw8FkEtoSDJA1GjZKakakbxHhmK9B3MFPFug6E2cASsHSL_B1ZlCEyH2zvQlU84HF1LSq2diGZgXWKnROL7_NoeIN_3myczoyb_UmHKtW9UtdJ8maeLJuzDdK7KYmEghlGUMsizvd6YdZXNB8yh0oK4mocd0CSOovgGU5To5CbI4S1LD5xYGpMRJOn5birMu-4U3UDEFAoecBd8TvlFvVugI

**Running Instance Time:** 20:30 UTC+8

Screenshot of the instance in the Running state.
<img width="1609" height="110" alt="Screenshot 2026-09-22 214618" src="https://github.com/user-attachments/assets/026cffd2-b1db-46fc-91a5-49fb1a5e074b" />
<img width="1877" height="908" alt="Screenshot 2026-09-22 205047" src="https://github.com/user-attachments/assets/6c463a7b-fa8b-4ca1-88a8-f24ad1046212" />
(Sorry, I was not able to take a screenshot of it in a running state I hope this will suffice

## Part E
**t3.small / Tokyo Denial Error:** 

Instance launch failed

You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/ccsad-g01 is not authorized to perform: ec2:RunInstances on resource: arn:aws:ec2:ap-southeast-1:548387266019:instance/* with an explicit deny in a permissions boundary: arn:aws:iam::548387266019:policy/umak-lab-boundary. Encoded authorization failure message: 2ch8hvhEf0Ft6UnGeAWRGjPCEUJ_aCxWXRcB4617846Uslwi1b6KCp9YTLVwyO9rZZK7WD1cXHOy8hCZ1YqFR83c-ty7ae9c3aEq_co99WWJgnpI11LQ805eh_kRH0vYuaCt-WCNglhtvhZad0vFxB9MaPKo8mBsTcert-YVrqFGL30a1Nrsz2hRqTXsJalOs9pnzt6yKQXPCoA7KkN2q35l9sCOPbiSPoLAyMo6NWa_o8xRla0Vh_JwNti5AMnGnCCkw2OQ-iY-Qr-LPDrVLpsC3xmq-Ir1bRikBVIpjxAvWzgqYWPqtWJ7SU67r7hxRyjYLX7KJ--FVpV22r7Z4z-DD89ilI4Jy20J-LzuiE1bwJgVGQ5OpR3L5Px-g6E08QSuRPfdx0rqjAOulFH3TXhkfOcab-GnfxSHCNHb4fs5_gqZbogQObSGCkI7vrFM4XeYIj_ODoE5HlfuC5YMvSMI2idnsVA9sl2rHv-4Mj1Z8qDvBgHcl69e1EnbIgs5zWci1skHjfIVctgmZWdXK11ZeHMhWnht1O_Av4UrETSZnJ2qzGWTW3WeUvu9dwI7T3dJOpFDuN8_VIWwmky28gTniU-mDQuAaoHwPoxApN3aJLQkVxC6xPoijNQDqfLs_17ans7bYF98js1C3okERpfK8X25dCXEZlEfmkE8kukkq3pEAKt92Q6CWfwAHlfLJrCYJrG2uEtqYfNn-0SjyZjgeq55R6v2Gdn4rCgiD7glRxcP-DgcEDOJAOpL7jLM361UsY-DAN7xFz-ALr1IGvGU9INQE_agjBwOg9wEGvAV5tnwwmThQd7aAIgtgb6F2V-qrUMLJOTROjvR_LlNGCgkIvRZwCqWQE-Rgb0Be7i3yBO0QFkIoPGsDaJrvvtxOjJ-nmQuPEyf-ZIDHUvy3itPdbGdbn0Z5QOHa6rLZkQGO2Uoz7yi_6vSurD272g
<img width="1880" height="894" alt="PartEError" src="https://github.com/user-attachments/assets/410411f9-a8b1-453e-a15e-a01ee8fedb33" />

The AMI ID (ami-06380d26ad7176f2c) is not valid. The AMI might no longer exist or may be specific to another account or Region.
<img width="973" height="556" alt="Screenshot 2026-09-22 213416" src="https://github.com/user-attachments/assets/a520b9b0-b7a5-4de0-b845-cf30d240d6ee" />

No VPCs found, either this account doesn’t have any VPCs in this region or an invalid search has been entered. Please refine the search query, create a new VPC or create a new default VPC
<img width="1858" height="885" alt="Screenshot 2026-09-22 203723" src="https://github.com/user-attachments/assets/f6da880b-6322-4310-a088-c089d4914587" />

**CloudTrail errorMessage:**

User: arn:aws:iam::548387266019:user/ccsad-g01 is not authorized to perform: ec2:RunInstances on resource: arn:aws:ec2:ap-southeast-1:548387266019:instance/* with an explicit deny in a permissions boundary: arn:aws:iam::548387266019:policy/umak-lab-boundary.
<img width="1867" height="927" alt="Screenshot 2026-09-22 205930" src="https://github.com/user-attachments/assets/94ca3189-07f9-480c-b009-bfc8ac323b54" />

## Part F Questions
1. Which action did the Part B error name?
   It named the action `ec2:RunInstances`.
2. In your policy, which condition limits `ec2:RunInstances`?
   The condition that limits it is `"ec2:InstanceType": "t3.micro"`.
3. After you attached `ec2:*` on `*`, why was `t3.small` still denied? Name the boundary statement.
   It was denied because the boundary statement `DenyAnyInstanceTypeButT3Micro` acts as an absolute limit, explicitly blocking it and overriding the wide allow policy.
4. Why is `ec2:*` on `*` a poor policy even with a boundary?
   It violates the principle of least privilege. If the account is compromised, an attacker has full control to modify or delete anything permitted within the boundary, rather than only having access to the specific resources needed for the job.
5. In two sentences: what does the boundary control that your policy cannot?
   The boundary establishes the maximum possible permissions, such as restricting actions to specific regions or instance sizes, enforced by an administrator. Your user policy can only grant permissions within that strict predefined perimeter.
