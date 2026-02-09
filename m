Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328431C2AA
	for <imx@lists.linux.dev>; Mon,  9 Feb 2026 07:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770623373; cv=none; b=Ig1Z3m3QLgk7U7lAAE0eOAYEwj9qgvS0L9WBW5CUuM3EL8jXWDrNTY1lcVdT1V65ibr2vXAFjj4FIuqJ5x4V6jAJy7YJ+fd40/CniPdPAvalprAlXXjZiaQ+UrBVi/xyfGa640jdoP0KJSxmNfPnjGnpuV8wWquWYlCwKF6PrSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770623373; c=relaxed/simple;
	bh=apqqrfRf8L8OmubOlBUz0Vme7jcRaRgyxJoAEkBsXr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mo7M10Eml5IMVvkQMbHRhMBAl/O+jdzRJcLLBdpeJRHDSEbUnMT8POnvzR7bPK9tZwz1mdZ8SC1/i7YBUyvUJ9qZNXWV3i8jkfbGSDzLDb2aq5t0wyw9Gpsuv0O2JQa5B+ntP+iuCxvjwT6GjrR+TBOaM0n9LpBWfmkOqgDfKRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 13A981A231C;
	Mon,  9 Feb 2026 08:49:26 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CF7021A0442;
	Mon,  9 Feb 2026 08:49:25 +0100 (CET)
Received: from lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com [10.52.9.11])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id A46F71800095;
	Mon,  9 Feb 2026 15:49:23 +0800 (+08)
Date: Mon, 9 Feb 2026 16:49:22 +0900
From: Yanan Yang <yanan.yang@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, qijian.guo@nxp.com,
	justin.jiang@nxp.com, Lei Xu <lei.xu@nxp.com>,
	Xiaofeng Wei <xiaofeng.wei@nxp.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board
 support
Message-ID: <aYmRgsEoARQG8OQC@lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com>
References: <20260123-imx91s-frdm-v4-0-1bab038faee9@nxp.com>
 <20260123-imx91s-frdm-v4-2-1bab038faee9@nxp.com>
 <aXOTzHaLn6hFdMtR@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXOTzHaLn6hFdMtR@lizhi-Precision-Tower-5810>
X-Virus-Scanned: ClamAV using ClamSMTP

On Fri, Jan 23, 2026 at 10:29:16AM -0500, Frank Li wrote:
> On Fri, Jan 23, 2026 at 03:42:00PM +0900, Yanan Yang wrote:
> > Add DeviceTree support for the NXP FRDM-IMX91S development board based
> > on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized variant of FRDM-IMX91
> > and differs in memory, storage, Ethernet, and PMIC configuration:
> >
> > - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> > - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> > - Single GbE port (FRDM-IMX91 has dual GbE)
> > - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
> >
> > This DT enables:
> > - ADC1
> > - UART1 and UART5
> > - I2C bus and children nodes
> > - USB and related nodes
> > - uSDHC1 and uSDHC2
> > - FlexSPI NAND flash
> > - Watchdog3
> > - Ethernet (eqos)
> > - FlexCAN
> > - MQS
> >
> > Link: https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91S
> > (FRDM-IMX91S board page)
> > Link: https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91
> > (FRDM-IMX91 board page)
> >
> > Co-developed-by: Lei Xu <lei.xu@nxp.com>
> > Signed-off-by: Lei Xu <lei.xu@nxp.com>
> > Co-developed-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
> > Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
> > Signed-off-by: Yanan Yang <yanan.yang@nxp.com>
> >
> > ---
> ...
> > +
> > +&iomuxc {
> > +	bootph-pre-ram;
> > +	bootph-some-ram;
> > +
> > +	pinctrl_eqos: eqosgrp {
> > +		fsl,pins = <
> > +			MX91_PAD_ENET1_MDC__ENET1_MDC                           0x57e
> > +			MX91_PAD_ENET1_MDIO__ENET_QOS_MDIO                      0x57e
> > +			MX91_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0                  0x57e
> > +			MX91_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1                  0x57e
> > +			MX91_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2                  0x57e
> > +			MX91_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3                  0x57e
> > +			MX91_PAD_ENET1_RXC__ENET_QOS_RGMII_RXC                  0x5fe
> > +			MX91_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL            0x57e
> > +			MX91_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0                  0x57e
> > +			MX91_PAD_ENET1_TD1__ENET1_RGMII_TD1                     0x57e
> > +			MX91_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2                  0x57e
> > +			MX91_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3                  0x57e
> > +			MX91_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK  0x5fe
> > +			MX91_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL            0x57e
> > +		>;
> > +	};
> 
> Plese usb tab before number.
> 
> Frank

Will fix it in v5, thanks

> > +
> ...
> > +&wdog3 {
> > +	pinctrl-0 = <&pinctrl_wdog>;
> > +	pinctrl-names = "default";
> > +	fsl,ext-reset-output;
> > +	status = "okay";
> > +};
> >
> > --
> > 2.43.0
> >
