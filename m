Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629680;
	b=l+ePAW6h4IQ3rlXPQi8mB+Qbt5sphmLKP/eMN3YOjWntHid2g1Kxyq2ty89Doe679dPs
	 9TTs7r2aUrQzRcyVdEYU50BJvVlcZxemEwlDoBXZ8mhL8VFZYzZFo2/6PNvR9Z31WNy/B
	 6+yxhLVp0SICHir7oGRfHxjJwl68O4wbgHe3rGMMnycBocSfI0DGWBxPpm77mqR0uvHOL
	 q9RR8D0fWtwVpEXnNVoky4t1iBK/eeWlC2NvFkg8cxCxnC+CEQ1hTjmaHemRL66nAUFYv
	 TeLhhx54b2/8AB4BjNUgSmxR+h8nrWAb+oxqm7EeMKYMa/ElGQIX7lwkeTyEuWJinYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629680;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Kfnsn+GExxNF6/85LEMQhNMM6va6vosa6Wa8rs1WCO4=;
	b=vyjUE+8V9iRtTVsfkWk/XptXoFPd7tPdDhezpb88oaVL+lvsKiHq6Cg2jO0+u0nT9N2m
	 q9DaXKsUpdc9gmGNnfmZ7TATa7gO1C3Is2RpBZijjG74lCs0QoeoHI6MDpzntF7QXjrBd
	 0yEVoMwKc0H+JPjI+8iGqs4awfyO5NxdHIKcH06bged9WOZh6aW/TAHe86uO50Grj6T48
	 iYJu/Em6QQ85xI5vBOJT45t6EkyxFUKtHnNnYPKu6SnL8j3Pd8Ys1EQJkQ39hQPEiJMzw
	 K5RDK/g7aiigB60wfz3DZBpgmYoYew4/D68lK2gbCeUdjsVxFBsIkWqXsRXELG7GHhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fzztysMS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44F7606A323
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fzztysMS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF3A1F000C0;
	Wed, 25 Nov 2026 18:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795629679;
	bh=Kfnsn+GExxNF6/85LEMQhNMM6va6vosa6Wa8rs1WCO4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fzztysMSAN+Qk5X91RAFmJr8I9YRkbOVZ7bim/A+1lN9fFPqt3ftvtRx0/R93mfTl
	 BqkJtNbph+G4LWywi3lBM/OknMNYEQSGfsE2mUQnxzVnWjLw+Vw9g7yNIs9ioDGGsA
	 qJNb7uljE/DlM9F18WTrCHhJigYq5mjYu6yDuJtb9oDhA1bxrskFe1ryq9M0F+eY12
	 HnmsBGMgcxw+96C3LFG90cDKHATjPPpQOgWizrn1R/GmvuHytoRyYfAYnLtLrXGu14
	 BCZKd9hUp6t9DoDsOlG/5s0btzt0XFifdsH5i15++ZN7+4MfWHgabNN1YMg6JohCCB
	 R5Ip6m9UgrnqQ==
Message-ID: <sashiko-outbox-233886@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 13/16] spi: sn-f-ospi: Consume dummy cycles directly
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
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-13-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
 <20261125-macronix-upstreaming-spi-mem-cycles-v1-13-fd036402fd37@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:01:16 +0000
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
- [High] spi: sn-f-ospi: build failure in f_ospi_supports_op() due to
  op.dummy.ncycles
--

commit 5b202d148b915b6297c8b1354c3c876aa99057c5
Author: Miquel Raynal <miquel.raynal@bootlin.com>

spi: sn-f-ospi: Consume dummy cycles directly

This commit advertises the dummy_cycles capability in f_ospi_mem_caps and
updates the driver to use op->dummy.ncycles directly instead of converting
dummy bytes to cycles.

> diff --git a/drivers/spi/spi-sn-f-ospi.c b/drivers/spi/spi-sn-f-ospi.c
> index f0320e96fe232..ecfcf228c5870 100644
> --- a/drivers/spi/spi-sn-f-ospi.c
> +++ b/drivers/spi/spi-sn-f-ospi.c

[ ... ]

> @@ -553,7 +545,7 @@ static bool f_ospi_supports_op_width(struct spi_mem *=
mem,
>  static bool f_ospi_supports_op(struct spi_mem *mem,
>  			       const struct spi_mem_op *op)
>  {
> -	if (f_ospi_get_dummy_cycle(op) > OSPI_DUMMY_CYCLE_MAX)
> +	if (op.dummy.ncycles > OSPI_DUMMY_CYCLE_MAX)
>  		return false;

[Severity: High]
Does this fail to build because op is a pointer (const struct spi_mem_op *)
accessed with '.' instead of '->'?

Also, op->dummy.ncycles is a u8 while OSPI_DUMMY_CYCLE_MAX is 255, so
comparing it with '> OSPI_DUMMY_CYCLE_MAX' is always false and triggers a
-Wtype-limits compiler warning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-macronix-u=
pstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com?part=3D13
