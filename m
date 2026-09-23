Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39343382FC
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 10:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160726; cv=none; b=a3lBAuWZKfk21ZD411sbsAn3he9vBm2IOJNzGiK5s1TnmRRQYsHUUfRWDAvLqIV+1rGiiAvAVk3Kon09adunSk9ZTfrPn95FiAHHAJ8q8sutuiPiSecHHiYYLbLrmleSvx+ZB9jJoKIgc4AK/4e4xJu/1seNBxgdzP220MSuYoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160726; c=relaxed/simple;
	bh=xpc14qQQ0c11zfGueBHwpU9GA8G+uaCygZ4QiH4Swlk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DGb1XzdkrCGNRaPLibb8UM4+jj141YF0+HJIb165/fzN6b7oEwBvk2eIR5NsRT6WIciY4gviLGszsialqZV8rLXoLq3tys7zpAJAOeHexlSIyY/W2UN3si6bZEDXTgVdpWzlXP9XfbV2XzCrg918X6vVucH1iDIIRjJRUKRXOqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E1Ooyzsv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E1Ooyzsv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC731F000FF;
	Wed, 23 Sep 2026 10:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790160716;
	bh=eBe1CyLdMBcjGc83p4ByaiACDzy1YBo2ao2cLpFgCk8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E1Ooyzsv3+uvNrRPlQ+hmmqEV80zj+WhvFkUdcyQEqDJgNykdSxJYqx/ZQBqD3W3d
	 MPe28JuFDck2KOjHK7SwVIDUh7YI831fwSRRCCpeAB5UAOhxF6bHaFq9T1VngO62n7
	 y4VZ71VGCH+SCUIuqT3c9L5vHDzu9DrVUeqZxI6kT5MhwIIM6axwvRCjWbKRswAhdB
	 TXFCVoubzXHulCjMvtkPQInC1pc/GGTZwJ+H82NJUcVTdCe1vtmm/a18G2JRW5EbXF
	 gw1YkWOxn9t5FtXi7woVfm+YZyT/3sOtSXaqSUa5HdXl7f8Z+Zl7g4UrMjg17AV+YD
	 /LOaT9F3VMAnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: gadget: uvc: refactor video cleanup into
 uvcg_video_deinit()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260923-usb-uvc-fixes-v2-2-844e04a4a4b7@nxp.com>
References: <20260923-usb-uvc-fixes-v2-0-844e04a4a4b7@nxp.com>
 <20260923-usb-uvc-fixes-v2-2-844e04a4a4b7@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 10:51:55 +0000
Message-Id: <20260923105156.5DC731F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: gadget: uvc: missing mutex in unbind causes UAF in uvcg_video=
_deinit()
--

commit 5b750200592f725e55689646ba5d3a79912818ba
Author: Xu Yang <xu.yang_2@nxp.com>

usb: gadget: uvc: refactor video cleanup into uvcg_video_deinit()

This commit consolidates the teardown logic for the UVC gadget's async
workqueue and kworker into a new uvcg_video_deinit() helper to prevent
resource leaks during bind failures and unbind. It also changes the unbind
sequence to tear down these resources after unregistering the V4L2 device.

> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/fun=
ction/f_uvc.c
> index a4fb2790f4ffe..fa2f9d0e4ce0b 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
[ ... ]
> @@ -1048,6 +1044,7 @@ static void uvc_function_unbind(struct usb_configur=
ation *c,
> =20
>  	device_remove_file(&uvc->vdev.dev, &dev_attr_function_name);
>  	video_unregister_device(&uvc->vdev);
> +	uvcg_video_deinit(video);

[Severity: High]
Can this cause a use-after-free if an ioctl is currently executing?

When uvc_function_unbind() calls video_unregister_device(), it clears
the registered flag but does not wait for active ioctls to complete. Since
uvc_function_unbind() does not hold video->mutex, an in-flight
VIDIOC_STREAMON ioctl could concurrently be executing uvcg_video_enable().

Meanwhile, uvc_function_unbind() proceeds to call uvcg_video_deinit()
without any locks.

>  	v4l2_device_unregister(&uvc->v4l2_dev);
> =20
>  	scoped_guard(mutex, &uvc->lock)
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget=
/function/uvc_video.c
> index 9ba09118bb74a..002afca9141ee 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
[ ... ]
> @@ -841,3 +841,18 @@ int uvcg_video_init(struct uvc_video *video, struct =
uvc_device *uvc)
>  	return uvcg_queue_init(&video->queue, uvc->v4l2_dev.dev->parent,
>  			V4L2_BUF_TYPE_VIDEO_OUTPUT, &video->mutex);
>  }
> +
> +void uvcg_video_deinit(struct uvc_video *video)
> +{
> +	kthread_cancel_work_sync(&video->hw_submit);
> +
> +	if (!IS_ERR_OR_NULL(video->kworker)) {
> +		kthread_destroy_worker(video->kworker);
> +		video->kworker =3D NULL;
> +	}

[Severity: High]
Does destroying the kworker here locklessly open a race window?

If uvcg_video_enable() is executing concurrently under video->mutex, it cal=
ls
kthread_queue_work(video->kworker, &video->hw_submit).

If uvcg_video_deinit() frees video->kworker before the ioctl finishes,
will uvcg_video_enable() dereference freed memory and crash the kernel?

> +
> +	if (video->async_wq) {
> +		destroy_workqueue(video->async_wq);
> +		video->async_wq =3D NULL;
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-usb-uvc-fi=
xes-v2-0-844e04a4a4b7@nxp.com?part=3D2
