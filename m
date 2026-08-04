Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1BA4477FE;
	Tue,  4 Aug 2026 10:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785838860; cv=none; b=tA2rtlvFOKawEae56xuBCsSFsfuZ126wV4BdxbwE8BMF3ooF1RfhlDuu/cPR+q+lCPwS5C3qVGUv5fIqfO7aKUnNwkV1pt+WtUmQdN3oXIqIQrwXUa0aM0Kb4U7iN1TJtzrtyXU5WN5xdxAPeFxq+TD7EpavyNVxA6Mffh18yWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785838860; c=relaxed/simple;
	bh=OKIhwTY64GdqC+OHVzOdZZBJkSL2s8IgCRZLfRfX9Cg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bAgRrnt6baSSc1Co0LOR/ndPh7FHHaZSogKiXyiZwmxs1bdlhSDQepkpP4tFM0DfPR039VoDJSLGR6OmsojKYQ1AGtMAEW/bmtQsS4Ix7fEPCbbgK9wU1hM1xPqvg51xg2spWZXVpONYISTySgGbqEK1KEdzJIt1WqPvfZr8/0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/o6qvBb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/o6qvBb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AAA21F000E9;
	Tue,  4 Aug 2026 10:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785838859;
	bh=FLncK/GljeD2xIL3+xX4wvAdLxa0dy53g0Zoy4mAwt8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I/o6qvBbcF1b1ntQhQmPigJF17qPgoFXb/Sw9C1gb9fL+0FUpWLxmiiSdltIK5g2V
	 F2vQmnzooRgWwbqWLy6lkCMzf1JpN17BgnHv8+XBJz9YC0oiyfSfulYGhgSWWAhppL
	 UXmznzlW6jZA111CM64roHdemn7muCwFMLyV+nCj1/SkQ6meajL92BNW1dwGesrQhl
	 cJ0UTTg+NpPhgVyhPlc57TjrVGG0nqIXHQHKTMdvnM0ImoMjkSX4XkHkSEPvC3/pJZ
	 SoFxd66lJYw7QrhTrYuLbUOapbQl5m/aYaeqAmZfHBCKPscFaHBHGJzLPMylB6FaU9
	 rWk/SfGEtR4Pg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] ASoC: fsl_asrc: expose individual DAIs per
 conversion path
Reply-To: sashiko-reviews@lists.linux.dev
To: shengjiu.wang@oss.nxp.com
Cc: robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260804100218.49587-5-shengjiu.wang@oss.nxp.com>
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-5-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 10:20:55 +0000
Message-Id: <20260804102058.1AAA21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Latent use-after-free / state corruption bug triggered by resource=
 exhaustion: an hw_params error unconditionally releases a hardware pair ac=
tively used by another stream.
- [High] Changing Pair A's channel count via a DAI re-configuration instant=
ly corrupts Pair B's active conversion.
--

--- Patch [4]: [PATCH v3 4/5] ASoC: fsl_asrc: expose individual DAIs per co=
nversion path ---
commit 958c34d5b39a813baf5b15d76b95e94f278f4bf9
Author: Shengjiu Wang <shengjiu.wang@nxp.com>

ASoC: fsl_asrc: expose individual DAIs per conversion path

The patch replaces the single fsl_asrc_dai instance with an array of three
DAI drivers. This allows up to three independent conversion paths to be
active at the same time.

> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 2755ee57c6a17..a5d6c4c1e9292 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -792,27 +792,76 @@ static const struct snd_soc_dai_ops fsl_asrc_dai_op=
s =3D {
[ ... ]
> -static struct snd_soc_dai_driver fsl_asrc_dai =3D {
> -	.playback =3D {
[ ... ]
> +static struct snd_soc_dai_driver fsl_asrc_dai[] =3D {
> +	{
> +		.name =3D "asrc-0",
[ ... ]
> +	},
> +	{
> +		.name =3D "asrc-1",
[ ... ]
> +	},
> +	{
> +		.name =3D "asrc-2",

[Severity: High]
This isn't a bug introduced by this patch, but exposing 3 independent DAIs
allows multiple streams to run concurrently, making channel exhaustion and
-EBUSY in hw_params trivially reachable.

If a stream fails inside fsl_asrc_dai_hw_params() due to exhaustion, does
the cleanup path inadvertently disable another active stream?

Looking at fsl_asrc_dma_startup(), it requests a dummy pair and sets
pair->index (usually to 0), but does not clear it when released:

sound/soc/fsl/fsl_asrc_dma.c:fsl_asrc_dma_startup() {
    ...
    ret =3D asrc->request_pair(1, pair);
    ...
    if (pair)
        fsl_asrc_release_pair(pair);
}

If hw_params subsequently fails, the ALSA core calls fsl_asrc_dai_hw_free():

sound/soc/fsl/fsl_asrc.c:fsl_asrc_dai_hw_free() {
    ...
    if (pair)
        fsl_asrc_release_pair(pair);
}

Since pair->index is still 0 from the dummy request, wouldn't this blindly
disable Pair A, setting asrc->pair[0] =3D NULL and corrupting the global
channel_avail counter, even if Pair A is actively used by another DAI?


[Severity: High]
This is also a pre-existing issue, but allowing up to three independent
conversion paths to be active at the same time appears to violate a hardware
constraint regarding Pair B.

The driver documentation notes that Pair B depends on Pair A:

sound/soc/fsl/fsl_asrc.c:fsl_asrc_request_pair()
 * It assigns pair by the order of A->C->B because allocation of pair B,
 * within range [ANCA, ANCA+ANCB-1], depends on the channels of pair A

If Pair A is stopped and restarted with a different channel count while
Pair B is actively running, what prevents Pair B from being corrupted?

When fsl_asrc_config_pair() updates REG_ASRCNCR to change the ANCA value for
Pair A, won't Pair B's internal hardware channel offsets immediately shift
and disrupt its active conversion?

> +		.ops =3D &fsl_asrc_dai_ops,
>  	},
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804100218.4958=
7-1-shengjiu.wang@oss.nxp.com?part=3D4
