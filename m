Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972EC3603E9
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 05:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783919697; cv=none; b=gamhK3si7VQGd67NoeTASxyosH1fKXzVdtGTo7a9vW5VR7aXCTew2RtbH+xTEsnnueVusLp2c97Gj0uFNFH/VlxZ6vNw2AGbcgo5dGZBrGyMBPLDIPT601nLWH4qSKcXdy0AcyOA4oAlgj0oHH6vqu4s3sbPTuI9ngqr23cDRC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783919697; c=relaxed/simple;
	bh=XDhxNgdftgcIBdzu+r5t39bU+vvZxfZSf8dSHSNcKwk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qM+mvJmC5w4qbLdhfiLSdV4WmmnkB47U2qcVZq3F4NSMIRFjSGCo+I99yenTfylwU9KxLS5oEsYqcgusRzuCJQywJhCneyu3rxs0aQZYEkJoROyqpjwfNf8wwqQ2G16G7Z1aiBdvaW7/Eb5l+LIOKlcqCvAJUUvfavuYScR98m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D01j+oLg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D01j+oLg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0421F000E9;
	Mon, 13 Jul 2026 05:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783919696;
	bh=b4114wCx82KoHgxNoRKiElxc/zxYZ1ijGmow2x8/kZs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D01j+oLga8P6FoJUq+D7KDPqrUgErGsmQUtv1+h0Igg1aJnmfFMsHfCKGsUAL6UMV
	 B2SsWa4pNdj3o+xwtDSMRNPE+fKGkNCC0NYUC8BkeU9HzUo3jiySR2KdGwz38Rowvs
	 94hfTWBLTRTkUQqTpehARrjSFjEF7IXtTm1thN/R/oDcc0oV32oimVNDfMr4UrShov
	 u5hq7hnivLzaqVSYyRt8W8toIgPfQJ28JeIjyM/BiPh1bgyAzz7yza+nTvgXEjReph
	 h0Whesog4vPWHPO3zg4/+HSw2ZJM3X9ERVu4V7GD0qejuK0qIshClX4PqVxPiQFrlE
	 oaEPegyVlzZ3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: remove broken string
 configfs attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260713050246.3739137-1-xu.yang_2@oss.nxp.com>
References: <20260713050246.3739137-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 05:14:55 +0000
Message-Id: <20260713051456.1C0421F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:

New issues:
- [Low] The commit removes dynamic string configfs attributes but leaves de=
allocation logic and state tracking intact, resulting in dead code.
- [Low] The patch leaves stale references to the removed configfs attribute=
s in user documentation.

Pre-existing issues:
- [Critical] Failure to allocate a new audio buffer in the completion handl=
er leaves a dangling pointer in audio->copy_buf, leading to List Corruption=
 and Use-After-Free.
- [Critical] Handling of alt =3D=3D 0 fails to stop the endpoint or clear a=
udio->copy_buf, leading to Use-After-Free and Double Free.
- [Critical] Failed buffer allocation assigns an error pointer to audio->co=
py_buf, which is later dereferenced as a valid pointer.
- [High] Missing cancel_work_sync() during gadget unbind leads to Use-After=
-Free in the playback workqueue.
- [High] Allocated usb_request objects and their buffers are never freed, c=
ausing a severe memory leak.
- [High] Unprotected list modification in f_audio_set_alt.
- [High] Premature hardirq enable in USB endpoint completion handler.
- [High] Missing queue drain loop in f_audio_playback_work causes unbounded=
 list growth.
- [High] Unvalidated audio_buf_size and req_buf_size configfs parameters al=
low a heap buffer overflow.
--

--- Patch [1]: [PATCH] usb: gadget: f_uac1_legacy: remove broken string con=
figfs attributes ---
commit 133e7d78a83d2788e14ca436593367567a36c8b9
Author: Xu Yang <xu.yang_2@nxp.com>

usb: gadget: f_uac1_legacy: remove broken string configfs attributes

The UAC1_STR_ATTRIBUTE macro defines configfs show/store handlers for
the fn_play, fn_cap, and fn_cntl string options. The attributes have been
broken and unused for many years, so remove them.

Link: https://lore.kernel.org/linux-usb/20260625113154.1954813-1-xu.yang_2@=
oss.nxp.com/

> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac1_legacy b/=
Documentation/ABI/testing/configfs-usb-gadget-uac1_legacy
> index b2eaefd9bc498..6a681d219f439 100644
> --- a/Documentation/ABI/testing/configfs-usb-gadget-uac1_legacy
> +++ b/Documentation/ABI/testing/configfs-usb-gadget-uac1_legacy
> @@ -5,8 +5,5 @@ Description:
>  		The attributes:
> =20
>  		audio_buf_size - audio buffer size
> -		fn_cap - capture pcm device file name
> -		fn_cntl - control device file name
> -		fn_play - playback pcm device file name

[Severity: Low]
Does this patch leave stale references to the removed configfs attributes
in user documentation?

Documentation/usb/gadget-testing.rst:
    ...
	fn_cap		capture pcm device file name
	fn_cntl		control device file name
	fn_play		playback pcm device file name
    ...

>  		req_buf_size - ISO OUT endpoint request buffer size
>  		req_count - ISO OUT endpoint request count
> diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/ga=
dget/function/f_uac1_legacy.c
> index 5d201a2e30e7f..b15f5e074f856 100644
> --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> @@ -888,60 +888,10 @@ UAC1_INT_ATTRIBUTE(req_buf_size);
>  UAC1_INT_ATTRIBUTE(req_count);
>  UAC1_INT_ATTRIBUTE(audio_buf_size);
> =20
> -#define UAC1_STR_ATTRIBUTE(name)					\

[ ... ]

> -UAC1_STR_ATTRIBUTE(fn_play);
> -UAC1_STR_ATTRIBUTE(fn_cap);
> -UAC1_STR_ATTRIBUTE(fn_cntl);

[Severity: Low]
With these attributes removed, does this leave dead code blocks in
f_audio_free_inst() that check the now-always-false allocation flags?

drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_free_inst() {
    ...
	opts =3D container_of(f, struct f_uac1_legacy_opts, func_inst);
	if (opts->fn_play_alloc)
		kfree(opts->fn_play);
	if (opts->fn_cap_alloc)
		kfree(opts->fn_cap);
	if (opts->fn_cntl_alloc)
		kfree(opts->fn_cntl);
    ...
}

And does it also leave permanently unused bitfields in
struct f_uac1_legacy_opts?

drivers/usb/gadget/function/u_uac1_legacy.h:struct f_uac1_legacy_opts {
    ...
	unsigned			fn_play_alloc:1;
	unsigned			fn_cap_alloc:1;
	unsigned			fn_cntl_alloc:1;
    ...
}

>  static struct configfs_attribute *f_uac1_attrs[] =3D {
>  	&f_uac1_opts_attr_req_buf_size,

[ ... ]

[Severity: High]
This is a pre-existing issue, but does f_audio_free() lead to a use-after-f=
ree
if the playback workqueue executes on the freed memory?

drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_free() {
    ...
	kfree(audio);
	mutex_lock(&opts->lock);
    ...
}

It appears the structure is freed without cancelling the playback_work.

[Severity: High]
This is a pre-existing issue, but are the allocated usb_request objects and
their buffers never freed?

drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_set_alt() {
    ...
				req =3D usb_ep_alloc_request(out_ep, GFP_ATOMIC);
				if (req) {
					req->buf =3D kzalloc(req_buf_size,
							GFP_ATOMIC);
    ...
}

Every set_alt(1) from the host allocates a batch of requests and buffers, b=
ut
usb_ep_free_request() doesn't seem to be called anywhere in the driver.

[Severity: Critical]
This is a pre-existing issue, but does a failure to allocate a new audio bu=
ffer
leave a dangling pointer in audio->copy_buf?

drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_out_ep_complete() {
    ...
		copy_buf =3D f_audio_buffer_alloc(audio_buf_size);
		if (IS_ERR(copy_buf))
			return -ENOMEM;
    ...
}

Returning early here leaves audio->copy_buf pointing to the buffer that was
just queued for playback or freed, potentially leading to list corruption a=
nd
a use-after-free.

[Severity: Critical]
This is a pre-existing issue, but does the handling of alt =3D=3D 0 fail to=
 stop
the endpoint or clear audio->copy_buf?

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

Because usb_ep_disable() is not called, can the endpoint continue receiving
data into copy_buf which was just queued to play_queue?

[Severity: Critical]
This is a pre-existing issue, but can a failed buffer allocation assign an
error pointer to audio->copy_buf, which is later dereferenced?

drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_set_alt() {
    ...
			audio->copy_buf =3D f_audio_buffer_alloc(audio_buf_size);
			if (IS_ERR(audio->copy_buf))
				return -ENOMEM;
    ...
}

If a subsequent set_alt(0) is received:

drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_set_alt() {
    ...
			if (copy_buf) {
				list_add_tail(&copy_buf->list,
						&audio->play_queue);
    ...
}

ERR_PTR(-ENOMEM) evaluates as true, which would cause list_add_tail() to
write to an invalid pointer offset.

[Severity: High]
This is a pre-existing issue, but is this list modification unprotected?

drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_set_alt() {
    ...
				list_add_tail(&copy_buf->list,
						&audio->play_queue);
    ...
}

It accesses and modifies audio->play_queue without holding audio->lock, whi=
ch
could race concurrently with f_audio_playback_work() and completion handler=
s.

[Severity: High]
This is a pre-existing issue, but does this prematurely enable hardirqs
inside a USB completion callback?

drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_out_ep_complete() {
    ...
		spin_unlock_irq(&audio->lock);
    ...
}

Calling spin_unlock_irq() unconditionally unmasks hardware interrupts,
which violates IRQ masking state if the callback natively runs in interrupt
context.

[Severity: High]
This is a pre-existing issue, but does the lack of a queue drain loop in
f_audio_playback_work() cause unbounded list growth?

drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_playback_work() {
    ...
	play_buf =3D list_first_entry(&audio->play_queue,
			struct f_audio_buf, list);
	list_del(&play_buf->list);
	spin_unlock_irq(&audio->lock);

	u_audio_playback(&audio->card, play_buf->buf, play_buf->actual);
	f_audio_buffer_free(play_buf);
    ...
}

Since schedule_work() coalesces, if multiple audio packets complete before
the scheduled work executes, this will pop only one item and permanently
delay the processing of accumulated concurrent items.

[Severity: High]
This is a pre-existing issue, but can unvalidated audio_buf_size and
req_buf_size parameters allow a heap buffer overflow?

drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_out_ep_complete() {
    ...
	memcpy(copy_buf->buf + copy_buf->actual, req->buf, req->actual);
    ...
}

If a user configures the gadget with req_buf_size larger than audio_buf_siz=
e,
the length of data copied (req->actual) could overflow the newly allocated
copy_buf->buf.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713050246.3739=
137-1-xu.yang_2@oss.nxp.com?part=3D1
