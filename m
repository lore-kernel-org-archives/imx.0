Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630451;
	b=3WapAEQUL5bisjAn+DvFym+SIQKCjCqFGss00iser/LyWpZgm1+zUADoYZ79K/FlzFRY
	 JEDyggK91wh7hMISTw19ZLf3tlYwcnl5KEKqrxm62ZQN0KV89zzrYRhzqwQVhk6SNpwPD
	 Je4ptjYKh8yVQ/np8gzL0JdWz7AqgnrFLFtaJPwaEydP7hhmUzNOAnwDviKi4Psav75jL
	 MR/LU1cAoIaJ4ugylxMBb38eeyPN+GNtnxFv4/gp+JpJPku0XZTMTDIQo6AsNvFGObjXS
	 mvUuAhUHkgNQiFCEWXwP1OGFLyaN708zQmSF68FpF1fat6o16RsdSxsHruGzefWsi1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630451;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Xss2yAo2XUtHtT/HbOssTVw0p9SQ1Jy0dk5U3JbzMf4=;
	b=Md6i3qvMksEnWl+oi0eSehtpg0hB84eVP6LN6d7WcxN+YzuOmN3YP41628gglWTcJWQA
	 pUuIw/8EnUWMet8YWQ2FSJSOQQ5h/sWebAV8E0CNXIZChJQ8Lri52hKQY2Ynu2HDJ1FuP
	 LlNfaYrHivOi4geKay7FT0/Tkc06Zpl6SRoOomxde3+scg1IgNh+eVpsThCrFawSyRPHP
	 lPth6fXtwViiztfF2eHUFJJZ3xFzE8z62XOgQ0j3r5dcBZMChkrqim17lb0rMmpVvVlui
	 QEJZYlvMFbxvI1ihsVUesFtQbMJRf0Bc9XU+xyZ+Gc3QWG+86RgM8xJeuWSW76jowtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UmS9TzoE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD81606A68C
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UmS9TzoE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954B91F000E1;
	Wed, 25 Nov 2026 18:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630450;
	bh=Xss2yAo2XUtHtT/HbOssTVw0p9SQ1Jy0dk5U3JbzMf4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UmS9TzoEYsSvAXEgxzw4FGwSFC+aFI3PGGX/hkmKy/xvLsAk3GsqoA/jNCb76CUxQ
	 sX0sTS3NcFXEC7oHN6vYMbsSvomdJaLmBugZAZMq++5OvwI8OAMjttDE0V1h1L9cqa
	 PkGe1hXx6eMyGzoV1PAoKTbRyiuXbF98RUTBTnoGxRYm5IJiYzQ21FG9L5RAYVUm1x
	 nRfDSvKGkvUDJFRZFApIeE2FexG01Hzt0D6txs/Z853JcIoIimhUe7O0fH7rVu1x5s
	 fYJX6BRRwMmv/5qFLYBACK5UXaAtXuInlW8LL8qljpifxfNRDZ/SQ1R9LWkew5zxhe
	 Rl0hZMEZDpV9w==
Message-ID: <sashiko-outbox-233930@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 15/16] spi: stm32-qspi: Consume dummy cycles
 directly
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Mark Brown" <broonie@kernel.org>, "Liang
 Yang" <liang.yang@amlogic.com>, "Feng Chen" <feng.chen@amlogic.com>, "Xianwei
 Zhao" <xianwei.zhao@amlogic.com>, "Han Xu" <han.xu@nxp.com>, "Conor Dooley" <conor.dooley@microchip.com>, "Valentina
 Fernandez" <valentina.fernandezalanis@microchip.com>, "Daire McNamara" <daire.mcnamara@microchip.com>, "Haibo
 Chen" <haibo.chen@nxp.com>, "Jyan Chou" <jyanchou@realtek.com>, "Yu-Chun
 Lin" <eleanor.lin@realtek.com>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Alvin Zhou" <alvinzhou@mxic.com.tw>, "Cheng
 Ming Lin" <chengminglin@mxic.com.tw>, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, linux-mtd@lists.infradead.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-15-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
 <20261125-macronix-upstreaming-spi-mem-cycles-v1-15-fd036402fd37@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:14:09 +0000
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
- [High] spi: stm32-qspi: missing dummy phase on GPIO CS fallback in
  spi_mem_exec_op()
--

commit f2e2b0be96bbca647ad2610bfa7badf82f59967f
Author: Miquel Raynal <miquel.raynal@bootlin.com>

spi: stm32-qspi: Consume dummy cycles directly

This commit advertises dummy_cycles in stm32_qspi_mem_caps and uses
op->dummy.ncycles directly in stm32_qspi_send() and
stm32_qspi_transfer_one_message().

> diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
> index b77daba6db83a..993b09cc51240 100644
> --- a/drivers/spi/spi-stm32-qspi.c
> +++ b/drivers/spi/spi-stm32-qspi.c
[ ... ]
> @@ -593,7 +592,7 @@ static int stm32_qspi_transfer_one_message(struct spi=
_controller *ctrl,
>  		 */
>  		if (transfer->dummy_data) {
>  			op.dummy.buswidth =3D transfer->tx_nbits;
> -			op.dummy.nbytes =3D transfer->len;
> +			op.dummy.ncycles =3D transfer->len * 8 / transfer->tx_nbits;
>  			dummy_bytes =3D transfer->len;
> =20
>  			/* if happens, means that message is not correctly built */
> @@ -773,6 +772,10 @@ static const struct spi_controller_mem_ops stm32_qsp=
i_mem_ops =3D {
>  	.poll_status	=3D stm32_qspi_poll_status,
>  };
> =20
> +static const struct spi_controller_mem_caps stm32_qspi_mem_caps =3D {
> +	.dummy_cycles =3D true,
> +};
> +
>  static int stm32_qspi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> @@ -856,6 +859,7 @@ static int stm32_qspi_probe(struct platform_device *p=
dev)
>  	ctrl->setup =3D stm32_qspi_setup;
>  	ctrl->bus_num =3D -1;
>  	ctrl->mem_ops =3D &stm32_qspi_mem_ops;
> +	ctrl->mem_caps =3D &stm32_qspi_mem_caps;
>  	ctrl->use_gpio_descriptors =3D true;
>  	ctrl->transfer_one_message =3D stm32_qspi_transfer_one_message;
>  	ctrl->num_chipselect =3D STM32_QSPI_MAX_NORCHIP;

[Severity: High]
Does enabling dummy_cycles drop the dummy phase when a GPIO chip-select is
used?

In spi_mem_exec_op(), spi_mem_convert_dummy() runs first and sets
op->dummy.nbytes =3D 0 because the controller advertises dummy_cycles.  When
spi_get_csgpiod(mem->spi, 0) is non-NULL, spi_mem_exec_op() bypasses
ctlr->mem_ops->exec_op and falls back to building spi_transfers for
stm32_qspi_transfer_one_message(), but that fallback path only creates a
dummy_data transfer when op->dummy.nbytes is non-zero:

drivers/spi/spi-mem.c:spi_mem_exec_op() {
	...
	if (ctlr->mem_ops && ctlr->mem_ops->exec_op && !spi_get_csgpiod(mem->spi, =
0)) {
	...
	if (op->dummy.nbytes) {
		memset(tmpbuf + op->addr.nbytes + 1, 0xff, op->dummy.nbytes);
		xfers[xferpos].tx_buf =3D tmpbuf + op->addr.nbytes + 1;
		xfers[xferpos].len =3D op->dummy.nbytes;
		xfers[xferpos].tx_nbits =3D op->dummy.buswidth;
		xfers[xferpos].dummy_data =3D 1;
	...
}

As a result, no dummy_data transfer is added to the message, so
stm32_qspi_transfer_one_message() leaves op.dummy.ncycles at 0 and corrupts
flash operations that require dummy cycles on boards using cs-gpios (such
as dual-flash configurations).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-macronix-u=
pstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com?part=3D15
