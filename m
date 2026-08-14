Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB3F3CB2C7
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 14:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786716885; cv=fail; b=Y2fkwjxvclvRDO00lzz/5OzXnYpHQnuc88YfMcBLaztTZjYp2ePxV6W9T0PFVTLUGd/qkDcwU32XkWBj78It5BJqoLzJ5dk0O8h+OL06vPPmX9Zj/tSlFqC0yNITwYQm0VRH56j9OL8GPEtA4LWiiZ9JU52IffFW7FcE/ITHG5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786716885; c=relaxed/simple;
	bh=LCddfM7tZFXD5gbsz16Z0GiCP0eMvxkumpLb29VD6GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zrx+uw9RaPIbD7L7TEVzlAcicZVSTDhl5NV0t8N8no6K3BAzZvzxEgqvMyBXB5tIdGOTentYdTSBR6bpARN3lAe7D4fgUJimYPRWDGeDMpLOObunDHPBiIdCGWXO3AR0xpLlWQBVDv3S/3LEAVzGY37A+SvpmREINkIu2divgEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WT/69y+c; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WT/69y+c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvNWtt9ReQhh/a8olShOihZOFR9zp7ki0v51yDmHlo1ZQnQ1CMoG1FaWHNEwEzfidCLLOgHD1veJV9yk9H4QYA7HXKg80L2Lm+KOXcQEQwegfSreSyU4J8bowvYwcundHwd8o4maM6aU3+qWWkUUeDf5DQbO4gbs0yYgoQSiGKALaYNDCcckY3+eOFbxuRx7NIswbBxuMITYqAVL4LC9fYTbsFIvEHRrCRXWyUcS9lIKUoA8ydiDI7u7gExNx/lD7lxZBXFdbKzXc1/8JhQu0y7hgDzdpOq0zguWEo2wC6X6Wlr0mTDSBlChj4v1b7JfTqCMB4D9hpE2TAF9W5kbsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=185++LpCTw2j76Prjqaepn414jM7+WKnFxuZJiWhpKw=;
 b=DVQ4+HUOaq+9m4500hWTEsNx8Dsvo6WGHDHQcAfbvew80iTGnrKy3xUqf7eCtu4qHprJ9UK0VYb9YMxvJ6V+0JfZF31hFt0BEqvXct54AKCIhyVYNb7hu/jCZkbkK8cZi6996kTkYwP9OD6cZuofVRpJzT+oZMSzy3RsgyJiIQVaoSrf35k22FVs9urM4dP+3mbx4zDtA3n7n1dBkNqjByhP+t9mxJb1NJJjlNR+TKzPVRu/0BIrCERcbJFGHeVeSq2HsRUkT1jq6Dt5SX2F0+xC6GYEd2Srm1C9vsQNMhIkzCQ0PPyBCH4ecRrXxurNZK5gljFxlrv6j9sBdaIQcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=185++LpCTw2j76Prjqaepn414jM7+WKnFxuZJiWhpKw=;
 b=WT/69y+curYGJC3sxvnxbOUK5481sXG67X3AoXA6dc0wkvvX8CNw90fX/2FRvfm6fCPxZrHvfn5fv4mjcJ4bAtbieoBGySeCH51LRxnPxzJQ0tDVlrBrrCIwhtEAKn8umMkJT8jXrh0DeDaWMzbOWBc/073Vz45Xk5Kx3BjJuTchDAUWJ3W8veGiyMvvyhV5Gj5Mn0YXq/y8BgnaR/a5wv4iW1hBhXXHXzb8YGDqIbQ7rkUDBF3EgCSh4gP1l8ZPeKXNjmmt8AfW58/dtTsxWomUv4C5atQlWn/C4ATYwVCi7WbPMo1JM6T1F3R0E/Yo8zQSz9Gli7YNXyAHS4e4Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by PA1PR04MB11531.eurprd04.prod.outlook.com (2603:10a6:102:4df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 14:14:08 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0292.024; Fri, 14 Aug 2026
 14:14:07 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	imx@lists.linux.dev,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v5 1/3] drm/msm: Guard the QCOM_UBWC_CONFIG select with QCOM_SMEM
Date: Fri, 14 Aug 2026 17:17:22 +0300
Message-ID: <20260814141724.1006382-2-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260814141724.1006382-1-daniel.baluta@nxp.com>
References: <20260814141724.1006382-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0028.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::13) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|PA1PR04MB11531:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b9ce0f-3d83-46a9-935b-08defa0e4dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|23010399003|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jtPXp4bohLDaywSuyRP2jj24/jczkqq+F4YWXN48KRP+chc1XMpzWHiDgHhOOH3TkHYdu2QEQraONkEbi0nCJaFRnP6TxnxeEzof6WcjPFkpT3dkzZUMKsX7DOj/pHinCGF68Hu9+Blbqev/pX+xXrzDv9LzPaTL5odX8IU46xTchVwRnO020C3vFUoqAJZ4hfYc7GjE+MkwZnzK5EpHBPf8Q8ScsatW6y22ouaBO6DlGkZYF3xRPb7evRCN+OGqd70LW76ykaXc9edrNg5+Ch6Px4Sn8KWCSm925uUSXioPsEat2XRhIh166j5EsAq1C6how1hdypS9beXYzRWjxfQj0E1wjQVmcrw3Weh5OBCAJAtJWDEi88bgAER8yu8I0ZoNgcFPS8xM/hfRmWGy6YDUf8zJR9k3jYwwG7v5Ck72Bk5HPWvTtIsD/quV1bT8N6trR+O34wvwryjubjNoRr2vucMhbHOtC+cN6JheI/EudKW9LrKNPNRoOjdb1/A6obFQ679gIL5bUY5tFZoxeyqh8GhVPdnoXsT4KUuAsEZ8m6jo51K9F7RRqouyRG8RUrAetzkt8DgeZhEQlc2lQn+jrwMeBQSGxnoheAlNWdRcIe+vjmokOvkCFCUFFmexsNLNuv0uNat3zTuDRy4eTZJ+68yv6oqlBuLjYwXO/wE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(23010399003)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qdiROl/UVG9NxRmEkNqskQeIVfmft3g/d/VBdMxy+3iwuM+OZKsLL2fXwvqp?=
 =?us-ascii?Q?Bj/7RsrkMJd4gUu1SgF3FMZkgUcp37iWACanUcY9poCc5p6r+bCUZT3Xo2Zj?=
 =?us-ascii?Q?AU07ZJxZxkvgIFVm3HP01rChxPQQmTqLMjCbsNqlGUvAny6Ldo1ZX1zFeRLo?=
 =?us-ascii?Q?mR5J3oNeDTBQ1+9gKT29r7tSIpk+JTljhwn/23FkRqaCKP4wIMZANgoSKwFK?=
 =?us-ascii?Q?6IXmpkQwEXmUJZHwIiNFk7yK87lCCOLGR3xCzyLGz21qvpFwKqWNIvCPo4OV?=
 =?us-ascii?Q?ALHIB4g7Tpl8ey5y+IJspXjffG5CL30UN2li/NKlJoZJ4tLSucP1JBVX8Cm9?=
 =?us-ascii?Q?kU8VOrsAQrLZXCn2nSjVTMhZv78+3xRLg8zE5uQOdjh8iaKx6u0R55vTRIBo?=
 =?us-ascii?Q?FIrjmaYzFimbGQvQbZikX8+x87H3reOI4grdDh/ZAbJUDbH8aStYgfCcVIyc?=
 =?us-ascii?Q?C8UKD5b839doMITV/CzOFHXyPFi+Pvd8ZFb3OStYbuCk1zW3EF+zxPcbEP8N?=
 =?us-ascii?Q?Iyoa26tescdD2Sb7UiqyazwXQn27p8XYlk/zy+dayKAXSxbcnecdjT//TDsK?=
 =?us-ascii?Q?x30V9/WMpkl+ATRYE0a/6+WmxiIkXYY0b6gyQhc7Sl8/tMur86sDOtQhcfxJ?=
 =?us-ascii?Q?AiUed2+/TXXRoMe3iQfycjWsLRBQC+cX45G2j/oGr9wuuljP+jcmdEui3unq?=
 =?us-ascii?Q?8z30/mRrXLFcWmCG0rBcyybYU/7scd3d8EzUlUdc2gVg/Kh5fLT34PBLb9Ju?=
 =?us-ascii?Q?IlYW3h1OKXYwtVDL9yaxjFgtfst0TAYXlVqvFdbbbcFjrdKiW6sTBo0zv9Uf?=
 =?us-ascii?Q?a7si9M0roArS/fBK6jcxBxlhw9f6uIWuC1W4dCYG7MgGIops1Kze4z9VAvm2?=
 =?us-ascii?Q?RhcZEUrByyPQ3KeNlVHJOn2uggXlhSOoaG15ZFhjJvv5aQU38iHaa4y5JFro?=
 =?us-ascii?Q?P0Vo7ocgfln9xkrJxymJ8Dhv6uhqYguh9u6ImkyFBLhoSpa8bjAkKgNV4rLB?=
 =?us-ascii?Q?LeIy5OKTXir9cx+aFmrQTCv7eIbg2IuUwLkfis2MpcboOQmvCQv8zZw59F/P?=
 =?us-ascii?Q?Lrk6CB+lqpDd87StjJvKgjggTc5MKACA3M1fqyCvr/epdtSZeIR+MqkcQcDX?=
 =?us-ascii?Q?+/QpdTTjWnNaqdfDVhCoyL4hNg84AewDwW46JjeqsF1qZXTKgz9MJGWXIRm6?=
 =?us-ascii?Q?b9EePwToXfci8CQ4l6rQAp6qag6AWdHm5s9J5gedlwsNl3UbMqYxQGC2r710?=
 =?us-ascii?Q?koEK6F4WH7XkrPrt3NPqzEaZfZKvNRobpOtE5BIM++mKqvc5gCGJCXsrKDcF?=
 =?us-ascii?Q?Ihq4D5MIKUnZIq45bP3HHfuyCVb1BadB8EJT+/nVsDWzwfOJ94fNy+5g+2uw?=
 =?us-ascii?Q?Jmiq54CKp7ZRLopyUFvKkkV0qpuP92nWBywSH5nhRgdOY/JiVHGytotWQI6g?=
 =?us-ascii?Q?s16EfokjIOcbFUh/7s97BMbb367rdCfkqT9sK3rKBono2S9+ZmvFcW27owXN?=
 =?us-ascii?Q?JIYAbYHxPsEtih47iq4eVekay/b7ATGN1d3YsYPu6tDUdGx2Ff65aDVXFYez?=
 =?us-ascii?Q?IPbB5bNsBhI5UyxtHlHzNnZapSwb0opXMm4uk5aCsQgHtGPjHhrMo64hVzGH?=
 =?us-ascii?Q?2/KKGJ5foXhmLYhTF7i+blqwuwaJOxGDpiHa1qhtRE6pRWu2+Y9Vf1KgtrN7?=
 =?us-ascii?Q?QfgZ9Le3PHRkclRBv/U7qgpCraY09mkymrKULLH/SBejuLCVXCXVRSSrPafW?=
 =?us-ascii?Q?s8aXp1FyzQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b9ce0f-3d83-46a9-935b-08defa0e4dec
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 14:14:07.8112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2YgvlRGbA2w0esTjH4HafmmhW4jHLNfC6Em7JmtjErTkmYlEaXUR0G86POCMNOzTSMt+DkuqUiwIlwSRZYoj3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11531

QCOM_UBWC_CONFIG is about to depend on QCOM_SMEM. Guard the DRM_MSM
select with 'if ARCH_QCOM && QCOM_SMEM', and add
'depends on QCOM_SMEM || QCOM_SMEM=n' so a built-in driver is never
selected against a missing or modular SMEM.

Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/gpu/drm/msm/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 09469d56513b0..ed1c4775d1e92 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -11,6 +11,7 @@ config DRM_MSM
 	depends on QCOM_OCMEM || QCOM_OCMEM=n
 	depends on QCOM_LLCC || QCOM_LLCC=n
 	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
+	depends on QCOM_SMEM || QCOM_SMEM=n
 	depends on PM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
@@ -22,7 +23,7 @@ config DRM_MSM
 	select TMPFS
 	select QCOM_SCM
 	select QCOM_PAS
-	select QCOM_UBWC_CONFIG
+	select QCOM_UBWC_CONFIG if ARCH_QCOM && QCOM_SMEM
 	select WANT_DEV_COREDUMP
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	select SYNC_FILE
-- 
2.45.2

