Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013068.outbound.protection.outlook.com [40.107.159.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED76236CDF9
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 17:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772818991; cv=fail; b=n4c7yu7e9ly5K9rL/U9OUrHwKDDqpcBl9IJzH1S47hH68ESbMKY+LxeNJkhJph7VuahTe4gjXgsJTqUAxGy7Ntv9d803EeN+B428CT8VwCpXcLqm/LkcDZ3WBjkfWMV/N/YIh1tAbs/B037L6gLSKgXvjtcHD59qyNsV/f8+8+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772818991; c=relaxed/simple;
	bh=cwK++/82peZssthpC6FN3/LsyLQREO9oP3f0xRk6CF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KPkIp12MKiGb6cOPGm7jWpC/kFNZM1MlgSIELZ6DD8RZSPCmg8czFbwjhYSTfnSMfdWU+TlD4UKdhoemOS6dkYICR5IuEjeDeNzfjhGJAolEn4/ioT42ZoEB1GKgyMTHj1f5xAcjWpj5dP3U8QWP19NrMyH9AgewkPIqggQn+YI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EJEbvw7b; arc=fail smtp.client-ip=40.107.159.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EJEbvw7b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gb9b/2ESkuTkPX7MqkTiRQ73ipXZIrcXC2EO+n7yJdsFJhL7FO2aaU7M53xQ7626SFkQWjz5nSGWnqdJR76UJHJObv5Nrqhh0/sRhhViX196AM77NI3F1pxM2SQyQZ29Gp9NNskzg03Dw+U3/b0b+Qlpr27vbG3ZO/sD95JAjxWKAM/EasL7nD73GJlEOICElT2QwgZWVteYPKNUwx6XxW3bWinnuMq+PU6pkHpHgSz3wRZ1EVStb2YLUyUCBp+Y5vg4VDSmA1Jitf3SK4dbUZMtyrT0sLNbALWmA7OLf6GbO6CPrYMjFCLSsQa1/iwqINyIsyQ5HSC03L8HlF8p4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q55ttwl0U4tShvF0ug8UI6faFSrHWNFSrZe9Rm8j+fQ=;
 b=aLEjLfSeOfGzsqKkCxL/v3NpbI/cIxXlikBiJWhfeQoGcrzFUwzL6REeTaESTKZ3sFFrZe4Yy9bKaI99VZiA7xVKtSg/zV89G4TbC/lVMFOXtyp0JVa6A2D8ilRI/T8XFLA6VQ1K29zOAd4u+iaLkQnOK+WKNnMQoP5MmV938bUimVE8ZIM8T9FDIG5fwI3fH1bq5KyK2N/YDORpg6UkP8/m1kBXNw1zzLyhjuNMRVwx2L5MVJLGU99LWsSN+xcUBCtjLxIkpTIqsOInAXTv+DI8wqjDeZnN0HQmvjP+dFh/lSJ438umwVw5XXE/oEmfzwV7mMDTr/ofNFxv/CuBew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q55ttwl0U4tShvF0ug8UI6faFSrHWNFSrZe9Rm8j+fQ=;
 b=EJEbvw7bHx7lQOw3V153o7WbDUcXzRvcoTSFEJexkJfhRc0D0DUE+V7Xs3wgX0qBMU31WemYjgEBSweKHwFVDuZbiU7zczkTwFN2sq+6+85Uo1mMLRupA7Awvz1OldbtR9C9lJDOgNFvwKqarCVv2zVH6dazlZTisIZytZIkwjTDaKsIMNqjKcgdIeKoQk14z7666olc/n52JKIbm551QsUWSpLNg5R30ek6GOIDVk6W0zTcXZLZ84nyqDZkDLELWoBc/bIp79jGi9OTvBkfclDnZ5gNtjXU8O6k7RG6ecV+SFJBp5N7f84VOfM+GrwbQcRct37rddHyO2j56ZAasw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB11575.eurprd04.prod.outlook.com (2603:10a6:800:2fd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 17:43:07 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Fri, 6 Mar 2026
 17:43:06 +0000
Date: Fri, 6 Mar 2026 12:42:59 -0500
From: Frank Li <Frank.li@nxp.com>
To: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Frieder Schrempf <frieder@fris.de>
Cc: Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 0/4] Kontron i.MX8MP OSM Devicetree Fixups
Message-ID: <aasSIzf8JKPcI0xJ@lizhi-Precision-Tower-5810>
References: <20260220103636.9697-1-frieder@fris.de>
 <177281293090.267666.2279739168174022521.b4-ty@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177281293090.267666.2279739168174022521.b4-ty@nxp.com>
X-ClientProxiedBy: SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::20) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB11575:EE_
X-MS-Office365-Filtering-Correlation-Id: 65eabfc3-f061-41de-63f9-08de7ba7d324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|19092799006|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	2Y6fWv2B+1fcGlgmIaJ2iwl/WWn4faaW97L41hmLZUcQa6eHqNfL47StBCXxX/vydmQlhNyCa9o3zhkwnocRkMzioIedivlBccVHyid1F4VXQmKEt5quFZ8PZhE6qrPy/1JfgUB6OojVS9dVhIw+l5zB56BYzzMG29wxCCwg5OLkOWHTVexPckBxhT3Qnb8tGLwc8FQvr2P7nd1lnQZkcLLVAW6OCTsZWkFPVvhWZFX3AD6Ii5BvLY+onjuaRRtkbeJp91MgIKxSCzV8R9Tv3ZG0NWsaYtsAr45Wnt+q0hiUWAQYDNmTqMNFyh6sRKGDyE2IgRj94+7UgamC623fV2QwBxrlo+g1Y+kIPRfWkAfUXtSR4WmPFKYR3eDe8WhFY2My5hZV9MEVBedILtjInL4THJPegBwrXJLCbf9vTouqcG0YKeH3HCXMk0SdRXT5n/PukRD4ZuZ2XdVcdg2/7gEtfHR5c4fv0/ALNvK7+Ugc+MbuJ4fCF3+U5cMqELBgdbmGRmrBONrKsYdmIh5HQ9S2K9UxFxY9oTOV8svN4+ERyfZGFOShNyPXUKP6cF6nfSCPaOW9IWgxSiFDAGVbA74mmrKL9L0OMwe7gdzV1QGAAnNfxkFFfQVQCsZX9AMc2y7UnKBxj1JInzHdh1Irkq/x7oNrPFfhRSJMgyuYTofVfQmPticBjY1wusuJ8RHHjihC/rc3bHVFUdCNFRCQx8eo9F9guagD7NbiKYGVqkyPKkWeq6VN+CiJL/XBL5igBRk2bRMvNprINKHlsTti0hkG94/Mu+YRhgYLgkYmV1eToQcmsVuukwZIkbJPHhhC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(19092799006)(376014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M7ojAt4ZnIb8f7q6Qxqqp6hFFml7/M6pb48KcbwLY0aW8QpR6d3pZS22btsD?=
 =?us-ascii?Q?TAgH1PmYjVv2V1WxPujlt4Mh4ychnNtWxO3YV9hLpYsrYbcKSU76Efv9mqs+?=
 =?us-ascii?Q?mAhCaNhSaUnVPyo/hVAjUkxXvWHb1ouSNn/FlUNotGowpAIAQCBYoIcHAXBs?=
 =?us-ascii?Q?p6dJk2kmBiezsGH1ekDcji3JoscSEWQIDa/YVwIFeVS2bnyJj6QWpQ+s0kiX?=
 =?us-ascii?Q?ticoP485GyHI2W3d+RrBO9u3rQ2UAtE2p6BLK2prjBvKCzXXEF+A+7GqyQ7C?=
 =?us-ascii?Q?zM81S0aHusPlTqbhUmYofeiEuBV2moffHiQxR5PwlIMT9ULoXHW0IBCl4FGc?=
 =?us-ascii?Q?YeQ/Ie5yM37BOITHHJTYgDCWWCvMqQv13hG1WF5+oPYLI99gSKMsmLISjpyG?=
 =?us-ascii?Q?JhtW7BvhmH8WGR9sYMp79RmS/cSdx0MemWiUT82e0laui5tphzlkEAlGJQvd?=
 =?us-ascii?Q?O+hgDnVN2N75cPHo6h35980C9kVMkO9sizLbE+ThgSTSRK1yyv8kotHRbfaf?=
 =?us-ascii?Q?TABscjwBXJPTPCkTOh0rSt6xLdMdzyio0jSkU8UHv8FtjVufriOa5X2cS/HL?=
 =?us-ascii?Q?+gh7/3Kv8TyHzQbD/cdML6qISiH8z11DeqQaggBWSQPCpEiAwbN1EVjK27mM?=
 =?us-ascii?Q?0kQ8lNN6/sXESS/+HP5imGH8kCEPuamp7g9FXPGETxyBPekxv9t/7B+LBQzN?=
 =?us-ascii?Q?aKcrYu2jftfBK7IQAYrRGnTVzi6avuUUanC6Z2supPXy+OZh7I+AYcYbmcbV?=
 =?us-ascii?Q?PQORdeevC15rFlQoTx+324NDYHrovAW3u8JedgXDPdJ+VUgul0rPBNuFaILs?=
 =?us-ascii?Q?OQVSaGMI2X7EFWI6c3Whhg3Qpg0BFmR0wM9wR6N0enpn18sfWPcp7Fja83ET?=
 =?us-ascii?Q?vUdDAdqSQrlL2OQSV1wcHlHKT9I1A+CKiFo0lQVo+RZcbdbokQrRSc0b4EZq?=
 =?us-ascii?Q?oBxFLoi0BdNlWBHorxR1PQ+r/NfM+gmgMzBxuKpL0dos+Xz3I1p2rtfSQxAA?=
 =?us-ascii?Q?jmz7DLHTp5zFFzwqHyMVt3naMm20UWtcmll1PL9bsBajEYbJvUNB9p6sYZph?=
 =?us-ascii?Q?vg1Y3e+cZgJ43DgHNPxInfhBPsGozZp1fTCWwEBJ3h9Uz5Kj57PGeu6CoUTg?=
 =?us-ascii?Q?dDYFd3VVn8O0qxjRAwVTQsBIv3fRpwZcOvU6OcZh58yN7djXGYUxcXFDB93+?=
 =?us-ascii?Q?DMXaFaSD6CaDADNnQeH+BMNXAt4F9t4xMV16kW5QkoQAJA+ftuyQ/zMgYReE?=
 =?us-ascii?Q?8L+DEaOTLhuYCS7op6jtirOt1+9vGD1g8xRHgFNxC3FtzTXDoJ2BWF/XI7Mx?=
 =?us-ascii?Q?uQhhr//x28Wbr3/RnlPsHUdNZVw8mc2STKbqk2IrtSfa7JaCc2IzwJtQnSRW?=
 =?us-ascii?Q?8PY5wIjX6fg7JVgPWIxs8RTuFSVGxF8PEEhT9evlW5rQGg+BjZoGRzUMHCOl?=
 =?us-ascii?Q?WytVppqopISrKl8kiEPOsXS60U4jWJrNr14d50qpntxjnNhlUV+hjCJt4hsu?=
 =?us-ascii?Q?/EvSEn/PdVtqpKXBQ9pfTx+v/UBw5En9DidcelF4UozmZ8dko19x7gkAu9dE?=
 =?us-ascii?Q?8f76RUl54gsirFGMEYPG6SqufNG/H4mBN7FKwVXw7UgLmOC41zcLMw7zGQbb?=
 =?us-ascii?Q?0+u/u6gxok1Hjd+9uHe0E/TUONJeWxZqAeFFhmfLxjTwwuhpTcrLbtzkh30N?=
 =?us-ascii?Q?L2DvPbeeapfWORBbqGX8ly8Hl5tszvdAobumzA2In9TWiZbejUpnobf7JCoy?=
 =?us-ascii?Q?h6xcIfH9lw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65eabfc3-f061-41de-63f9-08de7ba7d324
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 17:43:06.6617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swbC5yFAC0FLWyneDt+yEkh52wNFvz33qJhPiKmK2lO+9EEs+XgfKsayti7tRee1Sp7h2TITRm40L5S2KhAbTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11575

On Fri, Mar 06, 2026 at 11:02:30AM -0500, Frank Li wrote:
>
> On Fri, 20 Feb 2026 11:36:15 +0100, Frieder Schrempf wrote:
> > From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >
> > This contains three fixes and one cosmetic change for
> > the Kontron i.MX8MP OSM devices.
> >
> > Changes for v2:
> > * Add Frank's R-b tags (thanks)
> > * Enhance commit message of patch 2
> >
> > [...]
>
> Applied, thanks!
>
> [1/4] arm64: dts: imx8mp-kontron: Fix touch reset configuration on DL devices
>       commit: ed35f6162eb43e5dc232b91e903e6a76ee5f5601
> [2/4] arm64: dts: imx8mp-kontron: Drop vmmc-supply to fix SD card on SMARC eval carrier
>       commit: 02ef82e09f96a0f5c996cdd4d62e66cb80df9f0f
> [3/4] arm64: dts: imx8mp-kontron: Fix boot order for PMIC and RTC
>       commit: 0ab1f5f3652424de16b464488c3d3db3d88b1bd5

Sorry, I have to drop this one because it cause dtb_check warning.
'vdd-supply' is not allowed.

Although this small changes, please change binding firstly to allow
vdd-supply, at lease binding change need get ACK from dt team firstly.

Please make sure not new warning.

Frank

> [4/4] arm64: dts: imx8mp-kontron: Use GPIO/IRQ defines in DL devicetree
>       commit: f7bbf27af999ed3f6568f0266e112eded96f225b
>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
