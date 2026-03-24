Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013001.outbound.protection.outlook.com [40.107.159.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF37F37F8D2
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 05:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774330985; cv=fail; b=g2cYgAa/TDtaB5BN/ajND59L9tR+I2PAyWTjJ4NdF4/MT8AM2KafieUc4y1F73lHbq/Hhcsn9Z9hMDJhWbNhz1IAjgTELT7ckpG90QEcKo1MU/GneJ+cFBYRxcNyS2gq4GwkwgCv3+vYosT/LdwzI5qmNsSZm+Dx74550Jwvl58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774330985; c=relaxed/simple;
	bh=isHwtKW26OhgKvBOqCXaZ7es3l9aVrAdyUOe/Li7iWM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mgg6zBRuejvWSeb4D7thIN7olywsOWuJUfSjketdiZJKJE3J4bcA8nMhlfpjvsC6QiXI1/xe1dN7NmaNq7vttgrsP2xHuCnVc8dXxRYuCwVKT8jTPpvnQbgyj2vGfglnH9/KVAN3xcMoSoaBkTZEvDhTMgJLdkxeT4oq8eR9dkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tPRxuVCi; arc=fail smtp.client-ip=40.107.159.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tPRxuVCi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0yHCp3xXK9qVfM2cQQogf1m0tS4umgf7OkV5osKRAn6zDvw5ShN0cBwfZIXVFNi2BfwVKa/8JgI9sb5lLl3GiGPi+KbY6uW67Z/SiGygUaFDFxP8Mch3327oJtc3a6DbDZy9FcZVoYyocHo8a4r+MUnnfeneILQ+2Bke9heT2zk3tLH1U/4wlrkF2qpMuryAQRlNNXBWh5lbO03UXy6+C/is0lgAzONhi64CKY4+PqeYvRLXJdk1tceGy2VyUl7PnH7Ji69tNlX3e0eQIPC+xlYm+nS/59y1a1O6behWT217rHNEs/BlmunBrG+lsIaUym91xeFYyrWgJ65l9diCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYqjfLR1sGmdN5nx+/QoLQ9h4IQngwOkMWYVIgZh6x4=;
 b=FrEPE0T1oPQ5XDEnmpvZ0t1mnEuXIQT8bP+ee88yyqfH5anSEe8bRf2c68C3Lx7W3loAq3XZ7NhTgkkpUJH61drCMhTT4+LHyy2zjKLT5QZtscJyxg49hJv2T+ZXOpiePdI+WKSExLMgndGxoIeOmDlyZjhqUxKeV/IV1RqkK6/LDk/+utpodrT0PmV37/TSX3YXE6jpwctfswip2SmOCxwOqc5+/mMi++sOfZSWGiQm6rBjmtnECP4/4W0zlYU7+r6SZldbaXpv+8ONAEaV/fUea5sVldGvp83KFugnt2w59JVdSH7NwOZZ6TCLL3NGYkvjoNB+vaQ5V8QHQWC7Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYqjfLR1sGmdN5nx+/QoLQ9h4IQngwOkMWYVIgZh6x4=;
 b=tPRxuVCix9vX1L+oS/eZ/mCUq4NZKs83pyBf+8OXBtHAzL1PK1rbcBqPe1bu21ss6/3N70OtomRGZzJKzTsmI0aTl1XyFwejt8jCgK91F5iw2yV7EJw42IEtaginB4zxnwO0Le4bCS62R16sUNNe9XkFMKaJYFi9BZ8Wj8Fl5wOtlXLj7zFpEWPt1lH/2BMzQIJiNnLPwlsE7T+ftkdjLKwFCCjJg2RFvbFyGFTXyNdzC00REFj4B8R/9x6Lvy976IcDqfWde/pIHPh9CHlI4RxsX2VHg29XY+BJ2JbImWPXMH/3zwHqJo7SbxlrDLs+YVWbrHyUxbYorsoYzuPKkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8967.eurprd04.prod.outlook.com (2603:10a6:10:2e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 05:43:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 05:42:40 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 24 Mar 2026 13:44:12 +0800
Subject: [PATCH v3 6/7] arm64: dts: imx943-evk: Add fan node and enable
 active cooling on A55
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-imx943-dts-v1-v3-6-b33bf1f1c254@nxp.com>
References: <20260324-imx943-dts-v1-v3-0-b33bf1f1c254@nxp.com>
In-Reply-To: <20260324-imx943-dts-v1-v3-0-b33bf1f1c254@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Florin Leotescu <florin.leotescu@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:4:197::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8967:EE_
X-MS-Office365-Filtering-Correlation-Id: b64ffb59-dee5-4c96-5c11-08de8968299b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|19092799006|1800799024|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	O2ccHNFHgoUchgRaxHUIlOs7vNAtahDFPzllXZyl31+UG4d4JCNhCvbsojkIuLm5vAjfyrE5kRRsqr+qPF5JWK4JwRyrQZBjJ/pEuw8hskvR0YsNHlLfr6S6+S9zKj39IvB8NLQ1k5qO8Ve2uldcEOOP9BR6GP8g0zv41uDNLvPA3XynV8UV2tvz/qfghuFST1MykQpl2tkfFGqdC67h/hpkYNM3pqdKH50cK0et7s3g4spr6a0iUDkXZ5NobVrbgCRzkrN78LQjZRWSvS0H1gx3q3oL+P8TrKyTf8ZoNcGcgEekVSk+13YXWztM28BmMOPFnjb5wzbhXxLHjBdhsr5VpKjS1k3Z6JwgtYH5UkwnMFZIabw5Vo32hWAimkWEz+I0cCtm/umzD8oWGwPr4C27qOz7wq80rgSLD4H7JHMOrvoUl4qzqgkL1KEC1QE+gub3S1DvPnMO2560htp/EY/QbIHTMkih+LDwLI9bpD7/LZyE8rw9FJDGHw+sTGmXYLg1gBT6OjVEoKkLkFvBVmLe12kz3WhogC8pztXleuARR7N5Woor5YL+7kTv9WrIPKQ6ZFd0OkJMYMhC4O78QzV76m4bY3GVHcY3HVmzbXelWboeTBGx9l5XgvVRSm7kMe6xz4XnUXUonLiO1Rde13thGTeaYhbbncuyT3IBkW0Y6oczBb4rf6ICrk61i8OUfWav7tR/QDJ45l2R6s54vnxnWiR83CMw5oUh5tkgmeR9H3F1dH3OD26YIRK7hCC3yyWh+S9BamsUkjSWoAgQalpwuA7SELaX2fqgnoYDjK4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(19092799006)(1800799024)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2M1MmtseFg1VGhZTlhPaWVYQnFCR29MQjF0L0hQME5GWjl6YVJ0b3RQWEtx?=
 =?utf-8?B?VXZJTTNybkpTNXVObVhYNEdOZmt3M1IxMTNTOWxQSFdaYURncExSeGJ6a1Zw?=
 =?utf-8?B?VWo5YjBKbXJQbkhRclA1aitSOFZ0K2hwSjJWWWJvZ1V2elZtZXA3MTloYXFq?=
 =?utf-8?B?V1ZRQTdiVFNEM0dpWVg4dFRkRXA5SHpDVTJEenBnS1g3VDZnOG5VMXByeXU1?=
 =?utf-8?B?dVdKbkIzemZUdlFUUUttMUk1dWdLLzZVcm5RMXhicEdoZ0tObnlFMC9GMkFP?=
 =?utf-8?B?anRURUpLUlkyTG1WUnZzZWs1eUdvTElqY1llb0pkaHZOVFdWWGVsc1lQQVBZ?=
 =?utf-8?B?V1FVVXNpRUZ0L1VybW02bVh6TW1keTJGOTB0VXlwb3lxVGFWQmdPODBNU2ZJ?=
 =?utf-8?B?MUdOc1B4N2dnaVA0UnJCMEtER0syNTAvTmZFaXFxNDFjcGdDNnVUd29SLy9r?=
 =?utf-8?B?dEVaZmo0SXdTWUlockExMFlTT2pTVXRRUWh4RnlkNEJSUldubGVmM2hNS0ds?=
 =?utf-8?B?SFFZQzJodHlaclQ1MW14bWQxTnJRLzlhUnNYeTdBSHE0WnhQSFZiRHQvUnUx?=
 =?utf-8?B?RFpwUEt2YzN0M2I1VUxqTkNYSk1RVk9sOE9sNjJ2Z2pKWmZYZFpteGV4cm5X?=
 =?utf-8?B?Q1ZUUlhnVDE5cnptYWtwTDl6WDFtaFNGenpoNUt6MEw4YzBPNFBPSlpkQVA3?=
 =?utf-8?B?Nk91aFZCQ1BsaXlFMHZaTFJpYXBpZC9ybFRvdjdpSDQwQTFCdkdUVm5CWG5h?=
 =?utf-8?B?ZzBQTnhsTlZ6bWlIZ2VTbmFpM3NidjgzMEluV1Vhanhjb2paSGRnN2pxRkdx?=
 =?utf-8?B?OEkva202d0JXUUcwUHY3aTQ5by95aGdXb25rMGRkSzRpTWwveDB2NU5kaUZC?=
 =?utf-8?B?ajVVWnZ5bnBmSjV1M3lBTGNKRjJVaE5Nc1ZZLzF0emFRZFJUSThzUnVJS3Vl?=
 =?utf-8?B?cHpHaVFHSU5GUUdET1NtcUZGQ1lib0M4cC9IbnFoQmlBcHJRU0p3U1FEODJv?=
 =?utf-8?B?dEo5WkFrU08rbE9QdjlTNUROeXFIMWU2cHhPVWtwVVQ0QW4rbGNyTml1aGxn?=
 =?utf-8?B?WWRWTUtaS1RWZ2xkcmRTUzFhUjU1anF3NTQwKzJHTGdXZVlBa3NPeGxta0pG?=
 =?utf-8?B?TXFNckdVYXhTOUxKM2tvdDlUdVNwVlg2RzllcmFDcFdSZEZMdkNRb2o5OVB3?=
 =?utf-8?B?SVpwSSsxZ0hvNzk1NndFOTkwbkIwTXQ4dEJRbVVKWFpMRWxBTlFoSWRpcytJ?=
 =?utf-8?B?U0t4dng3ZUVkVnJ1Y3lOQ2ttZXZxYXZBUGswMzRwNVJ4aU5ucG0rKzdEV0dk?=
 =?utf-8?B?d21CaGNheXNuZE05WGhrTlQwcmdZeW1iendYbldlck0zbkE4Um9VV21xQUN6?=
 =?utf-8?B?RmhmbVoxN1BHVUNtcFAxcVA5TjUxWVhmcGMwWmV3UWQxSWNWVHBGRnMrY0lG?=
 =?utf-8?B?Y2NSZ080TTRYRW1jait0S0d6eHAzR09Cc3R0WGpFNlpsdVBzTWFuZnp6ZGxm?=
 =?utf-8?B?ZHhlbStNb2tTOFNBOCt0aTJNSGhaQnFzMnYwN01EL1k0OWdsNkhuTlVXd0Zj?=
 =?utf-8?B?OURzTTJoOCtVR29lOU4vWE5WS3RUUk83RU1ZZWFncUNRZXd1OU9HaituZU9n?=
 =?utf-8?B?Mk5BRjk0bVFMazFZb2lxS2NmaEVITzNvMkRrSURpbSt4b2xuWml0SWtlclgy?=
 =?utf-8?B?MVFRbW85RzQwcU1acUpPMEJJUU9sbXZLRzVaZ3B0ckRRSGhQaGNTME5RcEVV?=
 =?utf-8?B?Z0NTRmIzeFloK2lJeEdWcDBuaXp6VFIwaGo2RFNOYTUxaWJPMDhXT3o2Nnhs?=
 =?utf-8?B?akUwYnhOcmpFSnRsaXJ1aXRvNWgrYTN6dTllRS8yRHhhSmIrc3hTUGV6eDdp?=
 =?utf-8?B?Z2xhY3RIMFFKeURibHZXYUQ3YWMvLzJCZW0vTFBVa2RKTWh4S04yd0NiQ0hO?=
 =?utf-8?B?YTB2cUh6Y0NmR1gzdDZjVmFxTXVFdWZzR1o5eXdZOS9heWQ5dDBZRnVMeXEx?=
 =?utf-8?B?NHkzaTVLb1A0N2dueFlIbjVLdkc1VmtJRVM2WnZ4UDJwMzRJVjhINWtZM3I4?=
 =?utf-8?B?S3RSbFlvOWFYZjZyM2hQNEtxQ1BFL0dBNmpNT2t4dGh2RFo3KytydlFlNHpF?=
 =?utf-8?B?WUxMVkhQa0JaamJIbit0Yzhrb2JtSjllRHR3aU1Bd0E4OElmeXB6SmNvQUw1?=
 =?utf-8?B?SEFoVEIrWndYTzViQVNFUXd1ODFpYlhQTWt1eUd4eVB3OSs2MWFWSHZnemNy?=
 =?utf-8?B?STgxSjJBT1B3bUw0RjZZczJVSFhiWE9iTGJiMnJ0eWhmeEd4c0o1V3RwRk04?=
 =?utf-8?B?NkxHTCtDYnNGNVhlOWM0T0NSNTAxRUJPVVl5NFZzcWN2U0F4YkNwQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b64ffb59-dee5-4c96-5c11-08de8968299b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 05:42:40.2002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZI0y6fqtYcoWhdbe0nmpVZytIq2SnU+svdxh+pso7ilDXDoBeg+8nO128BLQIPdoU25sNMU3I+M5IGodCTvMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8967

From: Florin Leotescu <florin.leotescu@nxp.com>

Add pwm fan node and use it for A55 cooling.

Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 56 ++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index ec728efbe15cf0b97deade68445b23528325b082..7125c7fc6e32999fd279b9d01af0b210d1ab843d 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -7,6 +7,7 @@
 
 #include "imx943.dtsi"
 #include <dt-bindings/usb/pd.h>
+#include <dt-bindings/pwm/pwm.h>
 
 #define BRD_SM_CTRL_BT_WAKE		0x8000  /*!< PCAL6416A-3 */
 #define BRD_SM_CTRL_SD3_WAKE		0x8001  /*!< PCAL6416A-4 */
@@ -314,6 +315,20 @@ i2c@4 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
+			fan_controller: pwm@2f {
+				compatible = "microchip,emc2301", "microchip,emc2305";
+				reg = <0x2f>;
+				#pwm-cells = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fan0: fan@0 {
+					reg = <0x0>;
+					pwms = <&fan_controller 26000 1 PWM_POLARITY_INVERTED>;
+					#cooling-cells = <2>;
+				};
+			};
+
 			wm8962: codec@1a {
 				compatible = "wlf,wm8962";
 				reg = <0x1a>;
@@ -892,6 +907,47 @@ BRD_SM_CTRL_PCIE2_WAKE		1
 			BRD_SM_CTRL_BUTTON		1>;
 };
 
+&thermal_zones {
+	a55-thermal {
+		trips {
+			atrip2: trip2 {
+				temperature = <55000>;
+				hysteresis = <2000>;
+				type = "active";
+			};
+
+			atrip3: trip3 {
+				temperature = <65000>;
+				hysteresis = <2000>;
+				type = "active";
+			};
+
+			atrip4: trip4 {
+				temperature = <75000>;
+				hysteresis = <2000>;
+				type = "active";
+			};
+		};
+
+		cooling-maps {
+			map1 {
+				trip = <&atrip2>;
+				cooling-device = <&fan0 4 6>;
+			};
+
+			map2 {
+				trip = <&atrip3>;
+				cooling-device = <&fan0 6 8>;
+			};
+
+			map3 {
+				trip = <&atrip4>;
+				cooling-device = <&fan0 8 10>;
+			};
+		};
+	};
+};
+
 &usb2 {
 	dr_mode = "otg";
 	disable-over-current;

-- 
2.37.1

