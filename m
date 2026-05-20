Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610C13D091B
	for <imx@lists.linux.dev>; Wed, 20 May 2026 10:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779273056; cv=none; b=u/taRr54vadEqzJUJiNF8XDMnypBUQbnoj3pCVIIvO30fyvPqOtAAmKtsBT1xSQrzcwX7+s27kzkiJ91dBSZiC6pQu8JgRUG7P6rAD2jlPxLS1Mv4UPC2nuL6B7aLWG4ckMCqSXcLBhDu7AaoXiPpBj9fopSQeSHVKag+2gSyT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779273056; c=relaxed/simple;
	bh=Yj+ZE37RMvrxTCNQ2yTKdFRQs/vyi1FeAgfwneyGEcg=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lb2dTjY4doTA0iPGRVdaWpbFbLT+3MzZCP/ZXarFhD3NlpMzq/J8yqd4yupXQssfsOR1gnevxgo9bCWPEEigpw07lVhiP35ISuibaKQQ8xyEh7Bi8TDaHTHYUyBle/Tc2v0FpBf//qXLSG5el0yIH3TfU2EcLa5wzPrAMHSVckQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIANfImh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIANfImh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6111F000E9;
	Wed, 20 May 2026 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779273051;
	bh=qlsieXyxcR7D2OxROEgV0WVZ1FdELlk2K30v7U+ozFI=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=kIANfImhCDGtc1rbIbQqG+rTei8oAgMfoar36hFeo3Rayy6LG5KV+H3KSGKUymCsP
	 dn94WOR74tGieYvQjNboCf/QpLpnuyLbYfj9CCsKrweYesCGT+l7HPFxS+yJcHk+e8
	 Z/ECcSTU4inMuct/LO35Pk1fbJscyRBRlkLgBuBY1Ue0mdyWCtsZu7yrZmgL20sBe0
	 PkqisGDP8VZlgzW0FyT6dJE4isS3mbC1eYj9sqy0DMg154qBs7ZXDxzgEm7yfFKHVR
	 rEYbWh3UmMFF/e8em410j2dZODFxXSi2xw9dmqmNDBHryFuNGKVTK06KWY9AkGmJor
	 Mx7Ks5/pUcH5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] spi: fsl-lpspi: fix missing RX DMA termination
 on TX prepare failure
Reply-To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260520094308.2882892-3-carlos.song@oss.nxp.com>
References: <20260520094308.2882892-3-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 10:30:51 +0000
Message-Id: <20260520103051.BD6111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The early error return paths in `fsl_lpspi_dma_transfer()` fail to=
 call `fsl_lpspi_reset()`, leaving the SPI controller enabled with active D=
MA requests and stale FIFO contents.
- [High] A race condition between asynchronous target aborts and transfer p=
reparation can lead to lost abort signals and indefinite task hangs.
--

commit 28e337398d010b76ae512c9b76eaed6b301c616f
Author: Carlos Song <carlos.song@nxp.com>

spi: fsl-lpspi: fix missing RX DMA termination on TX prepare failure

This commit addresses a potential memory corruption or use-after-free issue
when the TX DMA descriptor fails to prepare. It ensures the RX DMA channel
is also appropriately terminated before returning an error.

> diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
> index 1a94a42fac319..906892453a843 100644
> --- a/drivers/spi/spi-fsl-lpspi.c
> +++ b/drivers/spi/spi-fsl-lpspi.c
> @@ -647,6 +647,7 @@ static int fsl_lpspi_dma_transfer(struct spi_controll=
er *controller,
>  				tx->sgl, tx->nents, DMA_MEM_TO_DEV,
>  				DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>  	if (!desc_tx) {
> +		dmaengine_terminate_sync(controller->dma_rx);
>  		dmaengine_terminate_sync(controller->dma_tx);
>  		return -EINVAL;

[Severity: High]
This is a pre-existing issue, but does this error path leave the SPI
controller enabled and out of sync?

Prior to calling fsl_lpspi_dma_transfer(), the driver executes
fsl_lpspi_set_cmd() and fsl_lpspi_setup_transfer(). These enable the
SPI module and DMA requests, pushing a command word into the TX FIFO.

If dmaengine_prep_slave_sg() fails for the TX descriptor, we terminate the
DMA channels and return -EINVAL. The caller propagates this error to the
SPI core, but since the spi-fsl-lpspi driver does not implement the
handle_err() callback, the hardware is never reset by the core.

Since fsl_lpspi_reset() is bypassed here, the SPI module remains
enabled. Could subsequent transfers fail or corrupt data, making the
SPI controller unusable until the driver is unbound or the system reboots?

[Severity: High]
This isn't a bug introduced by this patch, but does the transfer preparation
sequence have a race condition with asynchronous target aborts?

fsl_lpspi_target_abort() can be called asynchronously by the SPI target
protocol driver to cancel an ongoing transfer, which sets
target_aborted to true and signals the completion structures.

Shortly after the DMA descriptor preparation shown above, the driver
calls reinit_completion() and unconditionally sets target_aborted to false:

fsl_lpspi_dma_transfer() {
        ...
        reinit_completion(&fsl_lpspi->dma_tx_completion);
        dma_async_issue_pending(controller->dma_tx);

        fsl_lpspi->target_aborted =3D false;
        ...
}

If fsl_lpspi_target_abort() executes just before these variables are reset,
the completion wakeup count is overwritten to 0 and the abort flag is
cleared.

Since target mode transfers use wait_for_completion_interruptible() without
a timeout, would the SPI worker thread block indefinitely waiting for a
transfer that the master has already aborted?

>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520094308.2882=
892-1-carlos.song@oss.nxp.com?part=3D2
