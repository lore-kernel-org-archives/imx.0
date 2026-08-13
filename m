Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F8935975;
	Thu, 13 Aug 2026 07:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786605007; cv=none; b=AcYs4yKuY/PqmNFzee+llPf16E6dtzXPyL6tkYCBrTRqqpKvrDQAqshbhopiqp/B+JANeBozlkHdn5z0I22gbxXjOoBgk/UEJ2wn2811+aOpdtHVOt6rLGsAjhhi6naGHMUENJ2pYzmSpyTAg9dM6XviC4BIBPkCmIdclJHqllE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786605007; c=relaxed/simple;
	bh=wU0ElJgkipOpbQL5BgWFIyTctxTPVLgyAOtX5JhAOWo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nydbmdE1py5G98PABKhvmQ6Yfnzr7BtgCAYMgZ8wLnHaxdAnSugqMuj2GvScQ5OzEIkwXRIQjc5NHLP+Ar8KBG1fkEvVeuIbbidqGsUw2tCsGOAqTH8M/ockMtPJhVrcFAJM07jPzxqSqnOCrxcoAjeyY9mxsFh4k7F4tyLehho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MbJfMCuV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MbJfMCuV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700121F000E9;
	Thu, 13 Aug 2026 07:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786605005;
	bh=g4dpzrpHL3cZPI+w49xPJljTPpUU+dSxgKjzWxT6vqk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MbJfMCuVIV/g0i0nkAGljD77F0r+LE+EBt+mricvwu+gVi33WMR6M78kLePVQGUaO
	 v5K19pwjKFjln23XOWmdEj32WXMRlkBO+jLCLHa8egGTZKH8cvyThs9kA8tQ7hOyOy
	 O3JrGyt+T8CJCBtz831WrTiPIrrih8CgLbOQYf7iK6XSFUZ0oqLqXMv7WLE1O/o+qN
	 rL56YPwciTsfhczS30CtPxS3SXXtnmTunpyFK7APYWZob+uIm8jIwu5ynw3DCBJsl/
	 dUVd6G25Fo437yP0FUQsjLi7fB5wg3h3va0np2QIpUp/fgyYr89AN7EpTlKPOiYumB
	 Katbmw+qwr6oQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/5] ASoC: fsl_easrc: expose individual DAIs per
 conversion path
Reply-To: sashiko-reviews@lists.linux.dev
To: shengjiu.wang@oss.nxp.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260813070020.719810-6-shengjiu.wang@oss.nxp.com>
References: <20260813070020.719810-1-shengjiu.wang@oss.nxp.com>
 <20260813070020.719810-6-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 07:10:05 +0000
Message-Id: <20260813071005.700121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Read-Modify-Write (RMW) on a Write-1-to-Clear (W1C) interrupt stat=
us register causes unintentional clearing of concurrent interrupt flags.
- [High] Calling hw_params multiple times for the same stream leaks EASRC h=
ardware contexts and available channels, leading to Use-After-Free (UAF).
--

--- Patch [5]: [PATCH v4 5/5] ASoC: fsl_easrc: expose individual DAIs per c=
onversion path ---
commit 6668df3f25b7ce9103114dd835e72d2e72b096cc
Author: Shengjiu Wang <shengjiu.wang@nxp.com>

ASoC: fsl_easrc: expose individual DAIs per conversion path

The i.MX EASRC hardware supports four independent conversion contexts.
This commit replaces the single fsl_easrc_dai instance with an array of
four DAI drivers to allow up to four independent conversion paths to be
active at the same time.

> diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
> index 2b8319b8a609a..c2f0524e949e9 100644
> --- a/sound/soc/fsl/fsl_easrc.c
> +++ b/sound/soc/fsl/fsl_easrc.c
> @@ -1589,27 +1589,99 @@ static const struct snd_soc_dai_ops fsl_easrc_dai=
_ops =3D {
>  	.hw_free	=3D fsl_easrc_hw_free,
>  };
> =20
> -static struct snd_soc_dai_driver fsl_easrc_dai =3D {
[ ... ]
> +static struct snd_soc_dai_driver fsl_easrc_dai[] =3D {
> +	{
> +		.name =3D "easrc-0",
[ ... ]
> +	{
> +		.name =3D "easrc-3",
> +		.playback =3D {
> +			.stream_name =3D "ASRC3-Playback",
> +			.channels_min =3D 1,
> +			.channels_max =3D 32,
> +			.rate_min =3D 8000,
> +			.rate_max =3D 768000,
> +			.rates =3D SNDRV_PCM_RATE_KNOT,
> +			.formats =3D FSL_EASRC_FORMATS,
> +		},
> +		.capture =3D {
> +			.stream_name =3D "ASRC3-Capture",
> +			.channels_min =3D 1,
> +			.channels_max =3D 32,
> +			.rate_min =3D 8000,
> +			.rate_max =3D 768000,
> +			.rates =3D SNDRV_PCM_RATE_KNOT,
> +			.formats =3D FSL_EASRC_FORMATS |
> +				   SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE,
> +		},
> +		.ops =3D &fsl_easrc_dai_ops,
>  	},
> -	.ops =3D &fsl_easrc_dai_ops,
>  };

[Severity: High]
This isn't a bug introduced by this patch, but since multiple DAIs now
allow concurrent streams, could this read-modify-write operation in
fsl_easrc_stop_context() cause issues with interrupt handling?

sound/soc/fsl/fsl_easrc.c:fsl_easrc_stop_context() {
	...
	regmap_write_bits(easrc->regmap,
			  REG_EASRC_IRQF,
			  EASRC_IRQF_RSD(1 << ctx->index),
			  EASRC_IRQF_RSD(1 << ctx->index));
	...
}

Because REG_EASRC_IRQF is a write-1-to-clear register, will this write
1s back to all currently pending interrupt flags?

If two streams stop simultaneously, could one CPU unintentionally clear
the run-stop-done bit of the other context, causing the other CPU's
polling loop to time out?

[Severity: High]
This is a pre-existing issue, but with up to four independent conversion
paths active, is it possible to leak hardware contexts if the ALSA core
calls hw_params multiple times for the same stream?

In sound/soc/fsl/fsl_easrc.c:fsl_easrc_hw_params():

	ret =3D fsl_easrc_request_context(channels, ctx);

This unconditionally assigns a new context. Then in
fsl_easrc_request_context():

	ctx->index =3D index;
	ctx->channels =3D channels;
	easrc->pair[index] =3D ctx;
	easrc->channel_avail -=3D channels;

If hw_params is called multiple times without an intermediate hw_free,
won't this leak channels and leave a dangling pointer in the old slot
when ctx is eventually freed?

> =20
>  static const struct snd_soc_component_driver fsl_easrc_component =3D {
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813070020.7198=
10-1-shengjiu.wang@oss.nxp.com?part=3D5
