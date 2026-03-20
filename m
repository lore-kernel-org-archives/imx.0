Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010044.outbound.protection.outlook.com [52.101.84.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ADD175A6B
	for <imx@lists.linux.dev>; Fri, 20 Mar 2026 06:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773987392; cv=fail; b=TasSmimMOezMPu8pUsltxt8XTHDpQqs2xN1x9CNZyPd8i+jf/GoDqQ4u2EYKXCJgo7oPbZFCz/SUz6loYyNwa6hu1dgYn4rDtyjcvTDXj9F0y6LktJXr4B0vJS4LAOVCq9yc9rfY47aDmoi4iHXWliknKNQmIfqRA9p/01Udql4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773987392; c=relaxed/simple;
	bh=pgAa4IC//gZJeN6Df1DYFw21CNVKm85poe9bPIHHeHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ycc0P8q78/UVzM0G3/5RrQx5GRbm2MOTujxPSorEFA1W2YqYiTFjLRP70zgCbZw0JZlGSkcWwEXNWYmu7+ETWMOonH55ET0Ft6vTeCP8GSfMPYDfjfH/WAE4d5gtvk4+DfxpcygoZf9vQ2clCpunRyuG/9S51pWbAEOiGtvA/v4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WjEMfCSq; arc=fail smtp.client-ip=52.101.84.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WjEMfCSq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LB42ONhYZW47eI8RxmK8bAa/kS5MxMuse6wXoxeOzmc0nN0fJ3gvkXmGK0j77fzVSAEJiI+poYhkuI8O5JzTVZQGfoFk/keQm4ASoUmFnUUS8fUahZc/wN1ZVitOWAa/M3eVhwEkrkyZshINEWOiBLk4eTbbBDscB3tFQ0INOjJd4drOdMLgTA5T61LbYWmH7oId5EtvdQx0Ovd4qNdRjUW/q16atbHIvHTPHzthi4whTPInRJBiUrd5J/In1jm9Nw7QgcgxCAHdVdP8CyXJKWmlqVwsAnWrVGstSkO7dCoYXgyZ3fQKJjEngsnDxrk58k8pLrN4u6ASrAv6x0yH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LrOtzMw2+de7wpo67yzpaTqKR6CvbAx9ble4nNHKaw4=;
 b=TLxHN+0cK48cJ6/EabMZrjdQwh75+rQfrg71N7Xc48aRMW2ft59php35tvlF91yW/rQPCi4MgZVDZk6iM/6fh6kou1hTj/TH1WSFUTFO0pi3xfnVO9VytLFqPhX+Vw3wGpZahnIwpKlqGKM8mcMwmUPkjouZbF8ZgmMRVcSZ/K0JTse9Eqwja44eHUVI1B0d2c2dgtX31UdaDrEtZxbx2UOvW/vmYm17x5Gy3njFfG1LMYGTHi0F9FLbs+Uaml9zAuIYkqjtz83+SEhyn9c5+Dnochy9PiY8jzEuxkS5DzRE/YP4l6E+NSmwxt+X1uK/9W3FSqFo/7cFgsvdJAfZFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrOtzMw2+de7wpo67yzpaTqKR6CvbAx9ble4nNHKaw4=;
 b=WjEMfCSqDP1HXnPNGOgjcCR6AzMo2B3xva6LgtiMpbh1yK20ZU4VVJFMyqevtLEakVXhTgF4NNE0iLcnzfhe7blQVVlEhu76dHyHjLV9ecHZxi85K4AcpBTHYLqnPEEobJWVAXWKzcVTxPDeDA55Kbn6h9FPdNXx7T5E6LJTlnYiFqq0rc386PEXZ6WeDBelJTRxaqCcSSblIatHw545LjoSISEQlIKD//Hru9aHJTjH0MzmotUzpDVVVTrTjfghYuVffBoNO1WT9HXa+zmGjEPE5ypLNbho7nxan5a+V7zlSAh+ef5TSnk31HIOpmekKbQzqrrvoL/ZqfC0qZTr4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10586.eurprd04.prod.outlook.com (2603:10a6:150:21f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Fri, 20 Mar
 2026 06:16:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 06:16:25 +0000
Date: Fri, 20 Mar 2026 14:18:31 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Joy Zou <joy.zou@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add i.MX91 9x9 QSB basic
 support
Message-ID: <abzmpBHDRrsd/Mvr@shlinux89>
References: <20260319-b4-imx91-qsb-dts-v1-0-2eedc01d8af0@nxp.com>
 <20260319-b4-imx91-qsb-dts-v1-2-2eedc01d8af0@nxp.com>
 <4124e5ae-52a2-405c-a02d-7a1f48aa2b57@lunn.ch>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4124e5ae-52a2-405c-a02d-7a1f48aa2b57@lunn.ch>
X-ClientProxiedBy: MA5PR01CA0204.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10586:EE_
X-MS-Office365-Filtering-Correlation-Id: cb3c7e36-8b28-430c-39ab-08de864836cf
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|7416014|376014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xPRpbXj3ovyIo2jblpBGRWhxdurrfmFrLU6FCnFYioN0KV1m56IqDc0EPUPt74F9P6XmxfhyerD5l9mkfoN5oPY2zVgNab1aj/lh32SfYryb8SDo3b/Pp790lLYqDOE6T6ATlJgKbFMgEUzBrvUxq3Fo7ZbGr9PIu1Sutanhx8uNL1+UAP/a6qUSBfx+s6R9jKGq8+lV0iOiHq4obroDE/w4CgMAJhO/+jP4XLL/8YHkVwKL99zT7WVOH0TRF9/IfDp96lSNqQ3XC17thQVDDpvGZgiuGMgTFlztfWjKWys91ykJKPW3jrMD9+SLuDYlP2xuRPb2+QKkjauf0FpzkK+sjcr9wEvIBTKkZcFw+dA/kOBxoQj/piTpFlkYxvQRmCURS8CY/YOt+SU7cY1diVS+fWkn4aF8hg3/NYqK3s93ZnZeSc9lG6hMXhwZhNS/qQyJnaN6hZzjRbojYR13hKWqESsy+8YuVV/Bd/pGyOpCyDMGnkcCgOoE0aDsFuoPgC8Ua2g/mAq/sp/fv7vgAS4DNP0gE7sT3Oj4PKsjxx6SeQOXScUsSSSPBRaSpG72zWnbdxkogbAK/flnnDPm5hpJW6AIyFp5MRgRXjizzo4q3fTAVOzISfU+8ULUkTVHJwvRxGTO61X/D/cZ6PhmiZMk9W5ufnfR0eeG0Se0OCnfBkoeTYDBI8d3V/3evFmIgRNwfudhRi2OZGKDGDzH77EPmuzKdHdIkESdj3HgWeNIypBYIwkNDTNzWVRkLHVEWyzklYPggDsSWpVopoYmwoyTxNtIkOOc3pwU0DBDxcA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8V9Z8JDwJMiJhtARpvb5jM7hY7sZ0DQZlz0zHFquuxBPRc/eVxDjoYToawtz?=
 =?us-ascii?Q?r71owDaXCzowdFRu6vSl7Ia8xSOcQw8X5zUCQcIQCO7F9ruH30a+LF56K4Jf?=
 =?us-ascii?Q?em+HP41bPhw6XkKa/nBzZbPd41cDqd0tmsAm4WhhsB4PjYZ1aRWvgEv+AHqd?=
 =?us-ascii?Q?wmYv8GIGk4Uez99F/nY9E8v2ucUNPxUcEtqginT7Q4TJm52Jk5unAz5ZLojW?=
 =?us-ascii?Q?afZVCp0WbwCRJ5FbUByHLZ6/axmlOzLJ4Utx7BPSOdjOtvM2wVke1fk1fcrV?=
 =?us-ascii?Q?xq/olo/16b8Vgw4gyUhzv31esfDpbIRwGMhh1qmqQYIjLJD/fl4yN4fiVoJe?=
 =?us-ascii?Q?Cii0/0nW63E7y/auvaoh1BwnPAIN67Udsl73Y5Nu9OS9o8r4k5vRMXNp3msn?=
 =?us-ascii?Q?Dx9VnqF0CG3PTV7U4EH3mrYebE1kxnnY324yPdMA+M0FJPpugFOYIwFHJLh7?=
 =?us-ascii?Q?VSbm9JcyLng7gDezCG4cvwm3bS3emzReaGCmW7kVXcYPE3S5gjzGgjwTzfdv?=
 =?us-ascii?Q?yZjZQ2i7FvMtsJqef3NXTHjsrLVZNGzETfSnaalbmidx19+JCftTAE92mIwy?=
 =?us-ascii?Q?sJVURH0olPRDuOgkdi7UoHmmV++cGdpFmziMVgImnqZeypTPXgzG7v7PCYjc?=
 =?us-ascii?Q?EuPK6pDStxqkNjqaYIvPkwMe5CUd+NSjFbDtu3EvD8bbxpxZxkqy9+q+uYtT?=
 =?us-ascii?Q?C6oUAzBPw0SSeyDiKE/659hgML1oQXGyUY77sCuOm+Du4qAVbrcU8SY2uQ1w?=
 =?us-ascii?Q?9YqHG9s6hKq7nzDIgbwOLWNBZbBf/Y0WtPkP2tms2BgdioGe0TyQj4eniBPK?=
 =?us-ascii?Q?OzPcRbDo0e8SETZrbItoQeCtVAtz1TnpaJcsFynyY4MhvUft72B/WttmgExy?=
 =?us-ascii?Q?qfJCejfvpXzBaICAO7qxXCJug65dMxArlqO/XsiVypRPNLZgZHmnNHw/f75G?=
 =?us-ascii?Q?6OWzmwrVotFEn1GXkEztXv2YoHn3R6zto5d3tWkL6gQh2c37pbn53BJ1pGgh?=
 =?us-ascii?Q?JpwJEA1SEfDPTzC5q0Ek8UayYTjFhqT72rS3EemOnB3JMz88yTaHru8qNJok?=
 =?us-ascii?Q?U4pnJ/jIcYiur7QZq29TCDnE+yspM+L30jnuKUaj1KefSFhSAXZAgacaAFPS?=
 =?us-ascii?Q?Morxqe/FoZ/b/t7YKMHhqF/zqKDFPXmjkjpOAwOg8pBQg2TzSHGsLcb9u8M7?=
 =?us-ascii?Q?fZOjgvi0YD6JyRPVvjhZbhSmDAi4IQIrh7tRi+1Eyx1wGs0klqVWkxWyTtdK?=
 =?us-ascii?Q?9jf5q8qlj4YWTaSisHhdZJialjHpoiKF8SIXg1J2VbIax6kHx73GcaXV08yi?=
 =?us-ascii?Q?zOUihXKgwZtg1qyJ7czuU70fUKkeUQ64kUbL32vz7vwRCB9PU4eYjUssgcfI?=
 =?us-ascii?Q?MGohkFRD4jEMWnhKb5JKvzH8GocsMlZreUC8tpj3VnhPzDYd2LXzR433pSqr?=
 =?us-ascii?Q?HVIKrkVe4DXzhBcCZqQu4BVsYrsntvH4qajhaRxSRaJI9+ktB/l81ajQcqAs?=
 =?us-ascii?Q?dV5ucIfF1cIJ0+UV3kBytlnAQ4yU3jlC87aMm9OohxiO+GXH1dxkhfteWifj?=
 =?us-ascii?Q?C5kwGdf8ztcl0I4vc1khcQUHocVNYkPi3sGJTZVs/usjwZYfCbev+z1Y5lPn?=
 =?us-ascii?Q?mjmMlBl5ZnBmgsAWeH2qNZdkA6jT0VhlugtPwiwzQaCoqgEG0WCGaJG0m7Jk?=
 =?us-ascii?Q?dTjr5cDEnbSFQAcv5rPTFSXJr3+TCzZhe7An3vcnVGb0D++HRTbWnysRy8Vt?=
 =?us-ascii?Q?ugpToP+E4A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3c7e36-8b28-430c-39ab-08de864836cf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 06:16:25.1032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ur6uJoJMnI+TUoSjL7SVC34YcId6g3oHRY4MEyNkdRgptyDoq6LM5/bK2V7DN1hR+N1zWZ25QwXkmXe1mnBKcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10586

On Thu, Mar 19, 2026 at 04:43:40PM +0100, Andrew Lunn wrote:
>> +&eqos {
>> +	phy-handle = <&ethphy1>;
>> +	phy-mode = "rgmii-id";
>> +	pinctrl-0 = <&pinctrl_eqos>;
>> +	pinctrl-names = "default";
>> +	status = "okay";
>> +
>> +	mdio {
>> +		compatible = "snps,dwmac-mdio";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		clock-frequency = <5000000>;
>
>Is that a valid property for "snps,dwmac-mdio"?

It is a valid property in 
Documentation/devicetree/bindings/net/mdio.yaml

Regards
Peng

>
>~/linux/drivers/net/ethernet/stmicro/stmmac$ grep  clock-frequency *
>~/linux/drivers/net/ethernet/stmicro/stmmac$ 
>
>	Andrew
