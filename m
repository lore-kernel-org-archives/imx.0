Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010032.outbound.protection.outlook.com [52.101.69.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635C92931F7
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 01:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288152; cv=fail; b=S/lH1qzhSviA2XuXTjJY7b8y7cp5qvfdtHAdG4OHlTlx0FD9Ym77XjiGsQgk0/YGLMgy5VKdk5fnTgi+G6viojdlNoIVuwIJFTNevdzYVg6/L9wFkt+Z7WrM6GZDSYTFyVjJ4WEsPDcUwUpgI9Mnjw3cInW64UoKMZfjdKcTXhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288152; c=relaxed/simple;
	bh=cjSW8vZBGoxcaiPc7ZbyoIHg96CxJQ48NfEMlzdVDE0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qwZxSop9btGjwSmPXXJLHDx6y2uB42COUX1REb7pPLrcjbQL1AnjAib9icQlIt7cNnvw4RG/zL0TkOuq726yvjv9lmbFw1yvCIAL4WxvQWvCo61ykXfSw8SGbEpCdDv+mSpR7TvzrLD6UEoo95oq29fQDm353jvQGXtgx/QGmD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vdYT8Q07; arc=fail smtp.client-ip=52.101.69.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vdYT8Q07"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SlSu+3I1xkX/neCql0RuyaBUkHQB/acxdK6lvjn+ms8DAVUz7HbsgQ0dnY+wElPsgTYG61SU9SQPW/zb1anDIUp+64NA6+jACaKBnQ8bdnVCr4l0TZVLv/ZYBanYMo5/uP0VfbveuJGT+a1dV4PuPS/2HZ7lQylPmoHjNdbtpsmT/2+K1ICfMAhDTlpps5EO8/n37a3F93Nt44FyiSkftW+UzSOzpYgOLHUUziyrZDcGiU4Mu1ESmmrAJV5idT3p/15zjc9PfrDnm3n7CIuI4gZkMa+PPS+M4F0t3ulyqHjC5FELN1i4ShU/N2HKcDP9Yq8KuZU0P2WWBkGIZmdDFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9K9cfY5Ty6ZcQoW4MXlClsqa5N5qXoNFuUNrZMaHUuM=;
 b=eWpjBv1JVW1Ygom4lce1yWhCy1uitArRtPIQ7GQ/VWdZmzIHSBsNnaqf1k3K1dxiwzy8QhwOKhE5GlsWsw4bBpaPxOdDV9KZmezHZopCBd6BDQ2B+ynn47wvS2qBTePHEH7Ka+0DA+Lsymfc8SQExXZZft6ctZp5MOUvo2UJc9Qc+y6AJRwbrHG/bOSlEEm3PdoY+p3KZKqd1UpOHHtdc8Tbr0wqkVUbFJEAslM673gz04xx0u6/qY4OdkMiuo24Z9/qn3iMK22Fe9pBF9nYmWfiBJqyl3rrXYVB4gGbT0+qdPKk24fYlecSgX3PboJpIB/PXQojrHliZDS7MHh9FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9K9cfY5Ty6ZcQoW4MXlClsqa5N5qXoNFuUNrZMaHUuM=;
 b=vdYT8Q075G70R+7PwwinlytQwaHeS+I1ADDBF2jEkjekY9ALm5OB/jyOkIyTkG0zbe5K2WRBHAdpXddne7sjRQ8JzLZI3rrkBWPrs9C7P4o/bk6k9JQYaSMtCewAxSsAY7T+pcnzNfWdsn83UPxkD3zSFAPA+oMekyNUSXK4DLT2DHgz3wrvSRlEe3JhWoLyD0k2jijRc/+VqA1ZAJAloy/mIrUjwplBIaBXgHKSzGGplwOPP54CRMRL0tVYrHgtgrYzF2xO5aQwsvgUNuk/oJ+VDEwDL5GscHUo/wNGQLcgM/Bj8tGFynAQsacsoCkuSmpwM9YXQdXptNNgEwYGLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB12274.eurprd04.prod.outlook.com (2603:10a6:10:62b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 01:22:27 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Wed, 29 Jul 2026
 01:22:27 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 29 Jul 2026 09:25:40 +0800
Subject: [PATCH 5/7] arm64: dts: imx93-11x11-frdm: rename vdevbuffer to
 vdev0buffer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-rproc-dts-v1-5-368bca0b309f@nxp.com>
References: <20260729-rproc-dts-v1-0-368bca0b309f@nxp.com>
In-Reply-To: <20260729-rproc-dts-v1-0-368bca0b309f@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Francesco Valla <francesco@valla.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5P287CA0181.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB12274:EE_
X-MS-Office365-Filtering-Correlation-Id: 368cb14c-81b0-46f9-700c-08deed0fda46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|7416014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	O/up1385ewjUN6LSbltxPoIYXY9hE6FWrvYPYhmAUE0Zh5xREWw8KrhC42zr1HJdDiaViWGpYlX1gYCNUBjuWZ5fdWXEieliehbLjL0y1u6WzEwo6mTrOQMVNR/fs3mSDGHl/oMY3AymEw5AHKjrsQCo9UXivoDcRnjR09F+Qf9E5iJCrBiBdBxgXscNrFxscG2NsJz5QebulYctygtasZftaePgB4fbXH6B7m9wCn+Om8qT1YNNuM2nTmdxwrufj0zlQu/WzJmdN13t4iwUlUo9YD+PD22UNIPy7cNu9ZlMlPyroOk9RMSUP8lHYmm0IL1rXG9gjgozGiPqrjpAVLaFG1Xz6ZBzJWdT4Qgg7TfW4NKEteMdVJlmD9/jAlkmSc0xKDvpJF5GU5TK/LSBnBDXUiDYhWtU2i76ggP05+lXFHViML9IZkVG/QxaQIJCHu9p2X954xqHGL8SM1TMy6na4UUQ0VaB2nrAdMSiKWBloHwYQ+SIm5QIPpXbev8b+d25pRwTozuzZf7aWacScQFp6JlmCojEoCkC49dC00uDwwuBJUo3vXjNvkq+bE+2doLkoUlbXUH0SYelpTWvg6oKHbfG5MJugdueXfMIPtcqWzv+nKRSF/5qzs76rbhMTyAm4cFDMLk7McOnT0Rb+nVGDB0Cr1AOMkVUJw7qEsU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(7416014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2JEN0N2WDdSMSswUFl2ck9NaXR0TCt0UXlaU09wSGpUcXJFeWVSeTR3bGtu?=
 =?utf-8?B?NmxoUXZJYWtyNm1reUZ4Y3JJWk9ScnZnYUZvMjdobWdNZVIybm04cTg4U3VV?=
 =?utf-8?B?RTYzcjJjSlhhTG5LaEdTM3lIMjlVWnRMR2Q4UktKM2J1cytZUjQvSUpaNWxt?=
 =?utf-8?B?NEpnR0VTeWNIUEl5NVNTUGVQZ28ybktwZldrY0pNemlRN1VKZHc2N3g2OXVH?=
 =?utf-8?B?OEl4R0NEUkx0OWhNK0dYaVBDc09Od1dkejFhTFJ6UHkrUVNMalVvQ05BTU54?=
 =?utf-8?B?aEJsV0NtNnk0UlcvdDhpenFabEx5THEyY1ZQSHlFenc5TTg0em4rejR1Z2xk?=
 =?utf-8?B?dVlwWGh2Rm9YM1FrV29UQXVLZGlDSDRVVTJ5REtPVzRqM0F1Y3pZMk5pUlZk?=
 =?utf-8?B?c01oeTQ5QkN1V2hkQVJabTJranRlT2xGMGRncmtOVnIyZVpJcVN0T3pkTEF6?=
 =?utf-8?B?VGtzREE2OXdZZW16c3hLbUZHRkxWMGVKTUk2TTZ2RFVjV3lJOHZSOXNxbjNK?=
 =?utf-8?B?TTlhcXM4aW1QSHdEdnd4UXF2MVlNSkFDYlBIWjZpM0crL2FHbzBwaTJIY1Jh?=
 =?utf-8?B?VkI3MVNKcXR5MzZib25LaXJTcjNXTEhST0xlZ1NmZEpEd2dadEtKTlFlVmEx?=
 =?utf-8?B?ZGxTbVRZVFpEZi9BWHU3dzliUHllN0E3MUtQa2xhQi9lYzUwSnBMcVpuMFN4?=
 =?utf-8?B?VDIvVnFXVXYvZG56UDBtb3piV293bCtxZUZNU0JFWWw4RXp3aDFTU2pIVU9U?=
 =?utf-8?B?Rm81bm9tL2xMOUk2VlZZRGpNdG9LZkUwYUJUS2pZa3VUK08rRmp6L1IrOXk4?=
 =?utf-8?B?VzkxMkpvamZGT2E4QUdWODNHdi92U3hDaFJxTnlmOEViV0RpVm5aK3dGWVRW?=
 =?utf-8?B?QXdsay9FajhUM1B3OGd6R2JCNnlva2I0SnhVdWhxYVRBY2c3RTlSWUJUUC9V?=
 =?utf-8?B?UjdmM25pZG5wVzB0ejVpa2hOVkF1OEpLYXI4Ny9RUUZ5NzAvUnNpdldVcGZO?=
 =?utf-8?B?K0xGMUQzTDZmWkh4c1g3bFFjbGVFejNSb3pMck1NMkdkSytKQittcHZ5UzEx?=
 =?utf-8?B?Tk9JRHVjRzZ3cTVvV3Npa1A2U0Y1MU5jbzdtSFgySE53UlcyN0p6WFFOam8z?=
 =?utf-8?B?OFkxZmE4R2pmQ3ZoTDMvbzlWZ3pCeHVTMnB3QVhRYjhiNVRDS0ozeDB5aTBh?=
 =?utf-8?B?cEhuWFRJNVVucjltUUFScTJ4aWltekU5d2hJR1dEdVkwUGE0NVRpQmIyeUts?=
 =?utf-8?B?TDIySnMyMFNiWURXNW15VUwyRlcxWG4vQjltUXRCVDlEUnZISTBSOXZVRTRj?=
 =?utf-8?B?YnFEckFWcWlyMTV2WXQzdmM2cWtaYUFXL1NkMjQ5NU03eW9Wa3l5WWdDK2c3?=
 =?utf-8?B?ZlRoUGNmSDJXd3NjdDc3MkQ1a1hyT2NYYUxhSDgvM2R2dnJ6MkZOWnRpUzMw?=
 =?utf-8?B?MU9LN3NwWU15ckRqSytXMGE5VW1mTExtSmhzbkx1OTFJc21YTENoby81ZzhF?=
 =?utf-8?B?aGV6cEJseThNeUUxVitYRzlFVHI1NzFseVErR2lKZXoxcXJnd0w5ekk2MEVV?=
 =?utf-8?B?ZE16R0RtZ0hYd1l1OXdXS0hBU0E0ZVpydGo0WjhZZks0cXlqdW9KckcrOWVL?=
 =?utf-8?B?Mlk3dURWSXNLbGMySkllTys0MjJ0WWlWa29GdE93T2o1d1ErZnQwKzhtTGhN?=
 =?utf-8?B?UE84NEtVRExtYUJRQ1Bndy9ubU9ub1N1ZEVySkdtNldLQ1RWWFRVT3k4cGQv?=
 =?utf-8?B?S0tvUkhHZWh6WmxaaUJOYVJOeXVsbExrL2FZR3ZPK293Y1dFWjVvMHVPdVlY?=
 =?utf-8?B?YWE0M2NFSnZpTmIrRXR3cmU5b1hYcW1qVHVLenBsRWlGdG4vWGtId3QzN0o5?=
 =?utf-8?B?QnU3eGlJbDJpOVI1eFNMWFgzdklTTW05VDBEU0lTKzZJSEk0Q0x1dFBrbTRZ?=
 =?utf-8?B?U2d5K1dDNVpTT0psVlpSR2hOc3N2TndQV1ZKTmdVYzJ4TGhaa3hhNmxNazZ5?=
 =?utf-8?B?YndiWlVKb1IwSkdBQjNZVU40YnFieUE1eUZmWC9venptNllNUmtlVGxac3V1?=
 =?utf-8?B?YjUwbGp3eWhuZjV3S2sySHgwQTcwT3k3Yi95cGRlR21UNXl0d3RqRVhsVEVM?=
 =?utf-8?B?eDI3cTRzNm15TGVOanBpWWFZOHRhV3RNRldmL0g3SStGMERlSFova1JBTlpW?=
 =?utf-8?B?YlI5QjNETDZIMjc5cXRyOXZOYStXY0ZlQnNCbnlMUi9mekl5Tk9nL2dSOWRw?=
 =?utf-8?B?d3ZjNjM4cFFZTEkzL1RmS3l0NldvVHY2Y1d4YzM0WkN0VUVhWjROdTg2S2dj?=
 =?utf-8?B?VytqcVVLQUF3WjFna2IwQUNqYmI2a2lrdVd1bGhBVzNPREZIV1kwOHE4bGEw?=
 =?utf-8?Q?84lVvLeDX0TR/WpTX/GCeUGsWUBuF2WRDSb91?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 368cb14c-81b0-46f9-700c-08deed0fda46
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 01:22:27.7532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ugtwsd0A35S5Kvi34cQkaeilwwY9Xhsd6Fj42Z6PCKNZyapJKbBPiJCcEvV5hlWsqQ+x7GgIR/p4SrujD2lmk7w+drK6eZFyeud3aLz4XIZm5IclD0tgCQEm/OU0Z7PW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12274

From: Peng Fan <peng.fan@nxp.com>

The imx_rproc driver checks for the name "vdev0buffer" to skip mapping
the vdev buffer region, as it is handled by rproc_add_virtio_dev.
With the node named "vdevbuffer", the check fails and the region gets
unnecessarily mapped. Rename it to "vdev0buffer" to match what the
driver expects.

Fixes: eb2f28413e23 ("arm64: dts: freescale: add support for NXP i.MX93 FRDM")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
index bd14ba28690c0..0f75524ab7354 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
@@ -114,7 +114,7 @@ vdev1vring1: vdev1vring1@a4018000 {
 			no-map;
 		};
 
-		vdevbuffer: vdevbuffer@a4020000 {
+		vdev0buffer: vdev0buffer@a4020000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0xa4020000 0 0x100000>;
 			no-map;
@@ -148,7 +148,7 @@ &cm33 {
 		 <&mu1 1 1>,
 		 <&mu1 3 1>;
 	mbox-names = "tx", "rx", "rxdb";
-	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+	memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
 			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
 	status = "okay";
 };

-- 
2.34.1

