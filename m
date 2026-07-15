Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011050.outbound.protection.outlook.com [40.107.130.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE82A337B81
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 07:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099269; cv=fail; b=nDwrSw6v4RZEPTxH/tZpf7Q7Wt890/Ht20LHdwWFjfBxqmJB+oyyn7FDdiRV+ow3S9JIKrHcbt5JfTDcSLXbFIidxC9Np5b77BRCdrzJEkF9TN15Hzc8BKo5yY3l3bq27Fgr+InLfoVYtEhZqFvCtW9ar9V76P+UAsw0Nw0olWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099269; c=relaxed/simple;
	bh=UReL2T/2h8jm84gVL5KAHyRnZyV/3rP5rLynRhZnwg0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VE/gfHNIZbls+/xYBvCnS9X2HuI8g4QIQH9iE43gx66sa2JsbsJjAlZFmrA8p7wZfHJXeqk/LymoEWwVDoyY5bLZbut9hjGP/b9oLhE6M0WBoqEGGi6Us96y0pr8/d1JYPDB1Bd4rN//JwYpuUhIG2sKVMGox6fi/3yP/KuQzJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ruptgQ7a; arc=fail smtp.client-ip=40.107.130.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ruptgQ7a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0NjXQOhXV6A1D8k7aHT4hF1hhoskjIM1xjL7WMLnOFtkWK3qLQJKwSkR9UAhOOlgxPdENRU3FAm/H6R0aH2IwGEdb5PH+i546uF5nGLMmDHltyz8xWX9x3A7nh0dYPds8hc+MoXp/w8wxbyzF4zxdEyzq8Rr+y2h+MgHWgwhxwFpsDFUnUu6cWwxG6q0Y6kw8PHD9z+60RwLQQgC92N9O5qexLHXfFRZpKERXVjl2pxTFdxm9L9ycDkkVOnRChJ8i8EyOS7b7tGPsTgxwKPBt5h1HJL8WOyB6lPA6ywcLrBELieIG1M9gcfRUpOwx1lqIkZFHKxh75B+qe3ZIXumA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0olaBufSzEHd67Xi9tY6psOfEsqSKI+Wa6xCDDZwDX4=;
 b=kmr+bZX3gZ8/kafgMZERecVat2X98mL9BnN/ZYdBeL6+A+XAaYtV4PhSE/YY2YitvTCq9sH9sHNLjneczeL+TlTWshruOGB66zdTu6eJR78Kc/5mRl16OdMmNNo0Xfc+FyvSjwHXYtgudC3pqma9px2izg5o59wx6GSNRbJ4hEI/UaWhR1qzjb8ctXnhVi7zj2Y5wTbPbvhsSMPiXwVLF7PeVlEz7UW7NDyc0SgfBldGapU8Ife4yJBVNu3YzB7U+82HKIb/+2grw6dVsNNzpahYfpbd61Dc1dfrMj3fz5FjojldN7DM5AX6Parj9X5SjJuJdsJqYnMCwHZ3hw0m2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0olaBufSzEHd67Xi9tY6psOfEsqSKI+Wa6xCDDZwDX4=;
 b=ruptgQ7av6LA5e/G7ejti0Fha8Ki6CMGFuSSsBY5zMN1bI6h+AjsSSoYw6RHPBS7QD4WqYh+YnS9Q72GQOmTPgh1ZNSPvIJkWACEsiPrzxSVTJMWeJwvdn/G1r928vLqcGM7Bd/x+1MZXb2r3AbNi1y10oJKW1RA9mZ5sc4oLW+ljwHoR03M3xtdMobYYttfwiudR5NJtAc2EBRtvKpTbbOsuQ7SL0dl57P5bjoRThHUetA6uMNugYHbfHLjY+qqYYPtkQ5wo6tqFTDVdImYSFjfm2NpswWPpNH4EiAzsgNRLMIp1YqfCKBWEkhkwLb3oDv5fqhDS+XCJhsV9fKqJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GVXPR04MB10537.eurprd04.prod.outlook.com (2603:10a6:150:21b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 07:07:36 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 07:07:36 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Jul 2026 15:10:40 +0800
Subject: [PATCH 4/4] arm64: dts: imx8ulp-evk: Update rpmsg resource table
 address
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx-rproc-dts-v1-4-d02b583c507b@nxp.com>
References: <20260715-imx-rproc-dts-v1-0-d02b583c507b@nxp.com>
In-Reply-To: <20260715-imx-rproc-dts-v1-0-d02b583c507b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Biwen Li <biwen.li@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA1PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GVXPR04MB10537:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fac66b4-5226-404c-b31b-08dee23fbfb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|7416014|376014|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xfcQGxL4Wrp3ZmHutWq4vkZCXsAVD0eL9Nvc5DwOHticb9ghHwowcxRCvfWAsMGtdN8KwiPFypIDkkGyBv6XzRCwOe6oroYQ5lP1IKIoU+1l2Vwi01bcVDJBM1XJv1SXx01DZkWKe4hqU/cmd5ixVG0auV/MvuWgXN7RpStnWz/SqcMM6vvWXY6DBJFvoiu6H8a+p0ZwxTjJNTjtGdisJ5gHUSzEZ8e14kjpaCS9xNL5Daxr4HI2pyj6IEVMAzhnTLZ5EVFF3Z14EvJrb56S2TSk1vWS2w/AOzmeK44k1hoMZxTSu6bO0vCMptFwZGIgLtXDbJolUG2Nmtlxx8GACneKRW33RSC19/mKFzJyK7wjRtOD7FY4kk0pdcbCQrir6xxIuWMuN6tPUKTLwrl82f+fej96GFEhxmoIZ9j+LC3CjTFe3h2KA2QJ7ZmYGMZ4vh1xWuu1Um3iu7i4aNj3kj9mySC082hLrkLt3ln2uHgjzoapav4fVqqmHAAttkGvcxBE376SQ8/XIYIOy0V9gKvaMBS5gbHj+reergapVieFl8l3xlMNlnGv73hG00sL57uC5g6QCpGh9apwCI6i6hpZPI5uh+Jaa/d86TAZ/YL6pqarpP48jFlN1Byib/OzfG0v8D/w2Q6bNaxa7fY/d/RL68CtFrhpjX3JhunjqAE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(7416014)(376014)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2kydHZlQ1JLaVNjcHAwZU5paklGa2c3d3FUTFh5UGJvZ3loSXpuVGZ0WHIx?=
 =?utf-8?B?d1UxWDRDdXN1UGN6Y205bXQzYjFFWUFFdStGWjUxOUkvTjhibnRVc0h5SlhF?=
 =?utf-8?B?dmxhU0NYMlFxcFMyRTRKY0JvNnNjRjd6Q1Rpc0hzNy9HRkZTR3hFUHdYdzdT?=
 =?utf-8?B?MU90R2VPVysycC9lV3ZFV3NNa25oUDkzY2pTdlR0VUNUYm8xZytKQWF4WFhC?=
 =?utf-8?B?VStpUVVGWmhKb1BTNnRiRlU1NW45ZGM2NTc2MGJlTmZML3RzZzNBOHNNVWtE?=
 =?utf-8?B?NnVTSnBmdmtHZzNZSm11ZzBzaUpNdWxhdStRZCs0Wi82RnVrd2NyVUFEYm9X?=
 =?utf-8?B?V29mRlpYeXZ1b1FjRUxiWkpWbUxKY1NCWkZXVUF1UFFuMUZZbDJpRkhzT3BF?=
 =?utf-8?B?U2taS1dKR285OVk3akE0K1BZTXZqODlFT3FoNVRHajI3Y1VFVVpzZUxhNXZH?=
 =?utf-8?B?ellXK29KL2hhTTZ1cFZGcnRxZlpUUXdKSHpIVExrUWRDSUFZQUwwNDBXTWxJ?=
 =?utf-8?B?Y2VFVUpFOEVtWmxMcUdteWdaWXNqb2ppN2N2c2M4QzBFdWF3b2x2MWwrdTQy?=
 =?utf-8?B?UGRjK05GUDhaS2N5Z0wyQ0pWeVFpZ0NubFpDL1pBQUl1UXV4bjRwYndPQ1B3?=
 =?utf-8?B?RmNON1plM1pwdG5mZEg2UEpnRCt1dGUxNUtlcmNueVZwLzNFdW1wV3ZlTEQv?=
 =?utf-8?B?T3k4M1ViNThwL01GS1hwazVFRWFXV2RsUVM0RWNPeUVFdnVDQnNQbkcwdm1N?=
 =?utf-8?B?K1ZVY29weGFmM0paQVQralkvdWRZNVZWZ1NOeEdydnkvaHE5NWtKaXQyTm00?=
 =?utf-8?B?WlZFRk1ZM05YUzNPK2JPSzh4eitxd3BZNnhsZmlNT1A4U0dvb0ozME4xSGFJ?=
 =?utf-8?B?WGthK1h6ZXZscnN4cDNGalY0RW9TRGVOcEc1bEd4N0hmL0J2aWF0a3Nsa1Zi?=
 =?utf-8?B?T01qNml5d08wbDhWbUt5b3c0RkZDQ2Y5SVBQckRjWkx4K0h3M1F0VGZ4UEVP?=
 =?utf-8?B?WDluRkRMUjN5TmlIUjZPSms5cUpKaS9NSUMvQVhUUGJDZFlPVEFxeTI1YkV2?=
 =?utf-8?B?OHJ0d1NnU3dRMzlaMkZwTjdSOGYxWmxwOFQ2NUJEL0Y0TVBjOWV1VzhSenpP?=
 =?utf-8?B?a1dqN0JiNzBUT0l6bmcxSmZKdTM4YWdmazlrczkveTZJMHAxUDFTaDFqTldD?=
 =?utf-8?B?T2U1aVR2aVl6aklrNlVWOFd1VEY2aWRNb2J1Y2xJR0tsUHZsVUhGY1hIYVpP?=
 =?utf-8?B?aWlPWkhJSTdGUmNFS2dKT3h5OFFIZUhWazc0S2YvTTZQYkdqVDJYYU1rcUEw?=
 =?utf-8?B?bTA0cVl2TlE0N2dYZW5iMWVCbVJwaG1DRVZwVWtBNzdaOWcwVWxnYmJzdlgv?=
 =?utf-8?B?bWxxbk93anIrSkpDRDFiZ0Z2T2dMeDkrUzV2cGNDaGdJYU1TRE5zaTlrNmNi?=
 =?utf-8?B?NklRZ25VQUJvdERoalpZVWJDVE1GYXJTRksycDhJZEc3QS8yRHRhN25nS3Vh?=
 =?utf-8?B?NSs0TTgwTWpxOUpVZXk3b0lTL0xqL3V5Z3RMM0Radmdtd3h0bWlOYnZoQy9P?=
 =?utf-8?B?QnpBSG5XUFBaK3lkejBId0FlcGpKVUFUS3hUZmFKbmoyVmtNMXRySytkOWlo?=
 =?utf-8?B?WFdWYXo2MkZQTU5RbkNTVTlBY2ZQUjNyaVVreVZBOU42UW5Ic250V3hSNTNP?=
 =?utf-8?B?eTRuQWxoV0pSMjZWRm9ZYmc3MlU3NDJDS0R5ZGZnaE1JakV3ZE1vY0VrM1BF?=
 =?utf-8?B?VTFKNnlGejd6cGVwck5FZnlzeDZCZGVhakpmVGZGT0ZPUEFwNWMzT2ZEcXZq?=
 =?utf-8?B?OVRXQUF3aTkwSHBsUjVjeXZucytMOHhWUVhlVW5iNHQ1REg1Z1A5TUMvVHI1?=
 =?utf-8?B?eThtVFNRcG94aTBWTThYcjBSVjFpOEYxMFVvcHRLQ3VtSmc5ZzdOOU1LQm03?=
 =?utf-8?B?QVJuc3Z0UmVmMDNPclU5OCtML3VDMDNXTXBWRmZMbDVSVnEvOWJ2WGFBT2hO?=
 =?utf-8?B?Vm5hMGNRZGZqQTlWM1Q3VXFlUWl6eE14N2tUb0daSE1yS2pZenlHZ0NrSm05?=
 =?utf-8?B?TzN6dnVub0t4bkorNTRZOWxOVG9PSkE1T1plcGJuWHdIaWJvR3FZemdLWW95?=
 =?utf-8?B?NWl5aG1hcDA4ZTFFK1ZpVk92UW1tVHNHanpiTVQwT1M5aWVPcjN0L1JVWktD?=
 =?utf-8?B?cGViNUp5cHVRbWI5Nld1bmtRdmhGV2t0QzhKaUYxZ1VzMUoyRDNRREgrZ1NG?=
 =?utf-8?B?QTB4OTc1NTVLK2pjWVNFdFA1aXFkZHI5S0xvTG9aVzRFa1ZueEtmYUZpMzVP?=
 =?utf-8?B?eUNRRVlDS0pTY0NvaDNkM0VmenJvWU51NGdGN3JuMk5hYm4xQkdzajY4UlJ4?=
 =?utf-8?Q?Q+tLlAB5UwPeCdje5zNzJ9wSTxcBdsEXpq56+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fac66b4-5226-404c-b31b-08dee23fbfb5
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 07:07:36.2874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZErKcOJz8u8alXUQkwcfcd0u5KEBA1QUmO0lQB0d6WuuXwZKY4/I8cUO2xso37JWhji0AeOKb83Ogv15gNXpTICjm0b7g5i3I8h6wjDnqj25LDEDbwY6/jiZI7yVyqtX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10537

From: Biwen Li <biwen.li@nxp.com>

The MCU firmware copies the rsc table to a fixed address (0x1FFF8000) at
startup. However, this address is occupied by variables used in the MCU
firmware, so copying the rsc table there corrupts those variables.

Move the rsc-table reserved memory region from 0x1FFF8000 to 0x20000000
to avoid the conflict. The M33 firmware linker script has been updated
accordingly to place the rpmsg resource table at 0x20000000 (DTCM
m_rsc_tbl region).

Signed-off-by: Biwen Li <biwen.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 5dea66c1e7aa0..0f9d55e811391 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -42,8 +42,8 @@ m33_reserved: noncacheable-section@a8600000 {
 			no-map;
 		};
 
-		rsc_table: rsc-table@1fff8000 {
-			reg = <0 0x1fff8000 0 0x1000>;
+		rsc_table: rsc-table@20000000 {
+			reg = <0 0x20000000 0 0x1000>;
 			no-map;
 		};
 

-- 
2.34.1

