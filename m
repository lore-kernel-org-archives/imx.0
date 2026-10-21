Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792571368;
	b=pFXp38wP90VLC9L6bL1C27e4ZrwGUwUuOW3S6M+ZuMQXDq7luscrHXMXq6duTfdJ1hip
	 8YoZHGcTrAr86tXxwlW7jEX3XpCK1NUUgkPJG4mvaeX+wObtPzCXVCAvQd5dfVm/s9cBB
	 kuuvEzx+vZUNnso9Llxd7ALZeR5zOhLiHeWFRMUUZNI+vsErqQ1GX3Lywq61nKuqNBwVL
	 v2Grh0KVcO6xrf7xpBQp7W6SFfwqy3r1bdVB9ywOC/W6UaJvnE9iYxSUvrPmhQySx2nIt
	 Bz/kCsmi2qU0k0LLaTAIpZ68TJ6p/u7LcRBQyxd6IpvWbqwIAGR0jCHFyB2Gu+uCr/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571368;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=WXnplFHSA+n1V+USpjituuMU/SvZYT9zn3kUlHcbnck=;
	b=arQEX5yqNqiPi3XYuvhY8CI9DQz8VkO8NGFnIbeh5ZkmpnWQPQnd5AzrX9OU/3M7plpk
	 yXTenezDLMZFjzRanSDtO5MFBwya4IucSet00qqVjxNu5boAYifcczS2HRpU0qdSHWpL3
	 Cg7r5hVFdIBmowOCBdrGS0EsGQPfuBkAFTCOFvFYwwYfooLr04X7lmjPQxaqvrIZ/bZMY
	 OElygnhQ9gqIs4nAZKZCsZMlid+CYSgU7a61cK9PXDOvR3mXg33AfG6FP8+TjG/8iFr7z
	 l/9TiVttKnhaNyly5Oe9mvK/N+vrIbfRg4xiYTCLUYA28JxQ5E3ABQJe3KKhYJlbpuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=BXd5OouM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.23
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013023.outbound.protection.outlook.com [52.101.72.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A9860A260A
	for <imx@lists.linux.dev>; Wed, 21 Oct 2026 08:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7A9860A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=BXd5OouM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t42TGl7WFOnVRTirDbWJnNlu6GZHT0//Jj/UVZa663Cywnw6kin0jPvo8m9ZdPg5Z5wqLulfjgZJFkobu5LuxURqzGFpK6o6ftiRaq5U+W5f9BqwcQfXCOyeQ9r0YWX1fL4carn0+0TIznTpbjmVYahTXathQcSw8aDBvf8zfRoADcpOmYCV4nCj4IxQx5YpHyiBUMn44hMH0iHCDFsJiGagufOWJMNacawiA65UJTLWW/W+/ela2VsJOfTW2rwO+U+1gKWAMXgM8zuvn9/YrPA+FehlpFbDMdW4mLFZ0K1WYypp0EL7E0uQaGeiJ4VF6X/V5CrZ6NMhbvH94SLOQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXnplFHSA+n1V+USpjituuMU/SvZYT9zn3kUlHcbnck=;
 b=uCzfjgS2Oo9USerDXpivT0f7PgUvjKr2midxHNIftECV947rrCqjOtAIiXy6FsD/n7G0ru+JEashJv5DeO20ik3t+3eOz/7938nXhj1Mvc8R9OgaDY85mI0WwhovMBC0MFN0aKpzQ3bGvSD7nKm0tqnGgtKQX0u+jq1Lpqi+AgWSyF7drKsOkLGnvTzIps53+24DRTIUvSy6eTjp9gUEGJrlpJzHLTcPEZu2+RYsV5L4la14VLzyUJrZJS9yJKeGZ0+m+ABz41M51mtT2LuYMYEV6OqVP5O70oYQv9lwaCHLUr97emwvIPabX7KYhNw/kk9DNaFmr8pj50VQy8OHzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXnplFHSA+n1V+USpjituuMU/SvZYT9zn3kUlHcbnck=;
 b=BXd5OouMUu3UF0xYqKFN7ePaZcMhSRs4MYgJ2z5trmgDPbIzSYVSDrVKhtvAIJOWD8CR3BNmjzjpJuIVuFAg+xlPp40OTPMSfa5T/FQUFzZWipy1uzJTeJMbn3I3H8YuU5O5fQvIUPZG93OTOUb4HA8Khto/XqIYyche6RaeueT3IoDLWTZDY0UjmlcTs7OGFCwrIFa12gqXS7Xdlt9zQDsJHA0tmT8295MJNcU9HmtoaGcX1d9wITxm8G1a8kPmAkj55C+MtkhBnHUuNi/kOGy1r0FmunjyWITsczduwYNgNLbPKyQI7MTgQ3j11RRiPzsFcReQUQoRp2TunmDVAw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com (2603:10a6:290:c0::7)
 by FRWPR04MB11269.eurprd04.prod.outlook.com (2603:10a6:d10:19c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 08:29:24 +0000
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151]) by MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 08:29:24 +0000
Date: Wed, 21 Oct 2026 16:31:00 +0800
From: Liu Ying <victor.liu@nxp.com>
To: Frank.Li@oss.nxp.com
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 6/7] arm64: dts: imx8dxl-evk: Move ACM MCLK pin to ACM
 pinctrl
Message-ID: <ath4RHfj-rOTXFE5@raspi>
References: <20261020-dxl_lcdif-v3-0-adc944659e14@nxp.com>
 <20261020-dxl_lcdif-v3-6-adc944659e14@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-dxl_lcdif-v3-6-adc944659e14@nxp.com>
X-ClientProxiedBy: SG2P153CA0039.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::8)
 To MI9PR04MB350878.eurprd04.prod.outlook.com (2603:10a6:290:c0::7)
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
X-MS-TrafficTypeDiagnostic: MI9PR04MB350878:EE_|FRWPR04MB11269:EE_
X-MS-Office365-Filtering-Correlation-Id: cd36273e-efbe-4cac-cd6d-08df2f4d69c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|366016|376014|7416014|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	BJ2z7bJP/UB6AY2uKVfoRZ+Z+XyEBb5bGuE+zyj8ci4PlH4iUjuKbX+fFm3wCHcvA8KfmWb3+hiLoNEdoP9WFid4lOKm70iAZdrQNlrEF7wrXn5ycKmw7gR7GOvN+fPBw/GXQ0uETxxtKjvzPrYa0J9YWTd7kRiHebu8VM2l1vPkswQGeJf/nnvhWTnJ9BY5rnuFo3PhWRWF4/7ex179cVvQbOvPIVESbCJLBTBknPPLJnX6SPKBKUy/Z1PaUspX8v03lWSwV0IILyL60fO1MyOugRamuBi8C3WsdCLeNmb6oYpnjU2U4M2lz071iBqPEgTNwI5bhnrS/wOnArqS/kjrgD/yZdqNBvmZORsIB9VMli6O0i7ffa0LINiqkB0ufTHiCamjzKLFSxqHvVjC34icuwbfBDpSm/u21L24CdM6AX+wWgpjTepOnh4qT2MYb7zXh5drlSPgkmaYVrNgH3K6DPqeQ206K/QyasHwYjFagzMli1kbiDku5LtLfUzWu2/bh2rdGnUv3lcsr1+/vFNjxP2l3vf77/0AOcJ1vRkFUg4ilDD9IrGCMAePnldVs0MfGUOihloP2G0IUN2i395VpGMY/PFATxuVY4AW2ntalo53V51CPluQ/W0iTgJWRXreo6jKOCn3/HV0tPz2TDgukLOAjR1KsgBqQtrEGfM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB350878.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(366016)(376014)(7416014)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2Ds8lmnDGMsgnptVzTkAHvomkgAi9BA12cgAHCT4d5vcI/jXV32aM6A4O+E9?=
 =?us-ascii?Q?JxrZQja6w2L/Jroet6fi/EDm3QuKjSmiv1hhbg5mOWEed7ejIMN4TAHG9g/8?=
 =?us-ascii?Q?62wtUygq8mf5gU4vGmnix66e339QqSnhU8x95P8W0ca5eWqBMBMjvosTPW7w?=
 =?us-ascii?Q?YYtddSYKDagHYfAUKTF+DwMiqhk8RMsO+3/MlYAdDLpiQS7WFd//ICW+lufx?=
 =?us-ascii?Q?GDlNqdHLCzF1176J7IjE5ojeIpYv+9AvHW/Sn1SQuWV+i8CFeA5dmoYkhH8t?=
 =?us-ascii?Q?WzlnI+Qph2+30jJlri/MYoqSE2NJEnlG0eILNAnMiAQX28RLVr9PRLPBHtzK?=
 =?us-ascii?Q?IniDOXSxIakIrH7yCDcfFoOTA9bBpHyWKtzRoiCJsiUka7FTp8zlD1VsLW3Y?=
 =?us-ascii?Q?UtwuAQOftcukgZX9XwYERiecxPlMKbqDUPkfIMPtFL9MfdBPNW6iP2lfsoTQ?=
 =?us-ascii?Q?HaPHT3c9tKZVhyl80a81vWc/obo6AN3EjXrEfstxEVe1pDNDRqGjUt6/4p2+?=
 =?us-ascii?Q?TND/cGI+LWcgAPngTL9hOneHQFPZGZ4BGhDAgCTV8a0zDC/5a+/rXU3zhfGy?=
 =?us-ascii?Q?CN2SnaONr4oDIzuIgwFtHMoBNtkHsY4TA7FXkKat96WzavMKfAdb4pv+nx26?=
 =?us-ascii?Q?wAX3gt0RDyZ0G5R6GuB47ppsEJbYV1xtbY+qKJgi+50G14Too5yrrEjb6BEG?=
 =?us-ascii?Q?hxvS4jSTxSXvBumphGwek3Lalsg3dlzwTYtyGZn1ZWEjdLBnNOW+7Sig9/w9?=
 =?us-ascii?Q?0ZJpKuQ/MJ5u6PsBIfeW5Fjq2P0MMbJOd4Zip3mPKgDitnz5Ik3yPMHjKnm1?=
 =?us-ascii?Q?zyXuVZSIoCgI/YggGVB8f+QsHEUXfenbOxKhnVFbtHp4RKaxPNo+ibapo7pf?=
 =?us-ascii?Q?LJdhktYVJJ63zjWuzWpdvNDezyOneEhgctHNBLtIRy2kewes4cYDp6ealoRh?=
 =?us-ascii?Q?EbjEm3z5X8Vnxjhs0oiccU9afPZmm5rkRYMyHSQmX/ZLWqGKUbHwc9hp/6My?=
 =?us-ascii?Q?/byjBnxZPxgLYKDd7YFLyOXhM0/AdLqXWZsAwGT7AqAEi1gDQj0KaGFPBaRn?=
 =?us-ascii?Q?71kPmKS23EovoHJnEuwVe8eZcZjBeDjvrK3vANHIe9tqE0TButJDgBLWpjU7?=
 =?us-ascii?Q?H7QUZpmV7y/oN9EwYgRsPGEapBuA6k6PUDN9/xAIZU+g+Zal6yiNZm65599C?=
 =?us-ascii?Q?QWV8I+eroEI3FbbcfUURJ+oLf62BvXRNdjKp+v+hSoP/J27uO0Ct4SHbtxjU?=
 =?us-ascii?Q?PyxbsL2Ba4aVn4W/gHxQ7OtZYGNcdxV9CxGSt1KOn8ScSvGxushLmolRsKoJ?=
 =?us-ascii?Q?WUYuItxt2s4/1Z03vbpN0WkS1hjhJmDpbk8cL7E5Dvxt7R8IJfYgncXav4mO?=
 =?us-ascii?Q?ZYSVQ7n3XPaX1dbTbU/akq/OIopBHdH17OxRNjTBPRnuQQfXCRr9pIOynOMZ?=
 =?us-ascii?Q?d3Ieu3qqcCLSOGm0oJjCNPVaphFn0Eaj1lO7WfLh89WIQ+OJsxiz2t2jvB/N?=
 =?us-ascii?Q?/djW1Bjl32TYdXnMmX63uPB3nowU6Nio3YgG5ki5dNwBSsERfw3Fe3hnqEva?=
 =?us-ascii?Q?/Assgbu3EQHBoouCA9GC/FJurRgRcrIIKZTCG06OMsrpSV+2lhH5E9r/0oln?=
 =?us-ascii?Q?tsooDBclVLJvegVb74ooR6Z/SxZXHXrKxoOOIo3XZAhGYA9G56oa7U45kzxK?=
 =?us-ascii?Q?F3CdEYsTAC0PpmiQZ6IwVDdE0ZxfN+z8JSY8hrOkF+eWvm953DPgOcsjGRSX?=
 =?us-ascii?Q?ygntOJmRMA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd36273e-efbe-4cac-cd6d-08df2f4d69c7
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB350878.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 08:29:24.5884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EorHDFRrnqxHpxVGo+LfP5UVzMflOeSFBOwTW5N/uk3NxhuzsU9AeWklPwTiOzlNalaNdoB2e23WaF+U503hrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11269

On Tue, Oct 20, 2026 at 04:12:56PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Move the IMX8DXL_SPI3_CS0_ADMA_ACM_MCLK_OUT1 pin from the iomuxc hog
> group to the ACM pinctrl state.
> 
> The pin is used as the ACM MCLK output and should be configured by its
> actual consumer rather than unconditionally claimed by a pinctrl hog.
> Prepare for LCDIF support, which uses the same pin.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

Acked-by: Liu Ying <victor.liu@nxp.com>
