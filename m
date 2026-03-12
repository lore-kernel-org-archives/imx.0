Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013030.outbound.protection.outlook.com [40.107.159.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4702E974D
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 04:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773288027; cv=fail; b=UickW2vk+x2/o3ekdHLhEDo9S6Snogw65a0V8q0mRbXLmfFaTj+Lqa6+xKCe1AV27ZpEY1QArIB636wdO08KBUL0bte1/JImPnKMiiTTtHYJ09p91aNL40bc+ckrqrVfXzNk97fE65Tg0JrQBFRaNHqdjZQ3R82FrInhV5M8ccU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773288027; c=relaxed/simple;
	bh=TnPss/TaWTGasy8W3wP6YchrFWWmPdACNWxP9NprDyo=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=JWnRHBoOP9qlikeG/WANRFpoeXaIhYwnKL3vrOlM3sylCPGPCA4mRD7LFtEMqniPBbZQL4567FC5WEY82bg+r6JnhmCWhob8i0SCijJDjfDAhmoi0myQyBcXXbPKT1hQzUtHcC9Bhud8NihQIzjeOlWOoE8f06RYB/CuKMZ7FQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=P8a8GkhI; arc=fail smtp.client-ip=40.107.159.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="P8a8GkhI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Meb9LLXAwjrrixyBJFt7GxQcWZF2X9VEGXCfJ44WEQ3kk0fVwaI8pgaB18MnjzJoV5XraV0odx42Xxh90DZyIxfcvNjUaBFg6/3wwCqJpDaF9W1RJMvT28Vt7MTqo52s8J8Q7bVVQFW1PcWqiXDrrGhcWyQuiCrTbTDIp51veyCpvhCT/QDGSkHxAuhNduKQS1U343DtTmGIIMxC94jRRyUg2vpDRQvwuhwrB3OpoQ6lPB/vW3cAToKolfF0HZ6WGY1sKKPjQIDkd040cMUK9QDXlUVPXht0jZ/uPuRr+hRyqJokKWjShfy5rSiQRGZeWkhyWJLVsN1f1HDHooldOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2E/DcVC2MMpqgveq5m6vECkqfOata6GBm3Z75si7rs=;
 b=P2K/fkSl/FRfcHZKeaxdLDLGn3AXAxRuUMGKlKthU9klloKc2fqXPCbJSK57WK0+BrZO+5zvKKaqOjuh+8Niw12OwJ2mQejrej6La/6f1J1Z2O6K0hs7mPjaIKPkNrbTKirSMKTt9YRmOPedJrh8RPxX2J80N9RyfGEiWmNFDqVFsrdLyHu2HW47JcD2To0enITEDqsyFyop55tHo4Uv8stLee9ZKJDH+BqgoqQiWTwJoAxzVttGnfmjAtQX28DG+SJTxLTzMIoCOHEEwODKneQ5AHAs3LHgmawx8LIn25xtw+XaJy55P3/r1IKAvsdTgrXFhgoosrsc/u11TtpGVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2E/DcVC2MMpqgveq5m6vECkqfOata6GBm3Z75si7rs=;
 b=P8a8GkhIiPL8KOixaDDNVPTRWjBCfQWCbSgMHL4BtxY0TIznzwAfR02qUHldzg3jpkLQLVjeDut1wG1ZKsanlmnRb9K1CK0NcaMlLUpZLc24UC+bUoKlDNMQKlRyLz52lT421iWTiuXcjXLBAS+c2NjjS93jmHccvtnOPejLXOBaM3T+f4ijHleKK5MrUiOmoR9GZupCEH8nmUWVTxrnc7A8BI68zS3WMiV7NxrdAw4VoR4gwxCPN/pdTZ2kqLBlTx453B2gPFI3UU32K8Mhg8q0VQj++IMQnWfkTkuYNfnepK1AIlUggGchjTT7AWu8eAbs9eqpkvTdQkjW33/sCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by PA1PR04MB10368.eurprd04.prod.outlook.com (2603:10a6:102:445::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 04:00:20 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%5]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 04:00:21 +0000
Date: Thu, 12 Mar 2026 12:01:48 +0800
From: Robby Cai <robby.cai@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, andreas@kemnade.info
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org, robby.cai@nxp.com
Subject: [PATCH] regulator: fp9931: Fix error handling for optional regulator
Message-ID: <20260312040148.GA4007088@shlinux88>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SGBP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::26)
 To PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|PA1PR04MB10368:EE_
X-MS-Office365-Filtering-Correlation-Id: a009bb93-7646-4c1d-14f7-08de7febe155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|52116014|366016|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	DlKXQB1/buRJYvVvl5NyhSuoS89Et/fjSMca/Q6HSWUZQwyr+IID995WU+ZrpBot16qv8S9/3YKk9z7Zc/22Wq8SXNnqGKbGH0AMTZ3pXxCSpzxuzdDbyz5SUehSm74xggnBEaSTWCa5v1y1xyArUrpVfwTLQP6tLUUyhHL350lkvTT3anbsEfo03pDT89KB2xDS4FDGeUrcxlmJXx/2Gx6B4Kk2NouaDOZZzdZNHmzLPWv6IIZlr4KrN0No29lQ+4vHinhGJwltaeGT10Bob+bdbHTPAyAp2DF/+QeY0BjHDvf06e7iha9sxkA4h/dWJjfBo7FMCLEasKDB1/M2m0CLmUNJPnNY3IfqlTWyHGiJone+v0BbfGHAuMrjFN2iinNjSFcMsiF/q7Gk0O2nrlOd20HpjFFJpO9H5ppcO5kASiSEuqnaFQEW5jlhGh4ZOEGWiGxzUcm8Guk9/W48rkk86v+OVlsovZPUpyC8Is3JJlppsZjmVv/icedOaAOm2xYRQgHzefCbSOfRA5JRHqRuQ6kLE+AdvEXDGGgy9CDDzYw+nzG6ljN1/SduOpOzYrXMWknV7/hE6qZec9sqhFVg2tSBNB7q/31daJq8wC0GUeCEyyIIbsQHjwiQbYlVlCavY05ueQAjqIcjDVnxRQI7ZiTHbG/kEmsjg29NzwFRFFkJiMrEp251ijIfCri2fPSXNSPNCBMUy8cX59xNZY1FLD7jXVeN57GXf6mABfN0YNkJCfBX+g+jMpJ+2XxIevMEll+pawBVxzrqjt53DxU1a79HeQyayHSQR0vAbh8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(52116014)(366016)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lKHbKuEZue5/6NQaqT965SNqvG6lhXvvfzUQmRgLarivFa9Efvrkt9TYIBZB?=
 =?us-ascii?Q?jv7a0xd1UE9G3RBlDhMChvp4xC4RDuXPtPyvGgV2ggXjdL3qo19zygJbrmhB?=
 =?us-ascii?Q?9YvoNjkSqVuj0/WVirZGW0doB2Cs9+/4gKFsxQJhwSGZq+njQFApWTPQ3AQN?=
 =?us-ascii?Q?p2M02wmJHgOKNl9ymrxhCeTc1wlEnec3wRdebFh3fYTDBvK54+Poyn6OAfna?=
 =?us-ascii?Q?sA1wG3gk01FL0ycFUqw31Yz6qLdB3t/2ekLtyjr73B4zT9eMUt4Fb3OPYqRa?=
 =?us-ascii?Q?vOZNyecVDg5gMJq5Wz8HyRHC9dMfXStojW9NdFHTVOdJGrBJZw85skh29Uv+?=
 =?us-ascii?Q?P/5dbPbysUdzAbDlXdgrmDkOYvPb7SVml/HekWMcZGMoF2pkZQv05HqhXnfK?=
 =?us-ascii?Q?oOUW5jypTJCo/imCAyHrKnJzxmOiIdxnlA/BedNJogUyCFayq9Mep90BkdPI?=
 =?us-ascii?Q?ar+A3MsPA13Y6FGFxR4hYk0YrM900BNuNYyzbAyg9NKq2ijWatk8ucJtOwow?=
 =?us-ascii?Q?RmXdAcOUoc1CBl33IXFSB/I1hOX4dkL/MdgeKr+wLAfnb3cch+XjX9y/vH7f?=
 =?us-ascii?Q?ZzbnBE6uujMMaIim7wBKGW3bEyarTejZvEpTMX+DWLbpP0V7hVrW7JMLDuD4?=
 =?us-ascii?Q?kjyy4J7cgsUxt/s+h/NlejOyyr7mr3PzgMBM497zUu5+PQFA7jVK9aPV82Ra?=
 =?us-ascii?Q?+pjNKbIRrcK34qCClMVEZgL5GCscZm25zOH28USOZYkIgmLLqZy0SguDTVjU?=
 =?us-ascii?Q?8Bhx3y8Zve1FvYXqlm2WnrE5IUBYqHAJ+pm698EqtFc/szqABLJrdtgPwwBi?=
 =?us-ascii?Q?4f0EfZDr/0pJ29Qj99Wzg07Ku/LVQcM9Pv0zicF4rEITdDpYMWaDk7ti8Yy7?=
 =?us-ascii?Q?9QI8do+OwLilBwk/y65llekU3x/VdJlCAz9YvDCJpWrF/Gd9bzqGsHBiGEpv?=
 =?us-ascii?Q?CEnzE3sRxZNxawQFEMSKAMVkt5eD/1SZ3VJJs/27sfJYHoxDebGod0Oh6sHq?=
 =?us-ascii?Q?0YFwSnwC0QoK7bLMGudv2eFBWDo9EnySPa/OgYY28XoZOFWZ1DjeXNEziWiN?=
 =?us-ascii?Q?VmNFpM8qAjRXeCbabyYwwo8p+v9UitxeBrYoulLuXewB0B+5Z8Nlgp838mVz?=
 =?us-ascii?Q?nXJZAUUaF54a+/Tv/VXUUFwdK118OJud4J08Qz3Q9hHggJCx3+bc0pIYAHeb?=
 =?us-ascii?Q?s8d/SVsk334n9rCmeZWiZdhx+BMqhea/t5/dS5ThzpbAM4z0Zh/uZx+FSV7o?=
 =?us-ascii?Q?x6o9e7u4RUXF0NCjnK+dg0r0x9BBFFp7EPcKfuGqtapCq4i7iJoGcTyv51g+?=
 =?us-ascii?Q?WOrmhfZCMkSsr3datVQcfxC2Rfe5qq0qLFcxodr/qGK671jzuh6fCvqd2TUi?=
 =?us-ascii?Q?4r/4rBixMKY7YdQz3vDnWRTJdFDsg45WrlD6ySzNullGFUEvm+tl+veksfqG?=
 =?us-ascii?Q?2OC1xHqPu4bT1x0jILMGPyxq8dnNlJfOTvHvXXEEXsA4E0qdTVA9+rsjFc+z?=
 =?us-ascii?Q?0eeQ7VTB1IcXb0zLv0zu2ZTNdF4dGGdw3Q6ea70kW99qdyALGnMcod7Qeb0d?=
 =?us-ascii?Q?lbX+26jmo3UlvEUdsZZIH9iDUhDGYmuH/9yfn6xOocRael671ZV14QK4rOpG?=
 =?us-ascii?Q?qCVw+CVJH/6gRXNhLnGYsWN7IcaUmr7g/9s18pFwekQYaSJv0XaLa80cnseC?=
 =?us-ascii?Q?Cx2NexQ78xbW1eSWoWwLChKj10Vsp3arKfuZGz0QRr142YySxiYX3avmYZS1?=
 =?us-ascii?Q?ANO0dQKkjQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a009bb93-7646-4c1d-14f7-08de7febe155
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 04:00:21.0334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7KXs4LsnFdOfOy5UaOTuS/wRLBIlg/OuQi8hLJcQ9dzJfKprbJnGLZx+51UGVWOu3znXwJK2z+Hwafn47Z7Img==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10368

If "vin" reg does not exist in the device tree, the regulator framework
returns -ENODEV, which is normal for an optional supply. But the current
code treats -ENODEV as a fatal error, causing the driver probe to fail.
This patch fixes that by handling -ENODEV correctly for optional regulator.

Fixes: 12d821bd13d4 ("regulator: Add FP9931/JD9930 driver")
Signed-off-by: Robby Cai <robby.cai@nxp.com>
---
 drivers/regulator/fp9931.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/fp9931.c b/drivers/regulator/fp9931.c
index 7fbcc6327cc63..fa7f32adfb666 100644
--- a/drivers/regulator/fp9931.c
+++ b/drivers/regulator/fp9931.c
@@ -448,9 +448,13 @@ static int fp9931_probe(struct i2c_client *client)
 				     "failed to allocate regmap!\n");
 
 	data->vin_reg = devm_regulator_get_optional(&client->dev, "vin");
-	if (IS_ERR(data->vin_reg))
-		return dev_err_probe(&client->dev, PTR_ERR(data->vin_reg),
-				     "failed to get vin regulator\n");
+	if (IS_ERR(data->vin_reg)) {
+		if (PTR_ERR(data->vin_reg) != -ENODEV)
+			return dev_err_probe(&client->dev, PTR_ERR(data->vin_reg),
+					     "failed to get vin regulator\n");
+
+		data->vin_reg = NULL;
+	}
 
 	data->pgood_gpio = devm_gpiod_get(&client->dev, "pg", GPIOD_IN);
 	if (IS_ERR(data->pgood_gpio))
-- 
2.37.1

