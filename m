Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011055.outbound.protection.outlook.com [40.107.130.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63E6381EAA
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 06:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784873687; cv=fail; b=o3QHbIJJbugLomcZ8B2DXHofP5e1xWiqI9oNVTVtFTDAbonfjZV6BkRSUMX6CpP13rGJy94VfxxMPKlPSTCmynFbQFeSQz+K4PCySj73vUAQl7+cyvjm7DeB6hFR5jyx9X7Q4RIVI1B76EMaKi+fFrMprQe7W8+4wHx/etVEdKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784873687; c=relaxed/simple;
	bh=UReL2T/2h8jm84gVL5KAHyRnZyV/3rP5rLynRhZnwg0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iydr5SM6C/fbdcXNil9ZccH5J87XjNAipv1iFi8kE4nX3NJ5WJldmeq39z2qCoqeaeVEB7sPcgq+AeFaUzJsaXDIzWr3hTxRqhUIM0rOXnYKjUAhwFORO/o2gQIZ3TzdLuEZTGtiGW1FSoATVkMIEJmXXlxelZqwvzudtB3Yd7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ABgqm1ys; arc=fail smtp.client-ip=40.107.130.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ABgqm1ys"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYbFdsKXPvc4PPHodAvCgdJ6SRoo54xl3zexcaySw2Ci3blKfydqsD6mqdme/xDjISN1jZ0BjTB63qNXdYdFcF8QWGVdvxIjzMTo54cW/h94XeyQVFZg5053czFkisHJ4+JxDAghZ8yDlIxSGiVihB1/Etr4AkGSLmuyb6Z3uPRe2HT8w6gy94SjiuKadofetMpp9QdMpRbKMRckN3Qh6feAmsGheIqnW3VHKU4ugVtP6V6tX6n4i9g9CL0GkgbYbY18UhIOhy1J5g/nK37J4sm2o27KqloZk2VBI9mgrY8J/GQW85bsGWipxySWkIRwasrpZSNXeKNfQt9No/RCuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0olaBufSzEHd67Xi9tY6psOfEsqSKI+Wa6xCDDZwDX4=;
 b=dksLjdjXnnwb/mQkaGAESh9E2WO1y74kY8cApXhjkblyIuz2sweH6b44lYE14VGY0um8HIeXg0BScx/msBWc6qf1TKO4KsHMPhjPdYlEnUaNOK4WtLHcVYShRF06jPMUpgBpr/eWykAv6KtP2RtJRTRDt5vAAbEQAQ7NDJQI52+n61CICFp/NhIW4NxnZdX++umuYnSoMaL8AjHUXql57vrzISzai4NATuLvZxWk0KtRYnJ8aRZ7tfbAdCEfXJyaTgliFTWRXW6Gqx8A2wFg6oGeMH8jsV/AnA5EcPJtrCUxJQBmJ811eaJS/cp9//og7sLNSXxFmRgV4IN0L5WkBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0olaBufSzEHd67Xi9tY6psOfEsqSKI+Wa6xCDDZwDX4=;
 b=ABgqm1ysqZzUWUC3IN2zlLyu4WPs4CsoYioXMvMgOszaetqZo5VKzHkuPS4gKmwqVGXmbL+1guFF44OB4UBxkcQhs7OMabhO1R+zKyRrtB7UTJwe8+Kqkiu51JUQrWofPFB3DSPqRnJH2DRhMoCmyG2SYt/4aHaqHHsI6o4CbCJ/qoCkVokG4RMtcXwMpas5dLYehTjgoQa6kcl6r4tzaQtSS/C0xLlgyY531Ir/ECZfTcqjWcevsFeZB9oYbm+9dt9u4N1Hl3giwXB1Z1x056OFZut7jgDucQW9T03R22XbelhZh9jMXEhzV1mxC3DoShCa6eJv2loSTVfnwZAzGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA2PR04MB10258.eurprd04.prod.outlook.com (2603:10a6:102:404::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 06:14:42 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0223.017; Fri, 24 Jul 2026
 06:14:42 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 24 Jul 2026 14:17:58 +0800
Subject: [PATCH v3 4/4] arm64: dts: imx8ulp-evk: Update rpmsg resource
 table address
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-imx-rproc-dts-v3-4-175381bdd02d@nxp.com>
References: <20260724-imx-rproc-dts-v3-0-175381bdd02d@nxp.com>
In-Reply-To: <20260724-imx-rproc-dts-v3-0-175381bdd02d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Biwen Li <biwen.li@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:196::20) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA2PR04MB10258:EE_
X-MS-Office365-Filtering-Correlation-Id: d74b1344-8a27-46bc-6ad6-08dee94ad9d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|19092799006|376014|7416014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	y0+Rm5LGlmygXJE3a7FXk3Gxyj2AKd31qcF6Pg9Cb6d+EIXksK9ISUhuMv05BWVGWn862aGHICHCMDv+nts8Nqr+An2z6L+oHR69VmlBfymk+klsB67+WZmUYkOTwUszVdVKyBJ/GfoWHjiiSkb426rYqVne9tArctEPnEm7KeTDFWzAoRl4F5G0a0UmgUJ8Cl6sPcp7GzTBNcVR12baxxp5L8GZquhUQPpn8w20JZc1A5CMuzCgFjWOuCly3PlBMvE1F36qHd9ZZcjBJkeuoCek5L2deiNL3lkKaJhIELPizOnG8WyQneD9/jdbnpbyehbwb8dvx7jAF+4RGsyrihKhji+5zlzPBL68vYSOAxGDBKhlO1jm1aYKAaoU8GK7sXy4YwqBLN53xswgc7J108pso4upBzIbFd5PiEh+toO9rW0XHtbI+GK2SM54KeU6j/6/BL/JvLeJ77HqbyL1BP+KW2mQWpADKEpvvnzT+ZeY8f7g9LYaOvKq4zKlfV9xFdR6b7NuCgFvKyqVeueZBu2wRt8PoDU9op9WU5yzAjgJK4QX46EzS+vy0S+XHwCZytjN80Vc5DOhDoJeVTPQhFjKueKypPBr4zaouOYrlOOkl/I2j/Zc9A9GJHWyrxVle0wmFUZKjlmHfGVZ4LEP+YcYl3UEvskDaMyiHjWjFlc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(19092799006)(376014)(7416014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2dTb3RUcWo5UzhhRUZaNUJnams5VXo0Y2Z4NUlBdnJiN2lBUzZIRWFxczNx?=
 =?utf-8?B?aWE1NjlRYVVkVE9iWmJaWGdGMkRYRjlIeHJZY05KY1NQcFQ2QWZIZXRybERw?=
 =?utf-8?B?MFpVTXk2NkkyTGxuaHJ2WWk2dnYyM3l2RFZ1cGJmVDlLQ1lZcmVoV21CMWNU?=
 =?utf-8?B?QnZnTlFTUU81UkFRaXBKTDZCQktNczZzejFkVFhWMS9PQXBDSzNBQ092TEJO?=
 =?utf-8?B?RW9MUi93dEFXbjVFK0tZMm1JTHR1Uk1FeUtIcUN4eVZBdXFpQVdpaEJqc01a?=
 =?utf-8?B?b3ZRTEo3VC9HOE4yM21KRVV0dnlGTEl4c0ZhZE16S0lMbFAvZ3Z4aHJkU2Jj?=
 =?utf-8?B?a0tSd2dvV2l3VG5UM1lsOXFQWGgvL25Sb1dWd3EwWU1pSzlsUzd0ekdnWGFv?=
 =?utf-8?B?L1V2b3kwekdaSndPWGZOek9kek1sQTJqR05OZUdYaCtWc0tCOHpJSndwOG41?=
 =?utf-8?B?SjBxWG9mKzVPUGVlUUlIREtEajhJWS9lWHBscFlLNEFma04zcGlBcTU2MlR0?=
 =?utf-8?B?VVlVb3Npem04OXRrTEUraElWV1ZvV2dEeTNxL3JGUkd4VmpXUzFyRjgrUXpB?=
 =?utf-8?B?eVBXcEZMMzEvemI5R2RlUUxkNXQwSlZQcGFxSmd4M0hIenJ4Z29lWFBETWIr?=
 =?utf-8?B?U1VBRDZBNC9uVjd3Q3lpbmo5MTN6UndzdWZkNWF6Q3dseXZ4UFJ5NWRQalBE?=
 =?utf-8?B?SENWbjZCTWxYTGRCekFlZDMxWmRrcFJMYmFaNEdTMFVVY29QLzQvNUVKT002?=
 =?utf-8?B?dG0zU01QUVd3akZQRmZiVmFnYUd0K2JqS25NYWprbVhvVEIyMkhlV0tPUHBT?=
 =?utf-8?B?Y2ZuLzBqMUdjK3BZa2liL3p2TnFtcG8wdTZDVmd0WTVKc2Y3UDZBUFFJTmxi?=
 =?utf-8?B?aVFzT1lGcGtXcGdvajVXWFJUdjV1YmVOKzhoZjlnUTI2dXI2SjZoNGZLRDBY?=
 =?utf-8?B?T25yM3YzQjlGUVBuaHVJYm03VUFiNmE1QXdRRTd6TVF1WXdpdHlzWjlIZHhX?=
 =?utf-8?B?Mm5tNzZJdmFHbnR3VFArRER5elk3NEhHMmNRN1RxVUhNcjZxWldVUzBSKysr?=
 =?utf-8?B?aFZMVzlTZUdLYzJ1Y0NjV0xac1k3cjVKMDZmWFJOVVozc055bnB1dTRVL0hI?=
 =?utf-8?B?dUpuMmNKR0QrTlYra0l3YlFmNktaZmZPalU2YUJkTmw3WXNEdTVhTkM4U3lv?=
 =?utf-8?B?THZudUdTTFVQMXJkQ2RORG5xYnM1aGxOTlRmM1A0M1MwUXJLTDR5NUkyclZW?=
 =?utf-8?B?NjRPLzNMRFFhQ3RKNytVQWoxU3JFQ00yZlBrdDJtcFhWdnAyMHFNb3FTWFZU?=
 =?utf-8?B?d2pvdTUya3lJUTNTTTVQUWY2cjk5Mlo4S1pXcTJCQjk3SW5hcy9kd3E5MHJI?=
 =?utf-8?B?UUhHbm5kQXdYMEIvWnYvcXlVaDhweFpZZTdzOFcxbDQyWHhUR01uVVYyc1l6?=
 =?utf-8?B?SjE3dzhZeVp6RTZ1SlBhNUs1TitWbmxZWXlaVERFdE1tSDdHbFBFOHBvSUhm?=
 =?utf-8?B?aTRnazR0Yk1CbENDZ1l5cG1NR1BjZyt5QkcyMnV4eWZ0TmN0MS9LYklvTUZh?=
 =?utf-8?B?ekxjazdVUUM1U3R2bVNHczRQaXQ3Tjh2THVQSWNlU0k2YUxURDVDdlNaNnB0?=
 =?utf-8?B?SVFpbXF5SmhRaGhGL0QydDI3YTIyK0M4dURUU20xUnQ2RTBZV2NSKzErd1o3?=
 =?utf-8?B?dWFaUklQcXNwYTNnRmI4NS9TeXBqMmF5VCtIT25lektYRlRoM0R1NWdkblZa?=
 =?utf-8?B?OWNuU2luMDJRSlo1a2I3TkRuejZoSjFac1Axbzc0bFVxalc5UmJtSnhuSHJ0?=
 =?utf-8?B?KzhlSEJkZklNM1BVSjJNbzM1WE1mSkVnbkdlbnp3UU9HcFlhNzc1dCs3TzF5?=
 =?utf-8?B?ZGpnc3JMZjVMTXQyMllSenlWTG83MFFCblYrdFRMRnZSZmZ2WjVEOTgrWERQ?=
 =?utf-8?B?dllURCszbHc4RTNadEFSeXRqVm9qMGdkQlFIVi9vdHlhU1lwNHlraG05ZUox?=
 =?utf-8?B?d0paRXdsMS85c1VzMVM3M093MVI3Qnpoa0pQdC9ZdVlrTS92dVZKL1ZOaWFt?=
 =?utf-8?B?azVpc08wbjNHZ1RGdkVndzAzMXFPaUhlVWgwekkwajBPOEdaM01wTXJNQlNO?=
 =?utf-8?B?TlphS0xPRHYxRkFRaWFvbVAzS2lOcDJjc2ExdlU5ZHpWQW9Fc0ZSMHlpazRu?=
 =?utf-8?B?K01aRytPVk95UWQvbUtVMS9VazdYczdsSUJqaHV6V3kwTVBxaW5sLzZ6Tjgw?=
 =?utf-8?B?b1VYd2VzVTJBQjhabFlQUTJiRlEwRWhnM3pCWjRRdEliWkNpSUNnSVo2MDlZ?=
 =?utf-8?B?SHJicU10SUd2dzJNWmoxZjhiT211QmpvdlVPakJhMXhBbHRnWnh0TjhFWG1D?=
 =?utf-8?Q?LavFAzKJhF4+wNvu+s6pW9kAPM0Qhjme3uswB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d74b1344-8a27-46bc-6ad6-08dee94ad9d4
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 06:14:42.5848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pl306e4M6rkZz1syv+5FvwO/kw2HjVg+fdpiSfJPebFnLNQnDz2VD6gDH7ihjH9ttlg0MOQ+QUdzE+0CsZKdx+Rg41ULF35xInh5eeyHKmV5h3useqKg2qcHrS+yZzV5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10258

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

