Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789149;
	b=NrZr7Z0b63CQeORGo1opX6Kq+JNer7c5Ea5h7MLCsvjxJUKgo63HzzcoEkCNzDetprfw
	 sex+WWFkJYaIBwspe2QzM4ROR7BX+x+XNA2zx75F/FTKCK+sIey0qN8IJZiLwt2Bkfaac
	 EDd1dB1z9GsNiyi4WercVlQU4R3Z07wo3njAh7UARBgTTV3tzU8CHsLB96TWbVbobG/tq
	 EsPKfk/x0hGg43WHkCK9hyE/B+8Ugp7FNXmGOhrhruMjlQZEie8v17cHBPxAYQtcAg4/8
	 V6KbVGbFlEW4TCpMXNEzLqStBBinmrTBuKpD/iUpOXg2VifSZMB1TqqfPpMWf0J74aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789149;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=S4FbJe/ev9jvsq2lbBqMvl23o9jD5M9Tz//lv5+mmG4=;
	b=YR2r8TIRLxS1sspVPVmO9IrMIgHH16xU1q6xzOirP+3POF9WRTnerDZTWitkPywiSpcg
	 SksJIGEIM3ufUTKpzFCyHLsyYThv0yNwGks/7O2F0yxc3wxvMpfQhkyfzjugmN1G85PQ6
	 h/CUUM6y0o/3QjEGAxtsoYuGAMyxDipZQjCjzYlYnwU8OuWSEdZRwIUYx6VPEX9sgwM2M
	 PlBhJQYFHpmC8ZPiJddsmOe51HS8cjkFzJOnZ+23dLpJhCpT1L6NBADSyBTHKKghNxQca
	 MKZ9xJO3b4MEbq5AAvzUB1/7UjcYQgTyl4IDCCwxE8JZsV4ZtYRbJ/cFU1C7tEia9pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SJsbRQlM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861F2606A31C
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 14:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SJsbRQlM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42F51F000C1;
	Fri, 27 Nov 2026 14:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789149;
	bh=S4FbJe/ev9jvsq2lbBqMvl23o9jD5M9Tz//lv5+mmG4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SJsbRQlMGqme629mTLLNwC8RriA6AtU0hi6vFlWSpEDGVi4c0nd4ij7wg4b6iP/ES
	 NMDwdogA5lOc/lQWuVz2hupvVbWrqbwhb/REZfIA7QHOVbXz49cp8wPctyQr4WF8dK
	 SIgymblPipydA5SDIknXn46GXR0KsqrvVq0eoyLShS9nlSIi/AFT2XyCj7DG5j3EaP
	 GeJIv7ZGKHnG21ttHgjbXwuejQLp2TnmgSSOJqGpVSgPJrYc6NoisyhMscT+a9tjVb
	 DXVID8HnNPD89RrYlKnOFRyFXJlhEKmH9buewu/p0+pXgbKlYm6wnkL03gQj3RpuuJ
	 eftnbPa0WjeKA==
Message-ID: <sashiko-outbox-237552@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v4] spi: fsl-lpspi: add atomic transfer support
Reply-To: sashiko-reviews@lists.linux.dev
To: ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261127140228.48851-1-chunyuzhiqiang@yinhe.ht>
References: <20261127140228.48851-1-chunyuzhiqiang@yinhe.ht>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 14:19:08 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] spi: fsl-lpspi: premature TCR_CONTC clear in
  fsl_lpspi_pio_xfer_atomic()
--

commit f448f305f9614918db9e4edf6fb2c18c134df2de
Author: ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>

spi: fsl-lpspi: add atomic transfer support

This commit implements transfer_atomic() for the i.MX LPSPI controller
using PIO polling, caches the per-clock rate for atomic context, and
registers poweroff and restart prepare handlers to runtime-resume the
controller.

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

[Severity: High]
Does writing IMX7ULP_TCR with TCR_CONTC cleared before calling
fsl_lpspi->tx() queue the terminating command word ahead of the final data
word in the shared TX FIFO?

Because temp read from IMX7ULP_TCR still has TCR_CONT set and writes to
IMX7ULP_TCR and IMX7ULP_TDR share the TX FIFO, a single-word atomic
transfer pushes the command word before the data word and queues no
command word after it, so continuous mode never ends and the SR_FCF poll
times out with -ETIMEDOUT.  Multi-word transfers end the frame one word
early and leave the final word in an unterminated continuous transfer.

In the normal PIO path, fsl_lpspi_write_tx_fifo() pushes the data words
via fsl_lpspi->tx() first and clears TCR_CONTC only after
fsl_lpspi->remain reaches zero:

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

Wait for SR_TDF and write IMX7ULP_TCR with TCR_CONTC cleared after the
final data word has been pushed by fsl_lpspi->tx(), as the commit message
describes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127140228.4885=
1-1-chunyuzhiqiang@yinhe.ht?part=3D1
