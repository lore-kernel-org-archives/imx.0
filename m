Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013058.outbound.protection.outlook.com [52.101.72.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8664648875A
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 13:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330267; cv=fail; b=MvrhxjX//QGbl2WraVf9GY8nvIBcGErw3R1NEzt5bhI59IzeV5qRkOqiXW7XSMc7NXE08lWf4HQslOjdkw0RWGQZZLVtAf+/LLIcUHzrF6jmAictzMeyI8XyIfVyLyC5vj5Pbkk8+5/afzre0orLruebWhXsVqnP9yaqzjtOPvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330267; c=relaxed/simple;
	bh=J9XD9SmoCDJSsw8+3wIMYQDTG6qMe+9Hil3pu7MCBgA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=g7tcom2HmIbD2C1xFc40ynnGwLTq3mphX2WR39PZgKC0EfNxImw8nv+aM5iW7fkx4R3F3D0nwIYikn353CiGmqYet5CAf540ITC1A8XHyxQGIJNaMqDyfqi3JlSWuaYPcnPr68BntCuVvmCdb5PwoJKYYcF9qPyTbKgUAjLfIaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ws6E7QRg; arc=fail smtp.client-ip=52.101.72.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ws6E7QRg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAgljSFufb2QkSYClo4tWjpdQ6FKZOQQ36ysJlHZ4Y9w0ldOwHJvj/p+adkFyfjJ3oyxqShRCfxXR3QYmlyuaWK47VRXDxTJ98HBKAQULYOaGQokB8WEbcRiWsBWyC3MGBJ+jqSCx8U7eT8M+EKi2R59ihfPTxUk7yEhjqewyaEDIGDvEIQOgdUs8pxY/QTzfaCafnUgTZgE0NTR5HNR7xyejGpRwGjfeojD4r59vd01ty/jouPNWuvC1QtBhvCmqPsxGD+zBd5FurA76DKCtOWQ0pDT78qbiYA2Dh0FlzbD2REyriCT2zPqxGMEI8V8I5lLy2JcHkNlsFJq56J3jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Od8wabZo+dOt9KeIs4ETyJy1oneGSiEu8s1+7xYTsJ0=;
 b=HqY1b5LkTZlwsGblZO8T/9lJ9+9dSAU0jM930CetHUJOTNoPBD8C4ddZ6eJ/q7LbzE/r+q4LZHxObIo7CY819hrfuRpAGlOBmH+W5A9a1d68GTzlpofjQsuLFrqsiGoBqFVKVl9PHi9x5qMezdbCJf2JO5KalHlDAIrPomN9rPzxZ8d+37AcqXStdQSbful6NN7vU8BUSx6DUgnD9iU9sLeOWrFAb20JDwjGrjiF7d6PmNhuuhG1NAEIOVfzrvwxUjbnL7HlzsToMjeb77wQm3BE2CVwKTJjVwj9K4biw+EtyVUmc8vY+0iaBG8utPxNbIhSJeueuZ0ZJ3EwklHNTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Od8wabZo+dOt9KeIs4ETyJy1oneGSiEu8s1+7xYTsJ0=;
 b=Ws6E7QRgU0C2SzSYBqRZ51HLZOzwzgc9HDc7mhyfRkXDSgofhSw51ah9Zk66sjYQgJHRuFVbqmHJi4FNXGCp1LhS44TE/J67wRNM/lyXAkJApstBx10/otNDc9B5vGQAEDv7OjgsexF+96utu0LCBCXXquQRRwKxQkxPzlAMyTJOn/mzVv0wmjFvJSeLbGOdLae794sfrcbduEhiMY4BJstLKdtMFzh/VNoHsaQ61D+Vg9Aeh7N/PEX2/1zT8R/Ns/qansoqrO8FHtWzru2dswBRyi95b9NBK5DwE2mRnJp8iRu69qUBKQaXuYPEkXPw0tyW7NBwlW6T3/3SxzT7cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB10718.eurprd04.prod.outlook.com (2603:10a6:10:58f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 13:04:23 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Wed, 29 Jul 2026
 13:04:23 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 29 Jul 2026 21:07:57 +0800
Subject: [PATCH v2 01/12] arm64: dts: imx8dxl-evk: fix reserved memory node
 names for remoteproc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-rproc-dts-v2-1-debbe0816202@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB10718:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa6695e-de40-45d6-b1a0-08deed71e92b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|376014|7416014|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ve2zwdHYocResUDPjEqR0z9DkudOK3Zc5/jCgtsBWPsHriuYDVJALELCKayYfcbXhyea95WAR0sUfJLW0Tc29ViZXhXWfnWCQWaaGTx59VmnVI7xx936LEFFlGex7iKTEFtltYgJwEFSibDJF5wykleI31pIEcvfStO0rqbisNayfjYB3yn69O/JFywQjBg2Zgd6blbhanV/bX6pikghvRG8NAGam2mwvNqPsKdRGthXk9cn7jgbfs69jHEjEDdqiU8aC5z6GZduQLnQt8UqsITxhz0vJCktfjzkcKRWP6qgOG578vUpkMBJymwc6IVYUgBJamoQ55jndMfiam7O3nhbrOdfkYQif6TmUkiCWUDH/4FlwREfSAYINH4ZZbrEkC9E3yxeXHur/GKSlGliPYaNihpBPHhRe4zlT2CJcSyJx779wtPjDY+vXW81OaUPb/Xboe1WRQ/1SM82EnrXATRBtSKmi7bKiAiyA0fB75L8vi/qJaYt32yw63URC5i9Aa8yr4r/t6iJTd9crf5O6AqwTV609igc04DHO5Nh2oAX6wmIododviGjpJclAr0BToPkb49hcdaXSnV8Z7fhUqoaeCrUDdLI7g4c/f1NOzBESrdgq26auphf5qfgNh+RzfX+3gpSMPlNpFt2O4y4FzYbOoFDyyC/0RKZhi86XFk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(376014)(7416014)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFBvWVJjVWFsZVdnRFltTGEwNGJzWjdWSXhzNERpcWZURnQzRUk2VmFJclJl?=
 =?utf-8?B?R1N6OCs0UGR0U1psZEhDelVyZ2RzZTZWZERHR1ZNUzE1RmVPemJLTWVVdUl5?=
 =?utf-8?B?Um05RS9PVzFvUFdiM28vMDRla1JGV21nYmRFRWtGQWVPQjlsZGNoa0FIWThP?=
 =?utf-8?B?RHAxc2c4ZFRVVHdCU2VWRkFPOVBYeXdGR3lBU0JXNk1raVhPK203enNtNWNN?=
 =?utf-8?B?M2N3NkJPdEpoYm5KaEdMTHdiY3FTZ3N4VTNvL2dzeHYyUjY5cmxWK1RSRWxS?=
 =?utf-8?B?TnlZWDAvYjVNaklHZTh2ZVpzNlplSlgyYmtWbXpMcDR6amZ6dHhxVGtMUm04?=
 =?utf-8?B?V0lWRVZkSm1BVForeFNTNms3TnFYNURHRTcvUzM1VjJ1aHZMVGNkWUs1OVlp?=
 =?utf-8?B?ZDN0YnRnODdmZjF3YkFFZmlwdlNtL0Y2K1lDdHl1eDFnZzBoeG1LTGZTZ1R5?=
 =?utf-8?B?aGdVemtBcys3YnprT0xPMytzQmxnbGZ1c04zWDZlQ0crVk9pVzFZdy8zRDBW?=
 =?utf-8?B?Wjg2QzRUdjdOb0J0cWtsc3EwbUR3cnY1bXRZakdKbzhzd1BCSXppVnJzNnBF?=
 =?utf-8?B?YXhIU1BlcEVlNml3dFdaUHhKeUIzN3VTZkRxRzQ3Z1N1eUpzZ2hZWWxoK3Q0?=
 =?utf-8?B?bEtaeGtZclBXelpBbDY0QlVQZHpuYVhPSk9kT3RxTmp4eGxobUxrZEpBYTZR?=
 =?utf-8?B?WmFpcWU2L3RTb3pKWjJ1VEx2eWpycEVtVmZPbWdEVEwyVWcvMHhWSkF4M2dR?=
 =?utf-8?B?WGwrdjlrbU1BRlJoTVhzaW8yRTg1dHJ4ME1rRTJBM3lmUHYwQnBYS2pSTFAy?=
 =?utf-8?B?cWhUeDhHdDQ1YTF6WG1oSHFQU1JJNzNLMm5tUGcwbi9SS3RPYkcxYkh5THhH?=
 =?utf-8?B?dEowcXoyMTN6VGtrWThudDdqMENsNjhzNDdEYzREb0gwT1RJcUtNajFFZzFp?=
 =?utf-8?B?R2YyM3ZKZGJRWWdCVGdqYkhaZ3lBeXRqRHl5Y2hrMFdkYkFoYnlSS0VobE01?=
 =?utf-8?B?QjZzUjZjSkpwU1Z0d2x4YUNwbmJUSTc0UUIxYzhqV3MxU09hcDV4M1RIZmZu?=
 =?utf-8?B?ZmY3a0pPaDBLSVJFbDVwTVNlV1pkUFA2MlZpMm91ZmdjNTVoVkwycjh5aDd6?=
 =?utf-8?B?enY4U2xnMjZWOXNCTWtOQmV2WGFTeVpHUSt3cHpkSWNtbDUzb0lHVSt6Z1dK?=
 =?utf-8?B?cisyVy9iSEl0QjdxM0VkQ3JxR3U4K0tqSzBkRUl6Ry9KZmxjYlpqdGswZThJ?=
 =?utf-8?B?ZUVqUzY5NWhsY2UyYnBvOGI5elB4dGkzUy80WVVYd3BFcXU5ZEUra29BQ3RU?=
 =?utf-8?B?RFV5NDE0UHdJbzY3YjVCNFhNV29HenVJZ0tsaWcrTktLcmNEbUpKczVoUGp3?=
 =?utf-8?B?N2RORHB3enRJckQzY24vTUxSWm9vTWY2bmlzbUhBdGpXMVZWeFZwVW8yWmlQ?=
 =?utf-8?B?SXpFN3RaVTNCTzlVZkJiYTRyanpkaUhxY2FkUWIrMTdXeG11N0dKdkpXNndF?=
 =?utf-8?B?TUtrbmFxSHpab1lHUTJRTVFwSzUvbVFHMnVoams4REo1YjRvL1hLOW1HQUtS?=
 =?utf-8?B?SUhENWJ4eG1RZTBWa3gwSDdNbmFOQmRtUlhjZk5KY2dIS080TDZib3p5MGhD?=
 =?utf-8?B?SWZJb041NEgxVlVUN3VrMHdyeUE4MDAvWHVFZGxqTytBamhKSUxDY09tck4z?=
 =?utf-8?B?a0xSMXEyR251VVY0WUh1RmNpSGxPWndFbWZKOHhTazJFQ1MydWZSb1hTSzha?=
 =?utf-8?B?Z1hMNFRDem91a1lQYnZPek9BYndkMGcvSTBnRDlITTdWaXR5QmNSbzh2THNj?=
 =?utf-8?B?eW1pL0pBZVVEQnJTemtxU3pBZE5KQXFoenluUzg4YXRQRkhGTUVTMVZJVVBv?=
 =?utf-8?B?UVphblFGeFhxY3lEM3cyNUV5ZENQK1BOWUhPWXhCbThJbVA5K1hlOFBqa3lF?=
 =?utf-8?B?KzdmREY4UTg3WnRucGZYNEFpUGNtRjBhME41OFVnbmFNVnNIOUxaUTZudUZP?=
 =?utf-8?B?NHA5RW5WT2hET2tlTlRUUnN5Ym1relNsMm4ybmRRK1hSVzVpN05RNjM0clJs?=
 =?utf-8?B?SFgyaTEwNjlBb29YYlNDaHh3M1NxeWRqaVl2VWRjdVNnY0hQN08wNjNoMWg3?=
 =?utf-8?B?YU9mL21KUzc1RmdMcGVTZkgrSlRaT2QvUzlzNFRsZ1NiRHRUNDk2SkhyUjVw?=
 =?utf-8?B?RlZLWVBsdkQwb3R1Tm9FZWpkd2lKcWFsNU4xRUgwZTJaV0hldUh5WFFMWm1r?=
 =?utf-8?B?eStDUkVJL3FJbkhMNFZBVlVlMEtETFVTVVltQ00yUVRtWGg5S2dHenZpSmdu?=
 =?utf-8?B?SlVULzJ0WUsrcHJnR0hiQnUvQWNLajd4NTduYzh0Z2RYOTBFWWExa0VodEFV?=
 =?utf-8?Q?TkJuj584ba/Ek/huuyrUXQdnCdHc0bKp0KTgz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa6695e-de40-45d6-b1a0-08deed71e92b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 13:04:23.3316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgnQAMWnFZkRc6p2zci7hl17OoeaLBoQ+QgAZ87Yla03j1MvtuOD7tw6gFjK7PFThLGdBJcLF8N8K3MPqzclxlDXuqT8plkehUXc6bDZJBguPlbmhLhKxJb1HR8F85Hx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10718

From: Peng Fan <peng.fan@nxp.com>

The imx_rproc driver uses node names to identify reserved memory regions.
It checks for "vdev0buffer" to skip mapping, "rsc-table" to locate the
resource table, and "vdev" prefix to filter vdev regions.

Rename the reserved memory nodes to use the expected names so the driver
can correctly identify and handle each region.

Fixes: ee39dbd9a6cb ("arm64: dts: imx8dxl-evk: add imx8dxl_cm4, lsio mu5, related memory region")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
index 0ede0c7ed422c..71eff3efa6d32 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
@@ -29,7 +29,7 @@ imx8dxl-cm4 {
 		clocks = <&clk_dummy>;
 		mbox-names = "tx", "rx", "rxdb";
 		mboxes = <&lsio_mu5 0 1 &lsio_mu5 1 1 &lsio_mu5 3 1>;
-		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
 				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
 		power-domains = <&pd IMX_SC_R_M4_0_PID0>, <&pd IMX_SC_R_M4_0_MU_1A>;
 		fsl,resource-id = <IMX_SC_R_M4_0_PID0>;
@@ -65,32 +65,32 @@ linux,cma {
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

