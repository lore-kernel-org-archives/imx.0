Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013056.outbound.protection.outlook.com [40.107.159.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64EB3EDAB7
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 18:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773082081; cv=fail; b=f+iOiFfiwWGLpKBos8cDlBVwSNziM/KpbmM0bSceNNlA3qfYyVsLRPdT+MAi5aBpYCjP5BGyHrKKy6DeJGXwZ+44VeWdo8+rdgX7CRPnumbe21KirSWHGjBWa+UdyM35cpCuLBir9hVSGgjEYBaIkLT8Jlxsw6egD5br3cSvW20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773082081; c=relaxed/simple;
	bh=g4a+lqu2zvMp0L3OcekhRCUP/WX4vF2pxo/0tg+KU0c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=ZW6hQ9WI6bkzdy76kiAaY8+Aqb3dLQm3bbUFFdPbiftiXEoQP1UFAJym0/P2L9mqAfBOqKRrxr3Fht6XH0RGW0NubzmYEMgcHFtKQ6zYkIc4eirEXHSBP/XQfAhGSTvNMxsTWZzvyGp2nhbCYtr3+J9xO9xXdR2gGvlvLdjMi8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kW2wbAYa; arc=fail smtp.client-ip=40.107.159.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kW2wbAYa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KIKV8dlRrZ7Bawe67peeO0pKTBoNKCMx0x8vnzbg+PZeo1yKO8jaHg31xIABcrZkBKU7UxjJ5gCX3vMXQX+r1l1iFSg7/xqoDbX+nc7qxxSnMOJc7FrEAX1naD/GII1gXIrxUsnHQIs5WvJhs4KXy5IBhvjeRXp0jCiSGlesDl8PGONNu5n5Fk0vssosJFICyfZd8HlpzhAq+TCucBK2HNYRusQbwSWevR4IN0I1KWq5vrf6CF9QKds5n5uYaWFaDSiYGZ3/QpaDulomh6vPPwuIHSMaHMaoZJV9z39FeCyPtFh6bRM1ktgm2yeCImZU2w+kIJ9zXPqVfOnEZtpB3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKX6XUzG7sCInsEROPkR+IhfOuSiataA16ULuVXLrHg=;
 b=mazrNoky5mxsGV4gXSoHSjDLVGTXRASBgUg+bgLOKhltjoZz2XltCtotBz2h8rfVVu0hzrnlGKTqUOgGzxkEo9PoaX/dW96FuvVQgxRNM7vjSCrWoOAPGkiV52M/7DVpNsoPc9SjMfbQbhzoYSJGVH5KrFzkz3L++bzVceUiSgYFt3XZEXfQuCMIb66E27aivFyUcJM2vEmXclwdBwbuIxVWxby5F9yNZCa3qpQRJWCioLwVNBRIYsozPfpoFSz5wjmNbFtoa8DMyJVpgm2LbBBjhCHj9RwO3lcan4VWbizK1Slt2rpe9jGdWUN0YtBhK0ePtgiZiBGWO6tqSPm5Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKX6XUzG7sCInsEROPkR+IhfOuSiataA16ULuVXLrHg=;
 b=kW2wbAYaSMWsxrThqv4Wsz2XAndGZcJYqnJ9DOXTd+yJK6uAGmhsYiolQx3gl1vLR6aPUQ+aRrrXN2Vl1x4j4hBeRxfpHeUYYUDLasN92UNfPP70qF6qRW4AVR2LLW99Yqo9CH87ymBFA8lzv9jBfOXIFWJtsWDBCBZ+SmYvpQ8ZCRmkHxwnI8Gpuvs9Rs0cOj2cq1ts8rj+l48UBC6GsHejqS1TB7dEAUNIEDleOhiwMhCXoJxq26OIa5QtdlKlX1+gdTK43Ud7tilb/LdpJfl5MlpUSy5gtXSH/q3GPjtFaD/ms5V/UZmaSD4F4ULta3vcfIOHV4zIXaUwLxZsAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by PAXPR04MB8173.eurprd04.prod.outlook.com (2603:10a6:102:1ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 18:47:57 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9678.020; Mon, 9 Mar 2026
 18:47:53 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20260226201949.690681-1-Frank.Li@nxp.com>
References: <20260226201949.690681-1-Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp-beacon: remove fallback
 ethernet-phy-ieee802.3-c22
Message-Id: <177308207473.1760859.4251564187265288570.b4-ty@nxp.com>
Date: Mon, 09 Mar 2026 14:47:54 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SA0PR12CA0008.namprd12.prod.outlook.com
 (2603:10b6:806:6f::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|PAXPR04MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c3a2a4d-2c7e-41be-be7a-08de7e0c610b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	UTNpq8FjPXGv24tiK8vFnT6OHAOPC5VTFbmvVfhGspXITKcmQ2U2p5zd+JHXEn4jEPcIMIAkjKa02Dl6/c8ePtEHFlh6gtwKq9w/z7d1V/vH1J+fwtJ3oPzWtN26zHdgOwKEZVGPXkK/wxQU753sCd9nJVo5yIMnBP5bGbDrnfIr9b9YAHWu8heYRG7n9shrGG0WY6cblpI8m7ErYU7XdPvzLxtmYdYrRvNMp6HZ+AFw6v/swdv1dcWFvG6+Zhvw9HWO4AGc1ZMpjMNCQP4TThMSvybD8XVXPTFcLEOTW9n+aDnODK4h+/V7s/fAOgSWBEMfCcR+KrNPsdT5F31ahtI0LKk6HvSO3MLuQ/JhclAODvoRYG7mwqy2Yv8bDrOCg+Ivdulzqi0aMw82rhybXt35QYRyhBexOoCx6y6pna5GtjVUi9c6PBpvC6l3cGGM0ZVoAWhA6haFoBbvy39d10SrART9cXzJbiw9r4Yznf8XJ21Fz875r66ZUCJZFVSWz9H7bd/lXiqDNZNoLOasr4ELeAxFISqmwLuJgeT1adkBFi+Rjgmv4D/WAdj1gfNknjRvZMX33UG8L1tW7ueX6MsOkWBufPnpkBfgu1tAw1lsvbXzbG4pTkj8ZWLOEBpc3xmYbsbdGapASEpcdUTXw0wYkCjKCRJhx4X19PVCZBuVSjHAR4DOCUg0Bsy1HKGK2sTN0ROdgjflkut7IPXAm2oPRimOK/ILDwov58htHEHbzvlhdAQlRzyWo8g7BitDPTgbSKHdwuKYpbDjscB1rg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDhSck1seGZ0OGx0Mi9ncUlucHBkS1Q4dkpKVE43dS82V3FQRkdDUzVTMmF0?=
 =?utf-8?B?MGJsMlpCc0ozNDU2MExaUW85MWlDQzhtM0g0N3YrTWFWck5NYVVMZGdIZFVJ?=
 =?utf-8?B?bEhKQUoxQ1FSUitYTDZUYmVhSlhiNGRSdGFRV0NiMGJQZlI3Y1p3Y25ORmQ4?=
 =?utf-8?B?cDc5cU1sY0FsaFVFTERiZUI3VGUwVzZEY0U0ZDJQWHFNOFgxWnF3WlhmdWk1?=
 =?utf-8?B?bFM1UEVMOTEvcVZPSU43SC9tR3pJZEpLS2RiTXMrcVdNb2pESHdjNDhBL2JM?=
 =?utf-8?B?SklxNklqSDdOb1dWVk1nUFduOTBqcTd1SlRHOHVNRkVxQVNTS3p5WFc1ekZD?=
 =?utf-8?B?aHhDME9PZkZLcUFaNlNGek9rdWRoYWR5RG1uNGtya2R4ZTBnQVd1cWVhUHZS?=
 =?utf-8?B?NlprZ2NsZlBnZVZHSUhJMjZPN3djSTZrUnlOZE1RbWEvRG5HV3NoTU5qVGND?=
 =?utf-8?B?SklCOVhsa0V6cEtNVW9lbE5qL2pXS3NvZERFK1M1WGRoa3NQNEgyYWxpcTJ1?=
 =?utf-8?B?R2NSV0hCdG9za0RmVzI3ZFhnL0phRU5RelEza1VGdS8zZGE5UHhydjlQbk9y?=
 =?utf-8?B?YkdxY3k1M0Zia3NrKzVGMy9OYWJtaEsvVy9Ybjd1TkJzUHNBQ0FEOU9Sb0FR?=
 =?utf-8?B?U3ZPVTF5S1RZZnRPT2VoR2g2RWJSSUlobk9jTmR0cVl2NG5UN1c5QzU3N1NW?=
 =?utf-8?B?VGptM2xRaS9sL283M0ZvWUlZbTh0cFp1eWpRcytyMEpXTkI2eU1nL21VdjEx?=
 =?utf-8?B?UjZoSU1KdkNPZ0hBSkZ6T01zb2dJU1RHVTluSkc5YUc1L3BkdDFBSlJUYmJB?=
 =?utf-8?B?dE5MeFRubjhzSGlRWGJsRS9lSWNxTDRZbjVYc1I3aGUwcStMYWowaUQ0cXpP?=
 =?utf-8?B?RlFESzdvamFQem5GcVNFVnJwY1hrTG1EUjVlMTFqbHN3NTlnUjVrbnhRd3VW?=
 =?utf-8?B?VzEwQzVsL2dxS2Y5QnhONCtiZDdCY1owSnJmd2Radk5JdmdjUTJ5bTNEVkw3?=
 =?utf-8?B?ajJINWRWcmhYK3lGTVBrRDFWaFFhQTJZT2IvSkprNHZkSlpjYStVU29Wbkg4?=
 =?utf-8?B?aW9NaTZDcTVXL242aEtaWUxwZXBBYmlCWHhxSnJLdkt0S3d1OTI3bC9qQU5s?=
 =?utf-8?B?bzdrZEVCZ092UHR2OWM2RG9RSEpVa1lENUU3SFJvR3Avb21GbnFCZyt3WFBJ?=
 =?utf-8?B?T1NVTHQ4TWlHMHhpTW1tNUNSOUdYdkZ4eXFPU2FaL0NxMkx0QVVwaEMvUVNv?=
 =?utf-8?B?UkMwSVdCbTUvSElmRTZSY2xDY0doRWZvS3VzVlNuMzdHcVdYSmp2TDdUcDVL?=
 =?utf-8?B?cGpoWnFiZzg2MncrOVIwWXdHOGhacEVyV3lUUVB5Q3VqbkNNVVdHc2Z4NzBE?=
 =?utf-8?B?REI5eEJrMDBIQ0Z0Vlh4dmwrMVZSVjFLckNncEZJZWtKV3Y4eFc4T001N0tT?=
 =?utf-8?B?WnM4M3gxL2FDRmlneEhIRnNsdWlHN3ZwNmNMMEVRTVlKeTNWNUgvdVZiZy9O?=
 =?utf-8?B?b1pMMkM1ZFpyYlpvSzZlM3FtZ2d0WTZHSFZnWjZoMmZYV0ovUEVMRVhscEZG?=
 =?utf-8?B?QkZVaE90WWlFVjZleFJzcDB6cXVJOElJV2ErV0FyT0hsTWNPNTdsdVNId1A2?=
 =?utf-8?B?MTEzWUhKQ3pSanVTUmRxeG9CZ09xLzlmc1gxY0lqN3FCYzdvcFoyV1NFSk1I?=
 =?utf-8?B?NFRreTN6MDliaXpwWEdwek5idUtyeXlqQXdKOWllYUhCaVFSLzYwYnJPcU1i?=
 =?utf-8?B?N0lUSDV6QjJLNk5rZHErUVJ2L1NoR1dQUDdJV3h6T08wQU01bW9rbWs0Qzdr?=
 =?utf-8?B?dExvSjZ0SnYwUUFJNEZCV3JUYzhqOWF3SkczZEhldytJdCtrd2xwT3ljc29z?=
 =?utf-8?B?MTZoYTNRY1hNeThDOFo5NXArejAwaHU1ckhNTHdyWUl5U2tsZ1ZqK0JkcWlD?=
 =?utf-8?B?VzhRWmNlMlo2WitOWXI2N3VtZWNyNDNHMTZyTldtL0xlZTVjOC9UK0ErMS9Z?=
 =?utf-8?B?aGE3VEFMclRBNE1jbko1U01oSDF2V2RTTFBMMFlDOVIxbWNLaXFBemdEYzZj?=
 =?utf-8?B?V3FpZWJLc1cxWjVoeHl4d0M3ZSsvVjdtM3llNnBzYmZJcnl1SEZkclhMbmxp?=
 =?utf-8?B?RkNBQ0pZbjgxbEV1YkxCMy9mSWlXbEFYamFNOC9hVGFxY283ZzVoSWhCNlcw?=
 =?utf-8?B?TzlEWThMbGt0Zzh0TDNQdUZPcGZrMzNIZHowTjJOZVQ2N09xbzBubmJMMzl1?=
 =?utf-8?B?eUxZR1JZa3oyZnh3OVlUY1U5NlcxbzhnY3V4VGkzekZMZldFcjlmcUlOK3Rs?=
 =?utf-8?B?MHdPVVNOUFZsVjEwei9BYVgxK1Q1alE2TmZzOFBuMktkSXJCTzJFZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3a2a4d-2c7e-41be-be7a-08de7e0c610b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 18:47:53.3678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FoS0/EiDWRQpX1OUSaBsfiVl23ZuDIcwMNrZkRyJLBT1KASAeJEjKaZgUww4ylS9K8Ayr946kRo0I4rZJE9rJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8173


On Thu, 26 Feb 2026 15:19:47 -0500, Frank Li wrote:
> Remove the fallback compatible string "ethernet-phy-ieee802.3-c22" from the
> Ethernet PHY node to fix below CHECK_DTB warning:
> 
> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: ethernet-phy@3 (ethernet-phy-id0022.1640): compatible: ['ethernet-phy-id0022.1640', 'ethernet-phy-ieee802.3-c22'] is too long
>         from schema $id: http://devicetree.org/schemas/net/micrel,gigabit.yaml
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx8mp-beacon: remove fallback ethernet-phy-ieee802.3-c22
      commit: 8c01f0df85c1edd58e8a0982c9f57a1747ba9e1a

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

