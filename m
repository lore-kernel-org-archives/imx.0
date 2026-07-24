Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010018.outbound.protection.outlook.com [52.101.69.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BF0423764
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 10:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889071; cv=fail; b=FejBdfKWXRDnicrgTa7MGQmO3tSZpahT0Hshg2HBbl9u4B0bDYEtJP5HNVUuXudNIbMNgYk1RoHAqThq10rcIW8OF4yhXbgWz1FlyNESb7GQzY1vqGpiyye35dKbs65VGib0A1Dioj0d6pA2hVIZjGxpiqtv+812qy7CoFccTko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889071; c=relaxed/simple;
	bh=4zjovtsOJXLl8AKPZaSuRKZIXe41+Hk982ck89PjdQE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ld+8i0HogLsm3ILaKfnNXeMoMSjxjHdl1TksmbJYFkbUaeuOI5LKwHDyQqhsmGPQBqR65znarsRQdlz9xgtiX2cDSeAij5BVZk//4gA5YBLe49aLB5+v2WXvHS3+/qttS+Ha+dgBG1iUrgKmPZiwJj6I0fFtBOga8GVQGF61zsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZyAgeVN0; arc=fail smtp.client-ip=52.101.69.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZyAgeVN0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrUI/IuCNMjynYnagU18mqhjaeq/fosvmnGYoD0e1CnOd2gg6zqhwcHk/1kFhpo0lUVCeNpXU3/zNNj2sgcs+RqPqEEyUfeTumJJDpe7rSdgM8Q0GRQe+sfsWIZuX5Wk1Bk9exonYE/wzjB+cAh6dXuhS/6cTUm6LdKwEVXNKhckthjLLZz+SDw7IFN1NjaHjMbUXVPht0eMeezJ/320DRd2w0o4y8eDHkFzKTFPiYv6xkfGxaaO01QuwUI+C/2nDduRgpp/Zk5BeEHRH2FCJds11Mg61iI8UCsKsrAH4x7QRpcRGEaGgmbF1PnqCm72s/RDvptsSChuFR8HMPsf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0oC9GLUETeoqPRBFnnV44eIkfFIv3cc+DiS4Un3O/eo=;
 b=Hx9DkCX0I4tVD0yDLmCUrMlRzHWBPvVWLZZmoGHMCh//X/CgNkPCfSxGGyIFKZPu47WWuy0Br/ASDu/XHHHWa/ncoSckkP/tF5xsU8djIjTivts7flffo8Mo47QQKJh/3eeEl2FTyzdVYcri8+O5S12IbMiaFgBdno+AOKYAWL0M1tTeO5wmJEzGg2kRXDPcRkoxvefns2jUbGNhip/ixwYMYWbl6AaFW6vBfATVJas7C1HRj2cGii/ARn/ivfy8aAgTF6kG3p7fxe4nwYu2KKWOFnnkXWqZqLJoRyM2uzuZ/z8BvGFpoYwCnlSZOogyE/Q5nhoRXiLzXG6NgaRrRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0oC9GLUETeoqPRBFnnV44eIkfFIv3cc+DiS4Un3O/eo=;
 b=ZyAgeVN098TpAgvY+yap3x2aNZkMqLg8nkYErCfqhJ6EMyLctvea+egaANwibgl/8RPFIFvf2Zycmdk278KlHChERfFSbGrx2rYZ7IrqxzbbKiNdx2WR5c1hKxqHhhq4Up8G4HxbaPVNT7HPes43ne9xIAKBTKbkoJOPGS7v6bC2DBnIm4woEftaxOuQrnT6HYOPd+rmB42lcBeJzfdQA26PHOup8RbztlqPgwouh6r3lWAGB0hVOwIq5fxCYpqzb9f4hIQHzLGSyscvt1Jva/eRkJLyKgp6MX02pt04o7I6wqNAab0J7/TGbj3wTUcTfzIU0LellYo/w2rqcrMx3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB9738.eurprd04.prod.outlook.com (2603:10a6:800:1dc::10)
 by AM9PR04MB7668.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 10:31:07 +0000
Received: from VI1PR04MB9738.eurprd04.prod.outlook.com
 ([fe80::33e2:39d5:e3f4:580c]) by VI1PR04MB9738.eurprd04.prod.outlook.com
 ([fe80::33e2:39d5:e3f4:580c%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 10:31:07 +0000
From: robby.cai@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	andreas@kemnade.info
Cc: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 1/2] regulator: fp9931: Fix VPOS/VNEG voltage selector table
Date: Fri, 24 Jul 2026 18:34:40 +0800
Message-Id: <20260724103441.800522-2-robby.cai@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724103441.800522-1-robby.cai@oss.nxp.com>
References: <20260724103441.800522-1-robby.cai@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:295::8) To VI1PR04MB9738.eurprd04.prod.outlook.com
 (2603:10a6:800:1dc::10)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB9738:EE_|AM9PR04MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: e846aa4e-7ab6-4c35-c9e5-08dee96eab92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|23010399003|376014|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4Do3uNtuk3GYGD2m47egjeKUbFkGqBz0naWlTJiKQOjOuJbABFB0aKZ3jWLZVxmi1jWvKF6YRdYovGS7ngTc6omeAMQJsnpzum93Rp+o/HMgR16M+tyBNn85unsrGTE6c+622+WY4U39bzdZCydWnpsN7mb96y3in3O+Jm1R55IsLZOlQbniAVk18b8i1SoATyEGxex+HJ4Y7WlvbF1E5MtELYUi7IjER+e+bUYTfxOG0hoaqNt5boOFUAHbGFH6J8fT6U+F8mE6b/uBL9+gRvrGMBBo4mSai9vTWERb6UyJQNclQH4Yaq+qIvsBZNhtX1yjhxJ9Qu7xpOTCHn1UajZoHhgXbSz7BNH+DAgLh0j76Why82U/9pCqS+fNQ9FtYMJIhFrABmxefUGcJZh0MPNAuRlioRHiI83OkkfWNRC0/EYPLTNUqKLdYkTPsJQh4thPPPnPY0KDvqVczqstNsiMYQYbwJfYVb9NLYoLl0WzKVdGnAeMX0K4NNLgWfE1KSRwl1N3eh28eS1BvD42XzyV53PmQ3XfCzJmeD5AudJD2UEaZ0PsOaRVbMQ0mnxo1ursX4xzU3MWIOV1yt2YwRyG82lsBPXmeaxQApztUkGY4VRkQJePZAvYZXmlWc4MndWbdFjLN9vH8TvHntee4NZ/5noZvgZbFxNKOiqhNBU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB9738.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(23010399003)(376014)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SoFMFx3YvL3wBFFO0EF6Rb6CMKnNY9cdEH7ypyoJ+f95anM3G2YUrS5u0iFW?=
 =?us-ascii?Q?CPqblZCLSuMGaMniEhDXEK+gb953C+bxT8HuCtFsnxuwlLYhgRUNQu87QlpO?=
 =?us-ascii?Q?JMvnb2gKp65whSoxvTOnoPRvX2axgKqrGAqwp6iG7rQq/WXflNvFF6iDokem?=
 =?us-ascii?Q?qfpYwQeX/fHgGmbK15nPWl7lhtUHAlkwGQ5qpkJEVkVaWgpROx7JbF37X4OL?=
 =?us-ascii?Q?tzQVaAAKY5A4OHbKR3EFNBntSrXQRqLJIEd314/UJkC+Ax9I/WltFHIkUojT?=
 =?us-ascii?Q?jsfTFSxHJyHG/SPAgtMWCCQx9cVRrCwfy0QsMlFXgg7rv2OaHGq0w989wiWC?=
 =?us-ascii?Q?8HmXlcF4z+MQcoWI1WM9jj8FusAoVrv9SMBhLkKsBQZN5dgGdprVV4jxC/x2?=
 =?us-ascii?Q?3kmaRcDmF94qUaSkyWencCPxnz6gtPW8ucLoSkM3aJ93+fOJ0xPEDswoNpka?=
 =?us-ascii?Q?pbH+LWXliJiDkIfx33kluKSr0quirrAiW/AQgcq/vaDityio2cLrJbGMUkhv?=
 =?us-ascii?Q?65kCCK8Fx4tDBAzFNNfeEMZ3io7eLEm77IlPgKsWR5aJlMFgbMZnJ1LjVK17?=
 =?us-ascii?Q?BybqRnU90djEgkYq7H7n3PRWF8+lm9u7QfyTqQTvOJ3PizAIFiAyTpJVs86v?=
 =?us-ascii?Q?vQRZkntk0yCvEfwfXzw1GirbC11O+UBHfGF1qs/dED4OF0mNLtKWFaHO5bPb?=
 =?us-ascii?Q?OUDH/vY+3Liis3C1YLY8YuZiKj9oGw8mRz/3prmAhluAl2whF4dwXg73q0p1?=
 =?us-ascii?Q?jcSTZWK9aYllgQ2o5r23xSEVREV0ZFjoAd2UGWTBlEFkZ6XI2jO2DpUMyu7K?=
 =?us-ascii?Q?E5mbZUG/uwMkhI0mepWZG5EWjfmS/v5/6vn3+RbUAMU95LqlHzZgMSrY6Ps9?=
 =?us-ascii?Q?JPweRTCChpL5nhvlJ+njOuLGnHMmxIkrs0gjlh2jlHziw52gCrN8pue3c/pA?=
 =?us-ascii?Q?kgBCxAoWa62JmwQoWFlG/qbxnZBr5GbBX/2FRErsXAM3/cwpACknLCLBPrcO?=
 =?us-ascii?Q?lBpKSYfOM/9QhyBiXbS8tL42m5sqD0l2rAEHXYmv0h03y+00ZY4S0mXk5HFa?=
 =?us-ascii?Q?c3uqhTtLta8AtFjh7g/tSFrh8l8HiKFDuEYHrC1392qmHhhXNJxbVL3DIxmC?=
 =?us-ascii?Q?1WWyVan7sgiU9t/uIDKSA+lPDmDGH/FaNaLQrxN/Kipt/o9QvNAPQLNC0Hor?=
 =?us-ascii?Q?Y9zPebXExHuTL7UxSWEtaOye7ik4UxcH8BgBVbSqsiPjP94sKmSTRQ3qfZpv?=
 =?us-ascii?Q?XidygwHYmdbLKfNu0QB6n3YgpohlEU8RT5xb60Su7djGidoLjSbzkqC8Q/+M?=
 =?us-ascii?Q?P0YPgnBH8e/LVssxwqv2QuSjECFPxd2m6fPQ9K7wUUQm7thzVr3SANIS8EGn?=
 =?us-ascii?Q?Sbg0bSCVl3hD5p2/SphhdmMqTiYiKqhSWGy9z5NFNuGbujAVhE1+yHu/zXDc?=
 =?us-ascii?Q?MSdDhw0YtctnIwQEmsDaTEDekJKsYG8NMR5YIQpY1i6E+3KALpufGWHp3Gl/?=
 =?us-ascii?Q?fDPPVkcv6W3RHL1XQaAxihEXbDMy8Zb1n7ZHIhMXUll8feRNk8H76pPGMy/t?=
 =?us-ascii?Q?UDZUIS07QfSDBfJS+Q3qf/+BIoqm1XJMA+npqhuIYJAqjZse63heHGLVYI4w?=
 =?us-ascii?Q?+OfRAB49zMbeC4xPXsGCBdY8QmxTMSlYWNj35fjR0PoE9aQ8h6qeGA3eEEoX?=
 =?us-ascii?Q?55Vd09AXTd43uHiU/aPszsigEcPf6HsDiQ/yOljn+IbGOQm+ZX3l+w2UpLz4?=
 =?us-ascii?Q?I7LgxMz/fHj1H6oX5PoWkAK++WR70kNDI/d3XgZnPFNQV8B0H+yY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e846aa4e-7ab6-4c35-c9e5-08dee96eab92
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB9738.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:31:07.0080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RA4+vy69yU4h2oC+BRe/jWHRlMVz26LRcy3yWAQ4ywlp7Ty39I5xBMi8CxTPlg8ZDhbheWXtY9I+Lk9E/SG/s4LmfPrfHzdjGVfsg66xofMUHuhwX9Gs4QLgeNMZw4+m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7668

From: Robby Cai <robby.cai@nxp.com>

The VPOSNEG_table[] mapping does not match the FP9931 datasheet.

The datasheet defines the VPOS/VNEG voltage mapping as:

  00h-04h ->  7.04V (-7.04V)
  05h     ->  7.26V (-7.26V)
  06h     ->  7.49V (-7.49V)
  ...
  28h-3Fh -> 15.06V (-15.06V)

However, VPOSNEG_table[] has two issues:

1. Selector 0x00~0x04 should all map to 7.04V (5 entries), but the
   table has 6 entries of 7.04V, causing all subsequent entries to be
   shifted by one position.

2. Selectors 0x29~0x3F should all clamp to 15.06V (23 entries), but
   the table has only 41 entries. Any selector value above 0x28
   would result in an out-of-bounds table access.

Fix both issues by removing the duplicate 7.04V entry and appending
the missing 23 clamped 15.06V entries, bringing the table to the
correct size of 64 entries (0x00~0x3F).

Fixes: 12d821bd13d4 ("regulator: Add FP9931/JD9930 driver")
Signed-off-by: Robby Cai <robby.cai@nxp.com>
---
 drivers/regulator/fp9931.c | 54 +++++++++-----------------------------
 1 file changed, 12 insertions(+), 42 deletions(-)

diff --git a/drivers/regulator/fp9931.c b/drivers/regulator/fp9931.c
index 002b41f53eff..ff743a8b0dfe 100644
--- a/drivers/regulator/fp9931.c
+++ b/drivers/regulator/fp9931.c
@@ -37,48 +37,18 @@ struct fp9931_data {
 };
 
 static const unsigned int VPOSNEG_table[] = {
-	7040000,
-	7040000,
-	7040000,
-	7040000,
-	7040000,
-	7040000,
-	7260000,
-	7490000,
-	7710000,
-	7930000,
-	8150000,
-	8380000,
-	8600000,
-	8820000,
-	9040000,
-	9270000,
-	9490000,
-	9710000,
-	9940000,
-	10160000,
-	10380000,
-	10600000,
-	10830000,
-	11050000,
-	11270000,
-	11490000,
-	11720000,
-	11940000,
-	12160000,
-	12380000,
-	12610000,
-	12830000,
-	13050000,
-	13280000,
-	13500000,
-	13720000,
-	13940000,
-	14170000,
-	14390000,
-	14610000,
-	14830000,
-	15060000,
+	7040000,  7040000,  7040000,  7040000,  7040000,            /* 00h-04h */
+	7260000,  7490000,  7710000,  7930000,  8150000,  8380000,  /* 05h-0Ah */
+	8600000,  8820000,  9040000,  9270000,  9490000,  9710000,  /* 0Bh-10h */
+	9940000,  10160000, 10380000, 10600000, 10830000, 11050000, /* 11h-16h */
+	11270000, 11490000, 11720000, 11940000, 12160000, 12380000, /* 17h-1Ch */
+	12610000, 12830000, 13050000, 13280000, 13500000, 13720000, /* 1Dh-22h */
+	13940000, 14170000, 14390000, 14610000, 14830000, 15060000, /* 23h-28h */
+	/* 29h-3Fh: clamped to 15.06V per datasheet */
+	15060000, 15060000, 15060000, 15060000, 15060000, 15060000,
+	15060000, 15060000, 15060000, 15060000, 15060000, 15060000,
+	15060000, 15060000, 15060000, 15060000, 15060000, 15060000,
+	15060000, 15060000, 15060000, 15060000, 15060000,
 };
 
 static const struct hwmon_channel_info *fp9931_info[] = {
-- 
2.50.1

