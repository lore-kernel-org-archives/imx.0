Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2049.outbound.protection.outlook.com [40.107.7.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE4619BBE
	for <imx@lists.linux.dev>; Wed, 24 May 2023 19:21:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WsovNf/neoQRSYuJBdZhXIWoUxOymgLKEPewhHvfup283uIA/QfJstXo05DCPT+2itZyTQh+BItD1I/6E9tHu4uj2q62R27i0ufIwWouyYCeCCIFgT70ulhq1BW/WurOMVlR6t5TWhjG/fWvqE/QIAi6Q3UDx8b7uCGg6fX0Nn/ABmQXDviGqiH/TmhwKcmsSkLAtf8dFo9orYwk9hWOsPFkUmBaDC0F0LGVt0uvmgB9mKhBp4S2M2tCq7t2e1ii6LXcHX6B1lf5HSYd4kl9TKW/RT97OWjfjie/x6/u/HU/i6YulSYHcLgcygxT+mx1/jW0J5UgmbQhiX5NvkojXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5lcuxWWTc51R1dKG3uXtpRui44aerNh24KhzTAcYsU=;
 b=A3YctC5W12UmNtPsBqc12GJUERGF4m19z3RFmc4LFp/FgLEryTk2nBKBSEH5qn5x3Nt0aBQo8alCmMnV3AfX1Pr4BSTBSYGEFzRDq19z55W2QkkVxgM3GQcUWw4SqB4bnqfUTggaOXbUlCcCG93jPsLWHAZNu5fJh7F7w03IhVLrqs6ngXr1QKvhcp2c5olEyZ/Q9BK0TB32XKDeXyER5mxCkDngtxDv89uJBovP17WrLHfSg1sHhyDjbUQj8sOuKaNJgx2KEJ+SjDwoeSGrhPCG+QTd8mnbAoX9thObRsVtwP1WRkszSTIZure3m00fAJmqZMtlFeNy19tObBTOBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5lcuxWWTc51R1dKG3uXtpRui44aerNh24KhzTAcYsU=;
 b=UuRV9HGPPHGOand3U+PjTFEwkKdYseHHhV1G9S5TALgdLY0VWMuuOlsdll8QVk7+ALC8o24ATZjUcoBbcvDJDVn/oMZMyJ68wIFEWUIsI75rlqFhjcvK4dhfd2yQCM9dpS5I7jgplzQ0oOro0UvIaNN8Fcp7Senr5pLyH9X5hiI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com (2603:10a6:20b:44b::7)
 by DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 19:20:56 +0000
Received: from AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ccc1:e128:5e3a:77b9]) by AS8PR04MB9176.eurprd04.prod.outlook.com
 ([fe80::ccc1:e128:5e3a:77b9%7]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 19:20:56 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH] arm64: dts: imx8-ss-dma: assign default clock rate for lpuarts
Date: Wed, 24 May 2023 14:20:42 -0500
Message-Id: <20230524192042.133755-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0233.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::28) To AS8PR04MB9176.eurprd04.prod.outlook.com
 (2603:10a6:20b:44b::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9176:EE_|DBBPR04MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b0fee9d-f13b-406e-1151-08db5c8bffa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RsTj/E9r4e8UsfbpSQl7nnoNZUjnBjgETCqFEpjRG2dOO5XzgnAtYaXkNGIogZTmTpynW/BR9wv96JzTl6+fp/rVcUfUlwy1oQRlzG0Yto7OtCKUV/eB+rTE/Rj6NTtZ4udNEd6HfbkM/GzJY52fgMGB382BQPBjhe3JrZfZoyJMnReXM7Tcj9Cbn5Wt/BRxzyv227NQFTIcKFdGHX0Z/jbT5o7mE3flA8NukweWWi7K9DfqZvo5umLv44LkpHYPH1wtpAoUI9mxbRDR44/PCUYKx3X9f2NQYDTq9F95qtjcoeblm61c/nJ1WKmxhBWnSWNK/sHjpEyuh91BwsZJav2Ge93BrPYym4+9xpNVNbSeTIPBmVaAUeJnR5Xg1DyY9ZnTFOQCRXb/gUjCJpASIjHLclJ9weZfbODX9S9rtZtID3rkhp9L5QeNUMpsO+r4rqr2mSYytnsqkDZ4lQK2yPqorBEYdP797HADMMPY/FUdaXmok9AWV06z4V/3Na2tfmPWgYmmq+1/JXLWYlQcDLrlmBrcfi+yck2X+Vcg81MTHCioQdMIL/103H1ruDqmrqzR9gaTqjoM/8Kkvm1UpiD5GkIoWgWvJmC/3EYPBSC6ZWz3DNR/VI9ka7dQ9Q8W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9176.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39860400002)(396003)(346002)(136003)(451199021)(316002)(44832011)(5660300002)(7416002)(36756003)(38100700002)(38350700002)(41300700001)(66946007)(66476007)(52116002)(66556008)(4326008)(83380400001)(478600001)(55236004)(186003)(8676002)(8936002)(6666004)(86362001)(2906002)(6512007)(6486002)(6506007)(1076003)(26005)(110136005)(2616005)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sxAmCjSRGxfayyuTCchsyh0c8uUHBvqRCYFiCt32JwL/vU2EOxkue0CahZwu?=
 =?us-ascii?Q?HUsRzubSrDyCec8kxsT1hRS7AEA+940wdsrIWvhPA2Ezzj3TB+QerEek02Ck?=
 =?us-ascii?Q?QrbnPKcHLgY675qTLajL8GR7Bn1NmWrdCUP/3G2jnZN049j3iYnF9FRUCVmA?=
 =?us-ascii?Q?ElOhyiMwLJUzqSqJ5fd7dhuWgHdzDJtzinMi++G3GiyWMiKDQgCZ//PQ6Jhc?=
 =?us-ascii?Q?r5wKWQNBiBZnFk1xczr4lysIG7HjHbgCLsg6bZ9TdJFL7KElDWDd68Drz8hT?=
 =?us-ascii?Q?I/ofTSXCHclbLu9P4U4KEQFyojvtaHIv8YeF8lNJOHj57HrBDBwZ7VZTybvp?=
 =?us-ascii?Q?bbvMnDnm/WMWBO923rHS91Nh3UC+TIPjOoNBE25ehP+OSc2D0odw8HZTtxmg?=
 =?us-ascii?Q?PUL1DHXzX2NS5RR1IyAqMHH4r8yk5/cTnnT+aPVtkifrVClNGA5APX/PlPR2?=
 =?us-ascii?Q?z//f/DazdvqkEWkLp49mNreYqLL1gdOY6OfrnTsXUEuNC8MrCr445EqGC7Bu?=
 =?us-ascii?Q?QeYmlyVPk70W4By5wgROCLhi79tbIuOHOWjAJ9kTWl4ucawx4soPrOqpd0Rw?=
 =?us-ascii?Q?O+cc6UhL31wWVxIUoVP6niR2azTApfx98B+kEmaWSKxOR36LVA6kS6AAxmmw?=
 =?us-ascii?Q?CMpbGpnD8cHqBXkyFCm3Ccm/r5g+lmT1w67ldL+EjhL0DcTOVARRkaoU/1YI?=
 =?us-ascii?Q?bsTtk7el7GJuAK2R1xfaHB/LwSg0qyv/Wozz/SBwvipg1QspgGJHjQtMaFIN?=
 =?us-ascii?Q?MMiQmnc+ANd1ckFS+IBE5lBlvqbG6fD8mVeuY8PEOxZdPJi72Bphykb4dOpI?=
 =?us-ascii?Q?OLehRB9DkDv3d3qdXsiVMbjN9xovZOeJTjOI5U1hiD3yP2xac/Z5465oIxvm?=
 =?us-ascii?Q?dq5q5eC2KdyvgJQhgAj6nfPYeNliDqjOgaG4floejK0fwbc9y4y9PPTyKor3?=
 =?us-ascii?Q?QiWe8hLxoapv4YhGDhz6U3whDPnFOBdrn2LjmENBtWjhtKE7xk1d9jx2Cvw+?=
 =?us-ascii?Q?8xoKy7LxNLEbGqU864s/EORO4P1AeRcdN/NE1nmVktb+sDOhxD61k3sh0HfO?=
 =?us-ascii?Q?20S0bxp4xlKA67lbYhA/iHGADq+EFJ3cxwvIPVNP44dgLnjZF0/u1dZSxjbB?=
 =?us-ascii?Q?2n6gBOO/EP/IrW5oSpKELD4ADDUDj+jav+HRJ6fftumdj4bPjVOT/aO/p7Cm?=
 =?us-ascii?Q?cEtk637NgJg08A6RbUGJQHAz9pBkQAQc8zGLtJW7S4Pd/ayNBhh6Fmq2ElrC?=
 =?us-ascii?Q?bYSLjzc/Y3LEm6RPl88GQZ6AsN+FYh3A0Y5TsCHkH3bNjL9ta16GZPxT36SJ?=
 =?us-ascii?Q?t1azrvjCcEA76A+sGZXE8uHkraiNiRY8idYXNZFmTdbSX107KoIL4z1WsrsQ?=
 =?us-ascii?Q?zTheueGxg9c07HMH5M3fNQce6nnBT+8AZ8hMDBszCXAS/T8FBWgcUu229Hnt?=
 =?us-ascii?Q?5hQ2TDuXVhJ0Ys5/gIhZyOfyfA9PlnZSJ7xrbvXGRIx+h/3a3Ma+DpniKZUJ?=
 =?us-ascii?Q?cL0teTY4suumid4ZWwvomOGwdV7AwlEkhORR6HeVvU8rlLS8a/Bn8FQHiV11?=
 =?us-ascii?Q?r6VGwqHOPPxOdS6cHrLTYegzNjeiHXlzBg3ljyUZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0fee9d-f13b-406e-1151-08db5c8bffa3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9176.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 19:20:56.5250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGvIKh/tkfibJOQYNae0tXTtIXU972unp/dgWVI4hyiGQpmpGDOnjYZUwzRx1dmfQigRrRdd0XWjBvxaPS6iyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7737

This patch adds the assigned-clocks and assigned-clock-rates properties
for the LPUARTx nodes. Without these properties, the default clock rate
used would be 0, which can cause the UART ports to fail when open.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
index 2dce8f2ee3ea..adb98a72bdfd 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi
@@ -90,6 +90,8 @@ lpuart0: serial@5a060000 {
 		clocks = <&uart0_lpcg IMX_LPCG_CLK_4>,
 			 <&uart0_lpcg IMX_LPCG_CLK_0>;
 		clock-names = "ipg", "baud";
+		assigned-clocks = <&clk IMX_SC_R_UART_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <80000000>;
 		power-domains = <&pd IMX_SC_R_UART_0>;
 		status = "disabled";
 	};
@@ -100,6 +102,8 @@ lpuart1: serial@5a070000 {
 		clocks = <&uart1_lpcg IMX_LPCG_CLK_4>,
 			 <&uart1_lpcg IMX_LPCG_CLK_0>;
 		clock-names = "ipg", "baud";
+		assigned-clocks = <&clk IMX_SC_R_UART_1 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <80000000>;
 		power-domains = <&pd IMX_SC_R_UART_1>;
 		status = "disabled";
 	};
@@ -110,6 +114,8 @@ lpuart2: serial@5a080000 {
 		clocks = <&uart2_lpcg IMX_LPCG_CLK_4>,
 			 <&uart2_lpcg IMX_LPCG_CLK_0>;
 		clock-names = "ipg", "baud";
+		assigned-clocks = <&clk IMX_SC_R_UART_2 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <80000000>;
 		power-domains = <&pd IMX_SC_R_UART_2>;
 		status = "disabled";
 	};
@@ -120,6 +126,8 @@ lpuart3: serial@5a090000 {
 		clocks = <&uart3_lpcg IMX_LPCG_CLK_4>,
 			 <&uart3_lpcg IMX_LPCG_CLK_0>;
 		clock-names = "ipg", "baud";
+		assigned-clocks = <&clk IMX_SC_R_UART_3 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <80000000>;
 		power-domains = <&pd IMX_SC_R_UART_3>;
 		status = "disabled";
 	};
-- 
2.34.1

