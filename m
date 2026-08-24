Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010033.outbound.protection.outlook.com [52.101.69.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C892949E0
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 02:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787538033; cv=fail; b=h3/2znTY2dl534qNVad//svWYCP0HeQS4GDH69uAHdLG+R6dgLZcku4VBVgCld0qyt6Shjs0LOueFnPudp3PUWSrzIVO8LaW0kcxG36K3DkrIKO0Bc6TvtzcldZ9udtLh3o0otO+um9ydjh8lQwJlzBATqz7hMLz8l4tu9/02DE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787538033; c=relaxed/simple;
	bh=aBvgVKdcpvYtqvh5rmdcy6QUXajj4u5c2YYY05ukVJw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=toR7VHyldpQrY6oOSmfgNgMvfTlUMF2t7BDfrhAs3hgnU/rVwmstSRi+NzRk2ij2Jj575tw+JOTpeZxbylI91HmrSY8i9X+YvPw8glMSiL5cBuOxAsjacFDoT7bL8uicyZt4blImdzFni3I3JNEiw/iqa2SFBPE4lItUPAAfaP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EU0fGZih; arc=fail smtp.client-ip=52.101.69.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EU0fGZih"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgKbQlQMomuNzFe++B1xz3HDxKsor4WDlEo+UOUaGrJ2F+XISzwfOMV93cP+SZ8XQJF+Vy7USZPTTe3iUaEJGvZlBvtKHh4YBGfhIaZKjKAAhpDH5h/Dp2D1yvAxSTG8iJkcu94E6ObAk5hXmJSqEycJn39kNLTv1l1GqlY23tXYutrDLKOKvQna+1Rulf0z3qBKRsym1Jgk+EIKOQidWDqOV4XYi3IvR7u/Et+9qwKVBw9AkAn93CT/PC17XrD42noFnYu2WA0yDJ0YABpqk8HNCZj4Lxf5ys8KGI4qfZjPAbNQFte5AcUIYKWyQ6FhLfLmpmHlyHxVupO1n9J52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8ri/hKrhYjTZw4RBDUfKSmSHdPdA3ZX/5uhXeUKQtA=;
 b=OxNYHqKUtX6jjcDPfALIzA5ZF4c9BJkIDe5/K//pE4JcTM6lxFXVm8uVO0MBNq/1ckB3Btw0HyjNAS5lKABGjWKi/zH4I//SU1aUDISxty12pBgUafPX8Lh3b0r009h1mUCm+l1auNNxqVq48aicbWdJsyqzcCZT//jD+Ci1FoCQ6PCxYdArMpVEY68kVHnzhrBuK9Qeh3+Nb4H+v9fS9KFG5QiOb/x8pF/IxUbGr8FYFmC19XCQsjJVv16jUcMSIQkxoJVHmu+G82l5iN1oFvH7IOoGiuOScdY4qTRyjYf1GQXQyuW/H62a4v26fW3ec12qXWzBJXKR2bs76NUtVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8ri/hKrhYjTZw4RBDUfKSmSHdPdA3ZX/5uhXeUKQtA=;
 b=EU0fGZihotqk2GkycO6URioNx/DcyPqzSK2TuXa/6/ppaPCKdTBR8+MmoLkzUyVjgez6E2sFo9QXJCkfvn+hRnmrysdonZUy93mSZRDKVu42EH8RxDUHvE48xPLYkK+mXNvfUp2luJhGRh+phi9U7upGDE/dD+9h5lEERgOZ7uOOF1IW1Mx5MVvIQeJ7hJsRCCG1hvwKR6A80FWzDj4JQUPfCmUa82rCjFIcD61HeLmyO9T/aXPZtVOjGkgS/IShL2KIIj7xFHMDq7gqw/LxG3DFwpeq9517F0X+aIOvfP6TZbyQ5DRfxHTRylcCN3Ei1XAHOo11zlY+1+oRwHRx3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VE1PR04MB7360.eurprd04.prod.outlook.com
 (2603:10a6:800:1a3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 02:20:28 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 02:20:27 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/17] arm64: dts: Add MQS1 sound card support for i.MX9 EVK platforms
Date: Mon, 24 Aug 2026 11:20:03 +0900
Message-ID: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0044.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::7) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VE1PR04MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a0b0efa-879f-4685-0e50-08df0186431f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|23010399003|10067099003|11063799006|56012099006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	t2ReWctpmaMxWjHj1c4jMiBO1pGH//7Toyniv5fK9iM2yrkFJA3RgMORoY6oakBZzVDNNP9RzIYGdvPbnG+wj+UD+ijs5bID5TLJ1wVwABEnJR4ky7ZfcI3WegvzjO6w77cPiPY/WEc/6WfUFxx2mLvk+hTBfEDvqyQehgmbQjR6L1BOh31S/ENFSSmiGw0M0DxzC45P7I5mIRRN4FWZE+J7jND9Y+m/iYDAlEfLuYCaTqoq44mTYJPe5otE4DPDodW/OAXa/kZWvNjw5V031PYX0/QQ2ijyeC9Rdt4O7WehT4ZBbBC64hWjeTJe/mUYG1r2WRRtuAhifL6RMnPIdnMVqXFFmTtoa8uOCmBRF7L40AylDHY7hsfjYox0VISDSbj3mULfJuOc7tBlmGxbkM8EaQI3sapxE9IvRLZstgSgwsuDtJCbSpNJli5ak8aC4SIRc4dfyeDZeIWtnXLhHjdEzbvh2Ton58RwKW4S63mn0upQ8BVUNADQdV1FTwi3VVmNU3WKt9GoqU2WMdhTGGfI9JJ1p3uN1mYFyOekx71li9Ps1SyaNNpc9tfCL7ymISQ95C+NR8ipZJXcixTcXQtTgfC1YNIbgk4cmF90+cQzujA681C39Yy2HlYLNrVA5ICbfR84wtuDoZWDBhf5uEHr2FBA4OnHIJdE9eneM8U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wo/Wfc2Paa7kvyAGeNqc3+ByLJZ074/mSteZCQtzW5VN5ejkoWIFzxDoEIl/?=
 =?us-ascii?Q?zpEyaWyRq8QjmqmqMEYxoNH4IaUVyHzfErnY5W7eAzZTqLnWcxzpqnSAJbBe?=
 =?us-ascii?Q?kfjZW5Hd0WYk7V6TH9HJy/Rc2OrQkSrjO4kqpzWNUKpvZesO6dNFDXwLjdLi?=
 =?us-ascii?Q?o+3diVzH+F/iAvwmqukr92qM65BDHmJADhmaRYRjZ6dPFzY06fGtSSzc9M2t?=
 =?us-ascii?Q?0gT1E8xZ8oFYOmU2TnWFyDerrnmHFXibblxNMJUDyDK7R8jFLpcqEDAWy/+B?=
 =?us-ascii?Q?bFDqFDqBNgKX2D9QjoCaaO8YCbhWgYgPwReqvqs/6wf40vRf9QjuHuC0MIfm?=
 =?us-ascii?Q?0gucbXqDHoM4gFXDpmzvnPRSzdWFs7iIbzZ01JU8EWL/0dscRE8re6cuZ90s?=
 =?us-ascii?Q?xrKfAq9Hu9LJCJHzfw2W9ECb/edILX9JdExmxe08QPEVnsbw6L+aTcO8NbB6?=
 =?us-ascii?Q?QBQmtchUQpqojiLQMcSAszPccG8cm0axFxF780qXjAG0HiEdTAqC0J1Ik0e8?=
 =?us-ascii?Q?nsBy75urYiVzSMM1dd6vE5+kMCP61byTyZnUxPYNxnUaZBSuzvy04dAfzR1l?=
 =?us-ascii?Q?iVppqZsAxDB0hxrfRXEOPrmMjWpYB173214Gx2+f5vDPdp7BSvrweMXIAPxo?=
 =?us-ascii?Q?fcQaDfocg0NbzyFkBjIN1/m0TirkH6+QeOPtvkI+H1l81GlLctTHTr7kIRbd?=
 =?us-ascii?Q?tm99zIsO+56QI6unwKpXio3ODyOzmVo2zhEYnYIFyy6r5BdVZwEagJdPtzSj?=
 =?us-ascii?Q?weSUbOGiTW7JbKiv2c7xPazaxDVDNZi4fxft4kj/P21T6cetFn7ojlxSbHBL?=
 =?us-ascii?Q?jWpiPiTKZeY7UAD1YTkNcvpYGB/lcJNgUECul2GpHDBdo7wrqMmmbqnFygge?=
 =?us-ascii?Q?5joN2oW0ImQ600cG1Qy8P3qcCS+uNXnw70reI3qB/8bOZ4dFCfa3rDEbexkN?=
 =?us-ascii?Q?iEe7D6T0kpFhykYsDqMM6Bt6WyovtTs++qHrtoHISJq/5SJyetCszDRsjGHr?=
 =?us-ascii?Q?rvPntgZq8lrZRQSfUbr9On1+OtvfijqnWDyDU5Xmy8z8knxtIO1jFRXHSEAP?=
 =?us-ascii?Q?SxCxHVqRG/VPePeIsWn1UlqFayduTTMERJWtriKgwMIp2HmGjscSGtROLWJw?=
 =?us-ascii?Q?F/mYE8rim1X+xtXMT4OU5Z/X90dfKS0gIYYnbs0u+AXBY4SKIJ4To8J0t0xo?=
 =?us-ascii?Q?WxVCXOFGDgUhSILgmN/5uHWXdT9VMHosX/bUAjRf9NWhBvIJWCaml3Vlu7Lu?=
 =?us-ascii?Q?l7Fxmqg+jEabCnueTcN257559kOGwztHoh+u79+pAOANGzma0C+mI37osOMx?=
 =?us-ascii?Q?iie7BVY+e0OYLFydiLDvyLU79hcNk8Dc1ef9YBji5/j0YiFIx3nE3HAMimbT?=
 =?us-ascii?Q?V/ntYKf/PJs3zfUK8NE9Q7jTcH5fRrwR+6Upcg8R9PrVLpJtbPJ7NtGytFWQ?=
 =?us-ascii?Q?YKqXogRHZGGk4eDXf7AEvaFgBcFajU7zx5xehAWgtXIaF3lTrR6XA/e7q5Mp?=
 =?us-ascii?Q?h/6gRzQffx2WnNxzMOAppRVKpK0waFgOHAajd1SooaczeIGRlXrH9wX/BDFd?=
 =?us-ascii?Q?Lcsgjs+L0BMdzKtrb0kNtq+p20gIQAsn2/75huYNOp6Pu8s4837hjIgt/Pfk?=
 =?us-ascii?Q?zQKlvicgYp8yTXLfyE/Qt3S+QdB5OoIK2sumbR3W1tVQv7hDcwlCWYf68eII?=
 =?us-ascii?Q?fYijY7k6Id+5tXjf73dYabPThupL4DaY0J9zJ+Y4xq1M9pC7MWmPktJxWFS6?=
 =?us-ascii?Q?gjHTSYIjd/v4xmtZrUyIwzknQeA5BMwe+ZeV98UjX01XfcdZhHMX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0b0efa-879f-4685-0e50-08df0186431f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 02:20:27.7700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0NauCYHuJd4i/M/HybRRfKKMV6I6AFUkQxni2t29xQAiI2WpmXPNN2eIHALD24+r/awnkj7VnLjXtj2fbBEE4jTglPkZmrQ4VIkzqfRYxXkjrZd1JkUlE5sYHzzx5kp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

From: Chancel Liu <chancel.liu@nxp.com>

MQS (Medium Quality Sound) is an internal audio DAC available on multiple
NXP i.MX9 SoCs. On EVK boards, the MQS output pins are typically shared
with other peripherals (CAN, PDM microphone, etc.), so enabling MQS
requires switching board-level pin muxes and disabling the conflicting
device.

This series adds MQS1 sound card support across the following platforms:
  - i.MX91 11x11 EVK
  - i.MX93 11x11 EVK
  - i.MX93 14x14 EVK
  - i.MX943 EVK
  - i.MX95 15x15 EVK
  - i.MX952 EVK

Note: This series depends on a patch for MQS driver:
https://lore.kernel.org/linux-sound/20260820021454.2229094-1-chancel.liu@oss.nxp.com/
In which, MQS_L/MQS_R pins are defined as DAPM output widgets.

Changes in v3:
- Describe the on-board MQS output amplifier via the simple-audio-amplifier
- Attach the amplifier as an aux device to MQS sound card

v2: https://lore.kernel.org/imx/20260818030211.3141710-1-chancel.liu@oss.nxp.com/

Changes in v2:
- Amend commit message to describe SAI1 clocks assignments
- Remove redundant clocks/clock-names for MQS on the frdm boards
- Add the missing <&can1_fun> mux state to FlexCAN on imx93-14x14-evk

v1: https://lore.kernel.org/imx/20260814072022.4064009-1-chancel.liu@oss.nxp.com/

Chancel Liu (17):
  arm64: dts: imx91_93_common: Add clock and sound-dai-cells properties
    for MQS
  arm64: dts: imx91-11x11-evk: Add board muxes to select between PDM and
    MQS1
  arm64: dts: imx91-11x11-evk: Add MQS1 pinmux, clocks and mark
    conflicting devices
  arm64: dts: imx93-11x11-evk: Add board muxes to select between PDM and
    MQS1
  arm64: dts: imx93-11x11-evk: Add MQS1 pinmux, clocks and mark
    conflicting devices
  arm64: dts: imx93-14x14-evk: Add board muxes to select between
    FlexCAN1 and MQS1
  arm64: dts: imx93-14x14-evk: Add MQS1 pinmux, clocks and mark
    conflicting devices
  arm64: dts: imx94: Add clock and sound-dai-cells properties for MQS1
  arm64: dts: imx943-evk: Add board muxes to select between CAN1/PDM and
    MQS1/MIC
  arm64: dts: imx943-evk: Add MQS1 pinmux, clocks and mark conflicting
    devices
  arm64: dts: imx95: Add clock and sound-dai-cells properties for MQS1
  arm64: dts: imx95-15x15-evk: Add board muxes to select between PDM and
    MQS1
  arm64: dts: imx95-15x15-evk: Add MQS1 pinmux, clocks and mark
    conflicting devices
  arm64: dts: imx952: Add AONMIX MQS device node
  arm64: dts: imx952-evk: Add board muxes to select between CAN1/PDM
  arm64: dts: imx952-evk: Add MQS1 pinmux, clocks and mark conflicting
    devices
  arm64: dts: fsl: Add DT overlay to build MQS1 sound cards on i.MX9
    platforms

 arch/arm64/boot/dts/freescale/Makefile        | 12 +++
 arch/arm64/boot/dts/freescale/imx9-mqs.dtso   | 57 +++++++++++++
 .../boot/dts/freescale/imx91-11x11-evk.dts    | 54 +++++++++++-
 .../boot/dts/freescale/imx91-11x11-frdm-s.dts |  2 -
 .../boot/dts/freescale/imx91-11x11-frdm.dts   |  2 -
 .../boot/dts/freescale/imx91_93_common.dtsi   |  6 ++
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 54 +++++++++++-
 .../boot/dts/freescale/imx93-11x11-frdm.dts   |  2 -
 .../boot/dts/freescale/imx93-14x14-evk.dts    | 55 +++++++++++-
 arch/arm64/boot/dts/freescale/imx94.dtsi      |  3 +
 arch/arm64/boot/dts/freescale/imx943-evk.dts  | 83 +++++++++++++++----
 .../boot/dts/freescale/imx95-15x15-evk.dts    | 48 ++++++++++-
 .../boot/dts/freescale/imx95-15x15-frdm.dts   |  2 -
 .../dts/freescale/imx95-19x19-frdm-pro.dts    |  2 -
 arch/arm64/boot/dts/freescale/imx95.dtsi      |  3 +
 arch/arm64/boot/dts/freescale/imx952-evk.dts  | 77 +++++++++++++----
 arch/arm64/boot/dts/freescale/imx952.dtsi     |  8 ++
 17 files changed, 416 insertions(+), 54 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx9-mqs.dtso

--
2.50.1

