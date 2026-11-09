Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794236994;
	b=tUsZjc3TrS0gx3rNR1eZO1AJmh7HghFWgXNf9HeE/UE0RziXySKDeVwohi9TDGbitoPG
	 gQdXdLEOl0rX953CZmAXSjMf8dLSXcNy8Zs5BMeRt5uInjasQMp3dvKXzW2msk3aS1d2B
	 W9Llx2Iu6i4woM9WmRLbCEkAM0VQ+xnq62GMta4O6GscWYlRpLYiSJpoCQxi6inLOCsSp
	 w81W0TcjEiO2UgYMYen3pk2R4eZeijbA0abEGLXICYiR0a8YOuUG98qMzge7kE2d2ms9b
	 7Tu1Z+WOCD+xk6PjlOuiAOBe/DdXb7x7t6IGp9qyt/mJGcggXtqUT6n2UWdDwGf9i3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236994;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=gvAeh78CoO7N+6M0sQIISn23jpFTZ2vWBlkI0F5pSS0=;
	b=HKyKL+iR54sjbQFRJtfzbSeNaVismqsXY1etDbC5Z05zLt8rnAg0O2k0HQpvY7gaBQuR
	 79d2dtGXYLMDZ9AMly9o4Oma827146WLU3o5YufHtPg+AKpNjY4+agRuwRlRfXtPCZ65X
	 6+hrt/F8zF9lO82EqhPsKLtEFWohijjiHT32Xw2GMAjhwTTJOuZtMzcpM5jxk+eIINHKj
	 0QMyYJ3Sn0ZZ6g7cLa7l3SlLMZY2Ab95qlQl7wyof++uWBK5u0FFUBssRblwFMshpHErA
	 Lc8/RG71DQoHSvPrZB+ose/MJYXPP6WU8knab7x2slSwFUUOd7YKHcxpLITfzH+zwrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=K8c8J5Hc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.53
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010053.outbound.protection.outlook.com [52.101.84.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5BA606A31C
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 15:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F5BA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=K8c8J5Hc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BkkU6kZJ3OAwxas3Bs3ak2Of5fs9M4/0AGotV1DZB2O2ETfKKSgNOIAILVfRpgLopJbmJ148m5T6YgWBj6un701P5bkUDm1MKg2Cg1e02ssThcKUuVtdV+CK/WvsauohvlsMEGsLYBYGWuFOQK0TbkoZyFL30JPqcILQojcFWIMk0BPTrJC+iqWarNoB/JXlxmDsBrAJeUdfUyhOgXj4sG0yLNUjJvHIUpHOfVXSG5sUX5LlXDxBnuFoU8Z8p8zDOCsrKnGSfyNyqbD2KP3M9YyaSLu/D0ik7X+cMLxEz0CuG+9n6O5FDKsxXW2KVmXUXnCNx6DpFV/r/tHaHoIDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvAeh78CoO7N+6M0sQIISn23jpFTZ2vWBlkI0F5pSS0=;
 b=Kh7puu81zp+W0W5BsGCziOmdVtcuVm/lTi/oX+nFZWcRz5d+tMI0oC6J03bld3cvfe2QFj/hdUB9YtgzjJhsYI3N02NKK507+6GRTEUytOpiU/Z448bHx3rR0YQBxxGLKJryq8o3i7+9MJeKMY6J+4f1ulR2a88lT5bf76EG4iDNRK4V7NEY+bLBVQkEyxIn1Ma4gyxXUd4YjMi9r9+v3PSBxn04edOGn2ZXQ1woEfoLdnas/gWTW0bPv1kJtO6uAXxqZsPfryKcsK+j5h6sesuTXynCL4jHj/pd3yw6YrIlbws6jv+ZqnbHXBCSpRCho8mO3HVNficX6m7scyDiqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvAeh78CoO7N+6M0sQIISn23jpFTZ2vWBlkI0F5pSS0=;
 b=K8c8J5HcUha31J23lbaiYQbgR/+lZXZTByKqtVd35WIR4elcJiVCwxYMizfFVCtwQJ/6h5zO8mm5iCu5qRT+xWwnCDI8LXkOkdPg6Td8L3OS0Hm3SM/aLNRxxeFv8yEO4LZZibiZfBmIz5pCn0s6cibhNBhSX60mwwo7t5XUfGjy4Qtvxq0g7ATedVRdrNBL1slECZEmhn6bV2QWDEUaBEBGRqX3oyaJlzv6/og6XVmropp4531jX1+XKEYR3OaLJHMe3UQcf+PPwLOzDMANWtOLTkKnKuqN5RKxSA/PYqybGZXR2oj11ysSLahRvOufsbZTjDcgI/I3R30rsoROFA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17) by GVXPR04MB10828.eurprd04.prod.outlook.com
 (2603:10a6:150:227::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 15:09:50 +0000
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8]) by MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8%5]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 15:09:50 +0000
Date: Mon, 9 Nov 2026 17:09:46 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Oliver Smith <osmith@sysmocom.de>
Cc: Vincent Jardin <vjardin@free.fr>, Fabio Estevam <festevam@gmail.com>, 
	Josua Mayer <josua@solid-run.com>, imx@lists.linux.dev
Subject: Re: No network for SolidRun LX2160A Clearfog CX with kernel 6.12.113
Message-ID: <4wkxxgbd5vgb4mo6fvth35vx5m3ubpzndrj7l4dpcazlnqjusn@4mc7x2fitfm3>
References: <d074d5b8-7b86-454d-b948-83530fa82e97@sysmocom.de>
 <CAOMZO5Arqfat5nO5Hi9Dq0TogvGAvmNLChE_8WrDGrNy1ha2Qg@mail.gmail.com>
 <auSrssMDb33JZVN5@L30177.local>
 <c4e8595b-1dcc-4fa9-9a9f-b23be2d79462@sysmocom.de>
 <auX-VA8xlqSwLYGj@L30177.local>
 <z2q7u34spdhyiqhrkem4b64fvdwnnbodgwzj4rynuepqyrym5q@nuy2zhhlqgpu>
 <ab9967d8-0d44-4457-9cba-6d2913e17977@sysmocom.de>
 <ia74kefmqtcuvk6zvtbtxkxeqtfonm6alfqngincebps7l4vcy@b3ljfyzoedxj>
 <f7a51ade-18f9-4733-87e1-dfe885d93492@sysmocom.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7a51ade-18f9-4733-87e1-dfe885d93492@sysmocom.de>
X-ClientProxiedBy: FR4P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::19) To MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI9PR04MB019273:EE_|GVXPR04MB10828:EE_
X-MS-Office365-Filtering-Correlation-Id: 114240bb-c8e2-4ff5-6818-08df3e738012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|11063799006|4143699003|56012099006|261021121427099003|261022075727099003|261009223027099003|261022115727099003|261102123227099003|261026121527099003|10067099003|18002099003|22082099003|6133799003|41080700001;
X-Microsoft-Antispam-Message-Info:
	+jPCODeOqYh6bc0VkKrVjklONVmMhziHhb/79EvXXwmuShG31g6KWZjFAYXVLBBjyWuzWl3QhcpX7H7caQ2QF+sF50y1MfkOE6slo2cGTWoj3S7fGrAICPmvl6dZBITMR9Ohdz6JUxFxcOUB9mFmITweJgUZSfhxI6ZuJecQMOlzZAlxVicUVhyzgw3FooI0ikMbtLYlwCyuNiMZYCMFlZvGfdDiYUzsvJizwjYfr5DOqIgfOE5jTNMAm4b2ICW7eXkzjXdpniRLmJLYO2qRCItyKMV5N7Ybd20z0glHwzudPsZi9vx0YSZliliJddLsdnetgp/KYcgkflsQyNBjdN4gKHYcGHByj+rw/brHJzXZBQJLKElsceJITEpOQ08+d/E4yftE0+bn6biFHxu/mVKePdJir+gt4QgGj77vT+IC4X1Y4ggGTPIpW95XZPt7Xg5lcKXYLSWMUl9o/ro1rmXkpiFvNUvrKLzZzbST3FMCE5Uu7VOciMQzUEPG7JJCiy9gYiVXU0U/pq3+cY9hVHhcnf5sV1f0SSKa5MHORD/bJZJsbmJ56rbV/I8Au8e+cV7iHUMRy6eV/Rz5uyu867a6zHjTaIzQr2xdHeWcXs7M6TKO7mb6L8OXvyGIavgrj5GwARUP8GsRZ7kHGWQemWaxozWkK5Gm5aI33wbFjfU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB019273.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(11063799006)(4143699003)(56012099006)(261021121427099003)(261022075727099003)(261009223027099003)(261022115727099003)(261102123227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uPInDWgOAe8G/g2HGCfplHq2KM7pDbVj03s+ti5XKpI4xQD8lhP7CwvmVio3?=
 =?us-ascii?Q?RKDDcxOYDs35SSMxdmEeMmuf8KghursNSmtuDYB0K+FjhDZxoVFpHvrhqvY2?=
 =?us-ascii?Q?RwHjVwzIcx04rr91vyw7kZv+Vs4ql5kV6U/QJ39xHnHSTa0swoTj6Mx2ctc0?=
 =?us-ascii?Q?nh1tKQuaicpgYhPGqpUCL6Amskz00JleM0baTh8WP1EK7bwyIboW9JwmCZLS?=
 =?us-ascii?Q?UwNXECWVoiYnFEQep4sPA+3Tdgw6TNsG/5sutFfJjZlZM1LsKK8ork8QkL8i?=
 =?us-ascii?Q?SHIvOejHjee4uqMpYF9s/PUTYV9QR4upp/mZ/HxPS3lMCQWZ/ACRNGi2pofm?=
 =?us-ascii?Q?4+dXPth6Hdu1dVNxEchsvO2KRQWhDP1aonM2xrgfQh6ewNVSjO7j4MOUldEW?=
 =?us-ascii?Q?TdjKD5akdEVe4dKlJmNbkydgjvqN8LjAIlg8qwPl892ExMSMaW2JVsXrwvBZ?=
 =?us-ascii?Q?cY/PHxDzQPKF6Ntkx60Q4zpq1faU1IuOIuuIoFalOxiCIBebKC1sOE+Iai80?=
 =?us-ascii?Q?DFFOBorg1Ik6d+xq2yeZ8LL497ZEX2++lvMi1uRO5OGC3PTVJZ8hcbFH+vIT?=
 =?us-ascii?Q?asOnSP2qNhvYP9phXh62qEA6pnA/gcO/9l6g4U2QXtPfiShBcw+cpbWYIaEG?=
 =?us-ascii?Q?XzBR9I9Jx8bGFD6J2jzh+AEPbxpnZXRRakf2Pr6kH+q5pXIp8o/Z0+0lzPUI?=
 =?us-ascii?Q?n5XLRyHntdnVTHujUdmYvAYXFx9lSCKMjK+0T7Tl8Et2GGoowW9n2X+WazAp?=
 =?us-ascii?Q?yevZAbn1IP8bZqCUfY/ez2iqmW3ZabeCFUpxUmeMJiOec1rZcYAwE51/eIOd?=
 =?us-ascii?Q?e9yBIxiEbdRVOSwDIGDWWn5gJoMkvSKfa31+eOQ09LUKS1TsHsHTFd+0icEw?=
 =?us-ascii?Q?Wk2eUu6sFz2lk8eboBkYDNfivgexiCPH3YloAehNlxElm98Ge3GNOaHGgN9P?=
 =?us-ascii?Q?wGV8ouhmyTgDQFPPdxtdhELBESTE6GyclUc1Z5MATGrBKbYXrAck7XLhRAmG?=
 =?us-ascii?Q?5/sEYUNQe6oSlGKCCPYiWVE1OqfFO9aJxsdY9c7Nf+5eB4E9Tp4jcGzz2NfV?=
 =?us-ascii?Q?9c0OtQoQ6rfSlltehX5wiOdMpSeAkLER17CFLLEVr7NL3tsZCJUI/BqNLZD9?=
 =?us-ascii?Q?sTKjCWVMbVyOdEqEtfZyOw301Q4GkWPEuHt1Yh+CcprdmqOCdkSfJAuKprBZ?=
 =?us-ascii?Q?OahCD9rUL0gY8fmxBJNt5aBpkubufNNv18DQuYFK37ccZ4oiGpZfCAeq2hb0?=
 =?us-ascii?Q?guQ2UX4qCncm1bUCIM+VMAq5i2hslmMFVowFkUCMjCu1OcICwnVx5/kyib48?=
 =?us-ascii?Q?kZJesoJWcakLJpW5qiG5UsYcuzm4f0i7lsasxIzF6Cf1zH05p2LC1XXxgZ+b?=
 =?us-ascii?Q?XJLHZErFa+kAzeklijT5WV7HPG1RpSIYF6C3mQKTTfANs2ImnhaBFUrDmnPA?=
 =?us-ascii?Q?TyaNQVUibNjJh+hxJONG8XxPkd+QqeDbcpri9j9DmfwPxiqAkDxxugEqvBPR?=
 =?us-ascii?Q?/S6YQ5gDPbDJ9FmtCSMwshHyhYa1K7GQ4TWm06ybU8Wgk3bQ2B62eQi9aNAz?=
 =?us-ascii?Q?/EAK8iFXchvMfbzKxT5zoM3GpCLMV37JGT73luBgPPJg8JhROmJNkAT86bCG?=
 =?us-ascii?Q?9QVzgYdaPOb9W9CX8dP7ZMEvVuXtQcDIkqC9ozx6rJAAsRRSDKMBuVZaExHO?=
 =?us-ascii?Q?kg897fAoy7nq/XqH0/nScWI0iOUWYypbUEKGNGq5ZYX2i8j60WjW8MU69rq5?=
 =?us-ascii?Q?YjEEnvTrxw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 114240bb-c8e2-4ff5-6818-08df3e738012
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB019273.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 15:09:50.1406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2zK/0TPul3/u9m0dlMg02NaD7uOKwD6cFtkkCK6ioHMnuEqNbg7L6yBxFjk2ca23ewZ0EsHgsh9Knz+53YEiBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10828

On Mon, Nov 09, 2026 at 03:03:24PM +0100, Oliver Smith wrote:
> Hi Ioana,
> 
> On 11/9/26 10:39, Ioana Ciornei wrote:
> > I need to have a look at the DPL file used on your board. Have you built
> > it using Solidrun's lx2160a_build project (https://github.com/SolidRun/lx2160a_build)?
> > Can you get me a link to the source file?
> 
> This image was used in 2022:
> https://solid-run-images.sos-de-fra-1.exo.io/LX2k/lx2160a_build/lx2160acex7_2000_700_3200_8_5_2-f57e117.img.xz
> 
> It is now a dead link, but from the commit hash in the file, apparently
> it has been built from:
> 
> https://github.com/SolidRun/lx2160a_build/tree/f57e11707eb4aa5df1908ff64ba52b9f6141ab1f
> 

This helps, thanks.

The problem is that the DPL file lists 1 DPNI object and multiple DPMAC
objects [1]. The problem arises when the same DPL file tries to describe
extra objects [2] and even connect these objects [3].

The newer versions of the same DPL file do not have this issue [4].

For a targetted fix, without the need to rewrite the entire firmware
image, you would need to:
- clone mc-utils (https://github.com/nxp-qoriq/mc-utils.git)
- apply [4]
- build (make -C config/ )
- Update the DPL file from the board with the newly compiled one -
  config/lx2160a/LX2160A-CEX7/clearfog-cx-s1_8-s2_0-dpl.dtb.

> > Otherwise you can dump it from u-boot by using fdt print before the
> > fsl_mc lazyapply command:
> > 
> > 	=> fdt addr <addr> && fdt print && fsl_mc lazyapply dpl <addr>;
> 
> If the above is not useful: What address would I need to use here?

The address should be the one that's already used to keep the DPL file.
I am sure there is already a 'fsl_mc lazyapply' command in the u-boot
boot path which had the necessary address.

Ioana

[1] https://github.com/SolidRun/lx2160a_build/blob/f57e11707eb4aa5df1908ff64ba52b9f6141ab1f/patches/mc-utils/0001-lx2160acex7-add-8x10G-dual-40G-and-dual-100G-DPL-DPC.patch#L359
[2] https://github.com/SolidRun/lx2160a_build/blob/f57e11707eb4aa5df1908ff64ba52b9f6141ab1f/patches/mc-utils/0001-lx2160acex7-add-8x10G-dual-40G-and-dual-100G-DPL-DPC.patch#L420
[3] https://github.com/SolidRun/lx2160a_build/blob/f57e11707eb4aa5df1908ff64ba52b9f6141ab1f/patches/mc-utils/0001-lx2160acex7-add-8x10G-dual-40G-and-dual-100G-DPL-DPC.patch#L832
[4] https://github.com/SolidRun/lx2160a_build/blob/develop-ls-6.6.52-2.2.0/patches/mc-utils/0001-add-solidrun-lx2160-cex7-based-clearfog-cx-dpl-dpc.patch
