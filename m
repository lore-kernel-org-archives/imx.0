Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012019.outbound.protection.outlook.com [52.101.66.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A8F33FE0A
	for <imx@lists.linux.dev>; Mon, 25 May 2026 05:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779687453; cv=fail; b=kgL+pjFht/LziSBrR+8dGUMNJW1yQWpwKnEpmUAApUahjYYmfXneF2pVDXRAumaL8U4cUkHdxV+Hc6sV2D6TPU1jUsSvz2hPKxF+RGsvWus1SaJ8yShfjt1PkZHlZM+x551eyOyWxLTFEujqRXmSbEtYNi5PYXx7eFMZzVF2xeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779687453; c=relaxed/simple;
	bh=mJ29aQZzvbOvw00y8uY9RfYRCA8kQYYdnZaPTJYZEfU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Y6QG2Esdscs3zDSt+/+hNajJ1TamrB9u5ckBRwaZA9Fwr1AkB2H58+BWPyoiyBHrvrfpdlteCe8UAeLolHPC2QNtZrzv7zAEz6rRpoJlkNqWmO2R/WZShc4f0+2ZobramZtfwAdZXjlRfKW/ddjC3cqf+21us9jzCZC1Uwij1+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rU1Yev2c; arc=fail smtp.client-ip=52.101.66.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rU1Yev2c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2KYtaewQxJBdEoAdxiNzdepaSKkk0kbplV1YgqJMzGCAhmsoNdD8b8j9vfLzQv/1UjqmuVG/x5kyQk8s6DdazHyAZbcvrublk5V5QiheQmDfdJDExTPR67EEF5n6CrglOqG614Ux0ihEoD714WwjV70S07EY5sLGCF1fl/SnDjo1Uk9INmnvn4iIKe6gYJAeEfwEaVhV0tFqr7GPijZvMV+v4tP3ULiyWDBb+uot3wG8ThvhsSLM2NM0WOlyk6s0hYmDmU40r7H8L+s6oeynvOVmmD62mKJsVv/eTMKq+50viEaZodgamgyarMEjWNsSu/VWDD55CCHKTNSSuW/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHZoJy0xiEIS4lmLiCMCQyXHbmJfx5IGFt35n+Ab4jw=;
 b=B0kbpexRUCqat24bAUL1qpUncgdClByG2mAIlHYn6+EvB20frL9jQoQj9ARooA+Qfn9WudSC2sXsnTSgkjNGUh7+ChP06NSuhPgZGFGJ/WPudGNXdji4E6dRiKaJWjAqFpMTP7RON5blVoFk1kxNf4Mj0QLMWWWBucJsr4CMeTWGtdVc3/UbzcvzUoMn44AN1kX0HtU+dWAG9RVGHtnvV4/zJ56aLXf/bG2UYx+jNXB4/b/i1uuvo0/KwNPIR5HM22IxTl91rxabqXvrlpA4cqZHhZTHbQXs/oHQstpo3+ggf7N6R97CWOebaxTPj+1mZHw9WcCvA3iHAXQwLoiTqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHZoJy0xiEIS4lmLiCMCQyXHbmJfx5IGFt35n+Ab4jw=;
 b=rU1Yev2c9ngVnKXxpzAG4xDdm2jpwjxt6qJ3FYEXF7a3HoyaTBqZqqrX4FU0jxdQpmMz4AetBXTtOlCrE7Z3NMXQYf1nRchki/WXnDDQRkhd4DpQxDvswvwMVUZCYG8Vmi0E8loevu1G9jx9KAQHBXsTSGHU69xVFaMtkW3vuqhPCaJccp20uN0s+2YtiUP6K/KqHzMD4cSFFyNbaWBUouYRk8BRLb7cGh5L6GT1T55lYaGYjDHBLyFw9TVUR5fMUw1LnGPh4nnF3xjsQHrImActzBIHzBU2HNdTqN/QC6WsIxrhXX1Qcirh4Zg1iiL4y6pydYWft7fnruTQjW7UoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by AM0PR04MB11996.eurprd04.prod.outlook.com (2603:10a6:20b:6fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 05:37:28 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 05:37:28 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 25 May 2026 13:39:30 +0800
Subject: [PATCH 7/7] firmware: imx: ele: Fix debug dump size handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-ele-v1-v1-7-a9570c4bffc9@nxp.com>
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
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|AM0PR04MB11996:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f8ada1-6807-4853-bdff-08deba1fb535
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|19092799006|38350700014|6133799003|11063799006|3023799007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	g71WV1iJ0He56JZWYQZaIEcGSVzIm5wIIcOHmJZWz37RgTX4G16Tq5sjAsEoa/CiDByFrUmimK1bv4vbDMmryTl6rOr339D9yMwnedcMzMqKIcz/ahWuDRreusfugYL4E0GjoOA/N5kB3XpmU7LNa+F8HS7NFiWX5njIubLJ8Pf360A/qaTyP6sHjMJQgTr0OfBWlQr6vLONdTkoUD2VVzVLKS7OjONAZLJUfkZCKXVUNsd78nvJJmLbenE1bcvviUVnFrfYTqU4v647AIsFW2dVGKxmvDGYk4tOiYJNVt/G2YgkPoycxJhHepryeJozSWyI/EoERp+dzc9KhsGv0mnwHxfBI2wz8Snz/3x718T9ZieSvh+HtGrTK1lA4tZVRR89+qLJ2+eIKP6mUfQxSmbxM62Pq9+VrviPSn9BxjoLZ9YB9YRfp2qouDabWFcqOgJ67FgA3yD29x7lfkkJPjWy796/0cPZ+g3VvuWOt9V49LjZI/HCnu6aVe6K/P4p6H3/2WhNfXkqy+Ue2Q69CgBY2qI7/btyBZoXJKW/uglnCx7yFNnHXdA2O4mteZ4z7Xlh9j9iaRahghUxFi4LNyhhvsG1VnJQoliuIL5Bc5I5x89/LwLbjK4j6YuaaI8gLGPw5T0O94K7alYxN8iNK/JZ0u4p1RAahLYSflNUqvTjl2wZNTFo/RDhIYxJXHqCYiIY3Ur9xvsMuueFuu3LmgDisY9ibsl6iJ7ifwQhGXgPaNpQ/8vhtky2kr5rO9Iw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(19092799006)(38350700014)(6133799003)(11063799006)(3023799007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEx5aVRxQldEZmNHeFRzUGM2WmYyaFk0Nkxlb2g2VzlYS29hSjlRRjNmVzN2?=
 =?utf-8?B?M0dqa3VzRjhxcjN3TEdaeFpQOWVwQVVoeGUwNW0zTHord0k2Mis2c0l4Tndu?=
 =?utf-8?B?amhvektKUUM2Y0VkcWhPNnAwNXYrOXJvK2taSGtRWGNpdk5qc0drOGF0MGR5?=
 =?utf-8?B?YjZpVFAyenVPdWplWkhuZTJ5eG1hS09ObXpySW41dDRHY1hzbktwL3NHNnpZ?=
 =?utf-8?B?TmRSSllpQUl0azMwWmZ5UkVYMG90YjNNTXR2djNCMy92K0EzWlQrdFd1TmFp?=
 =?utf-8?B?TDBoM2t4eCtXdDQyOUlnN3ZKRUJwVzRzYkYwUlRJRWlCYWZjV2RQL1JFOU9m?=
 =?utf-8?B?eEdDZXIzSFVNN3g0YUdTRmFXRkJ2U2ZLaFllUmtJNWNKVmRocytTMHAwbmR2?=
 =?utf-8?B?TjdHTi9ibUx4VUtYZVJwYVBQVC9wbFZjcERjSGpkTWgrQlBuMkVJVEIzY2JP?=
 =?utf-8?B?VGovQ1lEU3FCcGFvSDZoemtWUHFRNEF2bmxWRGJvM3pOY2VHWjJocVRza2FK?=
 =?utf-8?B?TUo1VTAxSnJMS2xYa1E4cUZOd0haTnJ1dWc2aWtzVlFhczlmREp0SHBlTDFG?=
 =?utf-8?B?WTZneit0WjZDdUZWUmsvbncxdVdVOC9pcVNWZHhFS2V1QkNRT29QUnplZC85?=
 =?utf-8?B?SW9tb1dlTkR1b1VWVDBlQVdXdWczWjhEcCtaaXEyK0NVU1FCWUFkYTNQc2Rp?=
 =?utf-8?B?NEVueUdxd3FtTm41ZDdsUXp1VVBiYnhFN3hFc1BCWUQxWktUKzhxNkNHRUxa?=
 =?utf-8?B?UXhaeStSRFgxTHdpeXZtbWVoZkJEeER1NFdqckRQL2ZLNHQ2YTAvVCs1ZEZM?=
 =?utf-8?B?WTdnb3hXV2J0OUI3dTRGTW5FZGd0UWtuVVV6TDdrQWNMN2ZxYjVCTjdlRlhP?=
 =?utf-8?B?cThjbWZ3R3F4WHZTNG55dzEycUg4VWt1WXFXbjZTZkJOQlJGaCtYeS8zd28x?=
 =?utf-8?B?ZURPS21YWXR6T1lnUlRQanlrUzFzM25YVjRvWE5oMzEvN2lQM2N2Rm1oUWJS?=
 =?utf-8?B?Rmw0WSs3aGszSkdFd3VNQitBanRPSWVrd2NqUEF3UlpvdlhiYm5qWUdVT2dY?=
 =?utf-8?B?aUFXM0RtTnEvUVpFeXNpVEdET1VsZzlHZ1BTMW5qN0N5QS9XVjZTSWREOUJX?=
 =?utf-8?B?SzlXS210QWdNQmIzN2xieEV2QjIwcWF1aS9sRis0U1M2YlhWNXpXa0E0VW9Y?=
 =?utf-8?B?dnY5Zis5NDh0U2YwY1VjMzF6VDF6UWdvTDFaSzhtOExFMDdHV1dIaTJHMTEz?=
 =?utf-8?B?dG9RMzNQMFhFNzgvN1RRcDhuM0FyTUxXbmlUTklMQzYwZWRaV3pFNWxXRmwv?=
 =?utf-8?B?WjBrM0toemhjc0d5QUgvNHB4WHRtNTZ0VlRRYmRGNkdJbjNPU21rekdWbWJj?=
 =?utf-8?B?WStGT3ZXVG1XdTd2U09ZdDJkMWQrdmlmUlRHejhmQTBqM045Nmc2RGFFUnJq?=
 =?utf-8?B?eCs1V3lEWGVpNWlYMlNwVjhwYklTUFZzU1g0MmdXSGw5OXlOcUd1V25tYkNq?=
 =?utf-8?B?L2F1Q21RekNBeWdzYi9KSExBbHFSb2tkWkF2Rzl6Q1RRMHVhdjlCTkN6Q0cx?=
 =?utf-8?B?T3VTQ0liUDJXelYrU0l1UzdWSjIxZjAvY3hwSlpycXcwZ0RNYUhHQStlTlhD?=
 =?utf-8?B?WEphNFVCeHREdVpkaVkySENaV0cvd3BQTHBkQ0d2R2VpUjI5YjkrTEVtNlor?=
 =?utf-8?B?MGJwYWdyYkh5WkZEbHhFZVBoUXFMazN3QUdIZ0Urd2VQREt4U0k3S0NSVVBU?=
 =?utf-8?B?RTkxcEp6Q1BuSWtkM3NMSzlJWUU2RklEcXhFVUpCaW42L1hNdk5TNmh4c3Qv?=
 =?utf-8?B?ZFZhOXg3azVuWlRGSmpXSTdGbk1WVmF0NGhiQlROZ0k0c3R1a3ZvVEU0bk53?=
 =?utf-8?B?NUw1eUp3dGZxK1pmQkFCY3NBRmsxa1hXem9XTW5yUFhZd0hpWFBLUGZkaWpO?=
 =?utf-8?B?R1p5ci9iLzEySXJmN2lKSW5yQTUvWnBjdFk0aUhlZHJVL0NjR0xCMjdKZEQ4?=
 =?utf-8?B?SVRIU3dDM0gvaDBYenhNM2tMR3FueWJxbDRycGhISzYvR1ovUCtkQkxScTZK?=
 =?utf-8?B?Z0lkZEdDbTRYcHpSdWI2Yk90M2M0ZDY3TXNxc0FqUzRQV2JMYnBiaGExRnVT?=
 =?utf-8?B?YWFsRkVHZHZaS0hZcGZ4Z1BRZ1hJby9WS3ZXM2t5eTRvUmwxbXdRZ2NCenFw?=
 =?utf-8?B?bjZ1NjlJeXdWd3BVMitRWjAybmxLMVhuV0FxV1FVS2k5YjJ5S0Z6cjBLN01s?=
 =?utf-8?B?bG9uVUR2TGtrK1VDV0pSaG1wbHQrWmtxa2FrZCsvNExFU05YaURzTmRtK1BX?=
 =?utf-8?B?ZXcyWGdGZDdiNCtESkNJYm9waStLL29rNUFjQm9NVzl2bHlGRG10QT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f8ada1-6807-4853-bdff-08deba1fb535
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 05:37:28.0716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3lVuYarAyANq76f0Ej+tHrCa4dJ14NDFzoQiP/x0zofbdqF6Ry0DJn9e7VEpdD9RQUck26YBMsR/Qh1NRGm2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11996

From: Peng Fan <peng.fan@nxp.com>

The ELE debug dump response is formatted as:

  - header (1 u32)
  - status (1 u32)
  - dump words (2..21 u32)
  - CRC (1 u32)

The header.size field represents the total number of u32 words,
not a byte count.

After removing the header and status (2 words), header.size still
includes the trailing CRC. Therefore, when determining the number
of valid debug words, the CRC must be excluded as well.

The existing check:

  if (rx_msg->header.size > 4)

is incorrect because header.size has already been reduced by 2.
Fix it by comparing against the remaining minimum (CRC + debug words),
i.e.:

  if (rx_msg->header.size > 2)

and then decrement to account for the CRC.

Fixes: 106ffe5d78ad8 ("firmware: imx: add driver for NXP EdgeLock Enclave")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/imx/ele_base_msg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index 2f0046cd5ad06d28c11ad5bf7b8544d1aa9b9bb6..ec718d322abcd7e120d916bbcbcf691f3078c628 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -290,7 +290,7 @@ int ele_debug_dump(struct se_if_priv *priv)
 
 		rx_msg->header.size -= 2;
 
-		if (rx_msg->header.size > 4)
+		if (rx_msg->header.size > 2)
 			rx_msg->header.size--;
 
 		for (i = 0; i < rx_msg->header.size; i += 2)

-- 
2.37.1

