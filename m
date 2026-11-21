Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795287174;
	b=GUz94Stw+lo7/kFJjLwooBh/ETwTzq8/4jmS5D9QLhsDiqdR7Dpul7UlFxA+a4bYsuOh
	 veVjSGU5dxOcpimLXpXFipOSxTlxJIR6XpJ3SVlx6mMgwjLY+AfuhVdTndXAepD5+bixy
	 ij4yu+PyPRaiP2GLs0OJHMIUl3rBo44M7nzVr+65OvuCZAOIKlAfN6AVF9RPqfbWIuKtt
	 jyoQiqLPAolvWczIH7yvgyNC50TNF81qaLu6T6wCivBzNh9/MHBX+eRXPl7bJoozcDiit
	 bs3va2vs5h0uAn4UQQAsY16Vy92A7r2m/KLO9L/IAaIw4y7KWFEDgGHA/gyUeqw1N/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795287174;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0BBguQBQQeqIEH/QvBmrweIz6BzbZiSfLQIKmJekx1g=;
	b=M1UZxWAU/paP/SVxCE43WfZ0MpevcNz1FYZMRFB9qdmejwRXIoy41UfeKI2M1Jz98Q6D
	 E6h7VgCbcpwTnG2G819jI325785XObtGMDdkSlRioJvBnVvVIfIbHbz4ZcRQxDxiZ05fB
	 2BKOWsSW7haL08f2wqtRi5U9yTltdIPRxhhwB6Amrn7US4HyVPP5sYKvFDpB/JfoEcMaI
	 yE6xZTElosRCSullm4RkWHiC/MQs5BqXOxL0Ke67L3LpAbpdAUQXWfG2mpdCvjrE0iImM
	 0Ll6Yf9DsbAsLGMy544U7qx5Z4pr4ktGWvFJyeOJVEl2IkcSS/hIPSyRxMczDBDfzcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fRl0oc9J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA0F606A320
	for <imx@lists.linux.dev>; Sat, 21 Nov 2026 18:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fRl0oc9J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44BF1F000C0;
	Sat, 21 Nov 2026 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795287174;
	bh=0BBguQBQQeqIEH/QvBmrweIz6BzbZiSfLQIKmJekx1g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fRl0oc9JGtp7/JLCh61pd61rB/rvzDEHDKni4/yJ9rYGy96DtyjQGmVYNu7kRdzgr
	 PIWKp/IZvOnR78utRButMGf7lflfBn4bxSJ7113MP0CgryPodHKit7rXMIDs96wXLn
	 Am1k/Hic0ATGJHCBxIk9pxy4b4zH/T7s3cYyjWDOaPLEZMmj0y0T2NTOw1ISBT9+/M
	 FLgxvSZQ/AmgiYBBCu3vovPORCMbBj2bubRnhhzSKZ4yLkD4HZsYY8ccFZP2poan8n
	 mrLMNnmFZvfe0iK1GC4pXT4Sz9zsTcFVP6bufIJwp5GT5jmjmf4PTjAfh07kkW23uB
	 gMkRpKLLY1+fg==
Message-ID: <sashiko-outbox-227277@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] media: imx: remove legacy video node control and
 format handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaqi Shi" <shijiaqi_develop@163.com>, imx@lists.linux.dev
Cc: Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261121184033.429680-2-shijiaqi_develop@163.com>
References: <20261121184033.429680-1-shijiaqi_develop@163.com>
 <20261121184033.429680-2-shijiaqi_develop@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 18:52:53 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] media: imx: callers of imx_media_capture_device_init() still
  pass legacy_api
--

commit 38a236574cfd2ca3669e9b8ee53cd0ec8b2e47d4
Author: Jiaqi Shi <shijiaqi_develop@163.com>

media: imx: remove legacy video node control and format handling

This commit removes V4L2 control inheritance from pipeline subdevices to
capture video nodes and switches capture video nodes to
source-independent format ioctls and default formats.

> diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/stagin=
g/media/imx/imx-ic-prpencvf.c
> index 3430ddeac3569..bd4c2e7a0b8d0 100644
> --- a/drivers/staging/media/imx/imx-ic-prpencvf.c
> +++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
[ ... ]
> @@ -1280,13 +1281,13 @@ static int prp_registered(struct v4l2_subdev *sd)
> =20
>  	priv->vdev =3D imx_media_capture_device_init(ic_priv->ipu_dev,
>  						   &ic_priv->sd,
> -						   PRPENCVF_SRC_PAD, true);
> +						   PRPENCVF_SRC_PAD, true, true);
[ ... ]
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/stag=
ing/media/imx/imx-media-capture.c
> index 9216a221b72f4..f587179503c21 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
[ ... ]
> @@ -566,10 +474,10 @@ static const struct v4l2_ioctl_ops capture_legacy_i=
octl_ops =3D {
>  	.vidioc_enum_framesizes		=3D capture_legacy_enum_framesizes,
>  	.vidioc_enum_frameintervals	=3D capture_legacy_enum_frameintervals,
> =20
> -	.vidioc_enum_fmt_vid_cap	=3D capture_legacy_enum_fmt_vid_cap,
> +	.vidioc_enum_fmt_vid_cap	=3D capture_enum_fmt_vid_cap,
>  	.vidioc_g_fmt_vid_cap		=3D capture_g_fmt_vid_cap,
> -	.vidioc_try_fmt_vid_cap		=3D capture_legacy_try_fmt_vid_cap,
> -	.vidioc_s_fmt_vid_cap		=3D capture_legacy_s_fmt_vid_cap,
> +	.vidioc_try_fmt_vid_cap		=3D capture_try_fmt_vid_cap,
> +	.vidioc_s_fmt_vid_cap		=3D capture_s_fmt_vid_cap,

[Severity: Medium]
Should prp_registered() and csi_registered() pass legacy_api =3D false to
imx_media_capture_device_init() (or should the legacy_api path be
removed)?

Because both callers still pass legacy_api =3D true,
capture_legacy_ioctl_ops is always used and V4L2_CAP_IO_MC is never set,
leaving capture_ioctl_ops, capture_enum_framesizes() and
capture_subscribe_event() unreachable and causing v4l_enum_fmt() in
v4l2-core to clear f->mbus_code before capture_enum_fmt_vid_cap() runs.

In addition, capture_legacy_ioctl_ops pairs capture_enum_fmt_vid_cap()
with capture_legacy_enum_framesizes(), which queries the connected
subdev's active enum_frame_size op using cc->codes[0] (or 0 for
in-memory-only planar formats).  On ipuX_ic_prpenc and ipuX_ic_prpvf
capture nodes, prp_enum_frame_size() only accepts IPU-internal media bus
codes, so VIDIOC_ENUM_FRAMESIZES now fails with -EINVAL for 22 of the 23
formats enumerated by VIDIOC_ENUM_FMT (including the default UYVY), and
on ipuX_csiY capture nodes frame size enumeration remains coupled to the
CSI subdev's active format.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121184033.4296=
80-1-shijiaqi_develop@163.com?part=3D1
