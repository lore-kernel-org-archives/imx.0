Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021091.outbound.protection.outlook.com [52.101.65.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C29632E15F
	for <imx@lists.linux.dev>; Sun, 18 Jan 2026 12:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.91
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768740726; cv=fail; b=d1BAhtiKoYyOfBmDiIwBEJFVnUQFNvXR3R65TTqp8wQgf860hTF6SH9RIYke+vmqqPb0PL2xZqr1ogq8n2gBfxk3hclICIdTaPol66QpEX/gfs2OqtWleYu9ZU/zRg2zeIhFZ2ijIIWvSX22OXZvL9tUiYhDvbKFLGuHRNSJ35M=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768740726; c=relaxed/simple;
	bh=4yUAKIQxiEqDcrV9oWrj6GpySIFT5IQ96jS7KbVTSRo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BI78uytHRDTfqoo3AMauxNaJyATXrPoz5XbYV0/GcAWUixfeIc5c3PAp3lCILthlZbNWKf4u0RZphaKxsN9VO05qOGmbRFmb+J2LPKT0g7ux1rWt6c5/zFjtbxQEEXYlkQCegHgE3QGhL1yOpkVu4Oq0vhEv4wZ9Xoiud4wYgWg=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=o79Xn4vb; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=o79Xn4vb; arc=fail smtp.client-ip=52.101.65.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="o79Xn4vb";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="o79Xn4vb"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jn44xK2xFiJM6tuZ9V58GQF42b3+lWcAy8ois8nxhAOsD+NNCqyMQjCTqXtPzHRf9WL3+paQ/WiLE7upcNAkP+hKodXXXu7TRKTg8jw22ZmlOBWFkJYdbWf2t8m6X5xJK0+5c7TNqFeFh8qYBu9yxN6XLXPyhL2nJupg6a9fadzaR4fyQnR5ulTXqYSBiQVqJYQeaGl5Qq9KwGgoqMh3rOAIO4CVRS+4ItDqe687Dz+SIeXYRG3WrssPBJ0MWxFtmZaKxFJXeQ/kKhGhYRJSYFfCn8ArfAdEdfC7uQwJV/LPFGf0JzyWjLmQIJNC7dQ3Ms4+2tTqOCzyde0aTggrFA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlNmb+89soM5lnwdbydLb64ceYOXcFv3V1a6e8OHM9E=;
 b=o8H6QQ8Jyz6nL/k/2cY06PhZGcMg+Ds0HA0AFK0qjD2vqB8lEVc253Xc7WiiPqsqNXtXRUFTGuaWq+ERf71m+8yLw4d355hBHP9gnQBjgG/rUNqo+cBRCrYmLWP89J851k9YFcrtwgC542Emy/ksjATkTqDy49hNs5lywu+nP8ClhYRLle0UWB6Huj5u5hPDiSFejGp3AYRJxCEqLaVguOxa62xGFSirJOWiG0E1MVOvZlWnJdwWeSskedugEzQo7VljX2QyBH+gI+GLV1L01ReMSEkzHX/6txJGxBceqIKLqa6pJYF8uxSY2J42y0Gw3nlUpTWKlrxYhzAQ3O5CXw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlNmb+89soM5lnwdbydLb64ceYOXcFv3V1a6e8OHM9E=;
 b=o79Xn4vbRF1VmsJ1fLwbHL6H0xGZdc9bOuxDJ0SXP/jo0VRmdcR/OZyZnQYMiq4QSOUK1mJtEUJfGch+pnXmc5JGsHkKMFnuplhJeQbJNNnooSDsta/JpkjRANYX5Z5hRyBvIBR0tMONGXdRvRpOWcfQlwVaHRu03jba/VfHn5c=
Received: from AS4P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::6)
 by AM0PR04MB7154.eurprd04.prod.outlook.com (2603:10a6:208:19f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 12:52:01 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::96) by AS4P192CA0020.outlook.office365.com
 (2603:10a6:20b:5e1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.11 via Frontend Transport; Sun,
 18 Jan 2026 12:52:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Sun, 18 Jan 2026 12:52:01 +0000
Received: from emails-3054501-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-10.eu-west-1.compute.internal [10.20.6.10])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 4E75880158;
	Sun, 18 Jan 2026 12:52:01 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1768740721; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=OlNmb+89soM5lnwdbydLb64ceYOXcFv3V1a6e8OHM9E=;
 b=cIUc0Ujwpy2g1M/rfZyAAfaL0h9L7OuzZMueVxN5WC+CMOmcCbRcp7CLr4+Nm7qjwA8fV
 EIbz/3bOrH2ZqiMT2dsvF08ZHS391x92zVapcNdOuPr7vFusQx4z63cX8PgsaD80YNtbMQ0
 WC65JAVR2yxZE+Uzuz1MFUJ7zoHEZ4s=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1768740721;
 b=aGjPX+z5SIpniOmWp6p9CXID0f1p/ChR0iGVO4fvwJQFwnQ7zXT6iXehXWx2JSDMqWV1F
 EafdQgazJdApQ6Kd0k+VB4vdrv7ToQVRK/yFQwapGFT0xqlb50Owzs2/IOLOV9cSS0FGwze
 PwPuyd56F2r7urIJxXPkggWAhVYLqFg=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6E7WIWBXEOaeuyLJ3H1bLG5k8KAZWmT8WHvYWsY3rbS33NlxrFeEtq+hFlFXZhBbxuvNFTvEyo+hD1TSqkBPF9qO5GksB2AvIIbEXOlBDV8tmerCmbJEQ6Chqu/wMoV4syq3OtBx3DCBJXgstVNtWVaEyuMdaTrG4Gh21dCL8S7Obm8dnem7qe2t7M43oOjA7EPyqjPGjQL5WFsDxHb2igdJiaCbMNWYn7kpx3TMRxmokynRXcowX1IX8fpqcwfyaKGizBkTcZQeKE4He2OJz0J8W3CAmy8MhvjHskJ8a4dBQWvM6M3LQEvSquOG1GDlbF/2QXv69bGfjhUBxAI+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlNmb+89soM5lnwdbydLb64ceYOXcFv3V1a6e8OHM9E=;
 b=wZhRZkaq/cQQq8L1H1BGo9+CWGN06P+fhL15HM+WUfZK7OmfY41p03866oD7uRLNPTcvOozs52yThLHIjqRdm+R9VkrHCyy+QTseFx8tSVthYFM/Kd7VbPSBAPfYRal6z6H+0b6H0nnXbIVZFg0kTNpHh2KhHSBXPrtpqkwrJ2sUtfC42N1V4Op+Ku7b0+n3HcHwMCYeYsfmZOlSB/tG1nNVDxBmi46LjQJA3VJR1APBpYIv9jqdLfHF8wFsb00pJvkZ2sqdQikXOmTxMJs94PWWP5VkNH9dJorZqwyy65qjsbbonIem0v+mmU9BWCayORkD4tUKg9k/rYU7chtrAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlNmb+89soM5lnwdbydLb64ceYOXcFv3V1a6e8OHM9E=;
 b=o79Xn4vbRF1VmsJ1fLwbHL6H0xGZdc9bOuxDJ0SXP/jo0VRmdcR/OZyZnQYMiq4QSOUK1mJtEUJfGch+pnXmc5JGsHkKMFnuplhJeQbJNNnooSDsta/JpkjRANYX5Z5hRyBvIBR0tMONGXdRvRpOWcfQlwVaHRu03jba/VfHn5c=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DB9PR04MB11694.eurprd04.prod.outlook.com (2603:10a6:10:60f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 12:51:47 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9520.005; Sun, 18 Jan 2026
 12:51:47 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 18 Jan 2026 14:51:41 +0200
Subject: [PATCH v7 4/8] arm64: dts: imx8mp-sr-som: build dtbs with symbols
 for overlay support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-imx8mp-hb-iiot-v7-4-ef1176119a8e@solid-run.com>
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
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
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
	PAXPR04MB8749:EE_|DB9PR04MB11694:EE_|AMS0EPF00000194:EE_|AM0PR04MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: aee70952-b5ec-4f77-f909-08de56905fdb
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?T1JORVlLWlQ1b3V4SklDVTdSdjNHamFDWURHRU8zMTFVQzZyN2pScEgyZGR3?=
 =?utf-8?B?RDlKQlJFMCszOHA1ZExKQ2ExQlh5OUt1dTROblNndjBLOWZ6M244bmt3NjBt?=
 =?utf-8?B?Z2dzendOajUvWnZwekgvZjZ2YndrTUFiOFB1NWNQN3U0aHNUMzg5eFR3NHZV?=
 =?utf-8?B?RjFUZzc4Ly9ub3VFNUdpQ2tDdTUrSnJDdTR5d1RCZWgxQk1ackpVMWwramFT?=
 =?utf-8?B?cTJlN0Rzei9qekdCTTBtaURteW1UUy9EMVE4SUVNTDBoeWNseU1qVVV2QjVG?=
 =?utf-8?B?Y05hTHB0aTNBd1dzajZyZU9IbXI3TDdDRGpQZll6Mmc4UExKR3pYRGZQWjZq?=
 =?utf-8?B?RWMwOHV4TVpEdHBlTWNFRHFpWXkrRmZPV3Z1cmdYTThXNitVaGpOTGttK2lx?=
 =?utf-8?B?VC8wQlZ1MHFvRlh0THdDYjFGaXhMd0lFdG9leWZpME92MEFnZXBZdjJKWW03?=
 =?utf-8?B?RWFnUE0vbG1aTXRmNDV4Q2VTV3BpNS81SGtYSnIvbThWY1M1L3NvQmRtYk56?=
 =?utf-8?B?TlpjcUxsb3dLMDZnV0dzS2ZnNGN3OHFUT21Rb2RBN3lQUUtoTExWMjZUZ2Zj?=
 =?utf-8?B?Qjd5NDFKNlZhTXZyMUpSZGxLeFU3Y0FpQ3FDSVlHOGdwTGVyL0ZhdHlwTlZp?=
 =?utf-8?B?K1NJZ0k5azNHY0tvQzRHRUZyK0poRnRBYlpUc0J4UUhNUGxFTGdzQURFOVV6?=
 =?utf-8?B?VFA3QzNEVVYzWHNnVnZWTWtkSUg2WVJNbXMwdmNCWGVCc2ZUNWI5ZnlJdHlC?=
 =?utf-8?B?WGZuWDc0dWtFN21TRlIrbGZCUm5kMXNBWWwrTFpLVlFVaVRGUFNrQ2hLcXFx?=
 =?utf-8?B?Nk8yZVpiaDV4bWJyM3dvQ1Z2QXdLSGFMbzVXMW1yVlF1dytsamJKTHR4ZnJU?=
 =?utf-8?B?ZGJqU3dtN2I3UjBER2lvYlVhUmsrUzlCNVNFSWxqN3h5REVjbW84S0NDSlV1?=
 =?utf-8?B?emxHZFliVHowK1VuMHRYckdPRklEb01sOFZJd25WV3E4bUNJVGlXY3dEaFli?=
 =?utf-8?B?L3c3TVI5WEhGZlNiM3VCWEhrVWcrS0ZqWTlhanl6bGhmRmUzUXpFbGE0Z0Nh?=
 =?utf-8?B?cDlOUUYrdXlTL01LRk4rd2l1UVQwVkFYV2lwZDdZOTQwajdXYzhjQUcyMnll?=
 =?utf-8?B?TVdDazk3OU9QdlRoVCthSnB2OVRFdFlKYXJUTzROc2ZRamw5VElYb3pvWkRP?=
 =?utf-8?B?VFQxdU1yczE0czVIaHVUeFBpT0FZbW00cCs1eWZKekU2eVRQUVlydUxsZStj?=
 =?utf-8?B?ZEZWWTR3MXRMZklMekJKSmV2MGZ2cFZFZzNGVmRkR3YwNEtsWEN6dUorTXBu?=
 =?utf-8?B?WVFoUkgwZTZwbEVrZXFtMWNNRU4wNTFQbUIzSE9UaEF6elArYk1pR25QRGV6?=
 =?utf-8?B?R1FyTVZ3ajVybnMvMHlLeW9uMVlxV3pnM21hWnZnc0RJeTVoQjBVQWU0UG5m?=
 =?utf-8?B?dUdLM1M1V0RNMG5VNEFBM2VmaU50YmdBL3RCU2QrdXdseEZxTVFQbVYvc2tN?=
 =?utf-8?B?SDI2Wk01cFZicXJLaUVnSU5uR2tvNEJvaEdtL0FVeHNSWWw4QkhOQUNOZFRk?=
 =?utf-8?B?d2wzS0pjTU5vNEFpeGRJKy8yeEpBN1pmTnhVOFhaajkvMzF0L0x1Y1hqRi9E?=
 =?utf-8?B?eE12OXFZdllGbTZmK0xTQTRhSlREMlZCaUJldVVzczBpdXNLMEpqN0FqRGM4?=
 =?utf-8?B?dmRHaVhsbFlIS3F5WGVZdmtBT3hjSUljTWdmWElteEc0a1l4MkM2S1JZNzln?=
 =?utf-8?B?QUJ6VzhENTkxd1FRNEpuVTJTZTJaa3B5aElyVE5RYmV6RVBITTFGS0V4cjd3?=
 =?utf-8?B?SjRtc1ozcG9Ga1hNT2Y5N25Da3dZbzdTcTY0WHVtVml5ZldBYUU5eTI0cjB0?=
 =?utf-8?B?NGUxTitSVGN1Q3hXUU9HSjlTcmgrenBBbS9ZTEdUM3pacGNzR0dUem02RVdR?=
 =?utf-8?B?bDB3ZXE5eXVHVUEyTUlIL2JWV0EzZFhBTHNvb3VUeW9haXdBekZHNzh2bEtv?=
 =?utf-8?B?eFV4R21rREhPOGlyVU8rMzltTkFJRFJyYVFaU0F3dEtLZmcyNzk3dG90ZkhX?=
 =?utf-8?B?WFRpRHoxdjdOYnJoSkYwN2swV1dQd25Pd1p6OEt5Y0RjQlNlSEFwQVNURFNp?=
 =?utf-8?B?em44UlIwRmhScC9PZGZKTDcwSUNHTEVNTUxXMjc3aTF6SlQrUmFCaGFwWDkv?=
 =?utf-8?Q?np3MUY90dv3Vh3zMlu7ja3I=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11694
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 9645d6172f2f4b16a4aeef00d6a2a7c6:solidrun,office365_emails,sent,inline:df4c9036803ce3ce0c6c60d122810ee5
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0b69a0c8-4bf6-4f69-2832-08de5690574d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|14060799003|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUh2alNrQm8vVmQvbVhDWk8vbTRRcWtVRm11Y09xTDgrRUpCVUdxNnRNU1Bz?=
 =?utf-8?B?UDJaMUYzelZIRm0rN2E0S08vYjhmNGxSTW9SOFprN2RpSTlGSFlKSVVCOEg0?=
 =?utf-8?B?cWk4ckhQS2ZycjY4Qm8vZHNGQjduVitubVNZMVFMdmRnYVpIUCtpTms4RkhW?=
 =?utf-8?B?cVRVNGhNVnhMWWFKOVFCOWlNUWozNitZdVpMaTF5Mm1QUGtyT2NWUnBEY3ow?=
 =?utf-8?B?SjY2b2djdk1ZZWx2LzVoK21HTURYS3dUVncwNEFsenlSaExBZTQ0MmNxTDFU?=
 =?utf-8?B?Q2FEQUdrdTJJYzFqY0dsK2Fnc2h6RVYxK0RRN0VoOXh4Sk1IQmMyOEpRaW5N?=
 =?utf-8?B?YUREdkJpbDJoK2ErWWdUSGEyRytjTW1XU1QrTitYNmJDcHdTaE8waHJZaDNu?=
 =?utf-8?B?UjNyNlh5UDltcXBwbkZNUzJFVVBLTDZXelJ1MzFLSnk0VnpoU2NnbDZqZzE0?=
 =?utf-8?B?eWNWa3oyUy9ZTEUxMDBqakNYS0dxUkNtYlJIclYxaGo2aGNudWxhdEJWcE9w?=
 =?utf-8?B?ZG5Hbk55NXNFWHBQL2d4MmpReVorWEN3V1Ftd2E4YmF1M1FsU21Ka1ltZ1l1?=
 =?utf-8?B?NFpiMkRLWjB4MDVodXNqWEVMWFJJS0xqZ0toY28rbU12bE92aTc4b1FKdVVk?=
 =?utf-8?B?OXNFb3BndkxNSGd0VlNNQytRa2VPaDkrYWQxU1A1enNuWVI3NmhCdjJJNVZs?=
 =?utf-8?B?Smd6NWU2cXZ0Vlpja05zdkRvNFZLU0FReG9vbnJXWG1BTlMyc0pEMU80aDZz?=
 =?utf-8?B?UkdDMytMUzFoTW0waWd4QTB5ejJSQ2k0aTYxRlRSZEVHdTg0S3pvUW41THcx?=
 =?utf-8?B?Wis0ZGNPMjk5aHVqcWZ0RjJEUnIyUzMwQmpxblo0NGVpMXBpSzE1THdIaFpB?=
 =?utf-8?B?T082b3FiNWNiUTdWVUUvR2xkajM0Q0VjeVJhTmlkYlBpckhSYk5rK3NrVUtL?=
 =?utf-8?B?SE1XTkRmZWMrb0EyZ0h1c05EWTd3cTVGR29hSkNxQnBDVjlIMEcvcGlyMVZU?=
 =?utf-8?B?clgzTW1xRDdCNkRMeFJPWjFOSDE0SVh3Z3hKblJFcGpuUThteE96SUFPWnJS?=
 =?utf-8?B?MXp0VlIrMGVralF0K0orUkUyMWtVd0JwWE1peHArRHZYWjVMam1qdHVXUm1p?=
 =?utf-8?B?bHVsWWlqb0lFTzd5REluU1JJVG1oeUl0aU1oZXFNVGp2YUM3b1M1ZUFlUlJE?=
 =?utf-8?B?MjJOSkhBTWN4UXBSUFlFRjZ2Q2I4UHhsdlVHVVdpWVhCWUc5d3VJMUEvOEM0?=
 =?utf-8?B?WjV4VEwwaVNuMTFhUGRqMG53STFuQUJ4dk1iRHYyZk5PMkdaTW1JRzc1WW1p?=
 =?utf-8?B?OXVZWmlOOGFNUlZESnFKam85TUZlR2RoTTFsaTRrb3k0ZGFmK3oza3N0THF2?=
 =?utf-8?B?UDdlVmxDSUtLOWNlYW9QUnJjYmM2aGJRMkV1R3BnRHJEblViQS9rdElreUFT?=
 =?utf-8?B?VnBERThpbkZzNWZweFpDUEYzMUpxMHVwL1VhWkxDWWZObXlpVTU4ZXh3dEYx?=
 =?utf-8?B?cjZ5OTZ5MnlLR2dkdmlkV1VGODlXWWd6cW9uZDl0clFpMTEzTWFDbnBXMFp6?=
 =?utf-8?B?SDhJWDhYZDg1WUFzelk0aGhCMzFhWUFBWTFYZzhVUVQ4ZisweEtaaEJ6dEx1?=
 =?utf-8?B?VmR1clBrUE1majBTOFNkNlBlWjdmLzRob0RQV202eU1zMmdoK2ZLWkpLS09w?=
 =?utf-8?B?UTRzcmR5K25hQ1JiOFJqWnJzMGlobTdWYVdabGNoUyt1ck8ycWMrVVh5alJM?=
 =?utf-8?B?eUF0UDR6eE5Pd0lnTFVJT1pna3c4RHhjaGgzcXNaNmxxVkhqcWxSN0lJaUZi?=
 =?utf-8?B?V1V6Zm0xS1k3MG9UanlwWXp1L3R2MDUrZ3pGS243UHVzdTNjTHE0bTZoNHpV?=
 =?utf-8?B?cFVkaWd5K2VGU0I4UXRxbGwyRkphYkNvakZPSWFnZE80Y3dYMWZpUXVEdUU1?=
 =?utf-8?B?aDZkUzZCNWpmODg3WkEvUTg2ZExnWlVxOGU1OTdkREx1eUpSNXJMWHA1L2lY?=
 =?utf-8?B?bm5YUUVHV0diYWxoV0JxUEVyWHRvSDRjVGt6eFIrblJ2RDMrMjhWWHYxSmds?=
 =?utf-8?B?SGU5Y3VJcVdUbDBHRUFUQWFvODJSTisvWHZOU2lqdFdLdk9FcEE4bmltenI2?=
 =?utf-8?B?ZTBaUWk4eFM3dWYrMTJRSUI3N0xhNjZBSVBFc2VZL0M2MUh6NExDcElCMnRa?=
 =?utf-8?B?K1dDQWoxckR0b2J3TGt6bkZBZEFOaEIwcmtWRDJhL0FjYUhqeDhSOUN0ODdv?=
 =?utf-8?B?MTBDL2pXRm5lY1NDeHRaMVVJOU93PT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(14060799003)(82310400026)(35042699022);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 12:52:01.5701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aee70952-b5ec-4f77-f909-08de56905fdb
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7154

Build all dtbs based on SolidRun i.MX8MP SoM with symbols (adding -@ to
dtc flags) to enable support for device-tree addons.

The SoM has a camera connector for basler cameras that can be enabled by
downstream dtbo.
Hence by extension all boards based on this SoM should support addons.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f30d3fd724d0..c4c6fd6de963 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -203,6 +203,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-helios-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-proton2s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-beacon-kit.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-cubox-m.dtb
+DTC_FLAGS_imx8mp-cubox-m := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-model-a.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-som-a-bmb-08.dtb
@@ -213,9 +214,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
+DTC_FLAGS_imx8mp-hummingboard-mate := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pro.dtb
+DTC_FLAGS_imx8mp-hummingboard-pro := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pulse.dtb
+DTC_FLAGS_imx8mp-hummingboard-pulse := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-ripple.dtb
+DTC_FLAGS_imx8mp-hummingboard-ripple := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-iota2-lumpy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-bl-osm-s.dtb

-- 
2.43.0


