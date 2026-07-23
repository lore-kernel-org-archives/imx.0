Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC8C30F927;
	Thu, 23 Jul 2026 02:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784774715; cv=none; b=AS9HK1cA0f6HWsCYJ0BmqxSqqBuzsz7dg88vMpcWh6/VawTqQtmCuQxdPQA3zPAPSWJdffDaVmCnxyTdunsKBPReo0FHqyfCfEqRcOyVMjwTD2ENYgA6unU6lmJTDrftL0+AnaulyqJBajJVYomi1N6ODttVk3Tgpx1P2BAQUno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784774715; c=relaxed/simple;
	bh=NWeZhNrPFZboRMJXRhfG5niTIqzO29fNRcpNQTZuQzc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qEPTowf2xoWgYjkUgzxg2i1cu5Nt0OHMUsYvyRzIkxspBX193YUbRvTZPx8eS5XQwHEgQpoc4K4V327cBzJNanJVdYpA99bJK74xouaw5OcO0JoWg9lfrc6xQm4ZdmyFBBikxQoKZmDbZabo422I2Z/fAvBuD5atdvJ/sT6VPtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBZcpiIM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBZcpiIM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271021F00A3A;
	Thu, 23 Jul 2026 02:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784774713;
	bh=CTZbrfl/WDIWC+O0IsSAlp/JgKxzM74U9IQSJ+1gf74=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SBZcpiIMYgOSyahSiGbR57ZGc8jTfJHF1LWnD/4cge6ugOIZwMRrKwqt49pCkJrbE
	 tBkayvPzecLpda2fvyu2oauPWGnVSSW9UbBSC7BMvT8zYyYrZELXy6eAz1nLFsZgV9
	 rbelOb/LJYmM3/ZvgomnYWnduL/ZjK1Sah16aP5k6Xm8kwjTE27FrBAW2UA/72rklC
	 IT3sQIC5PujASw+jzEXN1GOhuw5zB5+vp3seEwqBpxBV2XWyA5wSGmJtcTpbI/7NHw
	 o3dQrUgjmb8h5W/W2RVN2u7vlpPsFdJ3hMS6cbxqvx79tDZLdSJU4Dz2k7ryJ/6pGI
	 N1Z6iczBRQkpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] ASoC: fsl_asrc: expose individual DAIs per
 conversion path
Reply-To: sashiko-reviews@lists.linux.dev
To: shengjiu.wang@oss.nxp.com
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260723022313.1905051-5-shengjiu.wang@oss.nxp.com>
References: <20260723022313.1905051-1-shengjiu.wang@oss.nxp.com>
 <20260723022313.1905051-5-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 02:45:12 +0000
Message-Id: <20260723024513.271021F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calling `hw_params` multiple times leaks channel availability, exh=
austs pair slots, and leaves dangling pointers leading to Use-After-Free.
--

--- Patch [4]: [PATCH v2 4/5] ASoC: fsl_asrc: expose individual DAIs per co=
nversion path ---
commit f590fa927b95ce1e6a86c0ad704e429857c29260
Author: Shengjiu Wang <shengjiu.wang@nxp.com>

ASoC: fsl_asrc: expose individual DAIs per conversion path

The i.MX ASRC hardware supports three independent conversion pairs. This
commit replaces the single fsl_asrc_dai instance with an array of three DAI
drivers to allow independent conversion paths to be active simultaneously,
retaining backward compatibility for asrc-0.

> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 2755ee57c6a17..a5d6c4c1e9292 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
[ ... ]
> @@ -792,27 +792,76 @@ static const struct snd_soc_dai_ops fsl_asrc_dai_op=
s =3D {
>  				 SNDRV_PCM_FMTBIT_S16_LE | \
>  				 SNDRV_PCM_FMTBIT_S24_3LE)
> =20
> -static struct snd_soc_dai_driver fsl_asrc_dai =3D {
> -	.playback =3D {
[ ... ]
> +static struct snd_soc_dai_driver fsl_asrc_dai[] =3D {
> +	{
> +		.name =3D "asrc-0",
> +		.playback =3D {
> +			.stream_name =3D "ASRC-Playback",
> +			.channels_min =3D 1,
> +			.channels_max =3D 10,
> +			.rate_min =3D 5512,
> +			.rate_max =3D 192000,
> +			.rates =3D SNDRV_PCM_RATE_KNOT,
> +			.formats =3D FSL_ASRC_FORMATS |
> +				   SNDRV_PCM_FMTBIT_S8,
> +		},
> +		.capture =3D {
> +			.stream_name =3D "ASRC-Capture",
> +			.channels_min =3D 1,
> +			.channels_max =3D 10,
> +			.rate_min =3D 5512,
> +			.rate_max =3D 192000,
> +			.rates =3D SNDRV_PCM_RATE_KNOT,
> +			.formats =3D FSL_ASRC_FORMATS,
> +		},
> +		.ops =3D &fsl_asrc_dai_ops,

[Severity: High]
This is a pre-existing issue, but since this patch exposes multiple DAIs th=
at
share these operations, could calling hw_params multiple times on an open
stream lead to a use-after-free?

ALSA allows userspace to call SNDRV_PCM_IOCTL_HW_PARAMS multiple times.
Looking at fsl_asrc_dai_hw_params(), it unconditionally requests a new pair:

sound/soc/fsl/fsl_asrc.c:fsl_asrc_dai_hw_params() {
    ...
	ret =3D fsl_asrc_request_pair(channels, pair);
	if (ret) {
    ...
}

In fsl_asrc_request_pair(), the loop finds the next NULL slot, skipping any
slot that already contains the same pair pointer:

sound/soc/fsl/fsl_asrc.c:fsl_asrc_request_pair() {
    ...
	for (i =3D ASRC_PAIR_A; i < ASRC_PAIR_MAX_NUM; i++) {
		if (asrc->pair[i] !=3D NULL)
			continue;

		index =3D i;
    ...
}

Does this populate multiple slots in asrc->pair[] with the same pointer whi=
le
overwriting pair->index with the newest index?=20

If so, when the stream is closed, fsl_asrc_dma_shutdown() clears only the
latest index before freeing the pair. Older slots might permanently retain
pointers to the freed memory, leading to a use-after-free when fsl_asrc_isr=
()
or fsl_asrc_m2m_suspend() iterates over the pairs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723022313.1905=
051-1-shengjiu.wang@oss.nxp.com?part=3D4
