Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010046.outbound.protection.outlook.com [52.101.84.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C02936A034
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 19:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771874321; cv=fail; b=ASCvXIkjbWLrOR4El2Kr0NKEQG6d6gHsAYKNfbcCBvpcqQ3xjZOC7Y+2f+Rlaw9l3p+KHWUB8nVtr9tuh1ifBHefMG1OVXShTahinAJNYEjMNePIW5KRQR5qSzB4EeMeaPFCEGD8RsP3N+/h4qEqxmheyrcOKOKQsy62FtmJC8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771874321; c=relaxed/simple;
	bh=eKowog64ikEYF3fqS7jQAMnRQqAyMW0UDTx6qt1Klis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CmL8tkMqjt6NGjRfcTnWHlAxHMbhGGq2JL8us9NdNpGJsvu/sGcMi4Q/yNiEgwFxGFSaIVaEcTqkX4nl7PhYZO3h270cmqwmDX5rto5iWg0Axwg+EB/ZBjBOgH37AYFAask1LIFMHj/eyrQqwqyXO21wDP/2hVZvt7LVhQEhrPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HojRR93X; arc=fail smtp.client-ip=52.101.84.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HojRR93X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PsZnb5+Px41nOvgDOLatFFFumg2eJ4qNbsDl6KfP1TmeIjADIz0vvOtZrolizu3M/nqgl1Nv1kTOePVHcw4o5M+lku/pOk+8XAfuIgi5rEv7cdIREzUwbYnsSO0R4hmrJfHyujmr5bp32IjSWmdlk+VYnZyifRfSRbaQlsjkEZFcpY01ZiIBpvP8SRKPlarwic0qfMlObkym5UoIj6vAimWnx211QaHuAotBp3VJNpfFkxs4OCme+sc8WAkQSH4ldl2lNUQ6ZW7jdfKO6L/n7RIgOJt8kPNROkvhmC+Le8hCZanfM5SXl9IhtB7pK1OL3c34GWissxCq7fXN76hCrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrkKdmtl2zoaCqIglLI/J9JL32aObnsl5yfg40NonlA=;
 b=AWseIGcnGgGQGqEe/1IWKZSmGYjHxUgqj46Too8U+42CrvhxdqU+Hx2aCq5vlHGrn1Fza+TY7t52/lA7aGzQEoMJu+fZ1/Ws5/iuI9pMDsb7wxgVJCwlk/m+m2quAR2fP4Ofhj3P1aSDMDSSxuvTBnSVXt+ZBMC4Srq399SjbcYZcTViuonswdqyt15XngEB7Lp732r2DqffOT60z7/P0z/N6X5t5m+0Gpb74dbTJ6DvSNjAjUJgMA7Tqxo69egswsTspiYet8sztB5Wnkax1VOuNZkEDPoCR/AqA3z5wJHu1lL/I7/rle9KzLzuNpIUFZ9ruSrLRxlFD+rXlXJ6Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrkKdmtl2zoaCqIglLI/J9JL32aObnsl5yfg40NonlA=;
 b=HojRR93XOvD/iZ04uox3oCXN9XfzVyGdVHM/UnAHc+VJpV+srAKxFlVAtslhLGHgDv+gSb8v7/gHI4t+d5VVooWSnO0YHcM+xCl9BBmic0Z2vXW+9Kwf+90CDIivmsqYiaRYG22CllByNQKINgZ64FUm/nglYDpnAoKBvYP1HmclzxZAlmdrJUBGfcDdK98BjFCZniLRIZxxhQ3PaQg6/EmocTTZS2ZX7KSIHeeB0wfKWT2bgk+gGJa9Ne6+QBP6TEB850yfLpactUSct7BUZ3VxbVA56Vu4iJkOA9SiPmI0jI6CLu5cMcemzOUFYYEAU/xanuWGtbQPF1bgJqJZsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB7054.eurprd04.prod.outlook.com (2603:10a6:800:12d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 19:18:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 19:18:36 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Subject: Re: (subset)(test, ignore it)  [PATCH v3 0/9] arm64: dts: imx8m*: misc update
Date: Mon, 23 Feb 2026 14:18:19 -0500
Message-ID: <177186899738.395969.14983394502364609399.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260118-misc_dts-v3-0-d3564716cbf6@nxp.com>
References: <20260118-misc_dts-v3-0-d3564716cbf6@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0088.namprd07.prod.outlook.com
 (2603:10b6:510:f::33) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB7054:EE_
X-MS-Office365-Filtering-Correlation-Id: bb16342f-8291-4606-ada7-08de7310579e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S09EMStMZ1hFWENZS0FWdytLTmw1Z2xaejFmTStScnQ5TE9jOUsydG16MjhK?=
 =?utf-8?B?YWtwSXhObmMxa1c0cDN4azdObjdnbGNXYnNWR3hGQ2dYT09scElFdEV4Z2NP?=
 =?utf-8?B?RHhZcVM1Q3RuMXoyVjN3dXZibXIxMUF2YkxQWCtxSmFRR1BPS2RNSVdGZlhz?=
 =?utf-8?B?eEF4YXQ2d2JJWlVHWjZqQzdNOVloS3JNeWtxdlJPWVpabDlIeS9SUDZvTE81?=
 =?utf-8?B?V2xOdE4zTVhkbHgxZEJGcEh0YnQ4RG9uZk5uOXY4VTBXcW1GaU1KWElYa0s5?=
 =?utf-8?B?U05HTWs2aFBSWVJENFdUTVF2a3ZtOGN3R3UxMExOWjNyT2VSOVBvWm9xS3Ar?=
 =?utf-8?B?V1hVdzk1Q3JFWm5PajJvM3ZYaFp0Q2Zlc2UvZkJmM2RSV25JdW1MWUYzVFZU?=
 =?utf-8?B?SXFtZWUxa202QVlUa3RoSFFZTExVamZHeTNRU2NLdE5oRnhRRGl0RUt5QUMx?=
 =?utf-8?B?TFpxeWQ4S3VlL3krR3JhQkZ5Vm1TSUhkZUgvTjYvUlZUbUVVWDFVdTV1eFkw?=
 =?utf-8?B?N1BLZXdJdTlqTUh5cFRzNjdsRm5XU3l5SVE1dXhLdngxQm9HdkkwbHhTdWY3?=
 =?utf-8?B?TmhneXFza2lWSmFRc2J5OHlKRGtxVjVqTFlHTG03Q0hQek5wSWpja3NWZEpz?=
 =?utf-8?B?RjdSQTQ5dHFIYW52ZDdaY0VvVnk3cktEbHBpdmcvMmtzUEV5M0ljbUMrbmIw?=
 =?utf-8?B?THpTWi84cWMrQWprTDkvaWdYQXZ6VmlWVEJUY0dSYklpWXYwY0Q0RVZVbFRP?=
 =?utf-8?B?VlRSV1Q0ZGpFQWhERE5DbHFHTUVaNzZ1VU11NXpKdWFKK0ZJRmxsTWUybTVt?=
 =?utf-8?B?UzRjSytMV2lCVlpYVjBkNnBJcEx1UW9venhUUDdua0ZSbWZNajEzeWc5azJM?=
 =?utf-8?B?K2pJLzdKdkYrN204RzVWNlowV0Jtd0VOSXdIMHpydENPaVVuNkF0VWppN2M2?=
 =?utf-8?B?LzNOZGp2ZFRZbTZpYkdoS2Fid2ttV0lET05mWmhPSTkyeEVlRkhWL09lS1VW?=
 =?utf-8?B?SG1pbUpYOW5JbFNKdmdReVdOTXpFc0R1OTFyTExjSlFtdFhXMFRndmw5cXFI?=
 =?utf-8?B?eTZCTTZyK3d5Mng4bUM0UjIwZDNycHlUVFQxc3dIM1ZuODk3bWJzL1Y5bmRY?=
 =?utf-8?B?ejNMMmc5VkY2V0NSeFdJSVpyNjZ2NDloc3pLQzhhbE1BVVZ5WGN3OXkrVU1W?=
 =?utf-8?B?U01rQzdRenkrU2lBRDQ0Z25kTkFtNUZocXZsRnJtaVlESUFZeDc0M3JEN3hS?=
 =?utf-8?B?d2M1VVJGTjVmV2VlRDFscmlueEFZVHQyNW9SKzJ1MWdKTGNPYVcwSzZnVUlV?=
 =?utf-8?B?U3lSTnN3cHcxRVUwa0N2dURpN3VuMFRoQjVzRzNxUUFjQ0NuVHdER1BWbWNM?=
 =?utf-8?B?algwSkRzVFVlazhSVDdVejVOUndHY1lIS2xoQ1d6SERPWjNEUWxSOUpTLzZX?=
 =?utf-8?B?UWlyc2tIN3lEenpobHczV0p0VVZiMk9oaTB1YzdvTVZGVmdwY25LY0Rxdjdo?=
 =?utf-8?B?NFRHUEI0dG9DQWtOeHpTYTd0czlRRWRWcGp0WUp1MzFjenlxM0VOYlpMN2pK?=
 =?utf-8?B?aTViUnlkRHFPbW5xQm82d05GaHNvaHg0N1gvUmJtNjBnYms2a1BVSHNjMjFK?=
 =?utf-8?B?T05zd2NmV1pzWXQ4Uzk5TTR4UGhGS2JhYUEvMi9sOHRscWtaU2RaaFRHTktq?=
 =?utf-8?B?WCtvdDdTc1BCcWwycjB3MEhtM25FSGRBejJnSloxYkFTUUJSQ3lwVEF5MGo4?=
 =?utf-8?B?dVhKWUtqSU9KNHJRcEFVUDNuNHhZR1JOUnFRcGpJQXJvczliZHZkMy9rVXN5?=
 =?utf-8?B?eXFSSE9sZUVmTENxZ0djRjJOc2dkakpyd0xRQ1RHWlNIUXFvRWhBalltNzIy?=
 =?utf-8?B?K1RJeU9KVXJqUGNQQnZzTlJlTUZRTjFzdEI5S2U2bG01SHhlZHdmcU1SUWhO?=
 =?utf-8?B?T3dMMU9iNzlqUzNGdWlwQWR6NDB2L080bTJoNGExdzlIaXIyTzMxeUJUMVZI?=
 =?utf-8?B?MFp1ZDdnTkFJb3ZsMnpVcWRCWCtmcmVyR2MyVWhCSUo4b1ZMN2RlRHpnQTRD?=
 =?utf-8?B?a01nMnYrQkN6TjI3VCt3UjhYeWNZbEwxWVBwRk1jRlZhMEJLNEo3cnNtczRj?=
 =?utf-8?B?d3N5c2hYb1gyV0RnaXVyNUVvT2JoSzh3WUJDMFlOM0g4Q2RhbEk0aVdFSUgx?=
 =?utf-8?Q?TGnebG8iJzJg2TSywicVwwapz3IlGVfFoJjFtIo3gJE8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGxJSEtYM3RjaFdxRzJsbVg5YW9tai96SkZsK09vSGNpYjRQSDE5MWhKYjdL?=
 =?utf-8?B?cHphNHNoR2tidExDeEhsS0wvMEJ0SjIwbUFDczhSSzNLcTJkekRjWTU3ZU5x?=
 =?utf-8?B?VDlnNVZkbVl1MzQ2bEVNbGZhUlM0OXhZY0JBK2txeHB2MnZ2WUc1VkpXMXFa?=
 =?utf-8?B?NlRXYy90ZTJiQ0lkbTdQaS9HL1RKaXozeVJpTkNIdHU4Y3FBTTU0bDlmNXdk?=
 =?utf-8?B?c3NIL1NZdS9Ya1dyTStTTUtnbVo1N0RDQnFhUEhsOHlvbXdpTERkbUFUQ0NL?=
 =?utf-8?B?Z3FnLzlQRmZHRVpWdllXd2Z4dmtvK1lZWFBzL2hjRlNlUEs3T2ZsVXBXSUht?=
 =?utf-8?B?OUQ0Z1RjcFNFNU44eFAzbi9DZmJWOWk3M2RaNUVVNC9SMjZENFJsN2Iwa1p0?=
 =?utf-8?B?TzdjWGg5cmFBMXFGaEpUVW9vYVpsQ0IvUDF0T2UxcXBpc1dQNGdXODhSZStz?=
 =?utf-8?B?TyszUktvbGphcDFER01pcnFuZmZuYkJORGxvRmxMeFNjT1FQWm0xaDB6VXJF?=
 =?utf-8?B?c1B2NWhoTVpBOTYremc4TTNpaDVXZGRGQ1JhL2lhZnRpY0p5aG56dFZ6bWJM?=
 =?utf-8?B?VlJ5WFFtMVA2MkZDalBMaUdmME41MHhiVmJvNytYTlIrTld5cVE3LzBWZnRH?=
 =?utf-8?B?QjRCNDBFODRzQjdMTTB6a3ZrUEM5Ykxhc3RkV2ZCS2VxNThNcjlSaURkcy9n?=
 =?utf-8?B?aXFXNUhzeWVVK0hkVGRiWDdsT3hLY2JSeXJUbFRmR0xqVW9ub2xMa2dhOTVN?=
 =?utf-8?B?akJyciszYTdDN1VMaFFFeHZySTl1NWI4ZjgzdVBhVUJreDhwN00vRkUrNlZS?=
 =?utf-8?B?VldPWU82VGlVcXd0d3dCNDBscHlVRjlOSkRQTitqZnduY255STZudFJ0QWVC?=
 =?utf-8?B?Q1c4UG1xRWJ1RkczU0RidStpQS95elBwNHhPdlM2eVl2dUIweXhuZTdKSk1y?=
 =?utf-8?B?RkExaVBsb2JNZ21rZDVuNnEyNjYvcEd1aGZZRTR6OTFIV1B6Y1BmdVpTb3NE?=
 =?utf-8?B?RnFocGhRUVYxQW9rdWkrNUVVVXExWmRaeWVnVkgvODk0S09Sa1FlclZQZTBQ?=
 =?utf-8?B?ZzJhRjZaZXdpT2NieFJpblh2S1d2T0ZXVy9JaWg5VksvRnArZG9KYjJiK1Rl?=
 =?utf-8?B?Qy92d2NDYzFoMk1jclV6eW1jVE5mR3llR3FPTThONlJaZnNNVjFUaFBBbkoz?=
 =?utf-8?B?cThiN0ZaZ0R6aWRFVFVCOUVQTlBvemhRaGdiOUJ6ckpSTEVJQlVCeVVvbTQ1?=
 =?utf-8?B?aENTcy9tMjlDOUNFS1o3Nk1vd2loRS9XS1dGd0RjMGJoTS9zV0pUS09WbFdZ?=
 =?utf-8?B?OE9iRnZSbXcwcGRBSnNua1BnSElVVHQ5clEwYko1OU1tNGE3RDlXTXIzZFdI?=
 =?utf-8?B?eDVpK0V1VHg0bEpMbFVRdGFyY1pLamFhZ0lLaTV3Z2xFdFBKcmRqM0J0cjV2?=
 =?utf-8?B?bkNnYTBnSzJUTXhoUW0vNVk0TENWZUtYeDY5bzlPNUMvUzRRNEQya0lFUy9a?=
 =?utf-8?B?T2dmWU9US2RyeW5vNEpjczlYQlY1V29XSFVyaFZUVEYzOGxUMFZCQ3NXOThH?=
 =?utf-8?B?Vm5QUFhRKzFHYTZXZHhkcXJJMFZsY2F5L1BYdzR0SEJmVVd1NXRoUjhtVjlS?=
 =?utf-8?B?NmV6a3Myamg1c2tTMEMzcmd6ekFzOFFOK3U1SGxDQzZLS0E4aTFWUjk4OVFW?=
 =?utf-8?B?Y1p5MXpLTXhoR0pzdjduTXNISml6QTN1RlBRVCtwRTJxdnBUM1BsWWFxOURw?=
 =?utf-8?B?NVZCZDlZc0tJcWNtMTNvdURVYTJMNW9LUnc0aStsWmI3YXNWV3M1ZlpxbVp1?=
 =?utf-8?B?SHZXL1Z3WUR2RlJHUU9OOVpCUzJpMzdiS0pVbXo2Wk5pSlN5Q0cxa0NYUWxP?=
 =?utf-8?B?cFo5Z2xWU3JqUGxDbDFuNHFNejkwSzByTFJGOTlDeGltbkovR3Mxd2ppQ3ZI?=
 =?utf-8?B?TG1WbjBVbHNYbGZ4VUhFL2Z1Y3FJK3dNUnRXa0ZZdFNObVlvV2IyZmh3R0RP?=
 =?utf-8?B?RjZjNjVoblI3dzM1NHRVOE9PNmpnNWVOQTNZZU1seG92MStWNDIwQkFIdnBs?=
 =?utf-8?B?Q1FUZUNJY1dNK2VNckJJV3BHMmQ3cUxmNCtnYzBIODducEJGdkZXNkNRRXlp?=
 =?utf-8?B?blNqKzEreVhPRXh2cysrcG8vd1g3NXpCS0NmUjdxWDUrZzA2NDhUTmxOTWkx?=
 =?utf-8?B?a0hPbWJwV1pxbEJhbGk3WFBSL3NWMlFQLzlnbjFBU0tsa0V2cnJ6RCtPenBH?=
 =?utf-8?B?L1NLeHdXZ2ZidS9MY1dPYmhtVE0vREJCbU4xVFdRLzFhbUFMTG1uYTN3QUxF?=
 =?utf-8?Q?Fy837T7plnHRkM5xy4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb16342f-8291-4606-ada7-08de7310579e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 19:18:36.3416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rM5KgmMl0U2nz8KSYQvY8X0SSqcabbltf5oR8x2vHKHUuLWCDMYIG0oUUvbOVpH9FB35Rok86xuMkg2om6Cm5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7054


On Sun, 18 Jan 2026 11:27:57 -0500, Frank Li wrote:
> Some misc update for imx8m* dts
>
>

Applied, thanks!

[1/9] arm64: dts: imx8mm-evk: replace space with tab
      commit: a3959de80f55d46b9a4001622b1e328dd218e051
[2/9] arm64: dts: imx8mm-evk: correct the spdif compatible string
      (no commit info)
[3/9] arm64: dts: imx8mm-evk: add uart1 and bluetooth node
      (no commit info)
[5/9] arm64: dts: imx8mm-evk: add uart3 port
      (no commit info)
[6/9] arm64: dts: imx8mn-evk: add bluetooth dts node
      (no commit info)
[8/9] arm64: dts: imx8mp-evk: replace space with tab
      (no commit info)
[9/9] arm64: dts: imx8mp-evk: add bluetooth dts node
      (no commit info)

Note: Not sure why b4 can't detect correct commit for "no commit info").

Best regards,
--
Frank Li <Frank.Li@nxp.com>
