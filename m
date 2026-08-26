Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79F435E1D9
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 04:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787719948; cv=fail; b=ITtbOuWgsmy0smyp7EAgywtBtfgJ18+9kBy+bmb/5DDP1tQvDUuM4TJ3caMJBk+wKeKnfSx+ExaVm+KGhqcsXukCXqbMJmcQHMb44bmA0oo03F1DeGRSjJGiXTC1Qn5xAmfc2t1rizvCs/CtKXJbAIG0soxSJu+prFNWe+5LNT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787719948; c=relaxed/simple;
	bh=a+df/G8PrzFYSGvaXxHSCwcQgCUHn5O8PMCGfGqqbys=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PVoYFcRw5N2TKh4VHtPzv9qL7spA8WznsCoJtIv0Lpiy0A3OAh4efIu6CDvw/6b973//bcqo0DJajXfOBSC44u6fIhLB9nUidxnLVyBMU83sxU9RuDerTA/S+DCUg/pddkSHDXeCVrGKtHHOMzjNqit2FWciMFwXB+H2rar6A4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SsI7KFFF; arc=fail smtp.client-ip=52.101.65.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SsI7KFFF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6RSadVMv7tHxINj6Vo0VzMtxX3FIuVviD996Isl6l/oIKo4NJm+UrhuuG3aKjX/oAkqGDuUaIImB+9JY5mMLuADbUduo1e6j1aK6PMUlj0j7ySQHF8nvLTp24mKLq0shCcs6wDfd+Gz9TjqW+Z63L/l2WLvqCKhFJLqbSJupReVAaiIQPkxXOst5ouwOx2DvfNhU9zTDBpy7TpZGe4UuOkMsz/Bro0EKetLiySdC+jE8EwdhMFzuXp7jv4m6ggYpAcTFPucvvpHtXP/pBuGXdv84WglvK1/rt2kHgu3Y5kqNW6DcY3AMeapv01MSF/enidiKWwqN5Pi5p+tmPJr8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBJQ5KqirSBPtKuOXLmUqpskGmZsCP8N806ZFpMzNyA=;
 b=CC6D6P0ocXkCMFzcWJhOHRo+MmNsVF5O7Z0D3J2YFPreW2C36W6mmkoA+TID1c8W2mMsZYZ8QQrOR3sO5S+BrM9YfLGrG1bOXHSJMPNm64Yz7pI2nouvC0ORlO7hZROmS4LhwKb50NYtpu+dBUxSda7quIaWnuklEDcJpUc0GfgYuLHuAOJQ02iRRoycnbuSNW0GXL2dxAP/p0LJk3nm8ICJ6jDImOp3pL7vP/+uOTKxBHlDZE6WNt8VXifz6yUYBURel8Tr1Won+ni1Gf+xCslP6bwHiWASZtNm5+KlczYH4FMOPkV/A9ddQirZL5zwk9m9xEPu9Gi5R7irkWJMeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBJQ5KqirSBPtKuOXLmUqpskGmZsCP8N806ZFpMzNyA=;
 b=SsI7KFFFEDSXH/5buV8zgl19z/3OyOKo/Ic41vI+bMlV2Z/RRHzNRPxMade6dA9VfEB18pRTEO0aCHKKhiXxbMVeOAmJOH5r+sk1SQRf9S57cply+ckpAHZUuXmo8wlEexc2kDyzqsjYCrXIraYyFIxHzUlSOTbK56Ikb8l9ikNdTmPdaeisEq1KwkOztOG9x/MA56os5/6pRzeOeJbmaYQY+uVYpYyD/RWxky2WeSe9W5acykjBmOwvTAnpvu5oAhB67mTe33r1M+aq4TCgvm7NVKflrT+n2aXEh4a9qUPuQVGd7tQfJTkhVTGNwGHKlwXop6PP1xgY8FDeSfwtRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by DU2PR04MB8853.eurprd04.prod.outlook.com (2603:10a6:10:2e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 04:52:18 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 04:52:18 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 26 Aug 2026 12:55:45 +0800
Subject: [PATCH 4/5] media: nxp: imx8-isi: Add i.MX952 ISI support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-isi_imx952-v1-4-cbfaaa3f0000@oss.nxp.com>
References: <20260826-isi_imx952-v1-0-cbfaaa3f0000@oss.nxp.com>
In-Reply-To: <20260826-isi_imx952-v1-0-cbfaaa3f0000@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787720155; l=2847;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=a+df/G8PrzFYSGvaXxHSCwcQgCUHn5O8PMCGfGqqbys=;
 b=UX0qat94sWhIz9qTVk1B4s9vJMZiI/XAMOYVyEzT0JVufiWtT6CmZYrOFWhfJwdP4lcO56Vxp
 oZd5Nhk6zx8AnG3UWaCEcuKajXz4eiit2gcefErW2veC9RXqiLBxwZ2
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR06CA0004.apcprd06.prod.outlook.com
 (2603:1096:4:186::20) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|DU2PR04MB8853:EE_
X-MS-Office365-Filtering-Correlation-Id: 121fefb7-fb27-439e-d9e3-08df032dce53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|19092799006|1800799024|366016|10067099003|56012099006|11063799006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	3KmaZ5h8EV1KHbsHTw0Rs1Rgi97dQywAg4sZC4Ytp46i3Z6HHORN71alRQf4zNnVQmDwfyXId0Qek9LZM+4IwecVJoGyZLjFGl2TSzi/oFMd+dnhqMRAPnq3gGfBoMskfi/KZbijVtBbBC0LcSKKoxRjF8h24ciQ4h7MMx96riWTWEke0hvtBqp03zBrhbaEVbEgu86B7h+wJfxmQtCZTTYBNIjLBUTOdCnmsgFFYABDLXfnnj1SP2HHdNeQaT8I73PnLBwgzl1J5jbU42SwUCEo4H9bG2adQacADFm1sEMEGiUlKupT79Ydf4qK9vscm3MiNKARXi3m6aetU+e90YklKgMe57lvhW6TWgZcvwhOBlsQyD5ADXq7bkmhUpCzkPCuJLxfULLf+UkTy1L5ByFcLHBaGj5Yt/ckF+Su2zXbJvTEaR7Rzuhp0OT2KTgwpBRAXxVMa8Iai0MVCj6gElJMLrANeuRD34fy+SAovnKT+zV3L2MDNITwq+BbE4UGacUjdV3P2KYGr7cEHN1adP82S1cbd3Nqg2vkIrByYaH0Ic8HlKbl9l1e3NURJpgkGlcZr7RzBXpHge3hM8qxL0Dpgg2AXHPFt7jjGqjhCk6YVVzHQx8zbGKtIefiRhvtkpLctUXDlvqRqXvRIXSlCY5oEN/zeW16U026LcEGT/QK9t7wv3brkW6jevIleCzrbsf9oPqOQCHANzP2q8jH+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(19092799006)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alJ3YTNDQ0M3TVFvWFZtMEZ1RjlFSk9tdFNxTzM1czRZd0lFUW44cExQRHZx?=
 =?utf-8?B?SkVTOU9OazdLTldNYXllWVVzMnhzUnVRR0trUWlEeTRxZlpMN0NZUDk3R3FT?=
 =?utf-8?B?MXFKOTBsV3RpNkVoQXdRT01zU05tVTdzbndCZHo0UW5xRUlHTkIxdDdEV3NK?=
 =?utf-8?B?NzQ1UHdKUzhGVFFYaCs4SnpyMjVRRVFoeXZoUXA5NitLYldwTHl5TkxmdU5H?=
 =?utf-8?B?cTNGSnRzaThQU0R2azZlZlBkYlRSRldER0FOR3QvM01NNEorbXgreW9Db251?=
 =?utf-8?B?amcxNDBKZVBhM2plaVlkOHRrT0JaMGVGKzd4SnZKZi9QWThPZDR3OVltdisz?=
 =?utf-8?B?YlJGZHF4b0JIMTk2QzB2Z0NuOHlqOERaVzQyaytkVzR0ZjlQTDVNVUxqOG1W?=
 =?utf-8?B?VTk4SWhMWWlneGpMdUo0VVNVQ0tSc3RIVjBCZmVMZnZGTlhkR1RrOFM1YVlZ?=
 =?utf-8?B?SjdJNG90SHJ1YzBRcXFoR0FmelRCTW9DRlh2MHhnaHhDSk9PVzQ5dXhyWEVr?=
 =?utf-8?B?WlR2RHNjL2IxeHBleUFMTFBuNkkzaDBtcjlXRWFYU3VkMUJBbnorYnBicTV5?=
 =?utf-8?B?UW1jci9PREtzdzhMbktPNDBDSkpGak9YblVJbHEySkZ0cEpYZktiMjBVNEhj?=
 =?utf-8?B?aVNKUmI5QXdxRGd0UFhYMEFvQmltWW5Sb05DV3VkbFR6c2dVVmp6b1JiUVlQ?=
 =?utf-8?B?UXZ4V1F3dTlKTHJYOTBzTUdUeUhvbThEOHJIdUtEWDIwN20wbWlCaFpZWGxh?=
 =?utf-8?B?UHY5TXBDUnAvY1B1SVcxb3lQYkJIWUh2OVJ1ZHIva3d1UkJBcFA3eUtYRFlR?=
 =?utf-8?B?VWxLOHRjMWJCVGcwYUJMajBxUzhMYzZLanNSZUpwdUdRNlBNNDE1YU9IeC9a?=
 =?utf-8?B?dFZqN2NjTHNQdy9TMUpvdS9PUkJJNWdqKzVPM1EvMlk3N3plcVRybEpRWVFj?=
 =?utf-8?B?SWs5allNaEgxUy92Z0p6R0YvcXVpZlRXTkRuRGpnRTF3cmFaK0d1UEpUNmh0?=
 =?utf-8?B?a1JtNk1ySG5EbmRvMTlGTGRMSGtCQ05La1hyejRsSjZjR3N4L2dDSVExakk0?=
 =?utf-8?B?d3EwNGQvRVo4aE9RbDR3UkNkRnF4WkRnVkRNWWlNQXdzNW1FZmJ0eDd4WlJY?=
 =?utf-8?B?QjBzbTdrRzVPZkphL0NHNGFjQm1IcnpUZTE4Z0RZYmpRbWRubjV5ZWtaTUUw?=
 =?utf-8?B?emVWcnBkN1c5bmdrUkpnazMyaVNENlVZc1ZhbnE1dytJV1R2b09CQ2JyMVda?=
 =?utf-8?B?aWU0aGZaWlFKeWdaQVF2d0pkSTgvU2t6MFlWTDRqQ1dldVBMS285Yk9vdlIr?=
 =?utf-8?B?V3RWSGVxWFU4RFJQWVV0bkZYeDNpZUk5cktwZ2FRWkRUYzZaZFRWUHR6RDJu?=
 =?utf-8?B?YkNjQWtlcC9BSzlBQzVMdDBBNUJiVnJGYnBDTmdkaWJsUXFWRFJxUll0YXJX?=
 =?utf-8?B?ZzhkM3VxWDh6Qk5wSFdHM3d5KytTaHpteklzT2VKMDNKVFZZUGZvcURSSzkx?=
 =?utf-8?B?OURRMXVPYmRhUThJZ3QzOHZkdTdqSmVhWVZjQ3FOVFBJYlRJaXJ5QkhkVU5l?=
 =?utf-8?B?TldhV0hYUDRPdzFjL0FycWMvcTEwaDhlNTVGRXI4WkRqYUU0R0xLRjJLaFIy?=
 =?utf-8?B?MFRwR0F0dEs1M2JnOXpRSFA0aEdqOWlHS3ByOHFEN1BnM0ZTbGd1ZzdIcWd6?=
 =?utf-8?B?WXcvdGpRMFlPc2NGdG9Cajh5bG9JK1Yxcm9aWTdFWVh6ZTVyR2VxMTRiK1Vl?=
 =?utf-8?B?WnZFVjdibng5aFAxcFEzTDVuYXNFM1pOWSszQ3czTlJiUjZkenQxaEhHVE1u?=
 =?utf-8?B?ekQwcUNIY29SV0xoUHZ0b1lwYndrelFqRXROWGhEbWdKeG1Kb3g1U3pYN2R4?=
 =?utf-8?B?NGRkMytuVHk2ZjdzdytlcC9RdTlZUzI4c0gvZ01HM0dTSjNRYUJXMmQ4L1ZV?=
 =?utf-8?B?SGNEMG1kc3BpRUJlTktqQXBXUllNRTRHMXlDY2hoUEtLRlBsWENMMkFndlF2?=
 =?utf-8?B?d3VmL2xzdHBwWjFQUHpXSkF6empUWEFDU3ZFRVJZUG9jNytRdU1BU3RUc05I?=
 =?utf-8?B?TlhRalc1SGFkUmNWT0NxYlZLZkpVcFVvK3YrNi9qUDlOWjMrQVl5SDJtWUFL?=
 =?utf-8?B?cUw0eTliQXNMN0kwTVh5UXRsd2NXcU10OG0za2ZYTHNaQ2NIcDdlby9hNHRL?=
 =?utf-8?B?WjFBa0EvUDhYclNLOUpXSjlGaXZWYXV3WGw5Rlc4RlkwSXY0Tkh2L0tNUUY2?=
 =?utf-8?B?TWdsTGF5WEUrZEtXWlU4cXA4bkVxWFRYT056YjJEYjNFdWYrNWZ6UkNzZWtO?=
 =?utf-8?B?T2krUVN2MUlZWlVacUtLNnNhMU1kWVhjUmVsM3JhamhWaVB5dDNYQ2E4V3ZS?=
 =?utf-8?Q?EmG0ToBE2H3y9+NCvuAbXFRt7wZAmRjP2HGvP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 121fefb7-fb27-439e-d9e3-08df032dce53
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 04:52:18.1309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +eYbm/XCqh/1RVKO2EwC1K0/NBEfMw9mYWTf7GuAJzhxk2C6WJp0w/7YjfdFFGaYdUcqnaO8nl0R1pxUO0Ri5iZBzfcR6Y+J5iSWU2339A+THUTeNQU0Mw7iE6/o3DRz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8853

The i.MX952 ISI is reused from the i.MX95 ISI with a minor silicon
revision. It can process up to 8 image sources simultaneously and
obtain image data from up to 4 pixel link sources.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 14 ++++++++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  1 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h |  2 +-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index c1c16dbc1539..5b19b581b38e 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -392,6 +392,19 @@ static const struct mxc_isi_plat_data mxc_imx95_data = {
 	.has_36bit_dma		= true,
 };
 
+static const struct mxc_isi_plat_data mxc_imx952_data = {
+	.model			= MXC_ISI_IMX952,
+	.num_ports		= 4,
+	.num_channels		= 8,
+	.num_vc			= 8,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.format_mask		= GENMASK(30, 24),
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= true,
+};
+
 /* -----------------------------------------------------------------------------
  * Power management
  */
@@ -582,6 +595,7 @@ static const struct of_device_id mxc_isi_of_match[] = {
 	{ .compatible = "fsl,imx91-isi", .data = &mxc_imx91_data },
 	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
 	{ .compatible = "fsl,imx95-isi", .data = &mxc_imx95_data },
+	{ .compatible = "fsl,imx952-isi", .data = &mxc_imx952_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 05c21c448b93..a4b638508522 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -164,6 +164,7 @@ enum model {
 	MXC_ISI_IMX91,
 	MXC_ISI_IMX93,
 	MXC_ISI_IMX95,
+	MXC_ISI_IMX952,
 };
 
 struct mxc_isi_plat_data {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index 7c4e736f4651..35dec3a650ac 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -22,7 +22,7 @@
 #define CHNL_CTRL_SW_RST					BIT(24)
 /*
  * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
- * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX95 only
+ * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX{95,952} only
  */
 #define CHNL_CTRL_BLANK_PXL(n)					FIELD_PREP(GENMASK(23, 16), (n))
 #define CHNL_CTRL_VC_ID_1(n)					FIELD_PREP(BIT(16), (n))

-- 
2.34.1

