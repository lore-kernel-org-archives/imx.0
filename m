Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022103.outbound.protection.outlook.com [52.101.66.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B0B322B96
	for <imx@lists.linux.dev>; Sun, 18 Jan 2026 12:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.103
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768740721; cv=fail; b=WlskgTZxEnNpvcJXicCRQbLQ6EHAwi7rnXNUxovWdWt9AXCQD76jB8d3FFs0zauyOGcENN4zZALH1HxnD8Mm88ssaCojNvYGBuLXpBP7DCFx2/BZ293t9/YpuwQGa7HSpY30HR4gtXmkTaTV1uLv4myjBIpHmsNNNoGBaxaBRVc=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768740721; c=relaxed/simple;
	bh=2TIepFdqE357k/NybRiHPW0dht1AJWUNrxaoZsP2kOc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uJwICzykZHCF42N1PHDtb2w+/f9mKOdXFMWVp/JZn4MXZIp9khrd35ZSbXCurAf+ghVj7Vjt8GUXvrG6XAgkqK6PiG68P9f39yjiwxZMxA7ms2SdwRkQ82uEIKvdz4bxho+zgW6H9AJRIZG+O0OWJTJmg0I/6hE3PLfiD1sngzg=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=n7nSAY5X; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=n7nSAY5X; arc=fail smtp.client-ip=52.101.66.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="n7nSAY5X";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="n7nSAY5X"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kGdPKfV+OCEPVZq2TDnf8NsXAIZhmA975Y5/492pbEx9PzR+bnZlH7MrsCpdUBWfwclGrSZ1e4Y5YeYKEdAZEi19dwjPF1nol2axhBefI4wlP3kSRz823OAqSis3SBuYLXC38Jno8q1ppZMbcE1VjX1bTjCkCaTWuUaBKx566FD6kSmuYAXduBlaIWMoCPCWRJFYl6nCMO/AsPW9qfRLvRZ3kcuyUiuNQyBzrL5Up+CspFDKt3Zp7R/leu8C9jtCsYDUSoZZJZtBgYoFW+4MeHpVyjqf1QqOduxPPrNouhC5JlVJFXtx7DjR3GgOI6IH1Ill2EZDnWPu+hQGyE5k/g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfT0/FrmLFMcSRx+xxpSPO5PUtT5btJRlhXx5gVGxvM=;
 b=ZavoPp+15EbWQ2M6D2oWquZmqyG710AWybKgH1s8A0OEXAnYh7G4QEnRzmDJR957Eq9EwkXk2x+Eak8T3PMPiYMUNVdaj2VwGGnhaJQBPzWiqGll3uRFCdmACdPN/PyFlJ+QeC7cWxyTwenVd5ztFFrQLJ1EWixNwepag95zPCYAlCDJqya7SqeoZZgKU8UfgwML6yAMEC0bDrz6gjRjCILmqi2d0Ol0QoOVKDe5R9u/htxFkzgcj1uoq8gYG/5qNfpF64jWSJYEEPpkhGykM31sapF8UYZKay9XFgxl1ojnETMBjRXuu34E/uIpgFdoIUMoxkHDLxwcQh8qTi0Saw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfT0/FrmLFMcSRx+xxpSPO5PUtT5btJRlhXx5gVGxvM=;
 b=n7nSAY5XaKK3bLoWBuuEPyhFQgyUYYiSmH6Hqb/dI48r3He6Gc2tKARezdUUhdapJxLXGVCqhw0DsaKuXqDBpXPcQmJ03FbJFxeVTNUEwnFlLu+YRx4HaGgHS9dyEqNG2SOXW6FINlnEuW7Y8UiaIUQgmGU+BLwd/SY/fFVwAOI=
Received: from DUZPR01CA0333.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::27) by AS8PR04MB7925.eurprd04.prod.outlook.com
 (2603:10a6:20b:2a2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 12:51:56 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::4a) by DUZPR01CA0333.outlook.office365.com
 (2603:10a6:10:4b8::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.10 via Frontend Transport; Sun,
 18 Jan 2026 12:52:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4 via
 Frontend Transport; Sun, 18 Jan 2026 12:51:56 +0000
Received: from emails-5544868-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-103.eu-west-1.compute.internal [10.20.5.103])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 6F6427FF4D;
	Sun, 18 Jan 2026 12:51:56 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1768740716; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=ZfT0/FrmLFMcSRx+xxpSPO5PUtT5btJRlhXx5gVGxvM=;
 b=acuVObirg7f94snMoybuo25R1iYLy/IkvrUBBkBWaCOzJvnc6dnMIBlzkvaZ5yFI/5zve
 Iz1STZ7XXoQcol9qZUsZoWtaD0IXnwlcachcjVgj80OMyX4ec++xLeLRa5kM2M3AaaUhGR4
 n/tbiB9RU2TiY+Vuee9L0prA468sNkc=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1768740716;
 b=XWHMo5NnPzhuTMyL4CSpzbmCzeY3PJnll46HKQxSZvaICBj6p9Uc5ZKZ1tHzzOQ0d/+ev
 y43kuzagUQXX5dohb+DSBCR3Tv2swJNb4obLjV4RnetpT2x8jTufvlLUCliusCff3pUF65H
 M6Oo90rq0DP/dcdq+4AeWvUb7iu76kU=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vCUwXV8ntfc8H9hAWBoQg5L8U8kLm0mg4IVUeCJolQRQTSn1TKR3afuaw8b9PSqDWQsMlbdcQjlxSg2ZCeLShsjlGIwbLdyFMOBoth7OMR4Q9bs6of5PZieyTC4FKXGcWiaNH+p8Itr1E0lIfqJVIIrrb4CyRVcH0GCkc9UkTSCDLRTW59/rE1LOgIxHYqPtqdaA8mutlP83x9BJGQuN6KPuW+Dv4HCpSohrpl98xBYQveBymiCG1cWGlub6vw8W7fzJbKUNp4lg9d5mBbek6Rrt8kt+gHjiUBBupDZFmZZQtwtOdGfK4CYPiV7wx40CdsLR9VN2cYfOUtqAbrKvBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfT0/FrmLFMcSRx+xxpSPO5PUtT5btJRlhXx5gVGxvM=;
 b=AWfzzPxColBYJtMpkhpUcGLjcTNBlvX+CvBLP/63AFd5ipOBkOXYV1d3YtCINikZSmhcGLRrKCwihc+/6JVc31t7V4BW7CxvcQueYY1S4LpImj2MiqFGGOZ0Eu/whrxlaX8Uv1toakfWszJgXKSb6faXrx4T/SOrnmIhBhfbQqNFhDg3M3IR9YHSSKJoYPpuwz89cmQeCrM+9ZXDFIw+J5+xqzmfYCXHC572Hj1WLBw5Tt/xHMajBIzB+icw5SzNTsSC5pVXj7MejTQFEevW9PjAGuvRzgGGVcsjUbuSRfe7qObPn67iiB71xGThZg/w9Ef6ytJQtvLSj7EZ9g0F+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfT0/FrmLFMcSRx+xxpSPO5PUtT5btJRlhXx5gVGxvM=;
 b=n7nSAY5XaKK3bLoWBuuEPyhFQgyUYYiSmH6Hqb/dI48r3He6Gc2tKARezdUUhdapJxLXGVCqhw0DsaKuXqDBpXPcQmJ03FbJFxeVTNUEwnFlLu+YRx4HaGgHS9dyEqNG2SOXW6FINlnEuW7Y8UiaIUQgmGU+BLwd/SY/fFVwAOI=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DB9PR04MB11694.eurprd04.prod.outlook.com (2603:10a6:10:60f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 12:51:44 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9520.005; Sun, 18 Jan 2026
 12:51:44 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 18 Jan 2026 14:51:38 +0200
Subject: [PATCH v7 1/8] dt-bindings: arm: fsl: Add various solidrun i.mx8m
 boards
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-imx8mp-hb-iiot-v7-1-ef1176119a8e@solid-run.com>
References: <20260118-imx8mp-hb-iiot-v7-0-ef1176119a8e@solid-run.com>
In-Reply-To: <20260118-imx8mp-hb-iiot-v7-0-ef1176119a8e@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TLZP290CA0009.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::18) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|DB9PR04MB11694:EE_|DU2PEPF0001E9C6:EE_|AS8PR04MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 0287c4c2-5cba-42ae-bfb7-08de56905cd9
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?QThxSFRROHB5aGt0bTBvSml2bEE5TTkzOXdoR0YzWEttT25FRytRTzJWMkRW?=
 =?utf-8?B?bGN1YlBkT3pubFdIcnZaYTFrNjdRN0Zxa2poRWhPOElYWjRxSmJxQWRiUklQ?=
 =?utf-8?B?NjFETlI1N05TeEdYajR1UzRPdzlVMXFqb2I0TEdwN0p3V0xtRzc3U3FnYXNN?=
 =?utf-8?B?ZmpLNGx5UG50a21TNWFVUUZvRTNOemdzbklsSG9qZVpTMmNiQUtxaGREWXpa?=
 =?utf-8?B?RkU1TTZDSENRbk83dUl3ZHdEQXJkUXorQlV5bmZLdHhSbURIbkI1ZlljSEZS?=
 =?utf-8?B?Vy92cDZsellmM09odkg0MEVPdWNHVnlHSjRnaWRIUmZmdmFjYktFbGhuUGRv?=
 =?utf-8?B?VmYrKy90SXlQNU9FOFV1SmU4M000MkxOU3QraFVKSWNwcDJrMjBwaGVkUXU3?=
 =?utf-8?B?Mnp6Q2VZM1Ztd3JOcFpNa0pXZGVmSmdVSm8wclpWSkNJSng5V2Z0WEF3R1BZ?=
 =?utf-8?B?dmFRTUNGdWhQNnd0eUdwazBXTkRMQjhCcUVBbmQ2amtMdUdFODZpQ1JwQzQy?=
 =?utf-8?B?cjIzbWl6blBCbm9TTHUvN1dRUHc2RDJ4L01jL244aDZnRHNGdGs0UGJ2UUtl?=
 =?utf-8?B?SlMxRTg0WFRUL3kySmxIVW5nNG9JdnhJbWcrMzFGUFdlV2QrcDYrVW85TElW?=
 =?utf-8?B?bDNmQnFRaGdaa1B0VjNJc1VaT09lSXNpMmdDZldjVTNXUC9EZnplNTUzaVdw?=
 =?utf-8?B?T0FDVUxZL3QzNnVnR3pGTHV6N3NkcFZKMGt6VGNRbFR1VlhiaTgxUDJDMm10?=
 =?utf-8?B?Wm1FR0tabkNRNmVIMElvSVlqL3R5cWFBSjNQOTM4ZWZzVXhKWXhMRXlWM0ZK?=
 =?utf-8?B?aFlTNTRCbitjNDJVS3U1N2ZpNXppZzZIT0dIUmFrTGJ0WVpjeFNubkJ1TWN6?=
 =?utf-8?B?c09XKzJJbVRGb1RXU3ZjZXBxaWN2djNWaVNFMDlzQ0p0bFFlVytHSm8vbVZa?=
 =?utf-8?B?V3lhUDhFK2hmS2U4N09ReFhNV1R2TzNIQlJBU0lPanNJaE9kNDBkeTZQeU1U?=
 =?utf-8?B?UkcxR2pCZXNOTGVqS3NCNm12ZFQ3U1V0SkFOWGhkb1Fram9WWlloWi9tT2R4?=
 =?utf-8?B?VU1oUWFsOGtJdURGMkVjT25ZR3BDenRUa0d6MkhmbU92M3N5MW1OckM2QUNh?=
 =?utf-8?B?NVh3UXBBVE5jYW5BRWp1ZWFJV3FDdSttNTJkcU9FcHRXSE41ejVUYlMyNllR?=
 =?utf-8?B?UVlmdEhiZTVTcG8rSzk4TnQ0a3dRY2dtSytnaXptV3hieGJNVHM0WDhHMWFp?=
 =?utf-8?B?RXhIek54dWFadzRVK2hndXNLMHoxc0t1UWlGSWVYSFBGYzBCL1lZNU50aW5w?=
 =?utf-8?B?QzkrZUhtMmhDZXdxNHhRWDh2emNxR2xvcFExSHZiNitkUDZTa1htbnlkSnMy?=
 =?utf-8?B?OXlJeWg4S1lsSzdiUVpxcTU2dFlSckJ1eGdLNzBpOWFWbUJwS09Kbnk3ZExI?=
 =?utf-8?B?aGY2bXR0MlNJUDExdzhmYzBxSGY1NTFiUitjVlI0TXhZSjBhQzdZQkV2RmFH?=
 =?utf-8?B?ME8wbHFnOGdkVEhaZTNwcUNCN3NXWmhKekk3ODc3cit2emRJQ2hrcEFvSUVR?=
 =?utf-8?B?Ry8xWVhhRG15cHRMekk0RVpRelBOZ3gxTy9vblczT2Jla242b0hHcDU3cWo0?=
 =?utf-8?B?Uy9udHhJZ2Jwams1bnZFcXBpRVR5TzhxRTNYb2FjTjdISEpMUHNXRkc1MVox?=
 =?utf-8?B?V3RkeFVwbVhRV1JrWXZNWkd0WDQ0ZVRrYUdiL3lPRFhDaXpQVG9TQkZwUEZ5?=
 =?utf-8?B?ZUdrM3hGVDJ4allIZlBTUWRRd0pveFVXQjdBcURXS0lvajVQa2lBWm1UMjE3?=
 =?utf-8?B?NFFkMGVTTFZOTUdpWklIZDNpcmsrWUEyMWgrRmlRd1l2NkYvYVh5SXRRN1lo?=
 =?utf-8?B?NGNVTEZKVHcxSDhQSU9yY3B0YXZEL052QnpuQm9aVFB2Tm5TZ2tCOEVwREVV?=
 =?utf-8?B?UTU4VTIwZVNaTWtmNmhIRDJMQXQzMHBSeW8vdk9tdzJqMENLMkNPSkdmU200?=
 =?utf-8?B?RTVxS0JlN24wWjV1VnRGWWVGK2k5dnY0VXEyMVB6V2RCSGhYcDJzQTJnWGJo?=
 =?utf-8?B?ZDhRY0FpUHNPbklDa1pLaVdXRkRqVjQydVV4MkoySkU5RGNWTHdxRXpUcGxt?=
 =?utf-8?B?ZjYweUZiSnIzbE5GQ2c2SitVcDBPTTFDVTE4QlZiQ2Z6cTl3cE1NT01ua0Jr?=
 =?utf-8?Q?B1iVqScrDk7GU1twtv5pdfU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11694
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 44a6275c63884447bab6158d663d55f2:solidrun,office365_emails,sent,inline:c4bf7be8fb70a9865d1ad9d7a64d2454
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	464ab859-acc3-4c10-5ba9-08de56905558
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|35042699022|1800799024|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXI2RE5FYjAraUhnWUI4dEc3QmxUbnhTQ0FWNGcwQlptbFJ4eXY2SnNrUXll?=
 =?utf-8?B?RnJDSHJjMVQ0WEw1QWtqRGlrZkl1QkNlRGxuMCtZRUlVYnhJZzNxN2ZtODRh?=
 =?utf-8?B?YzVlcDYvWDl6ckt5T2ppS1plTWJWUHBHMzZHSTRmTXNvd09yZHZ1N0grQlRs?=
 =?utf-8?B?V1ZXeEY3cExSUkt3VDVwMkZoZEozNGpNQnpsNkN0amZUTWw2cWp3SkNXUVdl?=
 =?utf-8?B?Q2tLMDhoUUJ5bVlHWGlFTXE1S3lQZWlpUHhvd1VsR2ZST2FnZTBLTG83cGRI?=
 =?utf-8?B?ckk2eEFkSXFvVXErWHhEMTllb1VhRHU1TW1UM1U0ZWJqYXV6Z01nNFI4Um1m?=
 =?utf-8?B?bjBHd3EvOEpFZUFINWNNSWY0TVlRZlQ0NTFWaDd6RjV5NzRWZ2RYUDNEVi9a?=
 =?utf-8?B?emkvays2NjlFMXFVL0NBaDU4bS9ZRCtpRzdxVUl5Uy9WZFkyNUdOaWlTSSt1?=
 =?utf-8?B?OVYxdFhlNVUza2llTm1SYWpFcUtUK28vK1ZtNnA3OHZ4YXJpbUVnak80a3Vw?=
 =?utf-8?B?RU0zZjZPOVBUK040UzNiY2g5MnA0RUhRV1Z5bWcxcUZTWXd5TUgvbU5Zck85?=
 =?utf-8?B?KzFWK0tVeFJMemovNkpSZzFTN29nR0lkeTZ6dktnZU1iVVRFeHp0c3luWUc3?=
 =?utf-8?B?M0pqUk5ya1RvTGpkanZYZVNxa3FQSUlJOUpac2xPN0EzcVZza01mYWM3WGlj?=
 =?utf-8?B?VjRZUkxKeUNjS0VQdHM1d1dFcTFxVWl4ditDY2tkdGpJbDFYd1piZmVlMGt5?=
 =?utf-8?B?OTVIU2VUU1ZuQk1KNk5wMTNvNitmUnhYb2NJbkhHdTZLTHVJZ0tSRnZrQVAr?=
 =?utf-8?B?aHJtNjBwYlRDUzFJcWF4NloxSUdjRXpVWVZlQ3lXNmNIMnhuUzlMMkxSUmw5?=
 =?utf-8?B?OGVSR1kybVZMY0kxK1B5WnU2cnlLMWRtNDFDMkpUd1BGM0FSOGoyQWJjQXZD?=
 =?utf-8?B?L1dKRmY5bytDOWx5OG9hY3FVQ1p5QmF4T3QxQlZ3cGFwNkM0OUROdUNseEZv?=
 =?utf-8?B?aVprZlAyejR5RCt6MGpabm5meW0welc5OVBac0dUM25mNDVWTWtIV0F3dlNQ?=
 =?utf-8?B?Vm1CS0FTc2tCOVBuOTdtcnhmd1ZSWlJydXFYdGJXWlY5Nlh6dEN1c1VBc21v?=
 =?utf-8?B?SHQzRkQ2Y2tQYUUyejNKdythZDduUnkzN045cCthSEwvTDV5VmpnaXRLa1Vk?=
 =?utf-8?B?VWRQcmtObFgxeFF0M1Q2emJzcTc2S25FazBMenNWWnRmL1F2c0JaU244SG40?=
 =?utf-8?B?Qi9Tdjc1U05YTnkzSVNOOStZZEo5YkF0REQwSjJLbVJTZVFWNTVlWFd3V0JU?=
 =?utf-8?B?dGY0SHJDQm0yQlIzUkRGeXVDTDBZc1Zaa2tLUVNSSGczUkUrNmhPQTcrTDlS?=
 =?utf-8?B?dENzMGdjYTFnUU1JT3FYVXVGYVZ5TGwrc1VrVHh1NE1GUDJ5ZC80TXVOSnZl?=
 =?utf-8?B?aU5lKzdtY3dFMnpHajV6TWpMUnFFaGgwWEhacExLZXNYWisvVzk0ZmJEY25H?=
 =?utf-8?B?MklzVFJPMUxyYlRicStaY2g1WDBPNVFQUEt4TnFjVE5URHhaQVNxT0FpcS9s?=
 =?utf-8?B?Q2tZUmhmNndBcWY0cHBjNUtnYVVJZHN1bmlUV0VwcW5YMTlUcitRUGFha3lp?=
 =?utf-8?B?anZCN0IzckJlSktybkVhRC8wdWtuSFRrendtcHBsN2dHZHJaTFI5UVkyRkZl?=
 =?utf-8?B?RW1KOVZ5dEpYUDBxUVBFeHBtSmcrNkUwMk1ydDkzamJQNkJQTTdoZHJxSDJO?=
 =?utf-8?B?YU41RWE1UC9Ed2JiUGtZSll1RmsyYzVkaXM1YzUzb0ZORDFCdjkzNno0ckpy?=
 =?utf-8?B?UldGVjJCeXFyOVFRVURrT1JjSUJSL1Q5UTBtd2FGc0hIVmN6bzlPb2tHdlBO?=
 =?utf-8?B?YmJPaWtRQUNCU0llekJ3Zm5ncTJIVW1TYjRjdXE2MWEzcFpYeExOdmpQYWVq?=
 =?utf-8?B?NjhIZE83bGt1NVdCc3U5V1FUNVNJS1g3akVXLys1ZStEUTlGclNFZ0lwVndV?=
 =?utf-8?B?UW9xbE9GNjZhQmxpc0tvMG1pd25YMEUwdGQvT2JBajdjVlo3S3JURlRDY3h4?=
 =?utf-8?B?ZldELzVxcytha1V0UFN0amlndlhvanlKTFJEK3VxdXM2L0hvNGx0ZUwvcUFQ?=
 =?utf-8?B?YVpSN3QvbUZ6bEhidkZyajhVYVJwczVocHFnUWNLbENEZEw4WlhFZHJjcUpv?=
 =?utf-8?Q?rzqLIwb9FoFIcpLmq+QRcvfydzb6aDQigRKea+UUIqrI?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(35042699022)(1800799024)(82310400026)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 12:51:56.5823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0287c4c2-5cba-42ae-bfb7-08de56905cd9
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7925

Add bindings for various SolidRun boards:

- i.MX8MP HummingBoard IIoT - based on the SolidRun i.MX8M Plus SoM
- SolidSense N8 - single-board design with i.MX8M Nano
- i.MX8M Mini System on Module
- i.MX8M Mini HummingBoard Ripple

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43..97144a52d5a6 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1041,6 +1041,13 @@ properties:
           - const: phytec,imx8mm-phycore-som        # phyCORE-i.MX8MM SoM
           - const: fsl,imx8mm
 
+      - description: SolidRun i.MX8MM SoM based boards
+        items:
+          - enum:
+              - solidrun,imx8mm-hummingboard-ripple # SolidRun i.MX8MM SoM on HummingBoard Ripple
+          - const: solidrun,imx8mm-sr-som
+          - const: fsl,imx8mm
+
       - description: Variscite VAR-SOM-MX8MM based boards
         items:
           - const: variscite,var-som-mx8mm-symphony
@@ -1069,6 +1076,7 @@ properties:
               - fsl,imx8mn-ddr4-evk       # i.MX8MN DDR4 EVK Board
               - fsl,imx8mn-evk            # i.MX8MN LPDDR4 EVK Board
               - gw,imx8mn-gw7902          # i.MX8MM Gateworks Board
+              - solidrun,solidsense-n8-compact # SolidRun SolidSense N8 Compact
           - const: fsl,imx8mn
 
       - description: Variscite VAR-SOM-MX8MN based boards
@@ -1208,6 +1216,7 @@ properties:
         items:
           - enum:
               - solidrun,imx8mp-cubox-m             # SolidRun i.MX8MP SoM on CuBox-M
+              - solidrun,imx8mp-hummingboard-iiot   # SolidRun i.MX8MP SoM on HummingBoard IIoT
               - solidrun,imx8mp-hummingboard-mate   # SolidRun i.MX8MP SoM on HummingBoard Mate
               - solidrun,imx8mp-hummingboard-pro    # SolidRun i.MX8MP SoM on HummingBoard Pro
               - solidrun,imx8mp-hummingboard-pulse  # SolidRun i.MX8MP SoM on HummingBoard Pulse

-- 
2.43.0


