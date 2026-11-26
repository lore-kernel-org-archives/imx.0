Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795707066;
	b=E/zjcyX4/ERTYcDh9VD9VSIMb3iOUFNWD+Ct1D3gH6K0sBxrpAX64Up1Wk0Blt9HnfkI
	 DnGn30L0DDcMBEf9nl4SS+wjdK691ETBymJK2U8dCzN4v+KWmrjYw6vEoyNqeh/cDq2Qk
	 VNsua6HdvFzQcqGTiFiDkoxcIZEOhPT7I8ir6OUQidpUxlyWFlai+436pl54wA0hF9Ist
	 BJXRzdWAKRNKE7B3Ko7uYM1f+TEOJeQqgJcv3FuODmqIyVrNOda1IYGl9VrBRFU98LJBp
	 3VUL88wLq8s2weZeF9ZwFJ9e7gv1DvCsuFC8p98BTqAs0H0NRAykcd4hBzvY+L4vUBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707066;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=BI61g0uZOCYldJVFInmfMCqoBVASX+vk/SQyyQA7ycA=;
	b=Sx0BuUDuz5YnxoxLX8M8TZDyTvpP+kgM6wBzfLK1LibDqBJTYDk93ycfXEB45pgjBy/L
	 at49fnXLh+WEWDxpmEEXO4T4R3/lozBHgVcnJcMMSxyJZlwtNVHGyuHEO1XoYFYAwD7KV
	 22Pi2RCJhsGl2xp+HYlY3Hnvd+5ECk2hb1FCUHWVbmVS1PQ9cNy61y6r08n1tHmYZ7cRA
	 eZAJMtjOCtJON03//hotMPWOqo9uZUrzsdhoFvlMAaChVLs8jEStg6xLgRC+Vd/FgCc9C
	 cWf92SG+YbULzAtFcMspQRzGsAn6E5lZnedY2pKILYfWvo4Fp9xDJgnVBiAs3S0uMfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=E2B42EL9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.2
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013002.outbound.protection.outlook.com [40.107.159.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B66F606A31C
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 15:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B66F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=E2B42EL9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KN9rHU/nJk5HLzgo6iQcdTETw48S/SECk2GihrUGMTHRYSaybotIYuj5P31etQsujr5bX8CId2xflIrGIV9Oyyl8lwaqdTz1U/51ViIUcv4jGimUGqJ/dBth62zPNeH/k0Z/lTDEse7vrbocB2xEBxAwESk2wwqDg3WKt15ieeUnNszaz8NAPDWVG78ZLHcbTdwcf74cxwwQSRatm8ggmNlAAyPehY6nYolvtWNYj7Z3p88vNcnEm6VOaPiZ9low9zVRRAKQdxq+IftfGSzupYwtX7omKS1HEqgDVd7Q0o4mDoKzhBiJQNMugqq2q7JIddA0MKyHlYE4PdaWUjGKAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BI61g0uZOCYldJVFInmfMCqoBVASX+vk/SQyyQA7ycA=;
 b=uD6zY8+ML1lF6PeWSIw69OB2A5C139nu4GbpXYLSbQsSf0Os0Tkm80O+TnEHTqnjX5aTueMv3fXBCDlyAlHBQS9uwjW4FUywZKuvXmWqG9+vFtiw3AKzhckt02dOCHtHFRJ14GkjPowsqFSuzUeb+VSV5hrFWruaPmO31I6hk7SS65/7z6rEZMNs3useoS3DXF2ZpzL1Gdjxc0MNIK76LVTQHlTf0vY7wdfaTZo3iZ5EuFACLD0mePCXhNBk1UGGy3A0bm1ATSx+XQq/y423z7HDMzLjTMr3bc5hDuLtT13Wyc9TOIZjdMoCdLSB7bp+SZ0af+16leIDtASZd6B45Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BI61g0uZOCYldJVFInmfMCqoBVASX+vk/SQyyQA7ycA=;
 b=E2B42EL9CrXtuOKQ6UjUURW0X40Op2jJO8V+oOVSvcFTGaDkeQj1QOkIiBfH5TgetTM6tgNtCn3ZHGNeLDlONkzZbReKdL6Xjc2jqVaqZU/jqcfy7Nkx4+3mCLVwEqdjKPNdz8HUB9zOoIIxZcWo4RSnAFfGV/7SFBB5/U0xvY0CoDQKVwMRSrB3inak9GaETul7H4WKI6glTgR2moYMPnj8S59XxJr1mCVmAvoiKxY9z7LBzEzqvK8IHChRj77IOfIJSz07tf47HFgxFOnV0j1aJxh3TTEgU/pWs2bP98foXY2Nq7g6hJgNjeA4cshcnE0Yfpz4Kfl9K6/2mi+gsQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AMDPR04MB11704.eurprd04.prod.outlook.com (2603:10a6:20b:716::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 15:31:02 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 15:31:00 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	hemanth.selam@gmail.com,
	hkallweit1@gmail.com
Subject: [GIT PULL] ARM: soc: imx: cleanup for v7.5
Date: Thu, 26 Nov 2026 10:30:51 -0500
Message-ID: <20261126153054.1022080-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CPAP307CA0001.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:3::10) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AMDPR04MB11704:EE_
X-MS-Office365-Filtering-Correlation-Id: bff0a5d7-614e-43db-47e5-08df4bd24663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|23010399003|56012099006|10067099003|11063799006|261021121427099003|261022105027099003|261026140227099003|261021123027099003|261028144727099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4OTP7ajpP8Vx1O9djeJDR/h8tyOmEYJz6cJN4mDhUt7iSeva1K2xye24wUS7gcxdMxbu9f7JB5c0lq20e9uuefg9TtkKdaeusOWcM3wfaHh+KoXglokvROs+zZ3QrnWcokrjSRREOw9yUdUFKmE7w6SNd9lWZvKi7tVnkqLhyEjuioNs6M5SCWic09Ml7gQhBiZqDrVL/SjQUhpb5CJOq1lmR+7AQR7AdZU6uhGR7TRwcBeBDblsR90l0xDUdBL2Zm5mMMfH9UqDOyxjybRUSgh4p0PitBT2/+PWS0/cprN1KEpunD7YAWjz/CFlg4MeVipj+iVWOuPgX8V+dxsxsM2suX4/Mc3ax70jNqoFHCEbWeKG5Xl/ALrQXXBCNVS9KU0xl6SZT0tpk6cYqd/4qFpN20gAX4BNxhIVM8Mzv5f2N+CC+3vkzq/9HXUoX4UIWML9kB2iimfTeRaxlwtclPO5Y0KafD48r6GTUP9efOr7qSapO3Y8PAhDmd53ZtQvJAEOcDR5axICzq8szTaMjMnElWteMiSjHUpDE8fEWnsU8+jckM0r8uDylAu0iQ84Gp4scYIcJQDOQ5URUF83suMNJhVWzq1yV1jmAzRwrPOAU+kXJtAcIV0RCLtBPfLO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(23010399003)(56012099006)(10067099003)(11063799006)(261021121427099003)(261022105027099003)(261026140227099003)(261021123027099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WRCkeQJpdMus2JxOtOJV2QPwoe44ianZkkTZPYFwBQXc1YaiLhHp/P8Qaw88?=
 =?us-ascii?Q?PEdsz6HnJjE8HGbtmxccHaQa0k3RPqOwqgW3QLcmnada/+oXjolCuEYHD8HL?=
 =?us-ascii?Q?G0apP4dtRX8lltI1+yq4eMAFb7Tcs6Rc2HNFLrm307VGWtE/2kBWb2QGWsAt?=
 =?us-ascii?Q?XLznN2ss3HsNvUtelP8TatCNcfVMr9tQm5rrtuwJAGXWztG2sNZYk0EYhWxC?=
 =?us-ascii?Q?olGd1L9IhJEOcp33+rv+AZK+vnhKxAmRfYh8/2H2vIvfXL5qxpan4t9yCaYQ?=
 =?us-ascii?Q?7oP3kKiBThqQpPk4r8qnKDIDBWdrFFVHF4EPJ8TnoDqYyU9WLXtT3uexkA9P?=
 =?us-ascii?Q?lIuKo3bbh3wnJ70TqHIZupMVlApUZI64D3uyJTC9E1Mc0H8KdASqhXaP3BBO?=
 =?us-ascii?Q?E3HJhZMfCrrxPk7Q21jYGkvBgyutnF7f49bgGvcf06H9T9hFfaHy8vXJdwuY?=
 =?us-ascii?Q?hD45ZNrJK3X2cRrM4b6dyHgXp+1yTgwdpAAqcEo8dWO9uhodU+R3PqZ4J3j1?=
 =?us-ascii?Q?yy0rbTTjn4wh/31XGshNqwZOJ8VEzO4F/jsXjG1XsaySgqyj/Pwxnk+10Hq0?=
 =?us-ascii?Q?kpcN6NCnOFEUn7d6GjwzNYwwGX5+4Xcw47HTfkwfeG4xSZQ/zWqqdOSKeltP?=
 =?us-ascii?Q?alQAltuzLu10eDFrtutlioYEBrw1ovaP0O3qZuQLdzSHI9v42V6G6vHMl2HD?=
 =?us-ascii?Q?YpXyq2QMO+WF7mKk/7QJGUGrRlPc6HUQZMnXYsFjFYltbV0P+0ot6oziFYy2?=
 =?us-ascii?Q?12irUAZy0RTcQbl0c9dBSXjP4dgUyx/0a3WQPbMYbY3l946kv2GTlab5kcYX?=
 =?us-ascii?Q?4TqXhOWA9Yw6eXRQ5yxd7588QTuBBGe/ZOzyRBGJCB/9CHdLgoCJIbP/Iv8L?=
 =?us-ascii?Q?Rc0UhPkP+9jaFbgwLs9WYJIYvqbWJZx+e1PNdMyxaDn8ikdqjobDCewMQ10U?=
 =?us-ascii?Q?incncwL7+I1zubaSt787wMOG0KTv26yYMooE+16JeKEKSxu+6AjNEHICjJRp?=
 =?us-ascii?Q?F+AIQNVFB1BNyH7YMVQErQXD+ImkJyJPY9CkUhODThEXiYO4LJ5VwkE1NDWA?=
 =?us-ascii?Q?k0/R8gReI3qfmHwqJjPhRi35ebYdvi6f8lVbLYBPGbCaJdZVpLGnLoSM6HbF?=
 =?us-ascii?Q?0ShDsyy95pdmqFpHiEzOrxkFX8rSV+adk+XvDgbdvqZFvn2GdoLZflfDJMyG?=
 =?us-ascii?Q?Wxg5jnXsS9yzzU74SuvQJ238r7njwnjh1jFW24EBu24Ereq1lwrSj3npyjAe?=
 =?us-ascii?Q?IsRXOdRWAU6g7Nk5sEvVfRCaYZEsAXTN8kLHQkh8hlCuwb6MpbEiBifXEJza?=
 =?us-ascii?Q?i3AIFKZJTunqvPtQdvDKV5JHJP6jiwIQDuKGD2jFvctOmRkS9p4vDKKg0ALl?=
 =?us-ascii?Q?C7WfOI8teWwGGNIK1EO2chtWgurp9IgkCv1FvAfyJ9Ta1Kykp1XIxLWqACYg?=
 =?us-ascii?Q?r1CV/lHAfo8hQpuL1bLTqesoe9czw9sXSNS1WR5aziQue6A10+3qOFyGyVK4?=
 =?us-ascii?Q?IQpcdjQ/uEUwgU9a5Bdctm7NW7JsOU4DHZ0IC9NpQWvjtZyvsZB14SfPuMPH?=
 =?us-ascii?Q?3hh3/ug/b4OgfW79C1zZ+UOi7SusVq6s0sUSdhiFiWOAbfconiwcataZ12W2?=
 =?us-ascii?Q?Z/e2hlIfBCYKhSRASXLZb//agWboTQ4NPrGJzO7Yuxti8I/Q7oCoKJ3vJlQp?=
 =?us-ascii?Q?/pNjngPJZZGMiL+o8Zr7/rpbBRCteq6lqm/Nn50eesy7rwM+MeM8Ok6dPtV2?=
 =?us-ascii?Q?l57QDgBPLhDXAeYt+By1gtF9u3CSu2g78Y1AsBWD6UDG+VFI0KPF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bff0a5d7-614e-43db-47e5-08df4bd24663
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:31:00.7285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfhVks+wp83SFOGDQ4LiJ1CkakTh7u0DR5yKy8h2akrv63fRc47fHo8ljAbWMPd2MMVjLfc5ir13lfbmj3CX34cot4F0emSO52mOlvwlpn4uR3UCyR8/S31+mYFF7ioI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11704

From: Frank.Li@nxp.com

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-soc-7.5

for you to fetch changes up to 8cb3211effba221890c15adc80d1d49da5c0947f:

  ARM: imx: fix typo "interupt" in comment (2026-11-25 12:21:07 -0500)

----------------------------------------------------------------
ARM: imx: cleanup for v7.5

Cleanup:
- ARM: imx6q: remove unused header includes after KSZ9021 PHY fixup removal
- ARM: imx: fix typo "interupt" in comment

----------------------------------------------------------------
Heiner Kallweit (1):
      ARM: imx6q: remove unused header includes

Hemanth Selam (1):
      ARM: imx: fix typo "interupt" in comment

 arch/arm/mach-imx/mach-imx6q.c   | 2 --
 arch/arm/mach-imx/suspend-imx6.S | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)
