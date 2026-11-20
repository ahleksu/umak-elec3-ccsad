# Lab 5 Submission

<!--
How to use this template:

1. Copy this file to submissions/lab-5/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Save cors-error.png, cors.png, site.png, and throttle.png in the same folder.
4. Crop the AWS console top bar out of cors.png, and cover every ARN.
5. Cover your API ID, the part between https:// and .execute-api, in cors-error.png, cors.png, and throttle.png.
6. Do not add your index.html. It holds your invoke URL.
7. Do not write full names or student numbers in this file.
-->

## About us

- Group number: Group-2
- Section: IV-CCSAD
- Group IAM user: ccsad-g02
- Website endpoint: http://umak-elec3-ccsad-g02-linktree.s3-website-ap-southeast-1.amazonaws.com
- HTTP API name: umak-elec3-ccsad-g02-api

## Screenshots

<img width="1365" height="632" alt="cors-error" src="https://github.com/user-attachments/assets/06bebaad-d43e-4cb9-8f61-e29b175d3151" />

<img width="1131" height="367" alt="cors" src="https://github.com/user-attachments/assets/3a9bba85-f3a3-45c7-b4e2-a3460f85782b" />

<img width="1360" height="681" alt="site" src="https://github.com/user-attachments/assets/802c3356-54e5-4f99-93ec-44523357ea7d" />

<img width="1365" height="713" alt="throttle" src="https://github.com/user-attachments/assets/75e28640-261d-4ca2-abd0-04bf2d51dee5" />


## Questions

1. In Lab 4, your API answered `curl` and the address bar of your browser. In Step 3, the same API did not answer your page. Why?

   Tools like `curl` and direct browser navigation do not trigger cross-origin security checks because they are not JavaScript requests coming from another website. When our S3 webpage used `fetch()` to call a different domain (API Gateway), the browser enforced its Same-Origin Policy and blocked the response until we configured CORS to explicitly allow our S3 origin.

2. Which pillar of the AWS Well-Architected Framework does your throttle serve? Explain in two sentences.

   This throttle serves the **Reliability** pillar of the AWS Well-Architected Framework. By capping the request rate and burst limit at API Gateway, it prevents sudden traffic spikes or automated floods from overwhelming our Lambda function and DynamoDB table so the guestbook stays available for normal visitors.

3. Your guestbook shows each message with `textContent`. What could a visitor do if the page put each message into the page as HTML with `innerHTML`?

   If the page used `innerHTML`, a visitor could perform a Cross-Site Scripting (XSS) attack by submitting malicious HTML or JavaScript—such as an `<img onerror="...">` payload—inside a guestbook message. Because `innerHTML` parses strings as live HTML rather than plain text, that code would run automatically in the browser of every person who visits our site, allowing the attacker to deface the page or redirect users to harmful links.
