Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680E83955F6
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 03:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784518954; cv=none; b=jPcf6DYp/DrADs69ufTchNuYwiJaJYfi1JyNZNpM3VspK0YMDXhUhM7agcktJi6wysFjyouxbcFJT42y6pjrzmR37WWJe0m4y3y3q08evSxdZMYatw7bUm3RUuugx5KKX9BB5RVzUWX7icRxolyJaCWoX2LBeelCyknOb0SnqCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784518954; c=relaxed/simple;
	bh=78CCLJIPuXn3N3Y7Jw2cWa4X9YYgPGz0X9sOnCZVpAA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gAjdzA/C223bZeqe2XrvziOPJWh6w1aStWpS1YqW52Nlp6UGTLkphMgdVRaGYvkML54ZXYLtNR+7DDNdw5SPcytXZ4gNPt8DrWRpyIwnNDjESOGCEgqaxOEuq2we+xXA7SqJNwgVUNC/caVdgt6IS4jk/FRFsuhCSvkAUoWtWfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KarMIW2d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KarMIW2d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC2331F00A3A;
	Mon, 20 Jul 2026 03:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784518953;
	bh=Mmeg0pCDLjQDHj1U3Gx1Eg8JRqopdRg61BZGQIHR3OU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KarMIW2dknX7Irmf6p156aiTl11t8LHPZ9GfwSNV96lbKZ3kLGa2U9fkO2weuJQtw
	 B7yFmU5d2G8+zxmVtdxeMzzlG75mwG9rH0vOFz0ePIbnCevrl1muEkf08P05fSN51e
	 UQJnOHj4+AASPVChddri2jzgn1xwGzf2PJyO8c5ZhP8tTe7WfXqE3oSxPVikVtmSm3
	 1nclFYO+94k7uONCHtF2a1JVosDbuqTNuSH5gIyvslk8LQb9W9R+PCg0faAhLbwa1N
	 nxZAVdQd9ozwHQNLktrxe859FpduEjHDKYYzKUy514kaomdesG2PnsP+9R8hxlRVrK
	 9p3/Qz4O66FqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/6] media: nxp: imx8-isi: Add stream ID validation
 for crossbar routing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guoniu Zhou" <guoniu.zhou@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260720-isi-v2-2-45845bc5d4fa@oss.nxp.com>
References: <20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com>
 <20260720-isi-v2-2-45845bc5d4fa@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 03:42:32 +0000
Message-Id: <20260720034232.CC2331F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver uses the `BIT()` macro on 64-bit stream masks (`source_=
streams` and `sink_streams`), which will cause undefined behavior on 32-bit=
 platforms if the stream ID exceeds 31.
--

--- Patch [2]: [PATCH v2 2/6] media: nxp: imx8-isi: Add stream ID validatio=
n for crossbar routing ---
commit d756aed8e216cd683009378d45743e6351a90389
Author: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

media: nxp: imx8-isi: Add stream ID validation for crossbar routing

This commit adds validation to enforce hardware constraints in the crossbar
routing configuration. It ensures that the SOURCE stream is strictly set to
0, as ISI pipes are hardcoded to stream 0. It also ensures memory input
respects routing limitations to the first pipeline.

> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/dr=
ivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 84871bceb31db..328d08a278eaf 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -106,8 +106,20 @@ static int __mxc_isi_crossbar_set_routing(struct v4l=
2_subdev *sd,
>  	if (ret)
>  		return ret;
> =20
> -	/* The memory input can be routed to the first pipeline only. */
> +	/*
> +	 * Validate routes against hardware constraints:
> +	 * - SOURCE stream must be 0 (pipes are hardcoded to stream 0)
> +	 * - Memory input can only route to the first pipeline
> +	 */
>  	for_each_active_route(routing, route) {
> +		if (route->source_stream !=3D 0) {

[Severity: High]
This is a pre-existing issue, but while reviewing this stream ID validation,
I noticed a potential bit shift overflow regarding stream IDs in the related
mxc_isi_crossbar_xlate_streams() function:

drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:mxc_isi_crossbar_xl=
ate_streams() {
    ...
    if (!(source_streams & BIT(route->source_stream)))
        ...
    sink_streams |=3D BIT(route->sink_stream);
    ...
}

Does this code cause undefined behavior on 32-bit platforms if userspace
provides a V4L2 routing configuration with a sink_stream or source_stream
greater than or equal to 32?

Since the BIT() macro evaluates to a 32-bit value on 32-bit architectures,
shifting it by 32 or more results in a bit shift overflow. This could allow
the compiler to make unsafe optimization assumptions, potentially corrupting
the 64-bit stream mask logic.=20

Should this use BIT_ULL() instead?

> +			dev_dbg(xbar->isi->dev,
> +				"route to pipe %u must use source_stream=3D0, got %u\n",
> +				route->source_pad - xbar->num_sinks,
> +				route->source_stream);
> +			return -ENXIO;
> +		}
> +
>  		if (route->sink_pad =3D=3D xbar->num_sinks - 1 &&
>  		    route->source_pad !=3D xbar->num_sinks) {
>  			dev_dbg(xbar->isi->dev,
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-isi-v2-0-4=
5845bc5d4fa@oss.nxp.com?part=3D2
