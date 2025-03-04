Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012041.outbound.protection.outlook.com [52.101.71.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728ED299B2B
	for <imx@lists.linux.dev>; Tue,  4 Mar 2025 15:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741102897; cv=fail; b=VH163P8Y/+K1WZI7PWyIn4FOm6Hf+vVD5jE1u8u/VW05aXm0VO2uxV17G2R+tIC5C6QnwN2ehGFtiBhin6Ojnez4rKWLYQbftJdypzFpr4hDWAPVZXAYpnoYh+FWVgvd0hrRk/LrCGFFKDG2qnIN/Oa95AJc+7qLjhVhp4XNz/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741102897; c=relaxed/simple;
	bh=+eekvccBYTPCyV0bJAMaXV9oUkncWAM71unuB9nKWvc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sfjQApAkwdtyhy6UM68QTCFVHHp0xh0u6jaDAeF7oT1shVdiMNrFE1em8SIWKxqTKBzWa3NR1ruhiq5IES5yvtrB6xz2O0j8CTO0985SzZaURre3B/Uevm46U8g4CTYx833tqKludgqXU7eWjA371mc9SpHvzRnPCUjLwi2hP/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NJVYI7Cd; arc=fail smtp.client-ip=52.101.71.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NJVYI7Cd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FM5XrJxka4xB0Prj1BeIzwfdeJvBeNGN+LPk6Oz2fTyXhJmP0clBGZPxxgTXIImnXlZIv+EegdLvnNM/qknih9NzVWlAF7HIphjKKXhXs11QhGSLspTQ07FbEpxwjnnRVqDRns/nGWWQYcqM1C/daNGS1U+RXXGksfss2+77rRkuPSCe2Ptv/0tuzOInditBlpfI75ttSLdplFiS+wbYy1FPtopQMiLU8psds+8Sh3oQVVslE4nV9o0F8xPW0rGZLhZT7uWnBsYOX4jYCrDM6M2W+I/FDLNCxxest/vZ4rKqV+UChW9kIu45UAIEQcLfmJur02N0plytBkcg54vttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+p2//aRdsiuoavzRbUf/RUw92RMdL7Cs3enGZgkaHc=;
 b=ZE+CpEwJlE4xn1lWCA9+cSwVRJyXuTqz01gCqvuvLxp0XSwKpT8x71NpT1S+hyodpA3KlceLWH4kUldPzIBxlJ46FyeI/GQO/mFTxSKQz8GOM2QDAJrJnRR9ao0BAANUv4JXc4ODJCATScL0ZG0FNAfwCpdvKBeUm0dVSNBqugmYhANE/oFJzaz3CPzRqjT+phRevx6IoX3PIQifQH9s9NRZBipe7wii63mAJX2tZUqeytOITeUuvgQcLU1BLtU54F0fq+Y1DKD7r/lfyDpXyOwR/vcuAYrW9fRoHgu1l5QoQPiDiPh/3GyCUGlz/5aKTnhnaVHQ0L5jU7uDLUEGgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+p2//aRdsiuoavzRbUf/RUw92RMdL7Cs3enGZgkaHc=;
 b=NJVYI7CdUWCQ9dLcl755xW2DVMTD34dcugvhk1ZVFgbtX6YVmogx5RWlCsC3ziBbugU/dCa/ogvI3WVZZYPbUeYy9pQJMYPOQuk56/jyXvQ3luKkramQuv4vszXKs2F0W59iFEFLwrbEfBILhpNIqcZrHOLrMcTouL9ZEv3AjQK02kr8IapNWJGsoXJGyUcWA+ENwFjgQ8Q++ZAe0Cxq7ktEV88n5Zp/L4jM8MXJq4qghV4mWt5HYBvQZ8o21vRYXMhGO+y8KSdmZQU16zP8mFYFZB5JdZeSWmJbEuBy/jtI0qgY1bR4+arrsc6G9JOGoeFYxc9UXdltswUHv2wFzQ==
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PAWPR04MB9887.eurprd04.prod.outlook.com (2603:10a6:102:390::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 15:41:32 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 15:41:32 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH v2 1/4] dt-bindings: dma: fsl-edma: add
 interrupts-extended property
Thread-Topic: [PATCH v2 1/4] dt-bindings: dma: fsl-edma: add
 interrupts-extended property
Thread-Index: AQHbjOgzpPILpRKVCUGBCMqX1iCwX7NjGcSAgAACl4A=
Date: Tue, 4 Mar 2025 15:41:32 +0000
Message-ID:
 <AS8PR04MB8642F46C61B544D4CC98F2F887C82@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20250304093127.1954549-1-ping.bai@nxp.com>
 <20250304093127.1954549-2-ping.bai@nxp.com>
 <Z8cboXGsy1uyJwgf@lizhi-Precision-Tower-5810>
In-Reply-To: <Z8cboXGsy1uyJwgf@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|PAWPR04MB9887:EE_
x-ms-office365-filtering-correlation-id: 39ee981d-2c2e-4d62-ffb9-08dd5b3309fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?h2LItTnjjdG01ppH1l4vLpVRwUO1FeqgImuMexbDbrZ1IQKpakUdkuQRMZpk?=
 =?us-ascii?Q?QAZMqsBpecLgUfCIY8xjOpT8v971HJ2KMzhKAdy+NBgSNfJP/EuGdQbwnRlq?=
 =?us-ascii?Q?fRQyBU32rMCuxEZJoxBreXOVfburdokDGIwAU49YProJlM2ioZs7HK8usHZU?=
 =?us-ascii?Q?fkwabiA4SfCnLGQO4s89JlUO4s0G8ign2DbyPclKg6T0t/mVtcInRsMPf7zL?=
 =?us-ascii?Q?AYn3Nu0l0FLDQeoF1PIZX3LDiFd+FYu8s76ZCzNc/G8SV3ViCsoTMEVZrIzS?=
 =?us-ascii?Q?SnUD2S2kZ46ex4oGNiimhMZkie5tTUhV3ImdQrNpZn0tPuUEcHDLxzpM+fHv?=
 =?us-ascii?Q?R+J7LD4BV6eJBN+AP6RUD1Dg0oMXVjGA8p833hFeRl779No3uV3+TzqFV62a?=
 =?us-ascii?Q?OKvA/GzO2z5rGIjaunBj5UufKlPfBe0bv8JV6ZDDcQXN7hVvpVv8qqYEzMGJ?=
 =?us-ascii?Q?cDazAXil3emmA+I2dulDlXjudfZ+5pepXNoRlSTj69GD5Erco5K5vwo7N6ZO?=
 =?us-ascii?Q?v788sZV+gcK8On/VS5+ZYwy67qDrp4Pybgtu9UMI6P9KscsPAU6JAc1bRAOU?=
 =?us-ascii?Q?VFieU9SM+gkYStzhaT7cf0u5H6nsKtXOlbZzEBWxUW3nBkctaPdFnq6VGxOS?=
 =?us-ascii?Q?HMaK6k8/eE0zVNwrK7zY7tY71/FTbPCjJWZ8xwCZf86TAt3gOUUbUKYR3ut9?=
 =?us-ascii?Q?3ZVPJiRjcRZ2Rk5pp8D3S7sYCNqqlDDZ4tmoS4rxcysfnA6EGiE386ICbduH?=
 =?us-ascii?Q?5oxPllQjJuWuaN/h4kdpVmKUu7zASn1erIhQpvNXvHPPikwri/PuXKo7JfcJ?=
 =?us-ascii?Q?I7eTAlaC0CiHwE1EVg7+MXju5lvp5/F/aLzAxmoS0xDRuzFLNKpMR4QP3T7T?=
 =?us-ascii?Q?ZFSIlZ8Dfuuzk3VI++pIueF3ehOso1td4YNAQuhxwlmiqXJ5clxqzs2EZD7f?=
 =?us-ascii?Q?df/eLM7akcNLy/UcyFfspczEonU5idX/eZjqMyfVllHzHdFhhjv1K+ugZEnT?=
 =?us-ascii?Q?p7uM0jQkR7UmgRnu0Ug7pMpWgNDUtBMlQKtVOkR7Ru5sW2teqJavGTSdsLeL?=
 =?us-ascii?Q?WTcaNwYoee5H0as3GSwyI0hVumYVnjFherSFKRpzTXj7LBnpMKeaqNTZ2oW0?=
 =?us-ascii?Q?EtjiCaDwSiKZ7f+74A/vwMiTkw5b46yEAyygT1wsERfFD6C7hZkaLZhQQEd1?=
 =?us-ascii?Q?dyXYI08NVQCN7uo3DXv72TYUFDThhrmPj+EP+AgHTk3lHY2uQq+P8I+69zhL?=
 =?us-ascii?Q?CEfONrBMPRR1U4CYXi5Ws1n9KFSd1+YiDxee3XmKaEZUSVrjkFau/esjxX9n?=
 =?us-ascii?Q?FlkOihj9ff6GX184wpiMVgRbKEojMYL3ptl+sR19KOnqH4sqBIZi2slSheq4?=
 =?us-ascii?Q?c3XBkJFTn0VEonL8RQP+Iqtl2zP3i8U5s/NoAXBAbCrKP10aAaxcTCYNtlBO?=
 =?us-ascii?Q?J9cDYAIKlH7fWr735nr9iVuHiWp2NMON?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Jc7v0k3H59DKF05QvQfRfkqzHchsPNuSYeOG0ro0JAYx7buvEoYBLIUyMJcQ?=
 =?us-ascii?Q?3GeHTRDjTSiTswY5V6cidFvMxGD+nRy5gsAa2fCa5dqmhPoD8J1ifnRHsn56?=
 =?us-ascii?Q?IjhIgiUMOpjndh6kjbWsoW1tO3zsOfDqBjkBzuK4a6h/zvwKtWt/7OTI1oFV?=
 =?us-ascii?Q?hCA3ZBdK2KUB80VtL3Ufev9msTaAF3wKaGR1dNhTYzDuatNm8OJbdGRFEIWT?=
 =?us-ascii?Q?x7ABBsjMX+PZ6iODS0l/D2E9JExyBAZkPR09YmvdBjHmUNycHn9B+wydLtuI?=
 =?us-ascii?Q?shmbVxalSJ3aMJBgR4CRAfgt9G/Ixoh35CpQoHS3ldTXAGO+aQzCiv8j3JAQ?=
 =?us-ascii?Q?nzVLhmK1ip5zpa0XvouZCPUNTswU+PjGfghu0bnZI32hmM1axmaSIahbBDzD?=
 =?us-ascii?Q?gFoqG7vf0SFuEsWrntvI6Ee0DR8Ga5Kwkhp/pqMapnjkqbmZZV936DuyuWe+?=
 =?us-ascii?Q?sc5AEL6CQCeHyXbfhnD2SCLZVqhPmiCVD/SNjHZlzM4DreeVsxsNcQGl7DrJ?=
 =?us-ascii?Q?GuHRUUvb4xLhQr2WR1wfInqXyMpc6CvyWMEej3tcz2FCStUuoPzJehXfRSuL?=
 =?us-ascii?Q?Z0b3CHxVCFUkZTpgGRDA6C2PXYPQPCBCYpIaCQOPiSAUy8DKOPX9YVIeP2YY?=
 =?us-ascii?Q?uyj8RnCxdAqnhTonLLiUuGrtISquNbfjHyt8OH3tBxhXiy8oiQnS2Vxi9nIy?=
 =?us-ascii?Q?TjtgDltTwgEole4xmFRykUft0ApxixkolmIWjaBw1t5f1Rw561Vnl4W9lHCO?=
 =?us-ascii?Q?a2jonwThGNduucolrMFdVs3M7WtSzynCSeNdlMr1fvG07ktD1dtKYSf8w2d0?=
 =?us-ascii?Q?23/Jgug1hKGKKFfyk2+jn43lzFQcDqydaVLVxG+ZoLNM/3K8fFPD+2XYkZvF?=
 =?us-ascii?Q?3HZHAmiMmA6RjTlNWSJDawQz1X8WqbYyNALreRzR7nRq0QzoJpGK/2R+YAqg?=
 =?us-ascii?Q?MjelJt3DBpTs0KyBjIr9UR1fV3jy4eyA3yzJxh+RqJR+HPQqcufpTI8Z+Dnm?=
 =?us-ascii?Q?2pEMBBCjvHt1oNm6PCgzmOAdoV40wgy/JQCGPSw+GWnsuwMDY8nN+LjyEq77?=
 =?us-ascii?Q?GzqZ8tF5t2N3SpLCEJ2BxO8LY12GZmdjgJb5bH3OrpSS5pH717xutG4dVtsk?=
 =?us-ascii?Q?sapc39oeON8aA0uiPZ46vAzKyBQTalEk3Rr7nYHOe/aDU+t9fTv3sEs3aCuT?=
 =?us-ascii?Q?H1NH20JS/+kV077z6t1f1eNslOC/NwVgo4uTg5RjE8R0vSIHv52pMib0Fn56?=
 =?us-ascii?Q?iuMJ5Y0jiKzSK8ANbQM2AmsifXEaf7OO6bI8NbpdSBxRayaiEedU3oFglIeK?=
 =?us-ascii?Q?8YE/m006tCVOKsRH891vZ4f2vY0uQvtVJ10YrxZWwQZxUorq0LfZ0agGupK7?=
 =?us-ascii?Q?DbB1CsOLfGV0lsYZxG7uKJQDc67I6GaLpUsFhiuLNKgGyQTL8es0gQ/HDfRi?=
 =?us-ascii?Q?ZgpQIGXFbalRVrzxBgs2fne69EcmT9zUYMrHsyg6WviPh5a4Wfu+3+y+Dgz6?=
 =?us-ascii?Q?3syTxBHVj2Bn2PAtLgtKsZYM1rfNaEYvdGkVQeI3xihmFnbBTcVNLE1yUfgh?=
 =?us-ascii?Q?In88wOS4W1zI8+CVQZ8=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ee981d-2c2e-4d62-ffb9-08dd5b3309fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 15:41:32.5019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D5xz7mvJV1YimB6bPEPJFaSO3GYpCwplmTX++a7LpbkM5bxZPOPMKWZUjF5UETHUoZoJ7U84NxSxkaJ1+E1EHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9887

> Subject: Re: [PATCH v2 1/4] dt-bindings: dma: fsl-edma: add
> interrupts-extended property
>=20
> On Tue, Mar 04, 2025 at 05:31:24PM +0800, Jacky Bai wrote:
> > Add interrupts-extended property for edma that has multiple interrupt
> > controllers used.
> >
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > ---
> >  - v2 changes:
> >   - newly added entry
> > ---
> >  Documentation/devicetree/bindings/dma/fsl,edma.yaml | 11
> ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> > b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> > index d54140f18d34..549afb8611a9 100644
> > --- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> > +++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> > @@ -38,6 +38,10 @@ properties:
> >      minItems: 1
> >      maxItems: 64
> >
> > +  interrupts-extended:
> > +    minItems: 1
> > +    maxItems: 65
> > +
>=20
> I suggest add error irq later because optional err-irq patch under review=
.
> https://lore.kernel.org/imx/20250228-edma_err-v1-0-d1869fe4163e@nxp.c
> om/T/#t
>=20
> Frank

Ok, need the above patch ready first, then this patch can be dropped, I thi=
nk.

BR
>=20
> >    interrupt-names:
> >      minItems: 1
> >      maxItems: 64
> > @@ -87,9 +91,14 @@ required:
> >    - "#dma-cells"
> >    - compatible
> >    - reg
> > -  - interrupts
> >    - dma-channels
> >
> > +oneOf:
> > +  - required:
> > +    - interrupts
> > +  - required:
> > +    - interrupts-extended
> > +
> >  allOf:
> >    - $ref: dma-controller.yaml#
> >    - if:
> > --
> > 2.34.1
> >
