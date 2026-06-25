Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEE13DC4D9
	for <imx@lists.linux.dev>; Thu, 25 Jun 2026 11:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782387635; cv=none; b=rf+CqEiCmm+U8HBS4KFYeHyMIujUAAVpFZiF8TaH5AJEZ6w0QDXMRZ2gJ7n7mkP874UQz0lviuOjHtav2lyxWFvm/MOISMZ8vjtj1cSVoMhVrqh2t7zyaMdqbGadlzbT7HAke8n6w74ECbP13p9JZkKpjpjJi6ukGjE/6DD76zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782387635; c=relaxed/simple;
	bh=ci40DDFqpS9nCWrejDJsGYOsz5HubUqdwwaK37R18yM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DTgeOMlJbapSu1tgLzXrt8XYEBZrIGb3SE8YDFbW6psuzjbmVHi24UuJe6h5ssDDAcXO2irMMeWjv85fZ6pV+7OCT/9/CasGg6YSQiaxQnWaY5dgh3cfBvyPPkGSTExao5EJUCxzAd6vCorQAB01Fenr5IycyqoazeyqIg6cSHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gBkqi6nk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gBkqi6nk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7585B1F000E9;
	Thu, 25 Jun 2026 11:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782387632;
	bh=I9oBJrZE3vQFyVdthswFqPXCi0g/oZ+kwxd4QHuxmQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gBkqi6nkustD5VXCERIIytgxlKRqSRvGgyMBfX1ebvs2V7deCYhpkMUcUrJzUBKeF
	 CR0vmVk7o7niDkZCf/XLVbOPW6vYgQitrmB603z6c+gIJIhK8S4htmyupuPRglADpC
	 NN1vooK98N+G9Y0OBmuIFwRehNkRCR8hi+UsKgCSFEoHEfgWPPxcZpSaKGL8H6vsgk
	 PH1ANT/KeJEB5O9BDD9PMlPEfZtD+W14jaht3kzfvHLY4AFBSDNaw2/kS99BlGO0Q7
	 T1f2LlBaHfXn+GO47IIUCcy0w5Pm3Qbae/9Cj2ByhUp0xZnXc2ave6G9G3QI6ACbiG
	 rLkLMOCF74XUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: fix inverted NULL check
 after kstrndup()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260625113154.1954813-1-xu.yang_2@oss.nxp.com>
References: <20260625113154.1954813-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 11:40:31 +0000
Message-Id: <20260625114032.7585B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing workqueue cancellation and queue cleanup before freeing `a=
udio` context.
- [High] Unbounded memory leak of `usb_request` objects and buffers upon al=
ternate setting changes.
- [High] Improper handling of `f_audio_buffer_alloc` failure leads to subse=
quent UAF or ERR_PTR dereference.
- [High] `audio->copy_buf` is not cleared when queued on `alt=3D0`, causing=
 double list additions.
- [High] The playback workqueue only processes one buffer per run, strandin=
g/leaking buffers.
- [High] A 1-byte out-of-bounds write of a NUL byte occurs in `f_uac1_opts_=
##name##_show` when reading a string attribute of maximum length.
--

commit 1d07b1a645b0a1199b66ed32d3217e953cef8087
Author: Xu Yang <xu.yang_2@nxp.com>
Date:   Thu Jun 25 11:31:54 2026 +0000

usb: gadget: f_uac1_legacy: fix inverted NULL check after kstrndup()
   =20
This patch fixes an inverted NULL check on the result of kstrndup() in
f_uac1_opts_##name##_store(). The original code treated a successful
allocation as an error and would return -ENOMEM while proceeding with a
NULL pointer on failure.

> diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/ga=
dget/function/f_uac1_legacy.c
> index 5d201a2e30e7f..e9f2632ce7852 100644
> --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> @@ -914,7 +914,7 @@ static ssize_t f_uac1_opts_##name##_store(struct conf=
ig_item *item,	\
>  		goto end;						\
>  									\
>  	tmp =3D kstrndup(page, len, GFP_KERNEL);				\
> -	if (tmp) {							\
> +	if (!tmp) {							\
>  		ret =3D -ENOMEM;						\
>  		goto end;						\
>  	}								\

[Severity: High]
This is a pre-existing issue, but does f_uac1_opts_##name##_show() have an
out-of-bounds write here?

drivers/usb/gadget/function/f_uac1_legacy.c:UAC1_STR_ATTRIBUTE() {
    ...
static ssize_t f_uac1_opts_##name##_show(struct config_item *item,	\
					 char *page)			\
{									\
...
	result =3D sprintf(page, "%s\n", opts->name);			\
    ...
}

If a user writes an attribute of exactly 4095 bytes, kstrndup stores it with
a length of 4095. During a subsequent read, sprintf() writes the 4095
characters, appends a newline (byte 4096), and then writes the NUL terminat=
or
at index 4096, which overflows the 4096-byte page allocation by 1 byte.
Could this use sysfs_emit() or scnprintf() instead?

[Severity: High]
This is a pre-existing issue, but does f_audio_free() leak resources or cau=
se
a use-after-free?

drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_free() {
    ...
static void f_audio_free(struct usb_function *f)
{
	struct f_audio *audio =3D func_to_audio(f);
	struct f_uac1_legacy_opts *opts;

	gaudio_cleanup(&audio->card);
	opts =3D container_of(f->fi, struct f_uac1_legacy_opts, func_inst);
	kfree(audio);
    ...
}

The audio structure is freed without cancelling the asynchronous
audio->playback_work or draining audio->play_queue. If the workqueue is
pending or executing, it will dereference the freed audio object. Any
elements left in the queue are also leaked.

[Severity: High]
This is a pre-existing issue, but does f_audio_set_alt() leak usb_request
objects and buffers?

drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_set_alt() {
    ...
			for (i =3D 0; i < req_count && err =3D=3D 0; i++) {
				req =3D usb_ep_alloc_request(out_ep, GFP_ATOMIC);
				if (req) {
					req->buf =3D kzalloc(req_buf_size,
							GFP_ATOMIC);
    ...
}

When the interface is set to alt =3D=3D 1, requests and buffers are dynamic=
ally
allocated. However, when the host stops the stream by switching to alt =3D=
=3D 0,
these are never freed. Repeated toggling of the alternate setting could
quickly exhaust system memory.

[Severity: High]
This is a pre-existing issue, but does f_audio_out_ep_complete() improperly
handle f_audio_buffer_alloc() failures?

drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_out_ep_complete() {
    ...
		schedule_work(&audio->playback_work);
		copy_buf =3D f_audio_buffer_alloc(audio_buf_size);
		if (IS_ERR(copy_buf))
			return -ENOMEM;
	}

	memcpy(copy_buf->buf + copy_buf->actual, req->buf, req->actual);
    ...
}

If f_audio_buffer_alloc() fails, it returns -ENOMEM immediately, but
audio->copy_buf is left pointing to the old buffer that was just queued for
playback. A subsequent completion would write to this old buffer, potential=
ly
causing a use-after-free.

[Severity: High]
This is a pre-existing issue, but does f_audio_set_alt() incorrectly leave
audio->copy_buf populated when queued?

drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_set_alt() {
    ...
		} else {
			struct f_audio_buf *copy_buf =3D audio->copy_buf;
			if (copy_buf) {
				list_add_tail(&copy_buf->list,
						&audio->play_queue);
				schedule_work(&audio->playback_work);
			}
		}
    ...
}

The copy_buf is added to the play_queue, but audio->copy_buf is not cleared.
If the host issues consecutive SET_INTERFACE 0 requests, the driver will
attempt to add the same buffer to the list again, which corrupts the
doubly-linked list.

[Severity: High]
This is a pre-existing issue, but does the playback workqueue strand buffer=
s in
the play queue?

drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_playback_work() {
    ...
	spin_lock_irq(&audio->lock);
	if (list_empty(&audio->play_queue)) {
		spin_unlock_irq(&audio->lock);
		return;
	}
	play_buf =3D list_first_entry(&audio->play_queue,
			struct f_audio_buf, list);
	list_del(&play_buf->list);
	spin_unlock_irq(&audio->lock);
    ...
}

The work item pulls and processes exactly one buffer per execution. If
f_audio_out_ep_complete() adds multiple buffers quickly, schedule_work() may
coalesce the work items. Since there is no while(!list_empty()) loop, any
coalesced buffers are left stranded in the queue, leaking them when the str=
eam
stops.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625113154.1954=
813-1-xu.yang_2@oss.nxp.com?part=3D1
