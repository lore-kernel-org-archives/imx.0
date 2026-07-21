Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133BE3C10A3;
	Tue, 21 Jul 2026 08:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784624038; cv=none; b=qMUc+y6cGiGKw901nq3KqH2lGXzWXxZT9YVmNOPrMHdDOl+mL8W601u+NPmxrAEDo9/Z3MyPf1UGzNpu9yQR54RV4fwGXdPJtmOjWprmyKtlKYRFNQYi2v3COPia1CmA2pr71tBofHiWdZuOkWoZD2lZlvDAIZhx1p89oeB29bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784624038; c=relaxed/simple;
	bh=rXAsUqNSvPDuCc4XV3sEvulkZJfRRyh+bJOO2YxzXyQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MgjHoqiyixgSXHnzc3F64UlXJGdsu/braFXcDCYnaNxL77zAd4sNCBgFjhEQ+Mheg63uE1XuevXJPh7/FktokyaJwD/OInCtHJGBAcapEWzWz2ayhODQh1iY5SJ3d2Ui4+1Nl9n9o32/xUOib2xYW/yUlX2m4/3AW8/EBxLrHNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iCkLcZpb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iCkLcZpb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1A01F00A3A;
	Tue, 21 Jul 2026 08:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784624035;
	bh=5Nd7DEZoZ9V/FJ71vGjZePMLAhA8T3U93I18TutCEMo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iCkLcZpb3bLUKVAWAgERxE/M2vqM0N97RSZ+hCpMj641yq1CiwNl4yrXMsITU94nZ
	 /x305Ws8wILjOoQeM5pM+ZoqYXu/2C9KI8jDzTIPTcEZJL4EGKUD8NBOqcq9/fphyc
	 /JUp7mi2pZpmUQN9mTA8Sv3UjGVATdUEHb+jOo93slBReHLYBef7d0SpQWL3jVrhxj
	 mCJEXqAohku9T7R9rd6nwaLOMamx93rnk2CipUFFTAtvg9/D25cbQxaQ0G2MbiNAWA
	 VUyARdn1SJy3XMWM+EDXOGK4G4xm1UNNeYHhEthGXuB0FDUO1jBrPVNGZjJuWDyiP/
	 IkCmaO20R6ehA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 3/3] media: nxp: Add i.MX95 CSI pixel formatter v4l2
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: guoniu.zhou@oss.nxp.com
Cc: Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-csi_formatter-v14-3-ca239fbb441f@oss.nxp.com>
References: <20260721-csi_formatter-v14-0-ca239fbb441f@oss.nxp.com>
 <20260721-csi_formatter-v14-3-ca239fbb441f@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 08:53:54 +0000
Message-Id: <20260721085355.3A1A01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Missing NULL pointer check for v4l2_subdev_state_get_opposite_stre=
am_format().
- [High] Potential NULL pointer dereference when accessing the index of the=
 remote pad.
- [High] Use-After-Free (UAF) due to missing .unbind callback for the remot=
e subdevice.
- [Medium] Runtime PM autosuspend is bypassed due to incorrect put API usag=
e.
- [Medium] Hardware streams are left active if getting the frame descriptor=
 fails during stop.
- [Low] Mixing goto-based error handling and __free() resource cleanup.
- [Low] Out-of-bounds bitwise shift when route->source_stream is greater th=
an or equal to 64.
--

--- Patch [3]: [PATCH v14 3/3] media: nxp: Add i.MX95 CSI pixel formatter v=
4l2 driver ---
commit 0950cb0319055988838660ff8ee3c761b6925d73
Author: Guoniu Zhou <guoniu.zhou@nxp.com>

media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver

The CSI pixel formatter is a module found on i.MX95 used to reformat
packet info, pixel and non-pixel data from CSI-2 host controller to
match Pixel Link(PL) definition.

> diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c b/drivers/m=
edia/platform/nxp/imx95-csi-formatter.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx95-csi-formatter.c

[ ... ]

> +static int csi_formatter_subdev_set_fmt(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_state *sd_state,
> +					struct v4l2_subdev_format *format)
> +{

[ ... ]

> +	/* Propagate the format from sink stream to source stream */
> +	fmt =3D v4l2_subdev_state_get_opposite_stream_format(sd_state, format->=
pad,
> +							   format->stream);
> +	*fmt =3D format->format;

[Severity: High]
If userspace configures the routing to disable or omit the route for a spec=
ific
sink stream, could v4l2_subdev_state_get_opposite_stream_format() return NU=
LL
here and cause a dereference?

[ ... ]

> +static void csi_formatter_stop_stream(struct csi_formatter *formatter,
> +				      struct v4l2_subdev_state *state,
> +				      u64 stream_mask)
> +{

[ ... ]

> +	ret =3D v4l2_subdev_call(formatter->remote_sd, pad, get_frame_desc,
> +			       formatter->remote_pad, &fd);
> +	if (ret < 0 && ret !=3D -ENOIOCTLCMD) {
> +		dev_err(formatter->dev, "Failed to get frame desc: %d\n", ret);
> +		return;
> +	}

[Severity: Medium]
If the remote subdevice's get_frame_desc callback returns an error, does
this early return bypass the register clearing phase? Since the driver
continues the teardown process, this might leave the hardware streams activ=
e.

> +
> +	if (ret =3D=3D -ENOIOCTLCMD) {
> +		fd.type =3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +		fd.num_entries =3D 1;
> +	}
> +
> +	for_each_active_route(&state->routing, route) {
> +		if (!(stream_mask & BIT_ULL(route->source_stream)))
> +			continue;

[Severity: Low]
If userspace configures route->source_stream to a value greater than 63,
does this trigger an out-of-bounds bitwise shift?

[ ... ]

> +static int csi_formatter_start_stream(struct csi_formatter *formatter,
> +				      struct v4l2_subdev_state *state,
> +				      u64 stream_mask)
> +{

[ ... ]

> +	for_each_active_route(&state->routing, route) {
> +		if (!(stream_mask & BIT_ULL(route->source_stream)))
> +			continue;

[Severity: Low]
Does this also run into an out-of-bounds shift if route->source_stream
exceeds 63?

[ ... ]

> +static int csi_formatter_subdev_enable_streams(struct v4l2_subdev *sd,
> +					       struct v4l2_subdev_state *state,
> +					       u32 pad, u64 streams_mask)
> +{

[ ... ]

> +	ret =3D v4l2_subdev_enable_streams(formatter->remote_sd,
> +					 formatter->remote_pad,
> +					 sink_streams);

[Severity: High]
Without an .unbind callback to clear formatter->remote_sd when the remote
subdevice is removed, could this result in a use-after-free if the remote
module is unloaded and we later try to enable streams?

[ ... ]

> +err_runtime_put:
> +	if (!formatter->enabled_streams)
> +		pm_runtime_put(formatter->dev);
> +	return ret;
> +}

[Severity: Medium]
Does dropping the PM reference here without calling pm_runtime_mark_last_bu=
sy()
bypass the 1000ms autosuspend delay, causing the device to suspend instantl=
y?

> +
> +static int csi_formatter_subdev_disable_streams(struct v4l2_subdev *sd,
> +						struct v4l2_subdev_state *state,
> +						u32 pad, u64 streams_mask)
> +{

[ ... ]

> +	if (!formatter->enabled_streams)
> +		pm_runtime_put(formatter->dev);
> +
> +	return ret;
> +}

[Severity: Medium]
Similarly, does this pm_runtime_put() also skip marking the device busy,
missing the autosuspend delay?

[ ... ]

> +static int csi_formatter_notify_bound(struct v4l2_async_notifier *notifi=
er,
> +				      struct v4l2_subdev *sd,
> +				      struct v4l2_async_connection *asc)
> +{

[ ... ]

> +	ret =3D v4l2_create_fwnode_links_to_pad(sd, sink, link_flags);
> +	if (ret < 0)
> +		return ret;
> +
> +	formatter->remote_pad =3D media_pad_remote_pad_first(sink)->index;

[Severity: High]
If v4l2_create_fwnode_links_to_pad() returns 0 but hasn't actually created
any links (for example, due to a malformed device tree), could
media_pad_remote_pad_first(sink) return NULL and cause a crash here?

> +
> +	return 0;
> +}
> +
> +static const struct v4l2_async_notifier_operations formatter_notify_ops =
=3D {
> +	.bound =3D csi_formatter_notify_bound,
> +};

[Severity: High]
Is this missing an .unbind callback to clean up formatter->remote_sd when t=
he
remote subdevice is unregistered?

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

[ ... ]

> +err_unregister_notifier:
> +	v4l2_async_nf_unregister(&formatter->notifier);
> +err_cleanup_notifier:
> +	v4l2_async_nf_cleanup(&formatter->notifier);
> +	return ret;
> +}

[Severity: Low]
Is it safe to mix the __free() cleanup attribute for the fwnode_handle with
traditional goto-based error handling in this function? The cleanup
guidelines recommend converting all resources to scope-based cleanup or
none at all to avoid future double-free issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-csi_format=
ter-v14-0-ca239fbb441f@oss.nxp.com?part=3D3
