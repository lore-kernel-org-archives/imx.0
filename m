Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FD21C3F39
	for <imx@lists.linux.dev>; Mon, 13 Jan 2025 18:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736791357; cv=fail; b=HK7YsoGpaGzUYhT+Cq8lXt6u0HMF6kcxRFTm7rDBuQbWYtHMyLfZSvjoDmFQ2Mp0FQVUkpW4AAjTyhzEqJK44j0/7WV6WViwUhTakJPt+oOnEMr+3CZKEIhYZ01ej/1n5ESDERX/PNGpZQFqYIdRXfb9+espSZhJZgWKTp/fsOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736791357; c=relaxed/simple;
	bh=MwWhsciBoMpYVx3nfk4Y4+QjcHp5RP1+rRO3HqEdxqE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mzYoLZqpbO4ZHvuwEucs5CjA3gHA4awniHfYcwhFA9VZqJWtahr+dO9+i5qFgfWnlSOySMWIsEE3wQyb1/EqibbsRq2FPOZh9vzeKcQ3Mh6zepz6I/uepV+2GFU0AzCaZ8PdRzpDnY89WcFMvLjrG3dfwiw1yYS6/6ppWnnLMY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QQRq7fl1; arc=fail smtp.client-ip=40.107.21.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QQRq7fl1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyZr6FqKKAT8IpfqvueltNX7Bg+N2MxP7KF2P2igbdYKH4BbantdX61SbTxkSl6Z1Z6qcbJ8nDUsQJQao8yTTslKzvPR1Fr3t3BTkzwsJEX8Q2YPLCG+Fg5Q7nBsLD5PS1wRiqjLCjEosI3ck/5vVwdR9NokphkG1EyGr+WHXklaPRRcUr+w4Eh5R6yvQhlyp7ZUfRdExMNepICw7dPu97wpkVNe1644uftLF8gB8RYsyS6GN9AU74mQ9xVEnfzaAvu+AN18ziLsoMh8lR87jjN/cbeN0pcGTvIAEtualQlXs7TjtbX8a3jVxxk+1LRTOcer2iRNSzyv44qYKYancA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iubt7JA4hSRfuk2cv3tYWvpJfLBxX8aaHEiBJhHz1mU=;
 b=S9nVC/HQKw8x4NRbM3QWClhouxGz1orevcxAdGY1Noz+uUI4d0HHTCsMXLrTXZqmVReT2HLa++1CNSUPb0qytahhTB2BmuD2pafJGkUgHYCiNm8r1r4mBdfR8HnXW0PROOuO6fyQmjgynZw80Kp9kc/Fr5xNsl54HLqW8g4DNNtZyl0vKu/jEMz9BaseCQqHWdcOb5dsMRqoG/Q+rMQn4mrshzrVzJ444sxl154yriEm4hquxgqoTTet+9uyctW/95VWnxgRr01RT/BvqSxWDUuBQEtbQGMI9RnmrndyxufvxcqfNeMKHPDyqiPbA9yQHjzmcnWOB5zujxhUAHb77w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iubt7JA4hSRfuk2cv3tYWvpJfLBxX8aaHEiBJhHz1mU=;
 b=QQRq7fl1SpZQCTk2Wm4E/XLEymUwTIvScQPfZYFyLeHxs56f3HxC1KMx7IapQOVobusCLi9LTp0CWhSUX0k0ObcycG57Hw/789gd7BGhzgbVCSgeJg//4WoNRYvkdfegdzrSStvk0FZ7EJWtCklYTrW2Bx1qCViafqhkMB06XsTFrOfahScLT+aG/RqZTpTGe1Hm/f0DdoCWSfZEKe+dHjqeGDmJ3FMr7g8Pufq++FSqLdQc+1iRMgVicU1kZCEUQwimqrb1SwtRW+KLVm6W+vmPQ7bSxVa5zJFaTfOGFhH0Y23lcykVLSdffMHbpUGSMiN4dwmmBclfCiNLtThOfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10774.eurprd04.prod.outlook.com (2603:10a6:150:205::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 18:02:33 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 18:02:33 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 13 Jan 2025 13:02:01 -0500
Subject: [PATCH 3/4] arm64: dts: imx95: Add i3c1 and i3c2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-imx95_15x15-v1-3-8c20cbaab9ed@nxp.com>
References: <20250113-imx95_15x15-v1-0-8c20cbaab9ed@nxp.com>
In-Reply-To: <20250113-imx95_15x15-v1-0-8c20cbaab9ed@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736791341; l=1691;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=MwWhsciBoMpYVx3nfk4Y4+QjcHp5RP1+rRO3HqEdxqE=;
 b=Ql6+krnoI3nzMg5dT6XXPec3GyZ7459DHdlleJfS/xp84OTCr4Iy0RDWLVLG9bJxhlp8N18A6
 IEzJCCD7iVPCLdzt3K4yjzgfrgLlAs4LpP/AdHhyk1n+bMr97mn4D1O
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR17CA0005.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10774:EE_
X-MS-Office365-Filtering-Correlation-Id: dd05eab9-6c28-4949-654c-08dd33fc7493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cldMQ1Q2RVNJaXF2SFFUeG5qdXVHZkdaM0ZGYXNjT1NSZzVsSVFpSVgzVFdE?=
 =?utf-8?B?eHVrbmdhNmxVQitnMmQwamtrY0ZxaUVFR2hIMHZCQm1yN3lmaTFSTEpUTm1v?=
 =?utf-8?B?UXk3RGdKZWFPdzBkcFp2STYxSS8wWjU2Zng5OUpSOTV5STBRY3hJTlA3S3hh?=
 =?utf-8?B?RVBYbHRrdThtSVRBeFpxQnhyemk4clJzY2hZa2NBREFiUjFub1I1Yk9idHpD?=
 =?utf-8?B?dlg2WW0wZ1gvM095eGg5THdna01oMlJpcllBMmR0dWltbk80eGZSUWdhM2JP?=
 =?utf-8?B?U2hSREdlczVQdCtMa3gvbFdBRVpSd0tES0pPdzU3ZzdiWlZzT05aQXdJaEUy?=
 =?utf-8?B?MFI4ZXZUQWJkUEJKZEpJdjE0eGY0VERkTlNuYWRpU2VQR0VvZjhCdjJwYmpE?=
 =?utf-8?B?RFQ1TGZ0Ym0yZ2FNaWY4d1BNdmc5RjNJdGNkT1YwQkFSQTR2UVFPUlJCQ1hs?=
 =?utf-8?B?Tk5hdVllMVQ0WXVxbGRCT2ZienByZlpKU1ZPT1ZCbWUyUmV1NU9ycjFEL3l2?=
 =?utf-8?B?TVdxd2s5YkVWMHhqSzU1ZjBWSm5RMWJkdFB5bVlCMUtSN01LcEx5TS9KblEr?=
 =?utf-8?B?UEwrQm0wV0llQWc4dElCVkNqMzMzRTR0bzFKNXduU0hCUFJNQnVyQ3ZTbnFr?=
 =?utf-8?B?WjQyZkw0RmFhL2M1TXhra0xtRWk2aG9ZM09jRmc4dmY5NVozdTBnVFRweUVy?=
 =?utf-8?B?VElKMk1BYnUrbkpJMVgwQTdSbEJZVEsrOFR1WjZGcWl3Q1ZzSkhsUTl5TTFs?=
 =?utf-8?B?QXV5V01sTjZONEFJQkJRRVBvbnVsTzRYVnNFOVJwSkRoNGdqb3pLczMzOFA1?=
 =?utf-8?B?ekd5SFJMYys3eU03d3FBb0RCQXJkTXIwL1lDTm1xVEFQU2VjOXYwNTI3dy9H?=
 =?utf-8?B?eCt1azUreVJQRUtjb2tBakVxQXBuSFVLM2ZvYXY2bVdhTGgwR2VqSExoSFBq?=
 =?utf-8?B?K2hDQVQ3VVI3M0xDSWtOeW9uYmNTS2NIN3YzY1VJYjlhQWVTb0ZWUWtmR2dN?=
 =?utf-8?B?eFNiQ1hDUUFIdTRPSHJ5SWxUN2J3RlVCRk1MSklLM01NNnpoanlLTUx6cmxi?=
 =?utf-8?B?aXdzL1hnRTFTbFk5Qytha09BTmQ4QXNqaVdoTGZkZVU4dFdXYnFvQ3FtU2Rh?=
 =?utf-8?B?bEhxVzV0QXNHbW5iYis1dlJGRkl6U0V2YXNvUzJFUElNbmtPWVpmbFEyS3p5?=
 =?utf-8?B?NjZDdVhzc3pzRUJ4QkVUblR6UUM3eElDUkc4dnBxbEQ1VVYvd2p6UmRjenRk?=
 =?utf-8?B?MU9wRmIvdWsyYlYwaEJpc0I0M0czdGFjaFA1UWVmUFJRWWxISGRTTGlBMENw?=
 =?utf-8?B?cEkrWUlIQUs3ZW1hZEJxbFBwcWJNeW51V1N3Z3hsTDduVXJYRzlTOHRxU3pa?=
 =?utf-8?B?ME9SQUhtTzBPSDR1NDFEM0lORmRnanNVRS8wb2t6WE5RTUxtYlFRdW5renEz?=
 =?utf-8?B?UHV4SDd3Ui9KSmxWZk9lMkk5RlByRnpXaWNKUXhPU3hobGQ4bmluQ2ttd3dl?=
 =?utf-8?B?MURzQmpGc2Y5c0FaZ3lRSXlGNENPOS9FS0FxRHdGL3ZCRnlCWVBJSWhybCs4?=
 =?utf-8?B?ZWl5NW1YWkJmUkRRZERIYnkydTF0SDB5OVVncG1aTzZyVTR0SmFLUlZiUk9m?=
 =?utf-8?B?SDV4ZHI4WlNQblhjTGpQTHIwWmwxSDNjc2YyQ0tLV25xVDdEOU1VclpUOU1H?=
 =?utf-8?B?eGhxS0tINlcrNDRzZzhZSWY2VkVKaXdTSjQ1RFhlNjY4VG1CQUZPRzZhbmZR?=
 =?utf-8?B?M2VrbSsyenV2R0NGc3hWK0xqZTRuN1BOTXdDYmNHdGZiRElTQnh3R1V2Nm82?=
 =?utf-8?B?QVU1a2pRbndSZUZ3aFJsczlKU2cyQ2d0MFlKMTFIcXhCU0ZtTVVoaDNkVU11?=
 =?utf-8?B?bmZqdnY1RXg2U0sySWRCWlhOUkpmK2dEeFY2MnZrVE5qakV5akM1QkNYSnBY?=
 =?utf-8?Q?mxR73h+FGQGwnLPDoEi6jM//0N0nF6HX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eS9PZnRhbmNGOG9lOTJTaUF4elhiUVhXdzdzem80ZjNWTktIcHZEdjFsblor?=
 =?utf-8?B?cjllRURlVmdVSExVK0x2VE9EeThtd0gwNUVCdkMxaTY4bkZ6MEJ5WGxSSzFo?=
 =?utf-8?B?ZDZyMzlpT3prZW9oWi94UVUwOFVZSmkzQk9CRXI1NnZsRlI4UVhyMnp2Nlgy?=
 =?utf-8?B?eVZIK3BUZmo5bU03WTdSOW93RFBqRms2QjZhcGtuMEFQYlVEQzFubUdXaEJT?=
 =?utf-8?B?bVQ2RFBVdkxZak5Kb3Z1Q3pkTjN3bW1Ib0Y3YytLQUI5NWsvUFY5Z2wvY2Vs?=
 =?utf-8?B?TXVCeDRZV0hnblVNYkNIaWxBd2pONkI3Zk1aMHkvNW92RUdUQ0p0QlcyK1pv?=
 =?utf-8?B?QjN0dmRNTXlvMGtpdkJBaGxyS2ZkM25NZlY0VEZBNWFyUXEyK25FOXZkbWc5?=
 =?utf-8?B?MkZjQ2lmMW8zUEMwTWI5ZHM2cE1zQUdxSXZ1bkZpakhVeFFjRzM3UVZONTdI?=
 =?utf-8?B?TGhZUFdvbjVGSUd6WmE5NHB6OHRHa1JhUHdob0c0LzNHN1hPRGdJSDEzVkw4?=
 =?utf-8?B?MEx4YURVN0ZtcWpHMHpDVkoyTGNLMUhaVjBvdGNXSTVHOHIrdEpWVFpzd0Ix?=
 =?utf-8?B?cnBFRzBKSGY1VEwwRUhYL2lla0JDNVd0dTV5U2tUc3dYN081M01GQmhOek5h?=
 =?utf-8?B?djVpVnJvbW1STS9nTUJZMkFjMU1EQytXRTBhLzJXWmZBT05sVUxXNE5EaUFZ?=
 =?utf-8?B?Z1BET1A3dzFPUnE1ejFiR2JtTytFVzlLTEtHbER4UkZwS0Z4dmdtZkp2SVVQ?=
 =?utf-8?B?ZExpNXpFRGZieTlDSTNwZFI0L0lmb0JocHZOdm4raHprbW5yNVpHS0J0WUNY?=
 =?utf-8?B?NnY4Q215MCs3VHFRL0VjemhHNVA0dHJLM3NGOU1BbTd2cmc5TE9iSlY0eFdU?=
 =?utf-8?B?VDM2dnZuazZrYlFIaHZVcWJseWlKN2lYeTdCaml1OHZkSlhyeHNIOWo5WEpt?=
 =?utf-8?B?dmM4dll1SnZVaDVPdFJyVU43N3hKejc0bWppUjU2UkVodlFxVVVUb2Vta3Jv?=
 =?utf-8?B?S3lUS0pFalZmdjl0bXg4NktjMTZIU0xuV2w3N2p0ak94WEtOcU9pYWY2YVRE?=
 =?utf-8?B?T0dycUdMMnJyK25WejJYSFhPQTZ1KzNaWGZDTjBaQWJxVFROQnFia2diR1VY?=
 =?utf-8?B?WjdPQi82QkZ6OXM0eFVuRVBneWRVL1FPRnVRRU8vSGFLVHg5MU13L1RyMUd0?=
 =?utf-8?B?dm10ZWwzNmVxZ0pIVXdST1oxcWErbzVDWkcxSjNZM0pvSHZ2cDYxOTgxVEJ3?=
 =?utf-8?B?NFhFMWNOY2tuTzhZd29KeVFLZ2YzQ2FLN0ErWVlFZUJIdFJzNndDYVNxYXA3?=
 =?utf-8?B?UGw3Qktkb015dFhUalQ4a29DdG10L1dVQ3JDYkMwKzJMd2xKVGJPNHJXU045?=
 =?utf-8?B?cm5xTHQ2VVVwOWdCMnhSNzNIcVBxaXVEQ3Nhc3ZUamtLRDN2RHJSWXdCN3l4?=
 =?utf-8?B?UG9BRU42czBMcXovd1IyY25TQmNRU0lIMDRES1hjNzZVY2pxclY4WHJRSGlH?=
 =?utf-8?B?Mmo3UGg3MVRoOWdXUDlLcUlsWkRId3VyOHp3dS9qZk1vTExGeWxLQnJTUTcy?=
 =?utf-8?B?MmE0YUloWGY3LzUvMFIxcDg5MTJxVCtDQ1BlZklhVlIyUEVkNnpyMGFOQkJ5?=
 =?utf-8?B?bGk3T2UwdFI2b0VLQjh6VE5VWldRc28ybkZ2N0pza3BDc28yRFprQi9Bdkpi?=
 =?utf-8?B?VGhzZklqTlFheFNSNW9EVVFlU0F1N0RzMnArS3BJRlV0R21ZZFNHYlVqa0pm?=
 =?utf-8?B?YTNQS1E3eEU3ZFRLRUtyN1pYVFFPOVlPTmVuc1R4a3NHVHlXNWpsOEJ1NEVL?=
 =?utf-8?B?Zk91MFp5ME1pcXJUWjBETWdxeUY5YzRBcDYrOHVaZkhOVEtFeTlTcDBZckY4?=
 =?utf-8?B?VW5hcG05Z3FYZ0cyOFpxY3dFbCsxeTRUVkxseGVUZHl1SnFSenlaODRaT1pS?=
 =?utf-8?B?ZkYvWGpPdUNYMTJmalVmaDhwd2R2RXZIbDh6VThOeHB6WTQrQURYTzFESnFI?=
 =?utf-8?B?YkMrcGd0cXFyazZ1c2FLdzBQaVUvcVpNSndkbSthb1dVTTdBY3ZWaXB6dFBE?=
 =?utf-8?B?ZVhnWDBBdlh5UmtwSE83ZjlnUFdxTG9mZnIwVlhvKzlXVkthTG03RG9uaVJ4?=
 =?utf-8?Q?soMskQNNYqAWFd7IuQzfsuMRy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd05eab9-6c28-4949-654c-08dd33fc7493
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 18:02:33.7870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hZddRlsV4FZtCqOnKgqN6vIbBz3DA73cDbhl/y4bpO4CgXPZ+XjBHzMF0QELghcsUdyqZgTYemB8EXEQCXpAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10774

Add i3c1 and i3c2 support.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 06c50369aa2a7..59f401ee647ed 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -673,6 +673,19 @@ tpm6: pwm@42510000 {
 				status = "disabled";
 			};
 
+			i3c2: i3c@42520000 {
+				compatible = "silvaco,i3c-master-v1";
+				reg = <0x42520000 0x10000>;
+				interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <3>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX95_CLK_BUSAON>,
+					 <&scmi_clk IMX95_CLK_I3C2>,
+					 <&scmi_clk IMX95_CLK_I3C2SLOW>;
+				clock-names = "pclk", "fast_clk", "slow_clk";
+				status = "disabled";
+			};
+
 			lpi2c3: i2c@42530000 {
 				compatible = "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
 				reg = <0x42530000 0x10000>;
@@ -1245,6 +1258,19 @@ tpm2: pwm@44320000 {
 				status = "disabled";
 			};
 
+			i3c1: i3c@44330000 {
+				compatible = "silvaco,i3c-master-v1";
+				reg = <0x44330000 0x10000>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <3>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX95_CLK_BUSAON>,
+					 <&scmi_clk IMX95_CLK_I3C1>,
+					 <&scmi_clk IMX95_CLK_I3C1SLOW>;
+				clock-names = "pclk", "fast_clk", "slow_clk";
+				status = "disabled";
+			};
+
 			lpi2c1: i2c@44340000 {
 				compatible = "fsl,imx95-lpi2c", "fsl,imx7ulp-lpi2c";
 				reg = <0x44340000 0x10000>;

-- 
2.34.1

