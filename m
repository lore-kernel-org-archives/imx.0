Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012052.outbound.protection.outlook.com [52.101.66.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A603F54D2
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 12:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354717; cv=fail; b=hGITy5HxeR/mOWJv5iPzc6eRBdDDQwIzUWsrFO1+YlnmEK5vtdq8gOjX4u9t/ojmRqTQSzA2sZNbUm6jRv4P80LVRD11Gmn9HSfqMMqu1HnmXyv2BRUj2fOJvWynATrUu8fiVZBXKa5wo6/6M+iERu5ve+aPdODekRv/HZsFZo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354717; c=relaxed/simple;
	bh=zvzGmFKHLcH7cSgjHs6kM06ZYHdXMvSmWoMUIjL/4OY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jk14cxyOTJX45toUP5ognCmbtRZj6PioNRUipumusZA3c04Fw1Hyd3pfhmKPeu8j11qR3d9brLK1tN1evr0AfodU3Lb2FGBpV6ai/mnGnceTH5NCykX6Ps4c9J3MrOHYNA+CpgU6uouLv1l/rUVQ5oLh122gn3nFHcg6752SVRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KoPO+vR3; arc=fail smtp.client-ip=52.101.66.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KoPO+vR3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/w4zWH66a/ESr/c3sQH8OoOjx+XJLWBE8WVYUuVOCcXBd/cr0GPQYUBUc0gVqQyp55LhZY0KYUJZPgTT4nmFAn9gEQbPqwN6vQ/+QuGrgTahEj8foAsuTS7kDQb8mO9GzuH9ocFshZ/+kBxrTN2Vbok6/+EuXHaBlmsjgm8n9XFHYFcZ3NZ25IaVM04ZoKUPs/nSvr1uBUNpIdqEVRvtDAlc4RNUGwBaVkukXMyLyiIzaWG56WJjqYLZwzm+fp5NHxwoXGaA51zR0pfMgVCPG4ZuYk/DUium47pdfaeBTSTe3jfAfwKbmTrxo1d/0N7DVDflAF9DP23uazuly9CxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOjFvkdb745wXMk5wag/BqKEx9iUdhBYtt25TtbUvJk=;
 b=SEM14C1ax67lusK59/nBfD+idXJHKtFKUX2e5czq4/+EAG12E7238xfZVhQr93o7C77+F8eYrz8Vp7X9k2g4ENOf+7hw0BonNQyLNxYcaM74WbqvPtuOniQGty1b2wJQIQ/T0NauC+fJkNQVewxnHK5pFFLUeGcTRIXoQpXIwXzgaIbXGvGphN8nCFbguvf+7E6Hylrf8qVWP5aq93k+EOE+DVf6uM4yjTDzg0FsNaaH7PCmcfg8wH0hhj1efZWpIkr11FODZrBeLexmOnWkpIxMoDPvlfLf9spHPEpYWlWQfwm/67+S03Cl5Z5lXfhtsVw08udzuiYmEMfkg5Pm/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOjFvkdb745wXMk5wag/BqKEx9iUdhBYtt25TtbUvJk=;
 b=KoPO+vR3YulGfyQ/21+yMNJ7cwQEF91T2BIwPkTZKPDuakZ6RTNwpmA/6htq57LfWPwoSxwA0RYVZSFeVDf3QbPgtbexSyuxJjO/wTXdEnpe9+hxXQSVkZhe13CTsIl7b1/JsG1+1wULzIUwRf9M73qeE+f8NaMgGy/Z47f04Q5nkJSdcx183kbeM9cYiTelmLvQIrRnAznVWZLJ6DFEm29DC9CZa1FDMON6oNY0FnYLxCxp+6YtKvxw66GQ0hLp0MWln8va1OaetcqjbWKOVr4Sx3mkhCnUh0z0IH2CmcRPuUOCT43GVQft/eNAppiSyL0lv8h12AlUuDbkPHgSPg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7637.eurprd04.prod.outlook.com (2603:10a6:20b:29d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:18:19 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 12:18:09 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>,
	Daniel Scally <dan.scally@ideasonboard.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Stefan Klug <stefan.klug@ideasonboard.com>
Subject: RE: [PATCH] arm64: dts: imx8mp-debix-model-a: Correct PAD settings
 for pmicirqgrp
Thread-Topic: [PATCH] arm64: dts: imx8mp-debix-model-a: Correct PAD settings
 for pmicirqgrp
Thread-Index: AQHcuzxUfXhGUgZnu0q+MVI9my4sr7W9bZEAgAAcerA=
Date: Tue, 24 Mar 2026 12:18:09 +0000
Message-ID:
 <PAXPR04MB84590C7D79F3EB2A8468B9EC8848A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260324-imx8mp-dts-fix-v1-1-df0eb2f62543@nxp.com>
 <20260324093850.GA2351719@killaraus.ideasonboard.com>
In-Reply-To: <20260324093850.GA2351719@killaraus.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS8PR04MB7637:EE_
x-ms-office365-filtering-correlation-id: 61a1768c-b970-4b9d-7778-08de899f6941
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|19092799006|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 oJtugNOAiXlL6+qHAsZCvLnnwBpAXJGVsOowBK6t4IWEcr3/IDPtxKU2jKcE/TdON2Vie6nbY7lAkood6DkWDyfXWgvR/5381e/TQ8dIP01MmXbWbIAH6io+ZDEYArIQYLhPGX79Xx5FHgfLNZkS423WCKCutc1Hip8V33nwr938Z8tN1smT6WwXhIM/wWkYfNQlnFXzDL9hNfmLJ5udSQMclIzcJkngmjly0qbrvnOGLSqN9m6XD+L2qOMW5RJGWznAITnwTpztuPDfoUTBSkJyybRAy2wfIQ4QLM352Gd6hQZ9zKerrwE34weEtOibupdkM3GO2HTXH5mCiucyNc1Od0LS3JI0TlmdPif+a3Z6Tk8Fq1OvfqPC8EcA+TfX/qMaJhKVhA7MNnI1Y/2LUIqPCVui/c8Ts0VlmJJS7qaajpM3wBbe5NuccZirAN84JUo08JxpzfFUK5xhp6gwQyCJr5c5gi84XjwGLwIvFbopJHw63UnoPC2JbsWsMrA/WnaN4t1kU2r4tedVFPX3CBMRF5XOcJxVy8pBWDDXPyYNbH/2kamWnsRYFh77VTzMGfq/587Qi3TDi3v80SpGaf02gDyxFdcIDCDzpRTFVef7twNioyAroEAXvzo/l6XpOdTZzLjMlsgsQ8Kv9MbdwGXuvB4WKJNdCGwDL8Tq5ACOsCRVMlP9QG+2riyLV78/sAFOvyc/ZBUVdtprCKFrRyYmxexpJn8DGrIeP3kTekgfyE/nZhPzPw1HS4vksBLcJ2D3KCsFN4xUgfP199Q+7hwk5Jfw4tpnkf0+ImIsV78=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sZSWONdnqtJIs67gMKK5ZcvW4kr0jCWVXkDIZItCpEiPZj2Cb4MvYU+ofxfo?=
 =?us-ascii?Q?2bMHNJACODYOToX1EBQQYf4h8VTLi2UHDzpZoZnuYFTjv49RxEVXFKp+r/Yl?=
 =?us-ascii?Q?2Hv3o8rv12VLBtRcbFutmQS55pnJWfTEDvDw1gGL0ZcWcpm/7yzaKUgkfDFw?=
 =?us-ascii?Q?WHcTdZbp53h9hl2B8fG97SLBrQp4Rlcj3ZYq+HODE9KObGgEwuXgyuFppCLR?=
 =?us-ascii?Q?n0Ky3ggI2ES9AWhMzUxcW2Ur2Dz/FfbTsSD2bjW0rSVKDEo5YEjRkqL/w8dl?=
 =?us-ascii?Q?KrmX1KDx+ERfOXyNQbwAjkdPG1t/WKX5tWj0DTy0zuGZhKBhJqznXGM0ldXt?=
 =?us-ascii?Q?IRsSsNTqJFJ5Xbb4is69r4qFEwtuDmIKlGtwa4U3i0ywAf02fljtm1/IwXfP?=
 =?us-ascii?Q?u40gw1UWLHJcdaV4Fig2LhJzOVwu58Gvp3xy29GjzB9C1IYDHKMJRp+3PmpB?=
 =?us-ascii?Q?8nR3CeGy03T1iLkc1pHY91yd3XJbGjgpK+sBeqOgoMC1igwM+MGhDoa6HTbe?=
 =?us-ascii?Q?Bs1xFUMKfPMVhUQWMwCwRu4KSodMXL281vFBDymmfrqSS/ztrsrWY6GUwzv8?=
 =?us-ascii?Q?6PJsTqHwJdVcWwDU1qXKE4aMcx7jrDmMiPIsEj6ghOAQ20MyjYQq5vaU6iGe?=
 =?us-ascii?Q?KHhsxZP0KgYR8IT8Xrz50Oc/hxv21Sr1RY/zBNDuZEEtEz7aNZld5oqqN56L?=
 =?us-ascii?Q?oJcKMrBunPo/e6o46H83LCnS+sAze03XsAd+XOEnLdb81cGpn89G1xFrY+rg?=
 =?us-ascii?Q?3rLrf0JZb6HMLqzP/FEEq8sJtiRNBm8CbUH895nS+AuVTRExEVXOy0KWjumW?=
 =?us-ascii?Q?TtJc7Ancl+pMs+gLUDhkq+YDxDrZZve7Oew54adFtbf0cz4qXE0f8oodAd1F?=
 =?us-ascii?Q?fBrHaEonAjCll5Hruv5dPKF3d1c8f/qO3f1PdkmGUj2SEd3VB7Y6h+X0WTmb?=
 =?us-ascii?Q?kTuXd4aILaPxtG5W/KBRXjc+eF/IzXm786NcuSsuUPw/z7ySBhXdknfCvyUJ?=
 =?us-ascii?Q?+8JyM/DGuHkMucAd095QwIz5ard0dk2Kg/0LqsyFvXPalpWx2AnyxDk9Wz86?=
 =?us-ascii?Q?Ns2dct0P9UL36cMyQsdixt5AlTuNrJrUc2Apiy2e5dCZhQPjg17kSfF0fXTL?=
 =?us-ascii?Q?Omh9N7NtIRI1RUNZlKSGaWJE+c/4GLAMOPVbL/zq2HNMkmVkb/iUJ6aMdM8L?=
 =?us-ascii?Q?fLTCpSC9i0PXQb9tbqs2+7k/txvsqStvaTDyIMbSE3Kd2WSZj2hFAu+ik0ie?=
 =?us-ascii?Q?ya4qO6khlQlJCYc3XDYMPKBv81gqDzBbf2L08RXZKnWiZ3CnMKzCKcfTTnxJ?=
 =?us-ascii?Q?waQ6PGGManj7f1xrztdPuGTwI9/k2FofHjteXAs1KpJmAic70J0tqoihE8bx?=
 =?us-ascii?Q?S9q8Wqq+PQOE1tZVCeJ3Ud3dCjkz0gcFAQYZT8x51r0mRTjmWI7yWkEV5orq?=
 =?us-ascii?Q?9pLFEAVbrSWVxXr8j78Tu2uT91cfjgatvogtECSZJlXqQy/D8jrtzXbXRyen?=
 =?us-ascii?Q?xp4v/ou3BaR752yQDBtpPX7O48RtydwEeQT8hj76SSANERTfLucMeVqz8RV6?=
 =?us-ascii?Q?fLBlmCMXQD+eIphzC1oxDG+eeKYZXsuqRa+gchmZLT/By9L9+Qm31Cr8rh2N?=
 =?us-ascii?Q?zWsYqdBAe+eEVWuF4IvoR+MvpP/7PgtVRof8vGNHCsG6qyypQ+5qAGes8Nyx?=
 =?us-ascii?Q?zU3TNTFBv6aJEQisGeNWiIlAjUB5WgpLSNsooWKnlIVGjWya?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a1768c-b970-4b9d-7778-08de899f6941
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 12:18:09.1678
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7V9wc62vAJrIcqmmnhUysGuy6ew11dM2mOIJ/CAMe2oLXD3VafV05+pGU1ilNACUasA/cU8wVWY9G3DYtjTerQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7637

Hi Laurent,

> Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Correct PAD
> settings for pmicirqgrp
>=20
> Hi Peng,
>=20
> Thank you for the patch.
>=20
> On Tue, Mar 24, 2026 at 11:16:13AM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > With commit 5d0efaf47ee90 ("regulator: pca9450: Correct interrupt
> > type"), there is interrupt storm for i.MX8MP DEBIX Model A. Per
> > schematic, there is no on board PULL-UP resistors for GPIO1_IO03, so
> > need to set PAD PUE and PU together to make pull up work properly.
> >
> > Fixes: c86d350aae68e ("arm64: dts: Add device tree for the Debix
> Model
> > A Board")
> > Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Closes:
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks for quick testing.

>=20
> Frank, would you be able to handle this as a v7.0 regression fix ?
>=20
> I think the same is needed for imx8mp-debix-som-a.dtsi, but I can't
> confirm it as I don't have the schematics for the SoM, neither do I have
> access to the board.

I also gave a  look, seems there are several boards are not setting
PAD correctly.

imx8mp-icore-mx8mp.dtsi
imx8mp-edm-g.dtsi
imx8mp-dhcom-som.dtsi
imx8mp-debix-som-a-bmb-08.dts
imx8mp-debix-som-a.dtsi
imx8mp-data-modul-edm-sbc.dts
imx8mp-aristainetos3a-som-v1.dtsi
imx8mp-ab2.dts
imx8mp-navqp
imx8mp-skov

I not check schematic, but from the PAD settings, only set PU is
not enough, PUE should also be set, unless there is board
PU.

We may need to fix them all. Let me do further check to see
if there are schematics available on internet.

Regards
Peng.

>=20
> Dan, Kieran, Stefan, could one of you check if you get an interrupt
> storm from the PMIC on v7.0 ?
>=20
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > index
> >
> 9422beee30b29c5a551b08476c80fbff96af3439..df7489587e48ed0c6
> 78f11291f6f
> > 2b77082ade95 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > @@ -440,7 +440,7 @@ MX8MP_IOMUXC_SAI5_RXC__I2C6_SDA
> 				0x400001c3
> >
> >  	pinctrl_pmic: pmicirqgrp {
> >  		fsl,pins =3D <
> > -			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03
> 				0x41
> > +			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03
> 				0x000001c0
> >  		>;
> >  	};
> >
> >
> > ---
> > base-commit: 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
> > change-id: 20260324-imx8mp-dts-fix-512530fe4dcd
>=20
> --
> Regards,
>=20
> Laurent Pinchart
