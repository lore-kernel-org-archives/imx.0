Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285283;
	b=zn4Acya4dUYDekg5h/rtKJvNIgdGFfEVlr9VwWXioLHvQrb5fCEs3JVqPJHcRSMbpxdO
	 UGY6W9ZNGSiGu6GXapzKi+5Kp7LtQNbc81JGtrceyouexC31wLwqvmlvDREnl5N3oGu12
	 wlcOKX0ZSKwLt//pGF0/wHaUDUARsdPFZBIz5gmj7NFKVpm0aGLhhyDTbriK/raO9d38B
	 Wsb6KVy36/gfJ52TS/5kkKD6nrsItDaKWpkyVTU45j4paBWTbDXrqAjY0NOvZtEzNQi68
	 kybGmmiM5Z1MGwBaFac1oqywgFxQWgDPh9wu3mohWOT1Co5bCes9GT6gwNjHURlipsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285283;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=99a6GH1IG9BWxMypNk1CEeppxDuaA5e4a8XwihWg/No=;
	b=2SWYSJGoV60u4+c0ZeNWlSv1HBl12haxsOny1T77tKOBp7UVp9SAkUMrjUxaOM9G3zJS
	 2rAtPSMP2ZMX7BSqpq1S8OSiMLVO3vxri3MuGLlnB3mF0IU6V9iv8oyifuLjXvmH/ED1p
	 Td1ZOhVrXEG7vHJKoq9WodXta4G6DwKOI+zEWVBnPEWPAs4Hhwr+BCqz74i0yNdE7WUcF
	 U+auMLFGKjzCidEyys46AAQFQRmKNqB3+SGeJJS394M+0ZUHvIZaHZQfWI4YnGY/ZxjBK
	 v1YnBKjAUHiiujEzTOOGi+2Jo/HfmprDr5rwcmBlwStlyGCheOIPKUs/ZoTUFpVLWbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DvRcPmjF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5409F606A320
	for <imx@lists.linux.dev>; Sat, 21 Nov 2026 18:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DvRcPmjF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF601F000D2;
	Sat, 21 Nov 2026 18:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795285282;
	bh=99a6GH1IG9BWxMypNk1CEeppxDuaA5e4a8XwihWg/No=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DvRcPmjF8zln0JjSUU08rVvwWSmfev0WlFaoIqNyd3ZBcST7Bs1qp+g93cgkVzh3S
	 mKiluvEF7zzOEcaQSDnZswLHBMCqdQpLIgvbLZBBatWW4wB8BaI+tEnaoFALXCNXFa
	 Ly63Oa1LSEK6NRJKDoxhLjBHGu3rFo6/uK5Vq4XESgCyadDyKnVrKjLjMdqPOBthSh
	 Opj68nyIfjjro85q5iAIkiAtJoDX0/Ui7CmQmOEVvci0eIbGpJA156FH6oD9LFLwna
	 nFZApNsCjeezsvLAMY1DmiXo1sbAEf2T3mYgpWVdReqdYROW+YTnenA+3Fq8D/neaB
	 XRVcnto1ZYi9w==
Message-ID: <sashiko-outbox-227243@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] media: imx: remove legacy video node control and
 format handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaqi Shi" <shijiaqi_develop@163.com>, imx@lists.linux.dev
Cc: Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261121180044.424315-2-shijiaqi_develop@163.com>
References: <20261121180044.424315-1-shijiaqi_develop@163.com>
 <20261121180044.424315-2-shijiaqi_develop@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 18:21:22 +0000
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
- [Medium] media: imx: capture_validate_field() mutates vdev.fmt.field
  on stream start
- [Medium] media: imx: callers of imx_media_capture_device_init() still
  pass legacy_api
--

commit f4224bc45a1438de57dbc43b915f511c93024a3e
Author: Jiaqi Shi <shijiaqi_develop@163.com>

media: imx: remove legacy video node control and format handling

This commit removes subdev control inheritance from capture video nodes and
switches capture format handling and initialization to source-independent
format ioctls while keeping stream-time format validation.

> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/stag=
ing/media/imx/imx-media-capture.c
> index 9216a221b72f4..2e1cafc5f433e 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
[ ... ]
> @@ -566,10 +473,10 @@ static const struct v4l2_ioctl_ops capture_legacy_i=
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
Should the callers of imx_media_capture_device_init() stop setting
legacy_api to true now that video node format handling is decoupled from
the source subdev?

Both in-tree callers (prp_registered() and csi_registered()) still pass
legacy_api =3D true, which leaves V4L2_CAP_IO_MC unset on every capture dev=
ice
(so v4l_enum_fmt() zeroes f->mbus_code before calling
capture_enum_fmt_vid_cap()) and leaves capture_ioctl_ops,
capture_enum_framesizes(), and capture_subscribe_event() unused.

In addition, pairing capture_enum_fmt_vid_cap() with
capture_legacy_enum_framesizes() breaks VIDIOC_ENUM_FRAMESIZES on the IC
capture nodes: capture_enum_fmt_vid_cap() enumerates all non-IPU formats in
pixel_formats[], and capture_legacy_enum_framesizes() forwards their media
bus code (or 0 for in-memory-only formats) to prp_enum_frame_size(), which
rejects any non-IPU media bus code with -EINVAL.

> @@ -672,6 +579,44 @@ static void capture_buf_queue(struct vb2_buffer *vb)
>  	spin_unlock_irqrestore(&priv->q_lock, flags);
>  }
> =20
> +static int capture_validate_field(struct capture_priv *priv,
> +				  const struct v4l2_mbus_framefmt *src)
> +{
> +	struct v4l2_pix_format *pix =3D &priv->vdev.fmt;
> +
> +	switch (pix->field) {
> +	case V4L2_FIELD_INTERLACED:
> +		switch (src->field) {
> +		case V4L2_FIELD_SEQ_TB:
> +			pix->field =3D V4L2_FIELD_INTERLACED_TB;
> +			return 0;
> +		case V4L2_FIELD_SEQ_BT:
> +			pix->field =3D V4L2_FIELD_INTERLACED_BT;
> +			return 0;
> +		case V4L2_FIELD_INTERLACED:
> +			return 0;
> +		case V4L2_FIELD_INTERLACED_TB:
> +		case V4L2_FIELD_INTERLACED_BT:
> +			pix->field =3D src->field;
> +			return 0;
> +		default:
> +			return -EPIPE;
> +		}

[Severity: Medium]
Should capture_validate_field() avoid overwriting priv->vdev.fmt.field
during VIDIOC_STREAMON?

When userspace configures V4L2_FIELD_INTERLACED via VIDIOC_S_FMT,
capture_start_streaming() -> capture_validate_fmt() ->
capture_validate_field() mutates priv->vdev.fmt.field in place to
V4L2_FIELD_INTERLACED_TB or V4L2_FIELD_INTERLACED_BT.  This changes the
format reported by VIDIOC_G_FMT (even if imx_media_pipeline_set_stream()
 subsequently fails), and if the upstream subdev field order is later
switched between top-bottom and bottom-top without another VIDIOC_S_FMT, a
subsequent VIDIOC_STREAMON will validate against the overwritten field order
and fail with -EPIPE.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121180044.4243=
15-1-shijiaqi_develop@163.com?part=3D1
