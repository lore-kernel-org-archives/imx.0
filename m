Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2072.outbound.protection.outlook.com [40.107.105.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B38C3FC7
	for <imx@lists.linux.dev>; Thu,  9 Jan 2025 02:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736389718; cv=fail; b=Es/dAlmRZirJcgbQPndtVV/dMXBP9bn2Z8yJcIT2j+6TZIxNND1K3DyiccLpl8YGXQNuM7zYwvU43V2zILodkFH8BFEX+pCdFGwIUAMAC6xtMlxAnbjLPAmv1EZbkKVCxknqMI2tbwjwF0Z7KniGcI+oZtVSgoxGIL0JSiaP58s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736389718; c=relaxed/simple;
	bh=mFJZ17hA9c2XARqLUQuQ7k8Fh4QVlL99z3EV+TFUxR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=He3o+fdFohksJrAwQZZt5J2W2tBUoSV0cWB1rRm8T90edWuSR/fjRPP3INh3715p14k3nR1CGcQRLB9Mk3gMf8YL4XQQxekqICB7x+Tf69klboNcOpGxhPOyTrSFsfgfkZODz3eKhwNOiKQkTFf3Na9OFR9PdRt02qoE227YW2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=h6ri60TE reason="signature verification failed"; arc=fail smtp.client-ip=40.107.105.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="h6ri60TE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=asLiZUKxyTPV+9sqB6YGbTXrn5/I51wqEfEVPWn1wouRXhbh4zhWW0bmT20ljC+Gt2nOZhqKnSCIKGqABFDOS4zFV2hKIGqGxO5Ge05/ncAGQiTJLhEpgwHLFp48FPqY1HuScf/Upg/MdlvN8xJ3RoZt2squAgSqLkbe7bBiuUMXFG6i+eSjoV6c09KloRS3uy44njrJdclL3/dScLKl7JjcKlNHfHA1fhpsFahcaF9+puSUiJbsklqAPC7SZ9uiBDy2opcb+FlSLAv421OUVg6ih+JY0Yblfs/P0MUDp2vHVQVWdpq5l0qPeSxEqHo72dryzxCuSfD2DfkSyG+yOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIFZE3Yp1nh93BeVR9xtEVwt6jHpgzpKWqkbLFXz0sE=;
 b=KTJqzrQdEk+jsbBKbtVkNYZSLdcC7c+DuHLKcoEWdl4kBoT1DNatEGCl1LqwzkJ64WmZX81TYakGVTjbqzD0sshzKnUY0W57irvtf3Dap+CnfIJIGb16i6IdhF89kpJweF8/Q0eGiuFh0sOLLTi+W2+PciUYHsLZf7d6tbXVbetRm5Ey6/Lj/qu6XtH5lBX5Ekv/Za595zt64H7Ba7O2iAdZ/XPS4nTP6DLqRdjyg0pDGu5hoCM4OHNR6sJv1dywaLuDkEg2gw58YbbhD1mi//OaP5rS4bGAlPXqd9Vcf8qwDrozQKuXO7tF/GVM54BWI1zjrnjvcA9E5UjKRoMqFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIFZE3Yp1nh93BeVR9xtEVwt6jHpgzpKWqkbLFXz0sE=;
 b=h6ri60TEoi+nhCl90fpMFzP89aVS+DlFq1CyxBPt/0p5Gy0YuV11ACLXwGEV6U+47Q8FjrOkCpTEEnusxNyQZLnzYUtQWFWtbXpSomvZL3va65h4ScA1WcdREkhOWgNsHhF+3Pab3/7H+7H4HSPVTp/ZGdwAgkUjI/IxgUjBmZZ1Q3qDfHznj2asYHsW+sz7eiNqN8YUImDio4WrEvOGC0Iuf/DGsUX2pLEYPBLcv6V00U26FPYUxbQo5s7ySPkpcALUiE5TEvZvjjvyidS9aV5jvVIz9k+SbyyGA5zxh6wr5e9jXmA26MNQ7D6opfPFoE3A7n7YdwhBfAYz33SBJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by GV1PR04MB11063.eurprd04.prod.outlook.com (2603:10a6:150:20c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 02:28:28 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 02:28:28 +0000
Date: Thu, 9 Jan 2025 11:34:18 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support accessing
 controller for i.MX9
Message-ID: <20250109033418.GB31833@localhost.localdomain>
References: <20250108-imx-ocotp-v5-0-a6d90e18ebe9@nxp.com>
 <20250108-imx-ocotp-v5-2-a6d90e18ebe9@nxp.com>
 <3823142.MHq7AAxBmi@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3823142.MHq7AAxBmi@steina-w>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|GV1PR04MB11063:EE_
X-MS-Office365-Filtering-Correlation-Id: 21c901d7-0261-4265-ef3b-08dd30554d2a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?Cb10DobNSGnl5pfaPnQuGE0V/fU1Ttl0v3Dlh/jX5efzDrRPaB4HJ3VMtb?=
 =?iso-8859-1?Q?RsNe/92R3f3pwXr9P7BIJ063jEZJFk20efCX14KJsSBvMQycOd9n4oiiFQ?=
 =?iso-8859-1?Q?y2jDhcB4qgk9TZMCt5jXQrxSVFJtRhQ08uRFJx2jeArzKRJLAgclgeo5JT?=
 =?iso-8859-1?Q?C7X+8UzzEblgCZzh4ntdDjJEtGJZZJNMhHTX7X9j9V4vi5zNhx8M3k/VcH?=
 =?iso-8859-1?Q?ZPh8C0m3yB2slarMbQjUXCYihEkz2juRKVf7P9QgERYOThhjQxtyPx7To3?=
 =?iso-8859-1?Q?8UWdAATOJWcuNMbPA6qohm914b6Y1MdM4eIZ/ZR6M3Ra3sleufTLpM7tjF?=
 =?iso-8859-1?Q?At5Rk74RVu9YEppYcjeD+9s7nNt5cG39Uot47QgHgt0ZFSCEC0nMp2Ina6?=
 =?iso-8859-1?Q?Rx0hwMBAb/U1UU8MTNfpdH/rXbTbcxQYrLHqDH89w96Nkkirgg4LxvOBMO?=
 =?iso-8859-1?Q?+O+l/g3f/TIyP0pt1eU1Oz/Zo9sPhW32kGgMSO+JKr1z+zd/Ze6WZWY1V5?=
 =?iso-8859-1?Q?l4lcaaFLevZyN4aQUkvzuS1o7JanGzRSkaHoTzUKvOXhVJOf90xUSeVZEe?=
 =?iso-8859-1?Q?RJpotqmeSydO9ZXnLAUEj1rLWE/sIdVXC7+S+NjupE/QDdKUhcXtpGdIVw?=
 =?iso-8859-1?Q?dW34GMqSAce1zmyfCDGBlFBJdNLEBU5qXfc8bSGb0Q8jKibB3FZmJuavTV?=
 =?iso-8859-1?Q?RFoh8MzDk9VLXWCmVSl8doGimLcX6Tpyk+JsZc7626+ZJQ9UnTFtRLLxK4?=
 =?iso-8859-1?Q?hhSRJviUp6695LUuRcDTsJxgHm8feACw9pLYan1trSNC63PKUQwSgxlLZP?=
 =?iso-8859-1?Q?rbhVmHsMkJogNohh3GwcMmbAqRUUPa2jAw3lrak2nRUY92HSFOGoAZ9ZWO?=
 =?iso-8859-1?Q?T5iiQjxxBzVp1z/pwh4XzSR4cR45zL36uXuIYD/m/NeCWmG4HkXUzOA2C3?=
 =?iso-8859-1?Q?XuEHjyH0IiuidAJZv810KeW5AUnXTqlGXsoXo2iLC0X/0oCYeqWg8xEtNG?=
 =?iso-8859-1?Q?rrry4BokZ7Vth40joPZe2C7kKx+I2ROFe6PuVAif13UGIxaAKsG9adrZcl?=
 =?iso-8859-1?Q?/YRv70cBtdanwL4QekKRybGix+fC+LvFGnAr5p0bmmQhiL/AxqRhvZCgid?=
 =?iso-8859-1?Q?GXDU3j8Q9UEypDMuddD0FIT7oZgBmpmAZB1DMU4xBNX+NJMDh0mHwjinxa?=
 =?iso-8859-1?Q?2qnFP/EX2zDxkd6khUf7SQi5+5n+vTigibLct/fIMcqW0Upng2aERgrsKx?=
 =?iso-8859-1?Q?7p4kCbpQxR5+1dO0o/HT+2d1AZcAIaEMEsYi0247GWb443HCpQ3iLF5oOq?=
 =?iso-8859-1?Q?MaSjDUWtG7eHgy+oKVJa2JQClAGUhMRssVUQfijqp7YcZ0xTFmDLi+wvMW?=
 =?iso-8859-1?Q?4jN7BOsDphaF+J5rbiyS6CXjU9gLGUQt4Wcw7kPftJnR/XorgXcr0eQHCt?=
 =?iso-8859-1?Q?LTDgUJjqjsL9m+6a?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?U+vm+dGj8AQ7ak54/2bJEb4tKJtJh3DcCNxB9C+mNw9NLUSl839OyNhy/0?=
 =?iso-8859-1?Q?CiXmh8BojsYLrvm0grYJBjZwLlpxKtzEg/t+MZxCrabFYmSPbx6X+pvQZ3?=
 =?iso-8859-1?Q?qkIgGIfaUf/zM1/cbMM8vHlrelwuu2JCCiiNwZoBgPW9vJ9dJyiYsN0S4g?=
 =?iso-8859-1?Q?NpJ+6yhEkodFUeXy9fay7P2VESg+H9MUT0oA8rN2Yd5PkVElG5bkd+zpCH?=
 =?iso-8859-1?Q?56rmR1SePDMojp8AEpkJD01X8dM8tnOkoNeDrdqiarlzkZvNBE7rK/x0Nt?=
 =?iso-8859-1?Q?UOGiEPtpZGA8sXI+gx/+K28pp+sI2uRmsyIYELXDW+1xy6ORT8usds7hy5?=
 =?iso-8859-1?Q?75opMiB+Au3T/6mgaVzh7vGcIS8DaStERIYp1jYP7avwd9rvI805agIA5F?=
 =?iso-8859-1?Q?z8xF7dCT+Z3KuAzKuSR479yPw35GuYZfXiguuEQJxFaFbiREATUfhpz2WK?=
 =?iso-8859-1?Q?Qe8hIByEF5z7NG0GqOBVgH7j0ysFa7s2+wTbaiTk8h1MJ2TK3TeXCZGHHg?=
 =?iso-8859-1?Q?a3MiJlIYymKpyP7oHCTvMjX82XqBePmIi6+ot44It1mniToD8Dzja2GBwO?=
 =?iso-8859-1?Q?zNX0HickWaFBgHCDnxNl87oAV1o/VqUjJFJSgmx9pcH9zhEgnnyknM72XH?=
 =?iso-8859-1?Q?fGoSMD2T6ilT7C6F0mv0W+uH7O5enfR+oyJ+LX9lDYDAOiA7qjcZ1KoO66?=
 =?iso-8859-1?Q?Z8Uy9n1A/GzqO5Oby0b9XurOnliL8wTckek13b+KN0mmkyVWPkA4eFQ7NN?=
 =?iso-8859-1?Q?22qAwPYDArQyDB6sZOSADHJAI5IK5VuIjicVQmzbayvHrexaa/W14VhO3S?=
 =?iso-8859-1?Q?ibuFq6DLZZs6Ta5YL0zF8m6bEb4gTXiD8NAYCPhEQfYJlsChyoP2Skx0D9?=
 =?iso-8859-1?Q?/UfU9DfADur+ukNrewXV2pBNkr4zCahzP8isiY7FEmonuGwAkT25c1fO4w?=
 =?iso-8859-1?Q?eUE6s+xI6l0aTbn5IDvi9z5alKP3xjDXp9HLs9xFKcdxg1dJQd+nx7oxnl?=
 =?iso-8859-1?Q?UYzOp/t978oBf1iX2bk4aD3SHYhKdKE5MQzGDG/HhhM2tIUe3q3voHTHFv?=
 =?iso-8859-1?Q?ZYuDftif0d5FMhV52F8K0/dAWIVLOxWlAkbQ7qRMFS+P1WXU8eNWPVAU5F?=
 =?iso-8859-1?Q?xvvDw3xr7XaM2TOGBAHZwYU98Zwt+gk01+3kyYu3EquCaVljDIn6Rh9ssl?=
 =?iso-8859-1?Q?7jWphOZ8JjQy4odSaAKSLJNHbsE2DKkL/9LJ2MgYOVMnXCQdMGLo2TWVHM?=
 =?iso-8859-1?Q?uyGmBs1r2CAk/vtJT3TR6HH0aBUqtyBBFzUwkzEyWa/odIMI+j/Adwj50V?=
 =?iso-8859-1?Q?ADSR25jq2F/bu+vGS+we9UEA5+xqTUVuRIRN14xaUx8M62AHmcE4dBJm6K?=
 =?iso-8859-1?Q?KAECCg9wvZDCq1+5vTlUfUoHN5gq9KDKngdve3fHzw09yHtVtoV37tWno9?=
 =?iso-8859-1?Q?xjqiAO2hcgD2iT0tBZxuzWDW7v7kIBrSicw2smaiJsW44fgRGwi/LV88Q7?=
 =?iso-8859-1?Q?at0MFd6eQw+ENQW4JCpv5ILN/kfZo0Q2HnHrOYs7axpt/g3EOUOdarmws6?=
 =?iso-8859-1?Q?Len8w7pNC3IFFeTIJXAuV7hZgyJOcX94zNXFuHQ+ujqBQLGXrIZxGaJzUA?=
 =?iso-8859-1?Q?2fqUaicvXSq8W/YYgi4FUy2j31JKEqfYDU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c901d7-0261-4265-ef3b-08dd30554d2a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 02:28:28.2882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hX47de0zprdtZFvI+K8WUKthJqWB/sgMgxHpezpxokWbf0FLYadEGGswZYNbMMH/7ufOSeKs7Tj/JLWxkhCAhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11063

On Wed, Jan 08, 2025 at 11:15:40AM +0100, Alexander Stein wrote:
>Hi Peng,
>
>Am Mittwoch, 8. Januar 2025, 08:00:18 CET schrieb Peng Fan (OSS):
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> i.MX9 OCOTP supports a specific peripheral or function being fused
>> which means disabled, so
>>  - Introduce ocotp_access_gates to be container of efuse gate info
>>  - Iterate all nodes to check accessing permission. If not
>>    allowed to be accessed, detach the node
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/nvmem/imx-ocotp-ele.c | 172 +++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 171 insertions(+), 1 deletion(-)
>> 
[....]
>> +
>> +	return imx_ele_ocotp_access_control(priv);
>
>In [1] you mentioned devlink should solve the probe order. How does this
>play when the driver is compiled in (e.g. ethernet for NFS boot) but
>this OCOTP driver is just a module?

OCOTP needs to built in for using devlink. Or the users needs to be
built as module.

>I'm not well versed with devlink, but is
>> access-controllers = <&ocotp IMX93_OCOTP_ENET1_GATE>;
>already enough to create that link?

Yes, the drivers/of/property.c has this
"DEFINE_SIMPLE_PROP(access_controllers, "access-controllers", "#access-controller-cells")"

The fw_devlink driver will create consumer/supplier to make sure proper
order.

Regards,
Peng

>
>Best regards,
>Alexander
>
>>  }
>>  
>> +struct access_gate imx93_access_gate[] = {
>> +		[IMX93_OCOTP_NPU_GATE]		= { .word = 19, .mask = BIT(13) },
>> +		[IMX93_OCOTP_A550_GATE]		= { .word = 19, .mask = BIT(14) },
>> +		[IMX93_OCOTP_A551_GATE]		= { .word = 19, .mask = BIT(15) },
>> +		[IMX93_OCOTP_M33_GATE]		= { .word = 19, .mask = BIT(24) },
>> +		[IMX93_OCOTP_CAN1_FD_GATE]	= { .word = 19, .mask = BIT(28) },
>> +		[IMX93_OCOTP_CAN2_FD_GATE]	= { .word = 19, .mask = BIT(29) },
>> +		[IMX93_OCOTP_CAN1_GATE]		= { .word = 19, .mask = BIT(30) },
>> +		[IMX93_OCOTP_CAN2_GATE]		= { .word = 19, .mask = BIT(31) },
>> +		[IMX93_OCOTP_USB1_GATE]		= { .word = 20, .mask = BIT(3) },
>> +		[IMX93_OCOTP_USB2_GATE]		= { .word = 20, .mask = BIT(4) },
>> +		[IMX93_OCOTP_ENET1_GATE]	= { .word = 20, .mask = BIT(5) },
>> +		[IMX93_OCOTP_ENET2_GATE]	= { .word = 20, .mask = BIT(6) },
>> +		[IMX93_OCOTP_PXP_GATE]		= { .word = 20, .mask = BIT(10) },
>> +		[IMX93_OCOTP_MIPI_CSI1_GATE]	= { .word = 20, .mask = BIT(17) },
>> +		[IMX93_OCOTP_MIPI_DSI1_GATE]	= { .word = 20, .mask = BIT(19) },
>> +		[IMX93_OCOTP_LVDS1_GATE]	= { .word = 20, .mask = BIT(24) },
>> +		[IMX93_OCOTP_ADC1_GATE]		= { .word = 21, .mask = BIT(7) },
>> +};
>> +
>> +static const struct ocotp_access_gates imx93_access_gates_info = {
>> +	.num_words = 3,
>> +	.words = {19, 20, 21},
>> +	.num_gates = ARRAY_SIZE(imx93_access_gate),
>> +	.gates = imx93_access_gate,
>> +};
>> +
>>  static const struct ocotp_devtype_data imx93_ocotp_data = {
>> +	.access_gates = &imx93_access_gates_info,
>>  	.reg_off = 0x8000,
>>  	.reg_read = imx_ocotp_reg_read,
>>  	.size = 2048,
>> @@ -183,7 +307,53 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
>>  	},
>>  };
>>  
>> +struct access_gate imx95_access_gate[] = {
>> +		[IMX95_OCOTP_CANFD1_GATE]	= { .word = 17, .mask = BIT(20) },
>> +		[IMX95_OCOTP_CANFD2_GATE]	= { .word = 17, .mask = BIT(21) },
>> +		[IMX95_OCOTP_CANFD3_GATE]	= { .word = 17, .mask = BIT(22) },
>> +		[IMX95_OCOTP_CANFD4_GATE]	= { .word = 17, .mask = BIT(23) },
>> +		[IMX95_OCOTP_CANFD5_GATE]	= { .word = 17, .mask = BIT(24) },
>> +		[IMX95_OCOTP_CAN1_GATE]		= { .word = 17, .mask = BIT(25) },
>> +		[IMX95_OCOTP_CAN2_GATE]		= { .word = 17, .mask = BIT(26) },
>> +		[IMX95_OCOTP_CAN3_GATE]		= { .word = 17, .mask = BIT(27) },
>> +		[IMX95_OCOTP_CAN4_GATE]		= { .word = 17, .mask = BIT(28) },
>> +		[IMX95_OCOTP_CAN5_GATE]		= { .word = 17, .mask = BIT(29) },
>> +		[IMX95_OCOTP_NPU_GATE]		= { .word = 18, .mask = BIT(0) },
>> +		[IMX95_OCOTP_A550_GATE]		= { .word = 18, .mask = BIT(1) },
>> +		[IMX95_OCOTP_A551_GATE]		= { .word = 18, .mask = BIT(2) },
>> +		[IMX95_OCOTP_A552_GATE]		= { .word = 18, .mask = BIT(3) },
>> +		[IMX95_OCOTP_A553_GATE]		= { .word = 18, .mask = BIT(4) },
>> +		[IMX95_OCOTP_A554_GATE]		= { .word = 18, .mask = BIT(5) },
>> +		[IMX95_OCOTP_A555_GATE]		= { .word = 18, .mask = BIT(6) },
>> +		[IMX95_OCOTP_M7_GATE]		= { .word = 18, .mask = BIT(9) },
>> +		[IMX95_OCOTP_DCSS_GATE]		= { .word = 18, .mask = BIT(22) },
>> +		[IMX95_OCOTP_LVDS1_GATE]	= { .word = 18, .mask = BIT(27) },
>> +		[IMX95_OCOTP_ISP_GATE]		= { .word = 18, .mask = BIT(29) },
>> +		[IMX95_OCOTP_USB1_GATE]		= { .word = 19, .mask = BIT(2) },
>> +		[IMX95_OCOTP_USB2_GATE]		= { .word = 19, .mask = BIT(3) },
>> +		[IMX95_OCOTP_NETC_GATE]		= { .word = 19, .mask = BIT(4) },
>> +		[IMX95_OCOTP_PCIE1_GATE]	= { .word = 19, .mask = BIT(6) },
>> +		[IMX95_OCOTP_PCIE2_GATE]	= { .word = 19, .mask = BIT(7) },
>> +		[IMX95_OCOTP_ADC1_GATE]		= { .word = 19, .mask = BIT(8) },
>> +		[IMX95_OCOTP_EARC_RX_GATE]	= { .word = 19, .mask = BIT(11) },
>> +		[IMX95_OCOTP_GPU3D_GATE]	= { .word = 19, .mask = BIT(16) },
>> +		[IMX95_OCOTP_VPU_GATE]		= { .word = 19, .mask = BIT(17) },
>> +		[IMX95_OCOTP_JPEG_ENC_GATE]	= { .word = 19, .mask = BIT(18) },
>> +		[IMX95_OCOTP_JPEG_DEC_GATE]	= { .word = 19, .mask = BIT(19) },
>> +		[IMX95_OCOTP_MIPI_CSI1_GATE]	= { .word = 19, .mask = BIT(21) },
>> +		[IMX95_OCOTP_MIPI_CSI2_GATE]	= { .word = 19, .mask = BIT(22) },
>> +		[IMX95_OCOTP_MIPI_DSI1_GATE]	= { .word = 19, .mask = BIT(23) },
>> +};
>> +
>> +static const struct ocotp_access_gates imx95_access_gates_info = {
>> +	.num_words = 3,
>> +	.words = {17, 18, 19},
>> +	.num_gates = ARRAY_SIZE(imx95_access_gate),
>> +	.gates = imx95_access_gate,
>> +};
>> +
>>  static const struct ocotp_devtype_data imx95_ocotp_data = {
>> +	.access_gates = &imx95_access_gates_info,
>>  	.reg_off = 0x8000,
>>  	.reg_read = imx_ocotp_reg_read,
>>  	.size = 2048,
>> 
>> 
>
>
>-- 
>TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
>Amtsgericht München, HRB 105018
>Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
>http://www.tq-group.com/
>
>
