Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DFE3B38B9;
	Tue, 28 Jul 2026 06:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785219798; cv=none; b=VuHh6oSrANKz5k5ic9Ftu46c5qsWITAiunHxb+KlL+thpNFQj3ltHVgh2Dz/JYtEWJDhWfan3wMSMbtSoEQz7QuZDg0tcI/VBi8XoahLHjQj4++VwMd9pXPzHyOFAgSLC/LPEIeI14AbZ/UZkyx1rOmhKHZm9JYQo/9Dp9IK6OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785219798; c=relaxed/simple;
	bh=NrMDAh5mR+8Uc2RqdmnVecIR8rfTIxs9kPhJkaoWQNI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W6h6CslXiqkvKN+UKInSSINc5Fmgn1787h9fKulmsHmeFO28RNtT5VnqgYhoXgIchAO1V0j1ekBbDcRBAkNiZtriu7HDnQ0hJnZ0upLA939IhwbdpWY6TSTu/MzTPiPetDnKQU52kJIgJHWEct4CWFR3EWP1G1xSLMgN2y9aBAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CbvrS0ba; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CbvrS0ba"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0F81F000E9;
	Tue, 28 Jul 2026 06:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785219796;
	bh=HirmwKJxBpS8xAowd0fSuKIZgXPLaom+MAkmIfiTC8s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CbvrS0baLiNzxyb9ujgTd/RCuwr0MGs3WGJpJgYSvn0p6Nsvr7tamf0VsOY6d1q4u
	 2ZYX7jhyGz6XFFRdGDr5/67yw1/veZJu+vDQzfqbdzXQMfP/iqAzSjXubumhwznFSR
	 BBOGyq2APETBsaB+W1PtgQd1HSGjZNXuFOd4t0wveNrJu3oltGj4eX7mIUwTQU3glM
	 yUj597ezEMEUa6MJ2l831fQ++wumyMxpTeqRHyYhl8/hKiusoCPUS4d8lPe017Coqn
	 hlSHIeK717/68IeCKerukMo/LHokz51dGx7bEWD35qJRTtXwI9AyRhwhcJsXcnIjJE
	 3ULAp2SiaykFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 3/3] media: nxp: Add i.MX95 CSI pixel formatter v4l2
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: guoniu.zhou@oss.nxp.com
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <20260728-csi_formatter-v16-3-1065ba47530a@oss.nxp.com>
References: <20260728-csi_formatter-v16-0-1065ba47530a@oss.nxp.com>
 <20260728-csi_formatter-v16-3-1065ba47530a@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 06:23:15 +0000
Message-Id: <20260728062315.EC0F81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Missing NULL check for `media_pad_remote_pad_first()` result can c=
ause kernel panic.
- [High] Unchecked dereference of `v4l2_subdev_state_get_opposite_stream_fo=
rmat()` in `csi_formatter_subdev_set_fmt()` for inactive routes.
- [High] Dangling `remote_sd` pointer leading to Use-After-Free if remote s=
ubdevice is unbound.
- [High] Contradictory routing restriction blocks multiplexing support.
- [Medium] Mixing `__free()` scope-based cleanup with `goto`-based error ha=
ndling in the same function.
- [Medium] `csi_formatter_stop_stream()` silently bails out on `get_frame_d=
esc` failure, leaving hardware streams enabled.
- [Medium] Missing `pm_runtime_mark_last_busy()` causes immediate autosuspe=
nd instead of respecting the configured delay.
--

--- Patch [3]: [PATCH v16 3/3] media: nxp: Add i.MX95 CSI pixel formatter v=
4l2 driver ---
commit b8f475efe55d7eb6b5ee1f2f2cd145ec93b5b430
Author: Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver

This commit adds a V4L2 driver for the CSI pixel formatter found on i.MX95
SoCs. It provides data formatting support to unpack pixels from the CSI-2
host controller to match Pixel Link definitions.

> diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c b/drivers/m=
edia/platform/nxp/imx95-csi-formatter.c
> new file mode 100644
> index 0000000000000..9d4107b0ba202
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx95-csi-formatter.c
> @@ -0,0 +1,758 @@
[ ... ]
> +static int __csi_formatter_subdev_set_routing(struct v4l2_subdev *sd,
> +					      struct v4l2_subdev_state *state,
> +					      struct v4l2_subdev_krouting *routing)
> +{
> +	int ret;
> +
> +	ret =3D v4l2_subdev_routing_validate(sd, routing,
> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);

[Severity: High]
Does this routing restriction block the multiplexing support implemented
elsewhere in the driver?

The V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 macro includes
V4L2_SUBDEV_ROUTING_NO_MULTIPLEXING, which causes the V4L2 core to reject
any configuration with multiple streams on the same sink pad. This appears
to prevent the multiplexing functionality that the hardware virtual channel
handling was designed to support.

> +	if (ret)
> +		return ret;
> +
> +	return v4l2_subdev_set_routing_with_fmt(sd, state, routing,
> +						&formatter_default_fmt);
> +}
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
Could this result in a null pointer regression if the stream route is inact=
ive?

When an inactive routing entry is configured (without
V4L2_SUBDEV_ROUTE_FL_ACTIVE) and a format is set on its sink pad, the
validation passes because a stream configuration exists. However,
v4l2_subdev_state_get_opposite_stream_format() skips inactive routes and
returns a null pointer.

Would it be safer to verify fmt is not null before assigning to it?

> +
> +	return 0;
> +}
[ ... ]
> +static void csi_formatter_stop_stream(struct csi_formatter *formatter,
> +				      struct v4l2_subdev_state *state,
> +				      u64 stream_mask)
> +{
[ ... ]
> +	ret =3D csi_formatter_get_frame_desc(formatter, &fd);
> +	if (ret)
> +		return;

[Severity: Medium]
Could this early return leave hardware streams enabled if getting the frame
descriptor fails?

This silently bails out without clearing the hardware registers, which might
leak the active stream state in the hardware and affect subsequent operatio=
ns.

> +
> +	for_each_active_route(&state->routing, route) {
[ ... ]
> +static int csi_formatter_subdev_enable_streams(struct v4l2_subdev *sd,
> +					       struct v4l2_subdev_state *state,
> +					       u32 pad, u64 streams_mask)
> +{
[ ... ]
> +err_stop_stream:
> +	csi_formatter_stop_stream(formatter, state, streams_mask);
> +err_runtime_put:
> +	if (!formatter->enabled_streams)
> +		pm_runtime_put_autosuspend(formatter->dev);

[Severity: Medium]
Should pm_runtime_mark_last_busy() be called here before putting the device
into autosuspend?

Without updating the last-busy timestamp, the PM core uses the elapsed time
since the device was last marked busy. If this time exceeds the 1-second de=
lay,
the device may suspend immediately, bypassing the intended autosuspend dela=
y.

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
> +	ret =3D v4l2_subdev_disable_streams(formatter->remote_sd, formatter->re=
mote_pad,
> +					  sink_streams);

[Severity: Medium]
Is it intentional to disable the remote subdevice before stopping the local
stream?

If the remote subdevice is disabled first, it might power down or refuse
queries, which could cause csi_formatter_get_frame_desc() to fail when
csi_formatter_stop_stream() is called shortly after.

> +	if (ret)
> +		dev_err(formatter->dev, "Failed to disable streams: %d\n", ret);
> +
> +	csi_formatter_stop_stream(formatter, state, streams_mask);
> +
> +	formatter->enabled_streams &=3D ~streams_mask;
> +
> +	if (!formatter->enabled_streams)
> +		pm_runtime_put_autosuspend(formatter->dev);

[Severity: Medium]
Similar to the error path in enable_streams, is a pm_runtime_mark_last_busy=
()
call needed here to ensure the 1-second autosuspend delay is respected?

> +
> +	return ret;
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
> +	int ret;
> +
> +	formatter->remote_sd =3D sd;
> +
> +	ret =3D v4l2_create_fwnode_links_to_pad(sd, sink, link_flags);
> +	if (ret < 0)
> +		return ret;
> +
> +	formatter->remote_pad =3D media_pad_remote_pad_first(sink)->index;

[Severity: High]
Could this cause a null pointer regression if the remote pad is not found?

If v4l2_create_fwnode_links_to_pad() returns 0 without creating any links
(which can happen if the source subdevice has no matching endpoints in the
device tree), media_pad_remote_pad_first() will return null. Dereferencing
it immediately would cause a crash during initialization.

> +
> +	return 0;
> +}
> +
> +static const struct v4l2_async_notifier_operations formatter_notify_ops =
=3D {
> +	.bound =3D csi_formatter_notify_bound,
> +};

[Severity: High]
Is an unbind callback needed to clear the remote_sd pointer?

The driver caches the remote subdevice pointer in formatter->remote_sd when
bound. If the remote subdevice is unregistered, the pointer becomes danglin=
g.
If csi_formatter_subdev_disable_streams() is subsequently called, it passes
the freed pointer to v4l2_subdev_disable_streams(), resulting in a
use-after-free.

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

[Severity: Medium]
Is it safe to mix __free() scope-based cleanup with goto-based error handli=
ng
in this function?

According to the cleanup subsystem guidelines (include/linux/cleanup.h),
mixing __free() declarations with goto-based error handling in the same
function is prohibited as it creates confusing ownership semantics.=20

Would it be better to convert the remaining cleanups to scope-based helpers
or avoid using __free() here?

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-csi_format=
ter-v16-0-1065ba47530a@oss.nxp.com?part=3D3
