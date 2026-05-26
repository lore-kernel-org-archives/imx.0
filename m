Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011041.outbound.protection.outlook.com [52.101.70.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2153CAE74
	for <imx@lists.linux.dev>; Tue, 26 May 2026 09:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788004; cv=fail; b=k9hGLkMNzwl9YQHlZxcIIG/KzHl6whRpW4PUoEeuCoAwupgm03X6yPqGCJ7qqKIn5T/msDsKn4VXQm4SG801V2ZQw9rS0tT4dzFSKTAS2Clu7H1fmLM+F6PkcfH/iA50mQqIEITugjd1bjXfusF/WstCv/U8Fx0N4Jb0pmnPcjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788004; c=relaxed/simple;
	bh=KWDFP9rCmsFl8g0NweI4pFb9whRQOYp8a/pmiyH8ccc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I83UAbQFODHi3hbaT2LKS1ENmIhOq+2cDX49YjwCwedGbzrAoJSLsdYCQsZVF0M3AtA/bCGbS/j5dti0uQdLTmNYiK4hiVqz6PIpffhRTEVyS2dpRi8wbFxBwcAnxlq4C+CQHuMxGNfZdEeV/r7tJQv2x50Javthi3YVtOcm8d0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M3dKFV/6; arc=fail smtp.client-ip=52.101.70.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M3dKFV/6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UzGUVSrcS/qGFzp5i5aVhPr4y6hE/q+hTCaRJ/8MMW6ZX4GFxiMBwz/DL+uW5oqnrO49w1ni0bV3sBQzYjdJ/lfwQNgSNJ3lUPU3AJ7Oo97b8Oyes1KNMJ0/JL4zHivpd43Rs/KL0M4jD1k6PEdvOr5yKWcxpLaHLa4ftVyi54WRx7cCJkCxVmUA4bpRTnb2/ZmOncKxxF58zcQv6xLXlAbOFA4YgB54X4jBS8tjI5NM1yJb6qWwP8oWmPulxwVdhyNBiTE734HiIuyewEAATd0uk3oJTKn4FCd2JerML5l6oLudRTtaGdYIiJ6btXIZ0kRmaqdiuLMJWJa3UppLJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBE1POiLNETeTItMf1mAuHpXmrSS2vWuQzbL7e1Ziso=;
 b=CTu74sf1oDSIxzTjF2TsV1RIJ8j6QdqzHiExKnOnRUP2MmAi6maPEwC8AJC3zoON4/SzWeo0TuMxCJYEfdH8FkRkINcMTxUQKDYLLxsogKzLgfHrkp1kwVRIQCFZgr/R7ujE2Cv1MXppnAdYVKbzdPaTHmXFxmmToSbkMTl1xZJtII0cph4Hfv9BrSg+aejAB209247nQqNSsLw68h2mg4Srm8jY2+X7qvTv4FsjbGsPLeCkvk9peoO5l16llGC6e0WxQPLfq1fbVVHGEa0afdxwDQebOZwZsvFF8fG1hyOwty5XlIxanDxYE+bsZjRpruz393dpl+gHF3zSxHcxkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBE1POiLNETeTItMf1mAuHpXmrSS2vWuQzbL7e1Ziso=;
 b=M3dKFV/6EIOu6wQfZ7eEIn5nNdvS5mZ0PS9ZOIDIEoBHtU703QovuDgYynlxLSIjW+2VbMox+KTPCl1kHPGeZBGMaV1UckTqBdMU8ef6qdel4oy85NmlBUE9opbC+chRuwsDS1V+mobRjYJWOzJtuSbAy1JowBiBrqi376+5TrFF159KKQ9YyQIQHWbwJMxwCxQm3VU2d3XgSytzIyGBR6MBk0u+fu9bAftOznytvA5boCD36HRsK1VS7GDBOA59sei/oC9fXevX7feU72nv/ORdcAfp1aqNtDvQBBruPOJSCL5qjMrc/dqwxYNWHNjXULU6aJHytCaMgsA/FjhrRw==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB9PR04MB9962.eurprd04.prod.outlook.com (2603:10a6:10:4c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 09:33:14 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 09:33:14 +0000
From: "G.N. Zhou" <guoniu.zhou@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <frank.li@nxp.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: RE: [EXT] Re: [PATCH v8 1/2] media: dt-bindings: Add CSI Pixel
 Formatter DT bindings
Thread-Topic: [EXT] Re: [PATCH v8 1/2] media: dt-bindings: Add CSI Pixel
 Formatter DT bindings
Thread-Index: AQHc7B3kgtCGeI8K8Euyz6g0Q1Q4+7YgB6CAgAAFDBA=
Date: Tue, 26 May 2026 09:33:13 +0000
Message-ID:
 <AS8PR04MB9080B11226523E132EA18813FA0B2@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com>
 <20260525-csi_formatter-v8-1-6b646231224b@oss.nxp.com>
 <20260526-towering-essential-civet-19a5ad@quoll>
In-Reply-To: <20260526-towering-essential-civet-19a5ad@quoll>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|DB9PR04MB9962:EE_
x-ms-office365-filtering-correlation-id: 81655aa0-998b-4345-bcd1-08debb09cf4b
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|19092799006|4133799003|56012099003|11063799006|4143699003|3023799007|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 1n6uuxG15ibYNfirLJ6EP3fQUdVc/N3aVLcs8SVQecK1DtkL9L8vTlt/srtJUb7u73xUwY5psHb2n7Jvtpa7ALKDlE+1iWrm+5ze7oIxwG0ToDL4r8K7hIoS+S3UC0/sR/0ZOo9+6EAO+eHy91Nvby3IpCO+QwfMwU/7WW7guXOrttausmeVo61YMsTX4zkrX8OqMzxbbQgPTkovY0wAJMVTLkH1QQe04NHKLlgjRUD8Sc0fVY6/iP4h4OKLgrxoWo8yoVgN3o36sm44wah/DifQ5FbBXR/VFccneEAJu3qoctUBndS14wl/rDo5bwt3ngW01OSY2H698lNIGvfvV9BQVHYpDAcCbYCHT3tt2XwBqFJlEoLVLR/uBkyXkCtyL5iGbqxpp0xyvdp68G+b3Jx82bNUEJkTxXwdozcyd0UsYfPjTU/rs+58VCo/cXIOJHzp0tv2skqn6oXRcTkxSwOG3X9ulUbNY/5n8DF4Fd3z5hMXE/aXL39YeIlGDo3C8GQxcBt69zVoSk4SylYXhU/doNChMdwel9cD2htFGgd1SzktFZG8Nh2SP+GurBbl1zwBI9K6DZ36ze0Ab/ZYIDay/Bs+SwJH9jIuD3qHrSMWQ4geD3mVs/5Xn3b+um1yaBFZF+QtcgU704t2N1umeJ4ToHNKFX012d77ECd0vI3scGrncy3Az+jjlowZ/WNtCF+K6KJQXL2No6RrsB6lH3CJ1p4StoiUaOldAbOlLSmdl711Cey5hVOrJO1MvL5S
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(4133799003)(56012099003)(11063799006)(4143699003)(3023799007)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2Yybz1f4XSTBN7Fjo84CpqmlAykf3qWTfxtV5boJ56iI9N4pZPIZQtjosaE0?=
 =?us-ascii?Q?VsWKkTfUEApzSUqrQb9fi1AoY7v6e3bLjZPW1XvzlRAMFugu9+IjVtcPo4uB?=
 =?us-ascii?Q?KBkA/M5/dzcpju/A3ZdcBOGpy2V+yQADdrXxbB9hygIHI7k/JVKYjbAdS/4b?=
 =?us-ascii?Q?TCoDBSUPTdf9iQjkr/rKNC06MYtGYZatfxnv5mLUsPrkrbiPhTcpvpdWONpv?=
 =?us-ascii?Q?Lya6LdDYLSCxmiR5bxVu5o7kU9nqV5e9R7tiveLbNIjGpgpYL3wk5Wfl3EB4?=
 =?us-ascii?Q?hEuZa4ttiKhQlMVEGLzKeuhqZyYXqc5aSWCNeJsxSb6EZ4TTTxxHgugnRc6T?=
 =?us-ascii?Q?iKJbESPQNItUBNi1+FnsHaGg1WR9XU2ylZBbpn1WoScr0bvMrNvud4bhDHue?=
 =?us-ascii?Q?6l08NThKl6D5SGqsELbhSvU8A2gxq4zsnrZf3WYRR39mgkKcbBEpINaAR9Tm?=
 =?us-ascii?Q?C4vQsUzNLhpsJhPaWywZ1zMrqMDNVOGXwIR8Kdkf7HAsTDWsJqVHSj/NmxD2?=
 =?us-ascii?Q?Dh4hwKZ1cQmTC4O+uRQjY2p/yy/t+wdLyvAkqSycvEewvzeSo6Woi9PLyllD?=
 =?us-ascii?Q?SlzddKK6RtC1CyQU5oV3hH1r/yIOD39rQAQzJaGIZGjsWbD9R8piQ69QGFk0?=
 =?us-ascii?Q?n7nMH8rEVTd+3a3jv5R9AsTgARTJIToTNiZXGrmtakF8OyfqEgbu/vDqpDBo?=
 =?us-ascii?Q?XwZzjyzkV5rNSwVTb9chEvqVN324APOR6b4rJt5D5gaI1HLusWCHxDfGZssA?=
 =?us-ascii?Q?+AWmocHiu90zR46CsDNYw6RwHuLpvOix+MtDZ6hHHvi+tvsGLnuIVyaqlAPs?=
 =?us-ascii?Q?LRsSYjUAg7FBWp9cES4MaU9qJskDF5oJZQjwdSBxUjvslpSX6HAwrL5PlaRI?=
 =?us-ascii?Q?yoy34FSHYAGrrqzU49Wn1gorICg3qxijc3VO0dkUtJYo/yfdnZSAjzqY8+fC?=
 =?us-ascii?Q?jJrITI/GssyXdlaA3oNpS4sp0Wf72gVxPyv2lnsrmsYOfU5mPA8JOzhL3jeB?=
 =?us-ascii?Q?VmR9W1gfAsBuq2RPjjYWG8pghaLhkgH2YILBBNeNiwcoY0STExKF/k7QQZ+y?=
 =?us-ascii?Q?8UJCtlPHhD5K8XiZNc+n3ZD8qZ5UrnnVq14abiJuVemYElRwiaQ4EiilGQ7d?=
 =?us-ascii?Q?VXGLIiJZRr3G2u6bGuo85NAlguZqqHc656/DxxSv47RD13wVM9KEbrcLfsPF?=
 =?us-ascii?Q?FnxleYEiHotTJZ07xJKtebPYRdo5noA5+RRBzpjbh3IzaOV5+KpcMTuQa7jC?=
 =?us-ascii?Q?trrEfxpDQxtr4eeMCLD9nuwsVZzA937UctrixVYXIPGynojEsQkyEoZjS9od?=
 =?us-ascii?Q?2FJm7BEFbsSQf+nQSezie9tU7P4AQW0zVIayhrtrbo0mUlx5JjPuKndzmgn5?=
 =?us-ascii?Q?d0q+C8MtAIezGNmQ+8ttobqyii9y/lDDbwhqjlllwI1vfKCoWPM25wCHpAJJ?=
 =?us-ascii?Q?URB7DkQOePtrT/Ty5U2HEvyCE8/7w9U/MqLilpFl81JplSeQkvGsUZRdRu7w?=
 =?us-ascii?Q?+4U5mXALLPw4/l/fGSym8qer4JBcUKcUU+s/uR+UkwOfKMLNjHwQAxHsY6vH?=
 =?us-ascii?Q?lYkiFNRIxYb4weYaDEqUy4Yv4s7y5MgTZDH7dmXUPexrU0WLLOPmcCqNPzn/?=
 =?us-ascii?Q?TXISyswJZqg+xpWAKpGSirLT7mKmTgood2rsnrKw5sxNmDdlg2Bn6bbCU2eu?=
 =?us-ascii?Q?mfc0chBcb/gidl3ine5uvIFLhn9XxqTPpOzyON8nTPi4zs0G?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81655aa0-998b-4345-bcd1-08debb09cf4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 09:33:13.9872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xi0egMtYVrxPjQuw6qbbDx6aYFIFj73BjAQpg2Zp3THcDE4r3xaR6AhaSKTeIdste+v02turh97r6UYSMfpOVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9962

Hi Krzysztof,

Thanks for your review.

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Tuesday, May 26, 2026 5:14 PM
> To: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Laurent
> Pinchart <laurent.pinchart@ideasonboard.com>; Frank Li <frank.li@nxp.com>=
;
> imx@lists.linux.dev; linux-media@vger.kernel.org; devicetree@vger.kernel.=
org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; G.N. =
Zhou
> <guoniu.zhou@nxp.com>; Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>
> Subject: [EXT] Re: [PATCH v8 1/2] media: dt-bindings: Add CSI Pixel Forma=
tter
> DT bindings
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> On Mon, May 25, 2026 at 04:12:22PM +0800, Guoniu Zhou wrote:
> > From: Guoniu Zhou <guoniu.zhou@nxp.com>
> >
> > The i.MX95 CSI pixel formatting module uses packet info, pixel and
> > non-pixel data from the CSI-2 host controller and reformat them to
> > match Pixel Link(PL) definition.
> >
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Reviewed-by: Krzysztof Kozlowski
> > <krzysztof.kozlowski@oss.qualcomm.com>
>=20
> Drop both review tags and request re-review since you made significant
> changes.
>=20
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > ---
> > Changes in v8:
> > - Use standard port reference instead of video-interfaces.yaml
>=20
> Why? Properties are not applicable?

Yes, the properties defined in video-interfaces.yaml (such as hsync-active,
vsync-active, pclk-sample, data-lanes, etc.) are not applicable to this
device. The device only requires the basic port/endpoint structure to
describe the connection topology, so the standard port reference is
sufficient.

>=20
> > - Add parent syscon node in example to show device integration
> > - Add required constraints for port@0 and port@1 in ports node
> >
> > Changes in v7:
> > - Change compatible to imx95-csi-formatter as IP is i.MX95 specific per
> Marco's suggestion
> >   Link:
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e
> > .kernel.org%2Flinux-media%2F20260511-csi_formatter-v6-0-
> 01028e312e2b%4
> >
> 0oss.nxp.com%2FT%2F%23mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
> &data=3D0
> >
> 5%7C02%7Cguoniu.zhou%40nxp.com%7C3fc5c66c19574e666c7c08debb0713
> 3d%7C68
> >
> 6ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639153836249231043%7
> CUnknown%
> >
> 7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJ
> XaW4z
> >
> MiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DZNSc0TBvF
> V61YL
> > q4u49sEUs7zo5aPODxSKK36y9azAQ%3D&reserved=3D0
> > ---
> >  .../bindings/media/fsl,imx95-csi-formatter.yaml    | 92
> ++++++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
> > b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
> > new file mode 100644
> > index 000000000000..bc2f5d448fe5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.
> > +++ yaml
> > @@ -0,0 +1,92 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> > +cetree.org%2Fschemas%2Fmedia%2Ffsl%2Cimx95-csi-
> formatter.yaml%23&data
> >
> +=3D05%7C02%7Cguoniu.zhou%40nxp.com%7C3fc5c66c19574e666c7c08debb0
> 7133d%7
> >
> +C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63915383624927629
> 7%7CUnkn
> >
> +own%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCI
> sIlAiOiJ
> >
> +XaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D4y
> rIJ8Bn
> > +KlbEdq4%2BbZWNeoSWB4g8N1sChHSQ9z3VRZ0%3D&reserved=3D0
> > +$schema:
> > +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> > +cetree.org%2Fmeta-
> schemas%2Fcore.yaml%23&data=3D05%7C02%7Cguoniu.zhou%4
> >
> +0nxp.com%7C3fc5c66c19574e666c7c08debb07133d%7C686ea1d3bc2b4c6fa
> 92cd99
> >
> +c5c301635%7C0%7C0%7C639153836249307152%7CUnknown%7CTWFpbGZ
> sb3d8eyJFbX
> >
> +B0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWF
> pbCI
> >
> +sIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DMEUhKnYWZqo0gMxynCFUEB
> X8TLGC9aK6
> > +lNgrHXdqpx0%3D&reserved=3D0
> > +
> > +title: i.MX95 CSI Pixel Formatter
> > +
> > +maintainers:
> > +  - Guoniu Zhou <guoniu.zhou@nxp.com>
> > +
> > +description:
> > +  The CSI pixel formatting module found on i.MX95 uses packet info,
> > +pixel
> > +  and non-pixel data from the CSI-2 host controller and reformat them
> > +to
> > +  match Pixel Link(PL) definition.
> > +
> > +properties:
> > +  compatible:
> > +    const: fsl,imx95-csi-formatter
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: MIPI CSI-2 RX IDI interface
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Pixel Link Interface
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - power-domains
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> > +
> > +    syscon@4ac10000 {
> > +        compatible =3D "nxp,imx95-camera-csr", "syscon";
>=20
> Drop entire node, not relevant. Or actually this example could be in the =
parent
> binding example.

Okay.

>=20
>=20
> > +        reg =3D <0x0 0x4ac10000 0x0 0x10000>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <1>;
> > +
> > +        formatter@20 {
> > +            compatible =3D "fsl,imx95-csi-formatter";
> > +            reg =3D <0x20 0x100>;
> > +            clocks =3D <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
> > +            power-domains =3D <&scmi_devpd 3>;
> > +
> > +            ports {
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <0>;
> > +
> > +                port@0 {
> > +                    reg =3D <0>;
> > +
> > +                    endpoint {
> > +                        remote-endpoint =3D <&mipi_csi_0_out>;
> > +                };
> > +            };
> > +
> > +                port@1 {
>=20
> Messed indentation.
>=20
> Best regards,
> Krzysztof

