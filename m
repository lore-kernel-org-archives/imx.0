Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011012.outbound.protection.outlook.com [40.107.130.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ED83F8891
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 18:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789153140; cv=fail; b=p5cn21ef+fqgoDGgA45BkZde0/T1QMKXkU/0yNPHivMAAhrqsAFqzWeuoAwJvVQMrd2INQmwy92D39gGuAtAM8weQ5vCTldI78MSlkxSi+sSP7E3s9cuEDzisquhImUKY4vF+R59slR7/CuS0uFc4dePguUwWPqbQZWtZav4n+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789153140; c=relaxed/simple;
	bh=0RNRdxxyWmNBwvvaRzwB7to6+CH7PZcYaH+o4sAYitA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TFjzVFfXB3UwSa/1jrDbKdB0HM2o/i3BwQVPo1bbr7IBIw3Wm0Rzxh/i0d4UwfvNXzMG9aRcATSxfPPPUVCZb5453IdO96u1olsGXrI8/tSW7vHfolF7DGcaal3DaX6t0U4kqmFooBCfZDSrb6EMBntiCJKHfDz0bs/+A4amTPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TwsKw1rC; arc=fail smtp.client-ip=40.107.130.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TwsKw1rC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDNtuLlpNz/VkRiwvmrhS2mlQ5XujEAtJaxbY1sebmLUZ2wSQotuLyHQflD7Xl4TQ3vOYpo5R9jKLPlrrhCxBwYBCxj32lhdfyAMcL+KUBm/qiztV5qhVjNujn/KeLbAivrSKrX5Qpa8fh4b67EVY2GkQIuunQASYGpnQzFkhQHhBN0BmZZIQyjFHjOg07p2YnJ8eWl9buC2/JLYQXcajd6dtAD07Hoz+gVKjHHgKNC7n1DEiDWRC5v+dQvgbvfzvG678u4bJLilSGhScq9qBHwL5lg4cmA7UF0TqL0G65y1KFkYm3GAcl5BfBVBPNC1ErbECt22CCOvP6AxOh6PHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xryDBrHehA326pyEDqns7Vf/KC2XudfjAy+Fx6mxjdU=;
 b=YDc2etG5NzJf39xPJwwVqbMLJStKrCuFHfmmMMf2z4sWJmqjZdMQx2FwJIacUA0Qj/Dyce3FGAWKM67iLTEnbCpALV9Z8Snqo1S9xXKelZavHDUCQrJOGksS1N3/80QdgHKTTBu9x3xqbK7z63xj1S6s7MNBedbPC5pCVq3dApgxqJ6iyfwmPGP6MJKQcbKaL4LJ6ldqRgl9yJivMfj6aQ5BqlkUdbCDJIUhaLnTjAhS9PmdiZnSsMyJsLhWl76dBwylhDL8HeE0L97n1jFtAYCgkq0ogIvhSAtUvRfmF7l9nCKHM/o+MWssh8cJ+yAXvbpDxKH6blG/I+C17Q7iFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xryDBrHehA326pyEDqns7Vf/KC2XudfjAy+Fx6mxjdU=;
 b=TwsKw1rCQ1M+QRBgOYT5qAXR/s46A7JgtC3ROEFfXM+uPJpHN0nYIwPdRiyX1bHBi4GC9rP7OBk0iOL7XUQnssvL4iqOvVqF5w04OQ+ZMAMKCUhwWHF9ZPvuzNdQU+HWI2vFR6hG0M7GcETcqqt84vR+V9yFS+eKhY+YXQKNXHdzBMgjNMiTO2ASbevZLH+9BuGWaSY4+oyGYuCnIsHgZ8wuqa0M6e3RNp/wDGnOPLiepyz7j7aC4pgWs49iD+hMWx+4qrAU4bzNaEh/ECQZzFGpwQV8vUMhSi5vhFoyR3AeCgAgCdrF1LT9lafNPmuFUeWxjd/kckiGcpRzQHmtuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA2PR04MB10409.eurprd04.prod.outlook.com (2603:10a6:102:415::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 18:58:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 18:58:53 +0000
Date: Fri, 11 Sep 2026 14:58:47 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Bratiranjan Acharya <bratiranjan11@gmail.com>
Cc: aisheng.dong@nxp.com, peng.fan@nxp.com, pankaj.gupta@nxp.com,
	ping.bai@nxp.com, imx@lists.linux.dev
Subject: Re: [PATCH v2] soc: imx: imx93_lpm: return -EPROBE_DEFER when SE
 firmware not ready
Message-ID: <aqRPZ4IwfsKYYS6o@lizhi-Precision-Tower-5810>
References: <6a97fdc4.d9789fc0.362adc.c4f2@mx.google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a97fdc4.d9789fc0.362adc.c4f2@mx.google.com>
X-ClientProxiedBy: CY5PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:930:1e::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA2PR04MB10409:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d12254-9a51-47a9-5725-08df1036b96b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|23010399003|366016|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GctqQ7acBJOQhGOvfwuNCwQjPAGDV/feMZqhV7hayqi88mWOlErmHPT0SlPnNBljj0A/umCai6urmwfwrDhips2kZU4kFChqScRYNM1ZwxaM3UBlP89nykjYwSrtIsOUt9M+4rLvTnbKW1D0grYZ7IghRyaguIYRYiQ0J7FXd754N4Qe/z6jYmkaeDF2AVZ2jU2V2n/UdmPwGx/8GM8JClrcfF4hhRFws4BJox65ojGddrcqnhSRVs9FkiEh3ohR1S+zpcR2EdW5CPf5BcwR2evVuGsoabr1qptkWT9DZJWxErfXpqUD5TrJaxAq2HfV8Zyu8LFCmQaMxHKpyixXgMPzEJjTY2JXKo5GHzaHe0gIDSZubaSfoMqRPmBRwcqLOt3LFHd0BumMkncM7aHoJGTyhXjzo5anINL5QRpPqIZPcmzpPuJgCFaS6ziw7Vr8L0/PiZnwZ3vXrKb0QvW+iXxbUk9nkzXXOedH326l9MjZRMsnJ+FpOTIzqJ33wVrHAKnZnaLgkG0Mt3hWhwg1QXmCoX0ZEiAAeOHNsHXG9Q0B3it0fQGns5TkZ+1nIdUFF+ZFFLAx9DbfD29HgdqzwzIyJJgOINejPUkXk/Vbx8NciBlrds62g7N5WEVTPOeN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(23010399003)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cFh+vYluAkkH8eShrTREeDzOPq482RxKUqhxdIM5Rh3MBKaDNGoc8bO2Luu0?=
 =?us-ascii?Q?ArpB4yx124oEPvSpn2FYMOF/bDuVioiBbWVrrMrFm1ttLVRCxjMzhghPDNWK?=
 =?us-ascii?Q?1s79d3WgV1DYZxynQ/vYWhFsGE+eXPKjPnKICmZIY7nkcUFBvX3zPwtPqAx1?=
 =?us-ascii?Q?tA5T19Yw6I6zogtH3aApTXj98wZEnPtoh6DyKRQabPZROnP7TqU/4haJFPji?=
 =?us-ascii?Q?8rHwbkk/TPvTO/NDrgPA1WZ9gvtKD/4YpX/nly2PZJv4Cw2dYwZ33BlInU1M?=
 =?us-ascii?Q?BU9rvZpSfc35TVUSnEXJrhKzJkedr55VKjrOzzYhWpzKTX6ov1hp6qyw8WoC?=
 =?us-ascii?Q?Vmg7g+9iozdtGKVzr+DEE1Z1c9MBpLVvKIynwqe8h0PVLsJxAglDo0fcqQIh?=
 =?us-ascii?Q?KOpiA1tFFpr3OM4LaReV1mamfvdEY9sGGwBhCL5UK4P9WHhhdoHxNlZrXlWH?=
 =?us-ascii?Q?ARKiI/Qi5zQQzpsRH2eXzWIdL10jCBBT5f8GVOILoeHrIeJmBuuKO0lrLOXy?=
 =?us-ascii?Q?e3MHHD1q4PawTn6LoWoWc9NEitgfC4CvhnXqgNzhmoETHt4OafZStpbsRxss?=
 =?us-ascii?Q?0UZ4RQJMyDNn2nj64LgMqf3F0CbSDdRvo3v8ZtS2EOI5KKtNwnet2PRj4LbO?=
 =?us-ascii?Q?awLRQzgB6oE1LeJnt/NFRieLnB+/mtKNoAyqX91a5DrJ6fDff6JDxez7gIT3?=
 =?us-ascii?Q?V+Q01dYyzpp6y+EmXXxQ6FbcdrhnORXYu1KlHAQRTAjTRj1dNw/hAPVjZbuZ?=
 =?us-ascii?Q?ADXzQPuOEg5kVfc3x6UoWmmm8NuQlsjRaAoxtM1qcBTwQ2XvIXBQNOSQ74L0?=
 =?us-ascii?Q?5zMBBkutxnCm8Q9ud/pu1lNCpKm0M5uaR1Bbcj135VqysLxf4QAgCd+P5SBs?=
 =?us-ascii?Q?6lgI3mV7FvHXyEcGlsGLWK/eukZQUlMRvm/1RThA6q81RCIIOPkayqkBMrXf?=
 =?us-ascii?Q?G0ZWrPYEQYMeWN+neOAFq30eGb7zcX3Brf0uynr+E44czhfdIOFEVCtHtmDq?=
 =?us-ascii?Q?klJg1tDUSr8im9d1NDWw26CzWIzmPh552JaG52T3b9D8M6wpJ8cPVWkrASp3?=
 =?us-ascii?Q?wqaliiOJU+g/hK/S7Yl6PIt5bI4kERZ7kdqOhVMZSY2VMT1J7KevbVOkZzAR?=
 =?us-ascii?Q?PqLRUwvLMDvAhNjw23Qd+ziSLLoQMSpym5Q8EDbc3A0Ubk4yWJSSf4ht68AJ?=
 =?us-ascii?Q?7fyD6wMI+6GmRv8P+4wwOXWGpIrmgO16qIEwOArwMkasQ0Te87GqunWLSxjb?=
 =?us-ascii?Q?wEkS/cUR9NYg7IGnQGxVNy2MyebbrjnkXU11hqyX9czaqlxE7cl3uVWp6cNK?=
 =?us-ascii?Q?qUbEzJmdgtjcpVvWiH3O+gE0/HhidmpbKWwdEbYSNndGG3VrJZDs7X2hv4lX?=
 =?us-ascii?Q?RnRxk/1A9j6W79a0jmGkvgZ3e8tu7VT3oDDrYDOS3ZXAQ0uBOoMJd/8V4JDr?=
 =?us-ascii?Q?t1ANfi79FdbOPYz96shrY7fvfoeuyO0321vXgDfsq3El6xuYrZYDmbEhFaMp?=
 =?us-ascii?Q?Yy1KmyLAcWFi+Pbmn3+gjXDtbV/nCSwLlRIxKwcyrV3Z1RB4F6aP3GWhhXEt?=
 =?us-ascii?Q?sAqL4yJ7grUtDXC79l4wQkaIrJXzw2EUC3XU3B8GVwTJm/XEjrFcFoRETXzM?=
 =?us-ascii?Q?kO5zP8UespY5OF6VIhjDWXUiuwj/zdjr/MzLD82/GOuknPtwdPiKahROM005?=
 =?us-ascii?Q?+XU881rCWNnhWlvZt+yP6LA5F+DxJSXMBFTqvem4W0fVfEVy1Da1Kn3dw1HB?=
 =?us-ascii?Q?Aj2BguMeVqrSXQHCcXTDhXScKqMv307OI+48Fd7uuRep7n99Vfp9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d12254-9a51-47a9-5725-08df1036b96b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 18:58:53.8021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zL+9qubRt1GRqJvjs8lsAOhjvezLlSGlIZeP3BzX7laggee1rxvh7vK+5WOBnCV+vCWFOchoF5oQhpq3iAwwqhVZYmxMwHGy1qEGp+6cpKyrD8ecMwoeusymVJuV9AfJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10409

On Wed, Sep 02, 2026 at 03:43:16AM -0700, Bratiranjan Acharya wrote:
> imx_get_se_data_info() returns NULL during early boot because the
> EdgeLock Enclave firmware takes ~900ms to register its services.
> Returning -ENODEV here permanently drops the driver with no retry,
> leaving DDR DVFS and lpm-cooling non-functional.
>
> Return -EPROBE_DEFER so the driver retries once SE firmware is up.
>
> Tested on i.MX93: probe defers once, succeeds on retry, lpm-cooling
> and DDR frequency scaling both operational.
>
> Fixes: 711990e353bb ("LF-13910: soc: imx93: lpm changes to update exported apis")
> Signed-off-by: Bratiranjan Acharya <bacharya@enphaseenergy.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
> v2: Add Reviewed-by from Peng Fan
>  drivers/soc/imx/imx93_lpm.c | 2 +-

I have seen this file at upstream tree

https://elixir.bootlin.com/linux/v7.3-rc1/source/drivers/soc/imx

Frank
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/imx/imx93_lpm.c b/drivers/soc/imx/imx93_lpm.c
> index bfa52ff8f..26d72e3e2 100644
> --- a/drivers/soc/imx/imx93_lpm.c
> +++ b/drivers/soc/imx/imx93_lpm.c
> @@ -621,7 +621,7 @@ static int imx93_lpm_probe(struct platform_device *pdev)
>  	se_data = imx_get_se_data_info(SOC_ID_OF_IMX93, 0);
>  	if (!se_data) {
>  		dev_err(&pdev->dev, "get se-fw2 failed\n");
> -		return -ENODEV;
> +		return -EPROBE_DEFER;
>  	}
>
>  	/*
> --
> 2.34.1
