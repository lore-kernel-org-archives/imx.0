Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013017.outbound.protection.outlook.com [40.107.162.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F033A63E6
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 05:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774331467; cv=fail; b=qI6mk6kdVCOvOgtxBLaCj62IwUc0ata8eT29thiaUi2QbYsfD6yNiAKsXjIeun6Wh52D3F4OhyjbPEKiUB4mgk1/8nhehfDP7VMNwUczaL6XQhB2rJwb+qvEWwIIqwmhOMWe8L60siFbsmKMEUB4AjpQ5dZ18JtksWKEx4CVEzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774331467; c=relaxed/simple;
	bh=Jl4sRE7jtSaQNNAPp6/S9XEbS1zJeExg5uV3UIvcxqI=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=IY2EX8whRj82EWTw0f3En+h0m70DLTmTiwr776bC6rbGE0reAvtxEsg+uqv2ywqP1qwA7jGqlwpm915Ja/AmHV4b98TJ0eLYLEV+zMbhZQ4BI7jAgUQoPbbFB6HbzOACAVZm04gtSOxBFuM/0HsTbIhnQOQ7NdpvIE741CZxM2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AikttDqf; arc=fail smtp.client-ip=40.107.162.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AikttDqf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvRG120whzCrSjXYhzI5ZEhqhVzs9wHjcbBGONHd7s5ZqgG1xk/4XMoqpm6Ot6J0QkqldGIYP9DmSrBPB+7CB+A6/luHv4F5fq/V7Mj9WtNSwyC4T/CwJeNjSNR0JAeu3OmhcaZyTmiY8f4BTWcwBurn3BMgFWPdHAzHUIbFDwZ1zjL+ztpRHG0n0+RHDWpg82P/gyklcDoHXSCaehuo+2GMQm0uja0zJuL0FHotFNlLzG+HqyAyEbUie2Sfp1nlaAEkOTn/AY7KY2IGvhC06wCRUuX8YW3g+g5LQXE7b/mtbWfhZrxDpqhQwNuYk+vECiC9Mmj9Ts5jxD9h7QGmGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whBiCDU1vA5z1V1AF0riHFy54l/3BbRqAIL0aUCkj6g=;
 b=GKFxSzKW5+RSdkqZgDz/MwpNvGkAn79d9v5/O9JM12rINbyZHwy5bTjtIKCwwfRoWHqrTsx7NL7c3yeexIEAGQJIlWxSHFTNh3w2zyIhQY/FhvmV+HxXj6Sbr9qiCmuFeeHeNIQHFYPXpJWZyyn/zKt6UyTcQHTI1MBrFuXOC6W3W3XGReCQ6EvL8/5H+BguoNV6YLlAVAxf/rhRqI5czPH8e9ge9TR95Ykutgz14uDJ9yPcCLSaWBjwENgPbnEk8dmQiduTfW0Rm+mQ1S02VhuLqMiXMcDfFD2JXmERDudTTto5Mghl7rVoRfNTYPsA2APl3qE3hO+gJ+MqSaaYPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whBiCDU1vA5z1V1AF0riHFy54l/3BbRqAIL0aUCkj6g=;
 b=AikttDqfzlZ+HEvEH4MDm3lYzhEPoBDVCoHht9r1AO2Wx5OgomS7K3jzIIeeD+6He7GpWp6Ud4tvOCTSaJ4inNu4xbrPdsvbNl0N9tfQL3fFJhcG1Ylgib74Ma3UsqDq8JKzD73yNtEKoLHr1kck6apqvB40sW0u9Q4iEU2kkS+ThPNhgvVdII2haEbMXf0Derh8R1hgHouDE8XuGocAjOIJdAXD61HCUH7wb+zqJodkrD46vNmHw4vO/i2TguvuOtP/O8R6ZK9Nay+qCvLhDy5g5F8gXFr9mkxuv0Ja/r7KwTKhfEoxcQhPTj1jKlqNuZ+/A7fK7AKwHDQGWlKG6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS5PR04MB9827.eurprd04.prod.outlook.com (2603:10a6:20b:652::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 24 Mar
 2026 05:50:54 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 05:50:37 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Tue, 24 Mar 2026 13:52:03 +0800
Subject: [PATCH] arm64: dts: imx8mp-evk: Specify ADV7535 register addresses
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-imx8mp-evk-adv7535-cec-reg-addr-v1-1-52dbdd63d5a4@nxp.com>
X-B4-Tracking: v=1; b=H4sIAIImwmkC/x3NywqDMBBG4VeRWXcgJjURX6V0EZK/dhAvTCAI4
 rs3dPltzrmoQAWFpu4iRZUi+9bQPzpK37jNYMnNZI31xtkny3qO68GoC8dcw+AGTkismJuzss3
 wIXjTOxepVQ7FR87/4fW+7x+MuP6ScQAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS5PR04MB9827:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a2f0609-9c4b-448d-3305-08de896945ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|1800799024|52116014|376014|366016|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	e0PSi8tc68Ah1OOMaAcDsFYK9mj2/KJbqqLPpp52Z095yN0LH+NwydUniRsqCP4Lual+z5Dz4jOdWDphseaCTXNnk47WGWxecN4lYPQgyoHockkRQUzSXCCk8xCXNYrtAG6DdhhKpy/0GwzCg8mLB2v8Qoc4GnhgssOBoJYKNaHKz30T94XJ+WiBAVUTe3iIW9JLfm7fyFW/W2nyajb9HcTBofSgqsCq0OMkEH+EliUcRX8dmfHc16UcTZ3WRzZ4HKkE2aoGlByDKbitgmUZovBMBTHa3mqoeLQnww7Bx06crqQTnOlOhOaUj52UGzLznFURhXgNQF5+vYQBNo/tq/RqbLqng501X5qcTLLIuNHc2vdVGhVy4KduNq0s+3vrOhKD5mu4t/uOYKYvzq7UKY47lZVa71wons5sOs88uhpSF58RjT7uU2Jl1wyvPLideOwKaU1mGEdRqeSgm7uE08YzXPnC9cz3AoCs7XJ/S4FFHeWsMG8UjR3kmWECZ6HAstEic3R+6qU4Qxy9Vld0N0/W82DZY99v9djd3bxbCcDvjHC+kdwfxxKRedCsAXeb28HsUyEc1OIJwn6Dl2aH3kz8J3fosmUw1nA19iY3BeV2bh5/6ObWpd7pKU04XYaFwbmqfMzqCiKw2OTfiQ/B4dwgA3BnPkb8CpXqiaEdjGHctqbLNpdm0cU8ru6WLcJ+LTOzfXPP3PEtGVua4rJ1TXxrixAEVNSBfFLM64uzlEOwlFWfBWNRWx+/xHgXwxTxrlIVUoBP7z0VPwxX8zIQIHjjtLEBxlNGAdZm9gs/Hqs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(1800799024)(52116014)(376014)(366016)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0p0dWdJNVBGalVibTBlZU5xMENjNEp3K1pmeEJIS3hVUkdUbnY5b0x4azJy?=
 =?utf-8?B?Vy9oT2J4UnVtTjNobjR4NXhpUk9vWXdtVHB4L3Q1UENZQ1l4eXI0VGRVd3hY?=
 =?utf-8?B?L1lTekNlbkVUZVZpT25QbW9peElTam5HYlY4R3JOczFnblQrbVdMSXhnait1?=
 =?utf-8?B?VFJtU05aL1I2VXA5M05wS0g2RlY5d0krZXhLRFE5cEpia2lEOE9VbHJEMUk4?=
 =?utf-8?B?SkIveXd2aHpoMlZUN3IydzI3QXlFazh6TEF4dFVUaE9BZlo1UWJMVWxiMjE5?=
 =?utf-8?B?MmUybytpT3Z4aUlaNlFhR3BkVHd0Z1FJS00rbmJlR2xpT0wvakU4bU5uN2lN?=
 =?utf-8?B?WHI1K3NJRUNVbnZMMDI1bWd4ZTRPWUhSSm1DMWMvdi9WQkZqUTQyY1RlOG9L?=
 =?utf-8?B?NUVJUEZUVFFMZ0QvaU1QWmE0d2Z4TElDb3g0YVFCdE9MRnpFSjVsQ0k5RUhR?=
 =?utf-8?B?L21tQU9TZnJ3VjRSVjlFSFd1QWh4cHp2RkZ1SENqOHlXaVkyOU16RE9xZU05?=
 =?utf-8?B?akxnY3RFdS9jOWhCbkNaU0J0MGZ3c1YremdkaXJWdHF2N0tLbk5Rayt3a20x?=
 =?utf-8?B?RXBqSVVEZ3VSSVEzcTdZVFVJYmFkTDIySWRWbnZTKzh2QTVFK2JxNTZYNXZZ?=
 =?utf-8?B?K2tKS0RJR0MrWEg3NkMxbVdmN1NoT1pvb0JadmFWaWFmcU9IMUtXSngwMExh?=
 =?utf-8?B?eDhadTlBc1JzZ0svV1hpVmVtSDZxWVJCZGlxTnZQalFmS0tuZmtRM2ZSUjJU?=
 =?utf-8?B?WjVHZHdpblZiNmttL1lTNjhRN0lnbytoamVyYTNPV0ZaSHNPTHVPK0RHRmlU?=
 =?utf-8?B?Q0hFaUNRakpRTkEzblVmK1dJdGo2Z1lEZmF2YUdBTm5iRW1CZ3p1TUdwc1Mv?=
 =?utf-8?B?WG03YmI3YlVlcFFkMHJ4cktPMG1tSjY2NkVtb3ZFNEhlUHBudWxWbXFOUTJl?=
 =?utf-8?B?R3ZWbWpXUUQxNy9pWWVrQ2g1aU05bHNaZlU1dVdkRk11bnl5Ni9UWUhiL05M?=
 =?utf-8?B?SnZFVjZONFV4dHZTUDVNRmFNNW1ud3N3eitvM0grVTkrV0hPRXVPOGlkWnY4?=
 =?utf-8?B?anViUEF0S1JlRnpoSVdPZDl5VlIvOVVHQytITytOK0VQcUNtS0pGZW52UnN3?=
 =?utf-8?B?OEh5T1phVHY2TkcyelFBcEhPWG1wdmJ5WjhQam85TDBURjMzNzhuL1JueTBS?=
 =?utf-8?B?eGFNTG5tb1VXSlJzVU9uNGM2K05FcklYUDhsYXJManIrbCtLZDUxNVVNOGFC?=
 =?utf-8?B?ajJ5ZGYyYnI2RmJQcGZaTUxhT20vVUNKb1VHU3BBOE9kUEVPOE5xcDhWOGln?=
 =?utf-8?B?VUZ0bE0rVWhpOE44bnVWWHFFTnpUMlkyelgrbm84ZmRQd21CaC9SVDR0Q1Rt?=
 =?utf-8?B?Y0pQZzd4amFBS3drZ0I3YjdtMHVQZjhMY253V0JLRTZDYzRmd1RtM0VNazdD?=
 =?utf-8?B?TWlld2orT2hxS2hWL3NoNmFvQ3RwZVFRRjNCZWZXaTM3Z1RTc2U4NGludnF5?=
 =?utf-8?B?cUYvMUxaWG1UZzhkbWN2amhRbzF6eWowUnhlTE1RUnNXZDFZdk52N01qT0cy?=
 =?utf-8?B?eUZEbm9qUHgxeUduekt1bkJiTDBxWWs3blBvWmEzcnlLeXNMTnI4amV2M1NH?=
 =?utf-8?B?amYyQXlXNUlMS09sT1dJSmFzbE9USkVxQVBrSkR1d1pJRUlpMW9lYnVad1pn?=
 =?utf-8?B?THd3UThhQTMwenBPbVE2SzEvMEVkREdCZlVzS0cwTjdKd2Ivak52T2pybW5N?=
 =?utf-8?B?SitQNW5jeDFnYmsyUjByQWc5UHBHS1RKR3BDbUVlWkFqUDZlR0xSVVRZWW5x?=
 =?utf-8?B?ekNKQ1kyQU91NDVXMmhob0pzYk03T1RPYXhWVGMvenFXMzJzWndsRHNNV2Jn?=
 =?utf-8?B?UzRyeDNJYVgvaGVSYzFMS25uNldNczEwRGRFbFpTSE1PaTVoQXYvY0dUVllw?=
 =?utf-8?B?a0ZMNXZVV3lRVHk2NSt2ZnpUMXVpS1N4K0J4Q1BZZkRXVEZzNTEyQXFCMUlE?=
 =?utf-8?B?MktXbDJTbnNjdUdEM2xQVGNYc2R2U1lLU0NiZHZTZU5WUTQvSll4MDZ3Wnds?=
 =?utf-8?B?VFIxUjgxcHNGL3IyUkNiS0I0b253eVVtaEFvUDNzVmJxRE1lbGphU0lVd1J5?=
 =?utf-8?B?NDZHSWNWMkVzZlJXNEFUM3V6UXBMQWcxN2wwdVJ3RWlERGJwdjIvcnVUSXhv?=
 =?utf-8?B?YnE4ZFFSa1Z0MFNkNVUxYjVpK1p1a1VSODl4RzdMb3VNZXAzdE1jTXk1ZUV0?=
 =?utf-8?B?MmVqU3hxQk9mUnNZRDFsSDRwdjhyUkozYVBpSjRHRW9ha0lzTjU2Y0hiQ2xT?=
 =?utf-8?B?VFpIYVY4aldSbHA4dGpvdE8wd1ZvcjQrKyt4eVQxa2t4S3h5OUF0Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2f0609-9c4b-448d-3305-08de896945ed
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 05:50:37.2207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOakHAYAd8BBdemDzilbDCS2p5PFykXnj7OAXZLcQL93O5v5qaycZBbq6PTFTLVclrP1x1QUr+6HsbqXyY4mKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9827

MIPI DSI to HDMI bridge ADV7535 CEC default register address is 0x3c
on an I2C bus.  And, OV5640 camera uses the same address on the same
I2C bus.  To resolve this conflict, use 0x3b as ADV7535 CEC register
address by specifying all ADV7535 register addresses.

Fixes: 6f6c18cba16f ("arm64: dts: imx8mp-evk: add camera ov5640 and related nodes")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index aedc09937716..d0a2bd975a18 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -602,7 +602,8 @@ ov5640_mipi_0_ep: endpoint {
 
 	hdmi@3d {
 		compatible = "adi,adv7535";
-		reg = <0x3d>;
+		reg = <0x3d>, <0x3f>, <0x3b>, <0x38>;
+		reg-names = "main", "edid", "cec", "packet";
 		interrupt-parent = <&gpio1>;
 		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
 		adi,dsi-lanes = <4>;

---
base-commit: 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
change-id: 20260324-imx8mp-evk-adv7535-cec-reg-addr-2de67760133a

Best regards,
-- 
Liu Ying <victor.liu@nxp.com>

