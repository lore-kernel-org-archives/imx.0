Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010020.outbound.protection.outlook.com [52.101.69.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24103358B5
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 09:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816564; cv=fail; b=HUloxqedExIKrFGYsBB6UCncMolufepeoDADMXehZ8Ue5iAz9GMx9M5P6QbBl8eJsqrPANNwbwUUsAr//YwGeblM+e3X4pqMANHOjOHEFuKcTs4tEK3mP68SLN384S7p61KMT3hDpvowKzlZyWky3Zh/TNLtIELROtFl5EK2gQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816564; c=relaxed/simple;
	bh=/rKmKNphZtSA/zY3kXG6P2OQS9xoeHmMYBrTZxfuhgI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kHDx9ZlbnE05EI68x63a7nEL6WOlEF2H19pKns3ld08qsRC+HUIPoFE5xY991TKorfi/Z2JbmkYQUNRnsHcJHk7ra+yTNAnlikrBnvfnIWNQ94sco8ZZzLV45R+5Us7urCDDatVVskP1h+LT/JELrAxq0wf8+XSbN62hhNbEJ0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=a6cRKYvU; arc=fail smtp.client-ip=52.101.69.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="a6cRKYvU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NcHpIPybqcoMH6HJuZSXLUx5xMx/DXKF4XP+68kf06GR1utCoIq4aeLZY3kjYB4N5GW2E4sWZFRtgc3jDSFwr+ds8tlAhAJwIlYzcbph//ZRaslFveQ1/mErV37AznTngesW5VG5fJDSG5ctjEOFK1cn/auY8FQovEuJip6eQEiiHGaZFmnVxzazXTMrRm5lQL0jOkZnH98JMzf3H30hMQ5LKB2nIFZYs/BS98JJsTWqRAFGZN0JfuUFYAQJ7L93Tjd9ZNVUxeFJQk/6klHS/ILfUzfxNQi5H7rX2fd7g9UuLk62YRPew+S9EHFQP3LnvpOCF/4Yy0jSL3KkoXwYdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0ToPWlqM5IariVFWZrV+Cn4lvYFEG4jRycm7SqFCkk=;
 b=KSs8TQygDJiCnrbjiX1eO7AIFrGDwY55G4wLUYp99HHh7cykFSAgJCDwGXWXigVFtIeb579//dss+0k2PJwKE+LnQNSRBJOloPjtaLqu3juc7rCsHxvdB+ewuzITi+0sK9xHEE2/i257u7e+5UAaYP0KOzZMT80vCv71RnArygENuFeHcB9nejRB0i5w4yXLVFG+gdPJFdolW0agZ5rPSc+62JT5u5cgcBidPrSniqwqZCOpeLSGHd3hcU4420UPnoJ/N/8y1+QXNzmMbQHCf8iWsHhiFcrxt4LEO5kYtPE/8G2v+zGMGMSAfWycSOiQaRJLCNUXtyU8CpJctL3Ttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0ToPWlqM5IariVFWZrV+Cn4lvYFEG4jRycm7SqFCkk=;
 b=a6cRKYvUnbXTV0uEDPIn1GDc4OGctVhoKKUwF1l46+nEYW7b2VKTl+vc04BNjpL5goEkmrlryQYdzlfZGaCB4gPdRvL3MyAtHv9+Lp82uu6eZzc7PWUAKuD9T6eAkMCRBPvUn9A84SJCWH1IBETBbcG1edeqUTpmxkpDvlnDixXdBjCd1b42cjmGpYVLdwhM5ZuJhf6ergv0cbozxiLim380OOoHuClMTiTKw7TO/tkGPL2PgLFjPXnhdOZSVRfUqVrG+O1Mfw12RVjUQkdU4ckQX3frlOIgaEk+1qPLP6YE4gYDZ/vVHhuAKBp1+fROCgVowzqgiIjmeIEz9875TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by GVXPR04MB10899.eurprd04.prod.outlook.com (2603:10a6:150:225::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 09:55:59 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 09:55:59 +0000
From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
To: daniel.lezcano@linaro.org,
	tglx@kernel.org
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com,
	walter.chang@mediatek.com,
	jstultz@google.com,
	amergnat@baylibre.com,
	aisheng.dong@nxp.com,
	jindong.yue@nxp.com,
	xuegang.liu@nxp.com
Subject: [PATCH v2 1/4] clocksource/drivers/mmio: Export clocksource_mmio_init()
Date: Mon, 19 Jan 2026 18:55:08 +0900
Message-Id: <20260119095511.3030739-2-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com>
References: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0241.apcprd06.prod.outlook.com
 (2603:1096:4:ac::25) To AS8PR04MB8420.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fd::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8420:EE_|GVXPR04MB10899:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb9343c-447c-4685-556a-08de5740f296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6X9e4+C66L7JtoGIi5D9qTuaIDVWxHYETl37ZyUFChpxjp1h0wlxSOboMkCZ?=
 =?us-ascii?Q?3dLo5tcyr56NNA9zGREUtXEIug8DTxaFZvvJ3y/32F1EMf89/n53utdTpVNz?=
 =?us-ascii?Q?Ch5XFC27sFBXHLhLsZpUXqXwCDK0Ac+VL3Rcu83ALvAvg7O2rWRlNtwaflUr?=
 =?us-ascii?Q?Jww1IhSMNSE/cKJvF+H94yFJ6O4pbWNKbrQRf70Tzpil8XHVnd05ZpSUSsRH?=
 =?us-ascii?Q?qwGTroW/oonbnigvLeIarWtU8qnYzrvmayEODn7X1e1gp6BasGQyRVW/CSdt?=
 =?us-ascii?Q?rk3AbH96CKZy/bitgY0SCkJQI7BInbM1Hs6AYDEGh2pepk75cqjN8vzMbE7c?=
 =?us-ascii?Q?c7ALETzfwBWllcPS6x3ONTdzgOJSk+RScF9nQTARdiYjGnG2e5hyZUcOtiZi?=
 =?us-ascii?Q?9kJ6QYjr8XHW2FLJ5dp5PRzF4G2IU7ii5KRJsROhK7eXklo2Ahu0tDyYA4vt?=
 =?us-ascii?Q?y1/JhcBgZuR+DR5ZQXWrKlnUHL1MtvpDIH9VQ4IwNzzqQtUV2VwugcOzaPQF?=
 =?us-ascii?Q?pEHLdQp4BTOgC6jxNwTAWaDPHHEQV8LN7BShNELT2GZLxUpJQsoFDSIS3/It?=
 =?us-ascii?Q?bB6Gubo/dOUvVW95e7igmufuJ7eqg8V0Xpe/oIxDB+B+swfeDh8BvSs9PjQD?=
 =?us-ascii?Q?M4JYa6irF5ksYUcP57buLyuxSEdu3jrBvh6NjklPsNH6ZsrBvdU6SbNMAbqp?=
 =?us-ascii?Q?8WeP/VntO4ol4PUjKT5Iow0pYMbTiec9nHxO16dQO71hEJLYWj9H2ttr+fbK?=
 =?us-ascii?Q?yVu0iEI5L7ehHJsoS5kCJs26pdxcnUrz0RjAXu32DkfnuDtGK0C6vBNM9Vyo?=
 =?us-ascii?Q?Pk2QAC6FSXShQ8vNXS6J/y8Ui3X5gbf6zJ80Nh9gT09dNZC6Un2IxQT2Q0K4?=
 =?us-ascii?Q?p4KqFVwdxb+0WR7nLg3E5nqH8ly9RQ3StiM0Kx5+Gk4Q7ojrKkC6y22ON/NB?=
 =?us-ascii?Q?Ga+6QHfh2FZvCDeDnBv7fOhTJiS0ApdE6TVYWY4rCbOhAN3kIDiPWrI3sFq5?=
 =?us-ascii?Q?IQvHPL+9E8kWP+WjsxwbdbPpRaCqeFtX61DMMJ/Z2lytYc8o+XFMmooBWz1l?=
 =?us-ascii?Q?Gi+fqwW+yU8BFfp9oOwdDjij26/37q7I+g3HO10NTzNR9Sv9v8CR2jza2esC?=
 =?us-ascii?Q?IYqr+V1LYvvxjlsLi7TVm6eSbMnnLz/SxM9u2woOrjNODve4d+0rupukA1EJ?=
 =?us-ascii?Q?LOeRyjNAzCA+Eo9fgfTeIlmJL3vC5isIJ5TEomLHz2dllBYPm6mQ0AQlbS6A?=
 =?us-ascii?Q?FPUxYI/OYxLHVhTXpd5irXMaXgN+8I1ttHmRnv/GpbbX/tcgBK8EfniAKZOI?=
 =?us-ascii?Q?ET7GCSNqfyioL5dG5/816g3piCl4qI3Ji5ZhAL9O6jILffl4Ogf1Yu+bTvZ0?=
 =?us-ascii?Q?VG3rxgB29iavutMXUR4VRyfnuZppo7nb7poNXFkWmJXrpaDcfiIwie7IapzT?=
 =?us-ascii?Q?eyQsAF37gKAKDRimH4hXLbEWFdpZaQ3uR0xfYKimMYlfWbZm2Z+35vc9B7DD?=
 =?us-ascii?Q?auO0NOwUTzgOMLPAdcpoCNl3W1+TI2jIWw0scfyOzuonyK8KmtX8GJkRpKAO?=
 =?us-ascii?Q?K7+mJIPWZmTa1drTo3DEgu+yLmJbGK3lDR71069AouHbTTpHeXoGt8rE3Srq?=
 =?us-ascii?Q?4F0Z1rWcGLTKnXtT2lQGhTc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jJdR+wINn2YxSYg5RSVzy3MtGT/1HFmlCtUDDm1QNIMZzsTiP0uWq7FuMb8w?=
 =?us-ascii?Q?vZM8g/8JMekCCluPfnyne3l9wl6n1Z1hSukOXpJsqP3A9YITcdwIDvoC+Rza?=
 =?us-ascii?Q?Apxpf3wg1+Tf2rfWYZ0YCiXrZTkvp7wavw7lt1eOsNg1bGSZLrEd3ieAaHkI?=
 =?us-ascii?Q?nUoEH5zsQ3ZV+g/Sz2gb93aR6VnYfkVBjqhdctNHC5VwmfwEpnZ8fZbazUo2?=
 =?us-ascii?Q?70apgV2AnKzL6ZO0CZc6mbRuCkvE/S78iVaLOKkyGsuHcqYQb7YV7NZUEL07?=
 =?us-ascii?Q?uq2NyJq/nwBg/BBsIuZfXZTD/tZpgn7DnXw/g3SdxOuSOsnl4SMRVwH6tmZQ?=
 =?us-ascii?Q?qob/Gpw8TVDk42c1TIFcCfrnz+CKxcO9eJ80ltY4ZnndIxnzflIr2oblBd5l?=
 =?us-ascii?Q?Jj/8qpvTm1ZYjfPfliilGp7JeF6A7X6uz3T6ppFSjks4wrwI47DIee3V+7iW?=
 =?us-ascii?Q?i5dpFsI5/CstjK/63S+JmOW6nAtOCs3NQNHgcD79KkAjWc19WlSwaeMFpFXG?=
 =?us-ascii?Q?5fNl9syBP7lTPQpzpTHjFToGyesB7V6hZek1jJBO3F8Dkb/1NP+Q4YJ+bt5T?=
 =?us-ascii?Q?4P06t3c6/KgAh7cV8Z4XdLf0ORs5XK72s1kKq3VSSy7liw5pR6NUvqC6FPNN?=
 =?us-ascii?Q?dp8ELKMUfw5GFb+i8MFxDc2lgJ2Rnt1L4+UOYJU3h6Qgx5IYz8FtaTOsi81O?=
 =?us-ascii?Q?LSLHQ5u9SHDrtp/qbQQ971rW/K9a7264awUsN7cqT5jklDjG2vV7CYy0hJ46?=
 =?us-ascii?Q?a1gpIvv3TZb9FCiz6KvbtbikTSNz4N/nYKeSryOJnGsQs8pefTOIPIMYtDdm?=
 =?us-ascii?Q?vzVppXnEpumnVaF0empz82AR0CWreKZvu4EGCuzSnSBUR69YN3YXZ8WR5NC8?=
 =?us-ascii?Q?JnGjQ7ZkGNHCS+RZ3M+hQJXJqjTUmDWaoOKP9SMQ1K+mfTlmjgUUfqz+sm9t?=
 =?us-ascii?Q?QB0uY8VhEkVNsX6crS/gV0lN1k+xaKiaweJK14ZE+if/6ciqXa99+8pYdFYo?=
 =?us-ascii?Q?2l05x2aDzcHNMEO8eoE7xfVbkcDhUTuVTX7GDD2ncpje/T1zyWmtjmo8b6DV?=
 =?us-ascii?Q?y61qXVfd1/0O8Il3PQSeF2AjaVswF0XrpKnTXkYKCOGqTlBuc+GQFoe0TXQV?=
 =?us-ascii?Q?jrsgluXj8RTbOWCsZ0TdpnPc7vicvSUlQRIRV1h21h+/1gxbg9W9IohWMd3s?=
 =?us-ascii?Q?kcDx9ppKRiyQsvUwAaXZLFOu7eP7ULESI2TEd0wtHuUWN9BV3hDeM4tryZrG?=
 =?us-ascii?Q?jeMG79NVetFpf/mCYwWsRf70A+4NuwNcz/qeEsT4ARoRw0+50rrpSU0IZdxq?=
 =?us-ascii?Q?DLqbe6o0HFcuMvNe697UkJh7+4o6xgfRUXQeWwrnHFIgMQT7wIwKHwuC2nw/?=
 =?us-ascii?Q?uDbsy9QUEYeg/RFSvYuB8KGv+cSDlGYJpblMQugB9La9iH3msSI3L7o2NIIk?=
 =?us-ascii?Q?DqU2IeC2U4uEtU/LMnJf3kICWf9POwTpZZFoGm4KBSoDywdxhnD73yPoSTjR?=
 =?us-ascii?Q?CicvUb89MGwcrjXSNg33lv4foXtwvhYBT4FKYrFTDZo23QYGUNGTEGzmc+oR?=
 =?us-ascii?Q?OMIoaXazQ3OFoSUyZOlY1x1Fg7RalRarZZWc4J8gyd4FRxbC6ETEeCa6LGLN?=
 =?us-ascii?Q?nrN6rmFRvZf12YsC+EiB1bLi5HTuTCxgtQTE2/1dSdb6VCPN/5Y/zyTVZ2Kq?=
 =?us-ascii?Q?bUOG9pSpr0d8xVds7KMNFucQp3hr6nW0s9PW8zbJuC5AxcuiUKzUQsytN7zH?=
 =?us-ascii?Q?adoNZpiVig=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb9343c-447c-4685-556a-08de5740f296
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 09:55:59.4746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQ5h3i1yG06o7dg3UAODt+Up37Uwp+cOBPKolkubixhB30qjBdR6JZHQMs67rAwgWCdNr8uK6ASPwmuuiE3S4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10899

From: Chun-Hung Wu <chun-hung.wu@mediatek.com>

Export clocksource_mmio_init() and clocksource_mmio_readl_up()
to support building clocksource driver as module,
such as timer-mediatek.c.

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Signed-off-by: Walter Chang <walter.chang@mediatek.com>
Acked-by: John Stultz <jstultz@google.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/clocksource/mmio.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/mmio.c b/drivers/clocksource/mmio.c
index 9de751531831..95b591c8aa4a 100644
--- a/drivers/clocksource/mmio.c
+++ b/drivers/clocksource/mmio.c
@@ -21,6 +21,7 @@ u64 clocksource_mmio_readl_up(struct clocksource *c)
 {
 	return (u64)readl_relaxed(to_mmio_clksrc(c)->reg);
 }
+EXPORT_SYMBOL_GPL(clocksource_mmio_readl_up);
 
 u64 clocksource_mmio_readl_down(struct clocksource *c)
 {
@@ -46,9 +47,9 @@ u64 clocksource_mmio_readw_down(struct clocksource *c)
  * @bits:	Number of valid bits
  * @read:	One of clocksource_mmio_read*() above
  */
-int __init clocksource_mmio_init(void __iomem *base, const char *name,
-	unsigned long hz, int rating, unsigned bits,
-	u64 (*read)(struct clocksource *))
+int clocksource_mmio_init(void __iomem *base, const char *name,
+			  unsigned long hz, int rating, unsigned int bits,
+			  u64 (*read)(struct clocksource *))
 {
 	struct clocksource_mmio *cs;
 
@@ -68,3 +69,4 @@ int __init clocksource_mmio_init(void __iomem *base, const char *name,
 
 	return clocksource_register_hz(&cs->clksrc, hz);
 }
+EXPORT_SYMBOL_GPL(clocksource_mmio_init);
-- 
2.34.1

