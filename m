Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012022.outbound.protection.outlook.com [52.101.48.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39E933858F
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 15:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771340850; cv=fail; b=tU66mtHLPi+nuXE7RBHnVpOhCG5niOy3bVfy0ZinJjbxh5jve84sTLpFseplDqjr7K1cIssEdsqLO7VsrtZOkgy0mFYwA8tg7UYGAkfJ5Fa5W/jvcHWag48nLRuSudg7gRvUBia3FHjNoCpF05M1QrWYP4A8PMR0vvADC+MaGiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771340850; c=relaxed/simple;
	bh=86iilHbMPH1BK2iceuhKVb8svbOwAQK/UKenWy2sW20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NcCjpwdIhK9gzkiD8BKYOyrntPKQovoRsaW0Uev9jVNdCUinMBmrGIzTQB5pypyl9VAyrKUfxtU3QtOlddlm7moehmPM0zPlNefJZkk7wLUOxulcUOqXRS4Rg3qvfNoUQ7OBCxmrHVzrpLqe+DsvbELe5ziwiY4QKnuv8SwpGBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=g5jxTbCH; arc=fail smtp.client-ip=52.101.48.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="g5jxTbCH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwVQ4uTS/cyuZDvSSDLoD6C2lXN+mpA8+j0fCjyEf/dWlTaYdSvt5RU1CF4Nta/TX0jDUaqAWw7VxBpctGZSLALF7NnUkW21MkfrTISbI30aIcV4PpMun29HazDDLb48JRPtN7Y4jbkPWRlTmTAa9BQ3IP0IkHkxFXQ5NM3GdbLRaFzCY/KmXSM5Gyeo+eJC9p4CtBEY8EFyM0sLkSTFHYbWeh7tElzsYHQ3makaobns/1moCCEllpUf6JYxxc/btyAFdCH1pPhnTFZHTTO7PbDzc9Je94UNPGWCE3Kgd8UxrzQnN0hVMSBBNk79DE19RPAwt1w/82RYaJEEZ7bdiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cbm/bJsi/ugzWpy1XB2PlzFUz3kFRq0DO90f/pDUTK4=;
 b=qQ7r2RN5iD+2aHtswBHd3ic/Wx3oWrY3cpO2/eSXveE0RSDe0m4fF/so2yVJ83MK1ZZLVaERK2Xyorzql4fd+KRHZCyNm/YEBmxYbNtk5hy08Uxap1LmuaKk5wUVqx17EGpsviqp61SAmkXir7ReP7O1n9TOlnajjDYqvex8cO9n4/xqGhb0kfxKpLUv2WzFLTTAFuOT7tjA/nj5DZcbPWQUzuB2Uwqx+XESnO6DSwp3IZiFySN8kcHpde/Ou/qc/4OO2Tv2ngeP8ZfMHb9nexmkec6uJQCMt8MlRpYFNMdOdxWmCqL5u4AWCCRQv2WS0d3HEbu8Cxu0oyLKlMDUkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cbm/bJsi/ugzWpy1XB2PlzFUz3kFRq0DO90f/pDUTK4=;
 b=g5jxTbCHbnIK9MeaL07Cmt1awjdXw6wtV+0TTVeSdVb8WTjMlaJt/PWrt8K4vylxP0CQf4MWb000ihPg0D5Fiv6U9yJs507OAMvng/J45ie5IC8KxQyFRjr+TtA+DfmKmNZLFJl2flBgd1I5w5oBSd890k7s6+YPTjKiPLMDT3IxwEJ9kvxAa2XyquKjYigXGW7+f6XeOgZPuTzFEqfSND3ivlzA0Ysrx3+U6ApuI+azyEFSO5vG4IvAG6kOmHNBclzyrS1qGWcyp7AHYYOzjpV5NADV36z3DhocT6gq68lgLKaR/hi78xKa+U2kjfSWx8O3Y1VfDd9WdOkPWaW6ig==
Received: from SN1PR12CA0069.namprd12.prod.outlook.com (2603:10b6:802:20::40)
 by CH3PR22MB5522.namprd22.prod.outlook.com (2603:10b6:610:1e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 15:07:26 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:802:20:cafe::b8) by SN1PR12CA0069.outlook.office365.com
 (2603:10b6:802:20::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 15:07:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 15:07:25 +0000
Received: from zeus (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id BFB18E8F41;
	Tue, 17 Feb 2026 17:07:22 +0200 (EET)
Date: Tue, 17 Feb 2026 17:07:22 +0200
From: Ian Ray <ian.ray@gehealthcare.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ARM: dts: imx: bx50v3: Configure switch PHY max-speed
Message-ID: <aZSEKsT3f2paG0gx@zeus>
References: <20260217125952.53997-1-ian.ray@gehealthcare.com>
 <20260217125952.53997-2-ian.ray@gehealthcare.com>
 <6dc304c8-2e65-4090-85b2-4b69a5751823@lunn.ch>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6dc304c8-2e65-4090-85b2-4b69a5751823@lunn.ch>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|CH3PR22MB5522:EE_
X-MS-Office365-Filtering-Correlation-Id: 48152693-42ae-475d-191b-08de6e3642ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1hvblRQRjh4UVJsZG1hOEVsbFdRR3c2OGNsVnc2NmNCR3V4bFJrVmwwVWxa?=
 =?utf-8?B?bzB0UVBwaGR4Lzh4RHlydXNXdnBFSzdsU0grT0FMV2x5NWhURUdHemEzaGVU?=
 =?utf-8?B?dmRTbUtsaUdUc0tDZG9EWVQ5bzRLbHhxTUVGZ1JTZWU2UWhXMkhMQ3RRQ2t1?=
 =?utf-8?B?dmtzYS9iVTdoV3BGeHZ2QjBYOXpVb2ZWSGNtL0dpQTJpQnpTV2ZxNmRlbGRm?=
 =?utf-8?B?ekZKMFY1ZU1rSzhQOGVEQkNBa3k0dm0xWWwzdDJDNisxK1FmRTRRZDZ3SlBm?=
 =?utf-8?B?N1JrYmxHRFRjR1JDMTFKTUI5a2pRM0FUQk9PTWdyRHdUR0tsWGZPcTRwZlI0?=
 =?utf-8?B?TjRlamRQZEFxVnBCV1VVcjNiVHVuSjlNUDBKcG1lcXpyZUtBT2tjaVZvRXdh?=
 =?utf-8?B?bnpwaUhjRDNnVjlTeGttTDBuK05hcDhRWTdmS3NmMTBKQ3owVXhSY3FqaTJH?=
 =?utf-8?B?Q0dZYmJLUWFoN25qRUxqdW53NUZjaGwwVUNzSlRHYkRJd2MvUE1QdHVrZUVH?=
 =?utf-8?B?NVZWYjF2SWYxWFk3WHN3UjZmUjBFSmMyNFVjZUpoSU0wTDFBbWUwUFRWUHVQ?=
 =?utf-8?B?Q1VkTzRwVkpiZ2lZaGJwbXNFdXVnN1ZmYTcyYURFMG90elRvSVR0ZzcreUNx?=
 =?utf-8?B?ZzZETXo5VER3MEZIT1huN0FmVU5DUi8yVkNKUUErcTM1MFV1MGIrelRRN1NT?=
 =?utf-8?B?SmQzZDhHbHNJc0h5dFBhdVRiQW5nWFgzcDZrT0xEdHh3N3V2K1ZqNldBdHZl?=
 =?utf-8?B?VkxzRGpaNEhZRWZpQ0o0UUttZFJnVnZzbXJMOVNaM2FpbDQ1aG00c1RaeGlU?=
 =?utf-8?B?ZHpiYjkxN2E3S1VvVFovSUFrV3pmTXFrMTRmUFJSVGdwSStVSEQ5NlVzVDRN?=
 =?utf-8?B?amF1VktrS3htS2NQeHBQNGdXeis1ZVpLaHpxbGtwZ05rMUdmWS9MdzJsandR?=
 =?utf-8?B?b2g4RVp3TXNOeGpUUHAwVEo4ZnhpL1BHbzR3RHJnT2FhOTFZMm1HZnh3QzVQ?=
 =?utf-8?B?bnNvZUI5NlFTTWlMNXQ5V3dMWnc0UXRxY2VsSnlPMjlBbmRLanpWWUkvcUds?=
 =?utf-8?B?WXJna0t1ME5Fajc5K0pTTWRsYUV6SDVIaHlGWHRYZ2I2a0wvWmkrM0NEYmZC?=
 =?utf-8?B?S3BzdXVUd2JUVEI3c2NQeVEyVFBJdDFuUDhDTU1vR0I4ZnB3YWkvWkRpOWto?=
 =?utf-8?B?dHpMeDZIZ2pGRFlsYjUvREcwa3VvdFdZQ3dEcGJJb3JDR2dQQkUrbVp4cVpn?=
 =?utf-8?B?SDVVdUVoQlczRmJOUTFYdzF2eTErakJtOWdrcG81a2I0S0RDUG9WUXF2ekpl?=
 =?utf-8?B?a0hacE5TMEs0SWc4WHZ5Sjc4UHhoQ0FCR3lxbDlpMXg2Y1lVTThCU2RNSDFl?=
 =?utf-8?B?aVRzOWtsK0ttbEVTU1dLSG4yNXZ2TjJGdmFMb1V3c1BJSTE5UzFSbmFOZ3F1?=
 =?utf-8?B?Vzg5eml1MWxrc1ZPTkdXdm1scmN4UVYvVWlWZ1BzN3NOTHAwWHR0d3RjYkIz?=
 =?utf-8?B?ZEduam9JdXVkZXBCMVdoVVhMUmVqZ2NsVGlUclZiZXdCMjNWSGFIL0J4ajRK?=
 =?utf-8?B?c0R0RStPOUNqUUZ2b3VjWFZ4NkJQNS91UTFXQ1JiaTJRa2VGQU9Bc21FaXNN?=
 =?utf-8?B?M2tzVWMvblF2M1VJbTBWOTBCcGI3ajVFaHluSVJhZHZUUnpESkkzd1N6T0FG?=
 =?utf-8?B?MVB5QjhUeGUrdEx3YWdTbzZOTVh1aGhReFcvd2kraTYzandXVEkxaXkxYnJW?=
 =?utf-8?B?aENobC9NQ3pLcG9ZN1R2UlVaYW1rSXd3NGRPUmdmbjZkS3ROdW1vbmpnUnk1?=
 =?utf-8?B?SzNxenMydzFjY1RPNXF4RGYzNkoyeUF4ODVrTjZwMUJnYXh0S1hJRDNQTzJJ?=
 =?utf-8?B?U1pYRk1VeXNVbHhBTEVaUzhwUXVleCt0bG1XRHZMOW8veDkwTUZWYzhWbzls?=
 =?utf-8?B?QkZZY2M5ZFJHRHhJL3hUMzc3TjE4MjV4V3VqdTdIREYzdktTVVRjYTVVUlpt?=
 =?utf-8?B?WXYrQzVnZ2lYOVFRaDIvQ2czQk11azZBV2UvNGpvMXorWlhSTFVwd3lybVpS?=
 =?utf-8?B?VTVGZ0Q2c3NXYWJVb1F6ekVCNHF3Q0lHb1dONnVqbnB2TEpuZDF3akxFQUtT?=
 =?utf-8?B?QzB2aHJoQmpIMk5sSEd3VjJnSEFYMGVub0wzVTh3Szg1TGlndXk4TnkwcDJz?=
 =?utf-8?B?cktTdU1TeUM5MC9DamZSSHF3WTU5ZWtWcmw5Ymt5TmJFV294TlQzTDBWZno4?=
 =?utf-8?B?YmEvMGlxZWgyNTFObzlGNHd2bG5RPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	weKhmct9a6OdmDdnU3WyTOC9489vE8nXe5ivd+zLzo8LMPMWa62kZGf34ddgsfwsfe4rY1e2K59R5WnKoHzii2JqGcP/p4xFMaFHlT4QYBprf7Nj8K/8/U1tG+9d01YX+YO0Ax85WYmB37CgqeUKcmi4+VD+yekFwELv2LY4XzCHthMwE/pf2lPdku3GCCDfkzGg6MCv8f6gDhZXsyyh+sfj4K5oE2OT7gt+4HpLPjNxpIf+wN9tA7f6acLUIK93xteS8apD170WtgsNlndBjaMwoD8lhcHuW22jjafdfFOQEKxjTPRtobS/oSL24chosPlo0CK0OSFbGIFKQD+AKeX8d97os/m0zibRDIh/oPDug/4vPAEUjHcZh9XKqkyTIho8z0VAWamWd8+XHpG1rQNIFNi9hzWSmY4aXyvo3UQBJG2KM7tE5kN3z2E1ZpnZ
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 15:07:25.9228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48152693-42ae-475d-191b-08de6e3642ca
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR22MB5522

On Tue, Feb 17, 2026 at 03:53:08PM +0100, Andrew Lunn wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
> 
> On Tue, Feb 17, 2026 at 02:59:48PM +0200, Ian Ray wrote:
> > Configure maximum speed for the switch PHYs according to the electrical
> > connections from PHY to RJ45 connector.
> 
> Are you saying only 2 of the 4 pairs are connected to the RJ45
> connector? And i assume you are using a 1G capable PHY?

That's right.

> 
> > +                                     max-speed = <100>; /* only 100Mbit/s lanes are routed */
> 
> lanes generally refer to SERDES interfaces. For twisted pairs we use
> pairs.

Thanks for the clarification: I will send a V3 in two weeks time.

> 
>         Andrew
