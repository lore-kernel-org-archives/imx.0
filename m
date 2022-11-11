Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60067.outbound.protection.outlook.com [40.107.6.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A2E24F2E
	for <imx@lists.linux.dev>; Fri, 11 Nov 2022 15:50:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsIRQcQAZ1a+Ji5/Ea+dbvM4sa23gjHoVHAaaYEhkcs+DtoNUnfPHj1doPZOfaK4v56/ZP8zoB1tfqTKvODBXDzcHyPgWKJmEMg/10UBFi6azzNTmNiqMGQUEmQO99zDwWf8wbZQnDrqiPCgi7xWTuw3FQunqlUSfr1gm9HaWjLiOr0ai+EGgxiPx+cGlya+Mu7ffhXFRNW5w/POa5VKE/t9coChLG8M16Qtq66lrb2mNKkU1J8uei7YOCf2OKHzTYUO0VLU3b2DKch7Bi9EPMn37QIeUbDvQ+4XMWpr289YTxKgdnr2rt1l6/hyJZBWjD8Jr54COrNHdAf/n1BWKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UevSxe+9hXcigtWg7ojcOtcASvZlkN99DAUECkZigv0=;
 b=MJVuHciJMnxxoKn/Qq+ictEf3YPkty3LKQG32G0CwW8g2Y+U/a+nmA5JdHLFmBQKX9cyRV03XRnKiTTdf5ML3BILZdpPyAHJnMU/Fzfenvmd6F2TERlgR5P/u1RVrXqBjN4SN0P5iBjne3+gunlX9I2YgsKiYxI2dPK/jqbcE2Y3fHqLqjbjNOaUV5FYdHZTQHh+P5Hkgg4unV/RdRA+QGiF3WNO31dfkCPFTLSsso9ltfgDXx0e9kae8eMJij36bMiuIFOz2m00tdCFArMPlEll4dWVS8T4kMuIwCwxKVZe8wMrxCrKkQSQyqJaJQc0rFCA/FOZXcTAF7ijamIZZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UevSxe+9hXcigtWg7ojcOtcASvZlkN99DAUECkZigv0=;
 b=HRYPlJ5nNPbWJ4bsG+IfTJWeq05Pv+tlYb43KhCwmovUCjLWJrC0Hcw8g/A+GCk2HIhvVtQPgg4vvmm1oMJWhR/M/y5hC1+MFtcjKHms/VmUFqXbTx9EvP5EgZjCoNoP8yb7SNHdbMO3QUGXSlvBr0M5kux0szuLHEUpZk4yKw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VE1PR04MB7342.eurprd04.prod.outlook.com (2603:10a6:800:1a0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 15:50:38 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::6b44:4677:ad1d:b33a]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::6b44:4677:ad1d:b33a%6]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 15:50:38 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH v5 0/3] gpio: add suspend/resume support for i.mx8x SoCs
Date: Fri, 11 Nov 2022 09:50:13 -0600
Message-Id: <20221111155016.434591-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::13) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|VE1PR04MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: de15d1b1-eb29-4b0c-1f7f-08dac3fc794f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	68mbckEe7WcLT5pVegoPY6LEijVkc81BOrFZ9gCDEJYyPISy1uxmXF+WcIZVW7HaTSbwhVcDob1B2zDrKVpCunBD/VQwS4IlEQG0MTvkLYmuOIuDOMb8sYTjFX2e90aaZo84wk8aFBw2lNHHKirlfwr/gJndLJtO/75ZYhak3eJ2QEQk33GwUCnsjV8PTcxYK+htIp22UCy2jKtcJiMdYzJZ97Ip+se865bPlyh2dm8gF7shvIhBCXOhB9jGcfAqn8Td3BWSHAdBWkmMP2DC/zgI1KDQcD9s5qIdIUkSP/5xreG4/WZ+iPitGONHpZmetfMiMxyBzQafwh6qKPZNtFQ42Gn6uYB2N5Om6R8KrU2a/Ha21gOEkS4Sd6MniwbIdEAvJ9efarf2o8xlAD3g/AykayZXhOyf3NdJuuyA+vxKp/7kOyelV6op8RaFoEhoT1TwfwoW5+q9Zr7GGRhdOoNsBytdCMkDRxChZzjXNoCarRC56qTpeXYC7IpnUlRIyiS4BAC6mwbtwpRhWKGfF6fM/nsZJxE5zZ4vSmoVRQi9n6zjruWmZM0ExMCVba/k98xEBmd60XCYQzMS8EUIJaijR68UsQzwxnSQdvyDJtBjgU6KW9O4X5xIR8hN6+bxGD5FZJ0C7+VWUGxjdqp88xWd/bIL6ObwkwWpkPSPlCMx6FSsQkgE9TWDiZWHkZywPKbIn/wJcKkG/GQ6miw2ezSfg2j1vQMim4RacZJo1W1WsHOHh6bgNxisp9lJ6xbPUYNpui5oZRMVq+4hsT3r9A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(6029001)(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(451199015)(38350700002)(38100700002)(66556008)(66476007)(4326008)(478600001)(6486002)(66946007)(5660300002)(41300700001)(7416002)(86362001)(8676002)(6666004)(54906003)(8936002)(316002)(186003)(1076003)(83380400001)(15650500001)(110136005)(2906002)(44832011)(2616005)(6506007)(6512007)(26005)(36756003)(55236004)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NWcthTYa6k8SR0uj/L8w5Gn6beDZNxoyrDV+MmE/QiHwqmCAcL7fgNkERm7i?=
 =?us-ascii?Q?C9PF7pwTmXM6I28ezctWzIrudwVutQUlHIVGfE7vghVMfMc96PdJtIcXYldt?=
 =?us-ascii?Q?SktrSTs1t9xomlZ6Iklk1V00bBVEPbe7Uf1jQaTPEo3G0gny7fEdVY4FulTH?=
 =?us-ascii?Q?7481gZqIIYmR/0njDv3tukuoalgbsmg6L6oUqWqznARVcQWyCHZWbSVkr5BH?=
 =?us-ascii?Q?32h+POoKrNwlfcVyqnwhOsFfQKEFPTNypkvamVm3AYyRdvSbtXFX0U7lOHpD?=
 =?us-ascii?Q?W7eIMW1LQDtiyvjPwy1Qtnsoq3DstHHO+YsR0mlv6XWItzOS6HO1lFbZsi9+?=
 =?us-ascii?Q?2cMiukT2vsxpI5euH9lrfr+YEgBWVw8G0tchMSqYZeNglbM5+oAk61L/3X54?=
 =?us-ascii?Q?8FVAQJNLDQ25FJm3DcYO5hvHbI9Uks+Ty0nDOU14FeOiof2M+JorlpSc2aOh?=
 =?us-ascii?Q?iBkPjDoPy+Y5mXa0TVSNiZkftwy1gZxjPmsaqQQtJgmcSnpQi8RYZQd1ZNMj?=
 =?us-ascii?Q?mnopXjm+06fwRaRLCIsSOy0PjijA4pu5q5S9jh7KOSS2qNGVCoNVe+euOw7M?=
 =?us-ascii?Q?R9cscXeTRw+qJae+wjBwli79LGeJhnJp76EpfWDowxP8+YOlEjRdvnkIvdOU?=
 =?us-ascii?Q?17grvp/+BzYhIpYs5UJftMuxGLdh5OjLhEcHS4VxMndYrQIFzinta1YhqXPP?=
 =?us-ascii?Q?zusPEcg95/d0iWCRnttOST1r3Ss/RLq6PL8AufR2JDI6CKQl7zmI49oCf8ji?=
 =?us-ascii?Q?S9I5k+JzoOSe1uIZvyThQA85WTpUhL34PsPtbCm7h3mXEVr8Vb3Yo+lFRxkg?=
 =?us-ascii?Q?ygRU/FQlkXj5AzEX9cESEPec+xaZ7PuNpLR1zQI2Tn3UPk8Rea9ZKf5yBPvo?=
 =?us-ascii?Q?xWj8kpZtLLP621uF3SPidBd5LzSK4BknD8lJLnbm5gda768sjyY41DLtdz9y?=
 =?us-ascii?Q?tYhCFeH+3sUskZEBqwE9AcLWM+1mvTU+iVL4o4U6fGQw7O+03CSK1q2GzP1C?=
 =?us-ascii?Q?ncJ14fYfX+Gx5h1gFTv/qr/j3JnvN6UQf+sVq+dblRtjJaUjT5YydcM0Ag6T?=
 =?us-ascii?Q?XiylB6bTc4J0sGJ52Cnb5QUtuUpujThj+Nh3b0JNufhCGdHELIXyj9walmQx?=
 =?us-ascii?Q?6HD3PHWg5nKvTM+ksW0UZui/e0RatyZxTsnsEcOgWWeXinjU7AxAff6QLXBX?=
 =?us-ascii?Q?Egz/oY5TzauqbWsTYwoc/fwnoRLHJC6QNm7PYvCoXersrXljHeoWoZyBh/xd?=
 =?us-ascii?Q?1SZ8lHgP4ibJqWVRRMoUw9hPSmoplwFAxjpTxezCn2napVm3BLfye5VZxuPA?=
 =?us-ascii?Q?kPOqtRUxX/Y5Y0rrwgCB6yPpPjIHUSoV8mW0ixecDHVfKZtjJ2ZBAKFoCbk7?=
 =?us-ascii?Q?q0aI40bPFlLBD884kxm2iAXa8sP1Q+C9OvWPmQEf5MyRwBOYRN7khascqjyP?=
 =?us-ascii?Q?Y7wug7cJvGTDiAF0l3fXBlIzbss2WhMAnI4lmCT/95U5LxzMhFVNc+xmUJPI?=
 =?us-ascii?Q?p10SSRFeJpZ5VzERHexKP1UKTFlgg9Z2DgN2BQdn9jPfbmu+SelQbjObJGUQ?=
 =?us-ascii?Q?SAeigEHwATK4sZI7ct3aUmtAlo/dBXsXI9J/dLlyX0M8hl7sjwM7ve0C/BY6?=
 =?us-ascii?Q?IQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de15d1b1-eb29-4b0c-1f7f-08dac3fc794f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 15:50:38.0305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9clY9BKjR9Ea91JlBxluHtw/Zf4gssHGnO3wKGygbiGqZVSGhZhiJPeknja9Mox8S5PXO4UYCvEF46dZwObMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7342

On i.MX8QM/QXP/DXL SoCs, even a GPIO is selected as the wakeup source,
the GPIO block will be powered off when system enters into suspend
state. This can greatly reduce the power consumption of suspend state
because the whole partition can be shutdown. This is called PAD wakeup
feature on i.MX8x platform.

This series of patches enable this wakeup feature on i.MX8QM/QXP/DXL
platforms.

Changes in v5:
 - improve the commit log per Fabio's feedback.
 - remove the two patches accepted by Linus Walleij

Changes in v4:
 - fixed the format issues reported by Peng Fan.
 - change the return type of mxc_gpio_generic_config, and limit the
   suspend/resume behavior changes only on i.MX8QM/QXP/DXL platform.

Changes in v3:
 - According to the feedback from Linus Walleij, the wakeup feature is
   moved to pinctrl driver, and the array of gpio-pin mapping is moved
   to gpio device node and initialized via gpio-ranges property.

Shenwei Wang (3):
  arm64: dts: imx8dxl-ss-lsio: add gpio-ranges property
  arm64: dts: imx8qm-ss-lsio: add gpio-ranges property
  arm64: dts: imx8qxp-ss-lsio: add gpio-ranges property

 .../boot/dts/freescale/imx8dxl-ss-lsio.dtsi   | 41 +++++++++++++++++++
 .../boot/dts/freescale/imx8qm-ss-lsio.dtsi    | 38 +++++++++++++++++
 .../boot/dts/freescale/imx8qxp-ss-lsio.dtsi   | 25 +++++++++++
 3 files changed, 104 insertions(+)

--
2.34.1

