Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013041.outbound.protection.outlook.com [40.107.159.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEDA27FD71
	for <imx@lists.linux.dev>; Mon, 21 Jul 2025 06:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753080921; cv=fail; b=LrEpSmZ4/saMydb4GPnWosiDYn+4fXIZPOfV2PytWaGIs1fVgakEAujcAREfwN+/3JcL92pGD15QPo4TTyAD2kuzCVH5qeaKMJcV7BjYpiLDpLdsiMUipGbNn3AnxF3uN+FN9oMXAUbvg1fceCXh1Nui/gwC2iw9JON57MuW1ZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753080921; c=relaxed/simple;
	bh=gTTqvqowa5ZL2Ke4Ja/VGOMUnhLyiRXz7VvyEGL8hvc=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=K1OpaOrrkKDVGVHCu9e5Pf9aOuhUmjPDpqVrmBalkOvkb7L+L+BCluV7whgub/OYckKiMX6O2uDeqzWrofCkcudFm+IuPkROulzRvSTWqFY2KnGmmapPYgxlpzG2g3c5OwcssB30ZAvoqVwDVQtnHelME9JWMQDB+YrFJp+G7Ow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jbkNB6F2; arc=fail smtp.client-ip=40.107.159.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jbkNB6F2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GV+lK+OV3Uf7jjIytY5vEj43AJxaWfkuO2RzUWSrwVVtz5nHNlmMdxjE+0u9wFJybjzX74D+xoyLmyPLvh2PBaTRx83iaEOGhT4kTDImAE8neXZn8Tga4TW13aMgfvYlzN2ynv8ODTc0DW3huY0JeMEviT0UFr5+BqKgADdo82fcryLZ88Y+rAXlZeXGwDPeghmhUv0nafqnYtoFJFA3yYhus9RPcpwqlIQP18uFPv0PmHl/TEkizymHeJfxWC4bMBCJfUCruGcpul8uPTeoXcpFCTtmLy/vf27dGA5uxubRrHOB583sw9/94cX6pAv6WplQKJ4E0TQB8CAb3HnVBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6N5eRIf50DJ0JxaChYtynbVVUFRSixLrt4+MIr/nVwg=;
 b=GP5HWhuNPCB2S0LfSSEt7fTgwn3UMBt4UxAKaxQmID+jgheNw0K/SaGctoJe0DKcz+Bra+UiMTeYVR+ECWr3HoQuAJ9DEdiSYF0K9UrwFnUxVS8t78yiKCWGJJZIAOxeS1BwFrQ5Ggc2UUY6tG+3j7oHe8LnCRr9F7j2kridKi6fVTue2BWpLGOhxYHqy94pw+kMlGRWxlCveHp+O4X2rvZTJeiqaWHJZdl6H1pr/qnqnR2CanwoxeV5pisKYd62SNg2EP/vRDOieIT0hunRJUY4IgFeI4UkgIAdUCVa/I/zrytwvbO556fuqBJsdDzl1coCtbxs+xO8gEyyhN9+Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6N5eRIf50DJ0JxaChYtynbVVUFRSixLrt4+MIr/nVwg=;
 b=jbkNB6F2HoybqklB9OZI9XzlfKYjzRKw/WltawszPGpi2l1qNatjMqdabEe+5mjktvG/9GdiSJ8s4cOS/0ypTGqkbEJz0utS20Cm0wJf/PVSDwJgMpf7Ddu/GPsjhx9hS1R5cUVpQg6ezUOMiE4hKYiL1glIU/xahzTZd8JZXRovkgPtJZL9Okddc2fF/BgWtzlMdZPgoPQlTTba7FEZrznwrmKVK2hkq///XQcJdiaxZXW2MtLCMlVV275Sv6+g7TL4S3zOiPABk5JjHnePGuTY+CNYpJr+kU/CeOj3TKYuf1/oo5dptDWI6uSBlW4pJFpM0ZT1To09/2zKYprBag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV2PR04MB11376.eurprd04.prod.outlook.com (2603:10a6:150:29f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Mon, 21 Jul
 2025 06:55:12 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 06:55:12 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Li Jun <jun.li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dt-bindings: phy: imx8mq-usb: Drop ref for fsl,phy-pcs-tx-deemph-3p5db-attenuation-db
Date: Mon, 21 Jul 2025 14:54:24 +0800
Message-Id: <20250721065424.4192351-1-peng.fan@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV2PR04MB11376:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aa392c3-42fd-495c-0cc9-08ddc82389d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|52116014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZIatHPBITzL/TiX33fdWIzB5wio12fHqzshADdNq74c/vVic67IhS0+bpmHJ?=
 =?us-ascii?Q?4uY3nwunfpwhDOSCbrDL+xDo3DDX8qE1prWOwj/huh9xltPH629QxCQAqVgf?=
 =?us-ascii?Q?+BdQOSDOei4ebPpEhlxjrIbOx5JW7Fck0lVgVUUc+Fn2wc/2Ymw5u2D4rni1?=
 =?us-ascii?Q?Q0tmmHuRwbbp7irYxJAaQ5S/z4q8/pw3OLaCy+0npLXyyfajnFq+tv7FYH6e?=
 =?us-ascii?Q?PeQ2FXL52EV1ue7VbaImnRf7yLEXKTKuA1PzGfMs/JWYzuAReiisMI7FnGca?=
 =?us-ascii?Q?RczLMB7ifn0kJAAjo4E6otgBwl9Mww1l14QgfBQz1tz2u9Pj/My8kYCDzKh0?=
 =?us-ascii?Q?VWQhHTIUbHkRTo+d/2Wt2RZATTKznrjg8942J1Kn97Bpecjnd+ITsqsvCHA1?=
 =?us-ascii?Q?fQxRI7o9OwALqFyEHJ5YCfsZPKD0dMLYiHtMI08/edJD39pRpYt4HehhOBFh?=
 =?us-ascii?Q?TgZ0Gz1zjNhlyyK1drn0XKkpvIpW08iFJU9p1wFfvDA0mV6NOrqjcP/J0DNx?=
 =?us-ascii?Q?Xb2TsnTLIF//ooRRQJKbPCixrgPpBaJufQvtXGiUbXcgzEfyhvoj8WfN7rJV?=
 =?us-ascii?Q?kNn+On/g8OHoCpGepFwW0kz0szHaa44A0kNsy+rUtPWv7PbGp/pLDeGEOz+t?=
 =?us-ascii?Q?IfKYy8tV7ovnvKdKWVnvLlHvwqxE2RVvoRPIqxSMIqTwD7m+/bxGXbnxNbAU?=
 =?us-ascii?Q?hPcjd217IqQDrsCqehjYDa70a2mdka9c5Jl3pDkGgSoFvoK807MlbXxycMYm?=
 =?us-ascii?Q?v91OQcmpSgYSVGq5NZ95CWhvQm/ECMsTX2ychhLnj+8SkLf4B6hhglcbEcEv?=
 =?us-ascii?Q?Dd+BWC9pDhWvPG/Bilzew/d9MfzaxHOoOW2OYraWNfPYAUnTAUiygVeuEdIW?=
 =?us-ascii?Q?Eg2G8qKSeLFusQPa/beSJoy6wCsgZeDfGUhleH1WSDq845oYLbCkzrLX2LBn?=
 =?us-ascii?Q?62KSQvNFXNisGGLwBRAD3vZeJWopK/F2srP5F0eWu4BhjQjn/Spi6wR3Dfjb?=
 =?us-ascii?Q?UB3cKNaAyBDGA2KX01JyhorcemuNqG0N9QSzNYp4fFVCWqLCQf0CLmTojXzX?=
 =?us-ascii?Q?oDITxqkM+Wta9zfA3wq+wd1v4QUUpFKKig0ZfeiPXELc+l73oeHDIkQV9mCV?=
 =?us-ascii?Q?9fvFVIsVuPcslk3jMqOjVQTzs1TqTJe4+yU1bOBw+/I9h/QsKzXhmLQpDFND?=
 =?us-ascii?Q?TFDPhwkhyHQpHG9GJyI+f48wbhShEwhWMoGXY/sbGgXQutxFEYS7Ql9qLNoR?=
 =?us-ascii?Q?oa298vf/7E0otzZYBfVFEjlnb30GTQur8Yfg7B4aQ4Iy+S9uajD/pH1LU2CG?=
 =?us-ascii?Q?xHM6pzURrWX6xKaefHlzRkDVNoF7ig1D66464ksEAhF+EZnj1ZJbmXoCIUM/?=
 =?us-ascii?Q?IJFWtMy3TeKTkQzJH9HmF54mCYA+NAymexSVPgGNrxZAC4ROfhBCSVCwrOAU?=
 =?us-ascii?Q?BTW3eohD/CAM57baMa3c+tvbOlQO/Cs3HU+TOiOTYL4oMCHai2XhWT4K3YdW?=
 =?us-ascii?Q?Sh33dgaDb+W3X04=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BpcuthNqOfdfrgm9UBlMRsO4PMwYF5uZt8BZV6/5wdKMqFGvHNbXKM96/KbT?=
 =?us-ascii?Q?Oy6inLOxqKbgDVVw2PnvJYsiyotL1PpdlCyiQrafW5trtOT1S7Y9eDReCmqW?=
 =?us-ascii?Q?7bVsJzvwYa0UJn6NBhBVp4DCWBAvV8j2fqexmIiXrhZ73EZd0uiekIERrheW?=
 =?us-ascii?Q?lG0vXT/BWFa85O7oT56kCk0KXg+Wzs/B92U9Zmf19RGVOfrd3dDlalUuGhvG?=
 =?us-ascii?Q?0GGQKRTBte/U11sDzWfR/aVvcCMrDuUEP1NYsWf+n0x5LGfPNP09thbYj3D4?=
 =?us-ascii?Q?mHmubnfd2OK4q//L6pJcUbG8rAkbN0gCr3F0vqW9X6iGL/jci7tEd26WHJ4i?=
 =?us-ascii?Q?SXgCKHvGotQONO6eixpkTGvL4Xg8Gep2dkMk/glxShKJpiUi6eFwWmAgxrkv?=
 =?us-ascii?Q?ASK3HZMSpzFogmabxBzYlARW/r0/aYKOXAA84ZulSSKGPwfO6BZuOnSY0QdV?=
 =?us-ascii?Q?7idEiwX7XmbzfVSlLSBU+ibiEmSjrQi2NivNyqsYBZ7o6Nt1ToIESayQ2Qrb?=
 =?us-ascii?Q?psnVZ8I2UxG4kVoA1VTEddiUpMRmWVcMrdAgIvM8sJ840E1/zXewppEERIPc?=
 =?us-ascii?Q?z76toSsEYO/Dhz+Ptmotxs4M4JbjLER0DQEGhB8aMGWkSXXVa5CMuli+0qxk?=
 =?us-ascii?Q?9SYHOnNFqc/wpAIJcfZy4oWUxumNqPXnlwi3PAY3gmOPCAVxkUYoOS0pNY3x?=
 =?us-ascii?Q?9Hpp2e0yKMEZABtac8BXEuXJRl2ZCRxEb6m2YqUvy4EpIVKx/LbKjrs7Qyi2?=
 =?us-ascii?Q?VSjNTKfIQKqijZQfeAZxSTs4JBeYc01Mts6PO1oCD3P5NkxLS4wggt4xULeq?=
 =?us-ascii?Q?ne+5Nj+dPegWHuQSSW3MvRaZUkjF3Awb2CksMCPiDHujlKbnWs38GDDI8Tfk?=
 =?us-ascii?Q?Qxh0vDbbotjvxNFHW4daHUAqKATd+X5CdhL2oQwX23vWgfmgezVES3bnXd+4?=
 =?us-ascii?Q?b1sdMXzJg45BjvG89zSmlYa4LeyzDtgawRETMme0XJhmUbrErhkq6pyi+7c5?=
 =?us-ascii?Q?zKGGh2dK8FGQa830k1C3T6y9204KGUTXCdnaYey153Oc/sfyfxsSQoQb6ozL?=
 =?us-ascii?Q?CqzfK9dDz5VCwXpc+LegKtZFVdn2xSJ+uEz+6HmLODJMMsgDysGE3lO3TwjJ?=
 =?us-ascii?Q?T5sceQBpZk1gCRdr7+X2klSaYk7GOkX8D0LA2dvq0PdQBCy7/TG29Q8w0FD9?=
 =?us-ascii?Q?pffB7xHz1TEKrRiVZbhAlsd9FL44Wi6yogmG804mEEP/nwWP0+tGmpn9qC1V?=
 =?us-ascii?Q?Ekf/ChXPpgja7weNbwGE5KQQhaqQAGXHRQJUi3AHmKGa4N1SVlFJGxkMYB9v?=
 =?us-ascii?Q?koE68FcltOJsOb6bkvgsnTLqE3hFjOZRMKTgvdA2XGAqCMF1Kq+475GBpdbz?=
 =?us-ascii?Q?tXUGl6M4m/fheBTtwJwRiPZN6lsDDhY3Dyv5YS0n1F0wlSlIxj4jdDzJrZ/9?=
 =?us-ascii?Q?G8LR3otikJbmYJ+3CY2laolQX20H/ZAcQPyTGSB9LciO0xQnYab49K+9f4oW?=
 =?us-ascii?Q?NvZfLN6QTti7oC8DRjP6ov3Sac+s5BOL+e+xrY1lZ+GnDJiBV8cfSs0VmnEv?=
 =?us-ascii?Q?WPU8Aq6S4T/tS4MKFGorFPxPQntDbJtA3Zd5IM47?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa392c3-42fd-495c-0cc9-08ddc82389d8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 06:55:12.2161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2GZss6KAgGITbqfIEBmZ+rzATNjJZ7JkUefJ5pxzSDUFvR0aInYOW5mO9wgVFqQbxwF/W9dhp6TgfQfiYfw+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11376

Address the device tree check warning: "phy@4c1f0040 (fsl,imx95-usb-phy):
fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'"

And dt_binding_check reports:
properties:fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: '$ref' should not be
valid under {'const': '$ref'}
hint: Standard unit suffix properties don't need a type $ref

So remove ref for fsl,phy-pcs-tx-deemph-3p5db-attenuation-db.

Fixes: 04c9dd9c7d19 ("arm64: dts: imx95-evk: add USB3 PHY tuning properties")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
index 22dd91591a09..6a47e08e0e97 100644
--- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
@@ -76,7 +76,6 @@ properties:
     description:
       Adjust TX de-emphasis attenuation in dB at nominal
       3.5dB point as per USB specification
-    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 36
 
-- 
2.37.1

