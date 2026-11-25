Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629537;
	b=UrcRyb8CZCqNDgC14dsxoJmhJpuWd5ndl7BAenF7CHS5Ling+9XsPQy/bgaCV/c+ybEY
	 UvVRavUP424Kos7VJ4q5C8aN7dwLSjjkRJArRv/FFyGBj9vvE/I6xTUzu2RlskTpytZK8
	 6rBgaEHORo+LA469yvnXkwjPRhI92k3WUsUw4pcSqYWe97lsGHyGD1ovFBUz2v/UjCPJE
	 1/UjgOqDqW2VTtzvpE9lN2qxCSbQDWETqCN7Y0TCMlKk6Qgh3BW6WDeEDgc+Kw7dXATp3
	 WsPhYGGcA3TGPicHbkYtfqvf32O9VhFEZl1ztx2wD7rNQL7fk/UBUkwf+cnuEz7aN5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629537;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=n/q7CZ4WchDFjcjZtl3tPRaBN+QI0P+NeEOoKx24qh4=;
	b=NiK6nyNohNIFwkW65BYtsqWLrRzk+7eAbJcBilRgbCfYeADgudHRpaloT0RgPLEY4FVJ
	 +ll5ftWJbX2yBgJn68VVOk8uSvt4pgFZOxWaXkgSnlDCn/7uUilJs0dkkuQbjYYtEXDfE
	 AjmoO1y8J42gDQg7u1w4W4XeTtsNFy5/A+6a4HE+UG7nLo0ou3HU9j5ON/2sJq3rL7na1
	 Xx9yYEc18nYqzxr0ZOldgCCCCNdkoRoE8xjPQVb4GIHxqCeY5wplO41RDMZ9iem7cbZAT
	 pppVE5vzMdIQ5ROkA+YqiFkuWWCh5H/ewL8wgWmcKFCHdFqey3TG5FjO01Ycn3cHE/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="U/EWSr9R";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68658606A32D
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U/EWSr9R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD5E1F000C4;
	Wed, 25 Nov 2026 17:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795629537;
	bh=n/q7CZ4WchDFjcjZtl3tPRaBN+QI0P+NeEOoKx24qh4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U/EWSr9R2bnkPoMWGsf7W6ueTQdiSPV8ZdbM2tjQP5StBlLBG9NtqhV5x/uMdl0de
	 JNrsGKh6KSL9gWXzX+9F3GRSe1N9NmceW5FrWiyDAvo8L7TcLYZpAmNyLxrGchZ1EV
	 YO9AohJ/pvbXg42BIFh5lyuS0egtQgsN2K8ha6tAJ/ETyoTo8aGlrfmflf2kkjJLPv
	 tNLNvASAXB2RCC+Ig8yDULXQtBTzkW86mziDH/3EoTzr1ZP+EZlb+OjABjIGUXXRSn
	 /zm7v7lIQI7ZfEaKMPTLft2sTlkhM3LKTMRIQ4WznIBUcezOBUAw7ab99Lwhyul3Nb
	 +4uJxIqr4bgPA==
Message-ID: <sashiko-outbox-233877@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 01/16] spi: spi-mem: Handle a corner case while
 sanitizing ops
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
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-1-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
 <20261125-macronix-upstreaming-spi-mem-cycles-v1-1-fd036402fd37@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 17:58:55 +0000
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
- [Low] spi: spi-mem: missing Fixes trailer for
  spi_mem_default_supports_op() fix
--

commit bb612cd08d5fd5887be36ce57a7159e805a4780d
Author: Miquel Raynal <miquel.raynal@bootlin.com>

> spi: spi-mem: Handle a corner case while sanitizing ops
>
> Some mixed mode operations (such as 1S-xD-yD) will be flagged with
> op_is_dtr but will not enter the ODTR checks. As a result, the number of
> command bytes will never be checked.
>
> Reorganize a little bit this helper:
> - If the operation contains a DTR phase, sanitize it.
> - Then sanitize the op, should it be:
>   - ODTR (8D-8D-8D)
>   - anything else
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

[Severity: Low]
This fixes the command-byte check skipped for non-ODTR operations with
DTR phases since 8618271887ca ("spi: spi-mem: Limit octal DTR constraints
to octal DTR situations").  Should this include:

  Fixes: 8618271887ca ("spi: spi-mem: Limit octal DTR constraints to octal =
DTR situations")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-macronix-u=
pstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com?part=3D1
