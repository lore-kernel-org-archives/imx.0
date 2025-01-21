Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19E51714A5
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 08:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737448441; cv=none; b=PDz09cBHM6qjeOPF2popLlHOr3tj7ZCnc/n/UwKprwPFlFgB+cykNGtZh9O4HgJJSemGb74kwwWTLInd1ou46JO8tgnBb1cH9hl7fS+GIMKmqxBfU1TeXEQEky0S87dLu2ciQW4ifob5IzxEopwLJ+GW+ixCBr5hCOEitgfqegU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737448441; c=relaxed/simple;
	bh=m4xY+GOunc6/Fd/gNMWb11PBPR5fmGlJX+qZmuXRxus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nHFOPR1ouiOpRmX9LJpa5uPPVIS9PofCU/mGPYgScGdPz8Nqa4fmML3I2oNLG+Hcm+aZXGb3XfHFFHt3GDMYMPTRGaovfwx7Y6vrynqwQ4KsZjfcso3kfER3eI7zIvDctJK5X4z4Sfsb+l4X9cgE5nrhSQt9UvIkG3sv0IpaOGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=DJuUsM2E; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=aU7V3VRo reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="DJuUsM2E";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="aU7V3VRo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737448437; x=1768984437;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G3cZpanloXDoxojzdV0aPxpUOLF0Hgk325gXplQ0T+4=;
  b=DJuUsM2E1eR+oLfNjmuYagG680qnUrFi8Z3ASaqaw2hozeOY6ZgOstjJ
   8BTPv4dHg45yfjXsFq10nc289Vaw9XbVQFfnyhd42R7fpozSuP6KjUtoF
   G1zSovIESAp5YB14nc7/Y2sS04mMN5naE+zkNVBs63ICk6K2hwLlbFtJs
   3vnqkodyApqjc1C/7eM8GspMWz06UlsHFdb5r3Z5VjYon4W1wHlauabNg
   DRbapPC56ng0i3IOG4RSRc7Hzy0hH1oK2CWX3SES66gnrbSZbrwqaIF/R
   s1OXywYqK5jTXOsTjCUm/B3BX0gF7O1DWuNg2Lb/hJjsh5Yj+L9qTlEQK
   Q==;
X-CSE-ConnectionGUID: s/QLek6PRviSvmsKMu36TQ==
X-CSE-MsgGUID: EHoxZmIuRCmQsXlrTAccbg==
X-IronPort-AV: E=Sophos;i="6.13,221,1732575600"; 
   d="scan'208";a="41192121"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 21 Jan 2025 09:33:54 +0100
X-CheckPoint: {678F5BF2-1E-1D00F64B-E6C57517}
X-MAIL-CPID: A7FA745264EE711FC457078F7BB5A89D_3
X-Control-Analysis: str=0001.0A682F26.678F5BF2.0094,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 380FE16EFEF;
	Tue, 21 Jan 2025 09:33:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737448429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3cZpanloXDoxojzdV0aPxpUOLF0Hgk325gXplQ0T+4=;
	b=aU7V3VRoXu++6axJN01wKbFTFjkA09sWNjrSn/i+m3zkFV/sZljTaAVSd/F4pUEr/xW64k
	dXcnYC62T8aTYZDAp8QQDzApbrvjHnkGjWhXrp+7FeuFB9oa3OHBhBQ3gv0r5Tfo87qj1f
	TIw/Ogg7wpphWkds+hWQkuKCD6Dh1wj8SErWQvMq3T9tAphDU8HKl/H2LJ8U84XRcOev57
	PDUp1aEeoTIu2v+E3rQUv32cRPQt044W6TDjFTuBRt3XdL3wCXWwiSrzM4LqPFaOVUJu28
	Kay1Qz7J8Pklfl/EK2ehjmRi87EdiBAqBQx4RoxeERQK0MGj/TIIvSvq+4RqzA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, catalin.marinas@arm.com, will@kernel.org, kernel@pengutronix.de, festevam@gmail.com, Joy Zou <joy.zou@nxp.com>
Cc: joao.goncalves@toradex.com, marex@denx.de, hvilleneuve@dimonoff.com, hiago.franco@toradex.com, peng.fan@nxp.com, frieder.schrempf@kontron.de, m.othacehe@gmail.com, mwalle@kernel.org, Max.Merchel@ew.tq-group.com, quic_bjorande@quicinc.com, geert+renesas@glider.be, dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org, arnd@arndb.de, nfraprado@collabora.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, ping.bai@nxp.com, ye.li@nxp.com, aisheng.dong@nxp.com, frank.li@nxp.com, carlos.song@nxp.com
Subject: Re: [PATCH v4 2/5] arm64: dts: freescale: Add i.MX91 dtsi support
Date: Tue, 21 Jan 2025 09:33:44 +0100
Message-ID: <1945264.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250121074017.2819285-3-joy.zou@nxp.com>
References: <20250121074017.2819285-1-joy.zou@nxp.com> <20250121074017.2819285-3-joy.zou@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Dienstag, 21. Januar 2025, 08:40:14 CET schrieb Joy Zou:
> From: Pengfei Li <pengfei.li_1@nxp.com>
>=20
> The i.MX 91 family features an Arm Cortex-A55 running at up to
> 1.4GHz, support for modern LPDDR4 memory to enable platform longevity,
> along with a rich set of peripherals targeting medical, industrial
> and consumer IoT market segments.
>=20
> The design of the i.MX91 platform is very similar to i.MX93.
> The mainly difference between i.MX91 and i.MX93 is as follows:
> - i.MX91 removed some clocks and modified the names of some clocks.
> - i.MX91 only has one A core
> - i.MX91 has different pinmux
>=20
> Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx91-pinfunc.h | 770 ++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx91.dtsi      |  70 ++
>  2 files changed, 840 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-pinfunc.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91.dtsi
>=20
> [snip]
> diff --git a/arch/arm64/boot/dts/freescale/imx91.dtsi b/arch/arm64/boot/d=
ts/freescale/imx91.dtsi
> new file mode 100644
> index 000000000000..67a5a487ab57
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx91.dtsi
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +#include "imx91-pinfunc.h"
> +#include "imx93.dtsi"
> +
> +/delete-node/ &A55_1;
> +/delete-node/ &cm33;
> +/delete-node/ &mlmix;
> +/delete-node/ &mu1;
> +/delete-node/ &mu2;
> +
> +&clk {
> +	compatible =3D "fsl,imx91-ccm";
> +};
> +
> +&eqos {
> +	clocks =3D <&clk IMX91_CLK_ENET1_QOS_TSN_GATE>,
> +		 <&clk IMX91_CLK_ENET1_QOS_TSN_GATE>,
> +		 <&clk IMX91_CLK_ENET_TIMER>,
> +		 <&clk IMX91_CLK_ENET1_QOS_TSN>,
> +		 <&clk IMX91_CLK_ENET1_QOS_TSN_GATE>;
> +	assigned-clocks =3D <&clk IMX91_CLK_ENET_TIMER>,
> +			  <&clk IMX91_CLK_ENET1_QOS_TSN>;
> +	assigned-clock-parents =3D <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
> +				 <&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>;
> +};
> +
> +&fec {
> +	clocks =3D <&clk IMX91_CLK_ENET2_REGULAR_GATE>,
> +		 <&clk IMX91_CLK_ENET2_REGULAR_GATE>,
> +		 <&clk IMX91_CLK_ENET_TIMER>,
> +		 <&clk IMX91_CLK_ENET2_REGULAR>,
> +		 <&clk IMX93_CLK_DUMMY>;
> +	assigned-clocks =3D <&clk IMX91_CLK_ENET_TIMER>,
> +			  <&clk IMX91_CLK_ENET2_REGULAR>;
> +	assigned-clock-parents =3D <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
> +				 <&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>;
> +	assigned-clock-rates =3D <100000000>, <250000000>;
> +};
> +
> +&i3c1 {
> +	clocks =3D <&clk IMX93_CLK_BUS_AON>,
> +		 <&clk IMX93_CLK_I3C1_GATE>,
> +		 <&clk IMX93_CLK_DUMMY>;
> +};
> +
> +&i3c2 {
> +	clocks =3D <&clk IMX93_CLK_BUS_WAKEUP>,
> +		 <&clk IMX93_CLK_I3C2_GATE>,
> +		 <&clk IMX93_CLK_DUMMY>;
> +};
> +
> +&iomuxc {
> +	compatible =3D "fsl,imx91-iomuxc";
> +};
> +
> +&tmu {
> +	status =3D "disabled";
> +};
> +
> +&ddr_pmu {
> +	compatible =3D "fsl,imx91-ddr-pmu", "fsl,imx93-ddr-pmu";
> +};
> +
> +&map0 {
> +	cooling-device =3D <&A55_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +};
>=20

Somehow I don't like it that much. Instead of removing nodes from imx93.dtsi
wouldn't it make more sense to include from imx91.dtsi into imx93.dtsi
and _add_ nodes with are unique to i.MX93? Otherwise each add to imx93.dtsi
requires an remove in imx91.dtsi for this unique to i.MX93, e.g. NPU.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


