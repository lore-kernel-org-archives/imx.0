Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E92B16F903
	for <imx@lists.linux.dev>; Fri, 12 Jul 2024 14:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720794914; cv=none; b=GpU/rAo+lCMFJkKRXgZNpbsV9ld9z5TL8ra23MAnukSpchHQckzNkcszZJlQzMLE6mj3uKjgZrWenmXdLGHWo1GoK/dEwBQBBsaQ9+QgmD2uUeGS9Obfge0EkdwExDV4QNigLtPSe6c/haV/qxfx6ENNQXpc0fsbQL4Ge82Dr+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720794914; c=relaxed/simple;
	bh=+CiVeB36WC3XhinXVvw3aBG/Q6TEMnuDcanTg5z9DXE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M34KyUjSR9On4IRe1eM31VFKjxe9rcji5DGwQKdn/MxWtUDV0ScsxT7wyn51sBkzaB9u3riHBlsLwFCY/pDikCYZ/iEKv0ZYigqKFlXsraRtxWMm+I+iphtqgPl/jRpvduhytNFZGx1N4dc1Xw4EC8Y1sCDIFY1zklfXe/fUJnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RCA9lVVX; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RCA9lVVX"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0858B6000B;
	Fri, 12 Jul 2024 14:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720794905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+CiVeB36WC3XhinXVvw3aBG/Q6TEMnuDcanTg5z9DXE=;
	b=RCA9lVVX1fd75spCVuVahSk1RoqL9eZbgexe3LnZmD+IsA7s0KLR4kU0QT6UQzVSQrcrPX
	hRiL3pPLMNwY4j16hbLtdlG5J+BEEA1PW7OW7sjOjXbSeY14TvMoAj1mIPMbsItiZvowOQ
	piShlvO2atXTdq/ISgShhl/xtRHkX+Z96RhtZHiU1TLZR7Gnw5w1RasNCG0SS+DHpspE3C
	dZUPWp3bNqaTriRX3hgPZNbOHazHGNgNQK8n++DqtMVk37DB13EUCRlel7A9e3Q4Zwg3Ay
	L9g8Ji7Nb82hIJNCnIwTjQT/ej4Az4/PbJYd7xyyek1Zmaaf4T3FbmlAXVsP/w==
Date: Fri, 12 Jul 2024 16:35:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Han Xu <han.xu@nxp.com>, Vinod Koul
 <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/6] dt-bindings: dma: fsl-mxs-dma: Add compatible
 string "fsl,imx8qxp-dma-apbh"
Message-ID: <20240712163503.69dad6b1@xps-13>
In-Reply-To: <20240527121836.178457-1-miquel.raynal@bootlin.com>
References: <20240520-gpmi_nand-v2-2-e3017e4c9da5@nxp.com>
	<20240527121836.178457-1-miquel.raynal@bootlin.com>
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

Hi Vinod,

miquel.raynal@bootlin.com wrote on Mon, 27 May 2024 14:18:36 +0200:

> On Mon, 2024-05-20 at 16:09:13 UTC, Frank Li wrote:
> > Add compatible string "fsl,imx8qxp-dma-apbh". It requires power-domains
> > compared with "fsl,imx28-dma-apbh".
> >=20
> > Allow 'power-domains' property because i.MX8DXL i.MX8QM and i.MX8QXP ne=
ed
> > it.
> >=20
> > Keep the same restriction about 'power-domains' for other compatible
> > strings.
> >=20
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org> =20
>=20
> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git =
nand/next, thanks.

I just realize now I picked this up whereas it was not intended to be
merged through mtd. I'm fine keeping this patch for the next merge
window if I get your explicit agreement otherwise I'll drop it.

Thanks,
Miqu=C3=A8l
