Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010067.outbound.protection.outlook.com [52.101.69.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537E92EDD7D
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 07:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763106111; cv=fail; b=PR39UFNdDohlF8WIcAgGK3VwyLLEHn3cZ5WLIS0WaaoM644ctWDP8akZeqNMriOubt2Mj80cWlSVAEKlHrCKVeL3r/5iGObjKgucpWqU1sBPUudXDewkSRQyOH+Kz26lC4Euk5UmV5jxZAy5XA8kQ+I7j7p4XMz40D+XYMUXtQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763106111; c=relaxed/simple;
	bh=KU3ZLBnkPNp4EYhpelaDIyD4l4DAzrCD0yl5kFfMEHE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=bpUDnRY/lN7qGyZhPPC+X+NBEff1DG18a71Zh/WujUyWQM4VRaz3s3DbykRa/Pgw3ryQq/TGXe7zGcw/6wdkCboPioYzIk2aoUhJVCOF0GaUyYNrawhO2eV5tqjxSi7aAt0Bgxq8B3Qjcgc13iA0SVoM2N+LUG+4tzqpWdg/Di4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gRiPHRUN; arc=fail smtp.client-ip=52.101.69.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gRiPHRUN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSfrz5QF+lCB9+KWpAE0MpG2jdrDNaSlTONV7SwuTAr70ih1QNAm++dtm50iisqBNoGzNNIjUgXJ/7wEOXt//0J7QRc8mESiwcefjiK8uzVFioNEjxyYvmC0DGXekvab4J9lXWjSCnRaku9jLTc6w0gQdkhvyhLjhyUpv4+u2uitnms1Jpy28tSpPT6/oKFXCHBXTFzjf2qxXkzbVQM86eeQi+YNjEVzlVZGLRE7i0nlHHNwyvmskdBCHCRHcb8NWqbDWs2chBS7iJNc03KGotD8/x8GjCm49jG0k56nIofs7d/x4DPYzgBcAXP41wSwfUJ9KaIonKURxgk/iK3Q0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6IagQV8m59Uh5c47+a6j8+saVMKrvdTw1cEcQamgGg=;
 b=ZW3J0JAh7C6aQ4reiCBFW//+MY0Eb5hOhOtXmoXxHs1GwiWflccwqfIqRKcfydsfuYwRYry7gCGIQyFHN9PuLYRsxadoqE4CDHmLQdzT8fMcHmIqmwmrRt+G/FtHsAfljJjBTHpz+hF5H2VdGDUFzP8D6Y/x5z02qs6PthI7gJUzt7hsusejLaCDTMKEKsJaDozs1fheyUvp/Dt/FjxT+7Gkkqdu8k1jJPfGwFZlE5Ib3xglzNhyM9Y9SMEilfED1P4AV77haqarOQJ4dcQdEX5G0SgC14PEzbEn+61499SZJxx11G857CXmMj7FcEPMAdZEtkE/iZq+wyrpQ79fIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6IagQV8m59Uh5c47+a6j8+saVMKrvdTw1cEcQamgGg=;
 b=gRiPHRUN6A+FPNwwO2X4PRR3IPhqernzgKKivQxXvQSWj3AwNaRQi/60yhdRnXiRGeUEMhkZAPo6jCGyS0A9mf2zbGRuF+BNcqmK5QGxYs4Fa4O7qyxOtvC8xago2lSJfoh2qvGBggQ53VkCC3jfJyWjdMEbUoElmZ+TEf7hPJ+lSB+a+JxmKGizMHFtgyGEY7RXdBmaIXkO12coqDJ6+6aFZZmaPX4jfSLogzwQ5IiL5aeKqONN1SduqbD5RjY668y/uuzchfRmQQIEHCgTzr5QWAbWV09LqOhWI57RTNwHOrWGLCKXQHbJYBRbCovJ0k3UYw+48GnMEnDhSsZTCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AMDPR04MB11677.eurprd04.prod.outlook.com (2603:10a6:20b:718::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 07:41:45 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 07:41:45 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: krzk@kernel.org,
	myungjoo.ham@samsung.com,
	cw00.choi@samsung.com
Cc: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] extcon: ptn5150: handle pending IRQ events during system resume
Date: Fri, 14 Nov 2025 15:42:12 +0800
Message-Id: <20251114074212.1214255-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0134.apcprd02.prod.outlook.com
 (2603:1096:4:188::14) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AMDPR04MB11677:EE_
X-MS-Office365-Filtering-Correlation-Id: d65b045c-b96b-40c4-1d0c-08de2351426e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cxplfWE00x10bV29c29ctHcx6sweZcol2jizIegEc+VCjIhgxHH0cQ3ZWdHL?=
 =?us-ascii?Q?v96UFi8IXXuAPYG0njk1M5IwnTj/4lZlo4F4czjY93GMHrowYzu9XXli8jrV?=
 =?us-ascii?Q?WufxVhgjGJ7QtD+pPIhe3UvT++bHe1zhix5XhaskSEDPhdwzDstYfro9Afhq?=
 =?us-ascii?Q?Fa8TGV/HCC3K5aby0egBm4YjPVwcz9lB2cD5Viswwir3yWaH8KgZM7GvGMih?=
 =?us-ascii?Q?JSVv7fDwzVmjJTNyGnMInMC/RgADG6KobotNeMPoO4futWKAArym70SgbtGm?=
 =?us-ascii?Q?ZAn8bIbu5ARPvCKLwIAAe94ntybCMx18/8thDSvo1OPmnCTonggPhMB3ngRj?=
 =?us-ascii?Q?X6x1eMtHkSiE2HOItLA+UIX3MK6bAJXNjMWVUr1ZCsfE36XdHZw9mIZ8m+JJ?=
 =?us-ascii?Q?aMtr3LlUU08DFoEEaq1ydB4YE+fF9fgnvR+/rzvH+Ivxm0kC1ZlAyOzhi9ZY?=
 =?us-ascii?Q?bPh45RUWU9o5vy3EdEgtRldZdz9rvt2NoM0WWatdcJ/akOF01jkP8DkO5j8d?=
 =?us-ascii?Q?En260P/EqKxjeZyx4wPoeQt1kZlwkS2Z1HMR51yRUlHfrcXO31ZPdv/Nl2jZ?=
 =?us-ascii?Q?CJ+dJe6vK/MMqhMbOG4EJ1H/XBuUx11edYVtx28aBodvI0+CbPupI4TzCdDg?=
 =?us-ascii?Q?CCF3bM4Jnr8sxRmyVRob/TQJlAEr6U9/en0Lgik1MG9Kv6Vfn7RzPSnjVNG+?=
 =?us-ascii?Q?x6FePTDFmtwopCsfDLDUwW5SJUCKXZrXPpfkmAktPZGg+l9HgYDHdWjiH2cx?=
 =?us-ascii?Q?qyyxj/J2bYEqNDpp3+slzzQIo7A9R9pXUInDHMPtSC0q3Lx+PRcW6OStsCBS?=
 =?us-ascii?Q?XLTRuZraIgRvToClQI7JSmrE2RI6an8aOcVyiU3ZPgqxv3huqeKOb4REWQYZ?=
 =?us-ascii?Q?W2QUrj/OgsnkBDyNX6sApwFvNLLNJb7jxX5XzIudpIKNtZKhFB7nLiJr4WsW?=
 =?us-ascii?Q?4iUyYlcZ8Z1txmssU9EhW/5aiOikS8+yjH5BsK3JNx/dGjGRGEUJ4in0lAGY?=
 =?us-ascii?Q?Z34M3Hqj9nDlKe30IBvMY/vMaXexaPYTeRukcb9BPaSS3viCu0O7pOZHb2SI?=
 =?us-ascii?Q?zek93AKpHHOK9nhQelxKJSswHjaZfB1/r3MGDhZvZWvUzKh7sGndS87urSdl?=
 =?us-ascii?Q?AJIr3dwZGDQuyZ3Rdme8hLAlbEjcvhfRlEXBUFbD420yfqb6Is/E+10gqcyZ?=
 =?us-ascii?Q?+9qUzmhNm08SfV7QDktTrC8pAUn/FpZZSwzckx/iHh1pUe/J7NIwOI0nGy/0?=
 =?us-ascii?Q?TDkIHOT0ilrayy/dRwo8ld2D8eEccSJR3Cyim04QD42JE3C6TtzYW6TgNWhe?=
 =?us-ascii?Q?KdVMF0rTRWKDozmL0hHxgoOKlJ2mH3+yn1iruUs77IaeWNtWnOdPWDn/bptN?=
 =?us-ascii?Q?YWmEoFa3UpBcGyuITze6p5EYvOYA9NfEemP9KUwkIQCSQEafj4XBXQkbbRq8?=
 =?us-ascii?Q?8/0EKGswpwCzv3jYc+hTWo19GuR42bInFwWlnwCTSFU9v54cJD5X8cnbAAKS?=
 =?us-ascii?Q?VeV7kDHZKSJgyVyfdpw2ASkIGs8FO9Pub5hr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eDhGuO+aoKGeaYQMKHxJJ7FW9mLpZ7lVcFAc6UYuY2hdPdS8wZ2QeDo12sEs?=
 =?us-ascii?Q?CJPHaJTLhC2OxwUp7ItRX5hoKeVaD7OBQDGt4kJpk7daOqw9XIhJ88BYGiqO?=
 =?us-ascii?Q?KeXGiV1+8PQGFqCW/VWv1BJg2VaabXpvyQXmMyHqYAYguNIt4vkC2DcAV5e3?=
 =?us-ascii?Q?G1BdUMgUROzZAb4v+/SfqoatWW01lJukLR1VxswMyLnKjtsjiLaFVIYsnLfH?=
 =?us-ascii?Q?YIyBRl4EY8hDt3z0jcnJk/Wi12hXOMEeevnWv5aCHi9UmOs4zL1oa/Wr63el?=
 =?us-ascii?Q?ViYq1Tt+drSKHBIALAZ5/JY1QVtkB24US+vW6OxHiOc/rtmu+2BXN0vg82p+?=
 =?us-ascii?Q?fHpK0Lij9h1w5u2mtnho3WwBlVB/QmpdrY6o7acpJBrQAYRf3Ghcm2dyhUqr?=
 =?us-ascii?Q?meiNOMhfCQvxQu2rbyqUzDlkurLavL3DkcMsMZWFrkam5o3S/1ORkRtlbBEP?=
 =?us-ascii?Q?QPZCnk1W4gqsAVV2SmFhabqZxtP8IVybYhk4oi6u0EI+li/fgsp8ZNa+GXzx?=
 =?us-ascii?Q?HrMpsT9LZrlsyBprCfPB+/eGZ6yidBR2tv01yYMYXkDvs2Q4SFDA2xnb6ScT?=
 =?us-ascii?Q?ppWEOBvJrJ5DUKXn/NyrLUQ3slpLUG/bDMj0InvrSSRRYSH4vNw1DAAYt020?=
 =?us-ascii?Q?5DpOBiuot4EZX8H0moQS6qbCJSQG8l/YRre5MAiZnzpFhQgcbr7s3aIGp/v0?=
 =?us-ascii?Q?j3sSm4j2NgPNpTYvrD1e8sm49hx+lFtJ0poGxXFzwvDmG0VikTORBqmJn6L3?=
 =?us-ascii?Q?vj0yFInM1ngcgU2AzxXycKcvOLvWy33d1669NPs5sSb/AKm1vlmFBsqb7hYC?=
 =?us-ascii?Q?SUfKeHq/MvmgsaI8ChOoSWfbsm3fnlFO1Q6zfW8Ew6LmS6Z7z9C5b1ebYCRE?=
 =?us-ascii?Q?JLwo1E01GBNbFHlNdjfyhwoTfczgsxA2DXTrMimsUU+7UDVOpRcQhHSbMcf1?=
 =?us-ascii?Q?AEMBr0JEoxHuYHjd4982BnLeZlhU9ncu2B3AmoTBu4CYIvxa/zcNN0fSgZv3?=
 =?us-ascii?Q?JAmS9dbTY/SCfQjekjeZckJ2pKxvAvNpNCIl/E/m1qLifSAVzdPnu9zmmVIc?=
 =?us-ascii?Q?jfsft167q9te8PVWiTlB7Q9GYe7+EEpiHew1GKWLJynaCa30D0uPo+wNcXdM?=
 =?us-ascii?Q?oCKAO29OuyfceeJYDa36HBYxDXqzXEf7Eyy9cmGiLgh74+frDRAG65moo9G7?=
 =?us-ascii?Q?VMwyw7vF1pqtrDqbPezEOZzCIllrAcOcVWGcda5uwdcsGSOsxpKvCd3seasc?=
 =?us-ascii?Q?YwELZjcmmxqORKaVeTTdP1CT4g450tZ1S+n0Ktu56FoSCXtietnPwGmyoWSg?=
 =?us-ascii?Q?lahcRYmQW3elSlwahQgo4qB+/LU6XyavNQwNg7sQXGdjO9TDQWMIr0VX+Qtk?=
 =?us-ascii?Q?qIU1qJfvWKMbgo2qGJf8VM2zxUoOJrRjMhPiRemEelpK2ZUPJXE1Am9Yypt2?=
 =?us-ascii?Q?lonPHSkDh80rzOLLEhzU/WCcxfXpnRyXlIFFpWjnpXyaAEet92LPQGszEdmj?=
 =?us-ascii?Q?uul7MSLdseFGf68vb7gXxDABmAXEeI/IDm7PsVKCDHYm8dt/Ck7yvIKHH5GD?=
 =?us-ascii?Q?bpZ54uQN5J9KApvbk3WSREwAJsQyb3wosg2YxGfP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d65b045c-b96b-40c4-1d0c-08de2351426e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 07:41:45.3487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +OHvmYsjUlSinNHgk3y3/4xBP1wxQuTNSSNk/UMx75BId6XI54upNc4pyTV9rJAtPBL8eq4BlsG4KM8ttjZzxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11677

When the system is suspended and ptn5150 wakeup interrupt is disabled,
any changes on ptn5150 will only be record in interrupt status
registers and won't fire an IRQ since its trigger type is falling
edge. So the HW interrupt line will keep at low state and any further
changes won't trigger IRQ anymore. To fix it, this will schedule a
work to check whether any IRQ are pending and handle it accordingly.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/extcon/extcon-ptn5150.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/extcon/extcon-ptn5150.c b/drivers/extcon/extcon-ptn5150.c
index 78ad86c4a3be..4f7dbba5accd 100644
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
+DEFINE_SIMPLE_DEV_PM_OPS(ptn5150_pm_ops, NULL, ptn5150_resume);
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

