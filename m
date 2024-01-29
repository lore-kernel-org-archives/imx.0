Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2059.outbound.protection.outlook.com [40.107.13.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FD0157E87
	for <imx@lists.linux.dev>; Mon, 29 Jan 2024 21:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.13.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706563147; cv=fail; b=fFZOD1WKfthHjTjihOAa9Wg/dYhzQlQHhYe1DeOs/Ni0xPTXOlBv6fpWAsP2N3KBPaZgQlrzDAhE05L99II6QdRFeJwH9Rm0je0baNjXhfi95niHL5VpGCzfif5MJfoTQ0thozL6AAmInK0/UKXYbr2O8Q+zbfr3azGU5/BMP4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706563147; c=relaxed/simple;
	bh=LlXxnNPDrnCrZiGzUyM+DKxi1X3dyD0RFdil/sAvJk0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fVvOA8BXB3mI1mguLltIGKfdUGEk2HIgx48s+hrzORqQaiKdCzEjRKLzREWrMpKITJwE7+ZOi6ZOUUEiebWNoh/9mkTO+QKiVdP58ILBCRXEswrzTkDQ1j3hgDF2KCQjetHM8w/9IXKBjNFCIUu/bMoHgiyOymr0uBj1fLYcGMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Glcj/26N; arc=fail smtp.client-ip=40.107.13.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Glcj/26N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grdHgRjEYwFQBlDdn9AXgx8fanlJ+ShJq7y3Gs6ndh+aWP+3dgZtjZazEVjrj0o3A2VQvF338x/rq8NSHfJ8Zju0N3wYyGmKBrE8u/eBsb/n6EPE++poTDyGJWgqcHbaAWv4s6rxF8Y469CnEDs+/rEj3pJCYWBYxU6yRJl00yc4Xu0t7kwSs+amD9AIOnm/XShu0XMqOtlm+NrtH62eShgcq+qbZbHqx8gBurGrVOeajGIn8SCj83Ks1eim7NTHb8J9WRPtyz3MR3YrI788fsNuW1h8nsqqLaoWTGKcXK0X7x/c9BTZzXAbkH7JOCxwHuulDpx8utfjxj47qaVD1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9A1sP5HFhqT9IrSSMe25SSxDLFML6yv9jGUPXExcbI=;
 b=GTSrTfC9ZVUotHWXc7Qfn1ckI59Ldp/jI5iiY8tR18LxoQEDypN/B/S/NUh8B66uf1a25ZF7RCGzCsVujCXdY/0hKbI782cBF/t4vYT3Mw4oudQ9Aix9YhS55ubpuws4x/s317pGnPCqAEseO8pD/lxqX3stYtLWEdlY2xvIA0tqGAo75haPI4w64XB1+eDxuPp7Dx+qrP1E47LMlBDziefOB6yxV+g/a65jdFvz3tk4Cy//uVHjOjjCiiIhTnugnxEmcLY+EJ2vCBtv0pgHzEdK1YxwRPToe8bvcXMiBtvPwtXK59yOyE9qCtgLdVLVz0edNBHKJfVr7qeNNTyDKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9A1sP5HFhqT9IrSSMe25SSxDLFML6yv9jGUPXExcbI=;
 b=Glcj/26NFPVrljxD9X6j3u8O66JVbs62xISE5eBrD8/+PnPBNh0niExZAS3suzc5/7Ly49iiF5MYLiDCSjJKtNo8/hJDGe9jJ3St+HDgbJuoBZep9KTVHBifhvrDFcaF1CWTHuEWNi+MCCwhleGAStzwW7oE9ahQFvf7oU1jSds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9064.eurprd04.prod.outlook.com (2603:10a6:20b:447::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Mon, 29 Jan
 2024 21:19:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::c8b4:5648:8948:e85c]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::c8b4:5648:8948:e85c%3]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 21:19:02 +0000
From: Frank Li <Frank.Li@nxp.com>
To: ulf.hansson@linaro.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	wei.fang@nxp.com,
	shenwei.wang@nxp.com,
	xiaoning.wang@nxp.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	imx@lists.linux.dev
Subject: [PATCH 3/4] arm64: dts: imx8qm: add smmu node
Date: Mon, 29 Jan 2024 16:18:36 -0500
Message-Id: <20240129211837.239683-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129211837.239683-1-Frank.Li@nxp.com>
References: <20240129211837.239683-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0170.namprd04.prod.outlook.com
 (2603:10b6:806:125::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: bd4c42e6-eb11-47c0-b325-08dc210fea75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/I69Kj6ekpATr5EHTBwbSmmMnPb9HJDmf2abxlu1B0W63tyLiARVUuqIeGZemq+DScd7xxVYAmqeVPeCo5BEpcV9eprYzws3jCnx4qL/LhzAhM0tknQ7DPo6a/o9In5QWNTYI2FzeZrOilQRovuz3UZTyOe8z4oc46WTySJqVJZ37ys1tU6GQh0IOfPir/NIg15cPiHyjZMZ+WUyfbn32BnrqF9xpYcAQCN4kcQcnqVvHjZE4FQxEfvFVJq/jfj56nNfkK3OHZiXH+MxcGRREa+EY9UXu66LHqbB7LRUcrc0EVac0RKXKC7qzFUrIo6uRnx+olQInijTADNaIrDTDqbidpK383AijIEPV2+tXBVWWhaEcjfJPhlfatD+gp77u78zk1M3UN791yoFgtwto0GAbTXW/gnAn7Tfe0beXH5PLmnNL5+WAK/GX5HQhrEtbOmzuUX2C4Gr9emTwd7sf/FhLULfDlH0XiEwxQJHWILeq9WxrHTJbqG7kZTW9SMIJ8KvLFLNnlLAQHFYzbub/Idvpjp+W8nASzgtq3BMhhaDeF3UzvUZsI+JhNMRlBunVoxPXpO1GAZ+L4H0Ad8zpvzLLCs2cdHlb9yDzNoCzJrgUM//bKCY1PNuybLjzO6K6wJIJHuj4rcdHoHYE9jrYdhefcN1scX71xWM31eTIns=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(26005)(1076003)(2616005)(41300700001)(921011)(38350700005)(316002)(36756003)(6512007)(478600001)(52116002)(6506007)(6486002)(6666004)(38100700002)(66556008)(66476007)(7416002)(5660300002)(2906002)(86362001)(66946007)(8936002)(8676002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fhkd8V0f/l8Vrw/Uuq8uSMgkbwRcc/YChmZQ7WVttgcWkaFFUzQkSVqhRzxk?=
 =?us-ascii?Q?7mPTF8Lcvhod3ASmnP/0ugoQT9AVebj1n09lgt9JyhC+JPUZEqrcPzLckPNu?=
 =?us-ascii?Q?W8ng1e7S54t8FcxF6BYoLY4vXZoHwDdRnGXXQeUzWjP9puzHbGLS4K4irZ+l?=
 =?us-ascii?Q?FsfnqLREQbxxB4TpgVIJl42v+td08j7UzQSLNTX0CSm3tGE7Gc/2r7P2a7j+?=
 =?us-ascii?Q?tYiL1ppXu3TVfyo6JaRQjjg4gbmZ9u2OfiHszq9QM0IFPymSEwEnMYFiPmOH?=
 =?us-ascii?Q?80o/ED0b4BaRgaaBHM4Lb1IW4TXRHcJpettxMWWn3vSaeH85a/ChmBBcHaMW?=
 =?us-ascii?Q?y7JWSG5Fongs0J0DnmfHnB7SBz+OVsBQ2cQNkOiA20hzD4TPiYeAA+F0AurD?=
 =?us-ascii?Q?EBfuxBbawl4YKqR2W85gPzC5THA/Ft8LHTzSgBGtYG/dhnwXO4uFvcPs2w7y?=
 =?us-ascii?Q?b+yzkmcoHoywZ9bQ7HTFp2tKXv7YmMEYtJONpNPd2udAonosIDwymjvUpP8O?=
 =?us-ascii?Q?YgE68+2bdJE5XiA0mEsBjb4ceDNOyQ46gjnOkFIIwV3lB4AF04MH+c+LS0xZ?=
 =?us-ascii?Q?+iefdwM61vHEcXmTfCXS6RjINQXVCViq/qKV6ragZYgwVStxwb9A5txG2ZWy?=
 =?us-ascii?Q?6cFePDi7fLVEH8YEY93uKzeOk2VaQZ79egZe8ZfUDLAg4h7rppl2VniqIhcs?=
 =?us-ascii?Q?R7CDHp9C289uitFYZw18v5bWBooDhYd9P2PFVennaDFqQwCZdFXrI7MrhYKh?=
 =?us-ascii?Q?RBNQ+GBCxeJMQc20wvSfCajw/vbSt4lA8KYIbyF9QtNptgMGLH5KVJEXDhfX?=
 =?us-ascii?Q?qHVjuqYGtZ+THvvUfJHetN4oHpljqJf05HQjHpYdY4IAUO1DpzCZYZbrDmcG?=
 =?us-ascii?Q?/iQZ2GQBZZCLLQWTE4iHjeRd85Cc2gGGVXLje5MpRGmklVeeP9JgC9jiayJg?=
 =?us-ascii?Q?NpUbYGXfUAvrH1VeVWrY+X5W0mivUMRhIkFZhaGfh43XUawr7+o9T7ZKt9fJ?=
 =?us-ascii?Q?PurSTRwOd60bGGjiD+h4tXDGDnXRGYp9RaNhIOenOKsuf0CjcDxKR6YsBOWD?=
 =?us-ascii?Q?03Q4ZKc9Dnb4Eo+vTa9dMCiEzGJelvRFXK6GRIImgaMoBHCCNegAp8Xtcypt?=
 =?us-ascii?Q?hFsQe8Rk5VP1hPcEFQxQ8QMxPa40YJMoiLgoGdviCmwHnbYU5eJTsY514Vfl?=
 =?us-ascii?Q?XvAuVjg5FVnJMRqxyfk6i/2u7E6pEKhLN4qPE+RSYPW54S2tivG4PwAwzMa4?=
 =?us-ascii?Q?6wM6VL0O/Fq2nKuGTleCVL38qWmAXxW/Er1uTEPDNpgW2IyQJXGzu2sUPb9e?=
 =?us-ascii?Q?yKoTNcEL/f6Vbh9MtU0Mz1GdX242ii1Zas/OF2ddI8ofsihzcOhU/udb8hAX?=
 =?us-ascii?Q?y/fQu8NiLULAHZQL3t2CW6m3EugVOATJN0VUsCaxXBzr69mClguZuq2XyUDP?=
 =?us-ascii?Q?Zd0tneyqs1DawUDxHI7LW9bPQZeEy6d9P2d00QfbFgowxNQpS6tdaMwyu/Nh?=
 =?us-ascii?Q?Jeup8Kw8XozSTKt87vZ12r+5bipV2HsJptAFKonee8n8mQqebCXGy7qp7GAJ?=
 =?us-ascii?Q?Lb/J06hMNksnhkysyTABnG4Cgr2qKnPJZv90Jn/J?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4c42e6-eb11-47c0-b325-08dc210fea75
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 21:19:02.2600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TeZtqGXTtNTU/1v3TQS6jLhHcfy/H7pUUgyA+GFxxhhUCIEPdoHtaZoirJCpbKmX7daiBZ1Fe2pPiUz1cTZ4BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9064

Add smmu node for imx8qm.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 41 +++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index 31744fc1ab085..b3d01677b70c4 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -265,6 +265,47 @@ timer {
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* Hypervisor */
 	};
 
+	smmu: iommu@51400000 {
+		compatible = "arm,mmu-500";
+		interrupt-parent = <&gic>;
+		reg = <0 0x51400000 0 0x40000>;
+		#global-interrupts = <1>;
+		#iommu-cells = <2>;
+		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	system-controller {
 		compatible = "fsl,imx-scu";
 		mbox-names = "tx0",
-- 
2.34.1

