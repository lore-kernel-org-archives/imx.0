Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010067.outbound.protection.outlook.com [52.101.84.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153D23F9A08
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 07:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692035; cv=fail; b=UufJeq3AE5fAEXbxBo/ODcGe4oAoTpAlBzShzKZ1RDme4xMEzGZndS7jGpaSie6fFlQWb034wbYUigygNgX7O+b9sMiXEaqC6X6Dwfjf69mnuVWdfS6DAt8pfNHoKD2T5T+ZG61UbntlKzZ5/BoHr/z7vYCOKQ+8Uw2URaXbp6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692035; c=relaxed/simple;
	bh=V88Vek51hzmutppN+ArNYXwkMDJNbd2pTABfx0Ey1/g=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NlPv/00jbQiFJIGK7Ti3TZ1E+ONoTmCrX7VInYOHG9gDdM+awwVuV+wxyQkH3GYGf2d0EzhmN0hhdmYPlTQa8SnaKaWh5jyV1rj6uaxaBsAIlnSHYr387ZxPXBamjyYQHE9/VUopAyX7LBTWw0Cwv6Ev+yBhDVXOI5VQMyfbEgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Nx9CLbTt; arc=fail smtp.client-ip=52.101.84.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Nx9CLbTt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mb738Ma8FeSSd0vYGg1UQkC61/ADQjrj3F9/wHapkY+IGjc+HsnDFKFwo8lmXXjgFW1pKB38jaxPgXXTjxK3LiUA817nGEgmvyZomzyhjhIczMue89L5XMniGwSQA+tKd5n07Cs5USFp5KLfFNFJtCkAuiNwOMUtA4TyPXZV5vIXXy0N2EJEY3Ywr1kL4ghmYVQHGwILDbT7B9VBv8MEeusjidBD7eICTwrbpOSfkvi5COGvkuSj7LXiJUfxu3qWdriKWblrkk96DPn0afbg4Y8MdZ5JnWpfsD+C3xVTUjZekhvHnrCWtMIyPIloY4LpVtLFcsbzmgfQ1M9TeHV9mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a98GTpOYg7G/88XXQaE/FeVPX7tgu9SzhOpcp0Zwo7Y=;
 b=A33J4H2o/E/GCe9bhJzPsf8WuziLS3/tsjTkpI/AOkIafwfqC96gyYokNUhIov7e80GJHg1/I2R6nZxYOLYBtr1n21PN7Q4BJa4oFpUC4HJzsZQL6ewvHZqWuRD2PEZHtTMtlrPdhWGZuFxcx3q60mubFO+/3scpwKC4E63F+ppXHZUrOyiC1oB+lIUk0JcN/6K5bZn9CKhKvtOjbx85yRyH7D8OQ5a6Bj9tCJ3u6HCb5l90WJgDnD13RBdN7kMAMl4scIO7QL+j6d2AMZGhQ+MdkmWiXS5jl1EsAK7o+IcH8r5YONKCbTB1dPF13QYb57Ph9RgZ7iiPxaUHNGZiHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a98GTpOYg7G/88XXQaE/FeVPX7tgu9SzhOpcp0Zwo7Y=;
 b=Nx9CLbTtk/5hhrNBdtn1YY1QEPx3eNyoFPc/wjtEi05YYsL1fXslxMk1nRQRxRrvCaEKOzMCRwLVWicERAd5uL1Z9ZN0fqBlRopUiAbUczkg9UaDSoBh9ShIIAffH1wAGIV1QkU/I8kkNoDh9t24NwiKxVitbha94kE5sNkrjfiD0f6UoGFhofbCM41FydcmT9iJaFIIuJZGZxmxWOOre6MRJLba+PsT9S9E0kZ6WkTojlYtYpHlMVOFD5lXApoWutX9B0QdtVQvP3kXMqcV6NffZ6li2vBEh5TpfGx8vRPor32VL5S8IDqDjjWwVRvWwTziBS5BDvXA2bnseL4LqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AMDPR04MB11650.eurprd04.prod.outlook.com
 (2603:10a6:20b:716::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 07:20:30 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 07:20:29 +0000
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
Subject: [PATCH 00/17] arm64: dts: Add MQS1 sound card support for i.MX9 EVK platforms
Date: Fri, 14 Aug 2026 16:20:04 +0900
Message-ID: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0065.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::17) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AMDPR04MB11650:EE_
X-MS-Office365-Filtering-Correlation-Id: bd5e498e-4378-44cb-02d2-08def9d484fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|19092799006|3023799007|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	w0eMIOekIf+zvXKlM2o+SkV2KlgMs4Y0PrTu1Y8MSyvWrUPO5P3Trclkg/RnNu4B6+5Nw375ZUg+F5Gd1EVsdf4I8Ei1oaRSpTwGHnulZPGMy/HDvrt95Qk6FvtAv1dmfPxuThSAsTOP9AyJpNNkVp9frPS7ptuBJKrCS9PlLX3jNXn+DQGjImdF9+QRUPjMctmW7wL2fDYqOiTKv6p9ITofia2zSRlKMf8WtUPJoppDdhjbSxwUq2NlQfyMzhKMs8F6cnSX4jbbLv0SKC45tdh3BvE2peTn+H6Bd4mOZgRFDoegoJSxdpPCovDeNszFYeU3E9wFx/Acs2qKYWOY3Eour18XgD1WC4LrrcAfQGS8eXcTxcEw5gS/Zj90FFvx8B+9BUPyUiQoWFlW0Fsin/iHGnTgc9bpwWgw43Bqh+4rrWMJWU8yTP9lTvGj1qy97UyGxqceuLmGurCdX25utRZ0782euJVcP8+fzPjKa3HTUA3r/3kDUX/UgRQks/3ft/KvLKWe9OJAEKqnQIBMPKTFXhiXVwdxhX8ScST5a0Da8hm9XxGhCTn++yTEAmK4a/0YjFlajwF4GYui2YhTrqog3EfgGa3psucSz8Diwu4otuQ6AkTM9cYcnlYkOlgpn6N6XtUGWaZaDCwaSP/953+xCQbgIbM+UiJW8CrzQOI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(19092799006)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kEKKHgoh18QkfYXCzHFlLt0ffJMwg1pRxmSRNxYv5T4LI1G2vx/BtrtVM+81?=
 =?us-ascii?Q?W9taHJYDGxzVeJ4gYUAbV8K2qQraKxyzCqMr5mLNrNGfIolpiLbPCj7juCWU?=
 =?us-ascii?Q?3PN0evrGX099jp/P7WZtQQX3D5bZMt2eJhKHXmJLUshBJb81HRdMa9BtLiTF?=
 =?us-ascii?Q?2zBEI/dt8a9CI/+YU5zTnx+QeuQ2/do1plzowyNQ3ZP9CurY+zx0x97WWJlR?=
 =?us-ascii?Q?Ioxp61AkfWDQKiwoscD68CWlYSiP7PkdmwJiJ06gnhq04AlEkzq35bF7Mi+m?=
 =?us-ascii?Q?R18Icxk1dTWutJ7W+JzYjqM9FAjJXL86mMocBev2ttJw/G15t+RtwKPxoNxZ?=
 =?us-ascii?Q?GqfApR2DJPI2p8B1s1pw6CgkRQsPOErEbwWfaE57ttVHK0i3cqjg0ZedTXgI?=
 =?us-ascii?Q?eYSYFKBu7uohHLnN0qs1oxfYIaSha5dMgwVd9MTelFyJkV6/8gzWZjr1ruq1?=
 =?us-ascii?Q?CXiTkIcRN0h/Rb0k35hzyl/0KuFnazqLm4zQTpvmFDC7l3sEhhT66pRQbRkZ?=
 =?us-ascii?Q?ROc4emaCdv/K5p7cKCcuQhTXf7sOM87NjFhX2xRRA4XnqtefMcvBerQQ4dIL?=
 =?us-ascii?Q?RWAhNB32U9jAAcpPPj6s9Z6uPKLqWTl7cc6N31o2qgvITl7MdgbupOl82BHa?=
 =?us-ascii?Q?cy5EVtC7HEKYdyIyKqygMC+2B6ALpW4T7XN2tDSMvXnMOXQYdsLNzTPQlmD4?=
 =?us-ascii?Q?CF1/8M04OZ/6sMWuVDvPX7uMsv7MPZsUiL+u8on2c9hukumY9m/cL+YXEMGE?=
 =?us-ascii?Q?Wg2wxfVlnCUE7TqiMny5jNCe7D9eJ2eM7Ky8jFJ4ncQ3M9wzNEzuIFnmwe+6?=
 =?us-ascii?Q?zJJMNwr2D1fjWeqBYDKmXsN1yVutBcighlQx0w+CtGP6uiaYpuRRD9CCiEyY?=
 =?us-ascii?Q?jXlJ+eR+F0LBZoLUIA0r998l/CJHQ+sTB5Cp8Lu4FkwLJJVsmOWYwFb6LqKa?=
 =?us-ascii?Q?FD8OZuHxJO/dialHVK1ckQ0TlvMgEsDJCScVVLYEduKsQOKdyRrIHAeGdbla?=
 =?us-ascii?Q?prauG9SWmS3qhRdadGAWtTu0TMssBrGNFLaAOzGYLMRzOlcyVTF7faEUHmlx?=
 =?us-ascii?Q?EGo0QfCcRHLm+OEKW5tyZeH3R07DArQTggwcS5VwGOKGOrGryRrZ16UkXIYf?=
 =?us-ascii?Q?NPO2yqq+snlWXZa4kCpg4yzN9OzR5CpbU0RamPS1SEU18jUxn08bMzrTn/nk?=
 =?us-ascii?Q?HjVDWAHBF8HpQIxqp6OcEnbfLO/LG09NetunwdxYR0WhmGSCZPx/fncDS9Wd?=
 =?us-ascii?Q?Kyc9iHdtDqV80VdjVT2rgRybd6bro9J2hNlbwMJCLdsCbpodchimBdj1lNHz?=
 =?us-ascii?Q?z55kkIzBYWsw4WCYPcRN5xS0einVecnd9L1oSeuw08S58Yp4iKOvnFHdbnpB?=
 =?us-ascii?Q?3zIRapr48UXl73o2bihcTiezJT5ZSb+lI3acQBektr4zrLDjDbEha8cDep3s?=
 =?us-ascii?Q?HxhBIwADxI9/wfMT/Xk0TQYNARkQbxnnyIM8HPjQs3vbCD8uEn6DQXzp9Yce?=
 =?us-ascii?Q?52xhekO7XrucgjUXskfR45OWSU8Nxmkp408/LGt4DlxKtTeqlLJTYckt+UKl?=
 =?us-ascii?Q?DXy8Qs5DxGX3WQKYGqvcrfl8UrBcLv3VDcZ/MKTKlxS3oLgL+26n9wmiw2cY?=
 =?us-ascii?Q?9f+dlG43t+zr2qB/LKN/v/cppPP5xKkyKyrgHfZNJYXr6otDoulqkoLtpYua?=
 =?us-ascii?Q?cniKUwW8qjbewi0LQFsFVBH7vgtzd/nRlMi4rG3OiU3rYRRz3jdmxBRP1YWx?=
 =?us-ascii?Q?nI9W5wSOTIh43w9NRpI3LCWfpB+NmUPdzjOvHrPwBot6seoINhXw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5e498e-4378-44cb-02d2-08def9d484fc
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 07:20:29.8420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7zag2tf6IVvfhjJJ3MvCf5yolVDrrCZgg3ptVvoF09wJ57TZiBvDTGLjrcXvoLuV8kMv28spm7CVFhs+mJ0QIs5l1L2x8bKWDdgAazSvJuV/jliPLG0yTtcZ3bZ6ObMi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11650

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

Chancel Liu (17):
  arm64: dts: imx91_93_common: Add clock and sound-dai-cells properties
    for MQS
  arm64: dts: imx91-11x11-evk: Add board muxes to select between PDM and
    MQS1
  arm64: dts: imx91-11x11-evk: Add pinmux and mark conflicting devices
    for MQS1
  arm64: dts: imx93-11x11-evk: Add board muxes to select between PDM and
    MQS1
  arm64: dts: imx93-11x11-evk: Add pinmux and mark conflicting devices
    for MQS1
  arm64: dts: imx93-14x14-evk: Add board muxes to select between
    FlexCAN1 and MQS1
  arm64: dts: imx93-14x14-evk: Add pinmux and mark conflicting devices
    for MQS1
  arm64: dts: imx94: Add clock and sound-dai-cells properties for MQS1
  arm64: dts: imx943-evk: Add board muxes to select between CAN1/PDM and
    MQS1/MIC
  arm64: dts: imx943-evk: Add pinmux and mark conflicting devices for
    MQS1
  arm64: dts: imx95: Add clock and sound-dai-cells properties for MQS1
  arm64: dts: imx95-15x15-evk: Add board muxes to select between PDM and
    MQS1
  arm64: dts: imx95-15x15-evk: Add pinmux and mark conflicting devices
    for MQS1
  arm64: dts: imx952: Add AONMIX MQS device node
  arm64: dts: imx952-evk: Add board muxes to select between CAN1/PDM
  arm64: dts: imx952-evk: Add pinmux and mark conflicting devices for
    MQS1
  arm64: dts: fsl: Add DT overlay to build MQS1 sound cards on i.MX9
    platforms

 arch/arm64/boot/dts/freescale/Makefile        | 12 ++++
 arch/arm64/boot/dts/freescale/imx9-mqs.dtso   | 54 ++++++++++++++
 .../boot/dts/freescale/imx91-11x11-evk.dts    | 41 ++++++++++-
 .../boot/dts/freescale/imx91_93_common.dtsi   |  6 ++
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 41 ++++++++++-
 .../boot/dts/freescale/imx93-14x14-evk.dts    | 50 ++++++++++++-
 arch/arm64/boot/dts/freescale/imx94.dtsi      |  3 +
 arch/arm64/boot/dts/freescale/imx943-evk.dts  | 70 +++++++++++++-----
 .../boot/dts/freescale/imx95-15x15-evk.dts    | 42 ++++++++++-
 arch/arm64/boot/dts/freescale/imx95.dtsi      |  3 +
 arch/arm64/boot/dts/freescale/imx952-evk.dts  | 71 ++++++++++++++-----
 arch/arm64/boot/dts/freescale/imx952.dtsi     |  8 +++
 12 files changed, 358 insertions(+), 43 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx9-mqs.dtso

--
2.50.1

