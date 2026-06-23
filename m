Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241AD356771;
	Tue, 23 Jun 2026 04:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782187550; cv=none; b=VJizj1/+ByAWRUSZ6WQCbeYMp13bxJWw+4aJe+hh2wMwlRaKyk0vWufT9+88n3TB6bbQ961rPQ1+9MnP8yT9bAnd7jCCdtIHax9c0QT+tqCdOtPeULbFB4eLudvAjDPf52ulUV9xNTlptN7gRqyROsTiSKrdfbOQlzkhpzKaKGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782187550; c=relaxed/simple;
	bh=LkMtxBCYg8kRL+5QFM9TUp1Bcu6ppaembzvW2p8mlwg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bb4XB7MuuWJ0UMWUGDydl51FgTbZQTwZpVLstkVV/OIlwSJ54N6Q0c3YBQD3c0oY/0HnyQFxoimUbL1ObLtAVTPvZYmlkgDnlb1loDtC4qZB0LdBk4z6I6Zaorv326FvHoXPk1Oz0JUNrSp0/h2Sqo/c08mvgXpSgI1nvnPmu2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DwgY3mFp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DwgY3mFp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EAE31F000E9;
	Tue, 23 Jun 2026 04:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782187548;
	bh=nQLcuUGhDSCqmdhgY6Abl5pES11lpXErFWkM3FP8XLc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DwgY3mFpOAbLDK47TrdPh8boa1K2hYrKKkVd9PZ3l/95ZS1s2ypuzVqaGF9WF0i3R
	 J9HcLP2t0qop7/+qHxbg6DKLYTDVeSwe1uNfDU/uVHayqWZeOu0CrOFT5KzTqHN1o6
	 UmdT3MDfQ3WN9WiKh4/Qw4Au0ptPE+cZfZ7vXtT56vpL5kx07z2hobgFAAjBoKqziD
	 yJYpF3ES7cWUueDP+VkgyKzhhctAmKDe4YMtdsXoDCSQCIHG5rc54g0wEbSACL2w9q
	 F0VC1ZbyWl8oM85njnVPYZ7YCHsaPN0xoRsrzVILPxPg5JkyDjznsuXFKeicw064NQ
	 OI+UuNiIcne9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/3] media: nxp: Add i.MX95 CSI pixel formatter v4l2
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: guoniu.zhou@oss.nxp.com
Cc: robh@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260623-csi_formatter-v11-3-a792fe9c1502@oss.nxp.com>
References: <20260623-csi_formatter-v11-0-a792fe9c1502@oss.nxp.com>
 <20260623-csi_formatter-v11-3-a792fe9c1502@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 04:05:48 +0000
Message-Id: <20260623040548.7EAE31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Missing NULL check for the return value of v4l2_subdev_state_get_f=
ormat() in pad operations, causing a NULL pointer dereference.
- [High] The driver incorrectly assumes source stream IDs match sink stream=
 IDs during stream start, leading to a NULL pointer dereference.
- [High] Unbalanced PM runtime put in `csi_formatter_subdev_disable_streams=
` due to state desynchronization on failure.
- [High] Dangling `csi_sd` pointer leading to Use-After-Free if the remote =
subdevice is unbound.
- [Medium] The driver fails to validate stream ID bounds, silently ignoring=
 stream IDs >=3D 8.
- [Medium] Overwriting the Virtual Channel Data Type register breaks multip=
lexed streams sharing the same VC.
- [Medium] Mixing `goto`-based error handling with scope-based cleanup help=
ers (`__free` and `guard`) in the same function.
- [Medium] Setting the format on an unrouted sink stream incorrectly fails =
with `-EINVAL`.
--

commit cca7db4730915ca13295d8053b3569d5e6266e0d
Author: Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver

This commit introduces the i.MX95 CSI pixel formatter v4l2 driver,
adding data formatting support to match Pixel Link (PL) definitions.

diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c b/drivers/med=
ia/platform/nxp/imx95-csi-formatter.c
new file mode 100644
index 0000000000000..cfe448fedd37e
--- /dev/null
+++ b/drivers/media/platform/nxp/imx95-csi-formatter.c
@@ -0,0 +1,775 @@
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
Is there a missing NULL check here?

If the requested stream is not found in the state,
v4l2_subdev_state_get_format() returns NULL, which would cause a crash when
dereferencing fmt->code.

Userspace might trigger this by passing an invalid stream ID.

> +		return 0;
> +	}
[ ... ]
> +static int csi_formatter_subdev_set_fmt(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_state *sd_state,
> +					struct v4l2_subdev_format *sdformat)
> +{
> +	struct csi_formatter_pix_format const *format;
> +	struct v4l2_mbus_framefmt *fmt;
[ ... ]
> +	v4l_bound_align_image(&sdformat->format.width, 1, 0xffff, 2,
> +			      &sdformat->format.height, 1, 0xffff, 0, 0);
> +
> +	fmt =3D v4l2_subdev_state_get_format(sd_state, sdformat->pad,
> +					   sdformat->stream);
> +	*fmt =3D sdformat->format;

[Severity: High]
Can this result in a NULL pointer dereference?

Similar to the enum_mbus_code operation above, v4l2_subdev_state_get_format=
()
can return NULL if the stream is invalid.

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
Should this return -EINVAL when there is no internal route configured?

Valid requests to set the format on an unrouted sink stream will fail here,
which seems to violate V4L2 semantics where the format on the local sink pad
should still be accepted even without an active route.

> +
> +	*fmt =3D sdformat->format;
> +
> +	return 0;
> +}
[ ... ]
> +static int csi_formatter_start_stream(struct csi_formatter *formatter,
> +				      struct v4l2_subdev_state *state,
> +				      u64 stream_mask)
> +{
[ ... ]
> +	for (i =3D 0; i < CSI_FORMATTER_VC_NUM; ++i) {
> +		if (!(stream_mask & BIT(i)))
> +			continue;

[Severity: Medium]
Does this fail to configure stream IDs higher than 7?

The loop terminates at CSI_FORMATTER_VC_NUM (which is 8), silently skipping
any higher stream IDs present in the stream_mask.

V4L2 subdev routing allows stream IDs up to 63.

> +
> +		fmt =3D v4l2_subdev_state_get_format(state,
> +						   CSI_FORMATTER_PAD_SINK, i);
> +
> +		pix_fmt =3D csi_formatter_find_format(fmt->code);

[Severity: High]
Could this crash if the source stream ID does not match the sink stream ID?

The index i iterates over the source pad's stream_mask, but it is used here
to query the format of CSI_FORMATTER_PAD_SINK.

If userspace configures a route where the sink stream ID differs from the
source stream ID, get_format() will return NULL, leading to a crash when
accessing fmt->code.

> +
> +		val =3D BIT(csi_formatter_get_index_by_dt(pix_fmt->data_type));
[ ... ]
> +		/* Store the stream to VC mapping for stop_stream */
> +		formatter->stream_to_vc[i] =3D vc;
> +
> +		csi_formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), val);

[Severity: Medium]
Will this break multiplexed streams sharing the same virtual channel?

Writing directly to the register completely overwrites the configuration
with the new single bit, which would destroy any existing active data type
bindings for that virtual channel.

Would a read-modify-write operation be more appropriate here?

> +		configured_streams |=3D BIT(i);
> +	}
> +
> +	return 0;
> +
> +err_cleanup:
> +	csi_formatter_stop_stream(formatter, configured_streams);
> +	return ret;
> +}
[ ... ]
> +static int csi_formatter_subdev_enable_streams(struct v4l2_subdev *sd,
> +					       struct v4l2_subdev_state *state,
> +					       u32 pad, u64 streams_mask)
> +{
[ ... ]
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
[ ... ]
> +	ret =3D csi_formatter_start_stream(formatter, state, streams_mask);

[Severity: High]
Is the wrong mask passed to csi_formatter_start_stream here?

It passes the source pad's streams_mask instead of the translated
sink_streams mask.

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

[Severity: Medium]
Is it safe to mix goto-based error handling with scope-based cleanup helpers
in this function?

This function uses guard(mutex) for lock management but also contains goto
labels for error unwinding. Mixing these approaches can create confusing
resource ownership semantics.

> +
> +static int csi_formatter_subdev_disable_streams(struct v4l2_subdev *sd,
> +						struct v4l2_subdev_state *state,
> +						u32 pad, u64 streams_mask)
> +{
[ ... ]
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
> +
> +	return ret;
> +}

[Severity: High]
Can this cause an unbalanced pm_runtime_put() if disable streams fails?

If the upstream v4l2_subdev_disable_streams() call fails, the function
still clears the bit in enabled_streams and calls pm_runtime_put().

If userspace later retries stopping the stream, this code will run again.
Because enabled_streams is already zero, the condition
!formatter->enabled_streams evaluates to true, causing a second
pm_runtime_put() call.

[ ... ]
> +static const struct v4l2_async_notifier_operations formatter_notify_ops =
=3D {
> +	.bound =3D csi_formatter_notify_bound,
> +};

[Severity: High]
Does this missing unbind callback lead to a use-after-free?

The driver stores the remote subdevice pointer in csi_sd during the bound
callback, but does not provide an unbind callback to clear it.

If the remote sensor module is unloaded, the dangling csi_sd pointer could =
be
dereferenced by subsequent stream ioctls.

[ ... ]
> +static int csi_formatter_async_register(struct csi_formatter *formatter)
> +{
[ ... ]
> +	struct fwnode_handle *ep __free(fwnode_handle) =3D
> +		fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> +						FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!ep)
> +		return -ENOTCONN;
[ ... ]
> +	ret =3D v4l2_async_nf_register(&formatter->notifier);
> +	if (ret)
> +		goto err_cleanup_notifier;
[ ... ]
> +err_unregister_notifier:
> +	v4l2_async_nf_unregister(&formatter->notifier);
> +err_cleanup_notifier:
> +	v4l2_async_nf_cleanup(&formatter->notifier);
> +	return ret;
> +}

[Severity: Medium]
Is it safe to mix goto-based error handling with scope-based cleanup helpers
in this function?

This function declares a __free() variable but also uses standard goto
unwinding labels, which can lead to double-free issues or confusing
resource semantics.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623-csi_format=
ter-v11-0-a792fe9c1502@oss.nxp.com?part=3D3
