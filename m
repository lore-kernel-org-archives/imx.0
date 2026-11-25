Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629727;
	b=W6/HBmsbOj63E0lxJlMWovMmUUU7q9o5l/tZNRQNssDv54Cf5Jj9fWTfZjLfTjpxCmyC
	 4M/9UGv4F1RifKkC/j7L18lO+vZhC9F/eAbQZhCV3askN75RJDzZNAmJmCofJgxSVOes7
	 aAz5SdYPy4aE7sGrRwBB/l6vJFdyn/xcXyeg1EgjosHKETXpchR3+GL9d8EGRZCYW/78k
	 TZapl/De6fFZNGUw4TlN+iYOQtAqCNDh4u3nI30GNcbhfvyZn+JOswZau/S6MQ04CPLdL
	 YO9C+Tfj2NQ6oFs6EzZvmH0DTiYhnHnzZ1qEiSZ517RvPhGJsL+efiWtPmPEPCJ/DwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629727;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NR8kPtL7fWba57Aw01s+W/eWyi2it+pqLm6YFuaUa6A=;
	b=L4lexA8a6UXRZ/RNXn6tD481vtx61UWEev0LYS9D0RFCSqSvqLRIV/b4+OtEdZmNX+pC
	 ZRqzvBQm2gcEMfOer00EBAH3XZyIFjxiM+/w0/8BvcyKvE1heQ9nGaZG27ZSW9Fa75pmS
	 zGP9uakzSCDvfPg6xqHx2CV65s8H/OAtfUBvP/T5LQ6zRD5tzI6/oesIgjUlD51JSic5I
	 sU4WMT6KwzDqKIC11HAgphckX5QmkPbGeE9MwEZ86HlX2SQ2rz/OCFAPtjX+gg8mXtcDy
	 gr2iBF3o9PTPqjz9Qt5uP9ecn0dkJZRD+jQwUJZAwmf0BqYJ32X2MLtz6rteTNpPWKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="AgO/4R8B";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5A9606A32C
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AgO/4R8B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294941F000CF;
	Wed, 25 Nov 2026 18:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795629726;
	bh=NR8kPtL7fWba57Aw01s+W/eWyi2it+pqLm6YFuaUa6A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AgO/4R8BYBJe0S3TCx+w0Fo8nFpVdeZ1BLuxLlcOJ/lcZh9CPTRaNcbswsa1vZKAg
	 vIOiMwE96Smc3wQcP6P3UiM3rxwrmJ2OulRPj6igx6yMKe/ECWB+7I3PzATf5wJa0B
	 HM0AmEp9KVkHRcUTLyhW/toFmV+f3nhY0PTyLrUPiKWtoqgH4uPGap396bEzis2ahe
	 8nXSjL+MpcOGWt07HatKDQAyvE30Awo19X8Vtu67vLzr9MzordUgiyt1Xo0PRwJWgW
	 e2jwonigcBeAuodvo1pEtcYSJ8kSQxJR6Xdsn6S/lEMTlpYXf0KrGnuQ2YGQRR/9id
	 oKXiMhDMpyGaQ==
Message-ID: <sashiko-outbox-233890@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 12/16] spi: rtk-nor: Consume dummy cycles directly
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
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-12-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
 <20261125-macronix-upstreaming-spi-mem-cycles-v1-12-fd036402fd37@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:02:04 +0000
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
- [High] spi: rtk-nor: build failure in rtk_spi_command_read() from dot
  on pointer op
--

commit 33482af3701e77a28660250c89cfba6bbad8b4a7
Author: Miquel Raynal <miquel.raynal@bootlin.com>

spi: rtk-nor: Consume dummy cycles directly

This commit advertises spi-mem dummy_cycles support in the Realtek SPI NOR
controller driver and replaces the byte-to-cycle helper with direct use of
op->dummy.ncycles.

> diff --git a/drivers/spi/spi-rtk-nor.c b/drivers/spi/spi-rtk-nor.c
> index 55ea7c3718543..6febeee2541d6 100644
> --- a/drivers/spi/spi-rtk-nor.c
> +++ b/drivers/spi/spi-rtk-nor.c

[ ... ]

> @@ -192,7 +182,7 @@ static int rtk_spi_command_read(struct rtk_spi_host *=
host, const struct spi_mem_
>  	size_t len =3D op->data.nbytes;
>  	loff_t offset =3D op->addr.val;
>  	u8 opcode =3D op->cmd.opcode;
> -	u32 dummy_cycles, val;
> +	u32 val;
> =20
>  	writel(opcode, host->regbase + SFC_OPCODE);
> =20
> @@ -203,8 +193,7 @@ static int rtk_spi_command_read(struct rtk_spi_host *=
host, const struct spi_mem_
>  	if (op->addr.nbytes > 0)
>  		val |=3D ADDR_EN;
> =20
> -	dummy_cycles =3D rtk_spi_calc_dummy_cycles(op);
> -	val |=3D (dummy_cycles << SFC_CTL_DMYCNT_SHIFT) & SFC_CTL_DMYCNT_MASK;
> +	val |=3D (op.dummy.ncycles << SFC_CTL_DMYCNT_SHIFT) & SFC_CTL_DMYCNT_MA=
SK;

[Severity: High]
Should this be op->dummy.ncycles instead of op.dummy.ncycles?  op is a
const struct spi_mem_op *, so using the dot operator fails to compile.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-macronix-u=
pstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com?part=3D12
