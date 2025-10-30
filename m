Received: from mx-relay50-hz3.antispameurope.com (mx-relay50-hz3.antispameurope.com [94.100.134.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361553546FB
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 10:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.239
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761821708; cv=pass; b=IOu0AzZ01SRosOjPykD2nG4u1C3bA6SSi3gJ+5H0VvQng5mANUm7FWKlevhoZCt1OdhsDRGpjy/GgQmtbg0MzKWDoiPqZQODOphIeVTq3gSgvsJqg0GkTUTiySQ7Np7r7IElMPrgX+L9Qm7ECNAv6jw5ScTNzK1fI2lFphyZ79o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761821708; c=relaxed/simple;
	bh=vDit2WSKvXsPyuyNqgDJsL23mSpwqoWbEjwmAU0lRtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k6MGWky16tAmdu7WYskrX89NMYXaSKQgWlaQn53T9GoGKzyfcmSaFUEGxYv/S9wSsIQ004XxtnAVOODFXOudhP6gnUt/zgNcFWufIg/b8n0Gs24QPGvbkhQSD4amvbGXke7MB3Mqf+VWpJg0Tqgbiw94YXUbibg88xnFcL4LJr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Ye2+mD+i; arc=pass smtp.client-ip=94.100.134.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Ye2+mD+i"
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Oz0ZhBQQWSFQZWJgTI1NfCDVGIjRIKKmdygZqOMsjqk=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761821665;
 b=EWlkTsG8nj5DyJsljTnDSs1S986yFe6nRPqULQcvLqJHJr4CcynrahKxKFmPmU/cfPEvCCno
 +qa0hndfJcuErSus24k80D1uX5WpdEGxwNNVPMwfR9ZdzzmTjgzvTgcbUIBjOqEJtcjTUkvZxiD
 4DVywV31aokSMLwdEEULRwdvnnRm6YP2Oj4SbbYDA98H8e/mR105ZCrucbCDNgn9/HyWTi1As/T
 K4sD07tWO++oj5Upz8T5KEXaWSbtcygD7yAcpQsxlJX+esW1Sy+4wWbQmKrjV51jdtuTHi5rOZi
 sbAHQZ6RNwx4Ki9o6B0rn03qLmo9CGfAyThM35MR1DrCA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761821665;
 b=a0CyZfbDEff8rthcAoE/HiqIEJeE7OZK0EIe9qE7waqf2f0ymthFxNdTFN78Icuyk4vNOGVL
 buVykYctcj5PNWDvDAzrY6USeJNXntqnIHOqUTzd8DvJ747HmP2JMP0xeev4YMmOA7E53EzQTtt
 gEfJjcbPYA8fqeRRvRzLaDD/PPqZ3XF+bK0RbsoB8qXvSPUP7V7lIq+QM17/QQrXgll8va0VqOu
 7uipoKby3HV16CFPGEh+qrbhbw51GlRDdKHy8bmULec7uXo6LoVy+9ALqsSlo8s6EfgWo7OUKaL
 hi/+fT6c5rv8bIdlINfgiW78zUbN8vv5yyz7SX/wbqBfQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Thu, 30 Oct 2025 11:54:25 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 257195A0A3E;
	Thu, 30 Oct 2025 11:54:12 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, bhelgaas@google.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>,
 Richard Zhu <hongxing.zhu@nxp.com>
Subject:
 Re: [PATCH v6 10/11] PCI: imx6: Add CLKREQ# override to enable REFCLK for
 i.MX95 PCIe
Date: Thu, 30 Oct 2025 11:54:11 +0100
Message-ID: <3022129.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251015030428.2980427-11-hongxing.zhu@nxp.com>
References:
 <20251015030428.2980427-1-hongxing.zhu@nxp.com>
 <20251015030428.2980427-11-hongxing.zhu@nxp.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4cy1Fd1F7pz2nGYZ
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:868febba0787f9587ee8ceef14de3c14
X-cloud-security:scantime:1.954
DKIM-Signature: a=rsa-sha256;
 bh=Oz0ZhBQQWSFQZWJgTI1NfCDVGIjRIKKmdygZqOMsjqk=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761821665; v=1;
 b=Ye2+mD+iiqqslV7dfsuASMmQodHjeKpXTSwbfU7DOUqKj1Mjtp2RxIlOpIcp4te9F/zU+4f2
 0MQYRtShg/T0SxE92YDmefZURBbujBwLr5qtT4cJ/cqHABNYhswNBq7j7nQacfL/+EAnfUxBX1z
 bzNJm9Ywo+4KiwF+Vpeaw/jGc8SjY/QF9mnt2byumEccT5Oo5yvWQ0ZTGKnz4pVfFN/IWrfWnVt
 2dgvsYrCIE7X6Isi4YagZbDQBnY+zFM6/ES+dMyurPx63qHJON+dd9eTRoOReKPSCr1X0/ElCMS
 67VOgawAgFoN0RIUx0bdFcqkp+BNgOH25AU/LbQvWzsdA==

Hi,

Am Mittwoch, 15. Oktober 2025, 05:04:27 CET schrieb Richard Zhu:
> The CLKREQ# is an open drain, active low signal that is driven low by
> the card to request reference clock. It's an optional signal added in
> PCIe CEM r4.0, sec 2. Thus, this signal wouldn't be driven low if it's
> reserved.
>=20
> On i.MX95 EVK board, the PCIe slot connected to the second PCIe
> controller is one standard PCIe slot. The default voltage of CLKREQ# is
> not active low, and may not be driven to active low due to the potential
> scenario listed above (e.x INTEL e1000e network card).
>=20
> Since the reference clock controlled by CLKREQ# is required by i.MX95
> PCIe host too. To make sure this clock is ready even when the CLKREQ#
> isn't driven low by the card(e.x the scenario described above), force
> CLKREQ# override active low for i.MX95 PCIe host to enable reference
> clock.
>=20
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Thanks, this is actually required on TQMa95xxSA.
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controll=
er/dwc/pci-imx6.c
> index a60fe7c337e08..aa5a4900d0eb6 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -52,6 +52,8 @@
>  #define IMX95_PCIE_REF_CLKEN			BIT(23)
>  #define IMX95_PCIE_PHY_CR_PARA_SEL		BIT(9)
>  #define IMX95_PCIE_SS_RW_REG_1			0xf4
> +#define IMX95_PCIE_CLKREQ_OVERRIDE_EN		BIT(8)
> +#define IMX95_PCIE_CLKREQ_OVERRIDE_VAL		BIT(9)
>  #define IMX95_PCIE_SYS_AUX_PWR_DET		BIT(31)
> =20
>  #define IMX95_PE0_GEN_CTRL_1			0x1050
> @@ -711,6 +713,22 @@ static int imx7d_pcie_enable_ref_clk(struct imx_pcie=
 *imx_pcie, bool enable)
>  	return 0;
>  }
> =20
> +static void  imx95_pcie_clkreq_override(struct imx_pcie *imx_pcie, bool =
enable)
> +{
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_SS_RW_REG_1,
> +			   IMX95_PCIE_CLKREQ_OVERRIDE_EN,
> +			   enable ? IMX95_PCIE_CLKREQ_OVERRIDE_EN : 0);
> +	regmap_update_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_SS_RW_REG_1,
> +			   IMX95_PCIE_CLKREQ_OVERRIDE_VAL,
> +			   enable ? IMX95_PCIE_CLKREQ_OVERRIDE_VAL : 0);
> +}
> +
> +static int imx95_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool ena=
ble)
> +{
> +	imx95_pcie_clkreq_override(imx_pcie, enable);
> +	return 0;
> +}
> +
>  static int imx_pcie_clk_enable(struct imx_pcie *imx_pcie)
>  {
>  	struct dw_pcie *pci =3D imx_pcie->pci;
> @@ -1918,6 +1936,7 @@ static const struct imx_pcie_drvdata drvdata[] =3D {
>  		.core_reset =3D imx95_pcie_core_reset,
>  		.init_phy =3D imx95_pcie_init_phy,
>  		.wait_pll_lock =3D imx95_pcie_wait_for_phy_pll_lock,
> +		.enable_ref_clk =3D imx95_pcie_enable_ref_clk,
>  	},
>  	[IMX8MQ_EP] =3D {
>  		.variant =3D IMX8MQ_EP,
> @@ -1974,6 +1993,7 @@ static const struct imx_pcie_drvdata drvdata[] =3D {
>  		.core_reset =3D imx95_pcie_core_reset,
>  		.wait_pll_lock =3D imx95_pcie_wait_for_phy_pll_lock,
>  		.epc_features =3D &imx95_pcie_epc_features,
> +		.enable_ref_clk =3D imx95_pcie_enable_ref_clk,
>  		.mode =3D DW_PCIE_EP_TYPE,
>  	},
>  };
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


