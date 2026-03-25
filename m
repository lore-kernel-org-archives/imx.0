Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011057.outbound.protection.outlook.com [52.101.65.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ABC2DC765
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 18:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774464099; cv=fail; b=ZerrhlZQVZWOIUhQJdIoSRjSTTm2M5lrORcNPEbBw0uVk6/vtEqGPwIpKsV2YtwCmeuyORJuyDxPGVQA1Sic1+EHD+nS/kETcc+giY8wYV/T6Jd3nrXTxBeoJFlSS/wKGdy/Ar5zRBvc4PeH7yD6JM4yi+Jo+PiOq1jT8JGW5vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774464099; c=relaxed/simple;
	bh=hdsdRl7J4xlauPrdaSSJt8ckkSEEPK2MtGMgR7+Jp54=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=eAV+EABY2hfBtR/5jDYhY//O+kp2uAhHl0OIclaUpf52T6pZN/k6mhv8U89aIFoL8fQN97ttTQhLkzxvuuYHfhu/fpe+AEP8mENio50p8YCeJ7asXqu7l5KrwFoQdVEg/fY8u6s4bExMd5BqqG4MJKVxmWk1Np+nt/JjgndiN6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dq4vMuxl; arc=fail smtp.client-ip=52.101.65.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dq4vMuxl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqePMfaXUy1A+de5wWBvza9mUzTBUdm6/lsy9f3vsBLtVTipq04qC1Oq0/dNRhCWGJ3UBgKlQbgWRRX3nG7nhlmg4D9vLu0WnRJgkvIkcNDoLSz1PfTgfZ7kYzuhv84RRGL4q16g9g2Wu2Y2K/MMRezCcpvWNvMCddpsV9geWsF6BrWFb3/mqAwGat08OIIN+7lSVZQKoIFUsYzQwkesp2A31sVc8kHr26or3jHh9FCt9rZmjnzUaF21+KlSOmUuDyVGSqBPOvnsahYR7CC3WbmloSTXbejWp6MkDAsxEDbXAwIW83gala16s3y+Fimvtgs4FPNrw2YAPcwSeOmOxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfETO7NsJU6VnXAncETQPjZec3MxwVVAch9XYDQU5ew=;
 b=xw+L97wImufu+GGKyGNFayVu49f8tk22C3YTBstXeefVDZQh0bUe0yEdK44/qszFrQfHH8H1dgjlIRIvqdi84j27YRBmP+3KZLS9jcOSDTSSJi76CY4n4LWU5rHQYUekY10/9F7eWeyJB+moghwpA01nSzxM1Mcvm8vrBzgv9Z80XadYJEuQVQF/G8xYBbg4Hpy9tWgP696ChxZ0fc0Qhy43lolrco53G6dvpyUP8o58Qs3nKhCStS7KjZjbnV+wyUPR45+sUgAQXWk1/jbScnX53RJ8mrrVhdLWwgc3OXtulmhGZXokbqF5keClHNb5lS7E6+Wm/D7momtEoUoFgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfETO7NsJU6VnXAncETQPjZec3MxwVVAch9XYDQU5ew=;
 b=dq4vMuxlZqA3vByCiyzNfCkHfpfkKChtqqZpTU67kdwCKLB0JDtKWm2gOGXoiH5VUog8oOb/quES1wKSXv6xSA75NeEXaHOXaafHZM6VFWbzauyiNxNwwGBh7r6dk0uwVEK0wP/02cvEgZoPAH08PesfyWSBMDYHTE0F8yP5O6UylNiv0sxJA1Y0sI/GntFGgvUqRMfq2ioqVvSttn7/0kwzz8vt0+9yycR3E8sEPMykxMJhrjjDI+ThzMZ8GUghBscPLXsHG2cFWE/DzMxxGl68YIRbz3xegm/EOQRDNh1a6zy2nvOH3OGA8Aj8NCpQNcSv1oZ1LqaaEdiuh2+52Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GV1PR04MB9182.eurprd04.prod.outlook.com (2603:10a6:150:26::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 18:41:33 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 18:41:33 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Liu Ying <victor.liu@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260324-imx8mp-evk-adv7535-cec-reg-addr-v1-1-52dbdd63d5a4@nxp.com>
References: <20260324-imx8mp-evk-adv7535-cec-reg-addr-v1-1-52dbdd63d5a4@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-evk: Specify ADV7535 register
 addresses
Message-Id: <177446409119.3230943.515191426577352176.b4-ty@nxp.com>
Date: Wed, 25 Mar 2026 14:41:31 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SA1PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::15) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GV1PR04MB9182:EE_
X-MS-Office365-Filtering-Correlation-Id: f2229ff7-6692-4d25-6864-08de8a9e2305
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|19092799006|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	shJNpnbKcctSPqvbvL3OpkfebxNTPpkMWMc/Fng/tEuA/ayi7Ario1cO2/m5hvJg/YbDG/b8vkvBVupPv7D/RwqiGj8Yoz2txmrumw/Fy5xxPmsy1D3S8/Ki0LCW/sW54Av8E4d0zlLw06FEB2NTmN4dFkDWYDDO48IwosWwaIrgl1slhqZu97FNBMQ/U2s3SCG16oOGKnE/WyXHpnKCRiyrePeZm2pCoNfE1XzL7e+wmhB5KEE0iJDM+zDY8qYBVbsvsLRaYLkOBNLB+V5DLADWgH1t+D3HhfdU5M2+qTIdqwftqQwUj3C5ilHXmA/+i2w00nsCHsrH0ItEeenKmKEAikHZJg7VLxpp+SJW72EHY7KcHbtzkSo+GVVgcJJ+bOAxOUXK/+2W+qK0omtXOebOObcBz0Hzc0UtGrtIfYpHtNqwc7N/jJsg2l9sDgE6iWpz912/LYhlqoAPIoxObjQejoH3Uk02aMtm08iScHKHIwroesTtvzwMi2yHbO7dLQ6qJsrNG3dLtc1rKpMhCwDw5ZcCO8b/a9KuuF1jn6nuNY7Q9OhaH4mJ5aIv6vjrSsV1N/e1zTBWDVZouyVhlFzUiAxrTjQq3n3Q0Wkgg5LyzvYUK0c4HgF5Ty9+kA2tY0dSadWPDJZFkeKnt9bEgPylQ06CqrtXhRx2k3OR9uv6KcSB1+DcwzgyQL+yBG6JNRFz7Od2ZTCCZMJi0XJ6LSTrXlrJkvBVOtm9C4+relZpUFh0ohioMz2EpMgEYtdSEh6LDRtn3q+uY4oz7IghXK9lrAy6C9OQkayrwUGU+H4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(19092799006)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SURPSXJMTnVQUlhIYy9PenArYjA4NWdmRzZ6K243M2h6SDZsT3h2ckdUZlov?=
 =?utf-8?B?TGt0cjRBeUJEdW01OXNIZHpVcm1PUlRnK0hnM3NWcWhsdnh0ODJBSnlFQkdI?=
 =?utf-8?B?d3g1c0svMlovRW1IV2tUckFpam1MTVBnWnJnNkI1Vy9ra1JVQTh3RlNHbkZr?=
 =?utf-8?B?OVZUdWFFVTFOcTdZalZiQXpGT3FrWUExc3hFbG9qYUUyRmsvRWZqSVBOUDEr?=
 =?utf-8?B?RzZiUUowSThXcStXdFZ6bTlzS0hCWEdnMDU0NW04YnY2ekV0VEVidjNQeDU0?=
 =?utf-8?B?aDczZENkYnFpd2o5Y0U0eFJwaC9KNDVGc0JISXFER1JnMFM3K1k5RllTZENa?=
 =?utf-8?B?ZlFsWDJCNE9oTklWMngxTUM3T2FvUHVDejUzMWhsU3Arc3IvZUJ4N3M2QjBD?=
 =?utf-8?B?bm1CSFBhUC9xbUxwZmV3WW1VZDYzV2ZVYktmSXNPTGlLTnN6V3NIajgxVUNW?=
 =?utf-8?B?SjYrNURkaEVpc2thVjNGUlNWMW9hTW9BWkl6K1JLZmdtT1ExTkVhazl2TXdU?=
 =?utf-8?B?K0o3MGdzU1B2WXBlQVlZWlQ4VWNsRXlwLzlOYlRnbXJQdkJWV2dZUVhmZU5R?=
 =?utf-8?B?ZXNNMjRHeVdUZEJpbWt5bFUxZlNHMUpoaVc0SjNZVnhtdEJkTVYvb3F4TFlB?=
 =?utf-8?B?WGwwTXF5U2IweHFOandQSWlieFNFOUVtK1pWNWtpMWxkbTdFK3BodCtyNTk3?=
 =?utf-8?B?QjliaE5MazhJNGt3TnBxUzJ1ZDdiNzZPazdjTUtaOFFkSnBaQkpRK01aUVRG?=
 =?utf-8?B?N0EyVjZTSDJxOGdyaGc0bkpPb015cHhxZ0pHazJxb0lSYlJPUkRpZk84dnI2?=
 =?utf-8?B?Qkt2ajRzSmdhTGpocTJNYVBQT09aRUpXdmp4OGFoMUxTNm1ObmxoYlVZbDll?=
 =?utf-8?B?U0FXTVFJcTE5WVc2cG1uNFlUMHZZOW5KazRGUmNyU2NrOW15bFlKUlVva0tT?=
 =?utf-8?B?VG45cmY4c2l1Y3Y3U21BUVpBZnBsbk95MmUwdUoyZDNlZVFiWjRsWmtpd3Qy?=
 =?utf-8?B?cTB4YkhncXB6TFhna09mVnJyNTVwbnVZSTFrb3ZKY0Y4WkM5cWJqNDgxYnlu?=
 =?utf-8?B?WkFKbjcvTVlGcFMzMnY1VnhobmNxWlY0K1ZMNWlWMXFzT3RCSmEzcUhzNTBt?=
 =?utf-8?B?Nk5lYU14Sy9vM1ZBRE0xWUVrWE1aSkxFQktsOERhRVV5YWRUQVpMUW0wNHd6?=
 =?utf-8?B?aXdnV2hZdnlZRWEydWdCSWFXZjdpbHRIRmpoQUloNUlhZEZKRzdLZnZaeE5B?=
 =?utf-8?B?aXd4VWhYcWRDdTIxZ3RRSU9PS1p4M1VBeTVwQTdPeXFoUXVjT013TmE5MzRn?=
 =?utf-8?B?S3k1dzA2eUhsSHBmZkluVWpsNXdjS1ZDNnErcTh5QzZ2c3FMcjN6YnR0dTRs?=
 =?utf-8?B?NktIZmtiWWJ3TzcvUEx0MVFHMXlaWnA0ZjJpdzJEZzhkMHJrTFpZWUc3VlVX?=
 =?utf-8?B?YlN0ell5bTRBRjVDK0grVVdON001b2RQR3Nlak1IVzFYb01pMWZIU0FkNkRn?=
 =?utf-8?B?QnV0Zk01NndNMGh5eG8xSFlyZ1gyY29CSDFGNVlZSTh4cU9VckFuVVRwWnoz?=
 =?utf-8?B?YUZPcjRidlF5Z1dLSHpjRnNiUlNzVGg3ZW1uSjJyMmtvYi9ZQ29nR1p5UVZ5?=
 =?utf-8?B?RzFkajBKOXZySEdTbzgvVURnVlFwejZsRlZ4MmtKcDliN21CQzN3OUVHOHph?=
 =?utf-8?B?RnJOTElVeExGOXFiVnJPd2pqUFJoeFlVckNnSW1qSG4yWFBoY3JVRE80MzZm?=
 =?utf-8?B?Q00rMGNCWmhjeGxDUU82SGVGQlk2Z2N2UnhrRW9vRGdvN3creUJod3RUaDQ1?=
 =?utf-8?B?ZFFsckhEbWpQWWYvNW5PbUcyRXJuY3pmUE1mRGRsZm82bVhQeG9pZ2FvUXVB?=
 =?utf-8?B?YmI4WjIwcytjUnQ4cUYwc1JGN2JJOXJqY1c0dEI1SVZPUzRJUDdhL3VzV2FX?=
 =?utf-8?B?bHpCdmpZV0c5Rlp4ZmNNNllkYXFtN3d3U3VuTGJsdUliMmVsYng4bHRZcXVY?=
 =?utf-8?B?OFBQNDcvZ1lYaEtYSUo3NytMeHZxK2VuQ3VGTmVYQ1ZXOWNPbnBpNnRkY25B?=
 =?utf-8?B?SXkvMFdLU2lZTWJ0UVhIU2xyQzM0d002SGswN21sYVVrZ0NEWGxCelFPbG1h?=
 =?utf-8?B?d3BlQmIxZWIvaXBDdmNCOUZkcTcrdWZybHVKVkpXY0wwZ0FHZ29pUDRWYXFn?=
 =?utf-8?B?VVY4cE1XdHBtTjJnVklielg0RjlrUi9NUDA4VWdqYzJMdGFhYjcvZlhHdlRq?=
 =?utf-8?B?dGdNRTUrZ0paeVZRWE5nN0dtM1pzRU1JU0F2SXB5THpPUXZ5TTRMQVlCa3lN?=
 =?utf-8?Q?XiG2vA9Wo6yVLt0AIu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2229ff7-6692-4d25-6864-08de8a9e2305
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 18:41:33.1405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zYYk1uds+AWSehcz4C7641g92jM6cJkTaKRSayGExTpnrbCs7uZJ68g8Drd2yWltKlK6BXVwIxjISWudEcuycw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9182


On Tue, 24 Mar 2026 13:52:03 +0800, Liu Ying wrote:
> MIPI DSI to HDMI bridge ADV7535 CEC default register address is 0x3c
> on an I2C bus.  And, OV5640 camera uses the same address on the same
> I2C bus.  To resolve this conflict, use 0x3b as ADV7535 CEC register
> address by specifying all ADV7535 register addresses.
> 
> 

Applied, thanks!

[1/1] arm64: dts: imx8mp-evk: Specify ADV7535 register addresses
      commit: 9f9dd832661b62091f75b88b8467d8441b546cf7

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

