Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E858A634FE
	for <imx@lists.linux.dev>; Thu, 29 Feb 2024 10:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709201573; cv=none; b=N6AmmOpcpSDCfbLAlGJgQ5LV1RWo89RDgQIRkpXGBUNaiV8cIG8VswNnyKIUxaLlTdVGs7Ge7sOh0IfAaIuvoDXRriSQJ5i76iAQJ/L66WeGOj785Qdfn5GEzqdQWXvCgcSmb5zhLb1IFs2HpI1HxInLONAK4LbcbPvNnPTr/NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709201573; c=relaxed/simple;
	bh=3Y0napQcok6yYFzvKZKXvC27C5ldIaWsvbr5C99snto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k1BmShkNsEndf0NIYRnKawLOlS98u+vigM7PGrEqAlgUELyQprciw6nstKqyl9eSSE3+Gtl0DcmMqTKJErLaTEEldZ0auqf11/UP4Mj/hTi8wDtG9dGRfo4OtsHTSikOohP/nvJY2kY5AI30GXyp6OdxXcuhhdKCqjn/MxhcBZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Wz5LF/Ys; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Wz5LF/Ys"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1709201571; x=1740737571;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I0tG9nzHcCDklSXmw5EvPC2Z+AwV2Whi6F5Gzi5EvOI=;
  b=Wz5LF/YsUxpUl/M0+1S4MRMBvl2uTCVTBOVsNYcw2n2e0mfbeYU2puDL
   Mb4AyNo2mVmUqexqNf35QMaJykJTZ3Fm4SJDyb4OZJ2grilr1UJj1Led1
   A0ARyLMfVEVhKVUZbM0MeBijgUK4g6wwukKjnsqvFUY5L40bJrWfgmgd/
   el6ZmCQ9TFj6SBAxyOPP3A73wTeTdBfkymeDBubabtxcQlphzQOWt37/Z
   uDQfcdBZiW+ZoElO2KwT4fWi9IdZrgnA8C8ZQLjL2Pm1SfF62z+UJF0xs
   E64Wa2J1UgMOfEii+9XcL6tthub87x2ZBbYFm6TgGE+9mvD7hLm75S+4i
   A==;
X-IronPort-AV: E=Sophos;i="6.06,194,1705359600"; 
   d="scan'208";a="35661153"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 29 Feb 2024 11:12:45 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id EA6ED280071;
	Thu, 29 Feb 2024 11:12:39 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 2/4] arm64: dts: imx8dxl: add lpuart device in cm40 subsystem
Date: Thu, 29 Feb 2024 11:12:39 +0100
Message-ID: <1889315.CQOukoFCf9@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240228-m4_lpuart-v1-2-9e6947be15e7@nxp.com>
References: <20240228-m4_lpuart-v1-0-9e6947be15e7@nxp.com> <20240228-m4_lpuart-v1-2-9e6947be15e7@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Frank,

thanks for the patch.

Am Mittwoch, 28. Februar 2024, 20:54:58 CET schrieb Frank Li:
> From: Alice Guo <alice.guo@nxp.com>
>=20
> Adding lpuart device in cm40 subsystem.
>=20
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8-ss-cm40.dtsi | 25 +++++++++++++++++++=
++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-cm40.dtsi b/arch/arm64=
/boot/dts/freescale/imx8-ss-cm40.dtsi
> index b1d626862ddf8..ecca5ada224b7 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-ss-cm40.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-cm40.dtsi
> @@ -64,4 +64,29 @@ cm40_intmux: intmux@37400000 {
>  		power-domains =3D <&pd IMX_SC_R_M4_0_INTMUX>;
>  		status =3D "disabled";
>  	};
> +
> +	cm40_lpuart: serial@37220000 {
> +		compatible =3D "fsl,imx8qxp-lpuart";
> +		reg =3D <0x37220000 0x1000>;
> +		interrupts =3D <7 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-parent =3D <&cm40_intmux>;

With interrupt-parent set in Patch 1 for the whole subsystem, this line
is not needed anymore.

Best regards,
Alexander

> +		clocks =3D <&cm40_uart_lpcg 1>, <&cm40_uart_lpcg 0>;
> +		clock-names =3D "ipg", "baud";
> +		assigned-clocks =3D <&clk IMX_SC_R_M4_0_UART IMX_SC_PM_CLK_PER>;
> +		assigned-clock-rates =3D <24000000>;
> +		power-domains =3D <&pd IMX_SC_R_M4_0_UART>;
> +		status =3D "disabled";
> +	};
> +
> +	cm40_uart_lpcg: clock-controller@37620000 {
> +		compatible =3D "fsl,imx8qxp-lpcg";
> +		reg =3D <0x37620000 0x1000>;
> +		#clock-cells =3D <1>;
> +		clocks =3D <&clk IMX_SC_R_M4_0_UART IMX_SC_PM_CLK_PER>,
> +			 <&cm40_ipg_clk>;
> +		clock-indices =3D <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_1>;
> +		clock-output-names =3D "cm40_lpcg_uart_clk",
> +				     "cm40_lpcg_uart_ipg_clk";
> +		power-domains =3D <&pd IMX_SC_R_M4_0_UART>;
> +	};
>  };
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


