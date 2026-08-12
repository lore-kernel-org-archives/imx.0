Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011028.outbound.protection.outlook.com [52.101.65.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD7444C645
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 15:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786547784; cv=fail; b=sapCfKnwTQ7P+2oBJ5YMBsE5bsSbLgSw7uB/nI+MFbui1DScdOHUindRHCpuGHQxylf51hx9nDvL8YEh8u9KmYJFKz3Xcjr+ipNbYGh0ffRHgYW7IUgWkuhByjuWYhEffbSUQYK8a+B+TUTKTpHeUTMsZJmHMxW+i+be+LRD10s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786547784; c=relaxed/simple;
	bh=kowwfkskelzhJVjg1/8VOo6v/MoLrSXH0TtiX/2iF1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F0iZ0DULGKhe1MCaRIxPJ0zacyaVprouQIFoAlhRNqHZwnYu2nEx2C60PA9kSbmtMPwOckKKBWOPEGvbZGD02IyVIOA11Qj7NVPve85uotE5PAyimlwHK6jKjEyT1EkRzWK0hZMFKWvrUtIIcYEgb9ui8eVNP3IoX0TOkTU+hmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DyPcHx3Z; arc=fail smtp.client-ip=52.101.65.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DyPcHx3Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gg7xnAt/Sk335QSSlNqrGi2Gas2XaM3Eq8s5Nzof3BWG8sN0fEkTmI1LmUWPgWCEyl17LJCYIFdt73yHWSOz0q7w7pBSoVZUY2QK7LtHCC5U0m2/ZTCWCzhJTSZtbgX9PGdfDdiM8IEnOLQBOri+e2xg/yF6WfIow1/eRJ9M9ytVBrzNn7q4798yl9VnSrBvXpe7e8/zj0JHJAgi9EhVWVPXBwPeH8YtJ64dMlnpeAF+IoizDF/TSCo4CWLvbo75EQUE/8MiNlxcjgFlKtO0M9Tu4k2ROT5wBzvqAkyjjuGowxuDWjj7kW1SdHo77Ou0p75BbpCuXzZAaTWQiofz4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34WmK8VCFlOtlSFZ/NkMOBSCSM2rw76eqRl1CbPmWS4=;
 b=NYzHdQmtdMzIFND0pEiSQEHwvFqpUJYZ00cNatkR5NZmCOZeG9QRVwHTNE1g4oq0Q4g4+a7VtIK7ABHT1nLN7ZJp9KBZ6mM7rJ+SeSWhM0pBAUKmVHc5zGOur3dQF7NCiqGhON9EBSy/oHWKjlU9v8kkFnnAR+Yl3HUv0rc6mUN+79U0GNaTbMNzQfBw+//xuZSioIlFJxJUwvE+gnYT0XmzZxVahGeD67gBoP3wG7NSOW1CE8jLNYm6b6GdqKdMceZT5YDdMB6Z1bPDnfw2vKbrqhslKijhGSISya1uELqNBJ6Jk8/ElSTy8x1kLTGrgAcg1rsVCxXTgvtwv5NERg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34WmK8VCFlOtlSFZ/NkMOBSCSM2rw76eqRl1CbPmWS4=;
 b=DyPcHx3ZVXo6BDcqM4eeDRYD9KGCjXFjGTCOIwzwhawlCWFYfwU/tfEs96bVx5kTrx3DkIJuP0wlHQVkIEbzUIYcMGteXj/zTarrayaLeOmY1hDJtl7pA+11SAq0OqFdC1PjmNImRWdrcedOM62lGzlvFPxsfnhUobFo5+u+Ew6SETuwOh5RAkGa+TbD/Xcxz93XuD11dMxG8zMcElKuIZMci93G5eEC+rGBc/HkG+rfiLavm3TjGTWufnL9m7k+9bOtZVo4uqekGFaF0CueiNYgMAWzYjOGZr+WA1Ys6vP0DV2jAo8zCzHZSXgcAt1ykJbhy0MJ/K0L7vyWJp38+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by GV2PR04MB12019.eurprd04.prod.outlook.com (2603:10a6:150:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 15:16:19 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:16:19 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robin.clark@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	imx@lists.linux.dev,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v4 3/3] soc: qcom: ubwc: Use IS_REACHABLE() instead of IS_ENABLED()
Date: Wed, 12 Aug 2026 18:19:34 +0300
Message-ID: <20260812151934.709198-4-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260812151934.709198-1-daniel.baluta@nxp.com>
References: <20260812151934.709198-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM8P190CA0013.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::18) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|GV2PR04MB12019:EE_
X-MS-Office365-Filtering-Correlation-Id: 56f88a24-ba68-44ec-d850-08def884a919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|19092799006|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	ZOY9pNzJiAOrVC2arLlHa7uPqEC0VTbDK/aI9NJ4DgIsYxzU80o/M8AgFLxyHnz95cwVE2ViiS5ZB7ogocJhpC7n4CS5aAMMnXGJ0yzpSU6/q29OYrSOANmOPfCqmfsLlOpgx5X4K6rHou0c3nBOMn/n2D8mzE6Cc0pUCJGDOYkSBF2VHgVmRKDCgsuHR/bp3/KvrUBGoOh1CALvJUzh2ggsdNyHUE9d5zBtoXXqx4+cNFzBSElcDMPg06Y764k20S7G6gNNRnKzrsR1JELJsisk8Sn8aIDxAzzoMVzWKVFNu8rHex94ARnKJw5iGIZ1EanoyQYo7rZrR18RF5rkjvSCtf/hl7ZdrfoZD6hea6yhhs0bMqhf18yBZipdACwcEvVAadzZ4/GNvX5shgfrZU9zr6/gOWrn4K3jt6/fmMbCa7dsmmXvhfnT0erPz/+mDYLvav3ITt1bwViq0YQSyLxHGH5/ptk9vFIVlYw73K8J0cpuiuQWuGKzPffMS4DGKqaDn5qG3ccmDJuBjvmGAykK3xKYzs4tvANdHM328X+AG7fa8e+u9Itx1oAzypS5we729JFVZAdG5ifNFsqrpFWnZMItFaevGlZ9ZQ9NRnAWU/2IPEZfX1EA+yZjLLNiImLmb0rE9mB5iP7dCnJWif+QR4mkgOJfMiLFDEq9Y+4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(19092799006)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UBZwzZmAAaISGKKfRcHrVbO23QIgGsZWhNu8Usaqz08B8QphLMjE/GPQsEZj?=
 =?us-ascii?Q?Ihwfxe8RWCBiW/yGWNsGXvHQOdTU2g9cIb9eXOkoah9oQqxA1hEvEDQXoxnV?=
 =?us-ascii?Q?NK+C7LfLLmHU0+CdQSdAgIaHPGiN07dnbbGUtC06Zo/LxTir1jSvkos6fpEB?=
 =?us-ascii?Q?aD4l+E+V7nklr/AH3IwfAS5PlUhwpUny4MG0puz8ya96Hwo0A6QAG+ZmoQLF?=
 =?us-ascii?Q?hkW95GP43gKLif7BzboV/fEq6KYc3NqqEFYGeL+OiFNwj1VAqokgSB5Bsj4v?=
 =?us-ascii?Q?1sQuxlQ/FMYvJmRVPevh6NZcD9xpVYNQywccGUqbwlWlNFd6mIs78NQGwLfq?=
 =?us-ascii?Q?MLbe+PiAVqEPGaymXOKkBLqoyFaQq0rKx7C210ciui9ksC/OhSYGRiO0lbOp?=
 =?us-ascii?Q?ay/yaEylAqZmvr5JVhjuAVCXBWZv9Vn2gpHgriecL1WV8SKnMR42207hdQle?=
 =?us-ascii?Q?c2w3XfaqCOnFcqha4ckMm9x46tr0LpnyzV/hD+9fRBDj8/ADiErhdfmDOIXB?=
 =?us-ascii?Q?JihlQekkdcCi7e6+gNc0hROQ3OpFJmU0yuuvcT1Q9GDofQf6XsjjLpy1kfZX?=
 =?us-ascii?Q?Cb+Ee4i2tg8WIfPRnppNxcMQFZTeAU0RVhdz9rcBNLj00zXiqtLZaYBxX09v?=
 =?us-ascii?Q?O6cEXBBR8fwXyrZaicFL7VTZY+KfT32Fj2+unYp+Xp6D6hxSuGlICFf8EMuR?=
 =?us-ascii?Q?cvb+ZhV7JQ1+HT7o9EBEr/oTjDotgXcEQ7W+XJXy5a61iXmuZmOXLYP5DzC8?=
 =?us-ascii?Q?NJqCLTTlnEGooMDtm84TfvGOuKWUmVDmAoOwv4a0rm3X7KVksDG1tPlKDRVE?=
 =?us-ascii?Q?gLvurNZSwIYX/iaec1wuY95Tcm0BaYj8qLOdAM3z0hZSEKS5YYbq1rvuClS2?=
 =?us-ascii?Q?6EOA5XwtIcoNHXf+tGMNGUQiEYFcK54Ta11dzDK6lXkzc7PewrJp3kcdQeng?=
 =?us-ascii?Q?bZ3bg8WhH1e7JTpZPMYtr1p4XLrA0HB5suban0cCpf34l6v+kRaQMyDpdvYX?=
 =?us-ascii?Q?t4+XF6kIMB6EIIZnvlNZIA9sCjWSgpcO5th4IVnCD+joq8Is3a6jSOrRTDu7?=
 =?us-ascii?Q?G1rVTFRWr2Zl4317c/U7/+p20se+L3nBYygVO0o5wZEgjyyIqtaOoGE2R6sB?=
 =?us-ascii?Q?em88kc2ErWqlinI2dUzAVBdBdx61It23l8sVRijEJt+jFc7m2nhW6BjOJz0p?=
 =?us-ascii?Q?E+nxEPBpcvIfBPYYhycFmJzO+zxl/Tl1yIoadevzT3f2FF0kp0h0kiwJIxpq?=
 =?us-ascii?Q?746eVQ4BFC3+Cq0u8wPWp1r10tSsDIpbVVqH3glmgG6sQPhcVMupRinlqXpB?=
 =?us-ascii?Q?EUwvV9xYYa6PsMV3bqsatwCMqbQ3ZUiWowCo1IU5Sg1a5sgkm6KREt4QEOJ8?=
 =?us-ascii?Q?1B6I/xDDx9IWuBT0oZx+MDT7tfqWmRFQ2OszEvgeW/kjeFB1FHA2YtZxcVEi?=
 =?us-ascii?Q?Vlt0hE1GbyIa0n+H8eZA3qYqe8KTB9Kl7M/8NzIqCSJjB0KcPk/rA5gor8GL?=
 =?us-ascii?Q?1fe3FGKJzGI21dE5oDeeljHAQE0kJ5F9pyTrjUuXZ4wgBHRiZW+CJtkEB2R4?=
 =?us-ascii?Q?694+60Ac4zQ098WevZ0mgOYe9JdZYOiir3EyiUEns37eVU2yeCpQ4G2tnZjP?=
 =?us-ascii?Q?+LJ3M0CRVPqLvbxiqyZSpf0zOB1wdeBH2SvXBWjXnb1DQLjmZ7jg+LGRcXH1?=
 =?us-ascii?Q?l0pnh3f958f3qfmC3WYMjZxwlgB1UhXuJGB+zBExv0e9fLE4dMEVLVaZN9il?=
 =?us-ascii?Q?uhjELwWJWQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f88a24-ba68-44ec-d850-08def884a919
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:16:19.0586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYYvxNvvewtNr1B3nBrq59i62quNo4kN+W1Ylv1ZnpTHurGmqNRH+04kD3gyXgrmD6FYQAKjUHF72F2mr65V6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12019

When DRM_MSM=y and QCOM_SMEM=m, the conditional select evaluates to 'm'
so QCOM_UBWC_CONFIG=m.  IS_ENABLED() is true for both =y and =m, so the
real qcom_ubwc_config_get_data() declaration is exposed to built-in
callers, which cannot resolve it at vmlinux link time.

IS_REACHABLE() is false when the caller is built-in and the dependency is
only a module, causing the inline stub to be used instead.

Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 include/linux/soc/qcom/ubwc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index a7372d9c25fbc..1a61238f6d4d5 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -36,7 +36,7 @@ struct qcom_ubwc_cfg_data {
 #define UBWC_5_0 0x50000000
 #define UBWC_6_0 0x60000000
 
-#if IS_ENABLED(CONFIG_QCOM_UBWC_CONFIG)
+#if IS_REACHABLE(CONFIG_QCOM_UBWC_CONFIG)
 const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void);
 #else
 static inline const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
-- 
2.45.2

