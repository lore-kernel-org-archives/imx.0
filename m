Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013064.outbound.protection.outlook.com [40.107.162.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B213446BE
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 02:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774319552; cv=fail; b=RQylt+6hzfdP2uTOPtEyPspmnEG2xCLNFcmk4A22SdWiX8bvGybYqxaM0XLNjUlnL5NNU56Th/OMlh2ORq91SlMEnl94mP5Rh1QvgJI4TSma/32JlMxuGvS7q+NO+yj2qB8K/U11dLiAS8/mWzY0jZr9qSnq4WE3x6l8B/Pe0Tk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774319552; c=relaxed/simple;
	bh=N7T4tQ7MxMbQ0UqbXIIidNiprABTOXCaK8uTuFGA35E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gK0D9gj9d3RQdDb7v63p/+LnHVKln2u9FyZTJKP7mCux6KfS2O81Itgg5e8Gnb/DIM01Qry5j3nJBRa/PgDJM9uo/HaUw2PQTml5W2m4vqbEzNycrt/zqBzvGeNYtlEQD+1Y5H47BXBWvYXhx8uO36pVLaunpjl024zzvcLlLF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iYxmfBCq; arc=fail smtp.client-ip=40.107.162.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iYxmfBCq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLI0AMbtfom+aS/kdQ2YeezvevbKNkMSSn88sgHJYRyLe7oNjKmSG4j+xDmlIJUj7SFr/XdxDJ6ZB2CvrRK0ncnbQWUq5PWVHki7ZkP/xrFrIP9jOz8EkOCYA9osyweH2PDGCNHfEH3m7uq6m6BwdRzWRPK/GTU+OiJlNHmBDAG1taYo69t9jycOKCvIhUbRxNTGEPQ6S93DySvolI58UwPnVKkBF35M/s9gv08Fd34ZWL5N/npWP44jMbBRxlyN3nTrDSuZIfoKtxQWKB4zKNmWC2C9w2RmR1+nMDgj6T06TL36/9DYqz+MK7wx/7LKbRO+vctbar8mhvVHDoXz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSIoPx/QasmgO1+blwa/Zm4uo8FGDj1ZMGtWL34otwo=;
 b=PcikXsJak3LJRA7punP7OY8+R3NXhp2ycVAExsG7tANEGTIVqVTxPHqa2d2Z/09NLMIk4C/W44U3hwyjbJtr9vP/sQ0mJWmXdXdHMBVVVLypMiHm6oDb5DnuvMUpjhgozux42vhEgRwLrSlIlPfnbSKwFqekpeycLiadNx+nJ+A1GYXnALFAgSx5xkrDHFfUrurfCxR4G9BZaPjHBfoFb7ho3QU+q4PY3IzNUJRB8WW+jJ6xanKhMwin556NK01ZNXOv0YRW+a0wCa4zENFryrHJ0UQm7WrVz58Fm9nOa78tIhSYPVfhDvbjhSpCD0INx8p6j4m+HPcZxIzOyQB87A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSIoPx/QasmgO1+blwa/Zm4uo8FGDj1ZMGtWL34otwo=;
 b=iYxmfBCqxg3tyrCHtNopTgafQ7qz9vbvzqAq4b03dwj5aZApxjYLuHfZ1OPqc8M2K1MHFRUiI1gJFB9Ihy/lZDiTRo3I8gqUUNOsYCAYHAgKVUtADOcCaRWuDu5++KSKo3b7Zp9yIAGyS2hpvnl0UVE184tQEivT7ucw4qwBbCel8DqB1+NiC9kIPmMUe+52z0srgocagyD0CiPiwa6ByGtHNyJ/Iz1fAl2F4a/qQlZiUpUnc+OKwly193lhslfXwmBeyJ59Q7i0fUuvsXgm3iAzewFQccKFgCwhJCTCULYNrgAU9qiRaEMNPugcVKFfej07Jq9fHTItpEFQVAGMQQ==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DU0PR04MB9396.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 02:32:16 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 02:32:26 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Hongxing
 Zhu <hongxing.zhu@nxp.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V2] arm64: dts: imx8mp-evk: Disable PCIe bus in the
 default dts
Thread-Topic: [PATCH V2] arm64: dts: imx8mp-evk: Disable PCIe bus in the
 default dts
Thread-Index: AQHcuEhJWXRYjvNtWUKzhDJQysY4nLW8fkWAgAB8n7A=
Date: Tue, 24 Mar 2026 02:32:26 +0000
Message-ID:
 <VI0PR04MB121147DEDEA2B8058666867F19248A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260320090353.1483418-1-sherry.sun@nxp.com>
 <acGN-QsB65Kbs7Gf@lizhi-Precision-Tower-5810>
In-Reply-To: <acGN-QsB65Kbs7Gf@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|DU0PR04MB9396:EE_
x-ms-office365-filtering-correlation-id: 2b3826ad-11b8-4ce0-4172-08de894d969e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 Y03syAzbRS3xEScJzEJPruIlIFCbiHaB9sHe9Eo9BsGL68k43+zU8f/O+FyQ3yrRfJgpPQtGW5CewTN/XWl0b5LiKzyRMCAuwO0c+eUNr+yoLIPEnibeU62DyeRzRJQEn/IHV7XmiBuKd2Z1Wnlg/7XO8y+whSL0qtUUM0qr5gAM4pt5DEGgjs1pq1vttxbUBd1Q4+8VKdBBlG5Tvn9vaTVRy82LsvQ2Gvg6OQaaIXCTweCXNr8gM4RX1lY5qQ9IPz/rRkW1cQPvNB5wjtX56HKDIosxIw2Xj7yFSoOHhVTXYKi7jo6msq3bEtFtYurAJ7k7iKZP/sHJymldzn6wq33qN6NQUL0wGG2veO5OzbQkLUVh7gIfsVdPl/MWbOqnl+E9s8Jke/TQlcWunT6+D08knoA0coopDdQpc4ao61cANSNwrrdpP63ARWJ13yFk0COAhwpIKbTN5d3l5n2Jv2FB/P9Xf680Sblh9iHwD67fixTz6WteFVuP+wFM1fcwmzkuv7K3Fr+SVxCB6oD/K5MmkA9nrcywTQqM+gprS9ewuJqhff1XpCTXZj2tBK0GBtrQBz8tSchsEwBzRJd7AgKs3Ns3zkjrpv1NHaqQRMkn9SiIOEFz0HR57VdkoldBR1pG11TC2JEhudrSRRGjboZh206UQFx3J4MIIgcCG7RJy+y6rAPK4zv9CCkO+XOjJXKyWMhHB6N73d7jffP1aIzOnJusxDnGeQxMMwEPG2EPKoD1wLEcNnmPBPBePUx6HzA0M7K9bSw/t+MgGo52GNl/XOoMWcCvEuAvh6SFz2Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HCV5Cj+/X7eWasMYwyqtkS94da179GUVhV7mpH/d9Li+AQ35IBXkM85hj9Eo?=
 =?us-ascii?Q?sNPKHnoNKau5gZrjbvOYPY2kCP486jbYu0gU7cWctbodo0J3a0N8u+Namx2J?=
 =?us-ascii?Q?Gm6nd3EGh03T709VRvRkmtyiHT7q1mSPrfzoVNTCCDH1eQfJgA13ofoE5Qne?=
 =?us-ascii?Q?Mkv9XWReomt1xgab5D/9AfvP7GthC/1jpEi3dw4U4aYbhLTVewN7ENnuh+cR?=
 =?us-ascii?Q?qILKbMKxuk1/8Kz5p+oeARLwVnUU0ZLlIE7JT6xOog3md64icCkeR+1uf/ek?=
 =?us-ascii?Q?HHuYq2pbBQQRhL+BQGgAEW+kLDFtcNedhk2dxlPlsurJ4JOGSLAPKezBTRCC?=
 =?us-ascii?Q?50dpAKfiK5JH8owckA9LjUQBK282eytk7ZyMEg1u2rM+mQekzjQBSlQT6aYd?=
 =?us-ascii?Q?UEx3NFDVYBvjJTyyPdAqavM0Dc7ljTiuzM3Cef97hqGxquqSdRWpz1/J8zUR?=
 =?us-ascii?Q?usAhFuXcsVKasbs2vCUroPOVYg7fUdtczxPQMK63cpV8wUwFI9503622Wu+Z?=
 =?us-ascii?Q?1o4z5Ie/Wsg5AGL6zp8qVM7zaAhpjt6UGeUcIdgUEYfpGlgl9M8e6hxgbFuo?=
 =?us-ascii?Q?WKkaNnyNhpL2ehMlMNJ8M9BA9sUGMz9xqcQEZR6gavtAsL3S7JJ9o9bl8IJG?=
 =?us-ascii?Q?WxvIgRzX4bBOHiLnUJFFi5gLtwGgFhU0lzhAozBFCmDhRjFEvja0Flr1HJin?=
 =?us-ascii?Q?MCld1DIOcHDkRtWVi4lhlvpdi4gipJWmDbFtOS/vgY4/FSIjlQgL4aGU1cSV?=
 =?us-ascii?Q?JHuP0CU3Ht0EqlPPRW/6revXJdXTPII2+izx9JbmdyzlQtuuFU6xSYb771Ev?=
 =?us-ascii?Q?kWkKFBAPMI9Cw5ICsMkN4I6YyJ2OY6KLJ2eOeWMNoAz0B0xlu+b8jn0N9fgf?=
 =?us-ascii?Q?29hUHGmbeInJFsc06QPHqQAV3wCU29Aq1nhCU6wuPtDW6QzLF6Hp7xdMe3Mn?=
 =?us-ascii?Q?6uZylSTwpmSTFp3B1s5fKToVs4fhf3nOU9DPHY34fZGK/YDAVmlYxrKxn4wF?=
 =?us-ascii?Q?E5qMenY800DFmmfc6zXx4tUpgyk9cWmE5Uh/DVxPOcfiK0YA9uvnoOC0Tfpq?=
 =?us-ascii?Q?1EHuOPZ6Sz9mcgxsNGX7OMiykQi+ylVnG3Df6BrffEoINJU7/VH8bQicEn/x?=
 =?us-ascii?Q?WvxfOTgrk6cjf34lsmI3sYxRo+gUeRvjcAOGsayVAt15y9OyDoU4LjfDGwKe?=
 =?us-ascii?Q?hfqHRAYL6vBGr43/9ogvml0nZAkZy7YBI4cak4suuh40WOreYVWa5VGRohB+?=
 =?us-ascii?Q?2BYPJxDb0O0+ii3DmiwxUcy4uQFEKZxnD4Tbvy4VZ7Mm+DlmwKYVQWqRVI3f?=
 =?us-ascii?Q?fYmGqT0vFPJfBauhMTp3Q8GUoGITZSF28rh7UVcAUUGYPUpYoRsR43l8D/rm?=
 =?us-ascii?Q?3L7vvI58LeZWd6T5s/7MBzMzSG7QkebtmAiJpurFUXhfmrgt5gCdZ4V2EVzy?=
 =?us-ascii?Q?4jOXZmsYs5MJWqhvrA3TpzwLgw/dk2eChKHITV88dx8J55Q6nCMKjjwPPp6n?=
 =?us-ascii?Q?5wH/FY8HWyhRqZiXQtnnBOF0X7NwW5yqkKxj37Hg4tMSwCDSHSbtFcY9x8E9?=
 =?us-ascii?Q?9/h538zWTDBMMN0uRmdKn+VI0HltnSfyAlhh4Wxv0/13RdNcg3vC37/DFoz1?=
 =?us-ascii?Q?ern3d1sVvjar9y2YlnuLrrBAQgopugmRssyqrrnKWJO17X73419w+tNLcs6a?=
 =?us-ascii?Q?6l61to1TB+iIWRRPMPr5fKeqYYyvbgJOfGmb+R2kuWA6ef47?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3826ad-11b8-4ce0-4172-08de894d969e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 02:32:26.5190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biqJ760sj3fYe/l5g5sTG6X95kNfCJyL2RVU3OgO4mT4BbGMn6f3uTPv3AcdHin6eg1M+aUY7QTFpN8Pa3YrdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9396

> Subject: Re: [PATCH V2] arm64: dts: imx8mp-evk: Disable PCIe bus in the
> default dts
>=20
> On Fri, Mar 20, 2026 at 05:03:53PM +0800, Sherry Sun wrote:
> > Disable the PCIe bus in the default device tree to avoid shared
> > regulator conflicts between SDIO and PCIe buses. The non-deterministic
> > probe order between these two buses can break the PCIe initialization
> > sequence, causing PCIe devices to fail detection intermittently.
> >
> > On i.MX8MP EVK board, the M.2 connector is physically wired to both
> > USDHC1 and PCIe0, however the out-of-box module is SDIO IW612 WiFi, so
> > enable the SDIO WiFi in the default imx8mp-evk.dts, and provide a
> > separate device tree overlay (imx8mp-evk-pcie.dtso) to enable the PCIe
> > bus when needed.
> >
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
> > Chanegs in V2:
> > 1. Improve the commit message to clarify SDIO WiFi is the out-of-box
> module on
> >    i.MX8MP EVK board.
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile        |  4 +++-
> >  .../boot/dts/freescale/imx8mp-evk-pcie.dtso   | 19 +++++++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |  4 ++--
> >  3 files changed, 24 insertions(+), 3 deletions(-)  create mode 100644
> > arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile
> > b/arch/arm64/boot/dts/freescale/Makefile
> > index 780682258e71..107ca270ef32 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -333,12 +333,14 @@ imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs +=3D
> > imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-
> > imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs +=3D imx8mp-evk.dtb
> > imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
> >  imx8mp-evk-lvds1-imx-lvds-hdmi-dtbs +=3D imx8mp-evk.dtb
> > imx8mp-evk-lvds1-imx-lvds-hdmi.dtbo
> >  imx8mp-evk-mx8-dlvds-lcd1-dtbs +=3D imx8mp-evk.dtb
> > imx8mp-evk-mx8-dlvds-lcd1.dtbo -imx8mp-evk-pcie-ep-dtbs +=3D
> > imx8mp-evk.dtb imx-pcie0-ep.dtbo
> > +imx8mp-evk-pcie-dtbs :=3D imx8mp-evk.dtb imx8mp-evk-pcie.dtbo
> > +imx8mp-evk-pcie-ep-dtbs +=3D imx8mp-evk-pcie.dtb imx-pcie0-ep.dtbo
> >  dtb-$(CONFIG_ARCH_MXC) +=3D
> > imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk-lvds0-imx-lvds-hdmi.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D
> > imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk-lvds1-imx-lvds-hdmi.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk-mx8-dlvds-lcd1.dtb
> > +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk-pcie.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk-pcie-ep.dtb
> >
> >  imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33-dtbs +=3D
> > imx8mp-tqma8mpql-mba8mpxl.dtb
> > imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
> > b/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
> > new file mode 100644
> > index 000000000000..4f6546d442bf
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
> > @@ -0,0 +1,19 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2026 NXP
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&pcie_phy {
> > +	status =3D "okay";
> > +};
> > +
> > +&pcie0 {
> > +	status =3D "okay";
> > +};
> > +
> > +&usdhc1 {
> > +	status =3D "disabled";
> > +};
>=20
> Please use one overlay for both imx95 and imx8mp to enable pcie0 and
> disable usdhc1.

Hi Frank,

imx8mp has a specific pcie_phy, I disabled it in the default imx8mp-evk.dts
and enabled it in xxx-pcie.dtso, if we use one overlay for both imx95 and i=
mx8mp,
is it acceptable that we need to keep the 8mp pcie_phy enabled even in non-=
PCIe
usage scenarios?

Best Regards
Sherry

>=20
> Frank
>=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > index aedc09937716..f09335e6388d 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > @@ -763,7 +763,7 @@ &pcie_phy {
> >  	fsl,refclk-pad-mode =3D <IMX8_PCIE_REFCLK_PAD_INPUT>;
> >  	clocks =3D <&pcie0_refclk>;
> >  	clock-names =3D "ref";
> > -	status =3D "okay";
> > +	status =3D "disabled";
> >  };
> >
> >  &pcie0 {
> > @@ -773,7 +773,7 @@ &pcie0 {
> >  	vpcie-supply =3D <&reg_pcie0>;
> >  	vpcie3v3aux-supply =3D <&reg_pcie0>;
> >  	supports-clkreq;
> > -	status =3D "okay";
> > +	status =3D "disabled";
> >  };
> >
> >  &pcie0_ep {
> > --
> > 2.37.1
> >
