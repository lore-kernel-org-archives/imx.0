Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09D23783B0
	for <imx@lists.linux.dev>; Wed, 17 Jun 2026 22:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781734117; cv=none; b=cwSpb7aEwX5s2/tynxtpiVITjisMUAH15MVJJNOnKBIdI+27otRDM6VCn/go31fEHeQ2cz5JShfaOGhK7oU2pE5lMMwmP3/9vzg+nYK7kGkHxFvta837s5xbZux9CtPa3my7RbBj/0yUqZT3YfigZC3sxOF23E6F03UxLdmJhsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781734117; c=relaxed/simple;
	bh=qDQLJDRc8NlZPA3OjBPyuAmpBikdW/XKllB348bx6s0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dPIm1WDKtCLj00qDFmE9FG4OajCQi2iEdASPZo+3Ot+tI9Ep9+AkIkliNKzSdXJS/Fz7dE49f0zOvSXD9P8/BL51rUzIbiTvTVkMqSebaKdavu2qY+doP1Z3cAM/Y91+TmOVntkpgVtiGgVQbD6cREXh28o5h9xoVFHXWa31VKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADvFC11G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADvFC11G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D611F000E9;
	Wed, 17 Jun 2026 22:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781734116;
	bh=CcV1R94u8VGlmsxtHrrGb/1ZefihjmLJJxgrJGDHlDU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ADvFC11GvrNXLs3taQjyjTcaUS+HHwBQBqxKgpx5nM9sMbXNOx259ZoiGlJfMAw6A
	 XL3DzRNjcAFmaxW1h6V2oBtfInZebI6QnHB4kToCvBFXx8GCjXPoLXx3GOiDG7tLs5
	 DbpdJabY+BbXBM2XUdfGmvKdCUrKHKXDG6xhdme0mkjMIVuxhPDTpPEfhtAnjDxkB8
	 3EENS+lN0iIxzeWsGKJFndAc399gFvJg0IHel0x8VHRvAq/+uftRoYFSLiiu97xXq6
	 uzDza2CioM22aEty9CjODUPxOiEvwtBCNBy2CtiRK1WpjI3mcGKNZpwfzMRgwkr8LQ
	 JSYTiJer3VNfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] spi: nxp-xspi: Improve AHB read performance with
 DMA
Reply-To: sashiko-reviews@lists.linux.dev
To: han.xu@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260617215520.3327836-2-han.xu@oss.nxp.com>
References: <20260617215520.3327836-1-han.xu@oss.nxp.com>
 <20260617215520.3327836-2-han.xu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 22:08:35 +0000
Message-Id: <20260617220836.27D611F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Calling dma_map_single() directly on op->data.buf.in without verif=
ying it is a linearly mapped virtual address causes kernel panics or silent=
 memory corruption with vmalloc buffers.
- [High] Directly passing the memory-mapped physical address as a DMA addre=
ss to the DMA engine bypasses the DMA API and causes IOMMU translation faul=
ts.
- [Medium] The DMA channel allocated for RX is permanently leaked if the pr=
obe function encounters an error before the cleanup action is registered.
--

commit 8ae000beff392fc0d98a1b38fb68f9efe125110e
Author: Han Xu <han.xu@nxp.com>

spi: nxp-xspi: Improve AHB read performance with DMA

This commit introduces eDMA support for XSPI AHB reads to improve
performance. It falls back to CPU reads if DMA is unavailable or for
small transfers.

> diff --git a/drivers/spi/spi-nxp-xspi.c b/drivers/spi/spi-nxp-xspi.c
> index 385302a6e62f2..fd9140da6755a 100644
> --- a/drivers/spi/spi-nxp-xspi.c
> +++ b/drivers/spi/spi-nxp-xspi.c
[ ... ]
> @@ -799,6 +805,78 @@ static int nxp_xspi_ahb_read(struct nxp_xspi *xspi, =
const struct spi_mem_op *op)
[ ... ]
> +static int nxp_xspi_ahb_dma_read(struct nxp_xspi *xspi,
> +				 const struct spi_mem_op *op)
> +{
> +	struct dma_async_tx_descriptor *desc;
> +	struct dma_chan *chan =3D xspi->dma_rx;
> +	unsigned long timeout;
> +	dma_addr_t dma_addr;
> +	int ret =3D 0;
> +
> +	dma_addr =3D dma_map_single(chan->device->dev,
> +				  op->data.buf.in, op->data.nbytes,
> +				  DMA_FROM_DEVICE);

[Severity: High]
How does this code handle vmalloc addresses?

SPI memory operations (e.g., via MTD/UBIFS) frequently pass large vmalloc'd
buffers in op->data.buf.in. Calling dma_map_single() on a vmalloc address
causes virt_to_phys() to produce an invalid physical address, leading to a
kernel panic or silent memory corruption.

Since dmaengine_prep_dma_memcpy() cannot accept an sg_table, should the
driver verify !is_vmalloc_addr(op->data.buf.in) and fall back to CPU read?

> +
> +	if (dma_mapping_error(chan->device->dev, dma_addr)) {
> +		dev_err(xspi->dev, "failed to map DMA buffer for AHB read\n");
> +		return -ENOMEM;
> +	}
> +
> +	desc =3D dmaengine_prep_dma_memcpy(chan, dma_addr,
> +					 xspi->memmap_phy + op->addr.val,

[Severity: High]
Is it safe to pass the memory-mapped physical address directly to the DMA
engine descriptor without mapping it first?

The driver computes the source address as xspi->memmap_phy + op->addr.val
and passes it directly as a dma_addr_t. Bypassing the DMA API (such as
dma_map_resource()) means the physical address is never mapped into the
DMA controller's IOVA space. This breaks on platforms where the eDMA
operates behind an IOMMU.

> +					 op->data.nbytes,
> +					 DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
[ ... ]
> @@ -1254,7 +1359,12 @@ static int nxp_xspi_probe(struct platform_device *=
pdev)
>  	/* Find the irq */
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0)
> -		return dev_err_probe(dev, irq,  "Failed to get irq source");
> +		return dev_err_probe(dev, irq, "Failed to get irq source");
> +
> +	/* DMA is optional, failure(other than -EPROBE_DEFER) falls back to CPU=
 */
> +	ret =3D nxp_xspi_dma_init(dev, xspi);
> +	if (ret =3D=3D -EPROBE_DEFER)
> +		return ret;
> =20
>  	pm_runtime_set_autosuspend_delay(dev, XSPI_RPM_TIMEOUT_MS);
>  	pm_runtime_use_autosuspend(dev);

[Severity: Medium]
Could this leak the DMA channel if an error occurs later in the probe
sequence?

nxp_xspi_dma_init() allocates an unmanaged DMA channel via
dma_request_chan(), but the teardown logic using devm_add_action_or_reset()
isn't registered until much later in the probe sequence. If intermediate
steps fail (such as devm_pm_runtime_enable()), it appears the probe returns
early without releasing the DMA channel.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617215520.3327=
836-1-han.xu@oss.nxp.com?part=3D2
