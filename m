Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B93226D05
	for <imx@lists.linux.dev>; Sat, 20 Jun 2026 08:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781945880; cv=none; b=stgFxPW/6xCIjien7ZkLr7kQq2OFM0XXoG8zDq9Mn65lARRYSNI16Y8pxRYQjweUQq7oNX7QkkPrRcEc7dUde4dhps5LrTSLxkoeWq4t0ELsMWo9shgn7OlowJuldLcBWiP+wZ4ceOaD+SNGXMG28EIzqXSJ2RIUOf4VSyuDnvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781945880; c=relaxed/simple;
	bh=5vPbQ3IzQzpYfa6CDvvbNK38fWlfOq7Maxwhnqbq3hI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FcQT2PwgXon77aWecsISI9p7wk2xqSTnSgiTO0Ks42SPBEmxPyHoMYzjvRPbWs4wTuI6nB6OV314g/lunkKATxQzWiRZpRC1ZNbq6b212ssyJd89TlZ5ueX4HpV17SvdShZk6co1dSOOlA7fcnmvtntBSm2HSzSwsLBtiPoeVi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8/srhQR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8/srhQR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DEA21F00A3A;
	Sat, 20 Jun 2026 08:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781945879;
	bh=7OcgZ3HE+xOnBXBRWZ3KU73k/PeMcOX9gUqt46ftBEU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F8/srhQRPdvTmBmdGK8tkkcrf5KTikFTVsEHv59b55LtvbTlYyNa5ch55T6nMfUAH
	 khiaKekw44KlrNqOEKWdHymFIo6jTrdJnxQexL+xLKKgqHyPI+ysbOEREXOyhueYl8
	 +KlfQdh5BdWeqrbBdfm7K8a/MYe+buO9zcybg3loc7bNaMF5JBX2BsQw80d6GIXpiy
	 fU20lv7ZjHlFbGOGXBZe0l8VPNTu7HgJWJAeMoM+373c97zXGtUc+8uF67BRD+DeDK
	 q5Iv3wGPUaIIw12CjYeBYl7CPgt+OOshimQe/Xt8Ukl+SkuluFCj3SK0l4HX6I7THf
	 8TVVwU1SX8Y8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] spi: atcspi200: return error from failed controller
 suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiawen Liu" <1298662399@qq.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <tencent_306FA547FD68D10EE4B2AE9C132060F12F06@qq.com>
References: <20260620083931.1120616-1-1298662399@qq.com>
 <tencent_306FA547FD68D10EE4B2AE9C132060F12F06@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Jun 2026 08:57:58 +0000
Message-Id: <20260620085759.3DEA21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Using dmaengine_terminate_all() on timeout leads to memory corrupt=
ion and completion race conditions.
- [High] Driver ignores -EPROBE_DEFER from DMA channel request, permanently=
 disabling DMA.
- [High] Missing hardware reset after a transfer timeout leaves the SPI con=
troller in a stuck state.
--

commit 68634bef983da7c31a412c03f17d17fa06e49838
Author: Jiawen Liu <1298662399@qq.com>

spi: atcspi200: return error from failed controller suspend

spi_controller_suspend() can fail when the SPI core cannot stop the
controller. atcspi_suspend() ignored that error and disabled the
controller clock anyway. Return the error before disabling the clock.

> diff --git a/drivers/spi/spi-atcspi200.c b/drivers/spi/spi-atcspi200.c
> index 6d4b6aeb3f5b1..e0fd101a62bc8 100644
> --- a/drivers/spi/spi-atcspi200.c
> +++ b/drivers/spi/spi-atcspi200.c
> @@ -599,8 +599,11 @@ static int atcspi_suspend(struct device *dev)
>  {
>  	struct spi_controller *host =3D dev_get_drvdata(dev);
>  	struct atcspi_dev *spi =3D spi_controller_get_devdata(host);
> +	int ret;
> =20
> -	spi_controller_suspend(host);
> +	ret =3D spi_controller_suspend(host);
> +	if (ret)
> +		return ret;
> =20
>  	clk_disable_unprepare(spi->clk);
> =20

While reviewing this patch, I noticed a few pre-existing issues in this fil=
e.

[Severity: High]
This is a pre-existing issue, but I noticed atcspi_dma_trans() uses the
asynchronous dmaengine_terminate_all() on timeout, followed immediately by
unmapping the buffers:

drivers/spi/spi-atcspi200.c:atcspi_dma_trans() {
    ...
		dmaengine_terminate_all(dma_ch);
	}

exit_unmap:
	spi_controller_dma_unmap_mem_op_data(spi->host, op, &sgt);
    ...
}

Does this risk memory corruption? Because dmaengine_terminate_all() doesn't
guarantee the DMA engine has stopped accessing memory, unmapping it here
could cause IOMMU faults.=20

Additionally, if atcspi_dma_callback() fires after the unmap, could it
prematurely complete spi->dma_completion for the next transfer? Should this
use dmaengine_terminate_sync() instead?

[Severity: High]
This isn't a bug introduced by this patch, but it looks like atcspi_probe()
might defeat the probe deferral mechanism for the DMA controller:

drivers/spi/spi-atcspi200.c:atcspi_probe() {
    ...
		ret =3D atcspi_configure_dma(spi);
		if (ret)
			dev_info(spi->dev,
				 "Failed to init DMA, fallback to PIO mode\n");
    ...
}

Since atcspi_configure_dma() uses devm_dma_request_chan(), what happens if
it returns -EPROBE_DEFER when the DMA controller hasn't probed yet?=20

By catching the error and silently dropping it to fall back to PIO mode, wi=
ll
the device be permanently stuck in PIO instead of waiting for the DMA
controller to become available?

[Severity: High]
This is another pre-existing issue, but missing a hardware reset after a
transfer timeout in atcspi_exec_mem_op() seems problematic:

drivers/spi/spi-atcspi200.c:atcspi_exec_mem_op() {
    ...
		if (ret) {
			dev_info(spi->dev, "SPI transmission failed\n");
			goto exec_mem_exit;
		}
    ...
}

When jumping to exec_mem_exit on an error (like -ETIMEDOUT from
atcspi_dma_trans()), we skip waiting for the ATCSPI_ACTIVE bit to clear.=20

Does this leave the SPI controller's internal state machine stuck waiting f=
or
the timed-out transfer? If a new transfer is initiated while the controller
is still active, could writing to the ATCSPI_CMD register lock up the
hardware or corrupt the new transaction? Should a hardware reset be perform=
ed
on this error path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260620083931.1120=
616-1-1298662399@qq.com?part=3D1
