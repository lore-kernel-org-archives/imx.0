Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013036.outbound.protection.outlook.com [52.101.83.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDF7408014
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 05:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787290795; cv=fail; b=J4DHkSF8JIYf/CKb/i/MM/oI8NBjT2GWD0qY6mDldZL+db8UKneug1dfB5zoMlir6i9ODr3t0wkFzNxmqINBePqZXjtdVUp4/BbYf6Qm6KShjICuCoRk34eKZ82srKWWp0QRBzPAVwpRUPSw+ZI1tkq/JtkOl56YYNBE9GIYWDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787290795; c=relaxed/simple;
	bh=D2RLTKvOKxFHMI8KKwqHyHJj96spwG6SY4yoEuA6oV8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f8dG3LdEQNqfUeWXPtBn8Ogp+pKJSVZBqoJtqupHECBRjWCrgi8YzxY24bVURxyD/rKhz8seOPt0+7v7VbNFgaDI0aVFq4eJQiX96em/dP3aV1qSy3c9OcxDghvMPdx61dHpT7y4JQefK174ykXwnDOFstg41sUUF1vQrNxWU58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oPU4OilN; arc=fail smtp.client-ip=52.101.83.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oPU4OilN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sl17CuwYNg1JciDjfBWbN9LIAmu7I7jVkAqVOwpSeyPfxiAVyCYdMhoUM+zlN/aVqh9cuT7SdgqgpDAaexv3tWmWX3dtxPSi03GBvHa+NC/tq0hmPK/itA28K1Yxe4QqX0v0qEehATGQOAPrzttvC+AtvKt8qFeJCwKnwmSdDV6A2NpFvXuCFpnYS0RdR8OgIR64dsqVaTi47wl6On2NoB3rp/ehwLsnCDozOSE6Ipea1VTVgxP+SXp5DMykkaTsmdOBveqSKlVz1JwLnHrH8n51Ehz7AvJv4KlTWvMUsOqM2dUMzhDKpaufMgSIEG+4V5/ciCwg7pI61C83WAtyGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOBuqs7kY/FOkTuRkBagJUCCt8NEj+Rq+JALEtd9gzA=;
 b=OQRZB41aUW3Q3Joy4ffBdgj9tEt/8gTPKDUbQD8dULM7cKJGiOLPTvaonZpZh3fY+qXAMYCKrVzNOh7toTuzRQbqCP02EOoDq17FXwvFU8G79vsU1tOi2hWxCJBQLYHbhlMKpa5g6xslRro93U1sjsBgMRvZUycvJ3ExY7kL193jlD4FLq+y+VazW/WHGVwa0Rv+BL6F5Cnkp9n7boynJM+FAAPeIQTNVtO0iIp8OhfkRBteeHnQuPib6FwzP0Mvwe2vvWem7mWFeAGLooKBMizbdg8QfRFwo8hIGva1Ll/xiBwBI58hEnIunQvAocHgb5msJdKs82AKJILV9Zazmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOBuqs7kY/FOkTuRkBagJUCCt8NEj+Rq+JALEtd9gzA=;
 b=oPU4OilNTx4H3N/1UyiGurvtZtjD1caGLH9DcIc5sF8anjqPfTQXw8PkC+luX0i6PX5dF7hppTTBCeO2eDALBMbbeIeWN6VewdcIiiQqUCWrW9oPEIM7ycMHBfaw4PBz9XeSJsJHurtRMaTQG4DnjuXF3iDSNon98u7Rz7022WdSc0w1T68r6ioIVFL4mylTGnSje/y3N5Miro5zjS9f/8zBWVKfaI8HOI4nRa39jjfRPLKDNbBKS3dDk9NegfLQnFW645lIK0AZIX01ByGvVo3DpcesndjzZJ0Em4OJQHw1PAPX/JF0m8HcOhld0IyK2go+3ug/IPN6qB+vLuLXtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by PAXPR04MB8489.eurprd04.prod.outlook.com (2603:10a6:102:1dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 05:39:51 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%5]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 05:39:51 +0000
From: hongxing.zhu@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v2 3/3] arm64: dts: imx943: Avoid 32-bit PCIe window System RAM overlap
Date: Fri, 21 Aug 2026 13:43:34 +0800
Message-Id: <20260821054334.1277088-4-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821054334.1277088-1-hongxing.zhu@oss.nxp.com>
References: <20260821054334.1277088-1-hongxing.zhu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::20) To PAXPR04MB8096.eurprd04.prod.outlook.com
 (2603:10a6:102:1c7::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|PAXPR04MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: b7828158-ce69-4e8d-10e6-08deff469ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|7416014|10067099003|56012099006|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ZMhvBSRpGJnjRWBShQrcOWNU7s86kaRU1GRMg6tYY8a8ijIQuGdzfddm8p6eEZiXEu2B8ajSvKgHlzqWM7Xc2a893tKFJE4mSq+axrDz0Xo3S86H3DZxUMgbU/gsOgd2IQ3yLbNkgfqIJOgG4NrBqyxkZ3u+7vQszV3+0CictXVvrJSj2OiOiljDXfVcYidqzEALrngWTy39AN6mNFlQOcY4R84i1kOjy1+HOFlaF38v/SDv6Pm5ffxDUA+GL/mDsvTSWAaaLUyZdtz97QTgVG6lP8P8hdbVAohZ3vSuUB1r6WF+0YJPsaDv7Q3MwerBpIUXap8RtDxiwPmyLFf6A3yzxptayJvMdBsyTI03oEFuiFzniSTSG+z7Mu/lKhgtP57EFPQSUsTlXHZ/57Rk1Ik35AS+jOlOnIQZ9LBAAb0usuaJhR3JpJQyZfztcUPsFe6d7+xB8K1dVPFvq1NCr83xWxxncApYJpUgToqbHlw12QE7Gkfw9Ka+PgRmC3/aoV8vmrOrM/AU3k6UrSbllfaxJCuoC8/ynuyKs2sPsMjbSoxNOQH1c53Re5UnkVGHseXYI4L7sX7a9bSUiNqjLA/o0KK6q4c+vXnmi3mL1FpvVRA21Jhka4OqTmBT+3R697SXS1bjGvhIr1CIz7WmgkF1eqA+x/Eoc/XyKjY1nvs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(7416014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CFW3LrKNZV1OUoOuLHyoIWKKcJOUftLkJyBgvv5p+QKvHsXCfyx8aPkg0PYx?=
 =?us-ascii?Q?Wf2Y9rNdrWVCL68RXLAZh4MQeuvsrDttq/qY7rwp1aCGzQw39xtdURdOpV3n?=
 =?us-ascii?Q?aMzON27ftiO61GRamcCUHfAOFz6SqCgjq4LuIfeQUcegGL5QGY00wbt6SIOG?=
 =?us-ascii?Q?ibcn3N9o0MuTnaXa41zR0PY3fLLJADyAeZ60Zko0n6ScspemVmfWzTq5Q9nj?=
 =?us-ascii?Q?2REdphrtS7W5dLcoLAUVuE8dP0N/pb71eHJZNRkytEd+bu/zghh/nX8ICUiX?=
 =?us-ascii?Q?vAauzCtl9ixMuQL0UOG1YchQSfYhUnUE6DzsPTUZUo7y7WGGw3rQi0LE+jWl?=
 =?us-ascii?Q?mljj5VKSA26azDVorWSsYdPf4ILgaV+ioiruCaE8FaRyUzghroze7f3+e/VT?=
 =?us-ascii?Q?MmIngAZjdHZc3xhqUiFluYLPgc1iSuZpKPa9cYzahsygJn/mgsRNsbkKmjt5?=
 =?us-ascii?Q?YtHXC8ujbvPLPJnjz/fD8ZvAXqiIj6obgjkWTFuvBkLajyjg+Q8L1z3Cpcv4?=
 =?us-ascii?Q?u5UoHVAC4pWzpSdINUfudkDez4D2jeaEHzGwjEx0fQ3BVVpvnDRhQbocQs+C?=
 =?us-ascii?Q?f0j9uGeln+/DUCm/yljoBT04Thg5RTJgrSTNw6b6gH+JXtXPiM98nIASiyZj?=
 =?us-ascii?Q?4y48BI6G4TFkqCDae9LK3OjTF8BpX9POU+Tr5Lx+Nm8dd08yP5n4KwAm/UTE?=
 =?us-ascii?Q?Fe8y3baEeQZY6ggoJoi+4DvMZL/YBYKF+rWNcUon2MShBjqXIRi8+zSBdxWa?=
 =?us-ascii?Q?Jy2lBX6VqcLlnGFKCxUMPXwUZruQNI9/nbeYHDYKyv/z4Iqa0DcSafZ49diQ?=
 =?us-ascii?Q?pPfslxKi3c0ikyDtSSlqV9fas2fHZjN+S9PYil6PKppVMwWNYRXc1EZTqaLI?=
 =?us-ascii?Q?QV1EqG2TbtwSUMy/X/mHYf4/JgEj24ZmhFGtP4a4wCUWM0XTGB2kQQIeUHZV?=
 =?us-ascii?Q?r+ytIGJ4EitBSZAfL9+lC1DXJZc1UdLWy0HpxzQzDjA+yz8HrdOWIRJdAet2?=
 =?us-ascii?Q?WjZPSyhu/Jm3aO1VMaWu/nJUGcaKbFkxvNWu6qyTV49vHm3BWYpHC0XuUdnz?=
 =?us-ascii?Q?Iz1HmmFcG458P7hBoM/5XHgb4qRmtlTGxseL3fRV+sbgutDwkIae6jIEOjvD?=
 =?us-ascii?Q?dGuAgo8P/5UWyS8fPyG/aOPVh+YTe5mLWAehTHoecc2vZKfMReJyt7KN/FMg?=
 =?us-ascii?Q?vMBf0rUy10UK+9GAg43xAb6zFKWRav2R9r+hiGk8YkYgeaBJ3bNhB644drQJ?=
 =?us-ascii?Q?J6LMdkcTcIBmsr071JfBilgWunsbCzUTlI3+8EnFUriqgGeoRa3bYavxCdx5?=
 =?us-ascii?Q?QIv046wMOxqL5COiJRCoT70r95EXMWVUM8QZKAc9COz3gdP7sFrljr5T6E18?=
 =?us-ascii?Q?XfAMLMgudCrWekFRDjjU18woLUJt6b0umyWwTXjNI2qL6VWlkMQ9kmG+Pzh9?=
 =?us-ascii?Q?iwezfi4tSRymkFhtWqgeIBmh+VnVP8LUx0rCKQjB1aFuo2y4jMvqgq9DxMRH?=
 =?us-ascii?Q?Ek8evLt9faAdeuwwnGKeEyxobrB3ZOh+xhU6u0+3WVjeC3ejjrmT8G3kJb6k?=
 =?us-ascii?Q?LXQCmN3KuBGv6Mjer/Hz2LLW/pStkXFjcOM6eX6480SF5U8gCWp9QjP8+7sx?=
 =?us-ascii?Q?HYeePAPK8VT51UpuIl2jkco8l8TroHA//2z9g/8npvQVxtBRmVipH07m38c6?=
 =?us-ascii?Q?eeQe7o31dRrJbubAwS/DoMFuoDXDOMS3ja08VFOZY+EYVecrsE1GgG/Nw2yS?=
 =?us-ascii?Q?2I6ImzsEUnE1EkW7Gqsi4UdAk21i4LsGNcH6D5zMhuqqVC0aMbEl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7828158-ce69-4e8d-10e6-08deff469ef9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 05:39:51.4319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOLQ9WeDUmcU7qOtLxHCne/AGNqq5h8v5snJVatNFwmFfzvVCYCr8xtGVhe+Dc+N0ntT9AfvkuX70qwX71lgDRmtRl5sLnqdVFNYVm1+TypPTRXXQ2DtDPBeNULcowgN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8489

From: Richard Zhu <hongxing.zhu@nxp.com>

Move the PCIe non-prefetchable memory PCI bus address from 0xe0000000
to 0x10000000 to avoid overlap with DRAM. The 0x10000000 range is
reserved and safe to use.

Fixes: 6de3a7d7a4f65 ("arm64: dts: imx943: Correct PCIe outbound address space configuration")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index 01152fd0efa5e..a564488d9cd7d 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -219,7 +219,7 @@ pcie1: pcie@4c380000 {
 			      <0 0x4c3c0000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
 			ranges = <0x43000000 0xa 0x00000000 0xa 0x00000000 0x0 0xe0000000>,
-				 <0x82000000 0x0 0xe0000000 0xa 0xe0000000 0x0 0x10000000>,
+				 <0x82000000 0x0 0x10000000 0xa 0xe0000000 0x0 0x10000000>,
 				 <0x81000000 0x0 0x00000000 0xa 0xf0000000 0x0 0x00100000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
-- 
2.34.1

