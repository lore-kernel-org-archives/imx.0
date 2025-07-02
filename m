Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4585A223714
	for <imx@lists.linux.dev>; Wed,  2 Jul 2025 05:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433358; cv=none; b=maIudyrWo02akUUSKbfTfXQ3CMK0k2EidADPNpCBGjXQndtQskXa0zkRxrZwt71SenwBhvjEMJSZtZZLKyxl6wQzSAzAQTfEQOQzfcs8sDWR9/TvMR4uH320NizAi9TdsoDTMtP56eJVCcUdAOTRt7V2Go4v57kjPEhMDHyM1ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433358; c=relaxed/simple;
	bh=609em8duwn1TuR7A8MeBu753B5OAPg1aWBaZfiCHuf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TccUzcjwpvgkm+Rgoy+TVI/slRI5SaLK03+kWPMIW1ou3rTtOtcjYK1urmT3/bxVgPw2ISK5VmVlfVJ6GAhNIMgtKtWxpNm4tIonAJRgMhNxHsoR9R/6T6JdjmlrhMj3WuayDtjiVcktWKOf9NDVQsKjFEFmga8JB0lJupDnbg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=q0o57CnN; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=cF618pGX reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="q0o57CnN";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="cF618pGX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751433353; x=1782969353;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yEbAI3opm4LnixMNPD4CJAcS1fuxSWr4Pdo00xuzpFY=;
  b=q0o57CnNMqWTMU1Ogvuy2YNRdHfJ06zT2+Ctj2H4PfLpqP4Qexo0LxSq
   ETTBgMfXmia3pI0iKQrCBkTsgf02W3P+cHRYm47RRexLoyDaFj4gafAX5
   DLM5A8RB07phd6ZQXW1r+jz9R8uYsQ7Ivc4yqMdUMViIwLmLd1CsKrLaH
   Fo3wSmnARdo90D1z/UjazPa3Zb5L/td22hJs+30E+E5fQCz25arWdsxJx
   K23zQjcxceZ2B2HNKHZZD2FOyaUiePFiG/gI3MMuDLKZXf0gNLU8MV60j
   wX/+2A/d5UXw+Ms/zFWrcaoTq8CkaBQw21d7kpVQpxXI6wRg+d4MNooqO
   Q==;
X-CSE-ConnectionGUID: eIs4CnGHQlWPEHsu6qr5AA==
X-CSE-MsgGUID: ERVeFJYmQfG8spIkNsSiLA==
X-IronPort-AV: E=Sophos;i="6.16,281,1744063200"; 
   d="scan'208";a="44969913"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 02 Jul 2025 07:15:50 +0200
X-CheckPoint: {6864C085-39-B6FA1C9B-ED1A9D03}
X-MAIL-CPID: 7C0C64754A18A0C5244284046CA090FF_2
X-Control-Analysis: str=0001.0A006371.6864C09E.0036,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B95DA1609FC;
	Wed,  2 Jul 2025 07:15:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751433345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yEbAI3opm4LnixMNPD4CJAcS1fuxSWr4Pdo00xuzpFY=;
	b=cF618pGXKLBuYLWJzcG6yKxN6HvPJZ3OnzuLEmANIX9+PK+VYRbMI4jhxz1Vp9MpJjcL4q
	DP/tq6zlyoJctpFzYH6DACLXA9gX9E4ETE1oCbnLP+OdSd0ldDYS7s5U91NVaRVj8YmGhD
	mi0e/RFIx3A+oxWRWYME+JgWfucWZeAmbB3vgaJTZwofsXB6zLTxPbYoWiMdk4LLFPN6Rv
	BimCqaXrReERUtViTT11VULX6JSEgaScb7ZQnJ2+QgOQtVwTVrv4uI3VVOiPNEak+PfBtO
	xwmC5iDg3mkguCVlmoDwq96bJgvsvhTiIScf1lrG5gGikyChpuTjvkDGXsvlhg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 3/7] pmdomain: imx93-blk-ctrl: populate child devices
Date: Wed, 02 Jul 2025 07:15:41 +0200
Message-ID: <2232630.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250701-95_cam-v1-3-c5172bab387b@nxp.com>
References:
 <20250701-95_cam-v1-0-c5172bab387b@nxp.com>
 <20250701-95_cam-v1-3-c5172bab387b@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

thanks for the patch.

Am Mittwoch, 2. Juli 2025, 00:06:08 CEST schrieb Frank Li:
> imx93-blk-ctrl is miscellaneous devices, which include reset, clock, MIPI
> CSI2 PHY and DSI's miscellaneous logic. Call of_platform_populate() to
> probe child nodes.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pmdomain/imx/imx93-blk-ctrl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx=
/imx93-blk-ctrl.c
> index 0e2ba8ec55d75..ba2dd8bd143d1 100644
> --- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
> @@ -7,6 +7,7 @@
>  #include <linux/device.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> @@ -297,7 +298,7 @@ static int imx93_blk_ctrl_probe(struct platform_devic=
e *pdev)
> =20
>  	dev_set_drvdata(dev, bc);
> =20
> -	return 0;
> +	return of_platform_populate(dev->of_node, NULL, NULL, dev);

Please use devm_ same as in [1], which you Sob'ed as well.

[1] https://lore.kernel.org/all/20250304154929.1785200-4-alexander.stein@ew=
=2Etq-group.com/

> =20
>  cleanup_pds:
>  	for (i--; i >=3D 0; i--)
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


