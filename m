Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011049.outbound.protection.outlook.com [40.107.130.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B917270569
	for <imx@lists.linux.dev>; Fri,  9 May 2025 10:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746786945; cv=fail; b=grtrGncF9Mn1DXeYLO54JmGLWwYSBsfxuwsRy2Ju9RyFv7qP02vc7VVezRI7G86lRD+4kVbmzY+4Q2UXeChzCJ+fW5VvgCPvVJAMpEgdHiFXtOaxlWWkVIMwiuwhSo4bVVhKd5h8fRfn0aG3+bbJBWwhzFCudsGW9PnWO5s7MMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746786945; c=relaxed/simple;
	bh=nki0e6SIFF59jRLJHlYf6RqmOqFZUwAK47qFJHhdvok=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XjxPCIDXOk4iX7EzeKnaEkYZDwApeZ+N7CuHSgomYUyqZyggmSItdNG25LPU4cz0sK0cElvzfAHazd0n0mFMrysvtj0UuACywxYB/PPJD6jVakPGxFaT7rN1D7c77yYH0Y61B5JqhhtgbmcdsWf6JscarWlWgBz6ddYZeZ+cff8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=W+UmCA5f; arc=fail smtp.client-ip=40.107.130.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="W+UmCA5f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fn33733ULg8r3ESFSbpoUCcgH/bgHvpiOhnu/MLdH7mLlVAUrE5BdNPETtnyFsiz3d6U8yxqaumoVCMLywVlrWn0aDNSZ0SCCrIbmSLGoLjoSzjm54Syx5WPL1oCksPCjnsPHdNzt0wGAroB/WiN3geet0mOSBfXZtIuBz282WVZ6Vd6AIKQeH77VOQWkrB8I45sc1KhOJ+JZpnYoq8HQUszUt0KSWw/7Mm0V6LfZnrnCjRWEroQ+Gjtpf6V5831jMRYNGahqW5jf46AC8p1eNI8K/Ar+QZgNRCujlW7VV4CQpOhNHyGNwfo18MwGkSZ50qFSK4hoisjZOwiOxqX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnTRRjAYC9AIWHALHBLkwg6xjYLV4PdMXwVZuillZc8=;
 b=b3Z8bTjZeUQuhola21l51RMUsgXW9lNR2yTDoWzmLBltetH5aJuuGZDgTK6tgNCkNQQtW/yRpdvOerV1JxuM8+qZHl02G2f3BLksfWcBITDuJxmlteUeh46R2RPUy7CyahL0LOT3fMQzbX3WSqlIj+S1Grvk69LcDrV9Qm6hMCJypODEaSQtJzdGmRjkdLYm5wxAiU/9b8saKBgPkefjg9rbpabIbqt70LwgcNGl6VzTFlTo84H0Q+hMkhFapVmak8XJ8IjTvi00oglkeJBbzjKSn8f2nywaX91kr8QKbfJLDN7aRyA+i1FMsRb01J1ltcuRqmN2YpGYc3W3WfR5fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnTRRjAYC9AIWHALHBLkwg6xjYLV4PdMXwVZuillZc8=;
 b=W+UmCA5fUWEa9wbLzQb3+diMiRqOcYmEZAXPanvlIBjge5Lh3hLJQNo+lzKXJP+lET3U3VR+dECwl+O9i9sXXLFOiTCJH2pOtaHwQKyHuaDzX0Ae+OyQ3BaM00nhgynh+cJt9nFoNH9v3aOb/g2+M8IFseu+MNQa7nG0+yoBPqkD4IBtcCZ7Za8dELwtChCEgTugCRstBWVs0k26Y/fo1nL0OQ0nK9bFY8G87c7zUQNDiX/qHtNeuWTCG0Y09ZE3gOheQT9WIS3sfaxevX+lD37+Ophr6+jfkKdHttWyXFuLgj54IUoJ5ObmWrI6beFuRMXm1QPiw+EqSUbtZQsndA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB11030.eurprd04.prod.outlook.com (2603:10a6:10:593::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 10:35:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 10:35:40 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Shawn Guo <shawnguo2@yeah.net>, Jacky Bai <ping.bai@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>,
	Frank Li <frank.li@nxp.com>
Subject: RE: [PATCH v6 2/3] arm64: dts: freescale: Add basic dtsi for imx943
Thread-Topic: [PATCH v6 2/3] arm64: dts: freescale: Add basic dtsi for imx943
Thread-Index: AQHbsomfGHIFrirUokyjXe5khvm2grPKKiYAgAAMKOA=
Date: Fri, 9 May 2025 10:35:40 +0000
Message-ID:
 <PAXPR04MB8459189E9DF97A15DB7386EA888AA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250421065139.3073232-1-ping.bai@nxp.com>
 <20250421065139.3073232-3-ping.bai@nxp.com> <aB3Pll3A/0XGCLlQ@dragon>
In-Reply-To: <aB3Pll3A/0XGCLlQ@dragon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU4PR04MB11030:EE_
x-ms-office365-filtering-correlation-id: 738d43f1-6fcf-4f3d-044a-08dd8ee53e5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Q5sbbvnGjdZsFDhC8BBL2lBaw2XiGOgAXl02LtF0OPTlydsu8Mla3/hFFjlF?=
 =?us-ascii?Q?qMSQ8FkZ9er+icQvJSW7T/zRV3/T6GboIT9hxrSGEwvz1rzLbB4k7yd/7Qei?=
 =?us-ascii?Q?EU75zQyggJlXLQ07XmF13fB9pBlrkS5OXwxWFg5OdfknZ+1TrAQzPg42sEbM?=
 =?us-ascii?Q?AdrX4ENkyH92zRH8moFoScHDDsEYuMCqPrwg3J0DeM/m2/2szOMFgahGpiVs?=
 =?us-ascii?Q?/lQVr29SUE1gPEpJnuXhFBhFcD9kQCxk4aV45teJZJ2z3RXwYq+IoLDKrEib?=
 =?us-ascii?Q?KL9u2xQDcXtmOZf+8iTTnc05bQD/9j7yW7GwyitW0vThlBRBUTpL5zaGTFKh?=
 =?us-ascii?Q?vMGesUd8xkoJNvsQ8Vr3ptVTxVyKtTES1Xp4aDTYtD6a4n3UVJ/L/U2kWvda?=
 =?us-ascii?Q?OzvxBA3Pkzot7PnfmkTSGBdN2lMrtvwNOhxziJuGJvqnsac+uvy0vtLcVgi2?=
 =?us-ascii?Q?lHlQQ1lCvvn1ZbwOml/1SUlu9DTAMdVVSAjYdJoGGIxujNCgwlc4IYIOUgt9?=
 =?us-ascii?Q?FEf4pnk/SMBvT3Md4io/CQqylQUy4H4LvS5B6lyCUWKYLEkgnw++nO5GYIUW?=
 =?us-ascii?Q?1Z7AJN+2u7EeQ91FX1rKcH+ukioxeIhKa6JMwqnT8jWZUqT03o0HbVR/gfto?=
 =?us-ascii?Q?G5566msWf8TtDV7Q2i/R7MruUTZVtd2z8jhMiZ9P9BHMhfiRUe4FxU0onq72?=
 =?us-ascii?Q?OIlwfKZ6ZiyINjx8QrOOxf5BKXEm9dgDaFQ+VznAuwOw/raRDAJqToZMocxq?=
 =?us-ascii?Q?EbK/DacfM/9O2W3EEyih71cqpvaMNXWjuwO9ZG+hGMIafu/n4IQR3znJkHqq?=
 =?us-ascii?Q?c9uEOflOjEYGAQ8DM+Jqri4nvyxr2TFAI9vSvPyQIiVsFiVmpelpUUe/4TjH?=
 =?us-ascii?Q?C1TLlul75dWrV5Fk6pleKwF2uqMYeK6qwlLQE8Je7x/tExz75iaDl2GqFo/9?=
 =?us-ascii?Q?6GQWGvryKskOpLGD22ZTP0u19wzwJ4S2+0RJNBH/f46k3ZCQJtRZ7UdvlWfo?=
 =?us-ascii?Q?X+RIgYkvxSNYR0+ySbthxclaIjyExCpPrYHw4J7zQyz1eChNI757IfrJBmDI?=
 =?us-ascii?Q?Yd7lfB768fFujzvW3zJNW/6R+90ZP2pk0MuNElBWCKVonfgJODYVleIvegWC?=
 =?us-ascii?Q?LlC9UpqY2jS0fiPftMPziz1eZry5Z3rTlD/8rxJSxqTp6h4LKL3y8qV2pHiu?=
 =?us-ascii?Q?74/tcPIwC1BuoFFhjWELOBuBfMIHn5Ef8rEXl3iMENC8aO4cWlF1QK0cmaMS?=
 =?us-ascii?Q?EfmgQYypPJ4KWBNyByfHsg8ndQp8TQeCfwbsLKkSnWiBOieuJEDALlVCUVt0?=
 =?us-ascii?Q?a6XvCGa5+DoDxYtzlgGtcb5PldYbDAD0cuHufflbBOIgwFirNZ92W1eEv7SO?=
 =?us-ascii?Q?NjZ0X4zNy4eTwXElYjxVYZsZ2W8emdXSO4IxzajPXW531Eyewr/LyQ91rNtJ?=
 =?us-ascii?Q?Vl+e15pH8TqXkCkqQd4xROsTuY01XxQ7kfU6RXj/KeBXb3we20RTD0gYoR6D?=
 =?us-ascii?Q?uGU4Dgfhg1NWl4s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?V1Q2s9Katc5bQ2z9rJOapCVZcXwxhcqivpaLq37ePG8x4oOSl0hvhCKivwGM?=
 =?us-ascii?Q?VERG2xh6zmGqJ8JQE4rsyCCmtz3xDkGKAQnpREc6/JRdqwVlPPn2OZtwF/RN?=
 =?us-ascii?Q?177PguPmwDt7ifCSgvwGuLZpPstQCLaU/GlT/06zVg47ikpxOlGmNAzHye+E?=
 =?us-ascii?Q?9oVsJQcsOkrX8sm42QCQt1XScf4qjpXGeMI4URLrBofGrEpFD5++mNs6718M?=
 =?us-ascii?Q?EgjxoEpAeFQS7GlXNZhcOpr6YYYXwjtUFEYxCLN+R0G4UFzpldhGdFtTXgUt?=
 =?us-ascii?Q?bKa6/1yyXArO1rCMO6rMOSuuddWulUvSotifm5m+zV47sklWvFtZGUamF5bD?=
 =?us-ascii?Q?rD955quJsNFo1CTG27EpyxayRu/a+4c947VrlLpDvZvEbU47/u4gwEnBW34B?=
 =?us-ascii?Q?6SncKnchQu0fXOS5FeaBTR369GVScCZ0/5ZrcliJOqzQIeR5oSlhgs6W7yZ4?=
 =?us-ascii?Q?IIDRQB9IbrL937KKPpPHLFm8gsl3lw+eLLSfP8uVjkFaHDcWdRX+dZ6nx5rn?=
 =?us-ascii?Q?E0yTRECa9QACH7UxUMQSroR2gGjXZ2kon9b0IuMdO7E2L05UNO9LTgPyZgv7?=
 =?us-ascii?Q?QRK5DQ40t+C5+5seeSwTHkZLcROoMpElmyDHKLW+ZTfhFoCoOs6tYR77ef4s?=
 =?us-ascii?Q?LopyQTLRA97hjGjuQ6UgC0grIGBwW7FfBi+3sGM/f2X2DmzAeQSN0QxYhVFw?=
 =?us-ascii?Q?MXQsf7ogTjFaWwuNQSrkoN7FsYIO2eLkSz9DQvlNKLHbeRRqLVNWQIBdTYma?=
 =?us-ascii?Q?+/CeW0AS7FwadcjFq9RLTPNnbQD7K31F5NsKBiYW7rs6YiimEzfL0wQ/CCCw?=
 =?us-ascii?Q?F2je5cqpMBwbiEvmQb5b0xaDGqs7PGou6GOdHblSbiRprzWM7AdHnZh6SBQL?=
 =?us-ascii?Q?6/wI7adO/R3yYVfAgu05qFgkIaepfgISlEKAlVX1FWJSeuHeI9iHSnetnI5A?=
 =?us-ascii?Q?IFBcNvwWuiwRLlXV8c6nHfXmdDhnSr+bvscu1mjQwd/oUz2ck78gQ6pX4MmU?=
 =?us-ascii?Q?C6i+HkWu1RQgw4bzMl1MjS5cryaPICCNqIe+9fAoVN5TLi/YUBM0d7fzFD8g?=
 =?us-ascii?Q?Wy952ueuibD9NuUosyXlCo5PWqu3xexfY15hRKzmpbmsv4jOgM5XMO4cgQbE?=
 =?us-ascii?Q?e6mo1/IS8Ru4iBIr+wGYXcTjkrTDuoEqcQ0GBHsnnVPDJ48g9+Q1oRB6OPOL?=
 =?us-ascii?Q?rSKkIt0h4cQSfO+SNk1gO4qSOZWLcja5sbsQJzCZYXHG0meZ2+eXSb6kwsAT?=
 =?us-ascii?Q?ddXWJKbdDSUB/BXPjmybbbGStxYgkAHeHwbIMjMsIxGVKTiKHfDQsQxxdfV5?=
 =?us-ascii?Q?8ZZUXbpolXPDtjNAjrPMJGQU0PoXD6hpzaDStruZT7Iiuoajc0JGroipbNhO?=
 =?us-ascii?Q?TyINqWcsgx0lEcCvOwO1kXsRlwWWMorIJDVQWhBDBP8L+8bErbEYKJdxqw8+?=
 =?us-ascii?Q?M/oQgRLKeTSkFQM7NDaP3alew6QDXsww58o1S3h+ga3MhsWH3AVdZqZAXOzE?=
 =?us-ascii?Q?lZ+mT5Y+Palo5eUd95yGf6/ME5HRcZtKg0IJ9HqpkEKgS29r+Ixen1RDSOM7?=
 =?us-ascii?Q?PAqwSNILzuZvyMFhjRM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 738d43f1-6fcf-4f3d-044a-08dd8ee53e5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 10:35:40.0964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LTxNb4iYEHrqVFnyN4YBlMzS2EhJpAy/XaCquWpkXWMWDo8SFohA4YqlCp1Iyf74c1a95PcYgNbJB9fq/Txg/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11030

Hi Shawn,

> Subject: Re: [PATCH v6 2/3] arm64: dts: freescale: Add basic dtsi for
> imx943
>=20
> On Mon, Apr 21, 2025 at 02:51:38PM +0800, Jacky Bai wrote:
> > Add the minimal dtsi support for i.MX943. i.MX943 is the first SoC of
> > i.MX94 Family, create a common dtsi for the whole i.MX94 family,
> and
> > the specific dtsi part for i.MX943.
> >
> > The clock, power domain and perf index need to be used by the
> device
> > nodes for resource reference, add them along with the dtsi support.
> >
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > ---
> >  - v6 changes:
> >   - refine the indentation of edma irq property.
> >
> >  - v5 changes:
> >   - remove the err irq of edma node as the err irq support in driver is
> not
> >     ready. We can add it back when the driver is ready. No impact for
> current
> >     edma support.
> >
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
> by Krzysztof
> >   - split the dtsi into imx94.dtsi and imx943.dtsi
> >   - use low case in the pinfunc header as Frank suggested
> >   - reorder the device nodes and properties
> > ---
> >  arch/arm64/boot/dts/freescale/imx94-clock.h   |  195 ++
>=20
> I forgot to ask when imx95-clock.h was first introduced.  But how will
> clk drivers use these clock IDs, or will clk drivers have their own copy =
of
> definitions?

We are using SCMI for i.MX95/i.MX94. Per DT maintainers,
the IDs should not be in dt-bindings, they are SCMI firmware
defined IDs.

clk drivers is drivers/clk/clk-scmi.c, this is a SCMI generic
clk driver, it will talk with SCMI firmware to get IDs.

>=20
> >  arch/arm64/boot/dts/freescale/imx94-pinfunc.h | 1570
> +++++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx94-power.h   |   41 +
>=20
> Same question on the power IDs.

Same as CLK IDs.

Regards,
Peng
>=20
