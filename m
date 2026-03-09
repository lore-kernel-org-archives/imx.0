Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011000.outbound.protection.outlook.com [52.101.65.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422C73D646C
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067808; cv=fail; b=KUqfNnHZvJyIY1/InxD5G9AmwGehYeiqLr6W62oS3z7PqWoyhUqncGyYF41YX0kgki9XrojwPFV+OEbeh6EfKdUwW6PWmWEaJ9E31dTGm8ntCTprx+H0XFdLw2iSwz1jqZzw27cGq67Cdct9q97e8xXwGHRn8hp+XbtFsbHpexg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067808; c=relaxed/simple;
	bh=9jSbNJPXstIpi/vBNPdf2IoPB7XmE59a4w78omGdqTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qLKWWMTdrB6HBN6axlW0BeoWBNrbS3qlzZEehiTF/hyJKYNsY5H0EXDilDlJbOAPpBbR1rtcBgz7C07mwWeLQXtS13nzFkudjLhf0PrcWZiyLAO497eB/isBE7lMz0HUvZ9TdP8V8tbtdh7DXykqS4jJsbElBWKP6/HNi+raM98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=P9oiIogX; arc=fail smtp.client-ip=52.101.65.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="P9oiIogX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPyOX1PSq7C6Qg11kmP0T2vRQadYPqtKvrDHRrAas5rSUZiMPzvrSnzeenLGIc6LcwR4vhMS+bge5vyqiSz7F7DoYXuM+exhxNs1XxMrql8aibbriamgwXV79X0FAyPUvKTDoq58CeDHveu7R6yeXVeAl4d6Uua4Dq8rPliSne1O/zdApHYRmMIy8yEBp7am13RIVoT/XoJJBQnaldVLqeDzPBRCXifbyBBcq351m/KTSiJr1Yp20brUkinf/5RLLN/nYcdbYkmsrJLIW+lL6QXuBIKYfIG/rYnXEDF5PtJ58Hn8+4Pz2UVQry7dVbxAeUl0Wbw84cx6CeaZKFzkEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2TLoFWv8BY+7A2YLPRtDsKrLz3J10IhJwGMYNqIO8k=;
 b=kJXSlHzh1/fVmBEbXDopG/FkdQOdTNKu/ZVTC/y24ZDGnd0ooXdrt+fIR6oaWXPFHdMejHjAH9gnTfRM9gWq6rq5Ykz+Mn5/BoTXWOvTTFF9eR/xipmXGzLvNmqM0s8PyOfHcRRAuxz6ngKNdnTsFxasQPbqanZY3Zui1liZ0vgYL23VTEuqCnkJ/c5hOmBeWQ1YTVuuBFc2TMGqC6hIzbHKeB1ZYbXkmhv4RLRFsFtpO74nRGkYju91Fg8mlX/b/44kOtgy4gk7RounCAgM3LIN+lPYNRUvu8k+COrkWyJXL4Puix4ciwsJiw6kpK6yof6Tg/NjuDuxJ9+jUyd+eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2TLoFWv8BY+7A2YLPRtDsKrLz3J10IhJwGMYNqIO8k=;
 b=P9oiIogXg5WwDXvbS3BQ7Lr3uC91LAe9TLBSEp54ttb8Y+quWLs9T1xtwrvG2Tb8q1lMoSmJL1MJMq3ZOw0s89iXLcs89VnV4Cda+Bm7616djlziffFlDyAVD+JUW6XfonzpnuOTopTOnnxfLqfpcUIZVPQLB42GUBhUGQbvAPwDjWek7qezFy3RYYPEXwKDFZfq18lhxUV6MqpvTXBCeeQPy5pBef6tb2o35+3hTSL5BFMjUYv8+1ABSzxebhNkMD2gIahRMgbf/8UEse1XFLSi84+5NARxDFXPPVpLBeT9JRwwKCCim4jghGW2XZpqeajXcKv/mPKwx/v8ZfDtew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB11447.eurprd04.prod.outlook.com (2603:10a6:150:29f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Mon, 9 Mar
 2026 14:49:57 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Mon, 9 Mar 2026
 14:49:57 +0000
Date: Mon, 9 Mar 2026 10:49:50 -0400
From: Frank Li <Frank.li@nxp.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: max.krummenacher@gmx.de,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "ARM: dts: imx: move nand related property under
 nand@0"
Message-ID: <aa7eDrTocupx-tAB@lizhi-Precision-Tower-5810>
References: <aZcz1vRg4KtAKUd_@lizhi-Precision-Tower-5810>
 <aZdDF6BObEu_C4KJ@toolbox>
 <aZdnhv2QC1szMCVl@lizhi-Precision-Tower-5810>
 <aZ80BWH6DRu8_W_S@toolbox>
 <aZ82pG3PO1HxD18B@lizhi-Precision-Tower-5810>
 <aaBA65_zLu8S6WMS@toolbox>
 <aaBi9lipWTG5l0hs@lizhi-Precision-Tower-5810>
 <bd0bd330d140f9d9d222c72c3797f79d08fcae1d.camel@active.ch>
 <aaWxiERQ4u6IhO7Q@lizhi-Precision-Tower-5810>
 <aa6j55-WbdkGKaU3@toolbox>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa6j55-WbdkGKaU3@toolbox>
X-ClientProxiedBy: SA1P222CA0035.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB11447:EE_
X-MS-Office365-Filtering-Correlation-Id: ce8591d3-b580-4c18-269a-08de7deb21e9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|52116014|7416014|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 C/tEDAMBySAY6urNyKMTHNenxM+3GJrd9NdPYKJOnABsLWe+53ws06Le1zxBWHJSie1a+PZMGGeszNEISoUNaBL2GO8KgiPMZ/TsMBEHyEVhLC7qAF1evFRH59NfNDCaR+zOLuCjcVUJbAmzUVKxpCu8GS+z+0q0Y+Koc5Y1S91mgcfAEaZYQ2uXo9Sgr4iZjDiXfTQDYrLdPiQ3NNwaYHHdLt091ZY90vCHvpWsOggcuioYQh0dQZVzV9bvcTdd4YWZEiecOGzWESy3aGJ+RCu/i6ER04bFq8AJf2hxCmZKWBxgf7eQFHBsJDriXqlnB9NxBdPgx2H4oejyxvdaAnxV8R5wjITZCto0to/pt0jryzpGbl8VfGKSx2DPKIMf/oFX7Junub5/NjmqB2bqGRE4vivTh7fB9ae/1+eBsa3kqcwPxv8bffYW50RAbaETHau8fuTPdMJFZaUfdGXvb7JkFtrWGTMNkfwbA9QuOXTDlLlKZDDmzfRgucl+mzEuqWXPZHhse+bc7Rd2hR96qQKejS34Cl4GkMYJMyg+E2+yyxgeFSY3hKNRPvCEZ4Pwpy5EHCpHoUSscVqJaRlCa6C9sPVgyL3TFTmRt6oseYb48IlX8nOmY//D3M59DR3Of5UsFtrENRxDJK7FRLb6t/yMtHZWylsoZZNlUgGotvtimktj4faiGei+kUJth+60CyMsUSRwsCjX4rZAgbRKG8wSJtYSNVK/29ii7SS14Xve/g9bhrkj7o5SO2XFflLzeho5ceBK1OBoqmbqCKMsAtelkOXxxMPUzKZPtfBOFMA=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Y2RuanVHKzBUTGJXQWMxY0p6Y1Q4SENEZTFXdFdKckVUTDlQMFloU0NRSzhW?=
 =?utf-8?B?LzYwMXk5d1NoZHpNUE95c1ptci9HMk9IQjJVa2h1MW8zV0hUZDR4cElvVU94?=
 =?utf-8?B?UGJIK2hmNzI3eFltMWx0ZGx1MDYwdUt2TlhNRkVqbkZhQnRYSlpZRWxma3dD?=
 =?utf-8?B?Q2VIejdLMjFoRmk2RFJyZ2RwamlNallyMk90S0JTOUxVZXltaFFPUFJyNGQx?=
 =?utf-8?B?Z2pZYnR4VXZwTEQvUGU0c2RRK3lqT0I0UXI5ODE1QVY3YWNXcFBkMnFhNVVt?=
 =?utf-8?B?Nm0xUEFGclk2TXBHSk1GMlk2ODA0amIrcnVmMm1GNmhVcFZFaGxRdHNnZ3Vm?=
 =?utf-8?B?RWlJMkN5ODVEZmxqQ05uY2I1VStWdDlGYlM2NUtmTUZuSy9MM04xZCtKR1hC?=
 =?utf-8?B?YXJwU1RSZENjTUtTT1lKYlc0OE1jUHY5TDh5ZnUzbyt4Z2ZXTkRzQldCZGc1?=
 =?utf-8?B?U2FKWFd6YkNvN05ZUHcyNis0enVMWWdjdTNMMS95NXBsSFFxQzVJWmlZS2hn?=
 =?utf-8?B?MkZzS29QVDNwRVBsaU1FbmRHaE1NVGhXd3doQkFLU09ReXFjT0llQlZkTjNW?=
 =?utf-8?B?WGlISHArVWVsWTg3YjZGRDZoNVZHTVZweDJmdHBOMmYzQndZTkJkc1U2TDRj?=
 =?utf-8?B?eWZBbkJHdEFMc1hET3JqTEN5d0owSDkwbGltUkVPNmY1eFFtTzdIYnNBVC9L?=
 =?utf-8?B?WEVRb3N3MmdyZkpWQnBROHArTmZKd2NQZGRuY25TUG9RVkloVzZodWNPV1Q3?=
 =?utf-8?B?Z3I2K2hjYkJzc2FaS3pWNWwrQ2s5bUhxdk9pajYwY0M2aSt4aXg1a3FvSmZh?=
 =?utf-8?B?am1VY0o1MEFqMW5RM3N5OXJaSEY0THRqZ0thb2lKbU9qTGpIOC9zWnFmQkIy?=
 =?utf-8?B?ZHdpV0VYaldrbCsxaGlyVysvSGV1UjY2ZVYrVit3cGhOR3BhbGI2UVZDdjky?=
 =?utf-8?B?bm1qdkNOVzVhaTNPOXJnTDkxZ2VqNis3WUExQWVEcjlsZjUvQXBhR3BXZkY3?=
 =?utf-8?B?VUVhbzltTUEvNjhydVZqV2h3QmZhQ2hJUmR3UTBUazN2SWtYNldRTW1BU3ZQ?=
 =?utf-8?B?bkhUY3NwZGxtb3MzZ2ZjdndlMnJ1UFJxM0FHTjViNlZFRkJiVkdEWkRlTkJ4?=
 =?utf-8?B?QmJOeElPUGkvdi9NTVU1UTY3bDVzdy9uWEpiY0Rya21BeFY1RWZjR1ZoVHZE?=
 =?utf-8?B?NHR4cFlHSEladFYrSmd5WGdxbTdrZnBSYlB2R085c0xHUWM4cUh2NkFFSUNz?=
 =?utf-8?B?c0cwV1Q1TmpIa0p6NnFkZWNkWmJvSVNpTEdST0t4cTJ4MU9lTDZFODJuYXVl?=
 =?utf-8?B?bE1sZXVQdHJYSzBnYzcvS2JZb29zUFF2SkZCMnlvR1FZOWhXOFF3MyszQUdG?=
 =?utf-8?B?dEV1T244SjdwUDcvdk1TNExjcXFpb2UxSUtrcVdWQ1FHdlI0MG5RQXhRbC9n?=
 =?utf-8?B?cFo0OSt1RXUwYmdVbkxOSHBtTTEyM05mYXlPNDIxRCt4WmQ4b1AxV0hpWnFK?=
 =?utf-8?B?MDdsQXU5aXZDa3hjSDJkZGtaRjY5WEVRRzNnODRaRXhPTW5aNStTMTFMSi9o?=
 =?utf-8?B?Y0VCbGVxeERyd05Lc0lva0R1cTdWRlpTcnlhUmtHMUh1SGJpcVNXQnAwQmFv?=
 =?utf-8?B?T0RyVFcyU3NMY2NaRUxGOGp1WGMxQ2NTbCtZS2RMVjVFWDVyWmF6MTQrT2Y5?=
 =?utf-8?B?dklSR0hZWUoydTF4dzZaSHh2QUp3S3dtb0lJYW55Ylp5QUZGRkhPNmlzMkdj?=
 =?utf-8?B?Vy9OVHR2SkRkaTRzKzF1M2srcGJ2QXBSVll6R1JWeW5oakgzZ2kzSHZoVTM5?=
 =?utf-8?B?R1RqNzZHcUdyN1R3RHJ5TllJR1ROQnN1OENCV2gxOGUyZkZSUndLUXRYMVd1?=
 =?utf-8?B?ZXQ0VXJWM2hCRnIvaHF0dFVkeDFZWUlTTXdFVnJVNkh1MzdvOE5CeTJJeGc2?=
 =?utf-8?B?V0FXZHlxbkNBS3JyZ2g0M0JVdTZub1FONFZkOHF3VXU4K2l5RmtxMTRRc1dz?=
 =?utf-8?B?blRHamZZd095U256c1RPU1NGVlF2TzBUWDg2a0VDbDd4K3g4VnAyWWtEbit6?=
 =?utf-8?B?cGViNDB6Y3hDNEVhOFYyMjYrQTZkdnphdWlXZ2JDbnF5ZUZ4N21NWVBIeThF?=
 =?utf-8?B?SjZRZmtQUEJjdWNjZHVaWTJqU0pMWEVBYjczVnZybUtuNWpkdDROVGU5YzFO?=
 =?utf-8?B?dEQ0cFdIVlR3elFIS1o5cGVudXgxOXdhNkNuTng0MkRlcHI5U0dDMDN5Z3VJ?=
 =?utf-8?B?WUI4TkV5M0laRXFkSnY5czRVcVR0N1NMNUsxZUhNQURPM1FzS3RaVkwwSnQx?=
 =?utf-8?Q?tu5x5bNKY06A1k+37B?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8591d3-b580-4c18-269a-08de7deb21e9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 14:49:57.6315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sEDmqnrQgsbqRKtZE//zJwk5M6w+Irsn1PjjlARl0Vr16qUhhTmRB6udWSziS2YB7xpRlSwzwNzviT+z7uEBdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11447

On Mon, Mar 09, 2026 at 11:41:43AM +0100, Max Krummenacher wrote:
> On Mon, Mar 02, 2026 at 10:49:28AM -0500, Frank Li wrote:
> > On Mon, Mar 02, 2026 at 11:53:00AM +0100, Max Krummenacher wrote:
> > > Am Donnerstag, dem 26.02.2026 um 10:12 -0500 schrieb Frank Li:
> > > > On Thu, Feb 26, 2026 at 01:47:39PM +0100, Max Krummenacher wrote:
> > > > > On Wed, Feb 25, 2026 at 12:51:32PM -0500, Frank Li wrote:
> > > > > > On Wed, Feb 25, 2026 at 06:40:21PM +0100, Max Krummenacher wrote:
> > > > > > > On Thu, Feb 19, 2026 at 02:41:58PM -0500, Frank Li wrote:
> > > > > > > > On Thu, Feb 19, 2026 at 06:06:31PM +0100, Max Krummenacher wrote:
> > > > > > > > > Hi Frank
> > > > > > > > >
> > > > > > > > > On Thu, Feb 19, 2026 at 11:01:26AM -0500, Frank Li wrote:
> > > > > > > > > > On Thu, Feb 19, 2026 at 04:11:49PM +0100, max.oss.09@gmail.com wrote:
> > > > > > > > > > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > > > > > > > > > >
> > > > > > > > > > > This reverts commit 8124b4a4a96b57d6cc3705a9df9623c52baa047b.
> > > > > > > > > > >
> > > > > > > > > > > The change introduced a regression: at least Colibri iMX6ULL and
> > > > > > > > > > > Colibri iMX7 no longer boot with that commit applied, while they boot
> > > > > > > > > > > again after reverting it.
> > > > > > > > > > >
> > > > > > > > > > > Although this has only been verified on these two modules, the issue
> > > > > > > > > > > is expected to affect all device trees using the gpmi-nand driver.
> > > > > > > > > > >
> > > > > > > > > > > [    0.876938] Creating 5 MTD partitions on "gpmi-nand":
> > > > > > > > > > > [    0.876974] 0x000000000000-0x000000080000 : "mx7-bcb"
> > > > > > > > > > > [    0.879860] 0x000000080000-0x000000200000 : "u-boot1"
> > > > > > > > > > > [    0.884761] 0x000000200000-0x000000380000 : "u-boot2"
> > > > > > > > > > > [    0.886993] 0x000000380000-0x000000400000 : "u-boot-env"
> > > > > > > > > > > [    0.894686] 0x000000400000-0x000020000000 : "ubi"
> > > > > > > > > > > [    0.899054] gpmi-nand 33002000.nand-controller: driver registered.
> > > > > > > > > > > ...
> > > > > > > > > > > [    0.960443] ubi0: default fastmap pool size: 200
> > > > > > > > > > > [    0.960476] ubi0: default fastmap WL pool size: 100
> > > > > > > > > > > [    0.960500] ubi0: attaching mtd4
> > > > > > > > > > > [    1.636355] ubi0 error: scan_peb: bad image sequence number 1588722158 in PEB 4060, expected 1574791632
> > > > > > > > > > > ...
> > > > > > > > > > > [    1.649889] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd4, error -22
> > > > > > > > > > > [    1.650029] UBI error: cannot attach mtd4
> > > > > > > > > > > ...
> > > > > > > > > > > [    1.670262] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,253)
> > > > > > > > > >
> > > > > > > > > > Can you help found the real reason why not boot?
> > > > > > > > > > nand@0 is preferred format for MTD raw nand.
> > > > > > > > > >
> > > > > > > > > > Frank
> > > > > > > > >
> > > > > > > > > I guess the root cause is that the driver for gpmi-nand predates the
> > > > > > > > > update of the binding rules which want the nand device described in
> > > > > > > > > a child node 'nand@0' also for nand controllers which only can
> > > > > > > > > control one nand chip.
> > > > > > > > >
> > > > > > > > > While it is possible to update the driver in the same patch set as
> > > > > > > > > changing the device tree to understand the new dtb rules, maybe even
> > > > > > > > > falling back to the old definitions this likely breaks other users,
> > > > > > > > > most notable U-Boot.
> > > > > > > >
> > > > > > > > GPMI is widely used, include i.MX8 still use GPMI. Does below patch fix
> > > > > > > > boot problem?
> > > > > > >
> > > > > > > My concern is that the new device tree (with the nand@0 subnode) is not
> > > > > > > yet understood by other consumers of the DT sources, e.g. U‑Boot, older
> > > > > > > Linux kernels (before the driver change), possibly barebox, and any
> > > > > > > other consumer that relies on the kernel DT files.
> > > > > >
> > > > > > I understand, but we need move forward. we can keep both for transition.
> > > > > >
> > > > > > >
> > > > > > > Updating only the Linux driver to support both the new and old bindings
> > > > > > > therefore solves only part of the problem. As long as these other
> > > > > > > consumers do not understand both bindings as well, we cannot safely
> > > > > > > update the shared DT sources. So I think the commit needs to be reverted.
> > > > > > >
> > > > > > > In addition, the proposed fix in the driver is likely incomplete:
> > > > > > > with the old binding there may be child nodes (i.e for partitions).
> > > > > > > 'np = of_get_next_child(this->pdev->dev.of_node, NULL);' does then find
> > > > > > > a node whcih is not the node that actually describes the single NAND
> > > > > > > chip.
> > > > > >
> > > > > > I know it is incomplete, just want to check if it is the reason cause
> > > > > > boot failure.
> > > > > >
> > > > > > >
> > > > > > > An alternative approach could be to update the binding documentation
> > > > > > > so that, specifically for the GPMI driver, the older binding is also
> > > > > > > considered valid.
> > > > > >
> > > > > > Not easy to do that, I try many method to update yaml file. common nand
> > > > > > flash detect node node "nand-controller".
> > > > > >
> > > > > > > Once the driver supports both the old and the new binding, the old
> > > > > > > form could be marked as deprecated, but still allowed for compatibility.
> > > > > > > This would avoid breaking existing consumers while giving us a path
> > > > > > > to migrate DTs over time.
> > > > > >
> > > > > > Needn't revert all, just revert delete part, keep both to help migrate.
> > > > > >
> > > > > > anyways, I need know if of_get_next_child(this->pdev->dev.of_node, NULL);
> > > > > > fix your problem.
> > > > >
> > > > > I tested the following on Colibri iMX7.
> > > > >
> > > > > kernel 7.0-rc1 and DTB are built from an untouched kernel at commit
> > > > > 7dff99b35460 ("Remove WARN_ALL_UNSEEDED_RANDOM kernel config option").
> > > > >
> > > > > kernel 7.0-rc1 patched has the sources as above plus the changes you
> > > > > propose to the gpmi-nand driver.
> > > > >
> > > > > DTB-reverted has the sources as above plus commit 8124b4a4a96b ("ARM:
> > > > > dts: imx: move nand related property under nand@0") reverted.
> > > > >
> > > > >                               DTB        DTB-reverted
> > > > >
> > > > > kernel 7.0-rc1                fail       boots
> > > > >
> > > > > kernel 7.0-rc1 patched        boots      boots
> > > >
> > > > Thanks you for testing. I will work a formal patch for it. Can you help
> > > > rework you patch, which keep both properties, just revert deleted part
> > > > and keep everything nand@0, so it help transistion. you also start work
> > > > uboot part.
> > >
> > > We are happy to test any patch proposals on our hardware for U-Boot
> > > and Linux, with and without the nand@0 subnode.
> > >
> > > Please note that the current state as of Linux v7.0-rc2 is broken
> > > for our NAND-based modules, and our CI no longer produces any useful
> > > results as a consequence.
> > >
> > > I strongly believe that, as an immediate first step, the commit
> > > that moved the DT NAND chip configuration into its subnode should
> > > be reverted.
> >
> > As my previous said, can do partial revert? Just add back property under
> > gpmi and keep nand@0 node.
> >
> > For example
> >
> > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > @@ -260,14 +260,10 @@ fixed-link {
> > &gpmi {
> >   	pinctrl-names = "default";
> >   	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > +	nand-on-flash-bbt;
> >   	#address-cells = <1>;
> >  	#size-cells = <0>;
> >   	status = "okay";
> >
> > Remove "- nand@0" part.  You can use "git add -p" to do that.
> >
> > Frank
>
> Sorry for the delay, was AFK last week.
>
> I tried the partial revert of having the properties configuring the
> nand chip both at the nand controller node level directly and
> additionally in the subnode nand@0.
> I.e. revert what your patch removes but keep what it adds.
>
> This works with the existing gpmi driver and the patched gpmi driver:
>
>                               DTB        DTB-reverted DTB-partially-reverted
> kernel 7.0-rc1                fail       boots        boots
> kernel 7.0-rc1 patched        boots      boots        boots

Thanks! I already appled revert patch. If you sent out partially revert
patch, I can replace my fixes branch before I send out pull-reqeust
(plan in this Friday)

Frank

>
> Regards
> Max[A
>
> >
> >
> > >
> > > Regards
> > > Max
> > >
> > > >
> > > > I plan give additional 1 year to do transistion. This type layout actually
> > > > exist for long time.
> > > >
> > > > Frank
> > > >
> > > > >
> > > > > Regards
> > > > > Max
> > > > >
> > > > > >
> > > > > > Frank
> > > > > > >
> > > > > > > Regards,
> > > > > > > Max
> > > > > > >
> > > > > > > >
> > > > > > > > diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > > > > > > index 51f595fbc834e..fb126a7c4a61e 100644
> > > > > > > > --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > > > > > > +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > > > > > > @@ -2680,6 +2680,7 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
> > > > > > > >  {
> > > > > > > >         struct nand_chip *chip = &this->nand;
> > > > > > > >         struct mtd_info  *mtd = nand_to_mtd(chip);
> > > > > > > > +       struct device_node *np;
> > > > > > > >         int ret;
> > > > > > > >
> > > > > > > >         /* init the MTD data structures */
> > > > > > > > @@ -2688,7 +2689,10 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
> > > > > > > >
> > > > > > > >         /* init the nand_chip{}, we don't support a 16-bit NAND Flash bus. */
> > > > > > > >         nand_set_controller_data(chip, this);
> > > > > > > > -       nand_set_flash_node(chip, this->pdev->dev.of_node);
> > > > > > > > +       np = of_get_next_child(this->pdev->dev.of_node, NULL);
> > > > > > > > +       if (!np)
> > > > > > > > +               np = this->pdev->dev.of_node;
> > > > > > > > +       nand_set_flash_node(chip, np);
> > > > > > > >         chip->legacy.block_markbad = gpmi_block_markbad;
> > > > > > > >         chip->badblock_pattern  = &gpmi_bbt_descr;
> > > > > > > >         chip->options           |= NAND_NO_SUBPAGE_WRITE;
> > > > > > > >
> > > > > > > > Frank
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > So I don't see a quick fix other than reverting and living with the
> > > > > > > > > dtb_check warning.
> > > > > > > > >
> > > > > > > > > Regards,
> > > > > > > > > Max
> > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Fixes: 8124b4a4a96b ("ARM: dts: imx: move nand related property under nand@0")
> > > > > > > > > > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > > > > > > > > >
> > > > > > > > > > > ---
> > > > > > > > > > >
> > > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi      |  6 +-----
> > > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi         |  6 +-----
> > > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi |  6 +-----
> > > > > > > > > > >  .../boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi |  6 +-----
> > > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi      |  6 +-----
> > > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi           |  6 +-----
> > > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts            |  6 +-----
> > > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi          |  6 +-----
> > > > > > > > > > >  .../boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi  |  6 +-----
> > > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi          |  6 +-----
> > > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi       | 12 ++++--------
> > > > > > > > > > >  .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi   | 12 ++++--------
> > > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi |  6 +-----
> > > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts     |  6 +-----
> > > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi          |  8 ++------
> > > > > > > > > > >  15 files changed, 22 insertions(+), 82 deletions(-)
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > > > > > > > > index f452764fae00..547fb141ec0c 100644
> > > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > > > > > > > > @@ -36,12 +36,8 @@ &clks {
> > > > > > > > > > >  &gpmi {
> > > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > > >  	status = "okay";
> > > > > > > > > > > -
> > > > > > > > > > > -	nand@0 {
> > > > > > > > > > > -		reg = <0>;
> > > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > > -	};
> > > > > > > > > > >  };
> > > > > > > > > > >
> > > > > > > > > > >  &i2c3 {
> > > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > > > > > > > > index 58ecdb87c6d4..9975b6ee433d 100644
> > > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > > > > > > > > @@ -172,12 +172,8 @@ eth_phy: ethernet-phy@0 {
> > > > > > > > > > >  &gpmi {
> > > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > > >  	status = "okay";
> > > > > > > > > > > -
> > > > > > > > > > > -	nand@0 {
> > > > > > > > > > > -		reg = <0>;
> > > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > > -	};
> > > > > > > > > > >  };
> > > > > > > > > > >
> > > > > > > > > > >  &i2c1 {
> > > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > > > > > > > > index 6f3becd33a5b..aa9a442852f4 100644
> > > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > > > > > > > > @@ -102,12 +102,8 @@ ethphy: ethernet-phy@0 {
> > > > > > > > > > >  &gpmi {
> > > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > > >  	status = "okay";
> > > > > > > > > > > -
> > > > > > > > > > > -	nand@0 {
> > > > > > > > > > > -		reg = <0>;
> > > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > > -	};
> > > > > > > > > > >  };
> > > > > > > > > > >
> > > > > > > > > > >  &i2c1 {
> > > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > > > > > > > > > index f2140dd8525f..85e278eb2016 100644
> > > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > > > > > > > > > @@ -73,12 +73,8 @@ ethphy: ethernet-phy@3 {
> > > > > > > > > > >  &gpmi {
> > > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > > >  	status = "disabled";
> > > > > > > > > > > -
> > > > > > > > > > > -	nand@0 {
> > > > > > > > > > > -		reg = <0>;
> > > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > > -	};
> > > > > > > > > > >  };
> > > > > > > > > > >
> > > > > > > > > > >  &i2c3 {
> > > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > > > > > > > > index 131a3428ddb8..c93dbc595ef6 100644
> > > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > > > > > > > > @@ -260,14 +260,10 @@ fixed-link {
> > > > > > > > > > >  &gpmi {
> > > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > > >  	#address-cells = <1>;
> > > > > > > > > > >  	#size-cells = <0>;
> > > > > > > > > > >  	status = "okay";
> > > > > > > > > > > -
> > > > > > > > > > > -	nand@0 {
> > > > > > > > > > > -		reg = <0>;
> > > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > > -	};
> > > > > > > > > > >  };
> > > > > > > > > > >
> > > > > > > > > > >  &i2c3 {
> > > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > > > > > > > > index d29adfef5fdb..57297d6521cf 100644
> > > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > > > > > > > > @@ -252,13 +252,9 @@ etnphy: ethernet-phy@0 {
> > > > > > > > > > >  &gpmi {
> > > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > > >  	fsl,no-blockmark-swap;
> > > > > > > > > > >  	status = "okay";
> > > > > > > > > > > -
> > > > > > > > > > > -	nand@0 {
> > > > > > > > > > > -		reg = <0>;
> > > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > > -	};
> > > > > > > > > > >  };
> > > > > > > > > > >
> > > > > > > > > > >  &i2c1 {
> > > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > > > > > > > > index 40d530c1dc29..2a6bb5ff808a 100644
> > > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > > > > > > > > @@ -133,12 +133,8 @@ ethphy1: ethernet-phy@1 {
> > > > > > > > > > >  &gpmi {
> > > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > > >  	status = "okay";
> > > > > > > > > > > -
> > > > > > > > > > > -	nand@0 {
> > > > > > > > > > > -		reg = <0>;
> > > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > > -	};
> > > > > > > > > > >  };
> > > > > > > > > > >
> > > > > > > > > > >  &i2c1 {
> > > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > > > > > > > > index 776f6f78ee46..e34c8cbe36ae 100644
> > > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > > > > > > > > @@ -101,12 +101,8 @@ ethphy0: ethernet-phy@0 {
> > > > > > > > > > >  &gpmi {
> > > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > > >  	status = "disabled";
> > > > > > > > > > > -
> > > > > > > > > > > -	nand@0 {
> > > > > > > > > > > -		reg = <0>;
> > > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > > -	};
> > > > > > > > > > >  };
> > > > > > > > > > >
> > > > > > > > > > >  &i2c1 {
> > > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > > > > > > > > > index 27e4d2aec137..a3ea1b208462 100644
> > > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > > > > > > > > > @@ -63,12 +63,8 @@ ethphy1: ethernet-phy@1 {
> > > > > > > > > > >  &gpmi {
> > > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > > >  	status = "disabled";
> > > > > > > > > > > -
> > > > > > > > > > > -	nand@0 {
> > > > > > > > > > > -		reg = <0>;
> > > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > > -	};
> > > > > > > > > > >  };
> > > > > > > > > > >
> > > > > > > > > > >  &i2c1 {
> > > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > > > > > > > > index dc53f9286ffe..1992dfb53b45 100644
> > > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > > > > > > > > @@ -296,13 +296,9 @@ &fec2 {
> > > > > > > > > > >  &gpmi {
> > > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > > >  	fsl,no-blockmark-swap;
> > > > > > > > > > >  	status = "okay";
> > > > > > > > > > > -
> > > > > > > > > > > -	nand@0 {
> > > > > > > > > > > -		reg = <0>;
> > > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > > -	};
> > > > > > > > > > >  };
> > > > > > > > > > >
> > > > > > > > > > >  &i2c2 {
> > > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > > > > > > > > index eaed2cbf0c82..ec3c1e7301f4 100644
> > > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > > > > > > > > @@ -160,15 +160,11 @@ &gpmi {
> > > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > >  	fsl,use-minimum-ecc;
> > > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > > > +	nand-ecc-mode = "hw";
> > > > > > > > > > > +	nand-ecc-strength = <8>;
> > > > > > > > > > > +	nand-ecc-step-size = <512>;
> > > > > > > > > > >  	status = "okay";
> > > > > > > > > > > -
> > > > > > > > > > > -	nand@0 {
> > > > > > > > > > > -		reg = <0>;
> > > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > > -		nand-ecc-mode = "hw";
> > > > > > > > > > > -		nand-ecc-strength = <8>;
> > > > > > > > > > > -		nand-ecc-step-size = <512>;
> > > > > > > > > > > -	};
> > > > > > > > > > >  };
> > > > > > > > > > >
> > > > > > > > > > >  /* I2C3_SDA/SCL on SODIMM 194/196 (e.g. RTC on carrier board) */
> > > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > > > > > > > > > index 3dfd43b32055..43518bf07602 100644
> > > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > > > > > > > > > @@ -43,15 +43,11 @@ ethphy0: ethernet-phy@0 {
> > > > > > > > > > >  &gpmi {
> > > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > > +	nand-ecc-mode = "hw";
> > > > > > > > > > > +	nand-ecc-strength = <0>;
> > > > > > > > > > > +	nand-ecc-step-size = <0>;
> > > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > > >  	status = "okay";
> > > > > > > > > > > -
> > > > > > > > > > > -	nand@0 {
> > > > > > > > > > > -		reg = <0>;
> > > > > > > > > > > -		nand-ecc-mode = "hw";
> > > > > > > > > > > -		nand-ecc-strength = <0>;
> > > > > > > > > > > -		nand-ecc-step-size = <0>;
> > > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > > -	};
> > > > > > > > > > >  };
> > > > > > > > > > >
> > > > > > > > > > >  &iomuxc {
> > > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > > > > > > > > index fc298f57bfff..83b9de17cee2 100644
> > > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > > > > > > > > @@ -60,12 +60,8 @@ ethphy0: ethernet-phy@0 {
> > > > > > > > > > >  &gpmi {
> > > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > > >  	status = "disabled";
> > > > > > > > > > > -
> > > > > > > > > > > -	nand@0 {
> > > > > > > > > > > -		reg = <0>;
> > > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > > -	};
> > > > > > > > > > >  };
> > > > > > > > > > >
> > > > > > > > > > >  &uart1 {
> > > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > > > > > > > > index 8ec18eae98a4..2d9f495660c9 100644
> > > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > > > > > > > > @@ -25,12 +25,8 @@ usdhc2_pwrseq: usdhc2-pwrseq {
> > > > > > > > > > >  &gpmi {
> > > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > > >  	status = "okay";
> > > > > > > > > > > -
> > > > > > > > > > > -	nand@0 {
> > > > > > > > > > > -		reg = <0>;
> > > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > > -	};
> > > > > > > > > > >  };
> > > > > > > > > > >
> > > > > > > > > > >  &snvs_poweroff {
> > > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > > > > > > > > index a41dc4edfc0d..8666dcd7fe97 100644
> > > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > > > > > > > > @@ -375,14 +375,10 @@ &gpio7 {
> > > > > > > > > > >  /* NAND on such SKUs */
> > > > > > > > > > >  &gpmi {
> > > > > > > > > > >  	fsl,use-minimum-ecc;
> > > > > > > > > > > +	nand-ecc-mode = "hw";
> > > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > > -
> > > > > > > > > > > -	nand@0 {
> > > > > > > > > > > -		reg = <0>;
> > > > > > > > > > > -		nand-ecc-mode = "hw";
> > > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > > -	};
> > > > > > > > > > >  };
> > > > > > > > > > >
> > > > > > > > > > >  /* On-module Power I2C */
> > > > > > > > > > > --
> > > > > > > > > > > 2.42.0
> > > > > > > > > > >
