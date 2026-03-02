Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013061.outbound.protection.outlook.com [40.107.159.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F4E423A8E
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 16:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772470330; cv=fail; b=X70B8Z+hrfyRPBB+pDDLyMpJMcNx4qa00p/BszkkQNu4Of5motTJpA10+fam4RhIpk+K6fdG2p6c/5tcPXc3fKzozwuJyduIcjBRaUSH3eUbYZuZxF5mr8NFXeLkeSXc4s0uP4kkJ4b5oI5kbpe0Zk5T5TdoRrjpCoWY8DjIM+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772470330; c=relaxed/simple;
	bh=W0ezom5mzXV10RyC5n37yC9WSH2+zIwASd6FcxuA5xM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=jitaFzspFwZTBGDyu7uJ+Rr5+sRmjI5NYezWMiknoLKcAU6Y3Nth5r1iIVhPlPwr02dz1JsPC1j+VCt1P+PyzqyPV+fPkeOdnj9WTISGCxhARrRMjnqjKsYRr8DCcCMsjDhs7WpERAVAUXrmbX8jTDM8pxdXGRgztjHnRDaeu2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=a1srk+5a; arc=fail smtp.client-ip=40.107.159.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="a1srk+5a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ww8hYBKf7e5Y+AjQqMeg6IKmQST0RSR72/l/JeBjbYLeDV5DumhfcH8K0HzVdjxwegnR9JVDs9ov/uruR8afGb/ccS4qjjvcBmq8imLrhsvfqQH/B3oq01tBPu2LRVpcs5r71v3+E0klujrack4gGW+86F/64lyHfL1Z2D4GrxYd6WR6PCAO+WDZ6BYfis/HwAHbUxDZB6D5rgpBaX0u71w5toRe9/QxgeUTrdfyqE+UQW45WuMFJ/VQEZ38ybL0IKpKqVZPTBtQFp7Ufq5/Zqu5oed+SX2UN7E3JdPP0KTnf8SycnW40n13fUaaWqWgu0d+HrdASKAA2nLC4ngJLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z96YKgKUprb5t+62raIgGYWgk33hYDZhKnqi+h2MfNM=;
 b=iY1Nwh81hXeLbgvb4pKbiaa6wodWpEdqZw7tO9P4PHefb0jhVQblA3Qyt7O6SBkJTbTylj3smZCF9UoME3SURNNQKTUZUZwpxQRoBDfhthxTamerkqluVVO73Z6/IbXlByCr5iqirB62IP3e3PUsDg4hVjkuF3XT8RMB15qsjWEMurbk4ADKzxN11cPVL+oN39wjLtZ7ozExJYxA+jXI4472jWgwXDnkbfHOxFkWChvqtY7mHsaZY3Vmz9WE2/WLbwROx9A5+a4i9rWBFPLiRuMO39487AJsJyFIhJL0DSz65CVHBpiYRjYq7v1HcBGFPTdzflztpMJr7g2niNwbgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z96YKgKUprb5t+62raIgGYWgk33hYDZhKnqi+h2MfNM=;
 b=a1srk+5amO2f2MYgX6akNCdlQSfMjbxi+xJMuk43I1B+lYIj6hIHhFRJex3RHybfEIWUGjjY1wtfH6EhIWwsmbiEXkl+4m/YLmguVd0tWY/yXpOdrkbSKt0S4BFezkn1u03OBE4jaA87Pw6xaxbIpdKVR8oD+0EwSw8bi4Z/fxzfpVBTlfOvNIvixqOM90AcnTFTDk5Ygom3FyrImwsEqJosBSgNZNmHfHx6pQEmrxkze1ZcYzLdhMKyv/yqZSy/O56v4PWQVDu1A7sdUZZKbRoUlhbOl+BEV4mVkpMViifDbr27vuo6mHOumxagAn5yHUiE1DsT8Fqseqj2hJ6OYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AMDPR04MB11652.eurprd04.prod.outlook.com (2603:10a6:20b:718::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 16:52:05 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 16:52:05 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260212-imx28_dtb_warning-v1-0-696bcf1a992a@nxp.com>
References: <20260212-imx28_dtb_warning-v1-0-696bcf1a992a@nxp.com>
Subject: Re: [PATCH 0/8] ARM: dts: imx28: cleanup all CHECK_DTBS warnings
 for imx23 and imx28
Message-Id: <177247032266.2112985.15137761878583862320.b4-ty@nxp.com>
Date: Mon, 02 Mar 2026 11:52:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: PH7P221CA0017.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::32) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AMDPR04MB11652:EE_
X-MS-Office365-Filtering-Correlation-Id: 54b72ea5-b92a-41c8-e8eb-08de787c08c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	829o3yvrD+pcqx/Y4rcGpdouBUwqGJAyLYlqwCSaiDT8pSCBUWRIaDKDZG6CoW5kW/hX3Tgj19NWOUYnDZwoyR1cfdrlOO/7buXbtBbSKhNxumvIlQe9Y+2NsTDK+2pJofA69bEDBYnfdniENIo1YK1Tho2tFwhLKYNa5D+0LHmuk1D3bFPWfJWAFZQbgW9GKWMwHgOU/mote2ChKtB+yHrRvLRIADJu7XZbBdtsCGjbtJz2M+XSuhRSMNB+F+Yta18du1NvomdTUr7PbzDE4Hpgbv1sFmA+V43c2oYzpNrkIh9Dbqz8chnBfodlQWe+IvWzOHGrLLseWsXLBmZ9Kk67n+Haj2823B8wwoNn56arU6NSuEXIXzIG6MHhIDQZL4hdZwSw9Mb1VC7YmpHt9Z7+Q6Zm4+RxemmK9UVbG+7n9HLlE6GpGfmzhbBVKpcRbhsnub0GhTP98UzO82GruEnf2FQzhbQHXvE04kk1+pAf/TN9j9jEyvACC2XmH0Dgqpxaa1tI7IuDb/yDy7kq9oSWZP0iq7k421DrDp0Rdj/lapemv3CfW2Xa9+aJSeTia1ZDP+4eGAK7U959aA8W+imPd1Iii7a/jrbWZhG+dHcIRnF6WEgMvGYI0Q+kEUemZGsCMRl+/wXBmwuNL+OviXIUB4LNlG8XydLQ7QjjKj+zxG/Y4g29t46NdePUMjVCWBu7WaUM6AdW2mvUlJ5wbdtt7qdHEyRDJrT7wvrgmVySgAJqTuHO8qjMg32czhe4jrQZzg9haI7zmvtEX7aE/+v7Lj/af3QPuHL2dxCu4Wk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXZid0lDRzhZSllKcmtKMkxXektVbE1Ja3R6cmplTktKQklPMG1xY3lHcTlq?=
 =?utf-8?B?SVQxUjhiQnlIck9seUVhR1hIMk9PT3hXQkZWZ2tLN1pWdjQxMU5aRk5iSXRj?=
 =?utf-8?B?aXBhWjBZck9ZMnJ6L0didERXZW11czZwTk1KM1dWZFRzNTMwd2NTcWpwNkVP?=
 =?utf-8?B?Y1dvdFJNbjhPYWN0ZmRoMTZyOUtPUlRSK3Vwam5uRmRvcmh6UUI4blg1T3N5?=
 =?utf-8?B?UVdIR0tkS3hzVFRxTGw1NnJzUG5zM2doQnlxSWdvcGFxamg1U2VKc0NqdTJ0?=
 =?utf-8?B?blkySkpPUGpJOG5MVXRRODkxaDhyYzkvdjBzUkgvRnFSdFBVV25ObDZHbStk?=
 =?utf-8?B?SE9VRGJPbmU5RS8zYks4aVJ4WkJvbGc3NERTaFF2dWRBUDdFTm9KL2FncUpj?=
 =?utf-8?B?UFB2VWJhbWQxV2ZyZVV3eEpIRTl5SVRORUg4TFZ6RHdDeHFJNHliYmliakpw?=
 =?utf-8?B?WWNtVEcybEZ6bFV4Ump4Wi9HTlZKSE5wcnFKWllLREt3ZmhlUnYzZzd5aExS?=
 =?utf-8?B?K3NWMFdQMjRRL3cwZDlZSktITkFRdjdHRkpaTHpyM0FiZjBEcDBKWm45TXpS?=
 =?utf-8?B?WTBRaFYxMWFDNjVIQnV1aWJwZGQwbzQ2eUxBOE5DSjFLYjRHUUcyaHI5aDh6?=
 =?utf-8?B?QVpwZG5mZFF0YUJOcWJ6ZkJMeU0xZlVoWHBCc2RpRzJpNGUrOWtyZ1F5TXZL?=
 =?utf-8?B?RUlqUnpyMmdQVDljck5rZFp2QzFBYnZwTG16aXFNWXVISXJxQ1U0MWFVU29v?=
 =?utf-8?B?R3RhTjlrT1Z2ZExVWFlYRFdUSUt2VU9VY09jaHdLNUUyRlpYYkJ3a1pOd0xD?=
 =?utf-8?B?Yldva2ZNdU1WdWphRCs3dk1KUFRrTmMrNzQ0cStyOGZBU0YrVkt2R1NxT1FI?=
 =?utf-8?B?SXZSQkJnRlNhWWtLMTQ0WC9USnFZLzJxWXhSWlI0d2h6RFpUcWhTcTVuR2pB?=
 =?utf-8?B?SlB5eHg3TXRYOG1QTXZhMDY5RG8wZHRmNVdlTkxvaGpReUUvL3FUanZIWnlq?=
 =?utf-8?B?VVcyYS8vUUJCWmlTRUlTME9GMHAvd3ZjUndGNmJvVnZxcjRkdFZzSWlobG8w?=
 =?utf-8?B?SVBGL1R6VzA3cnBSOFExT3dMZzlNK0s0djJ2Y05lN25QUUhobXFLVlVTWG9K?=
 =?utf-8?B?NkZkSUNCN1pIaEZKdUs5VlNzK1hWR3o4L3dBN0xCQWFiN20zRjhCS0I0S3Nl?=
 =?utf-8?B?L3p5dUx0bldSeVp2WUJ6R2pZdERkQ2E4YWF1d3ZRdnVqRWdUWFhpMWoydEt2?=
 =?utf-8?B?aDRYODA4QVBiVSthVTVNVGRkVk5aNUFLWEY1cGxxRGpJbnZwR2wxTjNoNGow?=
 =?utf-8?B?Wk5pYkJjSFRsUU8wTW42S1ZKSnlnMHJQKzdXQTZMd21zQzdWaEI0M2wyU2c1?=
 =?utf-8?B?TnVhdmh0aHk3cW9lS2QvNVl1MjdmTUg3Q2tiWitIK0FFZHVsLzZMMGxHM1gw?=
 =?utf-8?B?eU9oSUY5V244RTh2TEhTb1hPVmdUVUVMOFNpdGJvd2tBZUhzU29XTEtSeDFm?=
 =?utf-8?B?VTBqSmdzT09NVnNtRUJKTDJYUys1dkVuakJ3MlQ2VDM0S1poc2RFZlNxb3A0?=
 =?utf-8?B?NTNCbkxNNk42VVhwZ0F3M3BqdGg4Sld0ME4zV2pTQ0ZlaWM4S1pSaDZ6OEZl?=
 =?utf-8?B?UCs3aHhIWXJJWTlieDUwaWV0R2U3Y09DMTYrenlWNFFzcE55Ym1uZjFwWlEw?=
 =?utf-8?B?bnJNR1FKK0toTlI3cUhMRUFEQnpVUkxpMVJHcUJ6RFBUbk5KL2tJaXRvU1hw?=
 =?utf-8?B?cVF1VHpsc25MZnRJTVIxMldOU3hNcUI4SUVuVGVyZlNKQmptZ1N4dlp6MU12?=
 =?utf-8?B?VDBMZG9NRFR0cFlPQ2hvYkxWR0IxeFRodGdUeEt2d1Q4bkFRZ0VxRkNMaWRR?=
 =?utf-8?B?cU1PZlhVaGNKV2FKa0dnL3p1ckNQcU9JQmcwTDBVYmdsb290S0NEM1JQNHBz?=
 =?utf-8?B?OXhPem5RSERuWTVJVFJDdjJOSHpiSGhUamErZ25lVnlhV0QxcG5lZzhJS2o5?=
 =?utf-8?B?OWFsQjFQRHBZWkZGUTBZTFE2cFRQS3VoNWU4LzBYQ09CNDAyQnd1TWE4REQr?=
 =?utf-8?B?QUlHTlBmYmVOZzNBU0g3YUFZWmlCaG5QTGJQT0o4MzR0bXEzTUUrdEhueXZz?=
 =?utf-8?B?UUxmcXpTSFltM29EYkRoc0txVis0TURBU3E4R2szeitzcnNpcUtJUmJ5eXpU?=
 =?utf-8?B?MThycmxaRGE3aTM5QTIzRFFjT0cxbG93WjVSaGVUek1BT2pwNFIyWnhlZVRD?=
 =?utf-8?B?V1lJMWNrVElZQlZuWnNoRkpxRGRqWGZybDBwUkZYVGp0V01IVElnOXZZRjNp?=
 =?utf-8?B?UTVjS3VwZUdiMUJ5eEJleEk0a2RuVlBKL3dibUxvN3BibitJaDFXdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b72ea5-b92a-41c8-e8eb-08de787c08c2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 16:52:05.2801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qo8p6XTEtcCfom5ng2kU/7Y3t3t1CaqYpFvrD8aPS9P+29idIGxA+ik50gbTqMyuth2/M3YIhEQiDKhOn6mm7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11652


On Thu, 12 Feb 2026 11:19:42 -0500, Frank Li wrote:
> Clean up all CHECK_DTBS warnings for imx23 and imx28.
> 
> 66379a677ad41 ARM: dts: imx28-tx28: rename compatible to "edt,edt-ft5206"
> Not sure board use exact edt,edt-ft5206, but it is comaptible with
> edt,edt-ft5306 and edt,edt-ft5406.
> 
> 6346f7ecad97a ARM: dts: imx28-tx28: remove undocumented aliases
> Not sure why set these mystery aliases.
> 
> [...]

Applied, thanks!

[1/8] ARM: dts: imx23/28: set #size-cells of NAND controller to 0
      (no commit info)
[2/8] ARM: dts: imx28: add nand@0 node and partitions
      (no commit info)
[3/8] ARM: dts: imx23: fix interrupt names for dma-controller@80024000
      (no commit info)
[4/8] ARM: dts: imx23/28: add "led-" prefix to LED subnodes
      (no commit info)
[5/8] ARM: dts: imx28: rename gpios-reset to reset-gpios of hx8357
      (no commit info)
[6/8] ARM: dts: imx28-sps1: remove undocumented fallback compatible "mr25h256"
      (no commit info)
[7/8] ARM: dts: imx28-tx28: rename compatible to "edt,edt-ft5206"
      (no commit info)
[8/8] ARM: dts: imx28-tx28: remove undocumented aliases
      (no commit info)

Best regards,
--
Frank Li <Frank.Li@nxp.com>

