Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793629212;
	b=zXUYHDvJ9y1IwCNAePDDwvFcb//sVD79n554TQHmkMnQkiM++BO3x3lBIcJHH21NWsPz
	 /3xg4XPL7Kornk2LPhwZuph2YAZeDKk099DIUcnzBytMMNkzzvdPW6zVmzc9MFPxk1B7W
	 oZWe5jjHKFnGbIDgPJ/TzjJa/5jtqUotp8Ch7ytwqXKSOJQSRM3NTNaFLqEDajheeeTKV
	 Z0HVZ+qdbxTB557Q+XWe11vmZ40a4gg+PL0llpoUKYmKCJmCJ4sG4BEU0mS7jOq/UDqlH
	 PvT4XQ738iz8ekWTdbWix6PDBqm1LF8eFHBop1mWtoO4vV24BUFOz42PZ3ZYMZjLQQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629212;
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
	bh=BKsRbIoZauHnLrrGvOgY+upKmWm9Y73L52yoc0JQ1f0=;
	b=pnyS/Uatslt0VcoKoREt7N8RHTb5AaPVeHNj7wH9BQom4joB8tDHE1smyCsO6XSAtL24
	 FL+Gt/ZNuNhwfFd88wDvNWv1PHoc8Nu6Ok2Yd8v638ME4g0HtlTACHF3pNsG8i7yfu381
	 eOeL/INa57zd3nNIv7/7+VrOSG4EvV2/sflLU30BhaMw5G2p6bHBuOzhuZRLap4r51WSe
	 8DMObc1u1p9uKvjg8eJb6GZh3j6wsDbSgguE5/o5mUzW8ngTQAzsXdP5c9DUtKKPo4Slc
	 /Z0qHWk3ZUbu6WgyyOmtU9sXPJ+jZO9gisjymqcUKZfJSlYo1F51pd4tju8Vll+6kwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=UzS31tEx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.69
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013069.outbound.protection.outlook.com [52.101.83.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B985E606A324
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 14:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B985E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=UzS31tEx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTTcisyaxgKW+SNKiirXaYqJ2oa1d+9B4WRrHrH57TxoiCwnzVDMTapewdHehp05B8NoxnWRgdxf6AzWYe5ZGACUS7yC++DbGqaOj49JDLWAFWWrr3wMl8mjRrCKkg58LLKLvH2b2I5PFOJASLYQgR1Iln2h0vV7O/Vs4sM7FKgAe35AuUf2P22GNJPxFSdfJ6ARGbP8w/fpD1URG/ShqA2IEf6QHt3SNFJKl3ykbwikB39Rec+WxNz2Q0gRyPdAXa6Txgbk2DrtJlGaX/m73lUesUbv+ow9tV2BClv5L2bwlTuMgNgeAP8SFld0hlxvzSgtgkAXCiuF6UcmcIyADA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKsRbIoZauHnLrrGvOgY+upKmWm9Y73L52yoc0JQ1f0=;
 b=mP2pu8bul1UDWieeu33mItLLqzUaSbsAY2U3IPfzx/jOxg736uJCJe8QL0QwhU07q9GHy2BmquDSE8RiBTHQXfcqHQgkFxn6ZqHxJG+AOQgTzdS2F0EvanGCPguaURl5mjhyqOqzGbzh8VqHAWniASx+PfyPpJcUQ9oqJSdqRvvx2Cv9C5jWQJ0ajSPMhRHzUDe785ldnqHQWqnGygm7Do/AY0FghlXswnEoJB4GciSGc88XS8jJLSI1jgNcrlp/Spiw1DcucDGADOGx+uVSKZuSHYYtX93Mo2W7NOt9N32v4m4PcZRrkUts5UXfwOj4MVRQp4l/Cx8YZaCv+a/RSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKsRbIoZauHnLrrGvOgY+upKmWm9Y73L52yoc0JQ1f0=;
 b=UzS31tExN7anj7B1KyAoja4lgVHvVmGwuiNJn7b891o/X+3WhgedE8BFJQnaqrEWgt2OIMYfbE+lR6k4swPNmYBbVA1noLrwrFokaYidHbReuj+Gb+zA16U5csRww4MDXfR5Ni+jD+R5jkTdOJt7xvm3wSvAgy8/t+RJsK9vX30k7A76qUzdw3P/R7rtHmvWjZ9dLNYExEepA5fDRXVNZxyM2KxGiDrRHpWlt9TMsXJUdKwpY4r+spGQLDTJHmu09TdozuwQwz92UneVNuQNaCmS0YUOf7T1cMq1CRuZDNPSqoSDfS/eQfLsmS+5PaAemNhUxzRBioihRfvYcKn3mA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17) by GV2PR04MB11709.eurprd04.prod.outlook.com
 (2603:10a6:150:2fe::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:20:07 +0000
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8]) by MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 14:20:07 +0000
Date: Mon, 2 Nov 2026 16:20:03 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Vincent Jardin <vjardin@free.fr>
Cc: Oliver Smith <osmith@sysmocom.de>, Fabio Estevam <festevam@gmail.com>, 
	imx@lists.linux.dev
Subject: Re: No network for SolidRun LX2160A Clearfog CX with kernel 6.12.113
Message-ID: <z2q7u34spdhyiqhrkem4b64fvdwnnbodgwzj4rynuepqyrym5q@nuy2zhhlqgpu>
References: <d074d5b8-7b86-454d-b948-83530fa82e97@sysmocom.de>
 <CAOMZO5Arqfat5nO5Hi9Dq0TogvGAvmNLChE_8WrDGrNy1ha2Qg@mail.gmail.com>
 <auSrssMDb33JZVN5@L30177.local>
 <c4e8595b-1dcc-4fa9-9a9f-b23be2d79462@sysmocom.de>
 <auX-VA8xlqSwLYGj@L30177.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auX-VA8xlqSwLYGj@L30177.local>
X-ClientProxiedBy: FR4P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::12) To MI9PR04MB019273.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI9PR04MB019273:EE_|GV2PR04MB11709:EE_
X-MS-Office365-Filtering-Correlation-Id: 13cb37c4-14de-4875-a591-08df38ec6516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|6133799003|18002099003|22082099003|56012099006|10067099003|261009223027099003|261022105027099003|261021121427099003|261022075727099003|4143699003|11063799006|261028144727099003|261026140227099003|261026121527099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	FebSW//suPcwxCqe0WqwCY/PgRKZkh5RNRdQrFTyUf9FHMZP+R9dbbnxYgOgLypXJtIEcehKUzZyZ7yM/+x4M7qJGQS1rO6Q3HrMznp5C7OI842mpFvjvcP1/2ornZih7Or90tnTm6h2MpQ4YXRvblVStO2Yi+WpEx28+dJLye2saPl8HuA3m37zOe9ucDoKXBXeWGeOggbUBa1yPmlOHB/3ueVR3J1gSj7Yn4DriKh1qtExr6x8pxIyBPN1CEZqp63pxj1w4qMi+ecIUkghhrek3x/gxGo7MYgZ+QDwwef9CDtCkvZR0sAsqbNROKcO4gwUPNo+yrnltT2zw41WOXbSpfhWcaMZKW3UfIzWTArYVDvmyTRrruNwseRoRxkUFJSZua4matQNwTulfT1CytO/zy+iyz3SoG0Y3HvrisIdDxCsgX/xQdrfGbUuwGB1dtghfqE98F/2EVwpFX4qTdoVQLVeYv7+XzKNA4TmORWWc/1kHorD4n7vRai2yTIsuUkAKtp0o7DYWnRVYd9xn+XsIWbCq0urinIRKZN8xV+v1P/Fu+Np8m1TxETxhnjQSQnj3+G4gl70+fSWtZi/DSy8yNoKoNx4HF7lmnVDeLQsjBIHKFyEps+ASvcju5D0qhlbupT2Bli0blhq8zUJv58E3BSuzkQIpXeZmQajGfY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB019273.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(6133799003)(18002099003)(22082099003)(56012099006)(10067099003)(261009223027099003)(261022105027099003)(261021121427099003)(261022075727099003)(4143699003)(11063799006)(261028144727099003)(261026140227099003)(261026121527099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ExCoL+L48GT342otWSZp6NFGvtFY/1awMD5tbhSv0twpv6sP5G1R18E1Afws?=
 =?us-ascii?Q?UOKMM9BoUBwbn5tRpsgtZT7MRO61ykAGX+kUa/WOIZfq80cFkAn6E/ve5P9s?=
 =?us-ascii?Q?AmMQDmT9To4t7iOgFilYPogkZ/Gxp+wZxVLANHI3Zlsw71gHVyplmtmhgENg?=
 =?us-ascii?Q?tVqe4+PqWhZuTGCtJAU60Lcu+JpKhBSs6ZTy046rfW6Qf6mIRgRclXoa22aQ?=
 =?us-ascii?Q?dov7MglC9dRWXMoiMEp3lpMFJ5k3iSkN+R7ODDWiVg4vsq0O5KN95m0UlBWu?=
 =?us-ascii?Q?KP7GZwsrbBH7sx+0wYPFfNtdcOz6UEt5P9LB+tVJyCfiEAZHHYrMxZEuHfif?=
 =?us-ascii?Q?uPPTObhHcCg2eyx548LfH/mzWlshcFwJwsrNSh5bDqd9nG+os86MJHezmfbD?=
 =?us-ascii?Q?yhciL3dHEcnctbLlO+5F+lsWTXthEyyFf19L8J2ZHh9HLf//v/Ns7tqItDh2?=
 =?us-ascii?Q?n7WPUUba4cEXsfRyPX/SdpXSj6ZyFlEfXMTQFoAYCKIOr74nh+h1AV6Cq842?=
 =?us-ascii?Q?DDbOvZ7ChePwLasPlr3R9wsRoMz0C+XXdbdCk3HLxYIghU0bf/A2r1rw4EDN?=
 =?us-ascii?Q?4OR4fnI4Ak2hAKOzrLd1n66GtYn1Lhi250Vz/SR8FsINCAdRRlB78QvYKgJJ?=
 =?us-ascii?Q?ZxvMwym601jKA/q3/EWyRLwDlsn6c19pQpq6tPUYq9oRsmfgctECSIbl694d?=
 =?us-ascii?Q?7qZGPyJZZbfh9dMuQ8s5dth0GLNZR+Ac1aJ00otu2fR1IV7kxlyu16PT3SLw?=
 =?us-ascii?Q?RSLoii+YYHNKupGJ3WC09vzGpjvxpc36RfJmfPK7WyMAvcNR04Cniogd7Z24?=
 =?us-ascii?Q?8w3kg5V0lvsGl6gGEIjoZjrHdvD9NJBDD2tbkrSgSNCBTU9giK4iarCiZiIi?=
 =?us-ascii?Q?+1KuGxX4jhs1iQxz8gnjIjAKeR4k6WQRDQ2sP7y2a2EFSGjlRrBcls48W+up?=
 =?us-ascii?Q?3Kqb1H4O3hkWVhNDdbtrh5XLxkeZbJk+Hz22y0B9S8ZP8BW3ybVKEMsCTrj3?=
 =?us-ascii?Q?7TT7ybZZXd93dcB3mbLj2si3TLGyDWC7I6c9kZRE5FrPMMw6sZJF/Y50yTgK?=
 =?us-ascii?Q?1DD4qw3yfDlJsYJTxdvn34yaod4pVLPbAic5DygIMuaC/7/EPnvawamq6Y1f?=
 =?us-ascii?Q?oDh4/P0s13Km2+nl+sPs1YLvphBxtAJG9i3nuqH26hNRFyuKprrYDGuePyTF?=
 =?us-ascii?Q?Y9Qxd5z5eUo7wKhjqaaXxeWWGGICLoWuLDL160QjPHvDXtK5LMJhK+XZA/dF?=
 =?us-ascii?Q?dt59KSQk9X42RpTrE/i8JL/xZW6uUAmXE0JYHM+PPmxUG7hWAc6HYxefmrmd?=
 =?us-ascii?Q?nSLHPFxNus2MBkK1xKtC0vPw0y8KflEkpIRHjVYXNlNhkw7jE/uUN3VCprEl?=
 =?us-ascii?Q?nindTR+MV78JFweLMvvSyJidT/LDGz9HSNU2F9HO4R0quXZgsNWHvpFlekcp?=
 =?us-ascii?Q?/BYHx4XERB8PPCfNKSNRdP9JmxlipOB1UZMRZ6HPVGxIbtBPLm38xyxSRD1G?=
 =?us-ascii?Q?puxJ+Ks/wOQr3ifv5DE1jjgk5SIcMPPNqHwW4jjRQVG7/VTyLHFaTQHjv+Mo?=
 =?us-ascii?Q?VvuGlV8AhboKfgyxP8uEpToBwkGdsfBW5/czMUpbi1NWOXFbTNi+Esp0fP8a?=
 =?us-ascii?Q?ufhTjQ5h0OFKh396D2IfacX2+oqmAcE74DC7GEam4oiv7qAOfLCu5qqYfkuY?=
 =?us-ascii?Q?lLZMdoE8s/l/QApXllU6Ulx2nDzg116Rvl2fyWBpcp2YlqklbB7544k4GN/t?=
 =?us-ascii?Q?KW5nlEnP6Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13cb37c4-14de-4875-a591-08df38ec6516
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB019273.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 14:20:06.9960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BxZPGhISCp9QQAxBTRXdD7UvSA9JuZi7TGmiY8QKQL4y5DCgEh54Ngso83WxvSNFMuamnbzaKIdcMetnR331Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11709

On Sat, Oct 31, 2026 at 03:42:28PM +0100, Vincent Jardin wrote:
> Hi Ioana,

Hi Vincent,

> 
> Can you have a look ? 
> 
> It seems to be related to the backport of:
>   https://lore.kernel.org/all/20260401144508.3062019-1-ioana.ciornei@nxp.com/

This patch should only prevent the fsl-mc bus to probe if the firmware
ran into an error in its boot process or if it's still creating the
DPAA2 objects requested through the DPL (layout) file.

Based on the GSR value, it seems that the system in question was running
into a DPL processing error even before the update in Linux kernel:

	root@lx2-1:~# busybox devmem 0x08340008 32
	0x0000003F

The 0x3F value means "MC layout process error".

Please look into the MC firmware's log. It should help in determining
what exactly is not ok in the DPL file processing.

	$ cat /dev/dpaa2_mc_console

The dpaa2_mc_console device file should be created even if the fsl-mc
bus failed to probe. In case you encounter any problems from Linux
prompt, the same log can be retrieved from the u-boot prompt:

	=> fsl_mc dump_log

But the command above should be issued once the DPL file is applied, not
before it.

> 
> I do not understand the backport flow of the kernel: it was not flagged as a
> fix so I do not understand how it landed into Oliver's 6.12 kernel.
> 

There is a script / process called AUTOSEL which selects patches from
the mainline tree to be backported to LTS kernels. This is happening
even though there is no Fixes tag in the initial commit.

	https://lwn.net/ml/all/aBj_SEgFTXfrPVuj@lappy/

Ioana
