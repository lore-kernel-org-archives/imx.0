Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2073.outbound.protection.outlook.com [40.107.104.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA6023C8A
	for <imx@lists.linux.dev>; Thu, 18 May 2023 13:54:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+FWvCDfRHg5+gXxmb1/iI2J6jdyyxUahlJnDTIjhijFLJEDUe4xkJ/W3pOxslTKADfAP4RQa2tE4h1qOwDHQwdz+/2DBzEwFm1cXHuViJbbxML36HFyeyczYls6snJ778LchEdD0gthB44BWxO5l+wp0gWPSGUExvCoUoNv4rqLYzbYjpDFgbjdTOICE4FLgeQuV4PS9qmnrlq1F66AxXtgVQpls5blAauVRIBKYvwvoaWgPhInZl80yNBoza0y/P335jcLi9vF2T0FcOxj56f+74Gsn+O6fniU2FfKh7WQBK9gJL4LGDrx7SClLrvm8Dw179yosE0PWajCOUPQ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6jCRZjKoZ+7+yu6VgptUrxYyYTsYb957PcPZe+6Q0Y=;
 b=Kf95bddiS1oXetBjAvYfyR7ltVuYi8HLMh9wrNtxKRRkIetBz5ueh17vm2EG7e5MsR6xLUYxgnamLUNpQxrfSGLbXBCWHaSu11rq3TtWL6z1H56RP66lRZw2iJQ36HSth6NOWcAxwjyLWOMHXN17qySSxhhjIrY3g1bvXPnNsbV+oyLNpLdA/9L4G++j1XztZFf+R1LVKk5NZt6vayEVlkPCvdTWt3kOF/bJE0XZp9LJbp/lUr17cPBto/Ot0lYee9dZ86tUw0FeaFA/4uztPzm8QMwrSzvfItWYcQ8GrrvPa+IrT14h+Dz1/lrUBzGm7HNH+cxuDRad6kfZ+BBhew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6jCRZjKoZ+7+yu6VgptUrxYyYTsYb957PcPZe+6Q0Y=;
 b=E+2bf6EOtxlyoxdg3BqnzSrJX2SJW1F3t9RleBUtNSqf7gHni6qyO36hUMkcWx+Zjeg2G/3325t/5qAadPr2Hk0U0JYHhIq11H1n4bkJ2KuWCFmuPudvQcrjY80jm6z0qMMUUXEWr1hEr4CP6/JiGmALBeOmhHDTEREed8+Vv0I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DBAPR04MB7400.eurprd04.prod.outlook.com (2603:10a6:10:1b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 13:54:34 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::28fb:82ec:7a6:62f3]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::28fb:82ec:7a6:62f3%5]) with mapi id 15.20.6387.034; Thu, 18 May 2023
 13:54:34 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH v2] arm64: dts: imx8qm-mek: correct GPIOs for USDHC2 CD and WP signals
Date: Thu, 18 May 2023 08:54:21 -0500
Message-Id: <20230518135421.1905616-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0127.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::12) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DBAPR04MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 65380ff4-baf9-4588-b51b-08db57a76982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Aj7XqNIeVRrJq+dojqk9OPpD0AP6fB6h6737OxVsbDgUDt6dug7ni2faGSqujrEshK9KVGbXrDb4lH6jLvOI9MsLTuBzOE3krgjebVeIZshqJ+ypLsWEZ8dCKB/fC/ziuxgG+g6FFXBVLkTXqo3PXSSCmkAmTy3MZNGgMmdOi/jh40sOCpYLBTgMSuCp6gKpF7fI+gf5l4PlNJgAp5O+cNcu7V2gd5mgReHMbSqUfS6aL0ryrnvV7DlVXSAriQvFhzeC37qlNV2v06mUYRUy/Y2E+WFl5MfLEX4t18Ax3M8xFtPmedz8qLlBdWNGziC6f814NUM0chN+yVoILmmx4us3XOGdKYDQff6dArg+4cNqK8w7qpqkxiAtk5vkujpDps8cUU9LTeChMvAsmym3gjXiqco9Q0ld/uSgEpjUOXArA3onMtxo44Nv4f5SuW2wEZ40auMVuwHw3V4RQ1mb76aErb1v1isdiBuXn4c/oMvCQxsVObKFP2LJqJsSNM8trrvkqQadRxSrBa1fGody+/X6NoOAmYTgY5/hkSF3ynBBxjBAfME6rJRGwfqtAWdr7VAOigc1zQuF13akbnYfWgSMxT9URZVHrlEM+8vi3MMZw72c01l3wPoXtxtx+SLZcMkm8A1pevylJ01dINKavg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(451199021)(6512007)(186003)(26005)(6506007)(6486002)(1076003)(52116002)(6666004)(36756003)(83380400001)(2616005)(38100700002)(86362001)(38350700002)(55236004)(478600001)(4326008)(110136005)(54906003)(5660300002)(316002)(44832011)(41300700001)(66556008)(8936002)(66946007)(8676002)(66476007)(4744005)(7416002)(2906002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fx9StPnxxBNxlqBhCVGVxgb7CX4I8tRqqGfN7Sd8q7xQL8f0sNTt6lLtzvTi?=
 =?us-ascii?Q?49zh+FmfApeqUnsMLDBk31DUQLvSRxTiXtBaZr52grEbbmkh6ggZD4uWLS8c?=
 =?us-ascii?Q?/Hk0X/jaUESyMKO5n/PxoGx9Os6j15Qpq4V1VWxE98b9JFuhmd5rtEWD1hFJ?=
 =?us-ascii?Q?oNY1/aJnCdAyb05BK628Tt17qkskBhL2IlMtEAzuXtmGFRo1WJt3ByJ4BuNM?=
 =?us-ascii?Q?HQTpDOnsAQUOzDr4X7VFlzPcb+MrW7Ihx8csLgzXGvtbFroCnmS06bVCZLwL?=
 =?us-ascii?Q?/S4BgBKb8qRkLkbJy4zkzC8Lu1vQMVCJXkG3HGh1buZHskF4O1PVI6IpWpyD?=
 =?us-ascii?Q?50zVfOBtyZf+6W8frmIbSNRv4gzNY+qpQX5xZ3HoH2SIH6bq2KRT9jplRLWH?=
 =?us-ascii?Q?TeelDtfNETq/jhLnBA6WjoElc4Rx2u1hIT6/6DLU+suddTfQedAIwZPmKkcR?=
 =?us-ascii?Q?++rBItwmIMXscB41Jv2dJkymRYrDXx/+IoHtBLo131rGb+ezlDo/HCRPq+6Q?=
 =?us-ascii?Q?+BLe6FoDNi4121fkrFFloIpSq/l0KRhqMggt7Eb0q0Gtw94Ke7CT50NTEMEw?=
 =?us-ascii?Q?K3oqUP8dvbLRStK4QdU856t9nc71peGyqNPi82udezStIMczSXmv2nQT50Bl?=
 =?us-ascii?Q?nRg9X2DadzJtd9fD+QAQ6NrV9jGiVnOWmi6CeRnK6ImKg3zQrajz5MQfZfjW?=
 =?us-ascii?Q?jbTKudrO758jkYaiUzrfqgk44zga6KUzjGrwBklcvWRJObGSJxmDwyCk9Dzr?=
 =?us-ascii?Q?3Te7hrFx5UClNJlEIeqzHpMHeegLGDi0JVnZI0joflmfaS4No+VQDkIMPica?=
 =?us-ascii?Q?sE2Jg3tW07y0i2s158zGoAb6nzFVvAN5EO6NOLU7GyvUrAwal1RCp6oEU/cF?=
 =?us-ascii?Q?D0fzOc6ptVaQ0bIG0muMyscJnSZk8OjPKOomdSyiGDcjRBmwj4HI2qUdW4dx?=
 =?us-ascii?Q?ew2m2ImvinkVREV7poYOWcnjclPhZRuuQpyhLQb05SaRkEae6tqBk2fA0J+y?=
 =?us-ascii?Q?zs99WKwZ00YP40tLT79K6Z2L8e3z0VZpsf/SbV7XdgmVIRfO7pLHUsPovX/C?=
 =?us-ascii?Q?sbNDfPAnxqoO9IuSrFnwVCL+y4pTkWc1APtr1+6SBylIVoYRfEHIGCm5RDor?=
 =?us-ascii?Q?U5LT3yL0iF67VJ/ZaYksJ3ybKjaiuHj+y62n7VqOQxZ9sh6na0kHNzKX0lVU?=
 =?us-ascii?Q?8vW5E1CZTeRtuf8epvgpKqxBZJdBR4pJvC5i9dPcI7NKNZAnce6mR/tOLQud?=
 =?us-ascii?Q?cyod3XZag+5f8fW+0k9eOJVLEvDvBz3R61Dos62xrWKd5BsrfKMEVykmZhwn?=
 =?us-ascii?Q?XpiiwCAjVdpKnln7gTpbZ4cKYp50DWOSm+Xv6L77ksxUx6N2qa0uolsjkyCf?=
 =?us-ascii?Q?3sFR5uTU2m6lsEO+t8aEEFfwYdi0qp7tVvZtp6IitHiLvr2Fe09QHs3TJvvs?=
 =?us-ascii?Q?RILQc4q4WN1EsX6GsN78xa6uws+bDbREIfrqyOiF0r8+A99qJaAldlKDHwPK?=
 =?us-ascii?Q?ixcnZBpaGnLRynHrRxW4pTnv/8h1OL/RFVIkFvKqwBlm5J03xQ2uJyjjGrYA?=
 =?us-ascii?Q?WL4B0rfe5k7SPrMr43O6WnrmlTHE2TDI6Ag40D+pLSetLuyiBRl7dL6iu7tn?=
 =?us-ascii?Q?Jg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65380ff4-baf9-4588-b51b-08db57a76982
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 13:54:34.5877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzjVoTXAnr4LyT+JzV+l96KTpk7hNx6cyLi8J7Mha6a+JKEi5gfJOQi10Wo5lEJ2QzHeuHL888S0MO2cswpj/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7400

The USDHC2 CD and WP sginal should be on LSIO_GPIO5.

Fixes: 307fd14d4b14 ("arm64: dts: imx: add imx8qm mek support")
Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 v2:
  - add fix tag
  - change the subject to imx8qm-mek per Fabio's review

 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index ce9d3f0b98fc..607cd6b4e972 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -82,8 +82,8 @@ &usdhc2 {
 	pinctrl-0 = <&pinctrl_usdhc2>;
 	bus-width = <4>;
 	vmmc-supply = <&reg_usdhc2_vmmc>;
-	cd-gpios = <&lsio_gpio4 22 GPIO_ACTIVE_LOW>;
-	wp-gpios = <&lsio_gpio4 21 GPIO_ACTIVE_HIGH>;
+	cd-gpios = <&lsio_gpio5 22 GPIO_ACTIVE_LOW>;
+	wp-gpios = <&lsio_gpio5 21 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };

--
2.34.1

