Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0D62B9B7
	for <imx@lists.linux.dev>; Sat, 20 Jun 2026 08:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781945598; cv=none; b=Jpx3AeMSEPKdCDq/DPXLkcyXsTQecSusxCIdboFf5s/1kRJsnLMfu286p9VOSi/xkcv1CqM2hwZFwcAiUmj7LUz4nzz2lm9jtfeSpxM18M1TmuAYWAZ+hMithDutbKw6wb92XxqVhKYgy6sHT++hUSi1M6fRvYheUQrvqmPFQlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781945598; c=relaxed/simple;
	bh=jzujov5KVFrioxSDVTLOhcy5+Uk218TA8Stde0UfoXc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W8qMCCc28xM5+xZsiRTybH4LyKqCtxbtkp2xxQlLKClkYv4CJxnI6BHvo4Qz0p5jtCkj0WAu240OikddwcJt1TMVYqol8lyCiGPibUN5OCmfNWpxzNPkKCxze4N/NhkuSz1ZsDWJZ1FnkNQSd2iIcQA68W6LasLLOnYU0qaINVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ON0EMthK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ON0EMthK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF6B21F000E9;
	Sat, 20 Jun 2026 08:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781945597;
	bh=E9GNJC1coCFy6JVh2gDOFTUcmNTdeO6Yyuk3VgduJdY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ON0EMthKdbOuN2MlyAsa/9y0u0XeK9qJ2Kf/I6sUfXxqYHmO9XKBNr1k/+laL9J7o
	 aZlsCDYbZ1h2iXgBpBh/SDVRktxtv5z+zy/Q6TkvDYZT+Y8wEiM/br2hd5tXgi+Nnw
	 Ah9DnGSKRSNepJyE95Q50mhRSsvDiWVKwMR9p15Bfiw+1YmWqlYZu+0EgnhcUULI/O
	 1LwnCJmloVRmTTRwvqbk6Me3sicL6sth8BxnbbL2Y1cmAxmuOhQpJ8HC1D2PrhvbRH
	 5NbzYYD4sWhzbsCvo7HBHvwdMj+3PiTQVzE+5iq9mCQM7ZiHj2Qa0e6RZmMEUF5ACD
	 eBJ5rjJr3GmJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] spi: fsl-dspi: clean up after failed suspend and
 resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiawen Liu" <1298662399@qq.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <tencent_427FA55E3D59112524886E9C931CA0F92F06@qq.com>
References: <20260620083931.1120616-1-1298662399@qq.com>
 <tencent_427FA55E3D59112524886E9C931CA0F92F06@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Jun 2026 08:53:16 +0000
Message-Id: <20260620085316.DF6B21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Deadlock and guaranteed 5-second suspend timeout due to incorrect =
lifecycle ordering in dspi_suspend().
- [High] Race condition and potential deadlock in dspi_resume() due to resu=
ming the SPI queue before hardware initialization.
--

commit 98c391bd91fadd1b60a50d12e8e2491310c7b7ea
Author: Jiawen Liu <1298662399@qq.com>

spi: fsl-dspi: clean up after failed suspend and resume

This patch updates the suspend and resume routines to better handle failure=
s.
It ensures the IRQ is re-enabled if spi_controller_suspend() fails, and
properly unwinds clock preparation if controller resume or hardware
initialization fails.

> diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
> index 019d05cdefe69..c2d283876ef80 100644
> --- a/drivers/spi/spi-fsl-dspi.c
> +++ b/drivers/spi/spi-fsl-dspi.c
> @@ -1464,10 +1464,18 @@ static int dspi_init(struct fsl_dspi *dspi)
>  static int dspi_suspend(struct device *dev)
>  {
>  	struct fsl_dspi *dspi =3D dev_get_drvdata(dev);
> +	int ret;
> =20
>  	if (dspi->irq)
>  		disable_irq(dspi->irq);
> -	spi_controller_suspend(dspi->ctlr);
> +
> +	ret =3D spi_controller_suspend(dspi->ctlr);

[Severity: High]
This is a pre-existing issue, but does disabling the IRQ before suspending
the controller cause active transfers to hang?

Looking at dspi_suspend(), disable_irq() is called before
spi_controller_suspend(). When spi_controller_suspend() stops the queue, it
waits up to 5 seconds for the active transfer to finish.

However, if the active transfer requires the hardware interrupt handler to
complete, it will never finish because the IRQ is already disabled. This
seems like it would guarantee a 5-second timeout, causing
spi_controller_suspend() to return -EBUSY and abort the suspend.

Should the controller be suspended before the IRQ is disabled?

> +	if (ret) {
> +		if (dspi->irq)
> +			enable_irq(dspi->irq);
> +		return ret;
> +	}
> +
>  	clk_disable_unprepare(dspi->clk);

[ ... ]

> @@ -1485,12 +1493,15 @@ static int dspi_resume(struct device *dev)
>  	ret =3D clk_prepare_enable(dspi->clk);
>  	if (ret)
>  		return ret;
> -	spi_controller_resume(dspi->ctlr);
> +
> +	ret =3D spi_controller_resume(dspi->ctlr);
> +	if (ret)
> +		goto disable_clk;
> =20
>  	ret =3D dspi_init(dspi);

[Severity: High]
This isn't a bug introduced by this patch, but does calling
spi_controller_resume() before dspi_init() and enable_irq() create a race
window?

spi_controller_resume() unblocks the message pump, allowing the worker
thread to immediately dispatch pending transfers. If a transfer starts
before dspi_init() initializes the hardware state, it might interact with
uninitialized registers.

Additionally, dspi_init() clears the status registers:

	regmap_write(dspi->regmap, SPI_SR, SPI_SR_CLEAR);

If a racing transfer sets completion flags in the hardware right as
dspi_init() clears them, the interrupt could be permanently lost. The
worker thread would then deadlock waiting for the xfer_done completion
event.

Should the hardware and IRQs be fully restored before resuming the queue?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260620083931.1120=
616-1-1298662399@qq.com?part=3D3
