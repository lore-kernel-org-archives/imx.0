Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013048.outbound.protection.outlook.com [40.107.162.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF912C11E2
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 10:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780395843; cv=fail; b=EO1TXG6lxtb6AZP1CB6GVx/qBZPDbnivSXu1oWHBVcJrApbJPqGR6U+C2sadXzBjlrEw2KHL+IABi+s9bvKrEip5DkvrA1GgJ8Z1k6ptPwCRq77wVRhOYl/+ahrRu5oln8KYAHLwxVs3Fz9ZT9+Ykq1miw2t2iWZrqzOSG7UUZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780395843; c=relaxed/simple;
	bh=DqqU6fkYAQofBdXBGpJlOm/3Ysny+unDsfEt8lL7+Kg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=kQEanULn6PWAjiHbLkdA9MjvTMk7RC6LxTQFFMA6k8pc8PxrFRkhtWgxm5pK/6fSdRA50XEHTmS6C8bL95WcuPGVfGDv2CzD0P02B1m6HWgf+GY8raSoClWi7/WXpXFpKhGmS81uLqG7dTwkqbLRZxIakD0BLIA8cHIywg+gGF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QjHFA+hS; arc=fail smtp.client-ip=40.107.162.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QjHFA+hS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6qlfXcaSg60yH5PR1vGbN2+X2wIprK6c8XsI3XajaKPueKmkPPnoSmHql5BQwxq9gsY952z7osTkMquY7REhzWzoIFWU6mIecZLb6KFUstewfI6DQWCzeFmmMRItK21KOQEVt1Zz03DlWQ0rhWlHsmSWhQXChCNOzllv7wA+Relx8GQnnqXH1TRFBQoA34t4cEmQMX0uc9BwhcTHRuYf1vwbVnR2FbIsvS31nVyKQ+lBrxPmhjbdwfEUx0fx4cpDp00JiMD14DyMM0HzX4OX61/0NovBozHZBjfVTyuu9Z5uJ+4VgeQ/3HwjrCJQaWBB8dj61GWeY6p/j8w+onnfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XwRneH+qu7WmXdzObxJHmL1unA5TCAo/MigWIyD68Q=;
 b=U+hIdLgi/a1fuS4tkmgWbfivHNQ7n/G2mLOzPPVrXwjUQaOiW8sQ7yyQ6OmhrdTNsN/oAZydyy/VdXBbewbLC94h5qOueAbbXb/mek1Awp+bQqSG2mDmRu0CBdx6Z0knHXCf/Y9UylkRNpOWaNP+FxrEmY1Lu5tez+qOu0JAYjcPhy8MuHqBYgxFmPfcAWZKOgxIp9WiQZe0i7U5uyuD5j0sWOn/vFJu5wv9H1yysud678S7u7Gzjnwanimiyhm1rBQbqg+jcIYoYDvJYrfBK5GoCF17wmNKL9thVWtnoTswFplLaPe+eru+BZ15PV1nKx1Mtjr3Iwx2l9i0dG//Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XwRneH+qu7WmXdzObxJHmL1unA5TCAo/MigWIyD68Q=;
 b=QjHFA+hS6/uKX5nvzYruxJAuY6C37tH6h6T9ilJBZ1+TJW4TGlJ0QNWWQpd/UABklPZbqgg8/I529nciiDhqVSzoK+Q1Nr0D+4VXKaHn92zc6hkIoT8xixGimug7wTVNhBE6Annr+4u2rYwv4K76kNXj9IGPUXR/tGb4OrCbxVZ/Gy/YEHCMJU2ogTVaSgaOR8tyZxy8ATAOt7bbWLBKzRfa0xV4IXCHyKuOqLi2zdD+4U0radMVdaqPjs0UKYEzr6Wi4uwwDX/Dpe/Cq+lEfX19CEPytsx4ofNvLXKGpw9HaIZShQDiS6U+5xy5+8PEk0X4wjZ20jCvuzL7X1OCUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by GV4PR04MB11849.eurprd04.prod.outlook.com (2603:10a6:150:2de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 10:23:53 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 10:23:53 +0000
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
Subject: [PATCH v4 0/1] add PWM DTS support for S32G2/S32G3 SoCs
Date: Tue,  2 Jun 2026 12:23:50 +0200
Message-Id: <20260602102351.3477106-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::9) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|GV4PR04MB11849:EE_
X-MS-Office365-Filtering-Correlation-Id: f31adacf-20ff-45f9-9655-08dec0910b73
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
 kb7ODS2/TpdmdM1yxbhG9zZSnbnTsvhscO63JijCrESsfiuU9CW9PcND/8bqr4iZo1o9h9hqvPUCkMTDG2h2mWcv58y6E273YF/tUK5b3YjyBsM4K5Jp5fRj79sQwoguXQ4MThVEnQHyxpC7qRyDaXdUwPSRPusorO46e4fHJX3W6WVojP+0EQVFikTzjxQu0ldG5L57QuuZRsVrs8rsqjXw+uNAygrJKB4gZwEGaved/BzGkPPVUAp8uK34mzRxzB9GGyRMRtTRLi0TXu07AHtOiyCP8Rk66c9knXBEm2g9KuQCcpBu5RH6C0aMSZ3MtH1whjcviqZ6DJasjBehAgrLQ5CdIoUdGRCNRKam1bYEzUvIY4AXySFd6yBpdEtOt64FksFHIF7wDUJ4N9+FyzNy6MclaeEBeNFnVw5KBgc91XnDuqK+9MAjiMyt98aMS3qr5PGMzzMbnS86cDtqCF8ZgqMbxsbqm9kXH+zUapYbAVTB55etpljethqCyq4RXrTsoYfE0gTZ998Th7rstBN8AdAy/joDSHmWUbgELDsoojR4Ow/AHZCW6lDWWwa/jeHE4jTzq5273u0H2S3sxcDb2NwkJ8XfYulSSUSksPxW8+DjkoGHCMJbeTMoGOtgdIMmEkDwL0XGeOvCLrueKMMRRus/ksri/TWLA1ptaVDq1voBVT+lm5M2klDx9HT3
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?nfHoZNWBCt7JDCayHYIp7gmTyCajbx5DDAGJahOV3uPAFoxdMHFKeCG9RGV3?=
 =?us-ascii?Q?tApmlbKu3HDxHWg1LeerjuaI+t/D85tecflCIWYjIjbonSJlgwdy5CXZpeUP?=
 =?us-ascii?Q?xPgGxOEfCYfHfyGrDavcbZHKvs4iE7O4xHsIL+60Ogwjf8K0LXMIV3Gr49gC?=
 =?us-ascii?Q?QRGFKjRLRFb9iZ7xOjMK/7j0T57+uV+wMaWSHhNV423noCMaYD0STkZrPDfG?=
 =?us-ascii?Q?IeFkuVOymoMRbncH4djrGP1XQ5ZfV+Pb+3N5hfh3vvE5rXdPdrAoC+uwaSLT?=
 =?us-ascii?Q?Ug4fzYQTR6Ymv0pT3Q95j9BPqj66yrHvjWNlfY3l8PxAnL3eflK7LZzyU2lo?=
 =?us-ascii?Q?B9Mh10QoYQrB07tbisiokRdOjldofD/gnQ5wo5lPKWZaB9wfTaJCWcuSwfY1?=
 =?us-ascii?Q?4S9OC1VNrNq0HS01NZ7aVgkvRhX2wYT8gHexnZUOWUFuig02+lpFXS7Z3El+?=
 =?us-ascii?Q?Pk8O16t+w2bRPHyDKuCARp22OQJq+m538fgGgk7XZzmPVxLskjZeRBcmkaLs?=
 =?us-ascii?Q?B1xm3r8ebZ5FpIP711seXIuiUn6d4WvAOGM7iROxCp1IMMcJxDXPqCH+l4aD?=
 =?us-ascii?Q?MGHOgJiKI1UsT+6bRGD43LRXUeO+PhrfjQ4xOJXAqbuxXVFFptAygmILHZwD?=
 =?us-ascii?Q?IB6+x+uPWTwTHtiEYawsjh0De4elaLCCQH0WzLTOpqslVyqWVTDCu5HYNs2w?=
 =?us-ascii?Q?J0hZse15GijJ2AXUtsYUAhXos6NomONjAKxhifbFvbmxwOqK/6/cicDLiJc3?=
 =?us-ascii?Q?Ylg6cABoae1daKUdBvxQbfyXMWL59gTwvq1td2PEOrVhafrStNQdjONZ7aVF?=
 =?us-ascii?Q?nNeXd+3tOuhBZDzs/dTPeQUlrojreyAC7QjBybfDFMzuaDLj6aHdepN0oo0Q?=
 =?us-ascii?Q?foT2jjh/+djEAa5DjRh07Wo7nFwnMiQimFd1T+Xo/C2oXduTsZQz7VhdUgEm?=
 =?us-ascii?Q?6PSIE6l6ur7zLR4Byg2PusHSOvIy9oqUc4942rU+xcaJ2OQpOJZNSPz7wc0t?=
 =?us-ascii?Q?jC28FgwckeSsga6116gcc4LArxn5b97OHORgeejg/XTTE8hwWT1Joig34qAZ?=
 =?us-ascii?Q?tTUGswfaDZMYwndXTsaEwrbc++9K7/EcC8LpTWphzyPX26W0hrQ9YAKLD6A8?=
 =?us-ascii?Q?5e1fbn/qJTZY0zoY94oC3oP7RhcNi4xZqm3QVbELM/aLIO++V4nd0NoXhgW2?=
 =?us-ascii?Q?FH1mVCwfyeVacDQCGNi/n+M1zyFfnpyDAHBWmGnC8MNGDb5np5lcVYqUzFCc?=
 =?us-ascii?Q?In7jJU/yqB4ZvLTetfrcqcZvFUTVWUpvmzD0N21uX6BsUGJtVGjgFmwO2YJt?=
 =?us-ascii?Q?hOefTt0LjrBVSZUxzFY2NrMN6pMgsFlD3oSMHDBky5xjUGGg/DkAfAxgGnnu?=
 =?us-ascii?Q?5Sq+hYBhs9gGEHjqh8Q3LBnS9SxVLjriirH3BQU/k6NwMz2Dr4BHZckLtODu?=
 =?us-ascii?Q?gV6kEA5sjXJV3LUblvo/Vwe0uNfbJNuUcvm7gEyn2OUmC6sHi1fzUrYFUFn6?=
 =?us-ascii?Q?qp0xXU/S+5tDpdh82KgDZWuBBI5UAMZZxr0TTth0SWfavUKxB0a3p7PsLg4z?=
 =?us-ascii?Q?Ub1YjhTc/vPs2hHuL3IDGUIGBbc8CeVoOc78N1NQRw307SL9ploCrkTrSPim?=
 =?us-ascii?Q?zsUf1uaXhW0Y0L5r8NhCmZEcJWreRlVZ5vlX0CzBEaXyjo24YOTH48jmupY1?=
 =?us-ascii?Q?qUHhuf/eQel/nUBXIVNrK+7dG8tDijC64phahM2P915A+hdooFg6TfcybOFk?=
 =?us-ascii?Q?cAqQZ9ZoZwkNfl7wQ0xywNO1QQ32VRjmom/LusMRr4la0LiW85We?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f31adacf-20ff-45f9-9655-08dec0910b73
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 10:23:53.0352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjRmFhQyxOHNOZq2mknRhqOS4nRzFibQ0D86OmG3hUgxRNQvgoP92WLbM1rluH25tz0avg/iKxtEmajSQ7EokMmAPp6modc6OIILNzJVIZ0ocMTbknjk/nvz02D8ok3f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11849

This patchset aims to add one change to the S32G2/S32G3 dtsi support:
- Add PWM dts support for S32G SoC based boards

v4 -> v3:
- fix indentantions again

v3 -> v2:
- remove vendor internal issue tracker

v2 -> v1:
- fix indentation alignment
- use hyphens for pwm pinctrl nodes
- sort pwm nodes alphabetically

Khristine Andreea Barbulescu (1):
  arm64: dts: s32g: add PWM support for s32g2 and s32g3

 arch/arm64/boot/dts/freescale/s32g2.dtsi      | 26 +++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 28 +++++++
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 78 ++++++++++++++++++-
 3 files changed, 131 insertions(+), 1 deletion(-)

-- 
2.34.1

