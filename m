Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DB41D63FB
	for <imx@lists.linux.dev>; Mon,  6 Jan 2025 09:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736155690; cv=none; b=FGr3Lq3+IoCHUt3qg/l9RtvswIET+UE9aoit2/PEzt+wbGnRh4fL0P5AxpbfkJUL9Oanx6GzF0mRtXjB/kqAv7jxuHhIt/hjnEXtZ7ZAo5RCPFxUWfh0UpboVkM3JXtZawXdBLa1K/qaKIfaf9lIyTUG1cCw2NiRZCsFbGNbS1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736155690; c=relaxed/simple;
	bh=61pt++uOPk+Ukq45+uKljv/Q11loRn0ODQhsbO4s/pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=maGguP8lUZnZ5hTMn8/vhsNpW49ZOKWgeCShSohncqmDXrDHKbjpSWKoJQI1k+hXbN70Pp0NU8ofWQy/zcIxELRzTg6ZQ9qViy5AUh5I9Utup6i9JXDP/e/vrKT1jq8rH+geV7gj5G4HByibZ+9Z8KBZxxpzQjJEBLYabdnzR34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=aSzkyW9t; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=qBgKK/c2 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="aSzkyW9t";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="qBgKK/c2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736155687; x=1767691687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PXCnaWSWoS9YIAoAn/Kz0auizRnOExZj6rmeVZu6DlA=;
  b=aSzkyW9teCHRSLNzHNR35W0NBwa1M9NNZOd24TP0v2JS5KvwDgBa/65x
   0Y7wRAeH2aJXJ6xa/kl3yxymBQ5KLt4ZdSR0pzF8PgwlcEX2kgPG2a34h
   sQBEA1NEVKZSaZj6Ib/yZmYEG39SbtCnvSoTr6yE/ege1jb0NCwpIbP+c
   k55xgnM8a/W4dNOGfBs2GB0r1Nof9/1LoHcS3V5f5AuceA+sJbolYl6Ph
   8GDO2/CJLpT0GAF7opYihMaMtP4O7MU5nGbW0mRLdUkfAnsTk8Q+GFflC
   vwNrH5q7bDfk+dSHr3nfihUjTa3c2pryONvl6PCTRtpZSqXwFCKm5h82H
   Q==;
X-CSE-ConnectionGUID: 6x+pJm1kQV+PLyHp27u1Og==
X-CSE-MsgGUID: Q8H4DRZ5SH2ERl3GvlTiWQ==
X-IronPort-AV: E=Sophos;i="6.12,292,1728943200"; 
   d="scan'208";a="40872479"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 06 Jan 2025 10:28:04 +0100
X-CheckPoint: {677BA224-1D-93478228-E4E4FEDD}
X-MAIL-CPID: 656E0C9F61E47A078C794C090AB99A91_5
X-Control-Analysis: str=0001.0A682F18.677BA224.00D7,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF2041611BC;
	Mon,  6 Jan 2025 10:27:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736155680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXCnaWSWoS9YIAoAn/Kz0auizRnOExZj6rmeVZu6DlA=;
	b=qBgKK/c2OOczIJKtnZla8yDN6CVkurjHjRX7unHcq1ZBTSH3bn/FmTKaT8MbBKgJEZZqXl
	Fh33/mhESZ4HpuHSLc+bPJvIPUHRv0hj4tWj4W0UBZscl6KqFwtSLEsb67NPdoRRorUrn+
	lARXlALXdx4Zyu+MsYfdnNdlcmxIPKsGzy5ENuPaKP4p2aKLNbeXD70w7NFDtHgjBRKP9S
	bd2aCA7NzihRxltsh8N2KB2tWB5FyMHeS1C+Fo+5ebys7MLKs4efzApGIOB1+7x5j0o5+S
	7WXqfGoIFPPVQoPS7ehCgqo4+X0L1Vf6gmljz0x0h4N7L48nRVub5cxyT2oWeQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, frank.li@nxp.com, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Wei Fang <wei.fang@nxp.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: imx95: add NETC related nodes
Date: Mon, 06 Jan 2025 10:27:57 +0100
Message-ID: <12612864.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241219061340.1633173-2-wei.fang@nxp.com>
References: <20241219061340.1633173-1-wei.fang@nxp.com> <20241219061340.1633173-2-wei.fang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Donnerstag, 19. Dezember 2024, 07:13:39 CET schrieb Wei Fang:
> Add NETC related nodes for i.MX95.
>=20
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 94 ++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> index e9c7a8265d71..8b0eb1d835e8 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1697,10 +1697,104 @@ sai2: sai@4c880000 {
>  			status =3D "disabled";
>  		};
> =20
> +		netc_blk_ctrl: system-controller@4cde0000 {
> +			compatible =3D "nxp,imx95-netc-blk-ctrl";
> +			reg =3D <0x0 0x4cde0000 0x0 0x10000>,
> +			      <0x0 0x4cdf0000 0x0 0x10000>,
> +			      <0x0 0x4c81000c 0x0 0x18>;
> +			reg-names =3D "ierb", "prb", "netcmix";
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			ranges;
> +			power-domains =3D <&scmi_devpd IMX95_PD_NETC>;
> +			assigned-clocks =3D <&scmi_clk IMX95_CLK_ENET>,
> +					  <&scmi_clk IMX95_CLK_ENETREF>;
> +			assigned-clock-parents =3D <&scmi_clk IMX95_CLK_SYSPLL1_PFD2>,
> +						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD0>;
> +			assigned-clock-rates =3D <666666666>, <250000000>;
> +			clocks =3D <&scmi_clk IMX95_CLK_ENET>;
> +			clock-names =3D "ipg";
> +			status =3D "disabled";
> +
> +			netc_bus0: pcie@4ca00000 {
> +				compatible =3D "pci-host-ecam-generic";
> +				reg =3D <0x0 0x4ca00000 0x0 0x100000>;
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				device_type =3D "pci";
> +				bus-range =3D <0x0 0x0>;
> +				msi-map =3D <0x0 &its 0x60 0x1>,	//ENETC0 PF
> +					  <0x10 &its 0x61 0x1>, //ENETC0 VF0
> +					  <0x20 &its 0x62 0x1>, //ENETC0 VF1
> +					  <0x40 &its 0x63 0x1>, //ENETC1 PF
> +					  <0x80 &its 0x64 0x1>, //ENETC2 PF
> +					  <0x90 &its 0x65 0x1>, //ENETC2 VF0
> +					  <0xa0 &its 0x66 0x1>, //ENETC2 VF1
> +					  <0xc0 &its 0x67 0x1>; //NETC Timer
> +					 /* ENETC0~2 and Timer BAR0 - non-prefetchable memory */
> +				ranges =3D <0x82000000 0x0 0x4cc00000  0x0 0x4cc00000  0x0 0xe0000
> +					 /* Timer BAR2 - prefetchable memory */
> +					 0xc2000000 0x0 0x4cd00000  0x0 0x4cd00000  0x0 0x10000
> +					 /* ENETC0~2: VF0-1 BAR0 - non-prefetchable memory */
> +					 0x82000000 0x0 0x4cd20000  0x0 0x4cd20000  0x0 0x60000
> +					 /* ENETC0~2: VF0-1 BAR2 - prefetchable memory */
> +					 0xc2000000 0x0 0x4cd80000  0x0 0x4cd80000  0x0 0x60000>;
> +
> +				enetc_port0: ethernet@0,0 {
> +					compatible =3D "pci1131,e101";
> +					reg =3D <0x000000 0 0 0 0>;
> +					clocks =3D <&scmi_clk IMX95_CLK_ENETREF>;
> +					clock-names =3D "ref";
> +					status =3D "disabled";
> +				};
> +
> +				enetc_port1: ethernet@8,0 {
> +					compatible =3D "pci1131,e101";
> +					reg =3D <0x004000 0 0 0 0>;
> +					clocks =3D <&scmi_clk IMX95_CLK_ENETREF>;
> +					clock-names =3D "ref";
> +					status =3D "disabled";
> +				};
> +
> +				enetc_port2: ethernet@10,0 {
> +					compatible =3D "pci1131,e101";
> +					reg =3D <0x008000 0 0 0 0>;
> +					status =3D "disabled";
> +				};
> +
> +				netc_timer: ethernet@18,0 {
> +					reg =3D <0x00c000 0 0 0 0>;
> +					status =3D "disabled";
> +				};
> +			};
> +
> +			netc_bus1: pcie@4cb00000 {
> +				compatible =3D "pci-host-ecam-generic";
> +				reg =3D <0x0 0x4cb00000 0x0 0x100000>;
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				device_type =3D "pci";
> +				bus-range =3D <0x1 0x1>;
> +					 /* EMDIO BAR0 - non-prefetchable memory */
> +				ranges =3D <0x82000000 0x0 0x4cce0000  0x0 0x4cce0000  0x0 0x20000
> +					 /* EMDIO BAR2 - prefetchable memory */
> +					 0xc2000000 0x0 0x4cd10000  0x0 0x4cd10000  0x0 0x10000>;
> +
> +				netc_emdio: mdio@0,0 {
> +					compatible =3D "pci1131,ee00";
> +					reg =3D <0x010000 0 0 0 0>;
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					status =3D "disabled";
> +				};
> +			};
> +		};
> +
>  		ddr-pmu@4e090dc0 {
>  			compatible =3D "fsl,imx95-ddr-pmu", "fsl,imx93-ddr-pmu";
>  			reg =3D <0x0 0x4e090dc0 0x0 0x200>;
>  			interrupts =3D <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> +
>  	};
>  };
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


