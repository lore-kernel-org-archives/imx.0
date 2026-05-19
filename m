Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9C94A2E1A
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188639; cv=none; b=G/2oBffVbyvgcy5Q2ehG7LCPNsVH+738kVpnORtzfKSEO3a4sqfX4cqG1PlcZTXwdIKMlRGgM80PYKONydQWMEQcKoj5SkkjHyEnlTVTW11QPKqbO3svqIbQZPSGthIYbCLyQTzhgdHHdd24GDLE8X1RdloquEsqvM4vjZUGNlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188639; c=relaxed/simple;
	bh=ukXg3nruL1QeONIwd8kewePrkiDKMq9yOQTpfIudBLo=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TN8g3KclFa6EvXDJ9WBt8m69bNF8d0x4Q/9LMtlYDVqiuLaODwJD5I69PSrBx3W9MXL6V+S3QPciPcW3t4uGgmRAJr7CzI7mhmA1PNqHsJaMiyKg+1APCHqLw4EUfLq7DCkn40qtvDbb0x4q85dKCj5Wx618+kJAH1/iuAFnM7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k9Ibr/5Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k9Ibr/5Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67EEC2BCB3;
	Tue, 19 May 2026 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779188638;
	bh=ukXg3nruL1QeONIwd8kewePrkiDKMq9yOQTpfIudBLo=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date:From;
	b=k9Ibr/5Q5TtNKVuB4amRRXOsNaebNAppGOsV9RDn4i7OeTf69u+1jXlu/NxYThEdI
	 p61QNapayPKyf1UM5QfcPx7vym54Lm1Zm/W4LUwPtW9uJ+6sZkypGMjVxDdCDDxeME
	 dTDbghqeOSA/ANxi/yKjPKkUyPAv2Q8eGFAVdOZIdSoaSs6/NqGpjmcznjzkPS5c2x
	 cE3q24miwl4jCpFnQIs8XF4afXJzk9Ah6HRoMsVW+g63DAEn5cP2/Jrcsx8wC6ikMW
	 yezn2nyQpzxiRq0iwKgYCouzVpj7XrHCDBqd1SbVRuFdl9J6zPcUpvBUetFH/oFbf8
	 Ot4hbeY5vyZXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] spi: fsl-lpspi: replace dmaengine_terminate_all with
 dmaengine_terminate_sync
Reply-To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260519104517.2794390-1-carlos.song@oss.nxp.com>
References: <20260519104517.2794390-1-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:03:58 +0000
Message-Id: <20260519110358.A67EEC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Missing termination of the active RX DMA channel when TX DMA p=
reparation fails, leading to potential memory corruption.
--

commit ec7592d39a6caaca48276f43db4b9a0f4fa50bfd
Author: Carlos Song <carlos.song@nxp.com>
spi: fsl-lpspi: replace dmaengine_terminate_all with dmaengine_terminate_sy=
nc

This commit replaces the deprecated dmaengine_terminate_all() API with
dmaengine_terminate_sync() in the fsl-lpspi driver.

> diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
> index e201309f8aae3..1a94a42fac319 100644
> --- a/drivers/spi/spi-fsl-lpspi.c
> +++ b/drivers/spi/spi-fsl-lpspi.c
[ ... ]
> @@ -647,7 +647,7 @@ static int fsl_lpspi_dma_transfer(struct spi_controll=
er *controller,
>  				tx->sgl, tx->nents, DMA_MEM_TO_DEV,
>  				DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>  	if (!desc_tx) {
> -		dmaengine_terminate_all(controller->dma_tx);
> +		dmaengine_terminate_sync(controller->dma_tx);

Because controller->dma_rx was already submitted and issued just prior to
preparing desc_tx, does this error path also need to terminate the RX
channel?

If dmaengine_prep_slave_sg fails for the TX channel and the driver returns
-EINVAL, the SPI core will abort the transfer and unmap the buffers. Since
controller->dma_rx is still running, could this cause the DMA controller to
write to freed or unmapped memory?

This wasn't introduced by your patch, but modifying this exact error path
might be a good opportunity to fix the missing RX channel cleanup.

>  		return -EINVAL;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519104517.2794=
390-1-carlos.song@oss.nxp.com?part=3D1
