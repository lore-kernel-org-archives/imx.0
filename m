Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795110691;
	b=5fEIJVxyMlVuXcrMwqCtAxucNAsbqNV2NQoWa3XiIAApbb726+A+2bUYFZ+omAb9a4NL
	 fwUf+oA/qFsY3GJJcVmrWpRUcz54Kdj+QyiYNWmZ9HfMqDynQKEr2zNX5YbnuZLCKSNrw
	 xzQBSLv7HgwouwozMH4g8qZe9XqM3YqCJd0YNPQNHJxvA5N00fGLoZS135C42rUP2ns/z
	 4nuPV8a7kdtBJxYz77uPUP4WZQgey4RwN35rJXn/n2yHvjXLtEcS3FxF/zDJnOvttePSn
	 iryxpt+hQ9ZyZmOV24I+WDhvCr/975EPiCwxOczCMOWU7Nu3j6tqebOEOvTJPbPgXkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110691;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=xo6vkw1TIPOF2FNQRgCrl71X6f2LpC7FTS5vWtns4Rs=;
	b=oXok8YR4dYHOHwsv3DNSsyajAjZVHpdUmZ3d3pKLsHMJ+Gy/8nBUnOw09zQAkP/Wj5ew
	 Swe5VjDbYRNi/w/eY6d+r0s4/HaJTnz2VVktcXaiqYK0dCa8TKqb48SiXtI9HVsW4uWIX
	 QhR+MMrZwe/M5oMENWodV3BsLl0XLPo66Xm3z3i+vH6wSXskip8znDqWdYgN7s6FUq35u
	 oZaxhrN/CzHa/8BefemM79Ceai/WDPASal5pDRE5ZaV/9wPQ5VBAKeq8o2T+tl7kJGUqM
	 6q80ZFBDJy8r3RIKXd7DY/JRIDHlyhqRcUP7j99fEha9wqIDXvK2jOqN+Kst/NAJmPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=OV3Xophx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.1
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012001.outbound.protection.outlook.com [52.101.66.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD3D606A320
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 17:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BD3D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=OV3Xophx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wYKoQG59+kIRbgYwVA8cHj2Wg6Y+cLzEjGAg1IudhREUxWWDhhunv9iNSYWNmVHhZM/deR3v/SGl6RHijlG+Ij1warW46veoJ8uBaLbByYpaiaIG/kinSGk55da8IRj9XlLo1p/ovugd/suG7ynVQjgvDi3zxDrQXp2oM4ZxIpL+4oAm8YGwkqpqeMZEpul6T2Ari8BHlI7wsfOdsc+7xOw1rTZVsnKe6VWnyZusSeRwyQhsNCO4QQo3fFc58gCQ01nQk7vITBog54+xvBu+4qt6HUGUIDBu10tsdE9EvShN14eva9Ke2iGk55BI0VujsUax8WMa4HIwX+KSmfh8JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xo6vkw1TIPOF2FNQRgCrl71X6f2LpC7FTS5vWtns4Rs=;
 b=H4o8ZdHYDnKW9v6Z6Kbt/ieSnLUUUW6tJJmrfEiK2pw9xhHl3lG+Q15ZmarAEqpva5iKx6zSPpw6MX5/tMiSJwrfRtGNZavYTPeiCBbu+KGMRWMxmvTeApSVAWDonwKhG00ZkFt+rHjVd/CL7vRieTmF4mGrX2v84NmchXIl1KuMwmnlpQbnzClosMSO6lu8UTeusMVeK74dqiZVWlQamoKYI0j3jPsxq0GJUShZjbsj8doduHW329qgwlN6B7gu+dlb/QLFEKg6pSMxtOL4t2Z8GUPq61rZv40QbPHFpE6iOPFEIPsDPdpxAsTmTgc0cdNuRTHefsLbuAKAWvqNNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xo6vkw1TIPOF2FNQRgCrl71X6f2LpC7FTS5vWtns4Rs=;
 b=OV3XophxYcxmiXB297npwFQ7YQnVnXsaE/3eJWD47kfUro5uOuDv9ER9fsQR060kkbniw5OetjJVcIpCGlE3wP9hlNMEFrUQl/reeOFD/4NgivowIMUs9OugZ4WH/TppcORbKzb6XRSSGwH/I/ogGi8IKq1x574Yn46Sg1zu29TE80PMdBzUYZ065f0BUmmcCebwF5FOZA/lDqcqRge13HWzWHjkx38bD7Ll/uWXq477m7oBUk419oxBFOKjcVsH/8rLFAupgZfXIlZ6DSjm9gV3jzmtvxs6yuYueP8cX83pdVP4XEbnjAhbDsWYG/2CZyQLVnPLtQR4GRrESZh2aQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB11968.eurprd04.prod.outlook.com (2603:10a6:20b:6fd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.16; Thu, 19 Nov
 2026 17:51:28 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 17:51:27 +0000
From: Frank.Li@oss.nxp.com
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: freescale: imx8mm-verdin: Fix I2C pinctrl group comments
Date: Thu, 19 Nov 2026 12:51:18 -0500
Message-ID: <179511062963.1527224.456768063376193159.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109180742.537977-1-francesco@dolcini.it>
References: <20261109180742.537977-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:510:174::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB11968:EE_
X-MS-Office365-Filtering-Correlation-Id: 12decc55-3772-4976-487c-08df4665bc80
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|23010399003|1800799024|19092799006|10067099003|11063799006|56012099006|261026121527099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	74+d4AVHDWKAiSk3OvXJTIY94iyQBPpOEqhjy+qkNFYFvhIF3+3hncjxTkLyRxrNcxoj1JU/efHck03embNZSGXzJIjM17LjddIhOFVZVNjOv+S59MoVW5UsPF8cHKArZvmKr3tkFUTBQfOx60GbgjCUsGq1zOod3tCtwYCdiTmQtKJxI8k19H3FA/LSHkHUJKJvisimEtCB7/FmSSsg7CbXGz3O/3X20bv2m7yxQCHtNZW72DCREp6X0iWuXKFjzCpbbWuLYMbbtnDGlQpgm2fy8Ut5NnaMiNfoMMz8ODwezInd4Xi/0k2SsQd8dQ6btW1fegF9HpCZpoXmcXMHTO9x06eUYmmVUia2T99EyjerUk8z3CkPii+I3aCNpTO54j+qoeRx7RJxHwMgYLuD6jiozY4+FHn0n/IscWvjW+R6C9P7axSsswjDA9gb0/NLQY3QMPSkoI8lMmOIoP6o9NDXE8ZMh2Te/ZinLf/Zq1MVrcTzuVJd7ctIWfs5kkW2G/WTm1Tet2h1XWj86pfgtalMse6BhjbffWLFxBlHv9p8qJeBakikJoKIJCp423acDv4ynJUJjGyrceERVCDfTXVqJf1c2HB80GtpApdKb/6zew2LpnegJVzhBO2soWfw7WnRPgA3066/lbU2LrBMZa78QWF9T21cgexKfOuclXQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(23010399003)(1800799024)(19092799006)(10067099003)(11063799006)(56012099006)(261026121527099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmVMK3F4RzBjMUx1eGlLc0FjVXdNNnc5b0hBdWdERFBqemthQlZSUUJRTUJK?=
 =?utf-8?B?QkQ4VS9oWkh6OGdhM2pFUTZrZ2ZEckNBNnM2S2NEd2xOMTVJWWZjTkRHVmJi?=
 =?utf-8?B?bFVSMkdXM1VxaC81Qmx5SCszM3JROTNnRnhKL1pZU1d4NG5LYnN0QTlYTHBa?=
 =?utf-8?B?QVJ4RmQ1eW5sN2QyQzRkeHQ3QzVBemc2UThILzZhVnBwenVYMjdjcEhvWnB0?=
 =?utf-8?B?ZVB4MXNHVUxBMGlzdEZLcytSNjd0MUN0R1pqTzNITTZDTDM0WTNDVXBNWk9v?=
 =?utf-8?B?cXZBek10RStyMHozTlpaZjFWRUkvT1c0R1hsZmFCU0dKeHUyMWJNTldYUEIr?=
 =?utf-8?B?cHZaRFZhc2d2MFVMUk1aZTlHUmRueVhTWmJ0ZENnNVZ5ZkZIdDZGYmNONWNw?=
 =?utf-8?B?cmlaUmFkSXBCaXBuM2p1djVkTVRCbmhUa3RTcU1DdWZtcXVrbUx6YTVKTDFO?=
 =?utf-8?B?R2JGNFN0SkRKczhQVS9LYVVndUxlR0xiVEpBMEx3NU41ZzhOU3NyNit3djRI?=
 =?utf-8?B?UmFrZ0xDV2Q5OWlENHhrdS9vQWZwRkxKTDFHZVhXYzRYWEtNRU9nQ1VCMEM2?=
 =?utf-8?B?eWg3K3o4QkF0M1lnOGJjQml6b2VqOWhJTVIyLzU2RXlkNzlDdG9OSzFlZHpn?=
 =?utf-8?B?bytVeEk5dmI4eHV5Y0NXVEdDYmh5Tm5XNDNCM29OT2FTNHdJTFdBckRYYWRl?=
 =?utf-8?B?eWRDREZncDhWdkNVcVIrbkk5RU9zTzh1R2xnd0dWMEdnUjRJaHd1ZXhPTDlQ?=
 =?utf-8?B?QnVMV0hOV2owZjZWYXJWUU5rMVdKMHBNWk9iRXNMRjRndU14VFp1SWliTzVn?=
 =?utf-8?B?SzZxZk80RjJPT1dyNkp0S2xlRWlsdmFZOUxmQmp6aEQxNHA4SzM0a0JnWENu?=
 =?utf-8?B?Nng3WUFZM2Vud3JEalRsVGxuWitSdW5BeCtUdWVKT0ZINXNyMDlWNWhmREVs?=
 =?utf-8?B?M0lnbXRwaHlpNWFBYUJsSVRPTVJlZEZYTTk5WU5rS21pN0JBSEtFKzBsY3R0?=
 =?utf-8?B?ZmppcGdEZG51ZFdBSm9HTWg4R1U2a2xxVDh4UGZ5a25CZUUzODFiYnNuUFd6?=
 =?utf-8?B?ZUZoS2twS3VFYmlZYmVLaEZiazJDT0RaYU4wa0E0M3VLaDNFOFVvS1djTEtP?=
 =?utf-8?B?SEF3S3BJUy9KMFRrems4YlNiMHpEZEFmOW9meG9tZ2R5cDlKMUFCajlLMnhx?=
 =?utf-8?B?UzZZQ3RvdG84eTIvbkZBaXF3RDdldzQ0d2hrMk9aeVAweERqZnF5dlgvZ3lC?=
 =?utf-8?B?SEgzZll4akNLM0hQS0doR2R4d3ZxUVIxYmRESDNqemcvdDdzWXhCbUF3WmNT?=
 =?utf-8?B?RXA1RkdCY1V4QThrbm1KUmJjL2x2WVMrSjMxOWRrR2lYK3FDY1ZnampiaFQ4?=
 =?utf-8?B?SHZheHpIanlBajR2SEpPK0xLaEtwdWVMLzdJcEt0U21vNmpVRU9TdGVHaUY1?=
 =?utf-8?B?RGkvc2VRcS9PR2d0V3orMUxTSDB3OUgwaTN5SzkyVzBCdWVMNm9GNlNOZUVX?=
 =?utf-8?B?M3FRT291blV3MG1vdjlnbnp6N0RPYVVGRDJsem9aaVNxY3RWMjNlTzUzamJQ?=
 =?utf-8?B?dEgrWVlBU3ZSUzBxSy94L3dlR1A3V1poWk1RVElDbXcvZzZNUTZZMmdES1dh?=
 =?utf-8?B?MG90SDVFaXZCZGpxNFZybExqMjVJUStDNi9ERjUxdzM2bTFxYURwY2lyeWJB?=
 =?utf-8?B?dFRkTzJEZWtjSTBiUHZScHpaYWF2OXdrRUNzNFAwOXdwdEhmdW5QUWpHRXFY?=
 =?utf-8?B?N3MrVkFObnpDTUhyZWt5SGhocTJXWDQ3SjN3aFN3SWgzTG0wSzlLeVVuN3Ft?=
 =?utf-8?B?bDNUM1lSdzZzUU8rK2xOMitCcXY5c0NwNVV5TDZqUmNPK2w5cTB1WkZybXhV?=
 =?utf-8?B?WkFzdjRaU2Zjalh4UldhMFFCclRvZS9WZkJuYW1tY2VlQXlLa2pJeW5oQkVE?=
 =?utf-8?B?OVZpNkZLK3ZJdUJoRkFESFhSblJqYjhHM2dZV3RoYnJxeEd3N3Z3Q1BIL3RT?=
 =?utf-8?B?R0xYbVZKT2t6cFJ5TWpSanpNSTkrTzdSUXBJcjhXNllkQzZUUEFCNmQ2a25n?=
 =?utf-8?B?OFdwM094S3gwRHVpWk1RZ1NoaFQvbmlmNDJRODVGUW9oSHdPTCs3OHQzbDRL?=
 =?utf-8?B?Sis3bkdGQkNuZzdoaURmL2RST0t5MGNtTnR3YndWdjFhYlhOY1I5RjhzSzMx?=
 =?utf-8?B?SzlLaEdNV25qMnRtemVlWlNVZkRVLzBnZms5M3k4b0NoK1NrQjREUXR1VnRR?=
 =?utf-8?B?ZGRpOXIyRjNqcEcyNlo0LzlSSENicHBwSFlEeDB2bTE2TU9tNkVNUkZFcHIv?=
 =?utf-8?B?YmpDTkVUT0pVK1hBeDNuUytpTGw3REZ2WGc3SEpxRnI3a282ZEVCYTlSeEF2?=
 =?utf-8?Q?VaLVZSjW6wLncuuIXEq6CUBm/kU6wyCpq0EwI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12decc55-3772-4976-487c-08df4665bc80
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:51:27.8970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRrVTVwZhUekRR9sIFvZxWueHeOT+DU0EWv55OcnA5PnKKtrAx8hS2sYkWHw+7AFTeJPA6fVuWffX6V/7FAUMJAURhDXfTvmS6fGDDEcXXalQJS/OJAvk+jIE8GBnY6q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11968

From: Frank Li <Frank.Li@nxp.com>


On Mon, 09 Nov 2026 19:07:41 +0100, Francesco Dolcini wrote:
> The comments above the pinctrl_i2c2 and pinctrl_i2c3 groups are
> swapped: SODIMM 55/53 is Verdin I2C_2_DSI (i2c2) and SODIMM 95/93 is
> Verdin I2C_4_CSI (i2c3), as the controller nodes already state.

Applied, thanks!

[1/1] arm64: dts: freescale: imx8mm-verdin: Fix I2C pinctrl group comments
      commit: 57f450b70c583310777d868d7b1e0ad98557499f

Drop fixes tags because it is not user visiuable issue.

Best regards,
--
Frank Li <Frank.Li@nxp.com>
