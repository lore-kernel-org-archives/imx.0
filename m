Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE843AD515
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 03:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787022212; cv=fail; b=otGrZ+K/bkNa9tDbOmLeJFuUbyLvR6h0od5jfX/TFLXHMQ6c8AtVyYoe2gakS1bU8xvj29KT3OlC8joeDD9BtEpJVQ9B/neHn/XQa00x9muomgwYR2wxWMT+El9Mm6vGrqkXXONPCyWkB/k+6ptsswJeMRBs6SHYiUVa9pQW+SU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787022212; c=relaxed/simple;
	bh=NrMqJsOgUvqTtjdFw2F912ElwEL1chtCGOjoPPAdQLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o7IOkGhW+Y/ERLHuZU3hj9qei7f7xrF6UOmGvNbDTmFI0vxFs6hG15JovJXpbYc4+Rv5kS2ysaoFzxc8CI9DjTLjQz66jLSzmkZaHFyJBE5+7QwCEud4qoJNuZB6X7BpAiTB4ywpoTjz11MseuDB7L71hncZ/Un1FEhXjKEPqIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ON/7Ohk7; arc=fail smtp.client-ip=52.101.65.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ON/7Ohk7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRQbiut+wMbMuXhkFQFvxb4VCTGny7BgbJPkjRj+T7CWZw/ITPcWfEbnezqi3HyAmYbE9WeRbGKBpdRf7KU3m0r3Hel7/ldCyNEbVU7dKKpLSSwfsLlmuGeFU7pQgO2CdC5GVtA04EMEcqmkOQsK18zvGbgIUCmz6ToDcOs18BzoXP4wszn0l7OquXC+LQ+K1LYVTcbTnLhfiOZp3dqazTWaOb5XBheDvFKbxD+vj55VGR/5l0lXCWP+3ybbNMmOhIK0qR5Awm/0W4DCotkvowqZWOx8ZxFuV+LeULUpkg+Wye4l4GkziMK2en+kaDddQS4EKrptBzliJGaLapUoAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YHfs9yWiZxo7TubBkw+D60OwWfNMpPSFEFhCfRsQjQ=;
 b=TdEOA70pJLz10Z7/tpa5xoY++qmff/Ekdwmfb5gsBEOM3wcJ7u9acPtVoeyinrDBEzhKTejllpERE16IAY2wgS1tiQXfwr41/mzOPalziJzOAr+BvpGpBQ0qZvu2w0J4+PAXlFLyzbCPvA6v8H2A0N+qVdZSHv53N+Ixo3GvLWM7xgPb3opIN3yeXeZtctsjNvz6GQC+4xLGf96BElkboBr3YZivOrUCnsRPMnYx1qyBdbUoOsfz7hsDrkc7CwZg9P8dMeds88Kf+aL8+uIZNUUeeI0dAyYe+yb+Jhp/d+LXza760QIKkA46HQ6Kj8c9sYNGzax4cJxu2x+rHeFSqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YHfs9yWiZxo7TubBkw+D60OwWfNMpPSFEFhCfRsQjQ=;
 b=ON/7Ohk7xiGe1rBEgONBymY3zB+FAsm1fWBKVni7MwYk7ijq7JL626ND7lsSpOy+356xv+/bN3ZRmPWOct17phwjwYd3uRt4/y557zUXsJLqEEAy/fGNOEDNMy3M6pwsOqoPwiOJww5nBpzyULg2Ajp9Z+CiXBXkPQnA9utctf9UnZa0+dwqf6FkHf77EKsQ9bPPLVQcXbXG6anQdIn94KFSHkejExkNMLA8z1uXHPg+56bVfBP4u6+1Cd42b6GWfYNDOHrJ/x4f7EDwiN9Zrty8CyvsuqzQ99Yv1J3Pd1cbthkwGrWCZo/0t4bPe5UPFgc2rzmx1PV7h3YAOvzntQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM0PR04MB12144.eurprd04.prod.outlook.com
 (2603:10a6:20b:744::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 18 Aug
 2026 03:03:08 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 03:03:08 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/17] arm64: dts: imx94: Add clock and sound-dai-cells properties for MQS1
Date: Tue, 18 Aug 2026 12:02:02 +0900
Message-ID: <20260818030211.3141710-9-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
References: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0162.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::14) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM0PR04MB12144:EE_
X-MS-Office365-Filtering-Correlation-Id: 290b134d-f69f-4f02-aa4d-08defcd53aed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|23010399003|1800799024|7416014|10067099003|18002099003|56012099006|11063799006|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info:
	FW6/pm6MqQ611LSbCex7eAqyXQ8nNi5ds6lY8LzHPKUyjH28u4TCh9lFiBCNl7Lstqi5fN9ivBoSr4xksgCcFKW2HZVP1/EQ3lclJU9WIoBG/hBciWrYSPlGHIIRoylkoqz71jrcOzUcCFszCOIQGPlLppkfaQENTCf1uoUPpR4FXlUxPJ9umDzdak5nAcf+/eJFMrPn9wRDvuBV3CoqGNMEuiIXpoPC9v9xTfqqSo53eLqC3TI66TqoZeQvhWw3LtysdAB5CZrng8Q0Z/ia2Z7QzEcqNlf8ia8sAqaitOYAsP8lBjzTeYOd/mhTDoKLacnKjot+fIkA4pDYlOGQJaoq59jrUBT14r7pB7W7Zfuj3knPiKDmYei/Quny6HR59QeTxr5Hsv+AJeLjojyMR+tF0KJYKLYMArFfc+VVOgtWISfw3q+yfigabT25YrMmEUWzBZOexz67630dBnwn14hS7jNN3R9u9mT7J0k91VkZSHcyr66gFVQvHR3viVkOL0gXfO0MaTfszfcnQgz99WEMKRUG22L5e6IQoYn/6o92Qktc0ZRUJi+Elq5N2lmbaNuvjpb+iTJYz1e4+KcePLQGimOvdtolv6R9miuEa/YDurumRZRsLXn4CgFURs4IKwo48poiYhGOqFf3M7CmSD11Th6EXR1aDrmqyyGkRDs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(23010399003)(1800799024)(7416014)(10067099003)(18002099003)(56012099006)(11063799006)(3023799007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vyLtzuOLzgxfINjIslApiVZoJMoh5mEBsryakv/4fdVfUQDDKy9K1V1+Pp1F?=
 =?us-ascii?Q?XCKWz2Y4SirI5KUKmvabqOIzpK7Ewpkugisq6F2n3NqyCwoA/FsMT5+ZhR+T?=
 =?us-ascii?Q?a/gzIJxU694jQwSvl69FUlv4avnIihbWRXoUczI186gZnEkeJa8UPDzXqCf1?=
 =?us-ascii?Q?hM35wRPYzLeYOJ2jpG2q4/xiEKthL/+TR5vH0B+swDAA30PrV2LgP0p1va1b?=
 =?us-ascii?Q?iutk5FkhSLM0wVH2e0u5wJWncxyxvN1e9zj39ECNexuocU+RXYUkKZqkUzW2?=
 =?us-ascii?Q?X11ZRNz6LbJoPs59CAf4/lNgNKNSgO83TC3DrrEXjHGnAtcZuOlyDl4P/kOk?=
 =?us-ascii?Q?Rm8IxH0e1GWv5QujoEMMw6GbqaUVF0dzmMuGOLQ6ArJNawcp79fhhu7oCerY?=
 =?us-ascii?Q?LRQhN45tBq6g7K0Q3qNirrZWIk0y8tFDJ7n9C4uUVyGipV5kZE0xWoF3OUSV?=
 =?us-ascii?Q?ZgjQOXDF8+6AKXwMM4D2loyL5qOvVFQ1qYuYQa931+ukasQPVBSJSGs37tZB?=
 =?us-ascii?Q?uxlOu/r/gDgjduvBIk/gpzEyn8X505drLuJlR5je5Bsmeutb/nR7gGPmSDUV?=
 =?us-ascii?Q?66d7DSwDxoRpUzwJ89sVGurcRr2m5Pw1tyE9SrK4cUWR7z7PhdMsuGpbHNN7?=
 =?us-ascii?Q?mkmcfdSEXJY3SSOGlb3C71FgTdj4GFeugyy2FRb55yHuoNZ3Z2YXha5k+Xkg?=
 =?us-ascii?Q?bqEde5oCev7dG1DH05e6eQgo5dvt8xwjaiQ2TbD+ciTdasoi20MiGrp2QplX?=
 =?us-ascii?Q?qpvK/Cadj5Jb3ciZGi4uuEZwUYYYHMRuzhhjFYGVw0OWUEn3zRWdFw6UShYS?=
 =?us-ascii?Q?Q0HbsEYIyuCpP+C3GSoxmmpQHna97kSMkOhoX7xsGVNo2/BIQZeVSUKbN4SK?=
 =?us-ascii?Q?Bc0xPs9gDPSdldQ+rW5xlctjLmMBJu5MRGQR512FwBdMQx383XcR4h7b9DYm?=
 =?us-ascii?Q?eIbglns7ucIYZiqV+fM2kEzWoe+0MlK1/d9pbjjSj/kZx38DYB3pcq/1r/Aj?=
 =?us-ascii?Q?eumpHEwsWmrucdjbwcCdtspH9i2A5w5iAERV46VkEu7z6UXrglEIGVpU55vU?=
 =?us-ascii?Q?bJxFTD2XOiF96v3nlWruR3KWQH7NC+opfmh7g3rZKwZDWAm7yQ583OUWQAJg?=
 =?us-ascii?Q?UTVxOJg4V0+to4fYlOcNvnHMtccMTACkzkzUMyIe5T9ot0p1e8c5mRnRgasl?=
 =?us-ascii?Q?tM0NKap8niOfoKuJ8jVNMVczqpRdG7TS8zMJTptPmN1138QritMnvSb+sDmA?=
 =?us-ascii?Q?Er5vY0ih036TVPtyVI/onTOp8kTQf7hatykEQqqEDoo+XZyQw1tNB6F2sAAx?=
 =?us-ascii?Q?YyhVbe6CIVFK2tzwYo29qdlpgrSQU8O/aA3vZzun+t87jZi/c8CnPWzlSsOE?=
 =?us-ascii?Q?jj53sjTVKYGlAwmkzSyvb68MMlws9bPUApBjskAlB8nGRY+UhuGS7zwZs5jf?=
 =?us-ascii?Q?WlRwB8VVPOO0quZUCtwCvmeou98EnNWmFfVBwaW9huWNfjKVbE7Dj2NK3z7j?=
 =?us-ascii?Q?zz8qqokcKok371IZfM8u1kZlVIv22YC/qFz99XH5tzat819J8FO+7MuINgBO?=
 =?us-ascii?Q?xQT263XVlhrLrCdEKQf1CKBkQXW2X+4ZwUe3ZuceEYcYSDfG37DLnPyds9Yx?=
 =?us-ascii?Q?L2LYcIgI7fuY0P9SxDrccDP7FsvhLCFBfDWd6GHbBAfNdhJdOxNKHfPebBCb?=
 =?us-ascii?Q?lr2RdKsUEakhyWaup+0JfcSAwbs0E1T7yytgFrNHtTpc/Eo+evcN8ylLpMia?=
 =?us-ascii?Q?utQn3+sx3eH15xH+l6gDk/mS+2wU7lpBoVVvjYi3IL+ch9FlMx3s?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 290b134d-f69f-4f02-aa4d-08defcd53aed
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:03:08.2054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igHLSC0HFCdlQOQRM0oDUTmN0/49D+bXMpYppUjYE94TOk3mlCro5qqU+V5IOzaoIaPyx0finx8ImRq6skIA0NXZo5dtr1kymUgo0TaXuHsfA1N4/5nChDSnIireJX0T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12144

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 MCLK input is driven from the respective SAI1 MCLK output, and
sound-dai-cells describes the node as an ASoC DAI provider. Both are
fixed SoC integration properties rather than board specific, so add them
here in the common dtsi instead of duplicating them in each board dts.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 34833e62bd79..a0d1922389d6 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -131,6 +131,9 @@ scmi_misc: protocol@84 {
 
 	mqs1: mqs1 {
 		compatible = "fsl,imx943-aonmix-mqs";
+		clocks = <&scmi_clk IMX94_CLK_SAI1>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
 		status = "disabled";
 	};
 
-- 
2.50.1

