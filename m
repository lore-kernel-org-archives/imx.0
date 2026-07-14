Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023096.outbound.protection.outlook.com [52.101.83.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC460409635
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 08:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784016563; cv=fail; b=or7bLupOf6Vo2GiaOIykgoDi7FhTk4OSDvvAEcg0OtkFX7uyLmHnFs1JrWewj3FR8EzLZ9jhuujHTubxtFz0Nd+6Uh85eDFeDXNcHVYiObXlB+kXBCiPDfIwC50h76FNA8Dv8vMfPPr/9Tmj6EGalcl95orH0LoBObRTIiO59Jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784016563; c=relaxed/simple;
	bh=hVWqaYmoGLnDBjEoJncRB4YN3ec+YqCVB16cpgYbk+M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eh6y6mplvyJ9YdWf7gpx6b/LeXFrKnURVYcnh2pigmh3gGQZVdwfZzvcF0dRGrkgrcmYPAaKHpQQzS9DlgIMXGh8HQLDBCd7gGFMb3cRaVKFJqlXnpPqdQJFh84+LKZ3v0H0UYgHVtYslcKXpb+0RxldBbObdmHT/8RfPEmHRTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=O5jZnE7j; arc=fail smtp.client-ip=52.101.83.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="O5jZnE7j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEZ+hy3exLfYZH0SlIjTAYkZPci796I5Cy+wJ4RQZRxpBRDRoehmVtfRr0WlgcdygJcJtaYVngrmXFM59rUhMvSXOm3HNVZbww0s682OTgKMTXBoGWHjddrbP+9kuOxpNQn52n8i7I26kV9xv5pGOPsNS7SLWbDou3p2NApwNy+wddaPkNn9zYj3UyLPmW/zC22XALMSqafFbUA4iiZBYdRoqiLu+08FLp1utksSE5oXRahBVNaR1MO40SmfHk9LVroA4EOXywaFM9HFDDtzlWS0KbZkIHJ40QXMgD5eX1ln0FhcjQaOxpo9fFit7VP8lTOC3uM/VYzSWkdiN2K3/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSZSEoq0U+Z9WhVgdOm+kjK1UkgCCKy4mqX4dJKGnHY=;
 b=LqzU5t28uU+NPy4UTuOJf/jhPAM21iL90ftTNc1zuwWb6IMGUnxkfo6AqMMXOkDcdEXMixPGO7Y09hyqfpFtMLv6NWN9sdxNKT/nQ5b4V9a20KlPDCtcJea3OYUISpkLPXztqOuia4POfYEhHyPCTzqdHf+GVldC5HAfuXQS6/sGrXXRRPmreAVAMuIfJYhxIsIkXAnMRx+4bbC1x025VaZ2XetUpow6MkdzOA1v60YBNSd9prAUYqIqveK9zazQY/eV7BAlPbvXJJKLpNMjaH4hXF24BybAyI8lDUFhdswfTKgKZzxnVQa0cE+sFjvZIbs5/SxQtQs1f2zfUHySdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSZSEoq0U+Z9WhVgdOm+kjK1UkgCCKy4mqX4dJKGnHY=;
 b=O5jZnE7j2jcHtDS2vwwGQsGI3YnjN+J0gtz30gFmUiDOw4ea/bDMssJpA5s9g/HHFrdlN1p9vPS3XgAeIJWc6YXi80tcQ2APg4ctdfVad9mmg3Qocldw+C3d55jQEcMqJG6jvzyaBHdjzWh+cXoXCyHCyv5P20ZqiPuwfnVFKwzb2WyUxXCBq+TLCuV7X6uYU64YwnA1UvX9W6DbsfEYSICemqfyVOeZWr1Twh1ZnHXJZ3VFb4p1VooogImST3+v+tWq4xagI5NNUl5aWhdSzonhImdWwdCd5eZS744fRa3QaW5afTdr1nt8LW9hRk6KA3gQRbS9jV6IwIMB4GQSsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by PAWPR10MB7389.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 08:09:13 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%6]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 08:09:13 +0000
Message-ID: <e515a6c5-b32c-47b7-968b-0f6a66e4f24a@kontron.de>
Date: Tue, 14 Jul 2026 10:09:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] arm64: dts: imx93-kontron: Enable ELE firmware
 driver
To: Francesco Dolcini <francesco@dolcini.it>,
 Frieder Schrempf <frieder@fris.de>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Pankaj Gupta <pankaj.gupta@nxp.com>, "Peng Fan (OSS)"
 <peng.fan@oss.nxp.com>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
 <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-10-b8266d93514b@kontron.de>
 <20260714065947.GA22086@francesco-nb>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20260714065947.GA22086@francesco-nb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::7) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|PAWPR10MB7389:EE_
X-MS-Office365-Filtering-Correlation-Id: 37aa9b44-85e2-4688-5a42-08dee17f3108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|23010399003|22082099003|18002099003|3023799007|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	XMRoYyijFBBhnIaomNrLWBroN/OUqNydfOQ55Eg1xX9FVU5UL+CoFWPVzdehVqwk3a+e1bMgyfjUsJUwKlXfM2v5ZKATt6zcqGHmg0BtiABzYatAQjgRjImrGO0gR00fA7KNr+wJwvy6nhxdKo/5y5aBn1qqdBFWSXOKRle2IKcJSelpH7PAKCf+UrmjUk1jhYcSD7G2jV2Fs2WRUA9X0mS89Snrqq6ajVeqmwB+aNaBPNw3tOSB79O1HOonq8LM2NRZRPJkQ+V00cwpSKNoxu3z/yq0yUjEbKOnHHUsaPlqJtMKyGwsD1wh7+QFvFwAeo5DigJUQmSnH21KTuIW4nSYMX/dw7jCU7RpwrnlyuYr3Wv3JajYiMecTJTUZhLT+vzHJraeeaZkt7IQBFibb8h6yRUC4/H6agadTapnaM+YC86YEG86+QuXLHR/j4Gdp0QSQ0xsKcBMwMyQtQgrm2a2ISIDFhGAeR1tqRCaejK6SswJAdTtxiUWyXe5PDUkhl4arddr+EUTaWnUyQsDzA+QAYPz7bYbi+PnYoBMBMSFbLQYkk9aopahUAPbDv/caGt/jQ9VCI1wqz6tXfby30TVmxGQlGQOSNxb3BidwoO7R+p8p+KBttzkfG5Sgrp90D0Qj3PI75lyCrWSlndAgUzr/WJy6JKnfKLSRgcpZ5Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(23010399003)(22082099003)(18002099003)(3023799007)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVJzUzhFOWhjR1o1SGlNV25sN1RDelRBdVhhYzkrVzhIdXlsZUNocHJueEc2?=
 =?utf-8?B?ays5am92ZkZ0MGpwRzU5NmN3a0dWa1FGOTFVMG9Ca2lTWDErcTFZTHFYaDBk?=
 =?utf-8?B?eWMrNXRKc1JMaFd3SEswemhnODFwTERxbVFDOHdLcTJzR0h0RHpFSTJJdVhs?=
 =?utf-8?B?RFoxVEpnL0JqcVpRWFZXTjg3L1JDTm40YkgvOE4xUHQzQ1Y4VkIrM0IzWmVq?=
 =?utf-8?B?RWQweTVGckxFTTFMaklscnMxLzFBY1crYkZlSzFOU0NzeHlGaGJPblU3eXhp?=
 =?utf-8?B?Mk03cGV4UFFhaUljQ1dOY2YwdEU3OXcvN2NGRmNrNjBvTUtSMzJ1TzR1MkUx?=
 =?utf-8?B?Y3BnRzBhSkRCSFI5T2VxYTVvdE54OWsvUFNyeXBKWEthN3NrbHRnWkt0SS9l?=
 =?utf-8?B?UEF3d0FFNjNyU20zRitWZzF2YUhCU0t1aGQyejRJMzEvVDYxT0ZUd3hjeFNw?=
 =?utf-8?B?M0oxUXFSaTZQL2UvL1RjZnBZY1pxS0NpRzF1UDkxZzR2WmRHcW5EYWJleWRr?=
 =?utf-8?B?QkhUczRBTncvSDhJWXRCT2hyRU52UUFXanU3QlFFdTFySmpTa3ZueElQQzFs?=
 =?utf-8?B?N1ZpVjh2ZThaVHJhOW00NW1HOHFCU2NXVjAzQWJlY3NWNEo2aHlSTUgvSUZa?=
 =?utf-8?B?czRza3RYcG0vWWVKa0tENmFpLzJvc0wxbkVjcnlaeXloTU1uVUU3aXpUaDM4?=
 =?utf-8?B?ZCtXYTByNmRKVzdydy9RdUZxWm5mT21lbkZOSmJybGNPTmlxRUgwOHlRaFUx?=
 =?utf-8?B?MUNMbzYzYVV6dHFjVjNzcmJlVWtPclJhNTluOHQ0U0dwY3VZMzVhTUNlZS9E?=
 =?utf-8?B?cTF0N2Q1M2IvSUJraDFJS0VQNmtFdmJBaW9VSm4zaDdEM2xDYkhudVk4bnhY?=
 =?utf-8?B?Z0ZWcGFnbUwxeUJQWkNWKzRJd01XakZiNWZFUmtXb1gxYnlSYUlhNXlMUEdX?=
 =?utf-8?B?UCtBa1VPTXBIRDBXVkZIc3dPOTZYaTZkcnZpSkt2RTZKWmhnbnlNenlpdHND?=
 =?utf-8?B?S0s3ZXBRV3l1S0RqMm5RaGozdGhraG1IS2kySEh0UWM2cDRicWRsWmtKMVFj?=
 =?utf-8?B?QnFtWnhSclFCd3JySjE2TWJYd2hHK1VldERZdENWUEs2WWlreCtPaEtCZVJx?=
 =?utf-8?B?WmdFM3NHLzUwWUpFekU2ZVZpbzA5OGVBbmk2T2JtQjd3QUFVMmoxVFNqNzRh?=
 =?utf-8?B?NVpLcWxpYlhhN3ZJeHBqbzBndEFMeTdCMTJvcFREV1BOcTBBN0hBSVh0Nk5E?=
 =?utf-8?B?dWFVb21YZ2t2UmRtQnhDeTJtWWRZZ0d4amVxaFpUUktBVi9RVE1kTGVGcmJN?=
 =?utf-8?B?MFI0YXE2bkMxUjBibnhsYzR3bmxjZG9sVDUwR3Q5SGhJWEZ4VWNEVEVQaEE2?=
 =?utf-8?B?aGRYU3VVNlNOVzF5MXQ5V3JnNHpEeUxTbFloaTVkZk8rVXBMTVV0NXNmS1R1?=
 =?utf-8?B?L3lNTXRnZkFaL2dKem15a3lRZkJHelVVNXoveURLV3dzNGlXR0Q2WnZ2Vjdq?=
 =?utf-8?B?RmxHT3V5bk9SSjhxUEJCR2w5S0tPT3ZndjBSbXJQYXBLell0cDJSUW5ETmli?=
 =?utf-8?B?K0JEdkZNdFpuazUxbEtrbWt3cXV2cGZpVERkRnB6U2ZVaVZFcmdqejJsVUZ4?=
 =?utf-8?B?Q21sR0JodGVDRGJiUURJblI4aWU5THg3bkFaeUJSbytiTmlwK2VjY1h1TG9I?=
 =?utf-8?B?dFdESHZSRzh5T1duZm12bG1yZ2JyNlZhZlZsOVUweStHUEpaWFk3STZUYlVT?=
 =?utf-8?B?ZTREelRJeUJleEVXZHBwMXRqS1VobmlxOGhiRGhPZUR5N2pGWjh3eE1wK0M3?=
 =?utf-8?B?Y1ZqMHpMZG5JVTROQXBhUUVQdUhvMHdsUkg1QUhieUlUYjVMaUtFOFpZbkNH?=
 =?utf-8?B?Z0cyK2l1UGU4cjdXbkVtSVBJM0xhMStrRkxTamtvSTdpMFJnMjJBQ0dTWVhi?=
 =?utf-8?B?NGFlclU2c2cwR3NpaUZNcHVkN2xDQmxpaEYraHpIaVN3RnBmcU4wMlNYaU9J?=
 =?utf-8?B?a3FMS0NYTW5FWkJRbk9meUN2ZEFhd1Frd0NXRUJ1YWZ1c1JyOWgwSS9oeCto?=
 =?utf-8?B?MHg1WGpGalN4bVhRV29HZEpyZVBJTWF6OW9XMFFRMDFGV2pwbEJYbFF3SG96?=
 =?utf-8?B?clRyV2o0NXdwN1J5c3Y0TzBPdjlqVzcwbGNZQmFVMENGWDZWQ25NanJubHBE?=
 =?utf-8?B?dUlNaVkvU2ZabER6MkZiTXNxZjlTWFJZTDFVdTF3eTJhTWFnUFZzNWhVTTN2?=
 =?utf-8?B?OG1JZnhxMXNmdXhUQkRhZHBHeWxwRG9lMXQ5aWhTM2Z3ZUg2TGxtUFBWdGw4?=
 =?utf-8?B?RWtOSTh0VU1HWm1pR0cxSFVQdUpobFNaYXlWTXI5S0lKMzFzRWtaVmk1OEdS?=
 =?utf-8?Q?+PVhtJitFPAW2vCo=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 37aa9b44-85e2-4688-5a42-08dee17f3108
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 08:09:13.4075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8LU6C4cgIAJ/uvzl4SEJDUDgCjNmavygQYLFsNlBM+9jq5iJl2pzuo3ybVw6rbpisZFjQJChQSkPeVTwsCid6eikZIK6nt5YH0zwp9BuDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7389

Hi Francesco,

On 14.07.26 08:59, Francesco Dolcini wrote:
> Hello Frieder,
> 
> On Mon, Jul 13, 2026 at 04:53:46PM +0200, Frieder Schrempf wrote:
>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>
>> Add the ELE firmware API node and pass its handle to the OCOTP
>> driver. This allows us to gain read/write access to the OTP fuses.
> 
> This seems something we should have in the soc dtsi (imx93/imx91), it
> does not seems board specific.

My original intention was to move as much as possible into the SoC dtsi.
The problem is that the memory node is somewhat board specific due to
the DDR. And I can't move the firmware node into the SoC dtsi and assign
the memory node in the board dts as the checks for all boards not
specifying a memory node would fail then.

But I'm open to any suggestions how to improve this.

Thanks
Frieder
