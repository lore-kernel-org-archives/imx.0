Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013023.outbound.protection.outlook.com [40.93.196.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0D83570C9
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 13:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333205; cv=fail; b=W+mBG63aI1HFoZ7Y98fkT7a7cHGCE9gM+ow24qcVlOGyZqeZAqFtel7bvJHQlONTBaQ49CTFPuhFOfGSWImPiGE3HJ5SN31FO5YCrZ6YOjgyJD0zMuit9DLBM4m6soRSQo96GrApqJgs/IdG/DieJN8pO/ejAYmIgYTbrAHYqko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333205; c=relaxed/simple;
	bh=qZv9D7XT0H91xhgcX+ozMvaCIE060ITPio4uyC0qp5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lQTxn6KROcM0cOq43XoK7wQT1QaKkWsHYG8wo4C1Vf2tvuH+C/LpZ3m5hiZJQpujd1qEMS0gi5O/dDOq5VBY/yFCbeC0dYNggBZ4kMzOsuOIzvlVFIBWx/Dqot/1YsHZt2wqG8RH6qT9NZTCAAqW60pO4Y1WyQGHlu2d5gY2+tY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=jEBfMPiB; arc=fail smtp.client-ip=40.93.196.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="jEBfMPiB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTem4HLKlLPeUJ+w0Av977k0/xcj9psmL7bKopNI3Lp6O2DDnD90FMMKay5pVi3sk3IBMIwOay9jWDVEWAqEmunGlKt874m15lEXuoRVnYFZZaW4lQ35PSS8XvBU5LqWxDHN3BlTmQkd5uW9GALsRT0qf65uisCZhcctWP016g0PPH/YAHVdv1i6LYFr2CqprbfTBJeclCfhrff+kj3XR6MlfgQFouE0PaD4feUanh8F+jBcoCzdlduyC3R0dt1FWW5owHDcKDH1ZfUAOB2bRwIxXpHHuZKxHPEZ7lFVjZrnHgGe+CPhr4cKGwUW1eCw0JpYed+PAoKRNL4xyaFFqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOIds7w3lwqUCtTKGqShiA5EsnchjolSb77H+Z/MfrY=;
 b=qaI+y5SgQaR9WleZUTyTZwhfYROTSuj15II1oMVm3XkubfOoIRQDfYU4YfA3o/waUH5dH2CyGg4wXWmt9p818fLjG60g//KC7HUNpORNlSp8p0QYp/5KFrJF5oZU/Qucf3NEd7GZvSkJSjBzCx1Uj2EX9V102HLSTM/U2OSOG0gsd91yWYyVOvkKIIBSNLTpdaRSVMGVBImkTLK68d9MqM3uwAQsfn21MEVQDrmt28CDqP5rP+LCBtOErWfxmV5DD7O30AnnyQgc9RYBl5feQ3wpXM3MPl0XqoEfqzUoy1+GHsnisTdjK+CHgxZoFAWtSXX1RDj1Y/Q+qO+6SaTqzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOIds7w3lwqUCtTKGqShiA5EsnchjolSb77H+Z/MfrY=;
 b=jEBfMPiBabwgWl3MOrUk0GXAuUWSlXdua1WqrLrtEMtXHCkNMwK3XBMxeJQamPor7ULwDpNqPc4m8BG+nJ2FijnNeCkSItsUgq1QFv60dr1Lo630MRVjymZ6rw5PJglJcnQtRrwb507Wf/gZDshYGxDAC6fv2uJUsp2zjYwlAhSmlE+DekBQzJAhKXoKerc3gcGD39OeirO9vUHnYH6yyrimEkl/mLTkm+ckJ7W/nEWrb1DxEkO5Kk5zFS9z6MQPP/ZnwBZhKdG+wXBzJob8qJCwoYYjS9x/qu2FfVM2g/vHTSornN/MoCKC/6eRsVvVTRJ+Ymz+8pjlztx0SuD/qg==
Received: from CH0P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::11)
 by EA2PR22MB5360.namprd22.prod.outlook.com (2603:10b6:303:256::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 12:59:59 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::36) by CH0P220CA0021.outlook.office365.com
 (2603:10b6:610:ef::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 12:59:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 12:59:58 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 2EF13FD2FB;
	Tue, 17 Feb 2026 14:59:55 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ARM: dts: imx: bx50v3: Configure phy-mode
Date: Tue, 17 Feb 2026 14:59:49 +0200
Message-ID: <20260217125952.53997-3-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260217125952.53997-1-ian.ray@gehealthcare.com>
References: <20260217125952.53997-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|EA2PR22MB5360:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c3a2f004-20a9-440b-f94a-08de6e24747d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z5UpNd6dFe1epH72VbzFdRljuZQxDiX0qEOZOA9NcrkMyWfSd8Rc9Wdcbese?=
 =?us-ascii?Q?CJ5SBmys7oz/0RJm56Oin0Fa9arETzXV8fdqTMNh8c4dtNSl5Zr2LLfRxy5T?=
 =?us-ascii?Q?h6QJNs9+QBSKwN2LZdZ53eI9MTvtPjS8EVN4u2PphUeN3UylVcb9e7SF3jh9?=
 =?us-ascii?Q?rievtu7MsvEPahnCmJ0tyEtN/L0cgQGMZX9pxQcyJ87Tb6eitekaKZ8mOgID?=
 =?us-ascii?Q?JjA9j2FeGdG7/qyQkFyQRmYLZIvuZBDzM1Bo8rALE31Y8G88RUVnU6JwWzvl?=
 =?us-ascii?Q?nc1aHsUM4Kz6Ydmczmaa6yZNKGVWj0INjU7tes/HOPmDtU6AUa7HQGL6Kiud?=
 =?us-ascii?Q?ZlFLD6KFhsx35v95BdY2FYVlyLXJH7m7tmsyUrMFIzS5hKnq2ZZyunu9An9p?=
 =?us-ascii?Q?Uqu9GfBp+NQwW/FBpU03NF7ovScBfrIMePZ6ZEKJX3ai8NIXdQa+0BW8jFVh?=
 =?us-ascii?Q?OUipCNXmHwr9bsBez9cXHxYpAcqQkZ2WLlmMn/epu/ICsHK2aF0rLxta3AjC?=
 =?us-ascii?Q?D4iajtoAaTaLi1rXfZRQai1/ZLr0tmNRysOoOMSgNrNsbH/zF0XyXnRnSmP1?=
 =?us-ascii?Q?l4FNsGH/zk4ts1jXlRJ//YmICn4luiGZY7oFzVMR4mohIxZh3jt76HP04nun?=
 =?us-ascii?Q?iPD3tYaDBqXPMTTUlINZ9uSd4LZQKyH+HQgIT33q6sdUAtpXf+m1Wk6FJAI/?=
 =?us-ascii?Q?mQ8/1j3O2pyh+ZuYB4qffyKKoklnyY0tpr2o1eLElTkyW8ykbeSPojPfJsB5?=
 =?us-ascii?Q?fzFDYWlweoOiRnUdAV79h307/DKluQ2ugwnk5B5E7x9imvDVuG+dkkUCSA0I?=
 =?us-ascii?Q?1L4+FhovDrrmH1yXOVwA9mQfn2A0zpDuajdCT9xVCBTVKU2KHc7DGYsByj0K?=
 =?us-ascii?Q?cBzAEu1hnVdaZZDOhPjwNNqryrnVa4OSJ0fwnR9bfTrUGEPrNbp739a+dsg0?=
 =?us-ascii?Q?Px3KJqEvw/NU3FI462fPPDT1DnJVCns691Kpg5T++xQNkAdsGZOdMwy2WfiP?=
 =?us-ascii?Q?rCKqk3y7JEEqj3wOR/0PE5+OeRrkSL50M/AeBhArDbh4RiOtQD48qf/kAUxq?=
 =?us-ascii?Q?3g6IGb35bWVyGlwjKqkROxc2UDl34JX1yK8kTPb7xgof830dDTjTv0FEqfbV?=
 =?us-ascii?Q?pqstpJ357vbgMYcdt6LA6UDZ18Wknvs5MtoBDysZ9IrKpIk3szMN2z3/4b5u?=
 =?us-ascii?Q?CTE45aDnvmC0ZhdohKuEHNpOXCwbsYBHBriOzTm842K8SkC+tYJFl5jbp5E2?=
 =?us-ascii?Q?AP6WD9LhHSGmpIVlicxZqBPPPjwVxaErFkPm+2dpGyOe95EKLk+c5Z4NBbAf?=
 =?us-ascii?Q?HGhmP0nJdEXdXKg2vjjTwQX6XgcgC5fzZEEEwNj3OWtrkfdZ+dESVmKNNNM8?=
 =?us-ascii?Q?O5YxYjAgXGZI6LFYGqe4+d+OYnzfbi2aJFWYG3HpfF81bPXitWkVc0a6YwHc?=
 =?us-ascii?Q?BtmuYnTEfLiu/BV9Z5/vfw3QNHtC3/ndFCCOQw5Co4TrrV/Gz1Jeph6D4dWE?=
 =?us-ascii?Q?uXqkx1sqNjv5Ohf95RE04Fxb/JNdR3scp+r24S05K7yg/PjANb/nWw97dSgY?=
 =?us-ascii?Q?2ecSCLmzAVo2/iIgUcJs9FRu/aqiFDk4XSZurF51f7elj6+FiQXOPiDUp3x0?=
 =?us-ascii?Q?jpPFlP6oiG0zehEW5ssWrHJx5jfdBq1N9OiVpChaoeuHsFI01CE682vQJVtn?=
 =?us-ascii?Q?k8upWw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Oo+BaJ7uaqRqgjusfQ2EyN9JPLHR+LF9vovlzTyefiQgu37AAvvPTvt2P0k7l8aOjhbyd8m+xYPBLWOaZKb5n340JLWQ39eg7BlBN+Ni+fC9u+4AAUIK6nrJojVX1TdK1tDdKZbqXzz0eEnsMio0gzuR9Uhqt06oXaQDAuLbikoIisBHaalUeXCT7WP1ZZd+vtk+XSZfRDC9a2jrKuBqrSKfP53kr9ecje2SDElMNPw5CS8HmcwBC/ebt+t1fziqAJ5bit4NwkaIxXYpoZQHKEFhsO5BlnMinq8zW8ubTfXf01KonrTcoG06PQjtqffJM8A89S+++C0RrFgLZgolfaZvHmUy9MTE4Wu2ILAM8laXrWKt4YmA8FDRrSRhyN8vphDT7JL8BP3E/CaDbkc9C0DRPM/3+p7awdWEhD81ZlX2rp/WpeSeK0G0SFMPUxih
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 12:59:58.3904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a2f004-20a9-440b-f94a-08de6e24747d
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA2PR22MB5360

Set `phy-mode' on network switch CPU ports to eliminate a warning.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts | 1 +
 arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts | 1 +
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
index d994b32ad825..7326b8ad08cb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
@@ -140,6 +140,7 @@ port@3 {
 	port@4 {
 		reg = <4>;
 		label = "cpu";
+		phy-mode = "gmii";
 		ethernet = <&switch_nic>;
 		phy-handle = <&switchphy4>;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts
index b0d345f5d071..9a43935be11c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts
@@ -139,6 +139,7 @@ port@3 {
 	port@4 {
 		reg = <4>;
 		label = "cpu";
+		phy-mode = "gmii";
 		ethernet = <&switch_nic>;
 		phy-handle = <&switchphy4>;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
index cad112e05475..e7ccdcba2d5c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
@@ -286,6 +286,7 @@ port@3 {
 	port@4 {
 		reg = <4>;
 		label = "cpu";
+		phy-mode = "gmii";
 		ethernet = <&switch_nic>;
 		phy-handle = <&switchphy4>;
 	};
-- 
2.49.0

