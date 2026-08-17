Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012000.outbound.protection.outlook.com [52.101.66.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A4241167E
	for <imx@lists.linux.dev>; Mon, 17 Aug 2026 12:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786969938; cv=fail; b=GUHK2zHNkMqq4hJXQdnu2HD7DdI5d+AXOcMkPtyuUcAD3Btlqcb13n7oFRr+WJ8yH1GxaMieYlcHva4o6Y9Tvr4PEOZWqUI5FLx5Y9jBlE/+kF48uocrNsrxzQ8pHmsOEbAGRgT0nkjqraZOq8dQsDu4XL0TG94sDmlegt01QLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786969938; c=relaxed/simple;
	bh=8FbuaYoHMd790djaO9YIGQ8lPgk08GeST+mYVclp4ik=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NbP1B+OMIlKk6ucG2+PrNnMDL9ZFvcuLHXAE8NEfifU8OpXwskW7DcU9ptPRP7MpdpNbp+W2FuVHpr0hwrHUlxpL8zSGLogMuaw85fUY1V4RlmLkapPreQ7VuLmd1cXMGFuKkddqKM/Y+wUMjc1yApc7SzZBS98K2/+AGBgtrj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YcpBD/zk; arc=fail smtp.client-ip=52.101.66.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YcpBD/zk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+hURFzYh2RFhWpqcig+6PCP0vklinBOwxGOp+TGsnNGDY9M5ptDCP9vQs/Y7ZSE1gdFId4UV6uYkc+OOlNXD+F9sS5Tow2gIab5iJGIVi45DQd5/G8u1Nqh9LfExtpBqyR8movCI+qrXVvLry6AjuYyh68/hVI6dlq/2jg+BKZB+Otm4jlDHYpKH26PGkbG7B+5mVufaoa9pyJb/apu6MEayMtIZ3s2rgCvG9M8CtUSw53GrXqJHhflQtqGtb/2EOCbf0HuRWat0yW8gRuV2RpeqdtYT1nMBPut0UKr6rx2iBZtL6R1y8tRKtDzd4p4aVHTT1a5tbgROC2Ah04oZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcPXLPJehpo6FgfbF6GZBz5F4vah8R3B/HuOqHYzlwA=;
 b=NHdRb+FysoCdqPJDOtCz7LvOSFKXL0TjG64VjV1HpT46LPRhggTKPNJb/u0qBbV7gTIC+uCVNbCOZOIepc+AM+iyNEUuq/1cC94XvFTWmF71Qi8Aj0x6Sl6k8jhv2sX7olgMrHQybjMgO6ozbreTZ/EkrolPyQWOm0+mOOprgjHALPTgT0HHW3oZo146MyHwMbFfqD6mFMHDDN5PK+8toK3c59X4e8Cb7rhxKlG06mLP4vifG3V069d63NsKbT/CwFoF3MZWhH/fH6lshPcA74+3TKQrtDKxPT2lZc8KCqXhxo5P6Sb4UTMOEC8qK2XldR07dpQU3mEVgOq8GxA5+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcPXLPJehpo6FgfbF6GZBz5F4vah8R3B/HuOqHYzlwA=;
 b=YcpBD/zkc3gzinG9GskTbncMEtHjX2VgcbaSY/q/DUwTrfJZRe2PkykyrUKetbI5wVRZf+qWNru987WnZLBCTxY9pbUcbV9qXCWkiFsFVXDRsXFJZgvnTaotPoklSZx/WirrrQPkEuBjqCb/QZIi9Ieq8tM/BUEiJcLzcC57yBAAIyvaLd5W2IMXw5NVMksWD9fOqWTqIH6ai0cstgg0VFML4kjw0TEqfYugUJs+5G31ZXmYxRJbXpA9T4o0vl9o/tIbZN2Yn2vTEs+cU3gL/sQcYd+Pe/ZroUVf1/HBMkjea/3nADJLd/VGWndBto8CZYkGPBgMVt/eEglnZeRcWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MRWPR04MB12331.eurprd04.prod.outlook.com (2603:10a6:501:83::21)
 by AM9PR04MB8650.eurprd04.prod.outlook.com (2603:10a6:20b:43d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 12:32:13 +0000
Received: from MRWPR04MB12331.eurprd04.prod.outlook.com
 ([fe80::66eb:ed06:314b:992e]) by MRWPR04MB12331.eurprd04.prod.outlook.com
 ([fe80::66eb:ed06:314b:992e%5]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 12:32:13 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	nathan@kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v6 0/4] soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
Date: Mon, 17 Aug 2026 15:35:37 +0300
Message-ID: <20260817123542.48475-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::17) To MRWPR04MB12331.eurprd04.prod.outlook.com
 (2603:10a6:501:83::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12331:EE_|AM9PR04MB8650:EE_
X-MS-Office365-Filtering-Correlation-Id: b14a6ef5-c3a1-4662-fd9f-08defc5b9071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|6133799003|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	pP08rw+YjnqvJ3m91z86EodVyqgYdrd+XLJU4pxfEglFXAqefNPaTOXEsGtfSZuScs0U4hkp7sxSq6tmK0cRxeq/TFLdS2q6SG3d4Z8/jU5ubDTxDZpE8BY+7bp2qL6YIwGPhW089GLTnTZ0VYcQPilep5fTURN7rZIsXA7Y1/mzhQyGkLiBUB2kFRvZGH7KXhKDCR6ub5HQJnjYQpGi7ysMhU2DiHIbdLlJtfV7hQS6bwbjrHRwwgwLXw3c7TMQPL7q2UA1/TJPaPXBtms3X6v2zvpCICMnXN4QbbXhDdUjrdGsY5zldSZTs+CQoKID8tMEDRM08mUhj363KzNBI7IfJ7gisw8yKv1wOe8sFxts2+9pLBig9hBHbQoeCreWCkXTbFvhWdKpIcC/VtSQpmxYJfoyFZxWaG4TgHQKqUwqZLqBCn4xqly9HkkqkKedbj7Wupy60mF1HXFy+JbbIEbBpspxtes3TFVNgH618lbMrj+3qk6X4OafXBc5A1qyz0q/QB2li3Zqol5znpdwICgGlDTGrLVf58Q8in+SPJyFWEp35BKKBpmv4SnaRlJ1DvD/kAWyRmCiG+Fth9WqXvBwXHLYtje4W+VSOpMCNvU7ieLrjKefaqd/FXV5bgos
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12331.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEU1Umo5SWo5U0ZoOWNmYmFPU0RQUVRtZnFKeHRma0poVGw4ZHpVZmMwSFJG?=
 =?utf-8?B?MjAwMDljK3l2S0ZMNENRQzFhSFJ0SHp5U3JJbVc4ait0ZU1DZ0JOOXBTYWM1?=
 =?utf-8?B?RlB0ckR3QVZIQ2xjdzNqRWdueitSZDFCN0RBcTJrOEpzYTlJOHdDM0UvaTFL?=
 =?utf-8?B?SWxGNTdDS2VvTncrWXdWdVJpblpDNUJPekFKN1o4RnlqdEZSaVVyeDNaU3pr?=
 =?utf-8?B?SW1wektwVmsvYTQ5LzBCazZCTDREc1IrUW9WNnUrWktibEJ3OC9zUTRUV21L?=
 =?utf-8?B?TWg5amhNdEVFTk9QVGF0eTZKbENzaEQ2bDBXRjhLNmFBL2ZmRjU2dk1OTE9i?=
 =?utf-8?B?Um5pSWt3emV2djAzOUc2cEErcS9XT1V6Y1lBNVljVDA5dHdmQjl2UVBSMFh4?=
 =?utf-8?B?UENCQnJIRlhqM3VHbHNGTmhqMmdWWG12Lyt0eGg4RmhZMTZQZVlBQzU2bnRu?=
 =?utf-8?B?M0s3QmFSK2pnaFFtcmtJaEV6dVl1bngrZytFVzVDZC8xS3c5NjBhV2NOdm1I?=
 =?utf-8?B?SUN1cWhZT3h5T3dIUEdqOTRraXg1OXkweGJzbWJ4MWJKWGxtQktjRG5SV2tn?=
 =?utf-8?B?OUFHNUFMeTNCUkFSWHB5UFEvMUtaZ3Z5dG1sdTNPUnZUdk9uNG9ReFZJd1BC?=
 =?utf-8?B?SCtGQ0NhdFg0cnJyc1dpVGlXUTVxK0ZsMmJLZmFEa2Y0TVRtN2ZWZXBUaHVy?=
 =?utf-8?B?bFJCMml0VVFDM2NsSGc3dExVcWhVWThBNlRwTTBVUy9ySVJqMFVTaFkzN2Qw?=
 =?utf-8?B?Q0xhcW5saG9HWEVHRjFkZzBZZUhHTXlVcklCcm5sWGd3UFcrRFkrNElyVnNF?=
 =?utf-8?B?eEYwdWliWWRyMXpQNWVvUUhPaHdNaTNNWjl2MnlqSzdldHZaZllIS0duYlZU?=
 =?utf-8?B?NXMrcS93M2t5T21aekxVbEU5cmNob1dzNkwyNW82MUxGd0EzcWZFRzBjalIr?=
 =?utf-8?B?d2pFOHpyRlZMV3hiMFRMSVB4QXBpb2kwMWFnLzhTS0FHZHVocTNLeVNmTHB0?=
 =?utf-8?B?b0ZiV1RiWmpUbjI5b1Z2SjJld2pIT3RFQWNUV3lhMk9TWitYblR3cmg4bHBJ?=
 =?utf-8?B?cEVjVE1FYUdBZldwTUx4RjZpb0RrUmZHZHJNVVJlU0dyOEJWdzNFS2RMeDhw?=
 =?utf-8?B?dkNXdkNMcm5yNmtnVGY2YmRTODM2NHVOanhWdHFEWlhuNlB0TUo5YkhCbU5L?=
 =?utf-8?B?aVJ2ZlNRdFFWanB0ZXlVMi9kc2dKRE9kTGtkRlN2cFgwaFVpS2w3bVpXM3Js?=
 =?utf-8?B?SWxIYk54R0tIM1lwTTc4T2UxNXQrcVZZNDRXYXJhR1Q5TlpMOUVyK0pINkdK?=
 =?utf-8?B?MHdKaVBlWmpGQjM3MnltRThoZTJZYnJoM1JmN2NwaDVIc01vc28waDc5aG4v?=
 =?utf-8?B?UktKNWZPUlo1YkY5dUJ0eXd2QzdIWkthaUFMMldqNm5uc1NXaXA0SmN3Nkw5?=
 =?utf-8?B?dG5KTEcwaFpoRkJ1UHZWcmc0LzJ6L0xpNjNFYUluQnpKYnFVZHRlTzNLZld1?=
 =?utf-8?B?WnNNRVpSYkZqY1dXWlltTzJUNDVBYnZVZTV4TXBOMkNOeTc4VHJLbCtDL3Vt?=
 =?utf-8?B?OHhaNC8vbW1jQmRwZHo0dERYMm55SFBIYzl6UG1zSzg0czJZT0tJc0d5U3ky?=
 =?utf-8?B?TWhmZTFLOEg5TDVHL1lGWCt4QW9oc1FpcEkwUlVUeWlTcmU4em9CeGJqWDlm?=
 =?utf-8?B?TUtoSVdwUEh2c2dJZHNJWG9mTVY5UDJFMkdUOUk5NlMyQ3dncjZITzUyTGVw?=
 =?utf-8?B?cXhwcm81TGhoODNEb0dCSmg0QkR2QUNvRkFMeGhqVkE2NUtydWJiUk5aVGdT?=
 =?utf-8?B?RWdtaXB6UXBjOXRFZWt3WW8xZjBCZEN5eSt5QldBb3gzVTE2cFo3MkVmbVls?=
 =?utf-8?B?aVl5a0RQb0pXQ2k3ZHJSdkl1WEh0b1VIcCtmVWlqQ0RWQTdUZnAyZG9qNjVT?=
 =?utf-8?B?N3lsZnBPU1B3Z0xoRkxsQUdHRG1pUElDQTliNy8xMkM5Y0szN2h1VlRBVjdT?=
 =?utf-8?B?V3FQbGFzTCsxRDc1Z2NGdElqQXdXTEQ2Uk5TYWpVcEZ2WlZsUGFCYnJwemVB?=
 =?utf-8?B?SGJMbXdyYVhWSG5EelFlRmlWUHZhTXRvZis4eVkxQmVpTWtkbDBSSGQ1cTA5?=
 =?utf-8?B?ZWJxOUdUWm1UVi9UMG5xMXhROUZJWDBoME5CNzdHUjYxeUVNakFCaXBVaURx?=
 =?utf-8?B?L0JGVmdMSjFoUzZkeEZ6a2ZPTXhwUFhVS1paUW55NEt4YXNKL3pNUWsvNXFF?=
 =?utf-8?B?MEthbDQwZVg4R0xuaXUrYkM0dzdCVzBqbEptdXBhT1h1Z3BGZ2Z4MTk4WU96?=
 =?utf-8?B?YmR5cFllTW5WcEc4SGFlWis1VUpyb2piemxvN0E2dkVDMlg5U3EwZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b14a6ef5-c3a1-4662-fd9f-08defc5b9071
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12331.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 12:32:13.0362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3QlFsV2WAMJKEQHnXs1nG8ZSR3gV41ugceW+VVkd2fm7pJrHn0ElR/C25VT2o6Pcfsluw2m2yTG+jqtUUELkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8650

DRM_MSM and VIDEO_QCOM_IRIS select QCOM_UBWC_CONFIG, whose
ubwc_config.c calls QCOM_SMEM APIs unconditionally. On configs without
QCOM_SMEM this fails to link, e.g. on SOC_IMX5:

  arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x2c): undefined
      reference to 'qcom_smem_is_available'

Fix it by making the QCOM_SMEM requirement explicit in Kconfig.

Changes since v5:
 * added patch 4/4 to this series, which was initially sent as a
 standalone patch (addresses review from Nathan)
 * no other change to the series.
 * picked up all R-b and Acked-by tags.

Link to v5: https://lore.kernel.org/imx/20260814141724.1006382-1-daniel.baluta@nxp.com/T/#t

Daniel Baluta (4):
  drm/msm: Guard the QCOM_UBWC_CONFIG select with QCOM_SMEM
  media: iris: Guard the QCOM_UBWC_CONFIG select with QCOM_SMEM
  soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
  soc: qcom: ubwc: Fix missing include

 drivers/gpu/drm/msm/Kconfig              | 3 ++-
 drivers/media/platform/qcom/iris/Kconfig | 3 ++-
 drivers/soc/qcom/Kconfig                 | 1 +
 include/linux/soc/qcom/ubwc.h            | 1 +
 4 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.45.2

