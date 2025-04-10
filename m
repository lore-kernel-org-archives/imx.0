Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2084.outbound.protection.outlook.com [40.107.247.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C994118FC9D
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 06:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744266433; cv=fail; b=V1lr7P97N7GPz2KnfAypu9Pca5Oo7iE22fiUY6dce1Gj4DHlanNXgd3WzDfOpu1oPtqzU53mhGAnv95wKlai8U5/kuGxKCYALmxEeEQ7mfPa5nXCNF/95J3C0eNyzq8CpH+HilfPs+KiK/urm7A5cT4J1MJRpVVgVVl12yKdZco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744266433; c=relaxed/simple;
	bh=y1VYeJ04a2KfaazDLhvUiwkgg2TgQHRd2nMWMTqjR8c=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=uOlE0DazTX3q5pUxr/1IfyBYVeFdMMQbq9lYkNbt5ure0YaOGZp52IhyxGayCiDmBYWAyvnw4L4mRkbinqB2tbmr/GjdZKBpxjDLFHK5JJ/3oWMIGpW6eZhbct6Vj0MDpAMlJ0VHr/5fKOKeBajhjQcaYJ7Asv/33JIgYhYip6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bLLsnxNZ; arc=fail smtp.client-ip=40.107.247.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bLLsnxNZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0dI9S2K8S4euKdWE4F/5NE2/vvvIYoCRzCR/4nwyXTv4f83lHBBhU0uiTXJqE16h7EvuPwLXUPPuEPGtem/aN32nDzn6TWpLdyLYM80sadwqeK+wI/6xN1bhLNQaWtSgIcpFUWu8WfW0f4viHQYKpOcmKV1Uh1TW0XnDqKUUQZRhIRnFAkFaOW8TAJXH2oIyRdN6mSHljQLyIYoD4Uj7gMTgcUcECR1deafPX4Csk2wDf8HlwvLXJzne6DCME5u05ntBeirJRd8b36K4gXq94TBqrA97A2B4mcaPnXJxWxA3TuBIaCoyXGlIN+LS9jMI6PCHKNkfhug86b1g5SLoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1fULcPEx1/PmTo4SRlI0RSXdOfG+78TEgSYzZlLe/E=;
 b=Ow38C+bn89z4WdB6tyGyrkltylEyvQMTr2zj+PuEL9i4jaAGU76MLyC9MmlTdcDKwwfQ/C1IKCzYde3qr6F8RQG6v8uw+WqGL89kghgmZkIz3onhkNPANVE4vQmIrHEbmy5JJPZzQNyMrgdBIoE3XIOHWJigQKM5mZahpcUMx4lpss89uXqqJAxKU76rE8ePkErZ/2mmOaL8NzXWEEXkRpCh8cI0nTSBK/9XzGpjao08pNfQ0HQSjzBnHv8492q50M4Rb69T3sCxzAWjA56S7MixaRa9mkLAiVkTc5LwkeMnXNIIKqU6KVT7T6HpXcNEF92BjzpJAs3r47MDfOYz7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1fULcPEx1/PmTo4SRlI0RSXdOfG+78TEgSYzZlLe/E=;
 b=bLLsnxNZPYOslypxhhDGMozYTRMrxEIR8ISOHe49/g72ZYcn8hOPL3bdZWOd35FVZE3UmDFVsmEdIOjURYuR0SsyuVZsBZm+b5TfvIX6y3aQLweySGnNbQww0qrrE0g5SSGC1JImdtPWKewg6lBrz5ibBz7DdK/UcLyRSoFXkK7H+MFNANYX+Hv21aVPrV7hfHULGz92HU1yOBpczgv6CbnKlNErjXdC2W3lqM12WkE+lNrR6O5hH3FC7/+caNtU6D9XdkzHR4eaB11B4kpDUCEnof+FeyFFSwtJieH1zRw0IGQDVm4v5XVJqrRoMOAV5+fgDmBpp/Mk7E1cswY/sA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AS8PR04MB8801.eurprd04.prod.outlook.com (2603:10a6:20b:42c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 06:27:07 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%4]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 06:27:06 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	aisheng.dong@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com
Subject: [PATCH v5 0/3] Add i.MX943 basic dts support
Date: Thu, 10 Apr 2025 14:28:23 +0800
Message-Id: <20250410062826.3344545-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:54::20) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|AS8PR04MB8801:EE_
X-MS-Office365-Filtering-Correlation-Id: 71b0d5da-d086-4414-fa63-08dd77f8b740
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4W+xYXWv5MuB5oxHBaUEG+coRw+W6Kku07f54+5uYPbZmj166ycWTAXnA6MW?=
 =?us-ascii?Q?9Ls2BWXxvhaGDqlh11trEpLrFy12l2X+cAaVOZjG7IIRK8sv3013a5PRggj2?=
 =?us-ascii?Q?fCgKHonJgzbdE0DbEkiry4eee/7EHfnUMiVvQv38oULy/wAmgnodcwEWaYjC?=
 =?us-ascii?Q?g49mLYukWaLDwXIrSWjsUpsUu/uvFCk080Tmy0gsa00GAJlNS4nFtoXWq9iA?=
 =?us-ascii?Q?tkUIKL5tArE4lkRD0q7IB8UHX+4QdoUC3jTcbEzRGvLKP6D400W2q6zJ+gWX?=
 =?us-ascii?Q?m41oSQneb/zLsU+YRigP3y3DWHMU+AXEpJd+TMRBOHozhaZeM+5CjyTigfql?=
 =?us-ascii?Q?gCTpUL6RIABT6V/2Md5nRQ5HxTpOPPbeOYSeYWCOiwMIBTGwrmAHQ/rUymc6?=
 =?us-ascii?Q?872LgJPtO6089mk8zxN48hE5wTUQMzs+jfQIAGNX3GA7BdpOtkUZYgk9T+xJ?=
 =?us-ascii?Q?SakAeTw4sk8a0xpQy/BRY5Ih9vUMKxz9/9Y7is6MHqv2HcAqI2j6xe1k+ktG?=
 =?us-ascii?Q?26yZShcLpNfYRw5AY3d2kpe8tId7ZHGHTbhevFR1Ogk4v01z/oqkvzC5pksd?=
 =?us-ascii?Q?+P5MiZKyFNvR2EeeMCCgFR3xeIu4CnrNerbu7eKqmwSe6tPnYKMgpett+Ndo?=
 =?us-ascii?Q?qhOgxsTcBOI3vO4/9+0mCFs+A/WONIYqcg7Ivr8b1NPWx4KUyQ1xrV6nM38p?=
 =?us-ascii?Q?AnZaxk8dkWd40pyBpwtv55/E9ebifTjDg083YsW3jYnyeLzi9zRTl+3DHBqy?=
 =?us-ascii?Q?SmaDkiJHLM+zIY7auZTW/klpall1ggMSgwyOai8aYeweUVBztV3y/8odGffy?=
 =?us-ascii?Q?HHqQx3FjCLqhqYnJGBoRC/dMzr1QLrI+j9dCzL2aND0249eqe54DBXCaqW84?=
 =?us-ascii?Q?X73y+aVe2wH9lgP6V4T3E6Gfb8mmNBdvtcna585bdItdPye9lLORsk3FJiLn?=
 =?us-ascii?Q?OmMX3jm8yNNbQeXNRBnVMGrTOmeReRwNYtNYcIgtrgAhsrnHYsOwjnGfUkqV?=
 =?us-ascii?Q?MIEg/t4LbkWusvcbMu8SUT+RbrAioYJG8S/y110sRpBhN57w83sM1HeVG5zU?=
 =?us-ascii?Q?HXnTm/buQH02Li8fTDeKjstRu8y/JaAwhpMLfFY5fjktF9yUUraHeDWHX4CX?=
 =?us-ascii?Q?vhA92vZZRp2SwuGt70yQ9x1tzXdxb3p9gSZhpWCpMdKKaUpKkZTCj+NBAids?=
 =?us-ascii?Q?5ijMpZDPH+VETtpjuhwbnv1cTIemDn4WZLk8hZ4W/2m1mOKyNNPUL+0HPPFc?=
 =?us-ascii?Q?bnKxNfSnhafE7zrj3O8tELo076TWMRM75kExNlKG6yhjNrkFQXkfFgbMoxP1?=
 =?us-ascii?Q?oQx0kc1jHxhMPHq66rW8p/ZhXaUoW1RxbGDc55xao8DNJfZCfyNpDnkXwMyh?=
 =?us-ascii?Q?XeGIHzwF/7qQOf9Zi+uUy0Oaek9tVtpuCOukifPUzglRE4D9/vYqmslG3sdK?=
 =?us-ascii?Q?OzrNHcW3GSHrxWi6NlxAUIYiE6rj/U1sgXy6/o7IxdtY+C7X8ZRnVQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zQJZh9Pz+UGzQM+HeQs/a/2lV6KRIJU+HLBHY7fdJQrMEwWsSJKJaUdywOAt?=
 =?us-ascii?Q?M56eMyvw80nXZukZof8ckQHBkhEtkzj7AVZj6nJNbvOuWHK6KkRpHzqpdVAl?=
 =?us-ascii?Q?xU8RlsQc4CasrHknGyssOI0cA02Jvsqdd3PKbGrtJ+EfxrqRgrqy5t+fE/3l?=
 =?us-ascii?Q?3yRCcMejaABz/Y4/SB3PsH7oOhLX3Hyjq0pBftZXyEfSLvpoQzXd7MW21f4O?=
 =?us-ascii?Q?hYsInzIAoPp+3fD4RunBo8zRhSxTlRsHfdI7w0K/7mXYoWn1nTM3jc9NLci4?=
 =?us-ascii?Q?6eu8wZgqidU9VoIQjyA+SCVOIW4UHgqw58kPJGLb4MKeg2J0rOSI7bmqJfJ4?=
 =?us-ascii?Q?pmoQ91znov5t+huU8JjGdzK3mV4m90OEgf66cwBhICKv68VYRc7b5YhcCSAN?=
 =?us-ascii?Q?5DsMjLetUf4x7fT81pMg/RuJIDkcPoGQbuzBezk0D5ubsfVjBEYEsSlWS+8B?=
 =?us-ascii?Q?/lF8ShNatwxt4kQoSNDbU2GfNvGoEPwo47XqfrMr3fz/Ge5aeK1pDZ8Yc5H2?=
 =?us-ascii?Q?9GukuEhlKP17nfcx7eIeQgdAdrNf4awsP/+c0Hhe5El0kGS9ifoF+S/b18GE?=
 =?us-ascii?Q?9GfUnn0ZYScd9t/BmiF1sm+zMyWb6BQJ94QgmsTAqzTh3fA3nn0kALe9cgU4?=
 =?us-ascii?Q?nniNe6HP3oMOYU/v1vmRs5QTspkUpiJW7Or/OYiRimEStO+EKrXOsTmMxpuX?=
 =?us-ascii?Q?177sKFVoCIAE1bxJD053RV8+LZcMeKgl9MScSzx2lYYIZCD1jU7zDSzlD8RO?=
 =?us-ascii?Q?yAftpS9+tZI8gFlq680/rHDUx4vVDnwo0k6nr+hsCHDKLoG/XkZEqC/Ozfg8?=
 =?us-ascii?Q?lLCbHx48gY69/HZFnLLaUgOOP9kvOr5f5zSheNn/PKF8bF0X6gflLZSKTZSM?=
 =?us-ascii?Q?8mxEORcXpOU02g+dEpMTI7X2eJwWkJNfGbWR9KkZ0cFoBOp5MWB4DPr7NXCt?=
 =?us-ascii?Q?pM58IJTgtSkHmiEPWSu/sJiYhkurH1yJoXeQB0cKEDYhXApDSWswbZKA6y0d?=
 =?us-ascii?Q?Cj+rK/HwZvPoDbD3d/b6vNzM9toe0Nc7+8eB9Jr5N53p3g1XeL6y9fKgBRjC?=
 =?us-ascii?Q?yV0H2yQ+s0kssvtkPWYED2Iuf1zMQdgbZJ1NQrhMNZEUgLGgU8abvrlOEImP?=
 =?us-ascii?Q?GMlNqutuEZ/T6WGJpRE15JKo0Fq7XeVEYA6u1RzBrRi0k7VtijdOkuYVgWy1?=
 =?us-ascii?Q?VmrWmN13PMo7Rexe5IG1L7rthnjm6liamr0L79tkAeksXrlG72m8RRMn90Kt?=
 =?us-ascii?Q?GwgXOI0ipi92m3rEBk4j44K5scHeycB5mYL6tiaRu+fIgrSHotFDTmP+jabW?=
 =?us-ascii?Q?7C1xT87iQRAnaCMA35SK6xye0YMG1i6zDpZ8JVDyqIhnWyZwSQgDbnpTThln?=
 =?us-ascii?Q?VQ9t7GFzQ96/mNyJtEBWC1qBeEsojdO22s4A6zWeShO2KnKTd0Sn8xc6IYub?=
 =?us-ascii?Q?eFiZtLXF+NSsMb5elhlfokhPt6dPo4E9V6DNdeD0Gtg2kjOo/cvS+WrzxwsD?=
 =?us-ascii?Q?GJB9M4Or4wNmVfG1eTzhBogj0iXdUkOcRnJX6jgEsKSyFba8Tv+FFvpLaI3d?=
 =?us-ascii?Q?83HsdVifIsPwlxkczoCWV5etGZFfOs4wsngJy4z+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b0d5da-d086-4414-fa63-08dd77f8b740
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 06:27:06.8741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ETHSV1Z1hSshgvz5mHEwEQGouIkybQAzdSZTewr+GE7/n29yUA4mzjLBNtzj8xFow0v6EU5FVgkuztG8iR06LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8801

i.MX943 is the first SoC of the i.MX94 family, all the SoCs
of this family are pin to pin compatible with only several
peripherals differance.

For i.MX943 device tree support, we split the dtsi into two
part, one for the common dtsi that shared for the i.MX94 family,
and an i.MX943 specific part.

Jacky Bai (3):
  dt-bindings: arm: fsl: add i.MX943 EVK board
  arm64: dts: freescale: Add basic dtsi for imx943
  arm64: dts: freescale: Add minimal dts support for imx943 evk

 .../devicetree/bindings/arm/fsl.yaml          |    6 +
 arch/arm64/boot/dts/freescale/Makefile        |    1 +
 arch/arm64/boot/dts/freescale/imx94-clock.h   |  195 ++
 arch/arm64/boot/dts/freescale/imx94-pinfunc.h | 1570 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx94-power.h   |   41 +
 arch/arm64/boot/dts/freescale/imx94.dtsi      | 1138 ++++++++++++
 arch/arm64/boot/dts/freescale/imx943-evk.dts  |  195 ++
 arch/arm64/boot/dts/freescale/imx943.dtsi     |  148 ++
 8 files changed, 3294 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-clock.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-power.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx943-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx943.dtsi

-- 
2.34.1

