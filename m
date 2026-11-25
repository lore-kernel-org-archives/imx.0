Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795609374;
	b=zHkrgdHOphGYC5c6/XpvWgyQS1O6HZRAja1CSqNBCfBFXC+5fBjIDbW9VK7hTZT8ye1W
	 0D+WyJ4WatN4g3v8ejaOwbMfTJTt32KZeHlUSrq+ZFB0MV2FU0Yi/AbXPIwhRCFuvzrLk
	 XWApLXRZKyuik+W0UnJS+gDIJD+EJ+ciSbmJVSM9EluSeQNIX+gkBGFby4nrhyHJDFAIN
	 9ESRnaY0o62RZ6EsnbocbfR9BOJSVbYwN6iWsH4zxkWhkW/0t2LtoDnpE04tXnFMam+fb
	 r352VzsfiV5HQR4i0RzxQ0RxzmNRDQFwo2Zozr59FjX65KhAC+eI6oWuphLMfu7JssQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609374;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=oxE9+WePj2CubjMylSNgBFHweWgdaKtMqSIAv18W/90=;
	b=f1Y7Qa4fJHi3Yh0/hUO7XEDvhtRKdmcG4ocAXB3x1VD5aAvhA0XJY/dJgJQsqgLMUpPd
	 00tKTHomIZY/YnmSyHCFQWTcbuCbyXZntBsP78A7a6s5hcl2oUzk1YmMmn4psRyuNBR3c
	 3VJ6lxUiD9SKGXIvILBVbpFE3QGireW4YeypWig/LynqeL/07djqaQRpwCCIeyXbJoNFC
	 mB0AzrsSW4Ue8kpijMczZ1C/mVVQthpDRNgQ+WkvnH+J6PjNFqDo0kguFCkFTSXGmGd/v
	 z/uQXUPEyERKFTHEn9tZkSyb4pgy6ilSWEPYxaf05U2fwCD2sFoXTxLtEnnXp9c5Eow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CQUDP7fU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.0
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010000.outbound.protection.outlook.com [52.101.69.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF22606A329
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 12:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FF22606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CQUDP7fU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdzTjRoXCg6YaPpir/gKmvUhMzJ/mujDqoWrbDJ+BBxlac8NcvpKbZfMAZxZN8KAg84XNG9PH6eUhpvzvwM2MoiAgQhQOvyFYWBwELOVV292+rWOFy8RAe5IBnSQRYHImo2c3jz58VspmXjT6q1HKh5ix3cq4gdMiCFeMl/AqM9NYj+Vs2V370F9ASjqaYBpaNOkapbli+iny+qyg7RkeiVEd566J6tRsjmhWNbuosnIeqoY6Fe5jtifUDgcZiGKb0AfOZRGpUxB288s5HD5h+JnJS1wXetsfRuF377mQuH0k9zo2B0di21NQ/h42bQU+QK+aU+o5oapNP9v8X6QFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxE9+WePj2CubjMylSNgBFHweWgdaKtMqSIAv18W/90=;
 b=H58anR2qDqRZfFsxF4T5ABZOEPMvvhjVh0AfgO8KxLnUbOiE8GbaHATAiDKjDdUCQyfEoh1VVN/wmJO3nIBopIzuwpBoubAkNsF8orsVNjvbEU1wImA9GWW9wzcdfyFCyI2fbwgCPSZ6thXCM+YFA4tPhZb3Jgv47mjbvEbBf9cFizSaC3CzKA4r5ZfdKJnAoX4CmbNR5jGKP1CZKt6cjPwb5/l73w2CQZhtXu1TP9AFojF6NENa7saeG4RCA6mZ8ip4xJN3YPX7CCnnPapJjxrLJvBh7B9WC92aY+Le4qJdKVax6tySHWzjfD7G4DNhB+/TGKK05OMx7O6qkRRPOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxE9+WePj2CubjMylSNgBFHweWgdaKtMqSIAv18W/90=;
 b=CQUDP7fULoLfhTEKGkA+EYi8akxTBWflTOxoSfdAD8hm+lBKGbVhbFLkFPV96IeGpezTfOL9+yvtRpKjFNLvbt6RRO6StVNWsNKvmLAKs9coUEWR50aF65jMXR0I9P8Fgd36+cYnOHwF7MMgyFkci3S40sZNeRiWkx2b19/6P62I3QsOkPIlK2iiep41UDLq4ULNDAlEnlcJgdvh2rJIOO0Enj+2upbT8joNYkGBspD9rzEzl//BTUKXgvPiHe1UN5wuD4OH6xT9E/4OYoHqzC/rHWXZ+Ov+FjoduMsHkzr6rAdPzfebxwRs1PM5S3tLDXQKY+o3pdR89+NT4M3ITg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU2PR04MB8550.eurprd04.prod.outlook.com (2603:10a6:10:2d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 12:22:50 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%5]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 12:22:50 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: imx95-var: Add Cortex-M7 support
Date: Wed, 25 Nov 2026 20:19:51 +0800
Message-ID: <20261125121952.29502-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123124946.13887-1-stefano.r@variscite.com>
References:
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU2PR04MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e8dd152-4eeb-47c6-6ef4-08df4aeed28f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|19092799006|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261022075727099003|261021121427099003|261022105027099003|261102123227099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
 TmBUeeXkl/nuGKzmZQ/hIN2ajzD2qDAOPVU4aXrX2rb7p1mYKAIm66/QomR2URET0AcQDUoCxhvCU71YkrGcrt423nJqv0qxTt7UwWABaExmtvN1XEE15JFoSdUlCjro9Zw8w40FLOJSXRIRHXwc0WrUGl21/UvFyIfwDahZPF+By1yNP1sk324J2ndE0YjEJpL19Ct74X6GBT2RR592CsUHWdTJ8c6feMC2Yr3jOtfpXQB/HxuiyT8wYIAsNEaxnwDJSKXhnNjwGOdouy1JYnH9uWmK+2BHF9hEhTzXRU8AKLFccSjXhnxP8iPFl2bCFVssRnoU9uZfufVRjrPMl0Laii+2Rd83VPtzn938nirIv7RbgrwcQQ4CJQZ0g/yO5kiyYowVCPG5BizKH7AxZbXP5S0xEO/UkZSIZxB/QFuz9lS7HAR9bzp3NP2KL1stwsK4vStH6YrZg//qYIoisjgetrtzqcimu+Clvl2V1y8UPDsAtm/Qbyube8YZ9ySpvvjHn+SSKh3a1OBHJpw5hzrX7x2VpHEEYPJ1oxRCYzSHBdqSyRX/LGam4FFf3mGj0sg3xoy4fUx1vi1twvM75ONvVEWCQM8IlSHo8JH3VYEp+QuXkJiM1D8R5M83lvLZsNWz9J0134kQMsIcz/sN62SlOtsusZByh9jR+gxleYI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(19092799006)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022075727099003)(261021121427099003)(261022105027099003)(261102123227099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?q0mCFQTfoiAj3ErXHsOubK979SRCbHZ7ZaslMpVrhrFD/Ve+7PV7Rrukd61f?=
 =?us-ascii?Q?ToUDH19/r+7F81bGIOILTtRAzAztENrSjnx2/iqk2kD/h7GIoZsWipdcB4RN?=
 =?us-ascii?Q?d+dg012gIWZYK8Ym8ZdzbvZvBwJJHrS9u2VSlfZd4BH3VFmw0GZpbr/JGVb3?=
 =?us-ascii?Q?VVYFOji85FvSeVaG0UQa5aBEDjunULw6oODiMCBew88FKz/18wbnjwAdRKPC?=
 =?us-ascii?Q?W0G93tqqmtVxuUJtK19LkZEwZadGNSk7Hya6nC9IyF7l5goKYh3kMNuvnCVl?=
 =?us-ascii?Q?zYuETAMeZ6cEd8a3xFKJuNAX5nfjuj7F0mRqBPo7FEEykOO61tGCtIq1UOhO?=
 =?us-ascii?Q?9ejBDbCdfy9z66GBSXcHcdCpcGlfz8PvjTNLiAu3W5X5rKNoLuR720nFd9Iz?=
 =?us-ascii?Q?kwwsc4xH9aVMkA5aSsFebJxGMmTDN5xwHTIRVpeQnckelel82JgYY+Q6alg4?=
 =?us-ascii?Q?KXqNTkxqhkwBO86NjW9eqTj4E/c6UvcuDU4stgoj7HwniI4nvGmC/OMqh1Zz?=
 =?us-ascii?Q?myawV0JOyE5d6GM+2C9yyja9iO4bzuf/pv405It8nM79ISwRWri+C04MSPou?=
 =?us-ascii?Q?jPDfHX9r2XAFg7trsN7v6MRgXNvyHnomcptTsxs0BHPp84pcC+d1S4q8fAAT?=
 =?us-ascii?Q?1rj8qq7+VQU25YUU0cPZkGJazkzevvyj864hdYpd1wq/KwNLfhsJYNdVgEAw?=
 =?us-ascii?Q?MjVaMk9+mSu3i3oyqng6nL6Y2dkAoksqs4U26feE6wWeVMQVw0HXo8aRnlg3?=
 =?us-ascii?Q?Fv4cjhcXg8jVMFfCVHLFsoiMxB61HF8hb1CHrh6Qc4Gpa7eUiKCPc7SdWDHY?=
 =?us-ascii?Q?Wq+RGh6A7Xz8lzYxQe7bwyijvZUDyxTZn6jd/x/v0vTW1JRBEUM0sa6/T0B/?=
 =?us-ascii?Q?Lp4DhUqDwGVBMcbgw9cA+0f4oyzMjcBEP6jePtrLHzguKd9mRoXZktCdPVDQ?=
 =?us-ascii?Q?vh8hfqWTsuea62bUCHfQmLTZVFtz79BhU58R/3dDixP9chhss0XvOVojM5W8?=
 =?us-ascii?Q?RR7Ruz/aKvbJacBu4EAFnWIhH6l8hg5c+nWPAJDMRoNk1NyBccmq4dkkY1Ei?=
 =?us-ascii?Q?JPdM2aiTHbksnR4fTAcujnTSL7NdkMQ0M77xl+zd2PwZC8ehbN/Dh7p3g4lo?=
 =?us-ascii?Q?M7fQ+LJ8YTcOoDp0V0b6EvpSaXe4jT8DdmrbfJQpniIB0UkmlZUTLlGBLLdE?=
 =?us-ascii?Q?pBZrmOCE3pUuPKg2y/EKVg3sIBnCT4uISVOPALvSIV5lSD5JvX0ZusezLtH7?=
 =?us-ascii?Q?m2VmDRQ8AsQOpMXIAGFlHS2rkH4o4aX+QDPQiydOxYcdXnetFD5lPyi19YgA?=
 =?us-ascii?Q?j0Y0GOPH9KK9mWoSFXHAZ5BWZStCDFu9pQE6xbg3/AjsEkozuIgmkidZnubW?=
 =?us-ascii?Q?0w9O25lY+cNaLu5v4zEpW1Tlsc54DshKqx1AuGZAofPIcejVtG1UeBE9SR5i?=
 =?us-ascii?Q?Wj6RZXMH5WPvyMZk63pl9/Nz54mWdaSCMSghrYMgE4LGAx9qeD6NqHbOToyd?=
 =?us-ascii?Q?Tq0mvTLmgTPFZLcEulAO1CejlXqu25GYTWGKjrYZ8vtN1oib98IzjrA51oc6?=
 =?us-ascii?Q?5Nxh2jVcoLS9qjtuBi1twT39Llpw52cYO8kddvUoTeO2cM8IMRP3cie2Jss5?=
 =?us-ascii?Q?PhbP5fk8loy5m8sr9XeexRDiFvHVHGXJS3ge/8jNU9+fAhYiyW6a86IFU3T3?=
 =?us-ascii?Q?nZMFb4tEjOsXtCJjA3P30oYSvI19DQ1C8aD7rOnqlgi5O98IPoezwd42/8us?=
 =?us-ascii?Q?IpksiFk3O7Igrdp+5p11fMVe5v8fY3d0SrJpQVUjTZyyD0H83LJd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8dd152-4eeb-47c6-6ef4-08df4aeed28f
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 12:22:50.7119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: csZcFeLNLkRo63gVxB8jtSwM+tetmomEgMrKsYloYAb60o75nHDKQ40R6xttvWjizGXgwB2WSgQyfb+gTB9ubtbKooDOiGiyyHBqA3qUEGUX0wmkL+76GvRRndK+SM8G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8550

On Mon, 23 Nov 2026 13:49:46 +0100 Stefano Radaelli <stefano.radaelli21@gmail.com> wrote:

> From: Stefano Radaelli <stefano.r@variscite.com>
> 
> Add a Cortex-M7 configuration for DART-MX95 on Sonata.
> 
> Place the reserved memory, remoteproc and MU7 configuration in a common
> include so other carrier boards using Variscite i.MX95 modules can add
> M7 variants by reusing this configuration and providing their own
> peripheral assignments in a board overlay.
> 
> Add a Sonata overlay and a combined -m7 DTB for remoteproc and RPMsg
> support, enabling MU7 only in the M7 configuration.
> 
> Reserve eDMA1, eDMA2, FlexCAN1, LPI2C4, LPUART3 and LPUART8 for the remote
> firmware. Use PIO for the remaining active I2C, SPI and UART controllers,
> and disable SAI3 and its sound card because eDMA2 is unavailable to Linux.
> 
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> +

[...]
> +/dts-v1/;
> +/plugin/;
> +
> +#include "imx95-var-common-m7.dtsi"
> +
> +/* SAI3 requires eDMA2, which is reserved for the Cortex-M7. */
> +&{/sound-wm8904} {
> +	status = "disabled";
> +};
> +
> +/* Reserve the peripherals used by the Cortex-M7 firmware. */
> +&edma1 {
> +	status = "reserved";

Should this be disabled?

Regards
Peng
