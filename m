Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013015.outbound.protection.outlook.com [40.107.162.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C644C9016
	for <imx@lists.linux.dev>; Mon, 11 May 2026 21:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778533530; cv=fail; b=nzUXPNRYhzO6Y0LRjsKzXwb/e8qTe4roKL/VYLYiDBlndq8a+KayVlYe5Zp81Gf3JSOwPTg/Cq+xHzLU6PhWZSaozRLRnoPcGSkGylmNfhx7zVoMiDc7EIjCfTNfxuMPvMPJ94TraWz02ogotpdvEQocPHg3ubYTF0e9lFl2Scs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778533530; c=relaxed/simple;
	bh=lChp6dZkf4Lh6xPeYaAnoILp8V5HeuNeqPWAvYdHH7Q=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hM9Y0P7PgQHwBPtMmLZlTjDiTEM69Apco9pO1F7SWcC339mfMz1l/T9bzHVPGhWxVjglPDXMSsSqeH+qIeZZd3Gvr+wi8aeRMDwFIoOFAtr2R6CL3AjQFCYAfFF7ekPibsygOx2+AUyKOvI44o3xyM/BDCh5Pv/YirNOVl+AA/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=blL/XF5P; arc=fail smtp.client-ip=40.107.162.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="blL/XF5P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HF6Zy6uqQqfqwdsPOi4rICenbeIqS2sx4Ju1tVKO0lHb3aprgj/JAyTyEqsQT6n6YKge2pWk3bMqGsom9Eqynoyn4u3qPrjBJWw0MvXu4l9RwmFbKY5ZQlKee6Oa+q39K9kHTekY6NBb/JJ/R+WDIlKvA/Ehw8fXDIDoLozlZLtPObWzkMUPQIrFfJFlLK+GKvLETRru4pG7RpsahbMTIjIXIB2XWMD2MTnmKEasVfBct2D/uVTZZmIt5/3i9CwK47ivbN3b9zwJMaCPgKkOXzNVqIO2GvM/TH62qXPSVh9IK4IJDG2zxnd0b311GE8D1Ku1hu5IaZBxlmKLGLUjUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qk3oKOa3cq/Zb703FY+BXZ3hyrX29dkR0XskHLbcS8Y=;
 b=xkCSaGSbP7XL7jLOqt0KKudYXX3pcP5eHqaCOfcLBAX+pzGsJPiyjjMciR9B3vEtNNFf2RqylGyJoDfPiRrFUcPenyS51wCWSqabMkUNXXcv/F34H1/qM8pUmrlTQcOEMCjpc0gqII6QJxdg0e8QQEXux4y5r1OHbl32HoPzJ8eiur6mdvU6qaEBtrSf1/Xmfk2c9m4f+WZMbaYxqIwdZXpiRto3zHmfmD0pJu10FdcK3etNQUHt3jPkyBCOCn+UxZqvQfctN4za9F8BwxCkivIAlSExq8TJGvL4I5nJX0sjVdFnx4yV1frRwKSI1XF+5Hr2iEE2lETtkejhUKmC+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qk3oKOa3cq/Zb703FY+BXZ3hyrX29dkR0XskHLbcS8Y=;
 b=blL/XF5P2Lb05YmoGlE9WQ9ulTfew951UngOrP2j53cr++Vy767RrfCcbEu6RuE26A+cqJOHIDllIVNtwqX8fNRhLRx5mc1NG94B5pgk7BSgAVC8FXJseZxhG/VYK6qbeq4UqXZO9Xo2uYkeOh31ZHKfRq0ggNuG/pTbw8x/ejRYBrRZ/S49ykEaAbKYJ9bZAMt8s03Ys7llwFqFY4LddM53+NFLEdQJUhC5vBrEzRyhnp/s4tql7PLrP3TDVbZTls4MKILlzTZKzR7ZIYI74XzfA5iJg/9V6FLCOo4Yd2xglPcNWoaVX3oBNMq+ihvaQi+SoOv4WccJNWzL77VMjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9155.eurprd04.prod.outlook.com (2603:10a6:102:22e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 21:05:20 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 21:05:20 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 11 May 2026 17:04:58 -0400
Subject: [PATCH 3/4] ARM: dts: imx53-qsb: add dvdd and avdd supply for
 panel sii,43wvf1g
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-b4-imx25_dts_simple_warning-v1-3-01b855a5ce25@nxp.com>
References: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
In-Reply-To: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778533510; l=1312;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=lChp6dZkf4Lh6xPeYaAnoILp8V5HeuNeqPWAvYdHH7Q=;
 b=ldyAGM7GqdauiZPKNmR2ym/fBQSL2kqwaKa21j27RQfv2L4u65KdGk/XJmZUhYzFmjXHX1ODs
 DVC2lPfqlAHD7/Te2xVClGbLmIAFPuioXzHbXsyHVdeNvilpK4IdGz2
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN7P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: f917f102-cb7b-44a8-66c9-08deafa102d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|376014|7416014|1800799024|56012099003|22082099003|18002099003|38350700014|11063799003;
X-Microsoft-Antispam-Message-Info:
	H2WoCc+VTGCduHmSoRIxCVMspqsintNjwOx/Bye3Qgn4tg3hnJQNibpv2BYT7g3WOU94TQrwE0FEdxMLWzF4byhPh4lbmBVrSeTRNP30nB833uIcWAxhrgnXYp1URQsI/rXkoZP7X2nvwCJImtc3GB/8dW6ottuQGoiaS9bcxiwneFGCw7yyBnpmMxUxOdgw4LmedVLIAX1YrVwzYPjwHC25WwoXpS2CXV9li7R1injsenh1i5A9wRrdjxWqTlzIv/suE22S3JOMvd2PLVsiKc0lqHJXyEmpCb9wblC+i9Ox0dgh7qswVRiDY/MyO7l3JkFl251kkcE2PhX4/nLA2kEOc1CjoBq7NdxjLeTZuhEqCW/PP6KmTs03588TnS4GS4kkIZmH/lK/KQ76H6PhBqT/UnQe6EFU6Crv0uPIWB4ayO7+XUzDgot46JJBMQZITfFHIWU/aVJLtTH7K8y/Yp1pJXHzoGQRIunGRQgUFYDeJPXPbNMLKKPYsecxKFAa8AeWnuK2Tq9tUBnZ1w+1vREDZZCRbYkNjqWlXOrxBnhk/v6x5PUWwaW6vMz4f7BzPnZ5BFTj4jOtkVnQ7fswudYqt69YHyRAdxOue15vCRNN2rho38fnxLLw8+gNimJqX6pq22HMna5Qw8XvlOKuND65xevGO+13F0ZUgr+l+azxlyUGkrilQm+fqWicXr8n5YvF2WpOsHjielqEpgYvlWqLU+Rvy59IHDghEicu/OluiHkRLdbxXSpkizBpeQW7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(7416014)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2JmOWhsL1pmb2FCR0JMbllUMmRxZ3BYRTdlcHNDZXdLOHB6cUttRmFnU1hy?=
 =?utf-8?B?NE50WENpWnozQlpUL1ZzTTg0N09tOEVSSnVURUVHd3lmdVZZZitYUXhtM0F4?=
 =?utf-8?B?bUFvMTJ1UUxNWmUrRlJlZ1Bock1pZVNOd2wyNWVpUU9xTExwSkFacGFhbEM5?=
 =?utf-8?B?dDF1M3JBU1lhOFhYSzVEUS9LbExaM1JzTk92bW0wRzYraDduMEVST0lDcWFZ?=
 =?utf-8?B?U09DcTZOTGpsSG9Ta29MWHA5b1ZnYkwrZkpHODhMUGt0K2xNcUo3ZVlkd3BG?=
 =?utf-8?B?VnAraEp5WGR4Qnp2a3hCUm5iUFdZbXd4WHhOY3crV3lHNTRGZ1psZkRUM1Jl?=
 =?utf-8?B?NHViWE4wRFdCMmM5aXRuSk9lTVF1RzZWaTVwQXJEZWFzZ2JtaXAxNHlXUjFS?=
 =?utf-8?B?T0FleDVTa2JSaFozRDFhSUJaMkhWb3QxY09YdzN0VFpBcVdYSCt6VHZOK3RU?=
 =?utf-8?B?RXhCekp4V1RjT2VER2hZZVEySFR4QzE0c1ZyZ1FlUm9LUTBVNnVZOVBRNTJY?=
 =?utf-8?B?Y05Ha3YrM2NPbzVTTlh6TGxMbDlhcVZEZ3pqaUdHcnJhc3VIdnNzUmkrcVF5?=
 =?utf-8?B?MWZscHZrUGlFVWNXZmRqWllLVzRqVHJPNVVrQ2k0bkZjN0JPd05JNGtwVHp5?=
 =?utf-8?B?VW9DUjhReUZjK1lGalFzMEJPU1NDdkI5cHRvUWJ0eU1UTGNMT0ZycXJyNS83?=
 =?utf-8?B?ZzJUUjdGbHhlM2xPYitabUxFVHFLbVpaaWtENUd3QldsUjg3RVZiR1RxRGFo?=
 =?utf-8?B?cm5QRm1VaWkvc0JjKzBJb2hYOXRxS1cza2c4OXZRZEoyZWgrRVZTRlA2U0dE?=
 =?utf-8?B?YnZaL3hPcUFjU3ZLaUh2OUt3bm1XQkkwNW1QU3p4NHRzR0hwRVBydmFiRjBP?=
 =?utf-8?B?TXlkV091d3pxbjhCMjZPdmxJTkRsK0w2dGU5YVkvUUpHTC9RV3Bkd1JxNjZY?=
 =?utf-8?B?NFlPOU9EUzdoSjRTMldqNU5wYTNGY084b3E3WkJ0YUFNZWo1ZXdsNHVzb1ZF?=
 =?utf-8?B?eUxBTkhGWnpjeHI1NTZxYkR2NFFsU2lOS0Rxa1A1allXSXNxS3p4dkxRYjN1?=
 =?utf-8?B?N21UVndHWjNzOWNtM0JOcVh0d1QzM3BIZmNWWnUzajlsU0VVNTNqWmNIU0tm?=
 =?utf-8?B?UWMvc1NBTVBxSEhnNFhFRldJTEdtaE1TYVVzVEc1Mk03aEcvbXVmbFNsOUhw?=
 =?utf-8?B?NXZvMnJ6NWxLK3ZoVmxGMTNzRnhZVDFsbWgvK3ZaMnpLSGxudDNaV0FHZGxi?=
 =?utf-8?B?ZUhxMVhNODRrTE9KMlNDQmhrZUlOYy80eGNNdStjTXhkVmthNzJUdTRYRDFa?=
 =?utf-8?B?Mm8rRFdlNGM0MUQvZzYraDNNS0tzMStINzVxL0JPdjY4VVN0UWpPNk5UQy9Q?=
 =?utf-8?B?R1hWaEx1bEREQTNURjhkU0dRWnU2a0Y4aWpmZkorR0JNU3JNY1cvSmxib0dm?=
 =?utf-8?B?Q3dCVC9QbE1hU3FIR1p4M1NCZ2NoR3RKc1dNMnpmTEcwdk9ZNStieGR0R1I0?=
 =?utf-8?B?WVVjcW1oY09wWFllWXducnptRWhvSjZQeHZwQkNEdHZKK3hYK2R4S1FiTXVG?=
 =?utf-8?B?Wlkxd3A5cWxqYkdLSng4YW5acEYvNjVraVErd3pHNk0zTGptRzJDdCtHbUd3?=
 =?utf-8?B?TFZmNWMzN0pEL2tkTmZ5NjBQOWdhSlFuUTQwMWFManpSVTZRQnFBYUwvdGgx?=
 =?utf-8?B?V3hHRGYwRUtrYmRJZGVESTZuQlNLNVI2VjZSeDZWY1FhMnhNK1RHam1tSjc3?=
 =?utf-8?B?eDlKdVhMUXhKYVIyR3IvTDB5Y25TRmZkNlV5dkVSMDlaUFlOUkVTS3FEbWhO?=
 =?utf-8?B?eEFEZnROckkvT0xFcEU2YzdUNHhaT0txQjY2MTlzMGFRczhUN2Z6eGlFYkNn?=
 =?utf-8?B?ZUY4OENnYUU5KzdGamlHK3Q5Q2NqcmFvU0N6UDM2YVZJdi9wMVVrWXZxdlha?=
 =?utf-8?B?c0RyeWhyNnVEa3VOOTRPblAwLzhtSUlVdW9WenFmSE5kR2FrbG9pTFVpdWN5?=
 =?utf-8?B?TFA1SmRYYTAwYWtGUWtEanBEdkw3eHVrYzVHVGhOV1JyS2NUaG1EVnNQN2Y5?=
 =?utf-8?B?ZlBKUkZ1SGJhTmxLMk9CRmRvQ29tcktaNVJibVM5S1RyY3dYbW4zZmpLZXZo?=
 =?utf-8?B?aWQ4Ri9YSmdXY0pkU3p2R2pzL3hUVFVaZzF0Yit6ZTgwMjJJMUs0ekhQaVN1?=
 =?utf-8?B?aWtVTlFhRUUydWRYbmFkZyswYjUzZHAyYTVIZkZ4c3drTWtSbmd5a3NjaytL?=
 =?utf-8?B?ekFIYzdxdjAva3R0ekYvSVA0U0J0VksvU2RPMzBiWVg1cjVqbEJ4a0tMVVdP?=
 =?utf-8?Q?y088j8/UmWlzMEW1j5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f917f102-cb7b-44a8-66c9-08deafa102d3
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 21:05:20.6942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZIiCl+YzZ3BagqKsjfCrG/dg8es1ZO06HDqdCqx1ZGnke6WcbIrdk3afuiWZzQPfHO5eYdsn5A1xDMflTolCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9155

Add dvdd and avdd supply and regulators for panel sii,43wvf1g to fix below
check_dtbs warnings:
    panel (sii,43wvf1g): 'dvdd-supply' is a required property

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
index 1869ad86baf202098c6062c0f511358eeffb5c5a..d3b27dc3c2c7d2ab868a8a070a164af994ed30a9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
@@ -91,6 +91,8 @@ panel_dpi: panel {
 		pinctrl-0 = <&pinctrl_display_power>;
 		backlight = <&backlight_parallel>;
 		enable-gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>;
+		dvdd-supply = <&reg_3p2v>;
+		avdd-supply = <&reg_5v>;
 
 		port {
 			panel_in: endpoint {
@@ -107,6 +109,14 @@ reg_3p2v: regulator-3p2v {
 		regulator-always-on;
 	};
 
+	reg_5v: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
 	reg_usb_vbus: regulator-usb-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb_vbus";

-- 
2.43.0

