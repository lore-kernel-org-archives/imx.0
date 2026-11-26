Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795688585;
	b=24j/z9lt7E9XnmnwHPE/eFJfhRPl15XZJg0mf1FwIseR8agFSyJ08YXAqLMRuos+s7Xq
	 kiQg4W3Dzl7Y1ce84UpCr9GJ0iZXR4NVqSzyyKUJlluuPXhbK3kuQ6apc6nMUh0npODK1
	 MFnB1K8FbXjGuVs3YTUYGJWbKtBT4F8pXgtkCyx8qdnD4zSMq4QSUMQySCSHea1lsXGbN
	 cutOtlizvJv+HF5/DYksgMs38EBdPVgUBNTVW6B3iyV7BGgSiuqu86dLwQoNy/btbZ3/7
	 1txxqK3pOB9ScMjCu1oPYLM9s0ah6F13KBWKE+WqY7VSNiD3bGXXpdDxe8Ip3niDVaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688585;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=PdIfBK4bvQ+R1sXnwg2amgIh3hh/cQJKgAOw/QMCquY=;
	b=dcnq6Jphut4b5G1rqAxjRqRRQbUdJ9hZb3exc86CG5IYdSH2OwnyH3rQGidb4lLQ/Bt0
	 sCjHvTBRCdM5R7WWkMuQXiT550FHf3IqVN5WdUl5oGc0bIyi2XoDvD2mC+e2iF+OJWMF8
	 ccw3Abk+K2QRb8+pryPenSTITuHmlck0WmurVR+M2jX1kzDPt6PXSD65xtvjUGRSEN3QE
	 E2BhEgDTRriJjbyEsOBTz9hYLsDFZsRZOnyAWT97mQb1klkhPQl1s29cj5s5DwGQlSMI4
	 BAVh6eo2TrTgvsV8DGlJ4uWmTTgshmT221Sjqbb6TCvuZPpEbjsIva5Xne89qqBewkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="H/kzC8aK";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.46
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010046.outbound.protection.outlook.com [52.101.84.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340DE606A321
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 10:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 340DE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=H/kzC8aK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9A/T2H8FHPoL0Sq5W7IyjABTmP/aO0snQs1yZtYkuFmiYK0L8IhnSJ9lNLzAIkR85wgr0xdLNRwdTa8rvcRZ2Dk76beHMXYMWhGUffJyj9AwnZiq/n+I7I+le+F2lqYeeco6ljCKpL92LKwTm/rhPgckKCDwiOm0PzBhhXpUMmggv0lN/1kHBpklFCLYdXWTKZsAYvohRzKEf23PNz1YFrHhl/pWRUgUvBL0wmNn+CjhpYWzr5X7A/WUWjIThxT1bKSZAQ9TnrVCC4rnxD9Rr2iZpSC/tU1M3/cVfK08FynPw0eKrN5UIOr7bAuJbR0xzDcmznHNTQefXx2n0dmmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdIfBK4bvQ+R1sXnwg2amgIh3hh/cQJKgAOw/QMCquY=;
 b=pQJAHHLu827X8blJP9/8bjNKLtjPNhNERZ3RDLQH+NIiME1vDd2nY583o95W7oYg79TM5yma0fNjfZH68GRWCPwU2lsCEhjQXLhl5XAMcLaW0zQU3JWy4M9wGPD/gjwz875iR2Y4xiDRk6snRIyHLcu3gIJagHzJoySujGgXkmk4l53q70UKEciwyrp4+JUUDDhU23w6Nbr6uKSKaag+hDG2kJcETJ60RSSK09RM3atHxzAEfQyabs3J6wN93pndKglVC3ejbWnglBebCA47KGY+5lIO1qHqLV659eHqL7bR1HCs0mZYY1OPKiCK46bid8NYPu2pNNxp+FRVc/+z4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdIfBK4bvQ+R1sXnwg2amgIh3hh/cQJKgAOw/QMCquY=;
 b=H/kzC8aK9AbIVXs3OBlFMo9DbsqPgB7tzCnh62daaCwZhnu22IsFNBFTP1LfAbLcwlYADuoxc6sUqwMVqayDZMYfry3lN2MPs2U+ntT5B0h6yKs7321RL0WECbiHqipWAketfHinxzM6UTMofjm3GyMg6hS0sEAagayFiuhgLdbZM9AUgBvOJqF7eiPtVOYF+FpiiDbAXxCk8EElp34Ya418D+eDGrguk/NI4G0xye9AFz05FQDMOuGVT8GMuQneoKhDV8Vqw/KhZzWGWr3nfG4JySYv0lwDA3ChWSRDjvxABFrNDQH1iaaqsGhklnetAFZ+xDc6qEtCyobTCWrncQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by GV2PR04MB11861.eurprd04.prod.outlook.com (2603:10a6:150:2f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Thu, 26 Nov
 2026 10:23:00 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 10:23:00 +0000
From: shengjiu.wang@oss.nxp.com
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: [PATCH v2] ASoC: SOF: imx8: Switch imx8ulp DSP control to reset framework
Date: Thu, 26 Nov 2026 18:25:27 +0800
Message-Id: <20261126102528.1531824-1-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SIAPR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:28a::31) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|GV2PR04MB11861:EE_
X-MS-Office365-Filtering-Correlation-Id: 53936614-4d92-4623-3391-08df4ba73f18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|19092799006|23010399003|921020|10067099003|261028144727099003|11063799006|261021121427099003|56012099006|261021123027099003|261026140227099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	uKW15JOdSplKw7LoAySeEiJ4DQl4phGlN/oShJy+NESLK7G5QH3EAL72hV4EIu39lMCNHfesYLqoOYymBWa/S6MQrbd3uFyiwhkDqVpO035vdDKBpGKMUTfaH63+0tRF3hgLyc18xCaxM0pHbVLvg2AvV5S1tXjoSU/Ql3JAN/TBYknLddiOQh30RZ44xc+12Uu3c5m2N+I9STYN+gK3ku4yBZk9Qi1fk8rJPUIY8PIoBuOv96eu9GFVouX6waB7WJWx4pHIkUqGaXxVYj3u+RqFYIH13aC45S/F90VSJPBqYTv8HMnAq6DIWDInmjxEI15unLS92Vv/heHiEEB7CVuq7SReRPsmODUMWQ55Am3O1BhISajFr83NdLAJw5DOAdaa99tnQnBlft1ZhRQMrjbiu6IVgcMpFVz4BXAA1+OGDL2LOjAHqGW5IDTX7SZ+PmtXynx1VP0NkCtcOKMXsk6Bpprxge+dsGhOyYkvxUYP7rjndkYHUv8OGR0YTLapQY3c0Lhyf80cxfU8Unx2E56FabfCpFsn0O4blg/1PUh6of2mTPRpbrvfg0LDcnBoAQi2w/91fbnSkg07bKRAxjgQ3/8Srikzh7iGjuajS28u5nhjTcT/zM1JNIpxuzHjx8u3Zzk4tk+dLTNJENxD4kPs7fVVvetXIqax70nkDDWm+s0r+eW6bMHhjyL68+SajJcnL5xcsyFtGusWDshSkg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(19092799006)(23010399003)(921020)(10067099003)(261028144727099003)(11063799006)(261021121427099003)(56012099006)(261021123027099003)(261026140227099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dCgubgTk2iml1y0pitBqqxyGXRnbhmwkOJu7rdnFYZEA92BaTka7LacHbi/m?=
 =?us-ascii?Q?HdVgUEZzTHKGyRYYCEM+xvxrmfqVN7dXRiwis0gxxvmEMnPLbwfLTCU5gCeQ?=
 =?us-ascii?Q?gec4el12rZhTUqz2ZO9iKyMPhdtF/oilub+qoZZJ/5OjxQG1dhRfyHvQlnGX?=
 =?us-ascii?Q?VN3tT3EOGuAEZ3tywGdUhsWHtqq1rlUoKzZm1nMDj2/XnXlJHIENPBVWOD/l?=
 =?us-ascii?Q?CCH0kT4TmVtm8V6LJR2tzsz2kINo+AVfbqB0EVQb01U5ftqBay9aT13Qmgfw?=
 =?us-ascii?Q?XUc+fKUAphIzDq0LhDg0UcYOXw4sxmn6oOwV2OxxO3q7a5YF/dEHEPEZreeN?=
 =?us-ascii?Q?GeiTwu9/6WFER/bJHJwUPOSbWGSIqXx0ycsxWTI6V6h6iEiEuiCKueHdi4fe?=
 =?us-ascii?Q?i2guR3yrmOs0JkL8vSM4R/ghcHXHISk/5vM5OgEsklB0uUrxfF46Rm6d632W?=
 =?us-ascii?Q?hlrNKvDe7BysSxw+XesEE2dWtcpySSbsGWplQIIQcrlReWNdzEyPjq1WI/3v?=
 =?us-ascii?Q?2LU3R6dZjsVmksmN/Y65pRnfiXSAQQZVTJDQH85kdkI2JkI9pKVMZD/7n+o/?=
 =?us-ascii?Q?/D9nno20BBDJh3lPrfRTyYUGP1NQwPFCZb4x6FcpkXk9Ga4R3YZLLYZak3DS?=
 =?us-ascii?Q?S+2xopSt+BNPOSDa6wvqVbP7Ugm1+aJ31doQCWOLSYjkKyD81rRftgYjEZR2?=
 =?us-ascii?Q?jFo0rqiYD8eRO4bLVJEaHlfY1+IAoZi1Xahay/4OqY9jQ4plZjow8TbWIiz7?=
 =?us-ascii?Q?LF+1ujrRxn69Gn6Y8Vd2KJOttS2DIJIeUux74jSuN7f4OKJfvZQ91YAPn/z1?=
 =?us-ascii?Q?asFMIlaUTY4jifWx+A8/0i8+S9mTSbls0eOTSFXsL39aE/5yUEvB1ijILnub?=
 =?us-ascii?Q?7DqGeSTnKlBs9bRyIgIwwT1Cj90w3XFDZC+UTPDr7aZH/GFlKhgxopU+OZ4t?=
 =?us-ascii?Q?//m0SvxcqpgLD0EWZKQvrN5VIW2gyvIvgvkidKUUxTkY4rsouPh9ZdFefr8S?=
 =?us-ascii?Q?yRGKTnecsEXhHWdj0tupW7fH108joqVsCgUjVq9SOrb3sufHTwMYdkjRCQ2n?=
 =?us-ascii?Q?ypVuF257wOlRLOPFa2vzfEhe/zOpTEFgGahx08Z3EbTyk9XkuxXya7ZoNcy1?=
 =?us-ascii?Q?libs8nxoK7GpMujqbLFNyrwhvjPvQ2VqJgkCGzCtw854Mhpopn60aHX1KZYD?=
 =?us-ascii?Q?iVJMMEUViZf45PDb85q+sod1P+MkOd83cAFdt7wOwim/nTTmFJ7LpFSyPQ6l?=
 =?us-ascii?Q?rH+YURP3kG9m2z37prdjOQnfJBcfm3S1Vxlyk+6IGeGMiIZmMB950X+HDRu1?=
 =?us-ascii?Q?MQGgvOtACmfInZhd0tgK3rjO0HzF/UNAXXigTSoE7/3co9JTMX+TEEPgV2HO?=
 =?us-ascii?Q?vdtNuLNj8w3nrm3z+p4d4KW5fgSE8/I+VD3eMlaXclJOhheKjSWqwK/fRpeX?=
 =?us-ascii?Q?cNdb2AOCWX78wQ9WqKfPmkRowdPj6oTClkejtELJ1UcbADy9QNqyvVQu76SJ?=
 =?us-ascii?Q?C0QQnGqFVKH5za0aare4mwN7xDs/e0VyD278KS3UV7GEe3mbyK9Of1CuzFKf?=
 =?us-ascii?Q?TFcqcCmYwqBHUoaml2jg/z1n7DzNxUnU0H26p7cn8ga8TG6Bx8SRCp+grPh2?=
 =?us-ascii?Q?7V2qrkFfMY+hJx9dJVVIGqnu9kXsl+88j8eQ9n5qnATJeY5j3u2wJ3uvgkAL?=
 =?us-ascii?Q?OOc4uFz50Klecx7BlCrVEoMzmo0YLUTO1R88+h8To9kqs6OeLxv3w2P3zaGS?=
 =?us-ascii?Q?qSqcyqUDz2yprcDgTtj/nH84wDL/Uq25SzoYWpR+i6AstRoEhRJG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53936614-4d92-4623-3391-08df4ba73f18
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 10:23:00.3074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EEnZe8Uj8y+SiSU4WnZeWgJ0w/Bn3Kf+2P/ShbW+bz0DVUpWowpjfUOjQtDjxNp+/WuRd1Y6psr5fJyAxsTCFL/CI0N4bLraBTOFFRKkCd94u7LeEbMKa26XvztN42t0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11861

From: Shengjiu Wang <shengjiu.wang@nxp.com>

Replace direct syscon regmap accesses for i.MX8ULP DSP reset control
with the standard kernel reset controller framework.

Use named reset controls: runstall to stall and unstall the DSP core,
softreset to reset the DSP core, and dbgreset to control the DSP debug
logic. Remove the direct DSP clock-gate writes; the corresponding
SIM_LPAV clocks are managed through the common SOF clock handling.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
Changes in v2:
- Reword the commit message to clarify that the patch adopts the
  standard reset controller abstraction. 
- Remove one comment line in code.
- Add Reviewed-by from Daniel

 sound/soc/sof/imx/imx8.c | 72 +++++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 35 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 5cd3f44c90d2..80326d2eb1fc 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -26,19 +26,18 @@
 
 /* imx8ulp macros */
 #define FSL_SIP_HIFI_XRDC       0xc200000e
-#define SYSCTRL0                0x8
-#define EXECUTE_BIT             BIT(13)
-#define RESET_BIT               BIT(16)
-#define HIFI4_CLK_BIT           BIT(17)
-#define PB_CLK_BIT              BIT(18)
-#define PLAT_CLK_BIT            BIT(19)
-#define DEBUG_LOGIC_BIT         BIT(25)
 
 struct imx8m_chip_data {
 	void __iomem *dap;
 	struct reset_control *run_stall;
 };
 
+struct imx8ulp_chip_data {
+	struct reset_control *run_stall;
+	struct reset_control *soft_rst;
+	struct reset_control *dbg_rst;
+};
+
 static int imx8_shutdown(struct snd_sof_dev *sdev)
 {
 	int ret;
@@ -202,42 +201,31 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
 
 static int imx8ulp_run(struct snd_sof_dev *sdev)
 {
-	struct regmap *regmap = get_chip_pdata(sdev);
+	struct imx8ulp_chip_data *chip = get_chip_pdata(sdev);
 
-	/* Controls the HiFi4 DSP Reset: 1 in reset, 0 out of reset */
-	regmap_update_bits(regmap, SYSCTRL0, RESET_BIT, 0);
+	reset_control_deassert(chip->soft_rst);
 
-	/* Reset HiFi4 DSP Debug logic: 1 debug reset, 0  out of reset*/
-	regmap_update_bits(regmap, SYSCTRL0, DEBUG_LOGIC_BIT, 0);
+	/* Release HiFi4 DSP Debug logic */
+	reset_control_deassert(chip->dbg_rst);
 
-	/* Stall HIFI4 DSP Execution: 1 stall, 0 run */
-	regmap_update_bits(regmap, SYSCTRL0, EXECUTE_BIT, 0);
+	/* Run HIFI4 DSP Execution */
+	reset_control_deassert(chip->run_stall);
 
 	return 0;
 }
 
 static int imx8ulp_reset(struct snd_sof_dev *sdev)
 {
+	struct imx8ulp_chip_data *chip = get_chip_pdata(sdev);
 	struct arm_smccc_res smc_res;
-	struct regmap *regmap;
-
-	regmap = get_chip_pdata(sdev);
-
-	/* HiFi4 Platform Clock Enable: 1 enabled, 0 disabled */
-	regmap_update_bits(regmap, SYSCTRL0, PLAT_CLK_BIT, PLAT_CLK_BIT);
 
-	/* HiFi4 PBCLK clock enable: 1 enabled, 0 disabled */
-	regmap_update_bits(regmap, SYSCTRL0, PB_CLK_BIT, PB_CLK_BIT);
-
-	/* HiFi4 Clock Enable: 1 enabled, 0 disabled */
-	regmap_update_bits(regmap, SYSCTRL0, HIFI4_CLK_BIT, HIFI4_CLK_BIT);
-
-	regmap_update_bits(regmap, SYSCTRL0, RESET_BIT, RESET_BIT);
+	reset_control_assert(chip->soft_rst);
 
 	usleep_range(1, 2);
 
-	/* Stall HIFI4 DSP Execution: 1 stall, 0 not stall */
-	regmap_update_bits(regmap, SYSCTRL0, EXECUTE_BIT, EXECUTE_BIT);
+	/* Stall HIFI4 DSP Execution: */
+	reset_control_assert(chip->run_stall);
+
 	usleep_range(1, 2);
 
 	arm_smccc_smc(FSL_SIP_HIFI_XRDC, 0, 0, 0, 0, 0, 0, 0, &smc_res);
@@ -248,16 +236,30 @@ static int imx8ulp_reset(struct snd_sof_dev *sdev)
 static int imx8ulp_probe(struct snd_sof_dev *sdev)
 {
 	struct imx_common_data *common;
-	struct regmap *regmap;
+	struct imx8ulp_chip_data *chip;
+
+	chip = devm_kzalloc(sdev->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
 
 	common = sdev->pdata->hw_pdata;
 
-	regmap = syscon_regmap_lookup_by_phandle(sdev->dev->of_node, "fsl,dsp-ctrl");
-	if (IS_ERR(regmap))
-		return dev_err_probe(sdev->dev, PTR_ERR(regmap),
-				     "failed to fetch dsp ctrl regmap\n");
+	chip->run_stall = devm_reset_control_get_exclusive(sdev->dev, "runstall");
+	if (IS_ERR(chip->run_stall))
+		return dev_err_probe(sdev->dev, PTR_ERR(chip->run_stall),
+				     "failed to get dsp runstall reset control\n");
+
+	chip->soft_rst = devm_reset_control_get_optional_exclusive(sdev->dev, "softreset");
+	if (IS_ERR(chip->soft_rst))
+		return dev_err_probe(sdev->dev, PTR_ERR(chip->soft_rst),
+				     "failed to get dsp softreset reset control\n");
 
-	common->chip_pdata = regmap;
+	chip->dbg_rst = devm_reset_control_get_optional_exclusive(sdev->dev, "dbgreset");
+	if (IS_ERR(chip->dbg_rst))
+		return dev_err_probe(sdev->dev, PTR_ERR(chip->dbg_rst),
+				     "failed to get dsp dbgreset reset control\n");
+
+	common->chip_pdata = chip;
 
 	return 0;
 }
-- 
2.34.1

