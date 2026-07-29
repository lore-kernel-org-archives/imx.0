Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013029.outbound.protection.outlook.com [52.101.83.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E1148C41C
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 13:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330302; cv=fail; b=DPiYbhcwnQ9qcXU6Z+jKXoZS+mbqypdGwkX8KAaEgBRIQcZchmvrRW0LGu9MiC1loONvfTwwHfd3DJXVg+5d6FXjfLHSXY+CrZqey5ov1PokCjA113TmC2eth61dFDawgb+pmIVDEmjZHtxOiJ4bTXawF9xSDZgvaO98yWHxsFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330302; c=relaxed/simple;
	bh=cjSW8vZBGoxcaiPc7ZbyoIHg96CxJQ48NfEMlzdVDE0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YvunwOrc+qxnKaYf2DCw7OSH1WfDu2NWFS3k4i6thrJo/SCeZB4Tcs7Kol1WEwHk3SoO8jM5x3UpKHRzBBrBDQWVMrp1d76548UkOCai+/EpoqdorTCeuN9Z3ROPBOr0T7jYCkpcOULADgDr8iQTWFfNsHURq/pKk72gDDFdARA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=exne7qkF; arc=fail smtp.client-ip=52.101.83.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="exne7qkF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTrD8f7paE5sJZrHOjaT7uFVm+sfGIxNzCj9jGnGfRyKBDk0lAzmgjYkHZrHRXEpKQOdNENAMNtwMblNZgskFWKnx/5FfyMOxo1mc7Y7RwM/+yIUBVuZPM2pU4eFeNAIoIhJJHa3HKquB4fxMPJoGeG5Gb7wmg8bkytbiRUxckBRoEs/b0eMVNlOKvJlldDCmf5fccHaWhD5gh+A31Vwa9MI/7+ZfnmyDVWQB/LUZN0dgWOHWBHt/pIaLn4cwCeGs5ZNZ1wkfr7Dr9OpXGmqibQFi/yRWVA4CqvVXr93NfadRfzElYyViob+F7hQw+/llvi22AIA3PZyirYHd6L+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9K9cfY5Ty6ZcQoW4MXlClsqa5N5qXoNFuUNrZMaHUuM=;
 b=Z19FBfgI1D9SJBlOl4ZAbk8IwVDCfBeyY6MdDp4vmNo8Al76a0CMbn9U45/wyska+KKyXc279u9qZk/MiDOy9Ps+kVxCUTf17fUP8yeRi3hlbpoJwYXhfSWVmaoUfk8SUY4RjOBlJahh18JSCSPnO1Fa+H7yb3tMhTi7nfBfYCYNcL2672Uq0/emr88VaR0p47+gGIsZ+g0TfRLrBtsEqDehiX2CEDyZzuTsW3Vr/uaNdsRRI03dCHs5Lj48rh636F4t4VTqmQcOdj7zgND8h0gmpmMTKLN0m0lXUaqxLTHYSIs+tv4zhwuErKsjHqLR9hQ/ybyi1TnAMm2ECoZ6Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9K9cfY5Ty6ZcQoW4MXlClsqa5N5qXoNFuUNrZMaHUuM=;
 b=exne7qkFUB+VAqFaizAzPIuvGD3KcSt1q4K1SGnSB5viG6fTG7X99A+hkAMU2F9uf4sR+Z9cLNdq9W1WYS9Glh0RemBMCD13CJao75F3C0P6CugJn3FNcTM0brOLh+75nVUcU9ZNwGgCmMSTsaDgJTMWGA/FsfQ/P3QMSxfnvtRV1S1CGcNNw6ZlWw4vKgR5E4pN/Mdli581QVl9BB3IS0e+t7+Wf2W7T8slj+oz0VEwcE7vd+05BDjoKC5kWailR1gmP5zdHWj/yJ0MJVllHf9O74z5eJUZTVjcsgNLCTP2np76ueSGZF/0r02ZgkZHtYZuNXbuhQULFF5kE60gYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB10718.eurprd04.prod.outlook.com (2603:10a6:10:58f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 13:04:57 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Wed, 29 Jul 2026
 13:04:57 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 29 Jul 2026 21:08:03 +0800
Subject: [PATCH v2 07/12] arm64: dts: imx93-11x11-frdm: fix reserved memory
 node names for remoteproc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-rproc-dts-v2-7-debbe0816202@nxp.com>
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
X-ClientProxiedBy: SI2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:194::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB10718:EE_
X-MS-Office365-Filtering-Correlation-Id: d1808a82-545a-4ab1-687b-08deed71fdb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|376014|7416014|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YjBdjCFqmXYyEpi4OW8JuWItvUVt4a7Hl5Ftavw61Lgtd+WSdHLorZC6J9iOeK2esD4ypHHwJK1h7gVQ5Kq4pyZn+NY53M9oEyvkf/85ift2PoS8BrPy6Kmw+gHRD9ORwoDoedI/7DPVK0YNFc4zWkIipfYKZ49Ep6gUvvtazdrLvmdppFwIZu7QfHOcCO3a4mdv7K4sq0bNoAwJJVfrOvhyIpI3ofmneQHetAwSvfcpDNVOauyv+TQfi+z6siE99afo0eBo9uUlWV6lPmpU7zycVw++nfKut4sehMxVs9IxZvCFRUUZc8MLSFRh73QS1uwV8IzeglcaCOI1wbd84ZUIWIIJ4quRi1EI+sEoR4nFAoOCUYpLzXY9n5BLSdtHFuBxPib820sC4CysRdlqqTfuQ3L6Ob2Dz0bZPpZV98HOoBgWPLg1vwHx21MKHgzJjmeA/6+PD6m4sKNArp3Wf3dVm9gGtrkGVw0xfgziUANcLoGfERVW2hMP4dzqFJa8LTNXYRrtcONXOIlNujitnqR2YUYjB3XYJC2S1rx9XuP/r+tFz2b77c70emS16azxUAP/SsmDOGUDzL0xHwjjGZEZ5h4fE65XwI3y0JXACgjBAlhy1or8sCVCKDP5M+Hj6aFlcbefyT6qcBbjJcIKw1WOhS0ggAb+weNFpkABV3E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(376014)(7416014)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnIxR204WWpCaEliTmdzV3JoTUxmdDU3REsvRVB6djkvQ1RmcTdYU0RSRnN2?=
 =?utf-8?B?QkY1SGd1SitMZjZKYlB5ajhtT2xFUVFLVlZObnFCaGxTUC9xQnFZUGsrZFBa?=
 =?utf-8?B?eXdmYUlDZUtGaFVIWGQ2OVZvUVEzWGFXMUNxMXpMTEJrWnFUMjd5RmRrVFEz?=
 =?utf-8?B?RFlTelJpaExJWGNxMHhyd28xL1RPZlNrT3o4dnMzOXRsaG1GaXNweHlaaGx6?=
 =?utf-8?B?QnhDaCsrQ0lEQUdNT01UaWNUVm10SUdJdFNCM1ROMHJrakE0cEllaCtzUjN5?=
 =?utf-8?B?Qi9jYkZ6WXhSZVdWME5JN2UyL1NaMENpSHpRdWFVM24wZW9WeGdzMWZpWmFJ?=
 =?utf-8?B?SlIzWSs5ZjdGNmN2SVh3WDU1ZXBCazlqbEhWdjFmOGtyQlgwbDN1UXhjTUV3?=
 =?utf-8?B?VWYwdFdrTXphRkRXSDIvTmNWSUZra0c5RVZSYXhUR3Vjbi9kZmFEODhnTWhn?=
 =?utf-8?B?ZDNsTDVJaXUrM2ZhMDFBT1haQ1FrQkFhZDB2bjFZL1A4UTBkUnFOMjFQUWRT?=
 =?utf-8?B?QWZoZFoyTEFSNjMxV1ErUERHK0E3dCtEQllZbytoS210ZU9vWWFlTXJTUFJw?=
 =?utf-8?B?d1o1eVk1YmJkSm5DL3NTckxJZ3RDMThGOWtleCs5NnlZYTI4TXc3RXp5QS9D?=
 =?utf-8?B?c1BuM0FXbjMySUhvUkFFUldRYldJT0Z4MnZtQkFvKzZ1TFdVTVl6c0JJWkRD?=
 =?utf-8?B?VWo0emtqZnMyajJicDdOTk9JSDlzVHArd1FPRGNOOUJlUEduMzFnUkJWdXRJ?=
 =?utf-8?B?d0dNNG5GNmVvbnh4K3ZSR3pzVXlTcFN5U2hhT1RQN1dZNU1CaU4wYk1hWVJo?=
 =?utf-8?B?Z1pyeHZLVUVCZ0xUNFJ6WHMvTGcxRjE4RjBhL0FDYUxwSXU0d3pwbm9TL3d4?=
 =?utf-8?B?TlI5eWpRcFh4cFVyelNvRldWS2JkMDZEWWJMOERJV3F1RWNkSmY1aU01M1pI?=
 =?utf-8?B?MzlCZGpNV3VSditjS2FCUzBJOWozRDAwNFp5d2JPRTROMi9xTVd2bndZT1Vx?=
 =?utf-8?B?UmNkVURFNERSUkh0UEVnV3hlWWdlWHl6UFo4ZnVDVlcyMEhvQ040cDJ6elI3?=
 =?utf-8?B?VDZwYnJ1UWlFaVE0YlRaNUlvVjJNdk5qMElsS0RtbzlFOXE4M1l1aVhwYzhz?=
 =?utf-8?B?QmZhbEZud0JMckRmRGp3NnkvWWtwd2xHNTRkRDRqMDNnbHlrTTFuVnhCbUpi?=
 =?utf-8?B?QXB2SW1FaGgxSGZOQmM2ZG5teHJMaEIybUtxYUpHaHZqWDdDdjY4a3NCMm54?=
 =?utf-8?B?M1hzaUlaQk81ZG0xMDhCVEtNb0lhYTJ1RVVPMW5OK3BkQm4rK3hwS2krU0VE?=
 =?utf-8?B?TXNCeE9DNVVaSjh3MkRYb0JHS1ZXbE1IQkh2eW1IQzc3L0xlc1FqVnFpOUo2?=
 =?utf-8?B?dUVrN3RPek5QQldXaVhoeUp4UHBCeGRjRWF6TGIxZTM1cUNtRXczKzJ3Nm5J?=
 =?utf-8?B?cm1hUWJoTEFxaEJEai9XZEhSRVd0Zy9MVUlPdVMwT1dINldxM2dIa1dyTXA5?=
 =?utf-8?B?M05VWlVwRXYvZHVlRHZsM1V5Q1p6YkJscFRZb3lhOG9RV0huUndacEpxUWdN?=
 =?utf-8?B?WWUwMVJGdlF0NXF6V21sd0kxTnRLRVNvdldVWmJHNFJHKzVCZEN1MlR2aEQr?=
 =?utf-8?B?ZGlkai9vamlYcG1lakJ0bjliV21nUkZrMFlOQ1NhZUlGbnFuenNUREtSOFJ1?=
 =?utf-8?B?TnpSY1ZuNXQ2NkJGeTRBbDFHZ3pZakJ3K0ErbzVVQzltNjVTOGs1N3YzWC9V?=
 =?utf-8?B?QndJN0wycUdzdGtEU1EvSDdKa2Fod2p4MnhYOEVROUtVcEhPdjc5MTJ2M1VG?=
 =?utf-8?B?QjZua2FkeHp4ZHlUcTF6T0s3TWdLOUgxS2h0U292SE9UbENLZzZaVGtrSWRm?=
 =?utf-8?B?ZnNoM2NLdW1rNHlJUzdFMlpNdGlhaFFRcDVDQnZjeklZaU1yeGVvSXc0R1Fa?=
 =?utf-8?B?V3FlMThOclQ1MGZOWlM5WG1LRHYyZWVRRFdjZ29BVlRzT2ZjVXNjRDNncTdZ?=
 =?utf-8?B?ZmpXaXZ0UTJsTDBxNTV3cjdQRVQ3L3dNMzJBeXBqR1c5YllIeTdJanVrd0xv?=
 =?utf-8?B?MXczNDhnV3ZKZW1uQVluTzVscFdNS1d3Z0E4MG5SUVZLeE1yMG0xU2txNmRY?=
 =?utf-8?B?bGFZbTJGT2FqdnRHTkQ3dTB0QWM4ZUpmcW5qTnVqNHR3VlpoenphSXdnUDZ0?=
 =?utf-8?B?a1I4V1Z4UmJwRnNmUy94bU5Tb2xMdjdjMXU1N0cwWm0vNjRTdS9FVkJuVmwy?=
 =?utf-8?B?a3RzSEtPczdoZGgwd0wrNGpqMi9uZE1OK05wdUpjeitURnRVY28waXd4NFJQ?=
 =?utf-8?B?dThYbVRtT0gxU3krQVY3ZkhiMTlKSVV2czFMRi92U0FCS0xHM3ovYW9EeTBn?=
 =?utf-8?Q?kwj4Gt01LkagQKZCc/FoR7ID71XEidVNLikuT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1808a82-545a-4ab1-687b-08deed71fdb2
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 13:04:57.7586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCI7izdAZo1JAfpKxKj0L93sY5wpFATvD8lN9AElvIOx8MwOAFgX6Oa9nW31tnP2dg333VnTpq8ZEAurNptE7HjNtBMB2J+kVxWewIqL6V3E5aQV6pZhB5340wUhrm3i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10718

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

