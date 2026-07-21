Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBFE44AB9B;
	Tue, 21 Jul 2026 21:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784668669; cv=none; b=MbquUmOgl7y45fkXOzlzpk9xeGfc429EL9QlG3WviMGIy7zAY5WQ+mpO2XlwI2KH0Vbv10UtufK12kXhjK4E6sDdH7V8CrBu5DI59wycLMhVeOF1S9kg0EwSwekksiRrNItXSOn/KdTTGzekPsnhlfHRkRqvw7p/QbX2oSwzSKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784668669; c=relaxed/simple;
	bh=DROmEZTrW91/ie0pQj28M1laiTyzyWJBIfv5F3DKc8k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q0Z17V77i+pZsUY7J/QE0q3Q+KbK4YvPiK1c6uE6IlIbodKIDnNAMj/Me/i/Mj0QRyqTuJup9cLhI9B0HRpE/ED3WShuFfdpylwRxDawvjjSUCOBRkPAm7p1OwpQFiVpZOSoL6tMCYxE4njEZKUww1HiWyRvVOQ79J352S4afGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2oylF7t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2oylF7t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263B61F00A3A;
	Tue, 21 Jul 2026 21:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784668668;
	bh=/Smr69hZM9UoxeBU7rG5/ig983JkRJimVFrfLB5+mNo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S2oylF7t2yFPkMi7QmvlMfXqu38KY+TTc8kbxX/3xtT7Pqkra8jMnQECer9LGG1V+
	 Sl0WLVWfn/26npLfX/xEq4/qgUkA7ZW45Oul8OxlOMqHje1976+Il9uVuk19zEYC5K
	 tidUbvO9+RZMlvznaU4H7sr92VGgRCdNSubHWZD6gRqnaWqjXhQsuioFDt/kwi1K9j
	 osBTJ88H+mi65N8T2o2sdwjm4HsD0X8udajIuusZTtuXEBQOUOPA2PAj6fh1ChblKv
	 4xvXWuYLCFHG4HnLe3Xbwo1kqykAd+A2G0etH7iUr0ajs2DNQ89LAnszCegi/PMAqP
	 HrA/0WWN7ZucQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] spi: nxp-xspi: Improve AHB read performance with
 DMA
Reply-To: sashiko-reviews@lists.linux.dev
To: han.xu@oss.nxp.com
Cc: robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260721-xspi_dma_upstream-v2-2-9e19d80e7762@nxp.com>
References: <20260721-xspi_dma_upstream-v2-0-9e19d80e7762@nxp.com>
 <20260721-xspi_dma_upstream-v2-2-9e19d80e7762@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 21:17:47 +0000
Message-Id: <20260721211748.263B61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Resource Leak of DMA Channel on probe failure
- [Medium] Missing dma_map_resource for AHB physical address
- [Low] Build Failure: 64-bit modulo by 32-bit variable on 32-bit platforms

Pre-existing issues:
- [High] Data Truncation of physical memory-mapped address
--

--- Patch [2]: [PATCH v2 2/3] spi: nxp-xspi: Improve AHB read performance w=
ith DMA ---
commit e55bddd05b9c54ad3776775a32876cb677ace5d2
Author: Han Xu <han.xu@nxp.com>

spi: nxp-xspi: Improve AHB read performance with DMA

Use eDMA for XSPI AHB read to improve the performance.

> diff --git a/drivers/spi/spi-nxp-xspi.c b/drivers/spi/spi-nxp-xspi.c
> index 037eac24e6fd2..0658c0557ff17 100644
> --- a/drivers/spi/spi-nxp-xspi.c
> +++ b/drivers/spi/spi-nxp-xspi.c
[ ... ]
> @@ -796,6 +807,82 @@ static int nxp_xspi_ahb_read(struct nxp_xspi *xspi, =
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
> +
> +	if (dma_mapping_error(chan->device->dev, dma_addr)) {
> +		dev_err(xspi->dev, "failed to map DMA buffer for AHB read\n");
> +		return -ENOMEM;
> +	}
> +
> +	desc =3D dmaengine_prep_dma_memcpy(chan, dma_addr,
> +					 xspi->memmap_phy + op->addr.val,
> +					 op->data.nbytes,
> +					 DMA_PREP_INTERRUPT | DMA_CTRL_ACK);

[Severity: High]
This is a pre-existing issue, but since memmap_phy is declared as a u32 in
struct nxp_xspi, will physical addresses located above the 4GB boundary be
silently truncated to 32 bits? If so, this addition to op->addr.val might
cause the DMA controller to access the wrong physical memory.

[Severity: Medium]
If the eDMA controller operates behind an IOMMU that does not identity-map
this MMIO region, will this raw physical address trigger an IOMMU translati=
on
fault?

Should xspi->memmap_phy + op->addr.val be mapped via dma_map_resource()
to obtain a dma_addr_t before being passed into dmaengine_prep_dma_memcpy()?

> +	if (!desc) {
> +		dev_err(xspi->dev, "failed to prepare AHB RX DMA descriptor\n");
> +		ret =3D -EIO;
> +		goto err_unmap;
> +	}
[ ... ]
> @@ -1029,6 +1127,7 @@ static int nxp_xspi_exec_op(struct spi_mem *mem, co=
nst struct spi_mem_op *op)
>  static int nxp_xspi_adjust_op_size(struct spi_mem *mem, struct spi_mem_o=
p *op)
>  {
[ ... ]
> +		/*
> +		 * For AHB DMA read, align the transfer to the DMA alignment
> +		 * boundaries. If the start address is unaligned, shorten this
> +		 * transfer so the next one starts on an aligned boundary.
> +		 * Otherwise, if the length is unaligned, round it down.
> +		 */
> +		if (xspi->dma_rx && !needs_ip_only(xspi) &&
> +		    (op->data.nbytes >=3D xspi->devtype_data->ahb_buf_size)) {
> +			if (op->addr.val % alignment)
> +				op->data.nbytes =3D
> +					ALIGN(op->addr.val, alignment) - op->addr.val;

[Severity: Low]
Because op->addr.val is a 64-bit integer (u64) and alignment is a 32-bit
integer, will this modulo operation cause an unresolved symbol error for
__umoddi3 or __aeabi_uldivmod during the final link stage on 32-bit
architectures?

> +			else if (op->data.nbytes % alignment)
> +				op->data.nbytes =3D
> +					ALIGN_DOWN(op->data.nbytes, alignment);
> +		}
>  	}
> =20
>  	return 0;
[ ... ]
> @@ -1252,6 +1371,11 @@ static int nxp_xspi_probe(struct platform_device *=
pdev)
>  	if (irq < 0)
>  		return dev_err_probe(dev, irq,  "Failed to get irq source");
> =20
> +	/* DMA is optional, failure(other than -EPROBE_DEFER) falls back to CPU=
 */
> +	ret =3D nxp_xspi_dma_init(dev, xspi);
> +	if (ret =3D=3D -EPROBE_DEFER)
> +		return ret;
> +
>  	pm_runtime_set_autosuspend_delay(dev, XSPI_RPM_TIMEOUT_MS);
>  	pm_runtime_use_autosuspend(dev);
>  	ret =3D devm_pm_runtime_enable(dev);

[Severity: High]
Since nxp_xspi_cleanup() is registered via devm_add_action_or_reset() at the
end of nxp_xspi_probe():

    init_completion(&xspi->c);
    ret =3D devm_request_irq(dev, irq,
            nxp_xspi_irq_handler, 0, pdev->name, xspi);
    ...
    ret =3D devm_add_action_or_reset(dev, nxp_xspi_cleanup, xspi);

what happens if devm_pm_runtime_enable() (or any other initialization step
before the cleanup action is registered) fails? Will the DMA channel
allocated in nxp_xspi_dma_init() leak on these early error returns?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-xspi_dma_u=
pstream-v2-0-9e19d80e7762@nxp.com?part=3D2
