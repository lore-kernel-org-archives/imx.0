Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013061.outbound.protection.outlook.com [40.107.159.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BBF2C3768
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 15:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784302674; cv=fail; b=aX0BP6XDst7e0wpUzMaS+DUtkTG64l+JBFKL/RfLAaZvTFQsn7KlTq8XEjMnRW8PUPS7H++noQSifG7T/SJLp+cksnP55yG9PYJp+ZsGQcpwXO/pnGIcyDUkuLlH90iJ0Kr+DqnmPtNg95lZhw8qhq8XByYIeTOc32D6flSshC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784302674; c=relaxed/simple;
	bh=MFQlZKVhtT8zOn+TqwFv8q0cW0TL7wAc5gDUACxyhjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qCX4+m7t+xqpnZiizmN2PNE4OrCyYVsffa3x/jJghZs88yS9h7nFiUHTfvstX11VQV9XljZ7NqAUs2ab8TYl2z5R59TZzdIbchVaNnJjrEx927USQxgNXMNdb/0oQgwGo1fw+NB51rfD4E0kpJWqV4xrh61tcR2G/Ox25i0mY8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uunlp+EI; arc=fail smtp.client-ip=40.107.159.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uunlp+EI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPMpnOJFwgREjkzSb3X8dGOJYdYhaO1MuvTeNjgHwGjSIGGAYcUyNhyEjrojp1t0elUkQKn4V5MOrvXmQVlag7Pexpqb8CbkGjvtTg58VFh1bNxec8ocYKa4MhQaR0w6gXcPUT1xlC/gZstjOl6F9wq67sq4l0oPUTE/jkxtrxyb7PEZCVkXm6ZJ8c9kJIouOwH0h538hHCElGzausEC3FIkgN7N/1uDwrYoBhGxlLyiZ+OCbzGpy9FBtfJefdFzYSuLhHwKV0SXWHEItHDCkCA7VyxorQxSzpCgr8Ug5bgt/lLDMvnIflIC/wvkd82u9jwSDOIbPg3O8CX4y/0nKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwW0H4K6wGmDUJp/zZ8+oIbhkO8qU081w1XSrGf787E=;
 b=cqTNwfT2rL+Zpmv50ZAI6+GYJv4nEtqLpj7BX+HMRG+HA+ohIm0jFzB2PsPgFBeng51T6D14r2xF2BRYTQy3zz146c6yMtMBjlwHjAx9eCgeWnr3mPrPorYvNGtmImQtMji/i9a+cBPFEmg2FDBe8yFgG+/G56bqUqhlvE0EPvVk8SMDp0LhKRMV5CGgGxEfhtwKGjs5u2m8e7cNUDqba1hBv3+4SvK2vorFGePxjKZc+aOwarHahozoHuzNAlfYHi8UXM5s7gZaLqhrQeIn14SEbs1JyhxZ+nvuwIe9tAD9V0MZvrz5Lz8NmbzPa/Jy+pSyvxUO7UkUo25KDJYkwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwW0H4K6wGmDUJp/zZ8+oIbhkO8qU081w1XSrGf787E=;
 b=uunlp+EIGeMs0KzZRWY/gYTxJ7DoHvbUO7EF6eZ03aYVJTTeZcg+WCIbZ5c5nXZwh+rzmI6UGZt1RwdgM3w00zStjuRYQRyNU/JBPiztEMQNBv53R0upX/u4Udz4Zw8qyJrVEHsDsXXzaNieTekF3xfiTaLPCuDA7N/8jGLG96YSH7BdCNgkRiA0ozUpm1Olrxj1MlRK1vIvkRVq0xoJ15FNvA7/yjWRgqFzmJD+t0WGNWN/5kiHLUAkv1ZBnuqXJVouHEWeuSqMFbJ7pFFXTjQ4f1G1jCH40pOEAnLMIbXotIFvFsn9v8AvuSdZLMpUUIQn4q+zBUagkPwU+kEzqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8779.eurprd04.prod.outlook.com (2603:10a6:20b:40a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 15:37:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 15:37:50 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	haibo.chen@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx91-9x9-qsb: add CAN support overlay file
Date: Fri, 17 Jul 2026 11:37:39 -0400
Message-ID: <178430265551.588272.17200512442296766716.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710-dts-imx91-can1-v1-1-c78c9c378e8d@nxp.com>
References: <20260710-dts-imx91-can1-v1-1-c78c9c378e8d@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH5P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: c632f4c5-f8fd-4dea-3a96-08dee4195bfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|366016|1800799024|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YRgqbCrp3WdMGOqsHI4UXj9EHmEwZTt5jeL6FWiAbgXh4QuTLdgVHP3FrOPKWNukRPRKbSPdixpl7xKryLprZpWu24totAFmJX6lRMDpihvwy/dPxIigVfgU6iVBZbHBu6YrfoYwW/wpeITsLi/zDcBI6GQ3g7oZNRVCBHHCCb+i31rRWkb/rMm8dQPrGAm6pz1yYi3XuAryIfwAMOZpTMBAF64FMl3VhEia6rF9vegMK2fxRNEzk6umODZqE2zlqAzTFpHH2tjYBYdIEXJzQVV53Eanc96XQYYbIKeirshJ61x9xIh7ZghlHaEcY51FpB5lxdGDOTNKwRVLbBulm+esyafw1ntWgSdkKmXgGnw4pC3FjXNcSvRcr0ByqWhjSqJWnAsD1h24S0vaKBLTyz5+MK3MmV+HEFc5X16PN2rm8VUMEaOXHdz5+pprp95AVcb1ywAJA2Dhoy9Qhz9HyYCAl2RgVwAGkIbKBb4jBqLSO1BqHCKFOfyOUXrlE7BjyxQ+CttPHzWuNfkPeDvefD+VIytcGDeLe/ZVECjlk8BE4ShvkMbA/uevTjSWc5L1P4IinqcSK0x1+OTSoQ6UM0fesXzGd89NrdT9/56NcJ+Th+xzOs8l0mKrF5YAOoEcJR9jUWexUy4cICOrHFWuJKzkGl5VQ4fVyVRZVBZ9zQA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enRYSXo3K001NkhPRnFaR3p6enBWSG1rQTZ2VjZOSm9jbnFKRU9GK0lTNmg5?=
 =?utf-8?B?T2txQVd3dnl1aWcrT1dkZzUxQ05SdFRybC9wdW0xWnlEMDN2c1R5c0Rnd2Fi?=
 =?utf-8?B?Q21ZRHU1RVRvSGptRkM1UUhPRU5NVHRZM2tCdHdZQVNXUE5MS1AzdU5tSml1?=
 =?utf-8?B?dEhIbzhrdmpqM3BjZk56ZW1uLzlBNzZHMG0wNGs2K04vRFh0M3EyTG1vWU9E?=
 =?utf-8?B?VERSazdEMlNvZFA0dGhqcUJqZStDa0lObGJkckhXRmx4S1hHYW53bWVHU1Jr?=
 =?utf-8?B?WWZ4TEtYNGpocit5TGh1eEZpWGJ2ZU15eDg4eUs5aFhmV1R3RWFPQnBpYTVP?=
 =?utf-8?B?RzgySm1DWGFrSC95cENoMVpKT21NS3hZdkR5UXZUVW5FWHNHWFM4MjNleVRR?=
 =?utf-8?B?Q1BoVmlFSkJWQUpUeEtaajJvS0VWaXlNRU5nM2FFd1g3M21Uc0JMMjhmeXFi?=
 =?utf-8?B?Q2ZhMXFqL3RPSEp2S081TnVBR2U1MFdQMTkyTlRuekMwU2hvYWVDYlJmNFRv?=
 =?utf-8?B?VStyZytjTzJKYWJtSEEyc0pJVGd2QXk1cjBzZktwbW9jczFnOTQyNUthdGMz?=
 =?utf-8?B?RXFKZ0RVY0dOZzgzODMyQ3BreTRUbHZFZ0lmVGRkeXZjb254UEhyaEVYam9X?=
 =?utf-8?B?YzhKdTl2STgzbFV3NXBoc0JTTitIUUNaTFNHNWNjdEtKYStXd0hIWlZBbHBP?=
 =?utf-8?B?SzE0S1JnNmFHNW1lQUJkRWh5SHlJTDFMNXRTT2NpU2FwRWw3WVQzRFlwang5?=
 =?utf-8?B?V1JXQ3FhdjhTSjZ1L1d0Z0hwaU9tVWtxOXpkcWpaU092TjE5dTlXWGU0aGVv?=
 =?utf-8?B?YmlmbXZWODZjbE5FLzBoQTlIckdyakpOOER0eUtpMnF1M05jZHViekRrQkRq?=
 =?utf-8?B?bDZYeGlrK3ZnaW9TNzVYRWZGK1N5bm9TQllFcFVuQUVGVDBXWlpoTjZPZ3Y4?=
 =?utf-8?B?Rk9tcHQrZ0M4TTJZcFJKLzBsMGtaSFA2VHEzZHh1SVFoejgvNUxMdTVLaTgy?=
 =?utf-8?B?SWF1RzkxeU1mb0NWSjNiMXowa1ZEQXpHc3EyTTRacUxKQk9zNktyUWdlMkZ5?=
 =?utf-8?B?VXJPQjdxNlFIUGQ1U3k5d2V2aTFXZ1kxSTB3YWs1cW1EVWtzdS9wUWhJSU41?=
 =?utf-8?B?WDZBT1Q4T2J5ZkJGTktMNlQweXBpKzlITkkxMFhyOWF4NFVrV1FHdyt4aFpO?=
 =?utf-8?B?eGdMN1RDbWpWUXA1WmcySFhPbE9XNVprT1RncWUyOVh5Tm9mVUdINkVWc0xP?=
 =?utf-8?B?UXdwNS9FYTZ0TlNWNFR5MXIvcHc1NkNiWE9vUTNadEFLaDg0cEdFRVlPUllu?=
 =?utf-8?B?aG80UFdvYXI0UUcxa0MzVG1MT25IR0V4SDdvc3kwMStid1h2VmROTXpjZlhm?=
 =?utf-8?B?SEZBdUQ1RXpZTFlZc01aRVVCTi9nV3lFNGEzZExYVmRWQklKdDUvRmI0a2gz?=
 =?utf-8?B?cXplaHNRcGZvQUFZOFBiK3Y3dkpTYkZieXR3K1hnbEQ2WUV6a2hOZFpjMnBn?=
 =?utf-8?B?RUViajdvb2R2QVdYZzUrNC9TYXRlMFJ6cDlJR05tVEpTcS8xTHRLY2ZscHdU?=
 =?utf-8?B?M0ZtdTJLOXBDbng4ZmpDdytRcFpMSzJDWVlWKzlMSVlCVEdEblhhNFBvYW5s?=
 =?utf-8?B?Tml3am1RYnIwTVNHT09pZWU1T00vdWJoYk5aU3FRR1A2R3l5Ulhyd21iYlFx?=
 =?utf-8?B?Mmg2b011WGZrWkwwaWxFazdSVm1xT0pMQWN5dEVvNzVsVjR4Qmpsc29yTlh1?=
 =?utf-8?B?dUZ4VGtwWHNMWDJiZ2UrT1RGdlc2dy91eXVSYm1mSVVKSW5jZ1lrbWlxYWxt?=
 =?utf-8?B?dkZQdXBld3NuTURNclpQRmhLeFc3QjdkdTkzejRqdkZOWUNrM0RKbGRxbGI1?=
 =?utf-8?B?VmhNald1V0g4MW5Xdy92cGlVWW1tc21MemdRa1YxUzVxVmJiSGQrRDdNY0hP?=
 =?utf-8?B?MEdERmRkZUxZYVZsRTJuaGNSNlpDamlpdnpNQVZKZFdIaFRCZGtIK3pyRkJm?=
 =?utf-8?B?WStsMHZ0U1Y0cEVUVFdxNER2RGdtOVE5QmdFM2FnTmREM0l1ZlpFQi9GUVU0?=
 =?utf-8?B?dXpPUWVqcm5SNVNXQVBTY1BtNnI1Q3dsQytxZ3dNbU8xMmFRU3o0UDQ0eFZ5?=
 =?utf-8?B?djhNa1N4UXFXSmJ5NHcrcHJLd2VwemwwZkh5Ymthcm85cXhFcE5HSHRia1FS?=
 =?utf-8?B?MUZCUzN1UndmczlwN25Hd1JqUitTWmpVOUovblhXSGp3Z1JJc01oK2JQendl?=
 =?utf-8?B?V284KzdWM3EycGZPSTN4dEVBU2NyUG50TE9zb0pzb1pSQ2lheUwzY3hoSU1x?=
 =?utf-8?B?aEZTaHR1d3EyV0x2NkFlNE8yTVhIZ1BmWVUxdkV6M2xvNFI3MW9CaDh6REtt?=
 =?utf-8?Q?p9jK8IWM+XKfCDb1B9JmScMvyqaMFS+M8Kju9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c632f4c5-f8fd-4dea-3a96-08dee4195bfe
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 15:37:50.3724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egy7buvCIoPK2iZ0NyeZfFNDi3bIUj7Z7ovmRQBfljaYbpD+B/TunAMIm9TrGY/Zmg21jH9yDZvQgIncDZcjrTpAvKiUr6fM3OLe6K5zhFDxLPqChz/xiYdiRJRswu1x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8779

From: Frank Li <Frank.Li@nxp.com>


On Fri, 10 Jul 2026 18:12:20 +0800, haibo.chen@oss.nxp.com wrote:
> On the i.MX91 9x9 QSB, CAN1 and MICFIL share pins. A TMUX1574RSVR
> analog mux controls the routing: when SEL is driven high, CAN1 is
> selected; when SEL is driven low, MICFIL is selected. By default,
> SEL is kept low.
> 
> To enable CAN1, SEL must be driven high. This is done via the can_fun
> function defined in the pinctrl-gpiomux node. CAN1 uses the
> TJA1057GT/3 PHY.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx91-9x9-qsb: add CAN support overlay file
      commit: 356894c37aa1f8ab430cef5d69176123b0ec98b3

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
