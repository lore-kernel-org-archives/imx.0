Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D873E4C7A;
	Wed, 24 Jun 2026 21:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335021; cv=none; b=uBC4joow7tgrH1SKHCtsLBk3OB2XxgNCp3Da8IoVjtOmgsLdk8fBeJQOunROLDGvYKEFVJ+wc/sIO3nN6yQvZsH7VAR+F4bjTc5HBZ4l7/ANaj9U64lgUOEi9mI4YXiLo24bm4gm4xQpk5k13xbO/OfM8bdUf90PAOXsmsIOi6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335021; c=relaxed/simple;
	bh=fOD6KBedX3oEr2DsyKXacMQsqIvLOgUwzJmByGFFNBA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bYGZo2ksLiV7hcOtyRiFtOliCh52MqkuZN76jpmCNkfl8pYxTdaGAIqhSV7XK7QobxMWsXZ6Q6SZS34PYLEWVpGkM0iatgQALIViZHZT2E4gtd6yBfXHJwdfuGhTB92kXST7hOZujmrrWxiERXQ28EzhO2Z6PxSLsG9r/YXKpPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hls5TIcp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hls5TIcp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1001F000E9;
	Wed, 24 Jun 2026 21:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782335020;
	bh=K4/9Pv7Q10DR3NH7kaB5DbhvWCclsV0RF1m6DBcAP7o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hls5TIcpar9x/Lm2yabUvJKF+6IuSx9/BhFAgIejXAqQbLn6wnlER1iNaX6F72TFK
	 5qKinr/f7bAyDV6hV1RcDkNf/SDdaar6QJmhLGTYoXrWaJ490qYFwZ/iZwGmkTft/K
	 z6Jv7AZBJCFLKbXPtSuJDAfihm165w3V5mSLYRnSeL5oIKWvgv1UqsJBp/xhNg9kG1
	 uL9myeLJvogFoJba/+5XfkAcENUHeQbRuQEPUkHsx/4usbocrqzmeRUJb4v19dSmpq
	 qdXrd1dJrC7fuxnA5jI0HqDTsKuCoRByL0QUhbeQwN7nPHiqW+dPcCh2NyIYU6MRK/
	 ZlggmGUCYTaBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/9] media: nxp: add V4L2 subdev driver for camera
 parallel interface (CPI)
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260624-imx8qxp_pcam-v6-7-4b3f45920d2f@nxp.com>
References: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
 <20260624-imx8qxp_pcam-v6-7-4b3f45920d2f@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 21:03:39 +0000
Message-Id: <20260624210339.AB1001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Hardcoded pad indices lead to a NULL pointer dereference in `imx_c=
pi_set_fmt()` if the device tree specifies fewer than 2 endpoints.
- [High] Hardcoded pad indices cause memory corruption and use of uninitial=
ized flags if device tree endpoints are reordered.
- [High] Pending asynchronous PM runtime suspend is cancelled during device=
 removal, permanently leaking hardware clocks.
- [Medium] The Kconfig symbol `VIDEO_IMX_PARALLEL_CPI` selects a non-existe=
nt symbol `V4L2_1TO1`.
- [Medium] Unchecked return value from `of_device_get_match_data()` leads t=
o a NULL pointer dereference if bound via sysfs.
- [Medium] Incorrect pad arguments passed to `v4l2_subdev_state_xlate_strea=
ms()`.
- [Low] The V2 register macros for `CPI_CTRL_V2_REG1` overlap at bit 16 and=
 exceed the 32-bit register width.
--

commit 547923ad3a1ab4157dbe156e0b9151600e5bb65f
Author: Alice Yuan <alice.yuan@nxp.com>

media: nxp: add V4L2 subdev driver for camera parallel interface (CPI)

This commit adds a V4L2 sub-device driver for the CPI controller found
on i.MX8QXP, i.MX8QM, and i.MX93 SoCs. It supports parallel camera
sensors and enables image data capture through a parallel interface.

> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/=
nxp/Kconfig
> index 40e3436669e21..90f7c792003f2 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -39,6 +39,18 @@ config VIDEO_IMX_MIPI_CSIS
[ ... ]
> +config VIDEO_IMX_PARALLEL_CPI
> +	tristate "NXP i.MX8/i.MX9 Parallel CPI Driver"
> +	depends on ARCH_MXC || COMPILE_TEST
> +	depends on VIDEO_DEV
> +	select MEDIA_CONTROLLER
> +	select V4L2_1TO1

[Severity: Medium]
Is this selecting a non-existent Kconfig symbol? V4L2_1TO1 does not appear
to exist in the kernel tree. Selecting a missing symbol can cause unmet
dependency warnings or silent build failures.

> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  Video4Linux2 sub-device driver for PARALLEL CPI receiver found
> +	  on some iMX8 and iMX9 SoCs.

> diff --git a/drivers/media/platform/nxp/imx-parallel-cpi.c b/drivers/medi=
a/platform/nxp/imx-parallel-cpi.c
> new file mode 100644
> index 0000000000000..0f74b51608715
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx-parallel-cpi.c
> @@ -0,0 +1,629 @@
[ ... ]
> +/* CPI INTERFACE CONTROL REG1 */
> +#define CPI_CTRL_REG1_PIXEL_WIDTH(v)		FIELD_PREP(GENMASK(15, 0), (v))
> +#define CPI_CTRL_REG1_VSYNC_PULSE(v)		FIELD_PREP(GENMASK(31, 16), (v))
> +
> +#define CPI_CTRL_V2_REG1_PIXEL_WIDTH(v)		FIELD_PREP(GENMASK(16, 0), (v))
> +#define CPI_CTRL_V2_REG1_VSYNC_PULSE(v)		FIELD_PREP(GENMASK(31, 16), (v))

[Severity: Low]
Do these V2 register macros overlap? The GENMASK(16, 0) and GENMASK(31, 16)
overlap at bit 16, resulting in a 33-bit span for what appears to be a
32-bit register. While currently unused, could this corrupt register
values if utilized in the future?

> +
> +/* Need match field DATA_TYPE_IN definition at CPI CTRL register */
[ ... ]
> +static void imx_cpi_hw_config(struct imx_cpi_device *pcpidev,
> +			      const struct imx_cpi_pix_format *pcpidev_fmt)
> +{
> +	u32 flags =3D pcpidev->sd.entity.pads[V4L2_SUBDEV_1TO1_PADS_SINK].vep.b=
us.parallel.flags;

[Severity: High]
Can hardcoding the pad index lead to reading uninitialized memory here?

The pads array is populated based on the order endpoints appear in the
Device Tree. If a device tree defines the source endpoint before the
sink endpoint, pads[0] will correspond to the source pad instead of
the sink pad.

> +	const struct imx_cpi_plat_data *pdata =3D pcpidev->pdata;
> +	bool hsync_pol =3D flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH;
[ ... ]
> +static int imx_cpi_set_fmt(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_state *sd_state,
> +			   struct v4l2_subdev_format *sdformat)
> +{
> +	struct imx_cpi_pix_format const *pcpidev_fmt;
> +	struct v4l2_mbus_framefmt *fmt;
[ ... ]
> +	/* Propagate the format from sink to source. */
> +	fmt =3D v4l2_subdev_state_get_format(sd_state, V4L2_SUBDEV_1TO1_PADS_SO=
URCE);
> +	*fmt =3D sdformat->format;

[Severity: High]
Can this result in a NULL pointer dereference?

If a misconfigured device tree only specifies a single endpoint,
media_async_register_subdev() will allocate exactly one pad, meaning
sd->entity.num_pads =3D 1.

When v4l2_subdev_state_get_format() is explicitly called with
V4L2_SUBDEV_1TO1_PADS_SOURCE (index 1), it will return NULL since the
index is out of bounds. The pointer is then blindly dereferenced.

> +
> +	/* The format on the source pad might change due to unpacking. */
> +	fmt->code =3D pcpidev_fmt->output;
> +
> +	return 0;
> +}
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
If the device tree endpoints are reordered as mentioned previously, can
this cast the wrong entity type to a v4l2_subdev?

If pads[0] corresponds to the source pad, its remote entity will be a
video_device, not a v4l2_subdev. Calling media_entity_to_v4l2_subdev()
on a video_device produces an invalid pointer that will crash the kernel
when dereferenced.

> +
> +	mask =3D v4l2_subdev_state_xlate_streams(state, V4L2_SUBDEV_1TO1_PADS_S=
INK,
> +					       V4L2_SUBDEV_1TO1_PADS_SOURCE,
> +					       &streams_mask);

[Severity: Medium]
Are the pad arguments reversed here?

Since v4l2_subdev_enable_streams() is called on the source pad,
streams_mask represents streams on the source pad. Passing
V4L2_SUBDEV_1TO1_PADS_SINK as the first argument informs the helper that
streams_mask belongs to the sink pad. Could this silently break routing
logic if asymmetrical stream IDs are ever used?

> +
> +	format =3D v4l2_subdev_state_get_format(state, V4L2_SUBDEV_1TO1_PADS_SI=
NK);
[ ... ]
> +static void imx_cpi_remove(struct platform_device *pdev)
> +{
> +	struct imx_cpi_device *pcpidev =3D platform_get_drvdata(pdev);
> +
> +	media_async_subdev_cleanup(&pcpidev->sd);
> +}

[Severity: High]
Could this leak hardware clocks if an asynchronous suspend is pending?

When streams are disabled, pm_runtime_put_autosuspend() is called to
queue an async suspend. If the driver is unbound before the async work
executes, imx_cpi_remove() will run.

Since the driver relies on devm_pm_runtime_enable() for PM cleanup,
pm_runtime_disable() will flush and cancel the pending async suspend,
which leaves the device permanently powered on. Should this call
pm_runtime_put_sync() or explicitly suspend the device if an async put
was previously used?

> +
> +static int imx_cpi_probe(struct platform_device *pdev)
> +{
> +	struct imx_cpi_device *pcpidev;
> +	struct device *dev =3D &pdev->dev;
> +	struct v4l2_subdev *sd;
> +	int ret;
> +
> +	pcpidev =3D devm_kzalloc(dev, sizeof(*pcpidev), GFP_KERNEL);
> +	if (!pcpidev)
> +		return -ENOMEM;
> +
> +	pcpidev->dev =3D dev;
> +	platform_set_drvdata(pdev, pcpidev);
> +
> +	pcpidev->pdata =3D of_device_get_match_data(dev);

[Severity: Medium]
Does this missing NULL check lead to a crash when binding via sysfs?

If an administrator manually binds the driver to a platform device without
an Open Firmware node via sysfs, of_device_get_match_data() returns NULL.
The driver will later unconditionally dereference pcpidev->pdata (such as
in imx_cpi_sw_reset()), leading to a kernel panic instead of gracefully
failing.

> +	pcpidev->mode =3D PI_GATE_CLOCK_MODE;
> +
> +	pcpidev->regs =3D devm_platform_ioremap_resource(pdev, 0);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624-imx8qxp_pc=
am-v6-0-4b3f45920d2f@nxp.com?part=3D7
