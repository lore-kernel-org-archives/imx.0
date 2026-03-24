Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011066.outbound.protection.outlook.com [40.107.130.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A7E3A872B
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 18:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774377632; cv=fail; b=u60Uho/n0uvNEFK+Ts/bEQhQikPM6FJ90b1v7eixP94gKycHmNvawVItQMqJXzEX38bdPIk7BF1x4yQ/z3iIugFEogNFh2udr01ym3VsVRDYVb9Cb2jILZR+dwEfiuQgkXP9DoGB0PEzlVnn1LNabcIeHVuE/DrhZ/BNtu3HwLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774377632; c=relaxed/simple;
	bh=QJtkuAMuQh7NLSdf3py2c8nCLo+KkxgEUa4ZUCy6rHA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=P3uuTiCVFDNZop1jnaI97Uh8cGk8EFxlrDBp2bxdi6BhAAvEcSK4aIkplkOKFvxYXc94ERUOX/WCquCHHEgNMQEL665BDTAP5hNGL2IkaRG+EzfdW/Ozj0SlGQRcjNT4lfREF7plUIrETCml6dYBi+qyU+TLE26uaC7fGgYufGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PVTZLGp8; arc=fail smtp.client-ip=40.107.130.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PVTZLGp8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egyufj0sAE2ZynvATPRhER0eec3YeBd+r9vBnTGmlGAgPXavHHI0Q1NgnDEf5/0HFGaBEVSeRtcBEHQHsD/tWLnUAPx7r8aThFE5zdLyZ1JeUNKTHnt4kVuViVS4UGQpzHBchZjUlB+m2JP4Aip3JVhWTmaPuGNNluwrjT6DhmDMF0qPt44nqmSvFtKHrP5jsi90ZWOaD+rHNuv+KvwRycrHh3khrOwKL8e2ICKZcgGYt/AFsLgEFIEKuid9vM/qqLw8q2ufMa4DAJGt6vNCW2Mm8zbOBp4xkI5N9u/ufMo9B05+VAZn3FGqbFcaGFv2TDnw0ltWq5iQ6xxX0GVlww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXrtm6lblCxrZ+FHsKBTzdvoSkvH8aDdnUEi8e7OO8s=;
 b=S6Jxlb791CALDjuOeF+hwCLL1m/7KHDMCF6snK/OZ/V9JeIAD1bxq3saN9ttAvfUFcqmHnrKPwStWsxEJrnullOl/0S1emmgWX0GiUB7Y4U5zgMJA3WsWW4c8cuP4/B3mVNytpTSyowRWwf9wyKRsk9u/RzESm9wGKe9FyocAXLXvdeJkALKPkZBxcnnW0OHbG8FbV9Q0SH2tiPP5DLe7vzbd719WH8qOjJ5o9W15M3ZHdSYWP/Turbl7K0GORZSt9wLIjeWwGmMv7sjgkJxscCTzyJ9tSGqrmKk3a3oEjsTqa9VFyM1NKSHtAhYL+X4sgDjHfFlrYOJu4o5wfAhpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXrtm6lblCxrZ+FHsKBTzdvoSkvH8aDdnUEi8e7OO8s=;
 b=PVTZLGp8EZc5jWlmQAOjhvRSQTyq4pz+TDftiYOywjIoCXED8Kat+I/PMinhI/8QM6QThOSn9LIs7buFYxY18jlrnrDDJTI4qoU2p4WZyHFAmJVLSA2MQTARsjOK+iSKtPPsulquxLDhgNatYqEh9sB/gsVQl8JMZRkgg0v0CSkvvr85oMd4FbyurtPn6ou56oVq93c+iAHLaP1emqAnD+yvvLQ/b4dme3LqOgpboy91lHsEotOg+sx/dzYrlNaLuoPwAUCTwTu8vibIv4EP2SbC6cVOWdaZs0m+ue0eN7FrV5qElJaw2irc+aeSy/zwOLbvLAweMjVUPl2y1rRI4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB7145.eurprd04.prod.outlook.com (2603:10a6:10:fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 18:40:25 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 18:40:17 +0000
From: Frank Li <Frank.Li@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
In-Reply-To: <cover.1773417666.git.stefano.r@variscite.com>
References: <cover.1773417666.git.stefano.r@variscite.com>
Subject: Re: [PATCH v5 0/2] Add support for Variscite DART-MX91 and Sonata
 board
Message-Id: <177437762308.2241519.14576760945592982454.b4-ty@nxp.com>
Date: Tue, 24 Mar 2026 14:40:23 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SA1PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::9) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB7145:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d6b2fbd-ea33-4a8e-5892-08de89d4cb95
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 Im+eEeE9pFn+L1IqpBHHEmGp7Nu1SXeBTIYRUes/+8jDavNgfr74vjSF1bCBFdIOmUxV9b9ZjGUvQwDrwJmLlDw3SAyKJHxsesTHuTOkKg7SWeYs+001gn85t20SM2P0OgUoTdjmjns0FQp9LKDDTsTngOLZHhWvXVNTiBx0/ndLQxpeY7Ru/twjcXb2vkNEc7ggDEAzlJUxZUNQM9aJaMg6OYt9VIto3QHyNvdadYMt+wDMXMirP7vWRuAc/kS1r8fKubykbtDo4cmX3jICbKMPUGwIkOmIwY6ArzLmQQhkd/mxX2bugRb+GY14ZNNeA4JsFum5Q4HxKxvlb81nUR4AKLvIDh16h5PkSo3CVSCTTtfvMJLbXg+Pcywn9ZbRkQJiPt34LQil7QmD1c9HTKbmAtFDqqW62xn4DAOvyuLJ7b85JxW4DQDk1Nkw56s/fc7845eCOVPquOnKWSwyUdgvXJtnAva5gMogiesm7yM3I93aSpWMAxB/d97NlTtlA7GBdwk2Ouf3PHrMw88BlWk0HK4y5bPAkuprOEyazLBQJ6noMiBk6DQOuUmW9ID4Thw4zcDihDTtnwMP0SCk1J93s3bfzoZePoZgb36gAb06+dhnfcpRiubnYVNRM4AA7n9NRLfYgt9cQuQ6OBCiksOruMnY4//FdS+9i3gdzM0GB0faIbXt1FDnr3D7WBF7xgm6i/o8IbaAffMqgqc4s1kgB6ithh09I5ytZdVJ0ooG3ScMHCs3hNe9cBckefQkUBULztMUI8YcsKS2W6zROBFpeSCDuqa/MMW3JMLKs54=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TEFuWXZxOWxNcC81QXpaMUlSOWVuZ3ZBRGJCOHpKQTRZL0dWN21GOVVWYzlz?=
 =?utf-8?B?eGNJK2xHb0JNV1NZWjMzYkd3NnhOZzN3d1RCTk92QnZUUUN3QmtXL2NKeWly?=
 =?utf-8?B?RzFObVZNYTY0TEw4cmhtQktjeVk4YlV5OEd6ZkdtUE8waVRtL256L2pUY1Mx?=
 =?utf-8?B?d29iTmpwbEprdzBaTk95N3UvMkUweDFLOFJuMzFTT3drM2h3TXA5ekwzcUph?=
 =?utf-8?B?T21zQ0dnTExKbGZFMGVvd0F2M2hTUUJrM3R2Zi9IUjZXdEpQNlM1UHZWV2Ju?=
 =?utf-8?B?ZzNOZERCSStwQWxJUHhKemZOTWNwNUdFV3ZPdi9tQm9vNE9TTGh5b0Q0ZW5V?=
 =?utf-8?B?WmJJS2oySTlkR3VnRDhkR1VIR1VpQm52T1c4cFBNU3h4S2h6Qk40WVoxRTE3?=
 =?utf-8?B?VktQWERWMERPRmhLSS9MSFFaZmZjN3ZieGdUSFZseTNIcTZXMGV1cUVxaFFl?=
 =?utf-8?B?Q2VEQ21SZm1ub1d4MnpLbitIU0RIOWJ5bmIybngvVU9HVFNzMEJFbjh1Yzkx?=
 =?utf-8?B?WCtmSXo0SnJaak84cHNZRGhyOTM2Z2N6U0Q4Qmx1M0xBL21lM0N5emp0NVpY?=
 =?utf-8?B?cExMZGJHdUp3eFdwUTExVUF1VTFhUGprMUZQY2loMTlhZHBBbXByMGduMFNn?=
 =?utf-8?B?S3RvY05DczZSQXN4dEU1U1BKOFUxNlpRWVQ3ZXJkQ0dXUkZLWW5RWTNlRndH?=
 =?utf-8?B?Nng1Q0ZJTkZzVnh3dDZ4T2dZd0x5eXdMUVRUYkxsZ2NTZDVQa3VVTHFaWitz?=
 =?utf-8?B?UHhFdWt6YndrNENuNWNTbnByODBYeXpXL1FEL3hoV1g3ckRMbElMUDI3ZW1P?=
 =?utf-8?B?d1NvRDNGb2xIdG9qRTJkSi9xajI4Y21GbktpbEE2YVhIeTBYM3VjbGV1c0Ix?=
 =?utf-8?B?WkwzQUR6a0M4NmFFSGl3NjVDMkZSS0NMc25nTFVsbXJHUzFRUmRsTEJTVU1X?=
 =?utf-8?B?aVpLeXF5OHh6RW9NNithZXpzTUlsZ0cxenExQmxiUUJxYWhGQVNYbkQ2dzB3?=
 =?utf-8?B?WVFubEc4QmRjUFdhMzZEanhzcHhWWGsyYWEwS2RUVGRjQ2xMdENoTGVQQysv?=
 =?utf-8?B?QXQzUk9VajNnR3VPUFJHbHBGZnBPODdhR3FpblJjNm1tSTRJWmZHTmtraUVy?=
 =?utf-8?B?MXpSNE11bkE1T2NUdHp5b1k4V2ZBNlZrd016RXVMbmRZNmd2VDRWSkdTTWs4?=
 =?utf-8?B?T0xJallIL2FHbTVtWGFvK09jUDhQelE3UWYySzdVNkgySmhmQThiZlJjYzBD?=
 =?utf-8?B?ajlDanhNejJydEpSK2FuQmV4eTExaWVhSnZyY2hUSEZ1MDErSGVlWWxiUEpN?=
 =?utf-8?B?MnR5WDhKenRLR01QS1BleDBYVXpOb1djNW9jZjJzeTA5bVAxeFdYeEx5R293?=
 =?utf-8?B?Wk1hVXptcGM5NW5TQjlhVHRvR0o1TzNxNmV0SWZINVdOc0ZBU050emVidGo3?=
 =?utf-8?B?enEvOEo3ZlVqUmw2VzFBRERsTVRlQUwrV0hFT0ZiWklNNnZuK3JJa3RNYWwz?=
 =?utf-8?B?amNTRU5iNGlKMDVDb3htVWY4bVJEK2Zxd3dDTy81YmlBM1ZNZlI5N0V0czBW?=
 =?utf-8?B?eWpqVEduTkFrZjJFT1VDRzBlZFg0Z2dBQVl4Ri9MK3hSRUtnSzRMQkZFUXlo?=
 =?utf-8?B?WWxmVjJsbG92WnZuTkVKWnN6dkRCWkNJYVhXL1VmS3hsZDkzYXE4VDlFSDk3?=
 =?utf-8?B?Z0tlVGZSUHlRYWFxS01ZVHpaRkwzcXcxVWdWNU1kZHZtN25iK2dreTU3NWdH?=
 =?utf-8?B?TFlBZXZrYWFrNk1GOUVNeHlpV09FWWZ2R0ZLMXFWVXBnd21najIvckFxVmh4?=
 =?utf-8?B?cktzNWdIeGphemh4Njd1WG5EYzI5czFiRFYzenlSVWJhVnJPelZGNWRDK3V1?=
 =?utf-8?B?N2ZDWC9nYzlHMlhUNWZWaWh1V2o4QldVOEJaeW1jS3lwSk04S3NMVjhHMWZt?=
 =?utf-8?B?ZTQ5STN6MHhPbWJCaWJqTlkxcENtT2FmZUwxK1lSVU1zaUY2V1RmRmJmM0dZ?=
 =?utf-8?B?UzMxV296TEIrSGZaVmJmT0gzL2hLYVdHZTUweTR1RVBhVGk1TE9GdEt6SEx6?=
 =?utf-8?B?Z3h6TzJmT1RQcnlFNUhZOVE3WVBtNjgzZzgvdm9uV1IweVpTc3pRdjJqUGw3?=
 =?utf-8?B?ZmJTRUZqa0dySERiVFkzM3RtVFBhTUxjUDJ1dGMzcHd2YkFmMmpSb3pPWDUz?=
 =?utf-8?B?THc3V2RKeElBOTI3N3BxTGs1WnJXczFmNDFsR2pBZmNjTkd1cmhHNk1sM0RV?=
 =?utf-8?B?b1ZROFp4WTFLWWQ0Z1Y1dmdZeHlOWTFURVJZUWpJWDhXN0Ftais2aTNwUkN5?=
 =?utf-8?B?T1lPbkRML3VJMG9IZFVSVFc5TlM1TTZMSzh4dGlROXFwUTFIUWZ4Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d6b2fbd-ea33-4a8e-5892-08de89d4cb95
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 18:40:17.6914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rzW9jJcX/jGelK1XpaSvFigrmS0YLSrL4Kdg74ue2e4gZ404qNWBNO6tb6hyw5x7CWL4pqqanex+lTAYfnKVlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7145


On Fri, 13 Mar 2026 17:20:01 +0100, Stefano Radaelli wrote:
> This patch series adds support for the Variscite DART-MX91 system on
> module and the Sonata carrier board.
> 
> The series includes:
> - SOM device tree with on-module peripherals
> - Sonata carrier board device tree with board-specific features
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: freescale: Add support for Variscite DART-MX91
      commit: 89b79fe7af37b2d8f3f3fda4786f6f507bb45e3d
[2/2] arm64: dts: imx91-var-dart: Add support for Variscite Sonata board
      commit: 5354185411cffa7317bb7699e626bde5d6900bf0

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

