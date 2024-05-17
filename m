Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4761912C492
	for <imx@lists.linux.dev>; Fri, 17 May 2024 18:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715971153; cv=none; b=uHYDJE+F6UcCVSVY0B2VUhX0FhQx2Yb4lkl3/8F5BocxQMrF5fu3dHaswcjvvAKIsNRYX73ZO+LJjzuVgIN5jJ8x0cts0T5PB+dDrOrl7laYlxDX1s1XFT6+VEvYH6CIiNgO0LiATo1uSlnegeTZeYtPL1YT+xpwnueTGE88Ehs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715971153; c=relaxed/simple;
	bh=XjbV/dDMibbGeaSWigHuyPox9WqyXpKxSJ9Fnk5PmIg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fTOofRcTyHYP7CwqS5NpEZSAZxZolayPuJpqpzYt0rVTT0mOUtgF3H1/OXqKayA96Uv7Y4S+gT5cxkpiee1gydsYdxUt2KiC+p4n4uKd9xA1M/yC5SrkUM770mUPd/ySaFTTuvh3AfCLOAuWIdMcj2rTAd1WyWl6vtSuPQN7GLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IFUQN0+f; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IFUQN0+f"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6343F60005;
	Fri, 17 May 2024 18:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715971148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MQ7u9L9F7F+dadEFYVniuXHGpmQQ9IaDZC1coQKlN20=;
	b=IFUQN0+fQySFvQs40/92OM4Rw9bpLf2T3FAWIbtByl/HZ1fSz6CflMrs1uuekDlGVkf+rH
	XivWXqepQgAO8O4sQ0VXDcPV44h/OSCdX5nA/uaOFb2UxpLSvdL8jE6kSAFhzb2CKVEbaR
	6ghyt/pnaqxnFJD3I9RH4K8ebiojEepfpmBQbqW/COW+Kkcx31zG6RTstU8umeRaBxR6gC
	+Y7kPqIm1RNkrkfSaCRT1n1vgJJ896xM+6Oj6P6+zUv6zZvys4KkePGixR3kvg8RdAUrDI
	Bmb9MSoetIJIzJ6zIbKZFKieN8pF6hNRs579apctpFv2FKMVQrxYoxvcImulDw==
Date: Fri, 17 May 2024 20:39:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Han Xu
 <han.xu@nxp.com>, Vinod Koul <vkoul@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] mtd: rawnand: gpmi: add iMX8QXP support.
Message-ID: <20240517203904.2879419a@xps-13>
In-Reply-To: <20240517-gpmi_nand-v1-3-73bb8d2cd441@nxp.com>
References: <20240517-gpmi_nand-v1-0-73bb8d2cd441@nxp.com>
	<20240517-gpmi_nand-v1-3-73bb8d2cd441@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Frank,

Frank.Li@nxp.com wrote on Fri, 17 May 2024 14:09:50 -0400:

> From: Han Xu <han.xu@nxp.com>
>=20
> Add "fsl,imx8qxp-gpmi-nand" compatible string. iMX8QXP gpmi nand is simil=
ar
> with iMX7D. But it using 4 clock: "gpmi_io", "gpmi_apb", "gpmi_bch" and

  to?             is         clocks

> "gpmi_bch_apb".
>=20
> Signed-off-by: Han Xu <han.xu@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 20 +++++++++++++++++---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |  4 ++++
>  2 files changed, 21 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nan=
d/raw/gpmi-nand/gpmi-nand.c
> index e71ad2fcec232..f90c5207bacb6 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -983,7 +983,8 @@ static int gpmi_setup_interface(struct nand_chip *chi=
p, int chipnr,
>  		return PTR_ERR(sdr);
> =20
>  	/* Only MX28/MX6 GPMI controller can reach EDO timings */
> -	if (sdr->tRC_min <=3D 25000 && !GPMI_IS_MX28(this) && !GPMI_IS_MX6(this=
))
> +	if (sdr->tRC_min <=3D 25000 && !GPMI_IS_MX28(this) &&
> +	    !(GPMI_IS_MX6(this) || GPMI_IS_MX8(this)))

Feels completely redundant, no? If it's not an imx6 nor an imx28, it
already returns -ENOTSUPP.

>  		return -ENOTSUPP;


Fine otherwise.

Thanks,
Miqu=C3=A8l
