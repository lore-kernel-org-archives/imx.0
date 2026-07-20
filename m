Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013048.outbound.protection.outlook.com [40.107.162.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1775437849
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 16:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784565091; cv=fail; b=AhhmVRBR9TOGlwvjjpaCpYb4O1X59NtTB0F7z+t6391HYLQL5DboktOW2+zc5bmemKlXvfuXoaj+kII6CJ3HydQOmtdIlwkhstxtfHklHx0BcAe+zTatdp0PWeNsLLIZR/HZwl2Tmh9jVFUk31mWZPc5ul/C8ihBq4vD9ewDubg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784565091; c=relaxed/simple;
	bh=tPKQd4I9wrCveLF/rjZJXQnsDdIOtavMWgm/wKcl5qU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QpvtAA0B2XqY2ZyUvuXmeDB244xnTEFvJhp95fIyij2b+G/i0ZqgGhgdv2dvs4E+tN964aJWulnITqLKLuDtceQCnmvlPY2gS2u4SDhihyOSB5MYzG/vS8hGyIqUk6ClqbdRUaIQG8NAfnuA285GGS0QC30aN7V/WR7kArSEMRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BZFzEJiP; arc=fail smtp.client-ip=40.107.162.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BZFzEJiP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRonUmqFZfjpmbdTGV2mPAL7zNGvx4HvV96VcUBOLtdLMPMTBPXc2ETEw7Yu/1+WPzpppafSeDoz0L0/x4ilbMdpqkKptohbQfH1ngtWsVZPPvi1y3NjY3Q513870yNa6nrN1CbbuEX+3Ti3LS+OzbHBJbRLF7g0cwxn64pX5JkDLh9EHFu4cdrddEYjYbOTw9Og5S8c0UtdfCC8D3m58GnlJX+eoW/2CYnF4CdVYqP3aSI7ARy5tWayBnpVJqMV03mkFOp9LCEcVi27LJJmW8CpyfPo9ngqtMj0zurLp64IkTk11CzNdKwOSJ0Z+09aTOrWju2AV02HoNNuTF+rag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Hscwx46baceg55waKLJ1Qr477R5dL2BnJoF9SDtp38=;
 b=uJIzNBzCyiEWHbU8wM7e7eZ+Q2JffUcn0zpnte/cAjUW+equWz+aV8Y73WJwg76Bd6E7kJxCydZT5J5q+gh0l3/30NXhNUBzblRNG/XBzzx3f3n2fsZfrtIlpKEokmIMCjbQp7tEhf5J9sZxNV9UgktDhIuZY5htJnMBMxWwKPYlaxuDJy6CEA27QWsyNdC5CjatHPjI4oaBGoLW/mnQwNDIKdflLZ+LQ3D3JMQCsgQdekvgajRx9Ove4/PKmirGSDYb4aTzUjTPMBkXWosV/0JHejLJS3cFlCZgdAc9Dwgrnv2mvjJH62zxsKd8C571a/bMxD58QQDzsb/GOoYINw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Hscwx46baceg55waKLJ1Qr477R5dL2BnJoF9SDtp38=;
 b=BZFzEJiPG8Vvot3kNJ46T/q9w8QoEFeM3tNwivdrsuGcQgZI4V9qokOG5kzu83wqYuCUPmtSoRIKbyZ90lfVm5rJTRzFDP9W4iZw4zUntx/sA1ZxThOAvoOcwvd2mQUz4c2oJIxzFZog2pCHD3DvE32effZYY4NpKwC/MKOWZ6iUW3qrLyo0Z7zd1eWuhs9RX2xOnsZYRjxDKDfXpuwP9GGUt1pkAenghPKaGEG/iqZH6W8SKvLpJSE8QcM+Oq0UcOjQX6bthNpGH/8/jFp4i3IY+wkG/04BliEW6Gvp4r/6VsrFQfNYAdkJk0bhXJWnYdfs2+WDnLsBQ+Xohc3c7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12) by MRWPR04MB11493.eurprd04.prod.outlook.com
 (2603:10a6:501:76::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 16:31:25 +0000
Received: from VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953]) by VI0PR04MB11784.eurprd04.prod.outlook.com
 ([fe80::d486:debf:a139:2953%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 16:31:24 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] ARM: dts: imx: clean up fsl,emi-bus related CHECK_DTBS warnings
Date: Mon, 20 Jul 2026 12:31:17 -0400
Message-ID: <178456506636.3769673.16365529037910734244.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708-imx53-eim-v1-0-913b4559e5b5@nxp.com>
References: <20260708-imx53-eim-v1-0-913b4559e5b5@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH5P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::9) To VI0PR04MB11784.eurprd04.prod.outlook.com
 (2603:10a6:800:2ea::12)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB11784:EE_|MRWPR04MB11493:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea05fb4-586a-46c1-7b4f-08dee67c5723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|366016|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IrVSzBqD23kzswTz/T+kTpBhAshh+FadbwvYBtGrkQ98aBaRyhw+y7y0dtyWja94sPV3fsCvlYwlSghLWxlU+dGE21YiAzqHavzAjRj0G1SdA3PpAEzTHy8Yv+eqnpGY53KtY0PlMo5pCMtqRqRVTBWg8/M+zHMqPb74nTIq2AgF1tii9LGwWfkZ2y5ieXK99vkGkZ/Z/64YBRNOfVwoE0rS3f655aYcNGsNzEmXaIPQ+jYii/Y/BwGT7/+qNpBMFbOxZHwxgr/+2OIy+yuYFwplzyFrT6NerMRWFTQ9F65ZjECcz23ngX23s6glKh+82pwbHYz/kU9xj1yZTFsMTnr/AjK1K7DnBRtz918cMT0nFSMk8a+xhddCZAJatHTE3AdXRcmEOoXKeZlas1re0MBR5Y4YlLS3BFWusq0n2V4j5aEe6sBnlt/mPHKRJvfYQNBAG7UrneYXic5YUCcPQ/yJfcfq05emXm47iizOPh6efO7BKtdFoHIh/so2qPNbVjV+aB8U6jsYGQT87S41MsPbiOVF+QjPzZhspJU1iPLwkj+/fA0aKW1Kl5saVTBhONo43TLdOj5OvS0dHZEj/22+i/jCdUFgxiuT69ywJak9v6Bn1IIWSeqUt6/TST/zNkv/+uAJUVqTWo0htsP+OfN4JyUlVRnMyuT34bqka90=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB11784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clRISy82Y1NjUzR5VjNiM0hBNGtkcTVNZzJtNER2YldBMkVIRm9Vc0ttOFhu?=
 =?utf-8?B?MmNKNDAvLy8vcXh0citXaW1WMXRsdXRGaVhEc2Z6Z0xWNFRXbndpYnJjdkVp?=
 =?utf-8?B?UHU2ZzQzSVBrZUovNXUzOWQ5dDFIOHVmZXpkM09ERkhIQTJsZEcyTU15Q1lT?=
 =?utf-8?B?Vnhjc1dWajBzV1FHS1NtWHJ6OWhjeGxZaGdFUHV6UnQ3b2lTYlQwd0Z3WFJu?=
 =?utf-8?B?eWpPMFZKcGVyVVhnVHhXZ0hKZUlqazdGOUkzZGNEWWxicXBDUGtibW9qZHZr?=
 =?utf-8?B?TlpZS0JnV0QvTjNxcWhxV25WZTF1NmpBOFgzMlZDMlErTVB0NlFUejZjYTA3?=
 =?utf-8?B?RzJwTmdVMlJ5MGxVckVEVDgxRTZvK2RMSUhpTDhVSmxlbThiU3Frci9OaS91?=
 =?utf-8?B?MUV3dkFpc0tNa2h2d2p5b204YWNVZGU0U2FhMEl2L08rd1VNZE5LSFl0L28z?=
 =?utf-8?B?c2dJeG1ac1dTam5iMERqNUUxa1U5ZG5xaFJVc2RJQUVKRi9YQ0Vwc3psNnI3?=
 =?utf-8?B?SE5PMGNxbTJrY0Q3QzFGZTRnRWtaL1lqWDdTUWlOM2JTd3k5K0VGS085STdL?=
 =?utf-8?B?REFkaXM3d0MzTE90ZmxHZGZXWWs5aWhUOGNjV0gwY3M5U2NoVUdsQVM4YlBW?=
 =?utf-8?B?T1VlNGpZREErc0VzdFh3NUJueWp3VHFKaFVSdzZxV2lneXVrVHZSOUZDRC91?=
 =?utf-8?B?MitCamk2cG9KdmdYNm1vYzJxaGVkZ1lpc2NXZm45Q2hQN04yTmNxTkJtZW9G?=
 =?utf-8?B?eVBCK1lrOWFOMEUwYncyZTF5ZUhvTTd0S3JuL1hrQXpNcSt0SkV1VlN2bVF0?=
 =?utf-8?B?UGVmMEE2ZVZJZFVrNFhiR3FCdzNzN1VqY3lYL1RoVzZuREJ5a2JIcFptSFJm?=
 =?utf-8?B?YnJUWEhIZ0ZCOHhNby82VDQxbjZTekNYb1oxellXd2hyc0ZPcHNjSkMvc2lh?=
 =?utf-8?B?SUlIWFBDRFRLQ3NHSDFlRXQ5L0tpSGVGWUpRN0dLV0o4UzhTVWlZMVJnVGZM?=
 =?utf-8?B?YStyMlFZaVlvRU1iK1NKS2VCTzlSaVJlTjJJUXNhUzlqeGZoRlJ6T3dXb1V1?=
 =?utf-8?B?R2U1a2dUVEpTQ25lcE5kTkdyL1Zob0c4R2dsOTNiczFLUmdiQm1KRzdRVWxS?=
 =?utf-8?B?OXRxWFBrWWxsdzMvRnZ6bDJSZUMvMVJ4Y3JXVS9KbDhNbDJTQ3hRK2ZEdmt0?=
 =?utf-8?B?VzZ3dTAwUW1WUWYwTVJJSU1sWmdSQXR3UUthd0tQcS8yVFlRcjBVR1FGZUlF?=
 =?utf-8?B?WkExZU9XSW1PcWt4TnpFNXE2R3I0ODdnUUVhTkVaeWVHMmhXWk4yaEI2ejRB?=
 =?utf-8?B?Q1BGd3QxcUZLK0h4cHdQaXJmbjB3SlFqNU1kUnA5Vm5DeE5VWWhIaFpDVVZs?=
 =?utf-8?B?L0NxMjZkNklWVW1IRWdvd09ONXllbk80d2tVc2ozY0RWRmt1d3BvOVhja2k2?=
 =?utf-8?B?ZlBQWCs4TnhaeWJXaXBPNURnTVRxVkE1QnZVZHFRTVhvK04vMkx5VjVncHNR?=
 =?utf-8?B?b2pVcHN4YUY0aEJ0SjZ2dFdLR3ZrV3FVRDFvdU04OE5XaUJvQWRQRE10Rm1y?=
 =?utf-8?B?a3lzQnpoaTVpaVVzVnBUMDc0UW1rRkpJVnI5bFkxUUlTblhBT3hDcCtjcFVB?=
 =?utf-8?B?eGZ3N3JNU1hJd2JzcWg4S1paTUtDZVdtbFR5Y3F1aHd3bUFVOU1jZk4yWjZy?=
 =?utf-8?B?SVMzZFAwbURaVUpRaSs4dUMra1d3c29yRGIyb3RhTCs0KzVMU3lJMGVqRzUw?=
 =?utf-8?B?dnVsbEYrWkFpVk02NlBUNUhVbG4zdmk1dWQ0T0dMQ29OcHd2TFF4ZnNIMTlS?=
 =?utf-8?B?SGdVR0NkL0pjaUxNYnIwQXltd1pDc01mbXhmWWtRd2NzUlAzdW9sNTRpQnRM?=
 =?utf-8?B?RVBTMVUwc1V4Y0hZZ1FzZGpHb3hRV1NQZlRtQ0xXOTRhQ2V0MlgvMDRJeGt3?=
 =?utf-8?B?dVJlZkJTV1dMUDVqYW8yWTNZNi8rZnl2dVVucWFKK1Q3TkRsTWxCNzh4QURS?=
 =?utf-8?B?empDd0U5Z1VRR09seHlmSWpPT3lKUU9pOW1kOXhEMHJGVDVNM2dSbTFLYjE1?=
 =?utf-8?B?NFVYSndoZCtqaVhrSk0xQURaSmhMdGwwNUlRcHdmZzJIcWtqR09RRUxTZmFx?=
 =?utf-8?B?dVB1VHAxcDFlVk9sdEU2WGdLT2ZaMWxQaDM3eERiVXVseFZIWHZKWVBUcEZ4?=
 =?utf-8?B?dHJGYkhXcFJWNlNLSEFWMUEzQW9vN0VmTDRVU2dPNHowbS9sRCtBeG5VNGZj?=
 =?utf-8?B?WGxWNHdRemNOT0hCbENHVWI0Q3VKQS90WndtdkhOZFM3K1I5d0JvOE5CUWFY?=
 =?utf-8?B?Z2FPa3B2bnFmenFza3YrZktwd005bHZXYW9LYk4xVENnNWUxUzZndlYzTUEr?=
 =?utf-8?Q?q0ar1ivCM8qmUJ/Uvq0GqvGHEL6g+g3Q5slXO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea05fb4-586a-46c1-7b4f-08dee67c5723
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB11784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 16:31:24.7913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FiruMXcl9aIW/kncbq+t1IZ3TPlFC4Oe6TFiGugMEqPLEvfRgDRlk0kvuyj4FRqBu6B72sRvzC2M9bjuIa36QW0+P4QecsBW365BXcYEfdnSteKzTCd2yhLhKtfglkxB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11493

From: Frank Li <Frank.Li@nxp.com>


On Wed, 08 Jul 2026 16:00:43 -0400, Frank.Li@oss.nxp.com wrote:
> i.MX2 use fsl,emi-bus. i.MX5 use fsl,eim-bus. Since it is very very old
> chips. Just leave compatible string as it and allow two kinds name.

Applied, thanks!

[1/2] dt-bindings: soc: imx: Add fsl,eim-bus
      commit: b68333c76738be779876f0c619dddd4b0a7ddd50
[2/2] ARM: dts: imx53-ard: change node name eim-cs1 to eim-cs1-bus
      commit: 9d40f2a740fd64991919d6f58d741a44f736535e

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
