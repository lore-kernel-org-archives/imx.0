Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80048.outbound.protection.outlook.com [40.107.8.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0683D75
	for <imx@lists.linux.dev>; Tue, 11 Oct 2022 19:47:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5zqZfaxJazApOIv6CCW9yKB09MsrxpgfuWvpHyabcW/PigaqBjDa7yrEorHdCNIt4qDLSRqmdyb+AMGbFTNpdUvJ/UKhe2m6iOCPHW312NPq7/4XbAvlPHk6Cg9LRq/AGbdCWmiSWzG0M7IRojlTTCdR69c4gK0e2USo14bvMfHNO6YlrCrTe5eGPrI6c+luJhmG4k/k8eVX+6z4JTbTwrqzcPRttWa9PApgTqN98l6Y7qAf9qpTZRuBwL7MLwGrPnss7r0EDjZdFkHXDXQsjpXD9r8t6SPf8Zf01h99kpjzGg4W75Xk5EI7i5+GAeNvLu3qrvmGNwoFo4cLvaNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+FQ5HLBy+lPopqEXCySjDnNbHivW9N6MXVLnFhvWTw=;
 b=XQUfBqX4oT0w6bD2J2MAfh/uel46zJqD1Fmyiw/Nd9pvQJig8ECeAU+yZzPLoLSw61k+Jr1akZPtG1i1iMmJGqCEhAfgrPBUgXUDZxItZwbwp+RAC72DhgsK0cMEenAEfnXWeGj+y/OGJbqiXr+adg2h7h6ksycr2bn+kKQgSPAW3B5ljSKJLMV9B0TyPhrTE4OBHlg/trzzsxprBAk4BkeD8HkqpwnKPyTzN3FTad6m+USvG3x8its2GCS7lqpRIe+n4U3nEGS89FHOZGhKXsUqvASncPtbeJvmRorQUT66HaacW30gtVbJ8WZBwzkin/uHBUmLUOloUi+XlUeGNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+FQ5HLBy+lPopqEXCySjDnNbHivW9N6MXVLnFhvWTw=;
 b=lzFFZGEsFw6jT2xy8DluxwhELy1hToJtVYfrVwZlZge43CWJnNutok8Sn3HrRHJd+ejasHrW2PniUP0IpumJD0Ac3cSa31pElderyUfX54Ngkk0X2/rGYMk1CRomwLLStKigVPOzmFuG0gKwZXyVVTotuoL/y/PXF+1tJTxPZTw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DU2PR04MB8597.eurprd04.prod.outlook.com (2603:10a6:10:2d8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 19:47:47 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4d83:404:c74a:7563]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4d83:404:c74a:7563%5]) with mapi id 15.20.5709.015; Tue, 11 Oct 2022
 19:47:47 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Viorel Suman <viorel.suman@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Ming Qian <ming.qian@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 1/2] arm64: dts: freescale: imx8dxl: add scu_gpio node
Date: Tue, 11 Oct 2022 14:47:14 -0500
Message-Id: <20221011194715.647439-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:40::27) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DU2PR04MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd16dd7-2ec9-4c17-b090-08daabc178a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nQSkqKta4m4qQWL/BZXjrYdXWDaKBo9pvlob+b9k6SPUWtXjHos9odR38TNKRnbNguGVJvmTtPpbKrx7Mi4omSmYifELuftSo/Q6Kg/RRZE+BQjdcxI2c9nSwXMlSmxjOw2Yydka7xVBQN/fTSq+y/aNidN/WuA3Smx9LXbcltZ6IaJcN/9g5vGUaf3az+8oX9v0OO9eX8/A1I7o4k0SnlXeYAgg9pe27919HMvuHNm4AMrmJ2Ah8ycTIfkdDOOXGHwC/ohrca2rxvauSy40yhB0IRbYVqpYYawgrzUzYheYNrbYSZGlXWbU/5SZ0XSrC7JXICZxRM+kXdO1Ip6XXbwVEfMp1c3lM2P9TZy4jrYnVayU/l5G+XfjxvL+oT1VZ/hKcMA2giNvum+1fxUno4WYp/wiSpNZECe55D50j5sBjbVj6qqUVPAIwiRAz6z3UBt5jyIfLTln+HR8pp6P+XQVZC12oH5+CQyBJ7QtrY7gktwUR9YRI3KTX7zxRu/Whm22/gQDK6P1VCYcGauANpehIUXjyXaw04DjdcptqEIUtKA/kqV90SX3hG55neAL49jRwqWYQmn8WJLK6jHQwN5+n+FPuzWIW2dO0CF2hDSLWw9QjmZTpkQurtObfjRWx7J7AB9zQb0j95ZCJ/Jt1X/2XZJKh9kVdA9Cl/NoeNcm4UALi0IPFcMQXbD0ifIlirYC/od3OUPNx0gZ//oGO5LS/Cmw/eP9FMQD3/FjjV938xGd5SM5iIbbzUI7wgF5PD6fXQIeBfqLd4jRjL6640xnGMTQLBsXK4vnLhdejzI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199015)(2906002)(4326008)(4744005)(44832011)(316002)(5660300002)(66946007)(8676002)(66556008)(86362001)(66476007)(54906003)(36756003)(6666004)(41300700001)(8936002)(478600001)(55236004)(83380400001)(52116002)(6512007)(2616005)(6506007)(110136005)(6486002)(38100700002)(26005)(186003)(38350700002)(1076003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XFSpelYJn+8cBwb6UAse2r3DqdQZ6Vrdz1EY+jZEDEdPw6U02OFnTiVrqBrR?=
 =?us-ascii?Q?NRGURZvW7XT3820nHe4kMPiw3+/+uGvJh79LUIhmY/OqkIF8NTaR2FAseTCu?=
 =?us-ascii?Q?jdi3yVPOq0CNd7DY1UtFhDS8IVQmRmB2KYlHP3sZeSeGdQMTCj5XVrivcVyF?=
 =?us-ascii?Q?s1mGcWCmDb8BL/Kln833dckZKQ3PPnWYq2Vz7aA47Y+sE0L2nNeIYIZ3f3lU?=
 =?us-ascii?Q?tkahYZhq8sAV60BbFynjfqZIn/widO4R9E2CpLxX9mMC/R+vJ4clDfzdCobu?=
 =?us-ascii?Q?dIhQfePdukZ85wksf/yNgbWN1oYVRzSanWdU6B5EsLN1HFxA7gQaptXoiwdF?=
 =?us-ascii?Q?69NPvepXczfL/6L9L/rmBH5Lcb+iO1jwb4A7pfPy5OuLZvXjFa02HjBTRUmz?=
 =?us-ascii?Q?YYZdylZSAgrVF6ICkncg58MUxaV/cpevJTmaQWb+zwcxN3CuhUTNxXprsIz1?=
 =?us-ascii?Q?JjAR58QPYmq5o2G9n2cVhDFIPQNNfSRbTuHsBiO2hf9YShOzKCLL/0kgbHlC?=
 =?us-ascii?Q?Xqlc+rfEP8C58g/XlQQ4O2SKzgxU7ZVuFcjqfRbhefodZQIkYm0hf4nGD/ae?=
 =?us-ascii?Q?xGwidGVL7XGcJWoOytoJWtebPxUS26wkVrFgs8yAwe2ihZNP3h6l1FFZGkUo?=
 =?us-ascii?Q?2l/jzns/UQaeY1/Nxogk031ZkTZVMusMrwtXGew60oRHcO8xE16pbyeu2C/F?=
 =?us-ascii?Q?u4g+BJ85qzMhq1mGXih1wuC5JuAVrq0yE138cmxOnzW2keZGv3wtinnCVeJC?=
 =?us-ascii?Q?jQXqZy5bb+bXN2fXFQRBDiuZXZ7jagmcP8MsIM+ZQyZ8kxTRlHwq1FMZMUtU?=
 =?us-ascii?Q?kF1dINk8gPIwc+UpKglFjKV4JX2Ix3ESG5+a+Yo0cHIA54ZRe5TGEcIsfKi7?=
 =?us-ascii?Q?rbXBBAhTY137mABblu7tjyq6pIr5QgX7i3NogG5nEbfNrKdEUvBXThNGmlyP?=
 =?us-ascii?Q?l8LawRiiyVRiObnnflwJY+Lbw2pIjOdvA/ETvVTDtIwV7h+gG6YDfmBvCwdA?=
 =?us-ascii?Q?MgkCknJBUr+qcFfAJUieEveFwDq9XhH8IHl5afjGjaNxYK0DQCO/rBvFLJRz?=
 =?us-ascii?Q?oFbTXvs4ooqMT1X5t57HNsVfWsmHAmPFM1Yyih3A6jKFhmdu3+j7lKLzZX0E?=
 =?us-ascii?Q?CCCW/KkpyJ4ivEKwfHTpselMe7rqociAUPXHlX8c3DgFaJS+qJUJtV4ufEof?=
 =?us-ascii?Q?aROHZjHJdtHG5QQr46cPrwKu7/wS04hYDAc2rfbAZOCrom+bii9SMOtERwKr?=
 =?us-ascii?Q?I08G4HieNwhNSBlKJRg5H36ta5N4hBzzy8EMlAeYuUZ7vLc3AaIMAtqKWwuj?=
 =?us-ascii?Q?OVFqpQjTjeop8jfKhTMLYycZNZAVJcywaTmL0y5C+3dKAyTQ4xz3fFGge5mp?=
 =?us-ascii?Q?lDhUvDCugyy3r9RNF5oaPei/G1JjcvLCpp1DnwNpf7tdYlSLPUVGZLPyj1Vq?=
 =?us-ascii?Q?Qh+brP2B8uDHVNtR7zH+4zUJ4NRfdhKmVZ+uNTen6RLsyQJe/mtJxde6h+fC?=
 =?us-ascii?Q?OIzV5BxRTbA3SGy7sT0a6pHglf2btffFjZZcMYfbM2QOlmsQwChYPxQ+ruzO?=
 =?us-ascii?Q?ZgNU+5Qlj5u2OcaLRHazqaVtT3xnXU79DVbn7vmZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd16dd7-2ec9-4c17-b090-08daabc178a6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 19:47:47.0698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGdigLB8GFEaNgiFfwhbnPH7Xn+3huez/GqpHTeukzefuxYpMNZu4NbchAU3CXSsQtzjHHYJBeZaeuie1oKyGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8597

add scu_gpio node in system-controller.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
index 5ddbda0b4def..9f79504f9d6a 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
@@ -133,6 +133,12 @@ clk: clock-controller {
 			clock-names = "xtal_32KHz", "xtal_24Mhz";
 		};
 
+		scu_gpio: gpio {
+			compatible = "fsl,imx8qxp-sc-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
 		iomuxc: pinctrl {
 			compatible = "fsl,imx8dxl-iomuxc";
 		};
-- 
2.34.1

