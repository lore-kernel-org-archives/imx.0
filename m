Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643663;
	b=oL48UtDoawolj4913NiLIzKD7dl+MRPyxfdVSlbG7idrFO00aekXs1PBeZLl+XgZ3UK+
	 bnkSbLiPLC49XaLOpkSVamW93LjgBMpY7b2SpfG94Oq2xC6Nj8BFhP9ZgEgBjpMWin4td
	 iWPQj3Hh5url6kglazLbeZu01aQ3KXmM/1ipJoIyXqry7bcoh048IgHDV3YpSYpdrZG87
	 Ipo/V8anSG+MMddlx9rKWYdkb95tnOiJHQ3ZJT+aBbSz9cMYqvyyQzW1+Ffp5Qs/dDgZm
	 9rS1HYhmsbCWNZgTCIwbJMy5MzVqM0p6EiAOMTouvptoApsX+T9DTWihqiiUvcbgTuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643663;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qkCDx7kN+UeggCGbXHX7RwF1lcFrZoOnuHXhHxJg5mg=;
	b=2/+kt7bBUCQiJeYtxqCqf9G8tJwheB150LyODJk0CQVUfwm43fRiWVMk6yTMAj/46VPs
	 8p3E7Rr8FNKAqKnsLCpYC/ohb5mq+PXQn5wPgBR2K/GZ3ZqZKr4Lz14Byrjwx/uhd8bGw
	 bn0zq2/JYhkZMYTtdse/CyExD1hP6OX8faYKOLuaLSRlDq+4YMZyqQp6kgUPdWTeFRojb
	 E/QvDE4mlaLu51W1fVSXXqWvrZrui9+8+FuHxTN2W41MCw6tWsP5ReBymW756UDaxSlSk
	 cqmfuypXgKDV7SLDbWJdgbfNk/4Q32407yscR6LZlmWWxbQ5dHyiVGogZFy7tcfEllA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ilnC9Iav;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F2B606A329
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 18:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ilnC9Iav
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CFD21F00A18;
	Mon,  2 Nov 2026 18:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793643662;
	bh=qkCDx7kN+UeggCGbXHX7RwF1lcFrZoOnuHXhHxJg5mg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ilnC9Iavzsslfu/EM2SDbhf6g8QvXYL8Wgl8U7eaAuUXV0zfk1NVxo6SmQRFLAWAV
	 NDdDoxijOTZJvY/2qhHBfZFSg0aguTzDJ6vpsjwEwB+z7cF3Qy3GJ0V3bV9oxEoo0c
	 uESmMDg0PMqyEw+n3OJ3+y4Qfa6Ny9ikOTOpmGf/HNA2DICJxKjPG2Odzw1KrCgbhQ
	 XvkXTE4FgtWhVmyny0JtzWETcdmAtmSYKI4e1jAgUc1qRNYluQM5fW5zB/2TdphCLH
	 GTseLjZa9zDsCssFXxJSYba1DJ0F288pEgoOAdekEEGdv/vhSRxOQylEnQOoyXwo/V
	 tm7bVDWCiOyRA==
Message-ID: <sashiko-outbox-193928@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] mtd: use dmaengine_desc_set_callback()
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com, "Vignesh Raghavendra" <vigneshr@ti.com>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Kyungmin Park" <kyungmin.park@samsung.com>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu
 Beznea" <claudiu.beznea@tuxon.dev>, "Han Xu" <han.xu@nxp.com>, "Keguang
 Zhang" <keguang.zhang@gmail.com>, "Vladimir Zapolskiy" <vz@mleia.com>, "Piotr
 Wojtaszczyk" <piotr.wojtaszczyk@timesys.com>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, "Rosen Penev" <rosenp@gmail.com>, "Frank
 Li" <Frank.Li@nxp.com>, "Wentao Liang" <vulab@iscas.ac.cn>,
 =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>, "Alok Tiwari" <alok.a.tiwari@oracle.com>, "Chen
 Ni" <nichen@iscas.ac.cn>, "Runyu Xiao" <runyu.xiao@seu.edu.cn>, "Hemanth
 Selam" <hemanth.selam@gmail.com>, "Pengpeng Hou" <pengpeng@iscas.ac.cn>,
 =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>, "Triet
 Hoang" <triet.hoang.dev@gmail.com>, =?utf-8?b?b3BlbiBsaXN0OkhZUEVSQlVT?=
 =?utf-8?b?IFNVUFBPUlQ=?= <linux-mtd@lists.infradead.org>, =?utf-8?b?b3Bl?=
 =?utf-8?b?biBsaXN0OkZSRUVTQ0FMRSBHUE1JIE5BTkQgRFJJVkVS?= <imx@lists.linux.dev>,
 =?utf-8?b?bW9kZXJhdGVkIGxpc3Q6QVJNL1NUTTMyIEFSQ0hJVEVDVFVSRQ==?= <linux-stm32@st-md-mailman.stormreply.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261102181406.3994422-1-Frank.Li@oss.nxp.com>
References: <20261102181406.3994422-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 18:21:00 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] mtd: implicit declaration of dmaengine_desc_set_callback() breaks =
build
- [Low] mtd: commit message inaccurately states change is across sound driv=
ers
--

commit 32484e960f1ce7c6c67c27f2bc2a6a6370f61c59
Author: Frank Li <Frank.Li@nxp.com>

mtd: use dmaengine_desc_set_callback()

This commit replaces open-coded assignments to the callback and
callback_param fields of struct dma_async_tx_descriptor with calls to
dmaengine_desc_set_callback() across 14 MTD drivers.

>     mtd: use dmaengine_desc_set_callback()
>    =20
>     Replace open-coded assignments to callback and callback_param fields
>     of struct dma_async_tx_descriptor with calls to the
>     dmaengine_desc_set_callback() helper across sound drivers.
>    =20
>     No functional change intended. Prepare to make struct
>     dma_async_tx_descriptor private to the DMA engine.
>    =20
>     Signed-off-by: Frank Li <Frank.Li@nxp.com>

[Severity: Low]
This isn't a bug, but the commit message says "across sound drivers" when a=
ll
14 modified files are MTD drivers under drivers/mtd/. Should this say "acro=
ss
MTD drivers" instead?

> diff --git a/drivers/mtd/hyperbus/hbmc-am654.c b/drivers/mtd/hyperbus/hbm=
c-am654.c
> index 8a14e908d0b53..56b265125c7e8 100644
> --- a/drivers/mtd/hyperbus/hbmc-am654.c
> +++ b/drivers/mtd/hyperbus/hbmc-am654.c
> @@ -100,8 +100,7 @@ static int am654_hbmc_dma_read(struct am654_hbmc_devi=
ce_priv *priv, void *to,
>  	}
> =20
>  	reinit_completion(&priv->rx_dma_complete);
> -	tx->callback =3D am654_hbmc_dma_callback;
> -	tx->callback_param =3D priv;
> +	dmaengine_desc_set_callback(tx, am654_hbmc_dma_callback, NULL, priv);

[Severity: High]
Does this break the build for these MTD drivers?

In include/linux/dmaengine.h, struct dma_async_tx_descriptor still defines =
the
callback fields directly:

    dma_async_tx_callback callback;
    dma_async_tx_callback_result callback_result;
    void *callback_param;

and dmaengine_desc_set_callback() is neither declared nor defined anywhere =
in
include/linux/dmaengine.h or the kernel tree at this commit.

Building any of the 14 modified drivers fails with an implicit declaration =
of
function dmaengine_desc_set_callback() error in:

  - drivers/mtd/hyperbus/hbmc-am654.c: am654_hbmc_dma_read()
  - drivers/mtd/nand/onenand/onenand_omap2.c: omap2_onenand_dma_transfer()
  - drivers/mtd/nand/qpic_common.c: qcom_submit_descs()
  - drivers/mtd/nand/raw/atmel/nand-controller.c: atmel_nand_dma_transfer()
  - drivers/mtd/nand/raw/cadence-nand-controller.c: cadence_nand_slave_dma_=
transfer()
  - drivers/mtd/nand/raw/fsmc_nand.c: dma_xfer()
  - drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c: gpmi_nfc_exec_op()
  - drivers/mtd/nand/raw/intel-nand-controller.c: ebu_dma_start()
  - drivers/mtd/nand/raw/loongson-nand-controller.c: loongson_nand_dma_tran=
sfer()
  - drivers/mtd/nand/raw/lpc32xx_mlc.c: lpc32xx_xmit_dma()
  - drivers/mtd/nand/raw/lpc32xx_slc.c: lpc32xx_xmit_dma()
  - drivers/mtd/nand/raw/omap2.c: omap_nand_dma_transfer()
  - drivers/mtd/nand/raw/sh_flctl.c: flctl_dma_fifo0_transfer()
  - drivers/mtd/nand/raw/stm32_fmc2_nand.c: stm32_fmc2_nfc_xfer()

Is this commit missing a prerequisite patch that introduces
dmaengine_desc_set_callback() in include/linux/dmaengine.h?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102181406.3994=
422-1-Frank.Li@oss.nxp.com?part=3D1
