Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374BC3E0C57;
	Thu, 23 Jul 2026 07:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790697; cv=none; b=XcVqDnVWmL0I6Rlptb3EFJndJK9zJrKIWBwn4eeMES+wj4qd1LPX2zfYIzSJ2tt8fTMmv46qEHzG7YtVSPeYUfMJsmwQEADIdsqj/vN1YtfZT0GhcZdYm75rDO8kaM7aFyiDi4pdvVmN+d68rGvphEQHyOu4tmD3ZZEf6/W6aKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790697; c=relaxed/simple;
	bh=jNPk7x6hbhw9WvSdOg5hkNJACmBWFGTh3S0yGQIjr6I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WCI3VsQc6AMOR857eQc4oajCtflJjGVXuHx2iLk7QFDd7xI6yJBpdpqXczgEnGAmex1Zar5R3vET8aUy8SVZTl4Kt4d9s19/arrj+V98PTcgQooNof0WSzm+wQVrWKupeoZSrUsjmGG1ef3Iedoj4mRS5UjVikZgWXA+1xCUNxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLueGaqZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLueGaqZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3235B1F000E9;
	Thu, 23 Jul 2026 07:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784790691;
	bh=N7DVGe7owJOnkHGgZ9QOF3i9y4IOTc/mNBK4KSGG2Ns=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HLueGaqZoRJx3nvCg3e9376V4mDIn3O7MzpBC4H9ps0x+b+zpDg8bFC7wT2UFS1jE
	 6zj1neQHmw7wU93dUatKw7O8CooayTem9ksFFxZU0Rn6jX0Vk/tl8BpndC0DLZdwQM
	 yujil6H2tUr/PKX3IX+/tOuWqhBn1vUWaD+ifckFIOPKMyR5sZOgyNxqthIQmBpgpF
	 iVXl+mGSOv+fiplvglVZEEwrx8QhLwhVXMI31s+mTyRg4OYbSBo81KnxFC8DtWIp93
	 k2sUbVOXukakg6tv5J2iXH+i0pS9ClhmqjGp0nF1L1PH0Vp5KOtD/EnFTMa0hVWYxY
	 /kU0hSHezJPkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 3/3] media: nxp: Add i.MX95 CSI pixel formatter v4l2
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: guoniu.zhou@oss.nxp.com
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260723-csi_formatter-v15-3-0f59837650b1@oss.nxp.com>
References: <20260723-csi_formatter-v15-0-0f59837650b1@oss.nxp.com>
 <20260723-csi_formatter-v15-3-0f59837650b1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 07:11:30 +0000
Message-Id: <20260723071131.3235B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Missing NULL check for the result of `v4l2_subdev_state_get_opposi=
te_stream_format()` in `csi_formatter_subdev_set_fmt()`.
- [High] Returning an error in `csi_formatter_subdev_disable_streams()` aft=
er clearing software state causes PM runtime unbalance.
- [High] Missing `.unbind` callback leaves `formatter->remote_sd` pointing =
to freed memory.
- [High] Silent failure to clear hardware registers in `stop_stream` leaves=
 streams enabled across PM runtime cycles.
- [High] Device clocks can be left permanently enabled if the driver is rem=
oved while autosuspend is pending.
- [Medium] Missing `pm_runtime_dont_use_autosuspend()` in probe error paths=
 and driver remove.
- [Medium] Mixing goto-based error handling with `__free()` cleanup in `csi=
_formatter_async_register()`.
- [Medium] Selecting `PM_CLK` without depending on its dependencies causes =
Kconfig unmet dependency warnings.
--

--- Patch [3]: [PATCH v15 3/3] media: nxp: Add i.MX95 CSI pixel formatter v=
4l2 driver ---
commit 94f7f56e353b9a0ff074987e775db198f23ad639
Author: Guoniu Zhou <guoniu.zhou@nxp.com>

media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver

The CSI pixel formatter is a module found on i.MX95 used to reformat
packet info, pixel and non-pixel data from CSI-2 host controller to
match Pixel Link(PL) definition. Add data formatting support.

> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/=
nxp/Kconfig
> index 40e3436669e21..e714bdaf65c90 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig

[ ... ]

> @@ -28,6 +28,22 @@ config VIDEO_IMX8MQ_MIPI_CSI2
>  	  Video4Linux2 driver for the MIPI CSI-2 receiver found on the i.MX8MQ
>  	  SoC.
> =20
> +config VIDEO_IMX95_CSI_FORMATTER
> +	tristate "NXP i.MX95 CSI Pixel Formatter driver"
> +	depends on ARCH_MXC || COMPILE_TEST
> +	depends on VIDEO_DEV
> +	select MEDIA_CONTROLLER
> +	select MFD_SYSCON
> +	select PM_CLK

[Severity: Medium]
Could selecting PM_CLK here trigger Kconfig unmet dependency warnings?

Since PM_CLK depends on PM && HAVE_CLK, building the kernel with COMPILE_TE=
ST
enabled but without PM or HAVE_CLK could cause build warnings or failures.
Does this configuration need an explicit dependency on PM and HAVE_CLK?

> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  This driver provides support for the CSI Pixel Formatter found on
> +	  i.MX95 series SoCs. This module unpacks the pixels received from the
> +	  CSI-2 interface and reformats them to meet pixel link requirements.
> +
> +	  Say Y here to enable CSI Pixel Formatter module for i.MX95 SoC.
> +

[ ... ]

> diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c b/drivers/m=
edia/platform/nxp/imx95-csi-formatter.c
> new file mode 100644
> index 0000000000000..66f0c851fb124
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx95-csi-formatter.c

[ ... ]

> +static int csi_formatter_subdev_set_fmt(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_state *sd_state,
> +					struct v4l2_subdev_format *format)
> +{
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE &&
> +	    media_entity_is_streaming(&sd->entity))
> +		return -EBUSY;
> +
> +	if (format->pad =3D=3D CSI_FORMATTER_PAD_SOURCE)
> +		return v4l2_subdev_get_fmt(sd, sd_state, format);
> +
> +	if (!csi_formatter_find_format(format->format.code))
> +		format->format.code =3D csi_formatter_formats[0].code;
> +
> +	v4l_bound_align_image(&format->format.width, 1, 0xffff, 2,
> +			      &format->format.height, 1, 0xffff, 0, 0);
> +
> +	/* TODO: Add interlaced format support */
> +	format->format.field =3D V4L2_FIELD_NONE;
> +
> +	fmt =3D v4l2_subdev_state_get_format(sd_state, format->pad,
> +					   format->stream);
> +	*fmt =3D format->format;
> +
> +	/* Propagate the format from sink stream to source stream */
> +	fmt =3D v4l2_subdev_state_get_opposite_stream_format(sd_state, format->=
pad,
> +							   format->stream);
> +	*fmt =3D format->format;

[Severity: High]
Can v4l2_subdev_state_get_opposite_stream_format() return a NULL pointer he=
re?

If userspace sets an inactive route or omits a route for a pad, and then ca=
lls
VIDIOC_SUBDEV_S_FMT on the sink pad, the helper might return NULL for the
unrouted stream. Should there be a check to verify fmt is valid before it is
dereferenced?

> +
> +	return 0;
> +}

[ ... ]

> +static void csi_formatter_stop_stream(struct csi_formatter *formatter,
> +				      struct v4l2_subdev_state *state,
> +				      u64 stream_mask)
> +{
> +	const struct csi_formatter_pix_format *pix_fmt;
> +	struct v4l2_mbus_frame_desc fd =3D {};
> +	struct v4l2_subdev_route *route;
> +	struct v4l2_mbus_framefmt *fmt;
> +	unsigned int reg;
> +	unsigned int mask;
> +	int vc;
> +	int ret;
> +
> +	ret =3D csi_formatter_get_frame_desc(formatter, &fd);
> +	if (ret)
> +		return;

[Severity: High]
Does this early return leave hardware streams active across PM runtime cycl=
es?

If csi_formatter_get_frame_desc() fails (for example, if the remote sensor
is unresponsive or unbound), the function returns without clearing the
virtual channels in the hardware register. The caller,
csi_formatter_subdev_disable_streams(), continues execution, marks the
streams as disabled in software, and drops the autosuspend count.

When the device is later resumed, the hardware might retain the uncleared
state. Is it safer to ensure the registers are cleared even if getting
the frame descriptor fails?

> +
> +	for_each_active_route(&state->routing, route) {
> +		if (!(stream_mask & BIT_ULL(route->source_stream)))
> +			continue;

[ ... ]

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
> +	ret =3D v4l2_subdev_disable_streams(formatter->remote_sd, formatter->re=
mote_pad,
> +					  sink_streams);
> +	if (ret)
> +		dev_err(formatter->dev, "Failed to disable streams: %d\n", ret);
> +
> +	csi_formatter_stop_stream(formatter, state, streams_mask);
> +
> +	formatter->enabled_streams &=3D ~streams_mask;
> +
> +	if (!formatter->enabled_streams)
> +		pm_runtime_put_autosuspend(formatter->dev);
> +
> +	return ret;
> +}

[Severity: High]
Could this lead to a PM usage counter underflow?

If v4l2_subdev_disable_streams() fails on the remote subdevice, an error
is returned to the V4L2 core, which considers the stream to still be
enabled. However, locally the driver proceeds to clear its software state
(formatter->enabled_streams) and drops the autosuspend count.

If the user retries disabling the stream after the error, the function runs
a second time. The software state is already cleared, so it evaluates as em=
pty
and pm_runtime_put_autosuspend() is called again. Would it be better to skip
the software state updates on error, or return 0 after clearing them?

[ ... ]

> +static int csi_formatter_notify_bound(struct v4l2_async_notifier *notifi=
er,
> +				      struct v4l2_subdev *sd,
> +				      struct v4l2_async_connection *asc)
> +{
> +	const unsigned int link_flags =3D MEDIA_LNK_FL_IMMUTABLE
> +				      | MEDIA_LNK_FL_ENABLED;
> +	struct csi_formatter *formatter =3D notifier_to_csi_formatter(notifier);
> +	struct v4l2_subdev *sdev =3D &formatter->sd;
> +	struct media_pad *sink =3D &sdev->entity.pads[CSI_FORMATTER_PAD_SINK];
> +	int ret;
> +
> +	formatter->remote_sd =3D sd;
> +
> +	ret =3D v4l2_create_fwnode_links_to_pad(sd, sink, link_flags);
> +	if (ret < 0)
> +		return ret;
> +
> +	formatter->remote_pad =3D media_pad_remote_pad_first(sink)->index;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_async_notifier_operations formatter_notify_ops =
=3D {
> +	.bound =3D csi_formatter_notify_bound,
> +};

[Severity: High]
Does this missing unbind callback lead to a dangling pointer?

The bound callback stores a pointer to the remote subdevice in
formatter->remote_sd. If the remote subdevice is unbound via sysfs, its
memory is freed. Without an unbind callback to set formatter->remote_sd to
NULL, a subsequent call to enable streams might dereference the freed memor=
y.

> +
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

[Severity: Medium]
Does mixing goto-based error handling with __free() cleanup violate the
cleanup guidelines?

According to include/linux/cleanup.h, mixing goto and scope-based cleanup
helpers (__free) in the same function is discouraged because it can lead
to ownership confusion and maintenance hazards. Could the goto labels be
removed by converting the notifier cleanup into scope-based management,
or could the fwnode handle be manually cleaned up to avoid __free()?

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

> +static int csi_formatter_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct csi_formatter *formatter;
> +	int ret;
> +
> +	formatter =3D devm_kzalloc(dev, sizeof(*formatter), GFP_KERNEL);
> +	if (!formatter)
> +		return -ENOMEM;
> +
> +	formatter->dev =3D dev;
> +
> +	formatter->regs =3D syscon_node_to_regmap(dev->parent->of_node);
> +	if (IS_ERR(formatter->regs))
> +		return dev_err_probe(dev, PTR_ERR(formatter->regs),
> +				     "Failed to get csi formatter regmap\n");
> +
> +	ret =3D of_property_read_u32(dev->of_node, "reg", &formatter->reg_offse=
t);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get csi formatter reg property\n");
> +
> +	ret =3D devm_pm_clk_create(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D of_pm_clk_add_clks(dev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to add clocks\n");
> +
> +	ret =3D csi_formatter_subdev_init(formatter);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to initialize formatter subdev\=
n");
> +
> +	platform_set_drvdata(pdev, formatter);
> +
> +	/* Enable runtime PM with autosuspend. */
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret) {
> +		pm_runtime_dont_use_autosuspend(dev);
> +		goto err_cleanup_subdev;
> +	}
> +
> +	ret =3D csi_formatter_async_register(formatter);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "Failed to register async subdevice\n");
> +		goto err_cleanup_subdev;
> +	}

[Severity: Medium]
Does this error path leak the PM tracking state?

If csi_formatter_async_register() fails, the driver jumps to
err_cleanup_subdev without calling pm_runtime_dont_use_autosuspend().
Since pm_runtime_use_autosuspend() was called earlier, this could leave
the autosuspend usage count permanently unbalanced. Should
pm_runtime_dont_use_autosuspend() be added to this error path?

> +
> +	return 0;
> +
> +err_cleanup_subdev:
> +	v4l2_subdev_cleanup(&formatter->sd);
> +	media_entity_cleanup(&formatter->sd.entity);
> +	return ret;
> +}
> +
> +static void csi_formatter_remove(struct platform_device *pdev)
> +{
> +	struct csi_formatter *formatter =3D platform_get_drvdata(pdev);
> +
> +	csi_formatter_async_unregister(formatter);
> +
> +	v4l2_subdev_cleanup(&formatter->sd);
> +	media_entity_cleanup(&formatter->sd.entity);
> +}

[Severity: High]
Could the device clocks be permanently left enabled here?

If the driver is unbound while an autosuspend timer is pending or streams
are actively enabled, devm_pm_runtime_enable cleanup executes
pm_runtime_disable(). This cancels the pending suspend timer but leaves the
device in an active state.

Without an explicit synchronous suspend or clock disable sequence in
csi_formatter_remove(), the PM clock framework might keep the clocks
enabled permanently. Does this function need a synchronous suspend call?
Additionally, is pm_runtime_dont_use_autosuspend() needed here to balance
the autosuspend usage count?

> +
> +static const struct of_device_id csi_formatter_of_match[] =3D {
> +	{ .compatible =3D "fsl,imx95-csi-formatter" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, csi_formatter_of_match);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-csi_format=
ter-v15-0-0f59837650b1@oss.nxp.com?part=3D3
