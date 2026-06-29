Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E48BA45
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 07:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782719509; cv=none; b=GVzN2kwgOI8tOLbUftg/XAEAtpAD3yb0Q9yLeOaKBTuhlVpUMAxm47XUdG82/mYKsyVobDD+PyGX01ylB3f+UY+cIZQiVuL2f9dqRLjbYThbcelpvuch8398tqjzXxYA8gtF++STF4/o14B0LgRo3W5Qb6lsMJt/VFe5qsWfOfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782719509; c=relaxed/simple;
	bh=KMwOXPGD6Ik0pDijAjj3YOR3m+J1B3DZ1mQWKgm45lI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xgm6tAqbm0lFiWFITL/ShoPyrG68lf4IDODCa3hj5O62G/gsQiDjW9hXR6cOQyHBf2wBAwe9h16sAiHF+zm7G/bXCMVBJ0LVb2dT16dqqvNSeF4Bah3KSGXhxxzdJ4/y48q9CRS96UuQpRJye5axQ8KNiF4gjChKDeDbb2fkudM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fn6nHoFA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fn6nHoFA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D46C1F000E9;
	Mon, 29 Jun 2026 07:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782719508;
	bh=mqH6VyZN3Pbunu+oVzQMF7luivcMhMAnPtGNN/SCZAg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fn6nHoFANPS8sz1CzPdg4rme4KIg7jy+f5J/nzUt+2TgsiN86OXTts154m1XWfXzf
	 6afwMB/zBlfpRELwmz0wDwMXUixqs/7paUm4pfNE4gL61n2Cszj4MLPEWetxXB3edX
	 7k7ymm4m/3dZrisBSAza9XDm49XtR2JXFwFw+grfi8FLseRYey/iobWQj275h7Wb0H
	 L4mhzl5RK+hlYtVY5DIED/wc0ZD6UdftereI8woBSEobzCwe/mwNtUzcENxGnpqAdT
	 pIbSLU2ErDFd7MKKtb5YRpv7JGchyH2k3Px952FYpStbscTqjLoHqHs9EY3P+/3Zqf
	 uc3sYwlY7nYJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] media: nxp: imx8-isi: Fix stream ID validation
 bypass in crossbar routing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guoniu Zhou" <guoniu.zhou@oss.nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260629-isi-v1-1-deebfdb1b07b@oss.nxp.com>
References: <20260629-isi-v1-0-deebfdb1b07b@oss.nxp.com>
 <20260629-isi-v1-1-deebfdb1b07b@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 07:51:47 +0000
Message-Id: <20260629075148.2D46C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The validation incorrectly restricts the crossbar sink stream ID (=
`route->sink_stream`) using the number of downstream ISI pipelines (`xbar->=
num_sources`), which breaks valid MIPI CSI-2 Virtual Channel routing and ex=
poses unsupported hardware states.
--

commit 53e2d411183facaf6d43d260ebd9674b6c727a89
Author: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

media: nxp: imx8-isi: Fix stream ID validation bypass in crossbar routing

This commit fixes a bug where the crossbar routing validation checked the
currently active routing table instead of the new one provided by userspace.
It also adds hardware constraint validation for source and sink streams.

> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/dr=
ivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c

[ ... ]

> @@ -106,8 +106,28 @@ static int __mxc_isi_crossbar_set_routing(struct v4l=
2_subdev *sd,
>  	if (ret)
>  		return ret;
> =20
> -	/* The memory input can be routed to the first pipeline only. */
> -	for_each_active_route(&state->routing, route) {
> +	/*
> +	 * Validate routes against hardware constraints:
> +	 * - SOURCE stream must be 0 (pipes are hardcoded to stream 0)
> +	 * - SINK stream must be < ISI channel count
> +	 * - Memory input can only route to the first pipeline
> +	 */
> +	for_each_active_route(routing, route) {
> +		if (route->source_stream !=3D 0) {
> +			dev_dbg(xbar->isi->dev,
> +				"route to pipe %u must use source_stream=3D0, got %u\n",
> +				route->source_pad - xbar->num_sinks,
> +				route->source_stream);
> +			return -ENXIO;
> +		}
> +
> +		if (route->sink_stream >=3D xbar->num_sources) {

[Severity: High]
Does this incorrectly restrict the sink stream ID using the number of
downstream pipelines (xbar->num_sources) instead of the actual MIPI CSI-2
Virtual Channel limit?

This appears to break valid V4L2 routing configurations for MIPI CSI-2
Virtual Channels 1-3 on SoC variants with a single processing pipeline
(e.g., i.MX8MN) where num_sources is 1.

Conversely, for SoCs with multiple pipelines, this might enable invalid
routes (stream IDs up to 7, exceeding the hardware's 2-bit limit) that
will silently fail since the capture logic remains hardcoded to Virtual
Channel 0.

> +			dev_dbg(xbar->isi->dev,
> +				"sink_stream %u exceeds hardware limit %u\n",
> +				route->sink_stream, xbar->num_sources - 1);
> +			return -ENXIO;
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-isi-v1-0-d=
eebfdb1b07b@oss.nxp.com?part=3D1
