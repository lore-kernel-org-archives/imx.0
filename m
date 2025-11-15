Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013002.outbound.protection.outlook.com [52.101.83.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C006663B9
	for <imx@lists.linux.dev>; Sat, 15 Nov 2025 02:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763175510; cv=fail; b=Kqt+2hvuSY04IMH6AoE3+VLbn/sOyV/KHpOtJ7TIfcyRhMlcTs5KRcXRK8mD4i1NC2RLzjpbqAVQZ4w3nw3m7y2WoeA7esrbenU3xkMYlIx1TY9dpJhUvlmVmeF76E24feEHF7h768fS/V3Q5DMWJDTkRLcJ25TQzz2tSDGh4LU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763175510; c=relaxed/simple;
	bh=SFOTHeKEj0nVdZIrPL6jY+mF8mqvPcGud9dkt9Y9sNw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=SrNMjXPUBZSqp4tAt3lUeHMlgyOrUPnG28AqfIS0l0DgScSYdhZGEbn0xW0dFp9dRwmeO34VjAWeBEnTFVjkizp85TxwGr10BFjYL3XyZfA33rgDfyWSeJhv2Oda/qd6VC6JyQ7SsAJwBTPLdnR884khGsexFDiYt1bAT2H41UI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LCkT+77A; arc=fail smtp.client-ip=52.101.83.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LCkT+77A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AyoCKv+/BeQXOnzJUE96c3ueKJpvseuHGrGUesgBFOfjOnNDKdzidIE4kZC1tM7Jn3mfQnDCopM/xv98XRRClpTZUV/5x8/qeEFi0j95AheQoo01aCpJv+NnpJ7vAC1hBqYoDzDRJbolgGam5Xmryxz8xmoC+8nAD7/+W0+sReOjwXFTe6NHh2Pr1yTZjxao7/yuE/hQV85vXji5jbQG1NdlESqjkiVa4Kqj+jhN0pC/Qw5/ksrEUCTpRjOT1r6uxGt9tQBfKJrP322vFuWxWDAOw/lHFGTXexftZFsdXbAeB2N1/GusHfo5nnEga+RfqcCXWQ6+UQowZ+vju7J7Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdxFI2S4tse0HEzCQQFHKMKced7fHYHU7/1AFNyKjs0=;
 b=dceXuXaJp/wN1OdzvNXbec6Bz9ABk8AeYlrlMpFiNjuJXeTuU9ZXO4pUMchtYqRklbmGaGVbywzN786F94yewIriSvfN3n2K3ELwKNWqwuSTe1gLia9WTn+Idk68O4r8+ZB5fOplNFXdi6YYBS0ThgX9gceBvKG9LUrr3b8mIseLosu1UREmKu6zkjiUMhCbmFDXUZn/QPG5tOwXgoyNCNFXjFjEdNA2SOBbde7NlPMg3+Ttbi1YNTZjci2LiNKLmRyCguHX1XgOu9HI2MUnivXZpYNAvb4tApy9B2tmkm2CyVoDlKkQl1jpTnKrTQcOUVOtSwRHXTyCy/+hzrapcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdxFI2S4tse0HEzCQQFHKMKced7fHYHU7/1AFNyKjs0=;
 b=LCkT+77AmhoSdA5KLAEM5GVk1CNhgMFDnw27DCALiz5Xdwm66t8svg/OfegE/WDIEd1/H+HddFohq8ZTBFban8IqpGiCeRUO/8NsX1mvpf+GlkEyeYrlDeiJWJ5FSfA9Rh1HaMsndnLzXBhrF5YgTf67pLyZJfEoOjDR9gqRyr2JM8GJOPZKvbW4fkAs1rnvwXRkTZQjgsOcXSKtsQO8JI4SaSaHNifXYdMcSJ3GrgC8mtTR5RuV/i6wELZ/UGCMiVhajH7mzKA0a3QmQTqqzTZ2OWqZ3sVn82Ed0FMf9CapozRWbGfGlej33Iv3YTVvidXPeUfBWinpgVItKec+fQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by DU0PR04MB9635.eurprd04.prod.outlook.com (2603:10a6:10:31f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 02:58:22 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.9320.018; Sat, 15 Nov 2025
 02:58:22 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: krzk@kernel.org,
	myungjoo.ham@samsung.com,
	cw00.choi@samsung.com
Cc: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2] extcon: ptn5150: handle pending IRQ events during system resume
Date: Sat, 15 Nov 2025 10:59:05 +0800
Message-Id: <20251115025905.1395347-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::8)
 To PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|DU0PR04MB9635:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb86381-40e8-46ba-8efb-08de23f2d633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?57L8NmRAvVhZ7zd9XM6QygW+x59TMBw8Nxl5QJ3cPyzB5ZsuMKux5rFRiXsa?=
 =?us-ascii?Q?WmQJz5+w/EYN42ZnNYtuGpJQ7SjdIwiAT/CEwSA2TmZIDxRsnzZnFmPiZLSQ?=
 =?us-ascii?Q?xapMl5jTmLumrkMzXsEZ5IQEqT2re1nIwxq7+rjZoLw9N6zwv24+4HobKfXS?=
 =?us-ascii?Q?WtoK2xla7K8aRURUgEP/8FqajzOGBItEXEIAwFbyUmuy+O9tKiuu0C9tqEpy?=
 =?us-ascii?Q?LkZHveH3AnlyD+VX7kF1AciCTnreTxFZXOxkKDCY4EcvALnVLuPy7Wf5wc+k?=
 =?us-ascii?Q?qQm4gV/+iKHTP/0t6/vCUn4MmeiOxVquJCUINs/gEUYLHg7BSfx46R9BByhq?=
 =?us-ascii?Q?BUGobeF4yIxelH6OEkjJBHH/vBJGV24eu3VY8U1wIeeHT0v2mpU5A5v7m+VM?=
 =?us-ascii?Q?EuOkkf+vlObeLlI0epYy40mgN3db5tikLSkFK9hqcnmu18n6oJM7OfyEiMig?=
 =?us-ascii?Q?b30TND3s3eRhErHEFeDQAk/IFXswpe8x/epXaaMwOBHlHEFexFC1GUkoOjAP?=
 =?us-ascii?Q?/jbtZulVDYmz3RXtEXq/LHzuiNdaUjhTvEBpCTubTPhcBESavS9zjUyPxz+M?=
 =?us-ascii?Q?Nzhq66fC5io8nt+rnmolqZduNhefvs5tHuoniG+4h0aT/LEW9MCzyGBTNNMV?=
 =?us-ascii?Q?XNyGSaViV1agYPJg4IbwPFTs7OVVZnwTOvkmwLPOCVkQYJmc/5IIo9kwac+S?=
 =?us-ascii?Q?RtFwPiNJs+QIt9kaVKjsf+P2mnSo7jiZmHFBHhvNmQVbZcSUUwEketTs5CQT?=
 =?us-ascii?Q?yhEb7ka/vZird5HErOQP/CKaHf/OZeXTJEo4oVx6SkYkw2hjATvaDoAWhjx4?=
 =?us-ascii?Q?37fVUv1lUey58FOgHYHLrS653lUssrlsaC+zOP7lk8iJdRGdCCiawOTAh6w6?=
 =?us-ascii?Q?6SieSYRHrxG+r34K+NTnAKnNNYrQX1hZmcllE/59lhUYoJfPwIlezWvY9N+a?=
 =?us-ascii?Q?6xvO4DrcADeQ6ciS6k6SxzwwVLD6JIa0G/5Oda+qvrpxfOmMvGjap+xGEqtU?=
 =?us-ascii?Q?Lj9wxZ1XFnEbFSnFwhm114w9kV3/F40dbvaEIkigLSezFtO65dBRZq0kRFx5?=
 =?us-ascii?Q?JRmp44PDdR1gnPTj4j5Cg/k33clbVw2zJ9w7U4/XEs4lBNXiMKX4R7KiFHcN?=
 =?us-ascii?Q?9chwqpl6aJyjF3TKlkrYSdSGWsmpIPH6l0RPbeIJRX3g76n7+Qid98mO7Jyo?=
 =?us-ascii?Q?oQvcKbL0mCMxCJOfGK+R9gdUf4QhibNkNfZCUimFl3DXsB/ZRf0N1GDnSXLQ?=
 =?us-ascii?Q?Pigg5dhXDyCqEpEis5Y/vBJpv1Hw6CwQv8Bhu/y2JXHlRTV/vtppaWM67Ikb?=
 =?us-ascii?Q?g7jNAGQFwvlwFUI4d6zGGd+eex1LDKzPOIY73nCIwtlLZOSnKHeOtPUL5+a5?=
 =?us-ascii?Q?OmioM8sbW1zP6l9fNKLz4tdg6DDpOgMSxp/DJM4lrCoFavZ8PqdYFdNsX5to?=
 =?us-ascii?Q?ApvWG6guKpBPLUmt7rQ9tXqA4dGxWF99E8wnJ0HLCRkmT77TFhz5ncKzXeVt?=
 =?us-ascii?Q?WmouZp4yQ8vHFTRkukcqpq4mYUl6Jdhv7FqP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RMbTQrv1GQLFdJLIAJKeejGDgGjvnmcUyRyZwI5qsXWqDfAND8T+qITJpUeI?=
 =?us-ascii?Q?/HajtHC6izBlsDuYv20rf+GTdGrCOZAdXzbNZ7JRy4hMzXa0pzw/tyyy32So?=
 =?us-ascii?Q?7Jwru/cMB0QHMxkvhu4+AdQKLknGo3iN6YF1yVJ1zfy8StfPgzzWBWnB4ikk?=
 =?us-ascii?Q?PQgNUDIyYcvJHmYOiMqXhVGJ/C2JqJetNLvKrrqnlSBHnuCSEutvbEff5Vo/?=
 =?us-ascii?Q?mq2dShxeTVfVXnJI1cm6cCITzDKAIHP7RR/fRiKVRHGPWPmka5EiIlLzyIQo?=
 =?us-ascii?Q?+/Fw0DsMSWlZypwYqe9TOIjWv/T2pqzRyJEDgpxl6G3LGANip8fZ5RsqbPxr?=
 =?us-ascii?Q?t00qafYxN6P1jYMac2YulgZIScEpcr4HMungh7mSSnTIwAdd05YKxQ/Ts3lO?=
 =?us-ascii?Q?j5lHlAsApcdNL5zErikVcTTrmELrjyrhzX5sbuCVIWBj2P+7Qk96L+6Q88+v?=
 =?us-ascii?Q?DEvFC/GE+cURmH0k0I2HEFJU0Fc4i88KKMe32VMeFAhPCUjDIxyvRtm8OVWq?=
 =?us-ascii?Q?e2J+wdcCDi8STeJNdYLRLsHfNCLfvF8FPWjW/wG5D1DbBvZ79dV0UG9LyXqy?=
 =?us-ascii?Q?28bljAaAia1eiTfxXhpWnHMa1zHLDyRIUlbLe/xXVioCOHwY+h9Ic5m68TDW?=
 =?us-ascii?Q?PJKCQv6zrXOMEh4E2zhacSe3YKmRAaYdpvHcJyfjksSRtsPp3ZK0d7vOPbgx?=
 =?us-ascii?Q?H5q3XIL+g/baFtlZQgssdbx6eKckg4VbeMxCUTIN/Fv1lLawRfbDq66b4Aec?=
 =?us-ascii?Q?8mpEWq9ZSEsKKde17A3dWMAEK2sTca3fzFZtnSYklqYuGrB5nJaTbuI2ELwn?=
 =?us-ascii?Q?rWyKOo67y2rgocqTxmGBhdGH8nqaxnJ0Sau4JgADRbJdTTrZtTt/O7+xWzzv?=
 =?us-ascii?Q?HlCvUbZY2r+7CpfrwvHJWanu00Pkg5BcF8zm8NN3BGPLl7AN409/u7WDXxcR?=
 =?us-ascii?Q?m6/6Rns0lGih0f15oxdIrilsOFhZEHP/wNT2Tb88FqFdC9ps8o9IpivhLt3X?=
 =?us-ascii?Q?z9SLxycuS/RIWDWMF5z+JWFC6WscKKz2dQYTaFv8Jox8wgcXQpdn65hSS14s?=
 =?us-ascii?Q?PMY8YPYX6+wYRna8fpWhHjyvS8Y13V7K3wCkSw2dnVk6VbCfZMIUOIEq24I1?=
 =?us-ascii?Q?SqTNvzWTxUSewNMC+dyCxCsRasfrg0ps8tMDBDdFU7Jkek24TOSU/OP38Cr5?=
 =?us-ascii?Q?Q3CJxw5RFL9OuXAV/yh6Tu6Q9dvHq2IFNWPTvDVCkMAOzpou0awGcAQpYEXt?=
 =?us-ascii?Q?Jhn9bpx9quqU4jZ7b4z2V7o7e3cSMbFcovh5OoP/yThLql5m7kf1sFjTFa6t?=
 =?us-ascii?Q?+/d3M8dJB44v0pM4zSwdFhAkwTWArr6grZHlkv4jewbIf2dEf9p6+KN7e2J9?=
 =?us-ascii?Q?EJSV+PSdWAgE1V6yP+EPon4+E5i7iZa9z2zqd/Rn6c/2nMbs4+/Gw+2Q6fnn?=
 =?us-ascii?Q?Qp6dsXPu8S7XHGfvUkJAELLG6HVP/yIusdwp+cbf783Khb1JHewFpuvP9QeB?=
 =?us-ascii?Q?IRcne8/dLhZ4Rdmvii6/svjzRrpcg6JsR8MyXmw6JHqgCV1cKRFgxmh+OE/L?=
 =?us-ascii?Q?nJtZEFLZkHsaxKTwP6MIxZEF6ls8AGoYKulYi+2I?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb86381-40e8-46ba-8efb-08de23f2d633
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 02:58:22.0713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/B3hIvwUrtc0O3sjALP9ZyqX/tVsWoTsW50lz+1jw4fRCaC/4Y4wj8lLGiL2MyB+PX2voE1T35lYkTghlUl3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9635

When the system is suspended and ptn5150 wakeup interrupt is disabled,
any changes on ptn5150 will only be record in interrupt status
registers and won't fire an IRQ since its trigger type is falling
edge. So the HW interrupt line will keep at low state and any further
changes won't trigger IRQ anymore. To fix it, this will schedule a
work to check whether any IRQ are pending and handle it accordingly.

Fixes: 4ed754de2d66 ("extcon: Add support for ptn5150 extcon driver")
Cc: stable@vger.kernel.org
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - make dev_pm_ops static
 - add Rb/Ab tag
 - add Fixes tag
---
 drivers/extcon/extcon-ptn5150.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/extcon/extcon-ptn5150.c b/drivers/extcon/extcon-ptn5150.c
index 78ad86c4a3be..31970fb34fcb 100644
--- a/drivers/extcon/extcon-ptn5150.c
+++ b/drivers/extcon/extcon-ptn5150.c
@@ -331,6 +331,19 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
 	return 0;
 }
 
+static int ptn5150_resume(struct device *dev)
+{
+	struct i2c_client *i2c = to_i2c_client(dev);
+	struct ptn5150_info *info = i2c_get_clientdata(i2c);
+
+	/* Need to check possible pending interrupt events */
+	schedule_work(&info->irq_work);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(ptn5150_pm_ops, NULL, ptn5150_resume);
+
 static const struct of_device_id ptn5150_dt_match[] = {
 	{ .compatible = "nxp,ptn5150" },
 	{ },
@@ -346,6 +359,7 @@ MODULE_DEVICE_TABLE(i2c, ptn5150_i2c_id);
 static struct i2c_driver ptn5150_i2c_driver = {
 	.driver		= {
 		.name	= "ptn5150",
+		.pm = pm_sleep_ptr(&ptn5150_pm_ops),
 		.of_match_table = ptn5150_dt_match,
 	},
 	.probe		= ptn5150_i2c_probe,
-- 
2.34.1

