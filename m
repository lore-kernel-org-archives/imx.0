Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AC83C1F5C
	for <imx@lists.linux.dev>; Mon, 25 May 2026 07:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779693297; cv=none; b=GDQ5aVpAm+5BKtpHmXQoCPrmp0bdS7LqF67D8L6y7zsrDL36+Fo8CioPSI2KzBw21WnfZ0r2El8sPwVOipEKgqLF1P8sYu7xRbTQLXV+P0rHpPVtCEcy04weiVKEBEVeoO/EXG+JX8Yh0bZ/z1AgxcSvYKndtW7kJBUa1+ccuu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779693297; c=relaxed/simple;
	bh=7bKij+Juy967yJEpjM8lS9haJ0JUw7XitWQTg87djoc=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RZTzWAKgQLOnmHlPlS+4inEmR41/y3yCVNLmpXCy41CTcnmHkm2mSYTg8eaTPLt1KH28vcggCtqnp54Z8CYmJId3LIjJO85+c0bsi3j8Ghwmat05IikhYCEhtPrU8ioEPGBYExvBisu594DdNUvvb7W1WAiFdbtEKb8XU3Z38og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=it7DOJ8L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="it7DOJ8L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7238B1F00A3A;
	Mon, 25 May 2026 07:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779693291;
	bh=J/lILXZfDZs0nznViDCyxPWbQnMCI+S3sUfzIVdsHjc=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=it7DOJ8LN3qPV3oRNNhIRE1Ehl/PfKGQud1zb/lTXQcQxZ0tOgWiWlEiZXgBuC5sz
	 Vcn1ZCKio7wGVs6eC1tbeP01ATQ/XBZBc+hYcY2tRHy2/oH2kmysG1aThTkvT0HrC6
	 khe8K06+fd+hhUSn+kVlYK/i/9nl6i/mSw8AUhMCPDxpq5IqaeCGIQ6TGGpEp7izMx
	 NLaC2ZFLPcB8F11NQoGWCck1x8Lk1ZIvU9dgSLAzUGCKOiQ3/vTHxoF177Khkm+3+5
	 9dtnxVVbjc9agqS2xuuW34kQc2C8he52hyZREtvCqaZGXo3ymm/ow6cCzXO0HKyzxg
	 IsWObimMssXgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] spi: imx: replace dmaengine_terminate_all() with
 dmaengine_terminate_sync()
Reply-To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260525062928.3191821-1-carlos.song@oss.nxp.com>
References: <20260525062928.3191821-1-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 07:14:51 +0000
Message-Id: <20260525071451.7238B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] In target mode, `spi_imx_target_abort()` does not signal the DMA c=
ompletion variables, leading to an indefinite hang in `spi_imx_dma_submit()=
`.
- [High] TX DMA preparation and submission failures do not set `SPI_TRANS_F=
AIL_NO_START`, preventing a graceful fallback to PIO mode.
- [High] Aborting an interrupted DMA transfer in target mode bypasses a cri=
tical hardware workaround, leaving the ECSPI hardware actively shifting out=
 stale data.
- [High] Setting `SPI_TRANS_FAIL_NO_START` on partial transfer failure lead=
s to duplicate data transmission.
--

commit 8bfbc10aab79cda2627b885ec509ffea7360e1a1
Author: Carlos Song <carlos.song@nxp.com>

spi: imx: replace dmaengine_terminate_all() with dmaengine_terminate_sync()

dmaengine_terminate_all() has been deprecated, so replace it with
dmaengine_terminate_sync().

> diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
> index 480d1e8b281f1..ae9912905c67a 100644
> --- a/drivers/spi/spi-imx.c
> +++ b/drivers/spi/spi-imx.c
[ ... ]
> @@ -1793,15 +1793,15 @@ static int spi_imx_dma_submit(struct spi_imx_data=
 *spi_imx,
>  		if (wait_for_completion_interruptible(&spi_imx->dma_tx_completion) ||
>  		    READ_ONCE(spi_imx->target_aborted)) {

[Severity: High]
This is a pre-existing issue, but does this actually check target_aborted if
the completion is waiting?

Due to C short-circuit evaluation, wait_for_completion_interruptible()
blocks first before the right side of the OR is evaluated.

If the master aborts the transfer, spi_imx_target_abort() sets
target_aborted =3D true and calls complete(&spi_imx->xfer_done) which
is only used for PIO mode.

Since it fails to signal dma_tx_completion or dma_rx_completion, will the
SPI worker thread hang forever waiting for a DMA completion that will never
be signaled?

>  			dev_dbg(spi_imx->dev, "I/O Error in DMA TX interrupted\n");
> -			dmaengine_terminate_all(controller->dma_tx);
> -			dmaengine_terminate_all(controller->dma_rx);
> +			dmaengine_terminate_sync(controller->dma_tx);
> +			dmaengine_terminate_sync(controller->dma_rx);
>  			return -EINTR;

[Severity: High]
This isn't a bug introduced by this patch, but returning directly here
bypasses the hardware workaround for the ECSPI continuous shifting erratum.

The ECSPI hardware has a known erratum in target mode where it continuously
shifts out the last word from the TXFIFO even when empty, so the driver
normally mitigates this by disabling the ECSPI at the end of the transfer.

If the wait is interrupted and returns -EINTR early, it entirely bypasses
the hardware disable block.

Does this early return leave the hardware in a broken state that corrupts
the SPI bus?

>  		}
> =20
>  		if (wait_for_completion_interruptible(&spi_imx->dma_rx_completion) ||
>  		    READ_ONCE(spi_imx->target_aborted)) {
>  			dev_dbg(spi_imx->dev, "I/O Error in DMA RX interrupted\n");
> -			dmaengine_terminate_all(controller->dma_rx);
> +			dmaengine_terminate_sync(controller->dma_rx);
>  			return -EINTR;
>  		}
[ ... ]
> @@ -1818,9 +1818,9 @@ static int spi_imx_dma_submit(struct spi_imx_data *=
spi_imx,
>  	return 0;
> =20
>  dmaengine_terminate_tx:
> -	dmaengine_terminate_all(controller->dma_tx);
> +	dmaengine_terminate_sync(controller->dma_tx);

[Severity: High]
This is a pre-existing issue, but TX DMA preparation failures jump here and
return -EINVAL without setting SPI_TRANS_FAIL_NO_START.

When RX DMA preparation fails, the driver sets SPI_TRANS_FAIL_NO_START to
trigger a graceful fallback to PIO mode in spi_imx_transfer_one().

Does leaving this flag unset for TX failures cause the entire SPI message
to abort prematurely instead of allowing the fallback?

>  dmaengine_terminate_rx:
> -	dmaengine_terminate_all(controller->dma_rx);
> +	dmaengine_terminate_sync(controller->dma_rx);

[Severity: High]
This is also a pre-existing issue. The RX DMA prep failure path sets
SPI_TRANS_FAIL_NO_START before jumping to dmaengine_terminate_rx.

For transfers larger than the maximum burst size, spi_imx_dma_transfer()
splits the transfer into multiple DMA packages in a loop.

If the first package is transmitted successfully but a subsequent package
fails during RX DMA preparation, this flag is set.

Because spi_imx_pio_transfer() always starts from the beginning of
transfer->tx_buf, does setting this fallback flag on partial failures cause
the SPI target to erroneously receive the first package's data twice?

> =20
>  	return -EINVAL;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525062928.3191=
821-1-carlos.song@oss.nxp.com?part=3D1
