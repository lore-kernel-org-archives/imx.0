Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013013.outbound.protection.outlook.com [52.101.72.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA55376BF4
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 02:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785377818; cv=fail; b=dVCPLQWOIwh+QljTlE50ClZ0jCfVDj+Bkigkgk/kDl4rylq2B0avuAv+Y5iqynYBB3FJ5wQy9lPm0cb6Y5D+tm/y0Vw1g8ZvdZuQtKGIai88PTnj9PH+EUfOHt+d0m0NA160LqNsWfEDd65Na/XgbN1B3nSsHvaQPnTzv9UhOks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785377818; c=relaxed/simple;
	bh=k3tVYja4n56wZfNeNEWqSJWwCEyCF973W9fJXHTvQI0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=K3rdhHe9gctwiudjsexskNQVRHczcFsdTUghsWJp7pI5qw9ucQ9TLTPPsp+2AdT04Y27naiI5UgQL9ZaSofDseq1JLAOuKHkW/YoKDMBjjJ9bpNe11VbZZQ+Li9sfRtajMtmpp1GtbGQYlEyzj9/chOqi+JDJAj6dyIbti86NMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e3lQRHyV; arc=fail smtp.client-ip=52.101.72.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e3lQRHyV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOPo/1lN6lUsQWL+6c6zPXLEu+FlI4l7itk/Y3wPVMMSn/KZ8HqwHnJ4hiXDWApEhqJphPpbAoy5DYKEMm2pp8UVM/mqwObrwD2B6UFZY9Hy32vnx7qefcqYCZA2cXrk4uSMBFGGPi+NzOXDH5v/r/uH6P9zOP4VlXosnaFCKMO/AZUo1AmemZkcz5m2Mhq2fFyC84vb+o64fuQVqHkb23ay5hxz3b3ZThPzvl0ZOEJ2JT3qvdFNuFHusUlaoObChlHaSVLZzSe0ywzTe1ap2JetB8RU9VopLhuNINqZj/sSm1HAQnY/8VmgynEMKVsH4Sql7m4NYbAjrBG58CnEIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTuEprvwrjk7mBn3yzDyr9Ex54iO4keA813TAWto3bc=;
 b=eB5zJMq3DBdrIHPnVoNuXc0QUrYHrIsVT9J1TcaTZl4GEiDorpA8sbMj1+CGYPQ93cb/sp9InrUlHF08yBnuVBVDPssMR6tCQkLhi1xCCfiPQ09VGERjWKMr0M4QWy9jwg+GjZslLaIMFdewwKA1mnv6Jo4I1rVDFevunXWBYPUvM44LSuI2E/VliU8w34sCt8q9eeGT4aagC8BhveWDVU8+4YLUg4wNR+1uICFe+94FstHhu257K+SKxja768AWYsahlJ4befPiaEkPKBAk0iqQb5w0fVrqoibBmLJL3uACd0lMnKld6vHyT/ToAHZLWYMMk7i5bFE814W2H8/XnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTuEprvwrjk7mBn3yzDyr9Ex54iO4keA813TAWto3bc=;
 b=e3lQRHyVUgOES93jhzqkm8c1CTfaNEPT2apUF1et3rQzteodgdHbBqjBm4XhlP3fS5c5y2NpVTCDyvPdbGamKz14H8WDnVXwMbdAJy6LLPvprzAcAiAsnm/5rUr+YLjUhCWXLMnxkDGo31BOUH927ZkDiFDNCMIuozp5ONJJ3nFKAkyTXQPrpN+efD5wWfnwkqFz4gIA1nzQ8J9ZAw5pxBdOwcl8YhG3DPqX3e8RrAxSHlQWumQ/SjAfcLfPIMa1qcl3N7AxH362LJfJ/Oft6MVyhlvVyXXdI4b/gxJoU790VRzdfRrr7XTrXsn3FQRU5/pBI0iu/dq3tC1QorTgig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by VI0PR04MB10174.eurprd04.prod.outlook.com (2603:10a6:800:243::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 02:16:29 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 02:16:29 +0000
From: pankaj.gupta@oss.nxp.com
Date: Thu, 30 Jul 2026 08:36:34 +0530
Subject: [PATCH v32 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-imx-se-if-v32-6-95f56dff4ba9@nxp.com>
References: <20260730-imx-se-if-v32-0-95f56dff4ba9@nxp.com>
In-Reply-To: <20260730-imx-se-if-v32-0-95f56dff4ba9@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785380794; l=1927;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=DSprtaFK9KsBwngLc2U94WQMZZff55qYg4dIQt6mh+k=;
 b=/24BGpRqDIaOrcXln6Vk4ZhswcRnqYGu1KdX2Ajffuu4PhqfMhPewf0Y/HCQCHnlDWkNBnis8
 uQNGOhrcOSPCPsBRYE0eH6pURZrf5jG0ahaYpb/4/0XawA83yItwq4J
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::8) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|VI0PR04MB10174:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fe40037-6d67-4356-60ba-08deede090cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|23010399003|376014|7416014|10067099003|56012099006|11063799006|22082099003|3023799007|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	DdhogAizfif2lGcgtoE3g0yI/5GvpzVLfbowkW9+vdl3G9L1pljAsWZ00o7UxWuwxRbVDNWlM2sesj6WI4WcP1OBwBLqD8BQOITI6hdkyZ8AJuKoZa6AUzqN+pE7vKZIEuVfymtJrnZH8xIrhHQ+JvXDXDvFNb8ZRdo48k21rQ8WqUyr+GpUwA4svonm4lh0N1gPGi6R12W06LBZejmnJyy1q+x9NOHdBdZwr0Ci6/qAyQQGTAbOnH39/8AzwzYhnMnkPoVec1KH1ziMO71y9SNX/npMXDXeaixVAsVz3GJkqZ2mglQBS+1gl7uG+jT7xBvzi5V19+bHi2GO0U+VeQOkX2/Fej/D0fSLHTPnnWczcompgiH6INCcwgiRm+LFsC5/eTjZfV5H2Ywe3ZZsMRPZI7KOicaTrfGqQhSYZwPB3oAWX4E8uqP3JUcaKahcwOw5J90aWyjBCG+SjrFVLy0ZR7gaaT+fI6ZRWSXvTKh6hLbyR1QZG5nvgT6B3bnbjzFxUq7Nyd7du8twoUvI6AuE63hLCMmKnGmGvdyPMsX41iBDuZrzHXy1kj0S9kchnnpmpiVcjUJF+R+x9GiKX5bVQpz3RRd+Isc32i4sZwdmQPnl0zN0w3bZnZNhXBaljjht7E6NFqjN+zpjYYhKUA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(23010399003)(376014)(7416014)(10067099003)(56012099006)(11063799006)(22082099003)(3023799007)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVdNWWZVTEJMMytNNldJTktFcFZzMytCaFphR3lINnFoODVueFo4RXdEREs5?=
 =?utf-8?B?OHluMWhHcVZUOTRJQUM0Q2UxSFVjT21TekhnMjY4NXFyYUdpZStYRnY5bVo4?=
 =?utf-8?B?TVlIYWZySUFNT2NwT1BQK0ZROTduUmVzK3FnOW82bGxkbFFIU3dNeVFrSGZa?=
 =?utf-8?B?UTZhdUdZaFNBM1EvT3BXZjhSa3N1OEFYYmZYK3NMbWZpVGZxRVByYTRnMEN4?=
 =?utf-8?B?MURGSnBIWVhhZ1F2YnlEL0w0b0lJNEVzWXk3TFp1czgvTlU3REkwektoK0Ns?=
 =?utf-8?B?YmNaeVN5VmtmdUxmeGlYbnltOUpoaTArWDBZWnBxYndncGxBWndhT0xDdHhm?=
 =?utf-8?B?bFA0cGJWZ2hlSENHYmtaVWlMMkJIWUozYkpVSkF0encwNm9aS2luV2JBYml1?=
 =?utf-8?B?bTFSdUpJUTA4V3Q4Nnh6cFN0YzNpY0ZyNjZSZTJIalZObDJnR2JTd29wL281?=
 =?utf-8?B?YXFGN2lLMjdwN1FUZEZRZVVldXBNQ3hhQjd1REk0WEh1UGMxUXV4aVNQVmRT?=
 =?utf-8?B?RXRSWE5OT3dQMVc3TytFeXI5VlRCek5jalNzamJTcmp6S0Z6Y3JvSXJrM0JO?=
 =?utf-8?B?bUxlUlVOeDNqcUZUVDNNWlczV3FLRVo5NU1mM2ptUGtmTDZLSzBLc3ZJWjFj?=
 =?utf-8?B?K2UyWlM0QmxCZnIyVE96blVFaFVXekt1c1dNMCtEK1NVbnhEbExBdmd6bFAr?=
 =?utf-8?B?dE1rcEhYQ08xQmxFaVBYQU5nMjVzajlQY1IwdTRrVnFxUlozRW04RG5WeU13?=
 =?utf-8?B?d0pqdVNOaWxmM0NEZWExcThQcEF0Q3EyNm1COW9xQ3htaUkyRC9nMW5ZK1Yw?=
 =?utf-8?B?UHg0UW40LzhsQmcxTlVlSGNvcWFaa2VxT3BmM0c3K2oybmhmUDYwU0VsV2tW?=
 =?utf-8?B?ZGtySlo5Z29xWWVPL0l6T05HandKL3UvMmdPSkZiK1BsQXBYMU1Tb3lGL3BI?=
 =?utf-8?B?Y3J5a2J1dm9Ra2JnMjIxa25qRVhPZDRGQ1hGTEtNRUxjaHFhWnhLYzFlOVY5?=
 =?utf-8?B?eEFiN1NpaXVsVDA2MVBEd0psWmNNbHVkZmVQcGlrRnNNZzgrdW9BRVRYVzc1?=
 =?utf-8?B?TDNUaUhWLzdHWS9CRllJTS9heG5BTVoxMEJacHdjMCtiR0xpWDhqenJ1YnZV?=
 =?utf-8?B?UGtXVGdzMWdLTk5MRjl1MGNsZ0pyZHhjODFkek1aRkJyMVoxVjJoUFNiMnh0?=
 =?utf-8?B?Y3ZNNjRkV1RvYlpBa3JxSjJTa0oyNU16RGt1aHJLSG9HTjhwbmFFTEFTMjVW?=
 =?utf-8?B?MVdocVBTNHJFeitaaTVldjFMQU1QS05QZHliZWxoY01SUlNkaHpZbHdjZmk4?=
 =?utf-8?B?S05zRVQwWUV1dXFLOXVmSDFVcmtKcWh4cFFTQ1VKRWxNWS9GN1NZbVFTcDdN?=
 =?utf-8?B?ekRpTXFLMXlTcDdCSmFDM3Y5VkZEdlRpdEFoWk9Sc3JBd0hUS2RIRTBLeW5B?=
 =?utf-8?B?a2dmU2J1MEtvZFd1Y1lRUUF3VWVSMVl3S2dQdjNBZmpSOWJyakxEWWdwQ0pP?=
 =?utf-8?B?STEyZnJRUko2N2ZVVlNpaUI1WVgwMkw0K3ZOOE02QWNjVERDa05OQm9RM0Jz?=
 =?utf-8?B?cXZFVFJLMHNVckptQlk1amFzRzFWbEtBSjZGeTlhbmtJWnEyTWI5V1EyT3d0?=
 =?utf-8?B?VUhpelFHWENMZkF2UmgySHBMUmIyZTV4ZHh4RW5wTXhLamV2emtZYzIraXRa?=
 =?utf-8?B?bzdwa3BxbE9xWUViTTR5cWoxMFByRnFXNHJ3OFZZMXkwVnJwaGtTRkZEQi9D?=
 =?utf-8?B?T0ViaS9OR2ZXNEpwTnNiUmJHU0NoN3V0YWJ4dlRIVjAvZCtmYVhlOXRrdUR3?=
 =?utf-8?B?dzZYRW1kcXZHYXcyM2dDaDNNMmgyUUtJZG5remM0MHNjeDNwNFRiVUpyNzhi?=
 =?utf-8?B?aVFFbmlCdGh3R0RhcVV0UUxuL1V6aksxK3kxWlhBNC9hcFkra0RaRzBxWGZr?=
 =?utf-8?B?ZHBTME5YVG9oVHRDeXdQZE85MVVWdXhwVFh1dWF6QTgzdVpkT2tCMkdPSC9z?=
 =?utf-8?B?YW4rWTRBVE9odzhVelpNRTlqS2ZxNG1ONDk2YTZTMndGN1BBYUlUNU51ejQ3?=
 =?utf-8?B?cmdDdU5rSVdudTBtOUVNenhraG9hdjR0TGV2UzJJaU9KTjMrOE12eCtPRnJV?=
 =?utf-8?B?NzhteVFHdEtYcEhPU1RSSFVjY2hKSDRsbzFEMTJLNnRGWWI5eHRwbDZPSCt4?=
 =?utf-8?B?YjU0blhjQUhCMEovVytoRUVJOUQwR3lqWTNDdnV6OEVaeFp6RWJPUG5EcmNL?=
 =?utf-8?B?NExiWnRPQk9YRVhpRDV1c0pvUFRvcmVDUm10d1RIb1UvYzRYR1hucEw0T1lZ?=
 =?utf-8?B?YzRyR2ZhQWJuWFB3dVNjZm5sYWFzVTFPZmF5ZGR3OTBWeHJGcDdpWDlVMHV0?=
 =?utf-8?Q?rlEQJCROwHnOVBXVPPwPiSoJ7aVuhsOPtKyoa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe40037-6d67-4356-60ba-08deede090cf
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 02:16:29.3251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFqHIeb9bX26A1VeXZBsJ+xWjko3X2EAa+L1CawHG1XZRy9Vc36yOE+EgUphVlID2K1DmKVIv+LH+yfDyUQLZWaftSdebCQm6JGtuc01UhdAU/HqH5wbYNwli86C8bTQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10174

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
dtsi, together with a label for sram@2201f000 that the node references.

Keep the node disabled in the SoC dtsi so it does not impose a
reserved-memory requirement on every board. Boards enable the enclave and
provide its memory-region by including imx8ulp-firmware.dtsi.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes from v30 to v31:
- Keep the node disabled in the SoC dtsi so it does not impose a
  reserved-memory requirement on every board. Boards enable the enclave and
  provide its memory-region by including imx8ulp-firmware.dtsi.

Reported-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Closes: https://sashiko.dev/#/patchset/20260724-imx-se-if-v30-0-ce8ba256692c@nxp.com?part=6
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index c6d1bb9edf38..38233dd74ee3 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -153,7 +153,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram0: sram@2201f000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2201f000 0x0 0x1000>;
 
@@ -185,6 +185,14 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			compatible = "fsl,imx8ulp-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			sram = <&sram0>;
+			status = "disabled";
+		};
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0

