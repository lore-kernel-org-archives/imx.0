Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013065.outbound.protection.outlook.com [40.107.162.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F72C7263B
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 03:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784518273; cv=fail; b=rZDXEpEtWc185bz91nqMrRigtGZZEqF66AmjAhHzQi+yglEB2Ks3oJ81RXjC7sDU3X9E3ljfnRz9+sQVBDA45umu3m5NpsYzi3LdU/C9YZABR9FcOVO2fF4lz0elneKPyPKL35pSsLHrHlrMAaRmfwaKsocl1lWPi0h3Ispt3TA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784518273; c=relaxed/simple;
	bh=V2kOOBKSSwsqAg4QKdAEStllRxnnKkv/lZeGIBozPx4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WZyOxYo6gqsBwbQ9Dla+lgbt2gjxfNPCi8KxMaffMxSExP5IxREa8Ifrg31MRZH7zYAJWJsyHfSMjDE/MIuuva92t7xPfCCUSPPK96s+IF0svklq0Oy1jlKor6NEdItJeWmhi+tEYEXaLhzJxFteJYETTsfAfgRmEMKSoylKp7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rENqYe3l; arc=fail smtp.client-ip=40.107.162.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rENqYe3l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPqwspeS1eMWgIzsZrQdiSCBeXdAk7lpw5qKXzEGJiWXAP2oZv5n6M01cYqiETgc2NG0Glh3O3mK4NqTavzkpuPnJE9pCKrXyQjbwOnjVa1H8twLokzMKYYkt3ulR5nqaSi0ZMN7kW9NS946HK4Np97MfhvyGeaqDipHkig94TeuBfj3l2AJS7g03mDCWeRAszerIO0W5NnhI0jhoFqySgacBD9oxxg2TjsFx0dsv4M5wPP9xJHgsU+37f9KKGvT5A82inZsQkvRciMP3YRo9EL9KthEzTZna9FGwMyZvo+icj0Uj3Iih61xEkWPLfKr9CPbrfQsbN3epuqSY6srLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOqWS8E6vYWORJsRdJjpn5oBTizF+ds2tSd3vYZdmlk=;
 b=GmlAchJJ6/+Y7SE4g0FplgvzoTtafgJ8Ida6fPl49k4KZ/dSuXRVGt3awr50jyyO3Mz8flIXx/a9ZUMrBUt/CeaS/PsBguFKqjX70ZOGt+IZCnBnLfnu+KuOjscpwdJgdgwMBxMub1e2KVajYJ1luv8CaoaApUebahTic3BOC/rImcBevoGDLaf+Hp42IhpiVh2VR+goUllBEl1j7Ng79F3XBCbh22W/o/4YGs+9TYqXVQ9O3ac6FVHwcZO0QW2glkPS6OFVTtpjQNUumS95bplAD60OH/+X4q0jVGjfXZyHX2m/tl8PlsrD6TmCjxtneSzcVUb8N0qh7NiwA5c2Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOqWS8E6vYWORJsRdJjpn5oBTizF+ds2tSd3vYZdmlk=;
 b=rENqYe3l7p+6Gct4q4/SH9l5zQr/QJsBU3r2Y3GJKAqtGlXN3cg7xeinI7X3lggu8b43VFxA1QNeslJzic3B2oFIFqoiNsXwHEYnpCBO+ZlbgzE718aj4HIQa8XX+cKzYRCN8j9/pDiMC10OYvr+bY00Y1Qka/8Ienb0joA/laf6ajvssJPT6LMk2ycCsYPW70/l8bAy7RfDCdhbF6qpIUHve/LwuTtXPQm8cXnQNYr0KIT3254ZOw7rAGQImDWyhWGFxFUdO5FLeNvACMWj9aPK4LRg8R+sLkono9M+b8o21aBQ6lospfWO51NfLgHwgtlWY+BuJad61DAKd9QVzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by GV1PR04MB10534.eurprd04.prod.outlook.com (2603:10a6:150:205::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 03:31:08 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0223.012; Mon, 20 Jul 2026
 03:31:08 +0000
From: guoniu.zhou@oss.nxp.com
Date: Mon, 20 Jul 2026 11:34:06 +0800
Subject: [PATCH v2 4/6] media: nxp: imx8-isi: Add 16-bit raw Bayer format
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-isi-v2-4-45845bc5d4fa@oss.nxp.com>
References: <20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com>
In-Reply-To: <20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Christian Hemp <c.hemp@phytec.de>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784518456; l=3627;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=yO6j+TM0RXS72VVLeGJYcZBoA9UZ822YLQ+mmMb9jgE=;
 b=ZwEfSZVim3oRRW47k30vlTXLWsLN4ewglITdZCSOX2rSKZguKnLYoNwjOmd+XQsMsZnJtJNnV
 iZKMHqm0HXqBqGPkVn2IgjimVhZOKG4m73s4LQC03sleVne6l5bms2w
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::15) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|GV1PR04MB10534:EE_
X-MS-Office365-Filtering-Correlation-Id: aa08ffd2-1072-45db-0749-08dee60f5694
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|366016|23010399003|1800799024|921020|22082099003|18002099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
 rWYEjKcwHoCp9LinKNlIYA8+hY479RZXqO39Vfe5Potl9oYuP0KCvpo37k2B/PhuWJlVhyrl9KjIoQ2kktrrTpLSGWz+1Scjs2PBhT/CTSZHgI6X207Pvs4Rv6G/bGytxMsKyetLy265HLsrONPaI3c+Ri1apwyCecgTd7QWPItXNQbI4EP/FHycmr1NahciQywyCbODIM5sZsNlipMAewoIXz9wZbRcxBdVD5wVSGmVS4AEBIdIiSTftTxSO0LnfIcQC4bzIFu0H8mpjIiTsLvb05yJ39UnAftbm//s9Ctlm2GtE062IM4PPfeUYwygiioSQuD+yJpwHLhyk2Gbe/a8Atc3N43PFM7GrS1kID4dgnrPuwc0sbRVduX1iHUrYtOrA5NhmwPLvQBu7hCpFJNeoDqHcdMwRmnF6yrKNLTbzpxgXFQNb20EQ5IaF4V6tDWLNJkgasgSsWcxsB2IQbiY4yilS71mhUNMnrcjOflUU1F6qPOP+eyMvxIe7HNkgmfjk93FF9+xA4PBvIwqj/C7yoEEsdu21kPszR5BiT/WkfSC7hX67xfqnNrs89GUksJnBsg/r+yAgA4UnHBuIB4mjWIAJ6ZGKetRZQZz4zAnvjDNncHVl84XNmoc0oAK/iHxgStPIQagUA+QjzXfkrWmJQXnsXA6f/S3vi9k4DWmJn5yJykCWUv4DDTk1Cdk6JOM4RaLRENlEZ+kUgb0Cg==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(23010399003)(1800799024)(921020)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?a2M3eWlYeEFQeHRFMjJZQXVkRWtnTW43QVFQVFMxSFErMFJ1NVIycUxOd0dM?=
 =?utf-8?B?eXAzU0Vqek5FbDB1SS8vVlhyREplREt3MjFOQWdhNEhLVFQ5bTlFQ05qYjd4?=
 =?utf-8?B?WXhmYUFQSUdGaVJtcHJFbVVQMUVKUzUrQWoyMXdMdEIvRDZ3ZmFXWUFqbWdv?=
 =?utf-8?B?OUVrTk5Od1QyRDE1V3JNZUtUT3Y0VlMraWkwV1hORGZYYU01NjhNaWc5eE54?=
 =?utf-8?B?cUs4NW93WEpRVXZ2dm02ck1wV2thb25NMGRrUld3R0FUanFGZnh5YUpEWkc0?=
 =?utf-8?B?VGJQUDdxaDg1K05KQWJhWncyOXE4Z081K3U5WHdwZ3RTcms2a242STViOVdi?=
 =?utf-8?B?aG8zRVJjUjNHaFRvN3VrQzJYSS9HZGR5TTVYWWh6V0JYcDlwMDdVQk5iOW93?=
 =?utf-8?B?bk1VMHl1cURCcDVrdUIyQW5kZEU2dnFyaVN1OWN0c01MNlRONnBXNDRHbjFw?=
 =?utf-8?B?WmI4Q3hlQlM4YmtheWMxemZYSUdqbVdmL0lPUjNSUTV1S0VKbFB4cHdPVHVX?=
 =?utf-8?B?c3NzZUZpWUx4VW05UUdjKzFlRkw1Z3VHbG5pT2w2clFkOWgyOWlBSGd4c25j?=
 =?utf-8?B?bWVmL3pncnJ2N2trNTUxK1hIUWhFMWpScmYraTAyRFlhbXN2dU0zZ0lzbVpP?=
 =?utf-8?B?N2pObTdPOHc2cENNOHBoMTR0OVhDb0lsY242OWpuWmwwNUsybi83RzVxTWJW?=
 =?utf-8?B?amp5eWF6TTFTcS8zVzdMOVVaNWZPVmZVaXZtL29YRjJra0xoOFdsQWpwSHBr?=
 =?utf-8?B?eFQzVE52enFISHl1ZnArNkxYUnJocHVhMnFFN1FVS08xRmFwRFFqMnRuUFgx?=
 =?utf-8?B?c255Yk5jWVlTZzBKRnNUTnIyWTBDSHhVZTl2TjIyemxScStTaG5oNzFIRUMw?=
 =?utf-8?B?aXRXbDNLRDlic3hEY0dDZ1JCbXpQMUFMQjRaeEZnbzRneGxnNW1DSjBrVUZ5?=
 =?utf-8?B?UjZ1RWI1WVp4cTlyZjhVdGF3NGNkTVFCTHVzTnBsZm5SdU9hdnc2QVVDUk9q?=
 =?utf-8?B?U2hmbGxpVWlweEVveWN3RzRreEJjRWlVOFBma29GeVMycmxoUzBSSnJmcVI4?=
 =?utf-8?B?RndCOUIrcjZLTytLTmVjZENaYVBOZDNSalRRUzd0QmlSaitneEFKTXZYK0xq?=
 =?utf-8?B?OEkyaWR2aFFTbWlvRjBkZzk1ZTRWVU1qa1pFMXc4ckdqdlk4MmlpeDhGMm5y?=
 =?utf-8?B?MEFnR2Q4ZS9MdnJmdUVoWmIvZy9ZNGUyR200OUVramRkZWpjNzU5WkFSRDVQ?=
 =?utf-8?B?VmMzWFFFdGdLdWFsWmtWR1I5Zk4zNGErdjFweG9pRXBWaWNEZUhpelFFdlVs?=
 =?utf-8?B?diswUmRSV3E2QnI2cWZGTzNMSkdzY291WDRrck5QQ3FISER1cFRPR0RITEtJ?=
 =?utf-8?B?emladWpSa0ZZVG5JRzhxNnFROCt1UmVJK1Q2ZnhzL3dLVVE4dEcrRFB5clBt?=
 =?utf-8?B?UDh6RWFxdVhYMllHcGkrZHZId0ovMzg0TjhFM0Q3MmpJQU1lZ2hhL0VMOGRW?=
 =?utf-8?B?MkIvWlEzYjhNU0lua1NKdXZsSnAxZGJjdVBBR3NCT1E0bXRmWmlhU05OZ0U0?=
 =?utf-8?B?Ym52YmpiK2ZCKzI0blhBZDVoaDdDOFVmRGZFUW5qNHFQeWh5bzFYZEl2WFFj?=
 =?utf-8?B?MFlMRFhRcmhGM2w2WTdtUXNBcnFweDJiSjVEWDJLa2E3bWlVRlptbFhLZndX?=
 =?utf-8?B?UTdsZlBMOCs2dWtmVE95VnQ0bStkU3laazliWnBTajBaWEpxTWdJek1jeW1t?=
 =?utf-8?B?bG1yVHRjaHhZSWptbjNFM0ZOcE40QTc4WE54enRQZWdJemtuZEdidWE2YlVS?=
 =?utf-8?B?U1lMY1NLdzBVN3pKajZMNkJYWXFndzZXaXo2K2pFRUU1Z0Q4ajYxbTlLWXhC?=
 =?utf-8?B?VEd2NkE2bVRuQmMrMGZyZEU3amtBVkxNN3ZNTmdjVjI5MmdRalpKcUZwblVI?=
 =?utf-8?B?MDJrSTkxWGl6eXVnc3BsQ3FXcWQ2L3NkUmQyeXRLY2tyRjJXK2xwMkxJUmlz?=
 =?utf-8?B?MEQxNW0rSTAraHBrTWVKV0pXU2RGOUpVTnY1ZjF4TmtFNVpXREx1Q2lpeExv?=
 =?utf-8?B?S3hDbmdDcXRyU25OazBWanlwTW41SThjby9xdEFTTzB1aWJrTS9xd3dHb285?=
 =?utf-8?B?TjVMejZxSUxGWUVVUUVBOFhiUUZNWDlWdlFoVlJiMXI5RloyT3BtZUtwb0J0?=
 =?utf-8?B?Z0RBemNMMXl4RVpSRFZRdmhxU1RxakhUQ0E3NUNIS3hTbThBMFBsRWhwOGNW?=
 =?utf-8?B?bHpia3pNbnNTbjFNSmhHaC94S0VtQlMwUTl2NE1ybUVCejJydUU5UVI1VHBN?=
 =?utf-8?B?enE3ZXR3bHVvSklRakdKdVRTYVo5akxkaXVtMUdCNEJKbU5EOVFLbUxmTUxU?=
 =?utf-8?Q?w5c6VdY/8TBC80a7i3dOBBypk15i8g7Sa9rz/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa08ffd2-1072-45db-0749-08dee60f5694
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 03:31:08.6110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5KFmajMOuiwxOMKfAM+diUz4INHD3+8VXSgBP0USOhrZAjzVo0p64lKS54W3PSEbEUExy7WrgkmprCsLR+Oy6r71wakpzu9wF/ze8cEBPwRCii2ndoDvbFjIdICIXXH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10534

From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Add support for 16-bit raw Bayer formats (SBGGR16, SGBRG16, SGRBG16,
SRGGB16) to both the pipeline subdev and video capture interface.

These formats are commonly used by high-end image sensors that output
16-bit raw data, enabling the ISI to process and capture full dynamic
range from such sensors.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- Add Reviewed-by tag from Frank Li
---
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 24 +++++++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 36 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index 2d0843c86534..e58925d71164 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -179,6 +179,30 @@ static const struct mxc_isi_bus_format_info mxc_isi_bus_formats[] = {
 		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
 				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
 		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR16_1X16,
+		.output		= MEDIA_BUS_FMT_SBGGR16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG16_1X16,
+		.output		= MEDIA_BUS_FMT_SGBRG16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG16_1X16,
+		.output		= MEDIA_BUS_FMT_SGRBG16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB16_1X16,
+		.output		= MEDIA_BUS_FMT_SRGGB16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
 	},
 	/* JPEG */
 	{
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index fe4adfa3a1f0..5eb448f4c26f 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -356,6 +356,42 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.color_planes	= 1,
 		.depth		= { 16 },
 		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR16_1X16,
+		.fourcc		= V4L2_PIX_FMT_SBGGR16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG16_1X16,
+		.fourcc		= V4L2_PIX_FMT_SGBRG16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG16_1X16,
+		.fourcc		= V4L2_PIX_FMT_SGRBG16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB16_1X16,
+		.fourcc		= V4L2_PIX_FMT_SRGGB16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
 	},
 	/* JPEG */
 	{

-- 
2.34.1

