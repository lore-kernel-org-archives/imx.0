Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011019.outbound.protection.outlook.com [52.101.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C26329361
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 01:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773885505; cv=fail; b=L4QcYeCurgV023c58Qy19pATULagZdiCHnjiAujrMCMZIHUU2u+MTcUyzZTp0T/20mHdPRgcu7VEXKMsaA7lfcFQW7bzvdn2ZjiP5JjCJyeRUuNao5CP5n8YzAkyGLKUAdW9cXWqfVXqJqWVoQ9urmdSLASxQs249mwpgFXqY44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773885505; c=relaxed/simple;
	bh=btxxl4k6iEJaitVit8KL2PNYNaMbkTYjM/ezY8BNYW4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DWYOyHHb5zUtZi56MeFBlrf2d4sR1tbh/Jv3mlXW8PjvZkfFckqoSiSpZgab0jPItmPoS4TX7k8biV8kO01zNnhLL4UT5Olub/NqJSOwNIj7v+64wMGphQbjBvKTa+L80lUvSxzXtXdj0jL5MCn33GNpfEvmHW/uUrZV6TxL/uA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Rd53rLix; arc=fail smtp.client-ip=52.101.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Rd53rLix"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tw6E+2d+Koll+mIuFst6vTgcUfhelbLkT53blCgh/k3RZvRpwDh1inKxsXtILhf63K94Mnj0+4hHeK9XUV9uMMeq2y6VlCRbmCBuxBmHP8AW1aiV2pq2+lZCU61X+QaJXeAuhhawel42uWdV/zFvOcjPPMkI6XRakwQJkaB07OQ+t9MFEw9eieDZeyrnhiAdN8cZn+peghPV12tS0AHnxh3aQEfIDx+43Oyloh2fz3o9ID2niaQKbGuBvebJDZlgnkDCS/XNZyQb9LgjwxNC8IGZMMIleegKj7HHD2fTfKesKj7vZ0FoJSI9lPifWmyetONw/jnrjcIZ3tsKEPD/wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkLJsSjnNzb7KNxzIfN62tdnV5E6GO1ts5vPP2lsmwA=;
 b=kGZVX6orBQJQG5ItpeurAHfE7ykgZ/0R793L+kWII4UMPtlYVWvw88mwoxiTn3jH4cH0ZfUkZMzq2vyEScD+RKg4txBgi2PzjG+OGWI8x8vpa/MBrNXQihbdZkpy8wj3q1KZTXC/FIIAlQzZdvb0z5DcGLUekwLxFJt8ot1KgsZ+DwH2fghdpHh/lMy8x4xMEwFEif5SmrmNdRaZ8NTrOCbC7qXC0e5VcnODGWtdqKAI7liBE6rYBEP1ZKiofmrI9HjbEDSqZPEXIrtj6RIx+FGsR3H1Lh+CaKGnVK/TL/TCrdIxQ/7e4+smEkE4BTvOYInK44H0v9vJfhYQKch3wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkLJsSjnNzb7KNxzIfN62tdnV5E6GO1ts5vPP2lsmwA=;
 b=Rd53rLixMkxcUoQbzlPO51n2KCK5q0I5oIizHtSb3SwiXXRNpJROrSTxpf3ivPez9FCYwZgNFKAoDTmqjwWDWcxCQm9Dg3A7qur0+jc5hpct7TQVja0IAyvfXi+8RGynjxd9gLW4HFpd2pMAA5VaDP7UgObJddBdv3OFynVrqmPftlo7dJjHPHPPx50S4WtIAl/VHqzqd82GnToe0gMzRmXcnkzDWHXiXT78dfWZP3Yjt+25FV8mPNJ+TSy8lQRt518uFZ9kxtuegdykDrcxlxXV3DvJxmdgEzBErlXzPtRoFfJWNrzwpajaHQ5NiGkIJG+hEG5WuOf0LnJ16FDUsA==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DB9PR04MB10035.eurprd04.prod.outlook.com
 (2603:10a6:10:4ed::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 01:58:17 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 01:58:18 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Hongxing
 Zhu <hongxing.zhu@nxp.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: imx95-15x15-evk: Disable PCIe bus in the
 default dts
Thread-Topic: [PATCH] arm64: dts: imx95-15x15-evk: Disable PCIe bus in the
 default dts
Thread-Index: AQHctbtlKkhQU/V59EiKwdkjRBejFLW05QUAgAA2VxA=
Date: Thu, 19 Mar 2026 01:58:18 +0000
Message-ID:
 <VI0PR04MB12114B06CD114A0B839B6BF2F924FA@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260317031024.444157-1-sherry.sun@nxp.com>
 <absp5jdSsyAdLUCH@lizhi-Precision-Tower-5810>
In-Reply-To: <absp5jdSsyAdLUCH@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|DB9PR04MB10035:EE_
x-ms-office365-filtering-correlation-id: ab3de57a-258c-4b2b-ffe7-08de855afddb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 WvOnVBSUi7M4AG6w5vQL19UdmUgpzZ5KB3WsF3pqs07eIL5GQEDpF4Pr/tH8gvh2+mUxezqcHvF9CX9ulO/RN9mCauj76O4Kq47u/sTAqhQ0f4fIpv4+hooCSxiEJic58mmISUoj3f8/5FpMEM1sx8dAeGXUpx3hmVtXjovcglqcjDaFci8FVnVeelDffBBlzXhUpUKI1EF+3naGQzztGrQ0C7Vf5+8DK4ybzE1e1bjNgSTR7fMEndBgZdAY3x0Z3k9QT5HPvsxjkal0Wn0cDPYDqkOwvkWS3sFzoSHtaj307s/g4dPLa2m/en5i5Yc96+e/fleTxTcEwUI0yLQkiDHi8XaEw/mrGVQSGXOz17/1fL5wbqK526jFbLjD4WlusgBpnIb25Hz2TTr/4L/6cAXLVN3GwlULd5Y+h34ffKSqAnDu09E9CQq7qyl++hGezhvlU+VMbpuGBtHCqlKK5k4T+y1hrSLQ2Wb6aa/mc8ThhV8O5zamtKdvi4DkA6y6OCltyaoRvZFRqQS0ZT1NDWEnCPrnFkBL17Yw1yVonh8eQhzEnFEQELBsjdFD+UIIb1v1A+158WeMm2AiDcVf/+Xo2e1lvnOGnHowFMHkhnE+bMBSk00gz3qTaHdXJMvPrb0f9MtEN7fc+ZHWB2AURn6QJRiHEyGCV+yp083OyBRs+OjpRth15h8ky3TaJ6qAAjAG4s79Wl1NPb2JwGgLY9mOk+iOUNiNwUnDABUz1IBgjFLikRpiuEO0/XIBOXtaKm92o9d2U+EwFiGij7W3cq8Hwe9ynPNszjlROFBENuU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?72m19OSGbId/KzevBddf88t8bFL8fArDgy27OtfJugKE4PKm3iooFgjWAkpL?=
 =?us-ascii?Q?suPnvseD5HNkb+oMWejvqz6l3gHNmO+Y1EsXrP8xkvO+7SgWwUNX4EcIqeCK?=
 =?us-ascii?Q?qCKKliuY709EjJU/ySJ2WY7/mq+3Npl1jDNenQUl2Map+OODmyvvzjXCwmmX?=
 =?us-ascii?Q?RdTtWT4XEWEegndBi/IPSbgTiVJbaenlJnvS6WKn40Cm/0ItD9MFkeOc7RgO?=
 =?us-ascii?Q?PYFl2fHeM1MT8cvX+z7JpFZVMqnz02ffbS3pDOL0CqFdT5n/awMntnDSK4Pp?=
 =?us-ascii?Q?Dv1ZrA3SFJK7icCKm294glCu2nGVaZWgYQJ52uZIzG5mL5T3hCOlAOqNR8ea?=
 =?us-ascii?Q?z/yYN36Z1RWoArmetmd+QHDR8NsECDxoSgBRPx2sorzZ0IB50nCVMOn18LlH?=
 =?us-ascii?Q?5RT27AHenxtA0bCQxgEGV8usrPgO4F3d6JUHWQ7N2L8mk6bhzuivVcOIPREG?=
 =?us-ascii?Q?DY++M6Cxw5mjXFDG69hChvtlHV0JmMnOA9YRRnJ3IK4FGGYjBZuugtEZVjmz?=
 =?us-ascii?Q?VbFv1EG65rnSeu2Kpai9owbl2a1oC7XeTQEGlwReCEQhfMbLjg3mK9GL1QqL?=
 =?us-ascii?Q?gWNuaPOdmtE4E8hGmtCIoMup2oUV8ad4M00Bq2puf42vLDB43iL9PfKy0ZWQ?=
 =?us-ascii?Q?iWUKh2O0xwUSgEn+aA+F5iNqTX9Uv6GN2goafDcEvXM1nfEYF9H1ERLT730P?=
 =?us-ascii?Q?GsZ1LEWhyaWz+OnLi2kCXhi3b+PSYSHQt5tLZN6k3WdumK8SdDVo/H8QvvMM?=
 =?us-ascii?Q?QljgbglhoTnvXFBjn6BAA3RaLDL9JMafPtQHyUXf4p2Qr5Qwa4iu7mpZzmTI?=
 =?us-ascii?Q?bdHxGGDlcSR0jCT4wchXot8aC/Sro/kwcKq8G3pOKTDj1d9ra2fu5qZKNdpc?=
 =?us-ascii?Q?zFU1+LWQC+HETSNAVBOMSvfZjw6TYAX6hWMp44kCrS/fIbdUFRvNr0RIwNyM?=
 =?us-ascii?Q?4fbBfd2cGFEWBdgvPlSDvPK23bHmOvzswDbImg3sSuNGdzME1Knl72M6hSRh?=
 =?us-ascii?Q?ECh0qVrBlvU6fa8Ex+gCDBrLO2wbdUI5j5iPpi+WlvUoLGLXMIpKjqfqkSRZ?=
 =?us-ascii?Q?oxwbWMGiBEstk6epeZSGFEdhaoSFtwxSJN8xIBd96ACkDU7XwLcS1v6w0nyX?=
 =?us-ascii?Q?ryIP8U56Vvu325kBsWNoYFPwT6kYiS4ASPLFsMhKcGRv4s6IeNKPf5U+oRtM?=
 =?us-ascii?Q?DprBw+6smZP1+bBZ4csmC7YRK91czIkna39Pzc2lVjawaYLPb3qFDXZsyW31?=
 =?us-ascii?Q?xI/bFVbJJaz0wjFz5c3WlmRF2AFdznm3urDV+XEkpBTF7jQHSx3ZY9ph9yl/?=
 =?us-ascii?Q?0n1XrcRg/R4Iv06HOeq7cocd/sAjC5dk74nrGsiw7oX+EwTAzYzQMMOnv8SP?=
 =?us-ascii?Q?UhzOiJp8a7VHfn2H3Sduv5bG3a63+6tl8h5V3DHsxdUWlKVBV/4tj6bJlt0R?=
 =?us-ascii?Q?Zt/GjmRRk4DOiqt+w1OEVfhxc3BdRf3Pu/Tc0ijqwHDx1E7lIl26IoLJcolL?=
 =?us-ascii?Q?TOf3cKSd+O16M06CxYZjVJr6SnXaTF7mG6nZQlnmy877NI2YknJhswowcjfz?=
 =?us-ascii?Q?eHfO9uwzZXr60zPE5x+msm4AvV507uAr/nwYjSeKhqLVLcuF5Bl1F+26LODF?=
 =?us-ascii?Q?vdNBSvlgJQcQdt4s0Vt+fdncvAWtbHQONlPkhtj85l68RD3687QgqRed68DN?=
 =?us-ascii?Q?wllvndK3RNFXWQn8pG1cRwtqAvH7hg7Qdhr5ACy6iyKtvX0j?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3de57a-258c-4b2b-ffe7-08de855afddb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 01:58:18.5364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N5xV9tEP9i9UeYLLjLc5IKvncTor+X4TqmOH1xfv0ddw4XVw4NFhA+PAbcHO0ObVszSlu0t3UFKU/9yBL1dHmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10035

> Subject: Re: [PATCH] arm64: dts: imx95-15x15-evk: Disable PCIe bus in the
> default dts
>=20
> On Tue, Mar 17, 2026 at 11:10:24AM +0800, Sherry Sun wrote:
> > Disable PCIe bus in the default dts to avoid the shared regulatory
> > between SDIO and PCIe buses, the random probe order between the two
> > buses may break the PCIe initialization sequence which cause PCIe
> > devices has probability of failing to detect.
> >
> > Enable the SDIO WiFi in the default imx95-15x15-evk.dts, and add a
> > separate imx95-15x15-evk-pcie.dtso to enable PCIe bus.
> >
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
>=20
> Why SDIO WIFI is default one? Generally, PCIe have better preformance.

Hi Frank,

The out-of-box M.2 WiFi module on imx95-15x15-evk board is SDIO IW612.
imx95-19x19-evk board use PCIe WiFi as the out-of-box M.2 WiFi module.

Best Regards
Sherry
>=20
> Frank
>=20
> >  arch/arm64/boot/dts/freescale/Makefile            |  5 ++++-
> >  .../boot/dts/freescale/imx95-15x15-evk-pcie.dtso  | 15
> > +++++++++++++++  arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts |
> > 2 +-
> >  3 files changed, 20 insertions(+), 2 deletions(-)  create mode 100644
> > arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtso
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile
> > b/arch/arm64/boot/dts/freescale/Makefile
> > index c4e790a268ae..505efc9ebd58 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -471,7 +471,10 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx95-19x19-evk-
> sof.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-toradex-smarc-dev.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-tqma9596sa-mb-smarc-2.dtb
> >
> > -imx95-15x15-evk-pcie0-ep-dtbs =3D imx95-15x15-evk.dtb imx-pcie0-ep.dtb=
o
> > +imx95-15x15-evk-pcie-dtbs =3D imx95-15x15-evk.dtb
> > +imx95-15x15-evk-pcie.dtbo
> > +dtb-$(CONFIG_ARCH_MXC) +=3D imx95-15x15-evk-pcie.dtb
> > +
> > +imx95-15x15-evk-pcie0-ep-dtbs =3D imx95-15x15-evk-pcie.dtb
> > +imx-pcie0-ep.dtbo
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-15x15-evk-pcie0-ep.dtb
> > imx95-19x19-evk-pcie0-ep-dtbs +=3D imx95-19x19-evk.dtb imx-pcie0-ep.dtb=
o
> > imx95-19x19-evk-pcie1-ep-dtbs +=3D imx95-19x19-evk.dtb imx-pcie1-ep.dtb=
o
> > diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtso
> > b/arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtso
> > new file mode 100644
> > index 000000000000..42384e6233f3
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtso
> > @@ -0,0 +1,15 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2026 NXP
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&pcie0 {
> > +	status =3D "okay";
> > +};
> > +
> > +&usdhc3 {
> > +	status =3D "disabled";
> > +};
> > diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> > b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> > index 7eb12e7d5014..afd89ce3cc5b 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> > @@ -557,7 +557,7 @@ &pcie0 {
> >  	vpcie-supply =3D <&reg_m2_pwr>;
> >  	vpcie3v3aux-supply =3D <&reg_m2_pwr>;
> >  	supports-clkreq;
> > -	status =3D "okay";
> > +	status =3D "disabled";
> >  };
> >
> >  &pcie0_ep {
> > --
> > 2.37.1
> >
