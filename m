Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012000.outbound.protection.outlook.com [52.101.66.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9885241A760
	for <imx@lists.linux.dev>; Mon, 17 Aug 2026 12:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786969943; cv=fail; b=ZuvZN1U7aaONAiitViUHaEZa3cPStQ6jy23nnLTjULer1uGJ5tMqnOpxFROsTsPvTHzFGzCOM6DLo/3SnTQOgwkn5KpkgDiufQOgbIeItEGkTAF1HhVV4cV08dqLUtOw8irWNSsMCmU33ZP/OrRe3Dq9omx8wrPh9ZiFPAPYPB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786969943; c=relaxed/simple;
	bh=UykYUkBv4LACdfOnpQBTMp7iHFNXksy7IjgLMvcKGto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d3upvLez+GjpTGamynJ2az4N+x7HTdNmVATrpWm9M4VlMquIxAznYDdfnOp6tcA5Lrq4SMxVNfdhxJ5seG8/hR4XFr2dhAX3kffJURpEybmzMnHVUJoP2TAXn6vXsEyOzAAlRUsEdpzBENA4rvgkerNFDZRXcrAam1HsYL14CkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bERdjpPZ; arc=fail smtp.client-ip=52.101.66.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bERdjpPZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mrw1J1Oj6mDl2L2kEuk/XWsN+wLBFX1tmedT/xFsU8jAQlFduQGs4QbgA+8kqrJL0XHMA6TDINUFJ9SZXOmkgm/zEPb17NOYVa2USa9xpshDiphDqHgstwmlsG/z9ngeUboBObRASTXqJwT46UyBOPcsX4m/1iaPte/bz0JBPCk90n/cGbj0GQsBWACVpqv0F0aGQNShQNC6uF3fPCN7aqjxZOrxG3WedfpFibfLZCW7l7i9jOD4nb3DTjoIrpElR9hbY2Ii6L7eVUWfwQjKv3XRGufb+i/3/8M6x4AnIA+Fm0aoKSYyARPX/zyMd4/CZFbstzY43fZI/0nKpO9wsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Heq67KI6u9tcIXnznIDZz0cqTDS2C2nUkCxnPHEEg9Q=;
 b=dSXNLd8X43hJWR7XFhG0CiW27AHTKa9AjDZUbxLGPjivpUeMzXKd0LrKyUd2n6SrGjjEmvahZOR8jk58EkYilav2Go5w+u8IO4+I+kNSzcWGa2s/LmKPT0RpqE/KUNGoZbZc9yfd5gwd4jpFNCeoBiqOrl21v2ehAjsIoNP7z2ykdO71WajddAvhEbRyGauFJ7Qh6j5N0lb6P3eSlP2L0Leg5+wxVrXpcBmOJaYPRA3gOc8cr4VDgne/8D98oQ3PGwVRpXCxBvcaNm5Yh5EA28VA29t1b+X+kaUGyrITIfAWPP9Hs6SFKE19HctYfo+HtNO28GqxLZXoJYzf6lJTEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Heq67KI6u9tcIXnznIDZz0cqTDS2C2nUkCxnPHEEg9Q=;
 b=bERdjpPZ++lB01EeIr7KYVIn8VzXsGEHZAYdfDAJzNmomAyf53dcTgncwkN8HDZnysunUMJS2KZpodNz0+GfMktL2Xig9sTWSe0fkHlaTUVxTzjvBD9MFR4SH+yiXwwim8UddzMnLTap/t4V9/7XWRY0TzyomyqGk4jlqJ0xUbSNJc1YtktGjaqI7E6xivmpZzYZxeB4TL4baSlhjY5IBxKgD7b4ItpHbyINAPZq7lTJsc34ywd65lLUh1Nbj9zntld0GU93n45Uoi42uQO+W+5xiqPYWhFVz8fCe3KGPXQ+WOLMg0qMYgZuNPpfRAV9lCCUQx+pdu04T8s6v1wxhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MRWPR04MB12331.eurprd04.prod.outlook.com (2603:10a6:501:83::21)
 by AM9PR04MB8650.eurprd04.prod.outlook.com (2603:10a6:20b:43d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 12:32:17 +0000
Received: from MRWPR04MB12331.eurprd04.prod.outlook.com
 ([fe80::66eb:ed06:314b:992e]) by MRWPR04MB12331.eurprd04.prod.outlook.com
 ([fe80::66eb:ed06:314b:992e%5]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 12:32:17 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	nathan@kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 2/4] media: iris: Guard the QCOM_UBWC_CONFIG select with QCOM_SMEM
Date: Mon, 17 Aug 2026 15:35:39 +0300
Message-ID: <20260817123542.48475-3-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260817123542.48475-1-daniel.baluta@nxp.com>
References: <20260817123542.48475-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::9) To MRWPR04MB12331.eurprd04.prod.outlook.com
 (2603:10a6:501:83::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12331:EE_|AM9PR04MB8650:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f02620-8735-4f63-7adf-08defc5b92f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	de30Yp2URa5/Gxd7P/r0Om5JwGe8PR/JWr1WRO7FiyNY2LsTnygZ99XrMO5wgwO45OJ6oWs51NF6O6icxbtHPjP1rYLYGeYcFtsbmvZvlMz8eb/ah2BVsjkBkXJoxpvNh5QVGvF5sfXKm8/iwN2jQOfOhJPIBKzqLNmrq/CT+ZSDIWeYxreEUvw1F0fru957UqQH6gV/N6kgdhxdY+1oblHeqrKgCZbbuOmTnifJJy1rF8/kyT1C3qCFHEMvQfBEQ+qMEFHYbm1ajVea2rIib/t8wMfiKbqeFcRr6mKSiwy74iDXmXbTiJ1Tautvh8wariPUIqTz1Wy76h9iIWiCGQoSNTUfF24wJmJ4PTVdW+zY/uOuPaoL9MxkUWUENLX/f7q3E3oyYQLWlRE5aVu8DwbEnBbLZBh9XMovP5EM8QHi4t5nVeSPrV0bNL6zg+lyfb8P3gVMVSyO82rhOdNSu9cu6aQDTqM+iWHMHSnCINcpJRLsGDe6skp2Cm164D6tyMYFtKywgjdnS2IFMEBZKIQTjE+yKmGbNjljgqT9zZdSZy3oet0vEAk0cjXFAQ+xg+7SaSrFIZAhTdvO15ubnh3fFV1lV63D8836W7zhjwyHn6VlVu679rm4T9POmyupaSIUTOCufVISAVbGNB3SmtVuoR/cooK953KV0X/H2GA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12331.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FUrRi7EfsmbXQcBSAUjdUnp+EAaXqOfI/7xMG5Ey+vNvgxPPG2LoQDDyb/4c?=
 =?us-ascii?Q?g1OHec9wh72ifC1H8D5fUM+c0gma4iX71BhAuUec+myvV0nKc2+80mQ5c0mi?=
 =?us-ascii?Q?Mnd5JMeZjm5NS5Oqm7aUsqBqeP/vI2cF+bafmOMmIMHspcELzkf8cLkWljlK?=
 =?us-ascii?Q?er2n9Zsr4GkUB0mJs2iezyAJkGguI+UFoMTqE4s1vf8Ho/MbasTB1qS5tEM+?=
 =?us-ascii?Q?EtKw2NxMtJqzid+IEzMXIAI2Y1K97QwHBr+GDzrsfqU09YQ8VYgP4PhCfYpw?=
 =?us-ascii?Q?59dzLH5Db9iJFwIUAvkH7AyCsPbehGL4zfrvMnYDlO5KD2UQJbS3oV09Yzes?=
 =?us-ascii?Q?vh36OaDiLs/GDGFSjzB5JgFNEL6ViKMzOGr1MGAlb4Nqqk1cP9LVPwMUWG8J?=
 =?us-ascii?Q?wzOkpRvkTRcfKtU5XzGQWxcvPOnlmB+W+lFvQP2PT7B74uKAvjYs9I5zQ3zm?=
 =?us-ascii?Q?/COuUOl73XFmgfVwZCy5VLw/coLsFslrkjC8UAITc1o5DB7HlYAQaoo6amum?=
 =?us-ascii?Q?xEtqF7ntfWGhJwYm19WV2Jo429vR66XFHHy5zgEDf3AbbtQN88Y+QPoO6kwk?=
 =?us-ascii?Q?w0JoinxtQu4lIoNToNyxJwcK6inrp/3OdZfnAVdG3TD8llIsllQ3BICxHvyg?=
 =?us-ascii?Q?zLZroZxc2+YErTddohk2WprOn5FdusN5XOkU+ZpSPYRNTC4AVM96TIKZjHM2?=
 =?us-ascii?Q?GUfr7oJWz/dsiAgZcMhhCEhuYvmPvB7PlVd59LdmCuzGJQLsnW5dU43hfyIt?=
 =?us-ascii?Q?HXc4sS9rDO6QpIAXmIVr8sX6F8nRGyrjLmgGXf5nXYYdue69J36aWAh/2aSB?=
 =?us-ascii?Q?KxAjkJE2sfMrl6DBgB+d6zgl4UfwZU4119UnR62BFZAb/xOpWXOHhHyZ6OFf?=
 =?us-ascii?Q?8Y799FKmWvHV3ztublb2KB5yipBS/xm5Qcq+AtA+PrvDgp12Zh/bZehcF2Cf?=
 =?us-ascii?Q?32GZikiB5UXfNM54iwEe7Ltx2N0I09QxFZTeEV9KXFKD5f7YXgH1EPbrzpXh?=
 =?us-ascii?Q?WUikOYi43IJ4PQ8f5TWeG6/l9T17PP+ibHRGYKJKRTJb1FZdM8Ceyo1t2xE5?=
 =?us-ascii?Q?PtiLl5hQnSC25HdS/fpsDXTEOyuJs2L9p5NgbLp/8qfPyQr3YCV+uSix0ess?=
 =?us-ascii?Q?0p3viA2j8+tBvM8pcuiGtjBXFzft7UKeUi/7vYDSHR8YfaxZNNp97KMiwg2X?=
 =?us-ascii?Q?4Qth4muY5Oj3G7CTfDbglKLu1tySKUf53mVYeDC+bZcBTlleAdRZFO2wB+3P?=
 =?us-ascii?Q?2qINpv2OgPPF7yUuDZaPlULKz9XmOjnL5lfxv3t9vyQ0xaAm4ZLazOQ4nYVI?=
 =?us-ascii?Q?LTRn1d54ubH+i7Cbk0ThqqBUlMgrZwKUAl7UE10524l8I9TrC0GiLouQ2AQ5?=
 =?us-ascii?Q?Q/n31i3L/GS+GECTYeM3hV0W4UFs0SMYKAXxCeSW3DDfQqMtwhC/u9jMlz8P?=
 =?us-ascii?Q?4Vpe8moUuIE9hJq5JpHWBKCV1uVHBE4gu/tuEsSw1lN/QdlJKTy32T0pu9Q0?=
 =?us-ascii?Q?+MS0ZzWS2CY5mIExr6hccdIQlzPF6C66zlDSZ+OowOyarUGVvBHE2pIct86d?=
 =?us-ascii?Q?4+ibHiHDuBy130svI2o7lSiorQjMCtgOWf9QnGiK4no8WMKzBBbs26s86NQx?=
 =?us-ascii?Q?kcI5B7/IkkisV2qyl05cXGVyC0Pi/lYI5wlogRrUyATS2us4+/no7rtQ4Zy9?=
 =?us-ascii?Q?AYvF39uoojHha48sIDMMQs0iG/6U92nCUfaDbVD1+YIIWHf/e0G76j8BEDxw?=
 =?us-ascii?Q?0DtVzfSlAw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f02620-8735-4f63-7adf-08defc5b92f8
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12331.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 12:32:17.2433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nnpRwmvMHyTZ7WRaQd2AMuk4RAur4s5dLpvkovR7PlkuGST6dQpja7oOs4ef1gPtE+mMowWpTuFVI1Hfujp4qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8650

QCOM_UBWC_CONFIG is about to depend on QCOM_SMEM. Guard the
VIDEO_QCOM_IRIS select with 'if ARCH_QCOM && QCOM_SMEM', and add
'depends on QCOM_SMEM || QCOM_SMEM=n' so a built-in driver is never
selected against a missing or modular SMEM.

Fixes: c43207553867 ("media: iris: retrieve UBWC platform configuration")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/media/platform/qcom/iris/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index 388c9bbc81365..0996213e71e7a 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -2,11 +2,12 @@ config VIDEO_QCOM_IRIS
 	tristate "Qualcomm iris V4L2 decoder driver"
 	depends on VIDEO_DEV
 	depends on ARCH_QCOM || COMPILE_TEST
+	depends on QCOM_SMEM || QCOM_SMEM=n
 	select V4L2_MEM2MEM_DEV
 	select QCOM_MDT_LOADER
 	select QCOM_SCM
 	select QCOM_PAS
-	select QCOM_UBWC_CONFIG
+	select QCOM_UBWC_CONFIG if ARCH_QCOM && QCOM_SMEM
 	select VIDEOBUF2_DMA_CONTIG
 	help
 	  This is a V4L2 driver for Qualcomm iris video accelerator
-- 
2.45.2

