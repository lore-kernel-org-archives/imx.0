Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9606332EC5
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 10:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767695089; cv=fail; b=GRn8/6xaIplVW4hfX/AM/9DSV+itPegpdkZhPuO2yyr1VCvZ0BfJGTgBpJytLdcSGaaM5pHsKG0dgAudctAZ82kbI6wu55UWIW5TJXyVIKlR6rMZb0ge9YkEbyizxhft1qLoTFcyau3XTuLALsfiyTM7xlBEw3t0pi1LM95ytg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767695089; c=relaxed/simple;
	bh=DbCzZpPCRoEzDbCOq8VEGxN6klkuURfaoEkUaUnNCP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=is3V3RC5WfMsfx2UH/xuDYXQamluz3auEFr3TKN43/QE0yEGsj8DDa7c8yl0sHKtvb5IrjcBDz+FSGHQkl9yMRqo03JUsL4LTB5BApvnIaWBaa+HeFSSkDmDLggzOeQ0//sah+jlhj/TusWCDcB75TBtmLmmwr1cLp/2V3iq08I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qfwUhrIG; arc=fail smtp.client-ip=52.101.66.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qfwUhrIG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qm6i5y9dDyDZ5SxzLyZYEbLVLK48YyHVR2Y0il0nzixtOFxtmOYgL7jFgAllz+fOj79vKTRT4BfwY+vgtSwSHZDakxtIQD99MVFHPb3/9koyhoaezGcDN7e3AiN6opCAgLwjEbpw/GFeK6tqZBB4qceG2CvW5xeD01ckaSK0tBAxggVvliNbKVPLKVfLCCMcEPA1UashtqQRN2qAf8uuJjvPK3fCaKRYQV1NLgI+UR+XFC90XJBW/ki3BZQphoyYOvZo+jssYiaz5h0rM158xX9AtQfv9WoJtB5578mlSyf83RadISnAftV1zIV+mKjKAAt8zicSIvW80B+ubKl+bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOLd93KQ53eD78+Yybqy1McW0RXa8hSYRhEptVG5QVo=;
 b=yfrtIRTvhKAOKWP2YqFh9axU6UYmMk4OS1rn/FMNPfpZYnB+frI9NXc0xWmnP+B7KFq+CjS1tTyMXHe8AWYbI9q3SKqZFmyP3mLVr96al9wclmPyVMpgFVOCiaVv6qQnLyj9lOXbdl4EPBpEw3Fct0As7HOfJDZJYuJmJkw8lfdj6SqDWWM3Hkuns+rA8t6/E/RXrMAraBWzV3hqXhH+Gbu9+c9o6tnY9EQzBibZ+nLfGKrW4UR7lROrag6vDv1td4p1iMxGX13O08JwblBCIMnaXsV7R/6O+ZuVKuVOaJ2cYXO0HY8cj/gGf7ATYXXsXjoxcrXN/NMxU2t2tyIiug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOLd93KQ53eD78+Yybqy1McW0RXa8hSYRhEptVG5QVo=;
 b=qfwUhrIGNJ2/9FLQ2WgZsV/XUdlSWXdiOJFMi3G18ZmnBa9keaPq9Db3DdZ6URMgix8RVwVx2uBfRQ74t508DNf6Lq65IEl2DNtqJWs7UibvTDY9ZkvTLXSCFDY+19SQw6ViCC2bMA4U4K/N/XBMUVgotAmIgSExmzHj1bUDtMotIid/BwOVvllH8GLzE6vDdg0L4XDlXc6JzVKOmv5Y/+001vN9JydEYHBZtbJYW88TQs2E548BivfyIhX2xawyv48PTFEw1iR48EiCbxsksjF/AUId5/FmyvjH0bF9rt72POLQQHsIqfXk/ch2osrSWizs24KhvJjlp7tHYJ0VXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DBBPR04MB7769.eurprd04.prod.outlook.com (2603:10a6:10:1e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 10:24:41 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 10:24:41 +0000
Date: Tue, 6 Jan 2026 18:26:08 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Yannic Moog <y.moog@phytec.de>, Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX95
Message-ID: <aVzjQEhpv4fenAWF@shlinux89>
References: <20260105102412.6674-1-stefano.r@variscite.com>
 <20260105102412.6674-3-stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105102412.6674-3-stefano.r@variscite.com>
X-ClientProxiedBy: SI2PR01CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::14) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|DBBPR04MB7769:EE_
X-MS-Office365-Filtering-Correlation-Id: 11b2f83c-5c87-46ee-6f9d-08de4d0dcda4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|7416014|1800799024|52116014|366016|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?jbZcoE9WovjxbRv2VOci8WzIgB1Lhf83eE1uPzD3YrvrjSKJHHsErqn1AlDf?=
 =?us-ascii?Q?Un1Tq+6Y8spp8S0kRQ3mejPNvWsIgZ7nACMxiXqTsRBwUCrwfJCz6uNgy/Ul?=
 =?us-ascii?Q?JKAM7YAtiIWfJ2fa5+1KT+eD29AtOZf5Dfj17i6IwnvBe8Iirw0rHXU8r14W?=
 =?us-ascii?Q?zwmUQC2oy53jOUVbUngk0LhDEI5DMPbdAqAI0Lyh0Qux1JLn2MRUbKx5leAU?=
 =?us-ascii?Q?r8nQWqDrg2Gd1HcPje0n6vBPx4IAWJOtYtczrvsNIBiEt7WgnqrIEpUSUwVk?=
 =?us-ascii?Q?egmcxl3N25RmnRQEFqRtKqaSIaALstiR8+8UNSGde5oCd0OEJNWsvi4DaLBw?=
 =?us-ascii?Q?rYi7RCdjN9XMvWGgMT6YlZg4bIT60jl4lOzAc7ToGBQFPVK20/bTahBLjKnM?=
 =?us-ascii?Q?7dUBBM5pRVDlqblPd5+mhtuXL6fWqV2EPkE9KQv4bQzOiBSnxJud9htAHZl2?=
 =?us-ascii?Q?xuK4SOoF+2FWfUJ9tGihR2SLyrNm7W1ubSebO9WiN9DvBBbPO3OZUrBUU245?=
 =?us-ascii?Q?WLGRerBUZ3FQHbiN7kX+9CIt/Al/xView4E/IxaREyjrzqbSuXcZeh8zJpTq?=
 =?us-ascii?Q?RJrQVLwdDDNNVYrMFGRKZfsdtli7fVoq5HUd9FaBJPL79O5MNkbSQJ38aEii?=
 =?us-ascii?Q?AKGBqtEasGz9UAwF/RE47vH4dRgA9+En0lBbXB4XA9zj55BlwppSd/2tcwgC?=
 =?us-ascii?Q?lb11r9gXs6qrYROxDXTo9um+0mJv18hxJJcuq/cOtucg9CFWu6vIXVHgr5NU?=
 =?us-ascii?Q?RWy5xXN3YxahqDf/HM8bCXrGXdRVbK74EGJwYwctN8Rmau9pYpiu0C/lYWq5?=
 =?us-ascii?Q?sxnAa7CcXu0oYrqJWcb9oYmWlyd+l35/ms8KCodrCnGqKHrSx3disg25pGQZ?=
 =?us-ascii?Q?7/nsx7ADouCjhGtL7rcFwV9s93y7mERXDVAiFwJngwZvCQwBLyQo2AwVR+iY?=
 =?us-ascii?Q?ZZ6Q8QX2WZThO7QWjjbQu+OTR2Pa+lg8OV/l9KCU2K45x0929TwYi3R7Un7i?=
 =?us-ascii?Q?pDSY70tHbkI9XBDMclJrT1ZHpawK2RO0hOQljCrXthss4Gzfg03hgSqz+swC?=
 =?us-ascii?Q?XATUfpbTmnWPp8fKQzEMbzjrVJURRpgllVttZMZTVnSZoCyOjfKN1R9olkMz?=
 =?us-ascii?Q?afiqRgvNbUlXcwQoZujWcSfqmhNtUiCM4VhNMFQYrCfLu33TP+lgjmDeyqZu?=
 =?us-ascii?Q?uZAwZoIG383HBoZph1a+I0Or9c71pdF0Wo/+xJQLT//EgOGiwTEre2+yIWNM?=
 =?us-ascii?Q?+dWG4EQpmn/t5Qeie+3F5Dcq2HcbqIWcPOX3LxVCdqP4UxwPu8TRuOLhUIab?=
 =?us-ascii?Q?OPMynFb3vlPs2dZvNGOEA3KLGurWFlid2Un5eCy/HOW7PlhmyGjKWQPSOyuw?=
 =?us-ascii?Q?4tZkQuuXL404+f9rQvbv2WpSybN2iwgb+BYBPf/d1a0ibjV1sMTMBD8wzpxK?=
 =?us-ascii?Q?qmXk/8u4tGByY3eHGuQpxfoz/uWAr/bb2A0rNDvAytZEN1E3jF3pIg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(1800799024)(52116014)(366016)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?yuL5m9kc60RfEt8xJL8L184Ex2YyPMCuk7dsuGH0F2Y2ARYk7okynqylXINL?=
 =?us-ascii?Q?hqSeeclYl9YSEdzMm0G/dmibFzkCVZApIVMQym2WuuQ/imbKEuTn8l/ecGWo?=
 =?us-ascii?Q?20u3lPQkJ6jwE5NQRHZ/fe6Y3jSp42ztg37kkqi3dn8UvPAJT2ILVJmEWPau?=
 =?us-ascii?Q?ZU4DgJQ313hvTJrPIUD1r7aWVJzYHz0tXo4SWV4SqWUlV/yPorbqswIlV2MS?=
 =?us-ascii?Q?3tdsRVCa4eWNKStHEOc8XnuY7Q6+QXsj7tlSxuSreEbdEvgyjG4JC0f+4G58?=
 =?us-ascii?Q?3zNSwNPpma21nILXbKu16FF5v/8Wbn5pjWkQmspt7EQnOUtwejmRgcSk2xUo?=
 =?us-ascii?Q?SZkdOskLbA6pA9PEnKzyTzVIrn1VEFpU8noXuH5Dmt+SANSwYiJlIS/QoeiQ?=
 =?us-ascii?Q?lo2/unFU3z5U/vPGGMyuBw26tZPEQ2s3cZiobbaDyr28FqwnCA1A+BiQh2EP?=
 =?us-ascii?Q?cGhPK7rg0UEPpkjCPwCTBfztBU+jyinuZJx/SYhXEMtr9SEu+aCwVWXH6mHw?=
 =?us-ascii?Q?L4fD1fwLuCJqxVYrVkIm7YjDfG3axKFvIU0UTn+VjzRXNQBHCKgHC8tx5b2o?=
 =?us-ascii?Q?Yn9e1+T8WU75HoSc2ty2CtKM44YJ8xO+F7t8P5H+j6V5ZFlVVxfOXZ3N5TKs?=
 =?us-ascii?Q?hurys3pfathQH08DUUoDkPjkCIztPs8W+/obXb44T8fG4Of5crWx3rtOfz3D?=
 =?us-ascii?Q?QD/dHspRi2lT49oDydLSLekSmcrcDekj0Ls8y4VJPvqXnaNBh4zu6sQNNmDc?=
 =?us-ascii?Q?WcHGvONjPtjq4LOBZtOOSaYq6ic9QgzTX/0XS4MG6EM/zfbwcoBma3Yh0Qmt?=
 =?us-ascii?Q?fGVHqWB8r/rNF2ZDIPJAXw09HpJaNl//JvDV1CYDyBWSd5+WakPyCKktQZvN?=
 =?us-ascii?Q?BF1unTh0ViG0dhA/0+oy74hHzwsTjCHnNtJ2J9F1WbFMqIMJxXOZkroPuFQ3?=
 =?us-ascii?Q?s7W70qPSpAkwXbcAgUCFsBp1dXoGDxmLdMPPRlGuvYof4wQAwNNJaU9Wvu3U?=
 =?us-ascii?Q?yHDUR45sM0lDovLeHRjCze2qoKxcSlxbmptZ1qPCG09pjbihtAZbSosNlGt9?=
 =?us-ascii?Q?DiolIJ5gWDSwSx+LYcO206Vq/cENpOohG3HP1oU1px4OJFOBC1+THwuEaUGL?=
 =?us-ascii?Q?3YvoNsn71cR6mJHVAwhbHvVmgor+eqtu1KnzRXuWZN7y2a3UPl/UfZO88XOJ?=
 =?us-ascii?Q?NX4rN20lTisGwX/MMWDTVrR3sZH6NX6mdy/1ERn+GM6ey8PieY3xkx/KKFXJ?=
 =?us-ascii?Q?epN/wYRtVNQ5TmmUsLsTrASrrafSbM3W6vLvRTWCJJNEokIKcmbdjtB6ohQO?=
 =?us-ascii?Q?SiAGtWoTQb/qMtaBf/i4C8TkXvqPCnAaP5ZhQ2wfRKaNM5t79PhK+ZGV5he7?=
 =?us-ascii?Q?gEZOB5v15pJIKw672eOniuRQDgOqSOboTR1zRRXOqOlq0DY0nEgYd+F5z+9j?=
 =?us-ascii?Q?vS1L49y22XdWdrU3Dzo43K9mEXPVhpSKjyL7mcj4lfEBTSj+t4xGBEFwTxVo?=
 =?us-ascii?Q?WPknFHvZ3vHIqQronMQhf/18tEqQDh1PTX/bgEg5+UAMT0OQuSp4mjDMdvfm?=
 =?us-ascii?Q?2t90w6LD0tqJPWJiS8/f6WJRsuNpqD2MHYhP1PG3TY9uRu85L09P73axW020?=
 =?us-ascii?Q?+pk2sk4ZSu1F+yB7Q+i2ege2GMWm1V8/Ms0128mzRsN/mnPYhtptnj171vyw?=
 =?us-ascii?Q?VM8s5ruGSm8z5uzlymq+HFoE8Ntz2MmA/W6agN3MUpXesVRtkZ4d+cT5PAXr?=
 =?us-ascii?Q?ljXLsV1zLQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b2f83c-5c87-46ee-6f9d-08de4d0dcda4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 10:24:41.4773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xtvb3+0ERCElYUVt1tcTlNVzleVxuzdduDMcY+L46Cz7KRw04TXd3xX6yqq8zuK6VxC/r0cpvTIw8DdXHdRC3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7769

On Mon, Jan 05, 2026 at 11:24:02AM +0100, Stefano Radaelli wrote:
>From: Stefano Radaelli <stefano.r@variscite.com>
>
>Add device tree support for the Variscite DART-MX95 system on module.
>This SOM is designed to be used with various carrier boards.
>
>The module includes:
>- NXP i.MX95 MPU processor
>- Up to 16GB of LPDDR5 memory
>- Up to 128GB of eMMC storage memory
>- Integrated 10/100/1000 Mbps Ethernet Transceiver
>- Codec audio WM8904
>- WIFI6 dual-band 802.11ax/ac/a/b/g/n with optional 802.15.4 and Bluetooth
>
>Only SOM-specific peripherals are enabled by default. Carrier board
>specific interfaces are left disabled to be enabled in the respective
>carrier board device trees.
>
>Link: https://variscite.com/system-on-module-som/i-mx-9/i-mx-95/dart-mx95/
>Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
>---
>v3:
>- Fix specific node name with generic one
>- Audio regulator cleanup
>
> .../boot/dts/freescale/imx95-var-dart.dtsi    | 461 ++++++++++++++++++
> 1 file changed, 461 insertions(+)
> create mode 100644 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
>
>diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
>new file mode 100644
>index 000000000000..ac9691aa73f3
>--- /dev/null
>+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
>@@ -0,0 +1,461 @@
>+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>+/*
>+ * Common dtsi for Variscite DART-MX95
>+ *
>+ * Link: https://variscite.com/system-on-module-som/i-mx-9/i-mx-95/dart-mx95/
>+ *
>+ * Copyright (C) 2025 Variscite Ltd. - https://www.variscite.com/
>+ *
>+ */
>+
>+/dts-v1/;
>+
>+#include <dt-bindings/leds/common.h>
>+#include <dt-bindings/usb/pd.h>
>+#include "imx95.dtsi"
>+
>+/ {
>+	model = "Variscite DART-MX95 Module";
>+	compatible = "variscite,var-dart-mx95", "fsl,imx95";
>+
>+	memory@80000000 {
>+		device_type = "memory";
>+		reg = <0x0 0x80000000 0 0x80000000>;
>+	};
>+
>+	reg_1p8v: regulator-1p8v {
>+		compatible = "regulator-fixed";
>+		regulator-max-microvolt = <1800000>;
>+		regulator-min-microvolt = <1800000>;
>+		regulator-name = "+V1.8_SW";
>+	};
>+
>+	reg_3p3v: regulator-3p3v {
>+		compatible = "regulator-fixed";
>+		regulator-max-microvolt = <3300000>;
>+		regulator-min-microvolt = <3300000>;
>+		regulator-name = "+V3.3_SW";
>+	};
>+
>+	reg_audio: regulator-audio-vdd {
>+		compatible = "regulator-fixed";
>+		regulator-name = "wm8904_supply";
>+		regulator-min-microvolt = <3300000>;
>+		regulator-max-microvolt = <3300000>;
>+	};
>+
>+	reg_vref_1v8: regulator-adc-vref {
>+		compatible = "regulator-fixed";
>+		regulator-name = "vref_1v8";
>+		regulator-min-microvolt = <1800000>;
>+		regulator-max-microvolt = <1800000>;
>+	};
>+
>+	reserved-memory {
>+		ranges;
>+		#address-cells = <2>;
>+		#size-cells = <2>;
>+
>+		linux_cma: linux,cma {
>+			compatible = "shared-dma-pool";
>+			alloc-ranges = <0 0x80000000 0 0x7F000000>;
>+			reusable;
>+			size = <0 0x3c000000>;
>+			linux,cma-default;
>+		};
>+
>+		vdev0vring0: vdev0vring0@88000000 {
>+			reg = <0 0x88000000 0 0x8000>;
>+			no-map;
>+		};
>+
>+		vdev0vring1: vdev0vring1@88008000 {
>+			reg = <0 0x88008000 0 0x8000>;
>+			no-map;
>+		};
>+
>+		vdev1vring0: vdev1vring0@88010000 {
>+			reg = <0 0x88010000 0 0x8000>;
>+			no-map;
>+		};
>+
>+		vdev1vring1: vdev1vring1@88018000 {
>+			reg = <0 0x88018000 0 0x8000>;
>+			no-map;
>+		};
>+
>+		vdevbuffer: vdevbuffer@88020000 {
>+			compatible = "shared-dma-pool";
>+			reg = <0 0x88020000 0 0x100000>;
>+			no-map;
>+		};
>+
>+		rsc_table: rsc-table@88220000 {
>+			reg = <0 0x88220000 0 0x1000>;
>+			no-map;
>+		};
>+
>+		vpu_boot: vpu_boot@a0000000 {
>+			reg = <0 0xa0000000 0 0x100000>;
>+			no-map;
>+		};

CM7 support still not landed, and VPU support also not ready in upstream.
You may need to drop these reserved nodes.

>+	};
>+
...
>+};
>+
>+&adc1 {
>+	vref-supply = <&reg_vref_1v8>;
>+	status = "okay";
>+};
>+
>+&enetc_port0 {
>+	pinctrl-names = "default";
>+	pinctrl-0 = <&pinctrl_enetc0>;
>+	phy-handle = <&ethphy0>;
>+	/*
>+	 * The required RGMII TX and RX 2ns delays are implemented directly
>+	 * in hardware via passive delay elements on the SOM PCB.
>+	 * No delay configuration is needed in software via PHY driver.
>+	 */
>+	phy-mode = "rgmii";
>+	status = "okay";
>+};
>+
>+&lpi2c8 {
>+	clock-frequency = <400000>;
>+	pinctrl-names = "default","gpio","sleep";
>+	pinctrl-0 = <&pinctrl_lpi2c8>;
>+	pinctrl-1 = <&pinctrl_lpi2c8_gpio>;
>+	pinctrl-2 = <&pinctrl_lpi2c8_gpio>;
>+	scl-gpios = <&gpio2 10 GPIO_ACTIVE_HIGH>;
>+	sda-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;

Per my understanding, GPIO_OPEN_DRAIN is better to be included.

>+
>+&scmi_iomuxc {
>+	pinctrl_bt: btgrp {
>+		fsl,pins = <
>+			IMX95_PAD_CCM_CLKO3__GPIO4_IO_BIT28				0x31e
>+		>;
>+	};
>+
>+	pinctrl_emdio: emdiogrp{
>+		fsl,pins = <
>+			IMX95_PAD_ENET1_MDC__NETCMIX_TOP_NETC_MDC			0x57e
>+			IMX95_PAD_ENET1_MDIO__NETCMIX_TOP_NETC_MDIO			0x97e
>+		>;
>+	};
>+
>+	pinctrl_phy0res: phy0resgrp{
>+		fsl,pins = <
>+			IMX95_PAD_GPIO_IO36__GPIO5_IO_BIT16				0x31e
>+		>;
>+	};
>+
>+	pinctrl_enetc0: enetc0grp {
>+		fsl,pins = <
>+			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3			0x57e
>+			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2			0x57e
>+			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1			0x57e
>+			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0			0x57e
>+			IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL		0x57e
>+			IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK		0x58e
>+			IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL		0x57e
>+			IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK		0x58e
>+			IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0			0x57e
>+			IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1			0x57e
>+			IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2			0x57e
>+			IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3			0x57e
>+		>;
>+	};
>+
>+	pinctrl_lpi2c8: lpi2c8grp {
>+		fsl,pins = <
>+			IMX95_PAD_GPIO_IO10__LPI2C8_SDA					0x40000b9e
>+			IMX95_PAD_GPIO_IO11__LPI2C8_SCL					0x40000b9e
>+		>;
>+	};
>+
>+	pinctrl_lpi2c8_gpio: lpi2c8gpiogrp {
>+		fsl,pins = <
>+			IMX95_PAD_GPIO_IO10__GPIO2_IO_BIT10				0x31e
>+			IMX95_PAD_GPIO_IO11__GPIO2_IO_BIT11				0x31e
>+		>;
>+	};
>+
>+	pinctrl_sai3: sai3grp {
>+		fsl,pins = <
>+			IMX95_PAD_GPIO_IO17__SAI3_MCLK					0x31e
>+			IMX95_PAD_GPIO_IO16__SAI3_TX_BCLK				0x31e
>+			IMX95_PAD_GPIO_IO26__SAI3_TX_SYNC				0x31e
>+			IMX95_PAD_GPIO_IO20__SAI3_RX_DATA_BIT0				0x31e
>+			IMX95_PAD_GPIO_IO21__SAI3_TX_DATA_BIT0				0x31e
>+		>;
>+	};
>+
>+	pinctrl_uart5: uart5grp {
>+		fsl,pins = <
>+			IMX95_PAD_GPIO_IO00__LPUART5_TX					0x31e
>+			IMX95_PAD_GPIO_IO01__LPUART5_RX					0x31e
>+			IMX95_PAD_GPIO_IO02__LPUART5_CTS_B				0x31e
>+			IMX95_PAD_GPIO_IO03__LPUART5_RTS_B				0x31e
>+		>;
>+	};
>+
>+	pinctrl_usdhc1: usdhc1grp {
>+		fsl,pins = <
>+			IMX95_PAD_SD1_CLK__USDHC1_CLK					0x158e
>+			IMX95_PAD_SD1_CMD__USDHC1_CMD					0x138e
>+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0				0x138e
>+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1				0x138e
>+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2				0x138e
>+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3				0x138e
>+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4				0x138e
>+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5				0x138e
>+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6				0x138e
>+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7				0x138e
>+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE				0x158e
>+		>;
>+	};
>+
>+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
>+		fsl,pins = <
>+			IMX95_PAD_SD1_CLK__USDHC1_CLK					0x158e
>+			IMX95_PAD_SD1_CMD__USDHC1_CMD					0x138e
>+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0				0x138e
>+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1				0x138e
>+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2				0x138e
>+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3				0x138e
>+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4				0x138e
>+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5				0x138e
>+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6				0x138e
>+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7				0x138e
>+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE				0x158e
>+		>;
>+	};
>+
>+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
>+		fsl,pins = <
>+			IMX95_PAD_SD1_CLK__USDHC1_CLK					0x15fe
>+			IMX95_PAD_SD1_CMD__USDHC1_CMD					0x13fe
>+			IMX95_PAD_SD1_DATA0__USDHC1_DATA0				0x13fe
>+			IMX95_PAD_SD1_DATA1__USDHC1_DATA1				0x13fe
>+			IMX95_PAD_SD1_DATA2__USDHC1_DATA2				0x13fe
>+			IMX95_PAD_SD1_DATA3__USDHC1_DATA3				0x13fe
>+			IMX95_PAD_SD1_DATA4__USDHC1_DATA4				0x13fe
>+			IMX95_PAD_SD1_DATA5__USDHC1_DATA5				0x13fe
>+			IMX95_PAD_SD1_DATA6__USDHC1_DATA6				0x13fe
>+			IMX95_PAD_SD1_DATA7__USDHC1_DATA7				0x13fe
>+			IMX95_PAD_SD1_STROBE__USDHC1_STROBE				0x15fe
>+		>;
>+	};
>+
>+	pinctrl_usdhc3_gpio: usdhc3gpiogrp {
>+		fsl,pins = <
>+			IMX95_PAD_GPIO_IO27__GPIO2_IO_BIT27				0x31e
>+			IMX95_PAD_CCM_CLKO4__GPIO4_IO_BIT29				0x31e
>+		>;
>+	};
>+
>+	pinctrl_usdhc3: usdhc3grp {
>+		fsl,pins = <
>+			IMX95_PAD_SD3_CLK__USDHC3_CLK					0x158e
>+			IMX95_PAD_SD3_CMD__USDHC3_CMD					0x138e
>+			IMX95_PAD_SD3_DATA0__USDHC3_DATA0				0x138e
>+			IMX95_PAD_SD3_DATA1__USDHC3_DATA1				0x138e
>+			IMX95_PAD_SD3_DATA2__USDHC3_DATA2				0x138e
>+			IMX95_PAD_SD3_DATA3__USDHC3_DATA3				0x138e
>+		>;
>+	};
>+
>+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
>+		fsl,pins = <
>+			IMX95_PAD_SD3_CLK__USDHC3_CLK					0x158e
>+			IMX95_PAD_SD3_CMD__USDHC3_CMD					0x138e
>+			IMX95_PAD_SD3_DATA0__USDHC3_DATA0				0x138e
>+			IMX95_PAD_SD3_DATA1__USDHC3_DATA1				0x138e
>+			IMX95_PAD_SD3_DATA2__USDHC3_DATA2				0x138e
>+			IMX95_PAD_SD3_DATA3__USDHC3_DATA3				0x138e
>+		>;
>+	};
>+
>+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
>+		fsl,pins = <
>+			IMX95_PAD_SD3_CLK__USDHC3_CLK					0x15fe
>+			IMX95_PAD_SD3_CMD__USDHC3_CMD					0x13fe
>+			IMX95_PAD_SD3_DATA0__USDHC3_DATA0				0x13fe
>+			IMX95_PAD_SD3_DATA1__USDHC3_DATA1				0x13fe
>+			IMX95_PAD_SD3_DATA2__USDHC3_DATA2				0x13fe
>+			IMX95_PAD_SD3_DATA3__USDHC3_DATA3				0x13fe
>+		>;
>+	};
>+};

Better keep scmi_iomuxc at end of the file.

Regards
Peng
