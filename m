Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F003A7D91
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 20:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678726; cv=none; b=c5ZRG3vNAMsAXssvqq9FTrvaH/O7/o9qWkMHlm/jP0n98Z0ZwYyF2OxznkQenkJJWxFfWmcCy2NxnDIxYwrFkmLkL81Jjk+Ats5VvyM+YMoepT9BDoUxgTNKbT0ZFB+c/Y5H3rqky0SlWAZVq22pNm3lsncdYXs90fqwSvO6R4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678726; c=relaxed/simple;
	bh=mS3BOK4VI2FemnyIYV4k4zI22Td7wyg7fA4zUIYn4SE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NvVG21D4aHEJN3jFm8jfoNP6PcMDpdROB2zetj0CCNM/vW7h6BdGuh5wOZ9AF97y051HJEOMF9HnLyucep65M1UvzXroQwx0Z24HoaWqwwGmsTWMH3DY+CfMKQD6oWYU42ucq0lH51LRrHufA5/nsLV3MWLvVr0RSnBuKCE7NyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XY62b89d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XY62b89d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4C51F000FF;
	Thu, 17 Sep 2026 20:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789678724;
	bh=AZzsJc2mzRixYXx+ipRPQr7MTRu00JD/Y1XHYQB0gxE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XY62b89dNHle+roZsr0uF3Z+zOjYK/b61OhjHt6yfYOGD93VulToEBsvMNN5Gqbk6
	 +bYElS76STXjjTJduJ2Gu42hcss4pWhCHUTRStv9C04n/eBqK42uPfYJyR5b72l9Ov
	 waMB45C0Vpayk+jxQu+D0Y2NfDyhEt4qCHKYcPtL9b3YNc6dJXexK5vqHudQfaXdiz
	 y2XZ4cTo4w1OidWZwQwszCX/NMAJRvNL6+8NCw8wqgS5xRe/AQgw0EqyeN1ID9OTzD
	 vBF3Q14K88Fi0ZwlLXrTwFgKwxvHd2/vzZONLzA5MN1U5VBERvE2TY60smT43/Dz3l
	 PPHyzawM/JTlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] mtd: use dmaengine_get_dma_device() instead of
 chan->device->dev
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260917204724.1289912-1-Frank.Li@oss.nxp.com>
References: <20260917204724.1289912-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 20:58:43 +0000
Message-Id: <20260917205843.BF4C51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] mtd: NULL pointer dereference in am654_hbmc_dma_read
- [Medium] mtd: Asymmetric DMA mapping and unmapping in cadence-nand-contro=
ller
--

commit c06f81e901974be1dc19c7a1842c1db726a5fe88
Author: Frank Li <Frank.Li@nxp.com>

mtd: use dmaengine_get_dma_device() instead of chan->device->dev

This commit replaces direct dma_chan device struct access with the proper
dmaengine_get_dma_device() consumer API across multiple MTD drivers. It
returns the correct device for each channel when DMA engines support
per-channel IOMMU mappings, and prepares for making provider structures
private.

> diff --git a/drivers/mtd/hyperbus/hbmc-am654.c b/drivers/mtd/hyperbus/hbm=
c-am654.c
> index 9d31464046b22..8a14e908d0b53 100644
> --- a/drivers/mtd/hyperbus/hbmc-am654.c
> +++ b/drivers/mtd/hyperbus/hbmc-am654.c
> @@ -78,14 +78,15 @@ static int am654_hbmc_dma_read(struct am654_hbmc_devi=
ce_priv *priv, void *to,
>  	struct dma_chan *rx_chan =3D priv->rx_chan;
>  	struct dma_async_tx_descriptor *tx;
>  	dma_addr_t dma_dst, dma_src;
> +	struct device *rx_dev =3D dmaengine_get_dma_device(rx_chan);

[Severity: High]
If rx_chan is NULL, will this cause an immediate NULL pointer dereference?

Based on the driver implementation, rx_chan can be NULL if the DMA fallback
to PIO is taken. The new dmaengine_get_dma_device() function will dereferen=
ce
the channel pointer unconditionally:

include/linux/dmaengine.h:dmaengine_get_dma_device() {
    if (chan->dev->chan_dma_dev)
...

Should rx_dev be initialized after the if (!priv->rx_chan) check below?

>  	dma_cookie_t cookie;
>  	int ret;
> =20
>  	if (!priv->rx_chan || !virt_addr_valid(to) || object_is_on_stack(to))
>  		return -EINVAL;
> =20

[ ... ]

> diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd=
/nand/raw/cadence-nand-controller.c
> index 2085632631c02..4f5e6d2b128c7 100644
> --- a/drivers/mtd/nand/raw/cadence-nand-controller.c
> +++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
> @@ -3229,7 +3229,7 @@ static void cadence_nand_remove(struct cdns_nand_ct=
rl *cdns_ctrl)
>  {
>  	cadence_nand_chips_cleanup(cdns_ctrl);
>  	if (cdns_ctrl->dmac)
> -		dma_unmap_resource(cdns_ctrl->dmac->device->dev,
> +		dma_unmap_resource(dmaengine_get_dma_device(cdns_ctrl->dmac),
>  				   cdns_ctrl->io.iova_dma, cdns_ctrl->io.size,
>  				   DMA_BIDIRECTIONAL, 0);

[Severity: Medium]
Does this introduce an asymmetric DMA mapping and unmapping mismatch?

The original mapping in cadence_nand_init() still uses the old pattern:

cdns_ctrl->io.iova_dma =3D dma_map_resource(dma_dev->dev, cdns_ctrl->io.dma,
    cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);

If a provider uses per-channel devices, these pointers could differ,
potentially causing resource leaks or kernel warnings on device unbind.
Should cadence_nand_init() also be updated to use dmaengine_get_dma_device()
to maintain symmetry?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917204724.1289=
912-1-Frank.Li@oss.nxp.com?part=3D1
