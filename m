Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC3244781F;
	Tue,  4 Aug 2026 10:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785838552; cv=none; b=hnLuCsGlSXTG7dm54412Ct+OoVz8+TMTdVz6HtaykHfRUeiAdOG5kLWX4qZCLerUqZ0f8QvvNOmTIrUEo1gaa4xySIcWL03O8FJp33Gn2TQa0ZUONiAslIIe9RqBWnCGSaUETtdZiA9R3JYGC87c9k1jdvU0hChwd9uWsQ6daEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785838552; c=relaxed/simple;
	bh=QkMeeuC4aYR5NtBiPr/AMIuNa9VApNayAIEyaiJ06KM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KNmtYQ8Lc5KAb2HqDuudfPdlWHWNJP1oeHhKyg301oaB1gSZHiOdEQK/E4kzpxqNaQT7dt1aXLXdqTlWVbJrf1NpsWpRdPAGYlXnUDVrYlBM3Yq0lnTZCReSNa/sgs+QNW94LML+acbZWS9ta7pFDSF+/rOloLHBW2Q+S0NNrSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZoOA2+f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZoOA2+f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D6B1F000E9;
	Tue,  4 Aug 2026 10:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785838550;
	bh=eCCGPUMSRuzwX5Bohm2/D9leG449NdMwyDltjDfaB/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RZoOA2+fY1W8K9Y4dP5PAljUIfwam/S0qNjMI47VNJPSfzjGdz0RJaD/N1qtqTAvY
	 3mnszkX4NuymQij5m3jcWen/Smb9E0Pqoor7bt9zPGX/6pk0GQeOJxqO9cbLHEtJnJ
	 J1a3ghzLSqot5Vy2TePhPXOqEE5kNKnX9QDdUx4ea6RQsM4zKQMw/E5oHFQ1XO07PK
	 O4zRLcRXdEiAmUfm10Wdqw+HGVTcnI1W8YCS8SZk4JMsMRqtWq6X3eoA5p143F1qoD
	 U3CdcJV8vzZu1+QLJNBqfHxHDBYlktgXerSCA5c5XerV30K8sUMU0L+4ncUNUs/UdX
	 9QfKRvmejSShw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] ASoC: fsl_asrc/fsl_easrc: move DMA params into
 pair/context struct
Reply-To: sashiko-reviews@lists.linux.dev
To: shengjiu.wang@oss.nxp.com
Cc: robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804100218.49587-4-shengjiu.wang@oss.nxp.com>
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-4-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 10:15:47 +0000
Message-Id: <20260804101547.D4D6B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Critical] Use-After-Free and Write-After-Free due to shared CPU DAI `dma=
_data` being overwritten by concurrent substreams.

Pre-existing issues:
- [High] Failed `hw_params` requests cause `hw_free` to unconditionally rel=
ease a stale pair index, potentially disabling another active stream's hard=
ware context.
--

--- Patch [3]: [PATCH v3 3/5] ASoC: fsl_asrc/fsl_easrc: move DMA params int=
o pair/context struct ---
commit 4551053ba617a888e5b04cb058570e71617e9706
Author: Shengjiu Wang <shengjiu.wang@nxp.com>

ASoC: fsl_asrc/fsl_easrc: move DMA params into pair/context struct

This patch moves the DMA parameters for transmit and receive paths from
the shared fsl_asrc structure into the per-pair structure. This aims to
prevent concurrent stream initializations from overwriting each other's
addresses and maxburst values. Redundant per-DAI probe callbacks are
removed as well.

> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index df4817ae91b18..2755ee57c6a17 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
[ ... ]
> @@ -781,18 +781,7 @@ static int fsl_asrc_dai_trigger(struct snd_pcm_subst=
ream *substream, int cmd,
>  	return 0;
>  }
> =20
> -static int fsl_asrc_dai_probe(struct snd_soc_dai *dai)
> -{
> -	struct fsl_asrc *asrc =3D snd_soc_dai_get_drvdata(dai);
> -
> -	snd_soc_dai_init_dma_data(dai, &asrc->dma_params_tx,
> -				  &asrc->dma_params_rx);
> -
> -	return 0;
> -}
> -
>  static const struct snd_soc_dai_ops fsl_asrc_dai_ops =3D {
> -	.probe		=3D fsl_asrc_dai_probe,
>  	.startup	=3D fsl_asrc_dai_startup,
>  	.hw_params	=3D fsl_asrc_dai_hw_params,
>  	.hw_free	=3D fsl_asrc_dai_hw_free,

[Severity: High]
This is a pre-existing issue, but could a failure in fsl_asrc_dai_hw_params=
()
cause problems here in fsl_asrc_dai_hw_free()?

If fsl_asrc_request_pair() fails during hw_params (e.g. because no channels
are available), the ALSA core automatically calls fsl_asrc_dai_hw_free() to
clean up:

	if (pair)
		fsl_asrc_release_pair(pair);

Since pair->index still retains the stale index of the dummy pair acquired
and released earlier in fsl_asrc_dma_startup(), this unconditionally releas=
es
that index:

	regmap_update_bits(asrc->regmap, REG_ASRCTR,
			   ASRCTR_ASRCEi_MASK(index), 0);

If another concurrent stream has since acquired that pair index, could this
abruptly stop its hardware conversion and corrupt its state?

> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index 38f2b7c63133a..64d66420e7ada 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -390,6 +390,20 @@ static int fsl_asrc_dma_startup(struct snd_soc_compo=
nent *component,
> =20
>  	runtime->private_data =3D pair;
> =20
> +	/*
> +	 * Point the cpu DAI dma_data at the per-pair params so that
> +	 * concurrent hw_params calls on different pairs each write to
> +	 * their own struct and do not race on addr/maxburst.  Use the
> +	 * per-direction setters so that a concurrent open of the other
> +	 * direction on the same DAI does not NULL out its pointer.
> +	 */
> +	if (tx)
> +		snd_soc_dai_dma_data_set_playback(snd_soc_rtd_to_cpu(rtd, 0),
> +						  &pair->dma_params);
> +	else
> +		snd_soc_dai_dma_data_set_capture(snd_soc_rtd_to_cpu(rtd, 0),
> +						 &pair->dma_params);
> +

[Severity: Critical]
Does this code overwrite the shared CPU DAI's dma_data pointer with a
per-substream dynamically allocated pointer?

Since the CPU DAI is shared across multiple substreams, if this startup
sequence fails later (e.g. no channels available) and kfree(pair) is called
in the error path:

	if (release_pair)
		kfree(pair);

Could this leave the CPU DAI with a dangling pointer?

Similarly, when a stream is closed and fsl_asrc_dma_shutdown() calls
kfree(pair), does it leave any remaining active streams with a dangling
pointer in the shared DAI, leading to a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804100218.4958=
7-1-shengjiu.wang@oss.nxp.com?part=3D3
