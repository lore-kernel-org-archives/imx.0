Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629554;
	b=RSi3w3DgMOWm5cPOlRjycKc0aVxHWPd8BZLMgw9go535tH1sPGe7aFex79pjBetJwBOb
	 CyXsIwm5QVl5ommdj4B3VRgbpsK8Fel0G5AsXzfSomCEss+q/q4C9zfYP7hQdZlPbC2yb
	 akoH5gO6JaC62UBftrn5uKLVnRVI/vQ/J7Ettc+i9hG6X9/Psn3fQ6zTNtGLkIErTxo7o
	 I5TXhc+W4e4pRIf36hCDafNw15Brj7lFL9/nJnUcpBhxBqmB1V/Qqhoc+kCBba/6VqKXF
	 QMXNUJj9/eA5vW5tGfOoVgtSZp8BMJD+NLjAy0m2vQTf89wXrGR44q13dZH50HYAH1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629554;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cx0jvhfBI/Pwd8AkeKgKtDRtUq4HLgRmy9OsRYZ8HQo=;
	b=2uvk+aOxoaVWvyRmdCRRrgnqRbjX3L2RJx7ZHdyil/VgkrroQov5s4QggKlts9gaYgQ7
	 Ip7MdtemiyDhIUzPxowVILLQorLBK7kCQZM0K8vk6ALTTuu2TkzTB4SJax2u2/T29ggGT
	 LQiH8pwWc8duzIVCcs5PFeZvi1o14ZUK8/0Qma6E6Zr35LDZ/9zi3y+D1dWkmyBTGe5iu
	 jSEE2fU7qCCLE/fb+e2Wl4zm1YBEL9mwCPMbHDE7thWATGRMK2GJlnK9n0hW2j1rA5uKj
	 BvLMX4a1kBPqke7Q4/7WnfCEMwvNoNS5+UJiFwKmedJ3vE0fgXoxlXUvjtjqAE+mZZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TP+w46Bx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AFD606A321
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TP+w46Bx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894101F000D2;
	Wed, 25 Nov 2026 17:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795629553;
	bh=cx0jvhfBI/Pwd8AkeKgKtDRtUq4HLgRmy9OsRYZ8HQo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TP+w46BxnsmTR9fWyQOIO2Tlnw0bylG7Qyhd3VoiORepkgGP1KaLo6uUEsaQOh27A
	 1o6COCbGPwJRc5PZ/+xekIXkrLH0WDjWTQZprGtaiEm87wqnz/2W+E0x1uxiEbJuQP
	 yUVBUjvI6iffDcfOujBi9odD0qjYqC2GM5b870p3c418s5+7rFIOOmIawnpUJgXSsP
	 HAs/Y3aL6FRH8gEO0BStNuNpBQqgYz9yulnIc5pQi7qafR1jE//uC5sIjy8dnvBCxD
	 Qsk9TBr4wgSj5ZhdlHVLKrQsNd4H3XrhK+D2fK7XolWrCGXld6ySTFtCahOh6rMoB1
	 duCG4JsGVIi/g==
Message-ID: <sashiko-outbox-233879@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 06/16] spi: amlogic: spifc-a4: Consume dummy cycles
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
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-6-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
 <20261125-macronix-upstreaming-spi-mem-cycles-v1-6-fd036402fd37@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 17:59:12 +0000
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
- [Medium] spi: amlogic: unused dummy_cycle and aml_sfc_is_xio_op() in
  spifc-a4
--

commit d55fa85d06375ffce26e0f147adc64d4704ca984
Author: Miquel Raynal <miquel.raynal@bootlin.com>

spi: amlogic: spifc-a4: Consume dummy cycles directly

This commit enables the dummy_cycles spi-mem capability and updates the
driver to use op->dummy.ncycles directly instead of converting from
op->dummy.nbytes.

> diff --git a/drivers/spi/spi-amlogic-spifc-a4.c b/drivers/spi/spi-amlogic=
-spifc-a4.c
> index 16346f50c7d99..ac06ea735133b 100644
> --- a/drivers/spi/spi-amlogic-spifc-a4.c
> +++ b/drivers/spi/spi-amlogic-spifc-a4.c
> @@ -361,13 +361,8 @@ static int aml_sfc_send_cmd_addr_dummy(struct aml_sf=
c *sfc, const struct spi_mem
>  	if (ret)
>  		return ret;
> =20
> -	if (op->dummy.nbytes) {
> -		/*  Dummy buswidth configuration is not supported */
> -		if (aml_sfc_is_xio_op(op))
> -			dummy_cycle =3D op->dummy.nbytes * 8 / op->data.buswidth;
> -		else
> -			dummy_cycle =3D op->dummy.nbytes * 8;
> -		cmd =3D CMD_DUMMY(sfc->cs_sel, dummy_cycle - 1);
> +	if (op->dummy.ncycles) {
> +		cmd =3D CMD_DUMMY(sfc->cs_sel, op->dummy.ncycles - 1);
>  		return regmap_write(sfc->regmap_base, SFC_CMD, cmd);
>  	}

[Severity: Medium]
Does removing this block leave the local variable dummy_cycle in
aml_sfc_send_cmd_addr_dummy() and the static helper aml_sfc_is_xio_op()
unused, causing -Wunused-variable and -Wunused-function warnings (and a
build failure with CONFIG_WERROR=3Dy)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-macronix-u=
pstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com?part=3D6
