Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012061.outbound.protection.outlook.com [40.107.209.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E6E356A13
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 13:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771334506; cv=fail; b=ZeCM/L0vdgF7d6hpsRkKkRTIIOR2PMshTifmKS9nth7plLbXBq+CLfaClry/mIcJU/Qze+xayxK6ZZjsHRBm3DSukiv4QS4dugQS0F4+2Ga+UyOlt/HiJvrisZp+I1qa6wLYUIXZhlKn/DE5pnDMiMIddWqBw1hDW5wxHQRtybw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771334506; c=relaxed/simple;
	bh=431+z0oFO8C6eTIhYYHFbB0wBs+O9hCm3nMdmFRUCKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/qGsuyjgwjTj+wJTUCzikvdBgM6vfEK+PCdzCX4gwVJhdg8XrwpqNivI1WeI2D52DiKppWU7675n+Exom38QLLZejkfx2Qcu9oFeO3jClk1wWWtgWsPzigKtPyRxMDd6GFiJ3zu3oxxTOYcbWFBwzEytF1uvIzISmpWH6I++BI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=SkdI9nmL; arc=fail smtp.client-ip=40.107.209.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="SkdI9nmL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqjcJObApOcp8qtlZr3ZqO5LcPv8xsfIQlQ+2JnC2V3ZBLRHZajM8zDTOkgIuK3yz9Vv7Y7o61oluq+2uo1rDmloBwj+RgR0QSo5JKT6ANbrv9k6HEI9P0ay59bg3cOvbbu2CP4G8AZS0/HLqfUykaJ3wYzIRMYN2JgxNnP1feBdBzAAOI3bpU1yZijsV9zrFgt1s2uCjtALHFw/wIRSUTSAk31RyK1WnAfJq5HXQx4EdPRF7Cl3CC9tUct13poJ7B8gOe/W/XZQpAe5NIpE++isvr+kUf2qfY029heK/fdPGR48YMj4T5AFg/Il4IoWEWuVSi1xOqvwKkZ83aST3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wps+YWuB/ATh5Lui4/BAtJTg/W0Am0d3K7J1MIwT1s=;
 b=VQEPgGWJVfnR3DMKRYtFLYfl42gcK3SWwcoUzkvoD+JLJCdLBQhKf/Tk2mUr+R0EHzFiJofHtQK/e8dnD6Tl1FSVa1rm/V2Wyz7h9zbx8EZuxtM2iKx8Xp0liw4XhhK14J89BcIlG15RqXwfCeoNPgenll8mxe4G9VJlGh/5QWcnTA6NC2bV0Byf5wMCsnV2qweOMC3vX6pkUckVWtYZuXmSLxLhejPlNgS8gEK0jds+MD3BzerN5WE5GRiwKf3YJeu3o1eaMVvBiEZeW5KyZSRK2Jkh+NkaxzgMih9yWCbkWJXW7HkZEvjAwwXB+MDzyFKYlQGHjsqkVRvjZeKTCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wps+YWuB/ATh5Lui4/BAtJTg/W0Am0d3K7J1MIwT1s=;
 b=SkdI9nmLJu7vAJd8Qxk0P1Uc/3ceTfLBep3s8mWM6yzWJQxQTeZE/FNyaw+MtAbPSEnT+4aW9vIOZ3uBcpsmQygRVZfhANoF6lUCELR/v1SxjJBk1Z74Ay2lUr1lv1lrPIZJjP5wiujEHPwpFC2jWr9BE3NUdr7e2hNDhvCvvE1nWugUFCuhmf6EESxQBYDDE7PLIr3rpUJFeShyMHHKm3eyh/JlBpzv5c8FYJNvzllrPBTPesuDfcRLzkYaSiy7qIQXtEAKmi4AdzZUzCl12qs75fKMXJvlPImCKyDxCzoASjPOd/Swg1RQX3PhA51Nl+YHeA2IKr1DoyxGK7RY8Q==
Received: from MN0PR02CA0012.namprd02.prod.outlook.com (2603:10b6:208:530::9)
 by CH3PR22MB4293.namprd22.prod.outlook.com (2603:10b6:610:178::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 13:21:42 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:530:cafe::68) by MN0PR02CA0012.outlook.office365.com
 (2603:10b6:208:530::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 13:21:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 13:21:41 +0000
Received: from zeus (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id A88E1E8F41;
	Tue, 17 Feb 2026 15:21:38 +0200 (EET)
Date: Tue, 17 Feb 2026 15:21:38 +0200
From: Ian Ray <ian.ray@gehealthcare.com>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] ARM: dts: imx: b850v3: Define GPIO line names
Message-ID: <aZRrYoz7nwdkJxAW@zeus>
References: <20260217125952.53997-1-ian.ray@gehealthcare.com>
 <20260217125952.53997-4-ian.ray@gehealthcare.com>
 <600ec825-4402-46a5-85df-1e57f0ade49d@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <600ec825-4402-46a5-85df-1e57f0ade49d@oss.nxp.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|CH3PR22MB4293:EE_
X-MS-Office365-Filtering-Correlation-Id: be92082d-c220-497a-2f73-08de6e277d28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTNoOWJaNEg2bmx5aVZGWjlzSEF1S1I4WC9IZ2F3VUJNZDliN3JvSUs5Sm41?=
 =?utf-8?B?TjFaUDFkcEdJdTArUllrRVFlbU9HRmdUTGhjRXhlR09qb3c1eDNKWEIvbVNq?=
 =?utf-8?B?YTlBOG9nRUV2dVFCbXRmcUlpUGhSbldRam00ZjFzSzY1TTZzZmF0SFY0SzRX?=
 =?utf-8?B?MlViU2k0WDk2K2tNK2svdGZvVDZUZFVMUnNucHJ3MS9CVnlMOGplNkFUK1py?=
 =?utf-8?B?a1AySUtyOEVkZlhZY0RlNUd6YWZSMW00Kyt4cVNQanpBNFdTL253U3BYNi9G?=
 =?utf-8?B?UWRnZU90YXV2WkE5NkYxZjlqS1F5enhEZWFiNzFSeXliUWtvZFBjc25jYVNr?=
 =?utf-8?B?UURMK2lOaytZWFRPazY1OFFzd1Q5UjZOb0kxUGtPeno1N3E3UmlWNXZHQ1NS?=
 =?utf-8?B?WlE1N2xpRjFTclREWFRKdmpBOEQwV3UveWErczBtdGQ4Wk5JN0s0UDJEdDRv?=
 =?utf-8?B?YkRoVlUrM3VPb1ZQdjZNZmc3RHg1TDVWZmJySTVhRm1xSkZmV0xkTHY4ZDI5?=
 =?utf-8?B?VVVWeStrcVIzVGFTdmNkaXozNkM1MjJBYW1IT1hhMnp3WTlLVXFmZVlGTUNL?=
 =?utf-8?B?bEJRelF0VUhMY1A1WHNWQkx0TzJ3cXpvWHUwM0dnN0dPbmlCcXJjSUh5c2x6?=
 =?utf-8?B?QjFOSytnTElpVXhPRitDdU9GMVF2SjdZRVFhNkxqbENGdFdZVnBrR1BmaUNB?=
 =?utf-8?B?ZTd0bVlMbUY5Z0ZYUGJ0TDJubFZOR2R5YkpyU0EvdEVqVXVmTnB1b2RtWmgv?=
 =?utf-8?B?STFaTExEZTdlZXpvUzhlQUcrL2MyZkd4eGIyM25XelVpWUNLaHlpdkllS1Bi?=
 =?utf-8?B?R2krV3k3SWJLcnA1cDVIUTdMcDNRY1RSRVRHYUhieWFveUpWeWcrTXpSVWln?=
 =?utf-8?B?Z0dFUzk0VFg1RUtaMVBTOEw0MU5TNTdJa0JPN1BuODkwVDNaZ3NYOVB0b1NM?=
 =?utf-8?B?VExHVXh0MktHNGYzVEVYVGw5WmE0b3NYc2R2YkZoZHFPdDYzaEhDTkxOT2pr?=
 =?utf-8?B?bm5BdllGZ3I5MnN6RFpLdktSeEZ2YzF2SmpYbVJteWhCTlNMeVFtYStJd05H?=
 =?utf-8?B?akpIV2wwSUdSakJTNjdzQjF0TDFIUTI2K2h6S2Y5cGdnL1A4SS9HY0t1alVp?=
 =?utf-8?B?TGI2dVQweStHcGQzWHRhR1F5VFRPV1AwRG9CUTVCV3o3aU9tNXFNcHpaUHNI?=
 =?utf-8?B?eXdGWm8zZ0FST0k4STBKN0NzM3pOdEFhbkIvajltTlVGZFQyK2VHK1dzL1Nw?=
 =?utf-8?B?YytwT2lOOUhCTHJaNnA2LzVKeWEvMTgwSXVjK3ZyZG9lOWdBOE04cEEwVzg4?=
 =?utf-8?B?OGh3SGl2R2xFOHpSNmh4N1lBQ0hGUDMyRWxuL25WSUJpSjlZV1dDaXFpZGRX?=
 =?utf-8?B?Sml1Q0syVVpHNVFkQVZ2NTQ0cm0xeHRyYktLUG9Pc1pqMFU3dEhUSjIvajlM?=
 =?utf-8?B?ZHRhc09sR0IyV0tyb1hlNktTVnc5MHR3UWVqS2NmQnErQVErc3EzRFRWZEJq?=
 =?utf-8?B?b3VaOFFrbGk4YmlRS3RXWkdmVXBSejVuQTg5UDNXZDlnL2o2LytCc3B1TXdm?=
 =?utf-8?B?WkFrUGhmQVhSVlJGZUt5MnZqVWI2UzVlVGkxUXNlNWFnY2RNN1pOZ2R4Sjhw?=
 =?utf-8?B?ZDdzdXo1YmxjNFJKZ3Z5Vmh3M2N0OXJuK0NWUW1MRjNpZFVxblM3c3pTVXln?=
 =?utf-8?B?RmF2QnRlQnlaRVptZGJxUnlMVGVlclQzOFU1ZSs0dEEwdFF0b2x5cDhxZC91?=
 =?utf-8?B?TDNFZUp5ZGdZUGZJRFJFSmFhMFBhWnFLYXZGSXZUZUN6dVJ0cEttaUxjUGtG?=
 =?utf-8?B?MkgvYUgycjBBeTNJbGxPUDZmZmgweU00c2RLTmkzNlNUbVlIMDRTVTNCTENx?=
 =?utf-8?B?LysvK1hXdmR6UmJUblpUV2s4YS9CNFhYRy92UVpzQlZTcmxGZnFrcnlqNWk1?=
 =?utf-8?B?UlVZVGhzTEUrRUZoYXJwWVNYaWdzQUsyN3dWL3VYb2duSkM1d1dhMHNMZFFq?=
 =?utf-8?B?dFVhT0M2NzhRUjRzRDJUOGtYRWcvSWxNOXJqYksvY01BVkdSQUhkQWJ1a01s?=
 =?utf-8?B?QnVFWVBIeElTdWwrMUlOUGFDUmE2THBQNUFNTE5wOXlTZU44bENCakV0VWJX?=
 =?utf-8?B?d2xFS3dKdmtEc0o2RzBFTHJwa1ZjZnROS3c4ZHlBdFNqdWxuYjg3S1BVUmlp?=
 =?utf-8?B?WjlyZlpmVExoUmw4M3RpR1dBc0E5bXFXTXVWbllLcXN2MWJmZ1U4NWJTMTJB?=
 =?utf-8?B?NTBvMmxzcHZZRmxDaDVSb2dGc1ZnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iFVwa609el62Z5+A3DnzeMcGA59z9swRKAjUWhNXN205GlL8xMWr7gixYY4QN7AAfndFGECfIuQ49FWviPHcGCImxGEbg81Fxyw1267HS54ZEKQSGBDwiQMHu09J8rXZtEzhTvO3CFgzRVCCGCxlyq4hVeDnNhXEY32luSJOl/AcnFHdK9VaAB1SesA0Lu8tHih0zQP2h4UB6xnkAniHW60hiY/+ISP4GIUkzs4taUrJ5BhYUvow0euVAfKGwifqSurgef5wA/J04HWak2YYfxxg6ORO2CRnAGkBm2SsWlQ+Eol2VsPhnpxsA7oYgFAx7HugORP3Oc+L2gJ5LoUdRhWQG2si8Q5Cyj70YmFU84pu/j+on1xuq+6+JNisMzpHURRuyeeliR88FSptrA/9oqFeZvvpK8ZJlHWeO24hp+dmJ1XO5WyLepte0+5BB3/u
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:21:41.4269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be92082d-c220-497a-2f73-08de6e277d28
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR22MB4293

On Tue, Feb 17, 2026 at 03:23:02PM +0200, Daniel Baluta wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
> 
> On 2/17/26 14:59, Ian Ray wrote:
> > @@ -72,6 +72,18 @@ lvds0_out: endpoint {
> >         };
> >  };
> >
> > +&gpio4 {
> > +       gpio-line-names =
> > +               "", "", "", "",
> > +               "", "", "", "",
> > +               "", "", "", "",
> > +               "", "", "PWGIN", "",
> > +               "", "", "", "",
> > +               "", "", "", "",
> > +               "", "", "", "",
> > +               "", "", "", "";
> > +};
> 
> Looking at my latest version of code this node should be a little bit up in the
> 
> file to preserve the alphabetical sorting of references modification.

Good catch, thanks!  Will include in V2.

> 
> e.g
> 
> +&gpio4 {
> 
> ... then
> 
> comes
> 
> &ldb {
> 
> 
> etc.
> 
> 
