Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D5733A70E;
	Wed, 17 Jun 2026 21:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781732071; cv=none; b=r/qhVeB33Tx58PgQchOF8qlOg8q/eaG7PGG3XHWLIRzgnpDR8tp4fREj26o0yPYuMuv+QWsWBTyV9qnwreJr4WfQ9XnWxopLFHzb4XcRDgHtfHBEInItWxTNxWofmL8cg+dypPyJeYI8dSKyFtG7f3vNsLnUsl0gFTq7JsmmIV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781732071; c=relaxed/simple;
	bh=3nnnR6EiFyHYiW8wgKR9MDTaiYefKIwVegOvJV9aq2Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uGTvXLv/820p8Nt2BInPV9vC5PaLxDIWOKusx2RUE/R1PHPCWs5Dm62MjJHTbh8MbogbmPn/oDKuokMS6zY4huGFoV2mEUcGfG8oy3pFco3FgbVr3PSr3QVvrLSvePriYf3PBOV446ENX79pB/B3OV+73o5WJhI2GKjdljn1WTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y514OBHt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y514OBHt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19601F000E9;
	Wed, 17 Jun 2026 21:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781732069;
	bh=aGyU18+JQRzeaO9DEypjkwjpt3OXdh3R9rJKxRBDrkk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y514OBHtxkI76J0l30uh04u8lwGNlB5HDJUffGsR2LRBIqBjIXnRQh0yW3WdnhGFC
	 +JS0DIVOEzlZkk/vRrfMe+w7VEid9uRdhxMZ8RVIhFOGfEmDiZ0sEXOYIYZnppyavF
	 HVTh6F9RSDUhShlpUWp8DQ4YNT3Wm2PGhg/ETl4OSa6ZNuQDymKhLCb8DJwKIe7wo7
	 Gx9dmV53voj5499S7zoak+ghKzdI/sW+wbQQcxdQkjCq6ySzgFpCnZz/sOMMEDznZv
	 oymDA4oqk5DqmsYLnjKIv2k4pj+nv8mEIntiqZxuP6gidrTIWas2g832C95JFOQUW/
	 7H8527D7IlrRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/8] media: nxp: add V4L2 subdev driver for camera
 parallel interface (CPI)
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260617-imx8qxp_pcam-v5-6-7fa6c8e7fba7@nxp.com>
References: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
 <20260617-imx8qxp_pcam-v5-6-7fa6c8e7fba7@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 21:34:29 +0000
Message-Id: <20260617213429.A19601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] NULL pointer dereference when enabling or disabling streams on an =
unconnected sink pad.
- [High] Missing format bounds clamping causes integer underflow and massiv=
e hardware width configuration.
- [Medium] Missing `V4L2_SUBDEV_FL_STREAMS` flag breaks V4L2 format and rou=
ting state initialization.
- [Medium] Reversed pad direction arguments in `v4l2_subdev_state_xlate_str=
eams` leads to improper stream mask mapping.
- [Low] Unconditional overwrite of hardware configuration variable `val` re=
nders `switch` statement dead code.
--

commit 6eecb6f34887a526e9a659dcd6d0a03e320f98ab
Author: Alice Yuan <alice.yuan@nxp.com>

media: nxp: add V4L2 subdev driver for camera parallel interface (CPI)

Add a V4L2 sub-device driver for the CPI controller found on i.MX8QXP,
i.MX8QM, and i.MX93 SoCs. This controller supports parallel camera sensors
and enables image data capture through a parallel interface.

> diff --git a/drivers/media/platform/nxp/imx-parallel-cpi.c b/drivers/medi=
a/platform/nxp/imx-parallel-cpi.c
> new file mode 100644
> index 0000000000000..00f5d5f47644b
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx-parallel-cpi.c
> @@ -0,0 +1,614 @@

[ ... ]

> +static void imx_cpi_config_ctrl_reg1(struct imx_cpi_device *pcpidev,
> +				     const struct v4l2_mbus_framefmt *format)
> +{
> +	const struct imx_cpi_plat_data *pdata =3D pcpidev->pdata;
> +	u32 pixel_width;
> +	u32 vsync_pulse;
> +	u32 val;
> +
> +	pixel_width =3D format->width - 1;
> +	vsync_pulse =3D format->width << 1;
> +
> +	switch (pcpidev->pdata->version) {
> +	case PI_V1:
> +		val =3D CPI_CTRL_REG1_PIXEL_WIDTH(pixel_width) |
> +		      CPI_CTRL_REG1_VSYNC_PULSE(vsync_pulse);
> +		break;
> +	default:
> +		val =3D 0; /* Never happen */
> +	}
> +
> +	val =3D CPI_CTRL_REG1_PIXEL_WIDTH(pixel_width) |
> +	      CPI_CTRL_REG1_VSYNC_PULSE(vsync_pulse);

[Severity: Low]
Is the unconditional assignment to val here intentional? It immediately
overwrites the val computed inside the switch statement above, effectively
rendering the switch block as dead code and dropping any future hardware
version configurations.

> +	writel(val, pcpidev->regs + pdata->interface_ctrl_reg1);
> +}

[ ... ]

> +static int imx_cpi_set_fmt(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *sd_state,
> +			   struct v4l2_subdev_format *sdformat)
> +{
> +	struct imx_cpi_pix_format const *pcpidev_fmt;
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	/*
> +	 * The Parallel cpi can't transcode in any way, the source format
> +	 * can't be modified.
> +	 */
> +	if (sdformat->pad =3D=3D V4L2_SUBDEV_1TO1_PADS_SOURCE)
> +		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
> +
> +	pcpidev_fmt =3D find_imx_cpi_format(sdformat->format.code);
> +	if (!pcpidev_fmt)
> +		pcpidev_fmt =3D &imx_cpi_formats[0];
> +
> +	fmt =3D v4l2_subdev_state_get_format(sd_state, sdformat->pad);
> +
> +	fmt->code =3D pcpidev_fmt->code;
> +	fmt->width =3D sdformat->format.width;
> +	fmt->height =3D sdformat->format.height;

[Severity: High]
Does this code need bounds checking for width and height? If a malicious
application provides a width of 0, it is copied directly to the format
structure here.

Later in imx_cpi_config_ctrl_reg1(), the width is used like this:

    pixel_width =3D format->width - 1;

which would underflow to 0xffffffff, causing an extremely large dimension to
be written to the hardware configuration.

> +	fmt->field =3D V4L2_FIELD_NONE;
> +	fmt->colorspace =3D sdformat->format.colorspace;

[ ... ]

> +static int imx_cpi_disable_streams(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state, u32 pad,
> +				   u64 streams_mask)
> +{
> +	struct imx_cpi_device *pcpidev =3D sd_to_imx_cpi_device(sd);
> +	struct media_pad *sink_pad, *remote_pad;
> +	struct device *dev =3D pcpidev->dev;
> +	struct v4l2_subdev *remote_sd;
> +	u64 mask;
> +	int ret;
> +
> +	sink_pad =3D &sd->entity.pads[V4L2_SUBDEV_1TO1_PADS_SINK];
> +	remote_pad =3D media_pad_remote_pad_first(sink_pad);
> +	remote_sd =3D media_entity_to_v4l2_subdev(remote_pad->entity);

[Severity: High]
Could this cause a NULL pointer dereference if the subdevice is not connect=
ed?

media_pad_remote_pad_first() returns NULL if no link is enabled on the sink
pad. If userspace sends VIDIOC_SUBDEV_S_STREAM directly to the unconnected
device node, remote_pad->entity would trigger a panic.

> +
> +	mask =3D v4l2_subdev_state_xlate_streams(state, V4L2_SUBDEV_1TO1_PADS_S=
INK,
> +					       V4L2_SUBDEV_1TO1_PADS_SOURCE,
> +					       &streams_mask);

[Severity: Medium]
Are the pad arguments reversed here?=20

When disable_streams is called, streams_mask originates from the pad passed
to the operation (the SOURCE pad). To find the remote mask, it should
translate from SOURCE to SINK.=20

Should this be passing V4L2_SUBDEV_1TO1_PADS_SOURCE as the second argument
and V4L2_SUBDEV_1TO1_PADS_SINK as the third?

> +
> +	ret =3D v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
> +	if (ret)

[ ... ]

> +static int imx_cpi_enable_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state, u32 pad,
> +				  u64 streams_mask)
> +{
> +	struct imx_cpi_device *pcpidev =3D sd_to_imx_cpi_device(sd);
> +	const struct imx_cpi_pix_format *pcpidev_fmt;
> +	const struct v4l2_mbus_framefmt *format;
> +	struct media_pad *sink_pad, *remote_pad;
> +	struct device *dev =3D pcpidev->dev;
> +	struct v4l2_subdev *remote_sd;
> +	u64 mask;
> +	int ret;
> +
> +	sink_pad =3D &sd->entity.pads[V4L2_SUBDEV_1TO1_PADS_SINK];
> +	remote_pad =3D media_pad_remote_pad_first(sink_pad);
> +	remote_sd =3D media_entity_to_v4l2_subdev(remote_pad->entity);

[Severity: High]
Does this have the same NULL pointer dereference issue on unconnected links=
 as
imx_cpi_disable_streams()?

> +
> +	mask =3D v4l2_subdev_state_xlate_streams(state, V4L2_SUBDEV_1TO1_PADS_S=
INK,
> +					       V4L2_SUBDEV_1TO1_PADS_SOURCE,
> +					       &streams_mask);

[Severity: Medium]
Similarly, do the pad arguments need to be swapped here to correctly
translate from SOURCE to SINK?

> +
> +	format =3D v4l2_subdev_state_get_format(state, V4L2_SUBDEV_1TO1_PADS_SI=
NK);

[ ... ]

> +static int imx_cpi_probe(struct platform_device *pdev)
> +{
> +	struct imx_cpi_device *pcpidev;
> +	struct device *dev =3D &pdev->dev;
> +	struct v4l2_subdev *sd;
> +	int ret;

[ ... ]

> +	sd->internal_ops =3D &imx_cpi_internal_ops;
> +	snprintf(sd->name, sizeof(sd->name), "parallel-%s",
> +		 dev_name(pcpidev->dev));
> +
> +	sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;

[Severity: Medium]
Should V4L2_SUBDEV_FL_STREAMS also be set here?

Without this flag, the V4L2 core falls back to allocating the legacy
state->pads array. This causes the routing and stream configuration
set up by v4l2_subdev_set_routing_with_fmt() in imx_cpi_init_state()
to be ignored, which leaves the initial format reporting uninitialized.

> +
> +	sd->entity.function =3D MEDIA_ENT_F_VID_IF_BRIDGE;
> +	sd->entity.ops =3D &imx_cpi_entity_ops;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-imx8qxp_pc=
am-v5-0-7fa6c8e7fba7@nxp.com?part=3D6
