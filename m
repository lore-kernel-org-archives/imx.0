Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9397A27AC4D
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 03:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784518953; cv=none; b=CnL3W+bGydJJieWksA3T3kuEzBinT9NUcTjksHlkSTXHvYSjOEuL9z5t8UYxBhy6Qp+vrMSx/2NEbZXleO+Fk68PUwJWVvNEqP6/laBAY2GQEgKV+NPzUmszJbcZcx9wrjk7aVmXJeWqL/EebLjOwNDkV1rM++trjTsM72QGSmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784518953; c=relaxed/simple;
	bh=YYaGS6b2Cqx680dEch6bvEsE6kmyKF/+eJn0qRnwZYs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QGIMddZBVq671crTWLrlK/W7Qb5P3908uxRcX4ubjaOm+TbXCGvphU6PWlINon7mAAUJy6W7AR0GDUOqh/PgFoTOrp0LfqokcH788FWb5u6h+MV7y1o8wnUz/PUzjQSDMMshqqpKr0T2HrB0BRDlp/XzpF/6DtlOYcelJE+uCdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8ES+J7v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8ES+J7v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0696E1F000E9;
	Mon, 20 Jul 2026 03:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784518952;
	bh=G/s/qQBFrYjpVA519bRNs/ikjsya/Nt7XGqUHSVvkS0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G8ES+J7vdxhwCJscVsjQwOKtZW6i0OZJ4MyYz6zhrAOBNt4Bc/ZUOaQiNPqyu+Pyk
	 znfZW+88jWnIW8UxiloDujtXnoUgOhzHZcZsF1W/UOpy7tGLkubxd3NLKMx6+17ALj
	 788Vnuw7gcKDUn9Wbv43Fl6hTdBA9jvrnD1mw6G/rUNQ8tJMnBMGz/SwYcf5B8/eXx
	 5+W/h23v9myXccnrriH5BtM5+uUEhXfckJqa4s4z1fdgSpVoKd7A2/e78UUxN6JPaC
	 /9WIi6FPbeUixgwxvOE4owo2YX54VuAFN2Xx4aspiEuBaXtIDdl/oJfTQlFqNlSivq
	 knlIOt9+mA00w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/6] media: nxp: imx8-isi: Fix per-stream reference
 counting for multiplexed streams
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guoniu Zhou" <guoniu.zhou@oss.nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, media-ci@linuxtv.org
In-Reply-To: <20260720-isi-v2-3-45845bc5d4fa@oss.nxp.com>
References: <20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com>
 <20260720-isi-v2-3-45845bc5d4fa@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 03:42:31 +0000
Message-Id: <20260720034232.0696E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unchecked return value from `media_pad_remote_pad_first()` causes =
a NULL pointer dereference if the sink pad has no enabled link.
- [Medium] Use of `BIT()` macro for 64-bit stream IDs causes undefined beha=
vior and bitwise truncation on 32-bit platforms.
--

--- Patch [3]: [PATCH v2 3/6] media: nxp: imx8-isi: Fix per-stream referenc=
e counting for multiplexed streams ---
commit 976517cc78165ba12439fb004220b58271a0beea
Author: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

media: nxp: imx8-isi: Fix per-stream reference counting for multiplexed str=
eams

The driver uses a single enable_count per input to track the input state.
This fails to properly enable multiple streams from different virtual
channels on the same input pad. This patch tracks per-stream state using
enabled_streams bitmask and enabled_count[] array.

> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/dr=
ivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 328d08a278eaf..64576f6bd45c2 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -337,6 +337,8 @@ static int mxc_isi_crossbar_enable_streams(struct v4l=
2_subdev *sd,
>  	struct mxc_isi_crossbar *xbar =3D to_isi_crossbar(sd);
>  	struct v4l2_subdev *remote_sd;
>  	struct mxc_isi_input *input;
> +	u64 streams_to_enable;
> +	unsigned long stream;
>  	u64 sink_streams;
>  	u32 sink_pad;
>  	u32 remote_pad;
> @@ -350,30 +352,47 @@ static int mxc_isi_crossbar_enable_streams(struct v=
4l2_subdev *sd,
> =20
>  	input =3D &xbar->inputs[sink_pad];

[Severity: High]
This is a pre-existing issue, but can this lead to a NULL pointer dereferen=
ce
if the remote link is disabled?

When userspace configures a V4L2 subdev route connecting a source pad to a
sink pad on the crossbar, but leaves the incoming media link to that sink p=
ad
disabled, media_pad_remote_pad_first() will return NULL.

In drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:
mxc_isi_crossbar_xlate_streams() {
    ...
	pad =3D media_pad_remote_pad_first(&xbar->pads[sink_pad]);
	sd =3D media_entity_to_v4l2_subdev(pad->entity);
	if (!sd) {
    ...
}

The media_entity_to_v4l2_subdev() macro immediately dereferences pad to
access pad->entity before any NULL check is performed.

[Severity: Medium]
This is also a pre-existing issue, but might there be bitwise truncation and
undefined behavior on 32-bit platforms when computing sink_streams?

When userspace configures a routing table using VIDIOC_SUBDEV_S_ROUTING with
a sink_stream ID greater than or equal to 32, using BIT() will cause issues
on 32-bit systems where BIT() operates on a 32-bit unsigned long.

In drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:
mxc_isi_crossbar_xlate_streams() {
    ...
	for_each_active_route(&state->routing, route) {
		...
		sink_streams |=3D BIT(route->sink_stream);
		sink_pad =3D route->sink_pad;
	}
    ...
}

Could BIT_ULL() be used instead to safely construct the u64 sink_streams
bitmask?

> -	/*
> -	 * TODO: Track per-stream enable counts to support multiplexed
> -	 * streams.
> -	 */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-isi-v2-0-4=
5845bc5d4fa@oss.nxp.com?part=3D3
