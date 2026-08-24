Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013029.outbound.protection.outlook.com [40.107.162.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DDC3A8759
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 09:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562232; cv=fail; b=QzSjIyeQyTp1soHitux8krTfHIEVFBiO9FcnjsiG4semqq4fj9sa9nNuxa0sD82hx8F5sLDbZEapAvH8HehR1BfnvEbvwM0ctEAm/47lScNeGcW0urBn65a1juDUEsC9UCAoqUl8kwqhf72HnNRylew0fRF6Rc5KNxj7d46LeLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562232; c=relaxed/simple;
	bh=SvjmVxHpX/hgBe0iVy00oZ1C75QjIjSINEhU8j+fUs8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=em6OEkdBlUXanY4qUbs6rdQfAZDLfNEgcDx6brCyjN++kFzF0t9I6jvHh/DM2USZ0XToZ9+lzXHBCpITzQKSWXWsH0ytrTM2wqtq2k6tgf+tBBl2cHwt648hiJfEA71XE93To2/3WFb2VjUmN+dS9ab/x0t9h0Ehabkq65/SnLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sA0ITwxy; arc=fail smtp.client-ip=40.107.162.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sA0ITwxy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDQTvO1tCV1ZcAANMOKFOA/Fs/PI4N2x8Tx3Z4cZrabszxBNtChWaHQ3IF1HIYfGX2LEQrKKLivt7fXhckPJqhWUN0Bo4DZIx07ZacMIi+yHUEICGkW8EA7xo1i2jQYn2diXJQpslKLKeHtr8arWRycUjJYHUvNlozjsJv3qXF0dIQNCGDs5kYOPk+Iwq+7QH/VoWKlJhRQUJzLe2YX9GI4Iv7tXVeLF67T/ci5StHqClubA1WzQV2PDaE81MUOWPGMwosNgR+b3KVKlTpaasEY6BoGB0dsCtdQHIRL7mIVlVU77EKVyaIPD/VaqDXoGNssQEfMZ7Fu6M0WhPI3jvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2i+XMUvEqKzc7yHTfRvhcQY8Gt+wl/MWYpn41allwYo=;
 b=WwRZDddl7Q/RfOY6uZG549bjz4cD8+WJH5cXMBgJ/y4h8nCuRTy8V+EH9yrZTeJXyxqRgJBkCbYc674zy9sHfyH4lhn3LfeYe3HgRDSq0iya9fd+y2t2SkZjXhS4r/kbMaFUUzyAPWcpH7dTmMb4qYfMkqJcHUisvNjfGlsD+vkccJC5D9WIV42vbNNxIjWgcwc671rmm9URTRJDmoULW0VgQe/hOKaVS7Ll6+FQ0XNSd1GGVVybes3H11aypyowNhDf4Gx6RvFQQbjdHzIlf3G8pfiXH25SxfvPwN2htgFKNVj/CC5NOFSW9fXXRKtpR3s0i4l5PV1lyeMQw4gHnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2i+XMUvEqKzc7yHTfRvhcQY8Gt+wl/MWYpn41allwYo=;
 b=sA0ITwxypxd+JGtZWf4ZHYvJGaNeXSEIv2x7LV0zXX1GBhd7P3HR1Q0738HcOoAAV4c7cIMlql8cGGcCX9eS1sSnyvIeyRczKyfRtEKwZmc06qsSi8RGcOzSVVTwUA4tXlRgpPjzdMJA8U7v2yw48wE2MO0bbAt1Aa46jIhMT6+Q82N2RXkUtJKkSDRq9ObZS6Ia8CqL9SuLBn7zIcCTiEK0uRu/zseMdRCUEuPXj/+rlymiU8mTpJ2tvC+ZgrzEHcpKsC316vLPh+T3z2fT8SD4ZLksLrZ168KX0tBO6jQZ1sbFkxHleWqGrRKw2E+8lFzY7E3+6++x6xzsIaJUWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by GV1PR04MB10478.eurprd04.prod.outlook.com (2603:10a6:150:1d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 09:03:41 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 09:03:41 +0000
From: pankaj.gupta@oss.nxp.com
Date: Mon, 24 Aug 2026 20:03:31 +0530
Subject: [PATCH v41 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-imx-se-if-v41-6-29cf129e4d86@nxp.com>
References: <20260824-imx-se-if-v41-0-29cf129e4d86@nxp.com>
In-Reply-To: <20260824-imx-se-if-v41-0-29cf129e4d86@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787582007; l=1532;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=Fey7Yf+dWHev0BhTzN9X8KrA/PpJDRs7p80ZHkKltXs=;
 b=riSjks/uTu9dKCWBTRyhzOT/WylBBPNGw79YxpB4xXMqTEKqVdgBsTVU2VEb6HA5jC4TciWJ8
 HoB8sFPt2KmBDwamptl7/wzW/RtKnAem1KIYVBjKhXynQ3X1cFe72rR
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|GV1PR04MB10478:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a06c33-b308-4558-59f9-08df01be980f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|11063799006|56012099006|10067099003|3023799007|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sMSRqhvSkttfhLkrJk8wYjhD9D9yADjLotlfBLLwCzS5knL9QHZiUXVkqIrial3MRXmWnORHeYnvgXTHgGYJ8CHzvV/2Qecj3xBGjm+T3iNfVz26kgockUzD9MB6Pot2eD0HlU5KAXqpYzgkTZLDsrWcU80DYk8kyqe+ur0tZpZ7UURBMDryfjjs8w5pTXj86b0QSCiHYS6haqzyoxdLlyi47BZqcDagsMKnBtv8lA8QHlCoTvOaAlHcIdG3oP5HzQ07RDyLfDcBW683QH3ze2moYejTk1cdjHT1YXi3nKf3cbRFjCskhJMRCw7PhwCaT7kw01CQngs26NGyLnfIcueKhntueYmvkEmYJGq6VMkIeBBqF3o9ZJgN88vPQqyjtASJ2lbMzVfoiEGVHM8BRa7NqEPi7zWZl03rncLzyvTxnsEPTxDuFNuxvaxQbEhjPa6qp2gGOO5sYb30ASSFWGnwMcNixN/zhgYQ57yjhVpV8Nub5oteMqRhnPY1jLmO32ZqrcNE/c3bGOcR/F0WrcqAk4rFVFCGfr8buiBf8NcTmKz2CP5h13AMvXHHw1aVkSsqUU15zArFD0xKF4VeA0O7JTPoWsbrY3g+/0gHTJ3xZhrP3hqYoy2g80BlRUpIm0a7OVKo4VlX1+SRA7j8wFVxL7rmgCCnOl2ZiDfPDrs27WlfkfYX3pxAAJR+wpw9OU19ZwksIY6Qy/4eMUsgXw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(11063799006)(56012099006)(10067099003)(3023799007)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3B6TGRqcTBVMmpteUJGWXpTcENLY2JUb2l2V0xBSkVybTVLYXNjWVN2UUUz?=
 =?utf-8?B?SUdMNUpNK3lVMVNFYjF1V0RPTlpzZ1NVTHhsdnk3MUl2bEtOMURtSGMxR2FI?=
 =?utf-8?B?dEtEMDJ5bWRXT2dUdTErMkdGNUV0NkQ3RGxvMXRMaGd3OWNza0U3ckYzTjU5?=
 =?utf-8?B?bUM1NDN5M0FucnI5eWRRRS84cUFDV0Q4L25ncExmajA0dExUMmtTbWZhWUhj?=
 =?utf-8?B?ZGhHMzdVRWF1dE1LMkxxdDJYNUUvOTN1aFJZaU5FR2RRSGVDQkNJNGpyb2Yv?=
 =?utf-8?B?b3VvbzlPdU95Wit0b1V6dDhjeVhlajl1MUFOcnZtOTdrdnBYT1FuK2pxUGQ1?=
 =?utf-8?B?TUVUUjRzT0w0bHMxNUlIWW9jK1kzR3l5QXBiZEpmcVFrWmkvYmVhSmpOMFhV?=
 =?utf-8?B?andFUGZ2QitrWDVTMHRvRkM5cTY2WFRzRGFzR3h2UzNxbnY4VXgrWHd2WTFT?=
 =?utf-8?B?SHNNZjdtSTFVNzhHV1hjSEU1UjhscEx4emhld2F2QnFDbE5XNGdpd3R5Wkll?=
 =?utf-8?B?R2xVcVFLN2hmOHZsNUxFSTJyUVNiWHdtdlF3Nk95NTNEZ1RBc2ovdkNzdTJ3?=
 =?utf-8?B?d1laWWxrQ3VpdjhnN21tQnp5UzA1UmlrNEsxeUVRNnE3OWRzSXkvZGdhd21u?=
 =?utf-8?B?VmVlb3dzWE11UWdLQTFWcGRZdHhZM1lWYnlvRWlNKzVLaEdFWGZNcjVPWjVi?=
 =?utf-8?B?dzFpMEY3MDROUVVXWUtoU0lJYldtKzZBOFMwQ3Y3WVJ4UVNIWUVWZC95MkJj?=
 =?utf-8?B?eXZKVU85R3RxZEhOTlQ2ckNGU3FMRDNCVXBsdTgxT1RPaGZOWTlkc1ZDeXQ0?=
 =?utf-8?B?VS9ES0hVWEJpRi9obWM1USt5QnJnU2J5MFgvK2VMVjZITUZqbVp2VG1STCtL?=
 =?utf-8?B?OEF1YU9WN3JQZDV2dUdTTWdtMGkwRE1TbFJPdkllR1crMEQ2a05yNUZNTGho?=
 =?utf-8?B?V0xreW5oUnE2TXl6Y0k1SmhzeFZTOXFmUTVxaWQvMWc4TmNXdnpjQmNVbWls?=
 =?utf-8?B?VEJ3ZlhRR200c2ZicFBVdHdGZGdVV2pPdlhLc0FIRG9ScC9EbFY5czRtMk55?=
 =?utf-8?B?MGI4RUIxNEl6TmlMTm4xTE5COFFZaWxma01zOFY3NzBrNTZ3dHNxZXhUbzc0?=
 =?utf-8?B?WVp5WExtZno4YVFlanBhMG44QzBQVmVNa1VoSkdIWk1EV2Fwdk90T2tyK2pv?=
 =?utf-8?B?Qnk0NkgzakY5SXlSWFkrVUlNMWNFenphUzIrNytSMXVKYzZaZHFkL0pMck5l?=
 =?utf-8?B?MHhSYWp5a1hTQUdTb2JERWtlSjRSTCtCUTNrK3M5SlBoVXB1NWUxU1BJZHJG?=
 =?utf-8?B?R29odTAxSFZpZGJEN1ZnYmN4TUxrNlNDM0ErblJ4aGQrcXBqN2pmR283ZndZ?=
 =?utf-8?B?K2lHV1VTTVlCV3FJK1hHMnhxZng3RUhkdE9WbzgxUU45dFNicndIL3pMUHZT?=
 =?utf-8?B?Qm42aTFqSTVPYmxyUEl2Sm1XZWVKV2pZemZTcjRyWkJ2RWNmOTNYUzJKU1ZN?=
 =?utf-8?B?a241MXZnQmZTSGpKbmtQM0NCL0lSTnZNUzk3NHE5eXVIaFBtdzh5bCtKMHQ2?=
 =?utf-8?B?TWJzTlBqbEdkNlBERVFZUDQvRmhMckNMRVh0R2g0bS9mRXA1ajNPNUNtQkJn?=
 =?utf-8?B?UzlvTjFEdE41bmJSRFFlcDNoOWVyR1N3R2JieFpaTkFGL1FreW5LSjBZY0Yr?=
 =?utf-8?B?Z0piNVh6QW5UbUtSUXpzT3MrNGx5L0twZzJSMEplZjZRNnBWRUEyUjhtbXFL?=
 =?utf-8?B?K1JPVmdRdVN1TWxjZStnVmRkcTFZelpmSFM4Qm1rZ2pQWGpwQkpVNk00bnIv?=
 =?utf-8?B?U2M5c0oxbGVCZEp5aFZKTEZVcW9BQzM2N0NQR2xPOUZMVVN6TXZaMVV3UGRK?=
 =?utf-8?B?U0YxWjZlaTBBYlJQMm8wdXdrOHkrRXk1QWVFMlA0ckpDbk55cnUxS1dwL2Yx?=
 =?utf-8?B?UVhQVGNIYzJkRjNyM1FzWkhvbnN1MU14N01UZTE4NzJnUFA1Q3ZZZDQwWFQy?=
 =?utf-8?B?VUFlOTczRmdwUXhBM0trd2YzSHNCYk4xL2JxTmFXaGRwWmVSY0FrdUt0K01w?=
 =?utf-8?B?ZjZsODR6bERIYnpKOTdkNnIrV3B4Q1RnVzk0UGtveU1BblZJdlRlT214TWcx?=
 =?utf-8?B?UERLcnBjZ0dnQ3ZHSEtvWlZFdnZOVWFGV1F6bVJycGpGQ3VOY1dGZDZzWk5o?=
 =?utf-8?B?dWdGOWswdnNTb2h4U285czY3dXBhM29rQ0dsQVAxLzkrRDBwSndUd2lxUUVY?=
 =?utf-8?B?YTdvaUt1SGFEaGtiUUVnUFZMM1cxOUVNUlZiQThORkQ0akRLeGwvMmlFVE5p?=
 =?utf-8?B?NHBid0hCMVZUWlAyVkpTSjlOSTYxaDZhZ1N1dHVWaWovY0swWHUyMHBwVm4x?=
 =?utf-8?Q?tvF10nhZ/qU+2q0ilWsvr7Gy7AfwXex66uAZg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a06c33-b308-4558-59f9-08df01be980f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 09:03:41.7453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhJv3oEfqfxvWa5Uon5xmn2SjbUah8idkVDH5nK+/g61HMSkcPu+yPrf5A7PG1JXMrZpByOWWcMgPZ0+Ix90quQz3YHaK2L/AD2pR4swXkLyy8SGMZ2QIHsJdjABqVq0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10478

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
dtsi, together with a label for sram@2201f000 that the node references.

Keep the node disabled in the SoC dtsi so it does not impose a
reserved-memory requirement on every board. Boards enable the enclave and
provide its memory-region by including imx8ulp-firmware.dtsi.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

