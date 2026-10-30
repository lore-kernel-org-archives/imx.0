Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378324;
	b=WTpYUmqIlIDR4ejNG6woDdR1dPDDLLaepP3riRnHxuMs5rddDm66XL08b7SG80Kt6eYz
	 Jv4SGswJL/73695s3xh1HYnoA43/E30DjQZ0hcAQD9OxLdqUxPBzGI2RFiJ7ND7k4JL60
	 tn+g1lInf0djC4V7F236IW8ojA8ilm9zpHjuPG3Aq45AkjcJz3THZLEPJsbyxigbNSW+9
	 bhdHJBZu1qo2lVZcPKJ+UT1zBExn0xgJca5ZIUr8mhvC6Jg+MXHnLBpmLlQKyoUL6huy9
	 vYuAj+te62jtauvfLTLq6Ldh2mYTIO12Hgt2/YfeiaKqBUwNUa2LD/F/C0AfAPHoj8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378324;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=G1z1qQ5j5lNTnrgJ1ozy8sWJ5465FP7J1myCkn91g50=;
	b=SSGWET3rHAQdXsLObKTXrFIX+Hf7kKr+nt8uheWE4fJT4/fDl4YxfI9JSotJnesKoXtO
	 8iE7WqejxKwqr4F/G2VCsxFtosFbsjPJd65LqTMfa8bEI6eKxVzlYB8zgU5f4e7p+qsSE
	 p4Gf0SN4aq/yu2xLVqO7rWWMTEpoSbK8WHLvj3lzyMyHlSyInzsKZC2vwkaH1/2ce2bnm
	 Lrn9f1X3/DCojzA18x8aDZVmSCepI1qN9fJb1JtMWAZgWrUkxjqhSPvkXONedcF49Xbdw
	 S4Jw/62EwzavJTviIE6Jy0T8BJVGEcR98bvrVWCf3BQfY4WiPqcsG3jAD2/l/8OYTCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZPsv2H6k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB44606A31A
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 16:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZPsv2H6k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2E21F000C1;
	Fri, 30 Oct 2026 16:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793378323;
	bh=G1z1qQ5j5lNTnrgJ1ozy8sWJ5465FP7J1myCkn91g50=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZPsv2H6k/k0SjrpXNvo8RttcSeHUgD6Ch28sWhL+hgzoujcDQJzK5QnlcyJgSQ0NP
	 T3UF5basCThZiV3vwrx79uNOv4YJY70PD5BECbCgy43m+j/i41+mte7jqBprHXC62d
	 pacnB2+4v2nKZp1hmcUkti1SJNScnz3TLYDqzNg/TRhB4H7PWyVhb+mr0+QWWOThlE
	 sF6Pbj6SaAvPm6WMx5cIYYBmhd5ADrML6Ou3nUD62Cx0VGYQaEEmVf5+qNHGa0Kbqq
	 uvucZOnV2N6KzeiqOh6GvP4LVe01PvETkSE/UHjfgyX41VadOd+Ycf6CzC9+HSG9H4
	 o/s8o/2Rtcy+w==
Message-ID: <sashiko-outbox-191272@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] mtd: rawnand: marvell: stop DMA before unmapping
 on timeout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Samarth Narang" <samarth.colleges@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Han Xu" <han.xu@nxp.com>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>
Cc: "Richard Weinberger" <richard@nod.at>, linux-mtd@lists.infradead.org, imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, Frank.Li@kernel.org
In-Reply-To: <20261030162041.2998170-6-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
 <20261030162041.2998170-6-samarth.colleges@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 16:38:42 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mtd: rawnand: marvell: sleep in atomic context in marvell_nfc_xf=
er_data_dma()
--

commit cbbe6eae8df4a34b02e625e64676a65024331f76
Author: Samarth Narang <samarth.colleges@gmail.com>

mtd: rawnand: marvell: stop DMA before unmapping on timeout

This commit replaces dmaengine_terminate_all() with
dmaengine_terminate_sync() and moves it before dma_unmap_sg() on the
timeout path in marvell_nfc_xfer_data_dma() so the DMA transfer is
stopped before unmapping the buffer.

> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/m=
arvell_nand.c
> index 38b7eb5b992c8..a342a48e2a08c 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -900,14 +900,15 @@ static int marvell_nfc_xfer_data_dma(struct marvell=
_nfc *nfc,
> =20
>  	dma_async_issue_pending(nfc->dma_chan);
>  	ret =3D marvell_nfc_wait_cmdd(nfc->selected_chip);
> -	dma_unmap_sg(nfc->dma_chan->device->dev, &sg, 1, direction);
> -	marvell_nfc_disable_dma(nfc);
>  	if (ret) {
>  		dev_err(nfc->dev, "Timeout waiting for DMA (status: %d)\n",
>  			dmaengine_tx_status(nfc->dma_chan, cookie, NULL));
> -		dmaengine_terminate_all(nfc->dma_chan);
> -		return -ETIMEDOUT;
> +		dmaengine_terminate_sync(nfc->dma_chan);

[Severity: Medium]
Can calling dmaengine_terminate_sync() here sleep in atomic context during
a panic write?

This driver supports mtd->oops_panic_write by polling in
marvell_nfc_wait_op() instead of sleeping:

drivers/mtd/nand/raw/marvell_nand.c:marvell_nfc_wait_op() {
	if (mtd->oops_panic_write) {
		ret =3D marvell_nfc_poll_status(nfc, NDSR_RDY(0),
					      NDSR_RDY(0),
					      timeout_ms);
	} else {
		init_completion(&nfc->complete);
		...
}

When nfc->use_dma is enabled on NFCv1, panic writes still go through
marvell_nfc_xfer_data_dma():

mtd_panic_write()
  -> panic_nand_write()
    -> nand_do_write_ops()
      -> nand_write_page()
        -> marvell_nfc_hw_ecc_hmg_write_page()
          -> marvell_nfc_hw_ecc_hmg_do_write_page()
            -> marvell_nfc_xfer_data_dma()

Because mtd_panic_write() can be invoked with interrupts disabled or under
a raw spinlock (such as pstore_dump()), and dmaengine_terminate_sync()
calls dmaengine_synchronize() (which calls might_sleep(), wait_event() in
pxad_synchronize(), and tasklet_kill() in vchan_synchronize()), wouldn't a
DMA timeout during a panic write trigger a sleep-in-atomic bug or hang
waiting for the DMA tasklet while softirqs are disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030162041.2998=
170-1-samarth.colleges@gmail.com?part=3D5
