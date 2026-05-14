Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011059.outbound.protection.outlook.com [52.101.65.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31D53D88EF
	for <imx@lists.linux.dev>; Thu, 14 May 2026 09:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778749482; cv=fail; b=dRwX/Rb7EiVX4KDX6Wy0yx+HLBP9Naj3vEAs1hy+aDDPczb52caNK6l4koT9bKJ6zp0XulA6nyLRXOtHrPOPnUnP0A9rvcQSHXTm27qzpWIpCwd1iFF2iBVASF/7PCe3nTqqEKKhSZ5ZKiRsrwWfsfrHH0gfmuvmT2WEdm/wGuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778749482; c=relaxed/simple;
	bh=k/+60JQrIgL/qeLQPSZeLqBrHBTgJp3fa12jM4+dPH4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Zta7nsAP53KRLOtTBQSJDWzCfInHdYQWv0Diyw74cevJr8sxY4CnxgskLn6vOzOTrV/SIBFNiVwtQRm9wCCqnFOC7oKuY9+vy4m9zh/RmcR1JwAMFx0lRFVA23d9pAv2nsSaG2p3CQGWe6qHMNX4L2exS4ffiO0fN8Cl/u2SpQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=luG0J7yX; arc=fail smtp.client-ip=52.101.65.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="luG0J7yX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AwllqzuRN7Xg3i4cRdQQuderrL6jMWsDUdkknYjZR6M+M5BBVJf0PDSr4i4nsJEiBkTNiP+Fjy0wISMUeWrlbMUatqxSGztY1qc+y/MCZTNE6MwuOz8xX+eu2Gayo6W54OQA6Jj1g8xN1ZhaWJN3gZQQr5A4cbfzwMUmLmhk9e5K3jPXiLPdQumE++FrisBn7gCbjdEuwqGnork9koOGDxjTFn7nXttdNTGZEcoZVRu/99UNxpp2P/WwayqqJVSoVGklTkspDUrRVyTDpPphn0QVr4cvC0b7ZV8JLJDn+SfwMHALFcMiJgGoI9L0/jZSus4GxwUDtFVSIobJPMQDqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jtlNZMJIjdI8p1KAiZR4tyUlqHbZqLgclYiJGwaq0g=;
 b=EMbAjbEzTVntGxSqykH02cN84R+MBMx/FxOMN9AAf0MbQjmE/BTt2XSKOtawzVUA35r93hu7ABZMxPtutbusot2hbC4zrCLNrsgjXtpmm31HpWp5L8SSF/kM6Fx3I4ZtxItv/jLaVWmMSiYPfB3T1ha5CpNXCX/AU/C12RKZ3oHqcbdMTBHWiBzrZoMQSk+GuUvKRN3ESFiFUdudiN3fKdGXq6pjxM7codMsJbHm90wPXqu+WeO6+j7E+Oio3S/tpGIyZd2Ppj773B8W0weAC0ioihbDaBQ3wyI00ny5GX2K3Co//z+4QXQq00sIeH5wU4qvH/4+stlvzVOBubw40w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jtlNZMJIjdI8p1KAiZR4tyUlqHbZqLgclYiJGwaq0g=;
 b=luG0J7yXpi0xAkZ0dfyV3OB9oCmVBjX988VrP9s+0RZBdTsksQN1j0EBXsL0/4e9Xw3ieh2lxYEpXTw+gfxmxKDGOWOvywQx89MrqvHMDyGgDwphPGicyfN1CN21F9ZqRardB5TzUILDY9YMuVKF2a2DixL/ZGWh5fjMyhCvpYZJQVHn7Lh/B7PUMMqSN5O9sdtBIdor2RTty1mvxZPJI3i4N981tnylk9HpIYQBPVYXsEDUaHKg9y53+gT8NNSC28NIyq70tCa5QVbs1cKEVF9KV3VVpcHUpZKJsFFpq7X5HInHW0Bxsk3sogk7NDTSU+ZvzHV9f07yErFZh82oBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by VI0PR04MB10173.eurprd04.prod.outlook.com (2603:10a6:800:245::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 09:04:37 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%2]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 09:04:37 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: linux-kernel@vger.kernel.org
Cc: frank.li@nxp.com,
	imx@lists.linux.dev,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH -next] firmware: imx: secure-enclave: drop invalid overflow check in iobuf setup
Date: Thu, 14 May 2026 14:33:21 +0530
Message-ID: <20260514090321.2186877-1-pankaj.gupta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::16) To GV2PR04MB12271.eurprd04.prod.outlook.com
 (2603:10a6:150:32a::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12271:EE_|VI0PR04MB10173:EE_
X-MS-Office365-Filtering-Correlation-Id: ec00d009-1cac-4fed-a961-08deb197d2cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|19092799006|38350700014|11063799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	WXDsHQlUdUKLS6QhaCSJ1zDyDB6G2AisGUoF/pnkmxPOBcz+pet/8958qWXoP9FZyKQsLk7ZmQnAKj1apWAlsMZ40IIQeFd52wCt9EOzTHYtn+7zDK6gYDeTRgTNc3M5vckkk48TYqB/iyo7vtM2fKNIjMKUYefzaSiE+GkawyrTAdU1Fk4KTtS4J45NTF5MXLc2KqYl/SxHcl5ojQe+uMICnncU6g7JOqcHQQ/BnIT9/1up30sDIeekTJxs+YkGcWliHtHnrRObfJGV8N/AQ2G4ssnLZnN3ylxLY5n9p3sHecMEDQgokEmKmZtx7pADZm0zq+rbIlDug8VEEtTpCFGXjeVBAD0wREOXwLIOLng0uu1wCfKHFTns1VmVWbnHN6g172+sAqrbJc/vdb+GVUhabqE86TDyId15FEwoH1BGEQk0OyKho5VSKCBd64PWNKdugCNgEyHX9lFtBteDcZRxvnIkS5nUwyg8BTA4T2/wwiBQAVOtkTsCIbyRd04kYjYcY4SbkawGWdyyFFIqvEe9XTHFbVTGUO0Eq8jnrVqPGsad0+AcnnefXx6cMXntNRU8WrlR1Bo0wtogx50S0kZwIHHS81+AEs6gqe0PHFPPaa4lkgLt5QUUP0hs4iBnkHT52NfzeQE57oIAPd2E7hIqMW96MJyL9dfwVrhRvluD5QjOMNqjIjukZoxUTSzStyfFWyECnsiLf4Gm1PHGJMwP98KanRE6wxEuHltzEkPbnNBKv4nq959DVFZszpFB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(19092799006)(38350700014)(11063799003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JfRw1YkIdwAlRSg2UyD7Y6IcSqdSfEbyGCcLdxUq7vroCWqlNCRFJv67JGEh?=
 =?us-ascii?Q?hqnlMOHpUTkuypRckRgMdmvib59USEQwAnetEV4xs7MVvKWUYY5QnawO6mSJ?=
 =?us-ascii?Q?3Jl8w8Be7ZeVk/20S2dA8zYH3kVrE2tewuiUu1XmuSIAMMtzXDq23ctbIoeO?=
 =?us-ascii?Q?W+MEe16j126B9XV9gjp+8DnY/g5l94STfl6pUSkyGCrlEon4otg3FXeug5L9?=
 =?us-ascii?Q?wFahznexo4VIqoaPyJLawvzvvSQjsu4f/jAlbsiY85EmOWOjIE6Od8EID0rn?=
 =?us-ascii?Q?3bJSXt0ra0A5WlyLUv9hGqRmVBboVgrT8H7QSQq3Sha4+qduplanVTeKeDv0?=
 =?us-ascii?Q?ylxyIIyu8M/jZJ77iWGEMNtIoJopvMLbHQH0M+o2jDkfoMC9oj+6sAB7MVHc?=
 =?us-ascii?Q?vvbw0SGMITMrraXN3TJzXSy03m3vniWUi84PjGz75QxPNhALOQeKzItca2u2?=
 =?us-ascii?Q?+I5J7U06sidCnbzsUoLvLRfMBhSFi2j+C7bLkewRgTx9TtaLKzOaz8kYlRk5?=
 =?us-ascii?Q?t5DcK0mXkNMur3CK0Wl5LHAtzYt5CMtCkM0tdRaFAw1J/4esGMyG0s41eedm?=
 =?us-ascii?Q?hUIi7mnOy1OCJWmQ52M42TFTlTaYitOO3NGd3KE0Kjvd5NLrxoqUBXoL/efM?=
 =?us-ascii?Q?LzLOIfOOg2lVuAD0yrTqbXYUVNPRAWj8ySL/A1Ulak6VDM2rarz5UJ97Dt+s?=
 =?us-ascii?Q?vTyZk64s+H5T4i+abvkkrBUJs05Rv7JzPBfPQR9h92VP3v9C7cbGMQj0wV+/?=
 =?us-ascii?Q?MiaULeDnV5lSE7qhaFmLpbsbx4zJjr+nin02ay0U1xh0IiGsyjJCKwyHMKSx?=
 =?us-ascii?Q?ifZOUy8XDHg8nVHaCLZVg9nQPRCecXKuI3R/Q90fP0n8pK4OsmXjqdZEjX7k?=
 =?us-ascii?Q?i41bOIK5TvZEEMiCNGxelLIlxnAXUbRVjy5dpgshg+BDnb52tiiNI7zaTBoH?=
 =?us-ascii?Q?Mkc4M63HV583i47K7SRfvbLMO5Yjaq1iBMa3/ODbUYH4IJtN0qCOnfHhKD2F?=
 =?us-ascii?Q?LS0m6LcLOfIIttWGWXnupniTn2MLjcmuNFGTp3M0Y6vTrToWdHfdUqEWzMmX?=
 =?us-ascii?Q?zfWaWFvsUKdLWCtUz79XNMdOyNSK0r8XMuaK8m1cINOHCC8e2YwxLOwqt/le?=
 =?us-ascii?Q?qhHMDu0OCSDAm8r8fI0tB6xLKSh2w3QF0wtW1kuVS+1JkeZ9QRmqk95I5rNA?=
 =?us-ascii?Q?kVAH+kMq81aCEjvlbyqlZyIY+OaONVEbgLG2hofUPDGI6pY1tpGp3l5/rDiU?=
 =?us-ascii?Q?ov9BCNb0aZ42OJn0RU/R/gRWpBfCh5Wn8rAUEDLeTxmVf/HeSh6E2dPfpeMq?=
 =?us-ascii?Q?Y1yreLkIcR7FEZtMuN7EONqxR4MSQricrMMT+BmkdcmudaAG4ghMWLF0U9ub?=
 =?us-ascii?Q?2SnAx2w7cviDUJB7UIPUgkm3ttrsBzEujEEUC/6gFH70RcYKsWWg5BLp5OBL?=
 =?us-ascii?Q?cDGyyxfGtmoDJ7SEOM+uEjqou9KtIslKFZgF0ncdWzkZVqZBN58O6k2DED5O?=
 =?us-ascii?Q?w0CfKFCmmkq0ClI3sp8DPHXgbsMI+l55h5aRgwl/Jf6/WlZTqoMpBgF1vT5d?=
 =?us-ascii?Q?U+rC1lOrtxBxUzvqqwPbbSo9hNuSatfr6gvSAvKhMXTRVW3OTZr+jh0fspUC?=
 =?us-ascii?Q?C5CVdcsxnZCtkVliZdvCWLS/P7tagFX1NQiiyiiDmV6Vt+kMYmF8liuNnDi1?=
 =?us-ascii?Q?g2WF5yjnHvqFCo8GA6RH746IyApHCSysMRx+c0tKbqL1lZHTvGP9YHnlZfy7?=
 =?us-ascii?Q?uYrYeP/hbw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec00d009-1cac-4fed-a961-08deb197d2cb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 09:04:37.1074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvqkQ+1vXoTq1RnwJftENuAgjw41yLjdXwl95f8XshhJ1QV1Bp1etnS5GwIi7/S7tkDCCASQf3ewlTSSTaEa5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10173

io.length is a 32-bit value, so comparing it against SIZE_MAX is
tautological and always false on 64-bit systems. Clang flags this as
a constant out-of-range comparison.

Remove the invalid check and rely on size_t-based alignment and the
existing shared memory bounds validation.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605081441.lIHK75ug-lkp@intel.com/
Fixes: 890e531b38f89 ("firmware: drivers: imx: adds miscdev")
Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 drivers/firmware/imx/se_ctrl.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index f88e581fc147..1683b259864f 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -670,11 +670,6 @@ static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
 		goto copy;
 	}
 
-	if (io.length > SIZE_MAX - 7) {
-		dev_err(dev_ctx->priv->dev, "%s: Invalid buffer length.",
-			dev_ctx->devname);
-		return -EINVAL;
-	}
 	aligned_len = round_up((size_t)io.length, 8);
 
 	/* No specific requirement for this buffer. */
-- 
2.43.0

