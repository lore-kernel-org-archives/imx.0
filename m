Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011047.outbound.protection.outlook.com [40.107.130.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939B248B376
	for <imx@lists.linux.dev>; Fri, 15 May 2026 14:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778853724; cv=fail; b=WsGY0i2BerBPB/bm69bTXbXm81YMR6p+D6T+yimeHdpqK0ojhIeO3TfcaHkWs6VbBRcwxVjOvAT0Kgok+1Ep74rSsCbmVnEZGT9BweCPcMN7HaMzwmZDwgeiosVPUlQfLD+1oeLuH384Fql1gM9I4IpkWZLrvVVBVus8P2/IYb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778853724; c=relaxed/simple;
	bh=u/2Ha8dwVeGNHYZ5knPlAL8fjbFwpq1Ym0l8ESQs2BM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CJJHbxUMXaLkP4Q1/MWKYhuzt0UYe1jH6De8gtkg5jOpr4jEY2/f5gUpVrXD4kNO+UzfcNymUl6Ctft4eCUyPP7fQlXdW0BBmyTxYxvYGx4Rc4JBDcP5AEg56OJbbjRV5EoonWonlQvAO/7dVjJWjbL6B+QW5NHAu+8iX1cxedE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=I2cif1VV; arc=fail smtp.client-ip=40.107.130.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="I2cif1VV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAKSOlOk2NwYpZgzrmw1AmhlfomXUzNfi8dO8FFa+EwPK95bz9JxDM9XX+YdDXmaVX7IIHHLHY0t1gHzht46oqbJWHedAmoBHRD30Tv4MQ67BV7jQMOb3IiQVD6wKKULAFbTEkqjOWI5l2/hQiTCG6MzDu4tHXtLHjRCjy/cVl/sZRpxMIQBtVKXuYaVq2iq3tz7FlXPGmnyCvgsslWWn8uqqDuEtB+2lbh1QWEnB5jWQg/x8QYqdDV4MQqap2/VTh9ngk22Mkmg2osJ5ShBR7gOIGag6WGgfsrl+W9DiF6FfE5GhQ5IzR4F5hMreAq4MGHSS2PrehAW2XGhZgYlkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhDCX0BeBYnwWA32ZFaR+chaz72usXB4Mf6HfsvuBiQ=;
 b=ji6EjuY13TUYs+EX0sD9JIvUu/gmJ0oniy3svMkfhk40BIkb2vzVfhoIEfTV4+N9ZVh43pOHxSOFFa+zn6muPzopoy1Eb5xhwwMAm8cHq88g+4HcmzwdtkCVfVXBJdVVqXET+l7g6fjedDtY4gHngII/5sTA0hgqM7BUaEvYrA688mWJ4wWfA9pDG4pVspTgs+kvb/F7r+TG+NfvyVZS/HaCsDJnogthLub+OKk17wKdOy4TpXvmxZNNtDFgFPjJhFRVcduWtEls3PZOhhvA9Ycs3wlqSkEC2ClAMOlp3FSKgF1iu7Jp/zYfGP80evIYuVxt3heLG5NGhH7VEfJoVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhDCX0BeBYnwWA32ZFaR+chaz72usXB4Mf6HfsvuBiQ=;
 b=I2cif1VVZ3UvVdhkO3gq09yntN53jixfVPHb+E1NeNzkLMGSmslcH3E4JMOvh5zfJHnQvfBPbeQF1R4s5/uUsyGpdfE6/JWDJP9bYDenSY0t17Rodcw/5fWdMZtE42GWw9pKL3Y+GcCEHGByFkIDNcFK0mgw5/3HEaA494BJ0ZLpCnrXD5xB8erYuhS03ZtWT32wJklUWc3WF3g2raV9WjN8wbkeTa9LVuhfnNS4bXCpPS1vKKckMkUNfe7c78KN4t7ZBCqZx1nq2s72G8W1B9p8UyCxQ81qyIWQ/N3QpqU8UPNrEkXpdK612BMhZvuOhGzemCD9IbX7F+5yeOpBng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10945.eurprd04.prod.outlook.com (2603:10a6:150:21e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 14:01:55 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 14:01:54 +0000
Date: Fri, 15 May 2026 10:01:47 -0400
From: Frank Li <Frank.li@nxp.com>
To: Robby Cai <robby.cai@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com,
	sebastian.krzyszkowiak@puri.sm, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: imx8mq-evk: Enable MIPI CSI and dual
 OV5640 cameras
Message-ID: <agcnS4H_XJRL7duw@lizhi-Precision-Tower-5810>
References: <20260515111143.2980956-1-robby.cai@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515111143.2980956-1-robby.cai@nxp.com>
X-ClientProxiedBy: SA0PR11CA0134.namprd11.prod.outlook.com
 (2603:10b6:806:131::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10945:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b0f5ade-fc8c-42bb-0921-08deb28a857a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|19092799006|52116014|1800799024|376014|38350700014|18002099003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	6K4y86AV+uRoEK8TqLCiX72kgqjHMdrN/n5WhTaioCZQcbJclrPimF0Z7wzdfyOOWqxCj++8vn9wokYDhDykbuOmJ9GdgnfGZGtWxcMX0gfovr0oGLYlsjX3+EbqF0yhEsld45MhVBMcIXuS8+nby9rwARibWfhgEj4MrQTmNoyF5XNPMhN77NVfFJy6bpWA3DJlwJTmDtQjZX9yASs1OhwG6vZklCasfH8JImobta3oQnN1YJ21P84sOhNXbBN249PnqcaQF/3w1ysqwf1NeD8UuMXtR8RWtKO36EheSb0JtS2KokYm0jyCfZJ1FGuRIb3zUEw/lmGf4xI8g+4Zv7cyUkelPRt9fBgWF2uqdPAtB8c6JASWQd02tgOQeTA2XPXvL7INaGrnX7DfsU0GDSLum4outIJv3zqs+nvT/YzForzvnhIpSUQD7k+YNOmWjz2xCSlSb5fxblv60XT99fGdtfkKt9zDYDWGf2dS65IioQsUd9bwbh94GUsqjQ/QfpdbxzVNxcUdCRoddoGCWOUq3bLz7ipei1XjHb62S9zYG4X3nIBN2iZZ2hcr315wNcI1+fGrNnCR90QLimDXX/e0m12pPdu3WjLauQ5Skk0NVvA8bJjJpMs8dB03cuMk37FbcikUKOu7hiyh0ZIwKoKXipL5AR8xEC6Bon+kXjDmQ5iYyAeLMC3XwXZJXXp6MVwCvjGHZgIDMhTwK+RWFA8msr62NchxRB8t9FnaUVlaymUop6wA4ChHFFAvQ/+j
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(19092799006)(52116014)(1800799024)(376014)(38350700014)(18002099003)(22082099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MWs3tX2d8ASSD1VgbsyFITWPjrMx+7P2dqGSNlieOjjRRI8RCyWjA4CPaWfK?=
 =?us-ascii?Q?ancUoz3AfLHuswBtnjk+5vzJOhdMbhCBjf6EPDSaY4JTEQxvPEBAnRL4a7HX?=
 =?us-ascii?Q?elaFDm/RTcEcaxvRrrxQrE81B3vfDs37Ut32C3YHZDgmo00Les9fmwSH5j2r?=
 =?us-ascii?Q?Gn4c5u9xg1VR8vGMjb2WhKpKezPR2Yal4ESqiP72LI4aP6soYPmGxfvGrTu6?=
 =?us-ascii?Q?8nl9K3wc7GoWgDtB2mqT33sCuXNuxPe8Vu8/FPb/UKaLOfEj/85oOlTzWx8d?=
 =?us-ascii?Q?rSWqqfwr3QdUWUzHDbDW4nbkPfueX5LtTsJY2Tym5afYcQ+BF5WljITZumZo?=
 =?us-ascii?Q?HV9jbHWUR3L3JBdJ6xeFfRURcjbBgx+d5zfmZx5ZFHi3q/q3Jatj6IgjWrKd?=
 =?us-ascii?Q?bFflr0D6pUYTLkoCMVmBI5TttzaLc5s5is455dm9cmfYfSqiOpExZPACQyCz?=
 =?us-ascii?Q?GEc3ti7x8SWw6+FmeyWVvKsUQ0qDPjMF4Acg6YSMdHqZw7shG8RrTEiiXepL?=
 =?us-ascii?Q?+bDMdl4deYuJT+xcI/Qugs9jeZdVRm6wGDWe44LBOrEJPE/XR7rjatbK8Hqx?=
 =?us-ascii?Q?Ar8R9Xpdfx5TeGDDZFyxINFf/s8waruJK59wg/x83+fxRVAMqnDR2cVCsUfk?=
 =?us-ascii?Q?GRWk+TUZSA+hL05FmcykVKqxe4w5yWi5QXoPF6Me1Xlr26O2LwNcRg51HXQL?=
 =?us-ascii?Q?bj1p4dPcQh6cInMtL/nHm3P98vRZq23SqHpnwzQ9OVl/NK7tkW693BK2f3gb?=
 =?us-ascii?Q?MBkYQHEAUdbM8AEWBhRtFtDo/2VMQwE81idShvrsqVi4K7ZUbmNKreZsGlZ4?=
 =?us-ascii?Q?ADOFTpnj4Nd3lDcfAMHBY8HKKqeaO4rBUYotjk4rWYkccwelWzGq/UI1LpCL?=
 =?us-ascii?Q?ydcM3K8LmbeeTgn8K4wHc11SMlClipwK0RSyeeufUzsAqgKRWb8UgFO10xaX?=
 =?us-ascii?Q?HafQkK5NNUP0q0t2HbYevqTgSlUNv9RLwLyc7KIuF+g1wI2icMqq66jt5bhz?=
 =?us-ascii?Q?jn3+eA3pVFWtiNfUXf3RpmIqNVmLFh4mB5Wl+qbx6uKdbzQRdHYIFiIzpl5O?=
 =?us-ascii?Q?v7MSe2OEZ0F3LaLQnTZ+w+uRxFymvF6o2gVzE6Y5QpAbqobhFvGwhfQ8R/nG?=
 =?us-ascii?Q?Hh784pNBG/yXGKJIYoE3O3sy89j6aMhpW6btCqdjt/cML3jztGDGHJtxkSo6?=
 =?us-ascii?Q?bvVua3/fHAN6eeH5jIRQPsi9RQUPs+YCHPOquNIHwM0dSSLqR9eQRbxCF5fU?=
 =?us-ascii?Q?QH6qPj0vecUS6GGQPUzWmtcXnVCWSscxtnpvzOmcipQK6yH9t0lamOFk1bkJ?=
 =?us-ascii?Q?NO731urRPMNGWMhufyb/+3tj9OWogGLjdzfO2+OG2v4KHkwwCL0qmkAVRhG/?=
 =?us-ascii?Q?g55m7blyYmwgb6MbR36EiURLBjdLdHkhEbbVHVy7SFrhSzo2r/Lvc2oZ7psL?=
 =?us-ascii?Q?SYTnnD9IBwSRElRloLVnCea82ru63yaXIeU4alJP8+7vnJELdHv+qo+H6fq5?=
 =?us-ascii?Q?WB6kHeeFliLEalcdulwjhOXpFsrH+lBpMwrE20Bbgs6X7XTDk4ZvcbENJGyn?=
 =?us-ascii?Q?PR053uMidzlKpIu04bshn3Lhtbq0lVhVjJjy1O8R2zbBZXLblwurmgl2nhZW?=
 =?us-ascii?Q?LUV8+UEGMZZkOIjmJpEjtQVdTvmQqhwf0QkCvOLifJRiYe0rQ7Aabk4r2NVw?=
 =?us-ascii?Q?79o8RpEO7NoPQrjjHmwAyGS9bDXOrLb9dugQQJ8dUG/UeuFa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0f5ade-fc8c-42bb-0921-08deb28a857a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 14:01:54.9121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Al9xZ3Ufnl5DQYCC2U01DhTPjv4gkePhrEKCdR/mKoQ1t6BPqUDzhYsekWeOyZQnIwy4qEEYz1mQHQEQhQQpiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10945

On Fri, May 15, 2026 at 07:11:43PM +0800, Robby Cai wrote:
> Enable the MIPI CSI bridges and corresponding CSI-2 host interfaces
> on the i.MX8MQ EVK, and add two OV5640 camera sensors.
>
> The sensors are connected via I2C1 and I2C2, each with proper
> endpoint descriptions to form complete media pipelines.
>
> The resulting pipelines are:
>
>   - OV5640 (I2C2) -> MIPI CSI1 -> CSI1 bridge
>   - OV5640 (I2C1) -> MIPI CSI2 -> CSI2 bridge
>
> Both pipelines have been validated on the i.MX8MQ EVK using the
> upstream OV5640 driver.
>
> Both OV5640 sensors share a single reset GPIO on this board,
> which prevents independent hardware reset when both cameras
> are enabled. As a result, the reset line is kept deasserted
> via a GPIO hog, and sensor reset is performed via software.

Does reset_control_get_shared() resolve this problem?

Frank
