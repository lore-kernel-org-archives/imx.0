Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2072.outbound.protection.outlook.com [40.107.104.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAE42153CE
	for <imx@lists.linux.dev>; Fri, 20 Dec 2024 15:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734709112; cv=fail; b=MyebAtnhXUFiiIE0ShKAx8lKic+KaCP/A96/tUIERnUgderBQ+BSsDIGYcp81+yxMKALXn400UtV89JjvKsbYDQ2opT0M0O1z8/rkEilSqwzxCkG3HP/fc+9V3CT+F3HOn0meyJZjMp83T1l9gZPnyA80n1o+a6GwXY6U60dY1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734709112; c=relaxed/simple;
	bh=7vcifnHc7kXCj60Z4fTgHmS+IRUx6o0lYsFhxZbkYBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o9jf5HSSNTXyib9e+Gu6HRBAlTy/lVlDDHcae0FeqfSQyWX4OxltJhVuUjkPbSnpfYoQaypUoLSiSJk0Iol6QS8HdNDmCkCPP5KcUjqJkHtb5frZNmKTSLb2sr0gPewbx95PCIdyqA1sXHEbWTsjPdmHjC5XvYdyNB+jR9la9pY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WhymWPro; arc=fail smtp.client-ip=40.107.104.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WhymWPro"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOysfsF5oSArbrB7Jf9TERU0GikyccEgeBM+lO1VcwY2d4QioGp8Z1/+2cd+RShm6OJt7GZoqeVlkJUtH61JinUAxh/9SW749pE4IHe9dKh295kR5EZCoe+FUQlP3qi8Y9C9ni6ed+ZGj5CKkhMjncleCNZgZoYWpGhzaBeqwhemCNOUFsDVNTM+JG4YMM3GOM4NKEPpW12FyFcpshXVWYw6GAuNgbaoAfHHGhdERYAfHP06nltcJq5cvfKLY64EQPm922/SXLnLNRBSxu8TW5gG0a0dfIKQPRE2PVp8cc9uNJpeDcJgddNSpZ78UYuwAgdO/M7Xan6UKItRMsuwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teklqvAk8idAZ4NW9PoWBYpRXpOOpd2aTsvoEHNqKNI=;
 b=E3jljc3pMVQOmC4xKT4kUCV4PJYF7e0ZMX2jCpkbhxSGEj8wmE1vqjIKjmkBzEE6t6G7O9FWt0XVH6OmaX7oAmHDLNhJ0bh1/jJbqvhTbmZR3GB5Vnn3Eus1McYmjUOey1/1vAB0BauKE0N/dnTXXw0NDeOQveqNnkMBoMJp/whe/k1sHb2OGVEWWP5/uRBZxqKNrY0IEG4fNNP07voFnrfAm/O4nVIG+bo6mDjLnwytqkybsnITqhN+tRPH7GjE6h5WMnkJblDR4kyqJ7MzkDldb5gf9C65uYbeOdg7QyxLnhXUtizmJit3Y7dSh6XxS3EOIfzqCCas++EGnxIVgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teklqvAk8idAZ4NW9PoWBYpRXpOOpd2aTsvoEHNqKNI=;
 b=WhymWPro0dMc8POeWIRYKfSjrXi0WvZmoAjcSn4HO9K9Td2bRoI1cf3lquANkpu8oGZtUAASEnABEn+xKmbTUwEjzWDnCkyquGddIff7UIsLynAXxV2LJi5AzZmsdjbFMP91ptiyKF4Smeg4toV2XJDcfxmrBuvTcuZrQjHfzvM5P5RDVqvjaS9oQGNL4CEb3VgG5U9GSSPVJnSs+ojn5sd0SYzPhX7cdxjmec99PrUvliHZEjUn8G+JzVXWnUQX7nSqkPxSTokItZ6Sv5HyMVqwb9XJQ+MJFbS/Hv2GKL1wez15zviU0lT7czC4Js54zVw4jNbiaOrUB6bzNSXPYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8196.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 15:38:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 15:38:26 +0000
Date: Fri, 20 Dec 2024 10:38:20 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/10] arm64: dts: imx8mp-skov: increase I2C clock
 frequency for RTC
Message-ID: <Z2WPbB9cV0hcP2UB@lizhi-Precision-Tower-5810>
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-10-38bf80dc22df@pengutronix.de>
 <Z2RcJCaYC2FW3Ks6@lizhi-Precision-Tower-5810>
 <30dbe486-7e36-426d-8fa4-3ecd83193a10@pengutronix.de>
 <Z2Rw8qnn9hULyh8l@lizhi-Precision-Tower-5810>
 <2ae085fa-6f13-4eb7-88c1-e625309fc35e@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ae085fa-6f13-4eb7-88c1-e625309fc35e@pengutronix.de>
X-ClientProxiedBy: SA1P222CA0191.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bbf4ec3-fe8f-485d-84d7-08dd210c58a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mk95RjJNZGlpR0RtbDNRNWJWeENkKzdhYk5TSmhiWHFuWXJUYmlRT1Z1TEJG?=
 =?utf-8?B?NUJNakhyc2pTaW0yQWZNZTV1eHFjN3BCdTZHcjIrbzZJYytGdHhvWlY4bllC?=
 =?utf-8?B?bTFRZDRWVFU0b0dPU3NGRWJNUU1EZ0pmTXhra1hZSWlXc0FNRmlZMnpEUnBk?=
 =?utf-8?B?L3VFL00rQityQndFd2RybVJpVm5CT1dtR0RkZmt5MHp3OStSS0orTDdvcjlN?=
 =?utf-8?B?RGo3eDFjaDEyelJOL0VNc21RYkhsb0dYKzEyUVJxZ2ZBRE9WaFE0aFJuM2hQ?=
 =?utf-8?B?VHloVmpUMGVncDVoVmIyYm5FWWxqWEJucmJWRG1wZXNsR0VBOWpLZmpMcDlQ?=
 =?utf-8?B?WVB6d0hodk8wSGtNOG1wWkJxVFZ6RUpMK3NsS29MSGJONVR3UnNQTGNBazhJ?=
 =?utf-8?B?UVpScVQ3bHdNWDd1U2ZlaWRmdzRXWks3TUZQWnRMK00zck9sSDhhMWhsMXNj?=
 =?utf-8?B?UDkwSUtJUnkvNjY5UjNmc0pIUkJzUXZMdzdWRDZnQWs5U245cEpjcWxBb0hU?=
 =?utf-8?B?VU9LQ04yYjg5bHUvbnptUjNrTGIxVGFNeWd0STFkMTUyRzYxQjlyRnU3ODhD?=
 =?utf-8?B?V2xnTDBxSVEvTGRTQzRTUXNPb0R2ZE9OM0JlWXc3aC8zWFIrWW5QWFlLWTIy?=
 =?utf-8?B?cGhDRlF5SjY4NkphNHExQXlHa3kxenFkVGpzR3BrNk5PYmpqN0tEN1kvUm5x?=
 =?utf-8?B?UHJMV1ZaWlZlLzhJME1MRnRiaFNxdUlnMWsxME55bmw4R1VGelFlNnRyMWpv?=
 =?utf-8?B?K0JIS1lCVHlHVTdzK3picU1vTTJNRVR3WlpBL2ZhTHd3dEhSZHhzaEUrVUo3?=
 =?utf-8?B?SnVzeFpjcWFsZWcyV2x1VzIxclM5NzdjYVozLzZRdE11MTFZNFY3a21XWG9y?=
 =?utf-8?B?K0pRUzdwaFJFYjR5eDkvSXlnRE9PaXQ4bXlaRFphSElEZzc3VUxOcXZXMDJP?=
 =?utf-8?B?V2dLSW9vYkxnMlV5RzFqb3JsWFpxWVArR0hmcEszNTRkcmhRdkw4bHdzM3ZD?=
 =?utf-8?B?aXM3elZhS2hySzdmY3ViaWYxS20yUHZ0anlGRU1zOHJPbE5zdVRpUW1UenBa?=
 =?utf-8?B?a1BqT3A0UXZKS0tEVVMzYUxQOXJSNk41dFllQmVaVld5c0k0QXBmWitqN2h1?=
 =?utf-8?B?YkN5MUhPeXFVV3VJSllieWc1NFlodnhOZDMyaEUxWXpwQVZEQm5DOVlNU09i?=
 =?utf-8?B?cWJTNUx6R29vS2FPRDJpZ3gwK1VheXowblNSbm9jQ3Q4M25LMmFFNkkrVklB?=
 =?utf-8?B?UHQ2VnU0YkpsaU1iQTIzZXVtc2JDa0h4VjRSSVM4N2ZGT1gzbWFVNWU2SlZh?=
 =?utf-8?B?bUhGQ1UrZU1ERTAyc0s3bGFITVNEV3lFdUF1M0xvSGRwcmZ0aFE1c216QXRl?=
 =?utf-8?B?alR6NWVvOEZUU3laQXpmVm00OHZmZGlQNW1ld1pCRUNBc0gvT1BJMmxNNjhG?=
 =?utf-8?B?WW5iMWxGbFBXRlRiSGNZV0J5c0tSSVRsNnhhckxSQkdDUlVlQkxCQUV0YTQy?=
 =?utf-8?B?aEd4N3NITlZoMndZejNBNW15QllDMzJHb01mZHNsRU9EY3Q0WHduMVVGbzBY?=
 =?utf-8?B?Mm5MRmUvRUVwMk1WaU1yTnRIVVJDblI0dC85c05ncmdOVVNtb2FBckVOSWs0?=
 =?utf-8?B?TGRjc08yb0ViWElWdzlRbUdUdW9UMnViaHN0bVJOYW9ta3VCRS9wd3lya01K?=
 =?utf-8?B?WXJnNFFTTW5tRzY4cnErK0JwbzFrYVhIY244dkxOQWk3UEFnSVBTV21iQmk5?=
 =?utf-8?B?R0pLYVo4ZjFCWkk5L3dna2l3eFoxYktTWHZpNWJKQjhYYmp6RUJwRTVSQWtq?=
 =?utf-8?B?aWp1ZnlLNmhFVFNWcDl0SEVqelhhMVQxR216WE8ycUVFTGhSWVppeXhZREFI?=
 =?utf-8?Q?Vauov5FMIDwip?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkFiU3Y5UzBMbTVBWlVVQVY1R28yTTU5RDF1dnZNYzB3MHFHLzlwbW1hOGZs?=
 =?utf-8?B?dXErTXJkOTZkM2JWdVUwZEgwMlgvT2NsSnRJN3F0UmdvWFFDMTJjVWIzYnhq?=
 =?utf-8?B?QnAwNTFraE5tTC9ab0VSMFJzeEt5dk1SdjJoY2FWRWd1aHl2b01rUjJYYzFC?=
 =?utf-8?B?VXQ0U09BazU4V0N0bmpQRTNEK1JKWDl6cUx1VGFJaFQ0UFk5Mm1yS3lPWVRq?=
 =?utf-8?B?UFRGTEdXTEJIZHhHdlhJTEIvTFh1dmh5ZE5QenU1WkMwdEJCZzVZcDZtQnlh?=
 =?utf-8?B?dWlsb24veVk0bEwrajVvSFlIdWtLcW1CbC91VHRtdGhwUVRicFExZngvcHAv?=
 =?utf-8?B?dkRMbW5VbEl1Zzd3QzlOdzR4c2EvUGJrTTBiUkZ2OWhzUUZ1djN3ZzJaazgy?=
 =?utf-8?B?TFZGaDFDTG9DajRqd0dSYjFYN2laN25xRW91RDFJMjZoU1E0Q2hqTnMrU3Vx?=
 =?utf-8?B?U1AxMTJzV1BvUUlqcVdZOTJNbys4dXRLWGZqakw5SGthMkl0OXRsa28zUitq?=
 =?utf-8?B?emFmTndqNUxHTXpBM09INER1WUxvVklxdDh4VWRmS1VzNUlkd1dZSTRiQ1VH?=
 =?utf-8?B?OVorWFV4aE5hdW52VkNCSmIvcjFXNHlqZzZVc3Fsa3RVbE5lYWozOVJLQ1RO?=
 =?utf-8?B?SWxrMGh6T0ptMUczQUtPbzRNNTlpYU1aMkZuM1kwQVZHWEFnemthajQ4SWVp?=
 =?utf-8?B?aDR0ZFZvM3kySnFwSWJXd1M5WXY1RTI3bklRZHBmMlAzVFJOQitWQTJJcUtk?=
 =?utf-8?B?ejV4Q1p6VEU3dVdpS0tkN0V4cVFzUjU4YTBOVC95L0IwcXYybk1haWxNTFYy?=
 =?utf-8?B?UTJRQTd6YklXWTcyZURxZEVYK2VGOFBNY0hlbDFaQTgwMzN4TVRHOFAwbDBX?=
 =?utf-8?B?ZnI4VHl0UjFQTXRJdnpCSHY0bTE3S2NienFtVjZMYk5lUFNqaitRTURFbnYw?=
 =?utf-8?B?OUVZaE5xU0F2OVdlZGhabkxWZ2dqOGJGd3FpMmlsRXdzVk1tZmUzRC9SWk1w?=
 =?utf-8?B?YlZBQm5FNXdmeFJBa3JDOTZpb0QxZU1hdzAvbWxGTlcrZTZiWFFEcUZhNFho?=
 =?utf-8?B?Vmtha3dPUXNveEVYWWkyaS9TNFo5L1JUV2NWMkZxb2pqMFI5NlZ1WUpHd2FV?=
 =?utf-8?B?a2FzZmtPcTVHeEt0Q3QwbEpuMjUzMldMb2FPb3FmRFQ0MUgra2NaaURSVUZq?=
 =?utf-8?B?d2dqN1NZbDV3RTN1NGxEbXRuWWdHZGt1WnB0NjcwVjRXSDEwZWVhV2FJYXo5?=
 =?utf-8?B?NE1wczZDWVJ6ZndUdHdiZkVvSUltdEVkblY3QW13eDBuZkZTRDUxdmhmUHEz?=
 =?utf-8?B?WlQ1M1EyNW0xNHk0alZRWTFmTmZPWUYwZnkvUXVTY1pHZWlYRi9sZWpjUUly?=
 =?utf-8?B?WitqMnMzSDBqZmg5elFYMVdiMzVZWit6K0cxc1VabjNwZ21ORGl2TmszNXIv?=
 =?utf-8?B?ZnRuUzFLZklWU2g4VHZha29vN0tRRUs5dmU4UlRnUlYvbDE3N21va2lIaEY5?=
 =?utf-8?B?SnY2VTFSdk9Kc2RBZGROOEdkc0xXK0ZFUWVXSzdpcU01OVR6SDJTVUxuejRG?=
 =?utf-8?B?OWU4eW94MjArN2FOdU9aQlQrSDNTRkpDeGxjLy9oYmdaYURUaWx5WHRQQmt5?=
 =?utf-8?B?bUJwUGR1Wm83dHlxWmI4VFF0eWJIN1VwbHRoeUpZNFovYmVqRDk5NytETjBM?=
 =?utf-8?B?UE9KUjNkc3NnRmVkSU1jUmdZZEc4WDBTczVSdTZXdGhkZ1JYVEtRNUUzUjY1?=
 =?utf-8?B?cEpLeURVbS9IOXA3NGF5WVg2TFowNFJ6VW1TaTRmZEF6bndBcHBsSm5XTDl4?=
 =?utf-8?B?NWQyWTZkUE9IcUxkV0liODdFZExwQzU5ejdncTE5aUhzUWlCems4UGwraUhi?=
 =?utf-8?B?VjFscU9zb1BKclI4L3hRS0xLV1JSbm0zZGQrb0NObFFmcFJMekJzaGxLTlJm?=
 =?utf-8?B?STVEM0xMVmY1OW1rMmdib3p6b3lrd3djLzFXVi9mbkxraVhzaTZCd1krM291?=
 =?utf-8?B?Ly8vMWxTOFFuY3IrckNkellHSWpPa0dNWTcwOGNQVU1pZWFlL2NIV0pUY29j?=
 =?utf-8?B?T05QUkRSUG9DbTQ3bG5kZVZ1YU1IblZpaVp6eXhwRlhQaTNEZHgzZkwrNkFt?=
 =?utf-8?Q?JZU8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bbf4ec3-fe8f-485d-84d7-08dd210c58a1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 15:38:26.7871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +VCvOJThEXquN23zZPJwu6yQqHn7xLqWAlb37civ9Qrkg4V78zg/+ZvtXa5Frq9T5R5xr7tIESLin7KlsXpUyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8196

On Fri, Dec 20, 2024 at 10:12:49AM +0100, Ahmad Fatoum wrote:
> Hello Frank,
>
> On 19.12.24 20:16, Frank Li wrote:
> > On Thu, Dec 19, 2024 at 06:51:35PM +0100, Ahmad Fatoum wrote:
> >> On 19.12.24 18:47, Frank Li wrote:
> >>> On Thu, Dec 19, 2024 at 08:25:34AM +0100, Ahmad Fatoum wrote:
> >>>> From: Oleksij Rempel <o.rempel@pengutronix.de>
> >>>>
> >>>> The NXP PCF85063TP RTC we use is capable of up to 400 kHz of SCL clock
> >>>> frequency, so let's make use of this instead of the 100 kHz bus frequency
> >>>> we are currently using.
> >>>
> >>> Increase I2C frequency to 400khz from 100kHz because NXP PCF85063TP RTC
> >>> support it.
> >>
> >> Unlike your other suggestions, these is no information lost by rewriting
> >> the commit message as you suggest. I don't mind, but must admit it feels
> >> like bikeshedding. What is your concrete objection to my commit message?
> >
> > According to
> > https://docs.kernel.org/process/submitting-patches.html
> >
> > Describe your changes in imperative mood, e.g. “make xyzzy do frotz”
> > instead of “[This patch] makes xyzzy do frotz” or
> > “[I] changed xyzzy to do frotz”, as if you are giving orders to the
> > codebase to change its behaviour.
>
> I have to disagree with your interpretation. The imperative mood is primarily
> expected for commit message titles, but if you take a look at normal commit
> message _bodies_ that make it into the kernel, you'll find that a whole lot
> of them start off like I do: Describe the situation and then what's done about
> it.

I was got many similar feedback from difference maintainer to be required
change my commit message _bodies_ in past years.

https://lore.kernel.org/imx/3c9fe85a-5f86-4df6-92fb-e4ceb033f161@kernel.org/
https://lore.kernel.org/imx/117dd6f3-8829-4000-a05b-6cb421ca7de6@kernel.org/
https://lore.kernel.org/linux-pci/20240807025423.GF3412@thinkpad/
https://lore.kernel.org/linux-pci/YnvyrSTAxJmGxful@lpieralisi/

At beginning, I can't understand this. But after follow these expertor
suggestion, I found some beanfit.
- sentense will be shorter and easy to capture most important part. for
example:

  "The NXP PCF85063TP RTC we use is capable of up to 400 kHz of SCL clock
  frequency, so let's make use of this instead of the 100 kHz bus frequency
  we are currently using."

  34 words

  "Increase I2C frequency to 400khz from 100kHz because NXP PCF85063TP RTC
   support it"

  13 words

  Linux is big community, even reduce 1 minutes to read it, multi by
totall reviewer/reader will be very big numbers.

- empahse the important change first to help understand whole patch
quickly.

You can choose what you want if maintainer don't reject it. Generally I
just send such kind comments for v1 patch, because it is less possible to
be accepted by by maintainer to accept (except some critial fixes).

>
> I personally find that this is often easier to follow than just having two
> imperatives back-to-back.

Basic principle is clear, simple, and straightforward.

Frank

>
> I have just Cc'd you on an RFC patch to amend the documentation you linked
> to reflect this. I am happy to continue the discussion over there:
>
> https://lore.kernel.org/workflows/20241220-submitting-patches-imperative-v1-0-ee874c1859b3@pengutronix.de/T/#t
>
> Thanks,
> Ahmad
>
> >
> > Generally, avoid use
> >
> > "this patch ..."
> > "let's ...."
> > "we do ... for ... "
> >
> > Just simple said
> >
> > Do ... to ...
> > Do ... because ...
> >
> > Frank
> >
> >>
> >> Thanks,
> >> Ahmad
> >>
> >>
> >>>
> >>> Frank
> >>>
> >>>>
> >>>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> >>>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> >>>> ---
> >>>>  arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 2 +-
> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> >>>> index a683f46fcbab..ec7857db7bf0 100644
> >>>> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> >>>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> >>>> @@ -333,7 +333,7 @@ reg_nvcc_sd2: LDO5 {
> >>>>  };
> >>>>
> >>>>  &i2c3 {
> >>>> -	clock-frequency = <100000>;
> >>>> +	clock-frequency = <400000>;
> >>>>  	pinctrl-names = "default";
> >>>>  	pinctrl-0 = <&pinctrl_i2c3>;
> >>>>  	status = "okay";
> >>>>
> >>>> --
> >>>> 2.39.5
> >>>>
> >>>
> >>
> >>
> >> --
> >> Pengutronix e.K.                           |                             |
> >> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> >> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> >> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> >
>
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
