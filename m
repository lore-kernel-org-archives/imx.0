Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793874857;
	b=dkBg4IuBUoaMwBQaBOFzHjA/LUUMlfKwjOfJsTk/bwE5Fg1To22vKEnEyiCWH4PPbEu5
	 a25fp2RPOAujrqFDOpWohG6jabVuUdYRBV3nuNv4EaM9yP+20f4kEDmlzsxaTgAg+l2Dh
	 mhqqRDBHRHx1PxpADe+wFsrm4aBDlVMb5cn+NToPLO6CHc/eEdiOcUkJ8vrufE6TZMz7q
	 BZagMGbwUqDRi3HHd5FxPxYjys5dM5uVG3k8lB6+GYRrrQBpffgip0A1lNyrqLihaIAXQ
	 /1pObESqwhXoO5Z41sAiOUKk9FJxRvh7opL2e+EzlMVSDynT0ja6Z7KddH2J4urGjpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874857;
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
	bh=LGYeWZACCwLExDZvLoxltm3R3fMi81hCwisfqN8hC8s=;
	b=KgnydEWv/WQyOM0nwwdrzrQIvYgvrarTyzzPsQTy4ucPplL0qkTQPXNaGKw0xpPWqbBc
	 EpIgQslftsSHsOFgRsoQCLZRUuYe7wcmZY4uLy4FhndHd59nwPznyGqswA2S7oLblowWq
	 V5Kl231RPMiNmB00Tdie0dzKxCahhJeQruol9iCsQvKPxWk54d1mhE4lP1Jv1zIqDqPvk
	 VQ5oTWybkz6xefE3vhONoLv1x6Q5rXpbRiOOOhPQK+7sdmxXYbCcoqqqfpu3RaG1+onPH
	 /XIlZihQ3zGqLmx4qOo7fwEm79e4vVxdF2BOZSRdBWdBC5EG/+v+j5lxmo6DK5iVXxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b="a/h82aik";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.5
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013005.outbound.protection.outlook.com [40.107.159.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4628606A328
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 10:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4628606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=a/h82aik
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sm/rq5lr8+EOb+BWBzSUO4niD/hsujgqAIQTVLSGf1ZhjO5HAfqFaBJGnfMGSXoOsO3Xh7htwD7vctVaEq94LA1/bbtqeNfbaO58A14y9Z9md2CPk9usiijpZULC8F7575v1Ar8Y6x9F5mr9r4a4GgBJN3G0Aw3i5plp1n/TVYOu/7n9ytQH6GkaHnfiPjU39fTFiagB/D2VB+RSGQJtxa3W0Dd5KjLWSiIBz+se71KP72neC0NXEMh2c2lvh4R/NeXoj4/rU2I+fG9NnJj5TWZAfVUzxqjIv6Z0cDEvF0s6nrBsc+BktZuW6XK9h8NwJDSXzJ3wVZQkksECcEA0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGYeWZACCwLExDZvLoxltm3R3fMi81hCwisfqN8hC8s=;
 b=KEvbD2tm707ELA7qtPdB2X6Of+n5bsZeovNfgzVhYghAvO8IZ4+QtFSIQVZ1fXoxWWmb05wuy66xNtmHwTMHaLgalaB84cJUlsDaWSil9bU8Mq3nHpRmLUms69LqDqDPu8txJ5Dd4R6lNVBGEOtApdbyi4ZvonhUvvGUUNcjDVOSukXLPf6G+U/avTFjx+ud+MEW48C3yWFRIY8CvvqJhNmQwe+umxkF0qlp6O6SXb1KRRHbDlLPy70FzWIsaz2fk4oH5yGhr/9UFB8Z9W0eHNbIjFJmt9WOgdNveTMsdEWhByUNrXfhxH5fXyqTWwpbfXYg42mtWH1smMo4LwTjLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGYeWZACCwLExDZvLoxltm3R3fMi81hCwisfqN8hC8s=;
 b=a/h82aikwYoAnPx9GdI+TdbFTPZ3TiJWTlBBmdpgG3Tdprre+ZlFopMfGMEkLYy22IgNlh5ZlT3uR8LUhIGSBaiCWWIlJrMgbMCiWRzzsE6Z1jvWNmTH4GG/IKkju4RCUw0gqoraS7VNUq7IxvUcNFRXj4/uYkADdgjGo1orYXuerGo8Uhku8ugjKNLjIEXx9L6I51ENrq54Wiq1rkMOCLBFJ7C1n6ad6ax2h+AFi6x5l6TOzUuwFzY4Fs0yfaYmM+bmLGZQPWVYpGZQAbJd9FGwqS6YnTbMleDGEVbgktII9VJIT1GWGibEjFvTFVXiEw1iZ8EI/o1rBdsrIZ8icQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4474.eurprd04.prod.outlook.com (2603:10a6:5:3c::17) by
 AS8PR04MB7750.eurprd04.prod.outlook.com (2603:10a6:20b:2aa::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.10; Thu, 5 Nov 2026 10:34:14 +0000
Received: from DB7PR04MB4474.eurprd04.prod.outlook.com
 ([fe80::c22a:1b5e:12e7:8b3e]) by DB7PR04MB4474.eurprd04.prod.outlook.com
 ([fe80::c22a:1b5e:12e7:8b3e%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 10:34:14 +0000
From: Stefan Ghetu <stefan.ghetu@nxp.com>
To: han.xu@nxp.com,
	miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	s.hauer@pengutronix.de,
	imx@lists.linux.dev,
	daniel.baluta@nxp.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Ghetu <stefan.ghetu@nxp.com>
Subject: [PATCH] mtd: rawnand: gpmi: Fix possible NULL pointer dereference in gpmi_nfc_exec_op()
Date: Thu,  5 Nov 2026 12:34:10 +0200
Message-Id: <20261105103410.4424-1-stefan.ghetu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0004.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::12) To DB7PR04MB4474.eurprd04.prod.outlook.com
 (2603:10a6:5:3c::17)
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
X-MS-TrafficTypeDiagnostic: DB7PR04MB4474:EE_|AS8PR04MB7750:EE_
X-MS-Office365-Filtering-Correlation-Id: 096e3e36-ebac-4dbb-62f7-08df3b285617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|23010399003|376014|18002099003|10067099003|56012099006|11063799006|261021121427099003|261026121527099003|261102123227099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	MH4D4tqtgBd4SKvbv0CN9h1tfcp6R70mZ/TMIGcdiCrpWexedubV2fkFTeQhFznFYup5Tsx9ra/IdyAj/BofvIHIyFZj5sXdcSrGCI4SPszYYSRcmSWg6Poxp4HoWYu+ZqKvnfhtcNHlG3nha885/5RgvWsdVP1q8AKHe/thI7V/it8CI5GWz6FUGMzPx1vFCIMl8WiyG9v9UaL5ehrCzd1cfsI+69RXZQKlNa1mOmMvqhegdu0hMrD0vx22F7OaM4b0v9ZQyyp37vgyYLDqPfntR31WAr9F3eqXnD22MectnW6ctw4xhLex2YixUX+eBrf5b3IPnXxUiAqa3eMSIy23dHU86tlw3WbrgsscJver3emPm8+tYm23Wg0LwwJAbFSBaHtqjKkTo+Et72tODkr3Kfa9SZoOSoD5DzWGm2B2ffi813p+qDYZ4N+OPIzOyR5ySSMMfPscilOs2Hcn0saGkkQjC1yA+x5urKfhLIGytqkUsBfUqnaOBK1mTXV0rnoFhth01byG47Q6gl1DQNUk9qlKsl/JGD1/1xpN7C4v/SfcKDf7br8FS9Uo/VX5BcPteoakmSxsNOGMcrtB5MMnDz8ukqa3ak/zmxrIl9EhXSKFvt8UtNiAAz9XflJm2M2pwfIwdVWEArlVWNe0C+ikVraQiOZ35kHdhQNCr50=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4474.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(23010399003)(376014)(18002099003)(10067099003)(56012099006)(11063799006)(261021121427099003)(261026121527099003)(261102123227099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EQ3W35kFa0/wc9v0R5UsyAm2ioG4jkhLRQZSG28vd1Ai2eSWl8bIdXHzZbDq?=
 =?us-ascii?Q?HUbP5L8eASkO/fsqK1DPmZxsHX+Y/fQvzk5Kq0WFAOhOGQqYGsZ57T0g+twz?=
 =?us-ascii?Q?gAxKb0BNrHSpoUezNPABcfeow/PMESQpbjoVDUJUuE8iWKZ7+TF23rult44L?=
 =?us-ascii?Q?l166Dl/rWA+8kfqJA4M13JyTtcDM7ORWqQX70V3OtFITij9aI+lpc0w7E5nU?=
 =?us-ascii?Q?voYnKg7WXCDfHAKN7TzCXxTquzUbimbm1vpClL0BF+dl3iLOkiu8+uGEvJlY?=
 =?us-ascii?Q?pkxg2Qaij/3Z9jpPqLy0d2NubLC1kgTYhAGOT27q0CVcZ4HVIz2Ga+K1CPJp?=
 =?us-ascii?Q?3QqbVJ4ph2HOgGexzznPnG8hqJ89jMDWXnoz4apWcMvxkjttTMiGGnxfq2+W?=
 =?us-ascii?Q?qGNPfLLPRAlnYWOVYexpXUb8mH+1LEbRSz8Pl0qBorcErzKeyKQQfj+kCJ2W?=
 =?us-ascii?Q?s9OYzYejjATSiVTMXdkuJb+Q5BRHbhGurE3ct7ZgSIgT30bQWVEsxkqI6Ib0?=
 =?us-ascii?Q?npznGseyOjV7n9aBhN2EvD0YsySF59FK/os7ASInaNBxljU/d+CmXNRf+rvD?=
 =?us-ascii?Q?4ePeEvpWMRtZxXFYOvV1d79wXDzN531Uepmt4P11h5wW9F/aNhuohyqSiQsB?=
 =?us-ascii?Q?rgVu7d9hPLfv4v17bjxrS1qD0EOsoF0Mp+c7jlZWPr2HCIw8Zg7ItXiPMZec?=
 =?us-ascii?Q?8MyZtGtAFTQWwKT1b+V/KeHaar+QGuuR4rF+AC2DoQ9+13TYQ6KTbaiLUuYL?=
 =?us-ascii?Q?plkRUc5SQz4SHEXp0cXv24OvamBSJ4HFhbuA3IwBb2f2ER2qBGfZXnD/uzBA?=
 =?us-ascii?Q?BOt8LHXEe9ULn8SdFXS+YXX6Vh52j9RXGe4NYRo63JXKSLsw6BYGCk3L0Pzo?=
 =?us-ascii?Q?MiacYjeT+BkT0zzgQC3qoItEeUcQtZtAMcqIJluflglGhIqei+WP8ytwem4j?=
 =?us-ascii?Q?xc7KLsZxpIzQUWDpzd4JHIYYabkRypDRsgw5hLwVOeQKtBnnM2vxTfmGzpVx?=
 =?us-ascii?Q?oJgKfsFYfBs8076dhkZtSlWZ9Nm0f5ROYY/JYLtM4C6Rn8nd6jOct7+yHDuT?=
 =?us-ascii?Q?FwVKUQ9CiG06Mx4/g5LfI3Hf8ysxRtX1cEL4zbe2pPkXh7iCkTG+IZxXfVK9?=
 =?us-ascii?Q?n8DJxWZ1HKitfjNPgrYvd5Fw+clUD8WfjwlIofXFTPh4bIJQcQo+hJr3NyjS?=
 =?us-ascii?Q?0H2ZhNNaf2Dn/X467SsfbjutNL/FmSMQ5m/yJVfNXt5iPLwDGMH4lsIu0pXg?=
 =?us-ascii?Q?eA7UWt0GMZXDKgoz4mM4gb8UB6sA0haY+j6YlMaobvRFpKBm6Wpc4KNWsUtw?=
 =?us-ascii?Q?Yty5vpsWgrIPeSyRUKMhD8U0G90+IAckt1F9iKoeh71gQarW7kP7/lEbsbBe?=
 =?us-ascii?Q?ajhY32VM0PPNRnLt8HHcQ4PT7SqQj8mGej+Efc44a5A+TINxTOKTjmlg+aMe?=
 =?us-ascii?Q?GfIsvUJvSMTEPL6oPT5ni9rJ1BJ8rV2jh5+TwD76zDkRpTVTzNciE7FAic1T?=
 =?us-ascii?Q?C6vRdccfIwGFilcCxwsIKBx/Z14+drA7/bGIGqZN68SCqN424zKu18rkbiIU?=
 =?us-ascii?Q?yDWIPqx0tYfjp9b/33nceaZTT02KQJjjex+lLDqe2mjowILNvlwXs5/2fZ4D?=
 =?us-ascii?Q?vbZRltkAXD7AlDyC0WylqxdnC4BWHTzsGxgandzzNz+VYeXoTWB+33S7yB1n?=
 =?us-ascii?Q?LD83fwPHKFiRQTWxAws2o5cl9Zm+BgsPdvSPPpxuoT8XbZccfsArgfh01c7/?=
 =?us-ascii?Q?3fCKzhSPOg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 096e3e36-ebac-4dbb-62f7-08df3b285617
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4474.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 10:34:14.1050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnnrUBaJhf+HMswhbqhVnhMAYY/2EbwxHG9l+2H5OTJ8xWf138vevd98f9LxlYQHScbxo4AoIlMLZLYsRABa9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7750

From: Han Xu <han.xu@nxp.com>

In gpmi_nfc_exec_op(), the desc pointer is checked inside the loop, but
that check is skipped when the loop continues in the NAND_OP_CMD_INSTR
case. As a result, desc may still be NULL when it is dereferenced after
the loop. Move the sanity check outside of the loop.

Reported by Coverity.

Fixes: ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
Signed-off-by: Han Xu <han.xu@nxp.com>
Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 0f1528710a6a..e876a19ee9da 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2616,11 +2616,11 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 						   &direct);
 			break;
 		}
+	}
 
-		if (!desc) {
-			ret = -ENXIO;
-			goto unmap;
-		}
+	if (!desc) {
+		ret = -ENXIO;
+		goto unmap;
 	}
 
 	dev_dbg(this->dev, "%s setup done\n", __func__);
-- 
2.34.1

