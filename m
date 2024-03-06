Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2071.outbound.protection.outlook.com [40.107.21.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6DB13A875
	for <imx@lists.linux.dev>; Wed,  6 Mar 2024 17:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709745856; cv=fail; b=O97D9GaVdUlFeQGz3VB1IddsX1/qdOIgaFtvMAAp9b10AfFw5I2H1vkrZzmiJ82sIbapMBUXy0Is0e5ob/sRe5HYxh9E1v1FIPz2vTabIO7Qp37tnR6jdAkoVqoOF5dAM83bmGhZ1oNZ+xfAfsE0FRWKyip0L/91EPhHj/LJ2ZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709745856; c=relaxed/simple;
	bh=RgngnF///VPJb0YSM1SFRzIFtD+7xEZBFxcwX7gxwPk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=iKdhowBpjOCwBMmLpAf4ZpgQlIwNA8GBLiIZDjgZh9c/gPAYe0UGQJtTJrCJoyD6KNhsAwqRSpNtgrT6y1OCHtW1ptioRqQqPpyMYT7IEs5aF5F7pXtiE0kcA34Q/E4Rh258ZjJc6Izn3koCCEitfMgAKXzfNdh/qFVBSyrRBA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=nUYB3w69; arc=fail smtp.client-ip=40.107.21.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="nUYB3w69"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Liadl9pf1VCX3qSe75LM9i3OCU9l38yEt1QkWqukefu59305WYkJ2y9o2p+67wK6OGetde+UVQqM9+K+qpbm5vFmaVJr0KoaoCsfIhXol2oFvGwPF/+I+NqMJ3klkhwhXHKNvhoOaOR3jquf9nAHCMs2swO9h/oERpyRzB/XcT32R1h/6flTa0ohSHZ3+MzyCg2LEPBt/vV4oK8aRl1BlJ+CdxUjpg0kq1XoDn7ub5gacdEQDpVEfg6QkRUurcLPtQgXf2n/BmMwMvwfv4oTF9plC7+id4TQ5x+yLUrg/+P1kJ8ThRum29xASSFs+UrMvmclKFae/pfop9PEl+0kuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Sl16cHBNQAbXFgM02+tz761jWn2RvyeXV/YFlT1QP4=;
 b=nT7mtss+MadhAYEmHw8PMLWUnPRjUzR8xLrTQ0IXaIR7XEc5NyIbVMU0xAURRAGClII1pPsxt7mxhNcIeS3Eys+dfaFITftluVNrZ5zDDT0Yaj3WpgVnu02ISyfPhbsRWAak2uKLl+qLoolVgBBHrS0mLWbIIUbiMbw+GpjCQwHVX7BU+p6toHJ8f+cuR8myNSPitr71Dp3KYSbihKscBuHKiXcVFflIWsdDD5REvK5w74fYTj1ZZIbpIAx6MWOKS0cIF0SigiFRDhcTa/LKLTxZX0m1/xR0LqCorxGXeMQa4vHoaPRYlbj1DNaqFHRHcmkBOCpJQsbf1GTiFn6gwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 193.8.40.94) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=leica-geosystems.com; dmarc=temperror action=none
 header.from=leica-geosystems.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Sl16cHBNQAbXFgM02+tz761jWn2RvyeXV/YFlT1QP4=;
 b=nUYB3w69Gke6HzaaUchh6znea0WAz2bq8xLihC6GoPNgVJhCnOvLybIyGcJAO6YV79wCnmTg5UuPpXlRcwau6quWyHHwlByPIG/fXmaBpkoEwgKYOSNhApD4GlSYvKviuLEB0UsY7xFu1BqmwV6FtnQAk8c50Qeq7nI4JIQ0FBE=
Received: from AM6PR10CA0023.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::36)
 by DBAPR06MB7143.eurprd06.prod.outlook.com (2603:10a6:10:1ae::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.21; Wed, 6 Mar
 2024 17:24:12 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:209:89:cafe::82) by AM6PR10CA0023.outlook.office365.com
 (2603:10a6:209:89::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24 via Frontend
 Transport; Wed, 6 Mar 2024 17:24:11 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=leica-geosystems.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of leica-geosystems.com: DNS Timeout)
Received: from hexagon.com (193.8.40.94) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.11 via Frontend Transport; Wed, 6 Mar 2024 17:24:11 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 6 Mar 2024 18:24:11 +0100
From: Catalin Popescu <catalin.popescu@leica-geosystems.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiaoning.wang@nxp.com,
	linux-imx@nxp.com,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	mcoquelin.stm32@gmail.com
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	bsp-development.geo@leica-geosystems.com,
	m.felsch@pengutronix.de,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>
Subject: [PATCH net-next 1/2] dt-bindings: net: dwmac-imx: add nxp,phy-wol
Date: Wed,  6 Mar 2024 18:24:08 +0100
Message-Id: <20240306172409.878928-1-catalin.popescu@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 06 Mar 2024 17:24:11.0104 (UTC) FILETIME=[1A5B4E00:01DA6FEB]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E0:EE_|DBAPR06MB7143:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d7cedc59-d9dd-4076-e3dd-08dc3e023cf7
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tPKRfS7E+nmM+L0eiY5UU+wSIBkTzrVUNujUUPSm6CR8gc0A8taiCAUy25KE/HaMMrRPL98HyDXXSeNqPxuJWc8iiPLfPDhvcHAYuNzLE1iwEUrxBaQjJwv9VgwaoCR8bEvavggOpFDRHZZNgMNUIcbmFhnDw8O+4HpS7ChzddmO7/1dSNcetADjq+mfnHAlgb2jrraEeE3ysX49y6/4JpebEBDHy4YnySV7xNVA3QHKkWpBf9+fcFDjIZqpb1co2nNS1xUiOzK27qsTCfWxUIpeLyRCUr9BzFL75TW/RRI6dxvsleU66hPlHjBdj/2FCylNvGoW/CzFixXRnsXRv7EcClhm7AoX7SdjotUPkXC6oTcHlW5TicbQcgd4P2hnbSHGWO9RuOUeSumGtGHsVO2muwp8v8chdIQlP5ZXu51fjQ/4Z6LkbF9Ke+gWGDQeQNSNiGudGtLkHoxPQcmfNkOzHDZIPzvMWOsM270NykZvSFC/q4j4EPznLDA5fNw+Yx1VvldFEgc1aCp7eYqhy+prcmlXuG8gSnqE5OlvKwA+FOZ3jMb47SEEnFIsHRz5g0Ah0sPT2gR6uLMeo2sAmsQcfQ5inQHSeloJ9zNtsS9whqcotUD7BJ9yG4yefZyCEipxNNo075/kwkJfmRtg3Beu57PcGUES33mO5yMlh5GYNZA3CxVMgDup814UtEbGw2nmrpOwiP2a8oB1wq3B4caH9qkW6eIDLlJXvk2lGuBhhXQw+ckgw10kQhPYac24UL4oythX88Ne3b6G4cXRPg==
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(921011);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 17:24:11.3190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7cedc59-d9dd-4076-e3dd-08dc3e023cf7
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB7143

Add support for PHY WOL capability to dwmac-imx MAC driver.

Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
---
 Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
index 4c01cae7c93a..6cf373772eb1 100644
--- a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
@@ -71,6 +71,12 @@ properties:
     description:
       To select RMII reference clock from external.
 
+  nxp,phy-wol:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      If present, indicates that PHY supports WOL(Wake-On-LAN), and PHY WOL will be enabled.
+      Otherwise, MAC WOL is preferred.
+
 required:
   - compatible
   - clocks

base-commit: 61996c073c9b070922ad3a36c981ca6ddbea19a5
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.34.1

