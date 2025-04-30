Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013008.outbound.protection.outlook.com [40.107.159.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED067248F45
	for <imx@lists.linux.dev>; Wed, 30 Apr 2025 09:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746006210; cv=fail; b=sxcSLbo3d23jSc7nTm0p0McnQ3aTo00d2pYltCZ80EFuY6JUUSUm88uUvsLaeKKHB/hmbSuLmX7SSLZkG6iduhVeAayu3exN8oBJL28PoHnCYE/T9MEL1cSOTstwyJkzDfhP7sCZX+0YMO0YwxcatYvRfGyDPCkumrq1wKybzyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746006210; c=relaxed/simple;
	bh=Ky5vlTRDolTc+BQnxaRi3Su1kItQNdlKiKfryVA7zUA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zi1VyZeReWSJP2PPzsEEM0Uy6psTnnq7pgQkZEooFkzIK1pAZFKqq1nFvUVRg9ONoggXjeC9oe1fkmXcp7JDzfLsZmXmTbqAnfCxVgKw67xGTVWNICBxrb4hXiOXpLCLzm4Ns3zpc2QToFHO615qjLP44iz2RKcPPL9XCVF8S0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EP3GpBsM; arc=fail smtp.client-ip=40.107.159.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EP3GpBsM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQOHxH6yPSaP3+Hz8ODE/BFOg0vWUCn57LXJYyJVL/UY+8MqXmeoeltmzJG5CHt0wBl/E7RCBNIeM9sb8V0gn5kG21u/oCsHWDgFW3xszvNctCeslQQTZcvKLW/KXXkXR/Q79rt35CqxWSTAobyIG40cvIsmaGN0wdQZKB/frcGJPHvu0/0x9ue/kSF99oqa0aNzADeOcRea9tSoEnEH5Xobzj3hCCCATSUxePtZpCha7X2oIdIFENCH/+yIkmckJUkw2LNrD4hGSaKbx6qz6i52cFhVHR/e7hoOSUEjnZf+3VVPg8/tQ0/HJ2mDhLHJFzIxQsJMATzX3s+EBzH0fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEwOlbILnZOZpZ5ezt+IXg26cvioW6A+yIXxPJUbdag=;
 b=QLpZkMLFLQO2Jt6NRTMbI1ZLNpnyqmOLwE+q13ARU1gE6wG7J3E6rrmhX62hn25a4spnfqeasijOfDPnaSaUjWjyQ2/1joTc9vT3CL4getpcphMYso1zL1jzUsgBll8xCTAnaqYq0sfI3/YIcQ/AiD72cRcU2B+52ste/N0vcHB5WgKZfg5HjWXTktDktCzBs9fYx0/nAXHvnwYrd0L8ncd47k149jghe53XdV54WHnJhfeqRQxPEGMmMaoLJ/OQ1pxjg0QfUjcfQd3bfGNmgdnRPPZiLzTOZJIy10hvXFTwn18E7bChZlt9lznhhraIfwdYI1cGCPmvvOT4zjUL9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEwOlbILnZOZpZ5ezt+IXg26cvioW6A+yIXxPJUbdag=;
 b=EP3GpBsMlja3XKpL60R0OGYUemHU/ArEk/9L66xELutpzqzPxGGVE7ponyGnHxH1ajIdh3+YK6JsdAbUm6yY33J+IA9PlygyTobk9GKoQow7eLOONrkmag8zqhxaLRiirx8qWj+icpkcxEUVaOrePt8SAW08TZkKXLiwR11xroiO018LMbcd/0txPLkjkYlgJ4aoagKgz7Oup1FCm36EjQMsMigbgpye+I0a2b7TWw4Hxl2W77QHzC6ob7DtHI+eZNv7vnRKv7sLWy+13pYWhp6BOqQb7nPnRTg8WMvYYCEju5zLkZ6aaXDJI2gtBsIsvphU+vgEbTmRpro5PZA6yA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VE1PR04MB7246.eurprd04.prod.outlook.com (2603:10a6:800:1ae::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.25; Wed, 30 Apr
 2025 09:43:24 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 09:43:24 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: jun.li@nxp.com,
	alexander.stein@ew.tq-group.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/4] phy: fsl-imx8mq-usb: add i.MX95 tuning support
Date: Wed, 30 Apr 2025 17:45:02 +0800
Message-Id: <20250430094502.2723983-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430094502.2723983-1-xu.yang_2@nxp.com>
References: <20250430094502.2723983-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:3:18::27) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VE1PR04MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: 74e02840-33bc-463a-2ab2-08dd87cb73bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PHRCwA/xTH6AXCwYuV1H2jlyNqqn8PDJ/aAsaB9OQGsw7TAxZpF3Eq0hr/Bt?=
 =?us-ascii?Q?2LUVkgLuvpw3DHK3J1hmlJ1MWC3a7XTe7FICEUZUt9AcA3PogMb/FO7XwofW?=
 =?us-ascii?Q?M2JjMlg+s8c3P3PG5v4nXuECSJfx9jDrJsKxv6Zo11GK1oWmy8x8NnnUGk80?=
 =?us-ascii?Q?XWSmFk3IsOMTYeNuHQ5x/FO+f7wydbk3/AdRO1kmZJOEoaAO3wle8fquz3ka?=
 =?us-ascii?Q?j5hB1WFbEcyPoug13mOKe970A3vu3QiKuiZ+7FzxyzUbvr8XQLxx+QJKycHM?=
 =?us-ascii?Q?5kv00kzHqBhS78msWaK13xfm/0n/mg8py1VGM7jbyZMS8fnOM5eQMjw45kVz?=
 =?us-ascii?Q?kgz6lnzWNnZ7t69O83YbKy/tKj9JQyA90dlz+Es3/aPxUykBDnwVpgwEOjxW?=
 =?us-ascii?Q?fMg/XE0CJC/afoQWL6IPC8yKUQDIqURg55/3vPLH5zODtIx3s8k1U9KKzGwF?=
 =?us-ascii?Q?YHDGuTLqW063Xg1wmrTpJ77g9/HHjeiHYUR8Z9nkdS6vxZl94dr7p85vqHx/?=
 =?us-ascii?Q?qzy/hWNKQbVoR44kB6tnUPdzM1VZIabsh1ExrSQi8FwmFTrLj7A8c0RFvIQN?=
 =?us-ascii?Q?BKnUqfek11DKpUWlfTIGNP6s58xuMNlIKWRiT3hhX+PL0tyYuCBqCd+PmGMW?=
 =?us-ascii?Q?f1kMuOd1/vcV8fOI5xlFR03aITAVnpevnWVN5xoPf1x07GFvlzahZas6BuER?=
 =?us-ascii?Q?/St8LFo+AHr6370sA5gPdTCPxCLdlXbKgZhpeN8nKX0LgXWonjUoFnDcTeuW?=
 =?us-ascii?Q?i8n+gfIjdC7qCmYIuWHPFN3ehmX4IomdnRqjO/5v0N5MwxoPDHhqO46uYJQd?=
 =?us-ascii?Q?lpHCC3FeR0YK51BF1JcQgpA6YgNnSz2LLIKyMuyXtRmoR8gq4qfRqstE1ka9?=
 =?us-ascii?Q?5N67HYjGkRDBWhECQdwCa4TYwHAxyiA6Dj6tp3Asssb+NusrUSrMXu1TX3ww?=
 =?us-ascii?Q?XxJoUCa0YeNki2niauTNLIJVtd0hOdcLFztBTuwmCIBfFhywO6z4ML96lIQA?=
 =?us-ascii?Q?lgM47HOpN0cB+/6+42M4hyexUYeyrz3HmtcozmzYAsMw1evjlknmKvMcDFmR?=
 =?us-ascii?Q?HIavO7VVJ2OEISh3j/xIzRCe4oNOR/mnbWhclWAMf1GKoWXHYhenoxhw3+RG?=
 =?us-ascii?Q?f2jdwt+wWBZmmccaPFgWVu9EhrCM2pTFXgCTTxd14Jog4YEg10cJ5yEcsu63?=
 =?us-ascii?Q?pY2fC6bgC3K+JvYyty5HftJ1V5cVk5n9mkNvQuK1XeD3bryEB0AEo8raCjQs?=
 =?us-ascii?Q?j7SZ5LEtunmD7ic5kJRqGrF5uiO8jd/ttm/m1ZyKDm5Xue2Zo5vlqn+r36hA?=
 =?us-ascii?Q?ByFxWppC3gUPN2Z091r4MBzP7a6V5S1c2jACrowtzBLpZts1qsXWEJ1JKwbk?=
 =?us-ascii?Q?GTs2Wp6dSp7XNAGfYWG7t87JRggAahFQMUxQy8X4oy9e+E7adxLA9UwMcnmw?=
 =?us-ascii?Q?zJx75NfTVk9zgjCz8be0qIRt/LMkCJt9lEL1pJEafkOE+leYqKx5tw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qE3I5ZYsMgmfJq3bd1RjKVCHDhFH2gUXUNHHLKzdmOPt0mi53ZXqgSz5VaWg?=
 =?us-ascii?Q?60YX6VtzaNx3wk76PqiKy7Z48/JDe3cqjGUbfqW+Gr5Uim4RpTWLWP6D6FQU?=
 =?us-ascii?Q?skwUB59dOhx2X9AofMaFzuAN0H2mCxd/9+ciE1z9iyy4/md9HKAjc4Yijm65?=
 =?us-ascii?Q?DI1sCfXrqxLclHCi8aJ1OJBv9g+Jdwul2clv5nwsU4SYxeOugG4KvBEMMz0K?=
 =?us-ascii?Q?9SplhLTLHu5GFWSfGC1Yc5tbAf7Xg5y53rmuZFWMz2iRN5gX5w3mTzZYc0GV?=
 =?us-ascii?Q?vGSErfStVGF3zQyTZRqAWUhs/JfKh8F9gAKwtOGmTX+IuzuC9R09GaaZB7+y?=
 =?us-ascii?Q?0fIeNh3uoBMRIhpCxyGaW+CbzgFPU4l+2S6DQGYlWMfN9TPp6YmXmQIeyjbR?=
 =?us-ascii?Q?RuoJ+o4sZ0dqZBTRab+TLWVGc0zIg4bYa70+9Oaqf3FeHf1Fm0obS0xnwhIg?=
 =?us-ascii?Q?rteGSafOpfeSOu12/N0JhET9GoviRAoUW/cAFWGEDkFS0T+8yphihqJ5GVck?=
 =?us-ascii?Q?4qd9AeDrEQeyHsuRWGUR+VkGGSSgOob+650YZGfIfxHd5u20PeAOcGrBSiEc?=
 =?us-ascii?Q?f1/pr+7dHLJUB0d0LwnzrYQouZ8in9ny/o5FtoyDO231TjH5F8SqafDEPBa3?=
 =?us-ascii?Q?ICX9ySUucyfzMPcvfJR3HyBpi2plFv2XKfOBTYsjZISOIuYBaAb/s6sNQo/2?=
 =?us-ascii?Q?78FvLK80bwMcK+BOABdjpLm16zppCFPpvDyGtuW4fxuYVkgs61H07ctMC0wW?=
 =?us-ascii?Q?6sgLhqOkU+2+NgTVkxxDZgUH7vqJJ93BCrnJT766vH4cbL1LGGE/BsWku05L?=
 =?us-ascii?Q?dZbubc7dVP0KRUnYTwnYt4Va5+gwnQHxKR6icLEZePYt+r/iABKk02mZsm1E?=
 =?us-ascii?Q?NA2biHiY9//uIelMtRdG2QGRj9Cihxs11uMzPoToV9TA1i1x0pK5nuDzqzyR?=
 =?us-ascii?Q?sWM8NaFG/SBqr32a/siss75G6VqHm8yvqRhhvWy27ZtQdAjxQH4l6GOcBQ4X?=
 =?us-ascii?Q?QsVLF2Wo5Thv5fosMrG1YBMvl6sFPSviA3k36vxqMgZUl+0friHn2YwqqusU?=
 =?us-ascii?Q?E9VOo6Z1+WXbgBjFdRN9NJ6mE7yWozh94z5UOuPfFmaJOZRy/Djyn/j9irFH?=
 =?us-ascii?Q?3dr+EiQ5KOXrCNjHB57jUZrLy+jhOhspUM8SjrnoB2K+ZU1cpCVMZF8GhJiF?=
 =?us-ascii?Q?bKYyygaPKQq06JMTSRPAmSPSuA0vMrRDn9z83+R4/4Fj0kV2nLV6MCOny83u?=
 =?us-ascii?Q?Vm9QB7VQrRBPURKyBpdfZYWayQ0t6+u2+k1M5OkRwtvY5mQEEvCJeQKxYl2z?=
 =?us-ascii?Q?3+JSEps+I6O41pzGQIg3+C+zcJx+ov10JsOPDukxQs2Y7tASLrJvm5MJDR1r?=
 =?us-ascii?Q?SCR0fl0Q94yc102cMITxIkukliF+DBHeHOQbRr0LKm0QgMVx/Tszur/lKsyu?=
 =?us-ascii?Q?C5jT+AnmSQ0M7SfVUk+vFbBHKprZ11mBAYeHR/ZvExNTvbqAo2rhiaE65AUA?=
 =?us-ascii?Q?aKFVK85ClO9FFjLtDbD1K1ZqOgLCamz14xvyWIuFYmRfYXUy4hXohC5A2efa?=
 =?us-ascii?Q?WA/CyTngytwVrkJSqwaDA7r+tArpmA9O49/TIIh2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e02840-33bc-463a-2ab2-08dd87cb73bd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 09:43:24.8061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkca9+7qu0fnmHrN+odeJpLGfeyJBzr23ZtDX5gKz3fiuey34KF12AIUEOOnrP6Uo7xDWko8nlVzC66mfpBMsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7246

The i.MX8MP and i.MX95 USB3 PHY have different tuning parameter for same
tuning field, this will add i.MX95 tuning support.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - not use negative number
 - follow the scope of dtbindings
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 9598a8073991..b94f242420fc 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -293,6 +293,28 @@ static u32 phy_tx_vref_tune_from_property(u32 percent)
 	return DIV_ROUND_CLOSEST(percent - 94U, 2);
 }
 
+static u32 imx95_phy_tx_vref_tune_from_property(u32 percent)
+{
+	percent = clamp(percent, 90U, 108U);
+
+	switch (percent) {
+	case 90 ... 91:
+		percent = 0;
+		break;
+	case 92 ... 96:
+		percent -= 91;
+		break;
+	case 97 ... 104:
+		percent -= 92;
+		break;
+	case 105 ... 108:
+		percent -= 93;
+		break;
+	}
+
+	return percent;
+}
+
 static u32 phy_tx_rise_tune_from_property(u32 percent)
 {
 	switch (percent) {
@@ -307,6 +329,22 @@ static u32 phy_tx_rise_tune_from_property(u32 percent)
 	}
 }
 
+static u32 imx95_phy_tx_rise_tune_from_property(u32 percent)
+{
+	percent = clamp(percent, 90U, 120U);
+
+	switch (percent) {
+	case 90 ... 99:
+		return 3;
+	case 101 ... 115:
+		return 1;
+	case 116 ... 120:
+		return 0;
+	default:
+		return 2;
+	}
+}
+
 static u32 phy_tx_preemp_amp_tune_from_property(u32 microamp)
 {
 	microamp = min(microamp, 1800U);
@@ -352,6 +390,29 @@ static u32 phy_comp_dis_tune_from_property(u32 percent)
 		return 7;
 	}
 }
+
+static u32 imx95_phy_comp_dis_tune_from_property(u32 percent)
+{
+	percent = clamp(percent, 94, 104);
+
+	switch (percent) {
+	case 94 ... 95:
+		percent = 0;
+		break;
+	case 96 ... 98:
+		percent -= 95;
+		break;
+	case 99 ... 102:
+		percent -= 96;
+		break;
+	case 103 ... 104:
+		percent -= 97;
+		break;
+	}
+
+	return percent;
+}
+
 static u32 phy_pcs_tx_swing_full_from_property(u32 percent)
 {
 	percent = min(percent, 100U);
@@ -362,10 +423,17 @@ static u32 phy_pcs_tx_swing_full_from_property(u32 percent)
 static void imx8m_get_phy_tuning_data(struct imx8mq_usb_phy *imx_phy)
 {
 	struct device *dev = imx_phy->phy->dev.parent;
+	bool is_imx95 = false;
+
+	if (device_is_compatible(dev, "fsl,imx95-usb-phy"))
+		is_imx95 = true;
 
 	if (device_property_read_u32(dev, "fsl,phy-tx-vref-tune-percent",
 				     &imx_phy->tx_vref_tune))
 		imx_phy->tx_vref_tune = PHY_TUNE_DEFAULT;
+	else if (is_imx95)
+		imx_phy->tx_vref_tune =
+			imx95_phy_tx_vref_tune_from_property(imx_phy->tx_vref_tune);
 	else
 		imx_phy->tx_vref_tune =
 			phy_tx_vref_tune_from_property(imx_phy->tx_vref_tune);
@@ -373,6 +441,9 @@ static void imx8m_get_phy_tuning_data(struct imx8mq_usb_phy *imx_phy)
 	if (device_property_read_u32(dev, "fsl,phy-tx-rise-tune-percent",
 				     &imx_phy->tx_rise_tune))
 		imx_phy->tx_rise_tune = PHY_TUNE_DEFAULT;
+	else if (is_imx95)
+		imx_phy->tx_rise_tune =
+			imx95_phy_tx_rise_tune_from_property(imx_phy->tx_rise_tune);
 	else
 		imx_phy->tx_rise_tune =
 			phy_tx_rise_tune_from_property(imx_phy->tx_rise_tune);
@@ -394,6 +465,9 @@ static void imx8m_get_phy_tuning_data(struct imx8mq_usb_phy *imx_phy)
 	if (device_property_read_u32(dev, "fsl,phy-comp-dis-tune-percent",
 				     &imx_phy->comp_dis_tune))
 		imx_phy->comp_dis_tune = PHY_TUNE_DEFAULT;
+	else if (is_imx95)
+		imx_phy->comp_dis_tune =
+			imx95_phy_comp_dis_tune_from_property(imx_phy->comp_dis_tune);
 	else
 		imx_phy->comp_dis_tune =
 			phy_comp_dis_tune_from_property(imx_phy->comp_dis_tune);
-- 
2.34.1

