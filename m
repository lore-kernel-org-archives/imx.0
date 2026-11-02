Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793663262;
	b=H32A88U4fgLuYgsX+sszNt05WDsgTmnGAQL8NWnNhSm499px/BfP1QUDAmca9O2HA3y1
	 D1w0jS1uS4CHVW4VGvTUgY65YEqZmPIkJ3FB2m0gyPX0bW1BQQ4Uwvy1CISczz0IySeqj
	 l8qo0uEqKSBolYvpwOsNvWw27mpjTDpsX81/E7gebLpw96LPCwmMXZ+xlKAeITrZ9rN+h
	 mcJVRm6aOcPAYFVrwyaAkAI0D3BZYR+0AbvIZ+1aWDnTGFoVQnzgyMzb/gsqrQ/C4al1g
	 bVnTnZCYpoZPrpIjuNctgP2RdmOPsa0eEVAhODqtblAXGZ7hd28Op5EI/RKVq/Rjucg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663262;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=yFMzHeZw1ybJzdK/37s+vj7oTUZFHOYkJ+4qC6/CSfw=;
	b=4RCpsaf6sKM1YjN4OhMlAGRLpGTX2bWv5Z47qTjuwug7+KdQm8soUhaWfL+Km0SWO/gr
	 2jAHKkyy1Jn48Fi487/CsCoBJX5dOHArQwQtoVsRWtv2XGmklJ4lr5nTqJMKhM9GJNDrp
	 wVvVpdU5lZQVi2t3U8Dn6aZqW/1MvVStAE0uAse72EPILCwxttOB7TFQ1MPcjfRxtEfEf
	 +RvF+8qJrolTKxD5KoB71X5+f6Z/l6fNK2i4E2YnGvW8wTL989H4YJYu2BKC2457fRkLo
	 2/kQmRBtgRcb3wyBsgyAH72s4vAF9EdQdYKjQEspDEeiHGQ6xgQUMjlejZzFZ03uRxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="H3A/cTl2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.16
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010016.outbound.protection.outlook.com [52.101.84.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8C4606A330
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 23:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD8C4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=H3A/cTl2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2ShXxRUcTDxUMVH1ttitgXkTktcqQTa679PIW20AFs7YNutiN+qOEn2D8+Nc4h8jG59L+VafGhQ7G86K3DvcE4zOv76XUy1kDABMnHoTlclWzUZ39SKZTmSozGd/VDxvMAqTOLvSqtQOtkDfj5r/I8/Svn/UkD1kX4gopqi0ZTiOYFbAsMhvMfvZo6xqEiH9nnpQkjAfzJCCWfN/Xwrvb+pHHflhUWmy83HwebCmqiW6XMoAPkTetabHDglwMnmmwlxPJSvPLLrzeZlGrtoWXOQye8t+uYwrY49hh4cDeXMpxK+rSbVLACqOIoPp2rSmXUUGWkE/VIEWQ/i7Op2lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFMzHeZw1ybJzdK/37s+vj7oTUZFHOYkJ+4qC6/CSfw=;
 b=a1pYPB8nsjDLb+hx6s820mmzPOzsbPzJA6z/WWl0xQmG6aTsdG1AurPXVEFLQOZ2Idj+PXskVDz39qMNJLov90kc15f3B8l0WUucaRyr8KU8zbDg8M2HqoHxRpTaABTv+JtpLXf0twlEmghGP5LXuHbGarQRfODn5PnP62KtKukFZVO0Vx68ykRffUN38aQX+qu6VLSFZyXMUITzgqzRKMtQjynYYqC0wMmhRoKh1zxyv3iUeqQ6ZAVNvtapT/ye4deXcgUYcUv5QSxBxpKpNflvM3iyPBkePpQCjljtr6X9RRtBtk3zQTgfG7fP9NSBfXsCjSvidPiLskmBkCp7Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFMzHeZw1ybJzdK/37s+vj7oTUZFHOYkJ+4qC6/CSfw=;
 b=H3A/cTl2xuWaA41v01ZX7pkWJVZtqv6UFwmmYazX7VDsy4mUXSVbxWEOb9x8SJErrayPDNWQEpTVGRJwqUY1mpFu0pnQt0I/Jk8hu+ikyRl/TwK++VsiE7ekQ7VQQ6DJL0H6b60YIT0NQkWAtgXaNRL5wTRjY5GHvGeXRC7wCiYiMpDHJrS0ke/Nk58I80KSlNH+K6Q1jfDd4JrFwUoT/NozBxsj/kgjdT7Z6eE5rWN8wpcHPe3iYDiyzy/QFi57P7B1rnl+DotTrjhOcpuczpgSsRUfQDf40Yu58386B2b6P13aqgpNR63je7v3PX9pWJstiTXRJT5QDYJsn1ybNQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by VI1PR04MB6927.eurprd04.prod.outlook.com (2603:10a6:803:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 23:47:38 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 23:47:37 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Nov 2026 07:44:05 +0800
Subject: [PATCH v2 01/11] dt-bindings: gpio: vf610: fix clock requirements
 per SoC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-gpio-vf610-fixes-v2-1-7c71fb36e184@nxp.com>
References: <20261103-gpio-vf610-fixes-v2-0-7c71fb36e184@nxp.com>
In-Reply-To: <20261103-gpio-vf610-fixes-v2-0-7c71fb36e184@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR01CA0044.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|VI1PR04MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: 83dced16-6713-4df6-925b-08df393baccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|23010399003|19092799006|18002099003|22082099003|56012099006|261102123227099003|10067099003|261009223027099003|921020|261022105027099003|261021121427099003|11063799006|261028144727099003|261026140227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	yZDRwyCJGKfy+ayR9oxRyD4zXl2mowVM3HPijC7lk0Po9dOl8GMU4E0nj4Aq29dGlh6FYMAfhcxoFcqjlXatHo+yiV5IvjNwCXR3cEZXVYUwvubq/qEzA+qi9b+lxppqFwyJjRzQ/INB7WHOVxv/ikDoPWWuqQNFX80xGmpRFrNo7oKK94582BbzTguFpZc6wBBkvS00+UySz+2rDzzpr1NnUcRBQdbAXZyCsaWQNcnF9StClYux8SNqiWmNOz0Br9vxTWrflGOAl/4TCLA3/+BDCsVawdla1cCiaxVLBNR1N6lo71T9j/7h1xvNfpjJqXH93VVQZC1XcDFscWbRMic1Lnj2wLBb6wcw3ET6BBO/WqwoDpdXlqeblpXFRCfiU/hHGXOR/XID2rPSZfH/LFBmXrrAAzk6WgR7f/NZaru6jlSkSVzQRsHBixSdb1236n19KmBFb4HS4dLJiJBFkO/h3z29JCAGP4ezNBLeJ93G9cKxPlSln4AzViwikxcus69pVYFd44sC0DHS22hNnmiHjZZfUBLNUaNXhq4TldNxiklSodMa5d6if//kqKpob5D0a3/5UAAEOMdn59zeB4E6ti9qBcGmJxmyrfBKH5YnzgHms4ZbPBNbbX/vUPT4T0kFMzhpLcO9NfJQzV7a00eiIus9Xzo8pcWgwiY2SQrVW8vCeIzmQflm5qfqqyEBPjODgNB2GYp3FBgaRKJ+yA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(23010399003)(19092799006)(18002099003)(22082099003)(56012099006)(261102123227099003)(10067099003)(261009223027099003)(921020)(261022105027099003)(261021121427099003)(11063799006)(261028144727099003)(261026140227099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXVqY3Z3SFVZekdQN2JUNmQzMjFDTDkwVFNNbkNJeTVuMi91TUlKUXVFRHBH?=
 =?utf-8?B?bU40SzFXOFhJdGNFZUpQRGVWa3FUMVN1RWNJSkdZekpSVzNBRG94VDduOG50?=
 =?utf-8?B?OVlkdUZPWjhKRldZVVFHUXlmaDhmYnZsUExkUklFaitQdnFTY1Y2QmVjT3BH?=
 =?utf-8?B?TGtKVE43YktPR3lqUjBDV0JGSlE3SGhSWWdNY2NLdkdHVmVjelhkVnpiamV0?=
 =?utf-8?B?eTRkV0k0Zm94bWUwSm5EeG9PejVHZm9vVjd6V1loQXJWVHlLMVdiSk4xaTN0?=
 =?utf-8?B?djViRmdLQnVGMUZBemdST21iYjlCRHJXWGJZWjFRTVdyTWt1Nm1nTUNaVlFn?=
 =?utf-8?B?UUE4ZUFMeVFnRUdUTVdoeGRFVHFPNXpaT2kveGlvY1UxVkRWZlhDbFZVTGJC?=
 =?utf-8?B?SGJNK1pEa3Y4MDNPMU1CdUVmWkV4TUlCZTY1bW4rZHMxUS81d0U2a0tOYm51?=
 =?utf-8?B?U3NEZnVQeW9oS2xQNlVkZ3JVRTRUcVlaRmZTU1krMUhna1BKMnJwUXkxV1Br?=
 =?utf-8?B?WCs4SHZZclZEYUNJWERGTGd1NE4rV0gyT3ErQVE4aFp6SDdpT2IrOEhzMHFt?=
 =?utf-8?B?VHFMOElLbXdISW5yRmNFMW8reU1MdFhHaS9YMnVQRWU3SDA0SW5RWHBqQU4r?=
 =?utf-8?B?K3ViZmhPVTJ2S0pGai90MStBZHIwVVVYYy8xSzVFUm5mL0VqSWNXNG1nSnlG?=
 =?utf-8?B?dHdHOEFTWEovcHZYQWhrV2RSdGJjUlpWQ1BWbENGWEo2Q2JURUljdHVuSG5n?=
 =?utf-8?B?T3M5QkVxa0NNSllzVEVzV2VCVFNrNXNSTEJmUUVFWGE5bXpZOHgvWGN3SWov?=
 =?utf-8?B?d2ZMR0NkUFlpUy81bFVJdExSbG9uUUFLVkFDNDBzb2VabzFhZHUvWDR2T2Qx?=
 =?utf-8?B?enBRb3ljdzFucWg4cTRhM1lsMFZndmhjaXE2eEYzZVA5ZkNta0ljckR5ejBR?=
 =?utf-8?B?T1JOWlF0ZSttYmNmU2xsZGZ1TWh4U1BTYXpKcGVkK04zMHJZZ05hZEkyN1R4?=
 =?utf-8?B?Q096M1o0QzRxRkhTdzdweC8rWVJqenk3YkswMWViS2FtYXJjSmVmbVY3b01u?=
 =?utf-8?B?b2ZxZWNYRGk2SFEwUll5STFKNG5pTHlCTTdIUjk2OFRFNldLUFhsOEJmeWlt?=
 =?utf-8?B?UnphZWpLSzRCeDMwUmdBeGtqVStXNm0yMzhYZFlmSWQ3WDJ5VVZvTmlkOUM5?=
 =?utf-8?B?dExUQ0RPQmYybzNqYkFmaFhRdzRnVkFiSVhOYkNWUzl0akdzV2F3bGF6WHIz?=
 =?utf-8?B?QldxbjVncHZVRTkzZ25ER1p2WWdWZ3QwQTRnQkJMRUtHN1pRd3E0bkloek5a?=
 =?utf-8?B?UElvRHNWdWtoWHZrYTZzQjVmcEJ2Y2lIMyt3UDdEMVI3RUV3dGJxNGRra29X?=
 =?utf-8?B?QThYbEN4OVdlTEdOVWdFRTExZG9mR2FjNlFKclByeHBKT2d4WDRvaVpnUCsz?=
 =?utf-8?B?Z2hSOWxZVmxJZGQ4RHkxNDMrYU5tR1ljWTNTd2hZMWxxZ2ErYWlra1RHMjhy?=
 =?utf-8?B?RUNOL01JeU9wR2lCL01IdVBpUldVQUl5bXljTVVnTXBrRFJjQnMyaXg3c0No?=
 =?utf-8?B?WVBEbldpRG9QbWRoWEhncVFKL3N5bDF2dGpLaGVxQVF2WHpqQXl4d1BrVmhv?=
 =?utf-8?B?RW80cWs5NmsvaEtoNkh1MmhaZDZpRkszRjY1QXJsUUJYdDJLcFUwUjI0bzd4?=
 =?utf-8?B?dlROSU5nOHhlNmp5TWcrQXBBTmxGdUhLQWhRRGIyaHNkTSsyRnZuV25FdDVs?=
 =?utf-8?B?RUFxbkd5Y0JQcmcvQisxTWFpckQwaTNrWnIwSXpoNDE3UnNEZUN5SlZ3MmtX?=
 =?utf-8?B?blhFRnJJSjBvM0Z3WUROSmpHcXo1eUNSOEltYlA1QVBPeElnQVlSRE5xYXBG?=
 =?utf-8?B?eklucHd4TjJpOFNnajB1UktuRGNiM1Q4T0xjTnVKdUlXT0dVelVOV1pWYWhm?=
 =?utf-8?B?OUgwK0N0SElzNmNTbHM0bmo0N0tOK3dpT2tKU3FDS0MxYnlad29RS0NGRmtD?=
 =?utf-8?B?TjV1a2c0ZEhyMUo5dTd6VUppTGZ5TTd1U2NDVEJiSjZXeFdTc25zL3FoUzJG?=
 =?utf-8?B?OFNiT2tEYld5Y211QUZQbVM0ZTZQdmxhMHhyS0R1NG9DRDF0WE5KS0tRangw?=
 =?utf-8?B?cTk1c1VhTHk5WVhBam1yMEFWdytIcHBvd0JFVjFhOTNXaGVkektoOHlvRDBr?=
 =?utf-8?B?czZHb2wyVVBabEh6bXRINHVObTB5R0ZLWVNCQW1KUjkvMjJUZi9LbEljUW42?=
 =?utf-8?B?TWgyNFV1SlZjK2ZzR01rZHNpQTV5cGczcHVxNEUrNCtWWGhERVBHRHZ3cW84?=
 =?utf-8?B?bSt5dU16c29GRzArVlVVMjhqZmx2VHJZRlAxcHkxTXN5TkdxVldLbUFJOTU4?=
 =?utf-8?Q?+U460lz/N8iOeajatDBbi3APPw7OmTgaV7G7z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83dced16-6713-4df6-925b-08df393baccb
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 23:47:37.5826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ypDlbPkXmqYYh0wJmaHstTctUubwb84uMPlvP1l45S+fAbQarvPTT52OVnV92GiL6vxlUGTT1T0B1aDEiSGx7RgHP7/g99EbfqXpy0n8ZBBmFkwUsaAw/E9OOhjbS9vX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6927

From: Peng Fan <peng.fan@nxp.com>

The i.MX7ULP GPIO controller needs both the GPIO and PORT clocks,
while the i.MX8ULP and its derivatives (i.MX93/94/95/952) only have
a single "gpio" clock. The VF610 controller has no gateable clocks,
so keep clocks optional there.

Describe the clock items with minItems/maxItems, require exactly two
clocks for i.MX7ULP, and require exactly one "gpio" clock for the
i.MX8ULP family.

Fixes: c61d8b5791ab ("dt-bindings: gpio: gpio-vf610: Add imx8ulp compatible string")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/gpio/gpio-vf610.yaml       | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
index a31f64b6d40b..822fa11d18d9 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
@@ -57,11 +57,13 @@ properties:
     maxItems: 32
 
   clocks:
+    minItems: 1
     items:
       - description: SoC GPIO clock
       - description: SoC PORT clock
 
   clock-names:
+    minItems: 1
     items:
       - const: gpio
       - const: port
@@ -116,6 +118,36 @@ allOf:
         reg:
           items:
             - description: GPIO register base address
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx7ulp-gpio
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          minItems: 2
+          maxItems: 2
+      required:
+        - clocks
+        - clock-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8ulp-gpio
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+      required:
+        - clocks
+        - clock-names
 
 additionalProperties: false
 

-- 
2.51.0

