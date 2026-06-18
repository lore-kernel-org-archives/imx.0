Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC463BCD27;
	Thu, 18 Jun 2026 09:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781776264; cv=none; b=cYgXlDh49tn4dZnCC+afdjYgoCPFYftovrKmE/Yrnag9FW85cR480Te9+3HQpGn/Rb3UKsIFMyvzt+v+g//6MC5l5NpScFTufTQFutDi99n9HTvNAHhMcCyh1akgBs0+oyQ4ATg0IyVoricQspI7DgqOq3gJp3U2OVVX/Nr26I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781776264; c=relaxed/simple;
	bh=hcHgPb498P8dG0Sn5AiKY9+iU4DmVIzjP9mh+8ZIjXI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eUH8ieqpLv4jZ30hVyDdFuo9GO25fal4nfBOGRU0QAycWKOvzOj2ks7Afabat7LjDLTnnDvd/4C8rqOvRZOd55J8iN3X9oPpLjNyukHKbuoOekw/bKjInyRnrn1YTivD+Fz2YSmtoazST8UeuK/GMkG6RkPgGcH+fmBd5Fkd6vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZgGUy0K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZgGUy0K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5BB1F000E9;
	Thu, 18 Jun 2026 09:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781776262;
	bh=Px7uBQSwaCKD4AtRlrlKDSY5TFnMd9l5KwkZ0WqeCfg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kZgGUy0KyTKQOA08P7zjHpbjQE2jf36GqkmJRdo0DlDT2VUFfUefO+mEcIlBLIwCn
	 /zlcXspa33jgI35QU6GRbJnZH0DtM+4LaAEizBBrKx4ALjNua14AA2cJBBqO+OrmCN
	 x10iciJKjCJKbsI4/rO12XiUsH0bPQ0W30QVeQBgXtvXOQp6bGktuCU2uIQFzlKfB8
	 NvEtjzphk6T3NTYiOQnpx/cRDfKz+Du3qQ5JOHeZo222UTcNA6ugpyq/r40jCkHX+Z
	 O+Xty9hU66avSmgIAppts5lxbeme2bcDv/9GdLI0sHbCcCy9PhY/pL7ACGo8SP7NKw
	 2vQTJ75dhIKxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 4/4] media: nxp: Add i.MX95 CSI pixel formatter v4l2
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: guoniu.zhou@oss.nxp.com
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618-csi_formatter-v10-4-f23830312ba5@oss.nxp.com>
References: <20260618-csi_formatter-v10-0-f23830312ba5@oss.nxp.com>
 <20260618-csi_formatter-v10-4-f23830312ba5@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 09:51:01 +0000
Message-Id: <20260618095102.3D5BB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] SINK and SOURCE stream masks are conflated, leading to a guara=
nteed NULL pointer dereference.
- [Critical] Missing NULL pointer checks for `v4l2_subdev_state_get_format(=
)` allow unprivileged userspace to trigger kernel crashes.
- [High] Direct register writes to `CSI_VC_PIXEL_DATA_TYPE` corrupt hardwar=
e state for multiplexed streams sharing the same Virtual Channel.
- [High] The driver incorrectly bounds logical stream iteration to the hard=
ware Virtual Channel count, leading to silent stream configuration failures=
 and out-of-bounds array access potential.
- [High] Missing `.unbind` callback in the async notifier operations leaves=
 a dangling pointer to the remote subdevice, resulting in a Use-After-Free.
- [Medium] The driver breaks UAPI by returning `-EINVAL` when setting a for=
mat on an unrouted pad, breaking standard userspace pipeline configuration =
flows.
- [Medium] Mixing `goto`-based error handling with scope-based cleanup help=
ers (`__free()` and `guard()`).
--

commit 91d3a7fba60671cec5f0a95a21622c4761779af5
Author: Guoniu Zhou <guoniu.zhou@nxp.com>
Date:   Thu Jun 18 09:41:38 2026 +0000

    media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver

This commit introduces the V4L2 driver for the i.MX95 CSI pixel formatter
module. It provides support for data formatting, unpacking pixels from the
CSI-2 interface to match Pixel Link requirements.

> diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c b/drivers/m=
edia/platform/nxp/imx95-csi-formatter.c
> new file mode 100644
> index 0000000000000..cfe448fedd37e
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx95-csi-formatter.c
> @@ -0,0 +1,775 @@
[ ... ]
> +struct csi_formatter {
> +	struct device *dev;
[ ... ]
> +	/* Protects enabled_streams */
> +	struct mutex lock;
> +	u64 enabled_streams;
> +
> +	u8 stream_to_vc[CSI_FORMATTER_VC_NUM];

[Severity: High]
Does this array statically bound logical streams to the hardware Virtual Ch=
annel
limit?

The CSI_FORMATTER_VC_NUM constant is 8, representing the number of hardware=
 VCs.
However, this array is later indexed by a logical V4L2 stream ID, which can
validly be up to 63. If the loop limit in csi_formatter_start_stream() were
corrected to 64 to resolve the stream ID limitation without changing this a=
rray
size, it would cause out-of-bounds writes.

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

[Severity: Critical]
Is it possible for v4l2_subdev_state_get_format() to return NULL here?

The V4L2 core does not pre-validate that the logical stream ID provided by
userspace exists in the active routing state. If an invalid stream ID is
requested, the format pointer will be NULL. Reading fmt->code on this NULL
pointer will cause a kernel oops, potentially enabling a local denial of se=
rvice.

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

[Severity: Critical]
Could this result in a NULL pointer dereference?

Similar to csi_formatter_subdev_enum_mbus_code(), if userspace provides an
invalid stream ID, v4l2_subdev_state_get_format() returns NULL. Writing
directly to *fmt will cause a kernel oops.

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
Should the driver reject setting formats on unrouted pads?

Standard V4L2 subdevice behavior requires drivers to accept the format on t=
he
unrouted pad and simply skip propagation if no route exists. Returning -EIN=
VAL
here enforces a strict requirement that userspace must establish routing be=
fore
setting formats, which breaks standard pipeline configuration flows like th=
ose
used by media-ctl.

[ ... ]
> +static void csi_formatter_stop_stream(struct csi_formatter *formatter,
> +				      u64 stream_mask)
> +{
> +	unsigned int i;
> +	u8 vc;
> +
> +	for (i =3D 0; i < CSI_FORMATTER_VC_NUM; ++i) {
> +		if (!(stream_mask & BIT(i)))
> +			continue;
> +
> +		/* Use the VC that was configured in start_stream */
> +		vc =3D formatter->stream_to_vc[i];
> +		if (vc >=3D CSI_FORMATTER_VC_NUM)
> +			continue;
> +
> +		csi_formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), 0);

[Severity: High]
Does writing 0 abruptly terminate all multiplexed streams on this Virtual
Channel?

The MIPI CSI-2 specification allows multiple streams with different Data Ty=
pes
to be multiplexed onto a single VC. The register acts as a bitmask of enabl=
ed
Data Types. Directly writing 0 here tears down all streams on the VC instead
of just the target stream, breaking hardware multiplexing.

[ ... ]
> +static int csi_formatter_start_stream(struct csi_formatter *formatter,
> +				      struct v4l2_subdev_state *state,
> +				      u64 stream_mask)
> +{
[ ... ]
> +	for (i =3D 0; i < CSI_FORMATTER_VC_NUM; ++i) {
> +		if (!(stream_mask & BIT(i)))
> +			continue;
> +
> +		fmt =3D v4l2_subdev_state_get_format(state,
> +						   CSI_FORMATTER_PAD_SINK, i);
> +
> +		pix_fmt =3D csi_formatter_find_format(fmt->code);

[Severity: Critical]
Will this return NULL if the source stream ID differs from the sink stream =
ID?

In csi_formatter_subdev_enable_streams(), the streams_mask parameter repres=
ents
the bitmask of streams on the source pad, and it is passed verbatim to this
function.=20

This loop iterates over the source stream bitmask, so i is a source stream =
ID.
Calling v4l2_subdev_state_get_format() with CSI_FORMATTER_PAD_SINK but pass=
ing
a source stream ID will return a NULL format pointer if that stream ID does=
 not
exist on the sink pad (e.g., sink stream 1 routed to source stream 0). The =
code
then unconditionally dereferences fmt->code, causing a kernel panic.

Should the driver translate and iterate over the sink_streams mask instead?

[ ... ]
> +		/* Store the stream to VC mapping for stop_stream */
> +		formatter->stream_to_vc[i] =3D vc;
> +
> +		csi_formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), val);

[Severity: High]
Does this direct register write clear previously enabled Data Types on the
shared Virtual Channel?

Because this uses a direct register write instead of updating bits, it will
unconditionally clear all other active Data Types previously configured for
this VC, breaking hardware multiplexing.

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

[Severity: Medium]
Is it safe to mix guard(mutex) block scoping with goto labels for runtime
power management rollback?

The kernel's subsystem guidelines for cleanup functions state that the usag=
e of
goto and cleanup helpers must never be mixed within the same function due t=
o the
risk of confusing ownership semantics and ordering bugs.

[ ... ]
> +	ret =3D csi_formatter_start_stream(formatter, state, streams_mask);

[Severity: Critical]
Is the wrong stream mask passed to csi_formatter_start_stream() here?

The variable streams_mask represents the bitmask of streams on the source p=
ad.
However, csi_formatter_start_stream() uses this mask to query formats on the
sink pad.

Should sink_streams be passed to csi_formatter_start_stream() instead to av=
oid
querying invalid stream IDs on the sink pad?

[ ... ]
> +static const struct v4l2_async_notifier_operations formatter_notify_ops =
=3D {
> +	.bound =3D csi_formatter_notify_bound,
> +};

[Severity: High]
Is an .unbind callback needed to clean up the stale remote subdevice pointe=
r?

The driver caches a pointer to the bound source subdevice in
formatter->csi_sd during the .bound callback. However, this operations
structure does not provide an .unbind callback to set this pointer to NULL
when the remote subdevice is unbound and removed.=20

If the source driver module is unloaded, the pointer becomes dangling. A
subsequent streaming operation would dereference the freed memory in
v4l2_subdev_enable_streams() and cause a kernel oops.

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
Does this mix __free(fwnode_handle) with goto-based error tracking?

Using __free() alongside goto-based unwinding in the same function violates
cleanup function guidelines, which can lead to double-frees or resource lea=
ks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-csi_format=
ter-v10-0-f23830312ba5@oss.nxp.com?part=3D4
