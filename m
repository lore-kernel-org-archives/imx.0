Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9E27E574
	for <imx@lists.linux.dev>; Thu, 11 Jul 2024 06:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720678180; cv=none; b=DgxtwudTSABHJ7AeTGi122r1wexItkP/lqUNeWzqw30CdA6YTfK/BGgsRNAONQbLvnzqrKSoB1F2ezYfkpNdN7wvEuDGZ+AcBklxpNwMfMAmUXmd5SSsPiETjU33hQv43RPlMNwMR0qCFjGK8kJzLKcsldYCVFGgijUPYY/Zl0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720678180; c=relaxed/simple;
	bh=YK7qo+j6dz8DWBjTBrJAblqKHbFSJWKDHbc+DZwirTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AhFh49Xw03McbHnxyEseQmeBX6lofjZk6mQe6Ae5YTuRaeBzpywpUoyZ0PjbkgIOVwCfmob7P0M9G+RWBslKElvD6ksi3Z8hPMb+ft0eJoDa2Z8VkzxOqqtBka50SvlY8fTt3ZudkPM7lIsT7fvbvG3Cj4UfTflu3JB9/BABQ6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=DtqX4Bs+; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=c8WToPMm reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="DtqX4Bs+";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="c8WToPMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1720678176; x=1752214176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QBuVxZ+CIJsoZMfw6oza9mwGhGFZwvp47x+oLEaEdKc=;
  b=DtqX4Bs+KSdEYIy+zwS7MbW/tDGK2lFlVvlVfm0VOnBlHCIMunR9tbz6
   I62E6mahbkLF5iXlyGvaBxDk39lLiYN0IS+oKg2quZrQCmFKkGt9fo3VM
   sBOiW5cpUAvvC9Gw1QBAYS3Uyj18TMed2/qXjUgYNFz1PE4PyjEyB2zY2
   H+LpHHs3sypZQvdGbHJq0K12AwNHob4KP6v87sCXI8Zx7mis+gixxCPI6
   PEc7oJwv8IFMQ8BO/XezfRIHpqRdDDWwFlmtEuqbqtuqJfGcM1PsMdKyG
   g7xY4i4jhRO0UlJyMYvvVn32eECi91+zgszOuKR266ZryklIWO+8LlBNW
   A==;
X-CSE-ConnectionGUID: bmQ2cirAQcyRfo7zcOnwsQ==
X-CSE-MsgGUID: 57mzsil6TD67+thyncuGNA==
X-IronPort-AV: E=Sophos;i="6.09,199,1716242400"; 
   d="scan'208";a="37851191"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 11 Jul 2024 08:09:34 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC37C16337A;
	Thu, 11 Jul 2024 08:09:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1720678170;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QBuVxZ+CIJsoZMfw6oza9mwGhGFZwvp47x+oLEaEdKc=;
	b=c8WToPMmOGAkAnSNMB6k7awwrlBlkzONkd5ic6VhVslNJNmDekAUYTuPICzYD6csqMii1A
	wKRqMeZQJMdfPccs2RN5xcvTQLQTffM5EO3iHLe/QZ5Xwca32hUNoGWExcS+akyrkgpLjm
	iY09iuodtYgLKgxxcEccSnML068PDz2pgEocBIjB4MBU3JVT0jn2TwKGiOWUSRK/KwphBo
	Gg3ws1VQGPC/BzKtTt4xet1ihUI5F4njbir04/ZdzSPjPbAsiIRVO6q+Mrb0jk5KZMe9OO
	syZ7DJ7aO1ZJn5vIFHYuOgqUMMJuhW1EtAGEvRx786xCXsaGtKmWLYakGh8npA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, Shenwei Wang <shenwei.wang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx93: update default value for snps,clk-csr
Date: Thu, 11 Jul 2024 08:09:33 +0200
Message-ID: <2280257.iZASKD2KPV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240710200833.153521-1-shenwei.wang@nxp.com>
References: <20240710200833.153521-1-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Mittwoch, 10. Juli 2024, 22:08:33 CEST schrieb Shenwei Wang:
> For the i.MX93 SoC, the clock rate for the IP of STMMAC EQOS is 315 MHz.

Are you talking about enet_qos (IMX93_CLK_ENET_QOS_GATE)?
Downstream 6.1 kernel shows:
 sys_pll_pfd2                         1        1        0   625000000      =
    0     0  50000         Y
    wakeup_axi_root                   4        4        0   312500000      =
    0     0  50000         Y
       enet_qos                       5        5        0   312500000      =
    0     0  50000         Y

Also RM gives a maximum of 312.5 MHz.

> According to the following mapping table from the i.MX93 reference manual,
> this clock rate corresponds to a CSR value of 6.
>=20
>  0100: CSR clock =3D 150-250 MHz; MDC clock =3D CSR clock/102
>  0101: CSR clock =3D 250-300 MHz; MDC clock =3D CSR clock/124
>  0110: CSR clock =3D 300-500 MHz; MDC clock =3D CSR clock/204
>  0111: CSR clock =3D 500-800 MHz; MDC clock =3D CSR clock/324

As the old value is 0 you should at least add that entry as well.

But AFAICS enet_qos is passed as clock 'mem' to this device.
So instead of hard-coding this into DT, this divider should be calculated f=
rom actual
enet_qos clock.

Best regards,
Alexander

> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx93.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/d=
ts/freescale/imx93.dtsi
> index 4a3f42355cb8..a0993022c102 100644
> --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> @@ -1105,7 +1105,7 @@ eqos: ethernet@428a0000 {
>  							 <&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>;
>  				assigned-clock-rates =3D <100000000>, <250000000>;
>  				intf_mode =3D <&wakeupmix_gpr 0x28>;
> -				snps,clk-csr =3D <0>;
> +				snps,clk-csr =3D <6>;
>  				nvmem-cells =3D <&eth_mac2>;
>  				nvmem-cell-names =3D "mac-address";
>  				status =3D "disabled";
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


