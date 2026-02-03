Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013070.outbound.protection.outlook.com [40.107.159.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDAA36D4EB
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 06:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770099469; cv=fail; b=NxvLf+YaJPHn3AuCo014OUtixZdSlKLQ0eJpiWvVsjz8gUKuprgI6wCLMaB5PbyziLdY7Cy3QEuP1YTOElE0sRyjoksjVydWW5HvjV6wn1SM0Ng5xBUVRgjIXTGI/+ALd9BeCm1yEILPx3jOaGVR7BQQwyyuAl4jMH6TXiqIjHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770099469; c=relaxed/simple;
	bh=qZQpGMVJe37F/Uo1zirClZ7hIdwUyjFoHcYVLKU5BGo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=g6EPGbbD7oJVOvSkR6j7OpbcQiaerJTS5MIYeQWYr4zY7N1jnrNzA+Ggg5lXMaEzcmXgKlbXCV3Q/oxcB3Oql7IGZvMw1uxWJTKr29TlqhAaTFHw76hOjCU2pmv/3Hdc+7/pnYENWPytxqKfzh4H8xS8RgpVFIEZifM4qTNePV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mONw79ew; arc=fail smtp.client-ip=40.107.159.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mONw79ew"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARMHDXul63KXzGsLiPI0MfZO4p2NeE9JBTU34/wHfePypndrzsbQWRSShUojVQzPIuCza7MRYOt6elzyo9d1j2nGm6y8O48UJABSrsL2UQG7XJtzO9keLGR9emJIpVy3rSzmScShHDoV/Wy21hpuGMcmnpZjiHkHR7iMh9qW0/a2ksth1wmjUUftMx17jccJpYBipt7U/umkgL+SQ3VsQiWsn5wo8c1tnc9Y+BeO+0qu0Z6fxIpMUg4b7GRQy6Pk2+XnUSJFlKjpFpdF7mlEpOfnl1zNb5PC6BHXBM6d8pJO3SDQwYsra1wM6psso2TQPd8o6O8VcnUPNlP5V9CJ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbeQHq6Sf4pONAJ7jcuLu7taCxzJ9V5mskwTEwLFkiY=;
 b=AXaRsJWytE5/Iv8j2UgXVs0N8pQmRmzBgBMyhv8EHAHc9mzs84ZvsiJMgcRHUOavpT/WqwPrRh3WOuvYj1G72CpAwcFHuf8Hr+YZ3vrIL13fPbr3mdqjki/26DaP91VXHbJv94jnGj8+9wDP/reegf4Bs2XHI7ED4NJnUEfE7927MCjzej6ex8Di6EZ1RqRst6PhiI5kdxRAxIgF4qfyibF9Acn3x7UQI91gvuhGFOaOTkOaDhORPpXJLEkp0JWioFQfndS3aSfcgYs8TF+ht7IOQTqD3xgWv6arORuxH5iCk/iRitZM9jvyFhTYnRSzHc4h+t4/chKzFFwlXD7fCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbeQHq6Sf4pONAJ7jcuLu7taCxzJ9V5mskwTEwLFkiY=;
 b=mONw79ewVviD4SyKZ3I/su813nfGIAUy0hpinHeY8k3v6v3yX7Tt2Hpatl7H3m1c9WyXluI/cZyB+Okj7ynDdYjv+fxg74O6gZ8/UigtORGi3L4fUdWOw6F6GkuwA8Ro986mpf5QWpqAJbjYKrm46EhD5iYT3BH3gKFq2WLbfiUan4KmSdkeq6IQBBHx6mjkUVYnxnJVQls7t4AQB9Rv5sa8f7lXeCNDmqNE3L4XN4MF7ceX4eDykQ7uS5sCfk8PfqycdvVou8gDa9ugDMo9lK/WxU4dNKLOc2B5vVMBU6j+CfSl18wNQ1/DMw6QBbHqsQ8Ld+vVKOiDTXHKlWMNYw==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DB8PR04MB7132.eurprd04.prod.outlook.com
 (2603:10a6:10:12e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 06:17:43 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 06:17:43 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Daniel
 Baluta <daniel.baluta@nxp.com>, "dario.binacchi@amarulasolutions.com"
	<dario.binacchi@amarulasolutions.com>, "alexander.stein@ew.tq-group.com"
	<alexander.stein@ew.tq-group.com>, "Markus.Niebel@tq-group.com"
	<Markus.Niebel@tq-group.com>, "matthias.schiffer@tq-group.com"
	<matthias.schiffer@tq-group.com>, "y.moog@phytec.de" <y.moog@phytec.de>,
	"josua@solid-run.com" <josua@solid-run.com>, Francesco Dolcini
	<francesco.dolcini@toradex.com>, "primoz.fiser@norik.com"
	<primoz.fiser@norik.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V4 2/4] arm64: dts: imx93: Extract common parts of 11x11
 EVK into imx93-evk-common.dtsi
Thread-Topic: [PATCH V4 2/4] arm64: dts: imx93: Extract common parts of 11x11
 EVK into imx93-evk-common.dtsi
Thread-Index: AQHckPtezwNzNMrfO0qxUbPZDCwOu7VpZk4AgAchKMA=
Date: Tue, 3 Feb 2026 06:17:42 +0000
Message-ID:
 <VI0PR04MB12114223AA07C606A170CEAF2929BA@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260129084249.3079432-1-sherry.sun@nxp.com>
 <20260129084249.3079432-3-sherry.sun@nxp.com>
 <aXuX0r4RIGxWsWXK@lizhi-Precision-Tower-5810>
In-Reply-To: <aXuX0r4RIGxWsWXK@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|DB8PR04MB7132:EE_
x-ms-office365-filtering-correlation-id: 5be64a8c-7c18-4246-40eb-08de62ebf0c6
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?TvzoxLruO77J7feCduGDHFXOFys93DQN6mOjGSnnpbNqt5QxucgOleRg1f0X?=
 =?us-ascii?Q?eGe548urZMTTp62kExH82f5ARtL9NLSSzmwHGoUWHKKN4A7t4nVm/ods7Xa6?=
 =?us-ascii?Q?q1cSyv/r79I8EQjrvhf16xoVhwz4UMEyHu9Ipgo0c71HR0VZa1wMQwAIjcib?=
 =?us-ascii?Q?G5AfVqE6f3Em69LocwCVO0Y7dAHFrfyKbNyyDaNRO3uk4IUXav35V37W6q4N?=
 =?us-ascii?Q?eYEL+CkQ+YynE15RSIPMaYW06sOahkZjadSf/7HC71JEBnRHclPs0zELtLe6?=
 =?us-ascii?Q?Ts3EB/OHorWAt/Fx/Pr5S7jWM2JS0aiKaopBpD3KVy3XgjPTcEDDTDH+RTsn?=
 =?us-ascii?Q?bg7aIouvRr5/B5K/jpCkBlc+7Vqp/lQ240xrqxyKbDd6Ws0uOxm2b4Tbtmd4?=
 =?us-ascii?Q?vWvICL9IRjie9xPJb9BfsTbDEhux9e3Zwpt1lzOxCdSuR55InKgQ8rKtbgB4?=
 =?us-ascii?Q?axQy3JSZm15ONuS8VDotY0AzzyW1kyD6bDWO4GUw6WQP4bJZHrC8z9mux0/r?=
 =?us-ascii?Q?qMsMSHsjLoya3miiqwHbI7ETfe0LQ7A7bfWa927GqXmAIi1+9kYMgWH8foa+?=
 =?us-ascii?Q?BLSJ3vEk88+UjHotGdbOw9zXHuQAMtncWvbRny6dp8Qd2g1PutOg49B2Gzuv?=
 =?us-ascii?Q?NhtLEEMFYMPY65JErg7SyfMZ7oHdGmEXSUZQROEe3sqzjbTSO6fAr1uQkSC0?=
 =?us-ascii?Q?nYnWnBtu4BxSHjiuSOmMD/wsIOl4qgC8rEML9X7MBdVMqxWmH8/by8kYRN6c?=
 =?us-ascii?Q?Xgevc3XgOAqJL3uHE2R9T71oauq2Ixt3K5+8Bi74/pXE2I4PRFrehUfQWZGJ?=
 =?us-ascii?Q?OXYpfREfAAuL2yD8/cXDmpkVt7F22Rg6gKtiewZkDm9nm8/YxCnBPuELLJNN?=
 =?us-ascii?Q?sx5+JySgGc2yolwvF89yRuOVw+ad9HniDobv5rYPqkpWlxu3RAF6gyUzQbLR?=
 =?us-ascii?Q?WcXpTfYQjyXhlWuI47XWRm/Ge+H5HWEitF/KL6eixou5HR405GCGq4UvoI7i?=
 =?us-ascii?Q?baHlCVvUjzM5J+J2Gci3L6yRRHSk2yo8WzUJwSVXkwkaAxaPJ0b37QCz4TH9?=
 =?us-ascii?Q?HOzsvuj/GiHKZCjOW18bhbi9hW6kfuxkOGVkGEZraNHPjgHxRoJRSSCji6Hm?=
 =?us-ascii?Q?j8sBFM425vDm7mTixmlHvhN3v9Gl7iX2L4HNL5sap8u3I8QkHVzhVgiZr7Ab?=
 =?us-ascii?Q?b8xjMiKAtY4W7f1Ap7HhSa3PDkc2ZNPuZDtfBJOvmc0fVdeXz2CoO4v6tyTF?=
 =?us-ascii?Q?HK3oCd9Zxi+3DukM52Z1TXys93U0utI+ifclRap1MFG6qMW2dbA7P4yJwDb3?=
 =?us-ascii?Q?APmuFxfW6y4mLXDpoKOvNoUNbpuAWgBWlO5FX2iR9r8ymC7u0a/U3z+bEZ7c?=
 =?us-ascii?Q?ZC5+LYisW/oCphxpYWm7TIpZ4yTOxfa1HtmbwE39EdxAs3rMwSSOhTwhKRzD?=
 =?us-ascii?Q?PrfCHOeOonqy7D+VoLwgQjUM3wBO9MycEpBkSOkFOlmDraQQIyYKf0ajpPjs?=
 =?us-ascii?Q?UxLURit1mT3rjy/v6nQShsKFVx47f+txpJSdZ25vqb9zsj87sgUEdYxjA9N8?=
 =?us-ascii?Q?AJX5CCmNB2UWDI++flQKrTxLfM5sodXHZvVJzHgvo/fnQTtAnNIk46XIvzvp?=
 =?us-ascii?Q?tjVE2b6T77Xs/r3LeChFabY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?W+1+mPbQPAyexKyTrqeswiRaSAPbTCLWqo6FRsMMxwJddUogZ6C40SFoLstF?=
 =?us-ascii?Q?XvT4wRBnYWBrN1VVSWOP9nsT4qmAYrlYYR0qkNSfiT5z+q00bKWsXfyu6FpL?=
 =?us-ascii?Q?mXLNRg8kogPnsw03nCyhIUE76H102So/swSjUQHJiUEhp7I6e9o0dE+E7Jid?=
 =?us-ascii?Q?USLA0ca1w7CW4mKWl1tzxwm55WcxkF1OgA5GZoeovNkXmUYqQE5lNoJrUqF3?=
 =?us-ascii?Q?yKYgIUazPFbepE/HhfFi9JVEb9iBQOelOcX21gMjVToxdC6lZtJLQeXC/PX5?=
 =?us-ascii?Q?nv0xJ3qlmMYDJxTLBJPD5YT+smHwFiEGgA4Yb8yBtKVDLM3KPqM6VagOAf6c?=
 =?us-ascii?Q?r+gE3sPSm+t2DFYbLuSafNbjC/HdP5KZDVWttgFJUiWxj9J/kej9pmOs34Lo?=
 =?us-ascii?Q?5tHXefwLF4p8E8zSkCdE5rCGMdvlKyDrXwwv7ZyXtUVcU9qnh6cI5B9HJ/Y8?=
 =?us-ascii?Q?IVP0aTJx+yo/XW5ZUcoQj8HonDWrtWiUIf4UfjS5Tpe8u8Gs0/62z5+Y+ziE?=
 =?us-ascii?Q?GetFRWNnWdV7VL4UnJEgIsAmYOZ8sGiJdSR5q4qWOAsIPH5goYUOKIwn4Wu0?=
 =?us-ascii?Q?UFrtUcGWS//wNrXM9qqDPnFvOl6JUqLck6kPiE3p+A7yombB+9LnNP3+NG2o?=
 =?us-ascii?Q?u4BOtXoB7mz+lP9n+VKqAUUdo0RNbCFTI3bHmow3vGlGVN5Sww3DBARj7QY4?=
 =?us-ascii?Q?UduqKzQOUcUg+DnBtKc6iMfwtlCc8qFr4gEcKlI47jVpqb/TeVq0CpAVvOSX?=
 =?us-ascii?Q?Yfz2fx2F8rzMq2K367yN/nJfn1/4NnlxWRBPVlTK61RazUVdNkav19HYFTIZ?=
 =?us-ascii?Q?/UacSvwU+aQhMyUqAy/pD4IQv8QUaLoictXeBIygXGXK/Xf/ttcQi/GR9/Iz?=
 =?us-ascii?Q?cFRbbTjuAHZBcfJDblSGpDk4iHqrAQkFj3fu9SispGr/wBy7Bp1uB23KWmVK?=
 =?us-ascii?Q?5bmepIwTxOhP/rByDRZzQ6DgltSQNpRVDVfRjZNZ+rI4kxPlPYuyQGeUEgKh?=
 =?us-ascii?Q?ESY7SHF+AEYOJJcvzV+w4H1iWllHKVJ/J+SrDJBG+9ZFyVktvwdtWobaGm2o?=
 =?us-ascii?Q?cgyTRWXHFsJntHHjU4FGEUptYKPO/kYCfq8TVl5+WTboaDtDGPD8ASUo/YAn?=
 =?us-ascii?Q?9xai1sF/k8ma0dEOrCe98Zw8Ho1IrIsbu6zBE2wab6i1SMBPfTFPQvb/mleP?=
 =?us-ascii?Q?xHzAsurduEb825rNIxDLDlXlJAiSH+sMlbKU+kQbz0sML5y/OwYLt+VrikA0?=
 =?us-ascii?Q?ww9AmXIXL1HXLtfrL5N0Rljpt4kNUolp90ldKGE4nLrV5LoUN5cUcuzb+lQK?=
 =?us-ascii?Q?qrZvjTl16Z9sFnJXZrFjUYL9kwQzramgVC/VNL11U4nSvpqeGB/k0D5lqqDJ?=
 =?us-ascii?Q?FIITX1nKkCRMMpfybGGx14m0SmN4hmXxC8BKVSUeVDGJwLReUjKmJfQLuPB9?=
 =?us-ascii?Q?fbEYSf7iNHIxyAEvVZLpZjxmc0U/nzUFHOWlQLWnoeBLL5HWpd7eGn2Ak7ki?=
 =?us-ascii?Q?Qt0lHM3i0/POUIgYI217dKNI9Hg5f9nffo7X36jBA+aksFn/fCPQHN3yKi2H?=
 =?us-ascii?Q?mv+jY6+UTlJR1f6pbHxQyC+qzIg7LFVi99umQ3/RkN2zqsIViUVMBDSNFqbp?=
 =?us-ascii?Q?nrz5sNms9f3XSl98CpkRftr30u0Ng1wX/fRFxSc4v+BXLxhRzHHJcKvXXRjp?=
 =?us-ascii?Q?Xd+fV9UFZCy4auP0xICJJ5pbcCFfXT2xku6AWckRYk+eVbg8?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be64a8c-7c18-4246-40eb-08de62ebf0c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 06:17:42.9209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UHru8IOvB7MKXbbvCDeybaQAyURUCi+O7uiaRQUosyoFHy5Ih6qvvA8RieXzyjxbaA2WfYDYsqEYwUrBAmF7Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7132

> On Thu, Jan 29, 2026 at 04:42:47PM +0800, Sherry Sun wrote:
> > The i.MX93 Wireless EVK board reuses most of the design of the 11x11
> > EVK. To avoid duplication and DTS-to-DTS include, extract the common
> > parts into a new imx93-evk-common.dtsi, which will be included by both
> > the 11x11 EVK and the Wireless EVK DTS files.
> >
> > No functional change intended.
> >
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
> >  .../boot/dts/freescale/imx93-11x11-evk.dts    | 861 +-----------------
> >  ...93-11x11-evk.dts =3D> imx93-evk-common.dtsi} | 207 +----
>=20
> Change still big. Maybe below step help
> 1. rename imx93-evk-11x11.dtsi to imx93-evk-common.dtsi
>    create new file imx93-11x11-evk.dts, which include imx93-evk-common.dt=
si.
>    (supposed file name should be imx93-evk-11x11-common.dtsi)
>=20
> 2. Move different part from imx93-evk-common.dtsi to imx93-11x11-evk

Ok, will do. Thanks.

Best Regards
Sherry

>=20
> Frank
> >  2 files changed, 9 insertions(+), 1059 deletions(-)  copy
> > arch/arm64/boot/dts/freescale/{imx93-11x11-evk.dts =3D>
> > imx93-evk-common.dtsi} (79%)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> > b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> > index acb160d3186c..2588f39f0239 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> > @@ -5,114 +5,13 @@
> >
> >  /dts-v1/;
> >
> > -#include <dt-bindings/usb/pd.h>
> >  #include "imx93.dtsi"
> > +#include "imx93-evk-common.dtsi"
> >
> >  / {
> >  	model =3D "NXP i.MX93 11X11 EVK board";
> >  	compatible =3D "fsl,imx93-11x11-evk", "fsl,imx93";
> >
> > -	aliases {
> > -		ethernet0 =3D &fec;
> > -		ethernet1 =3D &eqos;
> > -		gpio0 =3D &gpio1;
> > -		gpio1 =3D &gpio2;
> > -		gpio2 =3D &gpio3;
> > -		i2c0 =3D &lpi2c1;
> > -		i2c1 =3D &lpi2c2;
> > -		i2c2 =3D &lpi2c3;
> > -		mmc0 =3D &usdhc1;
> > -		mmc1 =3D &usdhc2;
> > -		rtc0 =3D &bbnsm_rtc;
> > -		serial0 =3D &lpuart1;
> > -		serial1 =3D &lpuart2;
> > -		serial2 =3D &lpuart3;
> > -		serial3 =3D &lpuart4;
> > -		serial4 =3D &lpuart5;
> > -	};
> > -
> > -	chosen {
> > -		stdout-path =3D &lpuart1;
> > -	};
> > -
> > -	reserved-memory {
> > -		#address-cells =3D <2>;
> > -		#size-cells =3D <2>;
> > -		ranges;
> > -
> > -		linux,cma {
> > -			compatible =3D "shared-dma-pool";
> > -			reusable;
> > -			alloc-ranges =3D <0 0x80000000 0 0x40000000>;
> > -			size =3D <0 0x10000000>;
> > -			linux,cma-default;
> > -		};
> > -
> > -		vdev0vring0: vdev0vring0@a4000000 {
> > -			reg =3D <0 0xa4000000 0 0x8000>;
> > -			no-map;
> > -		};
> > -
> > -		vdev0vring1: vdev0vring1@a4008000 {
> > -			reg =3D <0 0xa4008000 0 0x8000>;
> > -			no-map;
> > -		};
> > -
> > -		vdev1vring0: vdev1vring0@a4010000 {
> > -			reg =3D <0 0xa4010000 0 0x8000>;
> > -			no-map;
> > -		};
> > -
> > -		vdev1vring1: vdev1vring1@a4018000 {
> > -			reg =3D <0 0xa4018000 0 0x8000>;
> > -			no-map;
> > -		};
> > -
> > -		rsc_table: rsc-table@2021e000 {
> > -			reg =3D <0 0x2021e000 0 0x1000>;
> > -			no-map;
> > -		};
> > -
> > -		vdevbuffer: vdevbuffer@a4020000 {
> > -			compatible =3D "shared-dma-pool";
> > -			reg =3D <0 0xa4020000 0 0x100000>;
> > -			no-map;
> > -		};
> > -
> > -	};
> > -
> > -	flexcan_phy: can-phy {
> > -		compatible =3D "nxp,tja1057";
> > -		#phy-cells =3D <0>;
> > -		max-bitrate =3D <5000000>;
> > -		silent-gpios =3D <&adp5585 6 GPIO_ACTIVE_HIGH>;
> > -	};
> > -
> > -	reg_vdd_12v: regulator-vdd-12v {
> > -		compatible =3D "regulator-fixed";
> > -		regulator-name =3D "VDD_12V";
> > -		regulator-min-microvolt =3D <12000000>;
> > -		regulator-max-microvolt =3D <12000000>;
> > -		gpio =3D <&pcal6524 14 GPIO_ACTIVE_HIGH>;
> > -		enable-active-high;
> > -	};
> > -
> > -	reg_vref_1v8: regulator-adc-vref {
> > -		compatible =3D "regulator-fixed";
> > -		regulator-name =3D "vref_1v8";
> > -		regulator-min-microvolt =3D <1800000>;
> > -		regulator-max-microvolt =3D <1800000>;
> > -	};
> > -
> > -	reg_audio_pwr: regulator-audio-pwr {
> > -		compatible =3D "regulator-fixed";
> > -		regulator-name =3D "audio-pwr";
> > -		regulator-min-microvolt =3D <3300000>;
> > -		regulator-max-microvolt =3D <3300000>;
> > -		gpio =3D <&adp5585 1 GPIO_ACTIVE_HIGH>;
> > -		enable-active-high;
> > -	};
> > -
> >  	reg_m2_pwr: regulator-m2-pwr {
> >  		compatible =3D "regulator-fixed";
> >  		regulator-name =3D "M.2-power";
> > @@ -122,18 +21,6 @@ reg_m2_pwr: regulator-m2-pwr {
> >  		enable-active-high;
> >  	};
> >
> > -	reg_usdhc2_vmmc: regulator-usdhc2 {
> > -		compatible =3D "regulator-fixed";
> > -		pinctrl-names =3D "default";
> > -		pinctrl-0 =3D <&pinctrl_reg_usdhc2_vmmc>;
> > -		regulator-name =3D "VSD_3V3";
> > -		regulator-min-microvolt =3D <3300000>;
> > -		regulator-max-microvolt =3D <3300000>;
> > -		gpio =3D <&gpio3 7 GPIO_ACTIVE_HIGH>;
> > -		off-on-delay-us =3D <12000>;
> > -		enable-active-high;
> > -	};
> > -
> >  	reg_usdhc3_vmmc: regulator-usdhc3 {
> >  		compatible =3D "regulator-fixed";
> >  		regulator-name =3D "WLAN_EN";
> > @@ -156,17 +43,6 @@ usdhc3_pwrseq: usdhc3_pwrseq {
> >  		reset-gpios =3D <&pcal6524 12 GPIO_ACTIVE_LOW>;
> >  	};
> >
> > -	backlight_lvds: backlight-lvds {
> > -		compatible =3D "pwm-backlight";
> > -		pwms =3D <&adp5585 0 100000 0>;
> > -		brightness-levels =3D <0 100>;
> > -		num-interpolated-steps =3D <100>;
> > -		default-brightness-level =3D <100>;
> > -		power-supply =3D <&reg_vdd_12v>;
> > -		enable-gpios =3D <&adp5585 9 GPIO_ACTIVE_HIGH>;
> > -		status =3D "disabled";
> > -	};
> > -
> >  	bt_sco_codec: bt-sco-codec {
> >  		compatible =3D "linux,bt-sco";
> >  		#sound-dai-cells =3D <1>;
> > @@ -204,354 +80,6 @@ cpu {
> >  			};
> >  		};
> >  	};
> > -
> > -	sound-wm8962 {
> > -		compatible =3D "fsl,imx-audio-wm8962";
> > -		model =3D "wm8962-audio";
> > -		audio-cpu =3D <&sai3>;
> > -		audio-codec =3D <&wm8962>;
> > -		hp-det-gpio =3D <&pcal6524 4 GPIO_ACTIVE_HIGH>;
> > -		audio-routing =3D
> > -			"Headphone Jack", "HPOUTL",
> > -			"Headphone Jack", "HPOUTR",
> > -			"Ext Spk", "SPKOUTL",
> > -			"Ext Spk", "SPKOUTR",
> > -			"AMIC", "MICBIAS",
> > -			"IN3R", "AMIC",
> > -			"IN1R", "AMIC";
> > -	};
> > -
> > -	sound-xcvr {
> > -		compatible =3D "fsl,imx-audio-card";
> > -		model =3D "imx-audio-xcvr";
> > -
> > -		pri-dai-link {
> > -			link-name =3D "XCVR PCM";
> > -
> > -			cpu {
> > -				sound-dai =3D <&xcvr>;
> > -			};
> > -		};
> > -	};
> > -};
> > -
> > -&adc1 {
> > -	vref-supply =3D <&reg_vref_1v8>;
> > -	status =3D "okay";
> > -};
> > -
> > -&cm33 {
> > -	mbox-names =3D "tx", "rx", "rxdb";
> > -	mboxes =3D <&mu1 0 1>,
> > -		 <&mu1 1 1>,
> > -		 <&mu1 3 1>;
> > -	memory-region =3D <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> > -			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> > -	status =3D "okay";
> > -};
> > -
> > -&eqos {
> > -	pinctrl-names =3D "default", "sleep";
> > -	pinctrl-0 =3D <&pinctrl_eqos>;
> > -	pinctrl-1 =3D <&pinctrl_eqos_sleep>;
> > -	phy-mode =3D "rgmii-id";
> > -	phy-handle =3D <&ethphy1>;
> > -	status =3D "okay";
> > -
> > -	mdio {
> > -		compatible =3D "snps,dwmac-mdio";
> > -		#address-cells =3D <1>;
> > -		#size-cells =3D <0>;
> > -		clock-frequency =3D <5000000>;
> > -
> > -		ethphy1: ethernet-phy@1 {
> > -			reg =3D <1>;
> > -			reset-gpios =3D <&pcal6524 15 GPIO_ACTIVE_LOW>;
> > -			reset-assert-us =3D <10000>;
> > -			reset-deassert-us =3D <80000>;
> > -			realtek,clkout-disable;
> > -		};
> > -	};
> > -};
> > -
> > -&fec {
> > -	pinctrl-names =3D "default", "sleep";
> > -	pinctrl-0 =3D <&pinctrl_fec>;
> > -	pinctrl-1 =3D <&pinctrl_fec_sleep>;
> > -	phy-mode =3D "rgmii-id";
> > -	phy-handle =3D <&ethphy2>;
> > -	fsl,magic-packet;
> > -	status =3D "okay";
> > -
> > -	mdio {
> > -		#address-cells =3D <1>;
> > -		#size-cells =3D <0>;
> > -		clock-frequency =3D <5000000>;
> > -
> > -		ethphy2: ethernet-phy@2 {
> > -			reg =3D <2>;
> > -			reset-gpios =3D <&pcal6524 16 GPIO_ACTIVE_LOW>;
> > -			reset-assert-us =3D <10000>;
> > -			reset-deassert-us =3D <80000>;
> > -			realtek,clkout-disable;
> > -		};
> > -	};
> > -};
> > -
> > -&flexcan2 {
> > -	pinctrl-names =3D "default";
> > -	pinctrl-0 =3D <&pinctrl_flexcan2>;
> > -	phys =3D <&flexcan_phy>;
> > -	status =3D "okay";
> > -};
> > -
> > -&lpi2c1 {
> > -	clock-frequency =3D <400000>;
> > -	pinctrl-names =3D "default";
> > -	pinctrl-0 =3D <&pinctrl_lpi2c1>;
> > -	status =3D "okay";
> > -
> > -	wm8962: codec@1a {
> > -		compatible =3D "wlf,wm8962";
> > -		reg =3D <0x1a>;
> > -		clocks =3D <&clk IMX93_CLK_SAI3_GATE>;
> > -		DCVDD-supply =3D <&reg_audio_pwr>;
> > -		DBVDD-supply =3D <&reg_audio_pwr>;
> > -		AVDD-supply =3D <&reg_audio_pwr>;
> > -		CPVDD-supply =3D <&reg_audio_pwr>;
> > -		MICVDD-supply =3D <&reg_audio_pwr>;
> > -		PLLVDD-supply =3D <&reg_audio_pwr>;
> > -		SPKVDD1-supply =3D <&reg_audio_pwr>;
> > -		SPKVDD2-supply =3D <&reg_audio_pwr>;
> > -		gpio-cfg =3D <
> > -			0x0000 /* 0:Default */
> > -			0x0000 /* 1:Default */
> > -			0x0000 /* 2:FN_DMICCLK */
> > -			0x0000 /* 3:Default */
> > -			0x0000 /* 4:FN_DMICCDAT */
> > -			0x0000 /* 5:Default */
> > -		>;
> > -	};
> > -
> > -	inertial-meter@6a {
> > -		compatible =3D "st,lsm6dso";
> > -		reg =3D <0x6a>;
> > -	};
> > -};
> > -
> > -&lpi2c2 {
> > -	clock-frequency =3D <400000>;
> > -	pinctrl-names =3D "default";
> > -	pinctrl-0 =3D <&pinctrl_lpi2c2>;
> > -	status =3D "okay";
> > -
> > -	pcal6524: gpio@22 {
> > -		compatible =3D "nxp,pcal6524";
> > -		reg =3D <0x22>;
> > -		pinctrl-names =3D "default";
> > -		pinctrl-0 =3D <&pinctrl_pcal6524>;
> > -		gpio-controller;
> > -		#gpio-cells =3D <2>;
> > -		interrupt-controller;
> > -		#interrupt-cells =3D <2>;
> > -		interrupt-parent =3D <&gpio3>;
> > -		interrupts =3D <27 IRQ_TYPE_LEVEL_LOW>;
> > -
> > -		m2-pcm-level-shifter-hog {
> > -			gpio-hog;
> > -			gpios =3D <19 GPIO_ACTIVE_HIGH>;
> > -			output-high;
> > -		};
> > -	};
> > -
> > -	pmic@25 {
> > -		compatible =3D "nxp,pca9451a";
> > -		reg =3D <0x25>;
> > -		interrupt-parent =3D <&pcal6524>;
> > -		interrupts =3D <11 IRQ_TYPE_EDGE_FALLING>;
> > -
> > -		regulators {
> > -			buck1: BUCK1 {
> > -				regulator-name =3D "BUCK1";
> > -				regulator-min-microvolt =3D <610000>;
> > -				regulator-max-microvolt =3D <950000>;
> > -				regulator-boot-on;
> > -				regulator-always-on;
> > -				regulator-ramp-delay =3D <3125>;
> > -			};
> > -
> > -			buck2: BUCK2 {
> > -				regulator-name =3D "BUCK2";
> > -				regulator-min-microvolt =3D <600000>;
> > -				regulator-max-microvolt =3D <670000>;
> > -				regulator-boot-on;
> > -				regulator-always-on;
> > -				regulator-ramp-delay =3D <3125>;
> > -			};
> > -
> > -			buck4: BUCK4 {
> > -				regulator-name =3D "BUCK4";
> > -				regulator-min-microvolt =3D <1620000>;
> > -				regulator-max-microvolt =3D <3400000>;
> > -				regulator-boot-on;
> > -				regulator-always-on;
> > -			};
> > -
> > -			buck5: BUCK5 {
> > -				regulator-name =3D "BUCK5";
> > -				regulator-min-microvolt =3D <1620000>;
> > -				regulator-max-microvolt =3D <3400000>;
> > -				regulator-boot-on;
> > -				regulator-always-on;
> > -			};
> > -
> > -			buck6: BUCK6 {
> > -				regulator-name =3D "BUCK6";
> > -				regulator-min-microvolt =3D <1060000>;
> > -				regulator-max-microvolt =3D <1140000>;
> > -				regulator-boot-on;
> > -				regulator-always-on;
> > -			};
> > -
> > -			ldo1: LDO1 {
> > -				regulator-name =3D "LDO1";
> > -				regulator-min-microvolt =3D <1620000>;
> > -				regulator-max-microvolt =3D <1980000>;
> > -				regulator-boot-on;
> > -				regulator-always-on;
> > -			};
> > -
> > -			ldo4: LDO4 {
> > -				regulator-name =3D "LDO4";
> > -				regulator-min-microvolt =3D <800000>;
> > -				regulator-max-microvolt =3D <840000>;
> > -				regulator-boot-on;
> > -				regulator-always-on;
> > -			};
> > -
> > -			ldo5: LDO5 {
> > -				regulator-name =3D "LDO5";
> > -				regulator-min-microvolt =3D <1800000>;
> > -				regulator-max-microvolt =3D <3300000>;
> > -				regulator-boot-on;
> > -				regulator-always-on;
> > -			};
> > -		};
> > -	};
> > -
> > -	adp5585: io-expander@34 {
> > -		compatible =3D "adi,adp5585-00", "adi,adp5585";
> > -		reg =3D <0x34>;
> > -		vdd-supply =3D <&buck4>;
> > -		gpio-controller;
> > -		#gpio-cells =3D <2>;
> > -		gpio-reserved-ranges =3D <5 1>;
> > -		#pwm-cells =3D <3>;
> > -	};
> > -};
> > -
> > -&lpi2c3 {
> > -	clock-frequency =3D <400000>;
> > -	pinctrl-names =3D "default";
> > -	pinctrl-0 =3D <&pinctrl_lpi2c3>;
> > -	status =3D "okay";
> > -
> > -	adp5585_isp: io-expander@34 {
> > -		compatible =3D "adi,adp5585-01", "adi,adp5585";
> > -		reg =3D <0x34>;
> > -		gpio-controller;
> > -		#gpio-cells =3D <2>;
> > -		#pwm-cells =3D <3>;
> > -	};
> > -
> > -	ptn5110: tcpc@50 {
> > -		compatible =3D "nxp,ptn5110", "tcpci";
> > -		reg =3D <0x50>;
> > -		interrupt-parent =3D <&gpio3>;
> > -		interrupts =3D <27 IRQ_TYPE_LEVEL_LOW>;
> > -
> > -		typec1_con: connector {
> > -			compatible =3D "usb-c-connector";
> > -			label =3D "USB-C";
> > -			power-role =3D "dual";
> > -			data-role =3D "dual";
> > -			try-power-role =3D "sink";
> > -			source-pdos =3D <PDO_FIXED(5000, 3000,
> PDO_FIXED_USB_COMM)>;
> > -			sink-pdos =3D <PDO_FIXED(5000, 3000,
> PDO_FIXED_USB_COMM)
> > -				     PDO_VAR(5000, 20000, 3000)>;
> > -			op-sink-microwatt =3D <15000000>;
> > -			self-powered;
> > -
> > -			ports {
> > -				#address-cells =3D <1>;
> > -				#size-cells =3D <0>;
> > -
> > -				port@0 {
> > -					reg =3D <0>;
> > -
> > -					typec1_dr_sw: endpoint {
> > -						remote-endpoint =3D
> <&usb1_drd_sw>;
> > -					};
> > -				};
> > -			};
> > -		};
> > -	};
> > -
> > -	ptn5110_2: tcpc@51 {
> > -		compatible =3D "nxp,ptn5110", "tcpci";
> > -		reg =3D <0x51>;
> > -		interrupt-parent =3D <&gpio3>;
> > -		interrupts =3D <27 IRQ_TYPE_LEVEL_LOW>;
> > -
> > -		typec2_con: connector {
> > -			compatible =3D "usb-c-connector";
> > -			label =3D "USB-C";
> > -			power-role =3D "dual";
> > -			data-role =3D "dual";
> > -			try-power-role =3D "sink";
> > -			source-pdos =3D <PDO_FIXED(5000, 3000,
> PDO_FIXED_USB_COMM)>;
> > -			sink-pdos =3D <PDO_FIXED(5000, 3000,
> PDO_FIXED_USB_COMM)
> > -				     PDO_VAR(5000, 20000, 3000)>;
> > -			op-sink-microwatt =3D <15000000>;
> > -			self-powered;
> > -
> > -			ports {
> > -				#address-cells =3D <1>;
> > -				#size-cells =3D <0>;
> > -
> > -				port@0 {
> > -					reg =3D <0>;
> > -
> > -					typec2_dr_sw: endpoint {
> > -						remote-endpoint =3D
> <&usb2_drd_sw>;
> > -					};
> > -				};
> > -			};
> > -		};
> > -	};
> > -
> > -	pcf2131: rtc@53 {
> > -		compatible =3D "nxp,pcf2131";
> > -		reg =3D <0x53>;
> > -		interrupt-parent =3D <&pcal6524>;
> > -		interrupts =3D <1 IRQ_TYPE_EDGE_FALLING>;
> > -	};
> > -};
> > -
> > -&lpuart1 { /* console */
> > -	pinctrl-names =3D "default";
> > -	pinctrl-0 =3D <&pinctrl_uart1>;
> > -	status =3D "okay";
> > -};
> > -
> > -&lpuart5 {
> > -	pinctrl-names =3D "default";
> > -	pinctrl-0 =3D <&pinctrl_uart5>;
> > -	status =3D "okay";
> > -
> > -	bluetooth {
> > -		compatible =3D "nxp,88w8987-bt";
> > -	};
> >  };
> >
> >  &micfil {
> > @@ -564,12 +92,12 @@ &micfil {
> >  	status =3D "okay";
> >  };
> >
> > -&mu1 {
> > -	status =3D "okay";
> > -};
> > -
> > -&mu2 {
> > -	status =3D "okay";
> > +&pcal6524 {
> > +	m2-pcm-level-shifter-hog {
> > +		gpio-hog;
> > +		gpios =3D <19 GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +	};
> >  };
> >
> >  &sai1 {
> > @@ -583,76 +111,6 @@ &sai1 {
> >  	status =3D "okay";
> >  };
> >
> > -&sai3 {
> > -	pinctrl-names =3D "default", "sleep";
> > -	pinctrl-0 =3D <&pinctrl_sai3>;
> > -	pinctrl-1 =3D <&pinctrl_sai3_sleep>;
> > -	assigned-clocks =3D <&clk IMX93_CLK_SAI3>;
> > -	assigned-clock-parents =3D <&clk IMX93_CLK_AUDIO_PLL>;
> > -	assigned-clock-rates =3D <12288000>;
> > -	fsl,sai-mclk-direction-output;
> > -	status =3D "okay";
> > -};
> > -
> > -&usbotg1 {
> > -	dr_mode =3D "otg";
> > -	hnp-disable;
> > -	srp-disable;
> > -	adp-disable;
> > -	usb-role-switch;
> > -	disable-over-current;
> > -	samsung,picophy-pre-emp-curr-control =3D <3>;
> > -	samsung,picophy-dc-vol-level-adjust =3D <7>;
> > -	status =3D "okay";
> > -
> > -	port {
> > -		usb1_drd_sw: endpoint {
> > -			remote-endpoint =3D <&typec1_dr_sw>;
> > -		};
> > -	};
> > -};
> > -
> > -&usbotg2 {
> > -	dr_mode =3D "otg";
> > -	hnp-disable;
> > -	srp-disable;
> > -	adp-disable;
> > -	usb-role-switch;
> > -	disable-over-current;
> > -	samsung,picophy-pre-emp-curr-control =3D <3>;
> > -	samsung,picophy-dc-vol-level-adjust =3D <7>;
> > -	status =3D "okay";
> > -
> > -	port {
> > -		usb2_drd_sw: endpoint {
> > -			remote-endpoint =3D <&typec2_dr_sw>;
> > -		};
> > -	};
> > -};
> > -
> > -&usdhc1 {
> > -	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> > -	pinctrl-0 =3D <&pinctrl_usdhc1>;
> > -	pinctrl-1 =3D <&pinctrl_usdhc1_100mhz>;
> > -	pinctrl-2 =3D <&pinctrl_usdhc1_200mhz>;
> > -	bus-width =3D <8>;
> > -	non-removable;
> > -	status =3D "okay";
> > -};
> > -
> > -&usdhc2 {
> > -	pinctrl-names =3D "default", "state_100mhz", "state_200mhz", "sleep";
> > -	pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> > -	pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> > -	pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> > -	pinctrl-3 =3D <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
> > -	cd-gpios =3D <&gpio3 00 GPIO_ACTIVE_LOW>;
> > -	vmmc-supply =3D <&reg_usdhc2_vmmc>;
> > -	bus-width =3D <4>;
> > -	status =3D "okay";
> > -	no-mmc;
> > -};
> > -
> >  &usdhc3 {
> >  	pinctrl-names =3D "default", "state_100mhz", "state_200mhz", "sleep";
> >  	pinctrl-0 =3D <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>; @@ -
> 668,152
> > +126,7 @@ &usdhc3 {
> >  	status =3D "okay";
> >  };
> >
> > -&wdog3 {
> > -	pinctrl-names =3D "default";
> > -	pinctrl-0 =3D <&pinctrl_wdog>;
> > -	fsl,ext-reset-output;
> > -	status =3D "okay";
> > -};
> > -
> > -&xcvr {
> > -	pinctrl-names =3D "default", "sleep";
> > -	pinctrl-0 =3D <&pinctrl_spdif>;
> > -	pinctrl-1 =3D <&pinctrl_spdif_sleep>;
> > -	assigned-clocks =3D <&clk IMX93_CLK_SPDIF>,
> > -			 <&clk IMX93_CLK_AUDIO_XCVR>;
> > -	assigned-clock-parents =3D <&clk IMX93_CLK_AUDIO_PLL>,
> > -			 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
> > -	assigned-clock-rates =3D <12288000>, <200000000>;
> > -	status =3D "okay";
> > -};
> > -
> >  &iomuxc {
> > -	pinctrl_eqos: eqosgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_ENET1_MDC__ENET_QOS_MDC
> 		0x57e
> > -			MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO
> 		0x57e
> > -			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0
> 			0x57e
> > -			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1
> 			0x57e
> > -			MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2
> 			0x57e
> > -			MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3
> 			0x57e
> > -
> 	MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CL
> K	0x58e
> > -
> 	MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL
> 	0x57e
> > -			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0
> 			0x57e
> > -			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1
> 			0x57e
> > -			MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2
> 			0x57e
> > -			MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3
> 			0x57e
> > -
> 	MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CL
> K	0x58e
> > -
> 	MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL
> 	0x57e
> > -		>;
> > -	};
> > -
> > -	pinctrl_eqos_sleep: eqossleepgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_ENET1_MDC__GPIO4_IO00
> 		0x31e
> > -			MX93_PAD_ENET1_MDIO__GPIO4_IO01
> 			0x31e
> > -			MX93_PAD_ENET1_RD0__GPIO4_IO10
> 0x31e
> > -			MX93_PAD_ENET1_RD1__GPIO4_IO11
> 		0x31e
> > -			MX93_PAD_ENET1_RD2__GPIO4_IO12
> 		0x31e
> > -			MX93_PAD_ENET1_RD3__GPIO4_IO13
> 		0x31e
> > -			MX93_PAD_ENET1_RXC__GPIO4_IO09
> 0x31e
> > -			MX93_PAD_ENET1_RX_CTL__GPIO4_IO08
> 		0x31e
> > -			MX93_PAD_ENET1_TD0__GPIO4_IO05
> 0x31e
> > -			MX93_PAD_ENET1_TD1__GPIO4_IO04
> 0x31e
> > -			MX93_PAD_ENET1_TD2__GPIO4_IO03
> 		0x31e
> > -			MX93_PAD_ENET1_TD3__GPIO4_IO02
> 		0x31e
> > -			MX93_PAD_ENET1_TXC__GPIO4_IO07
> 0x31e
> > -			MX93_PAD_ENET1_TX_CTL__GPIO4_IO06
> 0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_fec: fecgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_ENET2_MDC__ENET1_MDC
> 		0x57e
> > -			MX93_PAD_ENET2_MDIO__ENET1_MDIO
> 		0x57e
> > -			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0
> 	0x57e
> > -			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1
> 	0x57e
> > -			MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2
> 	0x57e
> > -			MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3
> 	0x57e
> > -			MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC
> 	0x58e
> > -			MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL
> 	0x57e
> > -			MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0
> 	0x57e
> > -			MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1
> 	0x57e
> > -			MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2
> 	0x57e
> > -			MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3
> 	0x57e
> > -			MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC
> 	0x58e
> > -			MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL
> 	0x57e
> > -		>;
> > -	};
> > -
> > -	pinctrl_fec_sleep: fecsleepgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_ENET2_MDC__GPIO4_IO14
> 	0x51e
> > -			MX93_PAD_ENET2_MDIO__GPIO4_IO15
> 		0x51e
> > -			MX93_PAD_ENET2_RD0__GPIO4_IO24
> 	0x51e
> > -			MX93_PAD_ENET2_RD1__GPIO4_IO25
> 	0x51e
> > -			MX93_PAD_ENET2_RD2__GPIO4_IO26
> 	0x51e
> > -			MX93_PAD_ENET2_RD3__GPIO4_IO27
> 	0x51e
> > -			MX93_PAD_ENET2_RXC__GPIO4_IO23
> 0x51e
> > -			MX93_PAD_ENET2_RX_CTL__GPIO4_IO22
> 	0x51e
> > -			MX93_PAD_ENET2_TD0__GPIO4_IO19
> 	0x51e
> > -			MX93_PAD_ENET2_TD1__GPIO4_IO18
> 	0x51e
> > -			MX93_PAD_ENET2_TD2__GPIO4_IO17
> 	0x51e
> > -			MX93_PAD_ENET2_TD3__GPIO4_IO16
> 	0x51e
> > -			MX93_PAD_ENET2_TXC__GPIO4_IO21
> 0x51e
> > -			MX93_PAD_ENET2_TX_CTL__GPIO4_IO20
> 0x51e
> > -		>;
> > -	};
> > -
> > -	pinctrl_flexcan2: flexcan2grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_GPIO_IO25__CAN2_TX	0x139e
> > -			MX93_PAD_GPIO_IO27__CAN2_RX	0x139e
> > -		>;
> > -	};
> > -
> > -	pinctrl_uart1: uart1grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_UART1_RXD__LPUART1_RX
> 	0x31e
> > -			MX93_PAD_UART1_TXD__LPUART1_TX
> 	0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_uart5: uart5grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX
> 		0x31e
> > -			MX93_PAD_DAP_TDI__LPUART5_RX
> 	0x31e
> > -			MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B
> 		0x31e
> > -			MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B
> 		0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_lpi2c1: lpi2c1grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_I2C1_SCL__LPI2C1_SCL
> 	0x40000b9e
> > -			MX93_PAD_I2C1_SDA__LPI2C1_SDA
> 	0x40000b9e
> > -		>;
> > -	};
> > -
> > -	pinctrl_lpi2c2: lpi2c2grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_I2C2_SCL__LPI2C2_SCL
> 	0x40000b9e
> > -			MX93_PAD_I2C2_SDA__LPI2C2_SDA
> 	0x40000b9e
> > -		>;
> > -	};
> > -
> > -	pinctrl_lpi2c3: lpi2c3grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_GPIO_IO28__LPI2C3_SDA
> 	0x40000b9e
> > -			MX93_PAD_GPIO_IO29__LPI2C3_SCL
> 	0x40000b9e
> > -		>;
> > -	};
> > -
> > -	pinctrl_pcal6524: pcal6524grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_CCM_CLKO2__GPIO3_IO27
> 	0x31e
> > -		>;
> > -	};
> > -
> >  	pinctrl_pdm: pdmgrp {
> >  		fsl,pins =3D <
> >  			MX93_PAD_PDM_CLK__PDM_CLK
> 	0x31e
> > @@ -848,160 +161,6 @@ MX93_PAD_SAI1_RXD0__GPIO1_IO14
> 		0x51e
> >  		>;
> >  	};
> >
> > -	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > -	pinctrl_usdhc1: usdhc1grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD1_CLK__USDHC1_CLK
> 	0x1582
> > -			MX93_PAD_SD1_CMD__USDHC1_CMD
> 	0x40001382
> > -			MX93_PAD_SD1_DATA0__USDHC1_DATA0
> 	0x40001382
> > -			MX93_PAD_SD1_DATA1__USDHC1_DATA1
> 	0x40001382
> > -			MX93_PAD_SD1_DATA2__USDHC1_DATA2
> 	0x40001382
> > -			MX93_PAD_SD1_DATA3__USDHC1_DATA3
> 	0x40001382
> > -			MX93_PAD_SD1_DATA4__USDHC1_DATA4
> 	0x40001382
> > -			MX93_PAD_SD1_DATA5__USDHC1_DATA5
> 	0x40001382
> > -			MX93_PAD_SD1_DATA6__USDHC1_DATA6
> 	0x40001382
> > -			MX93_PAD_SD1_DATA7__USDHC1_DATA7
> 	0x40001382
> > -			MX93_PAD_SD1_STROBE__USDHC1_STROBE
> 	0x1582
> > -		>;
> > -	};
> > -
> > -	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > -	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD1_CLK__USDHC1_CLK
> 	0x158e
> > -			MX93_PAD_SD1_CMD__USDHC1_CMD
> 	0x4000138e
> > -			MX93_PAD_SD1_DATA0__USDHC1_DATA0
> 	0x4000138e
> > -			MX93_PAD_SD1_DATA1__USDHC1_DATA1
> 	0x4000138e
> > -			MX93_PAD_SD1_DATA2__USDHC1_DATA2
> 	0x4000138e
> > -			MX93_PAD_SD1_DATA3__USDHC1_DATA3
> 	0x4000138e
> > -			MX93_PAD_SD1_DATA4__USDHC1_DATA4
> 	0x4000138e
> > -			MX93_PAD_SD1_DATA5__USDHC1_DATA5
> 	0x4000138e
> > -			MX93_PAD_SD1_DATA6__USDHC1_DATA6
> 	0x4000138e
> > -			MX93_PAD_SD1_DATA7__USDHC1_DATA7
> 	0x4000138e
> > -			MX93_PAD_SD1_STROBE__USDHC1_STROBE
> 	0x158e
> > -		>;
> > -	};
> > -
> > -	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > -	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD1_CLK__USDHC1_CLK
> 	0x15fe
> > -			MX93_PAD_SD1_CMD__USDHC1_CMD
> 	0x400013fe
> > -			MX93_PAD_SD1_DATA0__USDHC1_DATA0
> 	0x400013fe
> > -			MX93_PAD_SD1_DATA1__USDHC1_DATA1
> 	0x400013fe
> > -			MX93_PAD_SD1_DATA2__USDHC1_DATA2
> 	0x400013fe
> > -			MX93_PAD_SD1_DATA3__USDHC1_DATA3
> 	0x400013fe
> > -			MX93_PAD_SD1_DATA4__USDHC1_DATA4
> 	0x400013fe
> > -			MX93_PAD_SD1_DATA5__USDHC1_DATA5
> 	0x400013fe
> > -			MX93_PAD_SD1_DATA6__USDHC1_DATA6
> 	0x400013fe
> > -			MX93_PAD_SD1_DATA7__USDHC1_DATA7
> 	0x400013fe
> > -			MX93_PAD_SD1_STROBE__USDHC1_STROBE
> 	0x15fe
> > -		>;
> > -	};
> > -
> > -	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_sai3: sai3grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_GPIO_IO26__SAI3_TX_SYNC
> 0x31e
> > -			MX93_PAD_GPIO_IO16__SAI3_TX_BCLK
> 0x31e
> > -			MX93_PAD_GPIO_IO17__SAI3_MCLK           0x31e
> > -			MX93_PAD_GPIO_IO19__SAI3_TX_DATA00
> 0x31e
> > -			MX93_PAD_GPIO_IO20__SAI3_RX_DATA00
> 0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_sai3_sleep: sai3sleepgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_GPIO_IO26__GPIO2_IO26
> 	0x51e
> > -			MX93_PAD_GPIO_IO16__GPIO2_IO16
> 	0x51e
> > -			MX93_PAD_GPIO_IO17__GPIO2_IO17
> 	0x51e
> > -			MX93_PAD_GPIO_IO19__GPIO2_IO19
> 	0x51e
> > -			MX93_PAD_GPIO_IO20__GPIO2_IO20
> 	0x51e
> > -		>;
> > -	};
> > -
> > -	pinctrl_spdif: spdifgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_GPIO_IO22__SPDIF_IN		0x31e
> > -			MX93_PAD_GPIO_IO23__SPDIF_OUT		0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_spdif_sleep: spdifsleepgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_GPIO_IO22__GPIO2_IO22		0x31e
> > -			MX93_PAD_GPIO_IO23__GPIO2_IO23		0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_usdhc2_gpio_sleep: usdhc2gpiosleepgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x51e
> > -		>;
> > -	};
> > -
> > -	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > -	pinctrl_usdhc2: usdhc2grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD2_CLK__USDHC2_CLK
> 	0x1582
> > -			MX93_PAD_SD2_CMD__USDHC2_CMD
> 	0x40001382
> > -			MX93_PAD_SD2_DATA0__USDHC2_DATA0
> 	0x40001382
> > -			MX93_PAD_SD2_DATA1__USDHC2_DATA1
> 	0x40001382
> > -			MX93_PAD_SD2_DATA2__USDHC2_DATA2
> 	0x40001382
> > -			MX93_PAD_SD2_DATA3__USDHC2_DATA3
> 	0x40001382
> > -			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> > -		>;
> > -	};
> > -
> > -	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > -	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD2_CLK__USDHC2_CLK
> 	0x158e
> > -			MX93_PAD_SD2_CMD__USDHC2_CMD
> 	0x4000138e
> > -			MX93_PAD_SD2_DATA0__USDHC2_DATA0
> 	0x4000138e
> > -			MX93_PAD_SD2_DATA1__USDHC2_DATA1
> 	0x4000138e
> > -			MX93_PAD_SD2_DATA2__USDHC2_DATA2
> 	0x4000138e
> > -			MX93_PAD_SD2_DATA3__USDHC2_DATA3
> 	0x4000138e
> > -			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> > -		>;
> > -	};
> > -
> > -	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > -	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD2_CLK__USDHC2_CLK
> 	0x15fe
> > -			MX93_PAD_SD2_CMD__USDHC2_CMD
> 	0x400013fe
> > -			MX93_PAD_SD2_DATA0__USDHC2_DATA0
> 	0x400013fe
> > -			MX93_PAD_SD2_DATA1__USDHC2_DATA1
> 	0x400013fe
> > -			MX93_PAD_SD2_DATA2__USDHC2_DATA2
> 	0x400013fe
> > -			MX93_PAD_SD2_DATA3__USDHC2_DATA3
> 	0x400013fe
> > -			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> > -		>;
> > -	};
> > -
> > -	pinctrl_usdhc2_sleep: usdhc2sleepgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD2_CLK__GPIO3_IO01            0x51e
> > -			MX93_PAD_SD2_CMD__GPIO3_IO02		0x51e
> > -			MX93_PAD_SD2_DATA0__GPIO3_IO03		0x51e
> > -			MX93_PAD_SD2_DATA1__GPIO3_IO04		0x51e
> > -			MX93_PAD_SD2_DATA2__GPIO3_IO05		0x51e
> > -			MX93_PAD_SD2_DATA3__GPIO3_IO06		0x51e
> > -			MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
> > -		>;
> > -	};
> > -
> >  	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> >  	pinctrl_usdhc3: usdhc3grp {
> >  		fsl,pins =3D <
> > @@ -1054,10 +213,4 @@ pinctrl_usdhc3_wlan: usdhc3wlangrp {
> >  			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
> >  		>;
> >  	};
> > -
> > -	pinctrl_wdog: wdoggrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY
> 	0x31e
> > -		>;
> > -	};
> >  };
> > diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> > b/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
> > similarity index 79%
> > copy from arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> > copy to arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
> > index acb160d3186c..ddde72e22fcb 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
> > @@ -1,17 +1,11 @@
> >  // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >  /*
> > - * Copyright 2022 NXP
> > + * Copyright 2022,2026 NXP
> >   */
> >
> > -/dts-v1/;
> > -
> >  #include <dt-bindings/usb/pd.h>
> > -#include "imx93.dtsi"
> >
> >  / {
> > -	model =3D "NXP i.MX93 11X11 EVK board";
> > -	compatible =3D "fsl,imx93-11x11-evk", "fsl,imx93";
> > -
> >  	aliases {
> >  		ethernet0 =3D &fec;
> >  		ethernet1 =3D &eqos;
> > @@ -23,6 +17,7 @@ aliases {
> >  		i2c2 =3D &lpi2c3;
> >  		mmc0 =3D &usdhc1;
> >  		mmc1 =3D &usdhc2;
> > +		mmc2 =3D &usdhc3;
> >  		rtc0 =3D &bbnsm_rtc;
> >  		serial0 =3D &lpuart1;
> >  		serial1 =3D &lpuart2;
> > @@ -113,15 +108,6 @@ reg_audio_pwr: regulator-audio-pwr {
> >  		enable-active-high;
> >  	};
> >
> > -	reg_m2_pwr: regulator-m2-pwr {
> > -		compatible =3D "regulator-fixed";
> > -		regulator-name =3D "M.2-power";
> > -		regulator-min-microvolt =3D <3300000>;
> > -		regulator-max-microvolt =3D <3300000>;
> > -		gpio =3D <&pcal6524 13 GPIO_ACTIVE_HIGH>;
> > -		enable-active-high;
> > -	};
> > -
> >  	reg_usdhc2_vmmc: regulator-usdhc2 {
> >  		compatible =3D "regulator-fixed";
> >  		pinctrl-names =3D "default";
> > @@ -134,28 +120,6 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
> >  		enable-active-high;
> >  	};
> >
> > -	reg_usdhc3_vmmc: regulator-usdhc3 {
> > -		compatible =3D "regulator-fixed";
> > -		regulator-name =3D "WLAN_EN";
> > -		regulator-min-microvolt =3D <3300000>;
> > -		regulator-max-microvolt =3D <3300000>;
> > -		vin-supply =3D <&reg_m2_pwr>;
> > -		gpio =3D <&pcal6524 20 GPIO_ACTIVE_HIGH>;
> > -		/*
> > -		 * IW612 wifi chip needs more delay than other wifi chips to
> complete
> > -		 * the host interface initialization after power up, otherwise
> the
> > -		 * internal state of IW612 may be unstable, resulting in the
> failure of
> > -		 * the SDIO3.0 switch voltage.
> > -		 */
> > -		startup-delay-us =3D <20000>;
> > -		enable-active-high;
> > -	};
> > -
> > -	usdhc3_pwrseq: usdhc3_pwrseq {
> > -		compatible =3D "mmc-pwrseq-simple";
> > -		reset-gpios =3D <&pcal6524 12 GPIO_ACTIVE_LOW>;
> > -	};
> > -
> >  	backlight_lvds: backlight-lvds {
> >  		compatible =3D "pwm-backlight";
> >  		pwms =3D <&adp5585 0 100000 0>;
> > @@ -167,44 +131,6 @@ backlight_lvds: backlight-lvds {
> >  		status =3D "disabled";
> >  	};
> >
> > -	bt_sco_codec: bt-sco-codec {
> > -		compatible =3D "linux,bt-sco";
> > -		#sound-dai-cells =3D <1>;
> > -	};
> > -
> > -	sound-bt-sco {
> > -		compatible =3D "simple-audio-card";
> > -		simple-audio-card,name =3D "bt-sco-audio";
> > -		simple-audio-card,format =3D "dsp_a";
> > -		simple-audio-card,bitclock-inversion;
> > -		simple-audio-card,frame-master =3D <&btcpu>;
> > -		simple-audio-card,bitclock-master =3D <&btcpu>;
> > -
> > -		btcpu: simple-audio-card,cpu {
> > -			sound-dai =3D <&sai1>;
> > -			dai-tdm-slot-num =3D <2>;
> > -			dai-tdm-slot-width =3D <16>;
> > -		};
> > -
> > -		simple-audio-card,codec {
> > -			sound-dai =3D <&bt_sco_codec 1>;
> > -		};
> > -	};
> > -
> > -	sound-micfil {
> > -		compatible =3D "fsl,imx-audio-card";
> > -		model =3D "micfil-audio";
> > -
> > -		pri-dai-link {
> > -			link-name =3D "micfil hifi";
> > -			format =3D "i2s";
> > -
> > -			cpu {
> > -				sound-dai =3D <&micfil>;
> > -			};
> > -		};
> > -	};
> > -
> >  	sound-wm8962 {
> >  		compatible =3D "fsl,imx-audio-wm8962";
> >  		model =3D "wm8962-audio";
> > @@ -356,12 +282,6 @@ pcal6524: gpio@22 {
> >  		#interrupt-cells =3D <2>;
> >  		interrupt-parent =3D <&gpio3>;
> >  		interrupts =3D <27 IRQ_TYPE_LEVEL_LOW>;
> > -
> > -		m2-pcm-level-shifter-hog {
> > -			gpio-hog;
> > -			gpios =3D <19 GPIO_ACTIVE_HIGH>;
> > -			output-high;
> > -		};
> >  	};
> >
> >  	pmic@25 {
> > @@ -554,16 +474,6 @@ bluetooth {
> >  	};
> >  };
> >
> > -&micfil {
> > -	pinctrl-names =3D "default", "sleep";
> > -	pinctrl-0 =3D <&pinctrl_pdm>;
> > -	pinctrl-1 =3D <&pinctrl_pdm_sleep>;
> > -	assigned-clocks =3D <&clk IMX93_CLK_PDM>;
> > -	assigned-clock-parents =3D <&clk IMX93_CLK_AUDIO_PLL>;
> > -	assigned-clock-rates =3D <49152000>;
> > -	status =3D "okay";
> > -};
> > -
> >  &mu1 {
> >  	status =3D "okay";
> >  };
> > @@ -572,17 +482,6 @@ &mu2 {
> >  	status =3D "okay";
> >  };
> >
> > -&sai1 {
> > -	pinctrl-names =3D "default", "sleep";
> > -	pinctrl-0 =3D <&pinctrl_sai1>;
> > -	pinctrl-1 =3D <&pinctrl_sai1_sleep>;
> > -	assigned-clocks =3D <&clk IMX93_CLK_SAI1>;
> > -	assigned-clock-parents =3D <&clk IMX93_CLK_AUDIO_PLL>;
> > -	assigned-clock-rates =3D <12288000>;
> > -	fsl,sai-mclk-direction-output;
> > -	status =3D "okay";
> > -};
> > -
> >  &sai3 {
> >  	pinctrl-names =3D "default", "sleep";
> >  	pinctrl-0 =3D <&pinctrl_sai3>;
> > @@ -653,21 +552,6 @@ &usdhc2 {
> >  	no-mmc;
> >  };
> >
> > -&usdhc3 {
> > -	pinctrl-names =3D "default", "state_100mhz", "state_200mhz", "sleep";
> > -	pinctrl-0 =3D <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
> > -	pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
> > -	pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
> > -	pinctrl-3 =3D <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
> > -	mmc-pwrseq =3D <&usdhc3_pwrseq>;
> > -	vmmc-supply =3D <&reg_usdhc3_vmmc>;
> > -	bus-width =3D <4>;
> > -	keep-power-in-suspend;
> > -	non-removable;
> > -	wakeup-source;
> > -	status =3D "okay";
> > -};
> > -
> >  &wdog3 {
> >  	pinctrl-names =3D "default";
> >  	pinctrl-0 =3D <&pinctrl_wdog>;
> > @@ -814,40 +698,6 @@ MX93_PAD_CCM_CLKO2__GPIO3_IO27
> 		0x31e
> >  		>;
> >  	};
> >
> > -	pinctrl_pdm: pdmgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_PDM_CLK__PDM_CLK
> 	0x31e
> > -
> 	MX93_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM00	0x31e
> > -
> 	MX93_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM01	0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_pdm_sleep: pdmsleepgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_PDM_CLK__GPIO1_IO08
> 	0x31e
> > -			MX93_PAD_PDM_BIT_STREAM0__GPIO1_IO09
> 	0x31e
> > -			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10
> 	0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_sai1: sai1grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK
> 	0x31e
> > -			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC		0x31e
> > -			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00
> 	0x31e
> > -			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00
> 	0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_sai1_sleep: sai1sleepgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SAI1_TXC__GPIO1_IO12                   0x51e
> > -			MX93_PAD_SAI1_TXFS__GPIO1_IO11
> 	0x51e
> > -			MX93_PAD_SAI1_TXD0__GPIO1_IO13
> 	0x51e
> > -			MX93_PAD_SAI1_RXD0__GPIO1_IO14
> 	0x51e
> > -		>;
> > -	};
> > -
> >  	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> >  	pinctrl_usdhc1: usdhc1grp {
> >  		fsl,pins =3D <
> > @@ -1002,59 +852,6 @@ MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
> >  		>;
> >  	};
> >
> > -	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > -	pinctrl_usdhc3: usdhc3grp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD3_CLK__USDHC3_CLK
> 	0x1582
> > -			MX93_PAD_SD3_CMD__USDHC3_CMD
> 	0x40001382
> > -			MX93_PAD_SD3_DATA0__USDHC3_DATA0
> 	0x40001382
> > -			MX93_PAD_SD3_DATA1__USDHC3_DATA1
> 	0x40001382
> > -			MX93_PAD_SD3_DATA2__USDHC3_DATA2
> 	0x40001382
> > -			MX93_PAD_SD3_DATA3__USDHC3_DATA3
> 	0x40001382
> > -		>;
> > -	};
> > -
> > -	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > -	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD3_CLK__USDHC3_CLK
> 	0x158e
> > -			MX93_PAD_SD3_CMD__USDHC3_CMD
> 	0x4000138e
> > -			MX93_PAD_SD3_DATA0__USDHC3_DATA0
> 	0x4000138e
> > -			MX93_PAD_SD3_DATA1__USDHC3_DATA1
> 	0x4000138e
> > -			MX93_PAD_SD3_DATA2__USDHC3_DATA2
> 	0x4000138e
> > -			MX93_PAD_SD3_DATA3__USDHC3_DATA3
> 	0x4000138e
> > -		>;
> > -	};
> > -
> > -	/* need to config the SION for data and cmd pad, refer to ERR052021
> */
> > -	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD3_CLK__USDHC3_CLK
> 	0x15fe
> > -			MX93_PAD_SD3_CMD__USDHC3_CMD
> 	0x400013fe
> > -			MX93_PAD_SD3_DATA0__USDHC3_DATA0
> 	0x400013fe
> > -			MX93_PAD_SD3_DATA1__USDHC3_DATA1
> 	0x400013fe
> > -			MX93_PAD_SD3_DATA2__USDHC3_DATA2
> 	0x400013fe
> > -			MX93_PAD_SD3_DATA3__USDHC3_DATA3
> 	0x400013fe
> > -		>;
> > -	};
> > -
> > -	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
> > -			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
> > -			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
> > -			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
> > -			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
> > -			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
> > -		>;
> > -	};
> > -
> > -	pinctrl_usdhc3_wlan: usdhc3wlangrp {
> > -		fsl,pins =3D <
> > -			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
> > -		>;
> > -	};
> > -
> >  	pinctrl_wdog: wdoggrp {
> >  		fsl,pins =3D <
> >  			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY
> 	0x31e
> > --
> > 2.37.1
> >
