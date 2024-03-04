Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D35C1B967
	for <imx@lists.linux.dev>; Mon,  4 Mar 2024 09:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709543532; cv=none; b=dh9D7caxW2hXCVncwQfgqm4ysxTFJmoX9a+E2sPfG5KTXcmq2u3NKExiRjMucWjoYoSNbaD2Qrv/oAZv0nPc61bO/l84KKoRGr5K54+bSqYcvZRKhhzV2ULS+/LdKBY4tTH6ywTpLL77KcHhZGdGddVd6c63G5ewkPc3NRU/R7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709543532; c=relaxed/simple;
	bh=SXQdHBzDn6lNhNR2jRKyU6m0hP/iQLlkGyx6cM7QnjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BWGI+F95cToY0/wG8nk5ECqXDwnpD2hpXanNHyNsvSLKyPtEHUZzx3p6Sc1EPZL9iBbymBHBcXoWMuqifog6HkMJaPGL80rFC6z/ADPREhtBEpYj7ojnkcOWSGOgo8ZDD0BV84gZwIjWP/kgoZXKwrP7ol6sgMWTNCshrQ7hmQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=NcyjqjiW; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="NcyjqjiW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1709543530; x=1741079530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8o4rUALbnNNyVSdf0MmmAYmT6lll+Rib3jtEkEHDq+I=;
  b=NcyjqjiWOnOIP4FbSmX6JZNsh5KvMeIjqmxzklRL2Yq2n24FmwdmYTq/
   KH3Ex/2aFJQPznuS6t7trK2yVTuSE9bMZUfPi9Jrm7kSl1xYMIHXWHHaO
   qELGhvApUfdsnQHWyontof8tWt1R1rKJfkST6Szz2qkhCfa4CQfKcw5s+
   F8Yhtes51vOaeeg4j0Ma39kzLaezRTwy07dLB3F/cpXoe/97Uydnqk1bj
   98lmXhAz0PpruWn3GK8SOxdd3vJmxxqJba9zjeShXWsPnXC1VpkU+UAC2
   6Xcvu2xirb3hl18WBT+eW7vB+KO2+Tc1wV/ANpVwoUbQsrfXxLbEWRniZ
   Q==;
X-IronPort-AV: E=Sophos;i="6.06,203,1705359600"; 
   d="scan'208";a="35711027"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 04 Mar 2024 10:12:03 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 322E7280071;
	Mon,  4 Mar 2024 10:12:03 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: imx8dxl: add lpuart device in cm40 subsystem
Date: Mon, 04 Mar 2024 10:12:04 +0100
Message-ID: <6024754.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240302-m4_lpuart-v2-2-89a5952043b6@nxp.com>
References: <20240302-m4_lpuart-v2-0-89a5952043b6@nxp.com> <20240302-m4_lpuart-v2-2-89a5952043b6@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Frank,

thanks for the update.

Am Samstag, 2. M=E4rz 2024, 17:27:45 CET schrieb Frank Li:
> From: Alice Guo <alice.guo@nxp.com>
>=20
> Add lpuart device in cm40 subsystem.
>=20
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8-ss-cm40.dtsi | 24 +++++++++++++++++++=
+++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-cm40.dtsi b/arch/arm64=
/boot/dts/freescale/imx8-ss-cm40.dtsi
> index 68043ab74e765..b6af85b20ddd7 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-ss-cm40.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-cm40.dtsi
> @@ -20,6 +20,18 @@ cm40_subsys: bus@34000000 {
>  	#size-cells =3D <1>;
>  	ranges =3D <0x34000000 0x0 0x34000000 0x4000000>;
> =20
> +	cm40_lpuart: serial@37220000 {
> +		compatible =3D "fsl,imx8qxp-lpuart";
> +		reg =3D <0x37220000 0x1000>;
> +		interrupts =3D <7 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks =3D <&cm40_uart_lpcg 1>, <&cm40_uart_lpcg 0>;
> +		clock-names =3D "ipg", "baud";
> +		assigned-clocks =3D <&clk IMX_SC_R_M4_0_UART IMX_SC_PM_CLK_PER>;
> +		assigned-clock-rates =3D <24000000>;
> +		power-domains =3D <&pd IMX_SC_R_M4_0_UART>;
> +		status =3D "disabled";
> +	};
> +
>  	cm40_i2c: i2c@37230000 {
>  		compatible =3D "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
>  		reg =3D <0x37230000 0x1000>;
> @@ -53,6 +65,18 @@ cm40_intmux: intmux@37400000 {
>  		status =3D "disabled";
>  	};
> =20
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
> +
>  	cm40_i2c_lpcg: clock-controller@37630000 {
>  		compatible =3D "fsl,imx8qxp-lpcg";
>  		reg =3D <0x37630000 0x1000>;
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


