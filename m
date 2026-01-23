Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010025.outbound.protection.outlook.com [52.101.84.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058FE225416
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 15:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769180829; cv=fail; b=exbySLSWDRazIKTEGcS3ENWeV2yVte3ErjH6GT7nvaCKdy5sqigcad3DdeTeAnpdDAN2pKd/DO7HfmlucznuQifro8PPMIQWGDZUJDBT3l3ymrmnJ0gLi2qbkz51kphEOppFrAmJIYCeXCbKJreOHv/LBpNW5s61rz36n8zTg5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769180829; c=relaxed/simple;
	bh=Y+BDfVmaHM5vNA0qvbUnz0EwnN8ufAdCYtD39KE9mic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b1/+F7h8kQ+9jQkarglTroi241Bnpy9L+L9Fzq5kGEARQCydV/AowNjc5OWy/JW/IWkiwUpGYL/PoNAQvDjK4/941edmgrE8qxqvKyxd/cTLdOqn2ZNoYZvqwtIjCrkEMUZacGNMsCuaACM8XlPQW08LT1rr/RnH3QO7jtuH9Gw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=R8DirIWF; arc=fail smtp.client-ip=52.101.84.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="R8DirIWF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kpq9KA5hmxOCE+BaHP3fPkKuZuhw67g2ZpcWtuAdxN15aUcQcKjlXCra02TjL5ACHMe/oVUUEboHjXv8xwxUGBmdjtwc/ukUbkJQZiXr49l1AXYSo+FrlPiP2AIv21/fyMrazTSKQklFJDlr000Fl7tgAZ4QeFmOzmjrVLdaiK/hrO4DwIkyuIpO7MsAR0WwiZPtLCmDebmkMm8M6UyYT/z7oRBDxp11I3vcKIfJphN663fZw6cGQGmj0ELVJD1BxuYGFpTw5y2WWIgdH6r1UHEmXYX7ihGFoa+KEO3FgzFdVKQUKPt/OS/CAJwyp4veLxfZcdBNAIkFXwJq3Zfx0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ExxAy9VSNKH89b1wW7B/Zi4AWyHyo3dyXlwXFtokiw=;
 b=rJ//fVHa45QAb7BQVDhyqQ5oplI9LDwgiGKxlqeMHhZ/jW5j1I7Ms7fuLSo2T07g9oCWBTxkD7K1L2FdPGhODDlaqfpAJ8k0M63AeDmAg/ZO/3ZK8+JGBw8m2xr/D3tl8jbtwiVMaK0qVAie8pCMHvMunaZT2I+6wGNyCXAl6Zm8AhRCvRsg4mSuKHiriGYPlnD8pd5Gt7c1rixtkz/O25XSyCXGrVejlX4ZCW6KiS3smZ8VujS3vWQpoiifD5ycsnwxzdrjg66IeeQL+3BJYnHbSAuuxZC1AhrkiTU3T5MNBbzQI84I9kwWBdxeTYMRB5xZ1vVsreLaQi6B3/vRwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ExxAy9VSNKH89b1wW7B/Zi4AWyHyo3dyXlwXFtokiw=;
 b=R8DirIWFzZibXiq291ndwLnbzjUlrhkj1kLnUQKVs2VYjaxnb2HDI6FzBToD4g0hbLYKzEUBeLcp41uetbHqD/v5NY7aJaK8Ssg1IH9GMdDJx25TPBqwKfR7IcsiZ/4+7jE/gw5eY60aB+5BINut00p5CvP0ZA9srNt3U0OyciNBlKiFjeae5qCM29XIUk1Oo9XkGmbtuX8WivUtrDA6n7ld5i8khnZQsrayX9PFfD7nUS27O+KCw0YCf2LSwwVlxUKTREhdiJo+GWEx3csYbGiUN+uBszYfBYZo2T24zpXjwG959t5CiG+CcTfQeFzmuFRyjoeh6jIvL8QdgsoQ/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com (2603:10a6:102:20c::5)
 by GVXPR04MB10046.eurprd04.prod.outlook.com (2603:10a6:150:112::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 15:06:59 +0000
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5]) by PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5%3]) with mapi id 15.20.9499.005; Fri, 23 Jan 2026
 15:06:58 +0000
Date: Fri, 23 Jan 2026 10:06:48 -0500
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sherry Sun <sherry.sun@nxp.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	festevam@gmail.com, daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com, Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com, y.moog@phytec.de,
	josua@solid-run.com, francesco.dolcini@toradex.com,
	primoz.fiser@norik.com, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/2] arch: arm64: imx93-wevk: Add i.MX93 Wireless EVK
 board support
Message-ID: <aXOOiIlUihSMTQiL@lizhi-Precision-Tower-5810>
References: <20260123024448.3909345-1-sherry.sun@nxp.com>
 <20260123024448.3909345-3-sherry.sun@nxp.com>
 <20260123-gifted-wolverine-from-mars-47b9d4@quoll>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-gifted-wolverine-from-mars-47b9d4@quoll>
X-ClientProxiedBy: BYAPR21CA0009.namprd21.prod.outlook.com
 (2603:10b6:a03:114::19) To PAXPR04MB8957.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8957:EE_|GVXPR04MB10046:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ca247b-605f-46c2-ad1a-08de5a910e10
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?OLkuXPcqrU2u/CGkTm6qomxniSgKTMMvZocfqBW2k5OBztdkdmWvmhO7cu8s?=
 =?us-ascii?Q?koVKuTxawpvx7bxyhQ7YqDotw7avPPaJJweimTiUA9ge2VYpk94BFXbf30fV?=
 =?us-ascii?Q?nCeWrfsC1dRNwgT/QC6AU/I+nL02MQv5jkNQcsV5LNiaH8FWIeWNy/XCtUPJ?=
 =?us-ascii?Q?iLJu4hKUTV//Y+fwZkY/PabzGUg+GwiNkh/gJ6aohLZwa/XOjWSTSU4QXo2v?=
 =?us-ascii?Q?Cn4zzHYlju3VDR51kA1Rkyf95yw5kUM9ayn9bAvd6wKH3JmyM9zKjCAJe2hg?=
 =?us-ascii?Q?NqQyyaoa+XsMuLI3boWk3HI1Bucb8lGySULKtHgGYGdHwNuW1GZwzIT5aKbr?=
 =?us-ascii?Q?tEW+2buALWQuGMhTM1hZgEjWeTal4SWcekJKvtvXf3oEUn6lRRXoCxAHCv04?=
 =?us-ascii?Q?vFrsyzY7bkPVhwvCZ9/Su59LK/lSMM+eoPezv688qm0qFRKzkCPCHHBZo4DY?=
 =?us-ascii?Q?zME1/gU2e5cJ0WzSnjI16gv9pejOsUzQxfpYF98yhvRvlGlYAk3diy6TE27L?=
 =?us-ascii?Q?jUHAQ4Ne2diiUrGblq2WV8uro1gzMMsItNoJSrV+dduiRqJiGyDOK0Q9CQw6?=
 =?us-ascii?Q?XvZxcimhcg+OpFCpyfnjNSv/G18Gmw6M+iMfHrm9KAAxiIsgDROSGdN2gtpB?=
 =?us-ascii?Q?HMTGgCFdCD+PNh6XkTayoImKls3YSgW4C8h4hMZSw9/vPQ3TO5bQ26dppRrn?=
 =?us-ascii?Q?KOXO0UU3OwIjqC4mqQeB3EhcHm1+LrpZ/CPKpvZnvof7Ap4cf8wJ26lrWPM1?=
 =?us-ascii?Q?7lyO+ZL+D8wlXekM1plxFMQjHIANMzfONs0rxBSlSxXGuV44kH9gPD6b2rkK?=
 =?us-ascii?Q?xtIQ5DRhsdGYgdluuLaHo5WI+ndeQBPJSPesFRdLg3BM6BlOMdGWU7qk2LVG?=
 =?us-ascii?Q?9UzR5kQExFksxRXdAUHR5cCE/YEaGzrWdXZOvJjyGXdqIrKDyRiTi4DTxyba?=
 =?us-ascii?Q?IuDUUqGgiV/5isBsmcEA1aulxj7U6SXUCLm4seT0TWhV0hHuDefk0PlXsRgM?=
 =?us-ascii?Q?KM2gg8L6r3tZGLsW3H99gYGMydHDerKaFvz0nq/ZZRnsOpqXKn16Qf4Xu7Vf?=
 =?us-ascii?Q?aTv0Z2W8cjSbG44Cvq8l4gFvhNDq4yypiP7PK2ybtcrCSSYaFtDdqe7YW3R8?=
 =?us-ascii?Q?PO7AwsUiHQuT5BNv9UVXRMioMN2hu1rwwnXQksIQOYtDu1yt6YrS+xjdZ6FI?=
 =?us-ascii?Q?WKmg0LK+OjP+P5RL98+eeODTD3+6NmHpteLtmiyAQeAI68ve6uUwhAmPhfs9?=
 =?us-ascii?Q?1C8gvnrzBya6j3QZzsrqHh9eoBNEG4rorPs7GEmIDKlBjfT/WiUXMfCjBGm3?=
 =?us-ascii?Q?tNKYp8LiA4Rpa/Ra4GzG8573Zptmkw+HD3wBQFHul7zjjhpDMGSg21qWIzGi?=
 =?us-ascii?Q?QOgw1x2gFJ/FRIq5vxZk9nLd3u9I+q/jepj4lXbCWkZydqRppc/6nx0x51rq?=
 =?us-ascii?Q?wLmZzFvxO0q/JBcSBnKwhGobtQXjCuhrtsdiZp/PbUWtbNMMZ2H6BC4bYl8s?=
 =?us-ascii?Q?92e1ItWncqzyu+HYxSopBD3fZL1vuYRIFSmqOM+uWJrw60/gN+HVwBC/SbAz?=
 =?us-ascii?Q?fJsyc22kS9uIbqFXUJhKJUrYrbw7psWxobcZaePicJNuZD0ocgi0+0/Rg4u5?=
 =?us-ascii?Q?sQWwXIuAAMQm4RXJPhaMaqQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8957.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?K53KHnl4UVSQUAQYITsXXJTQh+4oteMU/bRGCsq2Q2Hdkhi+0Lzwb/1HtLIm?=
 =?us-ascii?Q?USwvWm7f9T4rLbUDG2Zapegx9Ae2WW273qWFF8tXbVA46B8jArGoKGo5rp/4?=
 =?us-ascii?Q?uQTnuYXYHFHvc0tZPsU6r3o+TMJOAbSFndrEPvDan+G2dLW0f/12LMm39T45?=
 =?us-ascii?Q?5f3MnAoyGLHKUWwbzyjQPOTHYdNUAdRlLFwXziSTv3/IdbIqRa+HPn2fePdv?=
 =?us-ascii?Q?THvVlNKAoC+d7yT3jWBSTQ8mKBjcweI+IixyrCY0CoebiLs7jZH4v1Sw36Jz?=
 =?us-ascii?Q?TBScLksTjWU3NCHM5nn8F3sO3dFe0DGBfX/8Ir1242ageYG6AP6hcra45qo3?=
 =?us-ascii?Q?E2g9zRqIPPKmDenR3OVZOPXO9UWSVW/lrlL4wJIEH2uZw9DeEc+yLfCgX48E?=
 =?us-ascii?Q?dAT9t+dDHxXsMrNv0wp7BLsm5id07johnK2SlTxZsr4ERgIOIXuuONq62Kk/?=
 =?us-ascii?Q?Mo1DRP91NwES2oOeHh4COdJVc7T+Xd/wi9IzNbY/LVPko3t0QPXQnU6u8+gt?=
 =?us-ascii?Q?/rqCGs9Vaxoi0AIcAi5l5URDa9euzydzq7Fx4ugSPZiC6Kck4K/ibPcTofvK?=
 =?us-ascii?Q?eWEIHAODX/QMBZmPcHW3bDqMDy20/Juj/S1f/EWBkuF4AlPs8N5rGOjLplJf?=
 =?us-ascii?Q?1gzJZH0HeG5KydPk724OwtWfWqV+9xPPEyN5Z46jZxIgOtFqj+oKyXJGSvwB?=
 =?us-ascii?Q?esVkcJW0DVJHINXf/dKxCc2NjcXYqYVC/T7s8WPXXRKhm+lYeZJV4XyMTI+O?=
 =?us-ascii?Q?51t4q3AtS1ksNrLlSsTRuNwfB918l9GGGK6JzW0/7HpQ5xgXiPUrsCO+ztyT?=
 =?us-ascii?Q?N6XvsNRjhIiMCDGf06tmh6BP3pk6wPZ3oNWI5xy/rWIQmdJR/j0xPIE7YbF8?=
 =?us-ascii?Q?axR3Pg8chVmNn7nqgYBf9JFycf510ZkzSu4lEEXHTKXv5T6D0PR5M9rRhOVM?=
 =?us-ascii?Q?1cu5ZF5wZ5L6CFpb55z4TKXV+Zuaa4Y407XFpgefCi/ZHI+msUeH0D2ihpWo?=
 =?us-ascii?Q?NXNDs4tCrInVG6SO3/yrXN3oqWcgpqv3BzlqM57T2CgsaJf0FAR1q3/5fs2u?=
 =?us-ascii?Q?PefTdEaXV5ihVvX8EuLwfWVDHZb0x3ppM7KVFWaOQnrerBENvuP9jStoMMjC?=
 =?us-ascii?Q?Zl1SloNSgOVHe633unTFSfdcGyEpiSLjP3KY/L61gDVWFYEuLn8tgItkwoow?=
 =?us-ascii?Q?Ijf0v7bM+rhLt0YgH3gQMhuC9XSbL/PqdQCu85lHqcY7pa6PxJl7gGxvUYMV?=
 =?us-ascii?Q?VC8jMLa+9hLbnkulNRGY3+o14osEbgoziZpLTzIIbbPAagNlZX7p4FWwnqZd?=
 =?us-ascii?Q?uAvPqFWv5K8eJhr5TBj1ujS/Vk0ROl11VK+57jmY2UWMw2/F8ZazMnGh1XjF?=
 =?us-ascii?Q?PKjO/albnKwz2CL4S8HiH1S6cE5wI5PJHB2l8hfORBA9KFsxssEi2YwWUQRJ?=
 =?us-ascii?Q?1iCuAxwzd7W5Fv1Sdj3MZGrR/JcZ1oQWZMxwzO9hzJReZQjnNJfITTI7bJVL?=
 =?us-ascii?Q?68pXdQ9aOZ60Ne6Luz4ltNWqn/Q+LOe2BUU3myCVfP9VT2UhfTvn6j+QX5ke?=
 =?us-ascii?Q?z6+X+hBc2D/iSmjqFCoaQHe2/bSzzTIdNC286MjyKBLzoUze1ZQPgcYEO7Mp?=
 =?us-ascii?Q?C1f391ukMfvZoCGfLUdEEcSL0Tn5xe7f5derlOAkuTwnqiQucTJ9/Iabunfc?=
 =?us-ascii?Q?1bQquaa4T5blOjXQoV3A/NfEzqyF55HxQ7FlzPT1YY6NQ3JMlRjvANgCSTVB?=
 =?us-ascii?Q?SrSli8cBPA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ca247b-605f-46c2-ad1a-08de5a910e10
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8957.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 15:06:58.8940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdpIDgo9O/vjTbLplZ1TaYYlXLD/7JOrbeVLdF8AyWCY0EynpY102CzntDllNlemmXKtAZ5PdOjnSsF9FeJO2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10046

On Fri, Jan 23, 2026 at 10:02:34AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Jan 23, 2026 at 10:44:48AM +0800, Sherry Sun wrote:
> > i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
> > (Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless EVK board with the i.MX93
> > Wireless SiP basically reuse the i.MX93 11x11 EVK board, with some minor
> > functional and pin connection differences.
> >
> > Here are the detailed differences between i.MX93 Wireless EVK and i.MX93
> > 11x11 EVK board.
> >
> > Function differences:
> > Function	i.MX93W EVK			i.MX93 EVK
> > WIFI/BT		IW610 in i.MX93W		IW612 M.2 module
> > MQS		N				Y
> > PDM MIC		N				Y
> > M.2		N				Y
> > RPi 40-pin HDR	Limited support(pin conflict) 	Y
> >
> > Pin connection differences:
> > Function  Signal name	i.MX93W EVK		i.MX93 EVK
> > WIFI/BT	  SPI_FRM	SAI1_TXFS (spi1.PCS0)	GPIO_IO08 (spi3.PCS0)
> > 	  SPI_TXD	SAI1_TXC (spi1.SIN)	GPIO_IO09 (spi3.SIN)
> > 	  SPI_RXD	SAI1_RXD0 (spi1.SOUT)	GPIO_IO10 (spi3.SOUT)
> > 	  SPI_CLK	SAI1_TXD0 (spi1.SCK)	GPIO_IO11 (spi3.SCK)
> > 	  SPI_INT	CCM_CLKO1		on-board IO expander
> > 	  NB_WAKE_IN	PDM_CLK			on-module IO expander
> > 	  WL_WAKE_IN	PDM_BIT_STREAM0		on-module IO expander
> > 	  IND_RST_WL	PDM_BIT_STREAM1		on-module IO expander
> > 	  IND_RST_NB	GPIO_IO28		on-module IO expander
> > 	  PDn		GPIO_IO29		on-module IO expander
> > 	  NB_WAKE_OUT	GPIO_IO14		on-board IO expander
> > 	  WL_WAKE_OUT	GPIO_IO15		CCM_CLKO1
> > I2C3	  I2C3_SDA	GPIO_IO00		GPIO_IO28
> > 	  I2C3_SCL	GPIO_IO01		GPIO_IO29
> >
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile       |  1 +
> >  arch/arm64/boot/dts/freescale/imx93w-evk.dts | 73 ++++++++++++++++++++
> >  2 files changed, 74 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > index 700bab4d3e60..d0ea746c59b8 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -418,6 +418,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
> > +dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
> > diff --git a/arch/arm64/boot/dts/freescale/imx93w-evk.dts b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
> > new file mode 100644
> > index 000000000000..f09587dc74f6
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
> > @@ -0,0 +1,73 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2026 NXP
> > + */
> > +
> > +#include "imx93-11x11-evk.dts"
> > +
> > +/ {
> > +	model = "NXP i.MX93W EVK board";
> > +	compatible = "fsl,imx93-wireless-evk", "fsl,imx93";
> > +
> > +	/delete-node/ regulator-m2-pwr;
>
> If you remove nodes then clearly you do not share a common design, thus
> you should not include other DTSI... and definitely even more confusing
> to include other DTS.
>
> > +
> > +	sound-bt-sco {
> > +		status = "disabled";
> > +	};
> > +
> > +	sound-micfil {
> > +		status = "disabled";
>
> Kind of same here.
>
> It's poor practice to include DTS inside DTS, some platforms disallow
> this. Is it acceptable pattern in NXP/iMX?

Some old platform used it. It is discouraged for new platform.

Frank

>
> > +	};
> > +};
> > +
> > +&pcal6524 {
> > +	/delete-node/ m2-pcm-level-shifter-hog;
>
> Why do you remove so much?
>
> > +};
> > +
> > +&reg_usdhc3_vmmc {
> > +	/delete-property/ vin-supply;
>
> Do you understand how inclusion works? You claim here you have common
> parts. Removing them means they are not common.
>
> Best regards,
> Krzysztof
>
