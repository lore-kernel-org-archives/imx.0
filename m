Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B9F481A89
	for <imx@lists.linux.dev>; Mon, 18 May 2026 13:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111046; cv=none; b=DOLOoEPxnx8nn/3ZhUKP/IyCCRjVNKGVp8fAcPL7puHxY6BBh6RYN1uN5i+mgozd/p9QZ3luiA9wP7cK+lVR+7jglT4I7vxC+ix1zew6ByREDthzIzVYarcJ0SuJQXk+n16V9m7KZVMQjeOO5SDJ8JNwGnIsl8S/yn4V29JHlSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111046; c=relaxed/simple;
	bh=OkfzfSZ1MHNWS6tKJDnBfsZ6YmccDkIMfq1dublw3Xw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OHGM0AwqorZ+10mFfZ5dnR7dV6EIuvd6e4Ah21dCGO4BmqjtJMx1BOno895TPB8jgfIP2KGDFUC++sDEFuG3p6FD05nctTuQE+ck2JB1pCSr5yOMsDCV3vLRlrLLyq5RXIMBQ4G+Mxvi4i5vfc8zABo2Sj20FiRNgaundOSPspY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbPUNRIV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbPUNRIV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B36D4C2BCB7;
	Mon, 18 May 2026 13:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779111045;
	bh=OkfzfSZ1MHNWS6tKJDnBfsZ6YmccDkIMfq1dublw3Xw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=FbPUNRIVNbesba94WEIQyBSQzgvkj2PvEH3UD9LKpiGmNW9G9yF29Z+EJb27H2i3N
	 4jhiy/w5czEnfCavowdyEEODy6i3g/UlGSCPVGMPWhyKQY3Vta2tVhtrkWPCv2Ya/F
	 blZ8i+pvMQHeqMmLAQLkxUhmwJP991jSln5QfzIeMPx9zCWrJSEi2sZyu3Ww3GQtwi
	 Gn/8hRDDYVBNf1C8lupcJgL/53/ebDnRAYwbhXvXnn0eBnaqohpOA9rowaK54/mNva
	 jKBM9H5xn9BOZ/hbi655kT2BKvezF9/81cvELQOkeW30PN+fPDjoXpmoG5RSYMcdeJ
	 KH7B/csUcF1tg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: imx-jpeg: avoid double free on video register
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260518130259.1001956-1-lgs201920130244@gmail.com>
References: <20260518130259.1001956-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 13:30:45 +0000
Message-Id: <20260518133045.B36D4C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Registration Race Condition causing Use-After-Free on Probe Er=
ror Path
- [High] Improper Lifetime Management leading to Use-After-Free on Registra=
tion Failure
--

commit 614dd46b2e11c4ca6a905198dee1fa73cda5fc0e
Author: Guangshuo Li <lgs201920130244@gmail.com>
Subject: media: imx-jpeg: avoid double free on video register failure

This patch changes the error handling path for video_register_device()
to prevent a double-free. It temporarily sets the release callback to an
empty function during registration and explicitly releases the device if
registration fails.

> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/med=
ia/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 725e941528848..d38944e40f469 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -3004,7 +3004,7 @@ static int mxc_jpeg_probe(struct platform_device *p=
dev)
>  	jpeg->dec_vdev->fops =3D &mxc_jpeg_fops;
>  	jpeg->dec_vdev->ioctl_ops =3D &mxc_jpeg_ioctl_ops;
>  	jpeg->dec_vdev->minor =3D -1;
> -	jpeg->dec_vdev->release =3D video_device_release;
> +	jpeg->dec_vdev->release =3D video_device_release_empty;
>  	jpeg->dec_vdev->lock =3D &jpeg->lock; /* lock for ioctl serialization */
>  	jpeg->dec_vdev->v4l2_dev =3D &jpeg->v4l2_dev;
>  	jpeg->dec_vdev->vfl_dir =3D VFL_DIR_M2M;

By temporarily setting the release callback to a no-op and synchronously
calling video_device_release() if registration fails, could this introduce
a regression where a use-after-free occurs if userspace acquires temporary
references to sysfs files?

video_register_device() calls device_register(), which initializes the
embedded struct device and exposes it via sysfs. If device_register()
fails after the kobject is made visible, userspace might still have
lingering references.

In such cases, the put_device() call inside the V4L2 core drops its
reference, but the kobject refcount might not reach zero. Forcing a
synchronous kfree() in the driver via video_device_release() would free
the memory while these references still exist.

When those references are eventually dropped, will the kernel attempt to
access the freed memory to decrement the refcount and invoke the release
callback?

> @@ -3023,6 +3023,8 @@ static int mxc_jpeg_probe(struct platform_device *p=
dev)
>  		dev_err(dev, "failed to register video device\n");
>  		goto err_vdev_register;
>  	}
> +	jpeg->dec_vdev->release =3D video_device_release;
> +

This isn't a regression introduced by this patch, but does registering
the video device before probe is complete introduce a race condition?

If a subsequent initialization step fails, like devm_pm_runtime_enable()
or pm_runtime_resume_and_get(), the driver initiates cleanup, calls
video_unregister_device(), and returns an error. This causes devres to
automatically free the mxc_jpeg_dev structure.

If userspace opens the device node in the narrow window between
successful registration and a subsequent probe failure, it holds a
reference to the video device. video_unregister_device() prevents new
opens but does not close existing ones.

When userspace eventually closes the file, will v4l2_release() call
mxc_jpeg_release() and dereference the freed mxc_jpeg_dev? Would it be
safer to move video_register_device() to the very end of the probe
function?

>  	if (mode =3D=3D MXC_JPEG_ENCODE)
>  		v4l2_info(&jpeg->v4l2_dev,
>  			  "encoder device registered as /dev/video%d (%d,%d)\n",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518130259.1001=
956-1-lgs201920130244@gmail.com?part=3D1
