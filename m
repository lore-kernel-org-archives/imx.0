Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011052.outbound.protection.outlook.com [52.101.65.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9883A168B
	for <imx@lists.linux.dev>; Tue, 21 Apr 2026 08:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776761882; cv=fail; b=SRl7ixq1R1IKuksRr7cJky4U89+w5daIl2ZCXXbElfIEF5B5fklSaTOIU0GMv/kGZQxUJEXyfOzr3CMLrw8pHycWhtjv1EpIUNS+U6ICbX14Cw3zLZhrC+9/IhP+3724SuzBQl2ccr/tmJzytbOSAQwLDS4wUj5D53zOtclcuds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776761882; c=relaxed/simple;
	bh=8Vtml9UnCCFBtakBqaScm+TEQpEToNYGvjx79G6PZ5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CJQSbM+j2NNS48faTBUjLoHPH0qb0JMLdM1NYIZdybOjqdC65aDed4rVLxYgBWvpYqCX4tYkY75WSkx9aw1JYvQo0PXks57iX4AzKIbKbeaf9zUBIIa1zxiAW9KnKo9BOz2FfYJpJG7jaCP1ZbWo/Wtadr2KuW8c1rXQf4qvcvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LP9lLflM; arc=fail smtp.client-ip=52.101.65.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LP9lLflM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HS/dDKKi4iOZjqav4QLJNnzO5WmwQMY95I1dV/glApPG6g7ENU3VbDWiTyMi4eYlCigiNZRqO6WXzS06m2aTksLfoifM071xmA9sYaZZflkbT/7QwdaZGF5TIABEt1oPWOn3DHzpIHjCod2wk+fodny4Lia22Bf3rfzOpkDIUA5FgJ695NEJQEBw7BAnJv9HxFR61Iwl3Hq3KSuzL1p/xLnRj/evbOew+qACHgAl6uVPGL6PwzhUeRngXrhbREYYG4Dp8aCqdAqkFcdOX3sC3yabXrx63x9/32YC7QC0fW2Hkf4wog8ZIBK0yZ+6bA0CexajQlmAjO4Aj/QLVEy9Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyP9a3XGN5QygY8+9mwGb209nr1fPg2DA3ijwKyzpZU=;
 b=AXzlCJ0x8tK7AIeLmA1E3zr8vJ1YvA9e5HJ2uY0HpI+3iQyKL1ODd/DvaYqX7HHrcZjIV0PcmOJska5M7Dt5OqOQom22/KlDbzYIJafnDTGf33D6eRp0EoLlRL+lbS9sjA4BqigE8g/ZF0G5v2Usp+3KGDXWcFR1ZZ3rRR1WuMFFe+sj9JhZfnwxy2Ea47OQR+cH6FDrtui+KBkSbwSZCq2ZZ4K4i4CtiRe/QNZ0AMPYkQ3XuoLEZAkdZ6UDUuUlGOaAI1P8Rg+aKEeU6BQ1D3P64l9MWhdgNEMLQAwaSrDfMrLZ2UTBtlsA6AOFKmkkwvvQrBmeMiBEjG8zgzNQkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyP9a3XGN5QygY8+9mwGb209nr1fPg2DA3ijwKyzpZU=;
 b=LP9lLflM5u5ezw6b7d2Ijohv5Wm+JrZKSYdOVake8OwkQuCeKjYpo2AEVCwkoJzQMyWiiZQaSqrlU4cWUzaTFMJ354tryfDbqdvT0CTrudjyTDWJEWIq7d2FPbawtk+viqyEnCwubtR0VyrJ2FD/M/6lC94bX1g/x7VjBQDiK5VGy3Z5JgCo9yMZjvPaOmjlz7m6bMcYpru0/kfUuV2mQZipyOarD2sNBydDnh2G+zP67Emugw7omBBjAn2IoSO3GpRNXTneEiwLxC7obuR8WIxxFw+54WldO9J4mYZIJZVvKjhteg7lmeHwmKKEU76RndJWpJTzK1zxSyFAQFho4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10048.eurprd04.prod.outlook.com (2603:10a6:150:118::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 08:57:56 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 08:57:56 +0000
Date: Tue, 21 Apr 2026 04:57:46 -0400
From: Frank Li <Frank.li@nxp.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v25 0/7] firmware: imx: driver for NXP secure-enclave
Message-ID: <aec8CvIQGYk2Eyff@lizhi-Precision-Tower-5810>
References: <20260122-imx-se-if-v25-0-5c3e3e3b69a8@nxp.com>
 <AM9PR04MB86047EA92BB21C6D522FC007959EA@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <6543cf20-01e3-4dc2-b4b0-08935527f440@kontron.de>
 <e5989438-c063-4395-919c-2beaf8e937c8@kontron.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5989438-c063-4395-919c-2beaf8e937c8@kontron.de>
X-ClientProxiedBy: SJ0PR03CA0390.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::35) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10048:EE_
X-MS-Office365-Filtering-Correlation-Id: aab840cb-1434-4df8-07ce-08de9f841478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|7416014|52116014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	raxAdWnq68OZOx5WwRvndqFouIrVIyiy+D6EmyLCc+jH13FaQckQMh4sI/PUt3rwg5j7PMgV65MV0eGo3kzqauDglyjK21uWLw0k5bL4yPKbCC+IGbIzpxfotAuAc7r7PracDG26Jah2K93QDLUJqnSmVV38a2zVjtGEl4yexKq6EguByING+WzeTBtdsf1A5w4KWjPhdj21fic1M5ITBhWONdcJaOrZnQIbqrWxTuzd/AQG3a5cw5oEwrybniproPM7nyeUi5dOOk0SLlUlae2MnqqrO7vUhIAhYT7Dfx9pSFUfuBrjC5vRVtV58wg+M00kXtkM9ryGM2XS8AWP52Quq+Ux1o4cGhuiAfsTsRo0erUcx8KvGKLt39mXu76equv7Ts51pcG8CI5ms12G8Q3ixp5bpbI/I2lXbgiq/wjrOclS2r27Gi9Fp+Ky5/VmdOd3+ovv4SMSm7TbVeIeWiLALPc7kES4YQaq/7xIoc+5zMGQ08t5pI4l3/1voUIqMKn7SzgmKdKNu8Xv3Gvw3q7q/5vRJ/VjqUNt6CibBkCXCkQVrUOnZeYOPs0vqxwmcuIYDWi1G6W+LdfUkFurVlYzIGp/mZudC9B6EA63yi2eS+NsmEAtFkD7STUsptzcFjYsz48Q34weOJarSigv/PvX2zCzqq9a6sAZZOAd2IHGS7JMmC8ylmqo+NCJqAtScwcTIctlb1sDWbf+ny3OITbD1bKwxxFl1TrqqJ35W5GvzRS85OoM+06JkI5wSuDffL6Qzss/lOp7sBKz4hesL3L9KmFWYEB6/qKrZMbQe9o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(7416014)(52116014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVNFQW9jQUxjZkNpcGRPK05ibnpFeTdoWm9tM1ZkaGkvWDVIV2JsTWpYOFkw?=
 =?utf-8?B?T3NWRUQ4NWdqMDdLeTlTMFkxNmw0N2hKME01emJKbjVHWGtkd2JiNjlCTElX?=
 =?utf-8?B?RlRReWxSNkRQWlhpRW9pRG5LaDJoL2ZESjFBUkFWaUdta2cwN3V0RnU1TEdo?=
 =?utf-8?B?TjRXMnU2T2ZvNVhlWVFOUWN5T0dsaUR5RGtNait4QVJuc2RlbTdOR29uSU4w?=
 =?utf-8?B?VzNabXlPR3drMVp1S1h4a1pLYW1vbUkxaG0wVWhZQnFacUhNRXFYdGxoRHVk?=
 =?utf-8?B?Y1liUCtjNzkxUmQyNUlvWHlJWElEM2o2WWg1dVdLRTNKRVdiQnU5STFPRUJG?=
 =?utf-8?B?RmJUdXBtQVNPemp0a24vbENqTEVKUDFwb1VPem4zcVdWTTJ0dzhTT1F4NGtT?=
 =?utf-8?B?eHdWZTBWTjNYU1pWTzIzK2w3WnZqS0V6RXNObTc0eVJWT20xdmkwQVdwbVR3?=
 =?utf-8?B?L3Y0V0tlQ2taVS9HOTRpNXQ2WWc3WU5FWnlIakV6c3paSTBYdytod29GcUdY?=
 =?utf-8?B?aUJZNnZGVThJazlnWUdrK3hodXBMUEpQbm1HWFdvUzlNNGQzMk5ra3d2cFVs?=
 =?utf-8?B?NnJXQUIzdUNCbXcxRWNRWFZWZTlGWjNuanlGUXpqL3RhN1dOM1ZSZnNDRHEw?=
 =?utf-8?B?NlBRVSs0S1JFOTdZT1ZSNVcvVHpheGc3RXp1UkxkalUvcFhpVlFKOWVsM3lm?=
 =?utf-8?B?VFFRVEkzR3VFQllNVDJsVFZ6a2hQY2FkZDBqcTRXWXNHTk1vWFpkNklMM0Mx?=
 =?utf-8?B?TkVVTzFiN1pDZEF1YzF0RWYwamplMjhRWlFlVmo3MU5QZ1hBenc5dDdJcFk0?=
 =?utf-8?B?Rmp1S0VWMStsMG1VcE0vSU9SdE9Zc3IwWjJ4a05xbk1Dc3BwckRsQVVPdHll?=
 =?utf-8?B?WHlxcW5lRFhDNjNDOFNha00rL3V6OEx3VU51VVVKNGZjQ0FoVFdyVFRwL1pw?=
 =?utf-8?B?Y0ZkM1NjNVlhZTBjR255b01CaDludTE2bkRBY1JOSGswZmFOUEhkOTdlUHlo?=
 =?utf-8?B?N1I3UDE3WmsrYlVDV0ZPRlJuWTlETC93OFhwMjc5WG5mSWRXZktZM3FYRlRw?=
 =?utf-8?B?K21HKzFCOHFUQlBNR3YyQmFnT0NQTE5yOUROdVB6bU4vazcwV0w5aDR6ZFpR?=
 =?utf-8?B?NHZCNVk1L0FxTjdZY0J2bkM0aHE1enNoVURYUG1hb3h4cTNxZ3l4M0tiVEx6?=
 =?utf-8?B?dy9lRkc4ZU5MZE02VGpOcm9WelhPMXpyQXZwUHJ2bk9wLzIxR1FvSnNMbUJt?=
 =?utf-8?B?NnE5UnVCNm0vL2pGaTlzeDdrZ0xPdWEyeTVlY2VxbStDUE1tQnA2aFhsZk45?=
 =?utf-8?B?WDNZQXRackU3OGh2bXFqb0NBVDJoS3NJdXc3MFJvNHFmUDlOVkowSFByajht?=
 =?utf-8?B?N2hjNy9ieGxJZ2R5ejVyQVZQVUZGTEVuTXM3cGtPcUxzMzBjUzBiQWQ5Q3Jt?=
 =?utf-8?B?dTRXQml6R0ZZL1lrdHBKUUcva2xvZUV2NGNYT2lmZ1ZKaUU2dk1pZGNjTHEr?=
 =?utf-8?B?VURpVWxWbDV6VFVXOWxjays1bHBtOG5ITFZpeVBKVDhtYXZsLy85QlRPSnRr?=
 =?utf-8?B?QVFZa0JQanE3c1l3VGlzL2tWL2F3V1c4Y1JGQ3U5UStGeWZidnF3b0RxK2g4?=
 =?utf-8?B?WG5QOXJ1UmJoUnZaN3RUTlNOKy93ZEsveVFlanVMSUJMbUwwM3lOUnl0QVlJ?=
 =?utf-8?B?MUloSXAySmhZbUVaY2w1L3p6aHhXSlJRNWxlamhDVUhidUV3eUU3Nm80eVhL?=
 =?utf-8?B?OUEyVnNsNDhnd0g3V2FwRzJGVUl1UW9BVWdGV2d0bXJwaTdmTGNpMUdwVWxh?=
 =?utf-8?B?Q0xaQlg3aTVLQzZsMER3eDY2NVJlZC9VR21nNktpSm1vcWFsQVhTWlVEN25a?=
 =?utf-8?B?bVVLcytvWm5CQkZ3a2ZsMHRmMlNXUCtqZmtyRVgwdStYUUxnN0hjZWpLcGY4?=
 =?utf-8?B?YnZKSGpld0dPYVFySjRnc09CRUlrT1NNZFRhLzVSNi9ENmJtWUVZalJOeWZB?=
 =?utf-8?B?eDdvUUhEelluK0ZRK1lvWmVIMGFmNlJDTE9obkxmaG54dmxrSkVqTFRTNk9z?=
 =?utf-8?B?cWtmdi91YW42ck01VEQ3YWlndXU1UkF1REVDOUhMN0wvdXdEVXFtZFc0NVRQ?=
 =?utf-8?B?ekFrdUhheCtNUzA0bWs5VXRZbWhteDVyeSt1NTV5VE5yNmdPYUFxRGNINGlE?=
 =?utf-8?B?enU2Yk41akVjRDMrRVJOalRJOXJTNW50dXROTHRnaXlOL2N3TFFZTS9PVE1Y?=
 =?utf-8?B?U015YkVzaGlBZE1RK0JYVSsyT3g2c3NETThnRDN1bk1kR1pEOXZLTm9jeGQ3?=
 =?utf-8?Q?H2d8E4R8uLg6oCnBdf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aab840cb-1434-4df8-07ce-08de9f841478
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 08:57:56.4321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dsdJto+jyeaM9+JW89cRPpUD3PLJPykK0Ed3Wf+O8UFIaXIQM8T8KF0pZ59+NnN9B/Pgez+nxWlmTKewNwG5Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10048

On Tue, Apr 21, 2026 at 09:52:13AM +0200, Frieder Schrempf wrote:
> On 24.02.26 12:18, Frieder Schrempf wrote:
> > On 29.01.26 17:58, Pankaj Gupta wrote:
> >> Hi Shawn,
> >>
> >> This is a gentle follow‑up regarding the patch-set.
> >>
> >> In v25, I addressed all automated feedback from kernel CI (warning fixes and checkpatch‑strict resolution), with no further changes requested by reviewers.
> >> Patch 5/7 has also received a Reviewed-by tag from Frank Li (NXP).
> >>
> >> I have not seen additional feedback.
> >> I would appreciate any update on the review/merge status, or guidance on further changes needed to move the series forward.
> >>
> >> Thanks for your time and continued support.
> >
> > How close are we to getting this patchset merged? Work on this has been
> > ongoing for almost three years now and it would be really helpful to
> > have this in the kernel.
> >
> > Thanks!
>
> Gentle ping! Can someone please provide information on what needs to be
> done to get this merged?

Thank you test this. I just took over imx ownship from shawn.  I need get
famillar with work flow and get dts part merge smoothly.

I will try to send this as independent pull request at earily of v7.1

Frank

>
> Thanks!
