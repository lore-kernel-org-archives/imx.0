Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795194494;
	b=FSHps2PQFxUuwBjpIihqTvGTlbqLj4N49mbOYjW3pKpbpAzsn1ZQHSbedEcvczuCmR6X
	 j29Z8gE42rW4gBo2q3xjSs2HDiESao9wBQTeqWCAsp51OLnGrhRdS+cHIKk357Y0LGG2w
	 R8BXw/Jm4x6dWnNVQ4XP9saydqppw4Q2osI88LRKoqQeSmGsQBKBSDvmm+jfXgK5/jASQ
	 U5pk3zqxOWtb8RlHEFLPsqAUMjRbZ9/lxisZyYg+zgk/jjiYq4lVt2NlF7hEf7+6CDNHQ
	 62ajqIO1ENBFq+BiHQvht+tbRDIb3+2CRlyJKYEw9x4NzOvxku5dnWzUX2EVrvfnYXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194494;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=73kSPIhjwHR+t6uQutBhZdY29OusxG8GZPqjN35maIw=;
	b=Xy/+p24sDe5/dv1RnPIAGWVD1bZVeuHmuKSZxFGmd1h69B4yJu9lW8X0qstkMhKG2E6z
	 L/DApH7A7zKSvyyY4dbn8Hdw3t0QF/7ZxLFthrN3JkwPNjfgZuYj7wYm1u4J9LapVGYKy
	 iWt5iFopxUjoa4dvAVF15ORjdjyxkUinVEgDr3l2/9wsERcF9aVT3hY3X/zQQPUFSH5Us
	 5idejbjLIWol6CPCeGxlIGmXIEQA4lX9R+M24ZQwoyfg97v5CkAvdgKi3/dum9wmWlkRz
	 sccl0299MrRl2ppyWDoV3B2IN2EGq6ej/luejLJMsY1BCbBnIw1AjHcU+8tKfivoxeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=BH7TorCz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.53
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013053.outbound.protection.outlook.com [40.107.159.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDAD606A32A
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 17:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BDAD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=BH7TorCz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJEgIb2GHBiY9AmWjs96u3XJjUKaE3MATn4eOXifKqccZEjQcB1LppfAr8XgpWgqiyZ9zHnZw+zLBDLOmKtJWWv1xTToFleskUv5ib46xSHjmElW/AgMzaL0ILY/GjoYz1LMZuwm2c8oRd99Qb53Pn4ubVviwL8PsJMsKT2D6jMLLZfrtUOaaiKfEEE4BDpoZ0HCMYdByiCLHjNW31wemGOMYOV5P/q26Fe/BwuSpXxIKz6cAo46S+VldobIt2WVMFmS5k3dWG/kJozK0PRjZWvNxhZRQK6BrtX5JBtuDt8E/oRcE79eZf5z/zQDNqEbxx4Zmgf8xwivaqFS2Ci1fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73kSPIhjwHR+t6uQutBhZdY29OusxG8GZPqjN35maIw=;
 b=qnd4+NTCivwTIkLm1J/v1ZmykIi+kKvyeDXHCjTOtzKof/B4brV0+HBzw7olFoDB4IJEE2+xvvz5Zuq4HHLXEV2Gi0GtqLykT51EaTaM76E6vZ76gmPm9SG8udJz9Z5oWDh9TfDukOYJyezIKeOlPXPasUPb1XVrIz4kE963nx7XfByEjyZADSE3S7SSIFxqPrwzCm59qcVgPS+AH4LHHcEzS/z5ELW5J8XPR18EHVIzYrUFwaciOdyDLD7IlzPl3PNd/bYb6V/SPDhh5ztq33vvboRJbwBxEj0ny8hx5603EMGO4/jpLfSYw9O6deR3X3i82uHG9brotObCsxTZNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73kSPIhjwHR+t6uQutBhZdY29OusxG8GZPqjN35maIw=;
 b=BH7TorCzW4uuSod6YuxkJJ6Jz7zmduFUPiCuqhSCSBpm+UviLGvPWCNkJgF0x3JHWfW0A7auklkbHY9saf0aL4JlTka33PKT3PvxRqc5M/10TxK7ruNIHKNhALQKvlnIPw//nJVFiJjChieL1VeBYvbXrUQrQIRIXg5lsGgmCBh1JqUCJvKnOE/dFz1tla/mLqJzcw4SDWaua5CQv/YKyjmLK7b9jAapIUrDCKP/zCmVqh0uNOrsI7d57KXbFjhREqayPrU9Qa+fsg0CZeokFgjJtvdwQwY5TBUPdF7+5Ffs5geP6JeJ5cEEBiNd2cWR7ZuPc/c/hWbk/iLZzbJrBw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DBBPR04MB7513.eurprd04.prod.outlook.com (2603:10a6:10:20a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 17:08:11 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 17:08:10 +0000
Date: Fri, 20 Nov 2026 11:07:59 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: imx8mp-var: Add Cortex-M7
 support
Message-ID: <awB-b1P9sX1FwNeT@SMW015318>
References: <20261120143241.17297-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120143241.17297-1-stefano.r@variscite.com>
X-ClientProxiedBy: PH0P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::29) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DBBPR04MB7513:EE_
X-MS-Office365-Filtering-Correlation-Id: c6ed6024-550a-42fa-899f-08df4728daec
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|23010399003|7416014|376014|366016|22082099003|6133799003|18002099003|261009223027099003|261009221227099003|3023799007|13003099007|56012099006|261022075727099003|10067099003|11063799006|261102123227099003|261021121427099003|261021135927099003;
X-Microsoft-Antispam-Message-Info:
 6kRsnfRl6DeX0LrZ4XhnxZynj8XyMRc+NANZP+CW2zAWDZd9DXxRXWQhKUpsszWl8Kvg8ga0/dqm0IX6wl1n0UfPgg/bZSwZz4hZcqbDl4/p6/p8pxoUIDFuyk9wuqM2u8XWMk80y2mjEn0pK0LfXhHYq2yDMjI4CQESRBLzYla83m2OH6LfuhIZ+r9tPLG6YqMHcn2pLxZbWS1h+rjzylhyRI5It3sJ6j4WeU60XE6RMfbaxWFOBtEi0J1iNqWrT2Ic5evKmRtPtzhiTeu2G2HYX27pv7ZPgiOtfpkrqwc5okCpuo2HHtq6/NR7LZsh6r9To3alSYtGUVt8LVqN714PNjGss1F+Xz/Ix8K+KuiiZO/VRcNglk0nqJiySefV/lA/sEK0/OYEh59GqkcmbTwYcq+uRoBjPS7hKemXOGMN7XhIO2iBR2joE165/1Y/nCID0mv3nt6sSOKk8oxn/maOmohYryqhUZR7xWbWZciNMIuwdMgDRGeNgTVtXY/NHrRY63tZiW//pf5XdVtPhGD5sg3Voj13B0bViuCN33KvhMh8K65oEj3o/Y2lFfjM8P+nLBrYU1WuQSRgEdiMg4QCQ0kLdBEA6qGo+9mPyrk=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(7416014)(376014)(366016)(22082099003)(6133799003)(18002099003)(261009223027099003)(261009221227099003)(3023799007)(13003099007)(56012099006)(261022075727099003)(10067099003)(11063799006)(261102123227099003)(261021121427099003)(261021135927099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?9xIC3RSCg1QIxe6gTL9chnwB0QoHeIuoNVktIPYA0aIu8CGp2Cp1iKNhM3WR?=
 =?us-ascii?Q?LL/QO1PCuTV3vCeKVLqsXbrW8H63tF3urY8yCW+/uhiGshL9nCBcZC3rnbHM?=
 =?us-ascii?Q?7mazinvWDdNwznVGaarz7L10QLexvY/2FHayblzrv4y7fPg4JT2W2CEN79Ai?=
 =?us-ascii?Q?tuMgC2GNMhJtxwPlIqFIzJeG6/533tQLIg3iswQ2+i9bGSWyINmoGFf4dJSY?=
 =?us-ascii?Q?/82Kbd2YQ7qx0RweZUn1DjYJYtXRlqNXbCULHClzQxKzE51sR33zRFqAuzcN?=
 =?us-ascii?Q?CAb7ey8rpCZLKilDzvm62feK2158r063fL93/twBhOV3VTAJpnJY8G6hiMqJ?=
 =?us-ascii?Q?7/GAcm3pbLpxsI50pGf4VpzW63a+Qp337oxCPgKJgB/jsojDTmLEWvWKCc1F?=
 =?us-ascii?Q?U6jagN5Q2VoMR7BpsOFTK8FLJPD+h4XTGTmAPxSU9q+ROlZu9rIEa31Yyuj8?=
 =?us-ascii?Q?iPFNmV6IDZKTcOPF4b1Zi8uRKqEheod/v9V+AdbX5x0PcZtK+Blwq5sIz/xM?=
 =?us-ascii?Q?/vUUHfrYECEm3T7kbys42KddIsye1AW/nETvVDxnMrPUxkGQoHLVcWAvgACv?=
 =?us-ascii?Q?eKBaZHtiI7DUpfsewa9b//sLEQhlebwIZY20KzgT7Vq+f2EQEcvzej2b2yfP?=
 =?us-ascii?Q?URdmVbRIE+rx0W+aLr+q5F1zwsooB8bKFEqeyw41R+gcVK/YyI40XnrJjrIk?=
 =?us-ascii?Q?SK5c8RmR5BycHI58NLLylNSqN3mSdOYKL9veGSLEbB2ZZeueXj0eVlezlCQb?=
 =?us-ascii?Q?KzK63Gm3wW/qmklflSl2tehc7TLnS45JnmQoKm1xScZuwH9sP8l0l3KcIL8t?=
 =?us-ascii?Q?35Th8kK1RqAFWJr8Ex6qjnfP9uD85lkvpBKDLy1ITxdeA/QQNsqw5A2K6m8Q?=
 =?us-ascii?Q?qatP1rREbKJp5+u6W++FnENCOkTLoL9vcI2LyJI4CLqrLMQ6Z4szkReajaqq?=
 =?us-ascii?Q?r37hBIXkZP+Lc3LzVbvNfawtuIQ5nWu5M5Zy1vz+Cv5wi/r9WingExriOByl?=
 =?us-ascii?Q?+D25/SSupBOMEsG/9KVnXkML1UwLxR45wFt6DJnkNLYefK3+7kZYWdpfOXqg?=
 =?us-ascii?Q?4ZEtxfpVOCmPXMO4SZwgv48pAxtWg9Ye2pH35STz44amsoxS1DbbebujZV68?=
 =?us-ascii?Q?rk3SLdb+9Vqd/gl8PDCAKoTfh4QNlj4OQw8oC8aLyMvv0j3O9KY9WtlVUz6v?=
 =?us-ascii?Q?bW28yJcxCm55Z/FissNaOfrz27axrpkhVSrMttSNxjiJENaW2/911SN8NeE+?=
 =?us-ascii?Q?WKpmLT6XtsRGxHRtWXqaYZRQFAFzBLE4GvF2eyzxt+E4Ho+wB3QKSmnh65iT?=
 =?us-ascii?Q?d1blFUcz8nycUOmYXovTrqDxhtBpFvfl/ipnHT71zTc3MeK5JJYDpxCHq3TU?=
 =?us-ascii?Q?hEsCal1TqdLjD1TKl7mdGYOEiDY9/omXRgFdJ2LTPk28BVRtBHp1IJ1DRkE9?=
 =?us-ascii?Q?Unz6s29kXTeZAH48TVVdWtrkRWYcG4YJRUHg7oiKDfN/CvtWOvaooHMpsuyB?=
 =?us-ascii?Q?9OwQnCKnlhF/ulkXZxDQaLaTiC5vOxp0TtyZGEAg7d4D+P3wVbXD4UcwXMyC?=
 =?us-ascii?Q?3vqcxLyc/AeeuSqA74Kx6R9Hlh7nptKxE6TuSHUMZnTzmb+LFYJpjMgwwavo?=
 =?us-ascii?Q?s1MWp1yAXfPeS81VZeasI1wi04pQSfBf4BBscE0O/15+F/9Ay2KQ8m1ECSHL?=
 =?us-ascii?Q?eho94KbMzy++tiVU6/Qn1Ldw5BLT64S7OjGrWCkOcyZj2xIFaN1YRpWBTobZ?=
 =?us-ascii?Q?h3696g+8zTb1ekv8ezWaguDx2SfhaKr+ryord/01Kkv/Uh10laLi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ed6024-550a-42fa-899f-08df4728daec
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:08:10.9429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msNe0GPWXzS1hCxd7pCQhkOODDzhQglQrBiULB5CVpdZDvokXFAZC2QonJ5/Jk/HW/jp+S+3vQXQcy+fuqunC2rkQsic6XWmhDyO6uXUT8MZdyFl4/n+fm+Urvg0mzBe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7513

On Fri, Nov 20, 2026 at 03:32:41PM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Add Cortex-M7 configurations for DART-MX8M-PLUS on Sonata,
> VAR-SOM-MX8M-PLUS on Symphony and VAR-SMARC-MX8M-PLUS on Echo.
>
> Share the reserved memory and remoteproc configuration through a common
> include, and add board overlays and combined -m7 DTBs for remoteproc and
> RPMsg support.
>
> Mark the UART, I2C, SPI and CAN controllers used by the Cortex-M7 firmware
> with "reserved" status. Disable PCIe on Symphony and USB-C on Echo,
> since their reset and role controllers depend on the I2C buses reserved
> for the M7.
>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        | 13 ++++
>  .../dts/freescale/imx8mp-var-common-m7.dtsi   | 68 +++++++++++++++++++
>  .../freescale/imx8mp-var-dart-sonata-m7.dtso  | 31 +++++++++
>  .../freescale/imx8mp-var-smarc-echo-m7.dtso   | 36 ++++++++++
>  .../freescale/imx8mp-var-som-symphony-m7.dtso | 36 ++++++++++
>  5 files changed, 184 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-common-m7.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata-m7.dtso
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo-m7.dtso
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony-m7.dtso
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index ae28e6b02a5c..3745688a5b4a 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -723,9 +723,22 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb
>
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-ultra-mach-sbc.dtb
> +
> +imx8mp-var-dart-sonata-m7-dtbs := imx8mp-var-dart-sonata.dtb imx8mp-var-dart-sonata-m7.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-dart-sonata.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-dart-sonata-m7.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-dart-sonata-m7.dtbo
> +
> +imx8mp-var-smarc-echo-m7-dtbs := imx8mp-var-smarc-echo.dtb imx8mp-var-smarc-echo-m7.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-smarc-echo.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-smarc-echo-m7.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-smarc-echo-m7.dtbo
> +
> +imx8mp-var-som-symphony-m7-dtbs := imx8mp-var-som-symphony.dtb imx8mp-var-som-symphony-m7.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony-m7.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony-m7.dtbo
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw71xx-2x.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw72xx-2x.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-common-m7.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-common-m7.dtsi
> new file mode 100644
> index 000000000000..9d554a175fbf
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-common-m7.dtsi
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Common Cortex-M7 configuration for Variscite i.MX8M Plus modules
> + *
> + * Link: https://www.variscite.com/
> + *
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
> + *
> + */
> +
> +#include <dt-bindings/clock/imx8mp-clock.h>
> +
> +&{/} {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		vdev0vring0: vdev0vring0@40000000 {
> +			reg = <0 0x40000000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: vdev0vring1@40008000 {
> +			reg = <0 0x40008000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		rsc_table: rsc-table@400ff000 {
> +			reg = <0 0x400ff000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		vdev0buffer: vdev0buffer@40400000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x40400000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		/*
> +		 * Keep this region aligned with the Cortex-M7 DDR region in the
> +		 * boot firmware's RDC configuration.
> +		 *
> +		 * RDC DDR addresses are encoded as:
> +		 * (physical address - 0x40000000) >> 1.
> +		 */
> +		m7_reserved: m7@7b000000 {
> +			reg = <0 0x7b000000 0 0x1000000>;
> +			no-map;
> +		};

because we already use memory-region-names, node name can use common node name
memory@...

Frank
