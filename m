Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013041.outbound.protection.outlook.com [52.101.67.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12FD1E9B34
	for <imx@lists.linux.dev>; Tue,  1 Apr 2025 08:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743496714; cv=fail; b=gxRHqGoKbfnQWPKoOjKF4gonuTImGmxeUbSJ2z++SEDO62beacfA30P3usmnO8qcuI7xllqLuP52DhTN+ZCQ8vbQpjOlQZHPAZmRQdAFqEQg3ZhOlZMRoERtngTeg3WdOI1Yq2QUM8viInVVJ4PpWR9p05d2GvPDDqbmS0og6+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743496714; c=relaxed/simple;
	bh=sl+fakk1rd+OIzS56jjih5HytdC/4anI8EwLYtQigZE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Mvtr5F0KHIgt7DXlHCgZIEeAY0FAumBGKjE10wZiRmH/caxJtYzriyOSrFsZatnqSMVTJi6GiOVnz6Nf5Yr/tqgsWu60HYHRWoed2BNPX/AnCRl5Zy9I4B4kVsrjwA8LOwLVVNYPTTHo73B6ViR1ncFQlfBphIeapkE+oPu1tbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=l1vT2F5r; arc=fail smtp.client-ip=52.101.67.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="l1vT2F5r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZ/OUxckt175ApP1/YUVd0DjJc5qRyk6uCF+dO8XJ3uAyIAaavTgnEhIlBHwN++uxBQz7cFBTsVIEssDPRMN66vww/Ul8LD1L+YCfDHASvZjA0UkLDS9mz4sP/rosswvgipAPuCJhy0Sfa3kbzSMwkoP9jsZavZAKZx79ojPfuY5Au/v1yftaQdO+aqYemjLOW5z7J5+f+CVR54AlzTquv36xfZMmsWxEDc9Ax5h1hS47ueVD6tg8d252BTaPHiRqegbKw/dATAuY68O9o0ycftHrXgkBCbsMl/qxaUfbuNybyY/odqNRzHHU2Q7iyZnsGG7G3W6JgBfD75ynAvrlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpBKSzRuGxORWzLEil3B4+zHVM3drlL16o7EoQvX1YE=;
 b=vNv3q3fRu/h4Qe6Xa16g2GTZOEiHxsqM3zQ6ywmrNnI2mSHuH3h+9I04JleGdLJHygRVumHD5pWCxwyiWcit+uP2/qmuerihA8teaZwLIDOjdjDhqa34Gtsx8wxaxNVISqYU44LBQEpPq85zSnY+bmbUJjncUJaIXuieuT+J7l2OsW8c0y6KpzzuNz5zlrLOEFXhnJUvR4gQsRD/GR7IDAePREG/ozqYxAwZLYobNpuz0ACaVPpy0jIgImdjs5MVjZHcl+zUrS4eEySs3HV0mjTz2TUbSQwmoEXb7TlbZeyIDBjcl9X5TRg4A4rpmAm2N4KhOtM2ijTPf2B1fHpxbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpBKSzRuGxORWzLEil3B4+zHVM3drlL16o7EoQvX1YE=;
 b=l1vT2F5rFj1p3tGS5UTd2SMjVPcq2O3/xpw/WPGslYiXCGG9hj467NxddAVvpbJTAyrMXi+tJernGuE10BY/PXElqtPC50q1j2AImEVgbMvFyeRfDJy/ewyVvGBcHU09ZkXz18UafnUn7T9sLGsJPFQquvwErXZ4/sDzp+4k6P3k4uZJ/QxYZgiPuc+P9+Yrk40kK4wOeZxZ8QB+Avbo1UVztnOg4yfBCuUSO2YSjszmhVOMvuSSCxl81sX3xnfx9Fj8Vd4qifsqR6IXFiZPCt7xN6BHlLpWBZHCrucPH5GLnkq0QJ2Afxseg6nWrqJtqB0eVFmrL7G381KgU9tzvw==
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PAWPR04MB9862.eurprd04.prod.outlook.com (2603:10a6:102:391::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Tue, 1 Apr
 2025 08:38:25 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 08:38:25 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Carlos Song <carlos.song@nxp.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>
Subject: RE: [PATCH v4 2/3] arm64: dts: freescale: Add basic dtsi for imx943
Thread-Topic: [PATCH v4 2/3] arm64: dts: freescale: Add basic dtsi for imx943
Thread-Index: AQHbouFv5HbzsA+lsEu0Hze0QDq44g==
Date: Tue, 1 Apr 2025 08:38:25 +0000
Message-ID:
 <AS8PR04MB864236BC6C7DF6A262032E0F87AC2@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20250401071709.1138872-1-ping.bai@nxp.com>
 <20250401071709.1138872-3-ping.bai@nxp.com>
 <VI2PR04MB11147341873DC39C504EB9910E8AC2@VI2PR04MB11147.eurprd04.prod.outlook.com>
In-Reply-To:
 <VI2PR04MB11147341873DC39C504EB9910E8AC2@VI2PR04MB11147.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|PAWPR04MB9862:EE_
x-ms-office365-filtering-correlation-id: 81c63664-ea63-4021-5ff6-08dd70f891a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?K9B2m19jnbRJGngAdSTBDq0yBb4NCVcTIqFkU7GlF9LeZneSPmkrkw2xDsuI?=
 =?us-ascii?Q?2WkuYdNtaVJH6GmxsXn3tfq7s3RwIuLudOXa7bh6AsHZ9UwlAUqGW6E/lLzI?=
 =?us-ascii?Q?sfyo7OtLP0Tlk55X3Bghwzu/42n1OBfbBixwOiSgLmf7d+xBCci1ZuJDFv7u?=
 =?us-ascii?Q?iN2WVuMKuBPVXodELLmx95CAlGiRg7vBYliWRGTfedIgzRfIIBYppW/CllGY?=
 =?us-ascii?Q?CSzbQMRswGigDEdvJmTylwsrT5PL0e99u63QIhb0QG0XyujImbeIc3SzjX86?=
 =?us-ascii?Q?1AmJpMUC954vZLHNRsaoh7ZLxLlH9iTYdb+k+YLb3JdIPdG1OPUuCC2rJzeN?=
 =?us-ascii?Q?hbvDIc0esWxu64FHSCcJyQQ4K42ILQhAiSxGIyVlhGsqoVDLI44EQ/PK2a2/?=
 =?us-ascii?Q?F2iqht09xLZ3BxOovyUpqevY1AnPSoal+zyxYIhp7dfU7j2wkiWxt3uXdhCy?=
 =?us-ascii?Q?FzWNCvHZ6JwJqg2qIOIe/iW6/5/bmOcGMxecZL0dbUS9olq9sCCC3kxMWYPi?=
 =?us-ascii?Q?ALTes7/3wUrzQ94RahZH4vRYR3aq7y/jVbAS0PDaGAszjA2TKBCOmg7AwzuG?=
 =?us-ascii?Q?Rk+adlJaUvp6QiZeS82bDZbM/2c1RApBrk2w6oJCfzSp4sHIr7auiDhRIwsm?=
 =?us-ascii?Q?+1bk2zckzT0hXWQ8LFviDIPA77hHYKWLua7jNnnEKn0XTXhpjtirBBEBQGMy?=
 =?us-ascii?Q?RRNyq5W86nVmGNFqo/JiHjNb0wrd+F/Ox+OoE43DQ0Z6qSamzxEz81CSNJNq?=
 =?us-ascii?Q?zoK3Tx28K1mtSQenveFdftmSx5Pc68Uhj9ZPbFHMupibuQcy3bTkhvIGhe61?=
 =?us-ascii?Q?VRx4FXiJs/Mhm1bFLtQxm+Cv60nB3u6Sk5RlhO19iDuabXt/7AouMhIInCwZ?=
 =?us-ascii?Q?v4vQmnxfWLZ6Q3zufvvKTapMevSv9NmsyQjVcZE552Nv1NjAX1ff+Cb61BiD?=
 =?us-ascii?Q?W4+JkjgmEApEaICE5rjVY+xRE4VGImL9WmAcIiNJC+LZhF2NIRggM+WcH7qV?=
 =?us-ascii?Q?kjNFNgFgsBZhZ6zUvcEXaOIqnmTpYItBSxBPDERCr8FyEh9y+Lm1PXItB+3g?=
 =?us-ascii?Q?4wEjoMKFUr802uPdHr4x2Ay8Jgp37BlUD3ReAx2eIc6rixVIee0CgDhXXkKS?=
 =?us-ascii?Q?k7AJcycLsHy02uNlyPq3+8yYJNrAzQ/M3U5PBi3a6prP5mlhZNtKl2Eaw+lr?=
 =?us-ascii?Q?jqMWAHyiB+Dvb5qVEeEobR2hEiIYgHh7CFhrZrSe2fhDk/Xh9PfioAK9Z+96?=
 =?us-ascii?Q?V8cOGbQ+MyNGKQMAQRn85IHs+d2MAyTKkwIQ3dxxQfgMpvaPK2ujTg1Dumz9?=
 =?us-ascii?Q?xjydWdEzBMSLW1TaV/G7R/BmIWtlkav1j/aB9fNS6BCLy0mvQYD6LVz8Gkby?=
 =?us-ascii?Q?CkkURtUWNfUB8hz1K2mNfLAc2ERTYH3vHLziPb+aqLeU9WF0dGpAXqe6wLKF?=
 =?us-ascii?Q?MvtI8d6PUOz6OYQPO6YPkEjlzM0pKf7s?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?P2If7o/umim9ZGHJKiSKZ8z8f+WMPU9R21LbAFZ9X3HdWngQl9+Rb4YytjFc?=
 =?us-ascii?Q?qDKJCFaxa2+DDhyE0Hf4M4cO0VraV/6qDXMg9ZEBUMblyU+DNMftJPycOGw/?=
 =?us-ascii?Q?Ej40qOlKRuRvCxgE2Ui6Nu/geWTcRfrij36a1bvPDHf+52ZqtS/2PuuxQX9O?=
 =?us-ascii?Q?AsMKouLBF211VJsgaHXaE8xwX/H74ezJOcjqMfI7RO4RV7izkvfDxIARkVee?=
 =?us-ascii?Q?moemyK12VUOGYelrAcUX5Ksl1/1GL4QS1DaddAxr/yRVlFNipRT9Asb2XHzY?=
 =?us-ascii?Q?LhCQ0zrmQA3+8U5ajqbFgLA/YFCVCXKTWiF7LDAPVeYOJT6ANYgAPLWRn3PE?=
 =?us-ascii?Q?521NxN6n8Fo9Q9rSOmYXVnNq+TR63lynZJdCuIVTLZ6AY3EakBvFAIlZxKLN?=
 =?us-ascii?Q?D6vpfkZ6/FtqVu4/J0Y6LmeSLgCw84UPtQOBWmWUUSdSeYb9GiqoSBgsMgIO?=
 =?us-ascii?Q?6uSDH3a8gRhn/o6HK2l7g6/4l4uEQSxVRJG/28gCtihwIIOm2A2L4vyFbqOF?=
 =?us-ascii?Q?E/Cvim1/vbGmr/EcOMJrIDEof/48JoEmud+fiO1RuXNTZWmCrnfIT0XTJ7Xd?=
 =?us-ascii?Q?L7pC82vjSfmXcNIET6U0H+pfGiSUYVV4I95bWsOsGGqb/m9n//Xhrx6mbJxo?=
 =?us-ascii?Q?Kf9/xKQ+HmX/BjzzpVwPbdPpacnN5fXf7ruf6OlVtmfbFh2l+IZZZvAbYVlS?=
 =?us-ascii?Q?DkUt0qDCx4+aacDGF/3mELH2yBXsVIU10Q9/7LINeBeBHmKTNZdB2WS3ExBu?=
 =?us-ascii?Q?6ED9iCwvyP/up2ykE+IEGpkEqV4Zal7YYKpSvuNgt4pouLStLHCmDd//ydFu?=
 =?us-ascii?Q?VO+lik+ddNxJOnKDFh5UCkTxsWu+T2lELs4fUOPTN1/tYWjsv4YqSKm6UxPV?=
 =?us-ascii?Q?99m/gkm8NnEIptrzz8+cipFYPb4ZyDiGNWYdLZTld6Ivsti9EKuRzcoYG9FP?=
 =?us-ascii?Q?XL50yARke8emBvM5x4plJVk47lGlx2Fdf40Ww0w9oM/RCA7+MvqmdWVDB/lJ?=
 =?us-ascii?Q?AUE9cPC3x14Q86nxyCQEO3icFjahSDMTbXmdNysiISU1DVpklNE6T3yM5Urz?=
 =?us-ascii?Q?SJyoI3PtazXX3+mQFXH7MpoqYuj+iUg2jFub+YeHNP/ShypxEQ4EglvT55wa?=
 =?us-ascii?Q?x2oikE/f57gL5uQSvgu/QSV6X83UaxppNXckxsNHyH7ShqRejieO+GmzVRxB?=
 =?us-ascii?Q?Mc9/guYZw7H3Biv3S9iCBA//wM+58I0hRcWvabxwzBhjEaBrIhb2N4zxknNV?=
 =?us-ascii?Q?+PJd0jVR77QQN2cr0Hp7Kmj5e5bV0BDquh3TqtkeptMl9Uvg9iBC4JmOVUSp?=
 =?us-ascii?Q?COmAXvoaUyc8IabM7IJLv3hw5kvNgyOSfH/bKPFjJRLzZytjDLuhO4t1+37P?=
 =?us-ascii?Q?LRT7R2YhmVndbuGjPO0yAQwithUnSa61uSoBtUSFnefP9pYTdnTrdiSosPoN?=
 =?us-ascii?Q?2NW0B81aO1HkV7hnJqM7L/09ctmUrzb1sS6VqjcS2xb6VR/GYfxcuTiIjk+i?=
 =?us-ascii?Q?lfdjs5hZ/7yQI37rqCUgVnuKMZ27Hdxrbz+dlct1iO0R1CeUBxhXK0eMpeoV?=
 =?us-ascii?Q?6zPlt4rr84lvKLHjSmY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c63664-ea63-4021-5ff6-08dd70f891a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 08:38:25.3650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T0fuWjrumekNHVou9cl6MoT6J0rb9gKHjBkekXR4r2yWEN+pmgMGKbqhw6a3RFlUx+AZhEacmQAdjg7qNmR49A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9862

> > Add the minimal dtsi support for i.MX943. i.MX943 is the first SoC of
> > i.MX94 Family, create a common dtsi for the whole i.MX94 family, and
> > the specific dtsi part for i.MX943.
> >
> > The clock, power domain and perf index need to be used by the device
> > nodes for resource reference, add them along with the dtsi support.
> >
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > ---
> >  - v4 changes:
> >   - reorder the cpu node compatible string property as suggested by
> > Frank
> >
> >  - v3 changes:
> >   - remove the blank line
> >   - add PAD config macro define as suggested by Frank Li
> >   - update the device nodes compatible strings for imx94 as suggested
> > by Krzysztof
> >
> >  - v2 changes:
> >   - remove the unnecessary macro define in clock header as suggested
> > by Krzysztof
> >   - split the dtsi into imx94.dtsi and imx943.dtsi
> >   - use low case in the pinfunc header as Frank suggested
> >   - reorder the device nodes and properties
> > ---
> >  arch/arm64/boot/dts/freescale/imx94-clock.h   |  195 ++
> >  arch/arm64/boot/dts/freescale/imx94-pinfunc.h | 1570
> +++++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx94-power.h   |   41 +
> >  arch/arm64/boot/dts/freescale/imx94.dtsi      | 1140 ++++++++++++
> >  arch/arm64/boot/dts/freescale/imx943.dtsi     |  148 ++
> >  5 files changed, 3094 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx94-clock.h
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx94-pinfunc.h
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx94-power.h
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx94.dtsi
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx943.dtsi
> >
>=20
> ...
> > diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi
> > b/arch/arm64/boot/dts/freescale/imx94.dtsi
> > new file mode 100644
> > index 000000000000..26e08ac51c36
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> > @@ -0,0 +1,1140 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2024-2025 NXP
> > + */
> > +
> > +#include <dt-bindings/dma/fsl-edma.h> #include
> > +<dt-bindings/gpio/gpio.h> #include <dt-bindings/input/input.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +#include "imx94-clock.h"
> > +#include "imx94-pinfunc.h"
> > +#include "imx94-power.h"
>=20
> > +
> > +                       i3c1: i3c@44330000 {
> > +                               compatible =3D "silvaco,i3c-master-v1";
> > +                               reg =3D <0x44330000 0x10000>;
> > +                               interrupts =3D <GIC_SPI 14
> IRQ_TYPE_LEVEL_HIGH>;
> > +                               #address-cells =3D <3>;
> > +                               #size-cells =3D <0>;
> > +                               clocks =3D <&scmi_clk
> IMX94_CLK_I3C1SLOW>,
> > +                                        <&scmi_clk
> IMX94_CLK_BUSAON>,
> > +                                        <&dummy>;
> Hi, Jacky
>=20
> Please change this clock order to this like i3c2. pclk is system clock an=
d fclk is bus
> clock.

Thanks, will fix it.

BR
>=20
>                                  clocks =3D <&scmi_clk
> IMX94_CLK_BUSAON>,
>                                           <&scmi_clk
> IMX94_CLK_I3C1SLOW >,
>                                           <&dummy>;
>=20
> BR
> Carlos
> > +                               clock-names =3D "pclk",
> "fast_clk","slow_clk";
> > +                               status =3D "disabled";
> > +                       };
> > +
>=20
>=20

