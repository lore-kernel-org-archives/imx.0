Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022072.outbound.protection.outlook.com [52.101.66.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FBB3AA4EA
	for <imx@lists.linux.dev>; Wed,  1 Apr 2026 08:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032125; cv=fail; b=eh40BPVYEGAdM4ZwUgPo2fKDLvfGFlcWJbsfdiOgcNbeqgHqjqqaWcnAC6go6dx2UmNsHh8dRQ5XpP6AmseVWSp0HkkXH9JV3vQDkbExRWOaRiObiwINk1xcwirfkAdgYHK1t/vOJNHH66OSDnEzTlDzDz/K5gl+Uc134vQJkjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032125; c=relaxed/simple;
	bh=rq+kLm/Ma1o/ZcwqsuPRaHuQjAuFipqNlxobGIEG5/M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IlrdTej3ZG5D+qCZySOJ599Frs4BW7Tcx7Gl2ETrnjkSjARWYpU4AZMj/ejCqvlRdtqW2SjXTKQogyEn3W3Bx7tvtXQRauJX2edvGwygfQJHmvjCSqnv83lIyCLPuZf+xCEEIfaNwNv726wvIgb31XRC+oXBOYnPBXk9/U9x/3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=j27EHHY9; arc=fail smtp.client-ip=52.101.66.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="j27EHHY9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTnCJvvO6EdkNCviO5balrc29/e8ESOdepUodPKGU/MTWy8jh2TSFQWPSfUQm6VsJa3N/N2Js7psm7GUJcx8CgX0s04dn1j1ANdyiF0zqrj2RlkHAQh5jf9J4W3Aa+/p3lPi+IiwFX2gkEZ+qQNkjYlQLAq/ic1+ZrvQ/MuDB4fBwBoRCxPZSwpMHULdH6d69yeAvVt4Fq15caEata7p7047JtHA17w0Ent+MCZqNOmqhSBMjqoD2BklBCfe1H72iSaWVUFMbMe1SyysImCDKQLVB6k4atmyRVKPAt4IQUvt4mjQgcCsK34qFHRYr3vgGFoRI7ZEI9rMxGjM5DcF8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqH9sKLfHhmcoANcuySDjn5w/Mvt+c/3TgdLER1ogH8=;
 b=qE/FjnLLPNPRCMk3V6+VSXtCFPMioM0zsYQN9svemfZPuXrFXCyL3NCZBOirrf1ZGyQbn8ZHyDkJlWhcg5+561CevZyazbj6q5Y8zatHQb8M7AjYg0l6f+XsW7YLbMSNghsGE5MTkumqafcjbMU+znfhrnCk00DabTIn5gyQDYrUEU76ShW6miZOylZsKdYuSGs3suYQ7NVASFSi9fqoc1FRKFkGtP+Rb9rzuXIHYxhwDv66JDobSN2nU5GcHj17RlWabijnQhtoa/b3bbUUaeYh1CnWKfzbe0lqcypOm/aL3wFfSjbRURxkfc1qiOEmJgMBBYVkqxG6hzd3Tx9p/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqH9sKLfHhmcoANcuySDjn5w/Mvt+c/3TgdLER1ogH8=;
 b=j27EHHY9yt4RSfWyEgkDY6WelEEHdgGgSDvS4k3mBwlMMNt7c1l30eJl7FiFI7/HMazY16JaIxo/ULE5ErQ3HLoi+g7YAsFCiHyIYJRiWnAff9wj2H7euvkJAWGwDvHNpwE4DiFCDH09H397nZAizcRD+zMfTOodfXPm+PgOI8WVa8njbcnv4/liwkuNSEc027sY5dI7G7dARQ8vVkZpmfRhZcSN1GXcuMF8d+oJVvJzts13oNCLasyHmqbMmm9NEYsaWfs3WFe/gC71u2TtfiY9y0UcXd30/RnkgWACltx4ahZFzgpXG8Sfyq9WqW83VVPyUaGu2J5BwTY0VAQlog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by AS2PR10MB7108.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:60f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 08:28:37 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%3]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 08:28:37 +0000
Message-ID: <5fa79355-9dfe-4f8b-9eee-e3cd8aed932d@kontron.de>
Date: Wed, 1 Apr 2026 10:28:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: imx8m-kontron: Revert reading SD_VSEL
 signal
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>
References: <20260401-imx8m-ldo5-v1-0-1b1c1381babd@nxp.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20260401-imx8m-ldo5-v1-0-1b1c1381babd@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0232.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::13) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|AS2PR10MB7108:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f410a4-5781-459c-267d-08de8fc8ac08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	7FhE819JAq5otNkjB5wemj0DIE/qgqLuLiW9FjdBk3cuhVUDI/+iIrw+kLhhyVMCOloFkqf7hpJ0bvllsHO1F+3ecuCDd45qHv/vT3r0aAL8AgGAMXaaqO1s+ZfRG306re3n7fJUW5MAUwpQCZ575rieeyA8DWKmA9Leh9P2GfhePmAlN+oHCKvxew386uFYr6hzoemoiRj8rvM/p0qcEWw7VqSS1r/qhO9W2X+DQY1AS49wAL4/yWDSPMHmzFYJEGR82xWieqnv65HX8ceRwqhx9uC9sfnWzhr4Q3wvVnVvA0w5qfKoiAMl5vRAGPZ9zxZsPedwNzjxzWuvcdj45Y8Qn0Cf2w5Ke3I00oCB0cTe+d1HcyKclI+Qbj7KFhkanzxZ3FpJPTbvJvE+VVBTM3hi7/juq8zUdMI9R0zr3Hc7pvRKOgxxQLkKu53EUkYcXViOcT9ATadwMgt8mTadr2zjPGBnw4ByIaBzNdIILK8ll4n4LFpvFR4CsFfzXjLINxYzBcbQfAg6Fs8rhoSRUMMukdcOl5vCNhaQUmPF9P0Hg3+2dODjfm+Cr5poAzB0s+SYy/GwrH43tB/YogrpCMVfsUG0/KOjx35k63hZX1LqX2qLxzeWlRMTF5QdgYbEFJ3EIShlPbUu2b3bnUsJaRumvZ/mJQBVytu51fmPFI78ZXzl32ERAG25SzZSib7re6Q6KSgYMPFJl80Si0Tm1JHNWUGM7xvrSliPXUfAS6o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkRBcW1ZVTBkRDIrR2pzZkwrYjFBc0ZsUy80SE94YnZLWjZnbEJyNWJPYlFX?=
 =?utf-8?B?Um9mZXliTVRFSDg1enQwb2dla3A0eXF5M0E5OGF1YkduTW4xc3h3OFFIQmxk?=
 =?utf-8?B?c3c1ZGwrM1Y5S3psYldMbTNSK2l4anFzMUxtclhiNkhJa3VDUVYzcWRRNldm?=
 =?utf-8?B?YlJEaFEyVnV6NDJZOE52bmUvYytGQzl5eEIwVHRHaFJJaWRKZDFKZXdpTmtG?=
 =?utf-8?B?WkdTYm90TUg1N3dKTTllcDdDbUE5MWU4VXJFUmhUbFNrZkNsZ0IvUDkwZTBR?=
 =?utf-8?B?bG1pWEU0N2tFK1MvUWFzRDFwNXk3WWI0U2c5Y2M3ZU9wNmVUYTNKenNGR2ly?=
 =?utf-8?B?anV3SGFaMm4xNFVyalAwK2hzUFFTWFFER3FhK2RNRGtuWXVrb3hnRFJmNEJD?=
 =?utf-8?B?WG04LzhZNXg5OUdJQjVqRDJrK0E0dDBNZEdsOVd2cXhSeG9hZDZuVlBiYitS?=
 =?utf-8?B?RndqVGVFK0lZNFROTnNRbGNlajhYa0Rucy9VRFlvT0dLSHRuZ0ZSUUxNdmNx?=
 =?utf-8?B?T05hbWthbXViVjhwcmdrZllUcEVDOGJiQTRaUklIS3VaRkxIN2NHNStLMFNx?=
 =?utf-8?B?UEVWZGpMSGNBbEpuOTBETTJlaE9ZdVpGNGorT0U2ZkVPSDlOemp5TjN4RHJa?=
 =?utf-8?B?cVFhMmNac2FHcXJkVUVMNGFwVjFzQ2Z1T3EvS1MvMjZwRTJLNXlPeTdoaE83?=
 =?utf-8?B?K2pEaHplR0hhV1JHdVQ2eENxWmg1VDVYZ0RhL2hGQmQxdGc4dk5raEVaaEFI?=
 =?utf-8?B?bGVoWXlpSHBJdndQRUNzKzhULzhYTGpkbXgrM3hibkVnS1ZMUUdYZTVEREdI?=
 =?utf-8?B?VzVIbTdUWFlEQStmTE5abTVrb0lDWDB6TWtJYjdmRGQrM2FNbWh5OVl6SEdM?=
 =?utf-8?B?cXRHUnN6ckxnMmFPMHZYNE1hWHNuajkwbWwzMGtNdC9FTmFjN3pSRlI0TWVp?=
 =?utf-8?B?eE1PVFFoUDN5dXdOeDNKQUVkVjhZc1F0TEM0NUhOaG5sZjkzTUhUTnl2KzFC?=
 =?utf-8?B?UEppdmZJQVdyY3p0NkJtb3NSUEFhbUx6WW4yVWgwUWZRVXhOK1ZEcTJ4S1N2?=
 =?utf-8?B?dWpyaTJ5dXp6YU0yWCtlM3hUbmxOSUhHUC8yb0N3Lzk3Vm5jTDJsb3B3Q3Zm?=
 =?utf-8?B?QytFRFAyVWkxN2FpUlpDMWVneHd3WkNQcE5KSTFIQVhncUdObG4vRVBBY2ZZ?=
 =?utf-8?B?QjNQaGN5Wkk0N3BZdHp4WlZtRjFNUUM3dGtVM2pvd2tyMXVUWWVBOXVqSFl5?=
 =?utf-8?B?VHpTZ2F1MlVURkg4NW9ya2hGeWZjbjlXTEViZ3Q5T25UaUpqTmVkWGZRdTl6?=
 =?utf-8?B?cnhHZ2dqZU5rYVQ1VTJsMW5oTnhXc0ErV0JFT2hLN1g5WDJYeDJkbjIra3g0?=
 =?utf-8?B?OU4xNExySzZMU01IZzhNVkJUVEU3dHF5aVJCMDVjaUd0K2RCUGFBOTlkMXlm?=
 =?utf-8?B?WHgvUjBSWktzelQveDJ0T2JDUzN3dWhCL21JM0xmMTdJUS9YL0xEZUlqTWgw?=
 =?utf-8?B?Q3dVbFRnY1ZPZHBiazBJaWtVN1hYR1pYbnRBZE9TUnJRbGZPY2RNUTZmc1Jn?=
 =?utf-8?B?Q1k1TnBGcGY2MVNWQjVkeDJLRDRGMHRQa1JpQXdkZDFlU0NWMFRZTGRJOUYy?=
 =?utf-8?B?cW1FcDVVZGg2cVF6Sko2MGVuK1hGOVZmK0RPQWNGQ3orMnRwUnBSM2dTYTlT?=
 =?utf-8?B?Rm1SQlhOZHNRSDk2M1Z4YzF6WTBnem1Xdnl1aFdxbWVvazkvVGxpR3VVa1lx?=
 =?utf-8?B?eTVNNVVkRElXRWM4V0hjTkc0NVBDaTJqcHNQVy9TV0xzU3hLMnRRa3pSZGtZ?=
 =?utf-8?B?UzhiL29aMzZHTmNNN3l4THdLWnM4YWNEdFFCRmFkZlRhMEYzb3Q1UklMczZ3?=
 =?utf-8?B?aFlsRFkrVjBRdlVwWE94RXRwcTNKWS9KNDMwTElZS3JyMThiVDZWc2pwRHor?=
 =?utf-8?B?eFNrSXk5T1lOM0lUdHFEVWxXL2xuaGs1b2xOU0w4c0I4TnJBU0tOb2EyQ2M5?=
 =?utf-8?B?TTBPSVY3OE05MmlpQ2VnSWdBVTlmd2VQcTNFUTdmcitSUE5rZzByUWtscHo1?=
 =?utf-8?B?SjRzWjFsdERidGJmTWdqNXgzVWRPUStXRDRPTVhTak5rdmJiZmZhdkxFNlNJ?=
 =?utf-8?B?a29pOHNKQ1lMNUN1ZFJzcWdlbkdSbnNPV2ZHbndlRjQ0NXB6SUFjR2hnWHdX?=
 =?utf-8?B?ckhKZlFPVUdHTDNCVjJyRlpZUkM1emRqd2N6LzdLNUVGNmFMSU0rYythVjUy?=
 =?utf-8?B?K1Yxd1JqaTBZejdqeUt2SG5VcVJjQllmUS9lT25yaU9Lek4rVHByVi9HeFNQ?=
 =?utf-8?B?L3RRTWhwOVZyd2RqbmhmRFNrSW9RdklYMHBhNGlWL0o4UmFvOStLL0xKSVQr?=
 =?utf-8?Q?ltLoNsG74NVDvykI=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f410a4-5781-459c-267d-08de8fc8ac08
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 08:28:37.6705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zy4u5zu+dNKDr6/ZxI9ueoZiwB1S2nlUelzqJrRiQZoAtGYY0u7QiHCt1YETe15SqyKFzeOF/0Z7W0zOVBcAxPNrhPYAec5LG9DWltWPFGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7108

On 01.04.26 04:05, Peng Fan (OSS) wrote:
> When MUX is configured as SDHC VSELECT, enabling SION is not able
> to read back the SD_VSEL value. SION is used for force input path,
> not to redirect the PAD value to GPIO(the other mux).
> 
> This has been confirmed by reading i.MX8MP RTL. we have not check
> i.MX8MM RTL, but it should be same.

It seems like you are right and I misinterpreted the documentation and
also misinterpreted my test results. So I was probably basing my work on
wrong assumptions.

> 
> Not sure whether need to add Fixes commit for the patches, just revert
> patches.

This was introduced in 6.15. I would like to add Fixes tags for the
reverts. And can we add patches in this series that switch to GPIO
control as done in [1] and also tag them as fixes? This should allow to
read back the correct voltage from the regulator.

> 
> For the U-Boot support, either drop vqmmc-supply or switch to use gpio
> control to replace vselect control.
> 
> And below patch should also be revisited.

I think we can revert this, too.

> commit 3ce6f4f943ddd9edc03e450a2a0d89cb025b165b
> Author: Frieder Schrempf <frieder.schrempf@kontron.de>
> Date:   Wed Dec 18 16:27:27 2024 +0100
> 
>     regulator: pca9450: Fix control register for LDO5
> 
> To supporting read back signal, need the MUX set as GPIO and support
> in/out, not set mux as VSELECT.
> 
> TBH: I have not test setting MUX as GPIO, anyway we need to fix DT.

If we mux as GPIO, then we don't need to read back. I think in this case
the best solution is the one used in [1].

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=5245dc5

> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (2):
>       Revert "arm64: dts: imx8mm-kontron: Add support for reading SD_VSEL signal"
>       Revert "arm64: dts: imx8mp-kontron: Add support for reading SD_VSEL signal"
> 
>  arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts     | 10 +++-------
>  arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi |  7 +++----
>  arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi |  7 +++----
>  3 files changed, 9 insertions(+), 15 deletions(-)
> ---
> base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
> change-id: 20260329-imx8m-ldo5-90e369066213
> 
> Best regards,

