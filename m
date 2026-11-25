Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630330;
	b=bQ4QQWE9jxw8OxS1byVI4PCMcLU49xtrhLyl6mF1X3eijYAxxO/s0UEPtPJgVPiq/YQu
	 JNfR06WsSqexumQY1w3OsdBtsiZyNeZa1mPHk6/O1LV0n6zgEa/MbAHSFKYuylcAkxy14
	 cB54qPEy+OLApk8S5kCuIYxh/wlx2UOCOadiFbT0ajmaTYO1CwRmw284Fy+LxPtWsoN8X
	 7DDsVdYs7SfshTERB8Hj8ZSqFanpcM+AJJDClYRrz3L/DJjRCNqGr+9kZ02ledZlMvmev
	 quZVEOorAqtyncBzjbjkltJjD1TJqzNX8YJBJmbl4CpKZq3x9DpMLHAr+L0JNEC5Uqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630330;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JolNVXLCb/kxSvf+gc0N3du+6tZnrU3rkjWd9T1EqXM=;
	b=WZPIvQmJ14x9x38zbd2Nm3vY4E7LvFMkqdxsJijqcHglTWYkiVrkF1U8MpAODYCyAEtn
	 ixZlbgX36k/Ekdf1Y02R7Q1VjhofEwDxcamfoZdEBGmdqnPLQIaiJeW8JpLcRz988I+ok
	 6t63cYNInWlpbOCsSkJcCr6fiEoVicTDRahAVWQt8BvNtm0f/nOgRAleV+kz1dd8TuLwq
	 u9JgKWSDTJt+23IiY1QtQfJ3y4gNh0ZG0h1o68WyzFGbNF+GrOjyOZFq81aEQ1mOAa0i+
	 RVdB3u6/KesIu98ICnJGSXXiIq+R/rPmdB7t0MHGNY36To89r4zStkL1LdFImEtEv5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H9JTte2T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84CF606A687
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H9JTte2T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF011F000C4;
	Wed, 25 Nov 2026 18:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630330;
	bh=JolNVXLCb/kxSvf+gc0N3du+6tZnrU3rkjWd9T1EqXM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H9JTte2TL8kBhxsHChmLionlUjwi00UHQkbr0xQn6+CDlt2vKwW1kj8jKMlLKa4/k
	 GKwP3GRFFni0sqwQzL28nD+gz+1jMHJXMdh1Dt7zF4NJpO0jr4lN+PzfppM5I9OxqF
	 Q9fkeTflERJNRXbigsI2sYndxMka+xzw2Jw0vX2Ev8skuWOf1pophSeNnDkdqEsbb9
	 lI/xKtBivSMquEdBq4Uf6oX+CALJY+n4q7t2idid0JgdToCL20AJOgeTws/xEHo67h
	 eK6bFW3suDLNllngC5KqEaXb9gTyUIy4E9KzbNhF2wVvYuscV4DszUalb2SdvDJbB3
	 aoNRHYZ+dwRFQ==
Message-ID: <sashiko-outbox-233923@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 14/16] spi: stm32-ospi: Consume dummy cycles
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
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-14-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
 <20261125-macronix-upstreaming-spi-mem-cycles-v1-14-fd036402fd37@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:12:07 +0000
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
- [High] spi: stm32-ospi: dummy_cycles breaks GPIO-CS dummy phase in
  spi_mem_exec_op()
--

commit 6211c6f8b4860424c9db9bbf573382699c7dae10
Author: Miquel Raynal <miquel.raynal@bootlin.com>

spi: stm32-ospi: Consume dummy cycles directly

This commit enables the dummy_cycles spi-mem capability in the STM32 OSPI
driver and updates it to program dummy cycles directly from
op->dummy.ncycles instead of converting from op->dummy.nbytes.

> diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
> index fa0e8e83cb1be..9b28d1f244822 100644
> --- a/drivers/spi/spi-stm32-ospi.c
> +++ b/drivers/spi/spi-stm32-ospi.c

[ ... ]

> @@ -691,7 +690,7 @@ static int stm32_ospi_transfer_one_message(struct spi=
_controller *ctrl,
>  		 */
>  		if (transfer->dummy_data) {
>  			op.dummy.buswidth =3D transfer->tx_nbits;
> -			op.dummy.nbytes =3D transfer->len;
> +			op.dummy.ncycles =3D transfer->len * 8 / transfer->tx_nbits;
>  			dummy_bytes =3D transfer->len;
> =20
>  			/* If happens, means that message is not correctly built */
> @@ -784,6 +783,10 @@ static const struct spi_controller_mem_ops stm32_osp=
i_mem_ops =3D {
>  	.poll_status	=3D stm32_ospi_poll_status,
>  };
> =20
> +static const struct spi_controller_mem_caps stm32_ospi_mem_caps =3D {
> +	.dummy_cycles =3D true,
> +};

[Severity: High]
Does setting .dummy_cycles =3D true drop the dummy phase when a GPIO
chip-select (cs-gpios) is used?

At the start of spi_mem_exec_op(), spi_mem_convert_dummy() converts any
dummy bytes to op->dummy.ncycles and clears op->dummy.nbytes to 0 when
dummy_cycles is advertised.  When spi_get_csgpiod(mem->spi, 0) is
non-NULL, spi_mem_exec_op() then skips ctlr->mem_ops->exec_op() and falls
back to spi_sync() -> stm32_ospi_transfer_one_message(), but that fallback
only creates the dummy_data transfer if op->dummy.nbytes is non-zero:

drivers/spi/spi-mem.c:spi_mem_exec_op() {
	...
	ret =3D spi_mem_convert_dummy(mem, op);
	if (ret)
		return ret;
	...
	if (ctlr->mem_ops && ctlr->mem_ops->exec_op && !spi_get_csgpiod(mem->spi, =
0)) {
		...
	}
	...
	if (op->dummy.nbytes) {
		memset(tmpbuf + op->addr.nbytes + 1, 0xff, op->dummy.nbytes);
		xfers[xferpos].tx_buf =3D tmpbuf + op->addr.nbytes + 1;
		xfers[xferpos].len =3D op->dummy.nbytes;
		xfers[xferpos].tx_nbits =3D op->dummy.buswidth;
		xfers[xferpos].dummy_data =3D 1;
	...
}

Because op->dummy.nbytes is now 0, no dummy_data transfer is added to the
message, stm32_ospi_transfer_one_message() never enters the
if (transfer->dummy_data) block, and stm32_ospi_send() executes flash
operations with 0 dummy cycles on boards using cs-gpios.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-macronix-u=
pstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com?part=3D14
