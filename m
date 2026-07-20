Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013066.outbound.protection.outlook.com [40.107.159.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868894189C3
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 14:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556542; cv=fail; b=OAuMxfxC/afqg2p3ogDIfDt0b/mGG+8fh26XrhKg8EZOmz9p081Qoo8RnNX7S2e26o0tSd095figjKszCjJPIrl8mw2+iN14kf/Y30dEuBiCS29T2jnKrdMqGZbhgUVvpi85rrITsS/gOyHPSWiiyZ/DcAFHc/vTMjv3/BIIWco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556542; c=relaxed/simple;
	bh=TGKub3DE+MT9ft0m8Qvhg8ZdMJZZdPCvCjO85gqH2wM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mNSwZ5zLCQZeoW7Rw4lQBcuqB/lnKb28vpWdc40pGLxisgtyNtonRHFlASD1OTStw9dBQCRDCuC/n6tZPHcMD8kGMIPAe+K2HGGJC57FyxiOwmLLvEqw6KT+WBSMkHv23fVqZcOVEaAan9vCU/gQXeIgzkGNxn5X00LTugaK/4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uSDjC44d; arc=fail smtp.client-ip=40.107.159.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uSDjC44d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVLpKRMQ6STtO15BSijNYQiKfxzlKireLO0m5lkRGbV5y8+5xSpzrS/+o5Whj7vEC+kL/QCoRJABdUnbmZ69Q7zP+LlB5qc2OO6zrmWfPMzHhytVrPMU4wxx4mqWzyNFFT9/202+umXAyOJfJ+Vmz1Xd58+rdF3pqobIYOSqsvs7Tk/mu5a0DeCxnqUKDkEw+nsUvjjCM6NlmjKwrZk0Obndjoyma6inyG+yXLGBvper/1Jf6Eza/d7f+8sh6guBFiwWl96hnO4PuhLV0WZpQ9sh3j5afjdimDAD3gEdhvucTmiHauksBL09EVqp4xTqoFNMx+Nt+yJ2pY9Neg5LpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXrUuq0tM3Tt5cd3R7xN8Gqj4ACEzWi4BmncjonszM0=;
 b=S2DNdsXfXVdhLhRDAcXK5YVLPtoZrFL+8tqy9JE6rszlG847ROGtiurkwyf4NbbTVDYPzphcRDMPVuTyBSbv4jwzcSItg+WQvZvNzpKDBLsPvEHybA3L5QTmxZTF8xbDIXZpAwRQox9f5u2AD7sRc9aOiHeQiP4YNnmXjqxCK+Nh6NZnuvi4DQTi9/mO486Pu7bIiHtLYaOYhO5LVkCx1n0dKTDAwuBcSFMon7yGN3t6PtFJ7QeHV6GIee637VmvxxhQXSF+oL+bj4Mo8eJxUCQ4Mi5DhmPaDC6XUqbC8JuLoz6+ADvI/iU/MVeolak48YDUb5pBsTeePuu92wi4NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXrUuq0tM3Tt5cd3R7xN8Gqj4ACEzWi4BmncjonszM0=;
 b=uSDjC44dnOP+SZpBusDZ2s4dYYtF2K9Jo5iScRjlwfl5RMM/2sXOEgCHgSdK8eNbUsevu4KkI82gl5LE4OtVEnpra9ho1UDsB9XGcXXA1SgO1WdFES30xjb0C3JIa0C4GasOuwCTEfEXruoq92jmCRCDYb/yRQoTmYWquheerbxAxdAp0PxKoYiQF5680hqwqh/FGvOUB4ro2HctzRkWO5YLwl+qZyZ1C/+gk/c4ZZ+jf50/McBg0eRCzxXHs1BowTTcLJ8BfXxs1HaUMgkYL3XhlFKrORMLKSrCEorTLZtyZr2drwTS3/s5xrbfT0HGoqAiEuLop6bG8Y6iFsZCZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS4PR04MB9412.eurprd04.prod.outlook.com (2603:10a6:20b:4eb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 14:08:58 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 14:08:58 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 20 Jul 2026 22:12:11 +0800
Subject: [PATCH v2 3/9] arm64: dts: imx8ulp: Correct SRAM node address and
 size to cover full SSRAM P2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-imx8ulp-dts-v2-3-d05c67676f53@nxp.com>
References: <20260720-imx8ulp-dts-v2-0-d05c67676f53@nxp.com>
In-Reply-To: <20260720-imx8ulp-dts-v2-0-d05c67676f53@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SG2PR02CA0121.apcprd02.prod.outlook.com
 (2603:1096:4:188::21) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS4PR04MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fbfc65b-a7cf-4689-6473-08dee66870f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|19092799006|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	iPfIAiNHGlRmAcK6f3WwqTOBEWJ/szHu6KQtPOcjtotNGOffY/lk2zC77d26YSgKRMqI8jIrXMiRmmbO+rnb1/KJeb2s+PKEQKsgtuTatDhhVnVA+vwiBwXZ3ATCpL1Q9gPx6g0vXFomENEY+1+IcYKbx7UoUsD2JxVnA3wUwtWDo+vreGC5X+cAIFbh+cUdxTVM6Da7PlaYYPrwrERLgV3UJQ5/DwrlCeltCNm+nnjyMkID6bYUkCmH+/DlUuviP1Fsud1TNXDydpSB2AWcjgnhf2dzVfIt9zj/fl+7f/Bh+UkTmRmYK4nI0Gqn/zUjUxAYKazOj7Sk5Bgh+qJjVoiuedzcuPUAueLKp8ZemxlRFAW1Lymw3qtLwqWK3hWkzkwVOqTlCj/vkF8IXOdZK8RUFBRHXBRamdMxymCKIeuPDImUo2MuKdKqMno1hhMMoOqMzS0S3CshPVmaDZUJz782EqwDjrIZ4mgfW3RvAUI+EzinY4K4tM8QxhtRbHvAJzXik5hOZpytZ2SyHR20n7IIIYoPA2LLKhfr2QRMmDDKuU8h36zwq5ogzoOudFXLKMyiABH1P5LcwWm4WOgkfQI9p8wsBDGIk+FkC2JycRAZ5V/i68aq0zyoHAmCPXHaYexWsfYiqTB8Tfpqd62DylUxwivv3QgYs/oGBqgAxI0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(19092799006)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czFpc3l1NUZ6VGxtZVgwU04ya2V2aWp3cWZvSUNvL3dwOFRDcFV4NFRIamFl?=
 =?utf-8?B?NndjMFdETGpMUDlaUmhic0FWTkI2clRTazRvR2VZMWxTcTV4QkxqYnVXNyt3?=
 =?utf-8?B?SjFvZHJaZGZkTlNtMElzWU5BRUpibnVFWXRpMG94Z1pSUGlxNmN1R3g4SlYw?=
 =?utf-8?B?Zlc2K0VzaHlsYU0rNTN3eGRnL0FFNFcwMnF0Q0NwM0FRcGZTL0xYRTJwcnMv?=
 =?utf-8?B?aXZsUEJlVGhMSzdLeTlvRnpFR3hDdFlRZU5KRXVvdytaOUxzUUd3MWxpYyt0?=
 =?utf-8?B?dlNNMnF5Zit0eFNzc2pJTjlSb2U3a1c4L09lenpWVzRHbmxFcndwSDI2V2R1?=
 =?utf-8?B?M0NLRVhzVzJNaEFKckpMVmZqcEtURUtxQ1Bnc25sZ0ttR3ZpQk9Jc3lteVZ0?=
 =?utf-8?B?dFFqSk1sd21JUWNDZFpGaVZZQlRPSVZpZHI2NkVEM2F4QjJCd0VTWDJWaGhF?=
 =?utf-8?B?aUFPTmJLTnFYdkErYjhTci9veTZiSVVCNUxCZGJvdFRqRXVPblJyRkppaUx2?=
 =?utf-8?B?aHlVa2QzSWlyNmphN0pqUmV1WlFXUHFIeDl5WTJ3RTJFQkFGVzdyd0haVTQz?=
 =?utf-8?B?TGttSW04dEJwYS9lUjFxcjFlSnJJdnUxdEU0WlpnY2N1NFBQYjVUTmQwdHhp?=
 =?utf-8?B?Y1loV0p6OXh5Tm4wdzhTRXR0bHJsMTNLcnhIVlM4MHhNb1FiUlc5Tmw4ZGtS?=
 =?utf-8?B?ZnBjbUxHYm1EUTh0TDN0L0pCRVI5UDdIczREb3hXV2lUdjUxTHdDOTJibmJh?=
 =?utf-8?B?blpmckJSWGdpS3dWSDFxckw3MlgzTXJPcTdkSkJJRllDK0t6THJ4ditJc0JF?=
 =?utf-8?B?Z3RlUkdCaW0yR2Q1VUNlK3l4c2tGYXNObWVDMXo0QUxxSGxET1pRS1lxSE5q?=
 =?utf-8?B?bHRqNzBUM1NnbWNMS0ZNYUlWV2MzYnpRM2RZU3p3dUFiaEZLeTNUc1RaOGN3?=
 =?utf-8?B?QzBoeUhoSllhSDVnZnd1ZVp4ejNWWU9JTEdaVjNQaHluUjI0V3Q2M2NCMGpW?=
 =?utf-8?B?aHNLeTBrZVRiRTkyUFhTNmZ4VEZpbVozSHVTbzVqeHZRbXZyR29KdlhBejlH?=
 =?utf-8?B?MFNaclNpb2pjSW1EeWpqQ1B0bThDbUgrekpBSHVDZVFWb0s5R0hQWEpDNkZC?=
 =?utf-8?B?bytmR2NQejhsaXFCRDRhejg3U3k1YUdJeEdYS2RhN0VOQVozS0dmUnQwdnNK?=
 =?utf-8?B?RkE0bk43Yzhud1NsM3piakR0Rkg1Rk81enJyRXE2Nnhodm9Tb3U5Tzd5K0hL?=
 =?utf-8?B?c2YyeGV0bzNBckpmOXRIZmc1RDVBZWoydGIzRW5sZ21yaVhBdVZsOWJZeVE0?=
 =?utf-8?B?ajBmRXlwWndiRkRNUTlnTGQ3L2xKcTN3cWlZaGtPV0pzUlBhUTdrWmNyQmpx?=
 =?utf-8?B?dVIyLzhVdExQRTZjeGRRUDlxQndndVJtakNodG1UTzVJcXpFRHZMV3htUysv?=
 =?utf-8?B?aHpCMW05SEx2RkJrblBnZDdvUnI1U2lDSU9Bd1VlVEV2ZUxMd2wraDVYUnFE?=
 =?utf-8?B?elg3Uy9Cd3hZZktCL0xweE1HRTNoUTBhMWZTSUg1cGQwQkFYeGpSckpqVDlM?=
 =?utf-8?B?OUpCSjNkMEE2S1BaL1pDNzZSVExWNk4wVHVyT3Z5OFlEOE9mU0JWZmk2c3ZK?=
 =?utf-8?B?Y1A1enJZL3l3YlkyaG8rUElYRllVK2ZzUkI4UUZuSVJldHQvMEx6MFJ4RHVO?=
 =?utf-8?B?alJpNnNXblJwbktsdG45V2xvV2w2RTVqNzI3OHJxaEtOaUExZHVKOFUycW0r?=
 =?utf-8?B?V0QvV0NHTFZmMk1LRUwwQUZJYWtnbk15SjFmNG00cVZucjd5K09taWEySXd5?=
 =?utf-8?B?UUFGMUpqWG1uN1hmbkF6OHhTK09TaGRIdFBxNGhkUVdKRGlvQ1lHRk5mVWZ2?=
 =?utf-8?B?TElKVTVnc0UxTjhFUWJFZzhIZEFSQ3h3YXcxWEhKWUp6U0UxQzZqSEZZOGhh?=
 =?utf-8?B?S3g0TmhMVDFhcFlsWUtHYWU0d2hndWh5Y21SVVB5QjM0RjV4eldiTDRPQ3Rr?=
 =?utf-8?B?blY1L2tvMlpUT2Nnclo2K2JkSU9PeFVVeHVkWlE3bnNkYThPeGUydG5oWEF1?=
 =?utf-8?B?MUxFNXJod2lKQUdWS1FmUTlXVzY0a2FXelByN2l5VVpzcFVPUWo1QnBxeUR3?=
 =?utf-8?B?NklTVmI3cHBaVE50cjRUdmxSRm1JYWVyc1FVR3dBM3pueEpGaklrMGN4UDNt?=
 =?utf-8?B?UzllcnZvUS94Q2xHSGZXSUVoLzdmbFlocnppWFVKK1dKajNCbDVMbFFpaGox?=
 =?utf-8?B?eFl0MDVVeGlSeDhSOENTRlVmZTYvSzZsa2hvbUkyQ0hiS0VjelgrRVFpNFdQ?=
 =?utf-8?B?ZDJsWm9nY3pwL3lQUjJCQStwb1ZHbFhEQmt1N1lMTnFYUzFkUjZEU096SlQw?=
 =?utf-8?Q?/cukn7LxPpSI/z+iyOCfMikvqEGxILQ38yqIX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fbfc65b-a7cf-4689-6473-08dee66870f5
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 14:08:58.2233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xmSPVQRlkXscPzuSGYugGJx9qTt1JcrqQCvEx93461xnmfquh9TsIjMs9zJBM1ZvAiBcyogDJ+RMtJIMRqlmjUdUBd9uWjEdFjRVCO4k+vVw1960y/3sGDd7qB9SGmgt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9412

From: Peng Fan <peng.fan@nxp.com>

The SSRAM P2 partition starts at 0x22010000 with a size of 64 KB.
The previous node only mapped the last 4 KB (0x2201f000, 0x1000) which
was used for the SCMI shared memory buffer. Update the base address and
size to cover the full P2 region so it can also serve as a general
purpose SRAM pool.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index cb0d73327d86c..7d00fe8360948 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -154,17 +154,17 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram@22010000 {
 		compatible = "mmio-sram";
-		reg = <0x0 0x2201f000 0x0 0x1000>;
+		reg = <0x0 0x22010000 0x0 0x10000>;
 
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges = <0 0x0 0x2201f000 0x1000>;
+		ranges = <0 0x0 0x22010000 0x10000>;
 
-		scmi_buf: scmi-sram-section@0 {
+		scmi_buf: scmi-sram-section@f000 {
 			compatible = "arm,scmi-shmem";
-			reg = <0x0 0x400>;
+			reg = <0xf000 0x400>;
 		};
 	};
 

-- 
2.34.1

