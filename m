Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D2423C4F1
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 07:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756367929; cv=none; b=utLzom+58NndMrgvEVkFFhW6G8DZAkkEGr7SxcEBwh/D2HbuRumHShUkmnmp8aDO03yUz4pgGn902ChgbYjNHeUY461TK6EFTG4vYBTMBvRikwQGrKVCjCMegTwA4ogyQ/7abLJEsc3uDPgwEIJOLLU39AtDhrUUuZTkE0LS1N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756367929; c=relaxed/simple;
	bh=gaSpXv0ICwsK/7v7Tncv+J8aK2en0MPZUcPtGMmZDLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IT/zTmCDbcfZlEfKALNVVOGPRSS17M33Bf5CUq4MX3vyiGK+abqe/zTieFKALr+VSoA0+1iLhLlkMcOQX/ridhVU/5AJ649Yoz2mX003vbFFRhiRUMn1GVggl/LolEqN+WKH/7UBSdnSDDXC3CC5+hXHcm98kpJI7i96kTOfYTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=dOj30T06; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=CAnb7nIE reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="dOj30T06";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="CAnb7nIE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756367926; x=1787903926;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nz66e75Mw/joctaT7IK/sW+8Q9QeMNVlbhhEkyRonII=;
  b=dOj30T067k2lv2efBej0rNo5jxmfqI18Z1LBRHIjawGlW4dhbR18sJmL
   NXFRGpp4PZuxGMnt0+J6l8DliK3Clq0TSPmKaMl0WEnqQK3Lr+DYjDb8F
   C8ImUXQmw+y7if2vK0TiknQ2zLeKHposQrzv0Jzvd5xNFVicutonQxbkN
   9VXFls/a0G26nKdK+PMbzeU6nNn3ukysjZW+hM7GYud24Pi6khPAWPWDO
   oXcLW+F7rEcOPEyEffelHLsiTS6LZ+vBTWVuTQKGVApxK8rhLjfXAF7sI
   QJzB5Yk7TsbEvTq6vOXHBjg2u8i0/cGvvI9mdZhSbHuR1h4Ev6raq7viy
   Q==;
X-CSE-ConnectionGUID: m84Vz8+GRPe/MrLV5ldJOA==
X-CSE-MsgGUID: JvIyF86oT1OFgkVW/kgS2w==
X-IronPort-AV: E=Sophos;i="6.18,217,1751234400"; 
   d="scan'208";a="45949539"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Aug 2025 09:58:44 +0200
X-CheckPoint: {68B00C34-24-299FBAB0-EF52EDE7}
X-MAIL-CPID: 284D0053C170DCD727D862DA4D118536_5
X-Control-Analysis: str=0001.0A002121.68B00BC8.007F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E67321612FF;
	Thu, 28 Aug 2025 09:58:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756367920;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nz66e75Mw/joctaT7IK/sW+8Q9QeMNVlbhhEkyRonII=;
	b=CAnb7nIEGTqAegv5WMD3yN1b6wd/oPzGGLaKxLhMcLOxzsBQayUmACfoRTfXzbIPh794MQ
	7xQGApYa0RHNPGoTQ+rSREEbMOse3K2oC37eRg/ESDaLDxCYxXhrY44sFjJwKHVp1Ubj+Q
	FRY40wvGre4dJxxF/4p3G2WD1P1vkfRkFIr+fCtMPKG+7yWiTBp+6bDUFDuyt8vqU7YTfF
	Z6BAfZ8qRTGLcKfYRhUbkJSk6+zCpBI6/iGmQKTKohhdIaUyH9VT7xjWoP6CjTk1FsP+xL
	8zFG/dPwuIteSmVAIjKUv1ovaxg++aibXUv1nUzGAlqGKBUrqECGVtSMOUmiJA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, richardcochran@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 frieder.schrempf@kontron.de, primoz.fiser@norik.com, othacehe@gnu.org,
 Markus.Niebel@ew.tq-group.com, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com, netdev@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Frank.Li@nxp.com,
 Joy Zou <joy.zou@nxp.com>
Subject: Re: [PATCH v9 6/6] net: stmmac: imx: add i.MX91 support
Date: Thu, 28 Aug 2025 09:58:36 +0200
Message-ID: <3304317.5fSG56mABF@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250825091223.1378137-7-joy.zou@nxp.com>
References:
 <20250825091223.1378137-1-joy.zou@nxp.com>
 <20250825091223.1378137-7-joy.zou@nxp.com>
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

Am Montag, 25. August 2025, 11:12:23 CEST schrieb Joy Zou:
> Add i.MX91 specific settings for EQoS.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
> Changes for v5:
> 1. add imx91 support.
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/ne=
t/ethernet/stmicro/stmmac/dwmac-imx.c
> index c2d9e89f0063..2c82f7bce32f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> @@ -301,6 +301,7 @@ imx_dwmac_parse_dt(struct imx_priv_data *dwmac, struc=
t device *dev)
>  	dwmac->clk_mem =3D NULL;
> =20
>  	if (of_machine_is_compatible("fsl,imx8dxl") ||
> +	    of_machine_is_compatible("fsl,imx91") ||
>  	    of_machine_is_compatible("fsl,imx93")) {
>  		dwmac->clk_mem =3D devm_clk_get(dev, "mem");
>  		if (IS_ERR(dwmac->clk_mem)) {
> @@ -310,6 +311,7 @@ imx_dwmac_parse_dt(struct imx_priv_data *dwmac, struc=
t device *dev)
>  	}
> =20
>  	if (of_machine_is_compatible("fsl,imx8mp") ||
> +	    of_machine_is_compatible("fsl,imx91") ||
>  	    of_machine_is_compatible("fsl,imx93")) {
>  		/* Binding doc describes the propety:
>  		 * is required by i.MX8MP, i.MX93.
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


