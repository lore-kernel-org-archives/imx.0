Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011028.outbound.protection.outlook.com [40.107.130.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F345E31E842
	for <imx@lists.linux.dev>; Fri, 19 Jun 2026 07:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781854095; cv=fail; b=DIQUJ+VZSjICf4oP9R9Q1BwastIdR5zqCYzIlmDpgfZnOlXgT7f2G56fllJ8rG4mAMNCtMz/MiTpFptjC6wLJYyHE5k8CuNKtiqm4HEy+8JcQY6CXfKtX2Pp2NfylBRMV2lpeXZx1m527g67N99vL49PAclfBFxNq56kuTqMZdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781854095; c=relaxed/simple;
	bh=nYzw00xM2mnenenm/nAQPMhhqybIvmAgq/3uFF4sJNg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=kVmy0dVwvpkuw6V0HI+ttea+hTdXX7RHhOcpL7l7kNjxqIZkMpwBSE5oF67YvNEvmRxqYneUz8qChRYULXIZifao2Y5mJt43HrIq1dJEuZe/HooEomssPvyotX1Meq/zLUw86UoswKMWbckRfVQOVNVuMcTxlPrK7k/keNpe9pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Nq16t+i0; arc=fail smtp.client-ip=40.107.130.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Nq16t+i0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdEsyuZwJlD9QmPQf3lHvswmVwhp1ybP29vCyAbUDy5OpTkpVjmj6osaYJK/CICcgOLw8bKbfiUsL3SZxlSSSwkgICIJgE11o9o+uexqkH116K79dpmpHKTL51aSZtvluWBkEKs0aiyOM5jsIj/39kOCeauM2IGBykXJG0D9jWgZkGckjAtxsOaHT46u0a3DZDww6grfyK+ssgx8zWaHTVPWz4GhgAYGeQvJ/qyHchziTGe5R3wFYIb11WxCEcDvASB4j140LxjVt1BXVzLVGU5WKx6V79tgF4MbQ6QfMLk6X89bwE4a+I4WXpdpGaG9gfJjRQf6x+JP85qKp7l96Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Lh1vx6CwxHEWKOL8OOYYIYmlHXNX9icE+Eml25JuhM=;
 b=kv/dCyhjB605eGKyWeyt0hR1IQcgy5pkOxfijRSZtktZQv0f8Vf4MOCrEs+XDvn4nu93FAKwwajOBdtNZ89OSUvqoBZOjGA2tJ6+QccYpZuddOql0Jx9Ru6zma8Acx9lm23bs6OI2cSDas+fWMVm6vCiQJOIRyub4lSAzGrRQ0l71Yiw23tlTrYrB/JUBq4XSD2p4ZFMkCAtqChbmHQ1Ra9jwOXAoEPtbLo6JEWM6fJfMVTUCXCxaghf+hllFqA1mkXn3fXqkCOJ1KwfeHFT0MCHXTzNqX3uVisDng2zFEBX3vFbxD/hG8ZCBHJsJuU+pNhMds1eG0W1/KNJlA5rhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Lh1vx6CwxHEWKOL8OOYYIYmlHXNX9icE+Eml25JuhM=;
 b=Nq16t+i0LpDSjFn5utMA8uykNhNGztJs6io5Pm7C0H8tcGp8IUT+3Z2rCjds+RJFWLKaBRt3Kl43a4M3cyrWJiNbktT+AUE2NqfeqkKnE1fFcueOh7w7PKQ77u/NezEak5wxLR4kk6/UDylbBSiWP/5zbh64IkeXgZA/eiH9cG1cNuHhfr6hiZFcb3LizKMia9scLu2THnSuK5su7qpIsS1sVSYlo+I40sEQMjbW6Qrzo9oeiuw4yWXTvuM/qKChf0Aqt2cuCAYY3W53/cgUmZdWaGzTCxeV3OW6FdYkpcBjQe5pJ1x1x6RPLVRDmCltgvOAJFP3RTU9rbzGMsixJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB9738.eurprd04.prod.outlook.com (2603:10a6:800:1dc::10)
 by DB8PR04MB7193.eurprd04.prod.outlook.com (2603:10a6:10:121::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 07:28:08 +0000
Received: from VI1PR04MB9738.eurprd04.prod.outlook.com
 ([fe80::33e2:39d5:e3f4:580c]) by VI1PR04MB9738.eurprd04.prod.outlook.com
 ([fe80::33e2:39d5:e3f4:580c%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:28:08 +0000
From: robby.cai@oss.nxp.com
To: p.zabel@pengutronix.de,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: krzk+dt@kernel.org,
	andrew.smirnov@gmail.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	aisheng.dong@nxp.com,
	guoniu.zhou@nxp.com
Subject: [PATCH v3 1/1] reset: imx7: Correct polarity of MIPI CSI resets on i.MX8MQ
Date: Fri, 19 Jun 2026 15:31:15 +0800
Message-Id: <20260619073115.3778313-1-robby.cai@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0233.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::14) To VI1PR04MB9738.eurprd04.prod.outlook.com
 (2603:10a6:800:1dc::10)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB9738:EE_|DB8PR04MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: 297b1b0f-5176-4cc9-157e-08decdd44f80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|23010399003|1800799024|18002099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	4m8+AP+qrA3zqtkeRMHZnjTp5xwxJH8VJgvbXft7sQoadUHIt29l+OuJSRXt+g0vpnu4u8WGjfUDDXpJDABek6ASCRBeqdNN4DCc64TUTJJ8VZjbI1aDATQK0x/LsDgvPNfpilgAVoAFaMgCIqydT1j9ssLCWOs+WtQuseGoYbmMEgj3JXVHfyx9NW9SKxQy+r60UAy8vuK34KFHstdDswM9tRkS3muKMK3UkTOotmpFoX45qaWb7/hpW1sgqinWWIHHFiWWYK8zQEQYjabjQGLhKSn0nJVy0Qo/sAVg1hcLtM8YYRjsbw1H54FK2g2RZXGFYCAupSSxRQmh3sQt/onHd0KtP93oeZ/tR+S81jpd4q7aQF2CALBf+HxQ4Rrp02SWuTpqSgfYGo5bEu1UMC7RzXBBrFRMug9UVsVJ8b5NAj+ykRtdVs3YIi6d9hmco5Ishn8uBJzLFtEzqvS+YS7Nefl4tzlH5fnSHzGO9GY9UmCGGo0GqKsljUAR12iQ06AwF7JoYQ3VG53mLlInS+SRw+S9IfDRotl0kwPz2KmwGPRcg5gCyV0DoKkzqjUkPbupP81KdKlkRCjCU/JBjAmmKb6+6o16f+Gc7k9r7LYbyIFjoVYlUyGh9vr8nr4qHF6bP/KAlOllPgwUVhZCTv5Qvfic8uyqullW7pivu+U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB9738.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(23010399003)(1800799024)(18002099003)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZVc6kgWXMZ2XW7umeIIxrGIVmbciiZH1QIG8IVzBfp1adkAhqeDnwUZI0Jkn?=
 =?us-ascii?Q?MeU2h4KWhZfGMkmN4RmSKtKjexT4EfO/owej6J3XE5ql5c37zKubVIMwViI3?=
 =?us-ascii?Q?FJgFVICHMc+2566tYMjxHL2Qtrdx/pxsmYe1hTenkOnE9J/H8JIWxLDLWHli?=
 =?us-ascii?Q?omxc0ytQQV7qRKCUjcZHahx6sXLanaDCsCIDdkOfRFCVhknVV7nvfFus3h44?=
 =?us-ascii?Q?7578E+uztpizd0AhYiQVeS9UIUrg/doKOQZLQbuJXNO4yJyGxm9sRmKeC1Ax?=
 =?us-ascii?Q?oK1Syya/G8yUyuvLNtvkgEPWYLI2IXgd2/zV3MsycJU+8aEyOoYtNQoFHOjK?=
 =?us-ascii?Q?cX/yvQua3+ShSoChp3233mnRtPqagD3+PRwhIyQ5Sd6Kv5mD9II2/hjTt4WQ?=
 =?us-ascii?Q?yZYtvZJKLsHca360nTsyfswZRFFs1cqH4o46mPTVxahUINH5o/PTccF0c5yD?=
 =?us-ascii?Q?KxxYGEg1pNQxsVI6FnIhuy1Z+1aZKY3m60U0NvSvcYcg8+WxzQkhSLYuTQpb?=
 =?us-ascii?Q?6hJBJ4cqMXK77WFFPUMYuHc5Vd+WbaMamCtql899LgdGAhPOmZvS0BDuwh7C?=
 =?us-ascii?Q?0Ip+LU1kSLuQeTXs/6IaVoiwxfMZuxBwUeexxFSG2Gjg05jF7KPWLdwwBGUy?=
 =?us-ascii?Q?cVeTHHvKtgzevASqIleCOWJX7GsS094wBmxbhyM2jEfyso5Hbs/ctj5yUBTI?=
 =?us-ascii?Q?crKFFN7s/RicZ8upzRRuFKdAAly52h7IcvAD9wlVa77fgIkd/AU8lWcMfY8m?=
 =?us-ascii?Q?C+NR6hPyCs9ObDOB+FAIOcq+8KVaOCKpUNZ34W6C/oH7dj+4sJg3qzgf7w+P?=
 =?us-ascii?Q?A6kDx1dKiDRcwCsmqYbH3N67bU63CBZ0XnzmY7K+WruC7PRW+ciuM9/s5hrO?=
 =?us-ascii?Q?zngxiNsnBHGuapFEr5sXhC6ckHkRxdJZHVJ++O4bvx9sm77pOeV8bzCC1LdV?=
 =?us-ascii?Q?C5TNXMsAawN7oLdLz6BQWquLyUVbsQPF08wTZ5USEjpj1ii/I+PNREsQWXE6?=
 =?us-ascii?Q?tuVd+tgf6uvEb5w3zoWExyXJ6YyVmOQcNzUZdJ1R0ERsDkejvTUVQ0R/2msf?=
 =?us-ascii?Q?KmGNxhGWFJc1v1q/GDuWUWdjcOgdwypZumPhOIDAfkh31NhY1qdPqWILeVXQ?=
 =?us-ascii?Q?nVfUF41C1Q9zXphPJmyfh0iJ8/KzW5m14s4FMPnwMD7bozfqWug9jqO4hoN4?=
 =?us-ascii?Q?pnBxXKiqW8mbxTnqPj1mkFb3q0k8y2MYOQgpwCtmFVVC/tqvf1213I6Puupe?=
 =?us-ascii?Q?PzRS0jF7DNhw4W23EQsZib4Qgso239IzkF2QBAZb+wCfU6Y+YAjTSmxJPboF?=
 =?us-ascii?Q?0belVzu96LCon/3M8m+2HGusjtB7MDtpNKo9U0ndGPez9HtVSq/zxYcTIIDx?=
 =?us-ascii?Q?d19XYgX0BJCMf3unMxrqMnnvXfVdwkd51BVrVWKMBS2sm0GakPcPN6ITE8O0?=
 =?us-ascii?Q?6dtRi7F/uCviT9XXCMzTFQUsjVMh5hQj/w2mUHXbBWWMz6m9HIlBvGh/GlkC?=
 =?us-ascii?Q?1yIQLWLWwzt/OCuBVZPNs69vE/lWAg5s7DhM93+JLRCWmpIaTIu20y9MQ1MJ?=
 =?us-ascii?Q?bN6A464rmNxupKAk1llEpQxLVo0XFmxELsMg6osHNOT0jbcByAwVE7DPJw3Y?=
 =?us-ascii?Q?x8fs3CjysVQogvu4MhIoMphsBR6jQa7Abty82wAfN3LDrlAit5Iz8GshNUbv?=
 =?us-ascii?Q?1VT/zWOGY/AU/DV2ybFbR/VxCpf3CV8QDwlYqWxwf/7eLuXrMtIMessk4OI2?=
 =?us-ascii?Q?BvbOzlUrICYW/x1l8upbCP9DvN7s0w2OQ5KPrlYAI4oVyDmUJMQ8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 297b1b0f-5176-4cc9-157e-08decdd44f80
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB9738.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:28:08.7739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qALc5ET2XntnsLnJmwMfTSjC9iEIyk7iXIs7RRfIsybyRW3F/LXgCu3Gi/RDzd9C4ao0WD6QzcF6v62lSREP1amFvIvwffupqY21qLVZ7P3+LWWcjWTFYOQKniR7zfZA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7193

From: Robby Cai <robby.cai@nxp.com>

On i.MX8MQ, the MIPI CSI reset lines are active-low and not self-clearing.
Writing '0' asserts reset and it remains asserted until explicitly
deasserted by software.

This driver previously treated the MIPI CSI reset signals as active-high,
which led to incorrect reset assert/deassert sequencing. This issue was
exposed by commit 6d79bb8fd2aa ("media: imx8mq-mipi-csi2: Explicitly
release reset").

Fix this by reflecting the correct reset polarity and ensuring proper
reset handling.

Fixes: c979dbf59987 ("reset: imx7: Add support for i.MX8MQ IP block variant")
Cc: <stable@vger.kernel.org> # 6d79bb8fd2aa: media: imx8mq-mipi-csi2: Explicitly release reset
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Robby Cai <robby.cai@nxp.com>

---

Changes in v3:
 - Add Cc tag as suggested by Philipp Zabel
 - Add R-b tag from Philipp Zabel

Link to v2: https://lore.kernel.org/imx/20260417080851.489303-1-robby.cai@nxp.com/

Changes in v2:
 - Drop the naming change in response to feedback from Krzysztof Kozlowski
 - Refine the patch subject and commit message

Link to v1: https://lore.kernel.org/imx/20260331101331.1405588-1-robby.cai@nxp.com/

---
 drivers/reset/reset-imx7.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/reset/reset-imx7.c b/drivers/reset/reset-imx7.c
index dd01fe11c5cb..a3cb8244d76a 100644
--- a/drivers/reset/reset-imx7.c
+++ b/drivers/reset/reset-imx7.c
@@ -236,6 +236,12 @@ static int imx8mq_reset_set(struct reset_controller_dev *rcdev,
 
 	case IMX8MQ_RESET_PCIE_CTRL_APPS_EN:
 	case IMX8MQ_RESET_PCIE2_CTRL_APPS_EN:
+	case IMX8MQ_RESET_MIPI_CSI1_CORE_RESET:
+	case IMX8MQ_RESET_MIPI_CSI1_PHY_REF_RESET:
+	case IMX8MQ_RESET_MIPI_CSI1_ESC_RESET:
+	case IMX8MQ_RESET_MIPI_CSI2_CORE_RESET:
+	case IMX8MQ_RESET_MIPI_CSI2_PHY_REF_RESET:
+	case IMX8MQ_RESET_MIPI_CSI2_ESC_RESET:
 	case IMX8MQ_RESET_MIPI_DSI_PCLK_RESET_N:
 	case IMX8MQ_RESET_MIPI_DSI_ESC_RESET_N:
 	case IMX8MQ_RESET_MIPI_DSI_DPI_RESET_N:
-- 
2.50.1

