Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010035.outbound.protection.outlook.com [52.101.84.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DA623A9BD
	for <imx@lists.linux.dev>; Thu,  1 Jan 2026 00:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767227950; cv=fail; b=uAlb3Zzg2VVJOZhUJlARNDdRUI5ZVoAIoFjnPJz1FY7auHyKvFGHfsaKCRqz2tFUsCHWzrwQhQFY3p7HCXlC3N867XFJR9wooLUmJShP/MLexTwEd2GLEJOlCvvExoEmx8Rg9ll9ARWeQxW2HFOSc0HpUnIPRb/9sEUVnM4ZKNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767227950; c=relaxed/simple;
	bh=Jk4g9JEcMvpwy/LDHJxUCkwviz+NVKMNfE234e5yPls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=q18AkxhJbOiTjCbme19oRhvmKhJrDs3IMQQCXbfiDUt3bTHV0375Ba8AAs+hCpX4EwjXI8plzYC9Sn2G6PkNiFC9nq1Q9MssdPL2V9/PPwLoOMhb6cSAYUuVJdlAiXaX7nOXteExnxEwGVU4W816TD9qg8e3tuwMcfTNzZDfMMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hpjDS+nW; arc=fail smtp.client-ip=52.101.84.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hpjDS+nW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFtVJncEaGRxDzLE5fLJFyVrYmBwoIjGmUgqubUmljlIdk5N3hCj53hEQ0+1guar1PuB3tJ7ijGrTdFoTXha/3KtLoEI+JcyKSzNYowtd65H6iIObsq2/6zgvgIrdQq3jerDWxdPBVdxp4dhYFijxCZT7fYX91CWaZ9fvTPEW+VJOsHV4sMFa7hLkNG4BeZfegM9bKSeOg+Ol6aswjT1I94WJHuogHDgun6HkGycOlJajZyxT9ckUgfrNZJZfOI5nnEoInSsZVNe0mtnOe9hjqkWJRoLQx56woF2EN7ivTIRCAlHEWij0Zcp5pgIUg9fsbRmj9UrZ67qTCr9+jP4EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IP4GMUhu1cAV8SFopfcL4wyICRM1PJsgylFhfZnJD4=;
 b=RKZnM/WL1AjLYGuHgv0Lhl4VVArCqp8MZQ5Zun77xpF7ggO2CKtLgx+vNSD3yNKc43eK1x4HuSzHRU5kbEs9MfyWnaizu4EQCjmoxUgaGyiL9XzEezUHVfyGDyT5RHBQX4P3KUkCKwihYy/18kxiyMpOJ7FSUbXaO0UghEp/VXJ5Np42Q4YBJkzAVDnr5G3UcHFe/aEluvShmR4wBqbKYfLWZRutOTmN1MpEoOPNzj4muY+fbW/imFoXpjTfeH54npRLcN/y0oNqurF4nl1Z1Mx3myeOv4qAMObkDJIK5OUC1JgcR4FKtB4leWA/t/rR5Ek6wp/w0bIhxVo739fp3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IP4GMUhu1cAV8SFopfcL4wyICRM1PJsgylFhfZnJD4=;
 b=hpjDS+nW1H9+ntUj2ZydRmwMD0BjA9ZnPngLX9a2YFhLexajzNun1Ge3s7kMFoHK/mTal/GrcT27TsdYa9BurBAZdRwczWMUGmjfWdWiksn0TET1nJ6uszglesnUBKlXpiSawIQ0tpjmNsfAKerZ1Cjghi2tOI09bA8vLdBWsW3SHzZ3owJ1Y4ApC5ZFXP79WR4TIHZ2rZwWZqNdyQDNf1dk9a7nMBYUtzAGmeWk0U7F6tYrSZU7FlAfLnly1wtO5o0c1XLt/QKsuSDnSBs3JRIe6F5z2ay5l2GF+c2GXtrAD2jxpQwy3siybjR26EY0c+PgQfmAt/LnhntnUHskzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10197.eurprd04.prod.outlook.com (2603:10a6:150:1a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 1 Jan
 2026 00:39:01 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.9478.004; Thu, 1 Jan 2026
 00:39:01 +0000
Date: Thu, 1 Jan 2026 08:37:28 +0800
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: jiyu.yang@oss.nxp.com, Frank.Li@nxp.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev,
	jiyu.yang@nxp.com, kernel@pengutronix.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	liviu.dudau@arm.com, marek.vasut@mailbox.org, robh@kernel.org,
	s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH] arm64: dts: imx95: remove CLK_GPUAPB
Message-ID: <aVXByNiEfC66RDG0@oss.nxp.com>
References: <20251231031915.752262-1-jiyu.yang@oss.nxp.com>
 <37489cb7-820d-46cd-a7ea-0f9097604895@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37489cb7-820d-46cd-a7ea-0f9097604895@mailbox.org>
X-ClientProxiedBy: SI1PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10197:EE_
X-MS-Office365-Filtering-Correlation-Id: 63e2a9a4-e0dd-4cb5-6132-08de48ce2855
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|52116014|376014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TJ/xfmnw5zCFTT7AV+0wtlB/nIp2enUS5D/tESAVDwcqafhjFCIt4jYY+OkM?=
 =?us-ascii?Q?87/wnhVwDHPSe4vpniVvs+AST3BnWPjbp8/mNezBngYOPrErDTh57wzNVGyS?=
 =?us-ascii?Q?u8Iz06vaSjKF/CiCO47emDI356LH4g08u4flcfmnKqSrwbtjmPSHyz3m6XP4?=
 =?us-ascii?Q?Z5RVwef7AOvPb4cJE/IM9/85apIZ7+jWUVX4fViIpDXVzsPn3zak7ZyUZrM/?=
 =?us-ascii?Q?855MrWyx0rkVoboLwhBEquNkECQaONRnrPIi+V4cRBYHqd9Fb247veX3kq4K?=
 =?us-ascii?Q?ee2zDtX51hO66+3jFHCHTquEOywmxMTj8Lx2PnUA+XIw3ZXAF+o1HisE/9n4?=
 =?us-ascii?Q?mn3QX6CQ1xgi62zHLiQTdn8YL5zaEAUEdEHBxdkD8XoJtop7VFvUcVDGna+1?=
 =?us-ascii?Q?gaoNB/v4ArU2w9NQN//KW9vFBorm6S+NGvK04Jlixe9txMzk5vh8o52ydj72?=
 =?us-ascii?Q?duAgzFn73cnIN86Njh3cwyrL4h0c45NISRfP4oluOoWs3QYAhXaeu0i0/B/p?=
 =?us-ascii?Q?gj5F5GFPWIi2rtR7YSNfMQc6rgQmA7/X1sBK2GCsKkoiBarAvuuvIuIOpWGX?=
 =?us-ascii?Q?QTYjyp0MztA6TUkdfDxl3jeL9epR3HoZ+V9Fxh7xLENXMY1WkEudrHGUKV7H?=
 =?us-ascii?Q?YJKg/1Hp87LDEyAKaiGed53VqRAOBliaOyrwbDGsQawfnfrEwZLQRBv6lMBg?=
 =?us-ascii?Q?MTt85+dwGMA5QVSAPAWRWew2YMdlqffaiMwYCdXFC9vPO62iS6/Z2MM+fXW8?=
 =?us-ascii?Q?RmfcXdS00snGsfX22/wCmfsyH8YRV+XvVTOx5WjmQnUC0eOeYeem30EDYpDM?=
 =?us-ascii?Q?nWtYbHISa/NhwQzpW+IzQDi4Mlg8W+L+KZQ3O5TvYR0zMNKpFuwUXAKh/ZN1?=
 =?us-ascii?Q?CaqWKe+LCWXgGjUFrlKmSc99/lFAwJ8fvm9xPDS8oivzpOr5E6nHjxN8SR7t?=
 =?us-ascii?Q?UGo6Yg0YSalevG1czyN9OQPbbvWyaUVQQdiru9lYNLWACqVbRrqfdKQ0EuYn?=
 =?us-ascii?Q?n/QZBtE6IvmkWvhE1vprYCqLJjPk+Uj5FqNjr6StRCMPhQQNKUD9gs1IuGo8?=
 =?us-ascii?Q?SAwAqX3nX8Ek5EjTq7rUluiwaW4nbHtWj7G/yyZwuCQH2gIZDwq9HJbl1fwz?=
 =?us-ascii?Q?Gk4ZGwy45zEspyiaVcRqNGqmnPXbElpUXwZQYDX7VTu60YOdtcAzWAEmK20J?=
 =?us-ascii?Q?XaRN9zxm0pVsKalPRgE3zd5y+at76gZtoNGxeRfzcnmheezOKIMDAl4LnKmy?=
 =?us-ascii?Q?QlFSMlzNl8NrpeE0WS33tvkXg+ERu5NPzkTwcfpNfQ2DrON42/zgAw+u13bZ?=
 =?us-ascii?Q?TXkMJAsCSl55cg7UjD02ts0yDiZ8vwxH1PeosYFElqkdnJuS8q3wx/HVU0P+?=
 =?us-ascii?Q?vpTCSk8Wk22kjry5H24HbAWXMFxJ8jOTqAhJBlJbRrlYFdTW3nk2foto6aQ6?=
 =?us-ascii?Q?ePZAhhXC1deWheZx/9qUl6uOUaV/Lt61+APqIvbyu746cbvK8Ialj2Q2jYq8?=
 =?us-ascii?Q?wDGdIOBd+rV3881tcL5FqMYRcI9bwSiqjrWo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(52116014)(376014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P3qJ30TeS2PvIGicRctx2+KTvt6XjznXek4PV9xFnikqUJY1zkANwjizjEH6?=
 =?us-ascii?Q?gyqBS+6RGnYsF/16gHegD6Y/7+9+Pw5H3WRbG0cSGpHxxvkkTSjKrwnZvZkQ?=
 =?us-ascii?Q?tnVpXUUV3fVjB/w+byJewzzKUAFuQ1TCZ7AO0HknP/ghvirG9FB9DU/ftoSi?=
 =?us-ascii?Q?1oh1IEJGRPmupVKDlry+lSyuq/A0++kXwd6bcFmMwqAytzYkkoWXaWKvETbq?=
 =?us-ascii?Q?RoRDmWxefInJWQ352/IE/GrZI3eLUC4S72POEbfe1zIXs5DnC0S8H2b3JtLA?=
 =?us-ascii?Q?lLHUzpdiDTv9kgUeqV1NHYFcAzsFnq4NeIx4iZX/uOt6qNcT44hX0+z/yVrk?=
 =?us-ascii?Q?9vGNJIQ/30Uy+kdjd2iqjkTSDCtmZLkimeNArgrgsG0FhDhas6FvjVD5a3p6?=
 =?us-ascii?Q?Vjn+31sbaKsNufapz2HXvdLKDdYbBVrUq3gwcQkT5N8FVpBDdazl7Cl/cNS7?=
 =?us-ascii?Q?7PyEMvXTZfSnOk2n8cvgemnfpphdX7xu1A2zFzYD/ovZA8YedpxxRJ95LD0O?=
 =?us-ascii?Q?1Hf75ZhlPX03cs3i6fnLTPMjSdb742b/mFQ23A5bR5DqQaqlR0BeutlLJnnc?=
 =?us-ascii?Q?78dSQZjvlO6n6eVNRUuKKq+EGx5sXzVCvzoalBJ1ygQIwbJo/m+cXW6lmR/W?=
 =?us-ascii?Q?jftc0hAkaNa/HDVK6lF5VltXqcN7TO0HGHiZ4Qd+/U4gKMn0UNfUSAGsCx69?=
 =?us-ascii?Q?lrd74/cfw1OI63cL6f76TwYHJjaV/W3BUXWFiqhoLDrCofppLD4mMQbJLiSJ?=
 =?us-ascii?Q?QvgiUGZ3FYqBPgSm35eECy2pQcgUH3TXwmH8lqbM025kOnog8+sFo5HzLG8u?=
 =?us-ascii?Q?kZX0OUG5WofPsM/EWiO7n3+7/Ysg9FeEeq7tij41tF0jCkPMlumXw9AQGBVw?=
 =?us-ascii?Q?mA11/+Ok2qjBaGR2DB/csrTCd7ujc6vvxcz3bpjX920s/1T0hKMfMwQF7JAJ?=
 =?us-ascii?Q?u5OFk2rWoXHW9l1JpXWYf+k/a0rwadQmsHCuRDJM4ZOUuzifac4L8Gyuz+TO?=
 =?us-ascii?Q?DugX2wa+md4PMiO0JifIIbVO+Sg+l/DQJNAFzMnIdWl85roqjPleuSth0NyK?=
 =?us-ascii?Q?jIvR8DrskdCGnFjrOBkN/70hAm65EFQVZng2RCURi+WwDY6v3Ynwu7E0nBuL?=
 =?us-ascii?Q?d8oZAkoPFj/dBSAKT8uwOj6dkytIACu4hL7h/tUKUKMhAWHLVdK4hj/ynNAq?=
 =?us-ascii?Q?aNlnyL5gPFb4sTIkvpwLl+U8QfosBYUCGhbt1S3AL1HIIke3K+FVyrrsaqMY?=
 =?us-ascii?Q?1RVo7UgVC5PkRDaf6R6y5KU8MXRAMm22qCz5V4LrURIC5koob3gcez1ZhUzK?=
 =?us-ascii?Q?VPzD5le1h403LzwNELpWBitllhQ8KJcC1I+OaR+VL9jPnuFPl7wgCcEwsFrX?=
 =?us-ascii?Q?0x6dVi8WHX6ZL59GJooYsxC+9O5hkpcu/gED+w2QGcX5ormZS9pi3oaWzJH7?=
 =?us-ascii?Q?IyJeoVCMG61GGoT6HEpNalcYN5kTz2dvNKbzAL1JnszuMFMOt69QVvMOD17N?=
 =?us-ascii?Q?twB55CZIH5nG+1sRkr0xhTNvCPekNb+rbTfsDmqUr9foiOscgjXe3PsSwxfE?=
 =?us-ascii?Q?Elwd+kcZeoXwPrT/I3KyIeHPbfBpD0NwzQ8Xg3/JEAnXc6Xe5TkcsLcRhza9?=
 =?us-ascii?Q?P3cbeJZ72ibeOfrWwhUANZhm9Yp4G6yJLY711yAZ0S6zmJls2Jc97yl4E8Uz?=
 =?us-ascii?Q?rVVyxO+A6J/U1GdWWbcAj1R10p3QhdskEeqCyjq+mitegther4xNVS7tO1IG?=
 =?us-ascii?Q?+KtVHcR+9Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e2a9a4-e0dd-4cb5-6132-08de48ce2855
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 00:39:01.5303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2OH0mLiEoUta4GWWb0OntNs+gPwJlhlzvqJBvzrUfu56dceMWNMjuigIPxMIx6Or0eqsVA2VEkmbz8kcfzdjSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10197

On Wed, Dec 31, 2025 at 03:11:21PM +0100, Marek Vasut wrote:
>On 12/31/25 4:19 AM, Rain Yang wrote:
>> From: Rain Yang <jiyu.yang@nxp.com>
>> 
>> Dropping CLK_GPUAPB simplifies OPP handling and avoids unnecessary
>> complexity.
>> 
>> Fixes: 67934f248e64 ("arm64: dts: imx95: Describe Mali G310 GPU")
>> Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
>> ---
>>   arch/arm64/boot/dts/freescale/imx95.dtsi | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> index 88bde59e61b2..ab446aa6f73c 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> @@ -2164,8 +2164,8 @@ netc_emdio: mdio@0,0 {
>>   		gpu: gpu@4d900000 {
>>   			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
>>   			reg = <0 0x4d900000 0 0x480000>;
>> -			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>, <&scmi_clk IMX95_CLK_GPUAPB>;
>> -			clock-names = "core", "coregroup";
>> +			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>;
>> +			clock-names = "core";
>
>I don't think this is correct, SM can disable the GPUAPB clock from the SM
>monitor:
>
>>$ clock.w gpuapb off
>
>Linux has to make sure the GPUAPB clock are enabled to access the GPU
>register, hence the clock have to be described in DT.
Hi Marek,

CLK_GPU and CLK_GPUAPB can only be controlled internally by the SM, not by Linux.
CLK_GPUAPB always runs at a fixed frequency, does not require dynamic adjustment,
and is practically always on.
Additionally, CLK_GPUAPB's frequency is absent from all OPP entries. Removing it
could simplify OPP handling logic and reduce unnecessary complexity.
