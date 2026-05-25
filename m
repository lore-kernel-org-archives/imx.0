Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA9E3E3C72;
	Mon, 25 May 2026 08:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698809; cv=none; b=mXgqjtNXvDXqFbac5TSAsaXuhFGGjI81UY+q1qhjG/DlmrQtppGaa5Rw2LwuIKFX0XQQV6d6Jep3RUc4aDW9kokPr/9u/1sddfQVvn3odKr/csgt5fScHQHw76dGgKk3BllZLb7O9KW1xn0ImO2hGd3nf+bfksxz8yoowXfOZv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698809; c=relaxed/simple;
	bh=Stdhza6Oq8FYJWTJilEWVe1tgP2DE3Wa9fnb0UAoCXk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rBJCNHNYF6dGJZfOXLL0h6ZM+1lzci+oFv1OQqfw4PsuZWVydELFRJTsmNTdJ2tyP1lTUVgxZCNP/U9ScvAO6lh951tHhXLeqezeSUxNP/ZRn4zI0iKHunC8UFZ0//qAnwrXcmEMmjkQGYO6dpDIu5fwWtvCRH77IgnD8Mi68+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtFFQAP9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtFFQAP9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C99E1F000E9;
	Mon, 25 May 2026 08:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779698806;
	bh=qHpj2w1rqU8ZRSNh8ayTchKqf0227oMB6jy8M0i++KY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CtFFQAP9od9Tmyp+Y0o/ZRku73PzVb8M4VNNeDLEKuvmRTfp0LyyslJdqJtlStWIa
	 tv1bGxXtt0ZgeqcpC8yWEXVqESHj2yIylMZ5zDlIQlGdpeJAD3dbfU3lPtL8RCvoBd
	 RdGeg06jtrZMy5wmiyFfBP6JwoFUHag9R04I1tv7/2yMKPR2SsqK7PO4BupsG+KGq6
	 XvRTnvFG7+by5DJJ35SSafFiTJ7+pUM9Qu0xJK5M5MonfMeBqAV/77wk65hIwuM53f
	 WZ2+Oaj3N619lFoWGctogbYw979dDrwg6zhwdWy88h9ZhFkOms8CytDcay2AjQ/xsH
	 5pHc8DBz7vZ0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] media: nxp: Add i.MX95 CSI pixel formatter v4l2
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guoniu Zhou" <guoniu.zhou@oss.nxp.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260525-csi_formatter-v8-2-6b646231224b@oss.nxp.com>
References: <20260525-csi_formatter-v8-2-6b646231224b@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 08:46:45 +0000
Message-Id: <20260525084646.3C99E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Passing the source streams mask instead of the sink streams mask c=
auses a NULL pointer dereference.
- [High] `csi_formatter_stop_stream()` uses the logical stream ID as the ha=
rdware Virtual Channel (VC) ID, corrupting hardware state.
- [High] Unchecked return value from `v4l2_subdev_state_get_format()` leads=
 to kernel panic (NULL pointer dereference).
- [Medium] Mixing goto-based error handling with scope-based cleanups viola=
tes subsystem rules.
- [Medium] `csi_formatter_subdev_set_fmt()` incorrectly returns `-EINVAL` w=
hen a stream is unrouted.
--

commit 4a48a80a7ebf00e31a1265c66f021dc5ed204a58
Author: Guoniu Zhou <guoniu.zhou@nxp.com>

media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver
   =20
The CSI pixel formatter is a module found on i.MX95 used to reformat
packet info, pixel and non-pixel data from CSI-2 host controller to
match Pixel Link(PL) definition.

> diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c b/drivers/m=
edia/platform/nxp/imx95-csi-formatter.c
> new file mode 100644
> index 0000000000000..671979444d48b
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx95-csi-formatter.c
> @@ -0,0 +1,757 @@

[ ... ]

> +static int csi_formatter_subdev_enum_mbus_code(struct v4l2_subdev *sd,
> +					       struct v4l2_subdev_state *sd_state,
> +					       struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	if (code->pad =3D=3D CSI_FORMATTER_PAD_SOURCE) {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		if (code->index > 0)
> +			return -EINVAL;
> +
> +		fmt =3D v4l2_subdev_state_get_format(sd_state, code->pad,
> +						   code->stream);
> +		code->code =3D fmt->code;

[Severity: High]
Can fmt be NULL here? If userspace provides an invalid or non-existent
stream ID, the V4L2 core does not validate it, and
v4l2_subdev_state_get_format() will return NULL, which would cause a NULL
pointer dereference.

> +		return 0;
> +	}
> +
> +	if (code->index >=3D ARRAY_SIZE(formats))
> +		return -EINVAL;
> +
> +	code->code =3D formats[code->index].code;
> +
> +	return 0;
> +}
> +
> +static int csi_formatter_subdev_set_fmt(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_state *sd_state,
> +					struct v4l2_subdev_format *sdformat)
> +{
> +	struct csi_formatter_pix_format const *format;
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	if (sdformat->pad =3D=3D CSI_FORMATTER_PAD_SOURCE)
> +		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
> +
> +	format =3D csi_formatter_find_format(sdformat->format.code);
> +	if (!format)
> +		format =3D &formats[0];
> +
> +	v4l_bound_align_image(&sdformat->format.width, 1, 0xffff, 2,
> +			      &sdformat->format.height, 1, 0xffff, 0, 0);
> +
> +	fmt =3D v4l2_subdev_state_get_format(sd_state, sdformat->pad,
> +					   sdformat->stream);
> +	*fmt =3D sdformat->format;

[Severity: High]
Can fmt be NULL here as well? If the stream ID from userspace is invalid,
v4l2_subdev_state_get_format() will return NULL, resulting in a NULL pointer
dereference.

> +
> +	/* Set default code if user set an invalid value */
> +	fmt->code =3D format->code;
> +
> +	/* Propagate the format from sink stream to source stream */
> +	fmt =3D v4l2_subdev_state_get_opposite_stream_format(sd_state, sdformat=
->pad,
> +							   sdformat->stream);
> +	if (!fmt)
> +		return -EINVAL;

[Severity: Medium]
Should this return 0 instead of -EINVAL? If the stream is not currently
routed, v4l2_subdev_state_get_opposite_stream_format() correctly returns
NULL. V4L2 subdevice UAPI semantics allow userspace to set stream formats
regardless of active routing, so it might be better to just ignore
propagation and return 0.

> +
> +	*fmt =3D sdformat->format;
> +
> +	return 0;
> +}

[ ... ]

> +static void csi_formatter_stop_stream(struct csi_formatter *formatter,
> +				      u64 stream_mask)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < CSI_FORMATTER_VC_NUM; ++i) {
> +		if (!(stream_mask & BIT(i)))
> +			continue;
> +
> +		csi_formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(i), 0);

[Severity: High]
Does this clear the wrong hardware registers? In csi_formatter_start_stream=
(),
the driver correctly resolves the physical Virtual Channel ID (vc) and writ=
es
to CSI_VC_PIXEL_DATA_TYPE(vc).

Here, the logical stream index i is used as the VC ID. Since logical stream
IDs do not necessarily match physical VC IDs, this might fail to disable the
intended stream and potentially corrupt other active streams.

> +	}
> +}

[ ... ]

> +static int csi_formatter_subdev_enable_streams(struct v4l2_subdev *sd,
> +					       struct v4l2_subdev_state *state,
> +					       u32 pad, u64 streams_mask)
> +{
> +	struct csi_formatter *formatter =3D sd_to_formatter(sd);
> +	struct device *dev =3D formatter->dev;
> +	u64 sink_streams;
> +	int ret;
> +
> +	sink_streams =3D v4l2_subdev_state_xlate_streams(state,
> +						       CSI_FORMATTER_PAD_SOURCE,
> +						       CSI_FORMATTER_PAD_SINK,
> +						       &streams_mask);
> +	if (!sink_streams || !streams_mask)
> +		return -EINVAL;
> +
> +	guard(mutex)(&formatter->lock);
> +
> +	if (!formatter->enabled_streams) {
> +		ret =3D pm_runtime_resume_and_get(formatter->dev);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to resume runtime PM: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	ret =3D csi_formatter_start_stream(formatter, state, streams_mask);

[Severity: High]
Should this pass sink_streams instead of streams_mask? streams_mask
applies to the source pad, but it is passed directly to
csi_formatter_start_stream(). Inside that helper,
v4l2_subdev_state_get_format() is called using the bits from the source
mask but with CSI_FORMATTER_PAD_SINK.

If the routing maps a sink stream to a differently-numbered source stream,
the format query for the sink pad could return NULL, resulting in a NULL
pointer dereference.

> +	if (ret)
> +		goto err_runtime_put;

[Severity: Medium]
Does this mix goto-based error handling with scope-based cleanups?
According to the kernel cleanup subsystem guidelines, functions must not mix
goto-based error handling with scope-based cleanup macros like guard().
This creates confusing ownership semantics and increases the risk of bugs
during future modifications.

> +
> +	ret =3D v4l2_subdev_enable_streams(formatter->csi_sd,
> +					 formatter->remote_pad,
> +					 sink_streams);
> +	if (ret)
> +		goto err_stop_stream;
> +
> +	formatter->enabled_streams |=3D streams_mask;
> +
> +	return 0;
> +
> +err_stop_stream:
> +	csi_formatter_stop_stream(formatter, streams_mask);
> +err_runtime_put:
> +	if (!formatter->enabled_streams)
> +		pm_runtime_put(formatter->dev);
> +	return ret;
> +}

[ ... ]

> +static int csi_formatter_async_register(struct csi_formatter *formatter)
> +{
> +	struct device *dev =3D formatter->dev;
> +	struct v4l2_async_connection *asc;
> +	int ret;
> +
> +	struct fwnode_handle *ep __free(fwnode_handle) =3D
> +		fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> +						FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!ep)
> +		return -ENOTCONN;
> +
> +	v4l2_async_subdev_nf_init(&formatter->notifier, &formatter->sd);
> +
> +	asc =3D v4l2_async_nf_add_fwnode_remote(&formatter->notifier, ep,
> +					      struct v4l2_async_connection);
> +	if (IS_ERR(asc)) {
> +		ret =3D PTR_ERR(asc);
> +		goto err_cleanup_notifier;

[Severity: Medium]
Similar to above, does this mix goto-based error handling with scope-based
cleanups? The function uses __free() for ep but then uses goto for error
handling.

> +	}
> +
> +	formatter->notifier.ops =3D &formatter_notify_ops;
> +
> +	ret =3D v4l2_async_nf_register(&formatter->notifier);
> +	if (ret)
> +		goto err_cleanup_notifier;
> +
> +	ret =3D v4l2_async_register_subdev(&formatter->sd);
> +	if (ret)
> +		goto err_unregister_notifier;
> +
> +	return 0;
> +
> +err_unregister_notifier:
> +	v4l2_async_nf_unregister(&formatter->notifier);
> +err_cleanup_notifier:
> +	v4l2_async_nf_cleanup(&formatter->notifier);
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-csi_format=
ter-v8-0-6b646231224b@oss.nxp.com?part=3D2
