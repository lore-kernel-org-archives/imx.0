Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013042.outbound.protection.outlook.com [52.101.83.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6638A331A6D
	for <imx@lists.linux.dev>; Fri, 29 May 2026 13:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060908; cv=fail; b=nje2Fw93KLeWp11h4IPMc/CX0RH0j5tN5oYA/g0haqKMKz37OdFllUa6FuQ+WBLogeCYaVkGjZQqMNX4xJswtLJS9LFe2/yLiZHRPqEMVr6F8g88ksFjUy0Ukuyl/LC/pmll7dm83gWM+Bn1Tw/2YfN9LwnFs34bPAK5HqhJaeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060908; c=relaxed/simple;
	bh=sHRmyCXCBpimXHH7XI9942d1v06LTYHfh/Yfk82pzzo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NHhy8bPlIuDAHGjEStmRfl4nHbERIzu5idEpRBiH/KpDjaq+dtgYo/V8cKXCFLmxCwvpP1YiK/7XzfIqjYR7AiweuVBgOi+vxhlgdyEYkWI07szQCighxqZG7SfN9NtmeK/xEPdNRFHQ/xx95pyW451R4E/o8H9w2C6ee5czLeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Oid1LvcA; arc=fail smtp.client-ip=52.101.83.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Oid1LvcA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mN6UbWIVy9JPJA0UXi0JPT4sSzDRa9Jt+ZmpKL/hur1YgApuOez0g4u2bBhS3CkS6lG0t22uMayqzmAql8dnrexOG39M0zUJIub1fkUYUvjuQpP+55bZS1DYil0UTNx0c28FlyExRxNvgxMiXb6MnyIsDqdXsD7/xMcVmpUuad6I/HYoTQoCcJoTvLSplCcUY1Bil4Zp+ZGpfp19jU6IkGGEHkc2dRWZl4o33C9LN4ZczyM36Mev7WIqB9+/k5QW0nzJpOJDpYkGeOtHl/ElU7bckuLbq6f/Bd1f8Izs5tOUISjDayZg0/MErbGKU5AxZ1PcyxMu1AcvOfetRikvrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NY3L3q7gruT660vFdBY3or5+/wH1PEK1chGAq42kJ9w=;
 b=CnoyiC+KgTqH9d6eVTfFPkHRnyttwiCih+l4CItVwtT99iXfQi/jQ3nylgXn3fkz50tyo14qLJU/krN2Mb8OPwSSNO84jzbT5AmAAFpH6O8rYPMQCCOlv1i//cSaYLOzain/XlP9Tm4NrDrB68zlwjl9pp03nWqjyb2LmNhyxMPAGVbOqEQ4Q/d1wCjHiM5pFRoqR80nUUv1A1gNmxd9SAga1HGWaInZJobD3HD9rVXq0SRumFpbk3b+7Yu3kOP9r5JsZWTW5sxXKAbCit8qXG6B4hZcDJQ1M7f/Xh+CZ4G0zSqJtvkdhOTIe5YTAstxRlhHqOrJ74B/Jc5s9ba3ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NY3L3q7gruT660vFdBY3or5+/wH1PEK1chGAq42kJ9w=;
 b=Oid1LvcAKdRP0PA/bYBkcJZcFHxUHPPQpJwA+nw+xeknkmTKbzIRBzUjNIOEBbgsiO3EwseS1wr1sWG3EI+ebQ0GHogdQfkEt+mFlYmv6gblLGBOIKFA6T4bPxakbDB9xHGyQ1YYKOgdaYhZSdgsidKaYhXbxxjrr7YKhskCAx5KHDzlLIT2QaVZd6VSCuOHr8T6ilThs8FKmhUAWCzfADEu+6cbtasH5Ndq25Dsv37gQYgNVBV5JN56fgRWCevTWOgjgZe1OaEHT6wcraXKk7GVzGTzRv3myJ8YdstMtLCfQNtdNYGt2V1nSzCgdJWo0kvPCwRLS1PhvQoGBsODUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by PAWPR04MB11552.eurprd04.prod.outlook.com (2603:10a6:102:50f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 13:21:44 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%6]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 13:21:43 +0000
From: Robby Cai <robby.cai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	sebastian.krzyszkowiak@puri.sm,
	slongerbeam@gmail.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	p.zabel@pengutronix.de
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] i.MX8MQ EVK: Enable dual OV5640 cameras
Date: Fri, 29 May 2026 21:23:32 +0800
Message-ID: <20260529132334.3333294-1-robby.cai@nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::7) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|PAWPR04MB11552:EE_
X-MS-Office365-Filtering-Correlation-Id: 9411036a-b0ca-410a-c4ef-08debd853a2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|19092799006|18002099003|38350700014|921020|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	6j4+sxyNSm5vL/TnS3uYgDBIG4/oVrWKiKmdjW3LZIZEi9LvcUfCtgmWi5/q1ZlAhnkHKclhUPgQqfOTDUoEr8Ihtykp2wrd24HiHq06nnzQi5g/38dXI/fCIlodjPFNHhSvzRHYLh1tZ0mD4kPig3ZlI6dvmxUjXMg6N3H61COcmdBR51663kdzLM+N3OsT0i4tdjPj+e943jZ7CL5m/ZCvjBZ6xegU1v/sVWhq7F6/lgDypGJ424pe2TOcGyoICPs9DQm0SYKinTtFATYj06Rerz8cy8iHq85jR4atVLLgyyw1QwpVP0MVacaOWzrKSERG9hu0In0ls00lE+v2zYu6nQUunlhq9fbt5jm7zByMGLtwqNMmCta1iQDZDq8UmSzQAkdDaCNEcCI/Ktdh65CFv9Ci/PfKVJ8a7M3w+FtaiqrKF84P2ld3B6R2efvVGP789TEl7DHFDx9tYJKLdC+/jicxiLMhmQ3CjPjODaFAw4dtNtEqqmYMqZKhpb9xTJVOWGw8WIcaGZbCLXXiOmXS3VUIBvVoz9HaMMOlAgRuWczYD8oM4on9Z680nklceN4XIkS2HxSUZEgZkPxEIz/RvqGIle3ebhPhUBsTRHuP0LFPH2XpAsq2TgW2JFnn12+VMEs7XuK+2DdWGCpmTkhUvSeCgyMP8CzYh+bOm2hC/XjB4kzSYBvWU88ZDlaUGA14sJQEj57qLQvnYNOIghmwsRH/qI4OBYPrFD5lQtaoRkGZ+Ej4o1Xp894wm+NlUWNp0ESlNNvvJHTg72+bvA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(19092799006)(18002099003)(38350700014)(921020)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BZ9gjKkBgch2jh7ycTmbtwFGXx6wMi6N82K4UH0MTZvxFyJNsZMcW9cAjraM?=
 =?us-ascii?Q?rRNWO3hX5iHgUkiqyvfoZ2K3vw6LK9nwDo1wbEjhBazXpPSRQ2krwyugbMyZ?=
 =?us-ascii?Q?Ne+Kdrt//fAhP12YaFp/PO0NRvSbdQ3InyNg7EGz7NWsnQZlNllBM9XI+M+B?=
 =?us-ascii?Q?wuZRgu+Ck26TujWHVvdaLOr5Eg2mzmMv8msOAfa+M67YT5HYxArQdDRvXWgy?=
 =?us-ascii?Q?7NVjU6x+7nq1S5GM1MkdR7uOb/RivccHdhFgoDoDsp02oYKnR5eNCK6wYf33?=
 =?us-ascii?Q?RBHtMYruPSODu/3T5zfhBvCrpTwZuKbnXJ6rvKhgXQAhZXUtts2zh40WGGUR?=
 =?us-ascii?Q?cT8Wdq4iX3pkYzMI9TFtwAVxq3+YatBxsSZ8bAT8spqFSutZZe2mP98ovFaR?=
 =?us-ascii?Q?2ls2W4TpeO9aqSXcj7eIZagkNICjpjAE+ZlujYG3VIQioLLyUSiVuHpVwSDh?=
 =?us-ascii?Q?c904mmxpovqb5yvRxIG0XnYW22zPip9Mqq5M/QzNgemDeBmOz7ubZt8hTMXz?=
 =?us-ascii?Q?HDIxrhZ8Qzi2XBgrin/CESh2i/IP7MnzPz4VhzMIYG9f7K0Ed4ReY+n/vv8i?=
 =?us-ascii?Q?hzzMQw2YU83TWoCZRmhP/aHsmOOHLtpG0GtcrkOqoWfB5h4YglXZp0WNsYh3?=
 =?us-ascii?Q?G1Ce3UIITv7rjnH7pSc14TZMt1ca1dhYV5SHG33CR1e95wkQy79nZ0ceAo82?=
 =?us-ascii?Q?3/DdJphYvJJwKwlPW4xoG8ELNsgX3n7r2IK2DA+RPkeB7AOJoSChDaYyWCAB?=
 =?us-ascii?Q?41jn7zTHY30Ej35VHBB3GLbWOcMG6YWNdkV7q4RUcHAvkCRl9UvNuLwyQaHs?=
 =?us-ascii?Q?6HO8DKffhV8pFnFUfz+7U/ZkzaOywyRR+ETPU1B+itNka0vNWucTs38NhCeC?=
 =?us-ascii?Q?DDCfBpepXqCodAfPAmtbzfLSalgNOMy8Hlo5YUaxo90e1VNRJwK9VbKfv7dl?=
 =?us-ascii?Q?q87sOvI1QQpvN3vtJG3sik6+6Mi6zT5uZzmk11C8n1Z3usLnP+AtHyW5OmeQ?=
 =?us-ascii?Q?9ZN+2ktl9Va67zXL51QvmfX46dJX9pDyswvmYHCXhtCMo4gtxi8+vhinNouU?=
 =?us-ascii?Q?dqOIoZPv/kx6eWYkBAMILjBO/df/UucsYFCAhw1eWsb28/gqxtq4ccOFZ3SV?=
 =?us-ascii?Q?CtRhLtYZZ2npqoXA3T52pwE9nSC/jFDRzDUmIKXzIXWyYkK94XKJwsvGqJ+2?=
 =?us-ascii?Q?Ggz0b+nGFK7qg6PsrIgzhhwcQHl3p302iTU4SnLCMXbGI8wgzjiwr/eRU1PS?=
 =?us-ascii?Q?MOYYRQKRSr7Jb56McwiJg3JGiHBaIM0Kh+Z0K4qcMu998KN87RIMh+IpHc/w?=
 =?us-ascii?Q?XgZXZgp/ltZ3amDSPruAnJL/wZRL/8UE70z20W5islq3D1vqkrEzJ1T1oxDR?=
 =?us-ascii?Q?hbibyDz7eaV2P/BkcrhADAzCi2VjXdNHDjmZuPFq4smYVEaFF3h/9dP5FOGP?=
 =?us-ascii?Q?CXd53KIv49/5OcHkrkhbf67i5wYudtVY71fDDRRWppC7raAP19iwvwwfYgrN?=
 =?us-ascii?Q?6SC+PN7KZjWlNw5Vm2teCp3unTDAqdTBIFUUD3DfHB7fM9QN/aaBuIrOKtTI?=
 =?us-ascii?Q?oWUoNLSNrkTx68erIgMNWatfZoj+VMh7dWtwM1xArVQSQ/HnFGDB6s0Buczm?=
 =?us-ascii?Q?yDsF7CNVMbANcAny4Oi+pF3Do8XIn3bGIjeKnQPfrpMJ2rUCmbqQeK22cFw7?=
 =?us-ascii?Q?k2o2o46bd2VJYru1O1VWUW8wOdgf3rqIgI6uovUeysvp5+rrUbaZK3orX9YF?=
 =?us-ascii?Q?emZd5AnrMQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9411036a-b0ca-410a-c4ef-08debd853a2a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 13:21:43.9493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XwUOJK+E9cY1Ffv12GpHudKz7JwNktH7NZu6q9kTg3QsQ08MuZ1hHj1XmUcKwkh2pDAlPTGGa4uwNaH9KeXBEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11552

This series enables dual OV5640 camera support on the i.MX8MQ EVK.

The DT describes two sensors connected to different MIPI CSI-2
interfaces, while both sensors share a common reset GPIO.

To properly handle the shared reset line, the OV5640 driver is updated
to use the reset control framework instead of directly controlling the
GPIO.

Changes in v3:
- Add OV5640 driver changes to use reset control framework for shared reset
- Drop GPIO hog for reset in DTS

Link to v2: https://lore.kernel.org/imx/20260515111143.2980956-1-robby.cai@nxp.com/

Changes in v2:
- Address comments on MIPI clock configuration (Frank, Sebastian):
  drop the first patch and consolidate the correct clock configuration
  into the second patch
- Address comments from sashiko:
  * Use MEDIA_BUS_TYPE_CSI2_DPHY instead of a literal value
  * Fix a probe-order dependency related to reset handling. Switch to
    software reset, as the shared hardware reset line prevents
    independent reset when both cameras are enabled due to a board
    design limitation
  * Fix incorrect voltage value in the reg_2v8 node

Link to v1: https://lore.kernel.org/imx/20260417110200.753678-1-robby.cai@nxp.com/


Signed-off-by: Robby Cai <robby.cai@nxp.com>

Robby Cai (2):
  arm64: dts: imx8mq-evk: Enable MIPI CSI and dual OV5640 cameras
  media: i2c: ov5640: Use reset control framework to support shared
    reset

 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 150 +++++++++++++++++++
 drivers/media/i2c/ov5640.c                   |  18 +--
 2 files changed, 159 insertions(+), 9 deletions(-)

-- 
2.50.1

