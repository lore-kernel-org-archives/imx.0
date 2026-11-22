Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795312372;
	b=Oc36awNqpy/B2wenvBbHXYJR/WStu3n0TDsjMQfn0673si2+Nqj1C7JJKfuBJ1A55lxq
	 cUQdJ35hy4WbpowHPyLI92aVAocek3yLUD1W4GJGrs2BkdzGkgmmEaPigEJQjPelFsxVg
	 cyw32A4M+aTgSDGn0H8AAGLk6PQ2+5gMcVRP3e5pWTi0sWP3DfzDJs0eujxmqhZxgFCZ9
	 opq0Gty1VlNfxUqZ2H9n7x+3SETwc15ZRVEHS9UXkKpvaJDg9EXiDrfHxGmi3AvTDzCjq
	 QIxfP6O//sm/o5WHQ9O+JcqOYdan3p8y5ISZ3fwknY1NlvBST3lAysbprZQleoWGg/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795312372;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=huQVYk++2laUsLIV9GG4aEu4tX3A7b3zKbmASEwNu14=;
	b=42bqF4CMR5hmvOc+zI743wbmDr5SXjcHdsXAwq30tbjfaTpjyNDJJzchbFB1CtCDaEv/
	 zJbsgMjc4un1po2483Di4MpKN2arW7XhvbvBk59G3k+3RKExOM1AzFWYQ3K1wtayZpe2K
	 PJnl+f5VrigEwRP5o+PZH1JX/h1yEEACtB83oWtKI1KIHdUB17QZlbqe6pclMzSqvuJZn
	 9hwKohv5Stp4g0fGwpl1WND10qDWUtaAvpjEUUHAJswnZcVpqumyvox/C5SU+npX9c0VB
	 2yta54/iR6yunY44267mAvCwFJUfuJukH/jCUkUQDPbkCk3IqC/YBf0DFLCWpt+8IHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rp1ZwFyQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D85606A320
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 01:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rp1ZwFyQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26EE31F000C0;
	Sun, 22 Nov 2026 01:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795312372;
	bh=huQVYk++2laUsLIV9GG4aEu4tX3A7b3zKbmASEwNu14=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rp1ZwFyQ08q4jQ4HcbABYQgGVJ8Tx6MQxTUopqagve2aXeSocaF0qArY62Ar+w0WK
	 7fqSQZFsu5Ym5c56nbUbdyahR2AHCrFOkpvHg5aY5vC7SXIynReLZb8rMxLxf271Pd
	 PQG1VS4MnmgORUQqDkwjt/EZ8cJJRV7xAtPa5kGUJjolZzKZ/D+CalnRsk1CxH+xUq
	 4l7+JdRV6OPEW14OVg4Jth62eKEOZc4+bHtwM0ygCqdU7PhGeYTzdbh+dQgSSJ2fz1
	 htF4Cs+I7bo5gKvjnTKZOQnb6jVrl+YNq89GnWPyPS7FVT0l4KUYI2mM4AHpDVHDgE
	 DTp8iCGvkulCQ==
Message-ID: <sashiko-outbox-227635@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] media: imx: remove legacy video node control and
 format handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaqi Shi" <shijiaqi_develop@163.com>, imx@lists.linux.dev
Cc: Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261122012905.436504-2-shijiaqi_develop@163.com>
References: <20261122012905.436504-1-shijiaqi_develop@163.com>
 <20261122012905.436504-2-shijiaqi_develop@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 01:52:51 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] media: imx: capture_enum_framesizes() allows Bayer formats on
  IC nodes
- [Medium] media: imx: callers of imx_media_capture_device_init() still
  pass legacy_api
--

commit f8bbc2bd5d6e37d94f858bc1efd4d148595db2f1
Author: Jiaqi Shi <shijiaqi_develop@163.com>

media: imx: remove legacy video node control and format handling

This commit removes subdevice control inheritance on capture video nodes
and switches capture format ioctls and initial format setup to be
independent of the connected source subdevice's active format.

> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/stag=
ing/media/imx/imx-media-capture.c
> index 9216a221b72f4..0003c20bb610d 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
[ ... ]
> @@ -93,8 +93,12 @@ static int capture_querycap(struct file *file, void *f=
h,
>  static int capture_enum_fmt_vid_cap(struct file *file, void *fh,
>  				    struct v4l2_fmtdesc *f)
>  {
> +	struct capture_priv *priv =3D video_drvdata(file);
> +	enum imx_pixfmt_sel fmt_sel =3D priv->ic_route ? PIXFMT_SEL_YUV_RGB :
> +							 PIXFMT_SEL_ANY;
> +
>  	return imx_media_enum_pixel_formats(&f->pixelformat, f->index,
> -					    PIXFMT_SEL_ANY, f->mbus_code);
> +					    fmt_sel, f->mbus_code);
>  }
[ ... ]
> @@ -563,13 +437,13 @@ static int capture_legacy_subscribe_event(struct v4=
l2_fh *fh,
>  static const struct v4l2_ioctl_ops capture_legacy_ioctl_ops =3D {
>  	.vidioc_querycap		=3D capture_querycap,
> =20
> -	.vidioc_enum_framesizes		=3D capture_legacy_enum_framesizes,
> +	.vidioc_enum_framesizes		=3D capture_enum_framesizes,
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
Should capture_enum_framesizes() and capture_legacy_enum_frameintervals()
also filter pixel formats using priv->ic_route ? PIXFMT_SEL_YUV_RGB :
PIXFMT_SEL_ANY?

capture_enum_fmt_vid_cap() and __capture_try_fmt() restrict IC capture
nodes (ipuX_ic_prpenc and ipuX_ic_prpvf) to PIXFMT_SEL_YUV_RGB, but
capture_enum_framesizes() and capture_legacy_enum_frameintervals() still
look up the format with PIXFMT_SEL_ANY:

drivers/staging/media/imx/imx-media-capture.c:capture_enum_framesizes() {
	if (fsize->index > 0)
		return -EINVAL;

	cc =3D imx_media_find_pixel_format(fsize->pixel_format, PIXFMT_SEL_ANY);
	if (!cc)
		return -EINVAL;
    ...
}

As a result, VIDIOC_ENUM_FRAMESIZES on IC capture nodes now succeeds for
Bayer and greyscale formats that VIDIOC_ENUM_FMT does not enumerate and
VIDIOC_TRY_FMT rejects.

[ ... ]

> @@ -960,7 +863,7 @@ EXPORT_SYMBOL_GPL(imx_media_capture_device_unregister=
);
> =20
>  struct imx_media_video_dev *
>  imx_media_capture_device_init(struct device *dev, struct v4l2_subdev *sr=
c_sd,
> -			      int pad, bool legacy_api)
> +			      int pad, bool legacy_api, bool ic_route)
>  {
>  	struct capture_priv *priv;
>  	struct video_device *vfd;
> @@ -974,7 +877,7 @@ imx_media_capture_device_init(struct device *dev, str=
uct v4l2_subdev *src_sd,
>  	priv->src_sd =3D src_sd;
>  	priv->src_sd_pad =3D pad;
>  	priv->dev =3D dev;
> -	priv->legacy_api =3D legacy_api;
> +	priv->ic_route =3D ic_route;

[Severity: Medium]
Should prp_registered() and csi_registered() stop passing legacy_api =3D tr=
ue
to imx_media_capture_device_init(), or should legacy_api be removed?

Both callers still pass true, so imx_media_capture_device_init() never sets
V4L2_CAP_IO_MC in vfd->device_caps and always selects
capture_legacy_ioctl_ops, leaving capture_ioctl_ops unreachable.  Without
V4L2_CAP_IO_MC, v4l_enum_fmt() in v4l2-core clears f->mbus_code before
calling capture_enum_fmt_vid_cap(), which disables mbus_code format
filtering, and capture_legacy_enum_frameintervals() remains coupled to the
connected subdev's active format (or fails with -ENOIOCTLCMD on IC capture
nodes because prp_pad_ops does not implement enum_frame_interval).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122012905.4365=
04-1-shijiaqi_develop@163.com?part=3D1
