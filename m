Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013067.outbound.protection.outlook.com [52.101.83.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDB4388E43
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 02:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774320343; cv=fail; b=rrj2KdBtd0/+JZOTxSY87dgeSQutI6gwffunAuKVI0bTu6/+Qlzgx1p0MLKd+YRHzm4oVZpoLP/vPZgxpQ0lHcgcmkTvMYK1781iPLpo47Z0VFXe6PgrVQ9Vr0xDSL7AbR0EQ4/qHyOGiytgCqkNOI2lGTsfVQto1jzQ6lGwuOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774320343; c=relaxed/simple;
	bh=sRoTKud8KlVbGSZEkf2+Rv+fK5zEZ13sqZEKuc/+Jn0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MT4UzILsDftLaMZmPxcpiyoxqkDeykGcrWEM6fUdf30Gc/lZKlN3BjBTOcv3/8iie7Et2Hf/2YfhWOklB/N2yC5GKr+yXpUIxRiIRJttrRXHPNEnNGfkUUPYreamqULz8wOO2bp0+7bOWxW0VblT7mqWWFc8pQvX0fK5a9+tjqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FeeP2Q83; arc=fail smtp.client-ip=52.101.83.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FeeP2Q83"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmAv6EjqXS1s3t8upIrYUKIuVSBdcp386qzmAYqAIIlYADeWKFKpwb6EViAegIbq4ikRCuf579uw1O3jmLNhu+0+UQpKSw89UoSB8p0Vk3sg7Ufe1GWzFUNhEEWDRp7PXIxqFpBqlunOdr5QLDEz2an5BaRBJ4SLU/qo1hqeNSnuN5B+OIctFl/v0TEh8i2NlaeoBGeE+FAyTbVGucnDyDnjmCS+OqSbOXfr6qhpNJPT+gbyYfpiEtKrCmcbF+mXNTszai07UBq5Z9Ig9RHFweNAD4LgVK2qFitk9Dz1tH/R38GCtIk1VmL2k6fwOddQjlU2NR0dZ5JFkuEeMQq5Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=435cIZNlzdFTlJfxS8UaRiY53dd/RBy70f3AXSP5hw4=;
 b=zS4TUhgPmWQLPmQulDCRHTNiBtPT5+t6MzF5Pymiuw3uGcqrhpcuV0YTtamiXp2FMlvaqlVdN632WeGHH1+NIWDF1SMO6InnSJHdBVG0FYwi5V+lLUUJNHqI9kdg8/jYFznhnMCUKHZ6jJ0g7qu3COXWPTWbcfKKH1gV9D/uZTYfzu6VVn22XsvjGFK8e5VUJx/2Wp3PNYP+fJ51E7ZGNgaePmQhYyTUgUpf+eFYPdEXMopE0dHJmvfSeBxvQnWnsdREshc3u9b7X1R/qUO8lrIeIBvnAbvM1ZAdEIJ8Yh9aWMGhM4GXuC8xSfsu2QQfSq0auVSnLHptYue9f3kBfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=435cIZNlzdFTlJfxS8UaRiY53dd/RBy70f3AXSP5hw4=;
 b=FeeP2Q83+bj+S0bO2bZwBxq7lp26EzTOCjSZENDQj+RDjdZA+f0Q4sR7OW8N8Fe5iBIKFiOK5QDB32WmqsW6iOWGcjc1wFP6cLyN9OqM53r3HLHI67gLLfMc7QTcmRbTPNoz5c5d5eOE/7PPVdpW5aXLAW20AD15qN6cLEXwcMZSj50nElTyadOMcp3yF+wXuhKCKEQP1Yoo+WzY7ios10SYpeXo+Tkwyc8zF9veBSuH43MhyEPmwknVzg8nvEUotYPvc1cVnug1HNVo3RRDuc+coQfAzUdPYtJJCtWivOzUns+NYKlhz/sFGa7kJx7QmTco4zJ7XabxuUddu3jZpA==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PA6PR04MB11988.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 02:45:14 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 02:45:39 +0000
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
Thread-Index: AQHcuEhJWXRYjvNtWUKzhDJQysY4nLW8fkWAgAB8n7CAAAOjIA==
Date: Tue, 24 Mar 2026 02:45:39 +0000
Message-ID:
 <VI0PR04MB121140F94476DBC9D2F845ADC9248A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260320090353.1483418-1-sherry.sun@nxp.com>
 <acGN-QsB65Kbs7Gf@lizhi-Precision-Tower-5810>
 <VI0PR04MB121147DEDEA2B8058666867F19248A@VI0PR04MB12114.eurprd04.prod.outlook.com>
In-Reply-To:
 <VI0PR04MB121147DEDEA2B8058666867F19248A@VI0PR04MB12114.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|PA6PR04MB11988:EE_
x-ms-office365-filtering-correlation-id: a5dddbe5-58a6-4daa-a2a2-08de894f6f67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 dbNqS3Oz+F/yCGT5WtwPsmly4UUUbg3zYn8OGbSjObbcjCFUdOoQYAx3kRUxi+KOnzIHg9wSxIloiHSpj7tuXMSEfs91l9DBRCXG5pl9W4/a2Em4o2icHfLcXHT8UJFZUlgny06USgRSLIL5XtERP0I0QFob/aD7cdv+pt7xi5Ot5gPh0cCeH2F/qw7VzMS2flxtMS//+ufMh4pca/vbIBKzqppbODoKCKX58++gXd363+K1CEoLA5FRGdPlEMMMv5TzfbCSbnMGiPJzR7EQkEAHNvFwtOt43Dn79Tz5EyFBXb1XTvA3oZxU2ymYtyCrWLfnyjepLR0YCgI3erbeUdOe/7p1/gEfZagcimxE6s+2g2xp3m30arw0l10PD39SIPGqSKLkaZrz6WFiD+nprSr0aieFfrFkbXnHkRPXmBtGsbTDaJoOCvT1hhUU8qs0IhKkTFclRdY+OxQqYZC4SZjxtn0B36OTAlsQVA4CJZ26lsr03VerfujRw4YVFIonvDjKwFmCKiACVyJ+KoATCbxRqOMVvKbvVGx9jUBfHRadWB+lmX25bjfA10zSvgYfcwamflIlf5MSJ1IXmwUq8sj8PyUdqfXtMKSknJknMtyCzJKyzfui5CzQOXYesT8BX+Z3hYXfd3wP48HoLkPj+GnaN4s6/Fn4GpOlBOinATXSfCTJ0ZZfD2mhctPcR5EUtma3xj1OuBIqgZgXCahKLc4TFnxVq3ug4hB9w0zRtP2sLw7pLfnjGbo/u6QBWbTdNDYLVxDdbQlk4RGwiYyIK7h1HBlX8gzTqHL4wcCCdxE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IqBFB0Fu+YRBP/QxNqR+yinxnPEdAkYJ3ste5LouxIxK5nXI1VAgkMZW4mew?=
 =?us-ascii?Q?caoWthRJyyjRXncgu8kZUz32b06W2c4WyAsLkLhvsY6cEAT4MTyjO0PihaRN?=
 =?us-ascii?Q?G4GGAV18UBWQ/xYV8vSgcySVBkX31159DygBNCOla1Lyai6NSwXRlg6Zfc7z?=
 =?us-ascii?Q?AjtmbOV1KW/kQCh+yOHkB7aKa7ZwxMAUw/c6fVzoR+VtfUBH/O/ZbzYAqqF7?=
 =?us-ascii?Q?rsGtmaF+/TJG4KmLbVDjUXtkBsGmN1UsYJGAaGpVrxnT+myTiqzVaHWndOz9?=
 =?us-ascii?Q?0RlkKMFF9oFBPjrfP3u5yj8+zZRrB5lCbaLHBNzrzcJYfKUv9BeO1YvoCKyJ?=
 =?us-ascii?Q?uRaeERF4xn8uNXgdpqN1oKDDkZNlMQNJFa5a7FHzERc7gKx+G2q6NtvpRBx/?=
 =?us-ascii?Q?MoLiEGPyIkUGtLvhawwToIFwn1713EYmjGa9N7/eJtzJwHGwrOpB8yCCWubv?=
 =?us-ascii?Q?DFXW9MvN5Pf7wDexZBqBJifAntMixV+jgat1CsAiqanRLHOSZ4nUejunpDqs?=
 =?us-ascii?Q?J5lAn9SOeJpW16SIRshi2hWDqJ6io3x1UvIYK4HYNiW5CGZCgQOFjEJx3j5D?=
 =?us-ascii?Q?RIgtGSva1r8+IXYiH7TtqEMK5Sxt53d7L/n4/WwKxuYvnCTK/znSbZ2L3yp0?=
 =?us-ascii?Q?OvOvvGT6Fv+YQMSA0+x2yX6Ot26F9vs3ayHIvLceSldbSaTMO0LUAs7x1guO?=
 =?us-ascii?Q?Tba0Gc3X+lwRkAvmKRqs24q/ky+oCIX+d3+HxnTk05sElTOzGNXzhugoDIh3?=
 =?us-ascii?Q?gc69G04m6AsbfggLA7NW01daSKvep5O9Rsm9vGqmPJ36tkrvfZEskyyd4Jd4?=
 =?us-ascii?Q?4TyzJ9VSYL7eDjEHzYH8zCFLXnDeW2+4z6jx9afNJcN/HgxFSrGoCbdcVd8k?=
 =?us-ascii?Q?pXq3RR7qyIu7HCBqB0J6j0P43i4jnzf04moZgQ7m1hhVzrpgoaz7ScTHVjr9?=
 =?us-ascii?Q?iJevwX0R3jJZvMbnIcIZLcVG7/KiOrkOQU3kRfYMApTO0rL25qopD1fIX1oa?=
 =?us-ascii?Q?ykJXKaEx/DGrK+ciWtgSWlWhBjKpz9o3iaakty9fZ2RqXLIpNT6Hf78HIuOJ?=
 =?us-ascii?Q?97ud9TYiE0T+Qmd3bHU4KZjfZ7sMtDYfTd15lJmzL1OdK1TqwjkYRaUFu1vL?=
 =?us-ascii?Q?R/+YRVuW1xFrrLQ/cGz5MBO9xheLc86fRe2CGjNxSAnOnggjY8vLGELerzFo?=
 =?us-ascii?Q?UzGipSMYz1/GojJbuGfKDEbHzsDCIIiqvdMAO0HWmo7bAObgdVgO+54EK0bQ?=
 =?us-ascii?Q?190KKSH44kdYWe3xzEw731mCdJ3xauDwAf9+FkSwAtf8UB3nhBBtx/Mwg6+9?=
 =?us-ascii?Q?n+pSHBQuZ8dHGl+w8Kgbw+1xQrFj3O3AKsjfyPpl1D5d3yf9giik01KgtNfX?=
 =?us-ascii?Q?22EqPXF9zyEfjicOj9ves2auY2EUjKv9LIqeEtqGNLL9Su7npUbLxSSWKvSW?=
 =?us-ascii?Q?x5FLh5aA77Nz4pa/r9Etm+x67gmzEqzJrkW6+BHD/kq3yQjMrB84BIDAZVSB?=
 =?us-ascii?Q?Bo0Ktl5wjImHlVc84E3fhFxuZyInfed4qXiucWThQXFE5GXycy8p0NHnxVeJ?=
 =?us-ascii?Q?dIjcpd5FEjM86aTz5Exgzu/2PSnhxDTFNJdRVxnsOghBRTw6z5hSMuETbd4I?=
 =?us-ascii?Q?91DwTgGsqNUg/AwoBbSfbpdV3UTsJlUoQnuvN4pxWMFjyABMcDdpcUKsM9lv?=
 =?us-ascii?Q?VTz7hE6wu5wgKmX/unMBvFaZcaBMxhYXUAmfP0X2bsNe4dV5?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a5dddbe5-58a6-4daa-a2a2-08de894f6f67
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 02:45:39.7259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sfWvHiVGD4+BjKsgyDvX8iTmMPz+Gu5dp7bzDj87mA9e743TaPqxWdLEe70kTFgeM8YejvURLLd0UheSWyTP/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11988

> > Subject: Re: [PATCH V2] arm64: dts: imx8mp-evk: Disable PCIe bus in
> > the default dts
> >
> > On Fri, Mar 20, 2026 at 05:03:53PM +0800, Sherry Sun wrote:
> > > Disable the PCIe bus in the default device tree to avoid shared
> > > regulator conflicts between SDIO and PCIe buses. The
> > > non-deterministic probe order between these two buses can break the
> > > PCIe initialization sequence, causing PCIe devices to fail detection
> intermittently.
> > >
> > > On i.MX8MP EVK board, the M.2 connector is physically wired to both
> > > USDHC1 and PCIe0, however the out-of-box module is SDIO IW612 WiFi,
> > > so enable the SDIO WiFi in the default imx8mp-evk.dts, and provide a
> > > separate device tree overlay (imx8mp-evk-pcie.dtso) to enable the
> > > PCIe bus when needed.
> > >
> > > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > > ---
> > > Chanegs in V2:
> > > 1. Improve the commit message to clarify SDIO WiFi is the out-of-box
> > module on
> > >    i.MX8MP EVK board.
> > > ---
> > >  arch/arm64/boot/dts/freescale/Makefile        |  4 +++-
> > >  .../boot/dts/freescale/imx8mp-evk-pcie.dtso   | 19
> +++++++++++++++++++
> > >  arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |  4 ++--
> > >  3 files changed, 24 insertions(+), 3 deletions(-)  create mode
> > > 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/Makefile
> > > b/arch/arm64/boot/dts/freescale/Makefile
> > > index 780682258e71..107ca270ef32 100644
> > > --- a/arch/arm64/boot/dts/freescale/Makefile
> > > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > > @@ -333,12 +333,14 @@ imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs +=3D
> > > imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-
> > > imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs +=3D imx8mp-evk.dtb
> > > imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
> > >  imx8mp-evk-lvds1-imx-lvds-hdmi-dtbs +=3D imx8mp-evk.dtb
> > > imx8mp-evk-lvds1-imx-lvds-hdmi.dtbo
> > >  imx8mp-evk-mx8-dlvds-lcd1-dtbs +=3D imx8mp-evk.dtb
> > > imx8mp-evk-mx8-dlvds-lcd1.dtbo -imx8mp-evk-pcie-ep-dtbs +=3D
> > > imx8mp-evk.dtb imx-pcie0-ep.dtbo
> > > +imx8mp-evk-pcie-dtbs :=3D imx8mp-evk.dtb imx8mp-evk-pcie.dtbo
> > > +imx8mp-evk-pcie-ep-dtbs +=3D imx8mp-evk-pcie.dtb imx-pcie0-ep.dtbo
> > >  dtb-$(CONFIG_ARCH_MXC) +=3D
> > > imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk-lvds0-imx-lvds-hdmi.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) +=3D
> > > imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk-lvds1-imx-lvds-hdmi.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk-mx8-dlvds-lcd1.dtb
> > > +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk-pcie.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk-pcie-ep.dtb
> > >
> > >  imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33-dtbs +=3D
> > > imx8mp-tqma8mpql-mba8mpxl.dtb
> > > imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
> > > b/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
> > > new file mode 100644
> > > index 000000000000..4f6546d442bf
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
> > > @@ -0,0 +1,19 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +/*
> > > + * Copyright 2026 NXP
> > > + */
> > > +
> > > +/dts-v1/;
> > > +/plugin/;
> > > +
> > > +&pcie_phy {
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&pcie0 {
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&usdhc1 {
> > > +	status =3D "disabled";
> > > +};
> >
> > Please use one overlay for both imx95 and imx8mp to enable pcie0 and
> > disable usdhc1.
>=20
> Hi Frank,
>=20
> imx8mp has a specific pcie_phy, I disabled it in the default imx8mp-evk.d=
ts
> and enabled it in xxx-pcie.dtso, if we use one overlay for both imx95 and
> imx8mp, is it acceptable that we need to keep the 8mp pcie_phy enabled
> even in non-PCIe usage scenarios?
>=20

In addition, another difference between imx8mp and imx95 is that imx8mp con=
nects usdhc1 to the M.2 connector, while imx95 connects usdhc3 to the M.2 c=
onnector. The usdhc interfaces are different, so we cannot use the same DTS=
O file.

Best Regards
Sherry
