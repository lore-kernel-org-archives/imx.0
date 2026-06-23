Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A999272E6D
	for <imx@lists.linux.dev>; Tue, 23 Jun 2026 15:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229758; cv=none; b=QrqF/NlWS9lji3hMz2Z14MwmVR7zcGjQO+A6Xu5ikaONuYUcMuzAgQKEUXETlWHluAG7N66C14EDHucGm+RQ0lLtDwmYl0VaG0hqvZBXpwKszSBThSLNnwAAHm8GJN37bbv6sE3//CmmRO/lrxyfRbKl7fRqxh81U50TOaawXKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229758; c=relaxed/simple;
	bh=BQdSoUiWENZqBVgAxSlwho3H7mYk5wW76rHGIVOv3K8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QzoM6PfqQuy0upXP7lBJw3yeB/R8wD/7OUtgVpy/lvPtLK+6SYoCoIZsVo0DroMFi77hhTesA07ajP5JhmKSjmXC9ryra2rMuDsQrSOysG3fFPEmqDowla8vPtQQk7/hRw70fa4tIgdl8UPRyM/OEoKAKPFoL7giD6NcgymKVTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwlY8TS0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwlY8TS0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D47D1F00A3A;
	Tue, 23 Jun 2026 15:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782229757;
	bh=8QEAOUkYosH74LQigp9leG8Mhm2+sw53zF30VZm48Lc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dwlY8TS00yncIy4uv0yrT6QMSJ/wrQy69aCUlaXSmu8WdgG4hPLdiIWCqjstQVM4v
	 F7v3VxVjxUug/D2Dr17eOZGos0nBXEUxcR7ZF3pfiVssYA6MEFBR5SgrfpDrj2mcsK
	 3+C46rOSVQ4fokhrcNPPKJn6/QuZ03Ij/urRGkdbcua4qBDMW5qSyrRdyt9Fht2HBG
	 0vllPtJli5MxWkmXwal/KFzOkrMKZCkHsGrViG1iS5SgbbwxQQ7usz+D89jgQpadCP
	 IWYAuU+ESegODptqQeve6w9pcPtJfYm3bUISTNrHKbSxtN2ZWNQcBYI7LXeg4okT8l
	 NHpD3v5ade9mA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] spi: imx: reconfigure for PIO when DMA cannot be
 started
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Fernandez Pastrana" <javier.pastrana@linutronix.de>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260623153240.57185-1-javier.pastrana@linutronix.de>
References: <20260623153240.57185-1-javier.pastrana@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 15:49:16 +0000
Message-Id: <20260623154917.1D47D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Fallback to PIO on partial multi-package DMA failure causes data d=
uplication and memory corruption.
- [High] Lost target abort due to unprotected state re-initialization.
- [High] Target abort fails to wake up DMA completions.
- [High] Interrupts are left enabled on PIO transfer timeout, causing Use-A=
fter-Free.
--

commit db5f8647fd97621341925478931a93f928c1d2fb
Author: Javier Fernandez Pastrana <javier.pastrana@linutronix.de>

spi: imx: reconfigure for PIO when DMA cannot be started

When a DMA descriptor cannot be prepared during an SPI transfer, the transf=
er
falls back to PIO. This patch ensures the controller is correctly reconfigu=
red
for PIO mode before falling back to prevent data corruption.

> diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
> index ae9912905c67a..96b0315d501c4 100644
> --- a/drivers/spi/spi-imx.c
> +++ b/drivers/spi/spi-imx.c
> @@ -2153,6 +2153,8 @@ static int spi_imx_transfer_one(struct spi_controll=
er *controller,
>  		ret =3D spi_imx_dma_transfer(spi_imx, transfer);
>  		if (transfer->error & SPI_TRANS_FAIL_NO_START) {
>  			spi_imx->usedma =3D false;
> +			controller->fallback =3D true;

[Severity: High]
This is a pre-existing issue, but can this fallback cause data duplication
if a multi-package DMA transfer partially succeeds?

Looking at spi_imx_dma_transfer(), a large transfer can be split into
multiple packages:

for (i =3D 0; i < spi_imx->dma_package_num; i++) {
    ...
    ret =3D spi_imx_dma_package_transfer(spi_imx, ...);
    ...
}

If the first package successfully transmits via DMA but a subsequent package
fails DMA preparation and sets SPI_TRANS_FAIL_NO_START, the loop breaks and
returns.

Since we then trigger this PIO fallback, will the PIO transfer start over
from the beginning of the buffer and re-transmit the previously sent data?

> +			spi_imx_setupxfer(spi, transfer);
>  			if (spi_imx->target_mode)
>  				return spi_imx_pio_transfer_target(spi, transfer);

[Severity: High]
This isn't a bug introduced by this patch, but does spi_imx_pio_transfer_ta=
rget()
have a race condition that could cause a permanent hang?

At the beginning of spi_imx_pio_transfer_target(), the driver re-initializes
state unconditionally without locks:

spi_imx_pio_transfer_target()
    ...
    reinit_completion(&spi_imx->xfer_done);
    spi_imx->target_aborted =3D false;
    ...

If the SPI master aborts the transfer asynchronously and spi_imx_target_abo=
rt()
signals the completion just prior to this unprotected reset, could the abort
event be wiped out?

[Severity: High]
This is also a pre-existing issue, but does spi_imx_target_abort() wake up
DMA completions correctly?

When in DMA target mode, spi_imx_dma_submit() waits on spi_imx->dma_tx_comp=
letion
and spi_imx->dma_rx_completion. However, spi_imx_target_abort() uncondition=
ally
completes spi_imx->xfer_done:

spi_imx_target_abort()
    ...
    complete(&spi_imx->xfer_done);

Will an external abort leave the DMA thread waiting indefinitely on the
DMA completions instead of waking it up?

>  			else
>  				return spi_imx_pio_transfer(spi, transfer);

[Severity: High]
This is a pre-existing issue, but does spi_imx_pio_transfer() leave interru=
pts
enabled on timeout?

If wait_for_completion_timeout() expires in spi_imx_pio_transfer(), the
driver returns -ETIMEDOUT:

spi_imx_pio_transfer()
    ...
    if (!time_left) {
        dev_err(&spi->dev, "I/O Error in PIO\n");
        spi_imx->devtype_data->reset(spi_imx);
        return -ETIMEDOUT;
    }

Because it doesn't disable the controller interrupt (MXC_INT_TE), and the
SPI core will free the message structure and buffers, could a delayed SPI
interrupt fire later?

If it does, would spi_imx_isr() access freed buffers via spi_imx_push()?

>  		}
>  		return ret;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623153240.5718=
5-1-javier.pastrana@linutronix.de?part=3D1
