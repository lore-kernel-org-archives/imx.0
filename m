Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15243395AE7;
	Mon, 20 Jul 2026 10:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544249; cv=none; b=rWmK4vxkZzTfkRYvPZ9EOBYStr+l+DMHeoBvi2KnwcvFkI82450PFcQXI/F3ifBkfl0S7O+ocVXJyGGet4Lh+/ctTc1AsOuB/iEKoDmMWTX26yFJAYHh2I43/GRgGb3AWiEFQPjZ8T8HuTirobGMi8i5Au+J9p57EPEqtWgY+MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544249; c=relaxed/simple;
	bh=0m5B3vwF7z4fRpqYIZlimSTaC25mcaqh7qpfgro4Y0Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IqrmJ9Bw2VxgsMAADxtyY8Ys9AYdCxg3b4QmewI9M6wqzXw5SAcHME26UvRYIEIuFMDrMUbJ6e7Qs/EJn1q2TY54ad0B1JxIkvccG0LeW/gHB4Z2vN0ItEBW8U0/ZDcBk3OsInpz9ZCKIByGNMCga/TOXxbJsgAR4zgv5L7XeDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZEGrFl/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZEGrFl/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CB81F00A3A;
	Mon, 20 Jul 2026 10:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784544238;
	bh=bRNhVGsHuJz/YeYq8Oanym3rSXeRbTx0fwcc9IsR6Ao=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EZEGrFl/mcCIA/i+T4DTWQu6O6gXd9EwJT8XzMz8JgOwCJePAErIuqKfQ+Q4deRcC
	 NgjQbj3PYTUB34xNjc8DLAo+caUa+VKTao3Vyri24fctQ2xvpBGpk8Rdgef5O0/qzj
	 Hebwc0YI8H7NSz3YjdqYVNX0v3nnaf5tpR7XkIm3mqvpj/Ut77ozkqI+cCY2wrdhET
	 6w6uFP+TI4LG+q4ddj40zueendnTwx4B5pnAvWb9GBHychWJHqiM/+SjxOTKE/M21/
	 2ho7yCHE7UAdBSzqx+oIh7thplY+UfL3eOcUc6TNgr9XWF8Q6jFBJBcuc5SWtY/2nU
	 ShsMw8jX7z6Og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] ASoC: fsl_easrc: expose individual DAIs per
 conversion context
Reply-To: sashiko-reviews@lists.linux.dev
To: shengjiu.wang@oss.nxp.com
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720095450.1618747-5-shengjiu.wang@oss.nxp.com>
References: <20260720095450.1618747-1-shengjiu.wang@oss.nxp.com>
 <20260720095450.1618747-5-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 10:43:58 +0000
Message-Id: <20260720104358.77CB81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Concurrent streams will cause a data race on the shared `dma_param=
s_tx` and `dma_params_rx` structures, leading to incorrect DMA FIFO address=
 configuration and state corruption.
--

--- Patch [4]: [PATCH 4/4] ASoC: fsl_easrc: expose individual DAIs per conv=
ersion context ---
commit 8f522766ccdfc101a1c60ab6f34e2623d03f39d0
Author: Shengjiu Wang <shengjiu.wang@nxp.com>

ASoC: fsl_easrc: expose individual DAIs per conversion context

The i.MX EASRC hardware supports four independent conversion contexts
(A, B, C, D). The driver previously registered a single DAI with generic
stream names "ASRC-Playback" and "ASRC-Capture", which prevents
individual contexts from being routed to separate audio paths
simultaneously. This commit replaces the single fsl_easrc_dai instance=20
with an array of four DAI drivers.

> diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
> index 15a3424967601..dd0c3046a0075 100644
> --- a/sound/soc/fsl/fsl_easrc.c
> +++ b/sound/soc/fsl/fsl_easrc.c

[ ... ]

> @@ -2245,7 +2317,7 @@ static int fsl_easrc_probe(struct platform_device *=
pdev)
>  	regcache_cache_only(easrc->regmap, true);
> =20
>  	ret =3D devm_snd_soc_register_component(dev, &fsl_easrc_component,
> -					      &fsl_easrc_dai, 1);
> +					      fsl_easrc_dai, ARRAY_SIZE(fsl_easrc_dai));

[Severity: High]
When multiple DAIs are registered and active concurrently, can this cause a
data race on the shared DMA parameters?

Since all four DAIs share the same operations, fsl_easrc_dai_probe()
initializes them all with the exact same pointers:

fsl_easrc_dai_probe() {
    ...
    snd_soc_dai_init_dma_data(cpu_dai,
                              &easrc->dma_params_tx,
                              &easrc->dma_params_rx);
    ...
}

If an application opens multiple PCM devices simultaneously, won't their
concurrent hardware parameters operations modify the shared parameters
without locking?

fsl_asrc_dma_hw_params() {
    ...
    dma_params_fe =3D snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), =
substream);
    dma_params_fe->addr =3D asrc->paddr + asrc->get_fifo_addr(!dir, index);
    dma_params_fe->maxburst =3D dma_params_be->maxburst;
    ...
}

Could this lead to incorrect DMA FIFO address configuration and state corru=
ption
across the different DAI contexts?

>  	if (ret) {
>  		dev_err(dev, "failed to register ASoC DAI\n");
>  		goto err_pm_disable;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720095450.1618=
747-1-shengjiu.wang@oss.nxp.com?part=3D4
