Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794386376;
	b=FRgcLMIPxUb/+aZ5VkD9QnJ33ae5MtOLmAFtwC9dOFxcpiivsFsycq/mGRh9UQy1KVaa
	 wg3zzH8b5nGjlNEYO1r/08eiXk8wXOWQUybHo0Z0b0xa88CFjq5RTDmn+wW73tLFZ2kEK
	 gZJzQd/8s3OsohXh5sYT6ABYIIWz6x5lWti0/2gC13gRlk7VIvHvhC2m68hMsdOD+eB2e
	 WyodgTMAlBIFae2l7QHRYKeytGT4KCVZTysOud9cb3UHItYJbsGqsGx+M7gRAhWf6V1GF
	 3rPvFdvPr0fF9eaGl4hIy7hs3+EqydsdE3dKj3MD9AMDz3Ncftz2DEZJcK1EY7EC5hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386376;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
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
	bh=a8PvAXFzpnCwhvRkssOOTGa5wN4Gxao/7OPpSVNZcWY=;
	b=PpB9o1h/94g2ZZnsvc2BlV19oPle9clC61R/W+AtTLV4kYd3bh7k6r9d7RQLoYOZwPpT
	 055wbKaesPTHzeTwNnDYC8GFWAwMQ/C87FfG3uzzYiaqcc49TnKWT2frc9GxnPkQWjxz0
	 +r9w4+hDzKpX7RWZWiUndybWG/CogszmspS3BQ4FpFPDx20CgrFVoCrs3AtJDFnMY5G15
	 BaAWcEWRZtBT0TLFp9xdIa8AezG/jgTysIZH2zcT/83EfqIe4ip416NFqGw+8MKDt4am7
	 lFwg1MFXmKOiXTdOMV+Ue+cPeUG8PHEcnLqov9LNGxzAe1SVdfi0cUTOoVE47wzdWPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="JIm/4mWM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.32
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579C2606A321
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 08:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 579C2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=JIm/4mWM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAIn3+r26rQtran6RhqWW7NAQJ8nQEI6oHJzljlk5szs4dBpAHAYmDB0wYcWLxDE10qTpN5Q/y048Uu9InKZPvWF4isG5BdXs+3ygzFC3hMiwES7roNGIbhw62cFWCXXpXcEdqHYEbxBh+r9thFnjF3uEtRSX+WMaAOa/7odoWUqmK4S6HRtDW0Y5iaZwxWbfXhXKmv6akpI63Zx/ma6aMJPDbxXlEoQo/m5VB5lMXsGJmBnkKz/yV9KzyaHaym0WSNRbuMgXeaP2D2vtZdkSb9SfY7xes8pQW5LynSICBaIgvVijnVaIm1F7gp3phTCCJhlwTd0iicQ1Xtin3QBLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8PvAXFzpnCwhvRkssOOTGa5wN4Gxao/7OPpSVNZcWY=;
 b=xZLMXiHqfjzY1DXPusWFG1SmaPpxMKGxfhgrE27oHjX88wjyDvXbZpcWQ+MVQ69aIUZt2nfbi3XveqGohXdDoWNeJV4xGWaRjOsaxWiWnF7Jzs3C+Em+QNZyA+eabUiiZW/G+mlPS93k8atKkB+2JCWpb4d3fTz08YXDgV6ykFuO0KxUYCwaYhLGdjOaW2qg3eAzFk+SjxdUXmQUs+SpdSW1bhnXKCIUTu4v9NnbRfDiVou3JjT8rMomeExm4R9SfHZexXNaN/Gvvl6LxQwrl2xrKqPMeUidl3s6xZjuFJ+x3X/QCbUt+rtD6Wsbi3eWA/MVOklspWc+s1LCRVBrVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8PvAXFzpnCwhvRkssOOTGa5wN4Gxao/7OPpSVNZcWY=;
 b=JIm/4mWMZ1Ati5z4i2NgEIuSZbdkSqY+UX0X/WxkquAEAKlQucNnQe/gLNGv37bQCBBjnesnQRsKGyqEvQR8C5FR9+UG3uS3qYMLxksDtrBgqiO2BfUhE80n4p2Qaq1S9ub98zZMhKeyKsxqzJ3/0zY/Rj+rBe3hhe641RH7fMP4qZnTgKljIgOYplQJkEwrxV0gMqCT1mvLMbeJIvRnOzsQWYxgiYzXVGhIbpiBCZ0xmuAk70xKIxrMxRDHtmC91Dz6wva49JnrM3xIyHl0SGt+0UB5C/W0RtwVxGo+i1s53kXoMXPoV8Bn4tCB6kZbPRiJZg58JfMMFVUKo+FdtQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by DUZPR04MB10040.eurprd04.prod.outlook.com (2603:10a6:10:4dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 08:39:32 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0592.012; Wed, 11 Nov 2026
 08:39:31 +0000
Message-ID: <23bdf173-93ba-428d-8415-107f64e163ba@oss.nxp.com>
Date: Wed, 11 Nov 2026 10:43:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: freescale: Add support for bytesatwork
 i.MX93
To: Frank Obergfell <frank.obergfell@bytesatwork.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Frank Li <Frank.Li@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Walle <mwalle@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alexander Forsch <alexander.forsch@bytesatwork.ch>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
 <20261111081150.950272-6-frank.obergfell@bytesatwork.ch>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261111081150.950272-6-frank.obergfell@bytesatwork.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0378.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::16) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|DUZPR04MB10040:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e58607f-3820-4bdc-9f01-08df3fcf4e02
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|19092799006|921020|10067099003|4143699003|11063799006|56012099006|261022105027099003|261022075727099003|261026140227099003|261028144727099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vEHU4sSmQRxQvkTHFtOVOqfe3LL8OjOYv/D9Z+rsOFfMh/5PPrM46s4DDPG1LrYFGCTMMmXBQiRa2jvIJb/iqA1QeM2UbHIA/xo5DAP9A91zzXYG+68U8cAjZwRz0zBEqlCdX1Rz7XapRQSsQephsZZNLK686vbuvANnD9X/gHMlQ7NSnUdrwInbULkyBP6YWt2ah2Cm2Oy3RwskmKQ15knR6dq/2yFP9v7TTXdkzV3yZ5Yj4YPz4vwjaa946ETPqbfVYxCWiPOZAagscjDmh3hKgrOm69JRYc56j4xio9ncs/1uwd9QL/Z1kqDNFBzzEH/UqmHlNV8gGYv7BQLFK5GfFJoRA+qTbAfdaaLWXEnJIi3tXi601w3AIfcYYvAHMLL0nnXtUb8y3LJ8IdA1zABXUjAx03Uja8RRoWW8ekeJ9ZSkfP1mAwOetb8TPwiVATdiERPZMxjka1uRO3yyogaCKD/X/U97fkHlAMg8+b9r3G2Yl55UmiryGuxdW2IxPsIPIR99nhvefsDVreWU5jNQr4oVyQWw1dktVDjU7DsY3Kf7OmybG6f0/JZUkUPHzLWPubcHLzP5DAO3obnkHfBKmfeKv6MefxBMhOam0PcjIM/lqvFfaJIKArXi5vMg+xMAxVWyHwyoFRRyL4vs/mst0oMEj18udcRWekzjHKjwayy7cG2rejfJriuP/u/bHlXtuv+984/jJyhzfI8SyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(19092799006)(921020)(10067099003)(4143699003)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261026140227099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0dFRzRrSEtrVW41VGRTVm9hVHMwWWc4ZzhpSE5KZVJIV3BlNjNOWHpkMHVU?=
 =?utf-8?B?aE1tMG1rcUhPbkxMY3paQ2FQdTlFakp4a3lHYWZYVkdoMnJkV0l4aE5ZYXVj?=
 =?utf-8?B?UkdONWM5a2tENWtKQ2hna0Vqdk4vc3UvTFdwZyt4eER5dXU4eXBaVjkyeXZZ?=
 =?utf-8?B?bkhrb3dUZmk3ZjJqV2VhT29BVSszYTRmTHJUeU54dXp6TGVTakVoVHpMMmx1?=
 =?utf-8?B?MVJ0TkZEUE9HaGtCUEx6bVdhTlhNZjVBMmIwekk0QXQ5Wm9SVUYxNEZYUGZH?=
 =?utf-8?B?ME1Cakp2bm0zdExOVERuekNuWGoxbmp0RnNhMjYra3kzRW43T0IzTWRsUWJL?=
 =?utf-8?B?Y3lNVzdMVzFrelFVTkxxc0NKSENVc0lCdXh3QzM0MFV6eEJra1FTam52b2pP?=
 =?utf-8?B?eWt6U0hSeGt0WVBXeHR4UGxwNnRhNnJ5TjduVFpOa25DUHZ3bTJFRkJya2VN?=
 =?utf-8?B?ODhPRzdtQ2huMmc4ODJzblNmdE1WK0R4VTQ4c3l1WkdYeXZKMWxyaWczZUc4?=
 =?utf-8?B?M21aRGsva3ptSllnUkVTNFRPMGtQZVdlTFM4YjdFLzBTR0FPaTREMnJVMlBI?=
 =?utf-8?B?dFdjNmhaa3Z3bmtnT1ZmcDcrWm96V1o0emNBd28xNDlibXlKMUdac05SSEFk?=
 =?utf-8?B?NSsvaHNWcVR4RFB3Mk43MFRKOXpkSVdzak5BZmdlMzNxdGVsUFFsUnlnR05X?=
 =?utf-8?B?bGtxOWpGZWtSZUZNTU9VR3NyT2hMS0dhRzIxcjlxUm0rV1ZYVkszbUhEbkFo?=
 =?utf-8?B?TEsyTzhFTVJDa2kvdVkyMGlralhmWnhtQUFyQkhHRlBCQml1eUFlbmQ0NmMv?=
 =?utf-8?B?L3lxMUJjeVNtdElOQWJLRUNHWkpuZ05TemsrMVdaNVNLd2tWZVVoVE8wZHBE?=
 =?utf-8?B?U0ZJUUVKYWNKNGZEamtnOXJqVDZtb3dpc2JWOU9kbkJpNkg1MVNOR1RIb21R?=
 =?utf-8?B?N2FYYytDVHE2c2ZHdWo0eFl1RE5pcy9UTEVMVkxsV1lXa1QxdGRYdTRKYkRU?=
 =?utf-8?B?Y0gzcDFpelU2QzNMTHBDT053WC9xengvK2JVeFlXcUtrdnRBbEU4Tm1JWTFX?=
 =?utf-8?B?UDlTbC94SENDZGlFTWFWYS9jQWpveiszQ05jODlyRkVOc3llN0Z2NS9jY24y?=
 =?utf-8?B?TytlMDBqb0hOUUp2N2pERVc5WUZxVStuSkw0OXVaTDhKSlgwVysrUzdVTHVY?=
 =?utf-8?B?NU1RbUw3RHM5dE9RVzNJM3lQbE1rb3FobHBNYXRKWGJYZVQ1ZmJTUlN1aS9Q?=
 =?utf-8?B?NFFEMmd0Y3Q4ck9KM2JKTFQwTWZPbkJjS21pQmh2UGJsNXZsdGNydFgxSnB4?=
 =?utf-8?B?MVZtc2Y1OUZHTXRTbVR3RTdwbmI4dTgyR0c5Z3l4d1QxMHpBaG93eEJETWFW?=
 =?utf-8?B?V3NsSWNaSTBPT2NEMkFFdkV4WXRNY0JUbW5aUTg2ZngyS0UwSDNzOWZBWFVF?=
 =?utf-8?B?UU5jYy91OHRKQmNWZkdQRlp6bysxSlhUSWxYcWtTVmNTamNqMnZveUZVVDNO?=
 =?utf-8?B?cHlkNUhRalBVWjQwNnZKWWFhWGdQYldYeHFPMTBqc1YyMkRjVWF0d3k1ejYx?=
 =?utf-8?B?M09mUjJ0clFSWmZDQWJGdzkxUExaVjhGWHV1Mml0NmJIZ1pLSjMzaitseW9B?=
 =?utf-8?B?N2FvQno4dndIK2dKdFU5Y1FTOVBBMDd4UkhEb3pCTExlNURPOWR6dURjZyt1?=
 =?utf-8?B?OE5HR2UyeWNLWmd0SGdZM3pjTU5UakFCN0NYdVQ1SEVWZzh6dnQ1VlA4cFNn?=
 =?utf-8?B?SXQzK0pzczN3YVgzYTBvUVYwd05pZW9UUFFVeExSQlFYRSs2SFN5ciszU3R6?=
 =?utf-8?B?QndSM2p0d3RsYmxOSHpLZUhSMitkZ2RJMlVPRHZ2bzBOZDNRZFF4ckVSMUFm?=
 =?utf-8?B?NFk4OFZFRGU3RHk0dlBGcVBsRkxJbUdaaTcxcGxYQ3NZZWNaZTFMSEY0M2l4?=
 =?utf-8?B?Z1BtVDhyTFBNTTJ4ai91TlpYaHc1bXVoWWFHSWtaZjF1NDNLTmFuQ0cySVlY?=
 =?utf-8?B?Q3BaR0JYK29scHQ1ZVYyK2c2b0xNUHd5MDd3RjZQcXBMZmpvc0FuSkkxTFdC?=
 =?utf-8?B?c0sxa2UyejhNdHZORVBiN2E4Nm9JUlBVZHZVRHBWVWcyTzF0N0dWMzhIVVFW?=
 =?utf-8?B?UkJ2SFc2RXBYVDhnWFdXdGJtdGNIMUVsOFRKTGFGdEZDRDQrTTE3R25IU1pl?=
 =?utf-8?B?QTJybys3YWgvT2toVDVJKzhJeWZlWW5tYXIyQ0p6Q2E2MGhFYjA0dUkxMmgv?=
 =?utf-8?B?R3lDUjZWYWFFbDNOQjFCQzNMdTNvcUVIV1hwRmRFUnM3WEQvcVVscFViY0Rn?=
 =?utf-8?B?T3p1WFpwbWx1d2w2dFdHSldjV2RJREZ1ZHAvWVFwbXM4TTNpVXBudz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e58607f-3820-4bdc-9f01-08df3fcf4e02
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 08:39:31.1682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNdVmiTrqfmHSWodoQ1KfwhGjKD7fXQqCrHr7PUCpSjUd9J7tTUoTGip+gPr87dyNh1tjsSjfeZhz/1xRy3lxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10040

Hi Frank,

Some comments inline.


On 11/11/26 10:11, Frank Obergfell wrote:
> Add support for the bytesatwork i.MX93 byteENGINE OSM module
> placed on the byteDEVKIT.
> 

[...]

  
> +BYTESATWORK MODULES AND BOARDS
> +M:	Alexander Forsch <alexander.forsch@bytesatwork.ch>
> +M:	Frank Obergfell <frank.obergfell@bytesatwork.ch>
> +S:	Maintained
> +F:	arch/arm64/boot/dts/freescale/imx93-bytedevkit.dts
> +F:	arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi

Care to add imx list here?

L:»     imx@lists.linux.dev 

[..]
> +
> +&mu1 {
> +	status = "okay";
> +};
> +

Should we enable the nodes in imx93-bytedevkit.dts ? Nodes
are rarely enabled in dtsi files. 

Think if you add another revision of the board with just one MU unit.

Another idea would be to completely remove imx93-bytedevkit.dtsi and directly
include imx93.dtsi in imx93-bytedevkit.dts
