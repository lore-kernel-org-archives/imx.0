Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F61D3BBFDD
	for <imx@lists.linux.dev>; Wed, 24 Jun 2026 15:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782315119; cv=none; b=cdQcSUKf06OEAj8hh6G8CiEk8ByAoLohSFZ63Je3WaFDAbChThPd+tzx5XuNZBPEraifHFuImBPiPigy2sGX8JLMYuCJv3Lj3yf2KnYAW6izi5QP/VuVNgmswxh9CKPpYNefdYyLb6hJskOaHXyOJZAGvEjAX7/59+seJ0uw0VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782315119; c=relaxed/simple;
	bh=/zFmrtUBKKZXWBud1TnnIqMs0i0ZD9YOZWvDNsm5C98=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k8oWlgNhDGW7QcEs2WtVooflCKizbruPbqM7Xtmb45vRDGLNTNfG0UjChQyD81xuc7eeM9l6ahG8Wh6TPnL/M5E98MjE45AJDsqrwZDBsU8MjFgS95ypyi8+Pl7pzjYkbGExq/wveus1qRzt0930++SMn/e3kgphr/QZ4fbSQ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVHNcHSO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVHNcHSO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B771F000E9;
	Wed, 24 Jun 2026 15:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782315117;
	bh=D5bs8GZ3elXX2FQuyJuS1Gw7xm/HnDP2P4vxBmdwe/o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WVHNcHSOB+gnBEqann8M+9rnkjMyGFl8SGGoKCNqvlc+Mi4m+9STzd0nhTvGwRqdj
	 Kc+U1dpmdj+ypO+XWL6ABfxnGNYbJrblygburlV39ogtoA1Xgm9cctjkreL0UIEiZl
	 vmRlp/kKv0DtLvvOE2W6vAiWVt/Gy3JpV4U341guepsnkCfQdDcjvL3XrMFyq/KAMJ
	 XQK2kqUfh+0fNP0jBvE7njtFJNrNPUCDpiydjzwrE0PG/sjfwhyjK11gzF5qZlHu+P
	 sF1KkM/5zyhpBAFhOzed9GKcDujR6TutPGvbj1vAfHYGxiQ/IMAxZ2dZcpImaKUTFY
	 c6HpaHogwRo9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] spi: imx: reconfigure for PIO when DMA cannot be
 started
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Fernandez Pastrana" <javier.pastrana@linutronix.de>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260624151958.18626-1-javier.pastrana@linutronix.de>
References: <20260624151958.18626-1-javier.pastrana@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 15:31:57 +0000
Message-Id: <20260624153157.B0B771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing SPI_TRANS_FAIL_NO_START flag when TX DMA preparation or su=
bmission fails, preventing PIO fallback.
- [High] Mid-transfer DMA failure incorrectly triggers a full PIO fallback,=
 causing duplicate data transmission and corrupting the SPI stream.
- [High] Failure to clear `SPI_TRANS_FAIL_NO_START` after an internal PIO f=
allback leaks stale error state, causing subsequent transfers to silently d=
uplicate data.
--

commit 5c8ab49e90372d3c0d5a4aca24ae8e97fcecafbc
Author: Javier Fernandez Pastrana <javier.pastrana@linutronix.de>

spi: imx: reconfigure for PIO when DMA cannot be started

When ECSPI DMA descriptor preparation fails, the driver falls back to PIO
internally without un-doing the DMA-mode controller configuration, leading
to corrupted data. This commit forces the controller to reconfigure for
PIO by setting the fallback flag and re-running the setup transfer
routine.

> diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
> index ae9912905c67a..79a6c1a60b0a0 100644
> --- a/drivers/spi/spi-imx.c
> +++ b/drivers/spi/spi-imx.c
> @@ -2152,7 +2152,8 @@ static int spi_imx_transfer_one(struct spi_controll=
er *controller,
>  	if (spi_imx->usedma) {
>  		ret =3D spi_imx_dma_transfer(spi_imx, transfer);
>  		if (transfer->error & SPI_TRANS_FAIL_NO_START) {

[Severity: High]
This isn't a bug introduced by this patch, but if a transfer succeeds
internally via the PIO fallback here, doesn't transfer->error still retain
the SPI_TRANS_FAIL_NO_START flag?

If an SPI client reuses the spi_transfer object, and the next transfer
finishes successfully via DMA, this condition checks only the error flag
without verifying if the DMA transfer actually failed (ret < 0).

Would this cause the successful DMA transfer to incorrectly evaluate this
condition as true and redundantly re-transmit the data via PIO?

> -			spi_imx->usedma =3D false;
> +			controller->fallback =3D true;
> +			spi_imx_setupxfer(spi, transfer);
>  			if (spi_imx->target_mode)
>  				return spi_imx_pio_transfer_target(spi, transfer);
>  			else
>  				return spi_imx_pio_transfer(spi, transfer);
>  		}

[Severity: High]
This is also a pre-existing issue, but does this fallback logic account for
partially completed DMA transmissions?

If a large transfer is split into multiple DMA packages in
spi_imx_dma_transfer() and a subsequent package fails,
spi_imx_dma_package_transfer() unconditionally sets SPI_TRANS_FAIL_NO_START:

spi_imx_dma_package_transfer() {
    ...
    dma_failure_no_start:
        transfer->error |=3D SPI_TRANS_FAIL_NO_START;
        return ret;
}

Since earlier packages were already physically transmitted over the SPI bus,
would triggering a full PIO fallback here restart the transfer from the
beginning and corrupt the SPI stream by transmitting duplicate data?

[Severity: High]
Another pre-existing issue related to the DMA fallback: what happens if TX
DMA descriptor preparation or submission fails in spi_imx_dma_submit()?

drivers/spi/spi-imx.c:spi_imx_dma_submit() {
    ...
    desc_tx =3D dmaengine_prep_slave_single(controller->dma_tx, ...);
    if (!desc_tx)
        goto dmaengine_terminate_rx;
    ...
    cookie =3D dmaengine_submit(desc_tx);
    if (dma_submit_error(cookie)) {
        ...
        goto dmaengine_terminate_tx;
    }
    ...
}

It appears these error paths return without setting the
SPI_TRANS_FAIL_NO_START flag. Does this prevent the PIO fallback from
triggering for TX DMA failures, causing the transfer to drop instead?

>  		return ret;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624151958.1862=
6-1-javier.pastrana@linutronix.de?part=3D1
