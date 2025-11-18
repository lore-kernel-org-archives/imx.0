Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013015.outbound.protection.outlook.com [52.101.72.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43053002C3
	for <imx@lists.linux.dev>; Tue, 18 Nov 2025 07:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763450355; cv=fail; b=DtDkUtdbeqC/VFZqGtBUZ+5uRH6jqSMwg6J+zAPmfwLZ+SuXwYh5JplY+MNiJ2tW2iBcD9G7qGvSNzjR9dHcgqlHkAhxSDLAb7ilJVvUPQYv95LsPJlNEl12O5gU53FOhGAnTc8jLlGW1cQ/iqxtBdPHTV6t3ElU5mX3qr2IJ90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763450355; c=relaxed/simple;
	bh=kLhFSPxaeNhJBD1jplkmzm2566ihG3pvlDt/VVeS1RA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t6wzIZOeunyYR6rF2qjC0YzVswPdk/RhG9IhiucJ0C5LJoCJvtNcD0irMwPPajnEuiVv4H7gcuJKPtKYk0C7y15iq76ISsdv9olgVVLg0TX0BJ/3e75oe1ZGfFz9mvMLJ7/GIAwUe0L0Nd6GlIJxkXkyDCssub4t5uxSn4FikNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mzr5dMxp; arc=fail smtp.client-ip=52.101.72.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mzr5dMxp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDGIFYTmQt2e8VswEjVAizCUoEw1zAOPTDSdCbkuGTZphpzhDsxlasnpvV5qFToGLWfNgukVFq3IEkaXOY9dXYvgtA7axIXihBCd5pBj+mOKgI4oTs1/01LVuYBqEzzxrNXetgp/73qT58y9MZ28rLynjl5KjJGUcx+oYXBpQFfQEnaFLglZPqi99TXG5PiLKtNi8qWlxxiJ0X5HCDc3YqWy7tQ/g1N/TKepAZbXoO5eGrbecdHJd4YxqZQP0Yofg0YpYY1S4451mNsZS2yvzjAFvN2yud+x2UasFOp9TKcQIM9ZdX8DwBeXyDYwXqZtuSKeJxLOsOuqPob5MQtHXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcdVlQSIvrOadBDJlsySN6q+51Znw9F5n+ltihijUxk=;
 b=Fnd6N2p70ZseEcOGQ0mlX0GgCB5htuQcuNb6z+CZveGjRAx9T5X0uMd2q+dPc+sOX51bPdf7Du3CCyzbKiwUBRmi0ftHPSigSdSIf2li6vRv6PpmM5czb1q6aCW+OCWYjMXf3yf466520fEyBP62HzA8O1ykhvGl5IO3FoQeehKlAxYd6QLo3HDF2e68bAznHLYoRLhdyrQT74hHtL5TU11sXedNWLplzxUFL9C8yiMxr3kriGu5nqtdm1zcTekf5bj6t7jNwrNFkferioHzUHcSEZbCiCqnVeB7gvmIjwC4QUrOP+GmMa2JmfYjmAFagA85uygV5IIkQAHO/bi9og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcdVlQSIvrOadBDJlsySN6q+51Znw9F5n+ltihijUxk=;
 b=mzr5dMxpNGeecb6t7o8/Q4L8AKRD6XE7JSn79WOpOyg3BkWaGequFvX/JA0Rc6ncFglHliZ6xk0jAd/NtQC1NHVSc77WNtYWEIhyQZIXexoR4GnW0WX+3NdY+2/zhdpPq340j2anOyDPVdnSafDHgDa7Ly4z0NHcqsl3lGymDMa5bo2cCIiXIaRP2rFe+Z2gGAdKaEd4zVYGI9KR1Mkv0IrwoexwAMS/vYsTovdbk36L8aLW+3k8vV/OgTgJCZWkWczdBREseCBrTYGm97PHYSaWzheduC2XrBb4s6wEuprzrb+rH7Oh2nktwzIcFPOtjlIgY/3yk6uHsR6Ca14wqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI2PR04MB10643.eurprd04.prod.outlook.com (2603:10a6:800:27c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 07:19:10 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 07:19:10 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	jun.li@nxp.com,
	Frank.Li@nxp.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] phy: fsl-imx8mq-usb: support alternate reference clock
Date: Tue, 18 Nov 2025 15:19:47 +0800
Message-Id: <20251118071947.2504789-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118071947.2504789-1-xu.yang_2@nxp.com>
References: <20251118071947.2504789-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|VI2PR04MB10643:EE_
X-MS-Office365-Filtering-Correlation-Id: f150c219-65f0-4a65-64ab-08de2672c4de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EZJj+zsYxkSv5hdCzVYmTPlTaMokhorWpgGG7ltdJdTho8wgYiFT4v1id+09?=
 =?us-ascii?Q?tE5+Vu1UorW+6p9eD3ZwJC0HTx4iqIZ3XQfdJBjBD3pOS4Z7aY587T7W/7DP?=
 =?us-ascii?Q?Pqgp46zppfkBAd2vffJo6JbrV4+yIm0DsilmTfnEvpx8B2jfHtfnTCdvD8NX?=
 =?us-ascii?Q?hPsdA9G/dvUL0zYvtmnOC91BWFGZ0tHRz+q7MRbPPfSruvTzge7YTwI0CAT6?=
 =?us-ascii?Q?F+6h2d5vdNtIY0efNNd1iUlh6Wzbu7JLPJbudJrS/9RqFcLdzdYmN4nx2yfI?=
 =?us-ascii?Q?j+bI4qAv2Hr53+xkY4R3Ih6Ng8RZxaC+QwsthfEHDhsR/gnWuP5fu3QfBk59?=
 =?us-ascii?Q?K86MdhfvMUYysiUjzmcvCzbmX8lRZlMHAzwFLh5yXqN2htwvCJ+X7Ik4/M8s?=
 =?us-ascii?Q?juOa4uW2Qxde2R44LNrvTanJVZB1chFbvTtJL0YBBJRpSuKCadDbi8Q14MOO?=
 =?us-ascii?Q?dQjxgquqpSbBPpRBWuY0rFXcSYbN7Jv8WsfdBATBzhPPXBjnKSFErC44g6Jh?=
 =?us-ascii?Q?YDPRJ3N/cOsL8WyTlOTsIAfDmbnBqY6AtRALYXWmQxMcJ2ZpSZku5IPMlDLY?=
 =?us-ascii?Q?368ALuRapbuXWVHcN5fcetbjPMaI3brRwjrP9+cIcq+ZcMmnRM1muTGx2OIa?=
 =?us-ascii?Q?22VetDGjQF2HFP0fykg+D9gWEOQ6oAYsY2Ta6aW70NjCqAUAbMEBJPmKn0qV?=
 =?us-ascii?Q?3+5Do7YEmsn9Hzw448G643da63QcrJy4hKJu3WFamnJ8Twj25c/r5Iu0wuN3?=
 =?us-ascii?Q?4bAVONOo4e8GrxVs27Bm8JSrUIclX0nU+ZqTuZinBaqZ+OPjk+KveHMylKbU?=
 =?us-ascii?Q?Av6pRyOdflSlo7PsUCK7t3fvXjkMsbRQL85IXXvQnHU4/tI0sjr70EOtIbyt?=
 =?us-ascii?Q?+ciLVfy8OwQVkwY0Ud5VIUYBILr2WQIgrbSiAZelw2w9yJxSIwAV94iCICuV?=
 =?us-ascii?Q?hMtTVULmxczoqmeG7wCygK6/IJs2E4KDGN23wJPYFqggUQRXEjVVDjq8TfT1?=
 =?us-ascii?Q?LxSms74g4jLa3S85a357L0eGatTxTAke5vo2xKYziRcxS28f2+uDPn2qBSrt?=
 =?us-ascii?Q?Ldds69jNvjTEjN8wLxAHWkRcTfIByrdzO6F/OIbgSyyTOz1tc6wJ++Cuf7er?=
 =?us-ascii?Q?njJFpZFxDCWDA0TD3YDC9wFQVZzzI611DFZsZtlqW5+hhcH4L2nkganuZ+EK?=
 =?us-ascii?Q?DXOz5HrDsqdHdmY1QWvnP2gBAEVHI3/j5vWO7mHIAGh0HAEBFkm11mBxgJrT?=
 =?us-ascii?Q?LVGfk+X9KPME3uysiaazAlzAPSmEaIbeGw1J0bduBKM78z1gEr/AZsyCGYRJ?=
 =?us-ascii?Q?8LMSBWiO1Dtf3oGqYKYEtrb2RK8wrdvg4N+/CyWRMy8id3C5s+l4Ap+6nwIx?=
 =?us-ascii?Q?psUrNaedt9iNBJgPJhFR8GtHRDYNDa9Xm64Col4lMBg1vn0Ew9LtRSXM2Vh1?=
 =?us-ascii?Q?OzlyPQAwu73EG0UHCy5XvZvI6et61H+AVjnt/95gHqKDh1K4gV7t6aMxnOxR?=
 =?us-ascii?Q?L8Y21AJQ6KO0UbH72/+LLdz8sn3NKBGApXz8WyKceWxPaYTTS/d81RxAvQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e61tv3q8AqMf2qm0G11uK9hTxoNCDLQJnhrgeXQZNctxKVN93sv+DxP8OcrY?=
 =?us-ascii?Q?W58TEZ7OYOU35P4ml3TrBBpenRc/9hrmLbATDHQwex9aOuZ/gx46r1+S2jLB?=
 =?us-ascii?Q?Y/GxT+Eosbi4B04SpOzUoVKDlCnrwz7c6uFHWe2IXe3M3qOy1B57MdTgfwJB?=
 =?us-ascii?Q?WlzjP1xFPkVUETE+xu0gaWkDrBnn1bi2zJ6dihVsnpnsfYlORdWjrAvb7B5T?=
 =?us-ascii?Q?Kw7q5DOdiiZM7mmToJmeFkhij6hC8NoLWPu2zSLHbjxO5gDTRXv/3ec2Jq/R?=
 =?us-ascii?Q?9qjUPqKB2JNjOt//Xm3wjbeo7NxqsxXKY8p5fmvmfkGTvok6509jE0GAee9l?=
 =?us-ascii?Q?A5S6DvtbCU+N8qxM0PRoCs5WK+DaJ7cDkL0dBzJJMeaIfIZO2UNsS0oyabSZ?=
 =?us-ascii?Q?zCPM4rv2N0HsQTjPi9Jshdwu1mkVxjiUcPvBGKxk6ds9qQ7J6lvFDPi6wwe8?=
 =?us-ascii?Q?aePsdnA9TFuajrRq1npP0dcdIM5027F8BuSs6WMvRUfA/4PedeqKFL1dXvSd?=
 =?us-ascii?Q?ovyoazddsldrfNAR2WYAAKIq40GcXjrNe9HcwZ7OBfVJgtPH4PgaxPxef0MF?=
 =?us-ascii?Q?xQEPMdiDTMMgyF1BFjoukalw2u3pANtmM07YKrR00ymSk8n3zAxHJo3ZTtdY?=
 =?us-ascii?Q?WDqltXY4gClQ3JQySRuGG8hroEc0DLCFApFciXS0JPGcorEzQoh2UklALhy2?=
 =?us-ascii?Q?0BODRhgiaisUWKgpvyMkgQ+JRI0B6o2V69Q/gGvGRoABUYzkkkvJXpG10SvZ?=
 =?us-ascii?Q?+jziaBTav6LrLbK8DdSht3Z3TaGTfEiC9nFbStleJXZ4wCMGHVrMp0FzBmVf?=
 =?us-ascii?Q?r00qJyGEKxjBUk8dX+M2iZXPJgNDIzd1OQm/IZWxgBZjXJD/SW6UaABacvPB?=
 =?us-ascii?Q?qLeCT0q4SnBto/9Btfr0kEI7aB36O7gI0lniOBRSTkg6Ulz+94SWXGVMKn+v?=
 =?us-ascii?Q?2WNIR/UVXkyESDzDxeagFw8uhEHCNj1xXF7U3mqtQ9wEPGlMskHbW1RQKamw?=
 =?us-ascii?Q?8GJX0QPaaQMIHjQVq+6Mbs22VuBDy3ciNxnmL1wO6jGw6QN/4I1aQzO6Rml0?=
 =?us-ascii?Q?rkVjaV7zE4AFTcY9NY9Ea4AvOed0u+54Kvr/jYrjY9d+DlIPcncN2NGyQ5Ys?=
 =?us-ascii?Q?jdOJ/4ME9MjyYy3irMtCSm8rZzw2VsiJ0DQ269gLkdht2NK1apE9rTbWPzgG?=
 =?us-ascii?Q?lVNDo30+IdYSDgshSvWA97F3B493KBDaudzRvIzkbpiYwXCsWuxYAnaw3xbw?=
 =?us-ascii?Q?9Iu8Orx+s9pFsduecgu3fptTeESyeT0/nHS5Q6Tz1zjpJEk4gtlvVpombjsQ?=
 =?us-ascii?Q?csqoklGalw8e0YlcCAVz08v/AUukVpbed0V69ltUUMb2LomOm7f7uTAQG73p?=
 =?us-ascii?Q?Uyh0t2XZoCqRj6rNIkmJh01KAOZ1pIjjBXHAT4Cy2moUCp92BgAPlyYvwDUD?=
 =?us-ascii?Q?ZGIoml3QnZW08kYfRuwBmeEHDEVHweGaEKfgsSMvaQ25HG34TgxSp2I5lb5/?=
 =?us-ascii?Q?2SngO9OiU8DUUs+rEQhks0Pts54PVCjKMp9/DG0QCp4XkF+Av429K6Jxlf6P?=
 =?us-ascii?Q?mygYFzfmPo7IZHfdjCngrYl0LCVu9PFmDnFz7PU9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f150c219-65f0-4a65-64ab-08de2672c4de
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 07:19:10.8607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BWKkEqo46GtO7YlggIg5vRIWHaRtMG2MU73VZYBZwZWvEeBJwVccndiuHxeNI+mpJV7nmgskkMxZXTfZGOjfrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10643

This phy supports both 24MHz and 100MHz clock inputs. By default it's
using XTAL 24MHz and the 100MHz clock is a alternate reference clock.
Add supports to use alternate reference clock in case 24MHz clock
can't work well.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add Rb tag
Changes in v3:
 - no changes
Changes in v4:
 - no changes
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 23 ++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index b94f242420fc..ad8a55012e42 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -16,6 +16,7 @@
 #define PHY_CTRL0_REF_SSP_EN		BIT(2)
 #define PHY_CTRL0_FSEL_MASK		GENMASK(10, 5)
 #define PHY_CTRL0_FSEL_24M		0x2a
+#define PHY_CTRL0_FSEL_100M		0x27
 
 #define PHY_CTRL1			0x4
 #define PHY_CTRL1_RESET			BIT(0)
@@ -108,6 +109,7 @@ struct tca_blk {
 struct imx8mq_usb_phy {
 	struct phy *phy;
 	struct clk *clk;
+	struct clk *alt_clk;
 	void __iomem *base;
 	struct regulator *vbus;
 	struct tca_blk *tca;
@@ -582,7 +584,8 @@ static int imx8mp_usb_phy_init(struct phy *phy)
 	/* USB3.0 PHY signal fsel for 24M ref */
 	value = readl(imx_phy->base + PHY_CTRL0);
 	value &= ~PHY_CTRL0_FSEL_MASK;
-	value |= FIELD_PREP(PHY_CTRL0_FSEL_MASK, PHY_CTRL0_FSEL_24M);
+	value |= FIELD_PREP(PHY_CTRL0_FSEL_MASK, imx_phy->alt_clk ?
+			    PHY_CTRL0_FSEL_100M : PHY_CTRL0_FSEL_24M);
 	writel(value, imx_phy->base + PHY_CTRL0);
 
 	/* Disable alt_clk_en and use internal MPLL clocks */
@@ -626,13 +629,24 @@ static int imx8mq_phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	return clk_prepare_enable(imx_phy->clk);
+	ret = clk_prepare_enable(imx_phy->clk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(imx_phy->alt_clk);
+	if (ret) {
+		clk_disable_unprepare(imx_phy->clk);
+		return ret;
+	}
+
+	return ret;
 }
 
 static int imx8mq_phy_power_off(struct phy *phy)
 {
 	struct imx8mq_usb_phy *imx_phy = phy_get_drvdata(phy);
 
+	clk_disable_unprepare(imx_phy->alt_clk);
 	clk_disable_unprepare(imx_phy->clk);
 	regulator_disable(imx_phy->vbus);
 
@@ -681,6 +695,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(imx_phy->clk);
 	}
 
+	imx_phy->alt_clk = devm_clk_get_optional(dev, "alt");
+	if (IS_ERR(imx_phy->alt_clk))
+		return dev_err_probe(dev, PTR_ERR(imx_phy->alt_clk),
+				    "Failed to get alt clk\n");
+
 	imx_phy->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(imx_phy->base))
 		return PTR_ERR(imx_phy->base);
-- 
2.34.1

