Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795272052;
	b=K2lJSu/HTZGomydJIpgYvAvhYmS+yJwjk1fEj7jUsw9QDFhM0gqqSFJO28VB/DNSzoDa
	 zmGvFzZgj6JHsS3phnzOce2ehJPGMYUw8HfHDXA7jfaICTj9jE9e74Syew0c1oqJRO9nk
	 SgSmoq8BvPunlvUTekAxl3Tp8opcRGc/qONTgD4d9/tO+0zhQqgaBhXYp+PZ+ii25+ICf
	 AFReg7bODQ8YMqEVHbKaMyEXN6cmlnqEfogsc/ZD6VDzTH2SlEbZFLkhkU8yIGPTmaeZV
	 tzKFGa8zNji+xXOm+WeMFv/sGECpn14Ycf0GD8lggEX4vEOlTbjv4UQryv41uFZdo1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795272052;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=76SUQA4iZCBChWCWrbKMq0yPpuKDzWXlwdSqpb8MwiU=;
	b=IW8RHLAEQp/OJ4JdRgNxidbJ5g1JA5/Euer+xx4Tes65wxSf++aSI4bUbN3fVvoAbFt2
	 XlmM8yvdTCNpMPCl9WZ2M67O4c4XUvkKr2PO4mDY4moVHqZN/d6ltd+yUFvkSdLV6zbxH
	 BXgMb/1umLoqqgOyBGN/KNr6txmJj7uyvHtPNq1ZhNgNobo9h40v2qPC7jiuIbRoWDNpb
	 SstS2k4Teq6c6P+YsX0sYEWFLANv7xQ5L2Eq8YIH0I5AxlRjGEIOyUWOtaGSoGOsPLNwr
	 2xfj2Rd/7ehsh4wlxVuIoUg6OcEvA0j+rtp4O4VesoKvgzG6xUbIB/5S86ytHOtan/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ODV7ryxb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E58606A320
	for <imx@lists.linux.dev>; Sat, 21 Nov 2026 14:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ODV7ryxb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0F11F000C4;
	Sat, 21 Nov 2026 14:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795272051;
	bh=76SUQA4iZCBChWCWrbKMq0yPpuKDzWXlwdSqpb8MwiU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ODV7ryxb4Pz7+s1SrwTUa7hvBfayI4jYwTZB5QWFPPd6AmBN1oH0g8hzgdQDAXYyg
	 1MfG7Pk1SbaFlyOg6yE74rB9nCx7MXU9c09bunM7SrYDtuRDRmmiuCiSVOuz542UFk
	 lKfPvu15UTm/3KsepiJQkNUT372vcYKSB92v0qSHXSJrken7uf27wiwITqrl4cUdeS
	 MUG9pTARQPDCvpTMcpOYGXq+D1JJ1/0V9TML3kT15lc8745tfGg2dBf8DpdXd07utG
	 jfOa1o0cPn2l6lZpPqzk2i5xexiqdbYaUuHvPpdVwcHFO/5cqCnp7R9WR1CCGc9XXP
	 CfSaqqHrhRAEA==
Message-ID: <sashiko-outbox-227100@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] media: imx: remove legacy video node control and
 format handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaqi Shi" <shijiaqi_develop@163.com>, imx@lists.linux.dev
Cc: Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261121141412.319802-2-shijiaqi_develop@163.com>
References: <20261121141412.319802-1-shijiaqi_develop@163.com>
 <20261121141412.319802-2-shijiaqi_develop@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 14:40:51 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] media: imx: unresolved default colorimetry and field in
  capture_init_format()
- [High] media: imx: insufficient pixel format validation in
  capture_validate_fmt()
- [High] media: imx: unclamped dimensions in __capture_try_fmt() cause
  divide-by-zero
- [Medium] media: imx: callers of imx_media_capture_device_init() still
  set legacy_api
- [Low] media: imx: outdated v4l2-ctl format examples in
  Documentation/admin-guide
--

commit 91db31570bbb5c6e57f4f438a93a25e73be6926a
Author: Jiaqi Shi <shijiaqi_develop@163.com>

media: imx: remove legacy video node control and format handling

This commit removes V4L2 control inheritance from pipeline subdevices to
capture video nodes and switches capture video nodes to source-independent
format initialization and format ioctls.

> diff --git a/Documentation/admin-guide/media/imx.rst b/Documentation/admi=
n-guide/media/imx.rst
> index bb68100d8acba..b1c5fecfaef74 100644
> --- a/Documentation/admin-guide/media/imx.rst
> +++ b/Documentation/admin-guide/media/imx.rst
> @@ -394,13 +394,9 @@ scaling up to 1024x1024, CSC, flip, and rotation:
>  Usage Notes
>  -----------
> =20
> -To aid in configuration and for backward compatibility with V4L2
> -applications that access controls only from video device nodes, the
> -capture device interfaces inherit controls from the active entities
> -in the current pipeline, so controls can be accessed either directly
> -from the subdev or from the active capture device interface. For
> -example, the FIM controls are available either from the ipuX_csiY
> -subdevs or from the active capture device.
> +Controls for pipeline entities are accessed through their subdev device
> +nodes. For example, the FIM controls are available from the ipuX_csiY
> +subdevs.

[Severity: Low]
Should the v4l2-ctl --set-fmt-video examples later in this document also
be updated to specify width and height when the upstream subdev pad is not
640x480?

Because capture nodes now initialize to 640x480 and VIDIOC_S_FMT no longer
inherits dimensions from the source subdev, the 720x480, 720x576, and
800x600 pipeline examples that only pass field=3D or pixelformat=3DRGB3 lea=
ve
the capture node at 640x480 and fail in capture_validate_fmt() with -EPIPE
at stream start.

[ ... ]

> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/stag=
ing/media/imx/imx-media-capture.c
> index 9216a221b72f4..93d05cd967980 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c

[ ... ]

> @@ -566,10 +432,10 @@ static const struct v4l2_ioctl_ops capture_legacy_i=
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

[Severity: High]
Does capture_validate_fmt() allow incompatible pixel formats on the video
node now that capture_s_fmt_vid_cap() accepts any PIXFMT_SEL_ANY format?

Previously, capture_legacy_s_fmt_vid_cap() called capture_find_format()
with both fmt_src->format.code and pixfmt->pixelformat, which rejected
Bayer formats on IPU internal links and required an exact format match on
non-IPU passthrough links.  Now capture_validate_fmt() is the only check,
and it only compares the two-value colorspace enum:

drivers/staging/media/imx/imx-media-capture.c:capture_validate_fmt() {
    ...
	cc =3D capture_find_format(fmt_src.format.code, 0);
	if (!cc || priv->vdev.cc->cs !=3D cc->cs)
		return -EPIPE;
    ...
}

Because all RGB, Bayer, and greyscale formats share IPUV3_COLORSPACE_RGB
and all YUV formats share IPUV3_COLORSPACE_YUV, mismatched formats pass
validation.  On a CSI passthrough link, configuring an 8-bpp or 12-bpp
format on the video node while the source subdev outputs a 16-bpp format
with the same colorspace programs 16-bpp IDMAC DMA transfers into buffers
sized for 8 or 12 bpp, overflowing the DMA buffer.  On an IPU internal RGB
link, V4L2_PIX_FMT_Y10 or V4L2_PIX_FMT_Y12 reaches the default WARN_ON(1)
in ipu_cpmem_set_image(), while 8-bpp Bayer or greyscale formats cause
ipu_cpmem_set_fmt() to fail with its return value ignored, leaving the
CPMEM BPP field at 0 (32 bpp) for 8-bpp buffers.

Passing priv->vdev.fmt.pixelformat instead of 0 to capture_find_format()
in capture_validate_fmt() would restore the format check.

[Severity: High]
Can VIDIOC_S_FMT followed by VIDIOC_REQBUFS trigger a divide-by-zero in
capture_queue_setup()?

capture_legacy_s_fmt_vid_cap() previously took width and height from the
source subdev, where dimensions were already clamped to non-zero hardware
bounds.  capture_s_fmt_vid_cap() instead passes the user's unclamped
width and height through __capture_try_fmt() to
imx_media_mbus_fmt_to_pix_fmt(), so width =3D 0 or height =3D 0 sets
priv->vdev.fmt.sizeimage to 0.  A subsequent VIDIOC_REQBUFS or
VIDIOC_CREATE_BUFS then divides by pix->sizeimage:

drivers/staging/media/imx/imx-media-capture.c:capture_queue_setup() {
    ...
	count =3D min_t(__u32, VID_MEM_LIMIT / pix->sizeimage, count);
    ...
}

[ ... ]

> @@ -869,36 +735,21 @@ void imx_media_capture_device_error(struct imx_medi=
a_video_dev *vdev)
>  }
>  EXPORT_SYMBOL_GPL(imx_media_capture_device_error);
> =20
> -static int capture_init_format(struct capture_priv *priv)
> +static void capture_init_format(struct capture_priv *priv)
>  {
> -	struct v4l2_subdev_format fmt_src =3D {
> -		.pad =3D priv->src_sd_pad,
> -		.which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> -	};
>  	struct imx_media_video_dev *vdev =3D &priv->vdev;
> -	int ret;
> -
> -	if (priv->legacy_api) {
> -		ret =3D v4l2_subdev_call(priv->src_sd, pad, get_fmt, NULL,
> -				       &fmt_src);
> -		if (ret) {
> -			dev_err(priv->dev, "failed to get source format\n");
> -			return ret;
> -		}
> -	} else {
> -		fmt_src.format.code =3D MEDIA_BUS_FMT_UYVY8_2X8;
> -		fmt_src.format.width =3D IMX_MEDIA_DEF_PIX_WIDTH;
> -		fmt_src.format.height =3D IMX_MEDIA_DEF_PIX_HEIGHT;
> -	}
> +	struct v4l2_mbus_framefmt fmt_src =3D {
> +		.code =3D MEDIA_BUS_FMT_UYVY8_2X8,
> +		.width =3D IMX_MEDIA_DEF_PIX_WIDTH,
> +		.height =3D IMX_MEDIA_DEF_PIX_HEIGHT,
> +	};
> =20
> -	imx_media_mbus_fmt_to_pix_fmt(&vdev->fmt, &fmt_src.format, NULL);
> -	vdev->compose.width =3D fmt_src.format.width;
> -	vdev->compose.height =3D fmt_src.format.height;
> +	imx_media_mbus_fmt_to_pix_fmt(&vdev->fmt, &fmt_src, NULL);
> +	vdev->compose.width =3D fmt_src.width;
> +	vdev->compose.height =3D fmt_src.height;
> =20
>  	vdev->cc =3D imx_media_find_pixel_format(vdev->fmt.pixelformat,
>  					       PIXFMT_SEL_ANY);
> -
> -	return 0;
>  }

[Severity: High]
Does leaving fmt_src.field and the colorimetry members zero-initialized in
capture_init_format() and __capture_try_fmt() break IC color space
conversion at stream start?

Previously, vdev->fmt was initialized and updated from the source subdev's
active format, which imx_media_init_mbus_fmt() and
imx_media_try_colorimetry() populated with V4L2_FIELD_NONE and resolved
colorimetry values (such as V4L2_YCBCR_ENC_601 and
V4L2_QUANTIZATION_LIM_RANGE).  Now fmt_src leaves field as V4L2_FIELD_ANY
(0) and ycbcr_enc and quantization as DEFAULT (0), and __capture_try_fmt()
also passes zeroed values through without resolving them.

When streaming starts on an IC capture node (ipuX_ic_prpenc or
ipuX_ic_prpvf), prp_setup_norotation() and prp_setup_rotation() pass
vdev->fmt.ycbcr_enc and vdev->fmt.quantization to ipu_ic_calc_csc() ->
calc_csc_coeffs(), which rejects V4L2_YCBCR_ENC_DEFAULT with -ENOTSUPP
whenever YUV-to-RGB or RGB-to-YUV conversion is needed:

drivers/gpu/ipu-v3/ipu-ic-csc.c:calc_csc_coeffs() {
    ...
	switch (csc->out_cs.enc) {
	case V4L2_YCBCR_ENC_601:
		params_tbl =3D (csc->in_cs.cs =3D=3D IPUV3_COLORSPACE_YUV) ?
			yuv2rgb_601 : rgb2yuv_601;
		break;
	case V4L2_YCBCR_ENC_709:
		params_tbl =3D (csc->in_cs.cs =3D=3D IPUV3_COLORSPACE_YUV) ?
			yuv2rgb_709 : rgb2yuv_709;
		break;
	default:
		return -ENOTSUPP;
	}
    ...
}

On default YUV-to-YUV IC captures, V4L2_QUANTIZATION_DEFAULT also maps to
full range instead of limited range, programming the yuvl2yuvf range
expansion CSC matrix instead of an identity pass-through.

[ ... ]

> @@ -974,7 +823,6 @@ imx_media_capture_device_init(struct device *dev, str=
uct v4l2_subdev *src_sd,
>  	priv->src_sd =3D src_sd;
>  	priv->src_sd_pad =3D pad;
>  	priv->dev =3D dev;
> -	priv->legacy_api =3D legacy_api;

[Severity: Medium]
Should prp_registered() and csi_registered() stop setting legacy_api =3D tr=
ue
(or should legacy_api be removed altogether)?

Both callers of imx_media_capture_device_init() still pass legacy_api =3D
true, which leaves V4L2_CAP_IO_MC unset on every capture device, keeps
capture_ioctl_ops unused, and keeps capture_legacy_enum_framesizes() active.
Without V4L2_CAP_IO_MC, v4l_enum_fmt() in the V4L2 core zeroes
f->mbus_code before calling capture_enum_fmt_vid_cap(), and on
ipuX_ic_prpenc/prpvf capture nodes capture_legacy_enum_framesizes() passes
non-IPU mbus codes to prp_enum_frame_size(), which rejects 22 of the 23
enumerated pixel formats with -EINVAL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121141412.3198=
02-1-shijiaqi_develop@163.com?part=3D1
