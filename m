Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2051.outbound.protection.outlook.com [40.107.8.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F367E101D9
	for <imx@lists.linux.dev>; Wed, 17 May 2023 16:09:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pp9nW4U2Oeo1mxK7il9Vi4JEnzRS1bLpnSRjNXfmDOPj506cCAFqdRz6Ls5FCw5XeQ5XsT9d8//FZdsZVmM24JQExXVJ4t2JiXMZgt8nlg7ffJ0Zcn/8Lhj8PXrUmrdM5zsT195Ge9xxwCB8AKX+ELsV8U3sYNj+S9VLRdVgQrXgYccnm4rcjXjDNyvO6QHMQ1ITGNIqx4RO4pdbIFN35ug0oB5ZSIoZGrtfc0+MpWXJcseay97uaAdIB0kbv93q18LqIZJBiS5a2y4GBpH73X94xtVCpoOLKE/lld0RSSKywqZ+Nl331pXAY66w2oDd3wdtBc5sTGahuN6+CVvwew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlR8Qkf5Wrp2mGfLry5sjLsLCFStN1g9lw5/lrPxWuM=;
 b=gnjnLGm8iwD3ZMdzAvEubXQP/iXjpfYm4jjr243Aws7axZK3LjcITmWqYO4OosGCHdAsaxzVZxtwtIom9AoJZfPBnL9Ks31Qje4HGQgkp642PJSoBpQoS3Uw2BE0cb3LhCVU97d+bxy53dLygv+okUzEEieVXX9E8sm4uKmtPvHr6KG6lP6PGneOWBtdSaLUuCHjhpo/W15Nw8If7MleIQii30XgKs/ho+mZ/qzd9o2PYSWM/P0wQK1UTFv5tgU5cYBXmZIu5oEissFr9e3BhNp+37L3Np0XWH9S1QXYW01irZn2ULUJ8D/4A8Ldn+oE306pTBVU8ycSsJ3T/LRPFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlR8Qkf5Wrp2mGfLry5sjLsLCFStN1g9lw5/lrPxWuM=;
 b=ramfaX7NGDJQ+75AhWtq9NFCTVWM/fMgHjG6f9SHyfpUDfuCHZ6FAccNvZGrwg4FoodSuc5lPR17Cc8rS0kmIW3CA/8MNFosnHr2FkaPnSNSryBWtoZLBC2K7UtHFqQx6xyoKutGmnqIrs0aYw+Pk+lKupx/7gOk1QA2I8W9P38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DBAPR04MB7478.eurprd04.prod.outlook.com (2603:10a6:10:1b3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 16:08:56 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::28fb:82ec:7a6:62f3]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::28fb:82ec:7a6:62f3%5]) with mapi id 15.20.6387.034; Wed, 17 May 2023
 16:08:55 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH] arm64: dts: imx: correct GPIOs for USDHC2 CD and WP signals
Date: Wed, 17 May 2023 11:08:40 -0500
Message-Id: <20230517160840.1862018-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0166.namprd05.prod.outlook.com
 (2603:10b6:a03:339::21) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DBAPR04MB7478:EE_
X-MS-Office365-Filtering-Correlation-Id: ae939190-5241-4499-9e8e-08db56f10406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FgLrfJtQfKQyxtfQDwOEQKluBfTUaEZzGDkf+B+d/75SNgrWh9ejblU80+QXZdQ4deBYwze8tLbygOu2MCJ11dUx04UFv24XXpP5BDneLfa6MxoyhlYWDXm3OKMsqPcErjgzZCNBlzLKzE+7b3x/IjG1YpQZVF3C7Dx7zbXnlDTtNJbRI0pWKsegCGujzZU+BDo4aF+/UZ6MBI0FNH4UEMPCk0i5UeGhssqBwIDI4ZcYCK0Vo5HP/BTa+mT4Nw+sSEZvXMhxjnNlBsvrmYvhQ0Aq+AnMtMx+a2YM6+c6WBkVRZzWuNtOG2V9B2SFd+ZSNcbMjeM8N97ZPd5kcIJ7SFEfI/mxnqDc3aDcrIUE0EdYFDPBHNTiw7yAkpN6gk23zpTViR7FEep6DfFfFGuKZ7ZY0Nr0OouzWiD4BkJYdISibEyeZUYynEASvfUHvg9OzURxDaw6j5x4iaDEX7svVEMobeVOprH19af/SjQLbsFb/COfk9zp4mez5P5uLH6ezV8nockszpWj26xXXJfUwuTosD4O4FipzdPhg1+IKaljpVmEkm6GwI0JmH1mzujjiNab54zCIYBvkY60MBX+QFlugg//jv9h1LrgtMmgcg8OrvtLTJYKqQMnrwSPQ25p
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(451199021)(38100700002)(41300700001)(8676002)(7416002)(5660300002)(4744005)(8936002)(2906002)(36756003)(316002)(86362001)(4326008)(66556008)(38350700002)(66946007)(66476007)(83380400001)(186003)(55236004)(6512007)(1076003)(26005)(6506007)(44832011)(478600001)(52116002)(6666004)(2616005)(110136005)(6486002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?of2NUJqHeQp8KfZCougH1lUDildO0WPaAxYgw5Q3677jHjR/sUaBH390I4KU?=
 =?us-ascii?Q?wj20eGArFIhCaKObbueRrOjKKYwY2tSju/nVMzyUvO9IRsP0kXSgQvkdlz8Y?=
 =?us-ascii?Q?IEPJGUlRkIfUinH5yw+I3JnppKZQ1jQuPCgEk4TRtEzwe8Lvw3acwDXgxmOM?=
 =?us-ascii?Q?IT9PXvMkB46yZRJnZkaniS5vTb0cDajnMPyJ14Z0IJELnZ8WNjQRrfIW6uXJ?=
 =?us-ascii?Q?cnTc8gVm9jutdT3jP1VN3hMtZ4wz0P+gUYMCSKI3OoFLO5PA6+jq2Gm7bl3T?=
 =?us-ascii?Q?ljan6SJZ/KgRrIGIiqpGvZ0UKko4vgPbsvTMIH4C/c7vvoGyckWFLua0ua3F?=
 =?us-ascii?Q?IInUDBZAyGrhAaDvKQiz7cDj7ovoXloL3ZG6WawBpJU+Vox+Glizu2OOMaFo?=
 =?us-ascii?Q?b0+R76i9UCqgUGQCbTK7ob+o0rF/W0LhOk0tNxDBqR5r3+ID0/ncHcCPBKxc?=
 =?us-ascii?Q?0nkj7wqPtusTc2U82dfOIQR3DrT9czxJzed0IIjHpgOFETDzJeNJeoJThaYL?=
 =?us-ascii?Q?jsME956aHamTwwvKQjZywku3vn/gtFwighHKYG0JuRIC8akGXxuT+Gb+enW/?=
 =?us-ascii?Q?17wNgaZZZcjR9yeJ+xe2LpL0AdfMiXYmV38bs7xD3A5h37/e95Pti9jsh0yQ?=
 =?us-ascii?Q?5JEAVCkUlfawFFnx1FZvRgijvdioy30sqSVQRMNHltdgv1MiBsmuMy9cXKuQ?=
 =?us-ascii?Q?0XuPq9Q7sZd7Hrm/BnGUBxt44Q++HLOehRFZjUTyDOxNY9NBR6eTRxhIhmmX?=
 =?us-ascii?Q?WPFUHAui3Om1krtDwGavfddIixXPg4q8Nik+tPRJNQdmLcgfMgFlDComh5dv?=
 =?us-ascii?Q?7v8jSvUEI0+RZ1AI1HgDZV3aOeLcBq1mfX9eWAcbjDvouKmCtDRSbBnVWux+?=
 =?us-ascii?Q?HJxhhupVCd20GhwyCVK+6ZTILMW5FZ0vYcK33E4XRIcktoZYDSDafg6CIGgF?=
 =?us-ascii?Q?UPiNC/ijIuL60cGwhXpKNkVf53ZL2MPTY7ZcQJ+/Zr3/WfCVUM9dqP46OzGi?=
 =?us-ascii?Q?RR8+MR12KrNljFkIhyZJFDnEkcGJeAJ/UZHlNUiX4w48qOdkOVaRu7sNhgCJ?=
 =?us-ascii?Q?FYrdZlI5ukqmphjYToaX0oPPWl1bWLymp0HzUGMR+/E1o5BO0GnQ7/oLpNfN?=
 =?us-ascii?Q?uhuViBcxggrjDKC9nVN4wYTrME9KIJKe2Wkdy2YS37HPsnHf5/q0Kc0wHRbX?=
 =?us-ascii?Q?ETksL2yWy//Q/bzIRKJ5yqCM49dXUGNHFGTfT4brj00D3pEdJr3Je2kc1LKU?=
 =?us-ascii?Q?Lt5xrVoGcs+DeFkJ6HGMCe1BvYZEDd7DAGP8sxeLC1fXUSpjQdeD0XEccTK7?=
 =?us-ascii?Q?DYD1yr2va3I8nobpNKxzZ9ejZLcAB2GBliri06nQDyncBu7K9ywuZJGTGJ1X?=
 =?us-ascii?Q?5k1xEbcKJjxcp5BFIzyoja+8fdTx7xWhHyWVG6y7NEYfzFg4tJ73pN8aIlMM?=
 =?us-ascii?Q?hqAomZJsms8/wy4hqw54dUmpMBXxLuJV+DPGQjVPgiKqVGVKKWIVfltXKyyj?=
 =?us-ascii?Q?hFJWcnX23jlZlQRf0S72Bwp+IvRjeJtBpwq9uHCpYnYmOaLn2cHDKxDEz97t?=
 =?us-ascii?Q?WyVZhJSgEsB9KpJ4xnop4WithTNTWY3tFnXHntmL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae939190-5241-4499-9e8e-08db56f10406
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 16:08:55.9000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZPRwYZI+l0M6ZSXeRQLytMjwHUmQWGMZA9n0GW3XpzcL58TjAdCpnuXWJDbex2j8U217qAuP1GS0i02HTPayg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7478

The USDHC2 CD and WP sginal should be on LSIO_GPIO5.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index ce9d3f0b98fc..607cd6b4e972 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -82,8 +82,8 @@ &usdhc2 {
 	pinctrl-0 = <&pinctrl_usdhc2>;
 	bus-width = <4>;
 	vmmc-supply = <&reg_usdhc2_vmmc>;
-	cd-gpios = <&lsio_gpio4 22 GPIO_ACTIVE_LOW>;
-	wp-gpios = <&lsio_gpio4 21 GPIO_ACTIVE_HIGH>;
+	cd-gpios = <&lsio_gpio5 22 GPIO_ACTIVE_LOW>;
+	wp-gpios = <&lsio_gpio5 21 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
-- 
2.34.1

