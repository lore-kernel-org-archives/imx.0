Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BAB3A901D
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 16:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698102; cv=none; b=bHQglcI+N0YV6aS2m146W61ws0E2J8g0RVmkNi8BnAWlRlBTx0KmQtj2zZQ/PaYNsnJXPksbdgmAspQviUi0pZXkG0/y9I8XwjQ9Mkg6opEYmSYP+UtnmOte57tRYbv+BQt7aI2uBLThwv6PFk552br9EZovZdgtKtT4/8ih0+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698102; c=relaxed/simple;
	bh=QYESdqWza3WuWFwB2LLQMebqxNAAsvwi0dJRsP4aCeQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q+Om2agGzhMMdXrZ69Snwnqy6XT5ZB+p098tij6YDrbmYCnFvQRCZwSybQ+iShm85pKX0aH1ex9KWxK2xDmDfG9XlANpkb031YRnzquEuq1NBsPyEdgFO1jrVDbnFLzoVVMfbbhGlhrrgtHcx0KghdQ+rQTTv/IdzU1e7WyiSU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xpv5qIv5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xpv5qIv5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 273EC1F00893;
	Tue, 29 Sep 2026 16:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790698101;
	bh=bfthfkTvN155ClZcEAyMwaTZgq/7ATAMNm7ElYsF5Go=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xpv5qIv5NTOw2cIIMkZTI8JhnTLsnYxq3fQy2g2jerOrcrw0bTun6hvlkuLDB3Kth
	 vexn5ei/1oMGMkBrM+eKFsPTZHIuev+KvImOtvnS7R4FzY+4dK8o6h83rmoVC1PHcJ
	 bbctUa/nLkZjGtlCZxjGVO1mnQ5PhyOTamAsSHS0b6XPsV060TUkT9IqxAvphbK5bv
	 GpziirBAOUEPSLDwj4/OYNHxB6JKpqKfQS7quWRvTuOlqQtO84J0bddgQowUys0EHQ
	 C92DrV0OpwT4QK4ptBrUJ6j81an+E8VW7utReXlYqwL8OkViUzOL+5vCn2CNKwDhjs
	 zqjsqaszmXGhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] spi: use dmaengine_get_dma_device() instead of
 chan->device->dev
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260929155445.3311133-2-Frank.Li@oss.nxp.com>
References: <20260929155445.3311133-1-Frank.Li@oss.nxp.com>
 <20260929155445.3311133-2-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 16:08:20 +0000
Message-Id: <20260929160821.273EC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] spi: bcm2835: NULL pointer dereference in bcm2835_spi_setup_dma()
- [High] spi: fsl-dspi: NULL pointer dereference in dspi_release_dma()
--

commit 94e56ea57266b861e4fa8e6aaf7104da2aa355f5
Author: Frank Li <Frank.Li@nxp.com>

spi: use dmaengine_get_dma_device() instead of chan->device->dev

This commit replaces direct access to dma_chan::device::dev with the proper
dmaengine_get_dma_device() consumer API across various SPI drivers. This
prepares the codebase for making the DMA engine provider data structures
private.

Link: https://lore.kernel.org/imx/67966b47-22cb-4b07-80c7-2044f557dbcb@app.=
fastmail.com/

> diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
> index 23606967f7d1f..faec657db2ffe 100644
> --- a/drivers/spi/spi-bcm2835.c
> +++ b/drivers/spi/spi-bcm2835.c
[ ... ]
> @@ -1174,16 +1177,15 @@ static int bcm2835_spi_setup_dma(struct spi_contr=
oller *ctlr,
>  				 struct bcm2835_spi *bs,
>  				 struct bcm2835_spidev *target)
>  {
> +	struct device *rx_dev =3D dmaengine_get_dma_device(ctlr->dma_rx);
>  	int ret;
> =20
>  	if (!ctlr->dma_rx)
>  		return 0;

[Severity: High]
Does this code dereference ctlr->dma_rx before checking if it is NULL?

If DMA configuration fails or is unavailable during controller initializati=
on
in bcm2835_dma_init(), the driver gracefully falls back to interrupt mode
and sets ctlr->dma_rx to NULL. When a new SPI device is later set up via
bcm2835_spi_setup(), it unconditionally calls bcm2835_spi_setup_dma().

Because the macro dmaengine_get_dma_device() dereferences the passed
channel pointer, doing so before the if (!ctlr->dma_rx) guard could trigger
a kernel panic if DMA is disabled.

[ ... ]
> diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
> index 23e6bc5f202e2..25af5e6777230 100644
> --- a/drivers/spi/spi-fsl-dspi.c
> +++ b/drivers/spi/spi-fsl-dspi.c
[ ... ]
> @@ -766,21 +769,21 @@ static int dspi_request_dma(struct fsl_dspi *dspi, =
phys_addr_t phy_addr)
>  static void dspi_release_dma(struct fsl_dspi *dspi)
>  {
>  	struct fsl_dspi_dma *dma =3D dspi->dma;
> +	struct device *tx_dev =3D dmaengine_get_dma_device(dma->chan_tx);
> +	struct device *rx_dev =3D dmaengine_get_dma_device(dma->chan_rx);
> =20
>  	if (!dma)
>  		return;

[Severity: High]
Can this lead to a NULL pointer dereference when accessing dma->chan_tx and
dma->chan_rx?

If the driver is configured in a mode that doesn't use DMA,
dspi_request_dma() is bypassed, and dspi->dma remains NULL. Similarly, if
dspi_request_dma() fails, it bails out before assigning dspi->dma.

During teardown or probe error rollback, dspi_release_dma() is called. If
dma is NULL, fetching dma->chan_tx to pass to dmaengine_get_dma_device()
before the if (!dma) safety guard is reached would cause a crash.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929155445.3311=
133-1-Frank.Li@oss.nxp.com?part=3D2
