Received: from mx-relay91-hz1.antispameurope.com (mx-relay91-hz1.antispameurope.com [94.100.132.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF2033E344
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 10:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448247; cv=pass; b=Pn3qgA+f98z9fMwgWKoqyoF3yPX/LXChvWcUcGKCVAoREJTfd/GMTmdsl386OGhEhoWYibBUX7j2I/deGT79+diRfLGBgvlLYk7y+7NNTOSyBspsBHpAaeXljUeQ4UVZn1aKC896wbWEQWaZlm6EMHrnsMFh24aaG4OvTw6r+xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448247; c=relaxed/simple;
	bh=Zhg3wd9xAGHuRd/US5knN/LK3wxevhznuToaUN92Usc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g7DqHGRzpA5Z8i/zd8SNoeEKDCSVWH6PpvIFkTvglsrMZQ2HS2t/vRP9Qi/+RFQculUh8Xm/VPXGCxHApqJbrsmAddg+PD3z2/2KWdcgdpPAchf/RvQyCxF3KGHrQZe7ETOO6EGGYoER/qpy+lgLpuavs1d7Vdww/2XMDxJk3BI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=jmTOwuyW; arc=pass smtp.client-ip=94.100.132.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jmTOwuyW"
ARC-Authentication-Results: i=1; mx-gate91-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=9o7xK2KLyVLPeKdnPq73iKRcvJgeK10gXor6T1iRFhg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772448179;
 b=nHyLklHzD5jb18gjt5767K0zpbFu2sCSJi/cpt64V936ANK5w2/VFLjoNVxRJg8TwBoFbe16
 JxRrM0B9xvXm2eKxPm4ojceLm9oJJ0FEN3uHpVwOUYttgW9WBH0lPRnFt075IYL56JeBdkoRQlv
 3BIgi+q2RKWSkYlGVuXuNFxk61LxkfpCRb4gbKdD6l2hM8DMHLegLkVJBA+Khg1PzpVO8BxAowQ
 98MGCocUMr+zFb9wETf9t78hdWSXnzY/dNDN4JpyL3k3XgKksTpDfozvjKph2/3uW5BtwujOk8v
 5pgecBzkq4+37W+ohAn3x2YCFjfDobwlpp2A1zA3uYo4g==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772448179;
 b=Uuwlpbw966aHn5dcv3fKhgLHjPPDavHecnTCvdz9tVBvFQYuaPtJ4CqlVEkcB63VA6jml4FF
 pddZWu7BDyArUgD0+bPAGIv0INjiv8QNR4x+Uffs6YErHJsgfwZ3PB3jcCYaA3wulYCwsNVu3UG
 aF91szHTcHEay4XBznKGsX5BXzMkYr3LH3uwauvHlQHdbHGJY7IZyuU+JTorht3N63B2fQUXKUT
 IXY0Vjz+c7skiNKnW0by5eXcW1GqQY+xNr8Ql/q8wPcK4k2PUHc0Ng4Yz5JkJ0QwgULZubu9mim
 fVeYsBCLd4gPPq8xWYDl+UL3p2xBf3ARL4ot8WJMLuzpA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay91-hz1.antispameurope.com;
 Mon, 02 Mar 2026 11:42:59 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D99EACC0CCA;
	Mon,  2 Mar 2026 11:42:49 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux@ew.tq-group.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject:
 Re: [PATCH v2] arm64: dts: freescale: imx8mp-tqma8mpql-mba8mp-ras314: fix
 UART1 RTS/CTS muxing
Date: Mon, 02 Mar 2026 11:42:49 +0100
Message-ID: <5083150.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260302084548.6471-1-nora.schiffer@ew.tq-group.com>
References: <20260302084548.6471-1-nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay91-hz1.antispameurope.com with 4fPb9l44JYzMpHt
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security:scantime:1.592
DKIM-Signature: a=rsa-sha256;
 bh=9o7xK2KLyVLPeKdnPq73iKRcvJgeK10gXor6T1iRFhg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772448179; v=1;
 b=jmTOwuyWt8NHGn9WzpYsv0gjsg+Ug4qZwxlwJh3Z5Xr58wtaQ3BRZoouGwRZ1HB8pXvhgnFF
 w4MPEwXbw+xTH6Vh65gXbgJdJMvc4zaSde3cLs9mhc/8guky7MpF7vsOHBtuag0nf8veGLbD4Du
 ekyhtJx7t4RteEPCS3S1hSnFZkprsn9DUk0KaG/mr75r9JJmpjdD3zASIVKZO3urydti3EDylDI
 e0z0Mg4AI9R7x7r8c6N5gUSUyvQ4qN2KdcCqAFTbP0cYRl8vRe8xwFqBIvcEimwVhkqDsv9Gvi0
 yRdFizddiKXY7MzHHrqF6eaC72yo0mCWOk9yDNSoJQatA==

Am Montag, 2. M=E4rz 2026, 09:45:48 CET schrieb Nora Schiffer:
> UART1 operates in DCE mode, but the RTS/CTS pins were incorrectly
> configured using the DTE pinmux setting.
>=20
> Correct the pinmux to match DCE mode. Switching the RTS and CTS signals
> is fine for this board, as UART1 is routed to a pin header. Existing
> functionality is unaffected, as RTS/CTS could never have worked with
> the incorrect pinmux.
>=20
> Fixes: ddabb3ce3f90 ("arm64: dts: freescale: add TQMa8MPQL on MBa8MP-RAS3=
14")
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>=20
> v2: updated commit message based on suggestion by Frank Li
>=20
>=20
>  .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314=
=2Edts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
> index b7f69c92b7748..1665a5030b993 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
> @@ -848,8 +848,8 @@ pinctrl_tlv320aic3x04: tlv320aic3x04grp {
>  	pinctrl_uart1: uart1grp {
>  		fsl,pins =3D <MX8MP_IOMUXC_SAI2_RXFS__UART1_DCE_TX	0x14>,
>  			   <MX8MP_IOMUXC_SAI2_RXC__UART1_DCE_RX		0x14>,
> -			   <MX8MP_IOMUXC_SAI2_RXD0__UART1_DTE_CTS	0x14>,
> -			   <MX8MP_IOMUXC_SAI2_TXFS__UART1_DTE_RTS	0x14>;
> +			   <MX8MP_IOMUXC_SAI2_RXD0__UART1_DCE_RTS	0x14>,
> +			   <MX8MP_IOMUXC_SAI2_TXFS__UART1_DCE_CTS	0x14>;
>  	};
> =20
>  	pinctrl_uart1_gpio: uart1gpiogrp {
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


