Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA35B24142
	for <imx@lists.linux.dev>; Thu, 25 May 2023 20:02:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPtsjJXu/yuaxwvTO3aQREhR6M0LbJ4NDS61GFCtcUJ7URHcVSOfkVWacwNowCmyZBVCOavL/0orRRfE4MxfM3lTtHpbyvOZtUWDPrJ8UbiAptrvXUuV2VjYDRF9N4RJ5hH0LSPS/O02DXtmoWqPfgwuKGjIvoK85l3pbTc8lQeXSX6bf0fwg2jNkPb5nOjsxp/K0wBKc5nUXFmPVrNcgfOyV4KutC+LEBOzgb6SofLtXZ5liULEXIUecppclK5u4l2pe5ubGm+6D5+q//uy67D/m9Ol8KuavzcVLAuBuAB8ea0hDjL41hUPpTyzX7bauAwqeoyOINuCYQCn/ArGtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PATpJ06aO31mnsg/osKheVG9LnKi1cFW0uTs2yv60A=;
 b=XkMp3tAW26gscKPpn6CsciegIvcNobOEDlUsEv2BfOpvisB8SG/+CpzUlQZoIZKZcU2dFIlCGmg3B73pefFN7LEV4N9UJ/VRn9wnsiCvOBqIzKgJfPREPSfp6/NDf/nOOsttCtGLta1pbDuFdjyWsa6Fu33bhNECA49hTeVS1Y+7Bh2P+BDtYDwHWi4hr+OsD08mG6ZhEhiz2BNNltj+BvBaykUwjxVC3a/F4ZAog+EYgcfZGAzHvBqAzSN+sCw3piMQPvMMJqCZPNlrOsShWXIzEdy1T91DDM3+CGXidQK3oQlyVw7DYZ9+1PWrUyh5OFbwnxAJ6ng/ytPMkVuyFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PATpJ06aO31mnsg/osKheVG9LnKi1cFW0uTs2yv60A=;
 b=VSiHQWPH1jQ8aWYoMZL/moObktLidA4TCceNRzlaIBpW1kNjnF4yHLam3ta3pNgd3fj0Rv2mQZjprcdx7/b5a5LpwDrSRVYvbJV9V/Lape0tgY3fGuzJgtGva9fcViT985xw3X/NnCsfPd3bSfMB8yKE2cLb7sx33dhRqqpDXA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PA4PR04MB7934.eurprd04.prod.outlook.com (2603:10a6:102:ca::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 20:02:07 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884%4]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 20:02:07 +0000
From: Frank Li <Frank.Li@nxp.com>
To: peng.fan@nxp.com,
	joy.zou@nxp.com,
	shenwei.wang@nxp.com,
	imx@lists.linux.dev
Subject: [RFC PATCH 00/12] dmaengine: edma: add freescale edma v3 support
Date: Thu, 25 May 2023 16:01:36 -0400
Message-Id: <20230525200148.1015154-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0046.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::21) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|PA4PR04MB7934:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2cb8f2-3123-486f-f23a-08db5d5aeabf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+u0hWoDZ2mnjAPk1rz1abYkQ6tom5693oiCQbejB4s98PG6m7qI6/07RvdgXtn1tdjlNdg7e6MV/G8eZpvSx0ll449qTFcgdrVv0grbrLmAHbE4fUoalQhFkkCAMAIpeWrGt9FxJH53MPWVN4+eyekVxzvfKoRxnAWXCJZjlw/IBAaXJMYrMORxWRu1+5XEu9W0VeOdlQeWNv4RDX3n4m/auMfiVJ62fuFyttdYaycGbwmtj/NJfWiR88FpFrijvTNlCXHOQvVpWnI+IUzbFhAKQNLKIAoidvs8Ac0+u7NGElzBLovUGTSZorQZFk3FaYHM1d1PLRD456VC68KXYfSSknE9uIXEksdSHSpYcGnBSnvuMGHGGr53ewWAlItp0rfBWjSxGpiD3pfMDXNilkaVJ4yX4/OJpFqIMGCxJ+YtLg2az25pLWyykPLrt40lIqSoo4Oeyx1RXjsldaaQpOhlijYcneQoMciscDfSvvX1H6Bze0WIKg6p5ASxxLEgBZ6eO9JkZmmsBRHBT39gxzewq/HSbOQd6gJ2RCmgbMXkazOi8Oxy7CNI3ZzgJv18CBaMndTccl/f3bwL2esIbDRXR4wbLNS7ZB04ivM1xfB5gRAc8xt+3qv5umiPgSP1dDlGyICE5I21c77wU2aoCvw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(36756003)(86362001)(52116002)(316002)(66556008)(66946007)(66476007)(966005)(478600001)(6486002)(6666004)(8936002)(8676002)(5660300002)(41300700001)(2906002)(38350700002)(38100700002)(1076003)(6506007)(26005)(6512007)(186003)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YoheINtunuX8NrMwdb82GcqDZKpLkhi20RpAq7EI41RM4yuPdyUQf5TKy/s6?=
 =?us-ascii?Q?6cwPNp8hF85SxuyTNTL71v5GFza4oh+J92/w+i0oW3/dSLcCapUf6nR0Uc9o?=
 =?us-ascii?Q?PSFLvVrZyAvzyQdplwXQyIAz54xttTGn5U5epVoxGhKCnJBt6ql4yKR5MKow?=
 =?us-ascii?Q?dwee8Elgm7xLXHCYXi8USOkl5qgGiq8bb0w6WS65ltaFVOKq4tnEk3IXBrNK?=
 =?us-ascii?Q?IfsnmoiMZ9489BlY6x9oKS8EFatpGhsj6SskhI0c+5qVIgQNcjnW+mwEfqX3?=
 =?us-ascii?Q?iYzFJ10r1Zmfj5yZkRKHyWaaAZXaMcrnOTBmGcrXL1PsjXc7zQylxu71Cix2?=
 =?us-ascii?Q?GgjJxS/j9eKK1ku5njxqGqkkx8vDP5aN0buRFbUSy/ZwkT8O9DkabIEdx6OR?=
 =?us-ascii?Q?NZ+SZs7KDM/0k5aWD7ZHbxW33MpFZmefLaY7Rc0MbaPzDYVd3ScqDvaNuv1V?=
 =?us-ascii?Q?U9XWRwQl03fqoUsUzEsWOs//3yT0sjxvwr/dAvmiN57m3SZrbCy2F8QR831E?=
 =?us-ascii?Q?vRiEt6nOPY/8372zYrhA5Bcbv4iyHS2vKItwIJM8PqW8F7w8vyLuobs1UBCd?=
 =?us-ascii?Q?aB6x66ulXXANuvM2v3X0JIWjb9NyJTdtsA3xLOX9Fy05VsWv8oJVDUMVASd0?=
 =?us-ascii?Q?iNIeHl79/3gwbjeeggXrclsoA258d5aiqFFPRtnCC+QXPor/4M7Ihpe0IbXp?=
 =?us-ascii?Q?kBj8/0Qf4p6TNPX4uDT6cj/deGnxhMxqvXBGqdDm8WDyRfR2jPF0SkzuWpTP?=
 =?us-ascii?Q?KfjvIm4pQbdL2WZFz6ltHzl+TgWa8JYaJKEW+LEJP1vGuPqJ9zFerD//YUib?=
 =?us-ascii?Q?8ITAKVu9yUD7o7KBnfsEatFl1jznWD+/4iHD2MKViUhgxg9wTz50YAQ04YD5?=
 =?us-ascii?Q?UPi5+R3JrOMM/jiXOWI0eM61RhBSknmtBC0naMvCCHPWseA3v38EZpWCvMkf?=
 =?us-ascii?Q?q8xmjjNEv7vF/JLJX6qX+iLw50xWnnclXwe1jAwkfIFVSWfvIXPAMDq91L8p?=
 =?us-ascii?Q?poHn4cUjqv6pZvTDPVq5GM1Jepk4ftihecDtUlN4N8qX9wNmigZyRduI7T0t?=
 =?us-ascii?Q?mefbPYpQhKTASSlcQjWeT+a2P+s03T8yOK5LlxLaty4AiLEGhvJaKqGv/MGL?=
 =?us-ascii?Q?GqAg/6GPBdbHDaiFIhc/V2kI8JjyNVXfLcc5BCu+ER0YFOpSgbP3BTv0QsXe?=
 =?us-ascii?Q?0FJ3EfGKPYRfx0c2rb08CUoqmlBUMspAAe/dQDYyQ9B6M1xpY6IN/crB5RTx?=
 =?us-ascii?Q?ZW7uQrrCYIUjg1KWqjsSaU9lcHmu3fd79/B4QmICsYJJTySUcBXwfYj8fvHx?=
 =?us-ascii?Q?NN/oPErYaD9/gJ75M8DuxIsh2e267vWQIewg1j8xbpAtk+SZg2R6L+IT2L7l?=
 =?us-ascii?Q?7q1WxZdN4La6n4sUGzytGJjUnIBW18tcK8XpZUwcjHbA07OaTuM3X8huD1vF?=
 =?us-ascii?Q?DFi0jfZa+LbhcUKcEBgNrwlD2JuVZZHmIhWZS4vYLeX2PdZCIRhdNzY9x+A4?=
 =?us-ascii?Q?4rTSigQVcysTOwlq4zbriqNUkYnDAEHqGVKA1XVouFxGOksCpeIyS0WKZpUn?=
 =?us-ascii?Q?yaayv4FZKA+stgWfORRXRY+PW4M3ZhLbB988uHy7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2cb8f2-3123-486f-f23a-08db5d5aeabf
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 20:02:07.2180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gZJr6s+zj4if8UWMavkxA/XchNuAXMJj7F2qvHScGLDqu1rBrSjspfilDTZwbl2eW5X7cclyHdUL1oF9eSPYyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7934

This patch series introduces support for the eDMA version 3 from
Freescale. The eDMA v3 brings alterations in the register layout,
particularly, the separation of channel control registers into
different channels. The Transfer Control Descriptor (TCD) layout,
however, remains identical with only the offset being changed.

The first nine patches aim at tidying up the existing Freescale
eDMA code and laying the groundwork for the integration of eDMA v3
support.

Patch 1-10:
These patches primarily focus on cleaning up and refactoring the existing
fsl_edma driver code. This is to accommodate the upcoming changes and new
features introduced with the eDMA v3.

Patch 11:
This patch introduces support for eDMA v3. In addition, this patch has
been designed with an eye towards future upgradability, specifically for
transitioning to eDMA v5. The latter involves a significant upgrade
where the TCD address would need to support 64 bits.

Patch 12:
This patch focuses on the device tree bindings and their modifications
to properly handle and integrate the changes brought about by eDMA v3

----
include v5 TCD64 change at
https://bitbucket.sw.nxp.com/projects/IMX/repos/linux-test-testbuild/pull-requests?create&sourceBranch=refs%2Fheads%2Fedma_upstream_prep_v5

without v5 change
https://bitbucket.sw.nxp.com/projects/IMX/repos/linux-test-testbuild/pull-requests?create&sourceBranch=refs%2Fheads%2Fedma_upstream_prep_v4

These 12 patches were first sets, which try to upstream. After finished
then upstream dts part. 
v5 need be wait for imx95 tapeout. 
----

Frank Li (12):
1   dmaengine: fsl-edma: clean up EXPORT_SYMBOL_GPL in fsl-edma-common.c
2   dmaengine: fsl-edma: clean up fsl_edma_irq_exit()
3   dmaengine: fsl-edma: transition from bool fields to bitmask flags in
     drvdata
4   dmaengine: fsl-edma: remove v3 from enum edma_version
5   dmaengine: fsl-edma: move common IRQ handler to common.c
6   dmaengine: fsl-edma: simply ATTR_DSIZE and ATTR_SSIZE by using ffs()
7   dmaengine: fsl-edma: refactor using devm_clk_get_enabled
8   dmaengine: fsl-edma: move clearing of register interrupt into
     setup_irq function
9   dmaengine: fsl-edma: refactor chan_name setup and safety
10  dmaengine: fsl-edma: move tcd into struct fsl_dma_chan
11  dmaengine: fsl-edma: integrate v3 support
12  dt-bindings: fsl-dma: fsl-edma: add edma3 compatible string

 .../devicetree/bindings/dma/fsl,edma.yaml     |  19 ++
 drivers/dma/Makefile                          |   6 +-
 drivers/dma/fsl-edma-common.c                 | 267 +++++++++++----
 drivers/dma/fsl-edma-common.h                 | 119 ++++++-
 drivers/dma/{fsl-edma.c => fsl-edma-main.c}   | 323 ++++++++++++++----
 drivers/dma/{mcf-edma.c => mcf-edma-main.c}   |  34 +-
 6 files changed, 578 insertions(+), 190 deletions(-)
 rename drivers/dma/{fsl-edma.c => fsl-edma-main.c} (62%)
 rename drivers/dma/{mcf-edma.c => mcf-edma-main.c} (91%)

-- 
2.34.1

