Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010042.outbound.protection.outlook.com [52.101.46.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2191F36C0B4
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 13:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771336534; cv=fail; b=af3Q3SVXWvNEh72TdTHHllCbbhkKZ2prC/OEUVO8QXPxD172CKw0ES6QSkAzJbBBTN1T09hMv2n8+eRgwLHJ40DZLyeyMOrI86edLTZxMV3YYx/lRXxqs9zwxYiZaNDJWMyQrsYKCnz+el0lfdMqoAn/c6Rd2WWCBIAP1KuXbNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771336534; c=relaxed/simple;
	bh=q8E51xky3EhZeIuNLJqFvTO9TfRAc2kDOaKHL1Y/C+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NsmFolhN9FVBO4VUtI8ErCtOnss8RL919mVyW874LPiDRjNMEArH3CBdVhCfApflJFlwjxG9DbjWB6r60A1wX49JpP9gsccpv/sfAc/9nV6KVKoUNCRZhs5z74EpN0SPqTzIR8ij7T835tGsOvpJepBMIbZcO3aj+OjyQXuLWI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=J5o26aBU; arc=fail smtp.client-ip=52.101.46.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="J5o26aBU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlSpGFNYQHmr3OZU7a5Iy9VtBCYl7p8mFSCJ5ys/A2MRAs5CAVoo6uCa2t38zO9LF0/q9zEudWFsoR/8XWgMYpJiSGZpXROVe2pv8ygtbhSLbbESJ7TRacdz4aLpt1iFaB/XAt2DKCC2CGYtg4Lw5WcMKmc9+0Nny+/Ncm2oQTfKGrNvs1wGwxGKQGvplX0QPfh1HXtuQUuZKk3o4nFwQY/xVlIUEXalHqXRFhl5af7VOsk1JRmcBp4n4FpIfXvCrXsZoAv6XWljlSXqV66R+y1ckCsW3pmzs7DTfCAPASUcd2YqjWAqUGQqD0HAPgu0gTpiZrroT68aP5x7vjEFyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYt/pSwSIZDXvrj1I46J8BMXgsVDKYkGbx6oN+R1ytg=;
 b=HW03hxzqfK+NE85ls2NNEQuxYzLT+8EC36yzSA4qHU/JAxBbrejnE/Ac7+HSUql0DMqZKyZBaFXAzb63znSjUQj7KYhwfIhmHd1ngoE53nxX03fRIQ8K1XaEo7AlfrCkLdOuze6N9EM1Zmi7DOVY5Lodg0B66FoBv2dK31Jls4CrrYm7+lxWAzPPwFMsTqC8hLqmAUh35ECcq+4pjubATLKcsdDF9UZ3nOwN/ST9kiZKU552DvyAYyCP14bjIsIWM2Ci37qjlg4XwPR5xGoZT5EaHSQhxJXQmofNtdjHDDFycbzhyC6eQUJilfyoGwGNup5z7QAc6xyQmb6Iu04b2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYt/pSwSIZDXvrj1I46J8BMXgsVDKYkGbx6oN+R1ytg=;
 b=J5o26aBUEqWxPGGU1VWgo7vwbmdVnwo0s2WB1XLQgQXGZ4ZFEFuyLWyfu2HZuGuGgt6kVidTX1AoqQDs91cDRwtXQcyXflwUm+IBlh9vlXqBIVzntsojUDyhCuRXb3YjNL1wZ3VHW7hUmRzqyU8VuMpZmIz28cpWDtzph4pF3WXtFmimifFuvOcyxkD8S2QcS0x3UMAv6BJtKHFcSIo0LTDGRPUptUHm9UhZMk1Ssx0d5AxWvjB3Abu/zpAlpjS0LvugkwpP9lfdOF+5Z3iXCJXf7+o12qep5xLB+5Fkey5FZ14ztW7l4OpRXGVLVAYTbStijOJVrbVuNllYnuic0g==
Received: from SJ0PR03CA0151.namprd03.prod.outlook.com (2603:10b6:a03:338::6)
 by IA0PPF8176F5248.namprd22.prod.outlook.com (2603:10b6:20f:fc04::d34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Tue, 17 Feb
 2026 13:55:28 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:338:cafe::3f) by SJ0PR03CA0151.outlook.office365.com
 (2603:10b6:a03:338::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Tue,
 17 Feb 2026 13:55:27 +0000
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
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 13:55:26 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 9D56BFD2FB;
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
Subject: [PATCH V2 2/5] ARM: dts: imx: bx50v3: Configure phy-mode
Date: Tue, 17 Feb 2026 15:55:17 +0200
Message-ID: <20260217135521.65742-3-ian.ray@gehealthcare.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|IA0PPF8176F5248:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4adaac84-53af-4986-01c8-08de6e2c34a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rduSuoy1xf4kGQplB3D/QlO3pj2pwEXU539VdRQYaIjnK1eIAz3MDtJx3MvI?=
 =?us-ascii?Q?R5KGZDaKSbjZqsLV43Dsb5dTIM8RTwbycc0tnl4ZqzJDo8VhcFFmudtF4qfw?=
 =?us-ascii?Q?oYV9Npam095AEOag18LjrJnjvTJOpqcS59LvsXiyI/20gceHN7jvYT4JSOgW?=
 =?us-ascii?Q?/zHRJnvtdcKWdA8/j2YwdvhQOJoTjjfUr6QcNuJjl+76wQQARK7Jbew4sRF3?=
 =?us-ascii?Q?s/1LtUt4pRFzuyBINPgVxCsbYlu1fWI7OXlZfmaK1atCDq+RNtt7YTja/TXr?=
 =?us-ascii?Q?cKqVMiFULiV/aptUwYs9ZrAQiBQJjxbsMPFmCoVIab9GFv+8cMGWT2/Ju99v?=
 =?us-ascii?Q?JxFRoVSF4Sk/dO3zIByQsM6UU91rqapqqbpxX3JdSp2BHt2T3J7Js57f9yAx?=
 =?us-ascii?Q?FPYR+UyrrNpn7JCOGqHQXdCySS715c/tkLzoZU2dHp44oH0LYfKF6u5agHSh?=
 =?us-ascii?Q?z2AFIjnyH0sq+CZ32wVBvwksg58hLb9Y8RJnObprrPIOZ3MiQ6EbgkEQcl1s?=
 =?us-ascii?Q?P5VIpmV0+geUlifHtM3xrA/46EQSRSPHbL2OoormHBtDmrfT6SRVoysVeCQ8?=
 =?us-ascii?Q?jJDSOcEEjQWnO7fF+31txZ0WJY79jOO5HgeRRgi1W3d9/NYSUnGQl1v1rRLM?=
 =?us-ascii?Q?tphs/g0Zxcwh+kr6DcxqrY2cP/Gz8gI70HLjuL1926IzoCJ2n+tXYV8T0QK5?=
 =?us-ascii?Q?MMBlOT74ZXjwvUOFlEeal1JBzhgpx9G9q2ux6mLrwLvAf7ua35a3hOguG2B4?=
 =?us-ascii?Q?EiqjLcrv65uRP7UtFVmSTRILR60s5pFchSY/3FzvsQ4yU+3nIvvjd2+YQRCM?=
 =?us-ascii?Q?iQmWNCAs9l/HyKJJ3bRnW+yVLUQx1as5DdC15tAvTdYlArsiqnF/lHJRhZjF?=
 =?us-ascii?Q?3Fj8VOZfFS7C1KZ48CQ3E1fqN/5joIrNpbLJ9O5XYVc5ksRGF+hlkmi+1gtv?=
 =?us-ascii?Q?Ah80XuUdTP6MfRrl3uiiqPnwbcyj1sG8ts7wATShCQNY0hPuS0Vk+3F3OtM4?=
 =?us-ascii?Q?LTT2WPBwCsJVAP2PSw7X/W7u6b+MF1KZVtHsDMz2YQhBvdWvF9FYAb0/QaTz?=
 =?us-ascii?Q?FOV/l0hMr020wq32Fkqm8ng/U01orRphe8PBvS56/GSnmnmocMWQ21XdRkW6?=
 =?us-ascii?Q?sIhlyZfG/752s8CL6fFFTuOKTwWBAdrIS2wT3VvBJyhvDN9S7VJeVYuXOMvn?=
 =?us-ascii?Q?EOMvrFafPgE/6/Ool8qfwS0tBeDpVzbPTDMPDhFMJqNAT7+A3XmGng8hE7aG?=
 =?us-ascii?Q?058CwAsTcEwG55zGAVL768HsdwpFmZw5ndXwhNrsaUANrvJUkfVPF8BeM85x?=
 =?us-ascii?Q?UL3FICzGMqiy/05LpAOvucaStaPbDnInyHbuwH4NYgsw+OF6f5M7kNYS0BPc?=
 =?us-ascii?Q?k809skRbyg3Mftu3tgf5fc1Plu2OrjzvbsIQ8OJ7wh+BKcMcDwRNxvU24OFr?=
 =?us-ascii?Q?h/Ft27/EPLkBp7RddNAcmv7RvY/1zl044OqiWlXXeA15wi166rRSlaeaKCJJ?=
 =?us-ascii?Q?e+6ACwfT1M7iqjjvLVehnsWRy0IJ8v9ysC1jhH+kc+Z3kh/lbfTwP2vGWgNu?=
 =?us-ascii?Q?QOEKzfHxdS+L5yMRmFcznNgEBurJG72RLFxBfsKpbyRhC571rpinY20TIKrf?=
 =?us-ascii?Q?e4/wcxgJQGdlmypD1UUxNawcJPBjiHDJD+KaAIJLmnWZ58LTZKdEnVIEQw+J?=
 =?us-ascii?Q?8R522w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NIOGCoIYmjCILf8z83iFoS5Ayo7lzkeLhc/yU6Tu+24wR1tQqu9FZFuXqa0vuodosNN5z2VQJpJWjrpmu25oyg1er+8+HUZlA9RlXAw/HTV6PJwDw45FU2/sqFItNzZotsRUL5WaLKNdmu9VHmDGzuFaKMsEsS4RAr1YjUn06gDU79LairyrIm8sVyJ4ooqX2XfKqtdQMs+AQGGT+WmMh5+AE7MM8g+OxyqfXVDr63x9CMa/o1Vw+gP6QclFoW2x46WF+iorffIqL5o4jLm1XJ37ChTUSIaQwTBOT3rDVdOVX9S20LsgC7QBKuzRBaHkqZVSoP5Tgb/kL5kWPcmSjOljmdjrgC5bNxtzaq72GR02fsst/+YBKxwn/auR1dNVyscaTDK6sn/fNphqdwfmzO0ur/7FsCru6yRhRsIVSo6WH80Yi2OiXdVH+VBU7W3S
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:55:26.9557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4adaac84-53af-4986-01c8-08de6e2c34a8
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF8176F5248

Set `phy-mode' on network switch CPU ports to eliminate a warning:

```
mv88e6085 gpio-0:00: OF node /mdio-gpio/switch@0/ports/port@4 of CPU port 4 lacks the required "phy-mode" property
```

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

