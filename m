Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2059.outbound.protection.outlook.com [40.107.13.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A794157E87
	for <imx@lists.linux.dev>; Mon, 29 Jan 2024 21:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.13.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706563142; cv=fail; b=VeG0SHVgznvJ0JsU4vqaq6keV608l23ZTz2u8n8q8QOQUbgGlK+DrW6afmmyeBt5yaU/xHO56NfMnMaYUk5NXke9qPviMuh9dUkGBWuHP4QShQfd5cuYJ2AQuynUUtXrkcx9hkYyVrN591S5u+2oaNqiZEfnoKzS+J+335RAf1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706563142; c=relaxed/simple;
	bh=+t2NgVq3Ry3y0PJtCBGMr9s7CKtyEuoDWCJUKvezaE8=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GiKs8kcAIheXxEDtTj3XL9aZdGKdbyWZ2ZzHuARdfll30/KAM3SfpLNB52Z0kYtbSoZC2ivcgfo/EK79a4VRyWdnt/Qc+2FB6/PThbhTD7Vi9rmi75M0QtwSE2Ev0B0Bf7yhbfnUuH8c3itLTXdCENr0xyG17JPuLKvq7jYa7lw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=lmwy6xkP; arc=fail smtp.client-ip=40.107.13.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="lmwy6xkP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUcBFimHtRvOXGXPu0Pw3LT8a6spsKXEXh8Bd7jcSF30IQqxP1r2YsHa8wb+tRTMl07OdMSxHB2cvayUS3RJgBKijdJ2PGNPXOatG2xZKWPWD5VZ5aPhvgpKNhxB4ZZjx5/mRUqCreOrUcRMe7D8WWE7oiMmUVoTrbgSEFaGIUn8P5B8oTkiQC9JCEMwmhcdp898eRsv7AkCbicvsGGr9dKymvKP3gQ2WKCIlgSrIGElDj3SR+VkUP7ki3YHjwDWw7YrgEBMk16amd+0F54V3x8iAEv7urfkjNM04FAFm62kSWFs/xrWts4q5hSSpylPUFjfeZZFUaYltis1D5NOAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xmuv/jdSW9SgkuF9t4iXaBO44oDoUOemK5yrJfeY+E4=;
 b=QOHwpRv3/8wRcCwr8JdYjBxfAFudBy+GM2sJNR+T4JKYTUJoImZaWeGc1VZdwwAHXxwh494w4MR5ynw+xr8x10E+bGh0u3RLM+RvoG+WUz+XScMOP9aKzSMV3K/RTJbu4C7nxlcEc30dmaUincbmay3XQPqJEM/g/Jqx82oFLG6zsBI1nV2OoW6gHQoYD+y/yHgKhsijtXg5anp9FmQnk61qx1fgAlwg0VGTlVFY6lqn0/tdgCAEEUZrvFC225KDCmy1iVgfvCpUJQnnbI/KEjnjpZp+iUyfyZ1hkC0s9c3s+vzcN/V1cdq0hCbF5aKTFcrJDnc5hZe0qUywZa09sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xmuv/jdSW9SgkuF9t4iXaBO44oDoUOemK5yrJfeY+E4=;
 b=lmwy6xkPPcCheu2q21tDP4cqRBQ8ylsgnb1CUytY7HSguSmWmwRsSiyu8wiavO/1UNboxpASxwINPzLiwUoxuATq/0gnN2IEHMYX1lLHwZyAT09d75v3OYTtWX3BGqKK5tXFJIQ1ix+MCMszB/E0d0S4ODZbs0udSZS3FlTVuQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9064.eurprd04.prod.outlook.com (2603:10a6:20b:447::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Mon, 29 Jan
 2024 21:18:57 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::c8b4:5648:8948:e85c]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::c8b4:5648:8948:e85c%3]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 21:18:56 +0000
From: Frank Li <Frank.Li@nxp.com>
To: ulf.hansson@linaro.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	wei.fang@nxp.com,
	shenwei.wang@nxp.com,
	xiaoning.wang@nxp.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	imx@lists.linux.dev
Subject: [PATCH 1/4] dt-bindings: mmc: fsl-imx-esdhc: add iommus property
Date: Mon, 29 Jan 2024 16:18:34 -0500
Message-Id: <20240129211837.239683-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0170.namprd04.prod.outlook.com
 (2603:10b6:806:125::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: 24b0659e-1900-43a2-a562-08dc210fe711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AUt5rSsBOnHV33uZ7qCdiHqY17cg63U2IHM8SiVK35Ya/yO8t7JqijHySlBDubw5aPv7KwetPd/fhA4XS97SwegH5NdfxEDjRVAvggKlV5gwBOdJJQbeTVlxGuoMA+z/oIhB27ei6nbEVSQbaOZi6VzFavhMXxRt4dHTSanNfrBg9udqelyEl6zKyAU2VPRMdxUG8MrJg+rdYDr1qJQHht8/b//+tMaxb8BTj8wDM+/32pKhnKvFInyGVLfL1OEkYwiyZjwjITfaEkm7Mfs14p8T4fg7C6yGlu/NimbROTXNazVO4adgrS25l8ONpxsV2k9+qZx/oJEPPadpH724SSvFS6ReQW/SwdFiQlUzp2z6HKgIs5HjwVzasti/xuJe/UO48dx79yhIWzDkk6u/do9bAIX/eNTFMVOfbT52Qpct5icKqJN+qibsgQ9h6/tSgm0Ueq7SeC09Z5/0xU5nV9qgB5XGRSf3BY0KMCRkIkmE3Z7HbM0cTxVGiB5C3C2mCOuzap7+OtddJD9gtHZmW5dfqekyG6qScVt1XZwwk+v4yMmgefJBAwSzfKTGalqd90K3dMMnh7eaI9Rlozqr9c/JiqKZ2lNSNfFMhh/IVqhXBYyr3XCF1peTFfRMADGXrAKeNVGuxGtpZ6/MlnWfjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(26005)(1076003)(2616005)(41300700001)(921011)(38350700005)(316002)(36756003)(6512007)(478600001)(52116002)(6506007)(6486002)(6666004)(38100700002)(66556008)(66476007)(7416002)(4744005)(5660300002)(2906002)(86362001)(66946007)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1TY+dIDhGI8MKpZXoGjWDPtsEvndYqtmuTA1VnIrsfYUryy7LHT9ti2XUSFl?=
 =?us-ascii?Q?e46lZClbq1DR33h4S1bKmMK2NPdttmViKjQZ5SmEjV1hLqbWO9mdKPF2BZQa?=
 =?us-ascii?Q?DZmIx7kd5tol6XR5S+QhN+9P1g+rcfPn/TISftKiTkVl2DLbMNyur3IFBSNh?=
 =?us-ascii?Q?8w0Gd+5tY5L8fg7Z9uiQ3haKnpR5EOPKx+rJPNJz0smDEGlp6tNYBHl0sawG?=
 =?us-ascii?Q?jyZQ9rWQD8xxFlSUSJYelfnX220I47u1zkHnAkjlMF9JH8iXBjQhFvM5ygb3?=
 =?us-ascii?Q?wYLnweI9AXLXJCO6TW0dKxh4qry7+B17+CBUdqFwlasN94iTF93qcfjp9XY9?=
 =?us-ascii?Q?0fJdkybwgu8Nc+8XvyFK6Z5HUZwe7skrXDreSCLADsd0qA+z7Yc79WN0lFfk?=
 =?us-ascii?Q?eT7nhRoB2s2QedHg7YIxyAMiMcz/V0WrfYX8nUvLF4xufiYOh1LDVl7yo4rj?=
 =?us-ascii?Q?G0/X0IOItIZ/k9hSteaT5RIvs5go1VCCV/HuZazSJgw3+NcNFiLp7peTQJle?=
 =?us-ascii?Q?hkVrVbQcjlDTItNou9jrfJEz4nUciAcf84W84Gb1Y8cYFZWg2grK3ot+W1Lu?=
 =?us-ascii?Q?qB4EJZQEKyWmTZ7NReL84urB8p1wu0ZpWNKL4R8xxUWD/9xTrf4kfAhlmbMs?=
 =?us-ascii?Q?P1+wOXi8/YL4Fc09vtg0PQsdq+hWItIX2FDzw99oYopM33v6pu146WIFFrAz?=
 =?us-ascii?Q?nHRiVOERuG7VxOhdv6PMGh3k+yhaq3ZXEX3a+izoINmna2sFtRRHyp9Yqgat?=
 =?us-ascii?Q?kkESLnJXBXCmTq+1ClW4HkLW9+NFqwXtRX5MLbXxZ31CjJVqWp0RpKm2gufH?=
 =?us-ascii?Q?bbZ8Av4sVzAHm/xUqTkKJy9JIljXI19bGr/Kkq5ukO95qyIm9dHrL2iJBLQ+?=
 =?us-ascii?Q?wzk1v0h8XSWQHzoEbLLUz/9nDYaday41s9f4lkxAAw20jm+iyYmKs1wSARuE?=
 =?us-ascii?Q?xs9ZPOfv+qT1kWK2Z+zfB8Y3czLUZFXTzdKU3q1M269+OLoNCYkvH/kol5vh?=
 =?us-ascii?Q?RgCowAXBCyJ/BvmI16HbCIdVw8qVTwOclfzHtwzBLelzFLsDIHSf4pHUuYG9?=
 =?us-ascii?Q?X/ep3nZuQpS37rmF9Vo2T6C5SxQhkgePCnAMMxhcj92m3ezl9ORJ/woMO0ic?=
 =?us-ascii?Q?+qilKJSilX/KYiDhfPIdyDyRgS0iZl7X8WjpihxtAmezXKCC+qhrbkDGKLAK?=
 =?us-ascii?Q?TNMHN8T564sV3ooXrPEos1Uj71wjFqhLTqEVf0AnYGDg8mSGQFXzM2OOGUTV?=
 =?us-ascii?Q?b4Z+rKO25dcUUVDF0XP1Ieukf8hPHoB22hWUKLMiDP5rX3IhUawusfkdNKIC?=
 =?us-ascii?Q?tTT7NiNL9XOi1svBsZ75wSxVasQgzGDrz4xh5TkL+H5aHc/CE9rc4xWU2Dft?=
 =?us-ascii?Q?6l9vgcTqKq5y3YJHkHz0tE9aClq/WWo7YtMdlWaMHnKLzZ5yzVTJ7MxazA9L?=
 =?us-ascii?Q?41NuXbpDyTYmJiVmyGNXmLZK0WJsMiC+SziXNHIiTV13Ke2JhRDmCb5VM78q?=
 =?us-ascii?Q?CQNZ1eIbPYWcfhj+eXDYVLIJ3Oht5kZnrS2ShDzzx3PtR31icimUvcTiN46S?=
 =?us-ascii?Q?E/ejjvwMdo1v/g6yG50=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b0659e-1900-43a2-a562-08dc210fe711
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 21:18:56.7969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /uzvz0wGczX++9N3dRwzne4emkFcA7VE4siMmT3pRFCsG5oyKShdY2toAVJfhWoBFv97tYKgiNJeZ4cH1Jv9Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9064

iMX95 and iMX8QM have smmu. Add property "iommus".

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
index 82eb7a24c8578..0d8ed9d055ffe 100644
--- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
+++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
@@ -162,6 +162,9 @@ properties:
       - const: ahb
       - const: per
 
+  iommus:
+    maxItems: 1
+
   power-domains:
     maxItems: 1
 
-- 
2.34.1

