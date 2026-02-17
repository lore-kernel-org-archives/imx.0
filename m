Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011069.outbound.protection.outlook.com [52.101.62.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3231936CDEB
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 13:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771336535; cv=fail; b=LoS3XhUvkFRHxOomzQsKXxPIMNulwPO7VcGP2UJMLuc/L5fLC/jQV3WLZRHDAQNWfi8ft52Dc2O2Z1JjBP4a1kyz9Lxz6m5eau5msm2Pmt9NmsP2Gm+NyyqO572X+1zT8d11G3yLtVvDPwP+ASjhNvm3gjEsqBiypukJk1zK/EA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771336535; c=relaxed/simple;
	bh=HRVfnrgyfjnEF8JNTgU5QYJSJ5QDwAEQK9xpfRmTAvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BzpBGGLWJYWM9NxO3JUkxrYTUK59hVAw4pIuXkWXQtT55Ok3dTuKwXqpSUFh/UVrvwbDBZtOjypHILRGqIqUzIUxB07f2f6d/vdKCHG54poDpUEBINBdmWzxzMWAFwQeilg5BZMfP4Aoq3dSADfewfEk516Wzc9nqDK8nUyUfxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=Fmcousvd; arc=fail smtp.client-ip=52.101.62.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="Fmcousvd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmgn89D9wZcw6o/hak0pj0mEMP1NqpweWoswDe/TdlqTMLwgv3jU4aA8dYE6+obULRMTP9SNvmJwPGtDdIK+xIXP2hFrfODdRnj3GoSNwNEGR1fROAXkVwNdyNkPT5xxpf6At7kOc0D4uhu72KxnW0ABMD8AZ9Emltm+eqjyLnBko8e0QaVYN1xWfQWs1N5jQXumGWKS4bc/g7JyuWxdbL3dgpbUHDmgcroGohJiLzC9BMualA+ZVc+7z/I7W+SynVdsNpiwCqEHDmNT4ArsmMsbcj0O2Qo3YGNURz5yXOwyRj/YZw2tovWbG16cENV9u/uxAOfIIdSNj87tg6L3fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6EZdjdOBRPE6p/IMq+rwytd79S4yFPyGgvWh6elfD0=;
 b=Po3sc/2fEMX5txfen7Cpb/FfglUf+ikKu+a+IUIaO63JVI9VsSQYFPLwfjGbdxa2n+6iU48r2dhSZvHA2yYTlX3w5Y0XxayeBmh/sOaNq96DVBZUeBaN5UNXUQU/A8OJABzP+SvrGgUezG1SCu2tr/QLvywui0vxroYefognRx5TAA2OVKrzBqDM808xYq2bw3ISzOtP9opZJCH2DEj17hpAh/gtXmDoTSh8Aufdgl+rsODbDzdMgVwdPA0PdfR28IPNRpBVegSQUlQL+0DPXbVnJjObxfC/K8Y/EZ7a0M8dW8aEiVg5iLLgWIEyT0oSI2zdYsPZ+ckYVMylhGMN3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6EZdjdOBRPE6p/IMq+rwytd79S4yFPyGgvWh6elfD0=;
 b=Fmcousvd2/HtEsnpiTaGBKcI242nJMK6e8b0tAIunBgcx5dxfHAiaIFxxwnVdlKzRcm2+8GYCeLz5HI/CzjyfdcT3tbv4425WYwdt1Dv2YB51o4Qjivk1YEDwMTO1JjTr0hLs/ac8CRcuJDQ6XrPEnOBSCozMys9ycb5Sk69ouK9pe73Zt2IhPe/kw9fl0Ki9AqxsUoNmsUe6/ZA9GWxjLW2UcCvaz3YCGLFwbBktnzjIQFYyL9h7x0i4ag/TgLfj9jLU3arSbRtYnjcHXwTKZYgT9R+jdAa4m2fWW7WpZx7rPUTtQq9ZzxyZOT65Opyoy3/bj0ok6mPCJT/7Qn1xA==
Received: from SJ0PR03CA0177.namprd03.prod.outlook.com (2603:10b6:a03:338::32)
 by SJ0PR22MB3504.namprd22.prod.outlook.com (2603:10b6:a03:43c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 13:55:30 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:338:cafe::aa) by SJ0PR03CA0177.outlook.office365.com
 (2603:10b6:a03:338::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Tue,
 17 Feb 2026 13:55:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay2.compute.ge-healthcare.net;
Received: from mkerelay2.compute.ge-healthcare.net (165.85.157.49) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 13:55:29 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 97A93F884B;
	Tue, 17 Feb 2026 15:55:23 +0200 (EET)
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
Subject: [PATCH V2 1/5] ARM: dts: imx: bx50v3: Configure switch PHY max-speed
Date: Tue, 17 Feb 2026 15:55:16 +0200
Message-ID: <20260217135521.65742-2-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260217135521.65742-1-ian.ray@gehealthcare.com>
References: <20260217135521.65742-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|SJ0PR22MB3504:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 30160390-8383-471c-16e4-08de6e2c3640
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SCobmwE4ScTa3SvvERiC+MULKw9SwLukp05Ir3URlmGrbOv80soc6GeWRyGL?=
 =?us-ascii?Q?ZmJTviZ3ON/QneKZxd2dSbaqkR8O8pCX7UYscK7V6FD4WkEiMeW9JH8gaDTm?=
 =?us-ascii?Q?LOAkGcfvcGIqi4IEsqiAIGeFGg7AF1ziVCAz43NsGbJniF/5mIfbjy00iqZ5?=
 =?us-ascii?Q?LbToP5HlRd1LCggjhk0PrnqVKotoOunzYHM+k5nmOPhHWqq6ussNUtAMq8Qs?=
 =?us-ascii?Q?Ghu8d2Z2qtl9qj3yuPoGJRp52sVDDY8Hkdk+9fz4fkByxZMabNkViMW6/iCQ?=
 =?us-ascii?Q?OCadqIuuSj4hMCMO6xAMmtvdBQVF1UtxNNNy8SpzbOx1SxyA+BJmjzQ0E9tB?=
 =?us-ascii?Q?hqpZsp2WR+uwsKBTpDVk39pGCOPvTzfS3IG12EXfB6qQSzzPBBk3v7D5Rjbb?=
 =?us-ascii?Q?0c7l17te0cmY32m+jrUaArOC6EWp9zeGwwlw+Ryv/RkghBJ3V4pB7nqxBdz3?=
 =?us-ascii?Q?o1ZTM6lH7ZLFdn7PO664kcOWKP3QjNaSgbyAZsqK+Aookeyfhrf/4Hvqm2HF?=
 =?us-ascii?Q?rIeNPlD7zbNoGNuL80z7srzy49cW/cWf5X950nA629R973UYctBfxKr2cuYv?=
 =?us-ascii?Q?eCuM+STK5FnB4hawMuNOSKc0JmYJ/8gZjkc7A9vGbiMRRdcKUtPm2v6/TMlX?=
 =?us-ascii?Q?Gfzy2sXfl+MrW5k1eRe1dWSXbEGui3x7St931GRz6gbW2TDo5U0HWybj6zSP?=
 =?us-ascii?Q?U1pXKQ5zuKOh/zyD5tVsVXg7qNDH1AUZg83zIbl29jG//5w5cYP2F8r9oVwP?=
 =?us-ascii?Q?H+Eiy9pxtgMjCu5lNlWUGRRX/geJKkQjjfHM3PmdVDopctuTcZj4VUN/qYUe?=
 =?us-ascii?Q?dXkIJTqwB9aVmME8HeJ7zVsjyBfNoJhqROSGQRgAfnzu/YYK/tJ/8MPjBjwz?=
 =?us-ascii?Q?gCNsep1hl3jfHm8+QN4CVO57lSfbP+6TWkLJFlB7rqA5IYyNuBB4PBv0rOyC?=
 =?us-ascii?Q?Ux+1GNWwShjFGpzjRWiXnrIjS+M6oPvxj9VFRTAMgMjBhmLl21LsH5yOrGEr?=
 =?us-ascii?Q?64RxZaZ3VWMAa0tmzOJoOE8+c98zniP/lX87v4QfnIHjXsbh01v3nlIACX1/?=
 =?us-ascii?Q?VBjy5Pvh3t0sOfBO+kN63bwaKYnchaaWaLzN6yivjfySR0cHYQhGx7iZHplh?=
 =?us-ascii?Q?4pMV3ly6pfnSJKYMGXfbVEQ1/q91nzjxpUSBtTt4xJeHtdGu5b/3qD6IdovG?=
 =?us-ascii?Q?eAjs8/FnylfimgNuTF8iJJN9Tz9FoRKqg45E/ghYz7eQQM18J8fCRFqnKMnp?=
 =?us-ascii?Q?N1l9x298E/KdCslsbV1Ex9GZu2KrzlcR8FkNmkDULV1mFUdktQXlpZsyjL1X?=
 =?us-ascii?Q?+BgbF7wlAIA6rSU0yzZ8f4jkAjxFcHvK3IVu0+VNj1Mq49zMnetkw1BBGZ4B?=
 =?us-ascii?Q?7V3moRVD/0eDKCoilNG/b7hnCiUTkK9gUwcNjx/5hsloQtARsT9dY9S/5R23?=
 =?us-ascii?Q?m84r54oTIBqT05mX040yXDwXU7jsITg8V3CTLxZTY0ljLKUWwLwzuf9+tXFY?=
 =?us-ascii?Q?4hQaGDvgA+lcWq5XGzHZGawrRx2MkbPJXQsMrN5l8ETigHvA/tCMOz/xBBXK?=
 =?us-ascii?Q?rY2dYRQijWBQrvNaIGAQMtUu3401jjYPEAUNF0nfKmhxG31M4sZQH0EH+Bnq?=
 =?us-ascii?Q?pPlkaqHya7nPCF6M1f2qdkqUq5nQtiW8DtAArjMP9IHA9IaqcRHKBH10RH4f?=
 =?us-ascii?Q?+b79QQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Qsj6NXwNqZSNiTP4ALTb0eTtaLNSCe/kfhsoucT79OqmY3+B52aIbXv4OF1HFDF4hAdmyPOBWBXdi5yDh8WB/m6fMh8cDGg+8+gXdQyKHVqE4cFrZ+TnKouO8Z0KcFEQ28Si/xENMvYcaDHh26Uge2pu3L+8lnCI3KlZBglxkJx/srO9g9vAJ1uYQ3kfcUZo6rksn3chP2zpP3UQBHVdpKyWb8l4DIVO6nTwoC9aUsDYeh76opZ96vAL2jzn0Gu2V+8JUn0tA6I96IydAI3BZvIzf39V8D3x4ayR1dmOWedwFmtp1+SrbfXgVmKXxz0cQndn1hjiYhwWnJnJe+XJxsdCu6ozczOuzIqPzCUzRJ7VAPKxmkGJzhNbbDU8H2rzzWZqzCQXS6sAJVqMPkQol38y6vo7U1eRt3Ck3hXhUNLMx05Souh2t0mU+2gtbffo
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:55:29.8347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30160390-8383-471c-16e4-08de6e2c3640
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR22MB3504

Configure maximum speed for the switch PHYs according to the electrical
connections from PHY to RJ45 connector.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
index 1e2266a2368b..2c8d2ab8cda1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
@@ -124,24 +124,28 @@ switchphy0: switchphy@0 {
 					reg = <0>;
 					interrupt-parent = <&switch>;
 					interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+					max-speed = <100>; /* only 100Mbit/s lanes are routed */
 				};
 
 				switchphy1: switchphy@1 {
 					reg = <1>;
 					interrupt-parent = <&switch>;
 					interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
+					max-speed = <100>; /* only 100Mbit/s lanes are routed */
 				};
 
 				switchphy2: switchphy@2 {
 					reg = <2>;
 					interrupt-parent = <&switch>;
 					interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+					max-speed = <100>; /* only 100Mbit/s lanes are routed */
 				};
 
 				switchphy3: switchphy@3 {
 					reg = <3>;
 					interrupt-parent = <&switch>;
 					interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+					max-speed = <100>; /* only 100Mbit/s lanes are routed */
 				};
 
 				switchphy4: switchphy@4 {
-- 
2.49.0

