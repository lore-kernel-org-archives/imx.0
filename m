Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010057.outbound.protection.outlook.com [52.101.84.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB8E223708
	for <imx@lists.linux.dev>; Mon, 27 Apr 2026 00:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777251583; cv=fail; b=QUl+HV223ZuKhbDmoGHYei01tKJqP+Jra1vZK78Y35tej1gjhVYev2eulFhhWPlz50n6BLnRNxVzGnqEkRMVcN3kPLkrudNxnMkRlfDpv2GQkw8rLTBqSn0jCGXreVH9HQVhmgwcyp5CgB50r1cvytc/euvAVFslI4AF3V3h3nU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777251583; c=relaxed/simple;
	bh=Gewo5zVofGs4hhYWrWgHVdl/WZH6FAHXOFH3/PjkUtA=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=g8NeiScHW6d+ewTafCLdxWD3yvaJ9TE5XelTQDlc2KZwsfYHf7Z5LyosH8Rnmzyo3bwr5hYx09rUDrcl90embd+hgrGmKKWgG5lF2+I64YwzNNC1xJL6vq1lb7002BUSLeworiN91yXYDfFPlseoXL6dFWP0CmOr42GeWEPaPxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=azjofXrA; arc=fail smtp.client-ip=52.101.84.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="azjofXrA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfT1Vme3+oG3sOmhx1nX/IbAyrk+erGE2djB8DTRRoyDrnIZqXP1zJ4gPmLvhPucNlFiHCWK7oX9Au0BYRodrg7VF/bnRIh0PCLPSLP6BV7T/yWcFhwprJa2YPeSzE5GrZtrp57Eeu+9up/A6cEgNYDmhxf8IURL3uVIOq80ZL7BeU8awA0J+ZjqA4pRz6dvLiwPjrSBgMmJm7i28ZK9C/dQ4Elwzdj0/3qgk0RvFwXmUNgbx53+wSf8BBCJcUWv0dwaTGM+zk00fwrZdaYhCpN9VJhlzfNN+gvEjWZrWcmQa6b+tpSrJEWovdgN61S/IQnBqybC3xMFGjYfRHV2Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2R7l3InsMcyNM9Yv43TdTwfLoco9Vi9zN2HII5yGQ00=;
 b=IEafNAMIxx2V0xxVYvW//f2aNkv1WiPcEEydGZ1lELNmlzra78lPDxPNqAaG/PVs8mw+jmsP3p1F9OAAA+SAhqNF/t0M7JJ/7fqZ4Lq5B08Tfz9inm5BgJY2ynYjyOATu4Fg01fgqP8NQ+0HyEPTPBCgMPOJdq0HRkxGv1F0SXnB8AsYcTpCB+s5pn7qTbhdxWF5uzthq6Va91svani4ZQkTJAH2YLCmznBWK8xM0Df9rYkMrtpOsxaPSaEToF04q+TI7CQkrviFZ2q7t4f7wMRVODV/oQrLgl83Kso+uiSCs6AeUULZh6XZTuRVvzlMszwlRMA9HKnpIk59xz/8WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2R7l3InsMcyNM9Yv43TdTwfLoco9Vi9zN2HII5yGQ00=;
 b=azjofXrAsuasKiuV+qk62ym4YKREuxX+5PqCGE38pn5Y1GJ79U/sMFclAv0khbGr6cBdlMG3sgaawwPD8zPxfOsIYgx26FIWJxfOo5y9/fe+WSiMDGjVpAN120tu5bcPw2AnwGOhf4jcb4DX/5/bNoAX0usKPSaeSf9q70UxfMDoZZhWaVQravPnNFQA18sqv3bVEDhgTU11/bcDMIxEartOQUAOsrUGps8Tnl+zSpEVO9X7YdyPQKHSP9DO5qJbYaFlSfdUpQIv+eHWzNLb2bx3Gb2uaYxntK0lHFTp63PIpeMtnX1Yb+fVTj/BMSGpzb4aaHZa9awaNrym5/MeRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA2PR04MB10129.eurprd04.prod.outlook.com (2603:10a6:102:3ff::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 00:59:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%4]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 00:59:37 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 27 Apr 2026 09:01:48 +0800
Subject: [PATCH] soc: imx8m: Fix match data lookup for soc device
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-soc-imx8m-fix-v1-1-1fe5b43d8090@nxp.com>
X-B4-Tracking: v=1; b=H4sIAHu17mkC/x2MSQqAMAwAvyI5G6hx9yviQdqoOdhKAyIU/27xO
 AMzCZSjsMJUJIh8i0rwGaqyAHusfmcUlxnIUGcaalCDRTmf4cRNHhyN6y1TPfZbC7m5Imf9/+b
 lfT+NdlaIXwAAAA==
X-Change-ID: 20260424-soc-imx8m-fix-90d7ce2397f5
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:195::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA2PR04MB10129:EE_
X-MS-Office365-Filtering-Correlation-Id: 354f2c9f-24eb-433c-1677-08dea3f840d4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	s2oymOwKyvL2CjJGHRWXG1X8DkwQG4/zWrkW0iCHkoL+xI2hXnd9yNvAT0Fi6Qm3gC4oN+wZBIERB7Udqy0L3hgQKoqXBcMuRUn40fB1tgLHcSLB8pJ7aVXKg3cUVJ/9E1/HGouWAvR5PKIWuoyTinRY98PbN/FajKeCh16XXzDY6ZFjkauv23BfhHelHBtLMXO/K5krkcBH0yqr1vZmrTncg6q6m0K+bK2cfDYzlzhox992W2Ful6sGRrI592/rautIANou12VXPj2Rze1qZ6aDTghkbgTk4lnJ0NcslUufsQaoR55g4yhHzg5VYCz9QIeKsRu9xHwNHnSFGRLfwgVzH8sqNFNRYKyJ1C9SVNzw0Z84pkKdnt9F9s3X94zfHyV3doT//KyzD/NECJQZK/rmGMPDFB7RYcLHd3uuhYNtFrdR6r/A6FTpVHHerxp24IAyDzfvxVu2y2ksbsTlo342xNxmpyc/RasIIhiZiOXPPtapeKPlCcUra9XnpUX8j/IJsBxJQUXId400pgKRPkj1e8XaeX8AH0zliXa0IY+rd2sN112jBmLvDwAWBqJ8baJwyYHRcKgu8Iii+JVOkw65hDf6rRmmY2lB4aB8Q+7oD/5bwKvRuSLH66ADFMTHU6VNu87WdXEMPHdvaPmZCJDHuPLxm6uqvWEtPjuwFeuXzJYsxm7jbLRRa9Ygrb7XbwehqvY0CCPAKE0z0J29mKJaK1SsCR/JccmhXzpriZDZUi4TnK6gXFFHvBjgzXqZXeTl/jVBP6gUGoaoU1otBajL2rF8YjexsN8uJJZlsjs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2xwb0tDYzlSZlJNdGhLejRkU2Vob1d3dVZxZVd1NGZ2K1RiSWxEeXB3aGVR?=
 =?utf-8?B?SmlMRDhoTmphb1RmWDM3MjZTSW1SaktHNUVETmhITlBLMEQ2UXQreENYMmRZ?=
 =?utf-8?B?czZxNEJEKzladC80aFRtWHpxaElweS8zNzMxV3Z6SitLOGZlWkVjQ0t3dWE2?=
 =?utf-8?B?RlJENjE4VE03aWRYZU1DVVFjdTRFbm5QSld2a1g3Z0F5bkN0WnJ6LzdwUnhW?=
 =?utf-8?B?Q0s1MDNDSGNHNDFobkNkL0QrQkIveXVrMUNHZDdCTWErM1RrVlBGNjlHUlky?=
 =?utf-8?B?aWVOUURSYUhYT1FRdjQrdEx3b1BDVTIzR1YwVTNpVDU4WTZUNmc5Vjg5WDdw?=
 =?utf-8?B?Yk5MbkQ3Q0MrTWt3dzB2dXlFTU81YnhkYXYzSnVERmdPcTc5cEs0NzVldVVi?=
 =?utf-8?B?aEszK1NFdVRqRWZmWlFlV2c4SGlOYXJRZ0FLRmF5b2lCNXZxWVhDZERtaGZj?=
 =?utf-8?B?dEtFOUdaTk9GNUd4S0hrTGk2dENEbHlWZUZJem4vUUNpZVAvR3MvTXZZdzlD?=
 =?utf-8?B?c1V2RGxKdzF6QUR6R3YvNkN4UUtZTHpqdFJwcXhKdEhpQ2FzaEsyb1pKQlgy?=
 =?utf-8?B?Nlh1ZVl6b0o1M3AxazdKdUFzTG1oT0t5Q2NsWXRUTzNtSkFpMUdaWVh1VmV4?=
 =?utf-8?B?ZS9mdGFrV2x2dGc3OGdPZmEyZjZTYk5MMVhPM0pUZ0F0dmdKVXM2Y3pjZDM4?=
 =?utf-8?B?NjBiY2huVnFEUkwvSjVUM3V5UG5JMHBybEovQldlaU1Eanc4NlYzVXFCa0h6?=
 =?utf-8?B?OHZ3dUg2aU9FOS8remhZK1hvbU1Pei9ibUEwQlJ6NzFFK2JRN2RoRitlZHFO?=
 =?utf-8?B?ckUyZEQyWjcrei9pNkJSYmJNdEtiOGNMcTdyTjV2MXdFV2JyN09VUkF6OUZ6?=
 =?utf-8?B?R1pBTkpaMVJTaDRhWW41RmtNUTNvUnpmRHllVUFhODdXamhBOU1xblFlN2wx?=
 =?utf-8?B?cUFjU3F4VnYvRGF3OEk1Rk5iRS9tUnh1d1Fta1BZS053VlpManRjeHJuaEdY?=
 =?utf-8?B?Z3RRMm4wekp5K201MS9xdXk1UWg0MmNRN3EzcnZOSnpVUUN0MGppaHBxRUtQ?=
 =?utf-8?B?YUxLTC9qZE9KbDdjWFJ1eDZSN3dVRUpwL1ZITlFGbjJoNlpJMk9JaHFZZ09R?=
 =?utf-8?B?ZXlBM3RZTGphY0dDdmF1Q0w4Zm1lSWdIaGhaWHppY21mL1JsSDhTOGlJWWp0?=
 =?utf-8?B?UkFNZ3d5SjhrZzlCenpQbmpsc1I0THl3b3NIRDZwOHdQWHVsSVQ2c2VoVVpP?=
 =?utf-8?B?eEVZNUdWTjZvcHBEYlh2NHlwK1hyd25QTTdtMlRmaXFFOXBhTmdhdjE2WDVI?=
 =?utf-8?B?bkp4RHl0NXdEdDR2MHFkZUNObFpyaGpuaFJpNDA0YUhsRHlYRjBOWlRZSnc4?=
 =?utf-8?B?OFNnWW1zbFBudWJZOFJGcm41QUtVNE1HM0pRY0VCUElmQlNhZ2ZxRnd5RGZK?=
 =?utf-8?B?bXk5VFZVYVo1NUpxZFU1c0x2aEFJMGNHOVFnTkxUZXM3YjlsUTk0VFVVSDBS?=
 =?utf-8?B?Sk9TUTAxcHJlOThUemJvK2ZPcGxUbDgvS3NpUi9veHJYU2xrSmVTdW9xQW5X?=
 =?utf-8?B?anRIelNWdEpKKzZNK2huSXBRRCtPTWpyUElXZ0pXNktRUlpGYTJ5WFk4OGwy?=
 =?utf-8?B?WTVnc1V3TGI0ZzRicnZCc2RVakZvTE9WeC81bjBTTWhTSXk0VUhjN0Vxck8v?=
 =?utf-8?B?WTRVcHZnaGVIT25EQ0dJZkVQbUVjeEV5dGpYSHRJelFSUlBOKzdWTXZMd0d2?=
 =?utf-8?B?UU1PSlhySUVudndQbDh2L21BYWxtK2RrYkpLVGhwNFlYb0o2UElCQ2dDaG1I?=
 =?utf-8?B?TC9IUFZISUJFODU2Z1pFdEUzZzJoYjRBMVQ4L0d6eERQU29lc2tpdXo4K3N4?=
 =?utf-8?B?a0xzSjA0WGJlSjlUazFKUnZkYTM4S2tWU29idFgrRndKQlRCOHhvTDduVHZD?=
 =?utf-8?B?b0Z4ZlJMTG90L3huYWczYkZSS2hxYk96TWYvZ25laXlXem5CUWF6M2FkK0dh?=
 =?utf-8?B?dmludWFISWtOeERxcE0yV1daQnhZQlA4eTNYcXFkN1lKbHZEVjFFVjBaVGlR?=
 =?utf-8?B?WGVjREdja0RDbithSXRnK2UrQzE1bWFLZUxHb3dGY3lhRTBob3A3b2RpQmNE?=
 =?utf-8?B?TUlJUGtaMy9HcTM5dXA3aHE4SXJlMkZZRHcvQTBaN1lmMm5zSmsyWUpQS1ZJ?=
 =?utf-8?B?WHRjMWdTRVRNVWk0ZXJ3T1RXeFZjMit5dWdpeW4rWVgzd1FpejNnUFoweTlt?=
 =?utf-8?B?ZUtRa2FFMkpvZkFEa2xGaEVPNWMxTmRUMEhYY1FTd0pzRnY5RnJZVDMxVlNX?=
 =?utf-8?B?OHFwM21XTFp5N2J3STR3UnVQckt3dTlzbjFUZWVHL0gzZHZqYmlxZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354f2c9f-24eb-433c-1677-08dea3f840d4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 00:59:37.2145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+P7QsYht037GLzDhR0FvldZuKwPcL8Yot7/F0yaX/cHoSMVu5UJsk8kyv13yaJ6p5jUpkIMziaD16GGbD1NAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10129

From: Peng Fan <peng.fan@nxp.com>

The i.MX8M soc device is registered via platform_device_register_simple(),
so it is not associated with a Device Tree node and the imx8m_soc_driver
has no of_match_table.

As a result, device_get_match_data() always returns NULL when probing
the soc device.

Retrieve the match data directly from the machine compatible using
of_machine_get_match_data(imx8_soc_match), which provides the correct SoC
data.

Fixes: 2524b293a59e5 ("soc: imx8m: don't access of_root directly")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/soc/imx/soc-imx8m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
index 77763a107edbd11302017e3f61ecb4369fda1ab0..fc080e56f50d423b88a673181a6bc986eb4c1691 100644
--- a/drivers/soc/imx/soc-imx8m.c
+++ b/drivers/soc/imx/soc-imx8m.c
@@ -247,7 +247,7 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	data = device_get_match_data(dev);
+	data = of_machine_get_match_data(imx8_soc_match);
 	if (data) {
 		soc_dev_attr->soc_id = data->name;
 		ret = imx8m_soc_prepare(pdev, data->ocotp_compatible);

---
base-commit: 70c8a7ec6715b5fb14e501731b5b9210a16684f7
change-id: 20260424-soc-imx8m-fix-90d7ce2397f5

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

