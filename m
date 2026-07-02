Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E3D41737D;
	Thu,  2 Jul 2026 16:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783009707; cv=none; b=Jflvszs+7Mlhtva43VX+BLUYoJYduBCs7D7w4SQsRqk13n+zbmQXFMuqdEXOAdMtTFJfghRs7kZwwmZ6pZveOYmZC5OhTlubeB2SEjwZuHDOiYmAZ0ccXPRDCmFBG53w2jHn7+ayGWFgfMW1VFxbZRTgpjyYj+YtAPQNzcLhZ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783009707; c=relaxed/simple;
	bh=/pD5JEwZzSTScv3QBKNMSNQ4EUcXtQnyJRm64yRBLEg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XzgSdmN3xw2zJp/LN1OaOi/0gLhSwOLwOZCxAKpD04dRbWtyg7SnGOb6YR1URQs0VoqjRLmf5uLnODACT+/ROMkFw8SR6gdpaE77MtMP36TrYgUwicsz9dsNJ9c3miTb/VnXwLZr/fPtOOlx8DcN9Vhv2Fn0tJ3RKMVxdKxZ3+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezZXAybH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezZXAybH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70551F000E9;
	Thu,  2 Jul 2026 16:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783009704;
	bh=9IryllIVk3enACHHmZLwJ9XWBh2PbDtxYd3zVJcYSGA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ezZXAybHcJLfgCU3wu5NjX/rYv/ECiC7OOy8oNsY103tsGvpb6rPan8dHk//sERmY
	 dVpD5KTGZg6LV0KHAB+HRvkfkEJ03xJL+Z+ucclnvt3lYYHSP1DOrEJAY+3+nZDx5V
	 v6BECROqVBHytoPhhj5Xcsq66yvf43/S8FaxfLfgHnBPcv+/wQuIoUnqpdhpjSyjo+
	 y9UlzeNegJHFi5XIWk8RIL5USJJG4HU4P5eTekNs6DAW0FqO3O2fd/9E5wJjwAm9CX
	 4l8Rmy6UG6bReUkC03wD0veHg3IPjiWz7+Qpx3UCewYbIhnnEZfAjrtSzJE+XGApDk
	 TlAb58hjJS6MQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/8] media: nxp: add V4L2 subdev driver for camera
 parallel interface (CPI)
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260702-imx8qxp_pcam-v7-6-b47d9e363400@nxp.com>
References: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
 <20260702-imx8qxp_pcam-v7-6-b47d9e363400@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 16:28:23 +0000
Message-Id: <20260702162823.B70551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Missing NULL check for `remote_pad` in stream control operations c=
auses a kernel panic.
- [High] The driver fails to validate or clamp user-provided `width` and `h=
eight` in `imx_cpi_set_fmt`.
- [Medium] Selecting a non-existent Kconfig symbol `V4L2_1TO1`.
- [Medium] Hardware and clocks remain enabled if the driver is unbound whil=
e streaming.
- [Medium] Incorrect initial format set on the source pad during subdev sta=
te initialization.
--

commit ff679b5b2d589a01fdb96969df5b227ed2493b95
Author: Alice Yuan <alice.yuan@nxp.com>

media: nxp: add V4L2 subdev driver for camera parallel interface (CPI)

This patch adds a V4L2 sub-device driver for the CPI controller found on
i.MX8QXP, i.MX8QM, and i.MX93 SoCs. The controller supports parallel camera
sensors and enables image data capture through a parallel interface.

> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/=
nxp/Kconfig
> index 40e3436669e21..90f7c792003f2 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -39,6 +39,18 @@ config VIDEO_IMX_MIPI_CSIS
>  	  Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
>  	  v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.
> =20
> +config VIDEO_IMX_PARALLEL_CPI
> +	tristate "NXP i.MX8/i.MX9 Parallel CPI Driver"
> +	depends on ARCH_MXC || COMPILE_TEST
> +	depends on VIDEO_DEV
> +	select MEDIA_CONTROLLER
> +	select V4L2_1TO1

[Severity: Medium]
Is the V4L2_1TO1 symbol defined anywhere in the kernel configuration tree?
Selecting a non-existent Kconfig symbol has no effect and might cause silent
warnings or leave required features disabled.

> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help

[ ... ]

> diff --git a/drivers/media/platform/nxp/imx-parallel-cpi.c b/drivers/medi=
a/platform/nxp/imx-parallel-cpi.c
> new file mode 100644
> index 0000000000000..735d4a89f7b30
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx-parallel-cpi.c
> @@ -0,0 +1,629 @@

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
Are the user-supplied width and height validated or clamped before being
saved to the subdevice state?

If a user sets the width to 0 via the VIDIOC_SUBDEV_S_FMT ioctl, could this
cause an arithmetic underflow later when calculating the hardware register
configuration in imx_cpi_config_ctrl_reg1():
       =20
pixel_width =3D format->width - 1;

> +	fmt->field =3D V4L2_FIELD_NONE;
> +	fmt->colorspace =3D sdformat->format.colorspace;

[ ... ]

> +static int imx_cpi_init_state(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_subdev_route routes[] =3D {
> +		{
> +			.sink_pad =3D V4L2_SUBDEV_1TO1_PADS_SINK,
> +			.sink_stream =3D 0,
> +			.source_pad =3D V4L2_SUBDEV_1TO1_PADS_SOURCE,
> +			.source_stream =3D 0,
> +			.flags =3D V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
> +	struct v4l2_subdev_krouting routing =3D {
> +		.len_routes =3D ARRAY_SIZE(routes),
> +		.num_routes =3D ARRAY_SIZE(routes),
> +		.routes =3D routes,
> +	};
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	fmt =3D v4l2_subdev_state_get_format(state, 0);
> +
> +	fmt->code =3D imx_cpi_formats[0].code;
> +	fmt->width =3D 1920;
> +	fmt->height =3D 1080;
> +
> +	fmt->colorspace =3D V4L2_COLORSPACE_SMPTE170M;
> +	fmt->xfer_func =3D V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
> +	fmt->ycbcr_enc =3D V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
> +	fmt->quantization =3D V4L2_MAP_QUANTIZATION_DEFAULT(false,
> +							  fmt->colorspace,
> +							  fmt->ycbcr_enc);
> +
> +	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing, fmt);

[Severity: Medium]
Does v4l2_subdev_set_routing_with_fmt() copy the sink format directly to
the source pad without accounting for hardware unpacking?

Since the IMX CPI unpacks data, will this cause the subdevice to expose
an inconsistent default format? Would it be better to initialize the
source pad to natively output MEDIA_BUS_FMT_UYVY8_1X16 instead?

> +}
> +
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
If the subdevice is not linked, could media_pad_remote_pad_first() return
NULL?

Since the subdevice is registered with a device node, userspace can invoke
stream operations directly. Could dereferencing remote_pad->entity cause a
kernel panic in that scenario?

This identical pattern also appears in imx_cpi_enable_streams().

> +
> +	mask =3D v4l2_subdev_state_xlate_streams(state, V4L2_SUBDEV_1TO1_PADS_S=
INK,
> +					       V4L2_SUBDEV_1TO1_PADS_SOURCE,
> +					       &streams_mask);

[ ... ]

> +static void imx_cpi_remove(struct platform_device *pdev)
> +{
> +	struct imx_cpi_device *pcpidev =3D platform_get_drvdata(pdev);
> +
> +	media_async_subdev_cleanup(&pcpidev->sd);
> +}

[Severity: Medium]
If the driver is unbound via sysfs while actively streaming, does this
leave the hardware running and leak the PM runtime usage counter?

Since imx_cpi_enable_streams() increments the PM usage counter via
pm_runtime_resume_and_get(), should there be explicit calls to stop the
streams and put the PM counter in the remove path before cleanup?

> +
> +static int imx_cpi_probe(struct platform_device *pdev)
> +{

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-imx8qxp_pc=
am-v7-0-b47d9e363400@nxp.com?part=3D6
