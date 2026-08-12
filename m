Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011028.outbound.protection.outlook.com [52.101.65.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866E233F5BF
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 15:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786547778; cv=fail; b=Miel+MvmyHAy420WsDsM+Hfga4Efl/t2OowSkS1LqwVT45WXTa8Q9Y7ejQIWQyuKajRFha8/qIMJCitj6dHTsdXzah6pE/F+rlrTwk1b6dlQCq6Nrxi7LH7FX4FPf4vROR9wmqgmdLfYbZ8xmY4PNNLWo6G3R+A7a5BO0JjfxGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786547778; c=relaxed/simple;
	bh=wDFQ0qwL+IGjYcvFdW1kcj+AExViifEt48vHQFNVn+4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZCBCyfX14OqDZnFa01n+Ut8PFPtsvj+j150zELyRyEOb2ImmxCo5unqfuWdO90ZLnsxhMnREqOCuSZz7UAvPfc0KU1EU1fyH5q2lHmJPWVTjwREMgq9+SHGAU9mpLUCu9G/DHSVryHif0NiWSXkSLdVWXvHxRQLNQcORNDK+drA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OLr3KO/q; arc=fail smtp.client-ip=52.101.65.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OLr3KO/q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpWHtbkSKxWx9mZRhApjDpjCeUSF5fc6jpoo9R2FqeRZkYnYmGtVeX4Ud7P+vmw/qoq5H1DcsW8IhYgCZaQUDhmvpJuAvY90kdbpRl34IbTGDCFvu/TrUJPKDGvuh0vBm6gqwIHj1aDhBCpPSI6hRfb8ofXqcCuqBTgf9CvKDaJpg0WhzxIMzk+BPitBJnE/jLjPz51clyNZ8RTrp3S0Ro6Rq7BHROypfwg2XPd83G4HXWLHQ0rnA5MSkG2anBh/6hRSbcSoZbrm32p0m0mPuQ3nSR7gef2tFivQlj+lHUAOJDbJBBsJ02TJ3ocHx3R8Lfn5NjZ4VnzwwDcUkBew9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDQBqfrElGzeV0ezJp0CMvh+K/2sFqnix7Teimg9doU=;
 b=COfzwIkA94CFoAnNJ/KFTDITT1n15wefrJMsSrVjWdhYTikcfBwplMhrxdWVW/fIE86D9cIOr9zrZMGq2QjpLVk1oGayddwMjPVhi1t/zSN91hDBdp/I4RCLa0WikAFAhHnsEQW8wJ92bv+PkkQBR8OwYj7onGkDAdtaISNcx8wXFwusgZXqwy2YrYKN5VfWePkg/mASd5D+tzIXmeNvQ6dG54zlxHGnnz9Z+cPXbchVMdA9s2oanaBeVIN4A0ZvX21WyYNlqtFUW3/fmKlkXHf6x6fdpdyTwfz5pViBVD79Icz0AbpODb9U42gEvwCokwztTv59KzKsXL1yfmwIXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDQBqfrElGzeV0ezJp0CMvh+K/2sFqnix7Teimg9doU=;
 b=OLr3KO/q0YWyz/bI2h8nNNgBYMH6FdDb+G8gBMt/4xhH3KLpOo4XxZMWlXMNOpjEGOnzy4n8Vwq9tVW/+BCa15T+qB1dDbJC21LdxZ11QZRz14vJRiqXETBOMW2akV6mpFt/3wONYaklNCIsTA8zqu5bHO5Kc5kGs2Wt/VRC+n+WTTIM3I3zcXwQ8AKQEzekb7jA3TIO3NhwuNY70JxDfof8wfC5A3X+oX2g8eyuSI3r0YxV4jTViehnuE6jWLixBOrW9QM3wIOQezrFft7DkywVT7mLfKnDvxaJ5sjYy/+uodVsyMsSOYvgjk32t7vpMRoLQt473yqW3jYboTr3yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by GV2PR04MB12019.eurprd04.prod.outlook.com (2603:10a6:150:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 15:16:12 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:16:12 +0000
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
Subject: [PATCH v4 0/3] soc: qcom: ubwc: Fix link error
Date: Wed, 12 Aug 2026 18:19:31 +0300
Message-ID: <20260812151934.709198-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0037.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::18) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|GV2PR04MB12019:EE_
X-MS-Office365-Filtering-Correlation-Id: 96b675c1-1f90-4af7-d2e2-08def884a541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|19092799006|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	qhw+ORsSUJv8V8wVxALfAZMgYFltUguuDZqcJxXdxmP+nET3252gp65AI9mwM3IOgwDL760UdGYmYRBGT57K7TA4EULy2iKvmd4XriuCJjbhMfFaTdG0wSXyTKuAbXaT7V02d6IInUi64dESNOYNURo17cvbIXF9nQbNsbx7jHyuoYnR9S27ExRqzDpsUOIqP0iXgNHLSMindXQ4vseQVI8JUitgm8KA+OYsqwDlgsxQRmkrXUHCXrOVlIdDK7l+eAMQ3pohneRzSpRulnh4824Vh5o1reENkNmdTk9+Ot8CTCQcLwTLHxUljEpxIxdRZF5UMeAQ/uYfYuzQmzOM+ihpGsi3S4SjBLPpJ+hr51RvdQi4d3TmCrylcQHWZmlnqt1NifxxXu9FEG5bcJlAu/gx+mQbkdyfZSDhft6FkRtGPV5qX/hz7OzwNIzriKo/yfEaMblCZTI0tlSYQWqbkqLNn0+0qZVq0Ay5II2ERb+EZMLdeDhyN5lb1aPk8owZdXNSLJC8qqSqG4MRL0rhk+zZrSMEFbTOfsuo8bps8VKpfODMszESBcXhcGHFhIqpFP+x3cHXmM8rIuDsOOXyNETuPBO1MklpRoQvSmMiDpg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(19092799006)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cRTgIfS3p7JYTHoe2mRt54BN6lBC9wBj5+XULHqH6KbyYtygIhVOrQ4WijK+?=
 =?us-ascii?Q?Vg90ju5cj7JBz28DohlwG0CsZ/5XI0pumFBw2/6T7uHjZm3C4i0T8ZcluBXG?=
 =?us-ascii?Q?BxWtYOJStis1DWBfzSogqGmWxKJsqyzbmmE3w7S+mx1vRqOjoqoVR7W6t+Hu?=
 =?us-ascii?Q?QD+H8lsirVOIff8tSDnMzO/QgLEuc3l7ipDP/kSiY8TInOZi3IAFpFF4gMpV?=
 =?us-ascii?Q?+/8CfcisrIBLxRhgpLS6eknBh7K9LgT5wgBOFN64+B0+2epdt7IEQErqYW5m?=
 =?us-ascii?Q?rXEVb2MguMzBsp62cUhXvTFFnFZYhPFs+IdlVlgpmBWEcSw7RRkAK153FGMg?=
 =?us-ascii?Q?A69Z+h6LDUq9Xud/3ABbhmoGMqTMty/b0cd0KkfQC+PQ6MKAt0Qwu4l2bGAW?=
 =?us-ascii?Q?0dFpHlhXdimQuQYdT59nADBaNgGRjJal5A7U8aMy6NY6T8rsw+6mSmhI7bDU?=
 =?us-ascii?Q?tYNM19V16SdQ/9ExDgKo2kYJNNbsKKA3BeBkvwBpmuk4TfZD4jfx2lGkN7Z/?=
 =?us-ascii?Q?7C76zYbsjS2kHnxY4X3Er3ddLOVzbubPb2zo47euevA7C/8bA0wQO+DYELdE?=
 =?us-ascii?Q?7517Cs5/33HK+/490AMol9hli1rRV4AYOqTVUKIa8y5IsZNF5bZCs1LW/ol8?=
 =?us-ascii?Q?yJzdohc8m5MNBt46Ox2pZtN8myFYIDNbAX0dSHdiqZfp+eobOU9ZVagVFhYe?=
 =?us-ascii?Q?M9BGDAl10lT25py5gY2MeI1M9Sni46b34XdGQB9dkncHzC+X75BOonhUyNjl?=
 =?us-ascii?Q?3c7gv4McL86cDfGVOOsSDzd3sCf6Kg+j5Nbf8i3Zgca9U9Ph1zoMKCQP5tBy?=
 =?us-ascii?Q?BL9wG9CxiyfSS+iIrl3hN4/AeTwHV3b7bXGyALv7Gs5+OauYXQ85cZC5+AWg?=
 =?us-ascii?Q?dtVZIMW9Unx083KMXVKhdDYyiOxl7YFwL1/jVt3tHwPc3nyhlwLIFWc8517r?=
 =?us-ascii?Q?RlDyxLLzxTyegL9S8OiA2cZ/lj7nyqvTGEsNYkCdU4DP6JQyPk33G7HRhKhO?=
 =?us-ascii?Q?pXMRAJMxj18KD/Pk35GKPeGj3MLQGdi58/ILzhvEFg7hlheZZqzsnGvjJdK9?=
 =?us-ascii?Q?pf+2QhKMHD1P8jjxULWjqZRztG+g44SgZhWfbJQxA4jKQsBXr2+HS5g/anSm?=
 =?us-ascii?Q?+bNritfDDmA8fGksPX8SRNWorn0NFBjjfowqqkvRF3Z7AkDU6Vj+Xo5l/M9o?=
 =?us-ascii?Q?vBYT0sdoq0Adcetn/1HnsvxlepGWxlGOG2qBwmjXerBKwcE5ZdA+l2vnhDeR?=
 =?us-ascii?Q?iF/w2UjYvBwHXTqqHW2YRst78zCsC9UIyggNp4FGJocn1T94lV+kogxAgHb9?=
 =?us-ascii?Q?FnVdgBsm2GsVoTyi8kpTMdSswU9xZq01eSxWXRz7loVE3cC33W/EUGi22H3P?=
 =?us-ascii?Q?EGrNp7EH/M1JXvHOL1ejgcj0DALw2MA6iAjbCI3suqI47FbMt/ZlYGcu87vD?=
 =?us-ascii?Q?oSLS3jpaUYTpfntruNku792fGdQGyTEzI93zjwTRIqXEBbFMVVeaPwVfk92/?=
 =?us-ascii?Q?VuXmRQwYPoqrJhCSakR9NskMc8MZJYiPKc+14FdmYtqvGcY0yFJcQP34M81J?=
 =?us-ascii?Q?bbKrwT8KHyB0ithwMTJ6iqRCj5tcpJyT+mgcbxgTRhRApQeqD04b/wPjDRUR?=
 =?us-ascii?Q?7JBTNxS+uGoDqSn1I9Ap/DU0wGkYazdLbFUvo1NlNLxOHtNsJ4asgK4e4pQ8?=
 =?us-ascii?Q?b6PDMAYDb/+qw98pq0C2bXbfLMxFeko02KV32S8+SBjk1jZrr5oBzMt0oiDL?=
 =?us-ascii?Q?EPqr8HQYMA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b675c1-1f90-4af7-d2e2-08def884a541
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:16:12.5997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wfI21PHDMwc6fdQY40qjI6J3f5hfO93YuEzMioeIsFbAxVVqD5o9tTlQMSiMJHIUWEgx1RhRe9ZnX2tuL1DrPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12019

Fix link error caused by the fact that drivers/soc/qcom/ubwc_config.c
enabled via QCOM_UBWC_CONFIG uses unconditionally symbols from
drivers/soc/qcom/smem.c enabled via CONFIG_QCOM_SMEM.

Changes since v3:
- fix issues pointed by sashiko https://sashiko.dev/#/patchset/20260812130421.670527-1-daniel.baluta%40nxp.com
 - add new patches 2/3 in order to fix unmet dependcy for VIDEO_QCOM_IRIS
 - Use IS_REACHABLE instead of IS_ENABLED to avoid the situation we use
   some symbols in builtin kernel but their definitions sits in a
module.

Remark for Dmitry, at this point I think v1 would have been a better
option.
Link to v1:
-	https://lore.kernel.org/imx/1521da8e-18df-4d7b-a255-5ca133bd5ccc@oss.nxp.com/T/#t



Daniel Baluta (3):
  soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
  media: iris: Fix unmet dependency when QCOM_SMEM=n
  soc: qcom: ubwc: Use IS_REACHABLE() instead of IS_ENABLED()

 drivers/gpu/drm/msm/Kconfig              | 2 +-
 drivers/media/platform/qcom/iris/Kconfig | 2 +-
 drivers/soc/qcom/Kconfig                 | 1 +
 include/linux/soc/qcom/ubwc.h            | 2 +-
 4 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.45.2

