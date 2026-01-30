Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011051.outbound.protection.outlook.com [52.101.65.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0193542EC
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 09:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769765856; cv=fail; b=r9QfAQrV7gABkTrnCc3ppcmYN2bl0aDCLp+D5xwClPelis3Tln2EZa7s67J6329KeqSWzINgeXBhoWNHrno4W75gdHkbrWcxLXnK1Ia1WZIdtKo4soLORVDDkFl7D/Us+xGE0djWKyzzWBI6sKXFTrs8zyVHcG6KkT8pQT10Feo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769765856; c=relaxed/simple;
	bh=dd2EhMBnXpG4/X8jvrvOglWngy8n0m9OiZ9WCboeOWg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NmLYDaRbeBnO988rNEZSEQGqaYcsM0efcGnKYw6NJhv9/3fg5gfm2V7OAxu5SzK0KMZfsiLpl9E2If18q200owxV8VoSClO0Ofnn05w97WypPgEERcjneB3XWobb+rCeAJetbLhjd1wkR4zdll6Jm5KFDZTIl/mwEsz23SoOO+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UJpmCi7y; arc=fail smtp.client-ip=52.101.65.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UJpmCi7y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ah2akWPPH43P87BLyNMKYk/j7FXSr1RIYKvORZCOfUWw9YdBeJJl1ikGErPeekC+ViOE0/PqARj1KkJ3Hv7Dzxjg3qEXsQelJmdzYGBHava9IRLlN4NNqhBRLP1gF3V+f1KXQDifPKnM77mpjeji4d09UjcmoynThxfwaxm0Ea7SJPX3tIq0gmrXw5VhYJi/jzt+rZQURhX+fW5l5NFHVBsdljapvWzNGlu8VA5rkwF09IasEJu2etPidaHrEVmFAfuZRZ5+bACqFBWipFNKZlLY/3vNOoSKJkNKR/Ad8oA8poPtYI4b8BblPrVfcGlcpYMXcvwVmwQ4m7I+Gzt7sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wfxy7yWrnZwbELRdMLZT1TK4bsa9KfDkpM2UCWbqakc=;
 b=pNJph83AWz3wbKF+7g81vOrAgtuGNB5T+WiW71WeK5Ky/LcEf+GvGOtiNLSazwkokDpKX+F3xdZR7HtRXPgETxc61LLloJ689mcH/SNKaDnHYAG8I/zCZxhlFAM8+v1oXWQJ3VtTA0HrqxyKcXxaWTjUfy4pfvXawJ0K3/u3o5kC07puAY7fM/WezqVH2OTpKuYP7LiGSfuxW+AE6w3wNYSJtx3sfG62ls7q+72iJOkltN+ue0/lVffEZbGBTG9l7Eun5zSOw5aAvXpnP+ieYVMlzkEAWt0eRu0Z9xfe2EmK3A1AIjPQNDDoHJsvCM2mbHxT9oS5p/YvEIU+e4otaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wfxy7yWrnZwbELRdMLZT1TK4bsa9KfDkpM2UCWbqakc=;
 b=UJpmCi7yUBlvsramtxn07iZjYIKz4BtJcX6yoyieHZN7cYqg+MMobduWiNu/5GzB1RvLX3f7l8VnRwQsUIAWiMZF2BrCjjVQe5W6DbkjRREep7MWtzEN24C5xKdBIKd0rBlF9LuqKyEcBVqUbxvtL/QEOTiY6Zw7ziy+exVXYPPcA+TygFzc/90rG6UrzuZSdQUx59WxEUXAPHkgDXbacP7FJxuzE2gVdBeawIRspgE6zBKXeFed3dJmMHKVheDAC5FmF+oca20TDX0fhfwS30/HJ6mdbTzSwww5o8pAhRmrHMXnWdzIF9zuXH8W0dFsMAOhdYio6s5l/sQREO/NAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by GV1PR04MB11038.eurprd04.prod.outlook.com (2603:10a6:150:211::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 09:37:30 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%4]) with mapi id 15.20.9542.010; Fri, 30 Jan 2026
 09:37:30 +0000
From: Joy Zou <joy.zou@nxp.com>
Date: Fri, 30 Jan 2026 17:36:27 +0800
Subject: [PATCH v3 1/2] arm64: dts: imx95: Reserve eDMA channels 0-1 for
 V2X
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-b4-imx95-v2x-v3-1-95af05bece95@nxp.com>
References: <20260130-b4-imx95-v2x-v3-0-95af05bece95@nxp.com>
In-Reply-To: <20260130-b4-imx95-v2x-v3-0-95af05bece95@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|GV1PR04MB11038:EE_
X-MS-Office365-Filtering-Correlation-Id: b894b4b8-9c6d-4532-101c-08de5fe33034
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|52116014|376014|1800799024|7142099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVFwQ2VjNFRLN2J6TXZtTTU1ZnZzQUVFcndQYldhMjJZaWJRU1Q0RmRvam43?=
 =?utf-8?B?MGRMMEhYaXFxTm1sR1l6QnVpQXZudEFwNnJnM1pOZkVRMWhBb0pHLzMyZ0hp?=
 =?utf-8?B?MTVmT0Z1TTZVcGx6b3F3RXRKZXhjTDRSbzNqWlU4ZjF2L3ZmSEtnbGpQM0Qv?=
 =?utf-8?B?SVhqcUhWcEU1VDV3aXNrK1lHdXdML24vdDVmUDl1a2pEUHBsYk16L0d2emUv?=
 =?utf-8?B?VndyYUdxcjZlL3VZYlNtcHBaa3BUZThRRkh1eDZ4Z0cvYWQ0b3VQSVdYZXBK?=
 =?utf-8?B?QjhxQnRmQnZVcmFsbXVURGJMb0xUYkZ1Nk1pWnQ3R3ZNMVpiczU3cEI4TUF1?=
 =?utf-8?B?TnAxdnEvRWtFcEU4NSttaGY0SjMvZ3BSQnRPczl2K0d6S08wcFZ0eHVzQWJ3?=
 =?utf-8?B?a3puVEh6eHdNbDdJcEM3SFFsV1ZUeE5jeVZGMnhLQ2R1a0EyRmQvaFA2KzNk?=
 =?utf-8?B?b1lPbVNCc2c1bHdEcmlmK0k5Wk12MFNnN0RYZ0w1a2p3TmJadm1tU0pMMlgx?=
 =?utf-8?B?T2xqN2wwNVJjVE05ZlN4U3ZCMnpYR3hUQ1JvWWUzWDhyMlVPNVVKUGxFYXZR?=
 =?utf-8?B?L2dYUjExMHBLLzJhMndDZy9lZHhhdEorakFLUEdvY25Ec29kY2gxaFlsRDly?=
 =?utf-8?B?TW5OdG5UMmxTbzJ1Zk1RbExjRWdoM3pMZ0tmRUFtbThBYitzRzI4Vy9qZ0ts?=
 =?utf-8?B?N3Ixck5Ec2FpQjFrT3FKbjVURFZRbjlyWjEvTUU3czNyWFhlcGgzaTZiellj?=
 =?utf-8?B?blltdnNRejhweHA0bnkxUEg5OWZaK1dRQ0R2NmtmbTRHTDIzVFJHQ3ZWOGJi?=
 =?utf-8?B?bVR2VnNlUFFMYmorbHpSeWJuQXk1WC9LbThTZGwraFFZTmNlWmI0dkI1WTNx?=
 =?utf-8?B?dkxuZklmOHg4emxXWXRMRmVyVm1LamZSaDhNTnpXNkQ2L0tIUHNaQ2puVW1t?=
 =?utf-8?B?YTdlNElsTVNqRTBwZFhxbzdReDQzMnVMU2Z2dFlNNHppcXdGdkJWUmVqeHNs?=
 =?utf-8?B?T01jdGtGZHUwOFdiQ01RYSttK2xvNFM4VVl2ZVlNR29ZUkQ3UU0xVFhUcUUz?=
 =?utf-8?B?ZGsxSGJsMHA5SFlBQ29zNWNLSWRwdmJjM3JVbzVOT296N2Q5eStIVVNXVFhI?=
 =?utf-8?B?RGxnQ2RtNGtBODIvNlZxWWhOeDBYSFJnZGhzNmwxbmpNNE16SHpOY2FlUVR0?=
 =?utf-8?B?dmxZMWhZcTBvb0tvbWQ1d1dseE96ZEdqb1luUXRkUTdlRFZXK2NRamlhYjFu?=
 =?utf-8?B?SDBQN2QvbzUxanI1bmpKNWRGUzNHYUpGbGtXZkRENEhQWjl1eFB3SGNJVlJm?=
 =?utf-8?B?Q09XZ2M1VVN5SDBlVWNrcWIyWXdtQjVVK1ZJTGVybzIzQlpGRUQ3S0RpS2d1?=
 =?utf-8?B?UkdoUHE5UG83cC9xVGNZeTlKYXpnaVU0RDZZZ3lvUENJc0paL1o4cmRvK29r?=
 =?utf-8?B?cnNESU9XaWdLZ3NWcFVyVHh0NGpGMlNDNHJ2STRLaE5CUmRITzRxdlQ5amRY?=
 =?utf-8?B?MVl2WXdKQURmZ0R2b0RRTzRGN0lUSWhjeWQ4WW5HQlYzeENOaFpocTJyeUJz?=
 =?utf-8?B?THJNcll4WnVUZ1U4d0dyYnZJWlF2cE9JOTE2ZVRPb1FNZFliT0lGNVV1NmxH?=
 =?utf-8?B?dU4za1FUNzRjSTFzZ0xNeWJhbEtFRTN3aFN3ZUE4K3ZmOU00ZUNLUXJyTzlw?=
 =?utf-8?B?YmZWL1V2bGFtd3hlQ3FtQ2FpbTh3R2FKaFFCdXZmTGNxK2lEeWxlOTBFak1E?=
 =?utf-8?B?cHF4eTRoK28yek9KUWk2NmlMeVgvVDYwTXkySGxCMmQwcjVwaFF2SG5ybGpr?=
 =?utf-8?B?VnQvOUhFMnA3WE02UngvTEtvWWFrQTh1VEtPTWlieG9wdjYyeXZVSFJkdEQx?=
 =?utf-8?B?WElodVhObkY5bGl1WEY0a0JjZXZJRENqQ0w5T2d0RGw4Wm42L1BBd1hFTGVY?=
 =?utf-8?B?QkRQb1VhUUxnUFQzSHdMcEVHY2p5by9qQXErakFIenE2ZVVHMEdtSWNmZGMv?=
 =?utf-8?B?dTE5SThkMGRXWXRBVjdTeFQvWWRyUThEb0JZREI4bW5XcWVCTTFCRDczeW5I?=
 =?utf-8?B?VXBDZzUrOEFHMHRTai9KVzZKcmFZUHo4eDNYU3AybFB1b0tVNHZ3Yk9rYm1S?=
 =?utf-8?B?b25DcUJJUkRmOFFzb2xzdEVEQ1N2a2IreWNvYm54TVQwMUszc09IcGNFUU1t?=
 =?utf-8?Q?HtEXqe9Y5NFLFJUquAI6+lXMYw2oxJdJdtulkm+BnVoD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(52116014)(376014)(1800799024)(7142099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3ZLMy9BOVZjTXR2RXNTaHBaL3N4bVgxU2xzRlczRjdRZG9remlnNXhqVzVL?=
 =?utf-8?B?ZWUrNGhCOS90Q0VPVllpMDVRYmdKcE1admxoU3l4ZHpyeVUwbkw3a0phWlht?=
 =?utf-8?B?RXhHNmhiUVBKNTJKMEpERUwrTlpWRlZIZUFuQkQ0bnZ0UjJ4dzk4Y3AxL2dG?=
 =?utf-8?B?eHpFbkJoRnc4REF0Y3JtUlFZNk1ZN2tJNlA2Zk9sQXRMaE9GbGlvOGZjdkt2?=
 =?utf-8?B?cEVNdTBGNzN0dytuV1NTVi9YaTY5VjJhV2t1Tjd0bTZRbkcvNUdqa05QQTBQ?=
 =?utf-8?B?WWNGMVVZc083aVk2UXVHSDlQWjFpUnltdzFoQXZLRkhzNjBzNzV0bFByNnJk?=
 =?utf-8?B?VGFYdW84MUwwWHVEWGwrUnM4RHVSVzVUVXpmK1ZIbHJpYmtGbXlEYkc3MXBu?=
 =?utf-8?B?eTQwU0ttWEd0Rk1qRmI3U2FVMHV5TTJUc0JuL1FzT0FKTXlrRHJPTEd4OXJx?=
 =?utf-8?B?L2hhL1NWMHgyWnVBcS94bzhMaWFPOG50bzhJM2phdGI5K2VOTnM0UzliYjJ3?=
 =?utf-8?B?VnRaMVVYSlQzU3FiWUhVaTVSYUtITXI4ZGhxQzh4a2Q1cjVVNUNyMkYxNVdC?=
 =?utf-8?B?K2xuUVRwQysrTEMrRWg5ZnRQUGJ6Q2NldWVmZEN1NERobk5EaEkwVWlkcU4x?=
 =?utf-8?B?L1BsVURVYVNjeENjL3pzRko2K0V6OVl5ak1URWFWT1l1N0h4NE1uamkvalNP?=
 =?utf-8?B?QlYzR25vdHJSOUhpcWFLZFZWY29xTEx1SHNyT0k1OFdTOHhQc1NMNExDTWNI?=
 =?utf-8?B?RzMrNGFnMjFuS0x1TE1yK0R3RFFzU3cwKzNaeU9qbk56Y2tsMVdNU3liWDBm?=
 =?utf-8?B?R0JycTVGNVg2UWpsd05Xb0o2L2FzWHo1OGQ5ZWxTRE5TZ0pXZ2lpTFZmWXMv?=
 =?utf-8?B?MlZFUVlnc0d3Q01vSG1heVJ0blJhNnJ6S01TSHh6ZmZxdmZXTkZNdWZ1RFZL?=
 =?utf-8?B?YTdQQUI5c0tFcHRSL2ZPL01qRFhtUDVuaWZoNWoyVEVtWWlISithODlmamg2?=
 =?utf-8?B?L1hNbjBIVFBqdFNTY3diNmtmMGNLanVlcHdrOXJKQnlDTlpFT1cyd2IwNUdT?=
 =?utf-8?B?VHR1SmNDdWJ1VnBMQWhCem9qUWQ3N2g5RWp2aFJjdGlMMXRKNjkyWHpqYlly?=
 =?utf-8?B?NFpENWMycnkyeUpNSW5BOVRDWUJoWVFkSFp1TGlieDJSVzRWOHJRRmw1VlZ3?=
 =?utf-8?B?dXZVMVBXQ01scU1TMHRKMlhsOExZaHBVbzBwOWdtYW5ZeldkVk1kdE9LVmtx?=
 =?utf-8?B?OG90ZG52RlZjUEZzcXRhOXU1RnhKbHlLdHB0SGJuQ3QzUldyWFJROEhrNTFF?=
 =?utf-8?B?Tlh5cmduM2lhZDJMRGI4NGlhT092S3pTMThLUklIYytQbGtxK2Q2WFVDcWxy?=
 =?utf-8?B?ZHA3L0hReWsyLzFVdExTM05OT2Y1SWxzQzIrcE1qUnRMclkyQWhTNFdWV001?=
 =?utf-8?B?c3dpNUIya0J3MzFhczJMMU9VWjZMRldlaVN4aHVYMjVWVkNIeGVQVUhrZUdh?=
 =?utf-8?B?L2kyUit6enZXTzI4eE5lRDNJYnJycXNGWDZieVVNcjZNcCtKRExEdzBLeXNr?=
 =?utf-8?B?UnlLd2tzL2ZaQlEwcU9MQWF3UUpUeVRzZU1MNVBOenNZR3hxaUVxYjNvbEVE?=
 =?utf-8?B?bThUV0xnYzhOZ3RpdnV5YmxvZFQ1WHlPckE3VlJrY2JicWc5V0RxREk2N0lJ?=
 =?utf-8?B?MTVGUzBRUzNTYTFXc0JGOFBNTldTOWYySE5YWERJOVlFL0NCb1dQa1Fvem9O?=
 =?utf-8?B?L216eDhPNXZDU0lUUnJrRGt4RlZuRHlGZDE5R2h2U2FKZkhpV1krWkl3NStN?=
 =?utf-8?B?RGltZFdldERmQnRFN2tJdHNaV0dPeTEzMWdlSkNTOHJiSEdpMnlseER2NW56?=
 =?utf-8?B?ekRZY1UzR3N6dW9kZGpMNmJObkxITVRNVmZzdnZJdm5xbEM0aGFYcWdjT0ZT?=
 =?utf-8?B?bDROMVZlTHZyemQ1dGNwdlJXZ2J5bXkyYXczOU5SVXlFcTZaTXFNK2VyZFhn?=
 =?utf-8?B?N3o3dHZCU0pTRStVNWpRZzJ3MG91ZWZjSGdGYnB5aFVxUlZOZGVMcXJnYlpX?=
 =?utf-8?B?a2hpQ1Z1NDJmOHBvTU1aRmF6Q2ZkeW14eFpYVXQzOGVpQ1ppUzlpNUprcGZG?=
 =?utf-8?B?MFd4aXhlNlp0a05hZWIwOGpnbnRub0QxeE0yZlN1N2xXNzl0djFUelZVcXBV?=
 =?utf-8?B?UHRmMW9yN2w2eThCZlBGaDBoV1pPNGVuYmEzWGxaYkVGNkNJc1Z1Qm5tNDBV?=
 =?utf-8?B?c0M5ZDdLeVI2Q0lYSVJkMTd2RGJNb1V5RGNGT1lKTTNvUG5rV1NZbEdxUnhZ?=
 =?utf-8?Q?1FptpQC1HQAKIcsi6A?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b894b4b8-9c6d-4532-101c-08de5fe33034
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 09:37:30.5022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fW7W5A/uFky+LubhjRcafwRToqJHzlpEzOSYdtDCtVBGqn59mbc6ojD3C9b9x50J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11038

Reserve eDMA channels 0 and 1 on the AXI eDMA controller for exclusive
use by V2X (Vehicle-to-Everything) fast hash operations.

Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Tested-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 55e2da094c889fc7c1096d0e36f31ae118d2a982..9ac82da2ff440e08ae8378d7ff830a568d50a354 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -631,6 +631,8 @@ edma2: dma-controller@42000000 {
 				reg = <0x42000000 0x210000>;
 				#dma-cells = <3>;
 				dma-channels = <64>;
+				/* channels 0 and 1 reserved for V2X fast hash */
+				dma-channel-mask = <0x3>;
 				interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,

-- 
2.37.1

