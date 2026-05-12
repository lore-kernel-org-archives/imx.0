Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB62282F16;
	Tue, 12 May 2026 01:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778550126; cv=none; b=ulbXy5lLp2hkmVqDKPoRfWOX57lRsiIdLQESh+1JQYnRLsd5PLz1jFHiswPxGNO+TfkiIuhiV1S+07F1xYrvmUHxdJF6EbMDTFeU9P1innbnlYrN4WWTvU9mHImPTXZfG1OjaIa1fpmk8uD9TP0h/3UIdK2kaC/M0i0MobQcuuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778550126; c=relaxed/simple;
	bh=/Tosaryyb+tWzZJ1kVsAI1SxCjbRQbn0lG1ZjlAs6P4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fbQQpC07MZ7mBjq2N487GEhFL1voRosOATipGM3y4slualhaZYxFXRzvE3/HLOIRypONrTb9fni02CBWTIQbd5zlkDfjLFKJwVHQHNHljQfg9TMUMDb9xoGH+rhZ53fQDFjVGVfoL46O0Z/3xPgdnQaTE01llwnUkXZl/V69EAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPHf0x/G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPHf0x/G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A250C2BCB0;
	Tue, 12 May 2026 01:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778550125;
	bh=/Tosaryyb+tWzZJ1kVsAI1SxCjbRQbn0lG1ZjlAs6P4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=YPHf0x/GClRGKzDHmatio4QGQVWqDkrO/Q0ujaQlFF4FPr6XQjlot5KuAmPKFtdhX
	 HKtWaUV/YoChZucBbrhkD6wp0p1H0+lN1MU+NOwxfhySkCFMChfkwrWsHW6XWZR5UJ
	 khO9dEAhy87uukso0NdZVZLWefKcDjnNp3pWQMU0ThDoHsuf0kqSPFyNWHvsN+lI6I
	 EPFlVgvwsUpJnF16AigyPWvbKO0NYOdDFEGzxwqazCanVTOJhD8VlDNqLCcgDR7QAv
	 tAgU/TXH1+aq8Xt6B9Pyap+JR14/EO5N0gisD1NUgMhYuHM4xmWJCTC5qb9o+BUMyT
	 vzv5rnIGuEEuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2
 driver
Reply-To: sashiko@lists.linux.dev
To: "Guoniu Zhou" <guoniu.zhou@oss.nxp.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, imx@lists.linux.dev, krzk+dt@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511-csi_formatter-v6-2-01028e312e2b@oss.nxp.com>
References: <20260511-csi_formatter-v6-2-01028e312e2b@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 01:42:04 +0000
Message-Id: <20260512014205.8A250C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [Critical] Missing .unbind callback in async notifier leaves a dangling p=
ointer, causing a Use-After-Free.
- [High] Missing NULL pointer check after calling v4l2_subdev_state_get_for=
mat() causes a kernel panic.
- [High] Missing NULL check for formatter->csi_sd in formatter_subdev_disab=
le_streams() leads to kernel panic.
- [High] Global caching of V4L2 format breaks hardware configuration for mu=
ltiplexed streams.
- [High] State desynchronization in formatter_subdev_disable_streams() lead=
s to PM reference counter underflow.
- [High] Subdevice is registered asynchronously before runtime PM and drvda=
ta are initialized.
- [High] Uninitialized stack variable source_fd in get_vc() passed to downs=
tream subdevice, risking OOB stack read.
- [Medium] Mixing goto-based error handling with scope-based cleanup helper=
s (__free and guard).
- [Medium] Conflation of V4L2_FRAME_DESC_ENTRY_MAX with stream IDs silently=
 drops configurations for streams >=3D 8.
--

commit 0a5796f1d64d741325c60f3d9fb1c35507045c6e
Author: Guoniu Zhou <guoniu.zhou@nxp.com>

media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver
   =20
The CSI pixel formatter is a module found on i.MX95 used to reformat
packet info, pixel and non-pixel data from CSI-2 host controller to
match Pixel Link(PL) definition. Add data formatting support.

> diff --git a/drivers/media/platform/nxp/imx9-csi-formatter.c b/drivers/me=
dia/platform/nxp/imx9-csi-formatter.c
> new file mode 100644
> index 0000000000000..aca04de8e0ed8
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx9-csi-formatter.c
> @@ -0,0 +1,776 @@
[ ... ]
> +static int formatter_subdev_enum_mbus_code(struct v4l2_subdev *sd,
> +					   struct v4l2_subdev_state *sd_state,
> +					   struct v4l2_subdev_mbus_code_enum *code)
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

v4l2_subdev_state_get_format() can return NULL if the requested stream ID is
not in the routing table. Can this cause a NULL pointer dereference when
accessing fmt->code?

[ ... ]
> +static int formatter_subdev_set_fmt(struct v4l2_subdev *sd,
> +				    struct v4l2_subdev_state *sd_state,
> +				    struct v4l2_subdev_format *sdformat)
> +{
> +	struct csi_formatter *formatter =3D sd_to_formatter(sd);
> +	struct formatter_pix_format const *format;
> +	struct v4l2_mbus_framefmt *fmt;
[ ... ]
> +	fmt =3D v4l2_subdev_state_get_format(sd_state, sdformat->pad,
> +					   sdformat->stream);
> +	*fmt =3D sdformat->format;

Is it possible for v4l2_subdev_state_get_format() to return NULL here as
well if userspace provides an invalid stream ID?

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
> +
> +	*fmt =3D sdformat->format;
> +
> +	/* Store the CSIS format descriptor for active formats. */
> +	if (sdformat->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> +		formatter->fmt =3D format;
> +
> +	return 0;
> +}

Does storing a single format globally in formatter->fmt break hardware
configuration when multiplexing multiple streams?

If userspace configures different formats for different streams,
formatter->fmt retains only the last configured format. Later,
csi_formatter_start_stream() applies formatter->fmt->data_type identically
to all enabled streams.

[ ... ]
> +static int get_vc(struct csi_formatter *formatter, unsigned int stream)
> +{
> +	struct v4l2_mbus_frame_desc source_fd;
> +	struct v4l2_mbus_frame_desc_entry *entry =3D NULL;
> +	unsigned int i;
> +	int vc;
> +	int ret;
> +
> +	/*
> +	 * Return virtual channel 0 as default value when remote subdev
> +	 * don't implement .get_frame_desc subdev callback
> +	 */
> +	ret =3D v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
> +			       formatter->remote_pad, &source_fd);
> +	if (ret < 0)
> +		return (ret =3D=3D -ENOIOCTLCMD) ? 0 : ret;
> +
> +	for (i =3D 0; i < source_fd.num_entries; ++i) {

Should source_fd be zero-initialized before passing it to the downstream
subdevice?

If the remote driver succeeds but fails to populate the struct completely,
could source_fd.num_entries contain uninitialized stack data, potentially
causing an out-of-bounds read in this loop?

[ ... ]
> +static void csi_formatter_stop_stream(struct csi_formatter *formatter,
> +				     u64 stream_mask)
> +{
> +	unsigned int i;
> +	int ret;
> +	int vc;
> +
> +	for (i =3D 0; i < V4L2_FRAME_DESC_ENTRY_MAX; ++i) {
> +		if (!(stream_mask & BIT(i)))
> +			continue;

Is V4L2_FRAME_DESC_ENTRY_MAX (which is 8) the correct upper bound when
iterating through a 64-bit stream_mask?

If userspace enables a stream with an ID of 8 or higher, will this loop
silently skip it?

[ ... ]
> +static int csi_formatter_start_stream(struct csi_formatter *formatter,
> +				      u64 stream_mask)
> +{
> +	const struct formatter_pix_format *fmt =3D formatter->fmt;
> +	u64 configured_streams =3D 0;
> +	unsigned int i;
> +	u32 val;
> +	int ret;
> +	int vc;
> +
> +	for (i =3D 0; i < V4L2_FRAME_DESC_ENTRY_MAX; ++i) {

Similarly, does this loop also drop configurations for stream IDs >=3D 8?

[ ... ]
> +static int formatter_subdev_enable_streams(struct v4l2_subdev *sd,
> +					   struct v4l2_subdev_state *state,
> +					   u32 pad, u64 streams_mask)
> +{
> +	struct csi_formatter *formatter =3D sd_to_formatter(sd);
> +	struct device *dev =3D formatter->dev;
> +	u64 sink_streams;
> +	int ret;
[ ... ]
> +	if (!formatter->csi_sd) {
> +		dev_err(dev, "CSI controller not linked with formatter\n");
> +		return -EPIPE;
> +	}
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
> +	ret =3D csi_formatter_start_stream(formatter, streams_mask);
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

Does this function mix scope-based cleanup (guard()) with goto error
labels?

According to the cleanup subsystem guidelines, mixing goto-based error
handling with scope variables in the same function can create confusing
ownership semantics and is typically avoided.

> +
> +static int formatter_subdev_disable_streams(struct v4l2_subdev *sd,
> +					    struct v4l2_subdev_state *state,
> +					    u32 pad, u64 streams_mask)
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

While formatter_subdev_enable_streams() explicitly checks if
(!formatter->csi_sd) before proceeding, this function does not.

If the pipeline is unbound, could formatter->csi_sd be NULL and lead to a
panic when v4l2_subdev_disable_streams() dereferences it?

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

If v4l2_subdev_disable_streams() returns an error, the driver still clears
formatter->enabled_streams and calls pm_runtime_put().

The V4L2 core will see the returned error and keep the streams active in its
state. If userspace then retries disabling the streams, this function could
be called again, redundantly clearing the state and calling pm_runtime_put(=
).

Could this cause a PM reference counter underflow?

[ ... ]
> +static int csi_formatter_notify_bound(struct v4l2_async_notifier *notifi=
er,
> +				      struct v4l2_subdev *sd,
> +				      struct v4l2_async_connection *asc)
> +{
> +	const unsigned int link_flags =3D MEDIA_LNK_FL_IMMUTABLE
> +				      | MEDIA_LNK_FL_ENABLED;
> +	struct csi_formatter *formatter =3D notifier_to_formatter(notifier);
> +	struct v4l2_subdev *sdev =3D &formatter->sd;
> +	struct media_pad *sink =3D &sdev->entity.pads[CSI_FORMATTER_PAD_SINK];
> +	struct media_pad *remote_pad;
> +	int ret;
> +
> +	formatter->csi_sd =3D sd;
> +
> +	dev_dbg(formatter->dev, "Bound subdev: %s pad\n", sd->name);
> +
> +	ret =3D v4l2_create_fwnode_links_to_pad(sd, sink, link_flags);
> +	if (ret < 0)
> +		return ret;
> +
> +	remote_pad =3D media_pad_remote_pad_first(sink);
> +	if (!remote_pad) {
> +		dev_err(formatter->dev, "Pipe not setup correctly\n");
> +		return -EPIPE;
> +	}
> +	formatter->remote_pad =3D remote_pad->index;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_async_notifier_operations formatter_notify_ops =
=3D {
> +	.bound =3D csi_formatter_notify_bound,
> +};

The driver saves the sd pointer to formatter->csi_sd, but
formatter_notify_ops does not implement an .unbind callback to clear it.

If the remote subdevice is unloaded, will formatter->csi_sd become a
dangling pointer and risk a use-after-free during later operations?

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

Does this function also mix goto-based error handling with a scope-based
cleanup helper (__free(fwnode_handle))?

[ ... ]
> +static int csi_formatter_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D csi_formatter_async_register(formatter);
> +	if (ret < 0)
> +		goto err_cleanup_subdev;
> +
> +	platform_set_drvdata(pdev, &formatter->sd);
> +
> +	/* Enable runtime PM. */
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		goto err_async_unregister;
> +
> +	return 0;

The driver registers the async subdevice before calling
platform_set_drvdata() and devm_pm_runtime_enable().

If userspace opens the node immediately and issues an IOCTL, could it fail
to acquire PM (since it's disabled) or hit a NULL drvdata pointer if the
device attempts to suspend/resume? Usually, asynchronous registration is
the final step in probe().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-csi_format=
ter-v6-0-01028e312e2b@oss.nxp.com?part=3D2
