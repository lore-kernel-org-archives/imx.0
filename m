Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3FF352034
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 04:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787719935; cv=fail; b=YcxwdUPM31KAEOnw+gFBv89ygkPuxgDeYxWCk95jbUKlYhJaK6AuI1HJf/iRefEP0R6WiUmmRL4rz+aMOEqvwZH3YGdNhmqDp3E+zAi5l9t9FZuYfxjFmOpcLOvl/ekKC9Tm8ebJJFb3IdOqualTSUgmKFuYRrSaiOi2rbAPTMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787719935; c=relaxed/simple;
	bh=sw5zLgbSYX/gtEkKiY+YdPnR9UlO6GT5C+xjtjawSHc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=G0TG8GHrYWI9nAWuzs4D1vTWj2DZaM2L4x3fhK4CCl7e14mCJNz0+wA/rhyYz2JYkrmbR1fhtpkAehFZIlk6XqnS4dgvzcHQmIykwTZe3NNCJRna8cD1ylzaSGkhEUx7Lx4Q65TfU9/Az0/khGdlPJnJhWg+TSDFuepEY7CkzhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oLK7ur7X; arc=fail smtp.client-ip=52.101.65.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oLK7ur7X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbbZr/G4glBBySEpt98FpzxO4ZVcZKq/5fKEnY7nCjAPH+tTNvJKvVfBTvqGsXRgK1B9Z7D431/5rSbg+Sm1xLjCNvW23LjpHCJrlGn0qutuslQ4L7W6nuUJSEYndYKbalOqYKkoKTl8wylfwX/iaghnG8tiv0nyr9D2rPl8pDN1B9O7Fn+OyCfGEf0MeVUkTN1ZTs9X/+iynEVbDA8ovOG/IpGjOtVTzr7PBIJfXp5VFgvpP5EmrxqJzAMuKGEoGXn8cCmdEAJdYWS3KwrbpqVrjjOQZKjsk5wJmugIAg0rZ6v2Rkx3pXfq1rgdaalpqq/5yyvOjBryKcHW9NAwyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIeKHTeN8gdcgZEIJQosT0NLyodXfam9Jg64Bjq0hNk=;
 b=h7vT5QIEq90QlHNLRmjpemNlqH/+uebFcFlsA9hVol+ggoSV0Ve298uZq3Xfa9eMntR8OXQiQGUG0ORw8YvzXbv/vHHgzHr0nEk3orbQ9rog4wXneOS5/tuJOGs0ecyOMHlE3J1+BMtonRe9WLO7IySS2vNwoPno9jaB+see8q0XfhAz+79apDHwdavLPOZK5exeCJxM3Ej70VIX+RAfufg4jYsfjxYH1jsXPmwmc1kwaKfOl62XFZb0TCRG75JZYP7066+6P7eFbSSVYNeihEABxr+j3np4NO1xQGx3fqygLd3zJU10sqnmyEuG4L23Jv3dLXJ/pjXw++gLnl4Rcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIeKHTeN8gdcgZEIJQosT0NLyodXfam9Jg64Bjq0hNk=;
 b=oLK7ur7XvxjRWbeijmjODcwCJM+SPFahxqPT5lSwkcoq/mo4+rouioHknyoIZXuAjZIs8l6UrP8SXJiBF69ADaL0BS9UvaFdJyvAQV23i7FoJCfnKcjZPglHBkiOZKDmcUWqlUpfLARKYsMypO35vR4fcZNRX/maDTa5Z3CLoN3hc4gO+BWL8iuEQN7M/n2/1tmgvMDbBok4QkPBoWQNh9Usbdp6OTww+CROmEtSdjjdkt000PIEjffZdDg7WkLfB9nqusvMpTB9VxJI0/YO8hxHZxD8mOUmosjRYe65SoKN41vMk9rI2zvRV07K0RkXtc6vEpP8Sshu3wrh6kEAjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by DU2PR04MB8853.eurprd04.prod.outlook.com (2603:10a6:10:2e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 04:52:06 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 04:52:06 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 26 Aug 2026 12:55:43 +0800
Subject: [PATCH 2/5] media: imx8-isi: Use per-platform format_mask for
 output format field
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-isi_imx952-v1-2-cbfaaa3f0000@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787720155; l=5431;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=sw5zLgbSYX/gtEkKiY+YdPnR9UlO6GT5C+xjtjawSHc=;
 b=yNweCjK04oNlAybkNHVtjEg+MmUBzXXnlqAy5LWRqhR/17eUH3gmN0gZjsT+L2A7BSuOKWL7y
 gOyv6Fmbly/Ab/XzAdQspyHnsZlyJUoaMv6tA0lf19w3oYOLB0u4ZsU
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI3PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:295::12) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|DU2PR04MB8853:EE_
X-MS-Office365-Filtering-Correlation-Id: 8778e523-f853-4060-c805-08df032dc724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|19092799006|1800799024|366016|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	41sNp7XKfhQt5D9JLrBp/pf0RliOfsJeaLaCLUwQy1a4KbxhGY5hVE7fWYVMRu+JkjE8FHtwB3NAoX81E+ZnjnNjVzmnc33adC22E/LO9xgii7yQtZ2w1h257sjbx29LItYIqJPNc/fRNHdBVp4elMwvDoUFWMXTOZXK56IVDhbfXZlD5stUK+mxYuZhGwQQFxLo3mvQs6lDPdFEaqZLW/ocW6zJMfYDmugum2wO7iBXguwWg6YdpHD1I2umok5mK4Hyg+ERM+5mPXH2gwW35aXZazKyXub8mmadCeD0Ctfvf1vnNJe7MD90CqwKf29LZem7opFLFxO0ncD/AXVIknNvoXfy3airylvANKYp/6dqZmje+L5VjRK06QAVfEb3dXegmEmJMl0bgZQBuWknw/iVDeAfRcc8nStnx8njrC7nxQ9ZTo2ixPvxEcDWfhEZZ/98MdctiRwmCxvawDqpG3v6/YzX+qM/jpZ4mSF835sz3eXphYdl87HP5QEPt2zlHZaExSkfHyMJ4UyWitbo+9EJol749OrFiefpiHx4pbC4ziNYqoqN/94aij1dr57U/Vnqwsj+X802r9UtzlW6zPABskwlZ271wncSKx8vCii7UKMaxTZRB/3dgIYFVRbTU8H6IcuIFL7vVgMr6KFam0BwNIGhBQkBrNOEqX47JRhgPL14erEjX5B5snsJogkcALWm4+BdwWzYBf/QHo8/bw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(19092799006)(1800799024)(366016)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXVlSVdpTGtWdEdhZVVNMnJBTE1sWEpxLzM1WEZxMmVUK1k1UGhCcTZhVWdX?=
 =?utf-8?B?ZFhIQ2VKMm45bDJSZEdhOENQYUlUbnJRRER5dnJmSTUxUGhFd0p2UXdYVVZx?=
 =?utf-8?B?NlRFTjdCdXBUY3kwTXZxbUQ5R2Npdm0vNTdYZXVBS2NLZ2xRbk1SazhraDhr?=
 =?utf-8?B?V0orQzlBajd4NjViU3BlbkNrL3lCaVIvL01jTmtucWNGekpLeWs1V3VNNnlJ?=
 =?utf-8?B?aGpScGFYNE5nTDJxRElacEwzRFFUa3UxZ1N5THNvdnoyeVRzdWlwSGJNTkhS?=
 =?utf-8?B?U3dwN2l2K0NKdkNVYUl3S3loL2FMUzY5VTdBRWRQNTZlaytNQlNWTDlLOXhh?=
 =?utf-8?B?KzZ5NGFsVkYybGQ5Q0E1cEg3Rm1KQzdFWWxIYU1NK0ZscWt5UmFVS0lhYlFY?=
 =?utf-8?B?UWRsSXBFZTY0eHJ1T2dGSFgyWkRPditYSHZocUVRcFlHUXp6b0d1MFR4NnJ4?=
 =?utf-8?B?bnh5Um9IOFNiRVk3N25RdmdZSkxEN0Y1V3FGYlFCQ1diUFpCalFIUnptR0Z6?=
 =?utf-8?B?clF6RERrYVdLNVRzV2U4YThFZUVsT2puUVJPVU8rUFFtV2JGNW5pVWdydGQ5?=
 =?utf-8?B?MXBVUDRIVFVvbHBwWEhXNm1PekpOSlZFa2tpL013R1YzRzQ0Rm9mN1BtVzVr?=
 =?utf-8?B?N3VGSUYvOHk4UDVoTkUvMkFLenltaGFNSFBQMkNxem9MWk4vbDVkUzhneFB4?=
 =?utf-8?B?aml3QWh6QVdXRVIzeTlhRmNmcm92enJhcjV4Vm43Tms3UldOMHVuSTRrUWor?=
 =?utf-8?B?Y0ZPR2lQSmM0ajFmdHZ5dEt3QkJTWWlselAyQjVLbVlXSFh5U0tiM2VIRHRW?=
 =?utf-8?B?Q1Z2YUxQRDlWbG9hcGE5TVI4NVJ2bFhlU3JzZTJVWkVEenV1R3lNQTlMN09x?=
 =?utf-8?B?SWd1cEdic0RMY1pydW56TUROWGpJQjhobi83VkI2VW9LYnVMR29TdXF2THdo?=
 =?utf-8?B?ZlVrb3lzUnF0V1hOMWFQeU9sZ0JzdlVNQlQ2VEtwTFdVK1VFd2FsQUJWaURB?=
 =?utf-8?B?Q3QxNkpCbEE4aHdQMFRrQlFzeE5FNE1FdVZHK3hPb0V1eGZyY290UW02bDNv?=
 =?utf-8?B?VXNpbjVoZE9ITXFZb2M0OFFCaDdTbnNUMzIyM3ZlSnlldkc1cTJlNjRuaGRB?=
 =?utf-8?B?czU1cmN1NHlwSXl6VHdrU2JHKzZMOU84cWozMG96YnRSa0kzOS9mV1ZlT2RH?=
 =?utf-8?B?NmNzTDZ6MDVBTllaWnZwR01kQWE5SlAwZEhIV1ZyVno3V1hoT1RxVEg4OGtF?=
 =?utf-8?B?T3F5dGp5YjlJU1JZS1RLNklyZnZaMFgvU3ZIN0l2YjJVS2ZzcDhDYWFNQWZH?=
 =?utf-8?B?TWIyYldKaFJiREwyNG0zc3M1eFZHc2p1VWtsL2dWYVVMaWpFNXExRjNSWUFm?=
 =?utf-8?B?aUxyWXRaUDNONEd6WmUrYkVqRTE0WFI3d2RJQ3FnVGdkVnVoVXk4SzQrMUIy?=
 =?utf-8?B?eHpqR09HVncyVDlrVXRhN0ViRjdHS1NyY3d5VEhBTE1Zam84WmJaT1V0Zm8v?=
 =?utf-8?B?OGNuQjRnS3RHaEhmSVZVZVN5cnU0RThJdU1qNWoyWUp1aG1ERXhMUDR2dSsr?=
 =?utf-8?B?T0dGOS9JODNyMlVCcjJLbERaRlRtdnpQSzYyMlFzUTZrQ1hHS2ZObFNoeFc3?=
 =?utf-8?B?TEN5SnQzMUJWdkJnUm0wd0JLeUswRi9wOC9ZcFVkOFg1TG1vYjg1c0ZEMFBr?=
 =?utf-8?B?RkFRcEcwZVZHUEN5L1J6bGZIbzBUSjhPSXFIRG1lQWZDNkxFdHY4MFQ1azU0?=
 =?utf-8?B?bVNzbXFoT08yeG9oYThRZDlkVTZ6Zk1kbm1YSzRWVnErNEZVcTh2V0FubzNH?=
 =?utf-8?B?OFN1bElrdDZFdm1SUlN2SXBrZlN0RzVaZG1XY1dyTXRQaE1uOWdKV0MzaUN3?=
 =?utf-8?B?dGxjdnE1a1hPU1dqVEcwbUxuTy9odE85eWE0bitGY3BOZzl5YVZMci9qK0Z3?=
 =?utf-8?B?dEJlMkFZZW0wUWQ0YXZKS21udWV1VEpka2NSR1krZjBEczdiQ29mWHFjSXJw?=
 =?utf-8?B?eTB0eVVTemVXVDF0eVF5emlIMDZuVG9KQU5wRGZ6RkZQcjRTS0ZIbDJENXlX?=
 =?utf-8?B?OWJFN2ZUdjdJZldSalF0U1U0QXNpL3JCSnJqY3BEdy95TTBoMHdna2orbmY4?=
 =?utf-8?B?Y05WYlFxaTlGdzBGS3ZZN01jZytjamFEZHlzck1CdVNLeEtuS3lyRWZhbXJy?=
 =?utf-8?B?ZDdNOFlCL0o1L2FUdm04ajZ5N2dacnJ2MGIvanN4d0dpOTZLVWdJRjdnNGxm?=
 =?utf-8?B?VDh3eUpJcDF2b2Mxdm1ONTdvZ09QNW5PaEtKVUpYVGtGa2UwMnZwVnZEUVFI?=
 =?utf-8?B?YjJmekk2ZmhzTVNBYnp5MUZwbVhSbFd3RXV5Y201dlByQTFTUFF0SnN1MUU1?=
 =?utf-8?Q?PUu4LyWNorVMLlWiAu8+BTM+cOdMPXo28YgqT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8778e523-f853-4060-c805-08df032dc724
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 04:52:06.0888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2Hm110a6/4FVwrUBHHH43jaXjaP4DwE71uTlOLlsc/BbkpmZmIXHlPHfgNVxTE10hdt9qKih9HCh5V2iWb/RITeghz03/Ey5ZK4bPZBHuHgOJNrxdPaVIaMqwoNXGBm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8853

The ISI output format field width differs across SoC generations:
i.MX8 series (MN/MP/QM/QXP) use a 6-bit field (bits 29:24), while
from i.MX8ULP onwards (including i.MX91/93/95/952) the field is
extended to 7 bits (bits 30:24) to support RAW32 and RAW14 formats.

Replace the static CHNL_IMG_CTRL_FORMAT_MASK with a per-platform
format_mask in mxc_isi_plat_data to correctly match the hardware
format field width for each SoC.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 8 ++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h | 1 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c   | 3 ++-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h | 1 -
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index f2a8eb82fbfd..c1c16dbc1539 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -297,6 +297,7 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
 	.reg_offset		= 0,
 	.ier_reg		= &mxc_imx8_isi_ier_v1,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.format_mask		= GENMASK(29, 24),
 	.buf_active_reverse	= false,
 	.gasket_ops		= &mxc_imx8_gasket_ops,
 	.has_36bit_dma		= false,
@@ -309,6 +310,7 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 	.reg_offset		= 0x2000,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.format_mask		= GENMASK(29, 24),
 	.buf_active_reverse	= true,
 	.gasket_ops		= &mxc_imx8_gasket_ops,
 	.has_36bit_dma		= true,
@@ -322,6 +324,7 @@ static const struct mxc_isi_plat_data mxc_imx8qm_data = {
 	.reg_offset		= 0x10000,
 	.ier_reg		= &mxc_imx8_isi_ier_qm,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.format_mask		= GENMASK(29, 24),
 	.buf_active_reverse	= true,
 	.has_36bit_dma		= false,
 };
@@ -334,6 +337,7 @@ static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
 	.reg_offset		= 0x10000,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.format_mask		= GENMASK(29, 24),
 	.buf_active_reverse	= true,
 	.has_36bit_dma		= false,
 };
@@ -345,6 +349,7 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
 	.reg_offset		= 0x0,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.format_mask		= GENMASK(30, 24),
 	.buf_active_reverse	= true,
 	.has_36bit_dma		= false,
 };
@@ -356,6 +361,7 @@ static const struct mxc_isi_plat_data mxc_imx91_data = {
 	.reg_offset		= 0,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.format_mask		= GENMASK(30, 24),
 	.buf_active_reverse	= true,
 	.has_36bit_dma		= false,
 };
@@ -367,6 +373,7 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.reg_offset		= 0,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.format_mask		= GENMASK(30, 24),
 	.buf_active_reverse	= true,
 	.gasket_ops		= &mxc_imx93_gasket_ops,
 	.has_36bit_dma		= false,
@@ -380,6 +387,7 @@ static const struct mxc_isi_plat_data mxc_imx95_data = {
 	.reg_offset		= 0x10000,
 	.ier_reg		= &mxc_imx8_isi_ier_v2,
 	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.format_mask		= GENMASK(30, 24),
 	.buf_active_reverse	= true,
 	.has_36bit_dma		= true,
 };
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 58b47335afc7..05c21c448b93 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -175,6 +175,7 @@ struct mxc_isi_plat_data {
 	const struct mxc_isi_ier_reg  *ier_reg;
 	const struct mxc_isi_set_thd *set_thd;
 	const struct mxc_gasket_ops *gasket_ops;
+	u32 format_mask;
 	bool buf_active_reverse;
 	bool has_36bit_dma;
 };
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index 6aa760ce3605..2405f7d33d0a 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -410,13 +410,14 @@ void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
 				       const struct mxc_isi_format_info *info,
 				       struct v4l2_pix_format_mplane *format)
 {
+	const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
 	u32 val;
 
 	/* set outbuf format */
 	dev_dbg(pipe->isi->dev, "output format %p4cc", &format->pixelformat);
 
 	val = mxc_isi_read(pipe, CHNL_IMG_CTRL);
-	val &= ~CHNL_IMG_CTRL_FORMAT_MASK;
+	val &= ~pdata->format_mask;
 	val |= CHNL_IMG_CTRL_FORMAT(info->isi_out_format);
 	mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
 
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index e795f4daf3ff..7c4e736f4651 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -39,7 +39,6 @@
 /* Channel Image Control Register */
 #define CHNL_IMG_CTRL						0x0004
 #define CHNL_IMG_CTRL_FORMAT(n)					((n) << 24)
-#define CHNL_IMG_CTRL_FORMAT_MASK				GENMASK(29, 24)
 #define CHNL_IMG_CTRL_FORMAT_RGBA8888				0x00
 #define CHNL_IMG_CTRL_FORMAT_ABGR8888				0x01
 #define CHNL_IMG_CTRL_FORMAT_ARGB8888				0x02

-- 
2.34.1

