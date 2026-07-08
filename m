Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011053.outbound.protection.outlook.com [52.101.65.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8953B9931
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 19:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783538811; cv=fail; b=UspdT/17TzFcd1A7dVKZui9/QEJ5ukZovVea6mCw9YA35Xg8jqcL1tihh2YearfdxeBh5uKAnjCx8UCtyQXdZpucUpsOXh9wsBHN5TT/fHYFAEYoor04LVQRipwEdOGkV6nhbY6eq2CnOdNXK+l+5a5/kC8O6cTpGcYbAP616kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783538811; c=relaxed/simple;
	bh=Dhjgm7i7QUUE2mwVGrFziCriBTpCgEPXsI8w5EcToo0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=U3M0Vmx+NSU/ciq9zQen3zPu83hBRxXdxCBavIdQxuewnAsDu6RelJ3g8z9JBfuZve0MnP+74cqpkUpBgCsPWDeMBhEWeViMliXSCwkNsXCsDkNJ1FdYjd7eylcbmwmUQ3wywJFguW1Ym+msu6wd1asebJgsm2R0yg3PmhaHEvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mDhowjJU; arc=fail smtp.client-ip=52.101.65.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mDhowjJU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrODoQWRjvVNMfmNz/lYbXObxnhSUJ3jbVPpVz2pm89s2qhAgi2uxa3DOl8U0gvpKICvB0TNlTBfvuslomBMKH9OnSIwTsZjBk+Uzpqf1mPelrB0GmmruYnVPOTBPj9dfQXyqTrz3P3fRGTndepgDtVfRlu6cDR3vYdOuDmOW9oJ0EhnUsyRistypa8C4QVgFsnlvBC3u0bdGEDVHc6QW5aqkQZSfZcygZaKVqU4zeDHerIOw3l1+IdP+c7n/EYt4/KDRiXGQ3xevIBAznj83apxLnmQisCvAihM1SlimP/ld4sOXEvWPXG3jng90WiI0vIJG7fdL/9yhtv3AQ1zkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fc1/K0+NmG9viDws8wGoYe1VDGNZEaqIuB4Po6+bc8c=;
 b=mHhBSjHmeZJk2feyvsecmOY9+mN/ib4NYdNu+5/w8Vtqju44etSa56Q7sKdDmCdGL8CwY4LshZ+uYZFO13tuu9vMr1uxbiSMBQTsDq3v3iRdEi1hREGe9js9bzK17O0j2plgHEc/amG/YxiN+qCOxp8NZIMlt5M1DJAUy7E8J6vSzX9srcH6jx2ipqDfOrMQ2t2/6SHA1ZACXZggxN8RiC9jbCqOff7ucy1+3xAZ0PuH7wqmeEa5nCWlLh9LTerSGPZq4OcpQvPo8wLPzVcCX3wacAzn1NhFGA1WI5x1AEYQDOVu2pqZ0TI9XVuLFpTExI9MTtiP8QjgKNY3h7ug/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fc1/K0+NmG9viDws8wGoYe1VDGNZEaqIuB4Po6+bc8c=;
 b=mDhowjJUrpTM9Ypu7zfzlklM00DB/h7ioHEsDWAkX2DKa9vWjpjMoJY0OiaMRYyVc8+tjqvLndOUQG+P1woGzhyVZGaXoZkqjHp73C7JOEjQa/a7hF7wRKoDYZGl7ciQoNEvCVu3bPmb5riJq1LUBDniDeuCe3/APZrTYLg67AOJ/XbiSnOdWmHccwjNlyw0tFWsCjoi/kPgCWPgWcbhdps4puI/Fd7vwm3R+EQ+hAeTdtNwhqyBdGrTC4jH/NWiVdiQPEAg/PRq3M8xzL+CSGY1YEXkrVuMRyQ0zqo/4dQrhzPqB6GcOcELQ7wzbRRT2Bv1e2qHkOBCZ1S0kwesoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB12342.eurprd04.prod.outlook.com (2603:10a6:150:31a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 19:26:45 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 19:26:45 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 08 Jul 2026 15:26:13 -0400
Subject: [PATCH 5/5] ARM: dts: ls1021a-moxa-uc-8410a: remove undocument
 property default-state of gpio-keys
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ls-dts-warning-v1-5-5daa24061c31@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783538774; l=965;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=5rypDWE8LgIi91AkjNtgZZv1pNhDGR9qk5w9RF4XPig=;
 b=gDsCZ4Q0pkfqTsrSg5Di0gLW48ex/9uELq4ueqAgIHQp44XafuM8kaWnswLVyRxEa1XvsBkfn
 6dzGrgMOBO5DIZT5Kxmqk08MRVVLos3zuJcqgdc516e5EcxiQA31Fun
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB12342:EE_
X-MS-Office365-Filtering-Correlation-Id: c89708e5-eee0-4d58-27d9-08dedd26d8f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|7416014|366016|23010399003|1800799024|18002099003|11063799006|22082099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	BqlnUHYfQHUwtNAKJgnID/erwfdlgknNtpNCqhC43Pbo8x74skFet41smmoK2uqKCmi42EukeFDWgAiPgAedu0Q0B1sqKJIVm/fj9HFpdHjI+umvFHw59sFXwsVzoUm8YupsPkKwOI7idpCXoCxL7QCVN68uP/dErm9/kTU8PdlJWoHehB2gdyPRzesKrjBRJSU/u9dVSKgbULGqcReC3TE3slRrERQ5XGqYWu6Q4SB0oxMwY5OQUez3RFJGgYa+ZLP6fZCD5vbQLv+3bL+NqaiRP294fAPo5lEEAzj0pLeiTZIWhBe2q4J6vTNhvPfDVb9HSO4bF8WX4yfZK3HIYNArE8fQ6xhjh6hdJVHBrRWCr4mNxtD5Krl00aNnVFsA8F8tLcgGfRSpzsam9FNRbAJVI/vGkmPHcvAvm3su0m4s1PlmvFGpwh7oFvGH8NYgVUzNjMWnPjkLIILSwG0G0HgEjiF1hMCOSqd7puN9IyOTAA0WD8pOeZSIGMrtSjFSuhJMrwgg7+hTmL7LDoAlAj7soNWsMZT2mqbV58BRtqi59LVfwMBspMS/qh3nRQM+ryt75fIjk1hx/NDwZCYENWWQeACka9iysUpYTNTyULyLF/haj8/5+2Dc1qpilVrZiI81/x53Sklhc6NlaFrhbCw6Tn8+9rLvqGqr9jfK4Kc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(366016)(23010399003)(1800799024)(18002099003)(11063799006)(22082099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmhJRU9RNmRWLzNqRkd1Ny9nM0FaVXM0aVFGVnY5NTJYLzNnTFBIV2VnbWNl?=
 =?utf-8?B?TTZ4d2lBWjVMRWZOUXdqYW4vcHoyNTRWVkFPQmtlV1hSQ3FzV0thT0ZCRnFm?=
 =?utf-8?B?bkNDdytwall0Q09CbkRXVGdZYzhhNysxUityYUJ1bnBwdytJMzVwVWpZcXE4?=
 =?utf-8?B?ZllaWVRqTE9WbmlPMndLTUNveG9RVnVsMS8vTUNxUk9DWmV3bWRCaHZOeHZq?=
 =?utf-8?B?aWpHdzJBNERzTHpaUzQvZU10b3AzLzcwb21JbExBOTB6RmpncVdocVoza2lp?=
 =?utf-8?B?ZEJOUmNCUStrY3NGdkNqbFhwZzVLK2tST29HdHdSU0ZiWmZTVWwrR2s4bXNR?=
 =?utf-8?B?dU1jVmxGakxKajFRbUdsb2xMTnp2QWJDTkxCOEVqRWF4NFloSnQrL2I4d1Jq?=
 =?utf-8?B?eGRkenAwdDRnbXVrTWVZRkNUbjY3emliMWNKY2VwMGZwMDBjM2YrcmdoN3VP?=
 =?utf-8?B?WU5MNnBMN3JhWkM0WVJGamVrc1VNWDFlWDZGNGh1aEZlOVVxR2FSSE1xTTZW?=
 =?utf-8?B?SlZ5RFBqWGZ6d2JBa29ORHlueXQxZ0U0Y0ZpMFdDWHhLK3ZFZDVaTVlWdkhD?=
 =?utf-8?B?OTJWcXR0Y0FZK0hoRjhBaGtuZXFYRDErb0JXNzVvWHU1emt3TllLVmlsNmFI?=
 =?utf-8?B?dDdNSHpiTE1WVzJWNC9NWnhIaUxnRzAyTXoxbjk3YzZ3VWVlUDlJb2xhUFov?=
 =?utf-8?B?VitvblFRN2JjUUR4Tkdab1hBZEFGS2J5MTNtSDFVa0kwZkFUMStMS2dvNU8z?=
 =?utf-8?B?UWpta3I0NEV2SzNNMTFpbytKQTVYaGFmb0xoNzVkUDhnc2N5NjVFR3V3MnhF?=
 =?utf-8?B?RjlsMmFWS3ZMNWxOLzYwS01hWnNQc1JsY1BwSGZCZCtGK1NRTURYcVRJb3JL?=
 =?utf-8?B?bWhBTXhVWHRsL2VFQ0I4TmxnOWE3Y3BKd2U1a2VYUkhSMEsvWTBJdGtkYjQr?=
 =?utf-8?B?R3E4UjFwWjJxNHJJckJBYjRTblMrM0c2cm96NXBzRmtaTHo5NmJkVzJmVmpG?=
 =?utf-8?B?cjVsellqNUpHU3haNTRnWEFaQlYrN2JCcGg3T0laeHVpSEluS0N0Wkd1RUZy?=
 =?utf-8?B?d09NNy9pRWd3ZWlOM3p1a2hDS1RLZ0g5b1RLaUMvWFhZbFVyMU9VSnpPYnNR?=
 =?utf-8?B?ZGZqcTBJeFlwQzhlelcreFYwV2pubGhTWTBtc05FdWFpcE9jS2gzM1paRURQ?=
 =?utf-8?B?eEZDRC96NUxsQTkrbG51WDBzaFpzY2xUaXlQR3FOTG1UOEdKb2E0cXhPY0tL?=
 =?utf-8?B?cVRlWVIyV3hJQW45a1hyR2ZtNjJFc1BKYmRsR1llbkxTRGlQTk5HN2RENnJH?=
 =?utf-8?B?U2VrZFVwUkxheHZCTmVxamw1SXRSMm9qamlPUUJWaUJGODVoRlZ5VE9GN2FW?=
 =?utf-8?B?aDBBQVB5aEVyTFZ5WTVhblVuOHZIYVRabTNVTWphdk1QeFc3OEZPQTNCTjM5?=
 =?utf-8?B?eUhaaE1uSFR0d1NrMFY1WHBML0dyK2puYnlFM3BYTGxBZ1hpaHljNWxydEpD?=
 =?utf-8?B?WFQ5MDBRSStISDhZaXgxQXBqK2w3VSs2Q1BWdFpZRmc0NkZKOFNMekpKQWNJ?=
 =?utf-8?B?T1BPa3BZYUo0bEFSWksyVyt2V1F5MWp4L2xld3dqLzR4WXVTTXN5Ylk4dUF5?=
 =?utf-8?B?NWtaQ2t6SnRuRVFSVFFreGhsM2w2SWgxdWN6MzdRK20wRXkvNGgwL0J2U09W?=
 =?utf-8?B?aGVmVTFOaEFWOHBvenZqRHAxYzRKYlFIT0tkSEF0bEt1QTV0OEppU0QvMVps?=
 =?utf-8?B?REdUeWpNeFliMzZMeDZDalJPOWRYajdMc2ZjeEg1eW1pc0ZKREUxNk9BU3pC?=
 =?utf-8?B?Mit5QWoyQlk5cnNUUGcrRmlJejF0TkhRS1pSQkFpM2NXLzQ3UlVMbTg3Ujda?=
 =?utf-8?B?WTJmSVRZY1NGZWZDWlBONWxTaG5LUlN4cU84eUV5dVh6VGp2OFFHcEtkK3NJ?=
 =?utf-8?B?WjNNUk5kSGdjd3FDM1dNL3NDL0RvZ1FrM1BKaExBNTdWZ1grVEhidU5HbXBy?=
 =?utf-8?B?aHk1Z0haWC93bWx2OFBndDRBYjFUU1pBblQ5WnBwdGlIWFBwUDEvaXYwcUtz?=
 =?utf-8?B?WnN2cWJKQ1lxdXBIR3ZPbVdUWDZjS3YrQ2d1Uk9YWEtKbENrS3hJdXg2UmRk?=
 =?utf-8?B?NVpyaXluL3FranZhR21JeE9FRFRLTGtFTUFoSTE0TVpIQm5hMHhXbDZNSmNp?=
 =?utf-8?B?c2c0OWtvWkRTY0gvSTFOK0o0N29hNUptWE1mVHpEQ0NseVdQd01TRnlWVUtx?=
 =?utf-8?B?TUtRV3ZFUWFCMGhoMmFYRUR5dlV3MCtBc2ZYQk5hNGd2SUlRLzlQV0JZaGlu?=
 =?utf-8?B?MUE0czcrRGcwRkRPL1NIOWlhVkNmNWxwZkc2ZVFwamUybVVuVHoxRWtRZ1Mw?=
 =?utf-8?Q?Dz5qVpy/X/sZxE8RissYmJDnyiyfNbQeEnFEw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c89708e5-eee0-4d58-27d9-08dedd26d8f4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 19:26:45.4254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22Meu0PBKyMzy7EYvzCAYLc9IkYf9rPJ00XC+wbprDHNMUcrpM0kXDeI+T8FBjUorYPLWiFEkcDqd76IqU2xHketO2sCi3kLOiBm0bNqW67ecUnHdMjervDc+0COzMUE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12342

From: Frank Li <Frank.Li@nxp.com>

default-state = "on" is wrong copied from gpio-leds nodes. Remove it to fix
below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: gpio-keys (gpio-keys): pushbtn-key: Unevaluated properties are not allowed ('default-state' was unexpected)
        from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts
index b2a87ef23c8e8..ad83d8814fbb7 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts
@@ -132,7 +132,6 @@ pushbtn-key {
 			label = "push button key";
 			gpios = <&gpio1 21 GPIO_ACTIVE_LOW>;
 			linux,code = <BTN_MISC>;
-			default-state = "on";
 		};
 	};
 };

-- 
2.43.0

