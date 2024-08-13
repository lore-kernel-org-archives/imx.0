Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9266813A87C
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 08:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723537333; cv=none; b=ALioSWkZnB0FzgQbeDhRWBLWpDqRHAaJ2w3lwJ6n+t9C/e1NIY5/Y7eUpjZAXQ0fxHnvU//hHrVjRFXuNNFB1s4ebNB9/uqNFAVo791P5/AUYj39Ip52CjmLhGhWigfPOsrWTr+EKNgU8IxgHAuiG8qFo9TAQFROKE+ejNNA3mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723537333; c=relaxed/simple;
	bh=cCgQJ5VurzR8dspentC1iWnLHP22PzEKzG1hr9PF1rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NgO4ybUjVhaeSsBT1ggJruuM4k+XyFc0ZIuIhdFnhmCuUW/4+4ql3H50zEXaUwsqJZMcnVIBCHlPoXTItx0mz3AinEUugXmpD2p5wJM4JVgX9dFkH4wMnq1JQRrETf0p6BHlpVDd3PnrBN7czyv5kcyVWP3c4ZgHkLCTQWixJVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=VBW/V1Ll; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=bXAwUTGz reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="VBW/V1Ll";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="bXAwUTGz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723537330; x=1755073330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6sVa4e0XjrPWm3dsRsHTnveaaOTgQj5773HutX6G3Xc=;
  b=VBW/V1Ll5dJE5KodQ7qFjkCc5Jj4EZmS5RHBcurQWdGWTozbbYsCrh6Y
   0RayZwPtgABzelxfrnriIfjEOQX7n4b9XeTdMXMa4OI7pddglWZ1HHYmg
   xeWrQbOc9dG9ooi5eL3CyLAiKSZ/tc5wSHNzltJKY0lJlTvXr2bPRkph+
   Pj6rHoSWXVSz9XXwOQB7YM6WaOB0jF2GIzozj/zGOUCcvEhSJjFCaSWXR
   Qv8sSjn/SUs+3EsGyq+4MD/DQEANDMCcB/ATlCr3ZoExjGCrRI1wq06tO
   SlG2j1i47RjkoCL119ZHt53ZafjfX4V7aj+ooLaoQu7UPWrq4V2j2A/be
   g==;
X-CSE-ConnectionGUID: lZyjjYCnSNyCZh2dVTydCw==
X-CSE-MsgGUID: NOoYBaDmQD+LhCgxegRAdw==
X-IronPort-AV: E=Sophos;i="6.09,285,1716242400"; 
   d="scan'208";a="38378432"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 13 Aug 2024 10:22:06 +0200
X-CheckPoint: {66BB17AE-23-45EF2B36-F6E28480}
X-MAIL-CPID: E31A6EAD5318B829280E3781CCBA55FF_0
X-Control-Analysis: str=0001.0A782F23.66BB17AE.0155,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3824516473E;
	Tue, 13 Aug 2024 10:22:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723537322;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6sVa4e0XjrPWm3dsRsHTnveaaOTgQj5773HutX6G3Xc=;
	b=bXAwUTGz5t0m5isiBX2+Dp5TCPTGUzxqRFb6uLSpl8Y+eS53KZBhIQCKnVJxheaa3FQYEz
	vw3+dFkIjRvikYut+q6fuV0cVQXzbUUWnIldlT/+WqbcirmCVSzm3QTPsZ33DLfFHlZ0Lb
	0DTktsWkAAmmfKC2OThpmH8HocM8jZnTPA7MXFoYDKK1GKiwWnXu+hVw1U95cejj9uplB4
	hoDVHt6kAJh//nQGvkljVJLz6B7/euIJYaQ/LqgI+m5+15tq8SL5IKlfnZiddlI1SNeBDN
	qI0PcUi/gjG77BiNiFYf3MpCrMAAId/XL6FIKIuhuLa4WKbDu9Sy9fzzvQz6Vw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Gregor Herburger <gregor.herburger@ew.tq-group.com>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux@ew.tq-group.com, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 02/17] arm64: dts: fsl-ls1043a: move "fsl, ls1043a-qdma" ahead "fsl, ls1021a-qdma"
Date: Tue, 13 Aug 2024 10:22:03 +0200
Message-ID: <1897655.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240813-imx_warning-v1-2-3494426aea09@nxp.com>
References: <20240813-imx_warning-v1-0-3494426aea09@nxp.com> <20240813-imx_warning-v1-2-3494426aea09@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Dienstag, 13. August 2024, 06:34:57 CEST schrieb Frank Li:
> Move fsl,ls1043a-qdma ahead fallback string fsl,ls1021a-qdma.
>=20
> Fix warning:
> dma-controller@8380000: compatible: 'oneOf' conditional failed, one must =
be fixed:
>         ['fsl,ls1021a-qdma', 'fsl,ls1043a-qdma'] is too long
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/=
boot/dts/freescale/fsl-ls1043a.dtsi
> index fc38a0e543ab8..c0e3e8fa1e794 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> @@ -955,7 +955,7 @@ pcie3: pcie@3600000 {
>  		};
> =20
>  		qdma: dma-controller@8380000 {
> -			compatible =3D "fsl,ls1021a-qdma", "fsl,ls1043a-qdma";
> +			compatible =3D "fsl,ls1043a-qdma", "fsl,ls1021a-qdma";
>  			reg =3D <0x0 0x8380000 0x0 0x1000>, /* Controller regs */
>  			      <0x0 0x8390000 0x0 0x10000>, /* Status regs */
>  			      <0x0 0x83a0000 0x0 0x40000>; /* Block regs */
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


