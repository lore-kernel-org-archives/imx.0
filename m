Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010005.outbound.protection.outlook.com [52.101.84.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CB13FBECE
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 17:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421818; cv=fail; b=Y4MdNZIwi6elpwXmmmyobbXHnxSMUiViRNJlr3FLpAGdqW4bQc5OWeg+0D+HHV2xJwsc+9gl2VAgiB2as6c5pxOPeiPHmfeXaRwsXINlISOezzu6rIOxomctYINvDek6swK79XpuDAdrOhwW2ayCphdVZ01VZkMdrbJsg/YIujs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421818; c=relaxed/simple;
	bh=VPm+QMapBkI/dfqdly1EoURiEdHrBqvFvWdEB2R/2gM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RXc6zXO5m/eEzi6KXTTg0CsjWOl9aNDEsFJTylucJtTrZHcHbbt/XvqTuZYjdBpRsI1P762Y0Z+JwAXndpgSOF2/tL1dGQrZ60XYOFXg3gVc1/OeQquIaQRI9Y33zONBBBdGn3yPQCZUMEWUtPv7fL8n75EA6Ke7wM1YLHSwtEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=V1Ds3I9v; arc=fail smtp.client-ip=52.101.84.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="V1Ds3I9v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gb6dd6HXSgqJ+fKVWWHIhkgxVDQW6VKE6Vk1LyZBOMFvoE0uhXK6lJ7Zjfv8OCU12YkKE+jYEEkTCoNq9pG21Jio17NGNbXSynH9K8oV/hJjjS91FGqEONbyDyjxhfsUwuAt/pRL4I/+aZX10En+/AcHFCpe8I3GO0VcWLqd4TLV8HJ+lk7kYyplko7denyR771+tYrRwhSUY3EcO/FJFflC0PkFOkCbuqqJQ2v0bcoJA9KyTiSEQIM3pkhwtm1Nv58o8lSQvtFEYrcyKZmmHCVBvAmoMQxRw/I2wSkTLgNg+HptbTlF/NDewYXBdaYrqzNrgi3AN+DduhF910jkbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJVQe5c3M68rzvstWyGpnAxfYFDg9kzXXrAJjm0/A4s=;
 b=nrfiC/QKfZwPhdJnry1kq8kujZf/PkIijPJqUIAfM8lt3sSaNwNZNzsB6JqdP+buDlBkYVIu5ovR9zKcsw5Ty3Up6zc0DJSvNph1pyZeXZDLr/OsAi8fPEgx1ozHxhJUguVTyV3XlsRyIeLF2nxqgWl6GrSK7WqLM0GyBy9KQeR8/d9CVHO63fJi8VtPLsQZcR43oJHL23Ii1wZKltKb0PjmhX3W2ToM1tc2GV/CmY4SqNuSeLLokCTMh+RT4TQ6TnHHLyZBmTiAu7aMSHLIE865miHERdAOEohxXNbcE4nT8tzaA3Y7PGlsUWUQKGncnzI/kuB7cHNst1YkfIR4Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJVQe5c3M68rzvstWyGpnAxfYFDg9kzXXrAJjm0/A4s=;
 b=V1Ds3I9v3P7Z/ZEgcKqMMcHYR95SmKZHl++oJg2nCD9z5tyhJigYlVPK5ze1djzOVBPVkSn0I5y3vvZxQH1SSLxeW3umhZK9GLBd9Rg/FCuR1nx8SMxKRV9KTZfggHUazifWtW7x68U+c5YqXd8iuuJHFBndg7R4sjSjuBcI+h+v2Eruf1a1o+uTeVKZmX7e3al3YtlODbkuR3fJ6tBgAOszFP/ECV4DpvrvJLPu7CIRyyCwFQ0saKG1XZ2rOlYnOGFcCZI369er/7xNKl1GTWbkso7x03zMy3lojc9vlG/CoQ918i/6pyWWJrgYDqDnMEKzNLcbMYRlPcRGmXP9XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10702.eurprd04.prod.outlook.com (2603:10a6:150:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 17:36:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 17:36:53 +0000
From: Frank.Li@oss.nxp.com
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Frieder Schrempf <frieder@fris.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] arm64: dts: imx8mp-kontron: Fix GPIO for display power switch
Date: Tue,  2 Jun 2026 13:36:45 -0400
Message-ID: <178042180222.3440036.9442732960327112305.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528101556.75926-1-frieder@fris.de>
References: <20260528101556.75926-1-frieder@fris.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0137.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10702:EE_
X-MS-Office365-Filtering-Correlation-Id: b39092bd-eb13-4fc5-2023-08dec0cd88ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|22082099003|18002099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	6QbAQouUyFaVTvhpWn2l9v9HE+dLBx1wJb9NIbGZ/61BEJ6shaE3BxGJ/Csu+T81NzZhKTLjRk/rK/eHMjd3XZbH61XnUaakK+h8cpFz6MEF0hJMFQJVdE1X/OWQMTZ2tBIzN6xau106QH1TjfXqses97HQ69LrkcRxmNuhhDFU97K6hn91v8vKpuyS5B1HWx6YQZkxAU7basiPNMuZSH9OV0r4lQRM3AkFYwD4tsrgkAI3ifk5C7CJ5PW9zKkPY927qYje6R6WmgYsSh8ehOoZ1kTmZT86C6EH/8+DjZh/7yNWjgPJ0SrHdJ3rd1Jv1CdNydkoJQNyX5WGz2uaBMIaM6UnxZseXvGTTr50u/tVgdQ4pRhGWG0jdvFEz8/dNzYMTnBEEI2BcwsoPZc3BjdzB9pjKk9sDwv8trrJ8bVJbWJH2zXJ28oQp/mOkaR0G12BPhXJNUyCUKGuGxDXZY8UDgYw0DY3n2vdcsubluQ7+EvWmaI4uvPUUmoJ3TcxR1kUcCcEU82RX228itzPrqnere0m6pKrIsSReCEImGIrYndH3Gz6beY4wcnX1Qs0D6W60GNafLoCrVuudl/0Xh8hXeiaA9oCS19wZrF3S76jztFIXSbTNIuNLpMLrASZqZ2UbRfsQ/T8h6z3PnyB8uyatGiOn3Vf0lPTdMe4rk+gs0CaDdaGfyDZ7jLdOSucXBIIpAYOdiuUaHj9rNZe9wzAfRODbyttuhRv/DUAH8ow=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkhDWHp5VUQwYk9VSlU1Q2RKSnBlQVh5dXdzcjVFb3Jld2Z1OXo0NnRQWmdB?=
 =?utf-8?B?Umw3VHYrUGxzbVQycHNZTlkxcVUwbGRhRUU5RnJKdy9lZlNxSElIRG5zaEFq?=
 =?utf-8?B?c2tVUzRXa3plVWV4NjcxWDNkNkx2L0Uwei80S1RYTnh1VGNIcGF4bXI0RFNs?=
 =?utf-8?B?aDVIcjlJTDR6Tmo2WnpJcWVRZ1pQSUNOZWx3ZmY3RXlVQUJ1SVFzWDlwTGJw?=
 =?utf-8?B?ZnBZR1pLVVRETUdJdytaZWFTdUtxMnhzSVFLYmlhcWlaVHc2VWRXM3hRV2xu?=
 =?utf-8?B?bE5PY2l2SmUwK05pRDhhOHF1MXVLM3FEQnYwbHI2S01GWFhxQ0R0dHpjR2FT?=
 =?utf-8?B?YmlkVncwTlJBK3RJTHU4VGNaR0w4NGlJc1VBWmdsOVZuTFEySlpabURqS2hJ?=
 =?utf-8?B?VjFPY3ppZlA4VlU1MlVXdm50SGJ3VVVESWFvcWJpZ2FyOEVKcVpxRDhBTHRk?=
 =?utf-8?B?QUZSS21oMFVvTTVXODBBbmhlZlYvbGRGQ1NvSjNOTXBqYVI3eHNEWlJkZnJI?=
 =?utf-8?B?V3d5MTk2SVRjOWNoL1VuUDlmczFEVEZ4TUxscXNuU0ZrNG5pKzFOeTl3eEFS?=
 =?utf-8?B?YVNuS3JrdzVJUmZ2cHRFN1VPbnFLTDA2aEdXbTc1bXNFclA2ckIzUTBUaU1W?=
 =?utf-8?B?bXFBM2c5N2lNWk5CbGxsMnF3Wm11L1BGZkRudVZjUENaM1FSazhBU3gyV3ZC?=
 =?utf-8?B?YkNjSmYzS2o1Q0hhUERraFNPY1Q3aFdrMjVQUk1FN1VyT3ZUdWkwMGJNSm85?=
 =?utf-8?B?OWdnNFJHU2YvWHJtN0Z2TTZZUzVXSFdNejdwMzdCVUNkdWE2cW9vS08zdG5h?=
 =?utf-8?B?aUhaZHlmb1JYTTF5a1BFMjJQS1BpYmxuYnBKK2VFYm1vVndNeUxvSUl3ZkE3?=
 =?utf-8?B?NThMUVNMWEZ1WjB6V3p1cm94bFBiNVF4TGJScjRBRGxWMGpIeFZ6Mm84N3Fw?=
 =?utf-8?B?dVljZXBFY1hBTWlrTzE5TzNkSFVKOGJDWUZDYmJtbkFaSEdVK09YTnFJOVR1?=
 =?utf-8?B?ZU1PRnBCdkxYY2k1OXVBZ0tXNVpGL1pjMnlmcjgyRDZXTFh0cDYrVjJrSGFj?=
 =?utf-8?B?dXVoRWxwdng1K0ZlcXRiZjE1cWpOMGptUnF4cFZ3ZWtmT3lNdzNHS0xaRFRI?=
 =?utf-8?B?VytJY0xUMkI2RGRsWWU2MGcxaENKV1Vac3haM2JjSDdUQ3ovQ0I0SVhqYUhY?=
 =?utf-8?B?amxwQkQ5Smxnc09Ocmh4QUdNTGVQMG9KTEFVMlJ5Tk5UNWlxbzdBV1dMeHJx?=
 =?utf-8?B?bHJjbnFsZFR3WmFLQVBhRmJkMGFVYXh3NHY0eW1CQmtvRWo1ZjBUdXV3Y0hU?=
 =?utf-8?B?UGxHTkF3MWxjd1JPZUNzWWcyblFQS05jTGNLR3dUNHVyUXhicHYvcHlJWUx3?=
 =?utf-8?B?RHZ0NlNvZXRPTmhIRlo2Rm1yOVRiVUdFZzYwT29kdjEvdVMyMmoyZzFKYmFt?=
 =?utf-8?B?eUZVN0Q1R0JKV2ljUHlQQW51TU9aSzR3aDM5eGRqVWR6dHhTdDIxRG5TKzQw?=
 =?utf-8?B?Q2VOU1BmV0c5VWxxK1d0ZVh4SWpFcGYraWhzWW1sZzVXZ1gzWXY4ZkliVnNH?=
 =?utf-8?B?M3B1cWVIdkpQSHM2OGcyb2g2Z1FKblFyTFl5TkxNN0lkMlhKcWxPb2FTVFRV?=
 =?utf-8?B?aWNJRGRhME0rNUM0ZlZOZzlZTi9tZHF5VmpQK25JRnJKeGxTeFlXOEg2UU95?=
 =?utf-8?B?cVhtRzh2Z1Y1T2g0eU9UVmhvRVlxdDlra0NVa1NtSVdUZmM1WnZlSFM2WWlK?=
 =?utf-8?B?akw0dERPUGM1VmNIVGtyNWtTUEpBVzRWY3Z1U2lUMzBCQzB6aGZMSG81ZHFV?=
 =?utf-8?B?MTlDUVhaQ1lqaWs5Z2h5SHJGdUxEdVh2bFB6NU5ETjc1SUdBVU1NUWxQUnpO?=
 =?utf-8?B?SGdlVWU2bm5ua2FtRitBYUpyZnY0S0QrdjBCVUNtL0ZxQXJtVi9qc2hhUlpw?=
 =?utf-8?B?Z1U0MkxEZ29wVEZQVldtcyswTWYySFFIdUlMM1JuMDZ5Vi9QdzVnM1JldlBy?=
 =?utf-8?B?L1RVZ041d1NkcFdTRHZTWENzTnk4cnVWVXFvL3B0aUcxK1pjdldYcU1hamJG?=
 =?utf-8?B?NSsrMG9Na1FvZXVsYTQyZEZIUXVPYy9sUGtpeTRvUXF3RjBEYjJqUnFGUHU2?=
 =?utf-8?B?SG16ZzlwRWlxNnA1dW1IL21makZJWW1mRGJQYXR0cVlndG81Sy9QQjdXLzF4?=
 =?utf-8?B?OWlpb2VPZEd0a2ZkNE5ia2Y2UEJIaGE4NUoyMFMzeUlkZ0VSZ1pXakMzbnhw?=
 =?utf-8?B?R0Y5THQ3cTJVaUlmUWhrRnpoVGZ5S1VzNnRneHhsbTFNdVE5SHlLcjNkRnVw?=
 =?utf-8?B?WjJmMEllS1RCb1JBblN1aStpNGZXVENQUXhJQnZqSUt2aFk4Mi95VUYwZUhS?=
 =?utf-8?Q?rA+LKRrEf+xqw2TU3PfcuOQRbvBWKI3bNTxiQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b39092bd-eb13-4fc5-2023-08dec0cd88ad
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 17:36:53.0247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjYaagklYnNZFvkSv7JIp8R4PkWL+zGNPJvF7CZSES7ObQco/YGVbD+/2Rsdy8jvH/as7gTjMKuXtWqGb92eb72cfhwCddEyVi/UiTvH7HijOKYb/2lXwgIw85S+U9TA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10702

From: Frank Li <Frank.Li@nxp.com>


On Thu, 28 May 2026 12:15:56 +0200, Frieder Schrempf wrote:
> The GPIO that controls the power supply for the LVDS display
> connector has changed between early prototypes and the current
> production design of the hardware. Reflect this change in the
> devicetree to properly switch on the panel supply.
> 
> This was working before even with the wrong GPIO due to the
> bidirectional level shifter used on the board which drives the EN
> signal high even when the input has a (weak) pull down configured as
> reset condition of the SoC pad. As a result the display was working
> but the supply was always on.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx8mp-kontron: Fix GPIO for display power switch
      commit: ef64f97227a44177d68206cb88a9015897e34571

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
