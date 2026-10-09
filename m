Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677F54CDDDC
	for <imx@lists.linux.dev>; Fri,  9 Oct 2026 11:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545883; cv=none; b=oYDPLNjUfSBZJ9G7jBeme3UeA5zWmKxCyaNuU3l8vBtsMcYKyBt+u81R1cJvN/rGrP4Uhc4mAiqZejMjvTK30u8GF0yUuoByrIFJfO5DQAt1W+4TiOohDvo59x0ZmdQsIUzphcDSf3ZI6TSD9tazufapMcdvaN8iQu8fOgjQlFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545883; c=relaxed/simple;
	bh=g+5z6mBdKG3lQRMgLs2U21D4ZDXGyOu5Mk6Vt8+uCdI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=fAOecT+z8HxolnmrZe8xwukq0B4uqXOhupKwLQk78VuFfVpa5qt1Uu6+tlWFcRhgZ3bZo9Q4jshvRvv3i55S7HRAhHP1Ek8TYsHzDtiqULxYAp4QoUjD0qE6N4W6tSFFPElq5u1HTElg20EqJ6jVN9aojxoKuPa7SY3YBdFubko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KF3KL6wj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KF3KL6wj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828871F000FF;
	Fri,  9 Oct 2026 11:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791545870;
	bh=FMpo6PDmWHVvCIoScpby2T8i9cisiDGg+i0hQp7oYHA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KF3KL6wjjRRJxWC02CueyyJwzi/VLVAmvHN/uuHy3Euz++iE8EN9OJFzvX0euIvIL
	 lbq/CPxQqqnT7wl6JKeZ6jLONgus85Sp/JcHUmjL5Kx6W9yQJkhXXH635hjea60B8K
	 xOAy16sI9NCxVWTuzNsyHSkO8ZQxiQgRhQiBezwz4YaMaqorPAfCrCC0XLwhJi3Y2m
	 lzCDeCCpI6mHkiYO3jmkVKTQUtiWtQ0s9NCPkHfc4m7d13q/C+eokRlG75WpI8Wtg6
	 5fnnxWzu7Emp2vXi9IbHJfAqEKuiBSro+tplaOlv5Ens+zQH5nPeSGOvtVPHCs/GvJ
	 ITg9zGlkIbPjw==
Message-ID: <sashiko-outbox-165399@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH spi-next 3/3] spi: spi-fsl-lpspi: cache content of
 Interrupt Enable Register (IER)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marc Kleine-Budde" <mkl@pengutronix.de>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261009-spi-fsl-lpspi-more-cleanups-v1-3-2d4549d5205e@pengutronix.de>
References: <20261009-spi-fsl-lpspi-more-cleanups-v1-0-2d4549d5205e@pengutronix.de>
 <20261009-spi-fsl-lpspi-more-cleanups-v1-3-2d4549d5205e@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 11:37:50 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] spi: spi-fsl-lpspi: UAF on transfer buffers due to missing synchro=
nize_irq()
--

commit 4ef518b968fd8b8211ea0f4d3855f25f96b7a64e
Author: Marc Kleine-Budde <mkl@pengutronix.de>

spi: spi-fsl-lpspi: cache content of Interrupt Enable Register (IER)

To improve performance avoid reading the Interrupt Enable Register (IER)
from the hardware, cache in struct fsl_lpspi_data::reg_ier.

Introduce struct fsl_lpspi_data::reg_ier, to cache the current value.
Extend fsl_lpspi_intctrl() to update the cache and replace the open coded
writing of the IRQ register in fsl_lpspi_prepare_message() with
fsl_lpspi_intctrl().

In fsl_lpspi_isr() don't read the IER from the hardware, but use the cached
value from struct fsl_lpspi_data::reg_ier.

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>

> diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
> index b25f94b2ef738..5b158b0cb5af5 100644
> --- a/drivers/spi/spi-fsl-lpspi.c
> +++ b/drivers/spi/spi-fsl-lpspi.c

[ ... ]

> @@ -199,6 +200,7 @@ LPSPI_BUF_TX(u32)
>  static void fsl_lpspi_intctrl(struct fsl_lpspi_data *fsl_lpspi,
>  			      unsigned int enable)
>  {
> +	fsl_lpspi->reg_ier =3D enable;

[Severity: High]
Could modifying reg_ier without locks here introduce a data race with the I=
SR?

If an SPI PIO transfer times out or is aborted, fsl_lpspi_reset() is called=
 to
disable interrupts, but it does not call synchronize_irq().

Because the ISR caches reg_ier into temp_IER and then later restores it by
calling fsl_lpspi_intctrl(fsl_lpspi, IER_FCIE | (temp_IER & IER_TDIE)), it =
can
re-enable hardware interrupts and overwrite reg_ier after fsl_lpspi_reset()=
 has
disabled them.

This actively widens the window for a use-after-free regression on the
transfer buffers, as the SPI core frees them immediately after
fsl_lpspi_reset() returns.

>  	writel(enable, fsl_lpspi->base + IMX7ULP_IER);
>  }
> =20

[ ... ]

> @@ -808,7 +810,7 @@ static irqreturn_t fsl_lpspi_isr(int irq, void *dev_i=
d)
>  	u32 temp_SR, temp_IER;
>  	struct fsl_lpspi_data *fsl_lpspi =3D dev_id;
> =20
> -	temp_IER =3D readl(fsl_lpspi->base + IMX7ULP_IER);
> +	temp_IER =3D fsl_lpspi->reg_ier;
>  	fsl_lpspi_intctrl(fsl_lpspi, 0);
>  	temp_SR =3D readl(fsl_lpspi->base + IMX7ULP_SR);
> =20

[Severity: High]
Can a concurrent or delayed ISR dereference stale rx_buf and tx_buf pointers
here?

When an SPI PIO transfer times out or is aborted, the SPI core returns to t=
he
caller and the transfer buffers (often on the stack) are freed. If the
ISR executes concurrently because synchronize_irq() is missing in the timeo=
ut
path, it will unconditionally call the FIFO helpers:

drivers/spi/spi-fsl-lpspi.c:fsl_lpspi_isr() {
    ...
	temp_IER =3D fsl_lpspi->reg_ier;
	fsl_lpspi_intctrl(fsl_lpspi, 0);
	temp_SR =3D readl(fsl_lpspi->base + IMX7ULP_SR);

	fsl_lpspi_read_rx_fifo(fsl_lpspi);

	if ((temp_SR & SR_TDF) && (temp_IER & IER_TDIE)) {
		fsl_lpspi_write_tx_fifo(fsl_lpspi);
    ...
}

This can corrupt the stack or heap by overwriting the freed rx_buf pointer.

Should synchronize_irq() be called during the timeout or abort path, and
should reg_ier modifications be protected against concurrent ISR execution?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-spi-fsl-lp=
spi-more-cleanups-v1-0-2d4549d5205e@pengutronix.de?part=3D3
