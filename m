Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5079C3AB476;
	Thu, 16 Jul 2026 07:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784186459; cv=none; b=gOVnhkvi440VU1+Gae7OB6F5xr5FeeBkpIMdMYSNg/+fnOVSZwQROsmpnAa8ImKOs0GFTZ8f411Y3H7FO7FbIMvUT0s0zqqxU6YDuR6/dsin+4cuPL10Mg4a9BNcwCqHohoP1LvQC6KO39V6lt9+kyAdCarUZjePeSJs9QMCgDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784186459; c=relaxed/simple;
	bh=RljZHt2pfdDyrNv566YSiv+lWBpejUZEEmxriA1qOPA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rPx1GQuFXyGGAinTSWxkTAyaDwgls6YX+9ikYRK4fZGohHsdZozbdlqZA+4kFg4s86x/v6nbwOOcUQx0r1Iz4EDM/MY+rbZ+hHtEnxi3cGFqGHcxsQ+ekWHfE3bOkWLU6qo4W9ABHsNnZfrlLdSSqCT69BVPzcyzzeRBRnOEHh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWlcsj3r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWlcsj3r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20961F000E9;
	Thu, 16 Jul 2026 07:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784186453;
	bh=fJoXlkCvrZ1VqGsTKJDhpWpLP3RCEujMB/N8tYQrXTE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fWlcsj3rtPfDzYXOF6h5xmNxBz57LX5Vc15Kv2nS6f16ZxdgeNhsg40joYIfS4FUc
	 t7xQEjLW2wBrmo9b3D6yE4JXxQZSxCNuGgR5AVMeqj4sE4vA18gBQVyGgUKPRFTn3u
	 A61BJHAkC6tZKiYrTXMlWMxe7YPWu7K2TKIuT2GhG0BEg1i6bC/Nr7rQMJ7dyA9+Kl
	 4XDSy2l+0JJg2LBIPC/AUGUemHuQ2azxoP9eB4s8+TX7Rp6gawUMZ7LP4sTh7oS+mm
	 CzZNQtGwu9LHTk9YTw67gN3ijOTCe8fLayy6JdCuXJR70jfQjslC3i+EqRLYAsWBi0
	 0GsF/fPt9o8JQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 3/3] media: nxp: Add i.MX95 CSI pixel formatter v4l2
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: guoniu.zhou@oss.nxp.com
Cc: Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260716-csi_formatter-v12-3-2601d17fc4af@oss.nxp.com>
References: <20260716-csi_formatter-v12-0-2601d17fc4af@oss.nxp.com>
 <20260716-csi_formatter-v12-3-2601d17fc4af@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 07:20:52 +0000
Message-Id: <20260716072052.A20961F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Missing NULL checks for the return value of `v4l2_subdev_state_get=
_format()` allow userspace to trigger a kernel panic.
- [High] The driver caches a pointer to the remote subdevice when bound, bu=
t fails to implement an `.unbind` callback to clear it, leading to a Use-Af=
ter-Free.
- [Medium] Mixing `goto`-based error handling with scope-based cleanup (`__=
free` and `guard`) in the same function violates kernel cleanup guidelines.
- [Medium] `csi_formatter_subdev_set_fmt` partially modifies the subdevice =
state but returns `-EINVAL` if the stream has no active route.
- [Medium] The `csi_formatter_read` wrapper ignores the return value of `re=
gmap_read`, potentially leading to uninitialized stack variable usage.
--

--- Patch [3]: [PATCH v12 3/3] media: nxp: Add i.MX95 CSI pixel formatter v=
4l2 driver ---
commit 0cff6156940653a6a408d93ee678b339b7218ebb
Author: Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver

The CSI pixel formatter is a module found on i.MX95 used to reformat
packet info, pixel and non-pixel data from CSI-2 host controller to
match Pixel Link(PL) definition. Add data formatting support.

> diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c b/drivers/m=
edia/platform/nxp/imx95-csi-formatter.c
> new file mode 100644
> index 0000000000000..cea60327c9729
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
Can this cause a NULL pointer dereference?=20

The V4L2 core does not validate the stream ID provided by userspace in
VIDIOC_SUBDEV_ENUM_MBUS_CODE against the active routing table before calling
this function. If a user passes an invalid stream ID,
v4l2_subdev_state_get_format() returns NULL, which is then unconditionally
dereferenced here.

> +		return 0;
> +	}

[ ... ]

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
Does this also risk a NULL pointer dereference for the same reason?
Userspace can provide an invalid stream ID during VIDIOC_SUBDEV_S_FMT,
resulting in v4l2_subdev_state_get_format() returning NULL.

> +
> +	/* Set default code if user set an invalid value */
> +	fmt->code =3D format->code;
> +	sdformat->format =3D *fmt;
> +
> +	/* Propagate the format from sink stream to source stream */
> +	fmt =3D v4l2_subdev_state_get_opposite_stream_format(sd_state, sdformat=
->pad,
> +							   sdformat->stream);
> +	if (!fmt)
> +		return -EINVAL;

[Severity: Medium]
Does this leave the subdevice in an inconsistent state?=20

If a user configures the format on a sink pad stream that does not currently
have an active route to a source pad, v4l2_subdev_state_get_opposite_stream=
_format()
returns NULL. This causes the driver to return -EINVAL after the sink format
has already been updated in the state earlier in this function. Setting a
format on an unrouted stream is generally a valid V4L2 operation.

> +
> +	*fmt =3D sdformat->format;
> +
> +	return 0;
> +}

[ ... ]

> +static inline void csi_formatter_read(struct csi_formatter *formatter,
> +				      unsigned int reg, unsigned int *value)
> +{
> +	u32 offset =3D formatter->reg_offset;
> +
> +	regmap_read(formatter->regs, reg + offset, value);
> +}

[Severity: Medium]
Can this write uninitialized stack memory to hardware registers?

The wrapper csi_formatter_read() ignores the return value of regmap_read().
If the read fails, local stack variables remain uninitialized.

For example, when called from csi_formatter_start_stream():

    u32 val;
    ...
    csi_formatter_read(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), &val);
    val |=3D BIT(csi_formatter_get_index_by_dt(pix_fmt->data_type));
    csi_formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), val);

The driver performs bitwise operations on val and writes it back to the
CSI_VC_PIXEL_DATA_TYPE register. If regmap_read() failed, this writes
garbage data to the hardware.

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
> +	csi_formatter_stop_stream(formatter, state, streams_mask);
> +err_runtime_put:
> +	if (!formatter->enabled_streams)
> +		pm_runtime_put(formatter->dev);
> +	return ret;
> +}

[Severity: Medium]
Is it safe to mix guard() with goto labels in the same function?

The kernel cleanup guidelines note that the expectation is that usage of
goto and cleanup helpers is never mixed in the same function to avoid
resource leaks or double-free bugs during future maintenance.

[ ... ]

> +static const struct v4l2_async_notifier_operations formatter_notify_ops =
=3D {
> +	.bound =3D csi_formatter_notify_bound,
> +};

[Severity: High]
Could this result in a use-after-free?

The driver saves the remote subdev pointer in csi_formatter_notify_bound()
via formatter->csi_sd =3D sd, but there is no unbind callback in
formatter_notify_ops to clear formatter->csi_sd.

If the remote subdevice is unbound (e.g. the sensor module is removed), the
V4L2 async framework tears down the link. Because the pointer isn't cleared,
subsequent calls to VIDIOC_SUBDEV_ENABLE_STREAMS on the still-registered
formatter video node will dereference the freed formatter->csi_sd pointer
in csi_formatter_subdev_enable_streams().

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

[Severity: Medium]
Does mixing __free() scope declarations with goto error labels here risk
cleanup ordering issues?=20

The kernel guidelines specify that functions should either convert all
resources that need a goto cleanup to scope-based cleanup, or convert none
of them.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-csi_format=
ter-v12-0-2601d17fc4af@oss.nxp.com?part=3D3
