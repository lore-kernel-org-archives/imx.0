Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013066.outbound.protection.outlook.com [40.107.159.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7E340682C
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 05:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787290781; cv=fail; b=eC9tzXyHaFgSVLqaffFFyHOpKzKiDOMriYmuYAPVtfJ4cKEaU5PwXUcNqF6t1ePJ3hlMMeKKCTA7e/ELhtgZ9AnmpbE3ofO4dJZrNd7b/CtVOYtiMwg5ldl8yUrIoK24mRmBzUKJAmz7VVTzp+mAyxE4JZLSaskyzmsS4+QdTaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787290781; c=relaxed/simple;
	bh=f4AIkqTmSn91RRIdrNPkIdk0a2Aue5Hwk3dpmc62bgM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=mgqrOxY3xw+W/vAyqFTEm/edOT5L5sS1LoLFxaSY5VxSewih0n/iV7fERopYJo8XgrPTEfxPtE6o9kz8I7BmLqVovi6zAQdL8XPArNEhil9cLkT3lRoRAqRPdZk8NpZa861aCXF58KJa6ebnmLGzBWjovBA1mqDOpupxs/lOboY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=f8ZBvFrt; arc=fail smtp.client-ip=40.107.159.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="f8ZBvFrt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUNwtJegvzICWqFCa18lELh/oeiGKSCxKGjqkVrZvD709ynkPaStVNUAJnNznrqLcXZHG1cv1ke7HDp/IAxDbE3djuhXyFLjZ/3e1GwMp/Div2x+2f4UbtsI4qiSMus4PmyDSpA61NUD5uyg608UZNdvxyL7L7sWsrJCi+3Jgk3cqDAHNf+eP65wLT/7tbCBZjVWPs+6qEl+oGl+0wW2MrzXR5jxA7BJuYVC6xN2jaKabN2wkoMT+B/g9irsQdT9km20iWjz0HWhCg1T6B6TBrK40/ZG5tC1gsss0UcNhLiBTPlBvLypGtQgaCr9By4UAP+/0OmZapWHuWwQQZ0t2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVRpjooYXWC9/bbGAMOO4hRMmj3pa25HM4mrSkZV6fk=;
 b=uRApMMdZO6dg6kvFwvuj2wS8mpwpvgbl5WRchjcwFpLfabAWfDnw4P22Kd4Tb8LFqr6EZZPI16ox23dqBpew3tNNWO9xmb7tWmPGNcB4UZwUVIULYDTjughvO8sx3GS0zN78ubauhdgWlE8dp/y3/RIDSfkoXkiyi5HUNjtfLeH2BVyZDo/7A+qFcPXL35yFdUfV2XxpMcQrfocr9hpMp3zFU1jNoqvA5hKNlgAKA9A/MW1Kl2q8SJ71zTzMivfPZF6yC7eeUGJSnbeUuNfBS+lu4nPT6rOwYJ3/PRmffYTxUMl1JjABh5cVrFSJbMMdI/MYYFzNfcZRFXhBRBegNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVRpjooYXWC9/bbGAMOO4hRMmj3pa25HM4mrSkZV6fk=;
 b=f8ZBvFrtrcE4fBqXQiPAPyaCNFo6eF3i9uMKhSei2h1P/Bg3mDAiSa+u4HZ0zTURvOgtZFmQ9T6cbe8243lf2nsQBFIbGfzZL4916NFXiTqW2yIu0tCexvhDA8sfRo7jMoA3uhUwPg8gLGX1NGDerDDkHmDJqcO0FBm1izkn7E/am4XXWtIVj4hTZLbJdVYF3NtjL9wC3l3+FM58yWA/ppPt1ygGkTKDVDdovMblmFxt0/1BmgoWo6brDAwm2i6a/7IfR2Hy59hfVSXRw39HLz23Mj3pXb5iflPpr1uZXFEmcErOaK0ExxLsMPg3DVelxXaIgryW8l+7YInTx//VQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by PAXPR04MB8489.eurprd04.prod.outlook.com (2603:10a6:102:1dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 05:39:35 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%5]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 05:39:35 +0000
From: hongxing.zhu@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH v2 0/3] arm64: dts: imx9x: Fix PCIe memory window overlap with System RAM
Date: Fri, 21 Aug 2026 13:43:31 +0800
Message-Id: <20260821054334.1277088-1-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0129.apcprd02.prod.outlook.com
 (2603:1096:4:188::19) To PAXPR04MB8096.eurprd04.prod.outlook.com
 (2603:10a6:102:1c7::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|PAXPR04MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ab524df-e490-4ed7-57c2-08deff469536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|7416014|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	z9ew1UZOx8H1qwFrZoCZ+g4BhuuX/XKg9fBCHF6t2KVNHJbVlaWx7uTt1X4tNghaM8CycnQMYD9zRrR0YIxEFSpmPN7U6+WehHusEg9puiBOOXBgXCzYgGlxUdQJv+BjoI7pJyQjhMTA5qVHitou5ETnPKcVGUHlSQP70Nry74zS+ynRTqeVJZhSFqul5/ZnEoTB7hOZrdhGI1XxMIvhThDQ1jZw3bG4Jy0DKax6dRPaB3zPfXuoPgnaylJT0bczGqF2OM80MF38/T7T34e+E2MVQos+f4h/j2Eg684FP3mCG4Xk1hhkb2sZw6mQ2LrH+jcNPFkcfl9s93/v4Ykomw+0z0ApVywDnoBJNCXIZguhtwEtkqDvC3sL1i1+fpW2vcJQkYC1i9IAXlmOOTeHi2xCr8Hc2Oe2jJ4gXYEjcAdamJPSj9OdnRG2QZSPaJAo/9o0pieYHlBTIUt+VqyxueZKUKdsXuOhG/TmmnuSXrqz/iOfTPCYRSXQJj5vxg86sUw7A0qpQE87i/1BsrjzeoV5rmEnhXBnkc2R2xVDgRo7ohaWFf9X9kxPeekigcA24V4blwi8/Hx7C/mpqUB5BToHvzZ9FMbfm4DJ2aUWw1mVNELPcyIr58dWUJyvudzLkrlC502dXukjvTTVxAOa//x2nEGrz/fDsBEFi6kSpE4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(7416014)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Atb1w425NL9XkalIBKKGHaYO6uMw1CbQWFKssAdGALbBwsgoNLiJEcnQdWsE?=
 =?us-ascii?Q?UpB18mty5eBTzq/aUs4seKScB7qPFdJq3KybxU/yh8CGDlgjavacd4mR2aWM?=
 =?us-ascii?Q?hgv/HSwHecySXzook0iFYHcnJjKzyTUrtDSGouAcINo8OnWMFkEAYUzH5v8o?=
 =?us-ascii?Q?oypSBz/qWJc7ex5q/Yy5GUcq+JtauNz3BSGhmtEj/FnAsEzep4W1zh4qqDT2?=
 =?us-ascii?Q?vdQny69RXRoz+TRaU/XX/mAJd+KqP/1K9UsJt+xiIhIPyNuxdL3NEnS0uGNu?=
 =?us-ascii?Q?gk0eMkAZ32Q1h8OBcIi1apFzOaJsGrzADZUkfQTjiyOAVE8sue5qCAGu+HDx?=
 =?us-ascii?Q?BWuSFGY8iviFwYkr0rBEc2hVcL5OL03cAdhNTNd/aANGgs79q9viTLMS9Yl/?=
 =?us-ascii?Q?xxsu/FZb2lH/H//6amqaQhaNZfj7TWQH4ZZWduM1mwQtxJHTHhZJG6CvuHJs?=
 =?us-ascii?Q?OtLbYqRQVDBFdi+Vo8oc0dKMdhk3x++5rKBlPBhLhDAOG3284T/2+BGEJfhz?=
 =?us-ascii?Q?l1VIbybP89N0q5w76h4d5DUO5kNBoKkmFJVHAaQw5iLYIOw10M968sY9o+Qf?=
 =?us-ascii?Q?RDIPEkmEtN6k+CxttUy0rGNYQWs25Df+83giZU5aUFNF6UsKB7ZIy/rQoixA?=
 =?us-ascii?Q?fdTK1O1bKcdkuEEIabkZBTOcJF6DzaUicDp8atac8TRdQLesiGW1nxbvmygw?=
 =?us-ascii?Q?ENOSSZS3NHpQJmuzPBn8BXBoTpLPHttAaE7ruhIT2r8vBrDixx+WTtGcZeGc?=
 =?us-ascii?Q?YVK9pZH3rfl7xnmeZWDzPceypp4uH6NctWnOtcyHaPg+SNhoWVnXXXfVXwN/?=
 =?us-ascii?Q?eRc80Bm9iGtZZV2BztoDC3PwhsBYXASu8luHqQboYA9mBPNAyZNlCfhjqjyQ?=
 =?us-ascii?Q?AkreyTJvr/77KGlGIWe0ns3TortZ5jth8/04rvuzBYWlopO+AGtpJsHrgbiM?=
 =?us-ascii?Q?kUnl+NRQtl91rQXdUuQt4HfjJye4qifFtyNk7s0FTMKQVa/EyeNUUVMR0YM5?=
 =?us-ascii?Q?/66B54IeXpjjjbcG1H0rzI9lKZ+5cPaIAw7UYvqlcvFSTzdMNpQc3KLxVpvP?=
 =?us-ascii?Q?jVjSjazflnNZko2fVcFlnv11/aAWXrw5TbkPp1MoK46HIgt9btpVUN2jFQVr?=
 =?us-ascii?Q?0Q6sD+SLkiYVxlSdtagmhz44NizYi9KIt7QuDHLZ0X6WY7W8hPjnLkW1FNLy?=
 =?us-ascii?Q?1QU6Nq4IxGC5dUXY2nobeVX8zxIIryvzp6Iw+B4X6qkpxY862PDJW44AX+bY?=
 =?us-ascii?Q?MBirZi1l+1TglqWZeDHnOGCS4z5/84+f9OzXlU7DlVQaTGvVNcIJpLJiKcQ4?=
 =?us-ascii?Q?Lrsl/p4m/cDJPi1cekhUdMG2TZq7qo+GOOj7PKbbViuTs+iO7DPZ9E1FFBDm?=
 =?us-ascii?Q?il1VSQPCtbh33QScbkj0IUmS6A46lZI+I7L01dnI0ftqBUHTaoWpN3pzqUGP?=
 =?us-ascii?Q?mQYhPXTncC/PMhFNl5I3jQO4dU3M5+GPXnuBh0lxKUztV4MAWxjPyMdpyA2Y?=
 =?us-ascii?Q?ziVHmZd0B9WloIHRSLG5u2HqaLSg+216TbUmtio9SPW4gR4T4K1/eNATlw1E?=
 =?us-ascii?Q?23NiC4Bn3STIiQUwFfjQqxbCVs8IbiX4k5jDWyeWrJBX71dj9w3b9+l6K1Q+?=
 =?us-ascii?Q?ET3e/9OzWgCvweJHGOs1y/OdAOE7Hj0QsFUmcM+fYL6ewy5y73kUKsOumKhl?=
 =?us-ascii?Q?puPZc/mstx1x3pq3w+YTYyx9A/k3zTxjqdctd2sxpkI3J2XFBwgsAnkL/3vO?=
 =?us-ascii?Q?4Jp+CRJiMqI1/bDLowCzVM+kBVcAMBWOuayPkNbJDBA3P7cQ22Yu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab524df-e490-4ed7-57c2-08deff469536
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 05:39:35.3905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNq5OHcPgQBQTyvPgRkzDjvN115Cf5rH2x3YCXmWxha4exIX3p/mQMFMh62vhUyz/hLIfvcmcx0OQrTzDMmUj6xH5Hng+w/ygfP8xoB/jMPLphtvbOxYM29ZLWTdjUDT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8489

This patch series fix PCIe non-prefetchable memory window overlap with
system DRAM on i.MX9 series SoCs (imx95, imx94, and imx943).

The current address 0xe0000000 conflicts with DRAM regions. Sashiko
reports the potential issue in previous review:

The fix relocates the PCI bus address to 0x10000000, a reserved and safe
range. The other PCI bus address and window size remain unchanged.

Changes in v2:
Clarified that the adddress being corrected is the PCI bus address in
the commits.

Richard Zhu (3):
  arm64: dts: imx95: Avoid 32-bit PCIe window System RAM overlap
  arm64: dts: imx94: Avoid 32-bit pcie window system ram overlap
  arm64: dts: imx943: Avoid 32-bit PCIe window System RAM overlap

[PATCH v2 1/3] arm64: dts: imx95: Avoid 32-bit PCIe window System RAM
[PATCH v2 2/3] arm64: dts: imx94: Avoid 32-bit PCIe window System RAM
[PATCH v2 3/3] arm64: dts: imx943: Avoid 32-bit PCIe window System

arch/arm64/boot/dts/freescale/imx94.dtsi  | 2 +-
arch/arm64/boot/dts/freescale/imx943.dtsi | 2 +-
arch/arm64/boot/dts/freescale/imx95.dtsi  | 4 ++--
3 files changed, 4 insertions(+), 4 deletions(-)

