Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013013.outbound.protection.outlook.com [40.107.162.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9436E3D7D79
	for <imx@lists.linux.dev>; Thu, 14 May 2026 09:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778749544; cv=fail; b=FCprwGSaf6lzDnsm3ouaObL3mGXAZ0wuHgxeVe+vjlY8XhQ3Yy9dTndsYKUMp27mxQrG5nmiH1pFqHfOqfxRZqa1x4ef9Ct3lN+aYccJKw7OouxhNLYLuM2aKDbm+rS52GCOZrkD6QqebwLagx3HmTkrd9+E63QmCY7erbQQ0HM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778749544; c=relaxed/simple;
	bh=xhwW3QjWuYsq9t9TGq1TSmAdmZ3N2+TC+P7eF7nUSW4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=p2JZnWZPD0BdWhBRJlTlDYz3gLPQJ5Np6vvmBFKiGkLpsF+QE+hmWRDv4Khsewd/HssfD4Mre4JCoIcAHZpDPX4qfAMneYu6pyHp+XLV0ipfhhsnpVPNC1KQnmQICKjfBGmam7K6BWyisE593qCJT7a+jZX51Fav+zdklBtQkC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Dlv1NIBq; arc=fail smtp.client-ip=40.107.162.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Dlv1NIBq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DjMEgdz3JC0PZu1HZSphmGpKoBmMKX81kS5NnZ7kksA+eEtxDIZapEuqaMAoUo9O8UgeIaEr6ADA1jMkX8Nhu5wkUlQg65TasuBMJl0ZjqES/a87OZPixLb2hB2nJz2Uf4OXfbSAESuo4WpN5vD3se7O2+T0WvwvJO9w7RbAu5RjPac2lrTadXnu67QO4D0ybiZRaRIg83gEkcS5OTes/ziRGqy3um2knYjvJpsfIvEDkCiIP2nTTy8oh0hc7angnxmGo0cI6I9WQxHXnwOcA1denUHRtzF4xY5BrTFbzZl3JxtQyI+4TugYDvMzWz44mEVH7UumrFTzMFfXDNiJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3IpFtGdicY3xJWZWcwBBvScRImT//H2CYAWsCkAg2M=;
 b=MdpDqeVlmfFyBvREDmLZ3Pv6M0FaEYtusBXWoYSCpOjPl5sIM8JC6/vMJnGHrLYGXdmvGTecaO0JtHDFFcq2TRLCAzYl/JUODbQ5KjoL3dB2NA9KaVBjZXtjzBHXiPoqfvOsH+xsHXYeFiXLggRu1jlNxJTffbwcSjifsGzuivzXncZ8hjEraLSNn6+9eo6mIdFumk8AdPfq0ykhuBIW9ynbaVb5Gd+zRtrhiRbghx+X3NnEOINqY3JoMbAC7HS/Cvn6mklxmW7Pmpbvh28LRjlBSSYmLpMlfW4d5xIB8c6oPo6CjeaPgF0BAvAIsc0WrknIn9/oC1e+eVgpP8khbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3IpFtGdicY3xJWZWcwBBvScRImT//H2CYAWsCkAg2M=;
 b=Dlv1NIBqAT3c++BSPvGBRY/6cLffakrDdZc9uExVALFvN/gGr8YIFlkUg40qaAZiNGuQufnOv6s5nNcEca/STFDuaKL/d2wQgQpJ2Ql0hdDK/hOPnxOmrq/i8aqRhD1o2zAGIsNwxmn+4PO2hUFccUQf6UC1FfhT29DiWbQxJ20+6QaV3n/PA8hMdthCEFnfi88i7ic9eM2kKiLr8aOmDCNIpeOaM7QMHhrVs6ecDCs07Si0PYcCFSyicilvpWMrG9zg30oEwcFE8FoGQHxS7ZeB102GWmuNYCouBFuSKV3DNtUVObcY9NZIJceMqHaYiFmOvQvdqU0RuptutgjlCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com (2603:10a6:150:32a::5)
 by PA4PR04MB7997.eurprd04.prod.outlook.com (2603:10a6:102:c9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 09:05:37 +0000
Received: from GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035]) by GV2PR04MB12271.eurprd04.prod.outlook.com
 ([fe80::3b38:4ed4:2164:c035%2]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 09:05:37 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: linux-kernel@vger.kernel.org
Cc: frank.li@nxp.com,
	imx@lists.linux.dev,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH -next] firmware: imx: require IMX_MBOX for IMX_SEC_ENCLAVE under COMPILE_TEST
Date: Thu, 14 May 2026 14:34:25 +0530
Message-ID: <20260514090425.2186915-1-pankaj.gupta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0181.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::13) To GV2PR04MB12271.eurprd04.prod.outlook.com
 (2603:10a6:150:32a::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12271:EE_|PA4PR04MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: 97e2a80d-55ea-4a1d-db33-08deb197f6c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|19092799006|366016|1800799024|38350700014|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	CSxomR/DUOoWkqiuD9rzu7u7icvYez5iAkSYDwoE7lGFayCN/aSye0nlxhStAJ31M6n2ruyTsD9PK4qJBx9V+l11Fxg1u1OOhS72p8EnGiukxI/nyu49g/iq83T/murytJVdMhezcRUHN/qC/hmWLtBPecA0JvYSfbdnC/zLzJn1udW0egYjEA0oWFvFpo6i8PHgTaz+xYeUBVF6z8qwEG8r2qaofABbI3lKW4TES4hFCfwRYPuKEn6kpyaNaY+gZQieuEbyUrNDxnyLvI88jYtzoaMGNAiQfF2FZR5kluEbTjKKE0ldDbEfEIue8UyuYBSgIG6ps7zZ0pNQxYh161M0J196ZeJF8juTQlra2Q0y4XcVfkAf8lCj5+FGH4ZsmSRqe8KquXDCIFlo1MPMxSdXVCUezpZWAs+uOeqcFSEiSxrjGPlYdmhBqhJgtk4ThNyKEaiReDYRtTeGdln3kLaXXOtP406PbS83ikrIPH+UDBY6nfuvB0YHh2Ls+hdfLnCDX2S/UMxOw+YoDO0sHojaMxPlQjjexkuDqTjkinMNovhMwrMwdGmrAuw5x5pudn4vBEX7faawE1dtazeCjLGyaZdMHAg54DFCbaRrrQWwbArGsy4TwgBA1PISPHWoG9mRxINl5F/hNijsaNny26m9ygZeam4l3q8y0EtjqIdQW/cyPa5hvyzLq94+QsJYiqMaggaHgsbY8us4Mg5Busr8bOKKbw3wAzHgsPXbJ/cLYLG25dpDTfTQ5y1B5hmY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12271.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/0mT4I3dXv2DFek437HqLatigoyw6XAlP5D6zNIJLmFm+AV9N0PxbSPkFOeD?=
 =?us-ascii?Q?HDs9fUvhWUGjj9M1A9AmgI+IrvuRGklHq5VUSQe+JoOrDWBAS/Utg4xMS511?=
 =?us-ascii?Q?YStbYIphN3wiSGTjcO6Cu9v1eJWzwMF/WhQMd8Jebt4YrK4ejZXVRHksHHCW?=
 =?us-ascii?Q?5y8LYkVe0kfcVtX5lzYzaAu9LZS42yu6TtFLdp6n6vl9z98a4GPdZCtTuQdH?=
 =?us-ascii?Q?+zvB4I+E60oobOWZwoKLU/gKNK0U0Zn6eMWB6v+sQQVM3vBgn7pa1iL0UvY2?=
 =?us-ascii?Q?EAxb6GwRVqsAB7FPJWuURhWDw7d167YIS/l1usrdnqfj5MV2GDQ4fRZozNT4?=
 =?us-ascii?Q?gWgWEffJKo5xqOPSNaSzxDwdbjXbh5tEYoN00XwkHrGRP8Ku3ywwxJyO5yb/?=
 =?us-ascii?Q?4xk0I3Erukpqfp0y+4iHzYhcPxafL9ePorXPYhVp4JhLQfhTiFR0X8alS/m0?=
 =?us-ascii?Q?uBaUSqwhsQvgjXGwGUAwKL4HDWgKoKsz/ZrwvDWZZt/QWDljnxha9JNzdvyj?=
 =?us-ascii?Q?TKy7FqMYoBcc9oBQmnCsDUEIZt6Tx+zqX94KtEdgvX+sH04XBSl/RS9ddpze?=
 =?us-ascii?Q?fhs9QucTB34OXb1X0mgALEDuRQKHcgkkcwDq8D/+i5GAFSJ+xaiNmW3b9Hr7?=
 =?us-ascii?Q?FFA1Zm0iTmIfE3MMyTgME8fhdnap5J38o7De4RkFlRkxamNu8z6y3Y3CvQJR?=
 =?us-ascii?Q?DbwmCEaqA+rQyt0DCOgi1wyJiWVIBLyehaVy+n3zNXlWdMJRIXa2QPrpkU2m?=
 =?us-ascii?Q?KYJHyz0VKDzbzOwv0cES5RVQoiEtzyq/foD35mYJqj/eJ3UmlN5nuf2vtI1G?=
 =?us-ascii?Q?s5hgvqHVhFFDT2hQdduL+ilsfJwz1ycQxmFGVjwcWY0qUCyuJgL+Y3hpCZ5R?=
 =?us-ascii?Q?6BdN7pgZiZMC2owB336ul6qHkfSagaArmggcPhcCvEII5LXMArKxnGCkytFG?=
 =?us-ascii?Q?sS2DInoUVo7BHMuVT/yQP3/FuiOmxs1lSDfUG8WNB3OjQo5yn/+7wdNPumSU?=
 =?us-ascii?Q?Bj8p9lPOSFgH6OagYYj/X+XjqQ8Ox3vZCkCDJtTGSjgAY0UQMQxJj+gEfRhf?=
 =?us-ascii?Q?eZqOYlCPOF3NVaGyenvjvLyoWwIehDesRIh7YhhfSyKH+xG5Nzo9wLXwaS8Z?=
 =?us-ascii?Q?xgSh1NmpCMFUlpSFPH6jOXrCx+N62xUASwenQa+DgpgHrgYm1fstD2bC8kYO?=
 =?us-ascii?Q?xj/gdcWnmXP1lnkDPxGHdxCE1VCvnCp+QI+5+YbBlx2z52NMTatnR5RT8sA0?=
 =?us-ascii?Q?Bah1vXDgWy4cngkga4drHcQfH9zrOaT6FVyJgVaZqJUzBKwW1yhFqnGj9efg?=
 =?us-ascii?Q?2x2GW3ESEOWknGz9EEoIut6HOCTl5Ifd+sghr9q1jAJWNyJ4dlaSZqiDs+1e?=
 =?us-ascii?Q?dPZF/AFAHqX3exW3ovacEOB4vcKfJMRmzh4NppkOerursU0MUi7nIwUuKMZs?=
 =?us-ascii?Q?F4vsPbPD8w6n5+0nDik/nD4brkiSU0AcsnPbktoHNUe82jESFnZ4HCLDHR29?=
 =?us-ascii?Q?ULkeKnNURjHa8n9XhmAU+p+iH59/mAjrNqYg8hM9NijGE/XbmxOSjFVVVrll?=
 =?us-ascii?Q?/7NBRVIRKwWPjNM9x6VX926RO9G5hHe58+UztKxhA/7rcgqVirf4eA0U4Gvj?=
 =?us-ascii?Q?SaazqFBl8Ds87iaMoiE/JmjHGDalXgW+p2cdfHWGZ/DDq5r5ptSTBTwwEcXn?=
 =?us-ascii?Q?ICHEG8ojzErDVbsYHuEDfJRalb0qhCDH/D04v79TvMohaQeYcliU3hmqWLPL?=
 =?us-ascii?Q?wWGkrwtyAw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e2a80d-55ea-4a1d-db33-08deb197f6c7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12271.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 09:05:37.4755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjSzWEnB9lK6C3GNh5keD349NYUwQGKY3DU4ZvJLI/C6Gk/Au/98WbepPr53s9QKwNhqNxyfwxSn84gqwerNUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7997

Require IMX_MBOX unconditionally in Kconfig.

The driver uses mailbox framework APIs such as
mbox_request_channel_byname(), mbox_send_message(), and
mbox_free_channel(). The previous dependency allowed
COMPILE_TEST to bypass IMX_MBOX, which can lead to
undefined references at link time when mailbox support
is not enabled.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605090449.Iz3ZmNRQ-lkp@intel.com/
Fixes: 106ffe5d78ad ("firmware: imx: add driver for NXP EdgeLock Enclave")
Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 drivers/firmware/imx/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
index 1f89dd140113..c027d0fa4530 100644
--- a/drivers/firmware/imx/Kconfig
+++ b/drivers/firmware/imx/Kconfig
@@ -58,7 +58,7 @@ config IMX_SCMI_MISC_DRV
 
 config IMX_SEC_ENCLAVE
 	tristate "i.MX Embedded Secure Enclave - EdgeLock Enclave Firmware driver."
-	depends on (IMX_MBOX && ARCH_MXC && ARM64) || COMPILE_TEST
+	depends on IMX_MBOX && ((ARCH_MXC && ARM64) || COMPILE_TEST)
 	select FW_LOADER
 	default m if ARCH_MXC
 
-- 
2.43.0

