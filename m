Received: from mx-relay112-hz1.antispameurope.com (mx-relay112-hz1.antispameurope.com [94.100.132.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93512231A30
	for <imx@lists.linux.dev>; Thu,  4 Dec 2025 07:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764834307; cv=pass; b=dcfGIHsLteE+oNCYQojYQVlFU6bwrqreSpy65hD8TeK5KLTKGBK1eL79ZVqr92VQGCcQ4NYc5PO7lA+NnMRJhD0BOTEDj1OxFc2sNK8fxKQ7CVdhiIujPQIl//TC+5wNzJX8miirBAHqCuw/yOMVjxnYesNR9YEe/oqTqSMwJ78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764834307; c=relaxed/simple;
	bh=eej6b0TfxmlBYfjPDhc+XoRDZI1GX55SmDZpmTtfsF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NQNJrOT6kkan5bCwHTeubqsIVewBnc6bcbChQ04rlwL2apUPGsvAXGApi2F/hfkHh5NAhL7rg/RsZExwRw6jtuZA65F5sNq7fY9EiQIaikqnU4FjrSEEU9PLRsNj3XiMNnL4RhjNwYKzjgUP0uxmC2ynGyFUo+PYfijgBxcctIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=CILRlt2z; arc=pass smtp.client-ip=94.100.132.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="CILRlt2z"
ARC-Authentication-Results: i=1; mx-gate112-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=nRKpe5m4uI+URjqo+MF4NUpskf9/M3efMzxetxiqdyo=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1764834264;
 b=B+BYu85Z+zKsae/3+8jhJguMpqfji4zQEk91XyGcm9k3/hsFZi5grQg/MtnMcnoZ6kJPF0sD
 MeJ/m9RlVBiMc3N+IQQBR3DMBYR2ypCz/OUffjMfMxGv3TMCf8x3I/Gh/e1Ddw0lFU83Ln3VP9U
 e4+jvQlYfesShHmmAo5VjKjIJc0wUxeSqIEP4JvLgg959j7EnzZo7CMnqqxVIfN5TaB5Nj98sBv
 5XyOMLPvxBaShCAPYmnjXato6gCChOzVDk1+bKtIB0J9jB7QcZogTSF6EAleQ5WUYttX/HG65Q3
 Uhfna3YOMWUvaNjBlzU8qFqBQkHV60CyPAScgCV2Oah9g==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1764834264;
 b=hb5y+5HtDlkZ63wDhhQsOADXod5N4dqpFTzCi08iiHfsdDY1h0wZwUn1N7AjimWxppg/jPL8
 QgZ7/MZ6w00fmxZEzDU2EC+Qgp0pIaXDzxIPM7mLh7kQY2Jge5tBFQo1KH2IiSdBj7JuxGXU1As
 5pjWJwoXBXresunVLvsW3Fx+Hxhg7aUIlQ43O/YZza9oeU4u+dZR4cfPdjg5lglcWGWYTnCjRKL
 a867FaAkCtFw6Oh4tm7U1wFPkXemJ0g1HGEOmksUbGTBDh9hdIcKTcFDg1e0NpTimFeVQ7Mhh2Y
 7Gn1OfDfNLIMojW7YMFN3RJdmn4FDCymTiY0iBDo/dGbA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay112-hz1.antispameurope.com;
 Thu, 04 Dec 2025 08:44:24 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id ABE6CA4134F;
	Thu,  4 Dec 2025 08:44:13 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 frank.li@nxp.com, Sherry Sun <sherry.sun@nxp.com>
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH V2] arm64: dts: imx8qm-ss-dma: correct the dma channels of lpuart
Date: Thu, 04 Dec 2025 08:44:12 +0100
Message-ID: <3023939.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251203015956.116364-1-sherry.sun@nxp.com>
References: <20251203015956.116364-1-sherry.sun@nxp.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay112-hz1.antispameurope.com with 4dMRNG3FgKzwTWn
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:073b527d389ddc73e181e67b15c075cb
X-cloud-security:scantime:2.175
DKIM-Signature: a=rsa-sha256;
 bh=nRKpe5m4uI+URjqo+MF4NUpskf9/M3efMzxetxiqdyo=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1764834264; v=1;
 b=CILRlt2zIFnvpJzBEIp4zrCzSQUvNlBM4zYJfSXCKv5nvmFfQEFJRXQHtwfvMXf+jTJWkKsU
 eQtG3qZ/8FWPfJom/F2ThXPwkyHTiDtVZMhCxNqVxfN9iQAJ5wz+2CorWRvg3wCRMK6bhKzAXwn
 D8bSZQ0wMwAS4ZfSkJya64WJcycAK+s6p04gJIclpUXbJoj7vupVw6+dYAt4pX3Ms8sJqdMZDOC
 Nbu/7NIc9i1J9aTmR3gsx2jtuvRM6UrHSb4qGVzO6PycDX3wl4jFDoiPArhN4xLRfQN91327oEu
 CMn21HcfiDF1tqKJxWVpwCZiwLa2NS2c060VaHEgY3b1w==

Hi,

Am Mittwoch, 3. Dezember 2025, 02:59:56 CET schrieb Sherry Sun:
> The commit 616effc0272b5 ("arm64: dts: imx8: Fix lpuart DMA channel
> order") swap uart rx and tx channel at common imx8-ss-dma.dtsi. But miss
> update imx8qm-ss-dma.dtsi.
>=20
> The commit 5a8e9b022e569 ("arm64: dts: imx8qm-ss-dma: Pass lpuart
> dma-names") just simple add dma-names as binding doc requirement.
>=20
> Correct lpuart0 - lpuart3 dma rx and tx channels, and use defines for
> the FSL_EDMA_RX flag.
>=20
> Fixes: 5a8e9b022e56 ("arm64: dts: imx8qm-ss-dma: Pass lpuart dma-names")
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
> Changes in V2:
> 1. Correct the fixes commit as Frank and Alexander suggested.
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi b/arch/arm6=
4/boot/dts/freescale/imx8qm-ss-dma.dtsi
> index 5f24850bf322..974e193f8dcb 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
> @@ -172,25 +172,25 @@ &flexcan3 {
> =20
>  &lpuart0 {
>  	compatible =3D "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> -	dmas =3D <&edma2 13 0 0>, <&edma2 12 0 1>;
> +	dmas =3D <&edma2 12 0 FSL_EDMA_RX>, <&edma2 13 0 0>;
>  	dma-names =3D "rx","tx";
>  };
> =20
>  &lpuart1 {
>  	compatible =3D "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> -	dmas =3D <&edma2 15 0 0>, <&edma2 14 0 1>;
> +	dmas =3D <&edma2 14 0 FSL_EDMA_RX>, <&edma2 15 0 0>;
>  	dma-names =3D "rx","tx";
>  };
> =20
>  &lpuart2 {
>  	compatible =3D "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> -	dmas =3D <&edma2 17 0 0>, <&edma2 16 0 1>;
> +	dmas =3D <&edma2 16 0 FSL_EDMA_RX>, <&edma2 17 0 0>;
>  	dma-names =3D "rx","tx";
>  };
> =20
>  &lpuart3 {
>  	compatible =3D "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> -	dmas =3D <&edma2 19 0 0>, <&edma2 18 0 1>;
> +	dmas =3D <&edma2 18 0 FSL_EDMA_RX>, <&edma2 19 0 0>;
>  	dma-names =3D "rx","tx";
>  };
> =20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


