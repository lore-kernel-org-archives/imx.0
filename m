Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794431192;
	b=qm7JHfMY+GUQkp/vl1wo2LxhOn9fG5tgu3DDOFyJAOlWRAXmOUynTkfAGr8ijWF90lTj
	 hIvYQ4DgDNE+f7JbrvYjHwJWfHEEnOfWp9jOJKZG8EGcm3RztU61g+QPDmwcYIDdYwE/8
	 NFr3k7PD+5rnmZUMlPIqiqVMghbmpwj2v3rSmTA1DukRb1MnXW5cvjeodGTZ9cnYgU9hn
	 g4G+1Sq1RttpqWDmVyNxpUNXD6tzsiZwMRNeFYvzKb9gLFEyDblWakErCbYwYtHCIh+6g
	 doSt543f6TlcupeWIDXkEyRxHspq7GaAGQVeqbKOHqiTfnsDsGmiX+s+nUuY2Hx7ytw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794431192;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=f/EqXJgbMYz2COUGyhgscvwVvUXwFPqKfZlX557DJ6g=;
	b=jfoyIXHRd8VWMS4/xYYlg2B00P+63suZmvksY3JcIi5BIQdrCuGKkRbcMt9txIyu41ag
	 3fT1x8dIJvQYQ3AJAzl9E204L5TWaETx5jRKnRD8nKu3W/rbtuqIS8xT94O6twaZXcLVo
	 yfWp2IbcgZxOfQVL0HAO9tpyt1y0UPG5lo43U6gtWpWFeNZLZ1n41s91utbnU/pd4i/Hj
	 M1qly0RF5W2304cS0xIMIxlWGaVuLdx/U8JebTMd3tW1Olhuvm4W8Jz4+6Tsh2f22t90I
	 /WEYY9exnm+hh4qr8c3FA61QT4OoSLLl7SaNIIXmbpPhAcad8FcKGPgUxuZkLgH6KGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gsKPN+Ie;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.19
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013019.outbound.protection.outlook.com [52.101.83.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD3A606A324
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 21:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CD3A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gsKPN+Ie
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/rrCum3kDOUdZr11DXbNSbaYdGdwQbCCWRBr4OSeE76r5RcIty3fdbe7u8Vu8Md+YYZIsGWfxBLVFSghKUbHq6TTSNjQfcU6rOrE85NRfdzhmkjko+vp5zAzMYNmVq5dMx5Yi1u25AoqfYVS2Wz5YswtPIpUHGHx8/QvzrYRajV3xm/c9a8mjn8XlDoT7aQHFTC+N/bcdOXdX7Qm66MQzonSCUd90JwAZ0Fma7sorqAgrvWTPsiKe4NUCAVd2UacZWVpUxiHKhTsOvhsdc98H3El0LEK4T0pVrm/FkkyHO8Bqh4K2paNAsoDzZ4sgbudT7EMJJVCju3DWfn1JoiuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/EqXJgbMYz2COUGyhgscvwVvUXwFPqKfZlX557DJ6g=;
 b=WbuIxbrMW1eEd2pmmrii3YgJhUvWxC03YFDXYTnW22Ptd/eWeTe2CbwqNRL/N5lqF735pO6anFl6mpxQibBsmjQ3od9ZNEz6ThW4DvnBIGpIiuTSpFLkCsshMUmLO1/vfJsgsD2Upv/bObSRGLWfnaI/2hlXzIfgOsuQjYEmVlmW+C0r+OquiYaxw/VgC2gSxMZfcmBpneVAbGEsuOWEsXq341N0WjdE5BdpKoTSDnCjcIu6c3IqzgDJR4YEWZbWOE+ZEQEVRS0c3mjwQvcGJDTTCYJjbzqhHm8l/MbEp4gfDC5k3lbHOy58+Ij4gNeOUuuVf5BH8zq1xNm3EElPqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/EqXJgbMYz2COUGyhgscvwVvUXwFPqKfZlX557DJ6g=;
 b=gsKPN+IeM/4VNr+PburfUyqIfu0ewf70D5jyx5ZMY5zPkOqLReZFoJZ3t4MmuOJm6MhY3uG0YLuIat2qp8+fD41Vpi3ENCOHKvSSvAoSxFE90YSOi52u1SMetB0C3ide/LK5A+sP/cPE8JnVvukWpnEsCjWTuNGnT0+H2nonOJGz+RQ+TC+yXPcobmlwHGozHCCqjLTeNK2qjKNdCbo7+DZEVdhiM5RSrk0RZneS4kZVNaStWHsvEO2YSmzlP2Gw1oHEUcxDPp4fT+Wtc1h2SfUIETJN28Mu9dGiYEVish3wp22PVmlUjln0xGCJZINFCLQ138zs9cYTwoaT7nMAPA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV2PR04MB12631.eurprd04.prod.outlook.com (2603:10a6:150:369::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 21:06:27 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 21:06:27 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V6 0/2] arm64: dts: freescale: Add chargebyte Charge Control Y
Date: Wed, 11 Nov 2026 16:06:15 -0500
Message-ID: <179443117284.3974627.5142202175025580154.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009181551.6478-1-wahrenst@gmx.net>
References: <20261009181551.6478-1-wahrenst@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS1PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:8:44f::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV2PR04MB12631:EE_
X-MS-Office365-Filtering-Correlation-Id: 399e50a1-f1d8-4fc6-473e-08df4037a6b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|366016|19092799006|1800799024|10067099003|56012099006|261021121427099003|261009223027099003|11063799006|261028144727099003|261026140227099003|261022105027099003|261102123227099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Y3ytoWkr1w3L8n9Y6YZYFTCCr/Kuk06rOYOxgD+sjkffzYvCL47jVp7/QphKbLgX1b4SC0sX0F3BZJ+FOmgtiZWJbcPpSxux58RRpk+7OLPT/ua4R0TFFmuiGsPFQ83IeyTM4Io5SE0WxmuxDtjxm+OXLMS122Qb0XLC6rnHAaT/Jez2pTZZkUShwMNQ2AcaLkeDwXjBSm89sw2xSXOywautdtCowVXi5BMRfpOKMf2Px3bVHn4dw7y9KyMHe79+jKDqY1t34hNON2Qvb0Njdru2PJEMLHKLAxbX/TOgAZWYLgM87H3DDr43oom2TCiTG4O2RQtLWYhaWSxfn1m0+ERSm8hM6NEJJ602tUwKuEI7LlVwiLcXFTafwcnUg18Dr/biYj6x9I3nCIvfKISPahv+WE8MKqeASg1HMrVh7o0tFyx24aMX3VIVI2Qwtt4biFtEVDUJt6sjSyNRDWgyIYaLDJ9mgYsef+P0Sr1qH7ufCxT10fR8fLWFcKUkP1AVSOnH+Uluyrf3i0xF/q9o+3MGWbToXgfyfkhUqEpNTo8UU07TnpNUgUltl1hy/CGtVKByZfp3nrmXkkPpJPB24OmmOeoqEKQL8BRaNzumbmRHUgk+HWuTdji3WzSC15AKbMkZ9gNYZwiKLaJlkxnsEZNKMm+nZeOrEzhxaz5PoKI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(19092799006)(1800799024)(10067099003)(56012099006)(261021121427099003)(261009223027099003)(11063799006)(261028144727099003)(261026140227099003)(261022105027099003)(261102123227099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXBObjBBYmo5dDdEeFhlSUNROXplQnAzQjlqeUlNeENxZyt4aGRMM0U1ZXRx?=
 =?utf-8?B?ajU2d2xWaS9vWWRJODRjd2pYcmVxelZRL2xVZ05jWDh0R1FNVjNqRlpqSDRq?=
 =?utf-8?B?RCtoRVJxc2x4YWlvd0p6a1BRdEFPSytoeEF5a05DcXlzTzNyQ25uRE5ISXhT?=
 =?utf-8?B?YjVHNDlGeVo3NTY0RHRSdmpzZHZDajhTOFFUSnFNSEt6VlpSNXlNdTI3a2hz?=
 =?utf-8?B?V1BndU9FeEZSbWdydWJYQklJd3QxV2s2VFlYTlRvczJPYndvSnI2ZW9CWXNI?=
 =?utf-8?B?Wlltc2Y5elViWTdGcU1BMXdjWXhLbGhodmpwMk81YWxBTW16cjd2NjEwZ1RO?=
 =?utf-8?B?OUl3bzNWTnIvWVJwUUFnQ1lPeC9nc2QyL2kvcWxQTURYdWFUejR0N2s4T2d5?=
 =?utf-8?B?VEpiTGx4NFY0WnlkKzFpY0pTbk15Qis4Z2Q5YkU1N1JWMWdNYkVyZEk4ZnJN?=
 =?utf-8?B?aEN6MzhTT1JxaHRiZTgwUHMvU2Z0N0dPUEhTNXRveWZHYkdDamc2VnNYb3p2?=
 =?utf-8?B?S2luci9mVUliWjdyVGpLMDNqODZjWFRLOWVveGUxQ3pXWEtCZCtqOHgrMzhy?=
 =?utf-8?B?dGdSSjRZTXQ2TGVSNnY2ZTdPWlZ6a0c5NUJOMUFhQm5uTm92Z2Y3cU1hQzM3?=
 =?utf-8?B?b1FKZFY2UVNEMm5FdVc2OXpVMFVDZVE3QmJWRXB1aVhRU0pxYzE4a3pxVTUz?=
 =?utf-8?B?NVNraE9wM3ZETXNNald5TDRCWkJqems1bG1UaTFlcmZremZvTkdWczYweUFQ?=
 =?utf-8?B?dnhnRW5uUU4vMG56ZTViZjZIQWloTzdXa3VpSlRzaTFMRnhZbmpjNlRPbDJS?=
 =?utf-8?B?aERpOGRLSGNWWDJYcWR2eG5DUjVJVWlHRVRXL2V6SENCcGJOcTVIT0ZSNTNh?=
 =?utf-8?B?bkRrWW91eXBzVDFTN0dSNUFRa1JXdlc2WE5FVGExUnVvQXpaa1o0WGxweUJH?=
 =?utf-8?B?R3FUV2dCam05YmhkL2liTjVlZTR1VHhVejc4ZlhwSVlHaFJha2M0b05lREMz?=
 =?utf-8?B?UjNzTjBoYUpEL1JZVklFUDhYUjlQR0tNUXgzbW1GYy90eDBBUTJrcW5HKzZS?=
 =?utf-8?B?bFltYnFITXNPZ2dXdVFhTEhNSjJpNVhVNjVOV1Zya2FHanM3RVJEenlzMTNB?=
 =?utf-8?B?ODBGZHRXRzNCdzVoUWh2MStUblluV2hwUjVxdnFxR3hjUjJldzA5UUZKbTZu?=
 =?utf-8?B?S0QvUnlIVkhYWHhxVEcxYnhiWVpNWHYyOGgwejA2b2RhakwvRWR5aVlpZ3p1?=
 =?utf-8?B?MXFuR0VwN09Cc1BYbk42S3dhYytaQ1ZJWlZpaVo0UlZxbHRiK01taHYyU1NI?=
 =?utf-8?B?Rnp5SW1peXNXK1UxZ2l1a1MrUXlpRnRUeTRBVFI3a1lGeDJVK0s5UmhEcWJn?=
 =?utf-8?B?UWJlNkhZY2hMbklaeXRFcUcrTDNYbmNzUjJHd1NFZldRSEh0T2R6bXd2T2s5?=
 =?utf-8?B?VU1SYTM4aGRsSFcvZExNQm1mVkU4Y2lvYlNQeUZSNGkrVk92WVU1Y3lUa05I?=
 =?utf-8?B?R3pONEwwMWlSUFREeWJvMTZhYloxbk51b2RRMWMxNzV6T1k2UllPVTdKeFVj?=
 =?utf-8?B?TkdSd1BnT3hXVEJCS1U0czk4T3I3ZCtabkluM2xHSXA3L3hOdHJxNmJwYzI2?=
 =?utf-8?B?UjdXRzA5ZzhmMDdDV3dCV1hidXhLbGRXOVg3MDJvUFdHMlpGeDR4V3V6UnZO?=
 =?utf-8?B?T1ZvbUFpa0FyZVF4S2cvYUpZT2JWbncwY1dja3lPd1hjcjNUY2pBMlY0TDZP?=
 =?utf-8?B?UTJUWW8ycjVYTGNjRTIxUmdQaFhsNDYrY2dJWkh3TjhyR1gvNFM5Zlp6eWVO?=
 =?utf-8?B?b20xNHEvekNCZTkrdHlJQXZBVnU2N3Z5QloxQkdlS0U3UzNmdlBwM0JEZE1R?=
 =?utf-8?B?NmYzQ0xna2ZsbytOSUxwSGdqNHJqelp1dlZZQzh2clNrekorWUNvL3RiK0Qw?=
 =?utf-8?B?OXlZMTM3cWs3NjJwb1V0ci9DSEs2UDdPQXNPZmRpN2d6a1RHUG5zVnpFMW5K?=
 =?utf-8?B?cVhrNFhNYUNJck0rVGtHZEhwdkJyL3NNNDhNNHJQN1pCdFFnNS9OZkNzQ29C?=
 =?utf-8?B?Y0Z4SzFxVXpvcVZVdFlFcGRLcVRmTzhGVXNGVlZ0cXZoYnA2NVNvaDFqa0tS?=
 =?utf-8?B?K1JrVjZ2YktJOUM0YzlsTjRNU0diam8raHdudzRwelVPVUNLbGRwbEhTd1k3?=
 =?utf-8?B?TDNWaEc4cmVCd0ZrRTZ3SUJNcnE5MjUyM1RpMlNqMHJpUDZoaG5QbnBXQzlJ?=
 =?utf-8?B?TlE2VFJoTFNkZ09WaVRScHcveTJiSWZsWURDRGVTNlRLK216bCt3Z2JlOXVB?=
 =?utf-8?B?NWIrN0JKVldnNnV0TXpTemtyQVhjYjNMYkdzcmF6cTFNWngyazB1NG1wWS9B?=
 =?utf-8?Q?tCl6mONJ1z5Xqg1yu8OTS47Q7S6ScfBPFsJ4s?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 399e50a1-f1d8-4fc6-473e-08df4037a6b5
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 21:06:27.5072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQfaHH/q4PhMoaSBHfzdvx8NWBpTnc9FrrzjE53XvpBpI9/C9r01zGHk/7U3SniZfsD0zx9ot+fD+oukpyU0Ayy9EJBeBo78COWGUOO15E/ufS9ejAd5ylx4HlOfWQT+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12631

From: Frank Li <Frank.Li@nxp.com>


On Fri, 09 Oct 2026 20:15:49 +0200, Stefan Wahren wrote:
> This series adds support for the chargebyte Charge Control Y, which is
> an Electrical Vehicle Supply Equipment (EVSE) for MCS (Megawatt
> Charging System) charging stations.
> 
> sashiko reported in the first version of the series [1] that X_nRST_LAN
> is available via GPIO line names, but there is no reset mechanismn in the
> device tree. This finding is valid. Since the reset line feature isn't
> implemented for LAN8651 driver yet, I like to proceed with the current
> version. The LAN8651 handles reset via SPI commands and in rare cases
> we still have the possibility to control the reset from userspace.
> Btw the pin has a pull resistor in hardware, so it's not floating.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: fsl: Add chargebyte Charge Control Y
      commit: 3c0397f90fde224d620ad0f6ca2bcaff88ed4466
[2/2] arm64: dts: freescale: Add chargebyte Charge Control Y
      commit: b3bb1f678463062030a086d2098403240113c4d8

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
