# Seatwork 2: Build Your Group Linktree Page

This is a self-guided activity. Your group builds one web page, like a linktree: one page that introduces each groupmate and links to their profiles. In [Seatwork 3](../seatwork-3/README.md), you put this page on the internet with Amazon S3. So you build it as one file that a storage service can send as it is.

Work through this page first. It explains what you build and why each part is there. Then follow the steps in [`seatwork.md`](seatwork.md).

![The baseline page: four groupmate cards with an avatar, GitHub and LinkedIn icons, and a favorite AWS service badge](../../assets/screenshots/seatwork2-baseline.png)

## What you do

This is group work. Your group submits one Pull Request.

1. Copy the baseline page, [`baseline/index.html`](baseline/index.html).
2. Change the header to your group number and section.
3. Make one card for each groupmate. A card has a first name or nickname, a short bio, a role, GitHub and LinkedIn links, and a favorite AWS service.
4. Optional: change the design of the page for up to 5 bonus points.
5. Submit one Pull Request. Then one groupmate puts its link in the Google Form.

You do not need AWS for this seatwork.

## Key ideas

### One page, one file

A static website is a set of files that a server sends as they are. Your page is one file, `index.html`. Everything that the page needs is inside that file: the text, the style, and the icons. Seatwork 3 uploads only this file, so the page must not load other files from your computer.

### The parts of the page

| Part | What it does |
| --- | --- |
| `<head>` | Holds information about the page. The browser does not show it on the page. |
| `<title>` | The text on the browser tab. |
| `<meta name="viewport" ...>` | Makes the page fit the screen of a phone. |
| `<style>` | The colors, the fonts, and the layout. The `:root` block at the top holds the theme colors. |
| `<section class="member">` | One groupmate card. Copy a whole block to add a card. |
| `<a href="...">` | A link. The `href` is the address that the link opens. |

### Icons by ID

The bottom of `index.html` holds an icon library: GitHub, LinkedIn, and 21 AWS services. A card shows an icon with `<use href="#...">`. To change an icon, change only the ID:

```html
<svg aria-hidden="true"><use href="#aws-lambda"></use></svg>
```

The comment at the top of `index.html` lists every ID with its service page. [`seatwork.md`](seatwork.md) shows all 21 icons.

### A public page

In Seatwork 3, anyone with the link can open your page. Put only what you are comfortable to share. The privacy rules are in [`seatwork.md`](seatwork.md).

## How you submit

Submit one Pull Request per group to this repository. Then one groupmate submits the Pull Request link in the Google Form: https://forms.gle/4CFvibdjNYqjyjGx5. Both are due on Friday, November 6, 2026, at 11:59 PM (Asia/Manila).

## Files in this folder

| File | What it is |
| --- | --- |
| [`README.md`](README.md) | This page: what you build and the key ideas. |
| [`seatwork.md`](seatwork.md) | The privacy rules, the requirements, the scoring, the bonus, and the steps. |
| [`baseline/index.html`](baseline/index.html) | The baseline page for a made-up Group 0. Copy it and change the content. |
| [`contribution-template.md`](contribution-template.md) | Copy it to your submission folder as `contribution.md`. |
