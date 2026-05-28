Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013034.outbound.protection.outlook.com [52.101.83.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19137223322
	for <imx@lists.linux.dev>; Thu, 28 May 2026 02:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779934104; cv=fail; b=ha4mpTrImGbzdyrdpwR7FCf4wD/8ifkpzWAhSHqSuEhQSSJQIlX7Ye2IL5V3hO4MuHWjIQJ2w9/CQ2Up2qV/AacVqMnFC9WxIvf3BRQ1dU5CVpD2JpxHEqr4qL5gqAhkTme3rhYZGjw27t+a5haZaz2vMy0TWWp6faCYOL7Ho7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779934104; c=relaxed/simple;
	bh=rY4Q5/dt2zqX9zMuA6kJiYomxvvdw1gTJONG5G7dcbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JIzjFLllfEZens5IWP60RDxI1wj6uItUFN1Ekh03hnbSgjXw5tfB+zibDpY1MbhrKNYMOLqKNqM64ROJ/0+oF9HSR5+vhz/42LnvFAY0vKPOsjRUcGfXM/K1ZUHwJPUr8M2KnXIpgfkEt0EkbGg6b3KgNkt17QX+/TOL8kxvB14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VlR/bCdB; arc=fail smtp.client-ip=52.101.83.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VlR/bCdB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AV6771OX6BnbwUrB29F1AHTQ7+vbyZuBhMdlEG95OxvHoiPaUTtb9wfXVJJ15rPKKaNje6zgEIL7zWkyzC2gxrl3b2qr+j9+hSMPlrFzvgySNzOyJ8SKFBr8eX8ygESeZVZtnFka6Lr4J+Kc9al42sI1MYM8UMlaKdaleQKfL+bbF2thKsHumSn6Np3XfB1icvTxmnulW/7APglRevbundcKE0SwwC+BfjdN5E4elOET2V61uXRzGNYJ4vHmpFL4T/stXo8GhAcXioeFsNumTrF28RB7YLd96+u3cs7W9/8FMVsZZ4L9TmckmPMzEjGTT4VZ018oYQl8Ff5Ym1N+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyqP/aV77HrOGYWYMooRXv5V1QRyVGnnTCtdUwsE4yA=;
 b=WoIhllD1B+7H8ykf5kW3+IJm2xEcIoalVCAvDsOsAetNyLBKNasOAqN+G1YWtM8IejlVBxc6S49aVl1kVIRC2CiUngVAKvxZBv188IxbegO7jMcn6ItjcXg+HdgCQUCvShxsOy8uDRfZEvxb9m/xjq8KGvSTU+4UX0DtiZDrqQtJcX1OoOLfIOX7WivhQwZOLG+p/Y+3WpauY59m4RpLVn5BNQoFPOpXmdWslHEok36Jro3z/kiKdy2l/wd77TY1Ghy7c2oXmSsGpYAoYJtquChpQMllPIjy/6kF0tVEzgDqgfvpNJuMyuf17D8YWNuCgPHkvoTl7E9m8XqZMyDthQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyqP/aV77HrOGYWYMooRXv5V1QRyVGnnTCtdUwsE4yA=;
 b=VlR/bCdBNfrvKd+0PJdDKH+f44IRYis3ZMHbk04Dh4/3L7v5w1OrL3ZE1sUW6yiKs557/r6eEkPTJVTNqnmKDSw7wYWfj6LvmtHKQWhYad5CLyDgz2X/VhYuAXaMqKDE1ET3uFbmHGpFrRRaHqYXJrJSaoDljBr4+zpKNurffEVdF4+2caH7AUm5QUHgz7fQVTqVbrTlJBmbiARV82RdQYtGGgtOGgts4Ikt+6H0cBDr7CofKtS6mckO4FEr6+ZbfqFuVAV1FmHJJl9Zk9QCZ13nuKGEHG7rIy2RW2zsky5+xJp9X7HK2p4u+Es6RejTzG4ST1bNL/6OXlvebtZVEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by PA1PR04MB10985.eurprd04.prod.outlook.com (2603:10a6:102:48a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 02:08:20 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9870.023; Thu, 28 May 2026
 02:08:20 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: shengjiu.wang@nxp.com,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] ASoC: dt-bindings: fsl,rpmsg: Add hp-det-gpios property
Date: Thu, 28 May 2026 11:07:23 +0900
Message-ID: <20260528020725.2265321-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260528020725.2265321-1-chancel.liu@nxp.com>
References: <20260526053815.140008-1-chancel.liu@nxp.com>
 <20260528020725.2265321-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0122.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::9) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|PA1PR04MB10985:EE_
X-MS-Office365-Filtering-Correlation-Id: 880e1859-f7f4-4ad1-5875-08debc5dfd0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|52116014|11063799006|6133799003|18002099003|22082099003|4143699003|38350700014|56012099006;
X-Microsoft-Antispam-Message-Info:
	yXHldDfc9oYkH29PyApuYHUhfBm0QvQ9rr0EntOZIsEb1o7NELAb0OFhKQONabt13Bx0XJTOW6b2//67aUwuiQNPtP0uFlyNK95FHVHvv6qxNmPprZ6hr/Ri9M5giVdpClMuxhrc7NIBSg9oHJeVyracMZZn62JU2d6lvhSDeBVFq2s/mV06uS3qRmXK7gqgHbQ/hEaE7ny9xwew7n8GrUNPSAN/4vlEgfARf78c3uJN+z0TPv+GVMiohZPlsqtRKvjaXSs4ehN8iAL7OCwPdi+R16fFI6efM3G6j+E2L+fzp6u8YlEbBMb6hCwqZNKfJTNaxWvLex8g8zfNRJV2vadL7P3ynENf59zJ8sIMSOWyj9st/RkTWloOoPnXkMH5SmmvCqfSMQpUc32qNNaVhI/QESLzQCBqIAMkdpTR+/+Q11vNXN9hCgaZnd5RSQt9sMt2jTc+J8te6cEU5oAN9/jjnTrjKmAvTOyjfc4Lb35BCEjWxEnp3JKEQijs/TQ+GRYNKB0PAXKmwBOqCCSx9ZNtpCGSXrwHB7vpJVBqWmpzoWwc5cowUb/ZtxuM0WkIzQlPtDImcVIyO2H/anwg0qfCXmtt7QGVSToYwX9udb6GeY7uyvvd3lMAK7UBppDwi4ZK8xQaq3cAilNKFqp22JELBhs8MAzL3sX+jpgEAyhLB/MV0C4o5hBbB/3UC6z+GLSaNuK3vbjuOA3te2MhsaRd9snPpWVYgjtA+SdbBucBGCQU+2H6Wagy5e/Xr2+p
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(52116014)(11063799006)(6133799003)(18002099003)(22082099003)(4143699003)(38350700014)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mh/cX/4WuZpkGaQtvGCd7Nj3mfHUmnLaEVEwyXbWJmMpS54007Q1604aZoOp?=
 =?us-ascii?Q?J2hYuZ03p63PEbf9Bza7svkq0cpWvojoQ1C91pTjlhaVirh0M80DZim9y2X8?=
 =?us-ascii?Q?5TVq+zIgUvk1Z9Rxki5/ZpRY9knq4YRnqHiU6RttnyBi1HgrdZampIa0fLMB?=
 =?us-ascii?Q?yOP9xssfHjBx/uQ9bNt/5udjrwPn+ZNeHAcFQETRdgZUANwOHwDCqnIfV8UA?=
 =?us-ascii?Q?qNqNkA0b/CiFKi0Q36nnc547BORP4tUOx6JhxJNmfyAxW16m+7ShGbEPXqu6?=
 =?us-ascii?Q?7fWknNvP9iY2Vn/v3CkrEnlfFuQL884n7emtgAl2H0WUms78NoLYqqg7d6qJ?=
 =?us-ascii?Q?BFVI/aU/pc67Xvw/qiWzI7XHHUG38h6zC8D8Acowaawxu1UXBm5PJ/29tp/5?=
 =?us-ascii?Q?Q1/5slM2AsS4xYJkDnjC8o/RxDlE+fQbfogUhmMmsNNZ03tOPtUtM3xGYM2s?=
 =?us-ascii?Q?XCnltPMRA+f4VzGTDbxRipK2IHaND6bG+JmSuOKnmD1HtS2nrtNzmyMEqSjZ?=
 =?us-ascii?Q?yfpVKPSeQqoQe+1iV2Ij2tXFV6Cwx8VC+X0AtRkYwx7/lXvJpGi0++tJ194W?=
 =?us-ascii?Q?z18iBSmMSZkHQcqopzp5ERu394xkPf9el3y/HtwU4M8E5L1JPf92524D0QH1?=
 =?us-ascii?Q?bmHgKiYTN32eO1Ncbtbce+e0PfHWYRwwIHzytHc2eORoIS5EIXyW8QOAJfCU?=
 =?us-ascii?Q?n/jF2hgjpAI2qegkUpnld6EzNaeVKXTu/78XSPOK1XRPamPUnexPXC9/q0i/?=
 =?us-ascii?Q?OafCu2zqF/rOvbc1mw+M8dsImuFwhkJCa1LFkMiCGLqozMh+tqRu+yKwyKzw?=
 =?us-ascii?Q?1zaCLPMqVKKNNHuq5GSWkYR2nmuFdPWMzLwl7496XK/kUkNhfbJ70mHePYs/?=
 =?us-ascii?Q?DcXTOTpDC6LVOVTSSYlqHf+LCDDJDaEct22bcB2CHy2U8lVDn0EgXWiQcqh7?=
 =?us-ascii?Q?Pf8zRYAd/LsSpH/ZrGKUcZvAMBidkPxYprV8tQKTPLTRdOyMYVwY2SwECw6d?=
 =?us-ascii?Q?wyVzrCgileplS5Fxk/YB1TOBdfiddiftFN1DclJRriprjZUrV4lQ93R65zUl?=
 =?us-ascii?Q?AceCvjH20aLnYqApS0qtSOQv0a064C0WWSyREEqmAJK3b8XYWZOibWrRD0UU?=
 =?us-ascii?Q?kTB7B07j8lZkKGM0grXt6xLFC8tlO0EuGUoCN5NFVxkmKfm1C1OS0lxE5Swi?=
 =?us-ascii?Q?/xbz2KyWClWIQKyy2yIg7UMLy8If6Ob3DXl7TdArT9MSYJCSNMp/+pQuN6ff?=
 =?us-ascii?Q?jB+bT33aFFNoVUE0xVyFtj8RETvSWVis0zgP9Rbrm/JPihQZRlYfl8iGSSwG?=
 =?us-ascii?Q?IpFWpQxPjqafzrO6FGfNSwu2vcLuYkDbBM0FAxmr5IsCrWhn8GH/KCyvrAyL?=
 =?us-ascii?Q?scz4a+zQUCTy1KiT9aGzOwahArLW24WqkhZO2nmFGBLmSbKzu2czXUdMC6O7?=
 =?us-ascii?Q?wThhh17GhYWpBYxAi0WZZJhQUUCZBRXz1Hf5u3nQHTwxeeZnf1zWHZ6mFeF8?=
 =?us-ascii?Q?bb/cibt40aoG4P9P75W69dYr4BR0/6yy53n0+zL8sCFCpejtgx1xyES+Tx1c?=
 =?us-ascii?Q?UnoOIWgfGm5DSRi6YsqCVnccWozbW6QNmE7f1BtCmNN9qEKIliP0OmQ6TP+C?=
 =?us-ascii?Q?ncviPc9VfOz0zS9PhhN5XdORqymqJoubgsoKwyqn9u7ZpLmsK7y3z5JFKHEQ?=
 =?us-ascii?Q?ReqMo9mK2kxWJzgoaM9bwZqlIRteLDC7wUV+cGa5j9189t7eZKbhOFjeEsFY?=
 =?us-ascii?Q?gj4lFheDWA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 880e1859-f7f4-4ad1-5875-08debc5dfd0d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 02:08:20.0323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iaHTbJ/Orm48secTT31+oYhngMIQDFrqninp7pLE92j9yLxFav3UwyPuEw8fqpahNF4cBxwzK3wnZZT2it4Fsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10985

Sound cards using the i.MX RPMSG audio interface may connect a
headphone jack with GPIO-based insertion detection. Add the
"hp-det-gpios" property to the fsl,rpmsg binding to support this
configuration.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
index 3a32f7517d0c..e3cadb93c183 100644
--- a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
@@ -98,6 +98,10 @@ properties:
       - rpmsg-audio-channel
       - rpmsg-micfil-channel
 
+  hp-det-gpios:
+    maxItems: 1
+    description: The GPIO that detect headphones are plugged in
+
 required:
   - compatible
 
-- 
2.50.1

