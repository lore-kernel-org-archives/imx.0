Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010046.outbound.protection.outlook.com [52.101.69.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C9730C161
	for <imx@lists.linux.dev>; Mon, 18 May 2026 06:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779084938; cv=fail; b=sz+gPhCTNf3subuqUigxyZEoVYOFJg3inprnJr+Z6LfbDNkt2anTmscLZbOrMcLbANvXn2FEPU9Z3aTH4Wk5x1fre4K9TuaG0Qo5YkfLuz1TDdL5Z1y1SneU8KfXcIWahkux3iPsLUBwIkDfFmaMjL+HNL2coJSgk4J3cTINkpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779084938; c=relaxed/simple;
	bh=3Zh+AEqKzuj+hReMgHzH7aA8Uy8P66u5GniZnbbWsj4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=F/Q36NcTj8VK9+IxUUpbdCusisz54XYkwWrWSL2o1N75hDkKmChqRZSNGUJIYhkbrd/Cn0i5TbJLF3+Boc5aLFF68B8JGfiN/bCVgoZXMNtBMLJzF32SCVcv0zgKOU7nt902e6nCnN37xUn7xnitpom4Jt1ZUVg3geI5ABhWcr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JKF1C5Q2; arc=fail smtp.client-ip=52.101.69.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JKF1C5Q2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mYPpSoueiQIOM5BlY5lewKzZTabgAMbhmUqb27PgslTpXIdTN9hhEEgXW7m6UluIkjfhHU1wc36DgF91/2B6NH/g8rbZhsCwxowUoVZAKvjothz7nUK/GJTGkDZBkYb1s/pnIyd9AquzVRBhJ6zAWOaqbXsRLaaBDOU+NnyvMl4KRcfjFPOUEM8SIt7TTorQ5/wwvMtPinaZVY+mhM5Rxy6WZwBpck9HQrfr+kNtUz0a4sQrntD0qSswqlEZH5jf9CYWyj7sZ/P/G5SlBsZj7XOLjs9bxPh+akhI2lSves+A1VgscH5c/sVc6psvTzesfas+Jkyn/N+lE1avZ4l7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNKlsw6UvmCzze7HGtVns/fqN1qF/kAku0HneZWSDoI=;
 b=SkCK/JYZFx/Dcx+/SklxtuLFrnlBj00nhWlmGiPdO8AklViFhhEyPU9DfHCvC3Kc1okj72tE9/lghGKJQm1a3OypNhFryjOp4KddnkXa3BbyirDzZQF3Paz2iph+lNUOnG/ZNB01AVBrX4fuPPNBZk8aq7yNiKMbceJUPJxE2+ISXdwGCphV7enAeH0RtJAeqHQEDHdnpVEabVNDXyle6CAYo1S5g+JiRn+31T2/uhEzGhohBnJn2I9FXY/EWnlcgmp5f6exW4VRW1SZUa9VP0wRaOg5ndo6SIi8TZuRg5CRWjZobxrq2Uxm/bXeuPbB2tCGuWACVsWF2Kj2UN+rFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNKlsw6UvmCzze7HGtVns/fqN1qF/kAku0HneZWSDoI=;
 b=JKF1C5Q2EPSacGn2dFOpvFlp6uiSNt4P0nBVUuPEPr3hS+GDUl+iNS2HNXhLx7bWsKCMOZxqTw1eqTSe8XQGVribIkMD4poVlwS8fliiYGyug28odO6CTugkPSVSg19MVY9gzlsru1WeAxIgzJi+IbPa0c3Da8YFnGCH/+gbFR0D/0ATqLcXn0Ez0O3+VpFrQM/8HTAfqpXpUHtLGQTNzEJ/j1Zx7VwLaFLeYfPgxljWme1tZ/F9eT1q7GC3NTpiaifDdCaflbablNNdrBu3DXyJ+3hfZyLmM+KvEec5cm16cV0O87kL7JFlK6kMEhk/WaAo8tF1NzCKSRVeRCeawg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com (2603:10a6:102:1bf::23)
 by GV1PR04MB10992.eurprd04.prod.outlook.com (2603:10a6:150:207::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Mon, 18 May
 2026 06:15:26 +0000
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::4608:7dcb:899b:e4a1]) by PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::4608:7dcb:899b:e4a1%4]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 06:15:26 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: [PATCH 0/1] add USB PHY node and USB OTG pinctrl support to S32G2/S32G3 SoCs
Date: Mon, 18 May 2026 08:15:21 +0200
Message-Id: <20260518061522.2884441-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0002.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::20) To PAXPR04MB8190.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8190:EE_|GV1PR04MB10992:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e543fb4-8f48-4846-00c8-08deb4a4d96c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|19092799006|366016|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
 izETg+RYBZn86IsBanZEPcbcHfS+Oq28QeEpXGNG+HGhzKq5z1ru6+sZf2Mq0M+qx0MElnbZrJ7oFehIkIRwqAz0NYl1IeO/edNugE422DE4QdNS94moqM5hFVoTmhOCID7dtajqo/nza2orEtwIujNehozsUH9IZkHqtR7WhvTzdN23MeVCKrbMhKOAhJb0cIX1mp8v5IxOAYb0t0MQePOoDV+P92Gi8vEJsOi4jA4Nz4frIePhh2it2YUMyV7z/uCKh8H+ReniwNOVVDnJDDGoh4M2D7czv2FF35c/18+CsbAHGfl2Fc/6h03GGCBoGziVjSdhRkPqhJAynAY3FYPhgdH+WMCz2T6eJJnMV6CSTQ4ffzqY7i0GuCcSfB7XE7T+YOFPztOaRCvA6Ma+BGfXNTN/CvplDVUKdmGIiq2Cf7lRU3tFPkXo/ZSzjpqhtFfMOcjftbV5IMiH3SiE4POlqlN8m2gIsFzVIqOTw0z9kBuu0EBtNtkhaq9COMhfgmsU8yzBdCOlBPggw+xR9OuPLxY6VsBR23TNigIQD14H82LzCbEu1QGGtNCmyhJ8hOnf3SrFGKeUgV8vOp1pfpX1r+VvZ8dAagEaIEcFLtGYvL37wEyf4QbV+ApblCTAFx+0h8heLINzYXQvdnmhFATg+p7paABnCpAcdKtpaTn1PzC+/6phMPr5ZC+UwpDk
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8190.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(19092799006)(366016)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Ri9jSnlEYzlXMy84TTRoNFNIcHNLZ3ZxOVBZa2t0ZUZMZGxWemtTQW5GK2Js?=
 =?utf-8?B?Z1A2S0xoOFFUdS9hRW5zdzM5RjlmNjdwaUtVQnNZWXZNbWp6ZnN4a0lLQzFL?=
 =?utf-8?B?cEZnRlptUkRuc1FPaG4xaGJIY0V3MUFtbldlWG5BVTg0L3grVTlEUkttYTRr?=
 =?utf-8?B?bXlUdDlKdjBkOTZLNWN2VVh2bE9VN2w1QWdIMUVVcFhQeHk4TnNPMUxZcjE1?=
 =?utf-8?B?SkZwSVdPbDlVVEJzVVhBczdHVEdHdXlWZFJhRGswRTRRT0o4SWVDR2ZnenN5?=
 =?utf-8?B?RExHTkdCT205YzhqVEtrZnoyRUFwb1ptaUZsRjMySS9oVFBmd0xvTWtjQS9n?=
 =?utf-8?B?dE1TS1hMNXZ1WjFPd0pHSTZFeGRuNTBUbEZ2OWVMc216blBzdlhlQytydEtM?=
 =?utf-8?B?YWtJUVgxd2VSVmV3WG5OZnZjWDMzeFY3R0xhQW1IeTZ2NGp1akszRk15MU1F?=
 =?utf-8?B?TGF0YWQ2SlUxNlFxZjBqRCtpalNEeExtb3NtZ0RQN0QrNy9LTHlCWUZYVnhu?=
 =?utf-8?B?dEJIYkNWR0x1aDJYYkxMMkp1T1ZEcnhyMlk4b2h4UGVsMlZzcFlJQ3pNOWRU?=
 =?utf-8?B?Z0UyRU03SGNUOXV6WFFMS2srMGZYbzhDTVBVblpOeDRtSzNqMk1Rem5pNGcy?=
 =?utf-8?B?akZCTlhSNnk4dHBwdnBRQzVFYU4xcktVMlVWdUJmRkxJL3ZMWVd0cGtaVEQr?=
 =?utf-8?B?QjEyQTVLUW9iT3d4ZnVUK3AzdytRbWI1TXJtNVJjY1dZY1VkOUtvdEh0YzdX?=
 =?utf-8?B?d21mVW51RW1JYXVnVnc4RUtLaGMrVVNWdTlVNklIT3VnRC9ETTFyMldhYita?=
 =?utf-8?B?MjNMRXBNMnRMcElOWjMyZFk1TFlRQTdRNmRwRUc3RURmanB2YnN6VHJQcVIx?=
 =?utf-8?B?TnBpNGZiU0thSmN6ZTZBU2N0UTlqQ3luaFRKMi9TRTRNajk3cjBmQXZVTVdE?=
 =?utf-8?B?enphek9RNkZadnZjUGR6MmVZMUlEamdCUnVnUElNSWEvdnZ0aFIyMnlLZ05O?=
 =?utf-8?B?ZUo1TGVEWjVXNk9tTnRjbnZic3VMdVgwNWo0b3VtY0kweG1rUTRBRmtnUytG?=
 =?utf-8?B?ZFlnZG9zTWRMSnBuRStmMWh3QVA2Z05PUC8xUVhzVFMzZG5CSW10TCtTVS9V?=
 =?utf-8?B?L3padStGMHVPRTBjcEkrYTlzNXNUUUg4QmpOL3J1djJQcXpHa2NFa3ZHSUF3?=
 =?utf-8?B?Q3dTd1NrYk8rUmtyMXRGcDdCWjgweUd3RWkrMVRYY3hCYVc1TmROeGZXMGQ3?=
 =?utf-8?B?eE1KeEIzVll5TUpVVmV5YjRDVVJ3WnZ6TkJ3a0ZBWC9Pbzdyd2JpQjB3RS9t?=
 =?utf-8?B?a1ZIazl5Qlh5dmRNVmtpR0J0UDdWT09PUENkMFphRk5uWkhCUjA1czFOaEFk?=
 =?utf-8?B?S0pjZVpobjZDRXNBN0FFbS9sY2pRcnlGeUpjV2p3eGlCNlhIUEhRNEtyWjJu?=
 =?utf-8?B?U0kyYnRqRms3R1AzT1oxUTNkSGN1Q1VEQmxiRkNwdldUc3V4NUhmS251Rm9v?=
 =?utf-8?B?T3hEMmF6SVp2MlNOVExJWGg2KzV5RnFJUjVvUW9CZmZ6MHcvbTh6L1NVKzhI?=
 =?utf-8?B?MmJWckpNS0ZyV3JpNnNzYUZ3MkVDNmNhZWVMdVhCSzhvQjAwM2pQYzZGQXIx?=
 =?utf-8?B?eERDT2RNclNYSlovdTRFN3JZQnI5ODhiVkxPaTNBa2NLTXRFSFhadWZYZHp5?=
 =?utf-8?B?NWYvRGF2dWtCMHdja2JaRnAya0ZIUjQ3ZW9kY3g0ejNzNDZuVDFUT1BndXZY?=
 =?utf-8?B?NVhiNkhEUW1FcURVVGU4QkJEY3daeFFhb3VyVTVaeDRCZFExMmpsTFlNS3hs?=
 =?utf-8?B?bFVxUFJuQ0ExY29wNTV2L0x2WHY1Uy9vSmFaRllGa3g0RzlGa3FteWNGaVd5?=
 =?utf-8?B?TCs3eFkwUjZCOUlEdGtSblovZXUzYzNieXpPZEpHOHZCRzV3cTZZQWt2N244?=
 =?utf-8?B?U2g5WjhzR3lDQmxYUW8vLzUzQ21DclF2YTd1WEFJZDFBZTFVY0h4THl1UXli?=
 =?utf-8?B?Z3dEdzZxWUNaZ0IvZEVrTVc3ckJYQ2FiSitESEkreVJXc2Y4TFVuYTFmMmlM?=
 =?utf-8?B?RzA0NGROQ2piS0h6RUpTdW9VZms5K2lGRjZTUnFzTEc4VnlGNkQwTmxaUTU1?=
 =?utf-8?B?VW9pQ0NKekJBSXI3QlpOc0Y1cnhoYkZwbkJHNGFjR094dXhYdi9FYnB1dWor?=
 =?utf-8?B?QVRUcENLOGtuOUtSamQ2RmtrYkVIRUFSU0pIVE4wZWNOcFV2YkVwMUVoTzVF?=
 =?utf-8?B?WDlkZk43cGFkK1JtNnBNaUZRYnF1NjQ3RGZMZ3RVa1NBWUtyTStRWlQxYkdl?=
 =?utf-8?B?NWd1WXM1SytZYkZ4YUFScXNWelRNRE1lVHJTWnJZTk5XT1gyTWhWTGI0UDdT?=
 =?utf-8?Q?84RSATklZITZMRpnD9tTbSrIeE9IZY50jCPzr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e543fb4-8f48-4846-00c8-08deb4a4d96c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8190.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 06:15:25.9124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svFAKNl95ftQd7RjaOwp5K96fioK7K83cn+1koNEodpGURA+sCkBdS6SpgR+MCuCl3DN+TPUTTrkpzE+a9KdgYLJV5zkdJUj3P8wAgGiUhC0ezKGUjyWRU1ZYGrYkuXG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10992

This patchset aims to add two changes to the S32G2/S32G3 dtsi support:
- Add the usbphynop node for S32G SoC based boards
- Add the usbotg pinctrl support for S32G SoC based boards

Khristine Andreea Barbulescu (1):
  arm64: dts: Add usbphynop and usbotg pinctrl for S32G platforms

 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 53 ++++++++++++++++++-
 .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 53 ++++++++++++++++++-
 2 files changed, 104 insertions(+), 2 deletions(-)

-- 
2.34.1

