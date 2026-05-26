Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2103D3328;
	Tue, 26 May 2026 09:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788549; cv=none; b=ItNcbzyEu9uq2XUSIiaE6NqQExTfGG4B68KMvBcYo4anSNs2YyvxknEY0hXYOjz7EAgKRbrAZA9GPxMo6+DY6g6yAmDiy0Cz5p2n116SwdrQC/joht8rBX3+6r3UyQlGHbkv7sbsUiNte5jDtLnxbjIc6eA2kMXEqT9Wbpi9Sx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788549; c=relaxed/simple;
	bh=n5WEwkqtz0PInZAw/RpqBhg6rTw7+94ju4U+kclYmvU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GCFj5cTjyIsDVByeFJWso0hGu5bakcpAdRPl1hZcUWrBSMmL+olShNOOXDLMyYjtN6Kqx0BS/lOu6fsKpSdP3fSm55ZvmQdk9XmgsBWuSi05AIuEFetfCDHKJ7RBb54OtsyArwlJSZKvjp95OGuLNfMvR3y6qn7geAPFhCR42hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K4do0/4Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K4do0/4Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6521F000E9;
	Tue, 26 May 2026 09:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779788547;
	bh=/o2YNusDTaZE+3YMEt0fcjMHNNFhApfxFiUjSqpOI+Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K4do0/4Y3LTwjhJw9+7+kR9CXcRLV/1zp2YkB7+nmM893lQgyULtioN2zlMs7OO3Z
	 EIsX/iRYHnV0ceC7xT2Q/RXKMZO9DPxmS1QyWyeirNUYQcrL9UkdF3ooarYXcWJIyW
	 xGBT9WhvPBk3Vnu7hkHWyNs6EHZRhYwv0300/iXI04GwgB7+2PbfJQtLwQBgkNcJV5
	 /qLGToCAYg5SXuPTySF32SDoPLd4gvRdPBDJjTsV1vgGL9GC0bS6hTdQFIvM+EgED+
	 DYgOFr0ItaOjZ+o5aqagG71aVpMRhztvFa9LEX20A4eU0ML/vSdVEZgugKIYF2rtQy
	 FPXNjPGPrFZZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/3] media: nxp: Add i.MX95 CSI pixel formatter v4l2
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guoniu Zhou" <guoniu.zhou@oss.nxp.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260526-csi_formatter-v9-3-ca3d8c334c39@oss.nxp.com>
References: <20260526-csi_formatter-v9-3-ca3d8c334c39@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 09:42:26 +0000
Message-Id: <20260526094227.1C6521F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Unchecked pointer from `v4l2_subdev_state_get_format()` is derefer=
enced due to missing stream ID validation.
- [High] The driver incorrectly passes and iterates over the source stream =
mask to query sink-side formats and frame descriptors.
- [High] `csi_formatter_stop_stream()` clears the wrong hardware register b=
y using the stream index instead of the Virtual Channel (VC) ID.
- [High] The driver leaks the PM runtime usage counter and fails to clean u=
p hardware state if removed while streams are active.
- [High] Error handling in `csi_formatter_subdev_disable_streams()` desynch=
ronizes state with the V4L2 core, causing PM usage counter underflows.
- [Medium] Mixing scope-based cleanup helpers (`__free()` and `guard()`) wi=
th `goto` error handling.
- [Medium] Stream start and stop routines inappropriately limit V4L2 stream=
 ID iterations to `CSI_FORMATTER_VC_NUM` (8).
- [Medium] The driver inappropriately returns `-EINVAL` when setting a form=
at on an unrouted sink stream.
--

commit 519af3c273f2310baca55e801417774f1157eba3
Author: Guoniu Zhou <guoniu.zhou@nxp.com>
Date:   Tue May 26 08:57:22 2026 +0000

    media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver
   =20
    The CSI pixel formatter is a module found on i.MX95 used to reformat
    packet info, pixel and non-pixel data from CSI-2 host controller to
    match Pixel Link(PL) definition.

> diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c b/drivers/m=
edia/platform/nxp/imx95-csi-formatter.c
> new file mode 100644
> index 0000000000000..9dee38d85839c
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx95-csi-formatter.c

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
Is there a missing check for fmt being NULL here?=20

If userspace provides an invalid or non-existent stream ID,
v4l2_subdev_state_get_format() will return NULL, which appears to be
unconditionally dereferenced here.

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
Could fmt be NULL here as well if an invalid stream ID is provided?

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
Should this return -EINVAL if the stream is unrouted?=20

The V4L2 specification requires format changes on unrouted streams to succe=
ed
(they just shouldn't propagate), so returning an error here might break
compliant userspace applications configuring unrouted pad formats.

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

[Severity: Medium]
Is it safe to limit V4L2 stream ID iterations to CSI_FORMATTER_VC_NUM (8)?

V4L2 stream IDs are arbitrary and can range from 0 to 63, so any
configured stream with an ID >=3D 8 would be silently ignored. Could
this use for_each_set_bit() to iterate over the entire mask instead?

> +		if (!(stream_mask & BIT(i)))
> +			continue;
> +
> +		csi_formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(i), 0);

[Severity: High]
Does this write to the correct hardware register?

csi_formatter_start_stream() correctly resolves the hardware Virtual
Channel (VC) from the remote frame descriptor, but here we seem to be
writing 0 to CSI_VC_PIXEL_DATA_TYPE(i) where i is the V4L2 stream index.

If the stream index and VC ID differ, could this clear the wrong register
and corrupt another running VC's state?

> +	}
> +}
> +
> +static int csi_formatter_start_stream(struct csi_formatter *formatter,
> +				      struct v4l2_subdev_state *state,
> +				      u64 stream_mask)
> +{
> +	const struct csi_formatter_pix_format *pix_fmt;
> +	struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_mbus_frame_desc fd =3D {};
> +	u64 configured_streams =3D 0;
> +	unsigned int i;
> +	u32 val;
> +	int vc;
> +	int ret;
> +
> +	ret =3D v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
> +			       formatter->remote_pad, &fd);
> +	if (ret < 0 && ret !=3D -ENOIOCTLCMD) {
> +		dev_err(formatter->dev, "Failed to get frame desc: %d\n", ret);
> +		return ret;
> +	}
> +
> +	for (i =3D 0; i < CSI_FORMATTER_VC_NUM; ++i) {
> +		if (!(stream_mask & BIT(i)))
> +			continue;
> +
> +		fmt =3D v4l2_subdev_state_get_format(state,
> +						   CSI_FORMATTER_PAD_SINK, i);
> +
> +		pix_fmt =3D csi_formatter_find_format(fmt->code);

[Severity: High]
In csi_formatter_subdev_enable_streams(), stream_mask originates from the
source pad, but it is passed here and used as the stream index (i) to fetch
the sink-side format.

If the routing maps a different sink stream ID to this source stream ID,
will v4l2_subdev_state_get_format() return NULL for the non-existent sink
stream i and cause a NULL pointer dereference when accessing fmt->code?

> +
> +		val =3D BIT(csi_formatter_get_index_by_dt(pix_fmt->data_type));
> +
> +		if (ret =3D=3D -ENOIOCTLCMD) {
> +			/*
> +			 * Source doesn't implement get_frame_desc, use
> +			 * default VC 0
> +			 */
> +			vc =3D 0;
> +		} else {
> +			vc =3D csi_formatter_get_vc(formatter, &fd, i);
> +			if (vc < 0) {
> +				ret =3D vc;
> +				goto err_cleanup;
> +			}
> +		}
> +
> +		csi_formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), val);
> +		configured_streams |=3D BIT(i);
> +	}
> +
> +	return 0;
> +
> +err_cleanup:
> +	csi_formatter_stop_stream(formatter, configured_streams);
> +	return ret;
> +}
> +
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

[Severity: Medium]
Is it intended to mix scope-based cleanup helpers (guard) with goto error
handling here?=20

The kernel cleanup subsystem guidelines mandate that goto-based error handl=
ing
and scope-based cleanups should never be mixed within the same function.

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
> +	if (ret)
> +		goto err_runtime_put;
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
> +
> +static int csi_formatter_subdev_disable_streams(struct v4l2_subdev *sd,
> +						struct v4l2_subdev_state *state,
> +						u32 pad, u64 streams_mask)
> +{
> +	struct csi_formatter *formatter =3D sd_to_formatter(sd);
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
> +	ret =3D v4l2_subdev_disable_streams(formatter->csi_sd, formatter->remot=
e_pad,
> +					  sink_streams);
> +	if (ret)
> +		dev_err(formatter->dev, "Failed to disable streams: %d\n", ret);
> +
> +	csi_formatter_stop_stream(formatter, streams_mask);
> +
> +	formatter->enabled_streams &=3D ~streams_mask;
> +
> +	if (!formatter->enabled_streams)
> +		pm_runtime_put(formatter->dev);

[Severity: High]
If v4l2_subdev_disable_streams() fails and returns an error, the V4L2 core =
keeps
its internal stream state as "enabled", but this function proceeds to clear
formatter->enabled_streams and calls pm_runtime_put().

If the V4L2 core later retries disabling the stream, will it trigger an
unbalanced, secondary pm_runtime_put() call resulting in a PM usage counter
underflow since enabled_streams is already 0?

> +
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

[Severity: Medium]
Does this mix __free(fwnode_handle) with goto error handling below?

Similar to csi_formatter_subdev_enable_streams(), kernel guidelines state t=
hat
scope-based cleanup helpers and goto should not be used in the same functio=
n.

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

[ ... ]

> +static void csi_formatter_remove(struct platform_device *pdev)
> +{
> +	struct v4l2_subdev *sd =3D platform_get_drvdata(pdev);
> +	struct csi_formatter *formatter =3D sd_to_formatter(sd);
> +
> +	csi_formatter_async_unregister(formatter);
> +
> +	v4l2_subdev_cleanup(&formatter->sd);
> +	media_entity_cleanup(&formatter->sd.entity);
> +}

[Severity: High]
If the subdevice is unbound via sysfs while streams are active, will this l=
eak
the PM usage counter and leave the hardware in an active state?

It looks like csi_formatter_remove() unconditionally unregisters the subdev=
ice
but doesn't check if hardware streams need to be stopped or if the PM usage
counter needs to be dropped.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-csi_format=
ter-v9-0-ca3d8c334c39@oss.nxp.com?part=3D3
