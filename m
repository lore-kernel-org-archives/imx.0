Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D2B3BB9EB
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 19:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783538789; cv=fail; b=rNO2TljXhBcoUbwWjfos07FqmXRTY8sqcIc42WmuuPBJSpWNbg+5epMuR45bQ6s3idYEln9EwmtVmB4101Uk2OtQijyhsuD38apIb6ZV3nYBc59vpt7xjrfjdD06xIPyFamGUXcByRgL3+SvIDG9pErWpcrufG6vSjHi1/4ZkBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783538789; c=relaxed/simple;
	bh=vA8qdyzs3SZq2+FumYjsZGW7o+S5IUZ3sxPQjz4YOzo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MJRpXPT5N0oCTc3J0H548BBz6tOpKr11lblLip+0nCgghXP7Lby56VmEDwQRSjhTMoFXIHFnBJeYiQR6xdDLxETwOBnSbqv4e1pSx+7PkgnNzWsn6IpdtDcDL4ZVV5kkeWMQgYCkasgK4XArhhCmY9XsmMyGBqTyWCsdMnhGwEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IeDdcQdq; arc=fail smtp.client-ip=52.101.66.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IeDdcQdq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebMjnDZ1gi6u3Q9LqRtHCUcm+Mq2iq5hzBMdIgGsVifzY+y/DGWsN9wq0diOJE+BElBTPPjsDK2885dn4RW/hLr2s6X8qFCey0Nx6iyss+SvMpDsfa5OKodB17C6KwASk3ZL9LYJHV7TJqouHjT0YaNg8p6MKa8/tFRpW9JdxwhcvgJsVKQfOPc1jdzwS+hsk14bZRVXKIWDE1cbeBPhKCzxrYJQNrsoiX5RbzjKDi7FLME2QYdHvkRyPhGAU6hC6ESAYmNiudlgfTVU2C7viNC95clxOb2p8aTle/GvjGEm4njT0CrAkqDVt9/vpHy+7qy9BI7FfLgTdpVL9wMdkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPspEbBwrGzHwNvSPGJBp4Wi/J9ewban1pk9ZwsX78A=;
 b=IA70fo1dfnp9/j09CiNcOLO0dVdKLE5RmWc9aIopfMXyBAwrfFMm3IXHebyyKE09xc2PwepWGTGvpImeVHtEgtsO0CyfEIafQzaZMOhC7mNg0xj20So0IEFoBb2767gH0Uk/U1WkJ8m3QE6h2ZS1HTjMwkpYf8ITPZ9svE269K5vc+UxPkMZnUwunj5gq+DK/Mwe9pVw/dBqXLjqnS3e44JRYX+E2iESPFX9b1aXghltOSlYfS9KZiiIavfvZrkzFSj+rZ16Wg9Jf7hA7I6Mx+GBEG0b1yodw23YGwG1hb1uQL+dKqPedUMrNlndp8JxNAQO+T2qwzfgUZh4l42rIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPspEbBwrGzHwNvSPGJBp4Wi/J9ewban1pk9ZwsX78A=;
 b=IeDdcQdqGRmMuWcM81UIn9GOI0B2CaIv3CCfvmcRg8p2dWJLJAueurdqlZcoaDqCQWag2V2OOVwXs6y3BUrh4rHtaMZ4pGysj25wsUPew3VaGcaH4IZTM0cypwg+D3yw+1WoEhRrsBGSdzwPbbuO/N32B5tqW1pWQAYxltYa8ul1J9uuWnzZGOvPC4udHLzWyeAq1icnUTp067DzceQOslwxLpxOw42EleLFCzLq5OWkZmwPI4+wURIcolv+NVR9lOKYQdOxTfhnD7dokr+x7MCwPogxKpraUcoC7gcJujcljEL/AG3sdC7Nb4C35moImShH4iaMx5LsURDdAEXJ4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB12342.eurprd04.prod.outlook.com (2603:10a6:150:31a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 19:26:25 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 19:26:25 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 08 Jul 2026 15:26:09 -0400
Subject: [PATCH 1/5] ARM: dts: ls1021a-moxa-uc-8410a: add led suffix to fix
 CHECK_DTBS warnings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ls-dts-warning-v1-1-5daa24061c31@nxp.com>
References: <20260708-ls-dts-warning-v1-0-5daa24061c31@nxp.com>
In-Reply-To: <20260708-ls-dts-warning-v1-0-5daa24061c31@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ioana.ciornei@nxp.com, vladimir.oltean@nxp.com, SZ Lin <sz.lin@moxa.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783538774; l=2413;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=5KgW+vwRowg0J8fvBxzWAkwYuK+7PRrYn3/7LBt8n8s=;
 b=PaxwuwIFRW9zn/gb8xesBDKE2/5nFFfwYrz9DRCR0NpbwaL3RcrIGVS+nRLHHXw7psxSU/X86
 CZ3hy2QY85aCwcIkI4vMcv5sKR1SP/GiJfWVBEDBac/V3AftWx5VeY4
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA0PR11CA0060.namprd11.prod.outlook.com
 (2603:10b6:806:d0::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB12342:EE_
X-MS-Office365-Filtering-Correlation-Id: ca168724-3f61-4c31-fb95-08dedd26ccd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|7416014|366016|23010399003|1800799024|18002099003|11063799006|6133799003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	wwTmRLLWsmv39zrVZbOuXKfEGrc5w6sm2BwJlWU/rhEU8nrpEKhJjmD8TWe0GTDeYcUXR8dKXTXAJ1ULo/Y8YewvInFLlhkC94XbLnUJrGoFBVdvQZO9bWeFxsnpUbX0bJkerDUwvEOICrZFQWZQBgAVa3N18ScqMYESObKIHW9b98j31EsrywFrSCWf/3fTmqlVVl9RfbPiTpElS7ru4mJxURyAKbZtLGPetI0aOz2n++C3SAMSYc39yZUHc+3TAls+eXle9lvP4ZVdsI63NH3pWyY5sbTpTRNl9Otm2d3adgzwQW369CFSkJekk1h/Vhcg9u+ZD9wrgdHLlanqmtxZ4yyALdrV6fLcqt2ipfhATmy9yz8f3yy7oFVqk+DszjXp77dF9ixDSOYCvcgRgVVoyyKyVIj00xd0KZ9bb8n07/zI0gmAHQ0KarY44eEkMs+pgxicZxKYbbxsWhMOyxpwSgKS86lfoG+WOQgeK9VsgFSIwa+/CTvmbpl3O96zT/pazKumSHaPyXBII7z0A3E3SGi31eXhBJdE8kOqMbUHK9VcJwedYNxPM9NLAufvL5hO1cXqndZ0+9k5n4BH9ygFSFbR4FjbnxUPbODCk06oMKUNhQylixcw/gV6fvjkQ/tuhfAjTI5aLa+9MFHtzQ5XNyTQT9vHJBmVQeg8EQE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(366016)(23010399003)(1800799024)(18002099003)(11063799006)(6133799003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elByaEdyRkgvTnBTNTVRdnhEaGhjMU14T1dpSyttek5ZTWxwck1SVVJBMlEv?=
 =?utf-8?B?UklqdVkrQ2tZOUt6TWtERStxd2ZDN2owOTVvTmR5RURrVEFGVkhkazFtOHUv?=
 =?utf-8?B?QkprKzJtT3RERjZrNGk4ZUZDN0x0aVFFaCszcHJEaUsvV3o2UnU1TnBNRldC?=
 =?utf-8?B?TGNuNlQxQjRrQzJoOWtmZjk4V2tpQ2VkNWhOd1BWYy9JUUVvUEUvZEdCVkpQ?=
 =?utf-8?B?Yy94ZmM3QzJLbEZMamFDWGplQXRXR2ErQStpRnlnbk1RRURxOEkydEFiNFM4?=
 =?utf-8?B?dGFuMXNuUGJ3dTk4dkMxRTdycE1EbHh2dkdhcWhBSmF4eDVBOFRsQVNYK1Aw?=
 =?utf-8?B?TFRTZEc5aHlqM2Z4Z05Ca09EMDhFM0FuYlFPQWxrVlk0aUJyZXliNWJrM043?=
 =?utf-8?B?bHArMU9tbUdvQ3N6d2s1UWdPOVp5eFVxZE5ka2VVRUFKWFZsdENhWWw2dVA1?=
 =?utf-8?B?NmM1cDZGMUh0NlpTaCs3WmhlQTR4dDM3cC82WUh3OHJQb21YV2JhV3hvS1FM?=
 =?utf-8?B?QUVMNmp4K29IaUNnWHhMcnNFV3dBUXJ5R0FwMko4OU16TnVQdTFRUGlvNk5U?=
 =?utf-8?B?RXB2STZWdFgwSVYxSlgyL216SHVzcFdRN1Z4TFROU1FRMTIydGVvWFhLalgv?=
 =?utf-8?B?dGJWVVVoeXBvTHlvbWlFWVVKVjZ0RjZjaWFRZll0Yjc3bVhTd1BrbkFla1BC?=
 =?utf-8?B?K2dGWG5CNVVLYk1RcDN6UkVGMkhXdFZTQUVjUVpMWmlTMmJ4SWtXODVHV0Er?=
 =?utf-8?B?K1oyN1NqTXdBSGpEYUd2N051NlJNN3hhQW5zRGtqSDRBUFN4MXJTLzBzSjRz?=
 =?utf-8?B?RmNMRWlyN0pRUlJsOEEyeHU2aHhoOVF4Nkh6TnZhVGxtcjIxY0JaSTVDbHZs?=
 =?utf-8?B?bWprOS9qRTQzbm5PeHhxYWh6Q0lHMHhaNnZxVXU3YmQ4WGZWYy9TQXJELzI3?=
 =?utf-8?B?ZzR0aDFtMjFTNWJ1dE1kR2c2bE5OUGpiaXFJOG96QThQdXcrWWJKQmhDekJO?=
 =?utf-8?B?RWd3Vnl0dVQ1aXhnaHQ0c3hvZng5OU1VRmxoQjhhdHgwMURNbnVsZ0JENGdO?=
 =?utf-8?B?RnZIUVFjczlNNWVnU3dFbVkyKzROV3hla2lIWHdMUWJjdWVaYnpRK1FJanVL?=
 =?utf-8?B?Z1p5QnhMYUV1Z1ZVT0hmUDhjbzVleEF5VUV6TWxvOStkaXA5b0dRM08ydFBX?=
 =?utf-8?B?QWNWcE9yQURTbndZR1B3ZUpEeHc1VXdzVTZXYjR5OUE1R21jci8vZ1ZWVlpB?=
 =?utf-8?B?VVd6STgyTUptUkQyYjVPS1dncHl4cUd6TWpTWkhUZW81TEQ5Nnk5NWJBRWxz?=
 =?utf-8?B?N0pPNFA2OG5WOTlBeHRWT2MwbDg5R1JhbVQ1Qjh6cGlraDkwOEpsd0pQVjhj?=
 =?utf-8?B?SzVXbTFTVTIzRUZBbk1DRGIwMElJNldUaCtwYS90aWExNUkzWXgyUEhzUEpv?=
 =?utf-8?B?U0xQVFJYbTNRWWxtK3NMdU5kRVF4c2g4V094SWZtSmFBSllKMTUwNm9yQmht?=
 =?utf-8?B?WThxamRRd1AvZzVzS3lGQ1hEWmFRZlNCZ3BVYkMvQzZ1aURRWm1VaWNpc2xu?=
 =?utf-8?B?N1JrYmlmVHh4amhiMCttUUI2cmNOK3NtSnR3QWVFVWtKVlpSYjJoY2dEZ3Iy?=
 =?utf-8?B?TTVrN1R2aWhTcnczdmY3QlJLRnV2Rm83T3ZFeUNrcHI4cWQ2MEovVnpoYi9P?=
 =?utf-8?B?Q0dQa3RMT0xzLzRaeldPRjRkeGlZZ3RRQTJzVFhlamZyd3gvK3R5eEp3Y2Jo?=
 =?utf-8?B?LzhtNk1nMGZ4YVN0dVhoRXdJVG13U21ZWnhVSlp0UkxDS2VwNmRTOE9CUHZE?=
 =?utf-8?B?SlU4aFZBbm5QZ1VOSy9IYXBvTnVGUGY0UFhDWEc3WGhvN3JmdzZXeURMTU5k?=
 =?utf-8?B?Q3pmSWNUTVRLRFVBMmh5c3ZCaFluYk9lZnhiVm1tTG9mOHhVSTNRSzMwcncr?=
 =?utf-8?B?OGpEVTB2cjBtZTUyR3pwWER2SC83ZzZ4YVNEVXZEdkJZRzR3Y1hLcFNFV2wy?=
 =?utf-8?B?SmZKMVdURGJ0VkV6OUl0UzIrcEgrUXFrNWZkTkhOTXA1OWlrMkJ1TDd4NVND?=
 =?utf-8?B?Y3FZOEp6blZ2VTFUTDk3SEhPZGNBejVKNnRCSVpkcURZQVpNcEpqS3pWOUhR?=
 =?utf-8?B?MDd2ek0zeDJoMjRjbkg2U3JMR1kvclgyODl2eEhVTlRWRExpQnFwY09GcFFK?=
 =?utf-8?B?bVZwUElNOTE3NVF6TElWdTEzL0hEL3Z6Sm4vRFV4VkdZeE12U1ZMb2s2M2JD?=
 =?utf-8?B?RFFZWWhXK3hzZjZiRGs0cy9Jd1FBUExGUWd0WXBBbWN0aUxsWE1rWno4QWps?=
 =?utf-8?B?YUd5cmNmUmtXV2xLN3VzL2pBMGg1MFNNRTJZRjZ1TjZrc3ltUFVtS2dkMVli?=
 =?utf-8?Q?8jsBSUJxE/fAsPzpYAEdUYlOTHUK8Kjzb+znD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca168724-3f61-4c31-fb95-08dedd26ccd8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 19:26:25.1957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+MslCDRfpL5R9g5DS3EngTEBCqx6wyoY384LXVRhjmCAkroH18iDBzpwnid53FdT7WuacSPO7MKWWfoLupb1sDv6mV/DY4Cy5woT2/XXZM/Z0DP9xUg+dpcHJpMXNH9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12342

From: Frank Li <Frank.Li@nxp.com>

Add led suffix to fix below CHECK_DTBS warnings:
  ls1021a-moxa-uc-8410a.dtb: leds (gpio-leds): 'beeper', ... do not match
any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts
index d2cae8c7d7a61..8efe6b615ca85 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts
@@ -40,13 +40,13 @@ reg_3p3v: regulator-3p3v {
 	leds {
 		compatible = "gpio-leds";
 
-		cel-pwr {
+		cel-pwr-led {
 			label = "UC8410A:CEL-PWR";
 			gpios = <&gpio3 27 GPIO_ACTIVE_LOW>;
 			default-state = "off";
 		};
 
-		cel-reset {
+		cel-reset-led {
 			label = "UC8410A:CEL-RESET";
 			gpios = <&gpio3 28 GPIO_ACTIVE_LOW>;
 			default-state = "off";
@@ -58,13 +58,13 @@ str-led {
 			linux,default-trigger = "mmc0";
 		};
 
-		sw-ready {
+		sw-ready-led {
 			label = "UC8410A:GREEN:SWRDY";
 			gpios = <&gpio0 18 GPIO_ACTIVE_HIGH>;
 			default-state = "on";
 		};
 
-		beeper {
+		beeper-led {
 			label = "UC8410A:BEEP";
 			gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
@@ -88,37 +88,37 @@ prog-led2 {
 			default-state = "off";
 		};
 
-		wifi-signal0 {
+		wifi-signal0-led {
 			label = "UC8410A:GREEN:CEL2";
 			gpios = <&gpio3 17 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		wifi-signal1 {
+		wifi-signal1-led {
 			label = "UC8410A:GREEN:CEL1";
 			gpios = <&gpio3 18 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		wifi-signal2 {
+		wifi-signal2-led {
 			label = "UC8410A:GREEN:CEL0";
 			gpios = <&gpio3 19 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		cpu-diag-red {
+		cpu-diag-red-led {
 			label = "UC8410A:RED:DIA";
 			gpios = <&gpio3 20 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		cpu-diag-green {
+		cpu-diag-green-led {
 			label = "UC8410A:GREEN:DIA";
 			gpios = <&gpio3 21 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
 
-		cpu-diag-yellow {
+		cpu-diag-yellow-led {
 			label = "UC8410A:YELLOW:DIA";
 			gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
 			default-state = "off";

-- 
2.43.0

