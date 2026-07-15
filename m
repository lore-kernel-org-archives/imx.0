Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013029.outbound.protection.outlook.com [40.107.159.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D85480359
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 12:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118618; cv=fail; b=tn6BfkTfM1JDWSetXpF2pGvLD60/K8DdnzWRmcqmb9HOTF3CutLXyZn98sy+UhYVLzQNRBATyzn8IOEZ3C4nTrHmlji2C9WE7Q233l1QpCO9bJBq/YO36gdDi4DUAc5ZXD+GlAkaQCg9IdRB4CIxXu7G8k3Rsy+gPrYnwOwhsm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118618; c=relaxed/simple;
	bh=98rCzOIBsXYmEiXpYRIGXFyYILUYAovUoGmqqRVla5M=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Xfp1uzTL7nlNG9Yfpnm7xfC5S715QA90xbSe9JogPFRSj28LVWULsZL0HqtcWAIKzN1XW2Cc+2W2tLrEsjYbiMs/d4i8S4VTXYwWd3c6yKx2e2b/Ttdp1S13h3pFmioYiMUOWQuj+oKGeAAesFXH8R9XsZNsENxOp7xU+9CZLPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XpqXJ+3g; arc=fail smtp.client-ip=40.107.159.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XpqXJ+3g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EhLIoW/kfv5mhODpmRNroYtF2OOQj10++MLltbGidGKv2yOa1sR4/B4ftBdccs+f4p2Y/LS3yz5ZEs9Z8QLil/I8KYUUc8IeZaCL/PCeY9beQngI1jg/85DWCZ0FqfEyQ+yhD8SkQKS4xASl8iRCdwc//moeNqRaHqal1DaTb0VtRpAXJATeqV1KAfkqeXlC48JSXDZDq++ZxH/51TJCNpDuTIQMvtgrCVk357ypfmuM6JdrtDyp8gEZA52rzfRI1z+NHDQptlNkvl/mRD7pvwzkPWxjOqgJoVI2FdjeqWI8BqX0OUsJcfozpdwPohH9AaRKri5ih/nIFuvu13gOuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lc9S/gQN9yG4jR6E3MT30mHdRLsYnwddjKeJ3BVaSGY=;
 b=LwdxPC8Vho78Hw401uwK77HzSqMCHRGUiT0U6FjbJ1UXRP1wBzRMK32zyToCh2f9rJQwiUz517SF7G2yAc1rgBAsDecDz0twUVI+RFk6ELw0C2arc5XpKAp6CRWu+cBDyjDZqLaGIol/dEk04fWS5lPjhWHk1GOZ9mKyR40tem3BG9W2MlXHwpMnuvBxdYaDyZOaz72ZZoq3nqxScws5SArY8uaX2dtpjS3PcYL86bVaRYZFh/8eXSwiBPo4zjxs4JZI3mcN4h2CISgF41KIGDd8SARZJ1mDp0rI9R7lgt1GIsaLInTlmOQvSifm+92SnPS38KIrdbAjUnPgSQSe1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lc9S/gQN9yG4jR6E3MT30mHdRLsYnwddjKeJ3BVaSGY=;
 b=XpqXJ+3grNEyRnKtSAqPcikGF6OFO7vYA4pAjQ5V2GGOBXanTaYOT39hvck/z6wec9qKzggVfczu/d7l0FQWq1qqGLfNzW9qrLuxYGcO/HMqKRvhZiGX7YyFC0nSILCTuAbVzn20O6d6JrXW7pLIZhGewhob1kFj8AKF9NDtErWTbKnd+ywcTLWWSpNqMR4nyWNtxzs4Q6HGx39FkrejzzfPoRnSWCr08aTv0lZ1R0GCgsUqW+vPlJRwgmPgcsUEpubMrwddiCkce5fjEquJDG9eI2DktGopK3LiO1+SI8kOWoixWmv8zSi0T0V+YB/wqQMSvM3y6WD5+B4JcFEjHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS1PR04MB9684.eurprd04.prod.outlook.com (2603:10a6:20b:474::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 12:30:09 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 12:30:09 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Jul 2026 20:33:04 +0800
Subject: [PATCH 3/9] arm64: dts: imx8ulp: Correct SRAM node address and
 size to cover full SSRAM P2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx8ulp-dts-v1-3-19651358b599@nxp.com>
References: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
In-Reply-To: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:194::23) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS1PR04MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: 82870323-dc75-483b-d659-08dee26ccf36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|19092799006|366016|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	gjtqmP5arfBMWcAFMHzdMXC1mTQiVgW7Xw5DYeBkXNVZEGmDF/dXVoewro5lE29df7CbsrBjgLrPAGJ/kNfWaI8Xh4puaH0XsTZN7dDr7lNJzHTuA8uoa+YeAsXFbb7U8b/Hi3evUL0GW525jLJrcdJfXmCKPQHm5pysBDCn9l7FVNPkgz/t+c0j1dH5K8RbFsMlm0epplQycXRpef8mbs3jPI/N0hnxq2S0oDjCp2OFzcsGNW4wZfEytznkpRRY9gWEnIRLHgNnHbbZB3yKy9Ya/on6TdU1qlFnKL/mR/JQRyQg80GeAuEpitEcfyAm3VvBLmQo0T3W3JAGnQq3Gsxj78I3dEqs88ckWrKjye1rvJ5H1fwTzCr3vXa98cU2ifMB6CA7a3rf+4w4xkIfesMEXQB3L55A52DAEs1+mHZBhE1+7+UUVAyu00euU8+NF/KojyoPOYKi1pZBNatcNM5NkNNFR0d8GYhcCBP4ccmRRSNLA6rLgD5f8UduS+aD5QDpXKbk+0yLiGWNcylhodQAMsa4F1IXx+/vhZwxwsPpTzHBnLU1F0E0lrAKNO1vaWXkdix3CQ1qycT3LV/J6aAdo6BZrNBaixVmWbYl6dvA39cLz1kWhAfmJxsVrazSsAj/yDZRbAWzj2eAVovqah4ioxLgd20eQ3MT5ZegqN4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(19092799006)(366016)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzZveWlGdFlPU3h6Wjh4cWJRRjZ5UnlnLzZ6RzB6NUNkcTcrQURNK29EQUlI?=
 =?utf-8?B?emVBU0JRdmNxV2pmWGkyYi9SQmJ4TWRXU1ZhVUwxOFZFRzM2VG1YMEY5YWRn?=
 =?utf-8?B?eVE1ckE2cmNFL0QzR3p0QUphMzZHNEMrVFBxZ3EzQ1Y2alUySE5BanZqYmY2?=
 =?utf-8?B?MXVjcHVKZWZmekpTOCsxZklydUloUUVtTE9Ub3RXampzQjR0NGNVa3NHMHd6?=
 =?utf-8?B?MHp1MHYrU2VER3d5RXVqMCtKUUtUV1ViOXpnbVpIdFI1UnJDKzhtTVBtbmhC?=
 =?utf-8?B?aUF0LzVUd3JMemt3TkxrZWVKQmlFV0ovUWZKNXptWDFZTnk5OERhcHNtZEpI?=
 =?utf-8?B?UG1mY1puZnpFVUw2SVZzOStOYWQxdytLQ0ZWWThzTWFKUFlxa0FZcTVzcjg0?=
 =?utf-8?B?V3lNV0ZQaWdwaWtTUmNkeU12Y1cxK2Q3Mm9ubStOMWhZTzdpYmhZMy9rV3gr?=
 =?utf-8?B?NTRnaThOSVhZazB5UkViN0hxenlpM3pJdW9QbTNxSm00dE14REorVTFFOEU1?=
 =?utf-8?B?RmZFRmNIK2pjb0NtMjBVOGRsNTNpR3NtWmExd2paNW5wbzhLakNtZGlKZ3Zi?=
 =?utf-8?B?ZHE0V29MdmtYckhFcUNvZVRQdFBHcllzeUtJTG41SXB4ZG5UdXNnWk0yZEhl?=
 =?utf-8?B?eko4V1A5NXFwbFBaS0ErL3dFdDlIMVVZRUhRcnBMc043eEFmQXBveGc3MGhP?=
 =?utf-8?B?RWtHY2xKVE1WaVJHdm9OTnBqeEtIVFowVmJLcnVQN29zWnpjSjZmVVVoRVND?=
 =?utf-8?B?WnFXSU5hNUJPVGQybGtvYTdxZzhJcXA4emlkT0UrcVl6Z2N4NnJmZEFDS3Er?=
 =?utf-8?B?SFJDcnNRdGxqOTc0M2srWHdFbk9GR3kxeGYvb3BSbTY4QU9yK2ZlUUpkNVNK?=
 =?utf-8?B?dUpoYWd4M0JrV2ZRSDhsNjJCWlVtb0xiVmFRRDZlcjJxYktpNTNYQmM3ZFQy?=
 =?utf-8?B?TjgreU4zdERNRy9RZjNGL3RCQ2lrWDhhOG9OckRyVEw5WTdqanRsMWVzVmEz?=
 =?utf-8?B?Mm81ZFNHdEY2bDdDL1NWOEJ1MFZFQll5TU9GOXJib3dCRGMyM01GRDBnenVC?=
 =?utf-8?B?b2RrNDJxcUJ5TUxWM0pTUUFMSnN6ZVcyVVBaTEVJcVdTK1BCWVEvZ2RZYmJo?=
 =?utf-8?B?T2krYzEwdEtNT2RWNm5DeWRvOHdqZjF4dzBkL3E2ZVg4MnBIV1JYTndWNm5O?=
 =?utf-8?B?Z3o2bEhlZ3pvRWRUWHFXeWlEUkhXY25rRTVUd25FbXJkWVFTYUNTTm1rMndM?=
 =?utf-8?B?OTJUU0RTR0cyaTlLVVdEcTFUVWN5THhSc1l2K0dKZzZoWlFEQTJoN0JFR2RB?=
 =?utf-8?B?Szg2OU00RVBFYmRhR3JvOEtKcTRUTDh5eDg2YXBuTnNpNytzVUZONm5KMlRo?=
 =?utf-8?B?ZmFqZlJsSGxSLzRoU2JHVDRNNWJnd2hUQ2dvRktlUEcyYTVRalFHUXJ0S0JL?=
 =?utf-8?B?UEFMWGZEdnpjeU5SL1JOTm53Tmw4SUhnWGpwKzQ4R3J3QnFZSmxybWprTkpn?=
 =?utf-8?B?YnVwbTRLcElwbFZDeEtnMzFndkhvL21xQk9zZWpYTXczOEVHaGdEMjFrald5?=
 =?utf-8?B?N1Z3bzlBczZqRkJBamVCR2RCamZRbEUzNmErNlNEMUNob05lenZtcXJYcmV2?=
 =?utf-8?B?aldjV1BGMkJWeHFvbGZQMjhCbnhRWi9kY05uaFJLME53TE45UTB3V2R2KzVD?=
 =?utf-8?B?R0tTeVkrWkdQclVDU05CWk5MNi9pWlNQSDNvUmp4RE1kTDJ1Y04xWjd6TkN1?=
 =?utf-8?B?SXF3aVk2VFBvcmJVallZQytUeUFpYUFKeVZkYWl6TXkrU0tuamZ4Q0FUL25E?=
 =?utf-8?B?clpEL051YVpOeFlla2ZCQWdUV2F1Z1VUM3VKNkhWY25kbTBCaWUxSFltSDJu?=
 =?utf-8?B?bHRka09lUCs4RWMzTjI3dm1KMDk4ZkZUQjhnb3BRNWh4OXhHOU9IZEZ5Uk95?=
 =?utf-8?B?N2FOR2t5NjNjOXpReTFyVkkzZDB0cXR6UFBsL2tyTGFjcUhnVkpvam1TUGRi?=
 =?utf-8?B?Y09xL0lvdGs0bW94UnNKeXFTZkR2T2xHRExtMnFDc05PaG4vanVhS3JHZzZx?=
 =?utf-8?B?VVJKR3NwS1FKbDNRU1ZONUtUbDJzdFd2bDFlS1B3cC9ackZIVm40M08xRnBD?=
 =?utf-8?B?bWxJSmhuTDNyQXRVQ3BhUUlIcFZwTkU5NE5Hbmo1M2NDMU9hVXlHZjZoU2Fu?=
 =?utf-8?B?Yy9HVnA2ZG5nMStSOXdMQmY1aWZXZUM2M25YcmFzWlZubVJYZE1UOHRMTklq?=
 =?utf-8?B?V3ptcmg2R2hDSndxRC92TkdiSmJCS3FUOHJWdXpKRk5pdjZvbGtkek9PRmRH?=
 =?utf-8?B?cXVJVWlQVHREbXVWaHo5dlBLVkwwOXJGTmNiZXpsYlNRMlZzdHlwRXFYbjJ0?=
 =?utf-8?Q?u2p8oCyWIiT8pTwPzYFV/MfhL0dRlzQCpH440?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82870323-dc75-483b-d659-08dee26ccf36
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:30:09.6810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xIv7PHNl0tecOhbd43/Z0VOoOK8Op3p6ht9GXQsD8FDbM8iibH9lNlbWTyQhBHwAHP2yLAltTcBqP1dbld0xSU/RoifgBmbfXUZ/7TKXidInXpdVGvQQibniS5fXddp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9684

From: Peng Fan <peng.fan@nxp.com>

The SSRAM P2 partition starts at 0x22010000 with a size of 64 KB.
The previous node only mapped the last 4 KB (0x2201f000, 0x1000) which
was used for the SCMI shared memory buffer. Update the base address and
size to cover the full P2 region so it can also serve as a general
purpose SRAM pool.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index c82c3388cbe79..173d11dea5d4f 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -154,9 +154,9 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram@22010000 {
 		compatible = "mmio-sram";
-		reg = <0x0 0x2201f000 0x0 0x1000>;
+		reg = <0x0 0x22010000 0x0 0x10000>;
 
 		#address-cells = <1>;
 		#size-cells = <1>;

-- 
2.34.1

