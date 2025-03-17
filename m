Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011053.outbound.protection.outlook.com [52.101.70.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D0621A42C
	for <imx@lists.linux.dev>; Mon, 17 Mar 2025 10:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742207513; cv=fail; b=IfHmc+CC7xfy0dnab0a4JUvIQyqv5lDOYV3T++oddc1iw0xs+NELTQfeIesqOC2t9KfF0snxWYLhXQbFlh+LmOpLVnuOp42xpnyXeao5ZonSGQffT6t3esssK9Wp6pDEdbQ7CFgIuHC9QVkK0seTxtrQFBRQqtzkiD1xn4Inyjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742207513; c=relaxed/simple;
	bh=PFUOXavEvlfjXnHbO7IxecUKJbsfC8VED+THq1ySGxk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OTM3LTIs6eSVdZBUIiw6+3o9LSspoGamyZ8wQ9Jo6j65VP7TPByQcYec/g7u2tS+tvbfqZIDkXyg9xvKwHEq3MVmGbUHawE31/d+OnrIGPGc08m4bMKU5VGNjPXKT9vUZkgntK0+MtS3BzlBKDyWF6EM4EKvKj0f9+B4DkWA6zA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=R69v8DXI; arc=fail smtp.client-ip=52.101.70.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="R69v8DXI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlrZDba4YxMxrU6tXVj7vsvmuc72tZ7esv3QGHcsEtpYrbkOz6/cGak2bxE5qWCU5GP4NJjqrWkdwk+56Ge9Ww06tB4+QCXKolqM2iflYNg/d3gSii7mGFoA2gOwSVvAvUGleVut2E2NGcuOTcrSNKouSF4yPoorPPNmOyfFtx7Np02Rqu25DZ2s1mSrYTjY8iHtq7vGvVbsGW+dOeRXCNvV10ueGNym/TRY6ytolL2nAyG8NQ75EI4Wa1l9hb0yx8cxpVGWh0A94k9Yof8juDTyFLp+lSLTmfl4TRJplb751i37lkjSwq0roWADqUP/V63AF+yyQ5f8S/+Nhc8jLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ASwRKHxrLi3koNtTzV5SG6FwRx2SkW/UQ+SOzGgMXU=;
 b=LDLFtrAxHRd7YE/SJm5kWydLySZ6q6K4du0VhEb2LDSVAznEAeQw1vtgjEW0jiqNA3PzCMNx3Bi8Vte+L6VjeCcRd3g8ifknIoj5h6TroAMYi8M/9MDJvO+olT4dRwKJll5Ql1UD3lpUv/EKzos6IDg/NqoNZhkETSwa4uN0zjfk0GYP3f0gsaKYLHxVdMDzTljcaZ2zADdN02IBgk/xfnESWCzVbMptpERqK7jdrmeacxVdeumufCoq7AQU7ocOPmLnfOiNgy5ham15qCYBKksN6M+6IEwMSNI9jVLSfXQdxAlxEYoJ9Bv4fQEIHFBBuYp6Tch2I6gGgBTvI5ZLRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ASwRKHxrLi3koNtTzV5SG6FwRx2SkW/UQ+SOzGgMXU=;
 b=R69v8DXIrijVaarHOQgscNnLQIfwdcXe/xhJKxF5ZnE2424FwcQHRHre0VarpnWEpzmp2ZT6CpDA9mjdWFaC/K+qZbspRIxCYmyfjJ/MeJIbKLXLFpiACV3kZhedq/jMwiPXNnKKHoqGfcdm/sPCBuft7LNsMgEAjpZmHuWvV+YjqblAMWHuiVnNJyZ/5Nn+nWlRTcUFfJAzeUhgTDYX92O9GEoUIxURRwH8MpaMCxz6IUqYrLxQvF/kNkkDUZ7pqfofJ7nKG7YeeTKlq4wY5IKYbyp2qkTSlN130OzcYckVlgAvmnuIM3XMF4Kw36tv1iWkTZ+4j+vqNgfv3UqgjA==
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PA4PR04MB9296.eurprd04.prod.outlook.com (2603:10a6:102:2a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 10:31:46 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 10:31:46 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "krzk@kernel.org" <krzk@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCh v3 2/3] arm64: dts: freescale: Add basic dtsi for imx943
Thread-Topic: [PATCh v3 2/3] arm64: dts: freescale: Add basic dtsi for imx943
Thread-Index: AQHbk+evC87gGrQidkqb5SikXLHNuLNy2FaAgARM6/A=
Date: Mon, 17 Mar 2025 10:31:46 +0000
Message-ID:
 <AS8PR04MB86426A8CA71C7F4A27A2860887DF2@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20250313071628.729168-1-ping.bai@nxp.com>
 <20250313071628.729168-3-ping.bai@nxp.com>
 <Z9RcdQbJYUk+SPte@lizhi-Precision-Tower-5810>
In-Reply-To: <Z9RcdQbJYUk+SPte@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|PA4PR04MB9296:EE_
x-ms-office365-filtering-correlation-id: 1715792f-dbf4-44f4-5461-08dd653eeb11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?jZsxCf6gb2rncN6MnznwW5JmC933Bn0l2Ye9FvNodHgm9hACv2+yrcYZT4Qo?=
 =?us-ascii?Q?B2lkB9It5CbY1Q8GQxACO0sg6f1JEzGZpKoW5w6ZxQ9Zqa6FXxeK5cAKAm+N?=
 =?us-ascii?Q?Y3bgzjNfYAwoJTatAeeTI7B34PFIiAptKNKMc6xqokxr3OeScvHmJHgzs3Zb?=
 =?us-ascii?Q?XepZKtnIC/SyOgzQWsaJpkW6Z07gG+VHkmuUOzQZ+OxeH6Jn/aS8Wz7NtrxN?=
 =?us-ascii?Q?4u1BaP6UudDukWzbkHL/N3rEWTcbZ4uWaWhY1Y3FbY8W5lBGc41uNHzFt3Mt?=
 =?us-ascii?Q?oyfVIyphKcnWwshZ7vDYFzH7MtoGnOEOq94a0DmH3/efFEEYDAR73yRGNFSy?=
 =?us-ascii?Q?MWSdzcNQyAhYcElnlsnPac7aFSdChX/NjYBNVfFR0ALjijCPW/ljjZBYskzx?=
 =?us-ascii?Q?/ONAxtfT1W/fqfC1uSJ//5oCRm4NEItiwyntD5C6ZbTDXJO8TV/QC7XepAOB?=
 =?us-ascii?Q?DxKe+MW/EKSyaUgymekVhg9iP7OhrsmYs8UFlEPP97vv58nV3t2FnQt5cAxb?=
 =?us-ascii?Q?2Ka0PEmDUgx+883a1VIN6Q32DAeYZJEEnJPqVON03AFc4b5o0jFdVrkuEq8Y?=
 =?us-ascii?Q?QN2wiNi78RXML4TOKxs6dc9QDIsC+1g3pZu0lsmaM/H7Ju8f0fmTAdlCevJT?=
 =?us-ascii?Q?RviglT9oqsUNPQeq8bcdZQSnXGp3x5HJ91X+adjNE6IQIC82YxumYbNorwdv?=
 =?us-ascii?Q?3d5JZq0LPqDO+DVWsvTy9zvj3p39ob9NQoGoCfkzW/XkSQGIoYQXNxy1bWrd?=
 =?us-ascii?Q?G8A5iteapyswvPqHZRHgEcolzPie3/Ac/mzrGX63u+o2+/NGMwwLi9t1Ypq0?=
 =?us-ascii?Q?KX5t1px1BNxNUIzVyNSgilwZguSRWKoIrXYPRGTVAZHWV/k5pL6v364s/6Al?=
 =?us-ascii?Q?nw2qFZs5/zibZd7EoyQCIpkXl6e9QnU19zt+jT90UMbu+V+Q9FkO7K8PD9e6?=
 =?us-ascii?Q?Jh2yzWQWCNRZ83JB2G98H2mo98dxOh1Ben/8grA7MMw92mhQU28inpsI6x8y?=
 =?us-ascii?Q?WnFI8MwfHE3NG5qyJ8aiZNuEPGecWiqGB8bOfcQK4xk7vKQSNVuMq3lBa4hc?=
 =?us-ascii?Q?KZEwvEzV9KAn+iJaqGrkkOi7iaeVbW1EdewJuaSzM+xp+fi+GsxBTab+FPZH?=
 =?us-ascii?Q?A2kp+DGeAjh8wmm2EyN1wPWqe6sNJjL2m0+wlOKhMLVwb8OpsXRPcxwK7vYx?=
 =?us-ascii?Q?7e5nFQmCL5ZSC0jqm0N3I18QL7WZUwerrepfHKAQ+cXiIyvPLu/JagsFB8Xg?=
 =?us-ascii?Q?h6XJ7n9HAsWOXnopje0w1dq1UgbB06YU2rspW2yC2S8TcyLMbcfM3PN49SoE?=
 =?us-ascii?Q?3/aLQMtzcwb9UJIcrb4oZeJ/NHOXwph7CYL6ziJJg9ZUi+brYCvYmfKyoeYr?=
 =?us-ascii?Q?O0yEmFJ8UHmN8wKxwxcKwEucTP00bPZw7scwVmd0jpsjjRVk7bgRWeR+rtp0?=
 =?us-ascii?Q?AO4lTY3L+OMUVadyBiad4KhvPSDp7KGn?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Mf9x2agN3cQYAS6PZq3TwPMCIVAtgV3esF7SiyvGZnvwb1YYpz3SpWQk/yWc?=
 =?us-ascii?Q?EaWT7373Ge8dcETzUiYlYNvd9n/gj1ziiKOSbC9v1wZj3WVFYFNWvc6/KpDv?=
 =?us-ascii?Q?BFNKjbwaGrLJmftfBdyTtA9yTzX6WMvQvhJ5xhwZNaIz/2l3NSZeEs0nJCCX?=
 =?us-ascii?Q?UxKt90dcw1J1YYyoxBb/a3Y1PMtY/w7CkhHqKKjPOVZPX8kvcV5ruPbtRKX5?=
 =?us-ascii?Q?h1LMose++NFkAGj9eDiOkGIBSkqjfcirp002cz+Zgb4HvW4eMNk7/tGGC6+B?=
 =?us-ascii?Q?T7Sv5q4wUWpk+0Qmbwrt8quNg1IalsQUhmRZIqhWf7wfYduGsQXr7otTTx7D?=
 =?us-ascii?Q?K1sEAI9cd81DnCNUrbxhva22K23Kx2dmRM6PN3nerFkAI8ZyndiEdGnyG3C+?=
 =?us-ascii?Q?5rOvbLxRTVVMgMUI6Wt4CmYbWXpSJNop9WnUNb2Wns/LGXJWkAhQD8BuTtji?=
 =?us-ascii?Q?w5IWZoOYebUFvrTNS+aWED6PWVl9R4cM9JmA8ncldspfOo78rk5wWey7e+oR?=
 =?us-ascii?Q?H41rEyzXsHwVHzpfEEDZ0QzhN6rmQh7N6vG/iw7Cfep186k4djZOCpN2NYkd?=
 =?us-ascii?Q?TKAPOTt7Im46xwDfs9Y+uMVC+xHNYXt7SNcWgajJfptOZfCebosQRy0TKTfC?=
 =?us-ascii?Q?K59oeKtvWYQqU4wnmJdjzz88X9l63Dw/6N+biF5ZeQEBmPfZ7XmWdwC+WQRN?=
 =?us-ascii?Q?VCCR9PNwo7z7EqQbTX9rpg9p4g7ab5vYFd1MCAifPzw6NPK8y+3Vtgih9Q/U?=
 =?us-ascii?Q?BtIMgal3iaOEdXCuK3QfRZVlstDoeea7mFLYDA5aMSvE/VEQIFM0XOZQqaxT?=
 =?us-ascii?Q?CZPbjpta9GZy9Qvjgzf5br+FbjXyR8cnOoI2S8qw+RafOLFPB/SafvH2mImr?=
 =?us-ascii?Q?H3wCVRidcw6vNNpPVKf+ZrZGm7/bQeO4N4z6kp89bLPKsv3rZCIqiDPkOYXo?=
 =?us-ascii?Q?vGHLzTfgsYzUh8B1H/LAf1kzE+f22D+gM2eumktyZX07CRuZ+DIIE47AM0vA?=
 =?us-ascii?Q?IhWuDDs5pj4jmmbY0Ta/dzVu3OimEDZRE0c6Nkpj0TW6drsVWfpxBqLjA9R3?=
 =?us-ascii?Q?nT10Fc1eK+r2Oftq93RVXWLsgLQcFgv319WMwmvsvskIS+KK74gZ87dliZJ/?=
 =?us-ascii?Q?VcCUuJzt1wxnjC2GWHlh4XgMwHrMf2/O/hAV9hUJHACXZRvRzqYVpApzh5ME?=
 =?us-ascii?Q?gFnGsS2nwMQUMiZBq6Voeddnu6rfQEub7ygWWhCR4CEnrokRBQpSUEbaSWv3?=
 =?us-ascii?Q?/L7ELxpsq7NJ54nmOo3IL8sDaTltwQxcYU3pPwDJHDwZkC2PIi1CJR27fS5t?=
 =?us-ascii?Q?qJqF+zJYnnfSOBLec7cay2M4K93SMofYwA35mLNkSzwJay2GoKafz0jkhOou?=
 =?us-ascii?Q?bHh1K4BUkwze089wDbALTOtmQSdC7w01z+t1Kv0/aSCmKoZDRbXpEltYV5rj?=
 =?us-ascii?Q?56omWEfozOA6AGGDeyJzZyweFj2OxWGh38m6Aj+dHm0TPGOM6AQ1JMFZiQxq?=
 =?us-ascii?Q?hbz1ZrnLBJM3TZAOHKBcxEaVoLl/xSBDB6g4ZnX1nrlcVow/iri7pB40xKVw?=
 =?us-ascii?Q?oCtWIhRDaGrkPIYFYZI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1715792f-dbf4-44f4-5461-08dd653eeb11
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 10:31:46.2042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Ls5yLZN6Z34+V5IWBnQLWeaWF5hF67gpUYg9Her4qeX8ltK90iHUWRibpmxpW7l2TmU34Iv061nlgwjfTpNfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9296

> Subject: Re: [PATCh v3 2/3] arm64: dts: freescale: Add basic dtsi for imx=
943
>=20
> On Thu, Mar 13, 2025 at 03:16:27PM +0800, Jacky Bai wrote:
> > Add the minimal dtsi support for i.MX943. i.MX943 is the first SoC of
> > i.MX94 Family, create a common dtsi for the whole i.MX94 family, and
> > the specific dtsi part for i.MX943.
> >
> > The clock, power domain and perf index need to be used by the device
> > nodes for resource reference, add them along with the dtsi support.
> >
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > ---
> >  - v3 changes:
> >   - remove the blank line
> >   - add PAD config macro define as suggested by Frank Li
> >   - update the device nodes compatible strings for imx94 as suggested
> > by Krzysztof
> >
> >  - v2 changes:
> >   - remove the unnecessary macro define in clock header as suggested by
> Krzysztof
> >   - split the dtsi into imx94.dtsi and imx943.dtsi
> >   - use low case in the pinfunc header as Frank suggested
> >   - reorder the device nodes and properties
> > ---
> ...
> > +		aips2: bus@42000000 {
> > +			compatible =3D "fsl,aips-bus", "simple-bus";
> > +			reg =3D <0x0 0x42000000 0x0 0x800000>;
> > +			ranges =3D <0x42000000 0x0 0x42000000 0x8000000>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <1>;
> > +
> > +			edma2: dma-controller@42000000 {
> > +				compatible =3D "fsl,imx94-edma5", "fsl,imx95-edma5";
> > +				reg =3D <0x42000000 0x210000>;
> > +				clocks =3D <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > +				clock-names =3D "dma";
> > +				#dma-cells =3D <3>;
> > +				dma-channels =3D <64>;
> > +				interrupts-extended =3D <&a55_irqsteer 0>, <&a55_irqsteer
> 1>, <&a55_irqsteer 2>,
> > +					<&a55_irqsteer 3>, <&a55_irqsteer 4>,
> <&a55_irqsteer 5>,
>=20
> Does below method work?
>=20
> interrupt-parent =3D <&a55_irqsteer>
> interrupts =3D <3>, <4>, <5>, ....
>=20

edma driver can not parse the irq correctly. The err irq is connected to GI=
C, not irqsteer.

> > +					<&a55_irqsteer 6>, <&a55_irqsteer 7>,
> <&a55_irqsteer 8>,
> > +					<&a55_irqsteer 9>, <&a55_irqsteer 10>,
> <&a55_irqsteer 11>,
> > +					<&a55_irqsteer 12>, <&a55_irqsteer 13>,
> <&a55_irqsteer 14>,
> > +					<&a55_irqsteer 15>, <&a55_irqsteer 16>,
> <&a55_irqsteer 17>,
> > +					<&a55_irqsteer 18>, <&a55_irqsteer 19>,
> <&a55_irqsteer 20>,
> > +					<&a55_irqsteer 21>, <&a55_irqsteer 22>,
> <&a55_irqsteer 23>,
> > +					<&a55_irqsteer 24>, <&a55_irqsteer 25>,
> <&a55_irqsteer 26>,
> > +					<&a55_irqsteer 27>, <&a55_irqsteer 28>,
> <&a55_irqsteer 29>,
> > +					<&a55_irqsteer 30>, <&a55_irqsteer 31>,
> <&a55_irqsteer 64>,
> > +					<&a55_irqsteer 65>, <&a55_irqsteer 66>,
> <&a55_irqsteer 67>,
> > +					<&a55_irqsteer 68>, <&a55_irqsteer 69>,
> <&a55_irqsteer 70>,
> > +					<&a55_irqsteer 71>, <&a55_irqsteer 72>,
> <&a55_irqsteer 73>,
> > +					<&a55_irqsteer 74>, <&a55_irqsteer 75>,
> <&a55_irqsteer 76>,
> > +					<&a55_irqsteer 77>, <&a55_irqsteer 78>,
> <&a55_irqsteer 79>,
> > +					<&a55_irqsteer 80>, <&a55_irqsteer 81>,
> <&a55_irqsteer 82>,
> > +					<&a55_irqsteer 83>, <&a55_irqsteer 84>,
> <&a55_irqsteer 85>,
> > +					<&a55_irqsteer 86>, <&a55_irqsteer 87>,
> <&a55_irqsteer 88>,
>=20
> > +		cpu0: cpu@0 {
> > +			device_type =3D "cpu";
> > +			compatible =3D "arm,cortex-a55";
> > +			reg =3D <0x0>;
>=20
> I remember compatible is first property, then reg.
>=20

Will change it as you suggested if no other comments for the order of devic=
e type and compatible.

BR

> Frank
> > +			enable-method =3D "psci";
> > +			#cooling-cells =3D <2>;
> > +			cpu-idle-states =3D <&cpu_pd_wait>;
> > +			power-domains =3D <&scmi_perf IMX94_PERF_A55>;
> > +			power-domain-names =3D "perf";
> > +			i-cache-size =3D <32768>;
> > +			i-cache-line-size =3D <64>;
> > +			i-cache-sets =3D <128>;
> > +			d-cache-size =3D <32768>;
> > +			d-cache-line-size =3D <64>;
> > +			d-cache-sets =3D <128>;
> > +			next-level-cache =3D <&l2_cache_l0>;
> > +		};
> > +
> > +		cpu1: cpu@100 {
> > +			device_type =3D "cpu";
> > +			compatible =3D "arm,cortex-a55";
> > +			reg =3D <0x100>;
> > +			enable-method =3D "psci";
> > +			#cooling-cells =3D <2>;
> > +			cpu-idle-states =3D <&cpu_pd_wait>;
> > +			power-domains =3D <&scmi_perf IMX94_PERF_A55>;
> > +			power-domain-names =3D "perf";
> > +			i-cache-size =3D <32768>;
> > +			i-cache-line-size =3D <64>;
> > +			i-cache-sets =3D <128>;
> > +			d-cache-size =3D <32768>;
> > +			d-cache-line-size =3D <64>;
> > +			d-cache-sets =3D <128>;
> > +			next-level-cache =3D <&l2_cache_l1>;
> > +		};
> > +
> > +		cpu2: cpu@200 {
> > +			device_type =3D "cpu";
> > +			compatible =3D "arm,cortex-a55";
> > +			reg =3D <0x200>;
> > +			enable-method =3D "psci";
> > +			#cooling-cells =3D <2>;
> > +			cpu-idle-states =3D <&cpu_pd_wait>;
> > +			power-domains =3D <&scmi_perf IMX94_PERF_A55>;
> > +			power-domain-names =3D "perf";
> > +			i-cache-size =3D <32768>;
> > +			i-cache-line-size =3D <64>;
> > +			i-cache-sets =3D <128>;
> > +			d-cache-size =3D <32768>;
> > +			d-cache-line-size =3D <64>;
> > +			d-cache-sets =3D <128>;
> > +			next-level-cache =3D <&l2_cache_l2>;
> > +		};
> > +
> > +		cpu3: cpu@300 {
> > +			device_type =3D "cpu";
> > +			compatible =3D "arm,cortex-a55";
> > +			reg =3D <0x300>;
> > +			enable-method =3D "psci";
> > +			#cooling-cells =3D <2>;
> > +			cpu-idle-states =3D <&cpu_pd_wait>;
> > +			power-domains =3D <&scmi_perf IMX94_PERF_A55>;
> > +			power-domain-names =3D "perf";
> > +			i-cache-size =3D <32768>;
> > +			i-cache-line-size =3D <64>;
> > +			i-cache-sets =3D <128>;
> > +			d-cache-size =3D <32768>;
> > +			d-cache-line-size =3D <64>;
> > +			d-cache-sets =3D <128>;
> > +			next-level-cache =3D <&l2_cache_l3>;
> > +		};
> > +
> > +		l2_cache_l0: l2-cache-l0 {
> > +			compatible =3D "cache";
> > +			cache-size =3D <65536>;
> > +			cache-line-size =3D <64>;
> > +			cache-sets =3D <256>;
> > +			cache-level =3D <2>;
> > +			cache-unified;
> > +			next-level-cache =3D <&l3_cache>;
> > +		};
> > +
> > +		l2_cache_l1: l2-cache-l1 {
> > +			compatible =3D "cache";
> > +			cache-size =3D <65536>;
> > +			cache-line-size =3D <64>;
> > +			cache-sets =3D <256>;
> > +			cache-level =3D <2>;
> > +			cache-unified;
> > +			next-level-cache =3D <&l3_cache>;
> > +		};
> > +
> > +		l2_cache_l2: l2-cache-l2 {
> > +			compatible =3D "cache";
> > +			cache-size =3D <65536>;
> > +			cache-line-size =3D <64>;
> > +			cache-sets =3D <256>;
> > +			cache-level =3D <2>;
> > +			cache-unified;
> > +			next-level-cache =3D <&l3_cache>;
> > +		};
> > +
> > +		l2_cache_l3: l2-cache-l3 {
> > +			compatible =3D "cache";
> > +			cache-size =3D <65536>;
> > +			cache-line-size =3D <64>;
> > +			cache-sets =3D <256>;
> > +			cache-level =3D <2>;
> > +			cache-unified;
> > +			next-level-cache =3D <&l3_cache>;
> > +		};
> > +
> > +		l3_cache: l3-cache {
> > +			compatible =3D "cache";
> > +			cache-size =3D <1048576>;
> > +			cache-line-size =3D <64>;
> > +			cache-sets =3D <1024>;
> > +			cache-level =3D <3>;
> > +			cache-unified;
> > +		};
> > +	};
> > +};
> > --
> > 2.34.1
> >
