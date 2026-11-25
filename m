Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630120;
	b=ui3fO5X88V+M+4wUiNG/K8lGy8i34rv7P6kqhC02ieeKe3J5IOeZSjkWi9txtKKE1VuH
	 kVFURNeLivrAARnHe/Efd7nYe+VNHJVyVdxtDjogOucBe5KAg1T7bLSZsKW+mM+wLl0+t
	 +jltNpuHGWRSDeKT/mtloANmqNOfVDTR5um54JGFsgsKamrJvy9Kr1mgLxU80mBFl+mnd
	 kGXhXBfMxOQYxPWDby0ZWbFDvClTOm+ZFNhOr453HmXG5rNRglzIothWumgFMrM1plpBw
	 8h45KRSTMMpHtchC8APHYQiP4hYFX9MUKipzAE8bdY3Ipy46WSHUuOVrgVy1iORMQcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630120;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gqX5XC9FvJ8RTI8oh/HTX9+Z3FxwlghL3GovzCr+sHk=;
	b=5k3ntykUlmiNX8OF3jlWzbS5B0ogBuMrEMR5yrOUmw4MdM/Kg5osKIsHJhNaxUGKyJzQ
	 OSZRPl70G+1qro2ZWuxCnyb0pDK8OBfr//4SX2dFYUmbtpepGQUFK+my+Q7tX6eICM6O9
	 PsDeRgO/mjeZba0eHRCgqM5XJ77cQCBcOXDfH46PffpVVs4JqFouMOhpaAYNxbNK4DohA
	 T5gWDxQLEr56ZCd0sLOj98JlHsL9t9R4n8iNKLovHpLAUCT5h+hcGibHAhIMPAWN+o8ra
	 Dc9I4Pevp1dkelFTY6Alajp5mV8Nwcx+yojyiVNw+c+vqY8Szay9iZHQWuPdp0sI2eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lli4x+QG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335D1606A321
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lli4x+QG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D28E1F000CF;
	Wed, 25 Nov 2026 18:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630119;
	bh=gqX5XC9FvJ8RTI8oh/HTX9+Z3FxwlghL3GovzCr+sHk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lli4x+QGdkGzm3hBrWb1Xd0tADBkjOjJD5bUI0qfKErInfukbrwaKhUYlV0AghPtx
	 SRcHXuHNlGm47LH9O8XETY+cEifFwaGfutCM7onB929DogZM7Ba8ucmLRD2wSFeJgb
	 Pq/sS58Py6eTZstIi/QdzRDaID+Lxbsmbd15eRSiQUNmAB4wJDHyFxKTxbuyGLRdYM
	 pIOFHF7a1BvN5f59FJ/J/2h46rz5U7PhmeBQdZZW/qrI//R3vO7oHRL6aO6Y72k+Mt
	 fsRNaH8E/VXkhpHjuY85ijCWkHsXJuY3CiIgRJXxZYno30+b/Sr0kltrqyaooruMyT
	 fVmGHoNnZQqnw==
Message-ID: <sashiko-outbox-233911@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 16/16] mtd: spi-nor: Express the dummy phase in
 cycles
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
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-16-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
 <20261125-macronix-upstreaming-spi-mem-cycles-v1-16-fd036402fd37@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:08:38 +0000
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
- [High] mtd: spi-nor: spansion: s25fs256t_late_init() passes 1 dummy
  cycle instead of 8
--

commit a9d3a1e024f3a4306e5fb27cb054e3ab383f7673
Author: Miquel Raynal <miquel.raynal@bootlin.com>

mtd: spi-nor: Express the dummy phase in cycles

This commit updates the SPI NOR core and manufacturer drivers to populate
spi_mem_op dummy phases in clock cycles rather than converting them to
bytes.

> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansio=
n.c
> index b1b14ed0fd467..72cc11d3f1d35 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -53,10 +53,10 @@
>  		   SPI_MEM_OP_NO_DUMMY,					\
>  		   SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
> =20
> -#define CYPRESS_NOR_RD_ANY_REG_OP(naddr, addr, ndummy, buf)		\
> +#define CYPRESS_NOR_RD_ANY_REG_OP(naddr, addr, ncycles, buf)		\
>  	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 0),		\
>  		   SPI_MEM_OP_ADDR(naddr, addr, 0),			\
> -		   SPI_MEM_OP_DUMMY(ndummy, 0),				\
> +		   SPI_MEM_OP_DUMMY_CYCLES(ncycles, 0),			\
>  		   SPI_MEM_OP_DATA_IN(1, buf, 0))

[Severity: High]
Does changing CYPRESS_NOR_RD_ANY_REG_OP() to take dummy clock cycles
break s25fs256t_late_init()?

drivers/mtd/spi-nor/spansion.c:s25fs256t_late_init() {
    ...
	/* Read Architecture Configuration Register (ARCFN) */
	op =3D (struct spi_mem_op)
		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
					  SPINOR_REG_CYPRESS_ARCFN, 1,
					  nor->bouncebuf);
	ret =3D spi_nor_read_any_reg(nor, &op, nor->reg_proto);
    ...
}

Reading SPINOR_REG_CYPRESS_ARCFN in 1S-1S-1S mode requires 8 dummy clock
cycles (previously 1 dummy byte).  With ncycles set to 1 at 1-bit buswidth,
spi_mem_dummy_cycles_to_bytes() fails with -EOPNOTSUPP on byte-granular
controllers, or cycle-capable controllers clock only 1 dummy cycle instead
of 8, causing S25FS256T probe to fail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-macronix-u=
pstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com?part=3D16
