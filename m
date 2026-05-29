Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DBA367B75
	for <imx@lists.linux.dev>; Fri, 29 May 2026 03:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780025670; cv=none; b=la0CPZQ8t6suYzbME2/xShhZMRgFNEzFDcnjk1FQnyhdizeUCNFHijLnZrmezQSdxJK0YuUNMfng59ATpBW2029kqy4dNtM43iaqeejFMO1nRWYRl+RLdLOMvM3Yr00tuU66FC4x9Mb3MeNRG6GqO9w2BdJnQd675xOtFHR5NdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780025670; c=relaxed/simple;
	bh=keWsHdqzM2+ygqYiT0nPeGHTsKw/GtMswMZj2kNItrM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WuRU6gQKRFl8j/dOck9cCKVvL4ooHIpHfUiaFJTtnwhsTbG65mtQ/TaK0ty29Cjez3B7fk+mTB1smr781mFJzFnvdZO+RVooQtN5a6c813P6bvnj04Ce8uqudWCvqPW6Wsq1+p/52iJ96eA4pGPdB3pAK9fru8H8sVhwFOQKsKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BrDDChKX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BrDDChKX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051701F000E9;
	Fri, 29 May 2026 03:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780025669;
	bh=oLgZBwcP+CRkSf9l06mMFhPfLKm+KJA/yG0ErIhwQz4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BrDDChKXi2Y9BZ9lGxDVakm1poKf80QVPvNKEjYPHzwLMvpL61WtS19Ny7Cgb4C1R
	 zjIGKeF+cSh7AloHUdkTR0rSskchI8ERnnT2gt3HHhUgfQirgO8W+JsOZn31RVxHJN
	 jPkUpXJobCCQYnjAA1vneHNJ1l8WFrGDawatDXSNMD3JMiFcF6FZoLTldCYTyEQto9
	 SekTp16+W9jsuWctOzmNAjZMgVIdNj52QfL1NBp/uy7JP8HTn1sWtNYLwJciAdxclL
	 faDUHdsmH0osxy+V7UDRUKPHBChCfdcBWTFSpb+T+hTgXNQULegYGom3nWycV4xUvN
	 kJRSqiLoB8FOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] remoteproc: switch exact-match drivers to
 wc-ioremap callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Levinsky" <ben.levinsky@amd.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, wsa+renesas@sang-engineering.com
In-Reply-To: <20260529021637.2077602-3-ben.levinsky@amd.com>
References: <20260529021637.2077602-3-ben.levinsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 03:34:28 +0000
Message-Id: <20260529033429.051701F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The error logging in the `rproc_mem_entry_ioremap_wc` helper use=
s the `%pa` format specifier for a `dma_addr_t` pointer instead of `%pad`.
--

commit 06feb3b32004ed7bd1d29e99430abd615d6b4449
Author: Ben Levinsky <ben.levinsky@amd.com>

remoteproc: switch exact-match drivers to wc-ioremap callbacks

Replace the exact-match carveout map and unmap callbacks in the
existing remoteproc drivers with the common wc-ioremap helpers. This
covers xlnx_r5_remoteproc, rcar_rproc, st_remoteproc, stm32_rproc,
imx_rproc, and imx_dsp_rproc.

Leave the zynqmp R5 TCM callbacks alone because they also clear the
mapped memory and are therefore not exact matches for the shared
helpers.

> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_=
rproc.c
> index 632614013dc65..a6e36a11627d7 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
[ ... ]
> @@ -237,8 +208,8 @@ static int stm32_rproc_prepare(struct rproc *rproc)
>  			mem =3D rproc_mem_entry_init(dev, NULL,
>  						   (dma_addr_t)res.start,
>  						   resource_size(&res), da,
> -						   stm32_rproc_mem_alloc,
> -						   stm32_rproc_mem_release,
> +						   rproc_mem_entry_ioremap_wc,

[Severity: Medium]
Does replacing the stm32 callback with the common helper regress its error
logging?

The original stm32_rproc_mem_alloc() function correctly used %pad for
mem->dma:

    dev_err(dev, "Unable to map memory region: %pad+0x%zx\n",
            &mem->dma, mem->len);

However, the new rproc_mem_entry_ioremap_wc() helper uses %pa:

    dev_err(&rproc->dev, "Unable to map memory region: %pa+%zx\n",
            &mem->dma, mem->len);

Since mem->dma is a dma_addr_t, and %pa expects a phys_addr_t *, could this
result in reading the wrong number of bytes on platforms where
sizeof(dma_addr_t) !=3D sizeof(phys_addr_t)?

This could combine the dma and adjacent len fields, printing a garbage
address in the log.

> +						   rproc_mem_entry_iounmap,
>  						   "%.*s", strchrnul(res.name, '@') - res.name,
>  						   res.name);
>  			if (mem)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529021637.2077=
602-1-ben.levinsky@amd.com?part=3D2
