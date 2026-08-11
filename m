Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013003.outbound.protection.outlook.com [40.107.162.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55771347506
	for <imx@lists.linux.dev>; Tue, 11 Aug 2026 12:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786451259; cv=fail; b=jkdXCPY6poINiY5+uYM52HfbD1c5EtpDVeHYHsGYL5Z4s4cM6fnawY47orV/FyuxUdqwgs/s21OYdB953sL8mb4dpVOzu4OrUzSxbAKSRTqhHxTCGj/9kdfcKBtyafbpTsxxYf044YlO80Rhos5atEWRXiwMaZrXZw5/Wtdeb2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786451259; c=relaxed/simple;
	bh=5vuO1abLQjchRoO6JjnzCjl71feS75/tggZ2P1bphxI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qvTyrb9XXvIZDVrCd01jvrxoUAlqpW1S8p+7jMcoDTBshvW//rTnrViX5tJ2j6YzaAmz1vj0xi5SJHtb1xdTElE3rhZeWf+8x2Lr69E7sVh3LRonCraZlJEXiALU8Z/0EcL8tx672Txiry9x8scwwOPyA12qUW5HEvuQAK2jH54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fylw12/f; arc=fail smtp.client-ip=40.107.162.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fylw12/f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpKZjF2fvnl+xlPPbRZB4fkSexuO9YJ5sgXUs/krrGAwhrsiSujp4FzV/vq4Af19hLkf29Yx6njc9Zyzf48EhDnD45JIGPo/dBdYIhw9p98EG4ONO0oisKTHNjoBNIv7M/PGAgSpW3Uzb6N/3lNI+fGbWcuASd6RHZ+ywCRaOjJ6eci6iWaoAFM2K7RpTmrGskDI1FZ/E9MjI2LqP5vltorwieHr9qvQtG9WLHCPylg2snsfG1700YxHJSwfkWbrHvRuP9T+eI4r2n8a6vVjLv34THMAVOeLMfPGsAqNJJS2bkHPnA/+G/GssGLIAdv8VzvqY0Lscsvyi/OtBsla1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a61DNh3Ui/+JYMJK0W1SEsDXg3XOZn4Q7URvzJ5SzuI=;
 b=VHSgl+8kf1HHWG5boFzdNsyrgbCmZ+qc+ZQjBNy/wImM3aZ1mg4osswcYNz1gDn1Yhg7QHyrlLt3iYTPO7QKSLEfA/5Gr4FvEXTvfrD8wBcPS5PJ9cZN2uTUdhWsABmPz7aCp5VeHO8MFdgMl/X3XV6JXgE29avaxPe/ZtGEfboEiCW+XLliIebZpOT1Mz4+jdHtJtQ7jm2kO04Xl511QHSwVrkwhPJNxFnU+BpWvEbkS4+awkJiyuY72nv3Ix8GxHwOcMb9yszhvFo3JS7OvUFRKiG7ZkOH0UVMq0yyzhX8IFSi5d1O8XnlHV5q6l/QWnul0N1PHD+RaMkwcAue6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a61DNh3Ui/+JYMJK0W1SEsDXg3XOZn4Q7URvzJ5SzuI=;
 b=fylw12/f58PD2PITQoq67gWFXs+PCiILf8MCiBZcxPQzaU/MAmCj06Nya6AJCMCqg/MAu3brpwyO5bKRl+/kk2cauygCVNAnrgRuk5rHnE3DAhuGyF2GClKQ1KNlMSEFjzjIrxZBOayFUMS3tJMEwLbNzqMANkbr7Ma+e91xCOeWW8UOmuVFWdfmhsklRT1W9YDjPcwt5BPAyNye/2YkodHbog3f1a6QBMYYdwoq35ygkdaEszn6RKxR3tBzzIMBQ0fWKKofWq9emK1cpGKCf7hU1honRBHIojjQpRMfNjXvckFXZJ4Iyk3Jzn6723wxvnJgvUmg4MOlbG+07n8sXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by DB9PR04MB9915.eurprd04.prod.outlook.com (2603:10a6:10:4ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 12:27:33 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 12:27:33 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH] soc: qcom: smem: Add stubs for CONFIG_QCOM_SMEM=n
Date: Tue, 11 Aug 2026 15:31:03 +0300
Message-ID: <20260811123103.210571-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0019.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::29) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|DB9PR04MB9915:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fce3c32-128a-4de2-0631-08def7a3eb2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|1800799024|6133799003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	W1URSsMa6ul2V3R+ANHRhWtcHAH8+BO4yK72Xg6Z1VNVOCbvQPKxjlJYOFejfiWOBnjrg0Oi1Tgm+XN4zjlDV5rogpL3uudP6ahN0aGGJbUPvQk4DX215oiG5KpmvqZb+4fXetNEcZ7aDuGIYFF+FF/cDwAj6AOldhYTstDx1orm6F4NKF7EB/xzWb0E4yhZuonjPWWdk5odToPr3zuNBBssu7m0msUy4q3VWWLcP+lGjUzLXVaqiqpzTWp5BQzkC4Uv4eeFcqyBCAuignlJZ4V6oQHcCyTG+ayKpTLwgSh1NbKM1jjU0oH4e6Y5eErJ02zBb9WPrQc/1nc3jvmnv6DG0Codp3qCM2ecqP6uv0eJBSX8y7twoZ1u1aWQzg0pDMsUGSDHPLYpLJjN6j5iUHfo5Zo8biKoa7OjhbT3ILGDlU5ayQQWva22KxkuTasDJK4f1ZxpwahfhUJNEvqFt0ZrcK4S4v7Xg3jdKq5v36XkWuBVPVF/VBu44R7iFVkiDuFoV79e0UE5I920eofVaJM43ikgxRrmQAeg5PtHWvUZ+FT4XoWGt2/fqX8YSFVg4HSdMaFmMHUixgehWiE6lDSFGHJeIwv7A7HVp9xIte1Krt5RVGoHT54GI0f/quEVhV9cBBsJet4EvyuRxi5QD2nYND/Ihh+xoJ7dTIPPsMQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PBueREglChCIQO9p47fOJvyp4CTJ4408aVEUUmk0A5YVDZ/SnFGANXJa6hnZ?=
 =?us-ascii?Q?I/S0T4pebcvrwQb5aOP9LuwG1Ji+nBw84RGMY8of8/gkuxJQKTSb0YD0p4I1?=
 =?us-ascii?Q?iaKc6pXg5CegCwEgZz0YGEVQSynC+7tZdfLJYi1rNrAMjahEajazg6+ejiOH?=
 =?us-ascii?Q?iy8veh+jIrirwhwbw3zIiGDkQsRApQ5Ey+YPyqXCE/7OfONtfWu6kJWtpjo0?=
 =?us-ascii?Q?LDb3b0Sh2sehD8Qd6IN+I+u1EXUm0Jvs6cwGOXuJgAXgB4l7mpXXx8jv7oc7?=
 =?us-ascii?Q?UsOy5um4ayKZesZX8d9qMWBTsciHjJsCIfxRhARGvi1z+XjG3xWT2z0JW+ut?=
 =?us-ascii?Q?9sQMvqQ42BHw7f5yvXwLKkH3dG+VwA8Ym1eWrPhstXB1ozxyDBvRimxjrCX5?=
 =?us-ascii?Q?F1uz2ke+f9Vwb10ZI2KO+hU1JuHSmTHPESFuaDhirToQuscY4SGgl7v4psQH?=
 =?us-ascii?Q?Smtzta08qShPVn1tCV7NuhNBLFb3KpuAD5p0k4lxqS7qJR9zqEjCXQ95BGnj?=
 =?us-ascii?Q?MDubdrXI11R9CHc9iH6xKp2wkcYEUSXJh8ZBNDOYt7IB10bxHXVCT5ntN84r?=
 =?us-ascii?Q?fS9d1ZnfiFbDKDR+87bbGZYDnTI1QiNvggHgpKRK5CkdVfwy359XraeK3BdN?=
 =?us-ascii?Q?wcbJRaJyp7CReTwPeIIV3NhqUMpX0zEdTCYSJ+5ZsmUX+G8k+t4KJR7pDbSH?=
 =?us-ascii?Q?oCG5lYYEwoVZn4TNjPT3PWpqZ/0ohesznr8Ho0dkakKHE+Qm3EQPdIaSYAr+?=
 =?us-ascii?Q?eMyLeD+rS2RrrT7n2julrxYL1GmqsVmcNlkwkxMMwVgwRtXi8UESjO4nMGTG?=
 =?us-ascii?Q?g6L/bzhhtxyMjdlds1UqTHZ5xYXAjd8FUOEtcd+FJXjfeeLv+GYZG5D5p0yC?=
 =?us-ascii?Q?gzwbWUKQEkLyfOWBINkAA1EmugOIXMM9SfBvXKs6ex4a5uHni/gY2NYpxRnF?=
 =?us-ascii?Q?+RSi1DlBIRAwlK1DBiZWxmAgPOM3JZ4+y962/pwt5a6zRvhVelA4/P8/aJSj?=
 =?us-ascii?Q?fWSRkbWhLR8qqFqJdxU+PbHcXOXJVoWHeRPasD7UNyPociYPhajfKH/evpgy?=
 =?us-ascii?Q?DWz33jokTuZvP3Owx3REagetZG5hD/Yx8wsxAhwNNEBQ5Mx34c3Lm92WVQk4?=
 =?us-ascii?Q?jvjP243+dvDp7AUFBpYEvGBs9qX1UkiS1gM4eomFJlYwr/hiy2+tEQsBnKiL?=
 =?us-ascii?Q?TqWfXqM3ECgJResEK2N5vlfAoFWjHGzASIqO7A9JNvN6HEYWtZebtuwat5lO?=
 =?us-ascii?Q?gT+frb03cCZ1JIsgeBpcZ0zgb31mhox79hAMLe1MBEmJATOhJocrO9o5aH/c?=
 =?us-ascii?Q?rBjRJBcey88WtYoUnve60mTSdqpc4Huy0PRREW/8GlfA727gosnHHPF0WmQg?=
 =?us-ascii?Q?U2LHfszh1MfLLorWXxRfxxqD/D87optiUZOTTMXzkozFKuEtcrIfQOkRVt5H?=
 =?us-ascii?Q?Vlm3hFcswslXR2Adn+V+jgwcBaugCGQhnvREZsxXedWw/CcORrmc43TU/8iN?=
 =?us-ascii?Q?tZgtYG2XVA8OzTMoZQrLlwVdTS58apSWkmu6lXyCbsnoqORGkETX4V0/AmGY?=
 =?us-ascii?Q?XzrIZPzt95QaHBm6stepi1rFewMGhhUf2eMirPjZijRjkuj0kxcUMY1nEhnC?=
 =?us-ascii?Q?Rc60Ti7E1pScYE75nKlLPQL1NAzk8Oj9nrEONszpqtyCC0jzpsIXg7a0Ou4M?=
 =?us-ascii?Q?M+q6H9HjmscTwvOzn/Vth9ErpLQkSZcPyvPifvvvopEcycdZa/dnKdYMztsN?=
 =?us-ascii?Q?bKmZVdI/gg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fce3c32-128a-4de2-0631-08def7a3eb2b
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 12:27:33.1671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wpqqytyf/v5RAQ/MT+ENJoliPpCxxFlDHJQmfpv0lTp9qzxfPSdbWbj9qgUQuJOCte83QScMpWZtkd6HIGztJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9915

drivers/soc/qcom/ubwc_config.c calls qcom_smem_is_available() and
qcom_smem_dram_get_hbb() unconditionally. These symbols are provided
by the QCOM_SMEM module, but QCOM_UBWC_CONFIG can be selected by
DRM_MSM even on non-Qcom platforms (e.g. with SOC_IMX5) thus resulting
in the following link error:

  arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x2c): undefined
      reference to 'qcom_smem_is_available'
  arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x4c): undefined
      reference to 'qcom_smem_dram_get_hbb'

Add static inline stub definitions for the !CONFIG_QCOM_SMEM case for
all `qcom_smem_` functions in order to fix the issue above.

Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 include/linux/soc/qcom/smem.h | 51 +++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
index 3249cbd2016b5..d35ab5d248054 100644
--- a/include/linux/soc/qcom/smem.h
+++ b/include/linux/soc/qcom/smem.h
@@ -4,6 +4,8 @@
 
 #define QCOM_SMEM_HOST_ANY -1
 
+#if IS_ENABLED(CONFIG_QCOM_SMEM)
+
 bool qcom_smem_is_available(void);
 int qcom_smem_alloc(unsigned host, unsigned item, size_t size);
 void *qcom_smem_get(unsigned host, unsigned item, size_t *size);
@@ -19,4 +21,53 @@ int qcom_smem_bust_hwspin_lock_by_host(unsigned int host);
 
 int qcom_smem_dram_get_hbb(void);
 
+#else
+
+static inline bool qcom_smem_is_available(void)
+{
+	return false;
+}
+
+static inline int qcom_smem_alloc(unsigned int host, unsigned int item, size_t size)
+{
+	return -ENODEV;
+}
+
+static inline void *qcom_smem_get(unsigned int host, unsigned int item, size_t *size)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+static inline int qcom_smem_get_free_space(unsigned int host)
+{
+	return -ENODEV;
+}
+
+static inline phys_addr_t qcom_smem_virt_to_phys(void *p)
+{
+	return 0;
+}
+
+static inline int qcom_smem_get_soc_id(u32 *id)
+{
+	return -ENODEV;
+}
+
+static inline int qcom_smem_get_feature_code(u32 *code)
+{
+	return -ENODEV;
+}
+
+static inline int qcom_smem_bust_hwspin_lock_by_host(unsigned int host)
+{
+	return -ENODEV;
+}
+
+static inline int qcom_smem_dram_get_hbb(void)
+{
+	return -ENODATA;
+}
+
+#endif /* CONFIG_QCOM_SMEM */
+
 #endif
-- 
2.45.2

