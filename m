Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50060.outbound.protection.outlook.com [40.107.5.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A2F4A02
	for <imx@lists.linux.dev>; Mon, 22 Aug 2022 17:53:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYbivazgfJdho7jDqlDLCqDlz5TeuKPEUffNcDUXARztNbIGvx+nID3zMcnG6t628sF4kftcQ7Y2wfjOHsBEHMmo2Jwa6tfaaCPBC1yCJPs11QeOZxbkmZXi+tLQFm0EG0zL/sDeU8zyOKKMeZnk/KIRdAb38gwiNbztdwEc2s5T1evI7rgqgBpe/wEj8Ob6u+ePq0nGHtkESycGbOuqi7/JOBZq+qR4Z+0GE47KFFlHo6iRzutWe4nkmc38F2sGIAe49H5EU/i40zBbh37YvF+edbjVuMadH/sVaTLf0toC+UV1O5rioyI28+lhKyHbqD3S4P1r4KKI81T2WkgsHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NLgKQZfWf/wS079c6qxBLS6iyZijvU0NjroLS4TCok=;
 b=Nm7epbfYTrEKAv23r6M+x7NnDE9dV0g5crQu7PFNLajzY+PWsQKn5jZGnrJW5wWCxx69PgocXiOnEV6UwyAjPO94lbgr4bLfyqnjmZfkR9TG1eD4VAhRDwFs70F/eSOCP6JgAf49Ei+cymlWqbfTzD7XLuVTCU4GIxs01MzRKqTe+rz4EL+xdbDHsO24/I5x+Sx6UT/Qp4rgsFkC4riPT9PhnWQuoegn3Q5PHTC/Jf7uPBiy23btHs2VdicXi7Rl720f+ukPT3Vf3eItoUgo1jHypniC5zgcdrINYfaAAA3ZJKkK2KQolHJ7RAcoh1bZK4XIxxAQBoZk8uLvtJB6eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NLgKQZfWf/wS079c6qxBLS6iyZijvU0NjroLS4TCok=;
 b=QFOHItb6DUGGnnAuiSSZzIcB5H3dqX4CM1hMlMlRvozxkBi7V6E3emReExYvnZVqjLj0Uq949eUASoqamsFZekzwDMPk9PUnyn7NKTQLJigxZ8EUtziqpY+wppJRYChzJdF/sGkDBr77T3xf3h15ZqsKo/teQ7TZP00x5B0gJUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8274.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::23)
 by VI1PR0402MB3790.eurprd04.prod.outlook.com (2603:10a6:803:24::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 17:53:16 +0000
Received: from AM9PR04MB8274.eurprd04.prod.outlook.com
 ([fe80::747c:397f:a003:dbca]) by AM9PR04MB8274.eurprd04.prod.outlook.com
 ([fe80::747c:397f:a003:dbca%4]) with mapi id 15.20.5546.024; Mon, 22 Aug 2022
 17:53:16 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH v6 0/5] add imx8dxl evk support
Date: Mon, 22 Aug 2022 12:52:40 -0500
Message-Id: <20220822175245.222691-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0193.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::18) To AM9PR04MB8274.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e8::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb65bafb-0899-44ba-caae-08da8467307b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3790:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ih/fW6QFfxudYmGS72cOp3r0LyhLnLRG8gd6MzKMgpILT+5yRUWUWb2zBHOnliWEMUegFpIBdzgRIxpgBj0Zrc6ungpqLt60FqTdrqeVXWHWLILxiwoyn36L+BKPOkJm+01B6/hmvP5pLNf2JYhtkv/e9TIY5KpGQA4xHbGFiofxmkqpgJ1OZ/QTFVfckwL6qe2n8edDwPhZzXF3UPwgwBdN9RCRwsOnhKwga+zZrxOdCQdNKHLk0yW95RxF0zAkx4IRk7VvKvkkVIIdg/mBgMzyACCifxbyY6c9iYR6hOg3JD4wNxXKopZ+EbfOc+gZPS+DFW8+wnym7kFfDQXbwN/bktR7/RqXB8W6JRrMK6NDhFQpwelN+Qle2T8qiFNrrt0ie8XtBWprtLIybW2tWbbXiNU08HDzP5M6Zl3tBRG+7Dd2GY/KWH10v41UwAMetkYurpRH4sg27EUJdbTOGdtK0uy1z0Eacgep8Hm7h5HOQ2f+dW3EKWSRMcLJ9TKd8jNCu81F/N77RNdMPdeIBwN5MbWuOGcY5qsOeEtY6X7c+ELIxHI4bfm+uI/8YW4HCWClnF0mondraJyyBRXm2V/vnDPf2DFOuvzMSyCX5EXbSBV4IU5jcmRYyRZpEqmvFObEly24snk5trz/LDFRqqrCNKeAWX47QjUMtAQjKCGLTmSRou4QdxTQYuh7wIpLuub5xovzKSU8U6SBgQGWr/4LusY95f5wsVlE46MlUS4CU+3S8ZdxsDooQBzSO85+BU+HSjN+fc4bx2z1QMZyRz0zzLrBapJBAXky+/cwQAU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8274.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(36756003)(54906003)(2616005)(110136005)(186003)(1076003)(38100700002)(86362001)(83380400001)(38350700002)(6636002)(6486002)(316002)(4326008)(8676002)(41300700001)(66556008)(66476007)(66946007)(478600001)(2906002)(52116002)(55236004)(8936002)(26005)(6666004)(6506007)(44832011)(6512007)(5660300002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TJkEgJKEAGYVeRbnElG3Ig0LQTooLhoRuCcHGrKh4fw4N3o1LepnXRqH2dMq?=
 =?us-ascii?Q?cf9fcfoxToKh2f9W3ab+wHmuq+DGTXLwRlEaP9yyBN4oa1YGhTeRutw/LoQW?=
 =?us-ascii?Q?wipaOD4yB/s6e9oIrJn5uwoC+9QuPinvcI3VVuhNntva/AdipYKoglDX9bCv?=
 =?us-ascii?Q?HLm1jduItZGTkB7sg6iXd7xx5hjJSItg+3oZ9y9gPaU0eSIGrgvgghqEzMri?=
 =?us-ascii?Q?YLr2sJNKRJdpE5hSxNKJhP9ZfFd5pSKUhiLeY+ri8ZYXxMtDosyILh3IwiX/?=
 =?us-ascii?Q?Nbxebc4AsmeVo2th63CYewJiMlIXI+6P7yAfDjZH5nrfg1QTidVRaFswdGZD?=
 =?us-ascii?Q?fOdTfRJc1fpkBYbHt+SKfdnokuRfvuQuP0gREOcd/5BW+y7LB62If1lP/4Ik?=
 =?us-ascii?Q?XHYrc09UwdOthJ1VMmAtAduyYDUdcIANJPMhgWPsDa2blOM2bs2UeRezOwoo?=
 =?us-ascii?Q?LYJEAIAAisO5O8tZN0dawKzevb6ySLkkUEookQjFng9rg642hFiJQ8FlkzRL?=
 =?us-ascii?Q?pT1toULuQ5dVd4wZy6hfuAwC5XzibTaR891PX58H55kY+zDKr3uMAJ37hFDX?=
 =?us-ascii?Q?KxEJw0Fz6ylH4rr+wKRkhn31mdJhZsmyjZk8N02LkkCVkoZTUUPIa/po113a?=
 =?us-ascii?Q?+nuonxdJbewyLyvTQa3fDsX+OFedutLtRhkX9oIMS2mX72TKeK+muQZ5zr/a?=
 =?us-ascii?Q?wOQ1WDaK5oupffKFHTmdkCyiFx9Q7kb3WU/NFWwT8KRBaktSaVeLDRCnx8iD?=
 =?us-ascii?Q?C4Q2GdPJGOaTvfht7T8O3Ny7jmCEa4PmPLZbza2iNmnMkDJHdgQLu6iMB0qQ?=
 =?us-ascii?Q?1PdzA7+PtRzWBRdHVvvfMXVCPKqwga/chITy1ZJSTpXYySU//hK89tEoo+v2?=
 =?us-ascii?Q?EuZz9zFinA+e5zdQ065qggG+sODZNYHJDoGTFGDtWPXpc37sRx/Qt6gEoFLM?=
 =?us-ascii?Q?/2vk4G8a13wGueEbjDOgvhmJ+a51jCcvzPqpc7dfBVtJCFhVlQk7lPQs7RfG?=
 =?us-ascii?Q?w9Dc2QBopjcCM1cUK2xDw0SclUA80ZVj0SDaAw9ojAkBtQ96Gai/M5zTnO0J?=
 =?us-ascii?Q?CWyZMQpgkyFZ/l+hdT9LrRvCoXuNMokw3k78VLL54usoZyczD6hk9L9WjEqX?=
 =?us-ascii?Q?F5TVctfHP5v68fHEZOVFRLoBYfjxMbYSW587E27YDtfpQm41+haibPrt8AXN?=
 =?us-ascii?Q?cZwfU1jzq0rw9zlwNXm4Gqg4wgpwmEyRPQdZhX0eN4CUxkM46KLbTpDw88j7?=
 =?us-ascii?Q?PdefcsxYSIQMp2UKtY2o0e0jH2cMXg5Jvst+d3De6FDwan8fMpFb490TuR8M?=
 =?us-ascii?Q?YBqhDi9LYVYmAkn1l7goruavjC8YdO8bPaq6+gB6M+Y5v+EMgDYKjAI4Ostc?=
 =?us-ascii?Q?JYSpWn754C82UvgZ+p9dwDi7js9KSAtWm2tCEsttg5Y2aOLL7htr8rRONe3q?=
 =?us-ascii?Q?tSKfRS2XZvFGXbBBJKc5t0J2Ofz7JK2VRhPnv0HpGlgSG8U5nCde/N7KDhXD?=
 =?us-ascii?Q?f5ZyTfmRErDEVAxT3yTUld111bAf08jhau+oWHYmjHwZu4sC4FoPZzG/zIj4?=
 =?us-ascii?Q?wKgXeQs0BJL9UVL6DLtHtlDLXARddRKhszEx1QZtiYgosbm+cIYH0Gc4Bugi?=
 =?us-ascii?Q?vw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb65bafb-0899-44ba-caae-08da8467307b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8274.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 17:53:16.2058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +fhpNX6SiAcibUJYexZI+hjxtqKFnckLla8LQ6+f0XhaZ8wEX8Nff9H71N8iQdWbeXiYEeSItfrP6AffPaNVpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3790

i.MX8DXL is a device targeting the automotive and industrial market
segments. The chip is designed to achieve both high performance and
low power consumption. It has a dual (2x) Cortex-A35 processor.

The series of patches is to add the imx8dxl soc and its evk board
support.

changes in V6:
  - The V6 changes mainly respond to the comments from Shawn
  - Separate the V5 patch into SoC and Board commits
  - Remove the unnecessary properties of "max-frequency"
    in usdhc2 node
  - Remove the unnecessary properties of "clk_csr" in eqos node
  - Fix several coding style problems

changes in V5:
  - change the "scu" node name to "system-controller"
  - fix the typo in the comments for imx8dxl evk board

changes in V4:
  - move i2c/mmc/serial aliases from soc to board
  - correct the node names to follow the generic names recommendation
  - remove some unused nodes in the evk board dts

changes in V3:
  - re-order the commit sequence according to Krzysztof's feedback
  - correct the syntax and styple problems pointed by Krzysztof
    (Thank you for the detailed review, Krzysztof!)
  - remove the unused nodes in imx8dxl-evk.dts
  - dt_binding_check passed

Changes in V2:
  - removed the edma2 device node because the edma v3 driver hasn't been
    upstreamed yet.
  - removed the imx8dxl_cm4 alias to fix the compile error.
  - removed the extra blank lines at EOF.
  - dt_binding_check passed.

Shenwei Wang (5):
  dt-bindings: firmware: add missing resource IDs for imx8dxl
  dt-bindings: arm: imx: update fsl.yaml for imx8dxl
  arm64: dts: imx8: add a node label to ddr-pmu
  arm64: dts: freescale: add i.MX8DXL SoC support
  arm64: dts: freescale: add support for i.MX8DXL EVK board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../arm64/boot/dts/freescale/imx8-ss-ddr.dtsi |   2 +-
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 426 ++++++++++++++++++
 .../boot/dts/freescale/imx8dxl-ss-adma.dtsi   |  52 +++
 .../boot/dts/freescale/imx8dxl-ss-conn.dtsi   | 142 ++++++
 .../boot/dts/freescale/imx8dxl-ss-ddr.dtsi    |   9 +
 .../boot/dts/freescale/imx8dxl-ss-lsio.dtsi   |  74 +++
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi    | 238 ++++++++++
 include/dt-bindings/firmware/imx/rsrc.h       |   7 +
 10 files changed, 956 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-lsio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl.dtsi

--
2.25.1

