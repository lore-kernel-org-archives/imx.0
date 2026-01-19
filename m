Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010053.outbound.protection.outlook.com [52.101.84.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD4226FA77
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 06:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768804906; cv=fail; b=FqrtJYpC9+2tgrKFpaoL2RGXzNLIA9a0DZ/VSgQyse/4VPjgvz9Hp3WiQ71yNjDlnvakIaDYFzLrveKWWnArdm5Gm9hPv1CQ41N6KUXhOoHJMIfcYw0W+lcPV75DW+jXvDLHVCvsudsaSIVLVY+tnv7NKG4A34S+StdZQHhP+HY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768804906; c=relaxed/simple;
	bh=yHzU4C1DvSPKtRj8Y24Uoc/SupfKwkYlm8/nJXrUqOM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=taprm8JQxRMYMikf9/9yltYmgg03Zcz9XJ1SgTLpXJdumq0n9dhb8ykUMZGcAxpaDLu6gQfiB4lOT9ca2HCsndL8i4gpsmXHM65FU+lixHt6FvoIjxRNfCBAhP+LOWrSftSExIKvi4rc6gb5IvcjYljBvsZ1aoADML0QerMYxuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hn1wUt2b; arc=fail smtp.client-ip=52.101.84.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hn1wUt2b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tF+vaQWsRWku1G5R4o67CBEJuQ5m47mrONsd2isMMrpw+/UbTVFf3NGaBrC/620hzMd2mCJeSQ0iZXgpRia5TmNra2EmRueBnKwvUqfBiUV0Las3br036FSzNeU99JuPaMPANaV+Ml+kgGg+MLWhsfYTGBeDPY+Oan1AjtcD/H0F8j1u9qQIwLwEDGdIqkdIj5F2TQ/6IrCw0LMlvMCkrWKoq2UoAbK0MZVQ0xEHQheoUuzD5bQELZ2STdEThhzevfpSzbbA7bSQaYLZ3ia1ULhdYtssJ7SfD0oyc48KGKEm/kroaQyNZrc1DX1KM7yd/vgyIrtc5gf8xFSfTNczvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQ/ZyDttpdytI4dxs5PuuDwcmUIfNgVL9+JSF/o5Iww=;
 b=SMnr1RTY6zaTW1Zu6d5wxonEalC7vS2xGSKeGX7on6etvJW+sgzrlMaUu9PfyQnxH9BnnbVC6gClZl9Fl6khiNQi7knnwYnCjBK1CRuB5oHpntpSC5Eoo8VrRYW0KQpWhPOoOWLf2CQy+i4763roKA4KOlIcKKOJ+Pt9eeAm7PYPUuR0w7rHa1VbXEyNBLXS91uf3DRhLn77FKgumnCwtq7YGFlD/ig06Mhht9hIQjTc4aInFZEw82b90LxvrwhMRkFN0cZZRMByZWT2HxbYm0Y7/PGVDuFbu3wyhcKRC8mWEDr1Aki/zGVKBPHqs2xCtJ4fjcjYBDQPHVUPX/eAag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQ/ZyDttpdytI4dxs5PuuDwcmUIfNgVL9+JSF/o5Iww=;
 b=hn1wUt2bpAsgFCVUTZl4xaexCVyrxPZKuTGuXlIEIx55dyySaGiQlbR8lbr4cpaT5vzflfLz+GE0BCFIazCJFl/+yQOQwTDI93YXN/M//DEQCT01WVHYODDsB8hOWamRvDhHg7FepCntqDR/NgUD+CGnUF7UwW0Han/gtR8T9Ik26LB3rL+X5GwFbqpU2+PdSXYw37CtJHxnU1/lsNmx7s8qlUdsrBm7lGU7yqel8wx/j8CESKjRiHtLiAPLkueKlHoWxN9LNDwQS7i9kk/wAE0XvZ1e+vBgxK1dJlXbxiejQlZMK3qFPbG5p9NoTHDvY9JITQDsRXslvVolHErXpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by AS5PR04MB9922.eurprd04.prod.outlook.com (2603:10a6:20b:67c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Mon, 19 Jan
 2026 06:41:41 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 06:41:40 +0000
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
Subject: [PATCH v1 0/4] clocksource: Add module support for timer drivers
Date: Mon, 19 Jan 2026 15:41:14 +0900
Message-Id: <20260119064118.2493736-1-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0011.apcprd06.prod.outlook.com
 (2603:1096:4:186::16) To AS8PR04MB8420.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fd::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8420:EE_|AS5PR04MB9922:EE_
X-MS-Office365-Filtering-Correlation-Id: 18172b88-e037-419f-a98c-08de5725ccfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9ePBvti5CC/BQ6+sWupYKLqhbz38e6G4Ky/vghTiCLH6d15iG46YJt5YSy7A?=
 =?us-ascii?Q?HGqv/mZMmtFzHxA3F7R6lbfMf8cjW9pWYD5AiBxvimbwGdDcpHwBSaLUFzwB?=
 =?us-ascii?Q?VccOY0IUwDjONbSR3hdFEn2lCO2lTYSbgMm6X3dzC8FMuNus+NPvisaQnsoU?=
 =?us-ascii?Q?1b008fpf6K2wZEWYA2Hyem9UkZFLQLN2qqaGpUgdGg25gLysT1PjlT0VcOkN?=
 =?us-ascii?Q?JiJKYNBvae2yjH7mqw84OzzZsYKzrIwZzzQcVlJwER4CP1F0QpL9xPf1pIdW?=
 =?us-ascii?Q?QqbQHqKDAxCiEaXu30PhSHSc9PNq4IgYUPKJxJAWnZ0P/SCRANbU1BsZ1f2L?=
 =?us-ascii?Q?HyKYEXmQvq7vq4HAk5CLbMwKzwy26dciYiUTIgNHaA7UBidbTIWelJuAlr4k?=
 =?us-ascii?Q?7LZ/6FDN09XhRuPGdyCV1nZmeNnNtPSWMtVSJhuYT7/b7QCm4o05B+4qXZs6?=
 =?us-ascii?Q?qo0a2Sd7730n6Atjmlwj3YUUiSKkUZ+HnIpBP+ya9Vv2T/iqwhyvbVX/aauW?=
 =?us-ascii?Q?0eW6V2RNXkLtgu68Tplne/kAF+DLmwSXzAXUKaSjX0fAD/fjVEMhMxp99LM0?=
 =?us-ascii?Q?92F8OZeLrbUVYiSkxI9VwbSd5b13psuZE4BwChcNqK/mGuc4hRcdR/ScX3a8?=
 =?us-ascii?Q?87M+5elBsEjD4ffKkJ6rn7kVkQv3MYzzvTKJcMPE37X4wjkHAUxUP/sEMxDz?=
 =?us-ascii?Q?yd01oQkTlge162RU4oicgbg+Zp1yYL7Gqpv4Ey+4InZo7pRC1kbJ3ADJjlcD?=
 =?us-ascii?Q?RNnYzr0Mn/hkYankp6XZj5ajoetQq8aULLFs9x+l5FAFK5ntfOGFbXzfYYYs?=
 =?us-ascii?Q?9R+d2WEOKafjASAigEsl3fxAq4Juzh3HNllkA4vwVVuRyLcbVJbt5dDuuco2?=
 =?us-ascii?Q?xjEpogXYX5MldjUkqe1FhLN5RRKFjEtJ4pHVu4M1Mj7ri/lfYQfiSFbyxSRq?=
 =?us-ascii?Q?6lWrj1nu/c0w4sDauY/LC73E+An7uT4zNGtfuZe92/SHFZrPjJq1SyRozjIM?=
 =?us-ascii?Q?BEldZFm7FOA8GhEHwBtI9/6oWyLH8fYLzeIHwLlL7omGCV4iLnSlWsmNqsqj?=
 =?us-ascii?Q?9/RLcEgTQ2NAqFvu/76uZZPYt6a8X32+3WSNrF/4XtodISHhQq+ijnua6sPP?=
 =?us-ascii?Q?KUW4V2MKrHtV4ug6kZMte/shBEm3GmGAxKXRHy7dwuR1CO/KIvCmLoxjo4E2?=
 =?us-ascii?Q?Wh1apmjDl5vuqpwaG4p7RBMl3seRsBnL6oYk3lR1FwyTwdu8qZMbyTFmNm8B?=
 =?us-ascii?Q?4LQa8FCfgT8a7JnrLRl7Zj9V3RwpwaxI1KINecFpVM0Txj3nK4Uk7glhS7Gz?=
 =?us-ascii?Q?jw5GXit9NX3hU947cROKlrukgA9w/t5FtS09ANkJF1b2Ug/A+1SHOJn39vGc?=
 =?us-ascii?Q?/4o6xTOAm9osAeFv4cqDI3to1ty8SXZK2bhAs0c3S/rQA+g356yKpHxL2skE?=
 =?us-ascii?Q?3e6k9ILCwd7ejtjCgq45p+QNcx3mbnF504NgvJo6gwUHKH4cjXFKjaRz6p3A?=
 =?us-ascii?Q?08N141nMvKAGm10+Iw3jYL2ecy29s15zeJBE9jfL1865S/x4SsEo/bKkvEPK?=
 =?us-ascii?Q?txtkljWZu8GZaVmXWHuJ5lWYunxWYWubQqA02rEgb1uq8G39cpdYfkITmBhe?=
 =?us-ascii?Q?yJ0fwO98NAk5ieaTtS0E4Hk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4tRS8H6JHuZIMtsiUnX8erDYYN+8a9AZfalJ9AjyfLNW3qNnThNllo/FVB4M?=
 =?us-ascii?Q?yIdTEkx0iI1594iPpVacIj3gHJIAWqmQKWW2y+lDaNL3XMHSyQGKbUvHF528?=
 =?us-ascii?Q?Prcz2DM2c/JPlsNLWYOwII2Ft0ZQDVfnNSFH1yD++obR41B4eNyBWO0DqwIE?=
 =?us-ascii?Q?BXbhPg+3aqw1HsmOvm0jda1rTt3VMKJWLyWvgUFf/5Slfl4cc/8iDHx0uPqh?=
 =?us-ascii?Q?Jk1MyNF1Sh+pG4pGwob40kOEZBIcYYWvzhAFhwXS6P45irMWBXMTKprCA4Tr?=
 =?us-ascii?Q?MD5pZTtksLO+6qSAd/VYFmJGmy3kF+RLVz41vHRjovJF1HK219smehqEDNpo?=
 =?us-ascii?Q?EhemFmqN/rXAQkyvkmWa6hyAo+4ExYMlRqMJgPLWvyPnYDB8u49yzRjIOUE4?=
 =?us-ascii?Q?IJ5T50L1Ih82uj3K/1DO6xWWsplFAJgbQN5PRNtoh+xO1Fbdy+EdEjxnvEMI?=
 =?us-ascii?Q?2XCOrorZQHffIgV2pHEd2Imn1BWbH2KRRA+xOnzP0IGouG08KlKyW1owR5Ff?=
 =?us-ascii?Q?G5ioH96mdtPSDdGdBkTsyF5ggj487GHRG7e08k28LBgZKgKRXwKCWETCXLkd?=
 =?us-ascii?Q?sNLaCzH+Fod4bdLzk3NwPyr7qB+JzlUi4zADg5GmnjZCBqKwAHT4xxi/Xwbe?=
 =?us-ascii?Q?SktNVbZ/qJf6OiOH+55yRUpevOGNtRlPYiVPDUxoCgx+tTsCg+TV2sFehDZY?=
 =?us-ascii?Q?frROURVTCCi0BNGGJ4vcjHoAfJA6GKNtkA8bZgx87iTq4J8JScbrh8+KzZ6t?=
 =?us-ascii?Q?1Y6D7UeBkXQ161ibI+WSBFgBa+w0ltjihmiPSNkHwFGdWt5y8ZTpCVBZwiJH?=
 =?us-ascii?Q?TbCZqxxTFWh8AMrRQYrEY3UCccEzzET1odc6X1cs0M2CZ5+ccFrXuXNgtb2P?=
 =?us-ascii?Q?hozt7jX+YbwR6jgDSv45uHgon7bzznQ8odegyBT5f1p2idNjIXKwXpJfWXho?=
 =?us-ascii?Q?VZnUueeDs7SlhHYs3EcasxNuHR4kAVdF4D46cWj9TQ3wixWMhkb2aUrNzxPq?=
 =?us-ascii?Q?22DaPU+1a3OHLELoBfvrLFciSbNPqAmzuHJlEUaBOydbZ3x7g2B4Y5EvbaRM?=
 =?us-ascii?Q?KhJqe9amp19fFSgvLROoKPqHEgrQCHFdky0zS0Ea2eB8XsbARKThA7M6isFJ?=
 =?us-ascii?Q?DfDPd8VblNINDm7UvpiFkcHL85Ty4XSw7Y4R30pWPRn19cnGGBYMit5pbpOs?=
 =?us-ascii?Q?v24Qdj6kbPgfepRJGNYeuvCXmkzaDHGEW8KY1fmk4bWzN685lx/EYgyxRZFu?=
 =?us-ascii?Q?WiVfSKqwEdGTP/CNL2tlM49PXGoomNMg0cymzqzxJ86uFkgJEE9J5EAaiPW/?=
 =?us-ascii?Q?ulnc13WPej0ztUG9G1KR8Qsy5kTfKcbsWjdYBk3SGF6CL//MprRz2tGrIW0b?=
 =?us-ascii?Q?2Uclf+md/EL9ZmPv7wmu0s2kEiKMSxvAyO+C/iw+v8t8w3YOSjxevByQFuux?=
 =?us-ascii?Q?Wonb99/c057mKNaDlNuGwt4zTqFrOYfuJXnTaCdqSv9WkVJIM8tp2as3Tgf0?=
 =?us-ascii?Q?OKweI7XDSOfWA8zjyGz2Z1FpKDrqy9nnJ1aZFFwxUyMkHGbZkL3XLiP0cr4S?=
 =?us-ascii?Q?32YU3LSw3SQ1YORKOx57ZjK2NK/m2WFfGW5bu0pVTXER3SuWaXz5TPlWhJ80?=
 =?us-ascii?Q?wLHsJKhnPdNCpxWvvTPr9qGnyr3WBzuQZVGUA5iS64e+d3vo70MfJKpJYo1h?=
 =?us-ascii?Q?0JYN5q7/BmlRFP/4+NTcybiaR1EzF8SA51rfEr6tW/brkH/linOMA3utGMdy?=
 =?us-ascii?Q?yW4zgQx3sQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18172b88-e037-419f-a98c-08de5725ccfe
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 06:41:40.7912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SaSKq55C4w5tDH+uUhoyxF2yUvOa570XNvsCofvCb86YYjv7qtm+CePlfeEmeyZEWO7SOmsjSbpkw6qQDIaErg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9922

This patch series enables clocksource timer drivers to be built as
loadable kernel modules, which is particularly useful for GKI
(Generic Kernel Image) configurations.

This series is based on the previous MediaTek timer modularization work:
Link: https://lore.kernel.org/all/20230517022557.24388-1-walter.chang@mediatek.com/

The series includes:
1. Export necessary functions from clocksource/mmio
2. Remove __init markings from timer-of to support modules
3. Convert MediaTek timer driver to support module build
4. Convert i.MX TPM timer driver to support module build

Testing performed:
- Built and tested on i.MX8ULP platform
- Built and tested on MediaTek platform
- Verified both built-in and module configurations
- Confirmed timer functionality in both configurations



Chun-Hung Wu (3):
  clocksource/drivers/mmio: Export clocksource_mmio_init()
  clocksource/drivers/timer-of: Remove __init markings
  clocksource/drivers/timer-mediatek: Make timer-mediatek become loadable module

Jindong Yue (1):
  clocksource/drivers/imx-tpm: Support building imx-tpm driver as module

 drivers/clocksource/Kconfig          |  4 ++--
 drivers/clocksource/mmio.c           |  8 ++++---
 drivers/clocksource/timer-imx-tpm.c  | 36 +++++++++++++++++++++++++---
 drivers/clocksource/timer-mediatek.c | 33 +++++++++++++++++++++++++
 drivers/clocksource/timer-of.c       | 23 +++++++++---------
 drivers/clocksource/timer-of.h       |  6 ++---
 6 files changed, 88 insertions(+), 22 deletions(-)

-- 
2.34.1

