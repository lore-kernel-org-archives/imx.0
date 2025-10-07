Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020120.outbound.protection.outlook.com [52.101.69.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962C028505E
	for <imx@lists.linux.dev>; Tue,  7 Oct 2025 08:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759824791; cv=fail; b=hSCC0kZlh8caftdqKnMhujz7BCdSZZUtNCmd9zZg+9ydHm4Jq426Ii7rBmESUdAV20k8VbpAGUCnh65+MFxXZnFr20mTqYXK+R9umMxEoLv/+KfzLJff9WV1KubgLkV77APH594XWUDZD1BVFX/8xsen147XSFiV8cdNcTb/zmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759824791; c=relaxed/simple;
	bh=9iko0f+tSHI1r8E9bryFm5CWlAAl5CZKnMA18PPv1L0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=XRqOV38Bv7HoNB940Q556Nur+5XmrHDwOuANcS73++5Qsf5duYyAiBYLvEt9QJLJ8Pkw5ihV+3WkCyRq4mcFppbtq+FQzTGt8dHhj6DPGSlc55Qf+F7wDVL/mvkwmHT8HEWaPN7Lv5xxWqsDavCfs4cetkl3vefuGfztRDsW4jI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=IkFv84Xd; arc=fail smtp.client-ip=52.101.69.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="IkFv84Xd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/9v9TQ1XUJCI0TOWvXZ3CIAz1VzXUjvMcPuLCU9uppWqxJn0pEsGcLrrW9yGIEIUGD8RwvzCmQNi/MtdkT0YniDVTSsGK/UPTAegKSn3rYrsz/bv50BBIVCbajzODwJ7DxbsWRM6MbsYXI3uC1jWG257n/1XD1rafGMwUYbBCI2x4b06muBHJOOCxwEvihHkFehDevgmGLS7nBdW9Qhr07I4rcqygw5S4jC5uoyszqOOVk2oXrLIGiI1tpyQA0LC6aR6tBiXzXyebzEYc47upfCIAQ0Y24Mh4V3nWuos3wJwV5tx1bltBrpfH1crzyJa3YyKrv3QXelIX4McHIzrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCmkZgKFMyuT+sM7m0n7s9ktzIaXj5k2PNLO9h9tIOA=;
 b=arcxzQjGxF2gsEyxp3A2JAfHkbdPXvBz0mN9rEAxLicDhV3ah3NLNRCJD/DovBHQ56RXUDw/CM2MyBJmWzrqRC0OGsMwI+k3sQKqZ3m0R+91tN6qVSw0bsa9xz/fe8BLVxyuY0UgBLxIq2SAQtC6VAGurU89pbsXpItu1VV34azm24bK5YufVK1bcluo9ITCIqsi93/0lvrs++OUy9wreKzvdCwXV3LfaOrsxedM+lDr1104Tg7VzuJ9ilPzJA4uuuyYMrF5KOSdibU0PCpFtSK5gxw74POn+wmMHsfLG8tdn2kT7DSQJrR+knY8Fwiz/U0U16KrYw85t3pO7WMNbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCmkZgKFMyuT+sM7m0n7s9ktzIaXj5k2PNLO9h9tIOA=;
 b=IkFv84XdzSDP7DSr9Vr+5fx5HXzAcCI0hZFp+lTgrqsBcAwA/RNPfrBHiGh6i9FJaWW7lzFdlTUP8nNP6Y5vUSJkT1T/OxE+kegzoYMRSIMvKENRQseQBJl6NNmBvdWxRbXqdaH3yz4cZm2LDEZCpgUsjSjlAdfoLQE/l7WAyg3gr/Azr2055/mgOCekKltm9iEDWsSCMFA3QKQNAR7LpvIl14VkaSZifj8Kl1cWh0+ctcNg4TA8p08cAoK0zpqDnh1jS4SRlmUo0IAw8RVahhaOsYmmYjElr5VGyGFGk5ZaX3ByOnVnc+exEPv9n/JjIaUIPmV1xm4+Uhqa7i9HvA==
Received: from DUZP191CA0001.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::24)
 by VI2P195MB2545.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:22c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 08:12:54 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::6b) by DUZP191CA0001.outlook.office365.com
 (2603:10a6:10:4f9::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Tue,
 7 Oct 2025 08:12:44 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Tue, 7 Oct 2025 08:12:54 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Oct
 2025 10:12:45 +0200
From: Jan Remmet <j.remmet@phytec.de>
Date: Tue, 7 Oct 2025 10:12:28 +0200
Subject: [PATCH v2 3/6] arm64: dts: imx8mm-phyboard-polis-peb-av-10:
 reorder properties to match dts coding style
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-3-7e5de62c79bf@phytec.de>
References: <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-0-7e5de62c79bf@phytec.de>
In-Reply-To: <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-0-7e5de62c79bf@phytec.de>
To: Teresa Remmet <t.remmet@phytec.de>, Janine Hagemann
	<j.hagemann@phytec.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EE:EE_|VI2P195MB2545:EE_
X-MS-Office365-Filtering-Correlation-Id: 532b0c30-8549-43f2-3144-08de05795102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmZxckhlM0VEZGN4YldKbWliSlhJdUJYdUlPRUVZRDB5d2hHeTFicXZEYW5G?=
 =?utf-8?B?aHRKQ1p2L051L0VvRDZlQ1JHeS9SOHR2RURybFdGQ25zMG9ZcVZONThQN1hN?=
 =?utf-8?B?eWtORjFmNmt5ejU2WU9Hb0JLWEltN3Uvb1ZtQTVGamNNWmFuMjhZUmx1Z3Rq?=
 =?utf-8?B?Ri9Yb29pSEdrZFdUV0M2RXF1OVRPbXptVCttNExhd3EzMmZiREdLcGM2Yktl?=
 =?utf-8?B?NUJieGxXYm5Gd0VwQmxPeU5FVmZDMS9TZVRZV1k2WDZxbU5abC9xSSt6T3Jq?=
 =?utf-8?B?VkZzVWQ4K05UUm9RUldydVMzY0ZOYURxcmtQdVBtWHZ0dXJ3RzIyTjFkNjU1?=
 =?utf-8?B?VTZONWpEbHJSWlFxdFZGOHFYalRuSXg5Vi9pejhTVUp1cTYzNzl4T0JOVkVK?=
 =?utf-8?B?NnFvYnp5VjdCSG9XMFFrZ0pQb1dzY1NWbUg2K0kydWllRExUUncreDJRTWo3?=
 =?utf-8?B?Sm5HVXJPWTJ5YlRMSVlnNGVOdjdMOHRDRkY4QWRKT2RXUGFJcmFOYmQ3Tm9i?=
 =?utf-8?B?emNjOUtMNVdDQ3VaaXhIQ1VmTjh4Q3RSY094ZUgvaUVIS211VmFsdTlZME1J?=
 =?utf-8?B?R1o1STc1emFhT29jdGUxTkl1ZmJKZDgvS3UwMVRodnloTnBTREVtZWJ2SU1Z?=
 =?utf-8?B?aW5QdE1kMHBRd25YZmh0VU9QVUtJUVh6MUEvYmVuenZNeFZNVjkvNkFORjdp?=
 =?utf-8?B?RVUxNXh4NjM4Q0hkYTZ2ZUdtN0xSWnhyOVFUWUdXdkt1TDJHU1VPazB6Zy9v?=
 =?utf-8?B?ZUJIZEsxajhyaE5YNkVHNFRyckpuT0duREZJb0pWeElnbmhNZ0RqLzF5RG9o?=
 =?utf-8?B?QTlFUm5mVEdkU0xBdUVCZmtCdnh6UG1JUmRhejc5cGZ2YlJJL0swUWRhWFJL?=
 =?utf-8?B?OXhBamRJVHFvTlYrNFhJY1puRUs5QVRiRmpMNngzL2dmSWw2NG82UG1VV3NX?=
 =?utf-8?B?SnFGVlRmRXRoS2lVckZiUUprQlRnWTFneDBhYmRtK3ZPM1NOcEhpYzZPdDcz?=
 =?utf-8?B?dW0xRUpVQVBVekZYeEt6eXFuWjBaeDJBRE5VWWhIZkIvWEpCeDluL2ZWc3NS?=
 =?utf-8?B?THcyTVVZK2pESFNtM1NiNFRReHRsZmdlYlZrQXIxMmV5VkRmSFM2Zjd1TkJ6?=
 =?utf-8?B?MEdZQi81RVd5WHRISU80VkhRVjRzZVFjZmZqbmZ3dUl2WS9oZmZiZjc0dWhO?=
 =?utf-8?B?MUZRWW1XY2RFQVZsbno0bmY1c28xczhrdlpiSFFKS21STE1jWW1FbjZhMzNP?=
 =?utf-8?B?SUlCNTBxZjBuRXNnc0traHZBMWF1ekdpOHVIeU1halVMVTdoYmltMkxOakFZ?=
 =?utf-8?B?Y0dTc2RraVZ5U055QnV4N0h0RE5EMXIveW4zYTdhWnZFYUVsR3IrMFZhQWJX?=
 =?utf-8?B?YVFhMFFzdzNNU21NbzA2cVUxc3hURjdxRndkTENHaW5nTSsxZDhzZStrdHls?=
 =?utf-8?B?Q3JDdDlLZDJPdnEwZURibmowRVRDZnNZanFlblZPVVhFczBTSUJaK2IzVXcy?=
 =?utf-8?B?bmdtOE03S09NZExCM1VJUkh0cXVDa2FieVlMek1JdE1YYmtvTzBlVWY5TEJj?=
 =?utf-8?B?VzFQN1I1SUU1bHFXMmNydU5SUkFOZGlsaUpmbVp0WW0wbEtUVmVPV2gzTmVw?=
 =?utf-8?B?YnJWcTFMYWlMait6MnpVSUt0TXN4RVpQRVlGa0VLUWVMVS9yWS81TGduVm1t?=
 =?utf-8?B?cGdjMnJ5bmJqU1N2Qkt0eU1WelAvMFluNkdaT1kzbitsNTZyZS8zOFFYaW50?=
 =?utf-8?B?dC91Ykh4NkhWME1zY3NvaDVIOVBPb0JrQnovd0ZEQjhqR3dWSHVIR0ZPRC9p?=
 =?utf-8?B?TlczYldhRldvdlQwTHBlNHQ4Q213RkJ4NEc3WFlpU2FvVTMzUlcxb3ZqVGs0?=
 =?utf-8?B?YVZYSmxlTU9IRWZQTldsTkJCZkYyU3E5VGZ1a2ZMNGFQdklPR1BuWElGOW44?=
 =?utf-8?B?YXo2WmFpdTJRU09nYWI0TWFFOEZzTlZTNlJpZ2IxdzZQUmJqcWRXek1paFBw?=
 =?utf-8?B?bm9CK2R6RlBMMEtheExvUis1QkZGcURFdzh3ajZYN1ZmQURTN2xOT0tMOHdW?=
 =?utf-8?B?MlQ0cmJnYlFSbGpoWTRacUpCMDROWThLWEZyVm5ldHBnakRTOVkyNEJRcWs3?=
 =?utf-8?Q?NL68=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 08:12:54.0757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 532b0c30-8549-43f2-3144-08de05795102
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2P195MB2545

Sort properties. Rename regulator label to match schematics.

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 .../freescale/imx8mm-phyboard-polis-peb-av-10.dtso | 48 +++++++++++-----------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
index 5d4f6a9c348b57ee903c7b74f8c8e2b318060945..74547642a34aadc60ace9a9cd2ddea37877d6aeb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
@@ -13,13 +13,13 @@
 &{/} {
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_lcd>;
-		default-brightness-level = <6>;
-		pwms = <&pwm4 0 50000 0>;
-		power-supply = <&reg_vdd_3v3_s>;
-		enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
 		brightness-levels= <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+		enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&pinctrl_lcd>;
+		pinctrl-names = "default";
+		power-supply = <&reg_vdd_3v3_s>;
+		pwms = <&pwm4 0 50000 0>;
 	};
 
 	panel {
@@ -34,27 +34,27 @@ panel_in: endpoint {
 		};
 	};
 
-	reg_sound_1v8: regulator-1v8 {
+	reg_vcc_1v8_audio: regulator-1v8 {
 		compatible = "regulator-fixed";
-		regulator-name = "VCC_1V8_Audio";
-		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "VCC_1V8_Audio";
 	};
 
-	reg_sound_3v3: regulator-3v3 {
+	reg_vcc_3v3_analog: regulator-3v3 {
 		compatible = "regulator-fixed";
-		regulator-name = "VCC_3V3_Analog";
-		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VCC_3V3_Analog";
 	};
 
 	sound-peb-av-10 {
 		compatible = "simple-audio-card";
-		simple-audio-card,name = "snd-peb-av-10";
-		simple-audio-card,format = "i2s";
 		simple-audio-card,bitclock-master = <&dailink_master>;
+		simple-audio-card,format = "i2s";
 		simple-audio-card,frame-master = <&dailink_master>;
 		simple-audio-card,mclk-fs = <32>;
+		simple-audio-card,name = "snd-peb-av-10";
 		simple-audio-card,widgets =
 			"Line", "Line In",
 			"Speaker", "Speaker",
@@ -89,28 +89,28 @@ &bridge_out {
 
 &i2c3 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
-	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	pinctrl-names = "default", "gpio";
 	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	#address-cells = <1>;
 	#size-cells = <0>;
 	status = "okay";
 
 	codec: codec@18 {
 		compatible = "ti,tlv320aic3007";
-		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_tlv320>;
+		pinctrl-names = "default";
 		#sound-dai-cells = <0>;
 		reg = <0x18>;
-		reset-gpios = <&gpio4 28 GPIO_ACTIVE_LOW>;
 		ai3x-gpio-func = <0xd 0x0>;
 		ai3x-micbias-vg = <2>;
-		AVDD-supply = <&reg_sound_3v3>;
-		IOVDD-supply = <&reg_sound_3v3>;
-		DRVDD-supply = <&reg_sound_3v3>;
-		DVDD-supply = <&reg_sound_1v8>;
+		reset-gpios = <&gpio4 28 GPIO_ACTIVE_LOW>;
+		AVDD-supply = <&reg_vcc_3v3_analog>;
+		DRVDD-supply = <&reg_vcc_3v3_analog>;
+		DVDD-supply = <&reg_vcc_1v8_audio>;
+		IOVDD-supply = <&reg_vcc_3v3_analog>;
 	};
 
 	eeprom@57 {
@@ -138,8 +138,8 @@ &mipi_dsi {
 };
 
 &pwm4 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm4>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -154,8 +154,8 @@ &sai5 {
 	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k",
 			"pll11k";
 	fsl,sai-mclk-direction-output;
-	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai5>;
+	pinctrl-names = "default";
 	#sound-dai-cells = <0>;
 	status = "okay";
 };

-- 
2.43.0

