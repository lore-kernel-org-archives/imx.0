Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011058.outbound.protection.outlook.com [52.101.65.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE773BAD88
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 09:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627806; cv=fail; b=DRKtKPJMxPNjrzK5eVDIxeywvEqRagSaNXTZnJM178F6FdQ0xowiIDRQKDcA2TetOByMpQJ+xETWoH6ru+Qz2AknspUrPbc14Jzk2qHKVnrv3OHBZwrXBClNnE5hJCmyV8OBerCOWkQi11OmN3Qwn0fXO2aFVMzJNADOQhsyoSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627806; c=relaxed/simple;
	bh=yexmuZCrannarbTN+sbEBJVvqyBMJ/Y2F3Jtgq9YBTY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aRiP6RjFzy2RoCONPYJCGrOcR/QAexNo6vMxpXplyOhzli3Ort0O7U6fokiMfKDkstsCeXjYNnQ0AiNBeeGuT7b3g+UN3Djpav6tYZC0q5616VJi+ZjOipqQWKUO2ZQyLq0+gfCESAmzLbLIBnjrcH7ROxX+VusSKHXBesLyvwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=q/LARnNj; arc=fail smtp.client-ip=52.101.65.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="q/LARnNj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWdNBm/rElEMsNR3KxEmsskB7zjXRy03DVdbGF+d+KOieR+bRG0su7BQA2UeVWxOScGzwSGHahMMsb9ocBC81+C8NyPuc2BTqgq9/PxKgBXsz7vPbK8+xoJOZxRjLLFPGgBeXAh4bXnW9ogz7vAZsyn+z4vICarsbyYyTO26k/FW2KTQqJDhie+YfwlN7FuH7Pk2YJt2VGZ1CTH28pLRVHeaqUgAdMoPONLT4W7tVuLyJTrjeMrqCmeEUa7QPr/biIVJvmgg4IuwbWOLp9tlaYIney0s0gAE1Nk/SehzuyQ6G3ktQYv2Vj4/rsOdNH094FGCmR1tI97CNz3clcW14w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1CFbJHBcjKAENGI0ZEUmqAA1rVoy0I0tZrvoxyHbOo=;
 b=E6xu0DdvOHY0QnOkGxmIEPi62GlNgtSEHdcQEeJksMiMjvbpyj2WxvCLpNwIaEkE/jAb4eu7QhXtibwpCbN0eWZQOc4Gmj3wW6fLApn648EdCCYfJFh4CElwJ/AD8Zfi6f5twN93t7u2yi47a53wMAvxBMZwCg5yNaG5leV5vOCxoYVFsFLbMFnR7r3gjdAOT4llmCWiIQJObgglGGlUBn4+LHFOZbDJtT1rzPE0W2+KjP4iKSYvIfpFUOXysQNPqflJPJLBqTbRYptTSoVkqvB+8J3Xiaki5tCQtos12AJvISaEz1H79QbRREQolbEag+z1Uac6q7HzqNqWxIz3Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1CFbJHBcjKAENGI0ZEUmqAA1rVoy0I0tZrvoxyHbOo=;
 b=q/LARnNjOFl3x0DlpgbS9qRm1nSLh7DPcR/opouOSbWo/iwt/oq+iqbAFr/rRREN1+fUhsfDqRp6bhMfsWwkdBHqNGJhCUTKMqeqswynLIovjgoionCzH7U+e2mraE6cfLDzOhqMhbvBaVxQJp24RHSObHBaxzbhWbD0ltZEev1VYLc8z4kO30iAk3HXvd4IxKUJSN7UtjxZeZfTgmX8TldW7hIHmp8mtDOUmrZ39dyUBbJIZKmQJXC+UQMIcV4g82FhGrl06VoPJWR1KP9wLknvAbVh3nTlh1ytujizIDMVkKOliV0x/EZeALcO5u5b8zQBy8G8kIRBbdlDzqKYfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB9738.eurprd04.prod.outlook.com (2603:10a6:800:1dc::10)
 by PAWPR04MB11611.eurprd04.prod.outlook.com (2603:10a6:102:50a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 09:56:43 +0000
Received: from VI1PR04MB9738.eurprd04.prod.outlook.com
 ([fe80::33e2:39d5:e3f4:580c]) by VI1PR04MB9738.eurprd04.prod.outlook.com
 ([fe80::33e2:39d5:e3f4:580c%6]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 09:56:42 +0000
From: robby.cai@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	andreas@kemnade.info
Cc: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 2/2] regulator: fp9931: Fix Runtime PM usage count underflow in v3p3 ops
Date: Tue, 21 Jul 2026 17:59:59 +0800
Message-Id: <20260721095959.1855436-3-robby.cai@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260721095959.1855436-1-robby.cai@oss.nxp.com>
References: <20260721095959.1855436-1-robby.cai@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To VI1PR04MB9738.eurprd04.prod.outlook.com
 (2603:10a6:800:1dc::10)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB9738:EE_|PAWPR04MB11611:EE_
X-MS-Office365-Filtering-Correlation-Id: ab5aac02-64bd-4983-94cc-08dee70e5e0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|376014|366016|56012099006|11063799006|5023799004|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ERsp+2ONbxw79MSjl3sh2iL/LwxLCkUq8DXqlOIxYaSBaiabXgtKKSI91SV13C6lm4fpQpj0SvYtWaZ7YBb8Pdq5/MVxv1YxSAfTV69rQtPQceD78w2CsYbJLMlzl0AlCvbf34H962q025cFyOiVKCbDTlFeRaC2N3N+FXCE0u6/YW/s6R8LLiBIzlc3Rm+H99kdWB7t0gF29uoTsP18UM53aGvNq4LklJurFZcZ6X+Zuf9cUQrB9bSwSBBQnCTgVK+JhiOJIeztSdgbkzU+0Db+XI+qt4gYnlu67rVbnDWxhKM0AcR4PWYQ0q6C7/yxisWQVBFrp9CcfT73oSk7hyTatO5uGeqrB45rDHiBnRARCW/TYqXuzBQ27GVeSm7ADyhUmIfmqyasRcV9DeHvTQFBgE7YrBJMCaer3CYW552liTYnocrNzTWqb2y3XVmCO9B1pEm02api6b1QFvDtApYXnnyQbsQxitiH8okgUHzFe4P90MFg9xwT/xBX3I8k7S4fTyFTsHAF8YPunTVcWwZl7u1qO30FpkFPk5jduoODJZ/IUZDPBzmfntahTed+6SOqqYea5P41qxI39RkryfVXjGvhaNVgQx3NLvoz2fz/5iVIluF8jEAHo0ydhnTH1qeXoN5V0xvpg1u0Y4E2fJ6XezAxdr3E4LGVXzxahGk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB9738.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(376014)(366016)(56012099006)(11063799006)(5023799004)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+ZoXS0JrZ6p8Usi0kYdwm3cIe7lZlPhw3nBPEyQBtlmv6p+XQcFu2KX61vb9?=
 =?us-ascii?Q?Hlg8/wgKz2GRuiqOELWJQbRM2ieHL0Rp1FtPdvl3zoIVsZeE+sHwu44tz2yE?=
 =?us-ascii?Q?djbaAaW+drFk6A0OC8FSzieW9X/MmpuySIra3JXCC31JC5QqmYTir0upJUm2?=
 =?us-ascii?Q?UTuUzasxepttWyLHTLC659ZaxVzRrA1/fbHRcwLPmPqfc4jxiKtCrftk5Bj9?=
 =?us-ascii?Q?5t1wuDLbR7vhPRW+GTCDv1Zf1pvdozE2uO8ZNNmSK52VOMlMGd8aTPt1/7wj?=
 =?us-ascii?Q?0x97ZKYMl90trHRMLFe5uy5gGnIu7tz4BqxZqoxxNi+YhfOFskODEX4kp2eo?=
 =?us-ascii?Q?nwjXHXjJi9Xs5Qt+75pzifTyVTLFZ/5riA40E8ID2tfASS/HlD7w6vIUjo4S?=
 =?us-ascii?Q?f7NHX8J3OmwedBjcbkkKytkSiNd076p8ymsjsUdxGN3jIlGTLN9JXlKzAsj3?=
 =?us-ascii?Q?qtUMGyMrdK9bLo1dl894Jvh88GBr1/mykLwbcrSdaj5TpHYWT//JZzjSKG+Z?=
 =?us-ascii?Q?Bi7h5RAO57DaK8dD6NVwC96bfzwttZbIeUG5Pf6gn/g+77Wdd3an/sQ+zWJ1?=
 =?us-ascii?Q?LeNbXTGuEXmtymH4tDxmjDwbNpzTr1aJpGbw7gLFI+CL84lmyPG+eXKKUzmD?=
 =?us-ascii?Q?UPqdBSQF3eNjvd7rUn8tchW4TwLV7XyK2GlKHYSjVMwMtzObkmoS/vjVIITg?=
 =?us-ascii?Q?J2eNcN8C8Ca1cMHGRY3wg2yhCXIW+n8QpfSfERVCsweutx6l+pjdHdlF6/bl?=
 =?us-ascii?Q?rM/cOkXh6YfJ8OXb24GsF2HYunsXsccYYqcblhysj1+saIerJtL9Al1m0vZq?=
 =?us-ascii?Q?2imPDOhEA4BeUOjaKghW4+S/9FTzd0eunpdYRXl3Q7kpYTb1vDyKtn1R02ZT?=
 =?us-ascii?Q?YvXA7DeuuK3yHQsPDngcSsz0TyTGA+zN5xVuyNYbtLDMfI3RxwBFkzJZJ69R?=
 =?us-ascii?Q?+rggFC20kF9MOYuS1Kg1n9TFL2eP3ty3uUAwh39IeTYIXAZZpgNn4eZRcQUl?=
 =?us-ascii?Q?0SRZaKKjm2J7o5uR6Fdrq41M5wksl5+qUcV99QAdWwwmm50r3x0mXkFf5TZN?=
 =?us-ascii?Q?/oHiLmDKJHJxGmJFgZLqovNdjVl9Suuik/gOYc8LObepZUMayRTbdJOC7lec?=
 =?us-ascii?Q?rzhmRiggB+zD5y+z6gTzYXn5UVvo8rwidnbomYd92IjsI4v+Ks3cqyhJRzfY?=
 =?us-ascii?Q?rVYYaXN8GcszFbtidjOnPsraEdABD1OLCff3QSvzXj5iLYcGiKihfBNzjexN?=
 =?us-ascii?Q?GMTBPAr0bR+UzKA7KH0BW2LQ5MGfDkdbBL8dN2rpz/8KU7N0fMaGASUNTI8d?=
 =?us-ascii?Q?KTzNUBFU/8rqewUHEWehzJJvzIbxubEAd+wgSTvel+SPY0Fc24pZjiHSvB3g?=
 =?us-ascii?Q?GFRvWdEiLmq7Sq7a/wfhERIWw4JhnXkhqO/jf/sbd17e5hqsdNHub2oklXAH?=
 =?us-ascii?Q?mwQoI69viJ6ZF4P6vC9hqfLEMbiLL6jutmgsmyVm2sRAAQjca/5KehEFQmEv?=
 =?us-ascii?Q?u/A1pNzg+FhavqnRJIkax3CQuhWL+4RoZzU6k8KsjoJc7P3paKdOlIShcEHM?=
 =?us-ascii?Q?ygm2dTlOBEULPPd8Nf9Yljqnw9VJsvV4G9J3AdIDhoL6FJqwKU0SH5wTbWfD?=
 =?us-ascii?Q?NDF1lK987Mz5il0Eq/rLoBcKYEP/EZUzB462ySex4DouLbulkr1VrEpT2+wQ?=
 =?us-ascii?Q?h68ifXSFhaYwV/a7do8SUKBsnZU1+K54fbkeHNwMPAJ27dXkxYCjwpV2PVkb?=
 =?us-ascii?Q?9GTxgcE3FJaSM9UXMtivJ1b624SZYEDtXyyagJS+s15s9X23obLt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5aac02-64bd-4983-94cc-08dee70e5e0c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB9738.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 09:56:42.7536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMUzEtEJH6uyb6uMBvMtxVDFXo/JfNp0B+ETOTQisDdd99+IlY4XbSNHARcMgyg/ZPxVsCiwO2gJkwQ8+0vczUI1Uemp3LxTWaXmo39oMd3TJU/Be0WGd1LSsvOgkNU2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11611

From: Robby Cai <robby.cai@nxp.com>

The fp9931_v3p3_enable() and fp9931_v3p3_disable() callbacks currently
acquire a Runtime PM reference when V3P3 is enabled and release it when
V3P3 is disabled.

This assumes that Runtime PM references remain associated with the V3P3
regulator state. However, FP9931 regulators share common device-level
Runtime PM state and references may be released through other regulator
paths, such as the VCOM control path. In addition, the regulator
framework may invoke disable callbacks during cleanup even when no
corresponding enable callback was executed.

As a result, fp9931_v3p3_disable() may call pm_runtime_put_autosuspend()
when the device runtime PM usage count has already reached 0, triggering:

  fp9931 1-0018: Runtime PM usage count underflow!

Fix this by scoping the Runtime PM reference lifetime to the register
access itself, pairing pm_runtime_resume_and_get() and
pm_runtime_put_autosuspend() within each callback.

Fixes: 12d821bd13d4 ("regulator: Add FP9931/JD9930 driver")
Signed-off-by: Robby Cai <robby.cai@nxp.com>
---
 drivers/regulator/fp9931.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/fp9931.c b/drivers/regulator/fp9931.c
index 5eee21034f6b..3ffba6fb75ff 100644
--- a/drivers/regulator/fp9931.c
+++ b/drivers/regulator/fp9931.c
@@ -243,8 +243,7 @@ static int fp9931_v3p3_enable(struct regulator_dev *rdev)
 		return ret;
 
 	ret = regulator_enable_regmap(rdev);
-	if (ret < 0)
-		pm_runtime_put_autosuspend(data->dev);
+	pm_runtime_put_autosuspend(data->dev);
 
 	return ret;
 }
@@ -254,6 +253,10 @@ static int fp9931_v3p3_disable(struct regulator_dev *rdev)
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

