Received: from MEUPR01CU001.outbound.protection.outlook.com (mail-australiasoutheastazon11020132.outbound.protection.outlook.com [52.101.152.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890E2476CEC
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 13:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.152.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786109425; cv=fail; b=Np8nQcB2/1K1UtrafZnL+/BdroGSunZS7fqGmGXn3BJdZmozO+evsB36GElymdZU3xuZwxZtof8hQt91Gew0sQErYuIB9OuC7wWAzHk3XsU8DotspsFcOaV3j6WQwq34U69KWlYORuWVO6vD1tPyfQyPUG61dQsIr9oeLsbLW6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786109425; c=relaxed/simple;
	bh=UBtsLWK4eBzCBx+DAtThHjtQ82eisC8TaTd4PPf7tHI=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=sQ2v/xYfpq1hFpJ4GTj47hz6kf2W2n1mK5ZBJSIQdLpq4sxmdvQH9YQf8kyCGB6DzrfCsoolDZFY8+WBAiKFRO9gaAiicoblME9i+VMGfTHgIeVCyGCR13MzVYhRVkMveYEEEXiVvHYuLnmBCFDyMNbRM1ofnol8uEZ8ByKcjSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com; spf=pass smtp.mailfrom=heitbaum.com; arc=fail smtp.client-ip=52.101.152.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heitbaum.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BxzJDXwoy2mOQWloZ8nC9ena9D0nr2V7ovuEu6L6yebOJzg5KEnoC77kivHdeL2l05h77hI65QD4rpX/ZVdcGfdcS/pSSG7VVT/Rr2EXNIlRcu0md3m2zkEGPeTfggiKhXpGXbouJpO0uEmYofYud8B4lLHpYoarE89jCPS/4OpkFxh8Qx7vzsVNOAxX6qR+OgzFfZKphwpOJjmUQZBHlzuNTjn+et7eb4Db8AGPD94ey7mw6925ESnstHNPZyNfqSM2bpps+9ZXe1HNb8i/7iJSBs7GLl9ZlCc3BVIIr+vkf5U4UWWo8a8i/TI1DGLevhg2xMEtqbqT4h0wuHPAAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G26ZVU+BExKSSTnsg3O7iG0H7cNY3/+3zbp8geVmPqo=;
 b=pUaObitbZ1Zx5oSjqwOtVZHlxXybrxMLuMJBrpHqNiTC4R53agmJMzukkLy7BSprTb6mgNXFd3pJx30O3d9dVpTXYSq5FvEEN/eBCije7d3O6cf734csl4++yxCORcPQXQ5IAt+jgfi59H+Aop874+ACOYLCj45SfMJ/NTO8/TO1q6rm2aC3nKRCuoemBrtFYTlIC90pXoG//hI2zDDBJAUBm4CustwddDtW1o2cKBaVOdTJduvv26q91+dRQlBTU8oQ/0dnBE01vFuaiIoGykpmJwl9qFX4sOg7vJnINgljHcQB1t+Pd6gkYaicOP/OcxVqBTdB5qsS1gaamZJzJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by SY7P282MB3978.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:1ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 13:30:13 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 13:30:12 +0000
Date: Fri, 7 Aug 2026 13:29:50 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: imx@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rudi@heitbaum.com
Subject: [PATCH 0/5] arm64: dts: imx8mq-phanbell: Google Coral Dev Board
 enablement
Message-ID: <cover.1786107925.git.rudi@heitbaum.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: MEWP282CA0188.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:1d6::16) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|SY7P282MB3978:EE_
X-MS-Office365-Filtering-Correlation-Id: dc11dc3e-6868-4ad2-bb14-08def488023c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|5023799004|10067099003|3023799007|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	lGQyu77BbvICmLDmzCrW2p9gvvWeMFgXX+o6jyY2kDUwn6WkT+PPf63XpMnH8a0UhEp3Q9AzRNSm24XgmRVzYb4lgd5oA19zR22DMTBujKNJPm1Q/Sxw6uWOj+7RPJ+pBMFIDRCNczC1fo6WqHxZfoTGsHiTi4rM+pT50n+InwqfRwJXGG/QQCIMHSya1JMuChvVG9U2pmkIiB5KV63RIo4IpKue0kyZGCmBAVzjx0Hoxj4I7Nhn1Fyu2if/Ocd/jk9dMsb5v09L4FqU7apJZTPhKlfiZ8wck9LaNiPIgi9HMyxOhn8seeP+fn0jpt/7avU8OILG9kO2wVNDhpzidayQGvYFwNEsJ7pt4Nt6WMkmTB0a6YtTcSohm0FiMh93D3ABRMUZr4L1ySQbIoIhF7KFcTwXzaH/QCXMb608Xzco5l/1hMI9wFL6i7K8EqKkEOTAJCZIkSYhhHqCLsTtQBxxLIDFoLZUfO5oOxV/PCBFQU9jFeFK28hffUHly7tHA9M+eaIryTL+gt2osFM4R4GAz9o5acxaqHXL/MbnJ0o/hoioEqY9NlroQcWY2drhOBawaGt3orM9+Jz+0kQrEFKgs/GwnmjKty/+0mH+rkl2otTa4Xz91CJSbzm9xlu5g05Tz+Cj0OU9T5Kr1+KXd4glKzV5b07xbA7jhCfJj+0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(5023799004)(10067099003)(3023799007)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NrQC8M2qTEM34WznL8MqTbH5a9BJciIrIfj2XMwigxXdNU6Ju6xj8iecg8Yw?=
 =?us-ascii?Q?oAN+gDh2d2eOMz/HXDqnnSjDumTa01fhI2K9eLCXn83mdjO9ssJ4NE8P1vcr?=
 =?us-ascii?Q?xSeHB48v4VoTaIAjIGBsyLnZHiOWZG22GHwDpmKcGp/9ll9PKwLX97NRduMf?=
 =?us-ascii?Q?p6pTzyApqcF+pl0YgrjrM2FVoj5PV1P3FjSS/E4GAgGgokcq2pwlqc2NFffZ?=
 =?us-ascii?Q?iBlhxTf/JdqTuf9QBO1V+N0gPUtAqYfDisGA1Hp8zcpgy0YA7nM+7VUWce8n?=
 =?us-ascii?Q?gTgCm69nXFF9dR+nn06wiILLMmDi5iX3oivJGZYJLcTSHOITL4KKDjmXr36o?=
 =?us-ascii?Q?6DyllQrNAvit/LPGKK9DsJ14x85+CmGZCI7ZFR8AAIG0jFtbPzujlhiFm8n4?=
 =?us-ascii?Q?ACtBO3UOyhECjLIJXrnK55qaXKhYNMoCRRzAm8/Lm8ublT7Ha0QgSAC54Rrf?=
 =?us-ascii?Q?b9uzPiNcsG4SzpuJZ+e2NMxkxo+gYUX0ab4LrV5vHHMsgGjd4D/cQRo4eaSt?=
 =?us-ascii?Q?7ldIn61oSqKcliLHvNMiA4Q+Wkg2NkvKdtT7lzvbpK8jm2vHNDfTGRTEQxXb?=
 =?us-ascii?Q?EAXnVQqOEN8KoNIf0nzp5huwuR7soryqpFjpfJUVSSpHXDGrpNi2JI3JWYB9?=
 =?us-ascii?Q?rLJ6L5A1cxKjooCh8hBrMsILlxEndqW9o77Tr+44xZCKkycTC+Hrw3IE+U/V?=
 =?us-ascii?Q?fuwkuIwbs6wjDFKa4rmWe01HkmKMN/mGFsa0qZBs5u9db87YTGRifNoKzJOl?=
 =?us-ascii?Q?R3JP3vvodEPAyEiiLdVhUFFOAJdc73pNdX5wpXVqCd9sl1o9J1vh1xRyGtNW?=
 =?us-ascii?Q?LBsjaTTwOUWQlQpzzApfxTbKsMVXN9aVGSdPtqEfh6GDYQvcMpXoGs9m6KEj?=
 =?us-ascii?Q?hWyReLMXBF8X33kMP7HygTqY/F4Q1KPY0JTs84p6Xpe34gM4liMMlnZJ67dO?=
 =?us-ascii?Q?R8CpicY1ZZ7T6+5+qwVmhxr90IUp6MV7jcAYHo7+qQJdHj3kQ2P9vHXtQEr/?=
 =?us-ascii?Q?NkaRxvppGK0FciExqBlNSY0A8Kan423ng0n6Q8JjMCsrwssQdGAySYKpDC0M?=
 =?us-ascii?Q?luva+aRKL9hK3wCQPO7YsVy+FH1Qs9JK6tDXny1v4fqpuaK5mb8wu4BA/ToA?=
 =?us-ascii?Q?9sG1lOuaXGYAktoe8nksnTWKt+op+VumTd+2Vk3CmruUSWBh8l846//27lL1?=
 =?us-ascii?Q?i2xXNVm8ptmfDlSGIojiH7kKYiqsFGYg0GPMFuDx67CSPIjV2QMvwyFqBDn2?=
 =?us-ascii?Q?9lhwxuLdLkfYwYFzPyA7TEk48xqRgSYK4O+5cO3ie35xl1PIILlNA7pYJtoh?=
 =?us-ascii?Q?vnqKTziC2Y7LG3cxghpqSTELQEzVpnxGyXod/j76AjJ7yIQRApADWV8Ve/kQ?=
 =?us-ascii?Q?wd4UVi9nw/kJJ2gUGyLd0obBNSecOWaEeyiDDEsxpUzKk4nhosK2WJd0LLvj?=
 =?us-ascii?Q?YvQ9aYcbAr0nsgNwonRrhzUzr+n371+Zo8XmWiIhmLTwq+8Y4PkP/3AkLY13?=
 =?us-ascii?Q?ezDrx5peon05/bSoc7T0Tlo7B4SK/cZee7v+T341HgNyVKQgfnnnK9FMzCdJ?=
 =?us-ascii?Q?8UoHHGD1laB/2kQf4bBhe02Qv5qD6aKGqzJ9/IVKRuZhHY4BhD8jDYGWe+hu?=
 =?us-ascii?Q?w3e8qPToY2h1irnIXlNkTa5XrCsHi+9Sr+i8m+5RJMhFdcALApZfKtlFbAq2?=
 =?us-ascii?Q?gfFiK1J8qnifVa+5N6daf7mhXC0OxjEKXIheTSUV91RkE+GC?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc11dc3e-6868-4ad2-bb14-08def488023c
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 13:30:12.4649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yjzNcm0W79EC3lcHLlRu4yQv3RlJGndIlhvTL4AbANoo3mQzA455jLZGs+xwaqbpcSnb7o7SUQuzUaoYIW9m/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P282MB3978

imx8mq-phanbell.dts describes very little of the Google Coral Dev Board
beyond the essentials. This series fixes two defects that affect the board
as it stands today, then adds the i2c buses, the 32 kHz reference clock pad
and the analog audio.

Patches 1 and 2 are bug fixes and stand on their own:

  - BUCK3 feeds the GPU rail and is the only regulator on the board that is
    neither always-on nor claimed by a consumer, so the regulator core
    switches it off when it finishes initialising and the board dies about
    thirty seconds into the boot.

  - The cpu_alert1 cooling map hardcodes an upper state of 2, which does
    not exist on a part whose speed grade provides only two operating
    points. The bind is rejected with -EINVAL and the trip ends up with no
    cooling device at all.

Patches 3 to 5 are enablement. Patch 5 depends on SND_SOC_RT5645 becoming
user selectable, which is "ASoC: rt5645: Make the Kconfig symbol user
selectable", queued in broonie/sound (for-7.2) and not yet in mainline. The
devicetree applies and builds without it; the codec simply cannot be
enabled until that lands.

Producing sound from the analog card also needs "ASoC: rt5645: Perform the
initial jack detect at probe", posted separately to ASoC. Nothing performs
the initial jack detect for a card described with simple-audio-card, so a
headphone already in the socket at boot is never noticed and the output is
silent. That is a codec driver fix rather than a devicetree one, hence the
separate posting.

Deliberately not included: pcie0 and pcie1 need the i.MX8MQ PCIe REF_CLK
source selection to be made conditional, which is a separate series still
in review, and the Bluetooth half of the QCA6174 depends on that in turn.

Tested on a Coral Dev Board on 7.2-rc6: buck3 stays up and the board boots
reliably, both thermal trips bind and throttling engages, the codec probes
on i2c3, and the headphone jack plays 44.1 kHz and 48 kHz.

Rudi Heitbaum (5):
  arm64: dts: imx8mq-phanbell: Keep the GPU rail on
  arm64: dts: imx8mq-phanbell: Do not hardcode a cooling state that may
    not exist
  arm64: dts: imx8mq-phanbell: Enable i2c2 and i2c3
  arm64: dts: imx8mq-phanbell: Mux the 32 kHz reference clock pad
  arm64: dts: imx8mq-phanbell: Enable the rt5645 analog audio

 .../boot/dts/freescale/imx8mq-phanbell.dts    | 124 +++++++++++++++++-
 1 file changed, 123 insertions(+), 1 deletion(-)


base-commit: 075b74841bd0065a3bda3440873c747938e69b68
-- 
2.53.0

