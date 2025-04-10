Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2044.outbound.protection.outlook.com [40.107.241.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D8B1E32D5
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 07:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744271324; cv=fail; b=oqRyvqbwPAqe2h0Z1w1eBs4fvQD0Q4ciKb6rHa29H1vvGimNpDiS9EIPDfMwMQ/pZQec0XN/bpxyADHx2I0+nCCad/Nx5YVepe/vHukEuKTMWPEFvQtLLG3lUSJBKSDLrmV9LLvR1V5FxXgD7u+TK8um2ahxIQDL9XWLDEyVpJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744271324; c=relaxed/simple;
	bh=O69LPjI/2yTb3ybu5cZyM6vyzFE5Dl2PwFp0YxeiSW4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OqDgDf9u80nuA386F4uxVJ8V58f4GRBY+8+lgwgl7LsJ57a6WcEN1lUfB2Ns7oYGKHMHehm/+bUDGxWdGP9Ub1HHJs/GDV3LtGDm2/vuEhRpWmii0SKNd18xxeyE+NFEbQdzCVwbrm6rtB9z7vW5z3L6mjnH32r88ymihjsT3z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=e55vUuwg; arc=fail smtp.client-ip=40.107.241.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="e55vUuwg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iBJfc1VMIHmkuSUriYDN3v+5edMjWOxPt+kDlAw5EmGMjkkON5SU0BDmM+VhnadXMUAri35balTN5ox0cKX219q+iYrx2jfnjv5dDRrNMrGzagchyX8pCnu6VSaVBkj+tAY7s/zDKsAImZOkGQaYrvmws9VwUUEmpZurAbQiRyqVWfZFMYuT/WrC0oB9vciw+RRjXDrDyn80gsAbeHE8BLmk2dowerv0n/v0lUKDR35+O40dE0enugTrC/LS/cdGHwYASybPjs3VAUeUu0uFh528uVOE32jgAPPVraLTOchCzkR7cGbuFir5lELOGL2oWHgV0cYPTXOEOa3yupIzng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mE3HivRbu2M8hS5cgrVcRVPwPl7TfWcKtgPVOh/rQEw=;
 b=ZdCWhmnsgBdswI2vT1HM8SdJb1w+jANLu9zOH+BVyeb5JK9mNawp8AEZ4putgAyVk17ETqkbwK3jsUg5KHiqX978/Mk18N0yKqvM3InPbjt+Ws0YU5tBp5NP+oEIA2wkHrwE9Lym+/nLuutPnP26GFqnHOGZLnihIPJq1LyJ7HB+JJUc1jFG5e+SFqBhys5GY1mtvv+EKSfmOZCR4GMB16mPUq9KhwhfTNutOTH9XVssO4trYFYnlO6cT1nBpRONQOpRIk5Fz+ixfSwYByLbAmxTTok5oV26Spjz/7MkF8pKX0lYkEj/NafmNmhgkMGJ2sOPcWIk1WV9lgixe73Qfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mE3HivRbu2M8hS5cgrVcRVPwPl7TfWcKtgPVOh/rQEw=;
 b=e55vUuwgLTycXEgMYu6bldpQtl0ij49ni9dESyMHkPwTnfTHfaUIqnhJx7EwnMkJbhrFGNyjFADRCnU6dNAvFgUYl9vGUqWfpcRYxRy1hS7fpEzBka0JhhwNtpLWsHIu7WSVwD+2beGneWeMUs/tTdBrDyrzLzFY6I8V0zlLOYdcklnlOmizc4jm7RwMaICg9/PlAoWhHc8vwXBLSn8xWVsH6bt/ydTm8jTi3hTERemuu3rNaJ9tPIubXOnsE6yqTs1ewigifaa4OR8ZPHuqbhOHCK5JA06Pr0wzGijVM++sFYl5IV2XnHegV62v3Ub5+9a4Ev6xCxV8RFPFXz5Q0w==
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PA1PR04MB10794.eurprd04.prod.outlook.com (2603:10a6:102:482::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 07:48:38 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%4]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 07:48:38 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>
Subject: RE: [PATCH v5 3/3] arm64: dts: freescale: Add minimal dts support for
 imx943 evk
Thread-Topic: [PATCH v5 3/3] arm64: dts: freescale: Add minimal dts support
 for imx943 evk
Thread-Index: AQHbqeGeozsIuG8+REGQVEXmD8vtT7OcdMuAgAAN/5A=
Date: Thu, 10 Apr 2025 07:48:38 +0000
Message-ID:
 <AS8PR04MB8642773D67C52DA27D668EDB87B72@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20250410062826.3344545-1-ping.bai@nxp.com>
 <20250410062826.3344545-4-ping.bai@nxp.com> <3627104.iIbC2pHGDl@steina-w>
In-Reply-To: <3627104.iIbC2pHGDl@steina-w>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|PA1PR04MB10794:EE_
x-ms-office365-filtering-correlation-id: 79bd1673-bd1a-468a-bd0b-08dd78041b1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?RJobFctcJOSeqvX0hldFDFmOxMafU3gNNsMuLnZO4A29cWsGAehykIKNKn?=
 =?iso-8859-1?Q?WCQ24EAQDkTUI3bB8vT7aQgubm6Xk9OFZAT2BZT+Eu7k4OIwYEd3sQXYhJ?=
 =?iso-8859-1?Q?cOCwacLIhTE2UWF38SpWdoTkE0qAbvDV2GC2PbZ4ORi8Hf2boNvuy0PbYm?=
 =?iso-8859-1?Q?j7CPwC8xpOiP7+Q6v+fWyCyhzKBg6yIAoy3gh6AKqd6XcZKufUiq5pbbSU?=
 =?iso-8859-1?Q?GwJ1ARQfDtWsqbdEH+a+OGshMZOxKiPL8h/9GWjuYaxOtMD5iZy47Dtelf?=
 =?iso-8859-1?Q?DIoib/QbHcr4lDlQni8VEQ0nCbbdDyNQxQ2mkf2UJeujZL5lO+3l3LMiTt?=
 =?iso-8859-1?Q?8BWwAUtBzUE26KqHJtc7lgIeLt1NPwvqhRmjBxbLLgU1I3nRuwD5+bFu5n?=
 =?iso-8859-1?Q?0Vqej/nLRwnTlFjTGzFbw3FiBC5wknFiGkwN35XnHXRt77lWFuB0N9lEfi?=
 =?iso-8859-1?Q?l0Tjs21Sm6kwaYtoHJn5G72zQzRvagn6NOCoCxdbLvDzrm1JdlLAoyMHrF?=
 =?iso-8859-1?Q?PvWqIdBCrAJf0S7MnwidoFgSclrsxYiKyrcMhRsgxqjK/xDtjFKUyM3LnZ?=
 =?iso-8859-1?Q?F3prY9YzDilWeM1hT0FzDZdyBjTEnQXMgz39SFEDm9c9m1GOHQWYwjisPw?=
 =?iso-8859-1?Q?8LU4NlGsNVilmkRZb5EVcX5o3AbdZYPioJ9OTPKfG2hlAl+gY3BSNO192V?=
 =?iso-8859-1?Q?RfQyHmzi2wq3zQbMPMgvJADkJoZqcxtFRqWW0FbElUKvsUvh17nWxwBoOa?=
 =?iso-8859-1?Q?RbRgnNyiNLAtDkI/p6GouGiO1DAhIFxKXCjBkPMGajK0Jc7ukLuWL8/CWd?=
 =?iso-8859-1?Q?DJW2XOlFQLlmc3CoPyO7a2wRuJrlPB/a99jH+HrP2yupHGbJc7P8v9tmfQ?=
 =?iso-8859-1?Q?NJWilPu/QQDre+V3Ed1me/wk6VxeEm6Mv4WFmJGk8hXJR1PpdhH6xVGO7E?=
 =?iso-8859-1?Q?EZONPX/nOf7BL/vzxFz2+BstatuJzB18iN/754xCM/CwIhlp6geuoMwMVL?=
 =?iso-8859-1?Q?8AQ1DiuQYCcbMpoZ+sHOu1orL0+R6bTsrMeO1VfqcNsgTrDhAT1/Yc3OWU?=
 =?iso-8859-1?Q?o3/LObYILmDksnXvFLF/v8NtsOosEjptYYQLsB1HRgEWC0RsYK3N+YRxnR?=
 =?iso-8859-1?Q?NORhWNvPaAkfop/bNdp2vzqheKB3gbzcD9pGIshCBG2I41XAZdNoKuNO9G?=
 =?iso-8859-1?Q?b3liyxNtvIwjabEKbWb4O8/SDAsAaBIUm+oOz/zQvXqT69e9YReolJbZyl?=
 =?iso-8859-1?Q?J75LgU+gErczCqaCd3tgjdyxTUm6X93ylzWGUrMOj1ZYMGYvVXY+Yu/Lzy?=
 =?iso-8859-1?Q?ZMbMQx1jAjaI68eBq3JfW9t8hRXnBs9SF52G+V6FZWO7kXAF7C6xtnm2n8?=
 =?iso-8859-1?Q?wzWtTox5jcm89INpGyJ+1rBW7EMNBr3tKwDaJRBxIKmi6bNOvLysf162jB?=
 =?iso-8859-1?Q?fvYvQNhOlPb33IoU?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?LlLRQODuhzTV9D3Y7MIFH0n6VRyFMGbPjlfJ27fxEvq1Fft0XFux2FMJRA?=
 =?iso-8859-1?Q?PtRRKYTVQFUuGX2HG5Kvfh2et3qAJGeklkP0Pe4N0ZJASzEoVQmmQRv/07?=
 =?iso-8859-1?Q?w01XUg8GHqJOsv2SZ2dLCeqA7PwzB3I5aAiNoUfui+QIUFrWS8frugEa6g?=
 =?iso-8859-1?Q?KBTp8hqsKn8OhMNWp72YIOo5prnKbT/LVtU5ZFncUiDejgsmQ9yl6NjOoY?=
 =?iso-8859-1?Q?x7mq3Ijj+rinGuT3UeQAwbhCxOhNuO9+FAX022Q/JjXoSWipgyDz8Ud4Qk?=
 =?iso-8859-1?Q?39AY0iH18Fy180HIBZiR+AfYuc/5WnnD84tKt251UNQ/OQ4Xj46IevU6hc?=
 =?iso-8859-1?Q?h2awYYKo2GrPMWNm3tcoIF7fwZNvlDEdF51RuVLQy9t9e5UGikiYRW54Ef?=
 =?iso-8859-1?Q?RZsLEn/a8giN7q3oN5PT26PmZkOz6VW3j8JGG8aMP6SoVnSSw/TJHcwiyg?=
 =?iso-8859-1?Q?O3RQYqNsQct2987HW5ndjI1Lm0PsxsMuHLFTNL2IkXOSTAQPoe2o2TTCjN?=
 =?iso-8859-1?Q?tEQxCVkUTYZtV7obtAjtQw8Dvky4PpkVb+QiMra4AYXSnvonJjbprnF8Yt?=
 =?iso-8859-1?Q?3IyBJ/nPLSsfTuUm+zRt7lSBBOSjbgPLNlTg7/me0daZx+n4MxhrNCc9VX?=
 =?iso-8859-1?Q?2vXcqP3ZBMuot7xuQYhTS5/U+ICQxJQDx7cUbQ9AfUuQllElHyNO+TW8dk?=
 =?iso-8859-1?Q?TO47YDGgJEFP6hdM3K6ymoENyOq5LIRfgNuyN76jrS2gcFvDZQMA7LmIb2?=
 =?iso-8859-1?Q?DQyi6u/U1Kcuktr6YhyZLwSsImGGOwUJvOcNT2nXBBDAGlOnR5dS2gGo0Z?=
 =?iso-8859-1?Q?WOwxQlp6LeTGdOPvi8TfR13kO5tqMG07hLgHSNlFy1zagFq54quzzkgD05?=
 =?iso-8859-1?Q?99wV0qGrYk6aidZTvGSzlpYRM22Z7JoxU00Vugb1THQ9mSfqlcG32ZWUzx?=
 =?iso-8859-1?Q?A8f+Zx4NAa6lnF/hqkxnd7k4bDkkAlq9o8vFloUaBxH5Jc6Ofb8RUk28Df?=
 =?iso-8859-1?Q?Q7b/Eajgou/TgzQGSbGjyHcFh1SWIWU++tCcMToE6Kq0j5Fa9DfMH0HhyB?=
 =?iso-8859-1?Q?tmdCjjoDCjV+iftfUZtLSZwKffRuUfyUNWuJLnbnNXWzbkFtrSJE748aMn?=
 =?iso-8859-1?Q?wgOTHGvBVweNy5ssijpGlG1j8E44YwsbOOuYr5E3M/ZxiSMNVvg8XZtOB4?=
 =?iso-8859-1?Q?YcJ4I2XXw6k4hDho9WFxPt48S+c6BBaXyio+tokAcW7hD7P9/WMkhNNsPV?=
 =?iso-8859-1?Q?pPqeGmI939tdU6zddd/t1CwDrVmfa22akCLxOZmtBV8YDncyKwi3Fi2pdY?=
 =?iso-8859-1?Q?x5BvcBKanuic7Rib6CtKK1tR29T5AEMCJoiGk1L7hVpJIonduVUq566seG?=
 =?iso-8859-1?Q?UxHSYr5o5Ry46wzU2WV7tWN4wR3AJQ+6GQjC92Kpbz4lGQIK/7RGCqhAdm?=
 =?iso-8859-1?Q?xsC6AhhidNbgLd8f3RbxuvW3hxXcfqQVV9gTVAmpu+8Ayun6USIZwf8MCX?=
 =?iso-8859-1?Q?FZ+pATTNMg6EG+dH44b4sykBkgxAyEMgSktX6VfnBluLMLYY0JhcZQhvRJ?=
 =?iso-8859-1?Q?3SCsznAcRG3Aom+VfDiHrq9WdLY4zLJ3gNFGtsgqJ1fvR7x6dHnVUxL30w?=
 =?iso-8859-1?Q?P9/iW9V4rZ/qg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 79bd1673-bd1a-468a-bd0b-08dd78041b1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 07:48:38.5859
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i1vynZVOsTg6pxdZB9AUX29ZBsxKdGn2sReOYIh2zx1evIOP0iFE0xCreLAoI2UviSu2wfFIPhc9Uma0ZKKVyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10794

> Subject: Re: [PATCH v5 3/3] arm64: dts: freescale: Add minimal dts suppor=
t for
> imx943 evk
>
> Hi,
>
> Am Donnerstag, 10. April 2025, 08:28:26 CEST schrieb Jacky Bai:
> > Add the minimal board dts support for i.MX943 EVK. Only the console
> > uart, SD & eMMC are enabled for linux basic boot.
> >
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  - v5 changes:
> >   - remove the unused and not documented 'fsl,cd-gpio-wakeup-disable'
> >     property from usdhc node.
> >
> >  - v4 changes:
> >   - no
> >
> >  - v3 changes:
> >   - no
> >
> >  - v2 changes:
> >   - newly added for board dts
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile       |   1 +
> >  arch/arm64/boot/dts/freescale/imx943-evk.dts | 195
> > +++++++++++++++++++
> >  2 files changed, 196 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx943-evk.dts
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile
> > b/arch/arm64/boot/dts/freescale/Makefile
> > index b6d3fe26d621..2fe86fc6d73a 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -303,6 +303,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D
> > imx93-tqma9352-mba93xxla.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-var-som-symphony.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-15x15-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) +=3D imx95-19x19-evk.dtb
> > +dtb-$(CONFIG_ARCH_MXC) +=3D imx943-evk.dtb
>
> Uh, please sort the entries alphabetically, thus imx94 goes before imx95.
>

Ok

> >
> >  imx8mm-kontron-dl-dtbs                     :=3D imx8mm-kontron-bl.dtb
> imx8mm-kontron-dl.dtbo
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > new file mode 100644
> > index 000000000000..b0bb08bb67d5
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
...

> > +&usdhc1 {
> > +   pinctrl-0 =3D <&pinctrl_usdhc1>;
> > +   pinctrl-1 =3D <&pinctrl_usdhc1_100mhz>;
> > +   pinctrl-2 =3D <&pinctrl_usdhc1_200mhz>;
> > +   pinctrl-3 =3D <&pinctrl_usdhc1>;
> > +   pinctrl-names =3D "default", "state_100mhz", "state_200mhz", "sleep=
";
>
> Is the sleep pinctrl necessary if it is the same as 'default'?
>

Currently not necessary, I can drop it.

> > +   bus-width =3D <8>;
> > +   non-removable;
> > +   no-sdio;
> > +   no-sd;
> > +   status =3D "okay";
> > +};
> > +
> > +&usdhc2 {
> > +   pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> > +   pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> > +   pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> > +   pinctrl-3 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> > +   pinctrl-names =3D "default", "state_100mhz", "state_200mhz", "sleep=
";
>
> Same here.
>
> > +   bus-width =3D <4>;
> > +   cd-gpios =3D <&gpio4 20 GPIO_ACTIVE_LOW>;
> > +   vmmc-supply =3D <&reg_usdhc2_vmmc>;
>
> This is probably also 'no-mmc', no? Maybe even 'no-sdio'.
>

This slot is used for SD card, will update it as you suggested in next vers=
ion. Thx.

BR

> Best regards,
> Alexander
>
> > +   status =3D "okay";
> > +};
> > +
> > +&wdog3 {
> > +   fsl,ext-reset-output;
> > +   status =3D "okay";
> > +};
> >
>
>
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> http://www.tq-g/
> roup.com%2F&data=3D05%7C02%7Cping.bai%40nxp.com%7Cb24c8157d23c4d95
> b9a508dd77fb70f0%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63
> 8798643991989017%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRyd
> WUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%
> 3D%7C0%7C%7C%7C&sdata=3DwtlbuuuZBHYRvl7SF0GGH5CPI2oFGSURWSG6ZZ4
> EBqg%3D&reserved=3D0
>

