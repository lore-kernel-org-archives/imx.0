Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629504;
	b=FoxeFegZ4zL8quO1dH0ysjXJkoDzObH9Gf9JLbT4r5OGMzr0kz/CoLZmE9FZj+e2yGoi
	 n19q9w1ygK40uxQYLXlZ8q4rV1rxmBJUuKQIyVXMkXhmDh5nAMbuZQKv7dW+TVVWp0xlg
	 LdFNAAnyH+54cYByWLZWFoE4kNgfs1m3zxLRfde/h9hOMf4YJJvepI8vhZ33I0pM0zwrm
	 GcAVFME2aMcZOEgD1n/4GIKY8BcywS3HTCHNX5/8Nhj5UVHxIE2hcQbk+axVQtLglXNTw
	 N5O5corqcpEIT2yenCIXR3r1mYomg4y/KUMEXLtkPFQ7VH5MEzEhHeFw8xbEM+psL2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629504;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gIlN+r8h9Pbt/yzQjLsXmvUyreMp7XomyI06MZZutuA=;
	b=2npcLtQMYrSTQtddMpC/ksWc2rJAzaHh+AILVuPQMnSytKXqW6vCAKIVFlJm7hMjtIMr
	 E8e+SY6mGmmy1YBNM8j3LeEdz/sFyPqCMBLRvh/oS2SoQVAenXsk718flyHgjvmhKNm32
	 ZrBTaIMlWbnEuDgVsJxR0361ddKMI88Svd4r4vGvg8MXsCmO4AiIyoEB59uWlnyzCFNeq
	 htXq6GdJYwYq25h5vK8t5zcojwVsTS8DIjOnUx8REi0h6oMImEWULilrDknSewoy9UatW
	 5ndwRtdAhRO3B9bD7BaAh6hgf0mgPtjVz4cpGR7niKwV9joz+IZy2kg6VcyY/QHRF+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nFQ82qw+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8321D606A31E
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nFQ82qw+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D871F000C6;
	Wed, 25 Nov 2026 17:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795629504;
	bh=gIlN+r8h9Pbt/yzQjLsXmvUyreMp7XomyI06MZZutuA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nFQ82qw++FHkfGeiEic72JcJDsGOJ+faMyFoqIyfCTPoLBaWH9EcQyHnYEkTINXgK
	 6g8iBjOpi/howEqqxu2E3goRwdI41Q82FSZl6dTfDoEL4iDmzlPWzuZIYKLqAnq1X8
	 WEyArPdn9gu+DXwh0gvWPHxAvU7XYGyUKTpomRviL3Vlw/Zc8fIgYa06Rc+W8CrjHU
	 tQOQbxzzfu1IDru6nqV1Bz+e0gEnDLWlqy5YnHaUIBvQkcm4oa2+lWs/DKtiGpL4du
	 HgjQN7ANNSIk+UHmMI0BwVmYPXGY0N/18huuBWycMhTidS9gEXwn9oqH6N1/SiaIYG
	 ELJFE+E5dF4AQ==
Message-ID: <sashiko-outbox-233875@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 08/16] spi: fsl-qspi: Consume dummy cycles directly
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
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-8-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
 <20261125-macronix-upstreaming-spi-mem-cycles-v1-8-fd036402fd37@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 17:58:22 +0000
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
- [High] spi: fsl-qspi: missing dummy_cycles in fsl_qspi_mem_caps zeroes
  ncycles
--

commit 96f0741ca2d71f7fc3b26b9f08845776854eb8a4
Author: Miquel Raynal <miquel.raynal@bootlin.com>

spi: fsl-qspi: Consume dummy cycles directly

This commit converts fsl_qspi_supports_op() and fsl_qspi_prepare_lut() to
use op->dummy.ncycles directly instead of converting op->dummy.nbytes into
clock cycles.

> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
> index d2c2090442f84..a1d6357e3203a 100644
> --- a/drivers/spi/spi-fsl-qspi.c
> +++ b/drivers/spi/spi-fsl-qspi.c
> @@ -399,7 +399,7 @@ static bool fsl_qspi_supports_op(struct spi_mem *mem,
>  	if (op->addr.nbytes)
>  		ret |=3D fsl_qspi_check_buswidth(q, op->addr.buswidth);
> =20
> -	if (op->dummy.nbytes)
> +	if (op->dummy.ncycles)
>  		ret |=3D fsl_qspi_check_buswidth(q, op->dummy.buswidth);
> =20
>  	if (op->data.nbytes)
> @@ -413,13 +413,12 @@ static bool fsl_qspi_supports_op(struct spi_mem *me=
m,
>  	 * to fit into a single LUT entry.
>  	 */
>  	if (op->addr.nbytes +
> -	   (op->dummy.nbytes ? 1:0) +
> +	   (op->dummy.ncycles ? 1:0) +
>  	   (op->data.nbytes ? 1:0) > 6)
>  		return false;
> =20
>  	/* Max 64 dummy clock cycles supported */
> -	if (op->dummy.nbytes &&
> -	    (op->dummy.nbytes * 8 / op->dummy.buswidth > 64))
> +	if (op->dummy.ncycles > 64)
>  		return false;
> =20
>  	/* Max data length, check controller limits and alignment */
> @@ -460,11 +459,10 @@ static void fsl_qspi_prepare_lut(struct fsl_qspi *q,
>  		lutidx++;
>  	}
> =20
> -	if (op->dummy.nbytes) {
> +	if (op->dummy.ncycles) {
>  		lutval[lutidx / 2] |=3D LUT_DEF(lutidx, LUT_DUMMY,
>  					      LUT_PAD(op->dummy.buswidth),
> -					      op->dummy.nbytes * 8 /
> -					      op->dummy.buswidth);
> +					      op->dummy.ncycles);
>  		lutidx++;
>  	}

[Severity: High]
Does fsl_qspi_mem_caps also need .dummy_cycles =3D true?

fsl_qspi_mem_caps only sets .per_op_freq =3D true.  Without .dummy_cycles =
=3D
true, spi_mem_convert_dummy() converts any dummy cycles to op->dummy.nbytes
and sets op->dummy.ncycles =3D 0 before invoking the driver callbacks.  As a
result, op->dummy.ncycles is always 0 in fsl_qspi_supports_op() and
fsl_qspi_prepare_lut(), so dummy validation is skipped and LUT_DUMMY is
never programmed into the hardware LUT for operations requiring dummy
cycles.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-macronix-u=
pstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com?part=3D8
