Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0438218AB9;
	Mon, 18 May 2026 02:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779072398; cv=none; b=S3SZ49Sq7C0B4lEKgu92+hbny6BRzH/zMLJ8c1hJpHCLwzNybrrUf+xnsf10X5pWIxkcLxQm9tzRP0+qrIV3kCHKNL/ySE+vUOsYA4fiXuvMM7ApR3qTuaqyvCPdDMhj87Gy77HytRnmWz8lavUSDLqqFKjA4rvowaY5snM2WM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779072398; c=relaxed/simple;
	bh=5zHura2ikc3DQkQZ1soryG3lh+2fqIgH9sfgwS1uNFY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hHN1HIOYwe11ZYo+yMCCR8dwUOvXvmYeiUObfJ5ZcyukaqwabRrUj67efLF5RIpt+c/MQv0Jpqk1mZH6HX/bzi9os60nhDphTUSKbhxC0ZZO0ZgQozgaIa+Soe6whLxgQ27U85Ei6Gvgw56i7ovK79M5Cb0b9gTQebUT5FJVMD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qVzNw5Bz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qVzNw5Bz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C54EC2BCB0;
	Mon, 18 May 2026 02:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779072398;
	bh=5zHura2ikc3DQkQZ1soryG3lh+2fqIgH9sfgwS1uNFY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=qVzNw5Bzpf7jLn/x0VgSkoBz0ntju5qMzIl4IfKDqlY7cehFS5gtk5F5/XflizlIo
	 aOpElJeWpFD0zlfMxsae4jOhuft8+fbDTq3ok1C9Wsf5woBr7VfijL7pZEhYbkFbNK
	 t2dcwHY/hA+3MjeebqtitJKmz2vYefcCHv+DKa5sHj5t8lFQPUo1yvUsEiWpr+a41o
	 1DE3jV+gOvM0wB2C480UjYBe03/AGbanyygJrHxsbWGVieFPdvvFVvy0WfTlIfCYGE
	 hgPgXQauIkRoz4olNDXjFOjdJaMLOYCFq63Dn3trT+W1m32FHnS49Yr+xOnMNjmy4h
	 bGYPdkHg8NNTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] media: nxp: Add i.MX95 CSI pixel formatter v4l2
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guoniu Zhou" <guoniu.zhou@oss.nxp.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260518-csi_formatter-v7-2-562b750557e3@oss.nxp.com>
References: <20260518-csi_formatter-v7-2-562b750557e3@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 02:46:37 +0000
Message-Id: <20260518024638.5C54EC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [High] Unchecked return value from v4l2_subdev_state_get_format() causes =
a kernel panic on invalid stream IDs.
- [High] Missing .unbind callback leaves a dangling pointer to the upstream=
 subdevice, leading to Use-After-Free.
- [High] Global format caching breaks multiplexed multi-stream configuratio=
ns.
- [High] Register overwrite on shared virtual channels disables concurrent =
streams.
- [High] Querying upstream frame descriptor after disabling it leads to res=
ource leaks.
- [High] Unprotected format modification and missing streaming check in for=
matter_subdev_set_fmt().
- [High] Double pm_runtime_put() on stream disable failure leads to unbalan=
ced PM usage counter.
- [Medium] Mixing of goto-based error handling and scope-based cleanup help=
ers violates subsystem guidelines.
- [Medium] Uninitialized stack variable `source_fd` in get_vc() risks out-o=
f-bounds memory reads.
- [Medium] Stream bitmasks > 7 are silently ignored during start/stop.
- [Medium] formatter_subdev_set_fmt() breaks unrouted streams by improperly=
 returning -EINVAL.
--

commit 4d8a1be6e9f473bbb1ccaf942fe57cfe4870bd41
Author: Guoniu Zhou <guoniu.zhou@nxp.com>

media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver
   =20
The CSI pixel formatter is a module found on i.MX95 used to reformat
packet info, pixel and non-pixel data from CSI-2 host controller to
match Pixel Link(PL) definition. Add data formatting support.

> diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c b/drivers/m=
edia/platform/nxp/imx95-csi-formatter.c
> new file mode 100644
> index 0000000000000..45240b7422b47
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx95-csi-formatter.c
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

Is it possible for v4l2_subdev_state_get_format() to return NULL here?
If userspace passes an unrouted stream ID, this might result in a NULL
pointer dereference.

> +		return 0;
> +	}
[ ... ]
> +static int formatter_subdev_set_fmt(struct v4l2_subdev *sd,
> +				    struct v4l2_subdev_state *sd_state,
> +				    struct v4l2_subdev_format *sdformat)
> +{
> +	struct csi_formatter *formatter =3D sd_to_formatter(sd);
> +	struct formatter_pix_format const *format;
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	if (sdformat->pad =3D=3D CSI_FORMATTER_PAD_SOURCE)
> +		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
> +
> +	/*
> +	 * Validate the media bus code and clamp and align the size.
> +	 *
> +	 * The total number of bits per line must be a multiple of 8. We thus
> +	 * need to align the width for formats that are not multiples of 8
> +	 * bits.
> +	 */
> +	format =3D find_csi_format(sdformat->format.code);
> +	if (!format)
> +		format =3D &formats[0];
> +
> +	v4l_bound_align_image(&sdformat->format.width, 1, 0xffff, 2,
> +			      &sdformat->format.height, 1, 0xffff, 0, 0);
> +
> +	fmt =3D v4l2_subdev_state_get_format(sd_state, sdformat->pad,
> +					   sdformat->stream);
> +	*fmt =3D sdformat->format;

Can v4l2_subdev_state_get_format() return NULL for an unrouted stream here
as well?

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

Since the V4L2 Streams API permits setting formats on unrouted streams,
should this skip propagation instead of returning -EINVAL?

> +
> +	*fmt =3D sdformat->format;
> +
> +	/* Store the CSIS format descriptor for active formats. */
> +	if (sdformat->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> +		formatter->fmt =3D format;

Does this modification of formatter->fmt require formatter->lock protection
to avoid a race with enable_streams()?

Also, could userspace modify the format concurrently with an active stream
since there is no media_entity_is_streaming() check here?

> +
> +	return 0;
> +}
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

Could source_fd be left uninitialized if the upstream subdev returns 0
but fails to fully populate it? This might lead to an out-of-bounds read
when iterating over source_fd.num_entries.

> +	if (ret < 0)
> +		return (ret =3D=3D -ENOIOCTLCMD) ? 0 : ret;
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

Are stream IDs >=3D V4L2_FRAME_DESC_ENTRY_MAX supported? If the mask
contains bits higher than this limit, they seem to be silently ignored.

> +
> +		ret =3D get_vc(formatter, i);
> +		if (WARN_ON(ret < 0)) {
> +			dev_err(formatter->dev,
> +				"Failed to get VC for stream %d: %d\n", i, ret);
> +			continue;
> +		}
> +
> +		vc =3D ret;
> +
> +		formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), 0);

Does overwriting this register completely break other interleaved streams
sharing the same Virtual Channel? A read-modify-write might be necessary
here since the register uses a bitmask.

> +	}
> +}
> +
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
> +		if (!(stream_mask & BIT(i)))
> +			continue;
> +
> +		val =3D BIT(get_index_by_dt(fmt->data_type));

Will this break if userspace configures a multi-stream pipeline with
different formats per stream, since it applies the same global data type
to all enabled streams?

> +
> +		ret =3D get_vc(formatter, i);
> +		if (ret < 0)
> +			goto err_cleanup;
> +
> +		vc =3D ret;
> +
> +		formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), val);
> +		configured_streams |=3D BIT(i);
> +	}
[ ... ]
> +static int formatter_subdev_enable_streams(struct v4l2_subdev *sd,
> +					   struct v4l2_subdev_state *state,
> +					   u32 pad, u64 streams_mask)
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
> +	dev_dbg(dev, "Enable streams: pad=3D%u sink=3D0x%llx source=3D0x%llx\n",
> +		formatter->remote_pad, sink_streams, streams_mask);
> +
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

Does mixing guard() with goto labels create confusing ownership semantics
here?

> +
> +	ret =3D v4l2_subdev_enable_streams(formatter->csi_sd,
> +					 formatter->remote_pad,
> +					 sink_streams);
> +	if (ret)
> +		goto err_stop_stream;
[ ... ]
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
> +	if (ret)
> +		dev_err(formatter->dev, "Failed to disable streams: %d\n", ret);
> +
> +	csi_formatter_stop_stream(formatter, streams_mask);

Since the upstream subdevice is disabled first, will its get_frame_desc
callback fail when csi_formatter_stop_stream() calls get_vc()? This could
cause the driver to skip disabling the local hardware stream.

> +
> +	formatter->enabled_streams &=3D ~streams_mask;
> +
> +	if (!formatter->enabled_streams)
> +		pm_runtime_put(formatter->dev);
> +
> +	return ret;

If v4l2_subdev_disable_streams() fails, the V4L2 core retains the stream
as enabled, but the driver clears enabled_streams and calls pm_runtime_put(=
).
Would a subsequent retry to disable the stream cause a second
pm_runtime_put() without a matching get, unbalancing the usage counter?

> +}
[ ... ]
> +static const struct v4l2_async_notifier_operations formatter_notify_ops =
=3D {
> +	.bound =3D csi_formatter_notify_bound,
> +};

Is an .unbind callback missing here? If the upstream subdevice is unbound,
formatter->csi_sd would be left dangling, potentially leading to a
use-after-free during subsequent V4L2 operations.

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

This mixes __free() and goto-based error handling. Could this lead to
unexpected resource leaks or ownership issues?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-csi_format=
ter-v7-0-562b750557e3@oss.nxp.com?part=3D2
