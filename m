Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795281971;
	b=WCTnJ1jXeN0ccVj8cPy/pd18ycdfkFuDys5te7Lagz7Q3J3OlV2O/BtnfdLV+fX2RMjD
	 T9+HMdh+luhLXChdFO+yjcxE3l01//Bx0rJx0htZrApg1ELDgO7KzyKRXgTPUenUiWe/h
	 V5iRj7sLnOUC9AkYyoAf3mZYUB2Sf7AInpZ0koPE8C9U/LZaiYOLkLy7PNats0uEZICki
	 YDxlw02lExKApCeiM6NXVKNElYeXLeqem11YVSyqKgwXHBqbaDuQ86SkKj3MTFv+SeIHF
	 y7T45FwRQO1gnxpxbtzkRDd598RY6ACOhHtgBj+sW1AAd3/ruRiptYB5Tph0PmoXmkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281971;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ePWQfDVS6wF2Fdkw5eoMztwDy50vvndvEPUlHhEa9d4=;
	b=p0Gwo5+ficmsgfyoMWdYsEKzCP6RV/WiFMqsWKhWxl6iLWy7I6uGxnLuit2c/ZBVR3rL
	 fgqwo5qErb6vPefgKX2Q96XZTlhrnUhe9kzg7Zehq9/l7LFwHfLlVgpxZ7g0eqlr1eOAh
	 8OIWcB3kGsFPgygjnMTJW2rJu17LGoJi4Cs9ek5+JvszWzrc2bNcnIhVi2W08UXyvuEBC
	 7sXMfJnpcpwlm5j5X07f94CB8SnCcEAlBwWinKeShJrs8v8Z1pZvM2Lv4/dwZO4xSiMOj
	 ItkrwB6Dfc6TK836Q4yt6Epbvv8/c4X3Q+9gcXyxGMZPt0oRbpEkbF0tfBJWZTjxnbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ho/qnAYi";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AAF606A32C
	for <imx@lists.linux.dev>; Sat, 21 Nov 2026 17:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ho/qnAYi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C721F000C6;
	Sat, 21 Nov 2026 17:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795281971;
	bh=ePWQfDVS6wF2Fdkw5eoMztwDy50vvndvEPUlHhEa9d4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ho/qnAYitmDWVlgu7Ob5LaV2RDtWf/+TIk16xkfpinsX1xjjv0qJvLmpxmBdjQudQ
	 7eTD0/nYsw2Ul33TgZX2otnVb7NI3KrTrED8p2YZoDnTmVTrawBWIbu0aSBaCqintC
	 cXLTcw094aWJkhtwwmUcigTwO5sbSkZggnhWs/b5oWCIIK2Xk54mzoI38MZIngiah2
	 j48DiZ1VSIJzIqkO4IeJyJoMBCFu1wMBPJfBmAJEGE60Y7XkNcTBlZZFsDt0rRR/HP
	 JXQMowMU6c0LRu7zfwg8MgscOB2Fs4sd5HppOY04ISRT9dwfCHd5XqPAALiQVrsMvf
	 R+lxA/CVfpJ3w==
Message-ID: <sashiko-outbox-227206@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] media: imx: remove legacy video node control and
 format handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaqi Shi" <shijiaqi_develop@163.com>, imx@lists.linux.dev
Cc: Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261121170232.414316-2-shijiaqi_develop@163.com>
References: <20261121170232.414316-1-shijiaqi_develop@163.com>
 <20261121170232.414316-2-shijiaqi_develop@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 17:26:10 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] media: imx: broken pixel format validation in
  capture_find_format()
- [High] media: imx: 32-bit planar sizeimage overflow in
  __capture_try_fmt()
- [Medium] media: imx: __capture_try_fmt() fails with -EINVAL on large
  dimensions
- [Medium] media: imx: unsanitized field handling in __capture_try_fmt()
- [Medium] media: imx: wrong default RGB quantization in
  __capture_try_fmt()
- [Medium] media: imx: callers of imx_media_capture_device_init() set
  legacy_api
--

commit 110cb63254b68ca17643e4ce4ba642ee6210e734
Author: Jiaqi Shi <shijiaqi_develop@163.com>

media: imx: remove legacy video node control and format handling

This commit removes control inheritance from pipeline subdevices to capture
video nodes and switches capture format handling to source-independent form=
at
ioctls initialized to a default UYVY 640x480 format.

> diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/stagin=
g/media/imx/imx-ic-prpencvf.c
> index 3430ddeac3569..372d25c791d35 100644
> --- a/drivers/staging/media/imx/imx-ic-prpencvf.c
> +++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
> @@ -1280,13 +1280,13 @@ static int prp_registered(struct v4l2_subdev *sd)
> =20
>  	priv->vdev =3D imx_media_capture_device_init(ic_priv->ipu_dev,
>  						   &ic_priv->sd,
> -						   PRPENCVF_SRC_PAD, true);
> +						   PRPENCVF_SRC_PAD, true, true);

[Severity: Medium]
Should prp_registered() and csi_registered() pass legacy_api =3D false (or
remove the legacy_api parameter from imx_media_capture_device_init()) now
that legacy format and control handling is being removed?

Because both callers still pass legacy_api =3D true, imx_media_capture_devi=
ce_init()
never sets V4L2_CAP_IO_MC on any capture video node, which causes
v4l_enum_fmt() in v4l2-core to zero f->mbus_code before calling
capture_enum_fmt_vid_cap().  It also leaves capture_legacy_ioctl_ops active
(while capture_ioctl_ops is unused), so VIDIOC_ENUM_FRAMESIZES still calls
capture_legacy_enum_framesizes(), which queries the source subdev's active
format and fails with -EINVAL on IC capture nodes for any pixel format whose
cc->codes[0] is not an IPU-internal media bus code.

[ ... ]

> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/stag=
ing/media/imx/imx-media-capture.c
> index 9216a221b72f4..adc524038ed81 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c

[ ... ]

> @@ -74,7 +70,11 @@ static const struct imx_media_pixfmt *capture_find_for=
mat(u32 code, u32 fourcc)
>  		return cc;
>  	}
> =20
> -	return imx_media_find_mbus_format(code, PIXFMT_SEL_ANY);
> +	cc =3D imx_media_find_mbus_format(code, PIXFMT_SEL_ANY);
> +	if (cc && fourcc && cc->fourcc !=3D fourcc)
> +		return NULL;
> +
> +	return cc;
>  }

[Severity: High]
Does capture_find_format() misvalidate both passthrough and IPU-internal
formats when called from capture_validate_fmt() at stream start?

In the non-IPU branch above, imx_media_find_mbus_format(code, PIXFMT_SEL_AN=
Y)
returns only the first entry in pixel_formats[] matching code:

drivers/staging/media/imx/imx-media-utils.c:pixel_formats[] {
    ...
	}, {
		.fourcc =3D V4L2_PIX_FMT_GREY,
		.codes =3D IMX_BUS_FMTS(
			MEDIA_BUS_FMT_Y8_1X8,
			MEDIA_BUS_FMT_Y10_1X10,
			MEDIA_BUS_FMT_Y12_1X12
		),
		.cs     =3D IPUV3_COLORSPACE_RGB,
		.bpp    =3D 8,
		.bayer  =3D true,
	}, {
		.fourcc =3D V4L2_PIX_FMT_Y10,
		.codes =3D IMX_BUS_FMTS(MEDIA_BUS_FMT_Y10_1X10),
		.cs     =3D IPUV3_COLORSPACE_RGB,
		.bpp    =3D 16,
		.bayer  =3D true,
    ...
}

Because V4L2_PIX_FMT_GREY precedes V4L2_PIX_FMT_Y10 and V4L2_PIX_FMT_Y12 and
lists MEDIA_BUS_FMT_Y10_1X10 and MEDIA_BUS_FMT_Y12_1X12,
imx_media_find_mbus_format() returns V4L2_PIX_FMT_GREY for those codes.
Checking cc->fourcc !=3D fourcc then rejects valid V4L2_PIX_FMT_Y10 and
V4L2_PIX_FMT_Y12 capture with -EPIPE while accepting 8-bpp V4L2_PIX_FMT_GREY
buffers for 16-bit passthrough DMA.

In the IPU branch of capture_find_format(), when fourcc is not found in
fmt_sel, it falls back to the first format in fmt_sel instead of returning
NULL:

drivers/staging/media/imx/imx-media-capture.c:capture_find_format() {
	cc =3D imx_media_find_ipu_format(code, PIXFMT_SEL_YUV_RGB);
	if (cc) {
		enum imx_pixfmt_sel fmt_sel =3D cc->cs =3D=3D IPUV3_COLORSPACE_YUV
					    ? PIXFMT_SEL_YUV : PIXFMT_SEL_RGB;

		cc =3D imx_media_find_pixel_format(fourcc, fmt_sel);
		if (!cc) {
			imx_media_enum_pixel_formats(&fourcc, 0, fmt_sel, 0);
			cc =3D imx_media_find_pixel_format(fourcc, fmt_sel);
		}

		return cc;
	}
    ...
}

Because all Bayer and greyscale entries in pixel_formats[] have
.cs =3D IPUV3_COLORSPACE_RGB, configuring a Bayer or greyscale pixel format=
 on
a video node fed by MEDIA_BUS_FMT_ARGB8888_1X32 falls back to a
PIXFMT_SEL_RGB descriptor with cc->cs =3D=3D IPUV3_COLORSPACE_RGB, passes
priv->vdev.cc->cs !=3D cc->cs in capture_validate_fmt(), and reaches
ipu_cpmem_set_image(), triggering WARN_ON(1) for V4L2_PIX_FMT_Y10/Y12 or
leaving the CPMEM channel at 32 bpp after an unchecked ipu_cpmem_set_fmt()
-EINVAL error and overflowing 8-bpp or 16-bpp DMA buffers.

> @@ -136,10 +136,12 @@ static int capture_g_fmt_vid_cap(struct file *file,=
 void *fh,
>  }
> =20
>  static const struct imx_media_pixfmt *
> -__capture_try_fmt(struct v4l2_pix_format *pixfmt, struct v4l2_rect *comp=
ose)
> +__capture_try_fmt(struct capture_priv *priv, struct v4l2_pix_format *pix=
fmt,
> +		  struct v4l2_rect *compose)
>  {
>  	struct v4l2_mbus_framefmt fmt_src;
>  	const struct imx_media_pixfmt *cc;
> +	u64 sizeimage;
> =20
>  	/*
>  	 * Find the pixel format, default to the first supported format if not
> @@ -167,9 +169,21 @@ __capture_try_fmt(struct v4l2_pix_format *pixfmt, st=
ruct v4l2_rect *compose)
>  		}
>  	}

[Severity: Medium]
Now that all capture nodes use __capture_try_fmt(), does this leave
pixfmt->field unsanitized and unvalidated against the source subdev?

In __capture_try_fmt(), the V4L2_FIELD_SEQ_TB and V4L2_FIELD_SEQ_BT cases s=
it
inside if (V4L2_FIELD_IS_INTERLACED(pixfmt->field)), which is false for
sequential fields, making that switch unreachable.  No other check sanitizes
pixfmt->field, so V4L2_FIELD_ANY or invalid field values are returned as-is
from VIDIOC_TRY_FMT and VIDIOC_S_FMT, and capture_validate_fmt() does not
verify priv->vdev.fmt.field against fmt_src.format.field before configuring
IDMAC interweaving.

> -	v4l2_fill_mbus_format(&fmt_src, pixfmt, 0);
> +	/* Clamp dimensions to prevent zero-sized buffers. */
> +	pixfmt->width =3D clamp(pixfmt->width, 1, 65535);
> +	pixfmt->height =3D clamp(pixfmt->height, 1, 65535);
> +
> +	v4l2_fill_mbus_format(&fmt_src, pixfmt,
> +			      cc->codes ? cc->codes[0] : 0);
> +	imx_media_try_colorimetry(&fmt_src, priv->ic_route);

[Severity: Medium]
Does passing cc->codes ? cc->codes[0] : 0 give in-memory-only RGB formats t=
he
wrong default quantization?

V4L2_PIX_FMT_BGR24, V4L2_PIX_FMT_XBGR32, V4L2_PIX_FMT_BGRX32 and
V4L2_PIX_FMT_RGBX32 have .codes =3D NULL in pixel_formats[].  When fmt_src.=
code
is 0, imx_media_try_colorimetry() cannot find a format descriptor, leaves
is_rgb =3D false, and maps V4L2_QUANTIZATION_DEFAULT to
V4L2_QUANTIZATION_LIM_RANGE instead of V4L2_QUANTIZATION_FULL_RANGE.

>  	imx_media_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src, cc);
> =20
> +	sizeimage =3D (u64)pixfmt->bytesperline * pixfmt->height;
> +	if (cc->planar)
> +		sizeimage =3D sizeimage * cc->bpp / 8;
> +	if (sizeimage > U32_MAX)
> +		return NULL;

[Severity: High]
Can pixfmt->sizeimage wrap to 0 for planar formats even when the 64-bit
sizeimage check here succeeds?

imx_media_mbus_fmt_to_pix_fmt() computes pix->sizeimage in 32-bit arithmetic
before shifting right by 3:

drivers/staging/media/imx/imx-media-utils.c:imx_media_mbus_fmt_to_pix_fmt()=
 {
    ...
	pix->sizeimage =3D cc->planar ? ((stride * pix->height * cc->bpp) >> 3) :
			 stride * pix->height;
}

For a 16-bpp planar format such as V4L2_PIX_FMT_NV16 or V4L2_PIX_FMT_YUV422P
at 16384x16384, stride * pix->height * cc->bpp is 2^32, so pixfmt->sizeimage
wraps to 0 in u32 while the 64-bit sizeimage in __capture_try_fmt() is
512 MiB (<=3D U32_MAX) and is never written back to pixfmt->sizeimage.  A
subsequent VIDIOC_REQBUFS or VIDIOC_CREATE_BUFS then divides by zero in
capture_queue_setup() at VID_MEM_LIMIT / pix->sizeimage.

> @@ -181,7 +195,11 @@ __capture_try_fmt(struct v4l2_pix_format *pixfmt, st=
ruct v4l2_rect *compose)
>  static int capture_try_fmt_vid_cap(struct file *file, void *fh,
>  				   struct v4l2_format *f)
>  {
> -	__capture_try_fmt(&f->fmt.pix, NULL);
> +	struct capture_priv *priv =3D video_drvdata(file);
> +
> +	if (!__capture_try_fmt(priv, &f->fmt.pix, NULL))
> +		return -EINVAL;
> +
>  	return 0;
>  }

[Severity: Medium]
Should VIDIOC_TRY_FMT and VIDIOC_S_FMT clamp width and height to dimensions
that fit within sizeimage rather than returning -EINVAL when sizeimage
exceeds U32_MAX?

capture_enum_framesizes() advertises dimensions up to 65535x65535, and
__capture_try_fmt() clamps width and height to 65535 (rounded up to 65536 in
imx_media_mbus_fmt_to_pix_fmt()).  For any format with bpp >=3D 12 (includi=
ng
the default UYVY), requesting 65535x65535 or probing maximum dimensions with
~0U x ~0U yields sizeimage > U32_MAX and causes VIDIOC_TRY_FMT and
VIDIOC_S_FMT to fail with -EINVAL instead of adjusting the dimensions into a
valid range.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121170232.4143=
16-1-shijiaqi_develop@163.com?part=3D1
