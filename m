Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18283313E00
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 08:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787301178; cv=none; b=tQiM1h+vM59bAS50NRHYkwei/NY38XNGD5E24PE9eM6xpJFcN1cdnVP/18KRmk5JOCBXMttu8ClbFvxhRSkSCIb2WW8giIatnawf1Fz+EtRmlRMqIqHwka/GFsZ96kdQ/f5bG5At9WEFaYvX8T+n/5CcYbto4afZlM3XYTtiYWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787301178; c=relaxed/simple;
	bh=zQImaJwgN9Exi25o4CeyNDsEh4jojx4lNA5p8OWtFN8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ntm118f+z1FEVTeUu7q9psqH59tRb5HTCuXVNsvp/2jaGPZG4Lcb6vY1Dry2SoR2/hqFG4sT+dK1rVwzFznr5W4UFGjSth9CG98G4DjwGTYsPSm/x59k5dbljMZSwAmjOD8hn7ThCEHkSrGKGUR6tOy+B/aGmFWN2f6GB8tCy98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ghovpcyV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ghovpcyV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2351F000E9;
	Fri, 21 Aug 2026 08:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787301176;
	bh=AzExCmkJ9vHCGn0LcqLL0euhiaoCbd4o3sTGx2gmiBM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ghovpcyV5TGPcB+afrpF8f/406Jr/4rMACc28re/rFaMMd03HDfKAHBh4ZmNJyc0W
	 IED+vUVQdqNiv9Rx7LN816/5AwPu9id5OVHEwQ/r3GzsveAl/jjqI8hxY8TLhadcG8
	 bqwRKZwPEw+BN9VTcrEQWHfAoQ0DP35UPm6lQgok0+hsgkmTXkRkux8j+DBCLu6xlX
	 GWZ7oAKvJLK1rOvnFF07LoknEdaq0sUa7yvgh5R6B/A5Og5VwxoR8zB6I74yUPsTGO
	 j6PVxQX0fDJ9mSPZlT9h31DTErQSx5zIB0tWK5fVBQ1Y12y9hJjkfhAGSBg8jOu5lz
	 cSRtXoFJmCqUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] usb: gadget: uvc: refactor video cleanup into
 uvcg_video_deinit()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260821-usb-uvc-fixes-v1-2-80e6e279523d@nxp.com>
References: <20260821-usb-uvc-fixes-v1-0-80e6e279523d@nxp.com>
 <20260821-usb-uvc-fixes-v1-2-80e6e279523d@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 08:32:55 +0000
Message-Id: <20260821083256.5B2351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calling `uvcg_video_deinit()` in `uvc_function_unbind()` before wa=
iting for V4L2 file release completion leaves it exposed to concurrent in-f=
light ioctls, causing use-after-free or NULL pointer dereferences.
--

--- Patch [2]: [PATCH 2/2] usb: gadget: uvc: refactor video cleanup into uv=
cg_video_deinit() ---
commit 4d7b46b3698b9db70da6cefc8230b5f7e4eb66ce
Author: Xu Yang <xu.yang_2@nxp.com>

usb: gadget: uvc: refactor video cleanup into uvcg_video_deinit()

This commit refactors the cleanup logic for UVC video into a new=20
uvcg_video_deinit() helper to fix resource leaks in error paths and missing=
=20
kworker destruction during unbind. It also reorders the teardown in=20
uvc_function_unbind() to happen after video_unregister_device().

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
This is a pre-existing issue, but could this ordering lead to a NULL
pointer dereference if there are in-flight ioctls?

If a userspace app is calling an ioctl like VIDIOC_QBUF concurrently while
the gadget is unbound, video_unregister_device() clears the registered
flag but doesn't wait for in-flight ioctls to finish.

Then uvcg_video_deinit() destroys video->async_wq and sets it to NULL:

drivers/usb/gadget/function/uvc_video.c:uvcg_video_deinit() {
	...
	if (video->async_wq) {
		destroy_workqueue(video->async_wq);
		video->async_wq =3D NULL;
	}
}

An in-flight uvc_v4l2_qbuf() could then resume and try to use the workqueue
by dereferencing the NULL pointer:

drivers/usb/gadget/function/uvc_v4l2.c:uvc_v4l2_qbuf() {
	...
	if (uvc->state =3D=3D UVC_STATE_STREAMING)
		queue_work(video->async_wq, &video->pump);
}

Should uvcg_video_deinit() be deferred until after=20
wait_for_completion(&vdev_release_done) when the video device is fully=20
released and no more ioctls can be executing?

>  	v4l2_device_unregister(&uvc->v4l2_dev);
> =20
>  	scoped_guard(mutex, &uvc->lock)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-usb-uvc-fi=
xes-v1-0-80e6e279523d@nxp.com?part=3D2
