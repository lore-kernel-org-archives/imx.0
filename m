Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013015.outbound.protection.outlook.com [40.107.162.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADDB4C9555
	for <imx@lists.linux.dev>; Mon, 11 May 2026 21:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778533520; cv=fail; b=IY6NxUa09y8Uaa/R2ymxACVv2dVFJAHdU0/d1BOL1eTGhw/bsRyjx7w01tK3tNYvuiu3+vAcdU7wLX6LT79JS58nWebpWGrQvaAqxHjwED6m49JjzY2vMXVLD+I2IeOd/TTMr2LSBrfeEWVciKrA8aKzvFicLXEdXcjThckDjAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778533520; c=relaxed/simple;
	bh=ZxgYgRuFCcKayUVRhr7mwX8gcYz2h/l9CxD5ypasxTc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uObvE7cHoacd10ng8T7u5NXkQpXQ0aR6GpAW2JwOwOK5ndwXTkLD6WStfYd5QGhEniR+FzMvGiid/zRarVw8MwEreXDHGNtLGoozzMv5xynWlnXEpI3OxYeZ/WKE8O9NmMrJI577pvvcMOCsA9xY3V8vd22ez3FAceYRYFVX27M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OahURPqs; arc=fail smtp.client-ip=40.107.162.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OahURPqs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxPH3/FWjEYzJkvxHv30kefrzSfeFZ3pCiaX5GHLAOMThmZn2VGBWSqi240ZjPRDKjdrGz5LUnn3UJeu9WKZKEBpb1pxPSpOVdsBEUBzJ1mvteT3kc0hq15ElT/ffpoieD/tq6JO3rTA8DumXu6euwRsskvpdGcjC0S7VJ1lAmvaw/Gv+jIXWLNqSdeSkKkltLd/7PftaL70sysfuWOlApvMrE1B8GJjyjrbirtiwcNiEGK5pI1qxqtoTUv02OY1I9yLbMc9mTlIMx+IRg0B6aFIwB6FO4lphqGV6jT45varpj2GLUirp1by35wnM9FI1JpXWBVIZKTZCm3aL+Mghg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvtpsmmx/byFBMPi4vfkIAhMttg+U95PY7EPY/XeIWo=;
 b=LmKYqFg3a6NuddSFrCmRMhEe9Rcuv/5Kz94RLR9YWjjQWPIPktsK8m9o8MVWnMQdXa4I0uY4QdoyWS5KaKca4fx8wf8zu9tU7XeFA8Y5d3jxddKAIS+0V7LG29jgkeAA4FZ/nZKOMgi2ftAhxrCv+wC4qiVl00hCo4Uuj8rP+UB12TNfAOVRqXzfF8UFuMWog0K1pT4WFgb56HNC11xUCzBEt0JyaJ/ge7x9ogAF9U9cUqRpE9e8IoWjrJZ4w3YsngJBCmsGwFH2DPB77JQSuGbCyjWNt+aTXnqGwgrmx+LmM/rRVeHd5cUGqZAyvrBaolSlGywT80eScA7LR1QTzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvtpsmmx/byFBMPi4vfkIAhMttg+U95PY7EPY/XeIWo=;
 b=OahURPqsGWUKjA7J7b161Tz5oGITBL978Q3irI0msb3Hid+AzEXisvfpKNBytrwNyDVm4PRteXd4KwMLYfVtmWklTwylE8olpRH1AmmgSOE7I89vVfIVGSyNTJqsYp1C255tTYCCVCbCuHgQjSpQhs/N5X1J2eRoa9wX6WnAbDFKRCXBfy8a4k6ebWEgErCtip2K4WHt1KVRvWee+mtgo9/5CGfill3qBqW5cFPMZnuwtSC+a5WgngTh78wkj30+1CbHX5Rcn0eAhYfr+67Ek9JACtU9/3EB6TQIFd/gV0oFIhiRntWTnqWA8ImoIMAwWD71DF6tkRcc8tjkvSYt0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9155.eurprd04.prod.outlook.com (2603:10a6:102:22e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 21:05:15 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 21:05:15 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 11 May 2026 17:04:56 -0400
Subject: [PATCH 1/4] ARM: dts: imx6qdl-sabrelite: add mdio phy address 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-b4-imx25_dts_simple_warning-v1-1-01b855a5ce25@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778533510; l=1587;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ZxgYgRuFCcKayUVRhr7mwX8gcYz2h/l9CxD5ypasxTc=;
 b=Gj4AwdIiW9cd3Wpl16SsvvPECXsgLpQkYrRnUs3tWb5FnvNkjc9B6MPFuy58niLioNFn0LpB+
 yoFEYlurMtJAUcFreX3NTk5J/WycwaO2jK5k2agO1bxLhgdUt+Mc5ja
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
X-MS-Office365-Filtering-Correlation-Id: 62c50cbe-7339-4e4c-8ca5-08deafa0ff9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|376014|7416014|1800799024|56012099003|22082099003|18002099003|38350700014|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	SExH8uqFgOd4lmAqU/h0e/Ws1dTHblPbA6ejW9mmimIZ0Z22Jfyhx+5+wQxhX2v4tbmtjFGLkhmF6qroICMturbVSCR28T/l0bREZL0vHObAY2zyk46ghSbjX56gkAQK0+ZDQ0SMnj7na9Xo4GNClA+Fivkbm94zHb+MztorTags1Pg4D46D32T3UJ2UI6A8aSPN1QPTrkmxrx5HAbO8XMndhsXzjNtDGLSt3VgIRTayhi62hYRlPiPvf35bidllw8hEv8LI+4qnckkXkIRPlzZzbiHlPP////nd/kDelkIestBGfM+7hXC/8GS4KZPSOxPVM3ikwKZV4VMBlnFccvQpW/W7D++8F7iCH2OMr/IIgc04M2UdcvNBrgeB7g4sipfcUQzSldC04JL5S7dP4JiwONzwOPGvET5vSuAHCOsb/WAHz7cTXc4lmozhj3B8+Ayxh6EtCJpLSzfUfy3mUYF5i4aMN+L9gOvwPSdPSU4WJssPjCYgREJYQvDATyh16UqfCoB7yLRLl/3+G31ic6YF2E27DEi64tC0T+7BKjVfC9LPD1uZ7wY9zcZescgb7ptSSS05BReHJLicbZqfcFydKDqo40mu7JB8BvWPMvkQEDspXG1WF28pmgQWQ+CqkSgjJyjaWJYMQWtO5+z8+BRI0hQa0nLR46V9kJK0vC9jHtbfwcr5KzLrEQXQzgcRwthY3k91Oq0z/C/EozZ4l9KCg8bJLnDnTqio4kyYhpcvObkOsRaVPnkeZP6vp0L/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(7416014)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1o5RDVEcFY2NC9KNG5JMkVmVW8rZlBHSUt2b3lJYTViaVRHZzI2M0M0ZlBU?=
 =?utf-8?B?N1I0cFpvQmw0eURXZG1qVzEwR1JQU0NQS1VJZ2w5Q2s3bHFJQVIzUUNHdHpV?=
 =?utf-8?B?YnZvelhQTm9FUEVhUVJJdUxyZDVGTytFUmRBWFVHZ1c0ekx3WmhUZDJoemts?=
 =?utf-8?B?dkVjQmVPaDY1NXVOR1dVTUlKYjYyZkxFOW9uVG55UzI4QnByVmttNHRnQzBY?=
 =?utf-8?B?Ukd2T2p2SXowbno2Qks3cUlPOGVQT0FBa01aMHNGcUhyYytlRm9aQXVLOTRL?=
 =?utf-8?B?Y3ZiVGZoZDQ1YlJKdllSMVlOZkpWWXp3SGZyUytwb0YxRkZ5MFplS0RqVEFP?=
 =?utf-8?B?aktPdEF6OHdoZE1hbW13dzZtcWFKcmxEam50cFpsdmh3VEtGd0xhOFA1WmRu?=
 =?utf-8?B?b1JCNkk3UVU3MkgxTXg5OU4vem5aOEU0aHVWMS9jZGhYenk2aTErc20waG83?=
 =?utf-8?B?eDJNSVBTWlZLWURqUENGY2FnbDBOVkdvMXFOZGFaYjgrVTQ2dHRQSS9YeEla?=
 =?utf-8?B?c2lCY1BLK3ppNUlpcFlQMC8xVTc1b0JSM2Z5d3F0MGxjMytFYVRlWi9OVUly?=
 =?utf-8?B?RVU2bUMzbzBMd3pYKzV2ajkzOURnZzIvSVpGekNjcUh4UzE1MjY0cnNvNWhz?=
 =?utf-8?B?S281QUFOQnRDYWt5d0dmaU9tTjR1cy9naUNNbFZYdTBXRzZwTkFXN3RGVjJR?=
 =?utf-8?B?Q0o2RFk1U2d4TG5iTUgwcnRNeFprQzlaVFlXQTNYMVJNV3VLeXVvUXYxMU9O?=
 =?utf-8?B?eEpGZVo4aktYUUlrNFpwcXpoN2o2L1RTUzNQYWFXTm91ZERncitreWJUdXpD?=
 =?utf-8?B?cUNYcWQzYXVOeml2ajJ5dHpZY0UyZXViWnFGR2YxeEdkU0w0QmY5Zlk5dmI4?=
 =?utf-8?B?VGJSWmZDeno1NFhzUW5ZM2dzZmJ0ZXhlZ0pEd1hFZzRiOVA5S2hSb2ZPVzBU?=
 =?utf-8?B?UUxCZmdiRGFsdis3STh3L1lUcnlIWlFaaVdHVndCKzF0aytUd0ptUnorbDF0?=
 =?utf-8?B?dUNHajI0amIybDFMNm1JeE9vR0t3a2pDcGQ2Rm01SmU5UnRCQUdIQndGek1y?=
 =?utf-8?B?ZlRycHdmU1JaREIzQkJlVFhOamY1RjRxcXYrb1VxVVpFNEhxcmVlaUtvYjJv?=
 =?utf-8?B?VHl4VmpzeEw3aUpRaWJJRHpVajZnL3U5RHBCdWIxeVZOMTVTR1lLeGd6VStk?=
 =?utf-8?B?Szh1L3BRQnd3TndyWnYyVkU4ZWNjVmQ1VDBNMjArVnBkMmlNb2t5MGFvdEY1?=
 =?utf-8?B?Vk9hVkFIaXhzNDVYMHlXSjkxVHJTSnFFeXc4Tjc2SG91N2ZVQVFobHlFSFZF?=
 =?utf-8?B?czlhb2dNR3h1dUxSSU11c0Y5aUhkTmhQajVMS0tuODBhRTZSZWVEWHFLRXFL?=
 =?utf-8?B?YmEvMHRaRVFuRjMyc0Zub1ZSNjVlSGtKdWxFVmRVYk5mWnFmVDZYSWFabnNX?=
 =?utf-8?B?cVM2OE9TbzBraVRyd2hoK1pwSVhLbVFxZ2pKTUw0SUd2NGtnckU3MWFERE5G?=
 =?utf-8?B?MWpZcFNEZUhvRTVJWkRGeVRmNktBNVl1RFdCbmFJUXo1NjcrTWxXL2FaSndv?=
 =?utf-8?B?V0ZhUnl4eExjbjEyRnhnenk4ajBoQThqeG9ZUGhPaHYydnk5V2FtTGszWTl2?=
 =?utf-8?B?QU44WFlobnU3ZEZESk9SUVVyejJiamRkbjRwdlIyQS9QdzlCclVXbTY4Z25v?=
 =?utf-8?B?OUJyNG1HRVB2ZDBGMzhzeU9rTTYvblkvL1NzOEYxM0kwNldJaDVHMEhCNmJr?=
 =?utf-8?B?RUpVVVhXNlpnWE81VmY2NFpKZXhHWmgwb0s5VnNoUUZkZ2JLNzRNK3ZXQkF5?=
 =?utf-8?B?TVN0ekNsNU9obGhtbnJPTDFhN0lYWWN0a1Q0dlV0YWRWNXNkMlI2RmxOcThZ?=
 =?utf-8?B?ZjlMaWZrZElMWEVxeDhlR3NlTHFXU05nN0dQeTNONThYUUZKM1M5ZkJURi9a?=
 =?utf-8?B?ZEIxS3VGMUxhU3NEdlYyYlZGSmxtL09qcUNhNW9aS2k1NEs0bGE3UW1RZVJ5?=
 =?utf-8?B?WE1nTW1zU2JMRWY1QUhDZERYTml0RkhFcU9oa3hzZlNydlkweVFjZXdaNFA1?=
 =?utf-8?B?WEV0N3E1WkVlNEF4UmpzVUlORkcvbjZTL3ZNbVFscVBlTzZjc05ZSkxwbG4w?=
 =?utf-8?B?K3N1dW8rNUs1blVNeVBjSld3TDhkYWlVcUEyZ0ZoQTZzRlIyTnN4NS9pUXM4?=
 =?utf-8?B?anUvU1dhUTI1cnN0S1RNRVk0M0IrdmVJV2JTOXBCNUlpQTBnMEx0NGlobTVx?=
 =?utf-8?B?b2taOEs5c0RaWTFHRTJ3NWhLTzZnRnRKV2hVUm1EN2VoT3p5NHFLL0hhWkZK?=
 =?utf-8?Q?EsVwOXOej7kCWRUCi2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c50cbe-7339-4e4c-8ca5-08deafa0ff9f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 21:05:15.3253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gnw1MxZOws1LPYPnJ8jGjXPyfmWGrAdVffsWddzVHC8/3xCPG8XvwdR+JBCTSAP8qvZRj916OitTUZTQPRzeFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9155

According to IEEE 802.3 Clause 22.2.4.5.5 PHYAD (PHY Address), A PHY that
is connected to the station management entity via the mechanical interface
defined in 22.6 shall always respond to transactions addressed to PHY
Address zero <00000>.

Use address 0 is safe because only one MDIO phy under mdio bus.

Fix below CHECK_DTBS warnings:
arm/boot/dts/nxp/imx/imx6dl-sabrelite.dtb: ethernet@2188000 (fsl,imx6q-fec): mdio: Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
        from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml
/home/lizhi/source/linux-upstream-pci/arch/arm/boot/dts/nxp/imx/imx6dl-sabrelite.dtb: ethernet-phy (ethernet-phy-ieee802.3-c22): 'reg' is a required property
        from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi
index 3b7d01065e87b2587a87f97438eea205be3222f8..d936732db46f07806ca07de4353ff47fe26e23b6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi
@@ -291,8 +291,9 @@ mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		ethphy: ethernet-phy {
+		ethphy: ethernet-phy@0 {
 			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
 			txen-skew-ps = <0>;
 			txc-skew-ps = <3000>;
 			rxdv-skew-ps = <0>;

-- 
2.43.0

