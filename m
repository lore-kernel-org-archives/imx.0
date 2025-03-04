Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013064.outbound.protection.outlook.com [40.107.162.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154A5299B47
	for <imx@lists.linux.dev>; Tue,  4 Mar 2025 15:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741101999; cv=fail; b=P1RIm9YbAyyxQmoXDLUp+5RGHz/4daGb/mvHV4Fp/U7TC2+qhXZjxGM1pvfBUIMcEQPp+ykRrIVp2PfPGvNzNykHj4qXMsaLVDrBkOgZrVyTtj45nujgC5dLZhYyk8sxlD0bhhQH3gETbqsQJ3BjSiO5vZTEqXekSup4bwFp3l8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741101999; c=relaxed/simple;
	bh=Se2eAPcDzYqgESakjrLAo4ZbYrOMgpfipJeGw/BBTD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TMLrCIaVJQI5qzw1JVPj4tN4IzuXb6ouS7jLUtESmMRf5H2hQ6ew1PXJ1/fBcYYYPqgqymtIa4HlmCq7pG6YcVFad6rfk7KVGW2gZZ+T20YWRH2vs7MyV2rT2w3jRDF6wETT3D13e6CiAxzDtdsXsaOwxS7JzVoUknALND3SFfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fDMs1Tz3; arc=fail smtp.client-ip=40.107.162.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fDMs1Tz3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVOk5jYZA+RZ0Zc6X72aw8rhHAWnXDn2jMg297FpI/ou4X0l37e90jMADtkT0kW2c24NhVNmfL/gfivQoofSdGDH0TN9nZNDonUGyeCIQTqT/e4mfb8cn5Bbg+/klZADo8jr+OLHi4g67doFlxGI+4qow/JnnEu/pFauxwMfCrznwPD6W3yTdlAT1xvP6n4cEDfc+vNO14qHcSJR/V3t3TqErt3a2g+S8/2h/mrSSH3R/LJDZHIRCBavAB+6l+AfPNLeM1qy0Fr0ADcCFjqCY9wd4BLtFOYREhPXBDgZpy3vfbT9dkXMlHzOOTbp/GzRcH604/Wn8oPdzhlQG1Stcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqQUGIgT1bojWLXFsNxHISFWmjitW34UPBvAJI+uAtw=;
 b=uKnWaELNHBxJJWYrgYT7G/2hu5v9QHRsIydQagVeXA10g+67FuyzIauwzEvNRSTFEfQMzSTgM/puUF8VGaMhGHunVmn7NwO5LrKW6l2Ds/U00yCBzFqQLPYLhMzAks3mD6cxLebilOUmZMpe1j4x76VPcBmqyL5dt8Qo1auVh5Vtva2DgaGs5s3lTphsz/npZg+MMFuakHXYjAesNW1M+vxAGE5BLl9J1aF+csLblj3JKv/AxfAGW5z+0Sw8nYoFV+FCKvvY4MqU1jmAzqcsoiEP7CC5ekw0dC+r8+F7+3iTec1Q5Y0z3cvmRutilojqpTYRjvPezOL3853X10+PsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqQUGIgT1bojWLXFsNxHISFWmjitW34UPBvAJI+uAtw=;
 b=fDMs1Tz3+IFk3KIceyNIw6MjJQpGGN4WYQYUNEQ4UGNsIACzPofPtt8/e+DmHVhZtdLc5TlifP9t7UcJEKqnEU/mZ1Z1c8fpgXarsoYR0Eotw1rWBpVBTthTCFC1a5PgEMHatqD15PDehwe1DvWguptY5wbb+0n3AgCgU2AwgV/dFhMV30CFMy6DZPzw0wt2ymPNen9K2MHzbFRTudjdDY4ybrQozedv3YYp4DJ9fkF9uF8NF13iIDOVLAF3oPJBA7nSZmzBwZWeTziAk0BmoEenX05iVwMw5N12HKcxQfrkShhkZa6OLyIDCZM8deVNZPfBciT2hE8GM6YnkskBzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8575.eurprd04.prod.outlook.com (2603:10a6:102:216::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 15:26:33 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8489.019; Tue, 4 Mar 2025
 15:26:33 +0000
Date: Tue, 4 Mar 2025 10:26:25 -0500
From: Frank Li <Frank.li@nxp.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
	peng.fan@nxp.com
Subject: Re: [PATCH v2 1/4] dt-bindings: dma: fsl-edma: add
 interrupts-extended property
Message-ID: <Z8cboXGsy1uyJwgf@lizhi-Precision-Tower-5810>
References: <20250304093127.1954549-1-ping.bai@nxp.com>
 <20250304093127.1954549-2-ping.bai@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304093127.1954549-2-ping.bai@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0055.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8575:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d53af4f-439b-4543-0bba-08dd5b30f1bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RmbMl00Fh8VpPGbQQER5F45XqeynhsbvXbmrjz/KvXFxHF3LSeIXTdyx/9ii?=
 =?us-ascii?Q?Z+EdEVS0KGn75TO62CITZUNiSfn+GvZpirRtudZnHraJ9vKr0sOCzL7uJecA?=
 =?us-ascii?Q?nteSggQRz2ZzV7T05QHdCfpt5XZaRwJ2K/Lurr8OppQ+EEhVlRE/cnIm9S3g?=
 =?us-ascii?Q?nvMdy0RD+/tZv4icn4wIHCJE3iJ7jgXofkexVXzLMbbdgcG2SOXehtgI1q+r?=
 =?us-ascii?Q?eTz/DVHqL5fTTgU10GJq0asYBtq1Zxg3yaK6wOQIGCirjh4tr63HHLH54EI8?=
 =?us-ascii?Q?QtwuNOcLTH5e6RicabD6BDVqQRne/QCvBUoNrpdOxhhLP9i/ykJdGuIqpnLR?=
 =?us-ascii?Q?UP8GM08XwcL/YL4la01mcvTx8VBhTs2X8YhoqVfGuk15NeDuWKT8bPJj+c76?=
 =?us-ascii?Q?CpXAejjdDQ8UGX0DSyHpLiQbLRWf4f+HUrInhptcAcxjWDCljAyZtR33FF2M?=
 =?us-ascii?Q?yi1bONOnCr2A+cbbUg9xQXFJLatFtzBxXn/Rztwjyix7c8Zm8K8BGfm0+3gt?=
 =?us-ascii?Q?05kWUprK6AtuLUq+MykOG5LfhHQcj3WqeEcVj12R7ZLLKyP04mVQ8Nazd4Hu?=
 =?us-ascii?Q?dt0kviMEszNUVDB27FSbXXy+vIvY1t2YPXt0amMAo5lFx+F+ViwZxT9lx8D7?=
 =?us-ascii?Q?357eFNdDb4FmtoRiOql3Ke40+B9avYe7HZsaUzmotcH5rCqjVWvFBniNQ3ij?=
 =?us-ascii?Q?EeN4xqdilfMAOl+JOLNO7i6jve0tEbXGcYfAFgv+5owWYNiBqmVSyz/vBftN?=
 =?us-ascii?Q?I9+9GfKIAEssJ4lypYYZbMN5LIBo924N/5ix4nCejovW44SxoV24fPhvSIpj?=
 =?us-ascii?Q?avGuKr25jmJKMIqB2BSa07R2l+VfbE/BnZzrW5jDPMd2xpzNatc386jId+qE?=
 =?us-ascii?Q?l7fW82jEmfaxS87jY228qqtj7rQK3tCWyJbPztWBzFvN8Qpz41XytSMX0JYt?=
 =?us-ascii?Q?ld9+iszafPtCguwofCX1p84Ku7jYZ80QPGPH1oY5XQbYTr+jbfCFkIUgSw72?=
 =?us-ascii?Q?fbTwAgNcEk0INBP0Ys1+89g5yr17bO3gkkjJOdRyjb73ZWxs/5Ti+6e95+fQ?=
 =?us-ascii?Q?cI8lbfGEFoKB3oBXWqukC57zFpITTzgqbz9yPUXVvXTkSfObYJjUFdPhlwLw?=
 =?us-ascii?Q?2s14daWTPmHTBvpZXI0poRLz1co7tAxiXEH7I+KtmK6O3G7fQPYGqLgw7PUI?=
 =?us-ascii?Q?Gr87uSbM90mSYupBCXRPPv46am1bcEaJIe8cpPZwMtoH+NrW8rPwqVgwQAiY?=
 =?us-ascii?Q?/9gRgFWAsEe+okCUpM8OLemifmt2WKrQqJ7AOLU5QQG16s91076tiuN+U3ck?=
 =?us-ascii?Q?jzsne9wVFCico4TcOCbqcfkkt4/qwLWDjo/TjCYriRzBvsXijbXCda0NHw4e?=
 =?us-ascii?Q?y4VlB/pUwH3SXvjauRVJjohpF0Oaxgy1WTng7nvxJfXjVB7/Sw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jcj0+HwH8J7IqFLHoMEIS7KjMQAZDepN+SKqh3OTbheUu1L5UFSUX33zD+Lt?=
 =?us-ascii?Q?d4cPmeZOPWXsPcdi+NW0fduMvH7lZNZfexs2PvGUpojmA9j7XqVKxU4aPore?=
 =?us-ascii?Q?PCt7nTXe0l/wJHA3/nIcfRCnCLLiR421Bzt9MHfJs7hVZmyJS61qU6ORtQD/?=
 =?us-ascii?Q?2qcNqkwwab1zohS5pntgt4IHZ+sxc+pz1agWrZpR/9c0xomW45ehImQHe1i0?=
 =?us-ascii?Q?8uIQCO7L7PgyZSaq7DO4W8l/LxH4n4JniTYOl+rmD7KxU+5QsPZPyWIALas3?=
 =?us-ascii?Q?DQQTpE8/V1CMRZviY6tLRVSKW5PJyp44UUeGzuvP7de7Ezdzn8QRmw1+4QHd?=
 =?us-ascii?Q?rT3jIlpgDGuu2UqboK5ByyzzZKcYOBH8fF69ORMJQpaCedYjUWh1+Oct4mZj?=
 =?us-ascii?Q?n03tfmu3Ojot1wou9+J4DH7uOSM2Lq+OW9kFITGrUsyqTfXX2OWcOfSot3Qj?=
 =?us-ascii?Q?SWJuBEwTEY3p917LKA8aoo6wC/FTiCRYZeT/7bVGvuTGUqnUPKLUF480e5bL?=
 =?us-ascii?Q?huXfO1Z7jzE2TPKbkfFYWLdpJnJNMbx0oLYH0t9xjww2pLs4aqHFixkAzySM?=
 =?us-ascii?Q?Yl9+o94GzTk+R31qTZCTWSIOov/wjWA37E+YsvsXpNsTVkkbfqRcyxhza6h1?=
 =?us-ascii?Q?qoHdic9MbiYIkarn2d8YYvGr/6rpyjKcQX3J6ULodESbIJP9U1UIUuyOeBV8?=
 =?us-ascii?Q?yFQQ3GhzGThEx0y3VgX/X94kuNduGxrL+87x7ZZfzTnBV6EoTv7R0SCk/zFU?=
 =?us-ascii?Q?lNbfW/R22ROr83SwqYE4QgHTSeukhMSl8zWnzY2hXpWUVsf3eiE53ZJ4sICA?=
 =?us-ascii?Q?cms4EKv+f4uy6gwplGfSPGF1b5FB/6LvNHYEma4M2LdvKxcsc6sYgxdeQ34k?=
 =?us-ascii?Q?L1H1wg5VXz5y/xi/58boy69n+5YOAN8fls1MMlBdOf3MMPiyhlVBBVp4ttwv?=
 =?us-ascii?Q?idPCiqgY7AIN6GqADfFDsRJVg9N05DXv1oWRff4Daf1EajsRmPbquPsqnzLc?=
 =?us-ascii?Q?zXus8+Z6IlOGDDzjBWnMuwAtHcpV9yiyvJEJ6jO+fDEAnifO+GjTaoGVuVM5?=
 =?us-ascii?Q?4UNvn3AVnoxTsrPK4l9jvcUWOWAvNjOPOkSXCe3nR7NfjG0Xf4mmd/A0aIdJ?=
 =?us-ascii?Q?hSAiPGWYrT1OoxD0X9g0hEEDIAHFB1ORoAQF+oXoHxQ+S/C85bVqiiwKhT+w?=
 =?us-ascii?Q?WP7MHPDraOu/tCdsWJjEaD/42mKJfoStzYjP2fmPTOVtsvAT0nsWEoFRjt/9?=
 =?us-ascii?Q?zpSOQ5lPBHOJzkzZOqZkxkmP846etRcE0gZUlsYbEZ73pKOPQKeuG6Y7hqzw?=
 =?us-ascii?Q?d8rSkhp8XMBksqjRjQWkkVwZjhduJYfeKKleOXhZVunFBeT6ZOnX8NqpRUpw?=
 =?us-ascii?Q?lWW2eLNF4/nzU6tSw1lHMucKCdMpMuSRCfim/hVWhlR8rC/bzUJ1r4TJbZku?=
 =?us-ascii?Q?ZwEGdkR0oWFsLHmxOQ4WUUqqwKXBEgaLzIX52kCUcRbD3ulFcKSJXP4fd7ic?=
 =?us-ascii?Q?p8LPRNT5UeiiiiZT5VFFQbrJxN9IqwP5OYMqbg2n5pBG7MLV57uHFzanrW4u?=
 =?us-ascii?Q?3hKh4Gp+CyQaTzf8oxP8Z/A14ycr/L3ukA8hcIFR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d53af4f-439b-4543-0bba-08dd5b30f1bf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 15:26:33.0087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zP1bIy55JBS2Ld+M4iLyuD22zklJUS9UujoGm/blNy+81a7H3LDkcszr8W/CyytApHtk4+Lkjp23lyv4ca/snw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8575

On Tue, Mar 04, 2025 at 05:31:24PM +0800, Jacky Bai wrote:
> Add interrupts-extended property for edma that has multiple interrupt
> controllers used.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  - v2 changes:
>   - newly added entry
> ---
>  Documentation/devicetree/bindings/dma/fsl,edma.yaml | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> index d54140f18d34..549afb8611a9 100644
> --- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> +++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
> @@ -38,6 +38,10 @@ properties:
>      minItems: 1
>      maxItems: 64
>
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 65
> +

I suggest add error irq later because optional err-irq patch under review.
https://lore.kernel.org/imx/20250228-edma_err-v1-0-d1869fe4163e@nxp.com/T/#t

Frank

>    interrupt-names:
>      minItems: 1
>      maxItems: 64
> @@ -87,9 +91,14 @@ required:
>    - "#dma-cells"
>    - compatible
>    - reg
> -  - interrupts
>    - dma-channels
>
> +oneOf:
> +  - required:
> +    - interrupts
> +  - required:
> +    - interrupts-extended
> +
>  allOf:
>    - $ref: dma-controller.yaml#
>    - if:
> --
> 2.34.1
>
