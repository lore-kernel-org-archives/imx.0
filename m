Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0852E395AE7;
	Mon, 20 Jul 2026 10:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784543624; cv=none; b=GwQjIw41XhrDKFdOTXLbA1M388sgy++Fnx8nIhetPif1jtY+xT4ntDmwU14kDN1h/70YByNPA1C2c5kC/h69Chl5el/2P1rQLhtR7ceokCXRI6ASViMsJ6+/YDaXs9K2txsOAAPJpVWek9cXLiCaIfQMZe/Jplexc8k3mTI5dLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784543624; c=relaxed/simple;
	bh=cmzbzGJRWjbJ5VG6d3ZkYIr5P7R4/vswxfsA0G08Nm8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZsAv/zJFXzyo7RJe2/gB6CMDxOv57QnDtSg8eMoyXnjAPSBe+vHLCyA9CpLHKwY6F3Gczgd98FS3enjSH2VhSBg9FEVLaFePfYvoY2HabDDf79stsvWPnLr3s5xXUBBwCwZ16iqGoDcqvbmQCdbVq11J4UH6YbDR2/vla0CQnOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/E7Rg8t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/E7Rg8t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A751F00A3E;
	Mon, 20 Jul 2026 10:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784543622;
	bh=JMt/Vf1aO0LyFc1X57tt9vGZLV1FnvlV8s5bAIKnLbI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V/E7Rg8tf7Y/q8W39EcG3/qBd0pRkZuslA2VSEuY5v60Pb9J5Keo20W2YMFspmOzd
	 GW5SAftLCjqu3DvGNIE06j58ulvFhlMWRFsa3WL/akZnY71e2u03ihbPrmQF6Youef
	 8O2/TAP8PhMFeEg1x/5kRHD+RNZ/iy0F76/q1+CA0WUa9ntykPED4Pb0wabz8CALIG
	 b1GZnamVecUJIxCKJnK9fZiTJEn/Simy5vHil6RQrbfec03VfsCXE/f/dm1Z+MvByP
	 p7wYTunokguFqKOtEkMmEwSO4k48Q9vEuHKmWdc2Cj32DAD56FjjupZ5egD9zHkeAP
	 LPP27dBP1V9jA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] ASoC: fsl_asrc: expose individual DAIs per
 conversion pair
Reply-To: sashiko-reviews@lists.linux.dev
To: shengjiu.wang@oss.nxp.com
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260720095450.1618747-4-shengjiu.wang@oss.nxp.com>
References: <20260720095450.1618747-1-shengjiu.wang@oss.nxp.com>
 <20260720095450.1618747-4-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 10:33:41 +0000
Message-Id: <20260720103342.41A751F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly registered DAIs (`paira`, `pairb`, `pairc`) share the ex=
act same `dma_params_tx` and `dma_params_rx` structures, causing a data rac=
e and potential DMA misconfiguration when multiple streams are configured c=
oncurrently.
--

--- Patch [3]: [PATCH 3/4] ASoC: fsl_asrc: expose individual DAIs per conve=
rsion pair ---
commit 71178f6edf2667b8ee88b95ef47b739e170cca4b
Author: Shengjiu Wang <shengjiu.wang@nxp.com>

ASoC: fsl_asrc: expose individual DAIs per conversion pair

The i.MX ASRC hardware supports three independent conversion pairs
(A, B, C). This commit replaces the single fsl_asrc_dai instance
with an array of three DAI drivers, one per pair, allowing them
to be routed to separate audio paths simultaneously.

> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 0b28bcfa47fed..f83d6cdc6412d 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c

[ ... ]

> @@ -1404,7 +1453,7 @@ static int fsl_asrc_probe(struct platform_device *p=
dev)
>  		goto err_pm_get_sync;
> =20
>  	ret =3D devm_snd_soc_register_component(&pdev->dev, &fsl_asrc_component,
> -					      &fsl_asrc_dai, 1);
> +					      fsl_asrc_dai, ARRAY_SIZE(fsl_asrc_dai));

[Severity: High]
Since this registers multiple DAIs to enable concurrent stream access, can =
this
cause a data race with the shared DMA parameters?

In fsl_asrc_dai_probe(), all three DAIs are assigned pointers to the exact =
same
shared DMA parameter structures:

	snd_soc_dai_init_dma_data(dai, &asrc->dma_params_tx,
				  &asrc->dma_params_rx);

When multiple streams are configured concurrently, they will race to overwr=
ite
these shared parameters without locking.

For example, in fsl_asrc_dma_hw_params():

	dma_params_fe =3D snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), sub=
stream);
	dma_params_fe->addr =3D asrc->paddr + asrc->get_fifo_addr(!dir, index);
	dma_params_fe->maxburst =3D dma_params_be->maxburst;

Could this concurrent mutation cause DMA channels to be programmed with inc=
orrect
FIFO addresses or maxburst values, resulting in audio cross-talk or DMA eng=
ine
errors?

>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to register ASoC DAI\n");
>  		goto err_pm_get_sync;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720095450.1618=
747-1-shengjiu.wang@oss.nxp.com?part=3D3
