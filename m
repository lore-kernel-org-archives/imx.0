Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011008.outbound.protection.outlook.com [40.107.130.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762953D1CAC
	for <imx@lists.linux.dev>; Tue,  5 May 2026 19:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778008928; cv=fail; b=ZalPgPlIi+qqRS1mAU3V6HEdqDnbfqkEm27lAJg70zNQwCj/ntrDP0btGCyQfOlrPRm3/hH9jM1Ghp2nQfA95OW25lPXmVNZOTDEG/5oabC/J1JJeCnJG/RlZHtbvE3FHqQGPoQF40egWpokNIbePbGAPstbonRXMLekhGr5eVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778008928; c=relaxed/simple;
	bh=0jm/wnBnhH4HEXNYRwNZ8z81ftGRPHHNyfLjuTCWPRs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=D68dQ2GVqG2FBeSvvHWl2iu6UpgcDLPBfnFemkMjPhp9roLq6Iz86898MJhOKxBB9rxWzyW73HuhQnIkkihmHYn/XcP9R1fxvj8Cmh+81pfQtT3U7/yA7Q3UtKBgOAvwexOcypK/wWk4ijzKtSazI2rEGVhm7AySUI5XJfiWVbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dDE5Y42d; arc=fail smtp.client-ip=40.107.130.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dDE5Y42d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYro43To0nP5CFXNeWpL9RAnMwbxpkaMSFnD6PohhqMGD9H01KStjC5D8N3Bs6goIMP8KYx1kukd8kHBOeyA3L5BGewLEWHz9PujdVzJifGKVpY5xw5HHHZGl+0GdvatW44nD3q0i0sJpg69QJ4pfdFlH3ImUmSZuZ36YM9nSerVvNXT+6fpnvotQXQSTuA0nooLMkQxe2zZAt8ALl0S9pLQ0EwKuNC4q//LoQVJQvHi7sFueUmXySSM8SE5yiE6kDAeoPYREO3K6jXytqSEdtClReZGwvklfLF1rVBpBYCjq4AOvAKjW2OtO0eZekApD12UAnHqlibSqKKSnlNRkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpRrQQ1/fv/77iW6tnouMAJQEfG0OZKXv90DiEh43fM=;
 b=VikSYY766fvBgAfZd3auAYYrhtg3oDGQOYT5PlU+gUapkH6iIywZdzC507DTMIfGO4VAoqLGBQwUtFpJiVIEJs44ei2q7Vq6blNOwDansCGQpbx7KAyh9rHLozAFPdsbl/yFemazmWK9dgTj0vW1SONU7W8MTE0qIIbwKLUmwuMS6dIb8QJusysFniOAPHAiAim1DefmNaK2oWbdL2TUTMqF+ojF+8VrRrZCz7xIo+i6vFZatdTcfogBTwBcEPy83VlRDBQB5K5RIMVbrTM7Zy8oJgR5hktpd72OgksaTqfA6RIB40LXQYQmnVtj7bXEYo39ZVZd5YoQleMvAFEnUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpRrQQ1/fv/77iW6tnouMAJQEfG0OZKXv90DiEh43fM=;
 b=dDE5Y42drvq1Ndjxao48emtBTct/EFIN9TUh1wSG9Sv69swWJJfYVn4JG95+K/1yebgidKqOnnOcWoowCQA7TQMho/lH82dcGLHB0pc8c4ho7XnP5UleqlOq6I9kBc9kUPmHHG38ST4i8cxqEtSIlGVXNX3s3T5C9DYEbwE77UhFE+Y6bR9W5MgZAodwMh0QRPUJJ/BufoZgWd0uxhxzhpu52SEic/lKO8lKcvTheunxzXv14kv++kmz5rdVVrIIiwUauDa+YpXWuhGs40/7xqA7FdJIIO9GxqKanonqGR2IL44z/eVySNdmKYl/jj/10Oj8ZPzly6K0L5Q6pqa39w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB11639.eurprd04.prod.outlook.com (2603:10a6:150:2a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 19:22:01 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 19:22:00 +0000
From: Frank Li <Frank.Li@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Maud Spierings <maudspierings@gocontroll.com>, 
 Josua Mayer <josua@solid-run.com>, 
 Markus Niebel <Markus.Niebel@tq-group.com>, 
 Primoz Fiser <primoz.fiser@norik.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
In-Reply-To: <cover.1774601806.git.stefano.r@variscite.com>
References: <cover.1774601806.git.stefano.r@variscite.com>
Subject: Re: [PATCH v2 0/3] Add support for Variscite DART-MX93 and Sonata
 board
Message-Id: <177800891761.1935716.70197785565861058.b4-ty@nxp.com>
Date: Tue, 05 May 2026 15:21:57 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SN7PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:806:f2::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB11639:EE_
X-MS-Office365-Filtering-Correlation-Id: f4f6faa5-5be8-441c-6c56-08deaadb94f1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 b85h29UPBEzeR1RV32WTQkcPHhSl5HXZux5RsXa8s4SKjLYcLYu6GGv7ecvFQO5sGX93y9NiV5i5mIrCwpawTIa5XI5uibF0xove11RCI3wITQRo/veFPq2BwjmRWw0Dt8scvV+NVTnu79J2ok5N6dMP7OkrYzagrbfMwl5h0WG5iN5bYZZ8O9wxxIR9lvGvavh2L4bngr/a9dZJWxySY1OQIBcVrUNkr44uPM82pYJu41VjZxVJfsNiyiG/E+Bln/42ppbbFEzVqyqJbK8ZD5HdXpGDLWBWUz1Ol7zlXHHpcYE82mXzwQr2kS+RGkimWavj+JydGZnzFRWm5cEM1+T2sLfLzcvnEVb1EC1M2tbBH4oRz5pkYqnPAapo+8s9vhy6f4BIuht1JHsLQ6cH0BszEeaIhWc/G2XhD3NSK0k5GeXm+BaAdjv/WzeuIOpWsZwdqWsoTc23HEAEewY2ZNMBAeNuhFZbpSf4qBdVW4R8Z4um8FmzOV9aBDs3n/GN0LT9tRlWSnQh12oQgWj3DNkNrS500CwVL+RhWFng6o8/T5d8Q+NvaXQ9Ky86ey7UebIDuwSuQfvZH7UdfIpV2+Hz7ntAjLhBerIKE5FUoYsVMGjFEvjbKA1gaDKaErPRRHXPcokGWszC+8Do5bRHNs8C45CjzYXP6sZbTVhLy8Cpo5Y+Lq6BbkR+6rzzmPQydBTvGm6c10PscgCeWpsxbMCuqu+mtMSV+SFklSqAqfCQ0kTemp12RAybyd9FY+h2
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZCtJS0dtWmFxYlBMZlFNUVZqbUxLdzJlNDhkTHFyZnFtNUk1c3ZFcUVId1J6?=
 =?utf-8?B?WUJHZktZZUUzVmNuZVN2Wi85SnVzT04xUFB2QVUrbEpSbjEwcHVmdTY0TmtL?=
 =?utf-8?B?V1JoY0V1bHlRYU03UFlrbExkNktROEZ4dnd6eGthUXc0SmhlcGxqVjl1M3Zn?=
 =?utf-8?B?cGRFamR2KzBNU3BsSkx3QkNwVDhVSEZUWERsNWR0bUNYcms2MzBHcFRZMTdi?=
 =?utf-8?B?d2lTUWtJd1NWYmh2QXRHUklIY1UxVWoxbE5IaWp0VVlrZGpkMFU4Mk1KVnBN?=
 =?utf-8?B?dUM4K08xZWJveHB4bWVUL0JVb0N3aTVQUy8yUEVFNnU2eDh4ZUl1SEM0YStI?=
 =?utf-8?B?U29JT3FhMlhYOVJNZjZuWm5tamkybGVGazJqL3UwTEZBNENxTStRWVU0VVYr?=
 =?utf-8?B?c1VqRFlKWlNpaEdFUU1ETnBNU0ZwVjI0Y3RyalNjNEx0L2NvQmd6cU9HcFFj?=
 =?utf-8?B?ZXVCUGdoeEFGVnI0U0wrczRpRVA1NW00WHgvbTJCWHBmQlBaM2FNdUwvc0Jm?=
 =?utf-8?B?eFFFa1IrS2swWmZuOEs1VW4xdzY4bFM5aGxIa3J6dTlxWlNVcGd2a2hlRjN2?=
 =?utf-8?B?MzZGejBYTStMbFc2bCtiSHpFbkFjVGJucUtPOVNFbGVUOFZlMVFGUEJrSEty?=
 =?utf-8?B?QlE4Tk1BZ0JZK2N2L3RSVURSSkFkc2hVeWxNZVpUdjY2OTloaWhscThDc0JE?=
 =?utf-8?B?L0VSeEJSekVOTko4M0ordVI5QTNKekk4bjJobjNYaGYvc25RcFZoNGVPWnIv?=
 =?utf-8?B?UzRMaEtia25kR1pUZmJGVlkvQXRHRW0xdm5NUjZhWVpEZC9QMTA3SHowSm5F?=
 =?utf-8?B?NENvb0tVbFNpTnFRUGNxSHJUdGJyTWd3OXV2VGpDNmNnUVE3K3Fra2s4LzFO?=
 =?utf-8?B?cExDNzRuWnVqblFaYURZVzVGZ3EyMmFBWEIxNnNZZ1AwdURjKzZYQldYbTI5?=
 =?utf-8?B?cUpza0ViL2JtVlJ6NUw3UUU3VlpmdEIvc2xzMVByeDVpMC9TUmlNeW1QT2tE?=
 =?utf-8?B?Wjl4ckhJM25MUzU5a0xlVEhwUjUzT3FvNmRTejVRWFFiK1dBMjBlSWJ4ZGZK?=
 =?utf-8?B?R3BxZm5McXhIdUZOUEk1cWZyY09KQ3hDM1VJL1pQWWV2OEVDc0RGLzFLUDVI?=
 =?utf-8?B?dGlCWFBaZldGM0pGWUkxZ29DZGRpM3dqQzFHSkNmL3IzTzVIR1NGZ1pMcDNz?=
 =?utf-8?B?cUUxTU9xTWl4WWx2VzBPMVhwczQyaGRoQzFZSk13V3hNd0gzLzJ4MHUydnc3?=
 =?utf-8?B?S1JDdmR4TVpVSlJrdjhIeFh2b0RSaGlDblMwOTNaZlp5U3hUb1RzejFzNzVt?=
 =?utf-8?B?ZnFrdGRYS29kZUxzN2MybHNCRXVmdUZkckhJSVFFWFRqbXpRenlGL0JXT2xI?=
 =?utf-8?B?Rm1lUVBKOE5KSWQxM1haZ0tKWWtZY3l4bDdOblhuYThpaUdHbHJLUklJZnAz?=
 =?utf-8?B?Z3VHQ2RYWE44QTM2MmNJdklXVE9qQXJ1Y0Y5Sk4yais2TmM4ZTlVc1NIWmpx?=
 =?utf-8?B?dm0rYitCK01ha2oxVk0zSlFRU041azVhL2Q4WFZOMDFlb1NBanZjQUZJem1J?=
 =?utf-8?B?ekJzNjJCbkV2MzlVRTJMaVdGRXE0NXUrNW4zNmhxWFVJQUVaaVJZTHU3YWwr?=
 =?utf-8?B?S2s1azFJTUtsVmhNazNkZ3UxWWQzM3plU3oycmp4NFpGNHNhVlJIdmhqUEhL?=
 =?utf-8?B?VXFEOFlQdnAzSjNKUlJHb1d6L25JUVB3MEdtQm10Z3hSOWlITUlHbUErUXhs?=
 =?utf-8?B?NlpTVHplTEt1bHZjWFVUb0ZjTk9NOVdWSjlYcE1RZGFnWmtYYVhId3QyNWF2?=
 =?utf-8?B?MjhkWWpBTWtveFM5OUtHYWJGN3BJUHBUSFNmdHhUZ2FaTGFJRUZxM1hVQ2pW?=
 =?utf-8?B?c2hnamRqRUVOY2VGVEkrQ3hWVVdnQWV3dG4wVXYyWkw2SCtLSGovZkx2RExW?=
 =?utf-8?B?WDVDdWllWnJLeVgyUEx3NndoUUdmQ0tsRUJhWHE2YzhrcVk0K3cwdGxzR2R6?=
 =?utf-8?B?YnpldFR4TisrV2svZElCRndnRHZRQWRtOFJlb0pGQlBuZFpmL0M1cmFRMDdt?=
 =?utf-8?B?QXNiMWp2UDIxa3ArSmJKMGVKdTZ4Q25YWmNkcGdWKzBENVBEenVWZUVFb3E0?=
 =?utf-8?B?Vml0Q01XYWpDQzV3VDZabUFFTWdBNmNzdks3QmJPalFkWTNKeGNPSEk5TldQ?=
 =?utf-8?B?c2VIM1RHSjB4MHlHWmh0aFIxQURGNmV3eEZLSWlJUWhSTVNZWE9yU1hLeWdy?=
 =?utf-8?B?UVcwL0s3S05WNzR1U1c4RGVmSEVZaGNPaEpjcGxFYjJ5cjJuNzE0eVZ6cjFv?=
 =?utf-8?Q?cId86FZJK3YRA/7ZXX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f6faa5-5be8-441c-6c56-08deaadb94f1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 19:22:00.8002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KXmcJ4JYWIjph6id404yAWISNyXYFnNKpAtmkJSwav2YDwdacfw594PsYF8U6/tUeG7k/M/sFEZSBmD7AmH+Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11639


On Fri, 27 Mar 2026 10:08:53 +0100, Stefano Radaelli wrote:
> This patch series adds support for the Variscite DART-MX93 system on
> module and the Sonata carrier board.
> 
> The series includes:
> - SOM device tree with on-module peripherals
> - Sonata carrier board device tree with board-specific features
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: fsl: add Variscite DART-MX93 Boards
      commit: 1eb192d84674c387d50f926ca5da017d7a158de5
[2/3] arm64: dts: freescale: Add support for Variscite DART-MX93
      commit: 5d8ca6456690ee511d56f0d7373c9a93c01068c5
[3/3] arm64: dts: imx93-var-dart: Add support for Variscite Sonata board
      commit: 3bfec2d4747452e130f25e8422c59a1415aca815

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

