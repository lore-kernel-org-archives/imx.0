Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010017.outbound.protection.outlook.com [52.101.69.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ADE192B90
	for <imx@lists.linux.dev>; Tue, 29 Oct 2024 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730215763; cv=fail; b=LLCU4LPZ7pK9egDOgO9L34k6wWU+7Mb1H+Dn5lS8N8yOkueI6oDTi81NY9UPr/Vo5DxcPK2QA0lJoaQT5l2aOnDwFHcWsnCm70S4qiCdsRedpPAcBVR47rGIrFoMDXh0eXWe1rZJgMq7Tm8uQ/dAX27hhc8AHu0FSbe1ByEJs9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730215763; c=relaxed/simple;
	bh=1cgHWRT/KROfICvjMP2YGpeunTfyoO/J6i6q1yu0JQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KaWWi3jaCVwUtDems/onUsWz51rWAnJcSCGk77/1VLmkSnje6KFtiQFX+rJpzl1dqKIVxcS8TnIXKHE/Hmv+FBA+3iNn273ibscm9z3FgxY8Wo24zMxC5k732Wj/Ylftw650ofpqjHpqmrYV5VDiRUXv069bbywCrWOCWyINQBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YAI5Sg5l reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YAI5Sg5l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDde32vS/vy8SGwaF57mFkFsNRkz7x59ftxgxR5dNnVA6BdFIn+dxghTRrmLSfnFn7cFk6dcJ7PTPh5tMfOagPMsVqXtHdrlNyCcEGiS117LVm4utt6BIicTR6swCdjHNsBmPFpHQ15dMl/giQheUW6K7W+HGEHzOBsPZrNw3+2rmw+9ABXK9MEqrhZcWD7ihyd8+YflcB/MY47MkpSoiq7+J7Mb45pJPEHD1WQ8Uc6SpU08Px8NueS3L7nGzTADiVtwgCvKxzq9I83n3xO/w2RAIl1BdgcqWnsXjO+epypN725mGdyhnHXrBmwKJFJBnWgUeQrB4tMua+zQF06JfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVCWYpn0PR3BAGmDpI5pA8fwFnoMasdqcwCegHpQiVA=;
 b=DHltA9pqs+gpJjWNAaHgw+1nDOcXujtHQEtHpe/ErQykvzJhQ3VAkdktSJexyji1mtv4iU/5KCp9TGGCWPC4zw9SW8dRtuyw2N4ZzwVmvmE6E8LR+EzRlAK2LE3QnUMr4bkS+sOATJwZkjGTOV5UadQKqy2kCxI/nAQLr2BmIc8L4M1YAeZjLGyYwnxBKRGovziczWzKk3huyzqYSqNPncflaApxvX/etbIZOU7LZzX5TAe3/XJ2CBZwsOOla2iHXhrmwMLCQcyw/03Kaysy1lALOXqqM3IiTAIZoVOfW2q1TFJmWTKEBzt5JM6tRlA4S/DfExg9V+sfHyjG4EXFeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVCWYpn0PR3BAGmDpI5pA8fwFnoMasdqcwCegHpQiVA=;
 b=YAI5Sg5lXysUFduJBOtFtb4KKCqUvdh57E/+Yq2XxX02O9TqXGc1RQBbFgJNz0j7dHhqiHTYzCP6I3wnxk6rWyHVTcDr6aEhTpPgA2zI2w+qRnz8KVDVmUO8xcZQ85Ymu4q+lTV+8h0MAKlg6cABkloLTMOz0JBVXfVNsHDhNF/71XSjsu5UEkLsDRf5lWYfHDyxwmM35UfLLVUFI73Tb+GUxRHc8AJIXDgEiAY/pYFx6g/cP2Qp0bbfqWCjikdHxXAIroDlZ8qNPBz6nSzxVzzMx+GgJSRI5OisdrOoc3ZQEIveInq0wpsVXr8Zn9jW6+J/4xEqHqn0vs9uG8TqDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GVXPR04MB10407.eurprd04.prod.outlook.com (2603:10a6:150:1e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Tue, 29 Oct
 2024 15:29:16 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%3]) with mapi id 15.20.8093.027; Tue, 29 Oct 2024
 15:29:16 +0000
Date: Tue, 29 Oct 2024 11:29:07 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Vinod Koul <vkoul@kernel.org>, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	Xu Yang <xu.yang_2@nxp.com>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/5] dtbs_check warning clean up against
 fsl,mxs-usbphy.yaml
Message-ID: <ZyD/QzKS7xqQ2QF8@lizhi-Precision-Tower-5810>
References: <20240926073951.783869-1-xu.yang_2@nxp.com>
 <172917937246.288841.15901592420939223719.b4-ty@kernel.org>
 <6099458.lOV4Wx5bFT@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6099458.lOV4Wx5bFT@steina-w>
X-ClientProxiedBy: BYAPR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:a03:100::28) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GVXPR04MB10407:EE_
X-MS-Office365-Filtering-Correlation-Id: c3c99c27-dca2-4c72-9f61-08dcf82e7324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?nfwqJKWh20wJ/UflonCQqGSnw+Z+MvHyzm7eg1vBItEQi4olYrvKYBu7g+?=
 =?iso-8859-1?Q?0XtbjSCsAX9IVw+fqgVGmCl+NwdMPza97btJgqjSV/STjzDneClBOiTrFP?=
 =?iso-8859-1?Q?D0zWESQdg3CEJe3P//fC+qKgTvZD1HgqEfE0xuQrroIHSWtPYgvL0Np/cQ?=
 =?iso-8859-1?Q?zwEr1aAvhhZ0BVWukOL5DouSEQpueR2xThsa4bOgHljO839CXOfT+3OVh0?=
 =?iso-8859-1?Q?zRXg0KeddGahHkjVrbk99RxPemT66Vx32PkGwkLAL/jJDMyo7AX/CAsKPo?=
 =?iso-8859-1?Q?nfCnpxhhV14yBs3ZffCaN0YTItmRysTH/zTGYwENlhfNuET9bT/EBb0j62?=
 =?iso-8859-1?Q?37Bg5slYCX1ZYDBpm6VAA37624y5fluZbBrFXBp5kwGVR1uokmc47TDYKt?=
 =?iso-8859-1?Q?JPMP3n1+wCqOZ4OLg8Ov/9EvPe/vRf6ro7GESqXEbGrF4Ynr+5cMbDumyQ?=
 =?iso-8859-1?Q?l6TMzrMm0GO0w+dZWoGoSKqsOOx6g478LGMoV4K29uqMf0/dWS101lE7gq?=
 =?iso-8859-1?Q?AZirRtF7RWizImOQWMmsLJgZ1HoOx88dvTHOByBSvUvGS0fgXK1UhTFnyI?=
 =?iso-8859-1?Q?92ZqZ9x70cMe7kMjTid8vY5BfqwqtrhCgz7UfjILttLNhFVjIm/tDU8UHO?=
 =?iso-8859-1?Q?t/mghiDyfQMRP5x+8n9HNOX1beNVmO9tSBsh076ak38+jPTt14Stw9Fdtp?=
 =?iso-8859-1?Q?jMuJEfZ54Qe3m4fmIFjxnTr4P8teJyDyaS57T5hK8+IpXX7WqCnf7HgVR4?=
 =?iso-8859-1?Q?Hj0eCYX6AOT1Q4o71f9cWVoi4Yo4Ed6pL2WlPXIWMUlEaPN4E+0fAo6CEi?=
 =?iso-8859-1?Q?PqPHtsY0X0rXHqI8SExP6hQZTJJCs4NVCtwKLWoT0AXqiDrQgTQmGotLzl?=
 =?iso-8859-1?Q?3dedyXFHM5hcBNEBaP9f6+wysA0v4wUHQFyNynF3P8FmpPmXmgE1xHsO79?=
 =?iso-8859-1?Q?1vZ5dNG4EYSJPCDK8OgrdqEAcnro4Z0+dmGsyhX7Dj045zFzSru+iBUeX9?=
 =?iso-8859-1?Q?EXClT+qMFZDdOfPWKJamBd4A+GEMbkyoytI6gNZb+kI2dLYqJKFn8MYf9f?=
 =?iso-8859-1?Q?9sh1+PH9H/fU87bw/AGuRAUuE18J6zfvahXFGYb9i8c02UrM2EUwcJy4w4?=
 =?iso-8859-1?Q?lIU1cAgKa6L6uG35iNJOFT0j9kaST2uZFoJo6umLR/fXse5MuFFnzfZDAD?=
 =?iso-8859-1?Q?58HRkZUrC4v0ttTEAlPFyicRSZwhRRXUn5rRABIQPHLgyFvmSGE/wfObP8?=
 =?iso-8859-1?Q?9XM3zo8eSoFHtBceraH0ihVQ+i4QFOi0a1X1R6y7ToEgeiweREx6xhZ1cb?=
 =?iso-8859-1?Q?1jWw3DfSsyCGzh2xC/uQKf3oUtXyHs7+NktT2BtWH+J6zn6E/LrFI8atsB?=
 =?iso-8859-1?Q?ADJyrhujYu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?/Cz8oN0t4jVV/d9kXGmj458Hjrx/apAVRQSyBsb6rlwsUxrAMEv1wMKnT9?=
 =?iso-8859-1?Q?OTM3MrIQlLKB7C07cAEcgH5nf04mHdu0EoEXSljVJwjlsdm+vhfmu+rGat?=
 =?iso-8859-1?Q?GXmJLpG/uVuPcD6cBReZsbfmNCz9YsIDXqDREJdWWp2w7iGvZ0/CukJhY/?=
 =?iso-8859-1?Q?c4jB0/eDMsQbSV+tCRRI9aGJZqCG6LZcnQLjCdt1Ocf1N5oq+DW4j2YxbP?=
 =?iso-8859-1?Q?1sFbZTwtbWn07hOJXrSqm9MobPqfLVJdJyNhYZ9KqLeZwyhW+ZK9aqn38k?=
 =?iso-8859-1?Q?PGJErnF0z9RYrSzV86v7if/sYEUOp/EA22BfSHymj2A8wc/IEWNb++yKNh?=
 =?iso-8859-1?Q?/Q8AY5LRdLfm+5OS+hJ1TamfPAw1JUpaCEd+JydsPJo3L7YX54CG4mTR17?=
 =?iso-8859-1?Q?Z5/keoUSBIW/xGHdFYiZ41al4v8+jNipcOSWgUgRL13iJd/w/9CDSsrBIB?=
 =?iso-8859-1?Q?pUzDv2MNV4uEDJ+4YB5H0GrLPUeiMrVSLKi8nyQcuJUOd/4CUlUcBq29Fg?=
 =?iso-8859-1?Q?afHtl8fDqRGiI+fIGPY+WFLv4wjvwWxr0pSb22tvrMLSrT6LHtEWwcmb4+?=
 =?iso-8859-1?Q?To+SfGOV451OLGA/LX0UPYqrL9AGcTXc2SAdRMTJjXfEriC2zqiz1Kopqk?=
 =?iso-8859-1?Q?O5pPzNJECQRNyV9DTraHG9o8RKknsypu6xghQNJZZHyVux5gvGBxr/ZQ8c?=
 =?iso-8859-1?Q?BV0VV/Xy5fM7I+ItLY6ykhOjtaMfAYwnlSfIOPDZU5ZkxXkPK81QzTWp0t?=
 =?iso-8859-1?Q?yH5hAW92CFIwocIzvFfwvPCpCQmc1dZkvN0gED4kG0yVQi9KsHPA5OwM7/?=
 =?iso-8859-1?Q?KUv+Z6cz0hCo9qR1JUPJJw/jk5Vf2bTj+lOprTDEu7VQDsQVny+rdYm5MU?=
 =?iso-8859-1?Q?dynsQ8v39q25kRFa3gwFIXA2hxF5ddqNode/IzPmFdexx/B+BR+TMEpRTh?=
 =?iso-8859-1?Q?FRZgRZVRpyBHi/+OnvT3IntzEiRXapM42sIiLvcutMFzIlhNreo06VN4OM?=
 =?iso-8859-1?Q?ORM6phAJO2VhVjZVtbNbQzDx/Tq1clWbJHvHj7Hc+QhJdAtdxBvLw7/M9C?=
 =?iso-8859-1?Q?5NlHT/5k9q6jXa9oGAABOXF3IYVarIeiyY5MfDiTwfs+ij9di1NjRz1ePo?=
 =?iso-8859-1?Q?FaAqQ6FTGv7HG5X1w69BZVniuPsNOriICWtad+CaeLJBO5KDxifmB/YxDT?=
 =?iso-8859-1?Q?7wrcU2qOMKZ6Iwd/D+xDXO7wHwa20wfWCrKUPDfqwe8DDOFYgjG9+jkpdL?=
 =?iso-8859-1?Q?0BoH0qBgyGcN1K7TfSsGLcM8ykn+Opzm5B1qp1rVmZsKFou/DFqegIzOlN?=
 =?iso-8859-1?Q?KawxswZ2PK8jkzsPw+wW49nZy91N2TtlggSFhvqQS7U/3h+YJgw8JHe6Z1?=
 =?iso-8859-1?Q?g6+1Ng4svOS1TvfzLOpa+FDacI1sET+wV903rqDn0bsrJzx6a1EKvw0evL?=
 =?iso-8859-1?Q?YXZZnRek6WYPiTVInBGyHYV2fv67kHYl8+mGzMTdhLILuhP9nzLmo7qhF6?=
 =?iso-8859-1?Q?1LHl3vNCV17R+3xSmCLkB8E+X7lX4gmZ7D+lBEDXNXbrLJYbroWCev4ofU?=
 =?iso-8859-1?Q?ER7xevp79qouYpJKoN40wLVxyPnGkz5gIRJ5RgzlKlSAdO5kAAFIGu1ChA?=
 =?iso-8859-1?Q?iy3VOH214svwxccMAFu4OYVxy4OBiP7pFU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c99c27-dca2-4c72-9f61-08dcf82e7324
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 15:29:16.5172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lu4C0G2LkvmkzvOgVMW3v6M2Cg+hlCCqwsr5XjvMHbZyFWC2jtwmhLp3dsdsbQx7wZ5mHdoxHV7vQS25DbNYzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10407

On Tue, Oct 29, 2024 at 04:15:54PM +0100, Alexander Stein wrote:
> Hi Vinod,
>
> Am Donnerstag, 17. Oktober 2024, 17:36:12 CET schrieb Vinod Koul:
> >
> > On Thu, 26 Sep 2024 15:39:46 +0800, Xu Yang wrote:
> > > Some changes to clean up dtbs_check warning against fsl,mxs-usbphy.yaml.
> > >
> > > The first 4 patches are used to fix below warning, "nxp,sim" is only
> > > needed by i.MX7ULP:
> > >  - 'nxp,sim' is a required property
> > >
> > > The last patch is used to fix below warning:
> > >  - fsl,tx-d-cal: 5 is less than the minimum of 79
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/5] dt-bindings: phy: mxs-usb-phy: add imx8qxp compatible
> >       commit: 76b4f2a5cec59e842de4b5989eb990a2ee8cedf3
> > [2/5] arm64: dts: imx8dxl-ss-conn: change usbphy1 compatible
> >       (no commit info)
> > [3/5] arm64: dts: imx8qm: change usbphy1 compatible
> >       (no commit info)
> > [4/5] arm64: dts: imx8qxp: change usbphy1 compatible
> >       (no commit info)
> > [5/5] ARM: dts: imx6qdl: convert fsl,tx-d-cal to correct value
> >       (no commit info)
>
> Did maybe something go wrong while merging? Only patch 1 has a commit SHA1
> in this mail.
> Also only patch 1 is available in linux-next

Supposed script report issue. Only dt-bindings go to through DMA tree.
Other dts should go through shawn's tree.

Still wait for shawn pick dts patches.

Frank

>
> Thanks and best regards,
> Alexander
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>
>
