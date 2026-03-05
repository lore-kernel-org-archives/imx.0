Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010028.outbound.protection.outlook.com [52.101.84.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1F83368B7
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 01:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772673189; cv=fail; b=dWBOZ+DszTtEX1UFj3c0he7heAR8HAbpQ6rtIkSIgj6TK9tGfqCvO+fnlW/ugWINeQOwK2BOu4Q+3Ba2UTw2paWgjLnNoWIGdl/UYFFoiIi3qxoaPDxTk0JuukMTVZ6WXEnTL8EL3vUMs7S4oWEYjQ8di0tlql9tz9R9jjczXpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772673189; c=relaxed/simple;
	bh=oel6zqGHTkkTAZqHlHtsCRAwUNL8dMLahmqjkS41xcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AXWMgfStajekujr7GTELM3hQmnyjevmzaFZpEuWPILs2ndw8n58FMWi+5d6d9zCYOe3awqVuYpR0Id+N6CxPezqV4kRJ9yKikBUMwS7H+4uGkw0bDZUigkumyAsNwCG3inmGe6i0NmiNCSnCzVTIP6kSBik0CcORRlVGUUEOVyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rx7mMMK3; arc=fail smtp.client-ip=52.101.84.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rx7mMMK3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9JOCGzvcwthYrxd5srVXxXMmfhoHtSPc4abMR0A2MXwXvUDRxr06zf7CGUI95npHOl6FtQzRrDULtCYIH8kMbyjZhtKkd9LHYxiA+ailU8flR9UbyU1Bx6VsT11tRV1XJUr2Xz2AF5jWG9EUSb8uyTo9dNLC9ZFEYW+hE8zmu3RgsKoHPcynYNFi5Ntx5uYsjAo9AlMdO0ylAOzIrowZYUipG0XOHV902VgCGtnJqwdaqdEindlmwzY4t1zrUCg1jVJxcJpO19l1lVm4o3m+1xD57j2R98H/qTxoNldCEOclLHjHRw1yw99z2ZolpGqGXV8tXZOVWbPwdZXpcyYqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/9zanPmnJthpOb/1qiAxtF+6lqS+W6PjEMfVAnT1cE=;
 b=RZ0AF4XGDK8dJUYXHPd4I0bmpEzaWN8gYPEQ4s7OQFhV4Pc3+aYrOqHoViFyzNl0Trmp08AOiqRuYW7r0/YvwHp/WyPIxv61lXIpeXjiRWMHhykaQzteKRWm5wPN3jTqWzDS1D958nvdH4ax53Hdxij37boiKeZWP3hIIZO+iDAp1Sg7jhPm88/wy926/HVGiwzsuzI1KOD3zPfjpmSmi2TYI7M8LtM7QIQ4JWzjsQ2MlOYcoFLFDhJq84ukLZCkoyjm3C86baJGBgAkEwO5EeYxaeQ+Ke7bF5IyONtaKa9RENPQT2krlwBvPHSu2u7nD7Z/0kCCDBZctuO4M/znEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/9zanPmnJthpOb/1qiAxtF+6lqS+W6PjEMfVAnT1cE=;
 b=rx7mMMK3e/SjP+Xxn2nmzo4SgVn+ChfO0UtOlOJ3zjTOnKXFFNFZSKxUacYWjuy2OkwZCRXgDb5DZZzkPZVcKpjGX5L4zgLZMsJDDXD72e5/waxdo8GqI3VDELdAQowuwg4RB3Wi0TQxLlA2Q6X0fNHElUaVaFTiHUTF0CWPZCrH9Pr1uBhare09jdxUIO0CK5rrx3Jwjw//ABj0Yz86TNGYf7mdNBZzlqsZlCX3h9xvruqGUfkKABp1vsMzx9rz+ih+vEyiDvpDal4kENawQP6rVLDhEgDC8XINeYsHwECffoOp1RUb6o7CFnOjxKwZM7ou3sHMHsoAdncamsdCxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by GV2PR04MB12138.eurprd04.prod.outlook.com (2603:10a6:150:327::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 01:13:04 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%4]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 01:13:04 +0000
Date: Thu, 5 Mar 2026 09:14:58 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: freescale: imx95-toradex-smarc: Support
 Cortex M7
Message-ID: <aajWRwwT01e0KLxv@shlinux89>
References: <20260303121324.1576841-1-ghidoliemanuele@gmail.com>
 <aacAYYuPkqgV3QYu@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aacAYYuPkqgV3QYu@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SG2PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:3:17::27) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|GV2PR04MB12138:EE_
X-MS-Office365-Filtering-Correlation-Id: 1484e9c6-560a-4d51-c98c-08de7a5459e4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	gUSLzQsVy+hk+b8+uetQQWQzyxk+elqs+w3uSm/7zIvq5CzzGWSYuMA0cMrfi1Tym7m7mU59QY+h4DHDPvyH/DldDHBsmb2UyGfsV1N37vtR0jRd3XjGpNaI13+HaAjrBNpmvL33l1JFB0XqRx+ADKnWU7cO+7uopOGYyNTMYZDQ/QONKPy8M3QAJxCSfFivcNyW0BO86Y5S0VEf7ljaTW1rYxeiCWfXLiuzHAS9YYxrsL5XqkLvX7kKEzl/SJZxzeA6Smg6fjt7f2h9vvgjPBmdpERX1YaaB+meERXUYRR/cvG8m2Vjp42yhnit5liT468qa0Ns9JobOQyiamEXFBSJ+ljNB8yanXdqUe3jsVoBhHbehvjfZp+RPKQ4sAJLdJQUtVhkd5u4hYRUY87yXMJwWDYXkFog/OzNFqd9l8uqRVteCeQKzOIzQLZkJTnXeub/BlGfE+lmtw4HRCIgXwnmGR+WnnhcQPgYO12vaIKrbfE0KAAK0R7uAeVK4ltfVjXcR/hRFa83mLhanQDAXh5/ZoNNMgoUIpzS0Gk4sMGZQIyR+G0i/6vFCru94kuxytkOeHV/L9bwYHpdfhz0nzlhhg1eTeMpuFOv0xcPjPRGDHkv+mY3tcx2EqpFuCaxI07qPgocbTJFLe+P5XcUSqVmSabbhKLLzcuAZJD1AGaHnG2dEmt9ie3L38YRz8w0zcyru22PobEQiaXrCIFt0tHxk1PVymm4r+aI4YqJ/Y5PU2weTa8dDzcfG/1Dt2s41UzQZtUI6vtddNG9gbZWUlVfUBbQEv4dLSW3578sgIM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XqClgIQ5NtABYsO7dcjVOKfPQdTkvGiDcuVoTHtdM9BR8O3ukZILawEPthiq?=
 =?us-ascii?Q?tyrfdOmjobuweeE10yRoxdxIUalJ6d3NH+om7VZmSr3vLGKfEghl6gW913Zx?=
 =?us-ascii?Q?cstvW28u0QSappXt+zbYq0ay3PRS9Or0UwWHetPzHuRJBHJ4aoRy5EDv6Oht?=
 =?us-ascii?Q?Y3x7CtLF84+0swgbZoPGWmBA22As0b/oUJt3N1aibVKZ9pIsUXrguS+f5Cza?=
 =?us-ascii?Q?dS0QB6bEPJEIe7fTfwB/xnj37n63PQv83/G4tivFu9GnfYsIHPtRgMccs6Jf?=
 =?us-ascii?Q?ooiOixWTDzwaAm8+ID4a2OKwA0cLA0FhzS8UU/1FaRpub6nwEy/7vU0hhv3H?=
 =?us-ascii?Q?04Sg0MYcH2kEiOTUQ/Bb7MjO3uMZr0twUY+IqcN+gJkIfao/N/fivuOnQ9tr?=
 =?us-ascii?Q?aHLutNTPcJy69B7334UlIO1u2uyWdrx13X5xWoL4lHpUg2MuW8L8YlA7FLyD?=
 =?us-ascii?Q?/Uq4jxELMhmgc74GzxQDBP+5CVMz71SzH6kFeeC0jCHY7QyfZSbwAUTfUZPb?=
 =?us-ascii?Q?c3cssh5OmSXRASjUm4LeRMpsEPKVtxUUfiYulgR7KyeZYJgdwNnoXJO0McXJ?=
 =?us-ascii?Q?UDFL2ZhmDq1MT2N0YXdkLyaooy/bC6htK7xashhQNlafSmH9PXBIp4fRJBKN?=
 =?us-ascii?Q?3Nooyql/KIcPab3iezomJzLuq8YExyxpQmJ/rSC7ATp58dWf4gtdvM+8Emeb?=
 =?us-ascii?Q?BflyrQaA3lAKQnWrRB9tE5OgJ14zaXpDLdqRqeegjO4Zt1SpGnq01NqpVlhs?=
 =?us-ascii?Q?5PeNFMcFcEM7sSTWU9gfCGpwM3Ij51cmyysWociYvTwC7kp+FkeBbPCGyDNJ?=
 =?us-ascii?Q?RpIz1AxFXUnnTxJ8/YpNIgpgravGNaK00lrGzuk6o54/L2Q1014Rt/AOdiAV?=
 =?us-ascii?Q?a7Xw/ixVksAeX/PQ5cmek2lzIJHg4wACMvjPnoZI48gk3HqwRcdfKq010EqC?=
 =?us-ascii?Q?sk6jvKIB3EaXCsMztRWn7xg9o1VoNDu9+Wt31XXztfUjURHJ4P1MvWNaHRgs?=
 =?us-ascii?Q?Fsr3nporXO/awpP+C3o/kd9oeAV/NB7TxAvKZb+fWd7HnofEzLvwfg38f92k?=
 =?us-ascii?Q?FuKcadbzKI2H8ywp3iKCNy7KESe/H89bQRhNa+U29jgAZmk+4Otzqbhy9n37?=
 =?us-ascii?Q?X/VE9UHsdj3D8Pc+dcxFLtWiO9HRxTY/b34EkKiTxSf/TxuwgiekFVZrWoLZ?=
 =?us-ascii?Q?UyASbCTfPPQcbf7JdEJo4ysSp+ygVhtKHX7ybtMSMsYQfDOfpWKVPHf2+4+i?=
 =?us-ascii?Q?JV/RM5ArWogN5jHn6p1FhW8BBmGSzJSeAmhH2snM8qohULX5j6p73RLvY6j8?=
 =?us-ascii?Q?bL49Rc0p0+rhG3oJz0C7/vQI8ZC6aMSrkmYFaQDCtSyTAxQetpnDq0eh5D3E?=
 =?us-ascii?Q?QRwWWhpBfFUz7ZdDHNWJwgXHlp3ip0/oHgjWDQB8KDbCLBL6RZnpiWsgEjmW?=
 =?us-ascii?Q?+ggR2JBLyLbo9P1/X9OQhZ24mVpJO8ycsFhhSX1x3yVAHhE0NfX7ltJbtLJV?=
 =?us-ascii?Q?tzMpj86CfwMf6L71RjAS7xD5gNOaYzWBmhDqSqY8DTE4bf4PXwUnfLmEQxKD?=
 =?us-ascii?Q?WFx0eDTvFG0yog4ZS/bmJV7MBQzbyCtnVMGCpOh2zJrz2iTPudIwti4plMkT?=
 =?us-ascii?Q?mdpsor6AkHqnIup+krBboCzYtmv9jnhCkbSy3VRnRMO/ddCSeGE0rgv61j5w?=
 =?us-ascii?Q?X/yuMRNtZ0ninJqpAkqsmM7WsyxoARp/wy9lw1YRoWob0Y0qxERjnpce5BbL?=
 =?us-ascii?Q?ZnOG5ltffg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1484e9c6-560a-4d51-c98c-08de7a5459e4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 01:13:04.7040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFBM6mpmeuZDYG33KjKqf7Iluv+ZwszhbN9vkkkbNxNJh6tlRRUH7WgpvzeO2RqEgtcnci2iVm36H0EA9mlpPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12138

On Tue, Mar 03, 2026 at 10:38:09AM -0500, Frank Li wrote:
>On Tue, Mar 03, 2026 at 01:13:06PM +0100, Emanuele Ghidoli wrote:
>> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>>
>> +
>> +		rsc_table: memory@88220000 {
>
>I remember driver use hardcode rsc-table, I suggest fan pan to update
>driver to support memory-region-names to avoid use hidden ABI.
>
>Fan peng, what's current status?

It is delayed because of the i.MX95 remoteproc patchset.
And i.MX94/952 is still on my list as higher priority, so the moving
to memory-region-names will be after that.

Regards
Peng

>
>Frank
>
>> +			reg = <0 0x88220000 0 0x1000>;
>> +			no-map;
>> +		};
>> +
>> +		vdev0vring0: memory@88000000 {
>> +			reg = <0 0x88000000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		vdev0vring1: memory@88008000 {
>> +			reg = <0 0x88008000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		vdev1vring0: memory@88010000 {
>> +			reg = <0 0x88010000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		vdev1vring1: memory@88018000 {
>> +			reg = <0 0x88018000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		vdevbuffer: memory@88020000 {
>> +			compatible = "shared-dma-pool";
>> +			reg = <0 0x88020000 0 0x100000>;
>> +			no-map;
>> +		};
>>  	};
>>  };
>>
>> @@ -572,6 +618,10 @@ &lpuart3 {
>>  	pinctrl-0 = <&pinctrl_uart3>;
>>  };
>>
>> +&mu7 {
>> +	status = "okay";
>> +};
>> +
>>  /* SMARC MDIO, shared between all ethernet ports */
>>  &netc_emdio {
>>  	pinctrl-names = "default";
>> --
>> 2.43.0
>>
