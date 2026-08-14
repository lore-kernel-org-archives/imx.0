Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5363C3456
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 14:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786716865; cv=fail; b=hKcC/fDy+wXKi0Y/mS/f6dwQbBfwLTuj1w2Tz4By0eXRsGWFi7K/QWaJsbbnjVi3K8QqVMPkfGGpjdrhISaCX8eMSuTpOoChE7TThh/lTpUapM5DITCTeLsDKfYgLZx6wtNQ0bEru6FGGnHn9t1eAaxtjGUz1fAxF9JH8qYsZ+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786716865; c=relaxed/simple;
	bh=taxNkvyC+3fwdbFIyezoaJ2NtziyVxJirwsKx1z0QCI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KnbW2axQ2dqaYut559xpT0EEmQ3uIUG8fZyb2Hw4rVT4hYaJAR2kZP04Wm341pHH2kkMcbf1kKMczHUcfRyWhSDGWalfh7YF3+0JrPD1WuaBWvH+/FA/nGVbAH21YYP46GEP8bmTo5y9ektbJd3J+8AXB1UUVwZ/SGRPVXSYjg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RpEsVV9E; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RpEsVV9E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=osq3n4e4esbHkoyX1i2nuw8PU0hQHNN275LarEXXztpYzNi+RmEUNd4Jg0ld//xX06lgL5vJ1bAiBK9oew4R04V21XRu5m1Wz3YDF44V+YUphsTmigs9v9l99dP9vaqE+mSt+Aa8e5YGsdeaJFx9Gzn7V81nZCxj8e/OzjMpIZ9PzzG1XKD/YTxKQxS8erif8hFLUb/B12LPB1c17BtOsIjy8ODsfa1b1Tn7yRjh/cjV0ioymKWb+zr7e/927oLgbRKFjpvAm0DKukd+6F2akY56zP35pDXk7WaH7MYVUaoNi8HV8eziaprl0P2VpXG8zLwHapupt3aPPEvcm5Di5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86j+VDi+MzCUrC3F1y8Ew662VUFPu1q+FF1D7Fjseho=;
 b=ac7W541gor3T70vaVl9IzH2jgfjGuQE7zUaFWkcfS/LZNksxvQdIPujxfCg9xBiPgjVN7i65l7Y3dbXH23FgA9vpWGCeh4g0ObMBc4Qm7z6rhl7TB2vCOLwi5A9dw306UOqaQFYFHKs9E/8uInkzowOtpzrDwRYPB9EvynZHfnyxShAxwgfI0hA6fhhOF/umpuojbc/y4iwBxEI+YAWwpzZMzGFTG111NC+bCZ3xAQMSb3BvtwqgAPXm2ThKBxphvDGUzZGCZwjYd9xFnPoh2pLzW8h/etXhONWhSqWY2TGC7FNm0quKrqE7MxnJ6Q+79JDJnDyBnphTo3PYuqZVFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86j+VDi+MzCUrC3F1y8Ew662VUFPu1q+FF1D7Fjseho=;
 b=RpEsVV9EsHdgCUo+zn3YrkVan0ToGiG+TGSXeNdbwQUyzZjwYh59eWUJn/vVbjOHB5d0Z1S3M9mOP/nuXXcl0dcHFOU2KMMEFNUFqEBMrugaFKAGv/LGFMZVRBcwszp30apuB+Xl8Ba0DPoRep2sSxBfBo4kP6Ak1sCUGqOMVwuc3FGDt9nRWOi7RjE1Ta+TmK5Ea244xUmrRWA81OG+BT6OTN3oN3rlCfqBmXDjED6NCGF+7IZJfBjVaCf0/6ZQSIyxYidOYGE6yH2VQ0lBdTOCm7G1V4A5wzjilbBtu6Xqy2h37yiq+4bhD0iWxvogWCQrNbxQrXzzhp8NJ2bcmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by PA1PR04MB11531.eurprd04.prod.outlook.com (2603:10a6:102:4df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 14:14:05 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0292.024; Fri, 14 Aug 2026
 14:14:05 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	imx@lists.linux.dev,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v5 0/3] soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
Date: Fri, 14 Aug 2026 17:17:21 +0300
Message-ID: <20260814141724.1006382-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0024.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::11) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|PA1PR04MB11531:EE_
X-MS-Office365-Filtering-Correlation-Id: e69ea77e-4ebc-41c6-30e3-08defa0e4ca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|23010399003|6133799003|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	jh8MVvVz4Y8r5koPxHqEcbX1HxuEY/b748lDmEq7ia/plfOZQB3hGuZZ1ZbpmBSJKx0wTwODnTepWMN87Fruiu6/Cd48A64ftLqxrrDtbge1Iel7vZcmauIt4EL1np3lKNsEg83ZsGVGLvO98bFHfVxlHbKhR/FDAxORRoZxMy2zLtMxW54q5uHsfofACNp/2pKg4jvTsNFluJC/w7pVv7NynQTeqZ24kASuxODcA1Va19pZ9m2t/MUx9DDuNUXxREtjmpTJxZashIt0aB03oQHClteu3hBaqgYjvrNuRcS5q8VOHcOGpTiD38drMgVdRFyWW/fP3Ym4qMCBtC/6wR22EbQtD30XfTvXc3kTOUwTZ5pjhLECiaKLDhbQAHO5cCQFaoiCI875mCed6TgaQ4OHLzqfn3osLi0s/65U3Zn+jSk6zjHUKWrlP0eBAaKOTUiI9vUySxcZxgwsZZlvMhfBMSVPte02hSc0EUSl33TjXQ8gbWO/aCEVx2AAeD2rNQp1CDmT28HZc8s0qwJP0UTUwN7ivm29naaNE+cZjXycqpQdushwMlr+ktG81RKa7PZT+8CFQWd+CyilGy2pWIbtTzaJwj3rhJqI5lB0SwwcgnG+79XmNhTiKKiMoS5vLUTnkt82SKYoGk013iBJOdaONgsOY9W0crrGoxNU66M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(23010399003)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jqGsRDaYQymjtE8y/EQODRy4u0htESeNxrYrPObiKjIsqjYKh4ElFye9JnbG?=
 =?us-ascii?Q?JRwqUkmCeO7JwEY34h5QiMc8NLQthyGRqC5fvSkeNM35oTeNZzpP9KCrVXKS?=
 =?us-ascii?Q?nFVaWUpkFgH6dmJUaNjnlGlrkNjLIJyR6kGDhiMRNhKKFX9xElK5T9LwZIvf?=
 =?us-ascii?Q?u5abJ6q/zzo/rKKHbqVIqJ/QrEsFvvE5a9WuCS5XDfjH7OyRVbvwjTzt9/5d?=
 =?us-ascii?Q?W/laxRA9Il4BRmTA0EbDfDRAOIP4KQSC5xjXf9gmuYgsi8+hjMZo85IkK6N4?=
 =?us-ascii?Q?ya1n9qB6CXoVU+NqALD/ZxS9ZN7kPrbIIW7ktXBNL/sUlTuWX9wxFp6nL3ls?=
 =?us-ascii?Q?ovx/9yHyJn+CmA+frm+q9P2Dlpo3HKwCmxH+oR6AC6uedSDvXFa/5GdMg0fs?=
 =?us-ascii?Q?bv97zYOG0cjHRUBG58Zto9Y2l3psAG9jC4ZvXc1bHe95ovfdWyfMToACWBlw?=
 =?us-ascii?Q?vQKRbpmUZ25olC2tJf2L14DHFaafgYK1Cl1hmfrYIqSWBFvTbIXdBuot1J1T?=
 =?us-ascii?Q?WrxlWYZa0DT7Ijd0ioOVH9xsQJCPHVcCBSdptTFz0N3jKEZeR6hs1+l92Lmn?=
 =?us-ascii?Q?CjkPMMHJWtXSOJIbQvjowRpbBQoywgrgZJNMb2S4O2feRC/Md0lQkkeU9gg9?=
 =?us-ascii?Q?NqeN1FnA0b7pVCx2uCczHSfMDijE1P1BJyq5tHqmbFr4a4UZHgl3yHG9Rfdy?=
 =?us-ascii?Q?lcmgIy8/qoITS7hr3Y3pyUexCZinsSGVYs/Kz4iXrHwqvCQ1YnwdBLSxRtqc?=
 =?us-ascii?Q?ZHMpCCVctCG6EMSq/HTBiKR3k245p2sVrRhx+Qs8GgpCCneAVZH3+CKGMiuJ?=
 =?us-ascii?Q?dwBUIQ0B0LmI1ERsv0L+DtUGYEmP0nOumJ0ic9FleRiMfP9zR1GYtSmJYFdQ?=
 =?us-ascii?Q?oGSv1Zp5k1XYEqWBI4dSjt8AWcj7Jody4Ikk1wxKojTvlMENEsdpk7HnstOJ?=
 =?us-ascii?Q?yLv5IIOH5U7Qg//MokN/oyvKDPjgXGWe+JezzRAwGnMTAN/9ExTxBEjKePe5?=
 =?us-ascii?Q?2rQS5iKOfqePJf8gI8nUjX1DSP3CDECz/QjM1EP0GHzKN4NwG1/W2NTWg94n?=
 =?us-ascii?Q?mlTjQGNMHdknE7DK4o3o3btUWrF9UBOL7Fw57zTGKIB3sqmtKyJitgG/H7Dk?=
 =?us-ascii?Q?s1s1dqZOHSjBMXwUArp/iCFX0NDJgdVSlK9fVc5yXZmeE/8bDzBJWQ4/Uc60?=
 =?us-ascii?Q?u/9wo79jgo7o9qx9od03fIwGoN1KyC/Uy+6nEU+4vfXYfEhzqzSk8nharmhq?=
 =?us-ascii?Q?MLVv7n9TflpPsnVTt4uKEGRGHCwHioAUgIOU2KC0+jP4W3KHPetymwFRrj3V?=
 =?us-ascii?Q?JtTnn8FU8n/63+qMh5g0l3R0yny7t5bpM4RKAj8+ghtDaSVGj+DgjgrZihQh?=
 =?us-ascii?Q?gLWEcFAtNOes6qNRwvWw1ZHXyCoywKLC5yjXMFwxxYSX2MuwauxQikwT8XoD?=
 =?us-ascii?Q?tcieYgmY2QA4x6YFhFgQfEOAaBeJQu+mmL8xowA4BBJ0rnWCaRLDQoCVKOXy?=
 =?us-ascii?Q?oxnalF4ZLWkypYH0zAWcbI6gq38WUm7ZZ9zcLCa7k9JoqbVgaODyIWiDW5qR?=
 =?us-ascii?Q?W8HiVU3UrpmpBdpEJDG9DXsmRWd9tfigZh5pjgvExsTCdDzi/+r3EvPdC9TP?=
 =?us-ascii?Q?ka+Lg9U0yxqYl8VB8fW6wivVhUaezRjyjd/7heq4ulrjZP4wheHWYi9rY5QI?=
 =?us-ascii?Q?dxeh2cElNcWCcZz4NCN6vAqicNTsZtB4XC2mlKivT88H5Ga+5oEWGJ+YhrbB?=
 =?us-ascii?Q?LJauZfC6Vw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e69ea77e-4ebc-41c6-30e3-08defa0e4ca6
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 14:14:05.6678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CSb9oj6NvAZxMk7508lc9qoYVp+WPWaueXqXkygbaYbN5xBQ2Op7dweLbrmvrXqib3iZfS+8C092VR0DwTrtAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11531

DRM_MSM and VIDEO_QCOM_IRIS select QCOM_UBWC_CONFIG, whose
ubwc_config.c calls QCOM_SMEM APIs unconditionally. On configs without
QCOM_SMEM this fails to link, e.g. on SOC_IMX5:

  arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x2c): undefined
      reference to 'qcom_smem_is_available'

Fix it by making the QCOM_SMEM requirement explicit in Kconfig.

Changes since v4: (fixed coments from sashiko bot)
- Dropped the IS_REACHABLE() patch. As pointed out in review, it did not
  fix the case where DRM_MSM=y and QCOM_SMEM=m. it only masked the mismatch
  at build time and turned it into a guaranteed runtime probe failure,
  since all callers abort when qcom_ubwc_config_get_data() returns an
  error. Instead the mismatch is now made unconfigurable with
  'depends on QCOM_SMEM || QCOM_SMEM=n' on both drivers, so the header
  keeps the plain IS_ENABLED() test.
- Reordered so the selects are guarded first and the QCOM_SMEM
  dependency is added to QCOM_UBWC_CONFIG last so that we dont break
  bisection as pointed by Nathan

Link to v4:
  - https://lore.kernel.org/imx/20260812151934.709198-1-daniel.baluta@nxp.com/

Daniel Baluta (3):
  drm/msm: Guard the QCOM_UBWC_CONFIG select with QCOM_SMEM
  media: iris: Guard the QCOM_UBWC_CONFIG select with QCOM_SMEM
  soc: qcom: ubwc: Fix link error when QCOM_SMEM=n

 drivers/gpu/drm/msm/Kconfig              | 3 ++-
 drivers/media/platform/qcom/iris/Kconfig | 3 ++-
 drivers/soc/qcom/Kconfig                 | 1 +
 3 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.45.2

