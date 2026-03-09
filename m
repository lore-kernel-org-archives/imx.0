Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1003D668A
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 15:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068983; cv=none; b=ZUrz1XiD2bSs9f3CryV/KP4oeJ7tPBb1SrIEzMHnEyWJ+Lv5lOzMlpUFn9g2Ow0KgdOBZSSGb5Ww6NdhOA05v+C7x92fmmENsaqwl8NXjEtpBOl4/YrTZTLoNdQ6Zvb0/2F+XNbKrUJv9xhs3Yk5r82Je4D9q9PisvhuAwyTeFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068983; c=relaxed/simple;
	bh=tbgwiF7SQ0yJqQDNrmdnVuN0QKIUVZ8LG5892E/0JxM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o/VO0ownyxLV5TX7wGZQjXUZvEnjzP7Pl2XNlw64InVDPlRSzRx4BE7VAb1fNQ3XzwPSmWM7d/0enYhoKFonGgWiPAMyJRcj1N8/j/63tfEUQ7KlokSLWrlvJ1y3vnOfSPU7Gz+oL/DroFg0x/PlcuZwAXN+Pr7HfZGDugpdI04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=t4p/zCDl; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="t4p/zCDl"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6ECC6C4287A;
	Mon,  9 Mar 2026 15:09:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C62235FFB8;
	Mon,  9 Mar 2026 15:09:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF20210369BEB;
	Mon,  9 Mar 2026 16:09:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773068977; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FG158/EGLhvDrEBET0uUhkr+ZO0S5F0PmANWPFGizsc=;
	b=t4p/zCDlMFLItGdvjJ9LmtxrzqYp5G0961EWkTkCQ1SM4rc1m2qiB3rc2DNYjQIFP1/pvl
	cl+VGECcrRL0qGrHE+5fgReQci+ZYDJ2tAKs2GUZlgbbFm/8xKS6htxbVFU4c0LWfh/UzF
	1HW+276a2wckS8E3q1dEAOD+eriyUFIw02l04f3HXYkmz4GYFuBqTVhu/Y2zr7Q/7IdKsE
	NyP/niJ9uud7IArG5WfOM3nllieq0xw0TqHAVxhThVcztrx21U7ULQNB+kv/aBThwvk5YP
	jusabS4SZmvddMlnCBoULgmKmklq3UyJBGkoIo7CkgMVh6O9Sbn1JEJAFiv4sQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Han Xu <han.xu@nxp.com>,
  Eberhard Stoll <eberhard.stoll@kontron.de>,  Frieder Schrempf
 <frieder.schrempf@kontron.de>,  Tudor Ambarus <tudor.ambarus@linaro.org>,
  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  imx@lists.linux.dev
Subject: Re: [PATCH RFC 6/7] spi: spi-mem: Call spi_set_rx_sampling_point()
 for each op
In-Reply-To: <20260303-fsl-qspi-rx-sampling-delay-v1-6-9326bbc492d6@kontron.de>
	(Frieder Schrempf's message of "Tue, 03 Mar 2026 17:29:27 +0100")
References: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
	<20260303-fsl-qspi-rx-sampling-delay-v1-6-9326bbc492d6@kontron.de>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 09 Mar 2026 16:09:34 +0100
Message-ID: <87wlzlnioh.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Frieder,

First, thanks for the series! I believe it will conflict with the SPI
tuning series as you mentioned, but we should be able to make them live
side by side.

On 03/03/2026 at 17:29:27 +01, Frieder Schrempf <frieder@fris.de> wrote:

> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>
> With clock rates changing on a per-op basis, we need to make sure
> that we meet the RX sampling point delay constraint of the underlying
> SPI chip.
>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  drivers/spi/spi-mem.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index a09371a075d2e..6b8bee7d6f5e3 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -589,6 +589,8 @@ void spi_mem_adjust_op_freq(struct spi_mem *mem, stru=
ct spi_mem_op *op)
>  {
>  	if (!op->max_freq || op->max_freq > mem->spi->max_speed_hz)
>  		op->max_freq =3D mem->spi->max_speed_hz;
> +
> +	op->max_freq =3D spi_set_rx_sampling_point(mem->spi,
> op->max_freq);

How can this work with the above 2 lines? Maybe there will be the need
to use a "min of the max" frequencies?

Thanks,
Miqu=C3=A8l
