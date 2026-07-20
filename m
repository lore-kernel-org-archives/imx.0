Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D073D6CCA;
	Mon, 20 Jul 2026 10:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542120; cv=none; b=tY3FA5Hx3pICYl84SU38MB89UyCg/DUaWzIl/XT6IyO8dyDvvElsuZ/brpefL/XpVhq8fpdJlimOB/iZBwIBaRFU6tsXxQDMpGs5W10MzJI4cnUIgVjC1pZezJiBq3MNUmq76do7NYafHffmzcapzVGW5dWDA9aYZu58ROhLJPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542120; c=relaxed/simple;
	bh=6UCDAk0JRviWd140gGK1DEJV7mOTWodz7nIWpNIRHWU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aKi9/DDf8Hk/lKyCnDmXLF/3/faWO+8I3CO5HxHkKlKd5AA7FbWVyLHE77kd2WVZSM8tm89dtxyZoyfIEyGr+ZmfU9TdPBgUogGSRjZCfEQuywAojXjMZPZ17GLh80pjrfUCUj+qLnI8TKVt3zf3grGMy2HPTukiWJYfoFKvlqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WrSWyNiT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WrSWyNiT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0ACD1F000E9;
	Mon, 20 Jul 2026 10:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784542110;
	bh=wVrAk4KFekWizv4UxVWnK3WRbYMpJtfC5+ITwnbn2FM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WrSWyNiTyalLWCa0VyHzrvUbRTbQsqUcPq64iS5rpVSA8WBJakAl3Huf9hl7tLj/7
	 VCU944ieCRRHwKopXAqjUBsx8kSrM70aFTAZlamlD3sV/ICpuJYkLPWwq5thK21gfP
	 fFjC5FlvGM9jnkrIBc4xi1s21FUMDvdRng0AvhICXouD//nid+GDwIcEg2oczROJfV
	 GbPn2MpDYhdcoMVfjrn/vAusFFFyFbaiRiljym31+4BHa3ODo2lz4tvCm+zUNij7rs
	 fpxEKFFWm2kjPyqUQQ0eVFgxy5qwT0CEF5GHEmAB8Qovn8WV+rITB9Q3hC0jMYcJ+X
	 GpelaZrz7jpjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 3/3] media: nxp: Add i.MX95 CSI pixel formatter v4l2
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: guoniu.zhou@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260720-csi_formatter-v13-3-4dc9a80e4cfd@oss.nxp.com>
References: <20260720-csi_formatter-v13-0-4dc9a80e4cfd@oss.nxp.com>
 <20260720-csi_formatter-v13-3-4dc9a80e4cfd@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 10:08:29 +0000
Message-Id: <20260720100829.B0ACD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Returning early on `get_frame_desc` failure in `csi_formatter_stop=
_stream()` leaves hardware streams enabled.
- [High] Missing `.unbind` in async notifier leaves a dangling `csi_sd` poi=
nter.
- [Medium] Functions mix `goto`-based error handling with scope-based clean=
up (`guard()` and `__free()`), violating kernel cleanup guidelines.
- [Medium] Propagating downstream disable errors causes V4L2 core state des=
ynchronization and unbalanced PM runtime puts.
- [Medium] PM runtime references and clocks are leaked if the driver is rem=
oved while streams are active.
- [Medium] `set_fmt` fails with `-EINVAL` for valid, unrouted streams.
--

--- Patch [3]: [PATCH v13 3/3] media: nxp: Add i.MX95 CSI pixel formatter v=
4l2 driver ---
commit 72e988a703f84a35fe9af4531ed1cd3a2a57330d
Author: Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver

This commit introduces the V4L2 subdevice driver for the i.MX95 CSI
pixel formatter. It unpacks pixels received from the CSI-2 interface and
reformats them to meet pixel link requirements.

> diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c b/drivers/m=
edia/platform/nxp/imx95-csi-formatter.c
> new file mode 100644
> index 0000000000000..b0e8e753e94aa
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx95-csi-formatter.c

[ ... ]

> +static int csi_formatter_subdev_set_fmt(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_state *sd_state,
> +					struct v4l2_subdev_format *sdformat)
> +{

[ ... ]

> +	/* Propagate the format from sink stream to source stream */
> +	fmt =3D v4l2_subdev_state_get_opposite_stream_format(sd_state, sdformat=
->pad,
> +							   sdformat->stream);
> +	if (!fmt)
> +		return -EINVAL;

[Severity: Medium]
Will this fail with -EINVAL for valid, unrouted streams?

If userspace attempts to configure formats before establishing routes,
v4l2_subdev_state_get_opposite_stream_format() returns NULL. Does the
V4L2 API permit setting formats on unrouted streams, and should we
silently ignore the propagation instead of returning an error?

> +
> +	*fmt =3D sdformat->format;
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
> +	ret =3D v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
> +			       formatter->remote_pad, &fd);
> +	if (ret < 0 && ret !=3D -ENOIOCTLCMD) {
> +		dev_err(formatter->dev, "Failed to get frame desc: %d\n", ret);
> +		return;
> +	}

[Severity: High]
Does returning early here leave the hardware streams enabled?

If get_frame_desc fails during stream shutdown (for instance, if the
source subdev is suspended or in a reset state), the function returns
early and bypasses the logic that clears the CSI_VC_PIXEL_DATA_TYPE
register bits.=20

Could a subsequent stream start on the same VC set multiple data type
bits simultaneously, potentially hanging the hardware or corrupting
the pipeline?

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

[Severity: Medium]
Is it safe to mix guard(mutex) with goto-based error handling labels?

The kernel cleanup guidelines recommend against mixing scope-based cleanup
helpers with goto labels in the same function. Could this create confusing
ownership semantics or risk bugs if this function is modified in the future?

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
> +	csi_formatter_stop_stream(formatter, state, streams_mask);
> +
> +	formatter->enabled_streams &=3D ~streams_mask;
> +
> +	if (!formatter->enabled_streams)
> +		pm_runtime_put(formatter->dev);
> +
> +	return ret;

[Severity: Medium]
Will propagating the downstream disable error cause V4L2 core state
desynchronization and unbalanced PM runtime puts?

If v4l2_subdev_disable_streams() fails, the driver performs its local state
cleanup and drops the PM reference, but returns the error to the V4L2 core.
The V4L2 core might abort and leave the stream in active_state.

If userspace attempts to disable the stream again, could the driver's
disable routine run again, performing a second pm_runtime_put() and
underflowing the usage counter?

> +}

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
> +	struct media_pad *remote_pad;
> +	int ret;
> +
> +	formatter->csi_sd =3D sd;

[Severity: High]
Does this leave a dangling pointer when the upstream subdevice is unbound?

The csi_sd pointer is cached here, but there appears to be no unbind
callback for the async notifier. If the bound upstream subdevice driver
is unloaded or unbound via sysfs, the V4L2 async core unbinds the connectio=
n.

Without an unbind callback to set formatter->csi_sd to NULL, if userspace
subsequently shuts down the stream, could csi_formatter_subdev_disable_stre=
ams()
dereference the csi_sd pointer after it is freed?

> +
> +	dev_dbg(formatter->dev, "Bound subdev: %s pad\n", sd->name);

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

[Severity: Medium]
Is it safe to mix __free(fwnode_handle) with goto-based error handling
labels in this function?

The subsystem cleanup guidelines recommend either converting all resources
that need goto cleanup to scope-based cleanup, or converting none of them.

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

[Severity: Medium]
Are PM runtime references and clocks leaked if the driver is removed
while streams are active?

If the driver is unbound via sysfs while streams are active, this remove
function is called. It does not ensure streams are stopped or that the PM
runtime usage counter is balanced.

Since the usage counter might remain greater than zero when
devm_pm_runtime_enable disables runtime PM, could the device fail to
suspend and leave hardware clocks permanently enabled?

> +
> +static const struct of_device_id csi_formatter_of_match[] =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-csi_format=
ter-v13-0-4dc9a80e4cfd@oss.nxp.com?part=3D3
