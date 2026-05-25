Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB88342524
	for <imx@lists.linux.dev>; Mon, 25 May 2026 05:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779687432; cv=fail; b=sai4kaIPlkueU1bIDoBlKmoFmx/OwW9jz0GBe1XBCgJpOGLhwlKBWK/jt615CJCQoGZnNAYwbQVEtECGrO53awOwl6d8qcH3QcNfZm0M3vdIdwuR5EdGPFvDW9ADE0Lpo1Kbr65buBxV5ueU3xYZ1ZOZsHI0lWcBzwCxfX9mNFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779687432; c=relaxed/simple;
	bh=vkcQ4NQR8hzontX3X1Vbsrq1YriG6dziS6V57UwfaIY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GIMKuq7pxgEPCJy1wnTvviNKrMVVeyCBsxOVowNtjiICOLu4F7RVF+R0pWscdSPh/HPElrJCSX567hLTNvUVNm/jaYb6gOQK5Kf0fUorxIz1CLdKu78JSM0vbXXzr3C8Lueq3n8JfgfH0aJa1tpuboeN7DlnIfKIu93AEXorHXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=h/cOy0Uz; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="h/cOy0Uz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjXrUMkN42SVu+5CjcVD+lj5ZQLLBSE3+AnqtZCh0flFk6pKoPDr3YHTbU09g4+LBQEbpVUSucJgGThetW8L8iZ+dErgaNuzDaO3a2qeHuV6lVIrxwyKHSSxL6xri5qzn+0ofIzPXBicoq7TYKJklg6Io9IHBO3rWUoqtT1LThePpR+HbMX5yGlA95AenIE5ZyGRTjvtY0vHQKKwIUHw2lOW2MNDFb4uxHafx7M00MBi2GqJIhABiJMrP5PLqiTx+O0BL32QW/qOxQtLEe47pWfXMDvzytHf7b0G6rsRn8f8R8P4NfmZX4uTSftN4LpvHUbtkAZ/2e4Ka0cNN7qV4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdbyFQDubsKpveqaifUPU1+4bw1IJgicsWpsiJD6pJY=;
 b=MdFpXbgVel3T5FN3T96QyO39GHCYfmGiNWaqCmMihXL18XdVaKeg6oNOtRbyf97qAgHxRl7uaGs1DFgI6mOG9bVdsjpbSafjzPukkysOwPhH62Ujty0MavdYrD11rANbP836KBNdhQ8w8wdMnh3K83x4lA4vDD54wc25/86sfQ05BBPR+iHTQw3+6A5nM5kPhe7H4gd2P2hTm4hPnh5G28yBGBpUgxIOHXQkOCbtT2dS6lV9G04/nlsiWmOsja8FK3see58HSi2Ku/zNMLfXBxsy3VjGl3+dfGMJaUBVWrqESfjj1ZinsHonGR2sICF4xe9ObRQdcMA22n85ZHcrWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdbyFQDubsKpveqaifUPU1+4bw1IJgicsWpsiJD6pJY=;
 b=h/cOy0Uz4VdHhYIjSp6XsenLV+4bOZ8LobipI+H7nHg3pQ2tqBejIXSE1ze01Aw508sz/XEwE+jmfcnYPd3hbbcDZTEiX6HeqVuKClkScE+yvPXEKqjzXVOFltp0mhsa0ZRgvkQGxUpDylnuFZQAwwQmKsDERmq98DPpUV3PW625wKSvLU3gF5KRCgiYrUWcXl6J4TcGETZm7bFn9UTyibQLgwAaer/KrtP/Gb2fy8mSccBCCMdbJVoaeWxZhbnbTt8PFQXXUCESfb0hx+NRNf9QhYE6Rum6FoC2hoEvMLlC9IM+m9CzlNii64M8Sh6Ar1h49o6bUH2lYCSMUWnXzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by PR3PR04MB7257.eurprd04.prod.outlook.com (2603:10a6:102:93::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Mon, 25 May
 2026 05:37:08 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 05:37:08 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 25 May 2026 13:39:24 +0800
Subject: [PATCH 1/7] firmware: imx: ele: Correct check condition in
 se_if_rx_callback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-ele-v1-v1-1-a9570c4bffc9@nxp.com>
References: <20260525-ele-v1-v1-0-a9570c4bffc9@nxp.com>
In-Reply-To: <20260525-ele-v1-v1-0-a9570c4bffc9@nxp.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0199.apcprd04.prod.outlook.com
 (2603:1096:4:187::13) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|PR3PR04MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f68f5d5-e513-4c03-e463-08deba1fa980
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|52116014|18002099003|22082099003|56012099003|38350700014|11063799006;
X-Microsoft-Antispam-Message-Info:
	hrVpxdEVSOBRfVy+62a+SU6+scdqICfjBN2b6f0vFF/e4oCSXt+PyN+tyXiICKV47jAXNPB5l9RnD5TogEMEQkZ1Qidy67xnyxAXpy9+8oFoQxhjMwrN85CsE8dVkRohijs70LYZ2+bPCJ0y04pGe3FGeV17WrtjWvJzE9Wst2hAVhcQlx1SSXypIj6ibcGtzp8oYilmBG5Lcgcn1QIRTSw/tbGXkwOGcNpM5VJ94tMK60JC1TxJJ7P39KS1q8IfuqSc0Nt65ogUIYtWCA4207fQPcavX4NvunnrRBpfb9cwCrootf2nUf7+V7GKZnabC0hxITvAuoVdNsOZHaGlfycuSkNyQ/L3r/z1yDlWSQeNFOSQmzGyfUmXAkhDKTgYTTMD36MEYGrxexpqJ25TySPACAHV+8EktRkvLgoZQAyeXp3iK3W9RPqo0OBaXkn0ieL3QxDAO6nMEbF2+ygossTQuM2eOSt6X2Sf7Kl5aVzvhfzDU3k4eTxE6TS77y/iQMFHbXDNi+ua5+mUhOJqo0tzcFWIkoL5r5ptHDGJxYVpoLIkncRl7xWnJNFbfspvp5H1gE8qQE+WRKqSd+VSt2rffqLzynWQV2eaIFd95ov20PIwfCB/Ob5gFizSVx/FGVmT0DmHzNhynvZN+2WOBGNf4Qnlre1Qd36sL7+xxZQ8apEoeuxZB56bHRF44cAhuWYMK6kHh8UMwYDAfChhN9gOYEWW47yo7wDS9Lsl3NdjbRZdZLIkQddm2ZZ/uizm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(52116014)(18002099003)(22082099003)(56012099003)(38350700014)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TW0vMWRkY0lsQTd3N1FRM0dEVVY2Qmk5L243WWVlakI1QkIxdSthRUJlL05C?=
 =?utf-8?B?N3BvNm11eXVvVFVFUmF1MlBpcWx0Um1ZNnluZnVIdGR0SXV0Q0lQcU8yZCtk?=
 =?utf-8?B?aUREblFMTHFZbnBwcHlkMUJhdnJGQXhJMEZLS1RuZmR5cDZ2R0pHT0VFdS80?=
 =?utf-8?B?em9OZ2d5K2lOeDVyQzEyYmd4UG5RWnpkU3JTYzZFUGozWVY2TTBQNlZMdGY0?=
 =?utf-8?B?ZmRGc2g3RFZSZzQwZXlRQ3cyNlpXeXlGM0dZeU9wVWpPdENxMURGVklnUE5y?=
 =?utf-8?B?cnhCeXdWRzgrbm5xNEkrWHRhL1lYOHB5Mjg5eGY1R3YzbHkzVzlISUpNMGI2?=
 =?utf-8?B?bUJhNnNwMUFvRmp5R3o5OGllYmNGbUplcEh6RDJkTDNMa3FXNE9MZXB3UUoy?=
 =?utf-8?B?WWJadnIrOUJOcS9CR0FtYXVINERFd1hqa3hxNzNJZUVKeURLa2VBNGcxZjJz?=
 =?utf-8?B?YjlGOVZnVElQS1haZlZLK2Z4SE1mdDVKYVJHSXVuWFltVTJ4OVBxS1pKZFll?=
 =?utf-8?B?N28xYmUvZjRDZXNUSlBQMVJ0ekxFckN6eExMZ2pIZHJKN2U0d0RPc0hPMmtr?=
 =?utf-8?B?RUE1a20rT2NMNUFTVFF2OWxzTDZoTVJpdTZ2M3U4a1ZzTzVVc041Z3diZVpp?=
 =?utf-8?B?Q2E2ZUgyWFZYdlBOQ3NGTDdmeUJzYXBmcFpvUXI4YU9UK2E3SDdYQVlVSURW?=
 =?utf-8?B?TTBJbGdoVll5M0hBai96UFpiRTF4cVU2ZkRhb2dubnM3QVlNMjlTOGVzSFZ4?=
 =?utf-8?B?MmJHdkFidDNCNkhHczhjcUFYOWp0d3hMVjU4VXgzdTEzbTByeWdEMGRyVld6?=
 =?utf-8?B?QnFzOSswczA4djdvMlRkZ2pUdnlCaUNUR2NrOGVVdnYweDVNSS9MdlpFRjFD?=
 =?utf-8?B?R0xKZG9oWDVEZnQvNExzTkNaRlpDZjVxTk9IK0oxTHJwWHNBZVVGNmhSZEU2?=
 =?utf-8?B?dFBJdjJoSWNadXJGRUpBMDV5b3ZCdmd0Mm81UVlUQWFUZ2MwQVFUZG94TlMy?=
 =?utf-8?B?MVd3TWZRR0FqZmlpaUF3YWp3QnFEQ1NkcFpKazZFOHNmWWQvenhvUjY5NHYv?=
 =?utf-8?B?aEJrRktHdUlaaW5tRDJMMFZyZkFQVlJ0cUhZTTlMZk5BSDhtYm9jR3MrVXVD?=
 =?utf-8?B?cE5VeVp0VGtzNDl5dENNZDRQN1JBbTE3RWEwb1hVM0dPMGVDQlJNdUJmRlpN?=
 =?utf-8?B?TjVwWjJYVmFodDkyd0xqS3pmN1JNNjIxSU9vLzIwSHNqb29aMEcwZkdMR0xi?=
 =?utf-8?B?WW9lVGVjREU5RUhVVzVtV2h4TitYeXNUWFF0cVluWklodDd2RWk1UDA5bDYv?=
 =?utf-8?B?RjhyeGhCZ2s0bVVZTHdGUzFKQUc1TlpnaEcwZWs0cDF4WEp0blcvTzZvaDlY?=
 =?utf-8?B?VTJpR0QyY2tIb0xlR29uRW1Sa2R1aTU5T3g5WlQrZmNQaHh6dFYwN3ljL1F1?=
 =?utf-8?B?QytTajFhSzBnNDQ0aU9OSFpFamRWK2tHNkRqejcwclRUZXNmc29jcmNuL08x?=
 =?utf-8?B?MCt0MTM5empXUkdBL3ZibENyOHJWcC9Zbms4VTF1ZDJDekh3ZjRKSnFvdUlH?=
 =?utf-8?B?Y2Y2cGY5SGR1bWVJbklEVWdKVml0QTBFckRMeXR4ZURRK1NPTkJOTnBKZGQ2?=
 =?utf-8?B?a0RkT0JUUE1oMWtoV1NhL29oeXljanVrVmVlMHhYQWxVRHpyTkJKaTc3bDJQ?=
 =?utf-8?B?VW8zbkEwNkRUQVU1SG9FTlNqb2lEbDZmRXJDdnhtdkx1RlJKZVhncnNUQVdM?=
 =?utf-8?B?aGhrWVluK0htVHhQRlZrR3p5M3NlZER2cW5nM0ZaN1JZazBxNEF2ekVmaTdJ?=
 =?utf-8?B?MS9TTXdhdHI1ck9ERFJBdXcwWEYxYXlmQ2tRMThIVE9VMEh3OHJqVkRuWFlq?=
 =?utf-8?B?V2xhZjVhZllzMklQNmRwRXFhVFYxMzlhWVVLMU5DaUZyL0w0bGFaSGxCOStX?=
 =?utf-8?B?RWFBejZkNitHUHlWRitvNTV1Mnd1WEp4UjhsWFFsM1NlYnVETVo1NWtxTEFF?=
 =?utf-8?B?QVBUMC9RMXEzYWRHWkk2YjZXL1BrcnkrSkdCdTRRREMyZzB0ZlBlYnZoRXd1?=
 =?utf-8?B?K004UlFIb2xmTlFlM2VQTnZ0Z2xGYlF6eTVQL1Z5QUJtaEQ3bFByTTFkT3U4?=
 =?utf-8?B?dUtudzdvdHFNTHdHRnd3LzJWME5GdENtcko3UUQxZDZJWG43eDh5WXphWlhR?=
 =?utf-8?B?MzN0b3FRVnRIbnAraHlqTXNIenVMOWtIQVFWLzU1T21FRVNYbHNPRjhaMzB3?=
 =?utf-8?B?UWhsVjUxU1lGNHpZWk1sQXU0aUgrRXhSVUFJcWhKQm9hU2t3bGJVTHRmRStS?=
 =?utf-8?B?OHU1ZDArdldLa1I0U3MyaFpVeGhwdVFVZndlZGJHdVJ1dHpHckRsUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f68f5d5-e513-4c03-e463-08deba1fa980
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 05:37:08.7745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uiIhuFtXT6TYblxWezuK6oRQkKe6bm5fO9feL1+zJ5KQ2cNxzb9Z7BzIJwHTrefmsfaKCv9cMaEPT8e7IxqfUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7257

From: Peng Fan <peng.fan@nxp.com>

Reverse logic should be used when checking whether response is correct.
The logic should be when size not match and API is not listed in
exception list, return failure.

Fixes: 106ffe5d78ad8 ("firmware: imx: add driver for NXP EdgeLock Enclave")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/imx/ele_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index e5117a1f19959ec8dcfb313040121e20be0e92be..8daf32eded43c62daf56540b63e292bf0c6c9845 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -219,7 +219,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		if (rx_msg_sz != se_clbk_hdl->rx_msg_sz &&
-		    check_hdr_exception_for_sz(priv, header)) {
+		    !check_hdr_exception_for_sz(priv, header)) {
 			dev_err(dev,
 				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
 				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,

-- 
2.37.1

