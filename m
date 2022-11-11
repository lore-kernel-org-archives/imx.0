Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60066.outbound.protection.outlook.com [40.107.6.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB73624F2E
	for <imx@lists.linux.dev>; Fri, 11 Nov 2022 15:51:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uio7mLMm5H/cnBxWnswNDNIV5z/4Y5/p2WbfURlCCfS1WTUkVHHQH//E7l6+IFZwclcQEMqyNeDIq7Bq2e6L5ZXyrmPO+7ZrKg6rf+fab238MpWOiGQ941+GbeZsXa49Th/ARQlOmk+LhdpYMOkITsoS1Ig9rfnqXSNsWwO9ll4Juno4FLoNeMsbYGKC3GTXuaBjgEYdPQz820FG0ZBmJafImZA0DReLoYw8SSBl/WE22NkI98C/w/KR6HavgT3eMDMn4/A8HCZ3q1XuBV5UjgF+6dKvHZXcXcYq6tuNVQwYtWtvBREc03FylPkqRGNsOOtOQ5OETb8zlr01oaD/Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fwi4znr6WRUMdIdIGzyyqVbMbsDzsFH2WItrIUdizSg=;
 b=aEYazTZSbX85xHNdsmRdngyEGfnRJ4bftytqjk23CGyYzJwQ+iUOD+q3uWwq4/dR62ctcSeTdocmFD2btHVSBrZ106FeM2VHNHtY6vIUQhvjZfvl4kzmfCrMIgdTFnamSg+O0Bvz3yJNkZmiDBf4do5nuDeOcDKXp7jU+KGm20GbMphEdDFg2LoM9edB4tAPm1zvm/9sgqM99AFYhvc2N5ftTgwUiSLnEGMvBjw4smeQkPtU09V4IScjDcebPUDtYoHUfgDs/OY4uI+6rz85eNQSAamgrk4BEl0wyVb+9QT5X74zWuwcO+/aBC2ur8HC+kIsczD415FtUai3Bft9MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fwi4znr6WRUMdIdIGzyyqVbMbsDzsFH2WItrIUdizSg=;
 b=l49k0aNjmgNzo8qdDB/g21TwfAmyXA5L+i856XjfflpjvU5b3UgeMAO+oyHYXHR8By+8P5y+yfbuIUFW75z8T9BSwJvdmbja7GWFKHj8/WdYiw3gZV6g41kraHcgS68eZbQWSkdq0uJ/wTqEQWxrtxYsRKwwW8qW7GWdj8eSYu4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VE1PR04MB7342.eurprd04.prod.outlook.com (2603:10a6:800:1a0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 15:50:58 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::6b44:4677:ad1d:b33a]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::6b44:4677:ad1d:b33a%6]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 15:50:58 +0000
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
Subject: [PATCH v5 3/3] arm64: dts: imx8qxp-ss-lsio: add gpio-ranges property
Date: Fri, 11 Nov 2022 09:50:16 -0600
Message-Id: <20221111155016.434591-4-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111155016.434591-1-shenwei.wang@nxp.com>
References: <20221111155016.434591-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:254::30) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|VE1PR04MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: 86e55aa0-00bc-45b5-c60a-08dac3fc8653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sylaSwVEHOyxY448nH6dO/kpi7gQMlVodBtVTtMGU8Zdp0yev5VlcfslysPd1ctnSA1NHLGyzf7/2+hPvoPcBGFWaLiW41NFl5xEzxSBDo1YtP8qtveSUNSSISB4gy2N9PV7sd2ipS932IqeWcmxE36vWA+B4Ku4QL6HIiHku8mmUqzbst9DbzFdOIl6DBO9l5YcNCMun/a6JdU1g75SBraE+r9935M4qCuMTS4hKxVcRNCBd3KvhugUNUp3pC1YZSlm+Ufltne0mHOPCWorXFNB5q0RouN8FHJzg1ZGrkPbunyDkJLKSuw6tgE6nNeK2Rdj1sXsBbohLltmesnc9QHnYXAAivCkNmhOX+ATyG/GoXMuy6s2/9xVbJe0i4d6J2KHzMT6zIhuc03kJFljhaYr43fwH6utCrK3pbk2plh7OLjocQLDeui/P9W+lkQZ5oTMBZ8udDpftz14q6X+VvFa7UK/ebmGFVh1gzMEc5rCIC5PmQL0GYng0pPoy3doKhzUcaSSXgNsXwNUZqhWQYcCtG273PCg6KIipsxhiSgm7muLuL1dHtRIVV6FchskYvKYznQ57vFTI3ugT7zqdZJjnR/XmQGjpQBiFUC6hC9jSBrZ7sdmu8+iu5Fnc2f3F+ye2Z586yGA8WIjpYzxRsKP0GwyHi6fiPj5+IX8A+QxC9qDARPSPdW74NrKkZo7sluGElOBh6u3D4WRU26k1BZfwj3VaHSkZo6nlGF0ZIyJvlldmD7awulbRkvp3r/TyovXZN5OM09FH75QMBAtmYWBrVuYv4YDopQ9FZdRov0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(451199015)(38350700002)(38100700002)(66556008)(66476007)(4326008)(478600001)(6486002)(66946007)(5660300002)(41300700001)(7416002)(86362001)(8676002)(6666004)(54906003)(8936002)(316002)(186003)(1076003)(110136005)(2906002)(44832011)(2616005)(6506007)(6512007)(26005)(36756003)(55236004)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/JQHLyaQf09S5HpYZbtXJ9tW/eR9J7aggX/6q+aa/ytyMgKdfkCm7qap0YeP?=
 =?us-ascii?Q?0ODV6NIA4Y+SXmlHPzQNiJnH0zmhGSLOTcyfON7IVHk5NsA+ABXRD0piOUMP?=
 =?us-ascii?Q?7w4bz6VX2cBxqLMTaag4oK0idNNmqXL/ZF0QxLRCHXEQUhs1nRFu98d3nlXG?=
 =?us-ascii?Q?4fmvqOY8uduaF26xSapSzwxjb7CBEVxknATLCF1dnMZe9Ov9+EQYvSgDr7u1?=
 =?us-ascii?Q?VyeLgMs6ojn+WyT9IE6NBLD/EB7ZXfKd1GYY4N13Ct4fi4iTuaKMJsmac/DM?=
 =?us-ascii?Q?WDJ6x9LMOFyGLwD5PJ/h1NIXze5s+gdhMlMCybbXSn0ZTJvSjOCQK6Hfnj/D?=
 =?us-ascii?Q?dzXtyxQFpQxbZlJy8UlMia2Z4ku8KeaarZu9tCcSyS1tXBRteGttTe0TwrEL?=
 =?us-ascii?Q?DRo/5L46mSluhWlPFelMBr+u8Y9znUER6QOlDMpq5Sr0Yrz68vX8siyclYuX?=
 =?us-ascii?Q?5prjtysVjLovfhRnf7xFK/qbCDB5Vhohxu4Um1Z/ypYl1yRMPXXn+zgVBQuR?=
 =?us-ascii?Q?7hBWfRUu7KVCHLTcB+BHWoxd1yKUM6Rf/Woc07lh4m+r7aT/hVWMT9HJrMmJ?=
 =?us-ascii?Q?k9MmtB/Gy1tJ/d+MuAm4Vwz7YN+MJ7GJ5gxUTzqCZjBBGd0x31py+iDZ8hWA?=
 =?us-ascii?Q?k5mWFQvv+Gh+LHXCuBchQ5sIWB4050PLXdqiIg3/cbgm8TmkGgqRx3ekay4H?=
 =?us-ascii?Q?GdxQw4x5p+Giw6SSd5AKzcks44XHweySQMR117IR2jA/dgn1XS9W1yAAS7Bj?=
 =?us-ascii?Q?Qylbt/sXIalBeQvAbvAGgs5OdMmtFI7/xWTz4FOnurXTzfbRWp0Zygu7gfv0?=
 =?us-ascii?Q?ZTq68EIeIiDJen746Qd+gkxYFP/zqfqRI2lDzvhqxY9Hy0l1Cgr54rZfp4fj?=
 =?us-ascii?Q?73tjx8qHhBdgRykxgNMCoIaxpGatK7IMDCSRHfXwjTkBUvyBLB/mbduCDlIk?=
 =?us-ascii?Q?a3skpJ/n/VcB+72+5Dia7v5XDxaNrZ5hoMcGsrVwslSl4AfLcZpL1uwElpiG?=
 =?us-ascii?Q?OPuw9wDoeJWdESuvlnAo7PUJs7l1Vtj20ppEYn2aOM16MTW0g3nKm3jgQxna?=
 =?us-ascii?Q?GmAiWJgVJ8B+oavVwwSgr93PwYeyaTGlm6O7nLRJmzupsX91LdgFCC4mrHiK?=
 =?us-ascii?Q?OT0rD5z0zbgFAzQxZUIBB9JK99FQffyU3dlOjMfFDS1BUmO7IlzvOwb2cycs?=
 =?us-ascii?Q?VTFsvoJHKCg8cz9LNK3xx+K0Lx1HgJ6uXeikQijyFSKig+gZDyDLZpqQ/hjb?=
 =?us-ascii?Q?BgtBkw5AmS/F4s/NKwIqbvYihqwa8M3RdMVwSJmbfihVQEIaZvCfWZ2yLeSG?=
 =?us-ascii?Q?LinFVddcgTQkjDGYiAUkQY7BII54URTDhL48Mia3JV8N1NuaV+SshiZpAKfU?=
 =?us-ascii?Q?ICa6GiwHYD7twmldxGFEXxIAp+XpA04Jxxg81dyoirmqEpn/TmZy3SMyReSQ?=
 =?us-ascii?Q?cvifnyBr18DLQ75CermKbxSClaO7emeVVB3kHl82OeHw4VPvCe3yTNqpo3II?=
 =?us-ascii?Q?nsLG71VnywCgS+QzGCyWnJHjt2Awjw20XxeLQk7A1ZaUEa2K5DHQlYjrzJW6?=
 =?us-ascii?Q?EKY8WRuiY3lvBP9emvYVwhtLmRJCzl5PEJlEZmxy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e55aa0-00bc-45b5-c60a-08dac3fc8653
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 15:50:58.1502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZwxeVFg+XS+GOH42cBG5dNjjogCf0dm+8TqB5bs+JtA/VCn6Y50UIdImUe2339w8s39XuNI3U+HKI0nB7jGfaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7342

add gpio-ranges property for imx8qxp soc.

This gpio-range is used to record which GPIOs correspond to which pins on
which pin controllers. The GPIO to PIN mapping will be referenced by the
pad wakeup function in GPIO-MXC driver.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 .../boot/dts/freescale/imx8qxp-ss-lsio.dtsi   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi
index 8e2152c6eb88..8f722b1dd078 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi
@@ -6,26 +6,51 @@
 
 &lsio_gpio0 {
 	compatible = "fsl,imx8qxp-gpio", "fsl,imx35-gpio";
+	gpio-ranges = <&iomuxc 1 56 12>,
+		      <&iomuxc 13 69 4>,
+		      <&iomuxc 19 75 4>,
+		      <&iomuxc 24 80 1>,
+		      <&iomuxc 25 82 7>;
 };
 
 &lsio_gpio1 {
 	compatible = "fsl,imx8qxp-gpio", "fsl,imx35-gpio";
+	gpio-ranges = <&iomuxc 0 89 9>,
+		      <&iomuxc 9 99 16>,
+		      <&iomuxc 25 116 7>;
 };
 
 &lsio_gpio2 {
 	compatible = "fsl,imx8qxp-gpio", "fsl,imx35-gpio";
+	gpio-ranges = <&iomuxc 0 123 1>,
+		      <&iomuxc 1 126 2>,
+		      <&iomuxc 3 129 1>;
 };
 
 &lsio_gpio3 {
 	compatible = "fsl,imx8qxp-gpio", "fsl,imx35-gpio";
+	gpio-ranges = <&iomuxc 0 146 4>,
+		      <&iomuxc 4 151 13>,
+		      <&iomuxc 17 165 8>;
 };
 
 &lsio_gpio4 {
 	compatible = "fsl,imx8qxp-gpio", "fsl,imx35-gpio";
+	gpio-ranges = <&iomuxc 0 0 3>,
+		      <&iomuxc 3 4 4>,
+		      <&iomuxc 7 9 6>,
+		      <&iomuxc 13 16 6>,
+		      <&iomuxc 19 23 2>,
+		      <&iomuxc 21 26 2>,
+		      <&iomuxc 23 30 6>,
+		      <&iomuxc 29 37 3>;
 };
 
 &lsio_gpio5 {
 	compatible = "fsl,imx8qxp-gpio", "fsl,imx35-gpio";
+	gpio-ranges = <&iomuxc 0 40 3>,
+		      <&iomuxc 3 44 6>,
+		      <&iomuxc 9 51 3>;
 };
 
 &lsio_gpio6 {
-- 
2.34.1

