Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011055.outbound.protection.outlook.com [52.101.65.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329303B19A9
	for <imx@lists.linux.dev>; Tue,  5 May 2026 18:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778006431; cv=fail; b=L6oAXNXxiedvFfLWTFg5Nf011WoA+IN+1/udevGB+POGXVISVq3yx9+hINWS/4xcg836ATVn3mFEHXRRFh1p9JfCE7FkLSI14WEhTQQ+FRchQj8t5ocWyssaxX0Hskt1hjq/ylyttHMN67lddUC5imDgmhfkXoM/6m49sedOLIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778006431; c=relaxed/simple;
	bh=qlO4ZytHjLhjpzssoO6ynhMTeU7L4vreixaitEMMqSc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=kZd7TW7QTCcu3hYCmcfeGTpqxW15muqGl+YoRBRVx+s7FcKlABYt18QXCcsZDecYwpyJSMYkV0dYQ32IeCan5F4PzD4u59wpMjCZ/3YKMAdeZjX4XQfgMsoTlp5L08V2ht+t9XqC6Nm6syUxpWdUlNZGz44aF44JEHxGd2ffg5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JbwXk/lC; arc=fail smtp.client-ip=52.101.65.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JbwXk/lC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YLgoA6lj8hpFut1EijM4ME0Tt+lbzWm/YVy79IorANtX6xtbYuLpuKaN6hqsUctPSY6MD+QVlpuzDEx0gnEjNcYeFUksj88NLijozP5mD69WB5nZsgBZGZB3rurxS77KyAuV8Gl5nS3DnFgktxwYxuLqP1e6rVZ7BfHgm3ZguNZZ/4W11CbXJTLcl++wIdMhpxrvNMTf0LbfZoCVMkay8rjHAXgoK+amqNvHDAlcbLxj9rei3WQ3pL4gSWmLBneoCiEbTow76K2iEyqdjlStc2ZE5p5w2OT6w5moyIlUC9c+HCCzyJvYbtVBFmKfBu1OrEn+5qAfRJzgF4H0J6Izew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zt9I+35WNMSrzAlphYfOBusP/WdbiJb8Yq4I0xccsTo=;
 b=HLAXkMfX2skW4zcKvHhOyt7/DCl8VeG8aH5FGIiA97EnRm76u/ZGpFBQaw27xk9zC28ofxrULlPIMJK7FTC30/455fkCrBDGbrrShnfVL6AXoGvxYfqq4nVdlHYZHBrYXV1Rx9UDfPHmid2otgvyQypcE+9kBc4WSuTe3FD7yPdhFv+1C93/oMG3V557zEjsZ/P5BzRPvu/oUhbnEMRxg8gpJ0Cw39CG+8sG/abzArNnPz6H9HXtFwi/+QhZPkqZcwCLCJkXbZOY4h34dOgGxo/+b7+k6GcRKcFDiSXU8Gr/KjyiyUfTJPTzXsxqyMGg9SvdF/b9yh6iYOsW8GgghQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zt9I+35WNMSrzAlphYfOBusP/WdbiJb8Yq4I0xccsTo=;
 b=JbwXk/lCo+HRYMoJTGzZPR7GI/eU5xWzLKdXhBa2w9Q64Dn8ol/eoUO0hBFr/3HP5Q1ZC2KsGFd1ldexwN4WdQ6f1iZPRmKHrGPM6ec8/VgEqSJr2v7qzk+zBNEX2uhFv/aR5MSs5RMyuv3YHBheWtb7e/E5cG6Z+2r1Jnt2RwcnOdi5zHrDKnXCSGEX9S4Crb3iT0fZbDyRVOJDZk3XARKYAniN9fVKkl7hjBZqu5qdqPvZ1AlRhFreylnjmMhUcBqwhw0HcbuRGixNLRAvMcbPTPEsgkqEsWcbf6cBOzDglAEAupA3jEw4vIGiJdkpyVBFS04yqJQKamQw4kUviw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB11328.eurprd04.prod.outlook.com (2603:10a6:150:2a2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 18:40:26 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 18:40:26 +0000
From: Frank Li <Frank.Li@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20260331092112.7876-1-stefano.r@variscite.com>
References: <20260331092112.7876-1-stefano.r@variscite.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: imx91-var-dart-sonata: add RGB
 enable supply for PCA6408
Message-Id: <177800642321.1823815.15501148948631640577.b4-ty@nxp.com>
Date: Tue, 05 May 2026 14:40:23 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: PH7PR17CA0058.namprd17.prod.outlook.com
 (2603:10b6:510:325::7) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB11328:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a7b14ba-5c32-4b70-ed6e-08deaad5c619
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|52116014|376014|7416014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 wUAcuaR11U3sRNJGXgAoPrEPoU/AKPUSLeGTpN0PmzVNvVY02vJqmoN1UO/rcnRP59xO/QK7USgbnFzo3jDF9pUIVJziE9qOVeGaSgqM8NtE78mNK3QImVOyxC/YFV/doPbBRGsxzlFdkXcKTgRpw4lxk9tEK+WgSC94ChId/OxoGCixfatTQreJArbgQJNmfM7z7v9RfikrKeiqj9LUaTnfqYcBgK5v0RHBfCqSELCEvLSgIuc3hsMDAXo7dWqtioib/kEhK3BJLz3BUZCgQa4lFm9GMkNsnrFY7JHhvQrKXQ/JsJSQLdEaLoeE+I69+ocQ2PbwJbaKQtBUX52/UPugfPbEineJKeyUirGgr/k4jIY1WVPBxaK4lpgyuU4WDvlsvJcnJbtxmtr2hRfpmMwTtFBU8hfpfRfmMcMP6ztIRr8xE8c0doALzpMqEg6K4CXoP2Lw73sXVAJ7J5E3S9zC9oIey+O41K390i/ilb4uCbAxFqJD26FImH7fKovVps+VioDjGcvw7jmD9J1qnFQMuP5wZclZyFF7IePDxKxkNT8+f8gox4JLe6nPPPJ16wo+acRg7om6RwLsvoyG19HdVIXgOIj3fiFN9XoyMyhD41Z/Dny68a5ldijAFV/+cki7NX51gXeYkXLs2S40XCCur8Cz/lsrgwiv3erZYjrB9lZGiDOGXpedL1TNwk1eH6C30b9zgeQ5yUOFJsUdxWxHVcnbGeEUzVAhgF+kw4bKC0Yr4Y2XaoiGGV5QFG4G
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(376014)(7416014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NWxBSGVHZmRsbmdBaHVXZW96dnJBTVRXTmd2N0RrK0hLWHlZaEtlUnBtRW9K?=
 =?utf-8?B?MElhaCt0QzRwT0tRZGJkU0hWVXk4ZWVMVzh1Nmh5R3crTVdLQ3QrUXJXbFBp?=
 =?utf-8?B?ajdDTnlLejRibXkwWitnRVN0cExDUEtnTFljbkRZbVlNemRTdlM5aDVMOGZr?=
 =?utf-8?B?MWQwMVFKWUhDUjFhczlDdURXb1FZOHphYVYydyttd09oSjNsYnorbit1VWxs?=
 =?utf-8?B?UXBQMzVRdW96Snc1RU5KcVVvTEVVeWlORGdOT0JRUVhkRnNwOTBEK3N0QkVO?=
 =?utf-8?B?WmowdTJ6Snl0U3pVYy9yNWcwQm5nL0lhWGRlNTZJdVBibUg0OGlWTVloSkNm?=
 =?utf-8?B?amYwcWRWZHRIRXNqejQxdXhMc0tsTkE0THhlWkJCTkY1NVZlZ1hvK3Y0Tzdq?=
 =?utf-8?B?MU9zVEdSYlZ3c2RjOTc5YXlPRXZVQlF3TmFPbmcvL0RsY01HUnF4eEpWU082?=
 =?utf-8?B?Q242Z3NoV2lXdUtnRHRYYnFhZW0xaTVKdlU2QzZZeGZWVk0wQkpUOTdKeENV?=
 =?utf-8?B?OUZoZm5XdTRxVHJib1daeW9KSzBMOTBUT0JTemdvY3AyYTJudjdQaUtVZGE1?=
 =?utf-8?B?K0RMejBiOHkzcGFCS0Q0TnN5VWJRblkwbGRRek5JYmlGY0xESW5uYWtaL3dm?=
 =?utf-8?B?OTBqWCt6VmNJOVNsWFFCS1REV1lDNHFXTER2YUpHdHVBZDJrUERTUG1QSnY3?=
 =?utf-8?B?T1lSc1EyT05MdzErdlBHc2d0OFd0NHRLZEUwQkR6NkZNVmFNQVlqcHN1Ky81?=
 =?utf-8?B?NmZRcTdxQ045V0dBdjFaNmhva2F6MDdjejdkYzNMc3dYOHpSWWFHL3J3Nm9H?=
 =?utf-8?B?V0gyWFVKK2dUaHFyTjZMZ3dXNXgrQnJQUDljbTMzMFE5Z1ZIbnQyR3RMNWdM?=
 =?utf-8?B?d0JpNE1oditFSmd1c0RzaCs1OEkzK21yazdObWNhYVBJV3E0dVFzUDRpS25m?=
 =?utf-8?B?WVMyM1RnRWZadUg0M2VvRmNkUFJXOEYwMkk5YVdJK3hpRmkzUUphOVZETlI5?=
 =?utf-8?B?Z3RjOEs3cjFYWXVXS3lYZmt5ZmxSMldsZFZNSlZBT2xpUk1ib0k3QXg5aE5l?=
 =?utf-8?B?Q0xzSmxzUHU5S0I1NVFKaFNIS3BwY2h0MGhzYnB4eUNrMFExd09TcXE4RXc2?=
 =?utf-8?B?RXE3bEVLYVBPWDZOSlVsVk9tSVdvb0RvdVhvQ216b0hIN0cxajl6Y1JLdTNz?=
 =?utf-8?B?VFNxSllSUmtNUDQ2VDNiR0lwTGUxcU9mTTFxMU9rbkVRem9WTWtGRmFvV2ZR?=
 =?utf-8?B?c0pFcmt0SkFFeGtQcm8vekhzZmVMREtsTzFQK3NZQ3o1cVZ6T1RVbG5ETFho?=
 =?utf-8?B?TWpZbGk4U2FCclg1NU45YXVRWFk2bGE3RmJ4aDBCS29kWkROdnUrTEEvSVJV?=
 =?utf-8?B?TmxHczJkSEV3YmRFYlpFMnIycmZMM3RXbFVMYW81TEJTQndJcDBJdDF6cTIv?=
 =?utf-8?B?ekhGNGpqbXZlV2pVTUpOcXJwVnliNFYzbk50TnpNTGNwTm10aktjUTkwV0FI?=
 =?utf-8?B?TVpvN3hTcDVRcmYyTzl6YTdhMW1kQjUyeElPZlBJakd0OGZWTjNmTzBLS0N2?=
 =?utf-8?B?akhZckVreUlWeGZpNUJNN2xtclBZYUZ0MCsxVDhlZWV2ZVk3dVRvVUdYbXJY?=
 =?utf-8?B?dkZIR1VQbEplWk5XRks4ZjYwRDM0UXlhM3h6UVhoT0k1ZktzNnhrNXF4M1h4?=
 =?utf-8?B?ZThqeUE0dzVHNlZxaEU2ZVZDRVM2dm9HSEh2ZGxQelBObHBWa3ZTRmQvZjA0?=
 =?utf-8?B?OStOdnArTC9ubHY1WVc1V3QyejhnamZPd2xoeUxjMGxXRStnYXlIZXVyNFRV?=
 =?utf-8?B?dDBVMVNSM3k1Y0F0MGkweXZWTmErQUdWNUdaRWpnZkFhekh4SlpaZnFKOUZl?=
 =?utf-8?B?MXpaaVNUdWRERTE1VE5xb2hTOFRLaURkcGl4VWVDOWNyTU9hM0RMYjBSb2tk?=
 =?utf-8?B?K1U3b1YrSTVGNElxWC9INU1uMlFtd1JVN0ZKbDMvWHQ5NVkzbTloRlJSSVZW?=
 =?utf-8?B?Z0JtV0FQek9KeDI2d1ZmaUtKYTJyL2tkRUVNMWwrMVZPNnRKaXQ3WkFnVjI5?=
 =?utf-8?B?enp3dTkydDkrMTNDdFp2di9sT1dIL2ZBclBtUGVESzBOTFppbks3ekFHaVJz?=
 =?utf-8?B?eHJmWFVWc3hDbHUxVUsyRGd2UTlaWTNBclB3TlVRNUlsSjJsby8rVm5KUFpH?=
 =?utf-8?B?eVpFcDBjY1RYeFFlSk5IcU56NktkVlVCMit6Y214bHQ0NU5nNWRsdllwU1RN?=
 =?utf-8?B?MG5UR1N0ZDluZEp0S3F6R2xlZGsraWVzTnRTdnNuSEFuOGNHUk5McG8rdW5K?=
 =?utf-8?B?V0hVU2NJQURxRmhsRzNGNDVBZUppRzY4UitEdE94VG5OOGltMnBNQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7b14ba-5c32-4b70-ed6e-08deaad5c619
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 18:40:26.3298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+8wZAL3lrzE9mVwZ+rnJHOeOb0r0NCrmndSS1YKeMesqRnrH6mbGM0kwoNCXi17kKzB7W+svuwdAklOFyqErA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11328


On Tue, 31 Mar 2026 11:21:12 +0200, Stefano Radaelli wrote:
> RGB enable pin, labeled as RGBSEL, is a board-level enable signal on
> the Sonata carrier board.
> 
> The two PCA6408 GPIO expanders depend on this signal being asserted, so
> model it as a fixed regulator and use it as their vcc-supply.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx91-var-dart-sonata: add RGB enable supply for PCA6408
      commit: 67efe58b4ac7a088a0fe881fab368f93dc40046d

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

