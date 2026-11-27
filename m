Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785971;
	b=U83aiVYR8JY2wo5DYuHb1s2zMDqCMwJCt+Np1MxEZ1bBQV2E1oUogKIliI9wOmQkYhZB
	 9g576AijL07s/Pitww4SmC0OmAFfcUsl4aah1YDyVcRRZFomDa7hFK7eQSqrdu7wUe8Sl
	 xJaHYFyrZ1d+xRViuO6ILzCuHu41f3u0/1D+XdRmm2Ezd9FCP/05o2HPZkxzZ9GTvmsmT
	 FXNSybsHFY37PIDoAqziuI3vn2RLciJsLla24OuD2Y3ncTqfRjRd2sfrn0N1CKBoNG5zd
	 TgstoUyHtzRMCYddJfAibaSKOkAiqDUs7RsHmofR4eCOnVpfernR1UMs85s2SuJsRHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785971;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=80SNGgEOJMD/m8Z6f5rX9QUM/aori16kzHPgFt1Tx0E=;
	b=qcgnoShUIrk9Gk2crksUOviwf0HVNqxx5b2kT8tMqpGYhdgCcpo6AgwpTRnrMGAdyvhE
	 BL1689FGBpyEVzHdme24Yo6Qn/3P9Bcocq3pLMARET0QLRX7qHxVMIa8GZ24EWY3kdGbL
	 HW0gi++mr4u7Z+L9NFV7c100HHq1itm8BA+AZQvYsCf5t7qwiufMItchEWXXDSRXdPTP6
	 oczkfYLe1oD7qdh9QUC4uthdtYgMgtZpNqohMMOgZoA/PAM/3fZ4TzfS9UJtaK+k8Gki8
	 fS3t/yLpyVq8ihjXEQfg2cmSsd/B7O/vFmONzYvzDqHoHMVBhFNKZnDCcYkk0us/jdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bb4IFEG0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93200606A31C
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 13:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bb4IFEG0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8E01F00893;
	Fri, 27 Nov 2026 13:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795785971;
	bh=80SNGgEOJMD/m8Z6f5rX9QUM/aori16kzHPgFt1Tx0E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bb4IFEG08lQbacF4kexzt5Khx9P6By/E/u4sZEZyQ1NL3QAIYf2TaTrOHBwGysS3w
	 ob1HbWXdwhZO5O3AsaNF9wPH3dkkNcTnGtn6iQFGNxl5eQSR2qNlrWyR2Q2WB0dsqG
	 qgWSyO/PKPcGP7AaA6LxhKeTaQ/Txpg5QkXZaBhd56lgbkeFpmp6VaBNGEJW5ERsnW
	 fgbJ1KRcyfvuE49+MSiACWCL/IDzJ5Uix8H6nm8JlEJTJQv8nSlage6BiaK6NvGUeH
	 6Huz+nXjd4kdhcoHmMEhHVMN0Asjou3a0sY413Slb4HYVAMiOKXVnAmL6ECHhYLh3N
	 cnasa5hvr1J8w==
Message-ID: <sashiko-outbox-237486@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v3] spi: fsl-lpspi: add atomic transfer support
Reply-To: sashiko-reviews@lists.linux.dev
To: ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261127125827.22857-1-chunyuzhiqiang@yinhe.ht>
References: <20261127125827.22857-1-chunyuzhiqiang@yinhe.ht>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 13:26:10 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] spi: fsl-lpspi: premature TCR_CONTC clear in
  fsl_lpspi_pio_xfer_atomic()
- [High] spi: fsl-lpspi: broken TCR_CONTC handling in
  fsl_lpspi_transfer_atomic()
--

commit 1c6b4fd740bc599cecc8d77f094463efe4a15041
Author: ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>

spi: fsl-lpspi: add atomic transfer support

This commit implements the transfer_atomic() callback for the i.MX LPSPI
controller using PIO polling, caches the peripheral clock rate for atomic
contexts, and registers sys_off handlers to runtime-resume the controller
before poweroff and restart.

> diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
> index ed395f822dab1..bc76a564137b9 100644
> --- a/drivers/spi/spi-fsl-lpspi.c
> +++ b/drivers/spi/spi-fsl-lpspi.c

[ ... ]

> @@ -774,6 +785,148 @@ static int fsl_lpspi_pio_transfer(struct fsl_lpspi_=
data *fsl_lpspi,
>  	return ret;
>  }
> =20
> +static int fsl_lpspi_pio_xfer_atomic(struct fsl_lpspi_data *fsl_lpspi,
> +				     struct spi_transfer *t)
> +{
> +	u32 sr, temp, timeout_us;
> +	unsigned int bytes_per_word;
> +	int ret;
> +
> +	/* One frame plus margin, at least 1ms. */
> +	timeout_us =3D DIV_ROUND_UP(fsl_lpspi->config.bpw * USEC_PER_SEC,
> +				  fsl_lpspi->config.speed_hz);
> +	timeout_us =3D max(timeout_us * 2, 1000U);
> +
> +	bytes_per_word =3D spi_bpw_to_bytes(fsl_lpspi->config.bpw);
> +	fsl_lpspi->tx_buf =3D t->tx_buf;
> +	fsl_lpspi->rx_buf =3D t->rx_buf;
> +	fsl_lpspi->remain =3D t->len;
> +
> +	while (fsl_lpspi->remain) {
> +		ret =3D readl_poll_timeout_atomic(fsl_lpspi->base + IMX7ULP_SR,
> +						sr, sr & SR_TDF, 0, timeout_us);
> +		if (ret)
> +			return ret;
> +
> +		/* Terminate continuous mode before the last frame. */
> +		if (fsl_lpspi->remain =3D=3D bytes_per_word) {
> +			temp =3D readl(fsl_lpspi->base + IMX7ULP_TCR);
> +			temp &=3D ~TCR_CONTC;
> +			writel(temp, fsl_lpspi->base + IMX7ULP_TCR);
> +		}
> +
> +		fsl_lpspi->tx(fsl_lpspi);
> +
> +		ret =3D readl_poll_timeout_atomic(fsl_lpspi->base + IMX7ULP_RSR,
> +						sr, !(sr & RSR_RXEMPTY), 0,
> +						timeout_us);
> +		if (ret)
> +			return ret;
> +		fsl_lpspi->rx(fsl_lpspi);
> +	}
> +
> +	ret =3D readl_poll_timeout_atomic(fsl_lpspi->base + IMX7ULP_SR, sr,
> +					sr & SR_FCF, 0, timeout_us);
> +	if (ret)
> +		return ret;

[Severity: High]
Does writing IMX7ULP_TCR with TCR_CONTC cleared before calling
fsl_lpspi->tx() push the command word into the TX FIFO ahead of the last
data word rather than after it?

Writes to IMX7ULP_TCR and IMX7ULP_TDR are queued sequentially in the same
TX FIFO, and the value read from IMX7ULP_TCR still has TCR_CONT set.  In
the normal PIO path, fsl_lpspi_write_tx_fifo() pushes all data words via
fsl_lpspi->tx() until fsl_lpspi->remain reaches 0 before writing
IMX7ULP_TCR with TCR_CONTC cleared:

drivers/spi/spi-fsl-lpspi.c:fsl_lpspi_write_tx_fifo() {
	...
	while (txfifo_cnt < fsl_lpspi->txfifosize && fsl_lpspi->remain) {
		fsl_lpspi->tx(fsl_lpspi);
		txfifo_cnt++;
	}

	if (txfifo_cnt < fsl_lpspi->txfifosize) {
		if (!fsl_lpspi->is_target) {
			temp =3D readl(fsl_lpspi->base + IMX7ULP_TCR);
			temp &=3D ~TCR_CONTC;
			writel(temp, fsl_lpspi->base + IMX7ULP_TCR);
		}
	...
}

Queuing the command word before fsl_lpspi->tx() writes the final data word
leaves continuous mode active after that final word is shifted out.
Single-word atomic transfers will never assert SR_FCF and will time out,
while multi-word transfers will end the continuous frame one word early
and transmit the last word in a new unterminated continuous transfer.

> +	writel(SR_FCF, fsl_lpspi->base + IMX7ULP_SR);
> +	return 0;
> +}
> +
> +static int fsl_lpspi_transfer_atomic(struct spi_device *spi,
> +				     struct spi_message *msg)
> +{

[ ... ]

> +	list_for_each_entry(t, &msg->transfers, transfer_list) {
> +		if (t->len) {
> +			fsl_lpspi->is_first_byte =3D first_xfer;
> +			ret =3D fsl_lpspi_setup_transfer(controller, spi, t, true);
> +			if (ret)
> +				break;
> +
> +			t->effective_speed_hz =3D fsl_lpspi->config.effective_speed_hz;
> +
> +			if (t->len %
> +			    spi_bpw_to_bytes(fsl_lpspi->config.bpw)) {
> +				ret =3D -EINVAL;
> +				break;
> +			}
> +
> +			fsl_lpspi_set_cmd(fsl_lpspi);
> +			fsl_lpspi->is_first_byte =3D false;
> +
> +			ret =3D fsl_lpspi_pio_xfer_atomic(fsl_lpspi, t);
> +			if (ret)
> +				break;
> +
> +			msg->actual_length +=3D t->len;
> +			fsl_lpspi_reset(fsl_lpspi);
> +			first_xfer =3D false;
> +		}

[Severity: High]
Does setting first_xfer =3D false after fsl_lpspi_pio_xfer_atomic() and
fsl_lpspi_reset() cause subsequent transfers in a multi-transfer message
to start with TCR_CONTC set when no continuous transfer is active?

At the end of each transfer, fsl_lpspi_pio_xfer_atomic() terminates the
frame and waits for SR_FCF, and fsl_lpspi_reset() disables the module and
flushes the TX and RX FIFOs.  On the next transfer in msg->transfers,
fsl_lpspi->is_first_byte is set to false, so fsl_lpspi_set_cmd() programs
TCR_CONT | TCR_CONTC into IMX7ULP_TCR even though the previous continuous
transfer already completed and the controller was reset.  Combined with
fsl_lpspi_pio_xfer_atomic() clearing TCR_CONTC before writing the last
data word to IMX7ULP_TDR, multi-transfer atomic messages will fail or time
out.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127125827.2285=
7-1-chunyuzhiqiang@yinhe.ht?part=3D1
