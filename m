Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011031.outbound.protection.outlook.com [40.107.130.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8957D2CCB9
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 03:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787022144; cv=fail; b=gM5XUSGerwf5S8y4/JdKdW5lFUr4ZuvX3PH4DgQPqFLjZVIqQTsO9EzVGX0qm28uKPdroCvtZjHDZPu+P5ZSe2bezhPr0xIeB7izN1OQ35xP0DWY9ft1WmEfzCaUWsmF4QfHth+1iXOtpwwDRsWXdN91xGW8nYZ8TJODqi3ktcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787022144; c=relaxed/simple;
	bh=SMOMAtjLxSN7kwBdmSXc0xNqy2Tw3AxZ4vHD1h1t858=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oCeAYjcKKK+7URtJhhcj+Vb86EmZG0bvwgCDU0wv/RVx0qrT1q2yhUUom+fMwtJ0ramRh/h+C9Vl21MSzlhMyYRhuWTYO2YEQmmhGO0rIeRDpvFZuIOAJ8qMab6yZz+n3AKGNbhzA4eMfWWHIuc2JDIkv1n38aXJR7vqdr+BVsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Th7pq3rw; arc=fail smtp.client-ip=40.107.130.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Th7pq3rw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIaHTL1fEW109NYARUeCGJaTigFvLyp8lJlHu+NCaaRu/nGzFJ9V/QsZxrNpcFP8R65+ZuA3yfMOJS4ZBh425A6hsFcJoSq42qT5R0GatmnbD75/IImmQNsFgZEsTDmSHvSCVR5Hhg9F41sEMmP4IuMYJbxkhgBumb0Vct87d3Kh3pjJdS9OyXgNcPfDZzdeNII1xC2xkGCF8ysnq2UsldFbkTBqP86f4lrL6/j8Ds6cKzFomgPy/2EogiE23J78xE0+GHRRJN07+S/wglkoL/QoMlst/VP3nN/v7tHLiZ8R6q755kMvkGZU2KKx6dZR1hrZfR5ZwerjnZI3Bbfy/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjpDOU5NRpMdngLH+Ko355E7BOo+DYzAsLpVptIMEKM=;
 b=l9xmP1EIXFrVaHKM7auiCuhrrabTxwog4iYI803FilLJeSLZ+sW1tF4wrRWz/kYqP+/O/Ve+EuYaLrv3iCmTst8UDKQ7iSBRi/3HSGMmv/VLIgg7ijZ8u8l2v1XOOcxVSaTVzCIZehSLbhg60uuE32vClUCjJlTFxGv8m+xP7lTDZ4xoQacI5tkUVJiVOPLxg9Is81wKISPC5ttfT0Sl0Z3fMS2t0QwpXTUnYSoQscCzI1YmwYRonmVrPgvOBMN0cyQYhBNz2wZR2KrvtfN7h8EKAux3KglkxQ4SBLDethZ8lBz2sz5aLCZ+OFTTp4ax75DZ5RnTPWBSmFzMVwebqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjpDOU5NRpMdngLH+Ko355E7BOo+DYzAsLpVptIMEKM=;
 b=Th7pq3rw4A79CfopA5hkgT7uLrfRysYqlwkTJW+aecOWaohqCU+UXRF9aX+TS2f7ugy6LZR1rcXX3zm1ro/LWedkSYjfhdtesiuEEIj9njawegOG9c+ewm/V2h8YyMJiM0xtWGRCUKYKUt2gaYewYplt3JSqmBiNplTuFh+kQOXvx4Dh5p6CX2UkV7U8GxJWKHx5G13P3yMJwaGAZKv1jE7x+NJ/gu7jZrIC2I0OkjYu6yvBc/vq3ffY2Qdi1YfOHefW6GiHK/ZcWjb+mhBDXSrS4mSfX5MYbRDArWjyI3LKA8F30k0p6slhjGH7a7Jv4L67Zl3/gc4UgdtJWhk+zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM0PR04MB12144.eurprd04.prod.outlook.com
 (2603:10a6:20b:744::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 18 Aug
 2026 03:02:18 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 03:02:18 +0000
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
Subject: [PATCH v2 00/17] arm64: dts: Add MQS1 sound card support for i.MX9 EVK platforms
Date: Tue, 18 Aug 2026 12:01:54 +0900
Message-ID: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0115.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::7) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM0PR04MB12144:EE_
X-MS-Office365-Filtering-Correlation-Id: c4687699-6072-4f80-71ab-08defcd51cf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|23010399003|1800799024|7416014|10067099003|18002099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	29czThuyHTnNZzDfXRfpgI20mWuL2PfrY1Ty/iZlBRVkvJa3YHiGsaHCXMIZnAqDgl7kyE6pnbvPD6PX3upme+tLlJP1HB30i8BBeEGyP3kb91NJBhaim4kQQxQuFKLFQ473TTPYDEMMTZEhXgGKudmt7coneITA6Mg1GWy6xQsBpUJg7ax1wnEKjuqq4th6N4yNEaKDX3hkbtuK2xP6uG1SgLHuaiKhqNyJCgyz85OYGiC8lE4JR4rVxUEqMW28oP25e5GQM6TsoZ9CCZ+lKuUkZgiwlNGvpVDuBQIz7FS4k7X5M7BUIi6ahrsoiZp4MnNSUlSvJtbg3BXttpnLq012NgM9zqvwHmqihcCa9sssrsQYGWsj8JDyXv2mzeoTddrQ9RyoO7fR7c9PnYio1hQdN45ws/t/dAmT6kVRB9JBsQw7tE5549mm0ucJga+N8qbCpoiufhN5oOrsGrIaygb6VqtiO7UzfFDvB1ryhMLhqyaMrL8VkcSGeU8QYl9V/CRek0rHVZaQ1zSWd5kYU0wRBHq6ATgi+RrNpXDIx5JsGv7K9167L1ybSqHAkn7bxfhIiIbMMH5xMdRru1rP6aDd2+pr8pytWXTa3+9irLpU+yNtVO/GZ7FSmRUME52MIrhAS4e55BePqLbqZBPoJi/hppZtWSB1qC12gZYsqGQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(23010399003)(1800799024)(7416014)(10067099003)(18002099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cmU5dguoI7cmtFozturgfE2W6WMxtIVovUc6yVHQl9W1MmejbwpNsHPzLy1W?=
 =?us-ascii?Q?ogzNm4cEvDVIx6BEIUZCrjWDIJvcmQOV9UKZqRfp/wVf7FnvRcl1RmDtth9A?=
 =?us-ascii?Q?46vjyERQpZ3fpxov9evkeg9TtmrXiNILArWMQNdAVb9JYsc1k8HNSof0GPRp?=
 =?us-ascii?Q?bOeVKH+FT5E4XV99d85HwwV3NtrJ1zsJmdQTLVYLiGxxw9Vqv5yTWbw3xkd9?=
 =?us-ascii?Q?4mR1KIXPcc0rxMw3SZVFz/4gOsK6mHkJ8YObkPvN0Nob2KAUygKINUfLjwje?=
 =?us-ascii?Q?oM8vb4ITqKi/voHo4+Wk0dP3WWzNNft3FKwH36/kkyhkwz6XxPung2X/q9Cs?=
 =?us-ascii?Q?VRTSCiJKCcnprXpaW3aLOltKiwklXn1TOWQSIr6HPf2cJKE+mR3c/lP8ghzS?=
 =?us-ascii?Q?eYZFd+25ziISUj2k32MfwlkE3gxYYCabBo/y4MAc/tycImQwYZRF7D3wzFja?=
 =?us-ascii?Q?YnX9CaQeR5aCOqqyHosOawl/GXCgCj+UOItk8VOQKYgp3L+JTOsjUDgL5cXQ?=
 =?us-ascii?Q?fmNcZCzBQediHPl2Ciyt9fMtBA/R8HvVNui1FYdh0eTKPJhuKo51iW7AVtoO?=
 =?us-ascii?Q?BupJ4mfpPgZpkSK0DOyFPKqu6Eqy0cMUap0YDjRM94avwiYwmrRQpaoR5KO4?=
 =?us-ascii?Q?MKtjE7YYumuzYIFnlerHfXn4Easc6vf2d1n7Jxur8/wRnmG6BdG6ba2ubYNQ?=
 =?us-ascii?Q?oJkdgd/TWVKbkbZE6z90ePG6QlyPaWx0dgkV7MyILNexmzhR9CaCY6LgqCEd?=
 =?us-ascii?Q?hsHcvaq4sWFtf5N7vVGa1zPZH5cXM8uPb9/vifx2sYNlsGwztgzSv4wWbXRr?=
 =?us-ascii?Q?blre3F3M2Owum/GXPbGlCVyHH6AGqjP8tdcpeT3gOKa9Kd4vjp1LeMhPgKnt?=
 =?us-ascii?Q?8M2vZDTxnSp6ubLp8yRghGNaqQ6E7zRw0tDA40snKUh1CcraWMAAdcYuxQaJ?=
 =?us-ascii?Q?fXLWI6fcr0kQIOGIUt1JJh+GPw9ilSRtGaLey3OZ0yX5OGZeOAXcnAou82HC?=
 =?us-ascii?Q?Ujt5pnwyj3ItH+fbzXW3HSACNH8HqnZIOs9FkqdfB/NqBi8aNw2LYrQZ8/JM?=
 =?us-ascii?Q?Le6KuuJenHvnAmu/6i/vS7VCArjDpo6ueOATeDrXTDIQuR9nmPQwFeyoQpZg?=
 =?us-ascii?Q?LRZAf4W4UF/j4DRQRzPuJpd4NqRdMTeNrSYoh5zKR45WS6+bYYt9xSgz2XUt?=
 =?us-ascii?Q?wo1qyhbwRkslrjhHYikEYe5Ov9BaTrI1GL5ibOC+K2TX7Yk8RsMgZJF/Ocz2?=
 =?us-ascii?Q?9I689WcakzfwgeQvyVRIcjogyTIEN9TBM7EQirUDFmfzcuNgEB0DGJXXgLPi?=
 =?us-ascii?Q?bQF77kAAEJO++KjfZnRMzYtG1yUt46Me0ohWYdNNn1kYYPndWSW9AvIlrdVD?=
 =?us-ascii?Q?Y/3xGyQfswYFw6Kwlcb5v2o4M+qMNpmW0bxK1G4ginQWi8zKPAzOgXmtINur?=
 =?us-ascii?Q?0aXwsZERmhK6xDHAeyoK9u57JUff6hPJKFUD0T6ZYVu8aRpB0WN9fsMldPuq?=
 =?us-ascii?Q?nDMnyLnI0MbMB606JyLj+lKev/ckVDEBESBeIFFvL4sk3JL5fnunKXHS0TMo?=
 =?us-ascii?Q?1LXNMAb7aQ+JYksVCs6AsVppNXxVdFCZvZ16CQtxVCfSpIfuXiNlPk8c8cMm?=
 =?us-ascii?Q?TldJFvjHs93lYgCAbq5ukX40grmSVZESF5WuzCs2tL6Fr3+wVNvPsc3B5hZo?=
 =?us-ascii?Q?FnkNRoxIy/hqY+I2eokMFgIAwEpQWDrmq1LP4caQaVWhIK8LNFuQnvmFIED/?=
 =?us-ascii?Q?cL5pSGhMb01jT8ISKwjYK9hYpwYmQSAZJBiYN2QghHbESYtQtFWx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4687699-6072-4f80-71ab-08defcd51cf3
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:02:18.2400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pckMd/q+B7zQ4XouWtTu6/uiAaXoMVOlyQwT2CEWeV3FZfa4cwf3ZRjrKMlMHrqpB1jidu5S0UI6YUV7rdFj9A0QQ/RWNR7gPSuIJLbGJ2FKHSmDFjOC1FRc8WVQAzd/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12144

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

 arch/arm64/boot/dts/freescale/Makefile        | 12 ++++
 arch/arm64/boot/dts/freescale/imx9-mqs.dtso   | 54 ++++++++++++++
 .../boot/dts/freescale/imx91-11x11-evk.dts    | 41 ++++++++++-
 .../boot/dts/freescale/imx91-11x11-frdm-s.dts |  2 -
 .../boot/dts/freescale/imx91-11x11-frdm.dts   |  2 -
 .../boot/dts/freescale/imx91_93_common.dtsi   |  6 ++
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 41 ++++++++++-
 .../boot/dts/freescale/imx93-11x11-frdm.dts   |  2 -
 .../boot/dts/freescale/imx93-14x14-evk.dts    | 52 +++++++++++++-
 arch/arm64/boot/dts/freescale/imx94.dtsi      |  3 +
 arch/arm64/boot/dts/freescale/imx943-evk.dts  | 70 +++++++++++++-----
 .../boot/dts/freescale/imx95-15x15-evk.dts    | 42 ++++++++++-
 .../boot/dts/freescale/imx95-15x15-frdm.dts   |  2 -
 .../dts/freescale/imx95-19x19-frdm-pro.dts    |  2 -
 arch/arm64/boot/dts/freescale/imx95.dtsi      |  3 +
 arch/arm64/boot/dts/freescale/imx952-evk.dts  | 71 ++++++++++++++-----
 arch/arm64/boot/dts/freescale/imx952.dtsi     |  8 +++
 17 files changed, 359 insertions(+), 54 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx9-mqs.dtso

--
2.50.1

