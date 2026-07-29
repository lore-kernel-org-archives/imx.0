Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012070.outbound.protection.outlook.com [52.101.66.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9057848877F
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 13:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330318; cv=fail; b=F75IkTXM/5fOVuQw+EyGaopzn2FuwTnkzXdWpHzxjYEld2giHYcD2j7az8GG85GnVFW1iAkowoVfVmMcJQXq56P29vTDuoyuSedA59J/8dwEiHwN1AWfP1hbYg1Dqfjv2Eq1AQNWTZgo4K4lGGyP4XaJszkb+32LdqXdXeMfjho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330318; c=relaxed/simple;
	bh=nKoJGfZ3jOfgtCFDlB1XPDKSmBsJzCwiE9nXDKkjIII=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DRIf0vjW41c9EDvVHI8DYhwJB8g0+cbLLojsA6yONgDI5xWXIWleTSJb+h1Tu5+aTeT2vI5BWBF6+PzEIY8rniXNqJiFR4y7mAPTJXjPWCYeNygWL3X0InwTAIGS/j9ZEaCodtDYrd97h9CfpYOsrwG386pJcnykCd0t3gIdM7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JFsoNPWG; arc=fail smtp.client-ip=52.101.66.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JFsoNPWG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nE5Rd55u+ITw1vf3hdcJsjhNpLWlHyC9gzU6IyEu/bqKmxEMybHPy/KkPA34hJV6FDafY0/5EuC7wq8lCXc7VB7xQrrXzBwIwftAywiiug2UWqr1bqQqZ9HaDldlOCWmhII30n2rrCVNpGxRzIpcggRoSxQS4xp9/SXIHA+nNO3t0g5Wno1N8c1RQMC2YAnKK/oh67C2Y2SD8BF6KVLpTTvxbNMdRCpF7RSffUoHwK1ZdyLIEj40bByA93WOBkfm82+VdEgpqsospJcO7uapx75dMVV41zHdBFVsJnPthTmjy+LgjzHfFhNYiCsQDkoKZaci0Wze8EuygZHUUsMaaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+ucPAqWglTVYognhpzH71+xfa3dh7Y+TjhsdUvpZKg=;
 b=JME+nwMD6tze47WhnZqGMEDGRPEEWZaTuuojva/K36UomdY58pE9yeROyCyf8Oh+dnjJ/CBsnntoUEaDFbpAUEAlteaPHxtp3oJUb5mVfdMJbBA0tVhYe8sgRZ47MMZ+DMac1zIJr1Uh9aqk08wsnEgeVih3anCYPhYC/9mwOPb/lWDY4Sy9CxW6/6L4szoYTujeC84oTEW5tf9MhTmddwUyLn1NV90Bp787yQFuwcw2Wi13j09/TnbP3olGf7oTHIftPAbEzTW0YSxqG9FlQ3LJm6DihBsuGp6V1PvIO1gijz04nyzKhJxW+ZGlb5+4cw1erOgLAHZIZ/8Udjt+xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+ucPAqWglTVYognhpzH71+xfa3dh7Y+TjhsdUvpZKg=;
 b=JFsoNPWGkrZ7AECgD2CPcSYQZxZ7wsgypnGSRP+ppm+uJ7ke3RJLnnJES/MD2oktpyNd2dc6vAJQofSDxlOLTfej4SRfMMi1snedh2JKHkZtdTvypPvC++4S7Vk0dcvcczTXfScF8M6YtBE6Uozq4PK9A5YUA1DLTQO6O84lSSCb+IKH9l+W9GC91jgtrE38FtDD2ejHChLgVnMiTD4Z8Cvy0ySQI2fd7F2OM/QyTmlojs77n/MLFdVNW9ivtxNTVXFDBe341jcSJOWYwoJZrnFj5dSkSaYVOLY9pqjxsFiS3QSt0UwEoRx4rEjRJZpf+fZTI76INzDA98Fbov6rsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB10718.eurprd04.prod.outlook.com (2603:10a6:10:58f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 13:05:14 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Wed, 29 Jul 2026
 13:05:13 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 29 Jul 2026 21:08:06 +0800
Subject: [PATCH v2 10/12] arm64: dts: imx8dxl-sr-som: fix reserved memory
 node names for remoteproc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-rproc-dts-v2-10-debbe0816202@nxp.com>
References: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
In-Reply-To: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Francesco Valla <francesco@valla.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:4:186::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB10718:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b4f8cc5-852d-4c98-9933-08deed720710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|376014|7416014|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iIi94YRD+TsnxikvCh9XLxF7o7Rd2eP1sk00mUYmni5nQs3swUIkzu45jYy5tX5X01x1mtPDCqQfnr/G0OXicejXF+xDJhsDwTOVcPjSMmLE6nRD02GArteOTSlsMCe1WMn759tQKBVD59JfOsNQiRdjjbU/dBscmzTRXR+d2TFN4Zj9d0R6+VD9CPfhtlTest4t9LGfwdpqqQW4GvCDKdoAZBg2Aro7C0YBrDoKqFsddNvNheKHELZLklgs9xXYAMN0KRUI/VUovVZH3aTXy28GDqsrYNUSNaSz9tnvASxKz56hmPMPjv1GeFzfW82x7Jfn+tHVQKmNvTXwd/vIC1qy9m8UF6jACgWINcbtIQfoPhaeR71OCEFJX7KOnZY4JRLgKAByswBCMF8aLMp4MsvIswt0/zd2uM253Ah4tzlCTSJ5RUZfmlWSpJAbWGKbxdD4LoFNMzHJMk9Sg7+HRzBTQem2678/VmqKy9YU9ajvJht+lLXrpJfBU2HOhDdTcrWOh3o9leVE4lJg8dUVzr3ZBdpJow+Unoj/P9PzXrdTtz0Nw3jkYiiA1j/FOfWc2hbLtECHfzm8RAgqLJmN9Vu1ucuWVkyooDvFd8VSTLysQCHtHVNkyT1ITfpsOjAjCxYw3wLIWDJunfO1aA6p66piOmavarS22f9TnDNheJ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(376014)(7416014)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnhSK29WMmpvSEpGT0hvRENKc1FJTWwza04rYnc1b05KZTlYMUZWZk1qSDBL?=
 =?utf-8?B?bm5HQ3l1UHR1YnpxKzI2MGRNQVBTaFl0VUJjb0VHMWNNeG9RYVFTRFdFbkQr?=
 =?utf-8?B?RXBIUGs5SkVreHNoMC9Mbm5hL0NUY3JJRjIvcGd0RFFjU0pwZHdVdEtQc2hn?=
 =?utf-8?B?dHhnNG90TEhWNWRFa203ZndEeVpTQzByVEtIUmxUQkErKzlYQnFVZEJJaWdR?=
 =?utf-8?B?M0UvY01CMzgvR25EUnY3WDVpa09UUkVtU050bWxCclVmc2Z6Z1RVNE9CSWZp?=
 =?utf-8?B?TXhqaUxUcXJnczN4SG5lWGVleTQ0Y3JtazdsYzBrc1gyQ29oVzRJL1FQWEZs?=
 =?utf-8?B?OFdLQjFzVGxCNTVPUDNNRTh4UXpFcHVYZCtNWlhuMHZubFJaMENBOUF1a1dk?=
 =?utf-8?B?R1NIWDdUNnVyTGdQM0Z0QklhMjJFeGNwQVpBYnRuN1AvRzk0L0dHMTloMVVo?=
 =?utf-8?B?NEsyV0VCcVl3a3J0dG41RXk1Y1VITkZXWVZjMXZheXd5VHY3ZkMyb2Z2UEI0?=
 =?utf-8?B?b0UwZjNmSkZ2bEg1YzhBMnNUM2pOT3czMHZWR2d3T0dYRFBEUmJ3c0hmTGY3?=
 =?utf-8?B?a2loNkpqazc5cnF6Zkk3NUl0bU5WUTBxQnVieGJCT1UzK252a1FhQStxMEY5?=
 =?utf-8?B?NlNETm9aWWErakhrSzFyUDcxSkxwSVBmV2JvQmQ0UEhNaEJvZm1RRXBWRFox?=
 =?utf-8?B?Mmo2bmpzcm1GTlBJbmhJKy83MFp1SmY1VzlsWmRPTHkyQTlVTUJJcnpxdWc2?=
 =?utf-8?B?S0RCT3BMQmgwb3plQmNMY3d5NEhoeHlraDJudEpLelFUQkE3S25hTFpIYjRC?=
 =?utf-8?B?Q1FZMHFtS3dKckhpMzRqSFlESWNTN0lETHJlcVY0TEpMN2lPbDh6dFczUEZU?=
 =?utf-8?B?TG0wenZOTS8zaGVBZnREV0tHMUhtTzJrUWV4cFhqQ0pRY3ZzNXhNck9ISERV?=
 =?utf-8?B?WEl4Y2dvcjY5cnBPeVVtQUhQVnk4cTU1bjIyRU5ydG9OQjY0TkZKazVWRThW?=
 =?utf-8?B?THRiamp4VUZ5Nm9ZTHE3cWhZYlk5UDFzMHhPQ1E5eVhYM2h4NUt2d2l1dFBZ?=
 =?utf-8?B?VmxHdldRV2pQLzJyUFRsUkV2dFBsSGRFU0pEeHhrU0NDejQrcEFCQ1pZdUx2?=
 =?utf-8?B?Z3VpSzhVYlJuanNTOEFPMUhuaUpVcFBiTEZwTzFQLzRSbnQwS1ZLUWNMTHlY?=
 =?utf-8?B?UUo1QnIwOTUwVmd1TTltakJqVlRvOVNlN3RnQUNXVlMyblBLaU1yTmcya0dt?=
 =?utf-8?B?Kyt6RE03ZjU1VXVhRGNmUllRSHlsSXFUUCtENlJMME85QWJBZjVlQzFtbzN3?=
 =?utf-8?B?UkhUSkFyN01OdXJtbUFJTE1OdHlvUVB6VDhrRk5RcURYRHM2ZXRLeXgwdGlp?=
 =?utf-8?B?S0ZzLzYyekdLWVMxUkFiTnlXamgzTVRWQVNWUzZqU3JXWkhtMm53SWR5T0tq?=
 =?utf-8?B?QmVXNXhMbTVUSFJXc2JKdEcxcHdRYmdpQlJ1ZmVvbkJCNkc5VzNYaUxUNE94?=
 =?utf-8?B?WnBCWmFIeUdQcXJtS2wrK1FqWkZaWEdkVTM5c3poRjRDYkJXbFdCUXBFbEVI?=
 =?utf-8?B?N2pGZHZ1N2RidWE1clpnd053UzVkWFlmUDdxU3k4ckUwbWRZTjJyeXJPVTAr?=
 =?utf-8?B?ZktTdUt1WkV3M2d6OEJzcW50bVRVaGQxdVNFdjEyL3Bvc21lZ3hyN1pMQVAz?=
 =?utf-8?B?ajQyUzlvMDlFK1QxTURDQW1SYVErcWpCSGNTb3ZyNUVWNm9SWVRybFY5azFj?=
 =?utf-8?B?Zkh5aEgrSzE0OWtNcTd0RE95U0RlMUlVMHJLNGtlL0EwWnZLSGo4RDJ3enNY?=
 =?utf-8?B?T2JlcG1LUTE3VzhnSTFpb2RzR3grbW9hSEQzalJmN3UyWGNBZ0Fsc3NLZG02?=
 =?utf-8?B?MUw2RHVzdEtrdFJ1eWE2bG1UdEpCOEtVd1JJeWNHSklzUHM2N2NLVEx3azVK?=
 =?utf-8?B?a3JBZlhtVC9sRGN1dld6ZHltV0loQ2hjdExLek4yTzV3dlhDN3RCVkh5bFBX?=
 =?utf-8?B?WllXYWlldHNzZUFKU0RwMVhQcnN6MUJ4SDBXbGdzWmZZN0s5OERuWlhGbVJx?=
 =?utf-8?B?RFNSWFNQc284U2xBUFo2SmFrZTU1ektiY1Y5dXVoZ2UzY3BzOUE4RmJMTEtu?=
 =?utf-8?B?WTF5cmxZMW5kZm4wb2tXdm54d3JYWng4Nlg4b0dLU29ocEROUm9UTGF0OTE5?=
 =?utf-8?B?STFSKzkycWcrTk5CNTRuazJ1RC9sM0diTnBTWjhBdDY1WVJSVTFnMzExdjFs?=
 =?utf-8?B?WHFHTldEeURWT3BKQUdlUkVnR0s0YlUvWVBGNSsrcnlZVlg3TUNWaG5wMTh4?=
 =?utf-8?B?K2JZL2xsYUxPQlBVS2NiZGdEcHpTUE84emoyUzdkSXYxdVhEeElrWE5SVXVO?=
 =?utf-8?Q?Qb5iWntjQ9+q6jDs6JYvDAqZevK9MUv+A10JK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4f8cc5-852d-4c98-9933-08deed720710
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 13:05:13.6355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgcRUYC4dANcSDq166VwKF/1y8TAHpcUWBny+OP0Kuv8o0+UNfyiAIe+xWIzPJ7+ipE8kdf5EY/+KX7IqxD3fkopygM3/tTRoXrooehqqSv7PfEHoFmHdfQOBXVN0Bo+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10718

From: Peng Fan <peng.fan@nxp.com>

The imx_rproc driver uses node names to identify reserved memory regions.
It checks for "vdev0buffer" to skip mapping, "rsc-table" to locate the
resource table, and "vdev" prefix to filter vdev regions.

Rename the reserved memory nodes to use the expected names so the driver
can correctly identify and handle each region.

Fixes: ef873f01a1b1 ("arm64: dts: imx8dxl: Add SolidRun SoM and HummingBoard")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi
index 93a0eb4d7f770..83d22ae373c3b 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi
@@ -26,7 +26,7 @@ imx8dxl-cm4 {
 		clocks = <&clk_dummy>;
 		mboxes = <&lsio_mu5 0 1 &lsio_mu5 1 1 &lsio_mu5 3 1>;
 		mbox-names = "tx", "rx", "rxdb";
-		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
 				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
 		power-domains = <&pd IMX_SC_R_M4_0_PID0>, <&pd IMX_SC_R_M4_0_MU_1A>;
 		fsl,entry-address = <0x34fe0000>;
@@ -103,32 +103,32 @@ linux,cma {
 			linux,cma-default;
 		};
 
-		vdev0vring0: memory0@90000000 {
+		vdev0vring0: vdev0vring0@90000000 {
 			reg = <0 0x90000000 0 0x8000>;
 			no-map;
 		};
 
-		vdev0vring1: memory@90008000 {
+		vdev0vring1: vdev0vring1@90008000 {
 			reg = <0 0x90008000 0 0x8000>;
 			no-map;
 		};
 
-		vdev1vring0: memory@90010000 {
+		vdev1vring0: vdev1vring0@90010000 {
 			reg = <0 0x90010000 0 0x8000>;
 			no-map;
 		};
 
-		vdev1vring1: memory@90018000 {
+		vdev1vring1: vdev1vring1@90018000 {
 			reg = <0 0x90018000 0 0x8000>;
 			no-map;
 		};
 
-		rsc_table: memory-rsc-table@900ff000 {
+		rsc_table: rsc-table@900ff000 {
 			reg = <0 0x900ff000 0 0x1000>;
 			no-map;
 		};
 
-		vdevbuffer: memory-vdevbuffer@90400000 {
+		vdev0buffer: vdev0buffer@90400000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x90400000 0 0x100000>;
 			no-map;

-- 
2.34.1

