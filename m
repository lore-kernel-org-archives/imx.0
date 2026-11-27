Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795766364;
	b=OUZEuN1hO7BqK+Htchf0cuGM6xdNqzo5/jZV0CIhj3XPz7oYn3tcnX8ATKZBAVKa568H
	 dPac1QFuHKksfKYVcTkaBGLOZy2hb8LxnGtchWMPCPQvei6rwOD9glQoKRwmCkZjNl4Rs
	 CZrooHpGBEzjlNbKTl2UbE4oYb2t3D6nP1IIafoIHVVaFxDJMiRqag1WHnO+l6LpWPKAq
	 486yNRr/uvBbW6ZrXtI6Df5/LoT8AzvTyXX8kaXEylxsoLbuKXlpvw6XMc4lKOtkAabvB
	 WUWdzZSuPeabpWmPWfYg3IJB6/6JqcXn3IbM7vdfm1CWReZTASRBLnBU7WDvvBOYVsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795766364;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bJHGgAfgeXPcuEbgl581CLZ3wqZEbvHYWxNKBe+ALck=;
	b=WggZi5JYga88Xaup/xpcY9xHiQAsAaXTOP5BAnRki9BnzF+CYT8SZ5o9FhRbeYHM9c0o
	 lGFl2iplX8YTKRo1TvdiCKr0ag99dZykNAIMjcD2O3hqIX3i66SQ/VG5ncothdICthtCF
	 3kKQYGws5GgTXtzETzcVhUQt/06rhZ9E8VaqCzmtqybgguPY9bJPL1fUkagng74+14DZD
	 kzg1lADKLbuxDIBZuhbmQtIJHsTzfQAGqPkZ0twbU3SjF1qBV4UOZ94OexitSzFA7gmWN
	 RtRnr6NnMFntdWgTFvFqqyjBHXs/IYrhNPt7EuxozyeRUkdiTDDu+f3w1Sl9fSpgj+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CTTqRyIW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28623606A323
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 07:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CTTqRyIW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7339C1F000C1;
	Fri, 27 Nov 2026 07:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795766363;
	bh=bJHGgAfgeXPcuEbgl581CLZ3wqZEbvHYWxNKBe+ALck=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CTTqRyIWT6X1mSweqFpl73KvXGHHGHhXspP9jxGN61HP4+MT1Dx7zXaRZ1Y+NwZur
	 2CC68A4ZeLnarhi2caI2Su9l0CGyuH2M9dugl7GE0jSZr5RbAQoP7/DBKxloGySHrH
	 PuGxGCU6hD1jAV2mxbsbK5sVgkeyOm8HzNe64kH5EAut3gYkE7SqYbkJcRMKSznu/F
	 v3apR3coRiDz3d3kZ34zPD96M4w1MKjsxzOyVHpjTnGnQYogjeSQIvuU0kbHCqJqKs
	 4fj5lIIewRSyCodmB44KVOxOXjS0yS9XmXF+uWDlpIQ8X6S6twW44+zfBYj14uppsn
	 YHHoEk8sRQWHg==
Message-ID: <sashiko-outbox-236849@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2 1/1] spi: fsl-lpspi: add atomic transfer support
Reply-To: sashiko-reviews@lists.linux.dev
To: ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261127073454.351296-2-chunyuzhiqiang@yinhe.ht>
References: <20261127073454.351296-1-chunyuzhiqiang@yinhe.ht>
 <20261127073454.351296-2-chunyuzhiqiang@yinhe.ht>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 07:59:23 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential
issues to consider:
- [High] spi: fsl-lpspi: RX watermark deadlock in
  fsl_lpspi_pio_xfer_atomic()
- [High] spi: fsl-lpspi: SR_TCF timeout with TCR_CONT in
  fsl_lpspi_pio_xfer_atomic()
- [High] spi: fsl-lpspi: TCR_CONTC set after reset in
  fsl_lpspi_transfer_atomic()
- [Medium] spi: fsl-lpspi: CS asserted before CPOL/CPHA in
  fsl_lpspi_transfer_atomic()
- [Medium] spi: fsl-lpspi: wrong word-size check in
  fsl_lpspi_transfer_atomic()
- [Medium] spi: fsl-lpspi: missing actual_length in
  fsl_lpspi_transfer_atomic()
- [Low] spi: fsl-lpspi: unedited AI assistance placeholder note in
  commit message
--

commit 82f1685db0bb8dc824359af32b18e4e751d9a022
Author: ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>

spi: fsl-lpspi: add atomic transfer support

This commit adds a transfer_atomic() callback for the i.MX LPSPI controller
using polled PIO, caches the peripheral clock rate for atomic context, and
registers sys-off handlers to runtime-resume the controller before shutdown
or restart.

> This patch was prepared with AI assistance; the submitter must review it
> before submission.

[Severity: Low]
This looks like an unedited reminder from an AI tool that should be
removed from the commit message before merging.

> diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
> index ed395f822dab1..e37761d05cd5e 100644
> --- a/drivers/spi/spi-fsl-lpspi.c
> +++ b/drivers/spi/spi-fsl-lpspi.c

[ ... ]

> @@ -774,6 +785,114 @@ static int fsl_lpspi_pio_transfer(struct fsl_lpspi_=
data *fsl_lpspi,
>  	return ret;
>  }
> =20
> +static int fsl_lpspi_pio_xfer_atomic(struct fsl_lpspi_data *fsl_lpspi,
> +				     struct spi_transfer *t)
> +{
> +	u32 sr, timeout_us;
> +	int ret;
> +
> +	/* One frame plus margin, at least 1ms. */
> +	timeout_us =3D DIV_ROUND_UP(8 * USEC_PER_SEC, fsl_lpspi->config.speed_h=
z);
> +	timeout_us =3D max(timeout_us * 2, 1000U);
> +
> +	fsl_lpspi->tx_buf =3D t->tx_buf;
> +	fsl_lpspi->rx_buf =3D t->rx_buf;
> +	fsl_lpspi->remain =3D t->len;
> +
> +	while (fsl_lpspi->remain) {
> +		ret =3D readl_poll_timeout_atomic(fsl_lpspi->base + IMX7ULP_SR,
> +						sr, sr & SR_TDF, 0, timeout_us);
> +		if (ret)
> +			return ret;
> +		fsl_lpspi->tx(fsl_lpspi);
> +
> +		ret =3D readl_poll_timeout_atomic(fsl_lpspi->base + IMX7ULP_SR,
> +						sr, sr & SR_RDF, 0, timeout_us);
> +		if (ret)
> +			return ret;
> +		fsl_lpspi->rx(fsl_lpspi);
> +	}

[Severity: High]
Will polling SR_RDF after transmitting a single word time out whenever
t->len >=3D 2?

fsl_lpspi_setup_transfer() sets fsl_lpspi->watermark to
min(fsl_lpspi->txfifosize, t->len), and fsl_lpspi_set_watermark() writes
FCR_RXWATER =3D fsl_lpspi->watermark >> 1 (>=3D 1 for t->len >=3D 2).  In t=
he
LPSPI controller, SR_RDF only asserts when the RX FIFO word count is
strictly greater than FCR_RXWATER.  Because this loop only puts one word
in flight at a time, RXCOUNT reaches 1 and SR_RDF never asserts, so every
multi-byte transfer fails with -ETIMEDOUT.  (The interrupt PIO path avoids
this in fsl_lpspi_read_rx_fifo() by checking RSR_RXEMPTY in IMX7ULP_RSR
instead of SR_RDF.)

> +
> +	ret =3D readl_poll_timeout_atomic(fsl_lpspi->base + IMX7ULP_SR, sr,
> +					sr & SR_TCF, 0, timeout_us);
> +	if (ret)
> +		return ret;

[Severity: High]
Can SR_TCF assert here while continuous transfer mode (TCR_CONT) is still
active?

Because fsl_lpspi->usedma is false, fsl_lpspi_set_cmd() sets TCR_CONT in
IMX7ULP_TCR, which keeps the transfer active after the TX FIFO drains
until a new command word without TCR_CONTC is written to IMX7ULP_TCR (as
fsl_lpspi_write_tx_fifo() and fsl_lpspi_isr() do before waiting for
SR_FCF).  Without terminating the continuous command in IMX7ULP_TCR, this
poll on SR_TCF stalls for timeout_us and returns -ETIMEDOUT.

> +
> +	writel(SR_TCF, fsl_lpspi->base + IMX7ULP_SR);
> +	return 0;
> +}
> +
> +static int fsl_lpspi_transfer_atomic(struct spi_device *spi,
> +				     struct spi_message *msg)
> +{
> +	struct spi_controller *controller =3D spi->controller;
> +	struct fsl_lpspi_data *fsl_lpspi =3D
> +				spi_controller_get_devdata(controller);
> +	struct spi_transfer *t, *next;
> +	bool first =3D true;
> +	bool keep_cs =3D false;
> +	int ret =3D 0;
> +
> +	if (!pm_runtime_active(fsl_lpspi->dev))
> +		return -ESHUTDOWN;
> +
> +	fsl_lpspi->usedma =3D false;
> +	fsl_lpspi_reset(fsl_lpspi);
> +	writel(0, fsl_lpspi->base + IMX7ULP_DER);
> +
> +	t =3D list_first_entry(&msg->transfers, struct spi_transfer, transfer_l=
ist);
> +	spi_set_cs(spi, !t->cs_off, false);

[Severity: Medium]
Does asserting chip select before fsl_lpspi_setup_transfer() and
fsl_lpspi_set_cmd() glitch SCLK while CS is active?

In the normal path, fsl_lpspi_prepare_message() programs TCR_CPOL and
TCR_CPHA before the core asserts CS (see 7ae4d097b752 ("spi:
spi-fsl-lpspi: Handle clock polarity and phase")).  __spi_sync_atomic()
does not call prepare_message(), so asserting CS right after
fsl_lpspi_reset() causes any clock polarity transition to happen while the
target device is already selected.

> +
> +	list_for_each_entry(t, &msg->transfers, transfer_list) {
> +		if (t->len) {
> +			fsl_lpspi->is_first_byte =3D first;
> +			ret =3D fsl_lpspi_setup_transfer(controller, spi, t, true);
> +			if (ret)
> +				break;
> +			if (t->len %
> +			    fsl_lpspi_bytes_per_word(fsl_lpspi->config.bpw)) {
> +				ret =3D -EINVAL;
> +				break;
> +			}

[Severity: Medium]
Does this length check reject valid 17..24 bits-per-word transfers?

For 17 <=3D bpw <=3D 24, __spi_validate() and fsl_lpspi_buf_tx_u32() /
fsl_lpspi_buf_rx_u32() use a 4-byte (sizeof(u32)) stride in memory,
whereas fsl_lpspi_bytes_per_word(bpw) returns DIV_ROUND_UP(bpw, 8) =3D=3D 3.
A 17..24-bit transfer whose byte length is a multiple of 4 (such as 4 or 8
bytes) will fail here with -EINVAL.

> +
> +			fsl_lpspi_set_cmd(fsl_lpspi);
> +			fsl_lpspi->is_first_byte =3D false;
> +
> +			ret =3D fsl_lpspi_pio_xfer_atomic(fsl_lpspi, t);
> +			if (ret)
> +				break;
> +
> +			fsl_lpspi_reset(fsl_lpspi);
> +			first =3D false;
> +		}

[Severity: High]
Does calling fsl_lpspi_reset() at the end of each transfer break
subsequent transfers in a multi-transfer message?

fsl_lpspi_reset() clears CR_MEN and flushes the TX and RX FIFOs,
destroying any active continuous transfer state in the hardware (and
deasserting native PCS if GPIO CS is not used).  Setting first =3D false
then causes the next transfer's fsl_lpspi_set_cmd() to write TCR_CONTC =3D 1
to a freshly reset controller with no active TCR_CONT command, which sets
the Transmit Error Flag (SR[TEF]) and drops the command.

> +
> +		spi_transfer_delay_exec(t);
> +
> +		if (t->cs_change) {
> +			if (list_is_last(&t->transfer_list, &msg->transfers)) {
> +				keep_cs =3D true;
> +			} else {
> +				if (!t->cs_off)
> +					spi_set_cs(spi, false, false);
> +				spi_transfer_cs_change_delay_exec(msg, t);
> +				next =3D list_next_entry(t, transfer_list);
> +				if (!next->cs_off)
> +					spi_set_cs(spi, true, false);
> +			}
> +		} else if (!list_is_last(&t->transfer_list, &msg->transfers)) {
> +			next =3D list_next_entry(t, transfer_list);
> +			if (t->cs_off !=3D next->cs_off)
> +				spi_set_cs(spi, !next->cs_off, false);
> +		}
> +	}
> +
> +	if (!keep_cs)
> +		spi_set_cs(spi, false, false);
> +	fsl_lpspi_reset(fsl_lpspi);
> +	msg->status =3D ret;
> +	return ret;
> +}

[Severity: Medium]
Should fsl_lpspi_transfer_atomic() update msg->actual_length and
t->effective_speed_hz?

__spi_sync_atomic() calls controller->transfer_atomic() directly without
going through spi_transfer_one_message(), so leaving msg->actual_length
unupdated causes callers that check it (such as spi_mem_exec_op()) to
treat completed atomic transfers as failed.  Populating
t->effective_speed_hz after fsl_lpspi_setup_transfer() (as
fsl_lpspi_transfer_one() does) is also needed for SPI_DELAY_UNIT_SCK
delays in spi_transfer_delay_exec() and
spi_transfer_cs_change_delay_exec().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127073454.3512=
96-1-chunyuzhiqiang@yinhe.ht?part=3D1
