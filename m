Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012048.outbound.protection.outlook.com [52.101.66.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A926F3D9559
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 10:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889078; cv=fail; b=s6pSHkfp35PUFMS3KmvnQZNXjPxksgiS2QD1iLDn07Xo44LUjugg8+vLqXyfpK8tatpsRSHCQDp8r8LcuxPPf3/Af9Thy5kP8SK0xWwJDrCggBW5+/q+eKgCMLigDNrKtOL7vhvb9twb6JSJQABX6qQ0EeuXuDYYdNXgtmj1hLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889078; c=relaxed/simple;
	bh=B8JVsnk0piXIl9Y8ME79eKzXfp7rPAZapk2G6sl25q4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OFL7O7E+SjzXDrDutPxcFTlGKGbym1IYQVULXcmKpbppSJpgsdDCusI9Wh46qaDLQnb4zbmFaqtpNA9uUdD5qhi0Ca9aOxB2L1vMdZfZQEzMKVlBHi9OI2V/G3qFUZqfeQr5dNJEYm/8oXwsgmEGmNsoXXoA5519bUepYx+lONw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VNDUocUv; arc=fail smtp.client-ip=52.101.66.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VNDUocUv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTSSxFbjK4vMetSgj+2lfmvsIRZlRNPzMvRPOVfnYrm1LMDM4TypwzecMJMymYM3MH9LqQM14yy9A3tU5Yph0/CGRERWH2rymXRx3V+e48CrSBPZUKBY9/AVZJoUe2bwf8KL3DW7CaXQL1Q/BE/3KHDKaia2s5Nk2bDPUEOoi4OXd5XLsks1LvxRST4a1rsSWFwf83k/HWVfUvDhs4qb0sJu669okJV2YvRYF0LZF2UiZ2sWFBq34o4/uoXMSZh3pPxYLRONZiQl1TQkEnro50FOv32SQ6+NedxofcD1SsBgiAbluYwPKzEv846IHiqWZEHuFtkdfAavFkOooGqk4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LifvZvKGEhv9c9BWts4+ZNb6UpiXLrQV/CuyXqvUP7c=;
 b=wNnKLfDddpis4gg+ED7vmC6PeELeg04E5iiLzF4stfUI+gE6Bwe3GfUxhSAioXpw+0NR0vt7rAERe1+apo9ZXmk5aibevyakwBu/148UNn96Z6l7Ef9Yh8KbzfIJnpg64WFg750iVGs3BZLxUlkO+WJ0KylS6V+GqNedgzaUGRu4wFrJKsD3KZxrXpCdZBcVV4a5DB7ldWvmY5eRlRW45mrxAILJIiaahhLSdGbt8aySvyHhlFAfI34HELquIt489+wcwCGIeIQAmU0rn42aHOZdsqF6+m2806RqVOoB9u4avDn0muwFH61PA/7Q9afxv5VvoXyigxx//n4/BWxVFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LifvZvKGEhv9c9BWts4+ZNb6UpiXLrQV/CuyXqvUP7c=;
 b=VNDUocUvQdHBvv4hDM5BlhkFCcqAvwM5ymqulQPh1KfggKqzcYnGi3aLoIw077wwz7VY4uyb//99oNjwAD0LgueJClVmCrwUMMEd1V8iIM8IFx6oZ/muIa+dm4jtbXMqTtXoC/yGvTTMEd5tboavqZOiKastR+ArowEFk4TLbvlAJbn7qLhT+MSVzE/AI3B+4iwIBsq2jBJus/Vnit630npHQn3LMTu1fy3sP7LMa+qaH2iTxBc1DhhIJvt3xf79QVdbsfxFTZZC5TUnNKueU9aRju4cfcPLQqWXZbiDzxqPmmzFCOWKUE3d7o66M9aftxfxxBnJsfKuj2XhtFvvQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB9738.eurprd04.prod.outlook.com (2603:10a6:800:1dc::10)
 by AM9PR04MB7668.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 10:31:12 +0000
Received: from VI1PR04MB9738.eurprd04.prod.outlook.com
 ([fe80::33e2:39d5:e3f4:580c]) by VI1PR04MB9738.eurprd04.prod.outlook.com
 ([fe80::33e2:39d5:e3f4:580c%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 10:31:12 +0000
From: robby.cai@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	andreas@kemnade.info
Cc: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 2/2] regulator: fp9931: Fix Runtime PM usage count underflow in v3p3 ops
Date: Fri, 24 Jul 2026 18:34:41 +0800
Message-Id: <20260724103441.800522-3-robby.cai@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724103441.800522-1-robby.cai@oss.nxp.com>
References: <20260724103441.800522-1-robby.cai@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::20) To VI1PR04MB9738.eurprd04.prod.outlook.com
 (2603:10a6:800:1dc::10)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB9738:EE_|AM9PR04MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: 29df8f5e-e32d-4154-97d4-08dee96eaf0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|23010399003|376014|5023799004|56012099006|10067099003|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ho+ShubSmFB5EhbFeVEUTFbnyrUdgc0Uq8to8iIfih1IbMGVQ4wRJfX0aKrJjatGqMMeAROSVRQCN9b5NLbenSkSR8u2PC9u87bt7NfpuyFLbp9//xc5lal2XKd+XwqVJpIw1YMRdqg3ydxdSvS10SLcyIziQ9QsH/3PFltYV1gt98QeRPHAehF8IRhEivBP1NKMc3v5SA6sU1LUAp1oY8hcapae3zdhesBdndspNFtDIQkwT4dbVahYXdgqxpBLYd+ShXbNjPGc5CQI/9f+AvpzwrSUQv6flhJOSmRGVtXG5brB7j4lOiiEcBJorHY8xxZ+ZbtGi3Ra8m6jkc5cza9ggOpmChrHK0eCV1YWrx/HdP1S2CGdNOYz0kPIvTjPhE9kpcTAI5OHMrrWhfWS0cEGRA3D3nHqzdlnfhdmStTDCEWVhiYDJwFVfubvSgtv93yz5Yepz/HmPIVEroT+gvmThhIiZwpwz85J9ylkLeZOHzdNNOuNVbOqdrxEN1OQKSwRFXWzNgxxmu+FH6IKqCxTlmYpSMolWPMob3exHhO9NAw+8kuk4LKFKfBpVnqVW9Y1Mx65SnVVyU8eHa2HqKFHZ2EFnf+R2FArh6F/VmASJRiXG9GWKgUwfR81qD+xVkzPbf0gLRWE6+weUK1dBkWRMp2kGwAG/hLyyGU6D8I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB9738.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(23010399003)(376014)(5023799004)(56012099006)(10067099003)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tSZhRG3U96c10bFWDry4jZu/NX/Bv+udlQkAqVjUaWs85swCarhKjhwW+kBv?=
 =?us-ascii?Q?iGQrPW+AMUWiQ+SaklhT3+CquTQMNJg+NgwBJMEuLVAf6rDjdVeQ/X7kqZvR?=
 =?us-ascii?Q?mhxztlDVQliXDkR4UXbA+yOCyx9fRnIofrOx1xNJV4EIxlkUPUZTiw0XVdCT?=
 =?us-ascii?Q?rUmM+Ot6gpw9TMSSbhFlyLyVnT5F5syxhgvh4sS+I3lEXqlbZJ/DSopAFeN2?=
 =?us-ascii?Q?5WCWUhGoxAIMThPnnPYyPmgK74Dus4WLE3Ae2j1fFwYJbfh6puzUh1gynyec?=
 =?us-ascii?Q?bY6IaTeBTM4q3TR5z23T/AXEzmrwuUyZpMn27002sHl5FOF/w0knxo8tfROJ?=
 =?us-ascii?Q?P6vlZCDT7u4HNkf5Qlm2LirY+MrvBWa5n49E8QsX1jMVXKrrwP4EFmdfAcii?=
 =?us-ascii?Q?KRKnynW2uu/C11XHQyr8zgHb+9/dVjcnSa7cvsYsSF+kZ3fQW7lgcThDeaW2?=
 =?us-ascii?Q?3ndVwN38EEP+xVieQ8SuFsAJV+OZlrG0YUwSiyBqUeEFLMvKtTG4tmUCz0Ww?=
 =?us-ascii?Q?KmL8FgFtwnSNBDynq5k3ljWwvQY/PAlLLrYiewe7u7Mh3X4LgCrTt6msoB5b?=
 =?us-ascii?Q?AwAxxkB0XHDmMOqrZcEWJKLjfqEsaMox6deMEV2ze+SwrQth1Guc3Lwoo2Ni?=
 =?us-ascii?Q?DY2WyHAius+Hh8ZN+y4uLVXHkbP7oVOqnfezkuvOix6rvvvSMGE8/lmYi+p7?=
 =?us-ascii?Q?MHGqNe5+sprDmFGtqHum61asDf99f7XSUwU+/ooygLmfXd03VotydLUvKGWw?=
 =?us-ascii?Q?4hBb3ACsgtE/bHoasKscnt5uJqGZi0juszPeOIUG0uG41jFjLw+UyspuS8nY?=
 =?us-ascii?Q?HmB7xg/F71ob5f2DvtxewnZpsxFRrEv0odSh5zs2eOv1bMIN9+EdhT/sqzJm?=
 =?us-ascii?Q?xKe7UcZi9BpyDr92pfE/9qBX+w5W3BYXNaBSmTOSTwEoVki0WroB6pJf1bKA?=
 =?us-ascii?Q?8kzsZX/utOaIhh2fRoYbr/EDgcxGuBewiMn/Jn7cTWHOEt7Zv/lBssMSKxoz?=
 =?us-ascii?Q?7hwZm7926Mr1QAi8rF1Aw3YcWn7ZZuJ2vErIG3u3LEA2JnYejNDMkUasp45a?=
 =?us-ascii?Q?tx5WEFoVmqvgSbgPDD3Y3Eems8HatC+FHMOAZaCvLIaqpDRqLo/RP4pZ//Qb?=
 =?us-ascii?Q?Vl7ARCJP7SQj128yR4B2hv0YEHvSnEo13CN1yF7lxC6zmY/Qh3JKyHpP0WWY?=
 =?us-ascii?Q?GEsx80Vk09jbZtkS3/0mwJIzDRini6fp0vlsW3PPbF7sQjbqDOsXqa/PR0Xt?=
 =?us-ascii?Q?Q1zsg8yKN/edw6+YsktY5LgADHxRZppS6QX7yR9etMq924St/SpXhhaCoGIE?=
 =?us-ascii?Q?+lB5Ja5fTt4xVdQKZIZ/UvEb5vpeAwFoNqdN2jOaYDMlYY/GqL/kvPHixjKK?=
 =?us-ascii?Q?keTisX5veYFYuy0UgLVXJnHpANLpDH/v697Hd0eyRrAPJKrLPeO9hZJ8p2ih?=
 =?us-ascii?Q?7f2NCPO8G9YRi3THeTgSp8qqQgKtFdHIuxDyoHAcMKGfPmJV254PibSNSZcp?=
 =?us-ascii?Q?eWkvY7LIriEjUSKirlNFJAGrGyB263iEIH2+5Hn2OCWNtdQlJjxP42ZMmMP6?=
 =?us-ascii?Q?s93ZdaM0F1A5+m554mzd35ekfyE8Ya21hTfX44VwaQUQvjzRm4B3Hv241QCU?=
 =?us-ascii?Q?53BM+0J/EW67jKhO69lsttedjh7yD3gXL8u+lth6FxzBQHdn+WX/QJk7CDcf?=
 =?us-ascii?Q?l6+N2HqQuvR4vwTCf23wiR08DOmSyPr0EmDcAUbzdIKJ5O51kptJcu/dvI0l?=
 =?us-ascii?Q?7+d5kcziccNltiSy9IND8zfNxCSJQGLNI0hwVFZk8Psn2fw1k+Ov?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29df8f5e-e32d-4154-97d4-08dee96eaf0b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB9738.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:31:12.8266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzHbYJUTXqpi1mUjYUShnchp4yLW1j9S+p0b6D6h/wDUWilKOEmePL1u1l4b+jG79QuDPJs00HZqlJTOQYrY7SSiFsjKvvmFzDtQe9l35T7YOSpA7otrCWkK+4y+g8RU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7668

From: Robby Cai <robby.cai@nxp.com>

The fp9931_v3p3_enable() callback acquires a Runtime PM reference which
remains held until fp9931_v3p3_disable() releases it.

Device-level Runtime PM lifetime is also managed through the shared
VCOM enable path: fp9931_set_enable() acquires a reference and
fp9931_clear_enable() releases it.

As a result, the Runtime PM usage count may already have reached 0
before fp9931_v3p3_disable() is invoked. In that case,
fp9931_v3p3_disable() calls pm_runtime_put_autosuspend() on an
already-zero count, triggering:

  fp9931 1-0018: Runtime PM usage count underflow!

Holding a Runtime PM reference across the V3P3 regulator lifetime is
unnecessary. V3P3 only needs the device to be runtime-active for the
duration of the register access.

Fix this by scoping the Runtime PM reference lifetime to the register
access itself, pairing pm_runtime_resume_and_get() and
pm_runtime_put_autosuspend() within each callback.

Fixes: 12d821bd13d4 ("regulator: Add FP9931/JD9930 driver")
Signed-off-by: Robby Cai <robby.cai@nxp.com>
---
 drivers/regulator/fp9931.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/fp9931.c b/drivers/regulator/fp9931.c
index ff743a8b0dfe..0d926546221a 100644
--- a/drivers/regulator/fp9931.c
+++ b/drivers/regulator/fp9931.c
@@ -214,8 +214,7 @@ static int fp9931_v3p3_enable(struct regulator_dev *rdev)
 		return ret;
 
 	ret = regulator_enable_regmap(rdev);
-	if (ret < 0)
-		pm_runtime_put_autosuspend(data->dev);
+	pm_runtime_put_autosuspend(data->dev);
 
 	return ret;
 }
@@ -225,6 +224,10 @@ static int fp9931_v3p3_disable(struct regulator_dev *rdev)
 	struct fp9931_data *data = rdev_get_drvdata(rdev);
 	int ret;
 
+	ret = pm_runtime_resume_and_get(data->dev);
+	if (ret < 0)
+		return ret;
+
 	ret = regulator_disable_regmap(rdev);
 	pm_runtime_put_autosuspend(data->dev);
 
-- 
2.50.1

