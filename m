Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013042.outbound.protection.outlook.com [52.101.72.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A224D2ED5
	for <imx@lists.linux.dev>; Fri,  5 Jun 2026 11:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780657816; cv=fail; b=KBcqYVgMD+rmrojclR9tYALx0bhgwykVSBkOJQhz2svz5CpT03LfVZEU3991b7AJ6qq7ONgdMGOtckmnR810swCpBfsDL9cp9FQrEzsX5pR/PH+4ALYa9I1ucN0kJqpRUZQmDA87eSKmbnH6cEhu88rJgNlmDsoV0Er+F+MgHPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780657816; c=relaxed/simple;
	bh=jaYPlUetXr9MGDdfm5HTcPKcSA5NSkkkPaJjDYsmIDs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=USmaFQMO2wX4R1ddOgGji5gO0pjf1oCbtSKQxOYjx5iDCgsTpSi8KgQY801JCXT4oTkxAzq8esMUVlArQGYOPehBHQMUEl/z6QiyQCkZEgVMbkQeGOekVdI+8NXur+XEuaJBkG03rYFTvrO2n9LJ54BGx0kx5KKDn7TSxeeafQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EognzHGz; arc=fail smtp.client-ip=52.101.72.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EognzHGz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSbFNkT3NJFM1hRAYbWbJGAwFUhow+ZoixQ8c/EisVFzoSwNotQbw0tnPICrQddYXhtllcJqKWadsPiYFlxn1kupaRKLrwB+TyzZsJerCU/gCTJYdcy4yxGiPcHLwOtA3vZKVke2MIz9cr52tOYtPrCCHa1lAUhUwpr7s9/Sbu67dreIk0BgoEAjkPSpYef8EBDvL4V10pNfDqnV2ULRV4gbglSaBmobfCIF6ae99cnKZjGja5OIuT9hWAua24KlVT5vF4wEDPCpUpktD6HKG1ckoNCTZyCn6062QxM54B3W4thrbLOvnHGCCFJQg4tQnaouaJli/nJOotzcLhWWpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwH3IB7duqWha0ZHAz45XAghAbbid/Lap9k7Y0BynMQ=;
 b=oVSZK1Phw9MwxfkLFy6/Hvs6GAFoQ++OUz54vBDl7zs9ova5noIT0/Pp1oX+nwMrdvAzO3iUQZnMb0nqzqKW+jPQ/Ik+R3fIT2eQBkdMWlDWAtzL4xWKRuOVaV8eaBirXuMLx5XTQXxmt5+HMyETvgB/ASzFrO5qV+5i8CmNRShigkkSSVAfAOPUkzJrub/iTYopt5ZIJQLa2NvVEHU2VyxAp90k4Nt9Ymu0RjoQMMMeMOhdouE26NDbQ+k2u4yFia8YeyPFzyTO2/F6ff5uaZ3w2zDDWliJc8Yf42OVmOumoLiIkXj96lELquo9b/7MD1ogkNzCDhoFZqodingo3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwH3IB7duqWha0ZHAz45XAghAbbid/Lap9k7Y0BynMQ=;
 b=EognzHGzh8xVNQfUBmvSair7cOo4vU3kM1gCVbiB5GKH334upMbqZj1L+tm7QuyfGxuCmsMzloGnLD/+xw+v9eIv4EczAGV5OwkWjV6hVNEVj63Ba8RuZe1YATC1oO/MDu8k2FRqoKcV/6WYX9MLnaYP5sm7VdkpRVdzXlPrzdhX0ez8QaU/KbFL0T8b+BcdgHMxyaC1HtKI6mITrR7Vcs7lMiwkw3DkaiAEg37nnNG/EkROpYSFVAI5NF8aQSteX+khfMWGE/MUghXyAD5KKzSas+QIZKkOAGFywojQ4+C1cTb82ERxTsVApTpbWDFUfRyRQGNSDZ2UjKkps/Ok7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by DUYPR04MB12689.eurprd04.prod.outlook.com (2603:10a6:10:661::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 11:10:12 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 11:10:12 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Fri, 05 Jun 2026 19:13:03 +0800
Subject: [PATCH v4 2/5] phy: fsl-imx8mq-usb: set usb phy to be wakeup
 capable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-imx8mp-usb-phy-improvement-v4-2-b2ddf2f3862c@nxp.com>
References: <20260605-imx8mp-usb-phy-improvement-v4-0-b2ddf2f3862c@nxp.com>
In-Reply-To: <20260605-imx8mp-usb-phy-improvement-v4-0-b2ddf2f3862c@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780657990; l=889;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=K6X20bNJ75LcOCXXDZSg0UVODfyR6sfdY4u0DxkGrXo=;
 b=j2SQgcjIu3ACsCHc4XdMmQM/zoMnn1Fua8EhJq9D3bMAYwXMVHFi5W/YgT5Goj6W2HZALHi07
 5VMwvlbGoVEAf7+BdLXYSFyghG154qVpw4pvBTZxcKxhNXwcR6cnjY5
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI2P153CA0012.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::15) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|DUYPR04MB12689:EE_
X-MS-Office365-Filtering-Correlation-Id: 2151d66d-912f-486a-e741-08dec2f3034e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NRjR0Ok5baWN+K24kQWqQLTchMA5tCQQVo8DR5T7McXObr4zMXvJwKEkGbNVJhLSBg61LNwE/gDweT3/F9IpzE8KgJTJL3Ub1ZeK7YgzP09+2esRlMTBIgDCv+q905rPQ4lxVXHcaiAgzOPPDPvdT5J1FvN3QiTfW80UHA44qMELN6HDTpeEa469S2J5e24MsrDWXyhjsExPz9h3da3yxuw3ghF0j2U5eQvfox5nRLz+f0QikUvA1XJdaJtAOQtF6fXBK3HLK/9w9hFEW2IHLEiFW4S4zQznwEkQ0PAUu0DtyaD3j4rA+KcKV/3Fp2BY7ma8P8xutn1mULEMK/yE1DbsANOmlm/vVshUjh5wzqoYpNOk8JVg5z4kpd2Z5IviMeSW0Oor9Z5qnEiwepGckQPKzCeeucAffMueRa4liBa0486n3g04NW9i44KPpgezqpR+Hk5zgg81t7LPp+RYG7Lwd4drX+tJ5N6EYpV24ZqmznEAcgLP6m/c7edPKMw+z1Ns6BWNX+kF5CY3KU2lC6e/wwjjYAaI5+qrNgmnYHbvQjQsg4uvRWm5bA03jcnfANUimLcuB10Yc8pm25sVZfN6C1LwWV4aY/pCFDZyJHrBg4NQRzOaJH+FcJoxUtaoP6Ickrxbz5/F9paNf2qgLtBATHZvdx4Gr98sawBVU2Xuae0LG5VlCvydR0kviBN8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDZIMW9yNzVxWDB5WFNVZnRoWjVOQ2VkcGFZRkJ2UjZGMjZHZEJRaFlWTlZx?=
 =?utf-8?B?NDZiSmN5ZjBYVlp3VjFNcVVIZnN4Vi9VZCtISExRb0NvNWE0a3paRVhXcmxK?=
 =?utf-8?B?QXY0WGx4Y2ZvaDg2OWdVdmdxUUxFa09MR2NXaG1QaWhDNzB0emZCbTRaV0I3?=
 =?utf-8?B?aS91ZnhERDVhd0xlYldiZUd0d0xrTlJQRDhtcGJ2SjdsR3hzWmozc2VaQzc1?=
 =?utf-8?B?dnd1MFpUaUZ3akJOVjl5NnlrQ29VZ0tZMERheU5EWStKRWFGeGpGd09IdzVN?=
 =?utf-8?B?N2JHczNyd1BwbmRMdUFqa2JDZHo4Z1kxZGtRTWdTV2dUMVZWU2w0NnIrREJL?=
 =?utf-8?B?NGladThqZ3E4Qzk3VWcvd3J4eFcwT2VzNGNCZ3l2eUVxOUdsS1BXS0FEK05W?=
 =?utf-8?B?SlJsOEYvUjcraTFXVFVBQldmY09YVjMyUmY0ek9rVm96dEgvV01FWHoyUlZP?=
 =?utf-8?B?dzFjOXpvTG4xakNCdGpMTGYrQjJlcGFxRFovTksxOXZkR1F3eEpwaE1XYVhM?=
 =?utf-8?B?aGxNV0hxRVJhN05mR3pPVHkvdHVaa0NMQ1pvRVFBaG1kdEJRZGR3L2pGNUJv?=
 =?utf-8?B?R1I5VnZIdHFjN2QzMkUzWGM4aDZRTGhEd3ZFaHozZDZDdTZOYmZ5bUlQRVI5?=
 =?utf-8?B?UGNHOVpXdVBvL3BzcjNZNGFGdUphejFQRGlJMkMyV0R5M3ljZW4yNkZiZkFL?=
 =?utf-8?B?K3ptOUZ1bTUvdHlHMUZCNFFPbTBydEJKdXVYYjR0RFZRUlo5TEFyc3dqTmJy?=
 =?utf-8?B?RWQwanFxV1JmNHRVakk4V2ZMbTNTNXdwUzNMUi8wUDFkN1NWNmQvNW5KWmEr?=
 =?utf-8?B?cjdvaFdZejJTZFFRYk1kbUdWYXZXSVFlemF6ak5yVGpQS0VBS0RzMjQxWVpY?=
 =?utf-8?B?b2p2bDFONlpabXBlbkxSeXRWQ0RGOUY0QUorY2ZuUENzVjY5d0wvU1UvS21F?=
 =?utf-8?B?emFWb1JGbCtkT1hvYkt6MnMvSkxFQTZYNjgwZFZ6YVhZUXpJeEpqazVwcUIv?=
 =?utf-8?B?dHIvNEZ1UzVwaEljWWVZZEVNTkd5Qm92U084aWpYUjFVS250M0NvTkxaODZY?=
 =?utf-8?B?QXhuYU9TcW52R1Y4U0FZT3FMVXduMEdyNVRFRGt4NVFTTTIxWHlydnJQNUNN?=
 =?utf-8?B?cDFmZGdKTmxoaWVyQjNnMlk2V0M1Tm03VWtDb1VKd2xHTjl2UzEwYjBLZk4v?=
 =?utf-8?B?c2c1SGdRNTNqcXMra21xMzJTRTM3NUxOUGNIQTBXMkVRZXFLR1VjNmJqNnFD?=
 =?utf-8?B?Q2krZHZhU3JteUI1dlYybnFtQ3g0ZjA1NmFQbDBUMDFyMXkwMVU3NjRVelZz?=
 =?utf-8?B?czI3bkdhdXZhbWhUVHVYTkdFS0R2Qms5SVJEbEl5Z1JHV2UyQVVDQnVQQUk1?=
 =?utf-8?B?UUdGN0tGaExhZXVRNloyMHk4dnJLQmlCNk5TVUdvMTRnRktPZ3Eyc0JaV3hV?=
 =?utf-8?B?R3hOZmZRdnl0M003YVRmaGV5RlpWSlpOYk9hNVY3aEpmcE9jcm8rR05Pc08r?=
 =?utf-8?B?M1FGTGVPTFBXNnpYdE5zemQvL01PM1Z3T3ptdXkzRVMxN0FCQzlndm9Ud1o1?=
 =?utf-8?B?ZWl3ODhWSVI1Y2Y4WWdKNlU0ZS9GcTBEQlBrTGpFaFBQRkJ3amc0KytaaDli?=
 =?utf-8?B?SzB5RUZjKy9HNmVNL01ta3Q5bUFtdHZrbjZQOUtLWTFVL0dmcHBzUm0zcnhu?=
 =?utf-8?B?bHVWUUhhNGk4MHIrbzNlNzIzSEVEVm9MT2s3N0o5cnFORFZZWlBlL2U3WUZS?=
 =?utf-8?B?UWNCK0JVSzl3cFpTSGlHd241V05jVThGbnVIQTJwNEg2K0czcDFmYzFGMWNU?=
 =?utf-8?B?VmowbnUvdTE0MkxkbzdyN2JLbFlCOEVScXJUWHYyZUhLVlA0ME84UEh2RVpm?=
 =?utf-8?B?S1loQ3l5YzB5cmtoaUUzV0JCcVFMQndrVEI0S25hMTZTZXRRRVdTRnBPL3J4?=
 =?utf-8?B?aEpOR2w0WW9zMHo2OUZWbnFlWXNRT0xUeEo5M1JoQUpuRnphS2Z6R0hEWTls?=
 =?utf-8?B?RE1ieU5IQnRVcmRlaU8zUmJhVGNNa2VVMWtjbm9IRzF1SmdPNkZoS0lYczM0?=
 =?utf-8?B?eCtSS3NudkVLbXhIajY2S3dzdEVSYTVKL0cxOWZiSGFlNjBlNkVydkxzVTJW?=
 =?utf-8?B?T25KR0p0RWZEQVU0TXZUL1NsWHJ4WkhjR0dVL0Z6bk43ajZadlE1VmYyYnJl?=
 =?utf-8?B?Yys3aExMUVUyQXM1dkRIWStRQ2xveWgzQXZUTGlLaGtFeU9kbmt6YXRSc2FL?=
 =?utf-8?B?ZG9CNk13OEpuZWtPWkF6NUN3QThwTVVLTTF1S0xvelRPWUJwMzRlRjhLVmY2?=
 =?utf-8?B?UG16aFg1bjJGd3NsOEdJOHYwR1ZwNi93TkxYMlkwUk1MZk5GRXI3NGhsTUMx?=
 =?utf-8?Q?01dglZ3LTTwN5Ie+vrvgD4wn1h5TnS06JTA3M?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2151d66d-912f-486a-e741-08dec2f3034e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 11:10:12.4252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJY6Z6nlOHtmobLNN8AQ59i0YN3zJwu9XN6dunMiNTBIcQVHbxHlZ9Cry7eFOl2KojAd+A+m12U3gNgYbaT9TPlEkwXUD/Dl90njqVE5wpIx6godSWEEBeoTJGHmjYwA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUYPR04MB12689

From: Xu Yang <xu.yang_2@nxp.com>

Set PHY wakeup capable because this PHY supports remote wakeup function.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v4:
 - add Rb tag
Changes in v3:
 - no changes
Changes in v2:
 - no changes
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 88b804b2c982..591ddf346061 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -728,6 +728,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 					"failed to get tca\n");
 
 	imx8m_get_phy_tuning_data(imx_phy);
+	device_set_wakeup_capable(dev, true);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 

-- 
2.34.1

