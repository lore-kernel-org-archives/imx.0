Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BE427AC4D
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 03:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784518990; cv=none; b=dvZmSdsYv1HZ+EMHl/5Fl4CezW7iml93+OFVEMm+OduiM2v7+kcZtl8CDSrTkyqB2OnqUdNdtClPF3oKsAXnj6zFkTEglgf21tvPJPUfsFl1O8ReOINWhzS+YmottSQLE6l6wCdvJW/T3tj06uC+addKrfR/CQURtyw+KJiZYIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784518990; c=relaxed/simple;
	bh=uM3A0saObXwS6OeSH7l9Xk624FDHIVVaysI/SQIEdUM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PetT6XIGugD5N6hJRfzLVvL/QKlQfvFZV3IvMxbwZxfMs5qVT9NezM/hmiQgNZUOvxZIZkrtEOssnAZhmlNmpk3VtATn8yhIGXeMT+3N9LkIg8NiMiRha0x8Fe46Z3Fb4hRRB47gJ4VmxRqlHVyT3ZQQlJjgnWpE92xJ5HcICI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mv6st2U7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mv6st2U7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD4E1F000E9;
	Mon, 20 Jul 2026 03:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784518989;
	bh=/C5CEEToyMgJyZSUqs9yGeFur7xu1MYfmvrwFW9XftE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mv6st2U7fgtEU2kcVOwOkN3Oj58UxMdxL3X7crvcg3YiBm9PV8NyCajVcl4mLNcSQ
	 eNyu73Mlon0SgCeUne9fjBMZ73kixJUqighXQQdygne3P7rqfhliwlxOmbz145EP+U
	 W2XGTlFLn7D3H78pgoArYKaWKNeZl4sTFrv0zQYTBc0K3WM5xqdupLKxpvkyk+Gjtq
	 TmZ9u/j17+Kp3NJQiB4ebBN9ZOWlTMxWLu9y/NLTXsNQH2Y7zYjowSiAgQKSSgSX0I
	 AOqqwAt02omKJxUrzc9HN3mCiQwDyktQMZhtGrLVFo3Q/BFyVn4OV1LD81obRa1lbM
	 In81QIdr5g1vA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] media: nxp: imx8-isi: Fix stream ID validation
 bypass in crossbar routing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guoniu Zhou" <guoniu.zhou@oss.nxp.com>
Cc: media-ci@linuxtv.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260720-isi-v2-1-45845bc5d4fa@oss.nxp.com>
References: <20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com>
 <20260720-isi-v2-1-45845bc5d4fa@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 03:43:08 +0000
Message-Id: <20260720034309.2FD4E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Undefined behavior from bit shift overflow when using BIT() macro =
on user-controlled stream IDs on 32-bit architectures.
- [High] Missing V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX flag in routing v=
alidation allows stream mixing, violating driver assumptions and causing pi=
peline state corruption.
--

--- Patch [1]: [PATCH v2 1/6] media: nxp: imx8-isi: Fix stream ID validatio=
n bypass in crossbar routing ---
commit c48b83ab851ce7535e8d8249fb85d35c57bb63e1
Author: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

media: nxp: imx8-isi: Fix stream ID validation bypass in crossbar routing

The crossbar routing validation has a bug where it validates the wrong
routing table, allowing userspace to bypass validation entirely. This
commit fixes it by validating the routing table that will actually be
applied.

> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/dr=
ivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index c580c831972ec..84871bceb31db 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -107,7 +107,7 @@ static int __mxc_isi_crossbar_set_routing(struct v4l2=
_subdev *sd,
>  		return ret;

[Severity: High]
This isn't a bug introduced by this patch, but does the routing validation
here miss the V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX flag?

The validation in __mxc_isi_crossbar_set_routing() does not pass this
flag:

imx8-isi-crossbar.c:__mxc_isi_crossbar_set_routing() {
    ...
	ret =3D v4l2_subdev_routing_validate(sd, routing,
					   V4L2_SUBDEV_ROUTING_NO_N_TO_1);
    ...
}

This allows stream mixing, violating an explicit assumption in
mxc_isi_crossbar_xlate_streams(), where the driver silently overwrites
sink_pad for matching routes:

imx8-isi-crossbar.c:mxc_isi_crossbar_xlate_streams() {
    ...
	/*
	 * Translate the source pad and streams to the sink side. The routing
	 * validation forbids stream merging, so all matching entries in the
	 * routing table are guaranteed to have the same sink pad.
	 */
    ...
		sink_streams |=3D BIT(route->sink_stream);
		sink_pad =3D route->sink_pad;
    ...
}

If userspace configures a routing table via VIDIOC_SUBDEV_S_ROUTING with
multiple routes from different sink pads ending at the same source pad,
mxc_isi_crossbar_enable_streams() will only enable streams on the last
matched remote subdevice, leaving others disabled and leading to hardware
pipeline hangs.

> =20
>  	/* The memory input can be routed to the first pipeline only. */
> -	for_each_active_route(&state->routing, route) {
> +	for_each_active_route(routing, route) {

[Severity: High]
This is a pre-existing issue, but can using the BIT() macro on
user-controlled stream IDs cause undefined behavior on 32-bit architectures?

The core framework limits stream IDs to 63 (V4L2_SUBDEV_MAX_STREAM_ID), but
the driver uses BIT() on these IDs in mxc_isi_crossbar_xlate_streams():

imx8-isi-crossbar.c:mxc_isi_crossbar_xlate_streams() {
    ...
		if (route->source_pad !=3D source_pad ||
		    !(source_streams & BIT(route->source_stream)))
			continue;

		sink_streams |=3D BIT(route->sink_stream);
    ...
}

On 32-bit architectures, unsigned long is 32 bits. If userspace provides a
routing table via VIDIOC_SUBDEV_S_ROUTING with stream IDs >=3D 32, this
causes a shift out of bounds. This can result in incorrect bitmasks,
causing the driver to start or stop the wrong hardware streams and hang
the pipeline.

>  		if (route->sink_pad =3D=3D xbar->num_sinks - 1 &&
>  		    route->source_pad !=3D xbar->num_sinks) {
>  			dev_dbg(xbar->isi->dev,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-isi-v2-0-4=
5845bc5d4fa@oss.nxp.com?part=3D1
