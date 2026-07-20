Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011061.outbound.protection.outlook.com [52.101.70.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF2D2F28EA
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 09:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784539080; cv=fail; b=lXcbU21GaC04voo2kOrZ9l38AoYIINBC+T2hxxhi5SIJClHbFATk+aEtVpw5rK4QXy+IXts+T2RrRKCpuHPMdYrtBQt/dUz72zQvVlPyk8FmNo2hh2geyyPrejvPKrp1QW8uedK2CxmWHl9uCkDM2x1E8KCFYkUVd9apQo4HzoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784539080; c=relaxed/simple;
	bh=BWZwvRpV9ZpE0BqOvetm+zvES6GyEoR0cTqNS6czxcc=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=MaG2dj185aHdDwpXaynB44pTVZkizu5c7SmLHtM1n6kM/1cT8p+lH1+Oj+pmtafRTsozwwIXPjjwvhY52YZttz7JKIYX/n0mpyMDf20GvckasPKySrq/TXw816CKCcgU4+jatwcoBq4Q7cuUFoRpcQkQFOR7PuFhjg5AMub9hBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ej2SIC5X; arc=fail smtp.client-ip=52.101.70.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ej2SIC5X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yd/3VV/mDhleYaams7kr5i3E/hhKuQt8PykGjrDUcjveIrWq7n7yYdpXE793mTS5JICNsR6qlBV76dJmtciZ2dECOTnY4cOnvJXG+NpfAAnhjbNyf9697g4CNjKskaBqEcqAr6O8CQ6GBlgFWSuXEQbW9cyEG7L7w0vKpyg9xLw/tIjHv4Pv35RX6pdWEQe60+OIrPTra6iOLlnpzPKXVFUUhzzwb9teccyWjqjSqGs0+2WpHN1NqodW69KWhnlAgs72+LTITDofks4OkDLrSHE1Le4alTMWN00C4uEf8H6i9ETZjTKIWrFzSJJ6+hDfiQMscAIhWZgBenwpNUUwMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D67ER+pEZjUXHwoT9q7g1nZ2VURsBvo64qDpb9IAj5k=;
 b=Ipymo92D53pXA2y952pOTwpLsYKPXCLq8+pkDYYI5ZJbjI/Wr95NRI741bW64cCweOPIT22uACkiFU9ARSHPUyoCOj0h2mhQ/YPywx510SVsDCfxFvX+gbOxHe0+pLD2+4e6TdE/MiPUov9nG3YSNO+NQsVngecncAht7XMdcrIfDWRSRlQple/xm7L0GL1NJ4/+WbXSUXLrkAC4E0TOvZPVCAVMPqnEfA8Pq0JJvqAAk2YOQ/+ZBE9+JWJTroKm38hOEYP5yGG8phpvAyRT5HxPkm9HCdgcU2LxbTJv/oA64Z2/fplA5HWBhPOizjgUzZ7C7HMV2a5jxXkiB9KQCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D67ER+pEZjUXHwoT9q7g1nZ2VURsBvo64qDpb9IAj5k=;
 b=ej2SIC5XlUw38wa5PKuqq6z62xOz9/imXhd88CQa7YDkcFB5tRr5v5Ab/8/3SPrMQmeLwx2RDsXtv1gBWYO8s4BJPxltUkWIY4xpqEP7ui6QkbfW0F7bRe/12RGHZRvQDfdDdOtgnoNE66ma4SdVjpLaDB6sxvPX62awllFIzMRwQ4AKspbokz5YFU2k1As4uFmEgBeG3rEobGDm4526JXZbniLhp9RzqzDMti0U3fdViyvW0GtO0hQxV7JkLdPd0VmIeC2u6cpNtNUje84kt+dpZbS4aDPpDmw0IJ7ObI3Z/bUrTkTr/roga8RWeh69WE6/wLTH3NeHEf9gDs85TQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB7PR04MB4698.eurprd04.prod.outlook.com (2603:10a6:10:1c::21)
 by PAXPR04MB8126.eurprd04.prod.outlook.com (2603:10a6:102:1bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 09:17:55 +0000
Received: from DB7PR04MB4698.eurprd04.prod.outlook.com
 ([fe80::c571:bdf2:afe7:c03c]) by DB7PR04MB4698.eurprd04.prod.outlook.com
 ([fe80::c571:bdf2:afe7:c03c%4]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 09:17:55 +0000
From: Ming Qian <ming.qian@oss.nxp.com>
Date: Mon, 20 Jul 2026 18:17:26 +0900
Subject: [PATCH] media: v4l2-ctrls: Allow unknown HDR10 white point and
 luminance
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-hdr10-unknown-v1-1-11e33d90bd6a@oss.nxp.com>
X-B4-Tracking: v=1; b=H4sIAKXnXWoC/yXMQQqDMBBG4avIrBuYBIniVaSLVn91FMaS1CqId
 zfV5bd4b6eIIIhUZTsF/CTKrAn2kVEzvLSHkTaZHDvPhWMztMGyWXTSeVXjfQ7X5bZkgFLzCeh
 ku37183Zc3iOa739Cx3ECSM/UqXEAAAA=
X-Change-ID: 20260720-hdr10-unknown-664e2f4180ee
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Frank.li@nxp.com, 
 eagle.zhou@nxp.com, xiahong.bao@nxp.com, linux-imx@nxp.com, 
 imx@lists.linux.dev, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ming Qian <ming.qian@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0025.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::15) To DB7PR04MB4698.eurprd04.prod.outlook.com
 (2603:10a6:10:1c::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4698:EE_|PAXPR04MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: 41b336c4-f1b8-49f1-3b26-08dee63fc81d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|376014|1800799024|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	f+NHYAkQeUKECYtKYlFZd7Rahg5O2zX749geZ4b2L4SQ2EZiRemp5q/vuKVYTfXzKxcqOAP7vFXrhgZUlGTfXRtWcYeXoQASFvFOHNxEDK/zGYQrOr72cZiIW9WXpa/xce+p6ng4VIDyfXdLXqNtF40uX2oELnYjOM1Byn0wM2gNnn8Slnhr5f0VALSAFQi/q7emzvVgvKoC79LzTn7n0ApxvE4DR0dv/ccJqk2pNmPiWQF3td6l1Ths5dhrv2oyyd13hYUJ2yi57Be1O4EqDOntmGRtTuzK+U/xQlTl6uMtu3y4WT2ciV3z1HuHHm04/Oo5ZSYTlUTBdwlmGYlxxNElA6Mf899Zq+z8XoAlK55KsRpQORqgsUYAR/tvsPLijp09QNthHupOeDDGGtvjbbo0Dt7WwNLd+bAhnKxuUJaHf1BjKM6BUhUxWNcpHqdtedaUnB1UAmLSlDnB+ihMrpFXfE9/sQs8bSKxY4UMZBgBPYaTOGVryHUP0PuEWb7QYKLCfq8W8oFwK4glswXjQDA8qB8Gt9CVMEIXbAjGlxsL8RL+7swBq1HvSZFB/QebxgRnxv2AzGyS0FKTWDHCB730XN4ni/e3PkWhg6zJqdCQDwMC7sgIuXZmjxjd8j2YRofmTxSKddMDjRf0VfxskegcGl7i6fJh/FTXjZKP6PM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4698.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjNvTkZxeGlBREJCVWttWWZETTdNbml0Mkp0UWZ5cXZMKzZUUTVMaGFVVnRr?=
 =?utf-8?B?RFRScXVldEEzWXo2UjhSS3pMbTV5T0JqK08weDZQMFI4NVp0aHBSYkNOQ2Zm?=
 =?utf-8?B?MjdoUko1a3ZDRmZ6N3QzTC9ZQ2h4cXB0bDYzdGxRY1pIOVc2cW5GME9hSEUw?=
 =?utf-8?B?UHNBRzNWNTJ1S015RGFydWFNL0RHOTdnR1RSTUpoWVVOYzIwZ1B0SUpNZG94?=
 =?utf-8?B?ZzFOMUViSWIwTzRJaE1yeVd3T2pSY0ZJanhnVkpSZVF4eTdNb2R4bnJZY21W?=
 =?utf-8?B?V0Uvc1B6UExudlhZMlBLbHI4cHNkUTJsWXFRWHdhaHNIMUowSW9Vd2ZaTDNj?=
 =?utf-8?B?YytDVDh0cXZrTHUwc3dOMzVUSnQ4TjlCbEF1cFViNTYwbWhaTkQ1WVhrOFdG?=
 =?utf-8?B?NnhjeDJBay9aVFRsR2JPd0xUTlNxVmtpa1J4QVF4eE9Qa2lHaVpxMVErNTUx?=
 =?utf-8?B?amVkYUh1SkVob1NvQUlhWEQ2TmhxN2RWMVNsWXRxakVoNUNrZU0rcmU4WnBW?=
 =?utf-8?B?dkwzc3d4SFJqYkxXbTFzeWFUWDZ6NFppdnlXQ29MWTNJSjNGNUdtNzVRaU9y?=
 =?utf-8?B?OWxSRzVEcHUydFh0djVmeWUzdkNlV1JPMitMMEVtUkVOWHUvSms2M2pXc3Uz?=
 =?utf-8?B?ajdmc1pMRm5FV1BKOTN5dEV2Y1BpQlI3R0hveXEyYlFRQlhRYmhOMURrenZm?=
 =?utf-8?B?dThFVkJSM3Z3aVhRNmV1V0hoQjVSR3FxaVpILzFha1gxRWxjVUVGWDNvSTAr?=
 =?utf-8?B?TDRoRXRLZmRsMVFWKzc2ZlZVeVFmUHNubGxUdWZiOTh0UHRCdzMwZ0plSDNs?=
 =?utf-8?B?eEg3Wmd5YUdFN01wK3hKb2dwQTdvRVJWMVBxOHJJUmZtSkhaUmdtanhZY0Iv?=
 =?utf-8?B?MmtpZTFXcDkxVFIxWm9acW1pdTZ6M2tEVmM1WG9zRWFkWGt2cHh0RExjb2p2?=
 =?utf-8?B?T0R5YVk1VWx0QnlobE1SYUNKUndYekw4NzBkbnl5R0FGL2Vxd0RpUk8vVkww?=
 =?utf-8?B?dUpHblFLc0tJNWRxa0tSaHNBS2RmY2dGbjMxVElhUllTRGYwQm5oKzZCRVpk?=
 =?utf-8?B?YmxzOWEzenYwZzJZQk93L20vYVRKOCtGUC9TNjJKYTNyaGwvYXRVWU9EbEZ3?=
 =?utf-8?B?MGduNkpVRDc0dE1aUXU5WHowTVBLeURScFNXcVg0RzhMQVlGOEl3Q21KUW53?=
 =?utf-8?B?eE1hQkdWMnVoNDBvZFVkVXA1Mk9NZzdWZzNxdWJ4UUJVVkZhUUhJV2laUCtr?=
 =?utf-8?B?SDBJZ0J5Y3dZK1hhWlkwdml5Mk9tc1FTZjFUdXUwUVFWZEJwenhaKzE3aFJW?=
 =?utf-8?B?U3dkOGFwY1hCNkgrR2FjcWN2OFZwSTJSMlBYZWxKZWhtZTFYVHJRMjlHYkFh?=
 =?utf-8?B?dC83NHJxSWFreFJkTmtici9zc3dlZisvUytjeW5OYnBEcUZhMlFMaDlJVDY1?=
 =?utf-8?B?Z1IzN2NzcWlnRkVBNFJMZXoyOHpkaktOdjh4ZFc4L1JpMGhPbWVrc21zMnp4?=
 =?utf-8?B?eEJoZ3BsaFFVUUVmZERjRlR6UGtjUkhyc2VYbGV4V0FHdUI4WnRHbWFIVzNt?=
 =?utf-8?B?b3VkcE0wTVVUV1V3b2ZLS1ZBNWh3TU5mQXlRMnhHeE4weDZvYklDeFdrT2RL?=
 =?utf-8?B?TDdocWZ5bW1QWjI3U0M3RjFFR25RQUpHU1FKdnprTEdtVlY3R241MnpCOXBC?=
 =?utf-8?B?MUlHU1VMSEtsSHNEd2kzSkx6ZjFzS00yZlhxdmw3c0lMZEw1S2s5clJXeGJ6?=
 =?utf-8?B?WWFFcU1jSVZlSFZocnBkRmVDVXpsbWJPOUQrcmNkS3JvNkExMDZVSnA3V0tI?=
 =?utf-8?B?djVMM0w3YUZRS3dEZEFZUFpiZittOTBFRHR0N1BPL1c1ZWp1UjVjeEljd28v?=
 =?utf-8?B?ZllydytPSVlIMnJRbDZsTFREcWVBV0o3Z2NicSs0bGgybFBRVkY2U2IvYjg5?=
 =?utf-8?B?MkZYdzhWVjEzWDhTclJIUS8ra0lGYXkxWnBVTnlSRm5oTS9MY2tSVWFNalFk?=
 =?utf-8?B?clNIK0ZneklISzFuT2I3U3VpUnpuMlRyeUk5cEJYSlRvVzJ4T3lLUlo0akxm?=
 =?utf-8?B?SWZranAvNXVyTlE3OStkcDNhZERtOS9lQ2VwMUR0cTIzSmY0bzUvdExmWWx4?=
 =?utf-8?B?bFpCWVlFc3IrWm5Rdkd1d0U1b0FUVWhaZVNFQ21DSGh0Wm5DS1VQVDYwMWdC?=
 =?utf-8?B?MnM1TXRuZmloL29xUnU2VDV4eldnUnRrK0JFS0FCdEp4TFViN2JUNWV1SGdh?=
 =?utf-8?B?WEl4eGt4Rk93UzJ6VVhCelB0ZEpvYk50VEZtbE1QQk45MWR5dmlQTHRSYzBp?=
 =?utf-8?B?cUZYUzJCL0NJbVNQS0VsSktWUzNHUWx5M2ROZC8rcFNkbi9BMEcxWHl3YWE2?=
 =?utf-8?Q?lrhbDLksLCG8kuvcznNU0koHs9EZr8Iq6k1jV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b336c4-f1b8-49f1-3b26-08dee63fc81d
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4698.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 09:17:55.2232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TOUCi5v4KYp3iwKpqOv+pNUzdnPr7jweKBs+pAMbhHBMRygDzD/t0BBJQkumGooZSOUo5OjI9a8A34mzQobnZSwqx9YBETHTPuhbF88ym6plEPZNypjSyH1MDQNetKe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8126

SMPTE ST 2086 defines the nominal ranges for mastering display
chromaticity and luminance values. Its Annex A also documents that
CTA 861-G uses zero maximum and minimum luminance values to signal
that the corresponding values are unknown, and the xy chromaticity
coordinate (0, 0) to signal that the white point chromaticity is
unknown.

The V4L2 HDR10 mastering display compound control currently rejects
these values. Consequently, an unknown white point or luminance value
prevents the entire compound control from being updated, making the
other valid mastering display metadata unavailable to userspace.

Accept (0, 0) as an unknown white point and zero as an unknown maximum
or minimum mastering luminance. Continue to reject partially zero white
point coordinates and non-zero values outside the nominal ranges.
Display primary validation remains unchanged.

Document the newly accepted unknown values in the V4L2 userspace API.

Fixes: 1ad0de78e794 ("media: v4l: Add HDR10 static metadata controls")
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
Relax the V4L2 HDR10 mastering display validation to accept the
"unknown" sentinels (white point (0, 0), zero max/min luminance)
defined by SMPTE ST 2086 Annex A / CTA 861-G, instead of rejecting
the whole compound control. Details in the patch.
---
 .../media/v4l/ext-ctrls-colorimetry.rst            | 12 ++++-
 drivers/media/v4l2-core/v4l2-ctrls-core.c          | 53 ++++++++++++++--------
 2 files changed, 46 insertions(+), 19 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
index 38a4136d7220..0a7da2f16850 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst
@@ -80,15 +80,25 @@ Colorimetry Control IDs
       - ``white_point_x``
       - Specifies the normalized x chromaticity coordinate of the white
         point of the mastering display in increments of 0.00002.
+        When both ``white_point_x`` and ``white_point_y`` are zero,
+        the white point chromaticity is unknown. If either coordinate is
+        non-zero, both coordinates shall be within their valid ranges.
     * - __u16
       - ``white_point_y``
       - Specifies the normalized y chromaticity coordinate of the white
         point of the mastering display in increments of 0.00002.
+        When both ``white_point_x`` and ``white_point_y`` are zero,
+        the white point chromaticity is unknown. If either coordinate is
+        non-zero, both coordinates shall be within their valid ranges.
     * - __u32
       - ``max_luminance``
       - Specifies the nominal maximum display luminance of the mastering
         display in units of 0.0001 cd/m\ :sup:`2`.
+        A value of zero indicates that the nominal maximum display
+        luminance is unknown.
     * - __u32
       - ``min_luminance``
-      - specifies the nominal minimum display luminance of the mastering
+      - Specifies the nominal minimum display luminance of the mastering
         display in units of 0.0001 cd/m\ :sup:`2`.
+        A value of zero indicates that the nominal minimum display
+        luminance is unknown.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 1214e7744ac0..5b8a594fb9e2 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1322,24 +1322,41 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 				return -EINVAL;
 		}
 
-		if (p_hdr10_mastering->white_point_x <
-			V4L2_HDR10_MASTERING_WHITE_POINT_X_LOW ||
-		    p_hdr10_mastering->white_point_x >
-			V4L2_HDR10_MASTERING_WHITE_POINT_X_HIGH ||
-		    p_hdr10_mastering->white_point_y <
-			V4L2_HDR10_MASTERING_WHITE_POINT_Y_LOW ||
-		    p_hdr10_mastering->white_point_y >
-			V4L2_HDR10_MASTERING_WHITE_POINT_Y_HIGH)
-			return -EINVAL;
-
-		if (p_hdr10_mastering->max_display_mastering_luminance <
-			V4L2_HDR10_MASTERING_MAX_LUMA_LOW ||
-		    p_hdr10_mastering->max_display_mastering_luminance >
-			V4L2_HDR10_MASTERING_MAX_LUMA_HIGH ||
-		    p_hdr10_mastering->min_display_mastering_luminance <
-			V4L2_HDR10_MASTERING_MIN_LUMA_LOW ||
-		    p_hdr10_mastering->min_display_mastering_luminance >
-			V4L2_HDR10_MASTERING_MIN_LUMA_HIGH)
+		/*
+		 * SMPTE ST 2086 Annex A documents that CTA 861-G uses
+		 * (0, 0) to indicate that the white point chromaticity
+		 * is unknown.
+		 */
+		if (p_hdr10_mastering->white_point_x ||
+		    p_hdr10_mastering->white_point_y) {
+			if (p_hdr10_mastering->white_point_x <
+				V4L2_HDR10_MASTERING_WHITE_POINT_X_LOW ||
+			    p_hdr10_mastering->white_point_x >
+				V4L2_HDR10_MASTERING_WHITE_POINT_X_HIGH ||
+			    p_hdr10_mastering->white_point_y <
+				V4L2_HDR10_MASTERING_WHITE_POINT_Y_LOW ||
+			    p_hdr10_mastering->white_point_y >
+				V4L2_HDR10_MASTERING_WHITE_POINT_Y_HIGH)
+				return -EINVAL;
+		}
+
+		/*
+		 * SMPTE ST 2086 Annex A documents that CTA 861-G uses zero
+		 * maximum and minimum luminance values to indicate that
+		 * the corresponding values are unknown.
+		 */
+		if (p_hdr10_mastering->max_display_mastering_luminance &&
+		    (p_hdr10_mastering->max_display_mastering_luminance <
+				V4L2_HDR10_MASTERING_MAX_LUMA_LOW ||
+		     p_hdr10_mastering->max_display_mastering_luminance >
+				V4L2_HDR10_MASTERING_MAX_LUMA_HIGH))
+			return -EINVAL;
+
+		if (p_hdr10_mastering->min_display_mastering_luminance &&
+		    (p_hdr10_mastering->min_display_mastering_luminance <
+				V4L2_HDR10_MASTERING_MIN_LUMA_LOW ||
+		     p_hdr10_mastering->min_display_mastering_luminance >
+				V4L2_HDR10_MASTERING_MIN_LUMA_HIGH))
 			return -EINVAL;
 
 		/* The following restriction comes from ITU-T Rec. H.265 spec */

---
base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
change-id: 20260720-hdr10-unknown-664e2f4180ee

