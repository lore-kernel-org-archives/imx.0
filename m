Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021103.outbound.protection.outlook.com [52.101.65.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E088D313523
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 13:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772199120; cv=fail; b=fiXxJjvN7qRDjQRtjBx6nn83swkZlEWnn9KNVyOy2AO+gbNeffdUfdnY6tc/+1PP6WYiGxr482nOtYH9KwOqbftufPhzIlg33ud0bccqmdLDMws70MiubWjBi1ZmmWhG43YfTdZ6ARo+jkAqY+kL4Aihm6IjC6kuXwOBNbR/0kc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772199120; c=relaxed/simple;
	bh=0cZ35jnt3Mju6WUfiLfU6V4Trn2EHL881wF5FD6xFyc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qZQlliHySFASlORk6FctqmAfAT0mkX+CLkQccS9pXrRVAi3v1/BQSKvmFuzQNJLwkAA2V+pMJDUCD6/qCV/5u71Hk0skQju9K2tW/AgfhnQhom6nzoLcviGRZ3yy/I/qH3sHo5H0IbMdl3C6wV7SBTU49szV93qGd0b4YuqY2Ng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com; spf=pass smtp.mailfrom=gocontroll.com; dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b=U3PS6DxI; arc=fail smtp.client-ip=52.101.65.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="U3PS6DxI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlVB9fuYLQCULspYv7pGVooDOdw8GhHppBGmsAGmejhPt5GM3fRvArCY7SJTtfatQpPBVZUPWG5Hzo6dlnm6RCxw2P01d2nyuF2r/O/uvElVdwzo4KVlj2USbZv/aj122Oq9cph7Hs0aE+V5RDtjSn6ZkyzhP5qVyjd8fnCrVht+IcHRKbcWXABpBpOOotfp88lRrvslA/IDQKttCY94cDV8blrJfmAGvxeCnfiAFK0vAYnMcRlrcAUSBSJkU9al+yo2INMPQeqWFUBR8oPav4jc+XnqDvCvceBLk18ilhSzrLeb7YcJlGAPWejp3sE77qNGQWoNqASEs962FhXosQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bd0XOmklJLOxVYlUPkJ/wGSjsxgSJBm5DGy2rP9zxw4=;
 b=B9Ec5svLhC8xzG9tH03xV//FxP6AtjTEmmvUXDmzXAt8NMbZ2ZtAX+GMnCB0VKMV4CZ4Djqo17WtDrg4d/ylqaQ5pdbS+ZRZBEI0GNu3hd3BkEWvEyEWi/o9n0pYznZD1j8B6ERUlrNT7VQHJWQYHS+FQ6eGm/dvI8sXYZgRR9i6yspJluoF6jx8hxhA77aufIL7pwE8O9F8XI77x2u4v6RQFQ19Jw8u4jPGsDsjf2aWvYID8IEiI+GcGiAGIyss+d9fO/vtxa2Z7CdaY+wH4flOsJj4yM2YJnT3uIFhGARGtpcwmz7e4wzN+8oAtjINhR3W79bkUOsgGmhQKKQvzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bd0XOmklJLOxVYlUPkJ/wGSjsxgSJBm5DGy2rP9zxw4=;
 b=U3PS6DxIU8aSLJipCObx7izkw/L8znAkrvcvLvPLcq8A4yXGbRqYJ3RwI11goyGdHYIk8QfC9AYlHnjT6U/SfncT2DWOSby8/pPoo1xVsCWYLhcaZhmraWRw4JXIF7oHLEhot3OykEoDSQ+0wANJlxnT07FjYnm9niqdaDQ7cjBmpvT5bi38QbCmpqkVzEzT93AwNjf1U3Mfq4Gj7LOxfCeSPVCtFESXtK9hKrf7rNQGCIn5oCvl1ceT6ZIaDRlSb1WYfF9529LRvvCYUxcTvDMbjT/QWNl6iVQNIYrPPhUtbXJrTrgIQe8Zckx7OUfu5I24NDrLlgX0PlTq9wWOxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::7)
 by AM7PR04MB6807.eurprd04.prod.outlook.com (2603:10a6:20b:104::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 27 Feb
 2026 13:31:54 +0000
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::ee70:7a62:e9f:12b7]) by AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::ee70:7a62:e9f:12b7%7]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 13:31:54 +0000
Message-ID: <fd765ddd-9124-4add-a6e1-d11d8b5f3d06@gocontroll.com>
Date: Fri, 27 Feb 2026 14:31:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] arm64: dts: imx8mp: Make MX8MP_I2C_DEFAULT
 independent on drive strength
To: Daniel Baluta <daniel.baluta@nxp.com>, Frank.Li@nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260227130242.1702329-1-daniel.baluta@nxp.com>
 <20260227130242.1702329-2-daniel.baluta@nxp.com>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20260227130242.1702329-2-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0058.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::38) To AMBPR04MB11741.eurprd04.prod.outlook.com
 (2603:10a6:20b:6f3::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB11741:EE_|AM7PR04MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: 47074eeb-8529-4137-a62e-08de76049240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	VwZ/gvaALRPfpvZt+CWe336cCaWRa0t1owAkrxc+RdFwS4XY5ROjWDUOXI1cnYy+OeULOXAUFdrvio4AN1pTky01La3ivXOKo9x6D07A9bBD7sYLI0DvKkuvT2afAM/6uxZkDmiIIHad04jsEiYD65G8dWH9UhvEbRC11N4piGw7tB7+mXsDH+Hk8KzMVGyZcgQBHNOa2AMgiMP1hAnbsdAyPb9CglE368dq/b+nkMEzspmDeeTenyGXlCTNDAr7+za4+9qYM7QtFBj6sBr/kZgm5E77g9J3qDuAM8OtRKd8UC8TLWA56jWrTQYNy1tV7aXh/xSEEi8TyEHoTsHfIlmzPCghKquyZRINiPArfb9cCL6klwCdA90xwhONFt/VpAF2/ygqQLbtZfhwQYW//T/sU+9JaxUbNVd/JaZ7jHNuS5Pyi7+jLjxL5yl5l7q5X2ejPK+vJ4RRyo/6htjHFDvPdCmRW+gqxiiNR1gsf67NXFRh0HzGWT8wFetfNZ0TY7GAsAOhnCXXrVI4IJCA/G3ZfaZ5fnd1baKn/jYG6TseQpzenZKwfq3r8MUaxxdbJE7q7UxGn34bgz+UWv+QUs7sZbJO72d+DVyYSjChOcULEEmbD93iHwzYLttYdpZZgujv+tJbTIGtcT990gzaQ610XG7XmqHM5PDhSXTBVyqGA4+EXscd8eOf0hOEWjDd9bM7TxipGblNFS6tcZv4NHZ3JUgkblJCdGlkfAzFUuw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB11741.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFhXRjJaSklxemdEaGJnaWtxejcyN3o1THI4eVd6VTJhNTZ1eEQrMklKam00?=
 =?utf-8?B?YmlhZEFmZXBUYkFqQVhqSzZiSXBnSGt5aU5kVzJ5cjRFR0s4QmhaVkIvY0xn?=
 =?utf-8?B?cmdpN3N5VmFTWXpjaEppK1FXcUZjdW11THloMUF0akxqQ3FEUUZwdnpoL1E5?=
 =?utf-8?B?RS9YNkZMT0lHWmNiUXBucm1PS1Y0RENSZkVmMmNTa3RmR2dyU1dyLy8rTHVX?=
 =?utf-8?B?blVONUk4aXU5cGJzL3F5NmZQVGpJcE1oaWV4a1Uya1JEaklWTDMxU2RYUzk0?=
 =?utf-8?B?THgxZGppT2g1ZXV5WkNEL2NjMUFUWHQyZVJpRlJlSXBjVVNreXY4U1lCQmlE?=
 =?utf-8?B?bXh3Wit5d2tpbXhNdC95NG5mRlNwbmlhY0owbThBTUUweGVHWEIwcWxyUmpL?=
 =?utf-8?B?R2RPZUlKQzJ3K1N3OWJPOTJCcGFnalhIVFl5MzdwVCtZSU8wenNUTEdlTHEr?=
 =?utf-8?B?ZW41RjNWOXhRUnVwVUZ1Q1JPajM5QWZVbUVEcXc0UHpBUi94cFlsejFqWGli?=
 =?utf-8?B?ai9uYTFQQzRTbXllYjEzZXh5S0NiQjRVQUdJY0hJaTErTFNwRkk4dFRuWGdZ?=
 =?utf-8?B?NFA5SCsyVXFmNDVlT3pKaE43NTg3VHFZZHQ5cUVnVTV0MkVJL3FCcjFxcXRM?=
 =?utf-8?B?emF0em9SM1Q1QkVmdG9NMVFET3FYZWh4QklMV0UwdFl5YndVc1dFMjNKZ1RD?=
 =?utf-8?B?dGpzZjF2RVY4ZTdxOGZSZmQrTnVNVUNBdTgzMUcxMVZuSDNwdER4UVcvSWFX?=
 =?utf-8?B?Nzh1Uzc2UG8wUzhpZFR2bEp1eExPN2t2ejlFRFQzakU4S012TkNuY0xDR2R4?=
 =?utf-8?B?WW1WTHZqR0NUQkY2OHlidG02Ui9HUWxXN2xFK3Y3ejBhTTYzbjlNTm0xbzV3?=
 =?utf-8?B?Y2hHK29xbzNrS1VVS0FUVTk1b1dSUjVWbWNLNUdSak5jV1ZWOG5EcVQ4U2Z0?=
 =?utf-8?B?WVFNVFptRUFaaGNGNktIc0FQc1BWZGRBWjA2eEQzN2JFb0NtTDQrVjZmM3N2?=
 =?utf-8?B?eHJrbThwNldKck9yNFpib20ySFI4aXpqNld1Q3prTFkrRUFnd1NxSkQ2U3NZ?=
 =?utf-8?B?dkdTajhTNS92aUJQT2Z5ZDltQWFiNVVVL2Q3M0Rnc1J4ZHdVQS9HSXFnLysx?=
 =?utf-8?B?NXk4QkhUeTByTW1TakNrWFZtZzNlMzMwUFlVQlcxRmVsajNleGUxM1ZXM3l1?=
 =?utf-8?B?aXl1NWg1T0pONVYxb1ZKUThncUNNbGt5THRlSzZVUGthMGkybnBQWTlzOFg1?=
 =?utf-8?B?OWJmYnpPOW44YzNpSW41WXladjZUbnZHdGl1WUFzLzFWTTRnSnF3TS9hallq?=
 =?utf-8?B?M3N4NC9GTUlXZmVoL2RFNnNQTWMrakQ1RzFmSlNFcE5rb29DYlF2TGkrdGo1?=
 =?utf-8?B?S2lyL1dzTnovN1ljKzNpL0pjVlNJQlRDZjNiNVNHY0N1cDZvOFFNeHV6NG9G?=
 =?utf-8?B?d0dPbHdOcGNraXl4MHJSRGNiL01KaXFlbFVPeHI4Vm9Pcng3L1NkcFZWZGxt?=
 =?utf-8?B?SllqbUJOaEl0M1lnekxvM3dFVkxvNjdNNlVYam8wWi9nZkhCS1F6aFhMbUc2?=
 =?utf-8?B?UklSMVYxQ2FjYXljQ08zY1VTVXBxT0FJY0lQRStad1dwVzJqQlg2UGFMQllJ?=
 =?utf-8?B?bkZOTmk3MWo2ai9wRUw3cnFwVkJUcTU4K3NyeElyOEppeEtsek10WnROWUp4?=
 =?utf-8?B?WU9OcGw1Q1ExNUxMalNBWVNxbllOM2lveXl2NnU0MFZWYm9ieEh5UG9xR0hU?=
 =?utf-8?B?SXQxaDV0YTBMWXc5bzdreFFSa1NjYlpjbXJOUFJXdjI5SEVQQ2hqZUFwWGJ5?=
 =?utf-8?B?S2Mzd091UTgrM2pOc0JBaGdxdmhjNk5GR3VycCtHWXJ6R1ptOURaZ0cyK2xF?=
 =?utf-8?B?NVAxNndoTm5nSU50WDMvaUpLVk1HMi9lV25aQ3d3eXpLQTVDTW9pb0xtTmJM?=
 =?utf-8?B?d0FEYUJra0QyQm9qL25XcWkxRkhBU1ZpekZhTzA3cDBUWk11a3pWS2lHY29j?=
 =?utf-8?B?UVg5alZ3T3FDOTYydGxuMUliMkFjSUdpemJQTWdDcXJ1bUg1U2hZUUlUS21u?=
 =?utf-8?B?WVVuNjBuaU9yOHc3R1UzTXFxRTRreXF0Ui9mOCtObHp0eWwwRTJGRkg5c0hv?=
 =?utf-8?B?NDNOSkYvQnNrdUhEb1d1eXBXRnFaaWoyc01NRnA5M3B1ZjVOb1VmL2ZjLy9o?=
 =?utf-8?B?YzFPOXJLcng0U3oxQUROcVlQMUVqallJWHROcGNTZHZzUjUycU93MmdIK2E1?=
 =?utf-8?B?cjc4Yk1SV05tVjhsOUM3bUx1N2ZkN1JjM3BiY0pyTnpkMC9vaVM3aEZleHpQ?=
 =?utf-8?B?RTFEL3RoTVZjeERITjg3VFZCRFlhM2RZYVJJcGphalZRc0toVkQ4ZjJjZldP?=
 =?utf-8?Q?iI1yjnskSUqogaom/2z8BjLMLI30WuNnzeo0Ekjm86rf0?=
X-MS-Exchange-AntiSpam-MessageData-1: Ipgd0hjCWni0loo+E2UOBQM9h38VVn0JAyw=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47074eeb-8529-4137-a62e-08de76049240
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB11741.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 13:31:53.9804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I3o84suiWXBbX3EcFBBBuFVLtAtO2P9gsBdcW0XUV7aVYbQCcvj8R/mF1qQ7HxWyMZTMLyzQOTPE2UNWzyMAzS73qdpUWPsS1rA4M1+BL9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6807

Hi Daniel,

Glad to see others using them :)

Reviewed-by: Maud Spierings <maudspierings@gocontroll.com>

On 2/27/26 14:02, Daniel Baluta wrote:
> Currently MX8MP_I2C_DEFAULT macro includes a fixed drive
> strength (MX8MP_DSE_X6) thus limiting its use to only I2C
> pins that require X6 drive.
> 
> There are many pinctrl configurations for I2C that use different
> drive strength while still using the common I2C default configurations
> (pull-up, Schmitt input, pull enable, SION).
> 
> So make the MX8MP_I2C_DEFAULT macro more flexible and reusable by removing
> DSE_X6 drive strength from it's definition but add it in all places
> it is necessary.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>   arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h   |  2 +-
>   .../imx8mp-tx8p-ml81-moduline-display-106.dts    | 16 ++++++++--------
>   .../boot/dts/freescale/imx8mp-tx8p-ml81.dtsi     |  8 ++++----
>   3 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> index 16f5899de4152..26e7a9428c4c7 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> @@ -36,7 +36,7 @@
>   /* long defaults */
>   #define MX8MP_USDHC_DATA_DEFAULT (MX8MP_FSEL_FAST | MX8MP_PULL_UP | \
>   				  MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
> -#define MX8MP_I2C_DEFAULT (MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | \
> +#define MX8MP_I2C_DEFAULT (MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | \
>   			   MX8MP_PULL_ENABLE | MX8MP_SION)
>   
>   /*
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
> index 399230144ce39..87b20b8564583 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
> @@ -302,36 +302,36 @@ MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09
>   	pinctrl_i2c2: i2c2grp {
>   		fsl,pins = <
>   			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL
> -				MX8MP_I2C_DEFAULT
> +				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
>   			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA
> -				MX8MP_I2C_DEFAULT
> +				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
>   		>;
>   	};
>   
>   	pinctrl_i2c2_gpio: i2c2-gpiogrp {
>   		fsl,pins = <
>   			MX8MP_IOMUXC_I2C2_SCL__GPIO5_IO16
> -				MX8MP_I2C_DEFAULT
> +				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
>   			MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17
> -				MX8MP_I2C_DEFAULT
> +				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
>   		>;
>   	};
>   
>   	pinctrl_i2c4: i2c4grp {
>   		fsl,pins = <
>   			MX8MP_IOMUXC_ECSPI2_MISO__I2C4_SCL
> -				MX8MP_I2C_DEFAULT
> +				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
>   			MX8MP_IOMUXC_ECSPI2_SS0__I2C4_SDA
> -				MX8MP_I2C_DEFAULT
> +				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
>   		>;
>   	};
>   
>   	pinctrl_i2c4_gpio: i2c4-gpiogrp {
>   		fsl,pins = <
>   			MX8MP_IOMUXC_ECSPI2_MISO__GPIO5_IO12
> -				MX8MP_I2C_DEFAULT
> +				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
>   			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13
> -				MX8MP_I2C_DEFAULT
> +				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
>   		>;
>   	};
>   
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
> index 761ee046eb72e..bf49ae942d411 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
> @@ -425,18 +425,18 @@ MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22
>   	pinctrl_i2c1: i2c1grp {
>   		fsl,pins = <
>   			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL
> -				MX8MP_I2C_DEFAULT
> +				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
>   			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA
> -				MX8MP_I2C_DEFAULT
> +				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
>   		>;
>   	};
>   
>   	pinctrl_i2c1_gpio: i2c1-gpiogrp {
>   		fsl,pins = <
>   			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14
> -				MX8MP_I2C_DEFAULT
> +				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
>   			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15
> -				MX8MP_I2C_DEFAULT
> +				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
>   		>;
>   	};
>   

