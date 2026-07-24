Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09851F4180
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 08:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880137; cv=none; b=p2fRkIRHWL9QKJUQPTmXPL33f7Sz2Z4zplLjRwsqcVjE49R4WGMcMK9Dve9948ZFdhn9ig5AnpePTotiIIFgJsY2LUGF7HO5tI9r1gL95zloQK7TYBSA4j8nz/gnhNY4MEpjheQd5t9JBo9oS4tLSU4UeIUbaL4WzKXiP4vQ8pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880137; c=relaxed/simple;
	bh=aL6sSPlBMbjGJfqhtGR0CmmgwiY27hWbb3EnJvShaNA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=egdeDLo1SL1xMRp+Up/OQzny0j7jfBJKAxMmAQdwWcNUIyPIeJjfZ+05OO9GrmJ2Msm9Yc7US0jkEeVpUlcrHf4kyQ7HUfB5rfXzJ9tlHaM/ysJz9qS7+xyEG/E3aCwv+6yYSYwEGi/BXbrNzidMqBF3NnqgkM7uNbqFvTkFFts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nc4tpqx9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nc4tpqx9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C36F1F000E9;
	Fri, 24 Jul 2026 08:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784880135;
	bh=O+VW2cfCFF5oO91veLDSao/U6QjnkKjxJJO9j3xHhLM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nc4tpqx9Cr5jK41/PGbYZUeQ3TH9gsROBqX79RnjOWa/Xu8Mck8HpLVNwKU5j+1Oj
	 98/n8sJ1APTy7XfLVLehvD4plepAzdKl2ccf2LzvIW/D2R6Ix6vkNpBBiKptARsgsG
	 RA2c920z+rIXdy2fdZWnqVVOft5FIR2UGZT83E6SJBkb/1su754ePwixruPuwZP5Ye
	 aPgsfAbax9Z1+Nrhkdnwbh648OFvPZW3Ic0xlIuTNyru5ITzM5yeN4gNOsvtoBeIz5
	 OFe5waZdilFKxX1j7cyRrngMw7Cx3DN6PNTFzfwQAIDYzyk+Ue5xqqWq9dHcZPMRmg
	 kmBnswdFvsuhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] media: nxp: imx8-isi: Implement per-stream
 reference counting for multiplexed streams
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guoniu Zhou" <guoniu.zhou@oss.nxp.com>
Cc: Frank.Li@kernel.org, media-ci@linuxtv.org, imx@lists.linux.dev
In-Reply-To: <20260724-isi-v4-1-27df7b5f6060@oss.nxp.com>
References: <20260724-isi-v4-0-27df7b5f6060@oss.nxp.com>
 <20260724-isi-v4-1-27df7b5f6060@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 08:02:14 +0000
Message-Id: <20260724080215.7C36F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing NULL pointer dereference in `mxc_isi_crossbar_xlate_s=
treams` when no remote pad is linked.
- [Medium] Using `BIT()` macro on 64-bit stream masks causes undefined beha=
vior on 32-bit architectures.
--

--- Patch [1]: [PATCH v4 1/3] media: nxp: imx8-isi: Implement per-stream re=
ference counting for multiplexed streams ---
commit f312b9be3591414051fb03d9e8651437e1f95ef2
Author: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

media: nxp: imx8-isi: Implement per-stream reference counting for multiplex=
ed streams

The ISI crossbar needs to properly enable multiple streams from different
virtual channels on the same input pad. This commit implements per-stream
state tracking by storing the input index and stream mask in the mxc_isi_pi=
pe
structure to properly manage hardware state on enable and disable operation=
s.

> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/dr=
ivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index c580c831972ec..d9146a361e7d7 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -318,11 +318,26 @@ static int mxc_isi_crossbar_set_routing(struct v4l2=
_subdev *sd,

[ ... ]

>  static int mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
>  					   struct v4l2_subdev_state *state,
>  					   u32 pad, u64 streams_mask)
>  {
>  	struct mxc_isi_crossbar *xbar =3D to_isi_crossbar(sd);
> +	struct mxc_isi_pipe *pipe =3D &xbar->isi->pipes[pad - xbar->num_sinks];
>  	struct v4l2_subdev *remote_sd;
>  	struct mxc_isi_input *input;
>  	u64 sink_streams;

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential NULL
pointer dereference in mxc_isi_crossbar_xlate_streams() which is called
from here.

If userspace configures routing that points to a disconnected sink pad and
then attempts to enable streams, media_pad_remote_pad_first() can return
NULL:

mxc_isi_crossbar_xlate_streams() {
	...
	pad =3D media_pad_remote_pad_first(&xbar->pads[sink_pad]);
	sd =3D media_entity_to_v4l2_subdev(pad->entity);
	if (!sd) {
	...
}

Does the immediate dereference of pad->entity crash the kernel before the
subsequent if (!sd) validation can handle the missing entity?

[Severity: Medium]
This is also a pre-existing issue in mxc_isi_crossbar_xlate_streams(), but I
noticed that BIT() is used on 64-bit stream masks:

mxc_isi_crossbar_xlate_streams() {
	...
		if (route->source_pad !=3D source_pad ||
		    !(source_streams & BIT(route->source_stream)))
			continue;

		sink_streams |=3D BIT(route->sink_stream);
	...
}

Since source_streams and sink_streams are u64, and BIT() evaluates to a
32-bit unsigned long on 32-bit architectures, can this cause an
out-of-bounds shift or incorrect stream mask calculations if userspace
uses stream IDs of 32 or greater?

Should BIT_ULL() be used instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-isi-v4-0-2=
7df7b5f6060@oss.nxp.com?part=3D1
