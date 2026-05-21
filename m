Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010014.outbound.protection.outlook.com [52.101.69.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E384A386C18
	for <imx@lists.linux.dev>; Thu, 21 May 2026 14:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779375065; cv=fail; b=kEMiB+YvpefdsWWkgh3gDXLVqxKxaJqzFaFAZbevCS+P08s5vd454bRy6WLITRpdjDnzCdsLXbY2gg375Tpz4NDQ0BelSs+xTyuTeJ6B6rIasPFdKrhJ8UZtbRVm4bNyTO6hZiDPeierlWMkjzIJRRfKxn4CE6MtevNVQKt6OGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779375065; c=relaxed/simple;
	bh=b5P9IU/be2UcrLDLpkkomcRApNEew87DB8iNi8nfzS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RnaKI3ENyeKpSJqMze/YQy+CDlPN5kSJGU3QX+vmAJOfSLkCndT/eVN0nVF0Udo8GE7Ot44x6VmgWZO5Exu6iedQ3xfX2vcOVObp0C4UL+pdUep5wGaK1AWkBK8fAiJbT0dur20qSBmffUs/EQNsyTF6K8Cckqoab5VM5a1Vr7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lud36jv9; arc=fail smtp.client-ip=52.101.69.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lud36jv9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OcJ19bpLyq8IFTy9jPrk77kHWkZ/xjHrM+CayNh+ZzXV/DrnvBu8BlLw7WvmBYV9mfnzCSTBJX2PR7H4B9H40N0ak1JI3zF9HJ33HB3Tn421OU/TX9mtze0Jtdpc8F6qIV2edm7yn/5XZDZGu1lfxaFyVCqZKYWZYEFU7GGyKKTmOu4ggXCA9CeB4jbfKAp0ZwDrUy5Z1/CZ8TziaXgVT+w5wkzsCMb9yT/JzWrQQ8e2R6g18n69OUW51VLzL3OIb20LDVEs35ONaIS3XTICbf79mmolApWkzFcCVmX0j8Ra/N5QLA/L/G1cAO5+Cmo8hrBKnmMa4mV+2t0utiZfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncEZCcICPDZeF3aJIZiyhwMXMxNucjOznM2tSoexKuA=;
 b=sHVJt2X9Zh05ji0aWcSOXr6Xf9xOqYsYcZ7caRgndjzoHskkVay3eWj6DZho0KMa98JcUuDb1E3VoGWCElMX8RYr5vgo4gGg4hDZuYww5189oitmTw7t9pF1LiWhupQTOcB/qm26P1YumzUtv+JyFsF5IqEo/KM2iMkTt4ahNel/4Y1iO6ehxWTYyE1DT9se5ma0LFy3vVxcIqfVyB7uK0+t9l+kFZ3/e6rx4VGVZi4QJuA+h8+vejzziGxnxLU1ZMXCXoBrBDEFlbjGqYE0kZERt+NIqSKCE0KirSjtYZnibIO19uURrlpIkQCUIppbOjgQo2098TqtIaidDs97vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncEZCcICPDZeF3aJIZiyhwMXMxNucjOznM2tSoexKuA=;
 b=lud36jv9XL0jn+N2BNPwAFXeO3RsMpPY0ICf3XvQTHZ+McLMBMcJHVtdFj9OnQETdIghMnMi9Ti0sTmBz74h54avrLIInjNjqbrACfh5X7omDQsbS4dIGjsRW4GFfQV5Epw6V27swNVv/f0SA/zNZUTHx6DTwpeLGXA5TtqC+tTBnF2G+06Fnu7Hx4vCiLy+pjnImmRfkaopYOmM4/Wlrg04VEC62QhJiojNJFOXz8sPl9hgJuIApcqCEyL0Vwee9gqpPdMsOPkM+FhkumEH3z7teNMIxqFaqpuYiXJu8+1YnVq4m5F/isnYZxwXjyt1eVPNk5FZH1wOPff9FRx7Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7625.eurprd04.prod.outlook.com (2603:10a6:10:202::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 14:50:59 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 14:50:59 +0000
Date: Thu, 21 May 2026 10:50:50 -0400
From: Frank Li <Frank.li@nxp.com>
To: Robby Cai <robby.cai@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com,
	sebastian.krzyszkowiak@puri.sm, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: imx8mq-evk: Enable MIPI CSI and dual
 OV5640 cameras
Message-ID: <ag8byj8ZavKyxWRR@lizhi-Precision-Tower-5810>
References: <20260515111143.2980956-1-robby.cai@nxp.com>
 <agcnS4H_XJRL7duw@lizhi-Precision-Tower-5810>
 <20260520065452.GA2269979@shlinux88>
 <ag4C6MjnOJGjEpKN@lizhi-Precision-Tower-5810>
 <20260521114952.GA215762@shlinux88>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521114952.GA215762@shlinux88>
X-ClientProxiedBy: BY3PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:217::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7625:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bdea2b2-d33a-47c9-2fd8-08deb7485ecd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|19092799006|7416014|38350700014|4143699003|56012099003|22082099003|18002099003|11063799006|6133799003|5023799004;
X-Microsoft-Antispam-Message-Info:
	8SotFQ723ryQqzErakfFWoVhOSLjDdKyhpb4aUGIzCYrAhIG+wtiDWMZvEz3bLybCYxYJ3wjGW2NgQ1fjwdxx8VoBUonavRnt8FpuzfHI3U4PgKGclsraxUOx7EViV6rdW+FpbTwu/xaP9FccIA/zHUjYWvR6Qw5TSTMYYbOUopBHbkb4XFBvHDgHKwaE6aeJZLzStL0eYCoxVJWwsrWm3P6N8Umy/+8MxEMnPwuijUFY8o4gcmXPcfEhvGibin+06FWqV1ypKJ69fxl6QnZ4+3ocDs3HbGUGmOxIjAQs5I5FEXKM+MQ57kqz3i0JEMOedNL5wgSRrecWxbLAiMi5/Q32XifSDiN37fHdnohzn9c85caMM+R4wls8Hs91PQSVfT4IB53NIUwSsf3UeGqUvpHFHuQiyBNOjBA8cP6JQmGejvb9N9FtZm04kRxjxVG2Es11H2udzYMcXLna6vCIKuaYKb4Ee6pL+RLtT7mJ+dAJIkZXvUV4JmU+HjVzy064WqCH0sQ68jBrAnBLz1DY76EzqVgkKK88hu2EZCJY9dZQbi4E8sa44BS/w/St1DQZA27s088S7SOpfnMV+v9ONa0Hf8qKeS6IOhCni36+d8LMnlJbS219CmK2IX9EB4YUGIP7M/Ep3CHpPFYHS1rtgYOU4M0nCcWQ0YCT/h4Uc+abI+unDKHw95xeLiaTumL9NNVGOXrqMh+J1dHEcHAemZeWMjDW2Gugui0R4Bbc9hLLUZ2RzblSdRYY5ly18yE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(19092799006)(7416014)(38350700014)(4143699003)(56012099003)(22082099003)(18002099003)(11063799006)(6133799003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E6+wASJHXR70Wk4GSWIG6KpTxguDlZipYnxtdKhOPEdFRAs0kgUK4HXN+33B?=
 =?us-ascii?Q?EZ76e4xBkp3Fc/ZXOoqdgi0PR5g69to1nYCZAKTq7dahEiwqwJctfqeLCaXs?=
 =?us-ascii?Q?fXs+hjrw3B2mgevrULR3rbayAyRYOpmrvmxiiIEHnmC5Oo8Tc5it7tIN+XwP?=
 =?us-ascii?Q?xqjsY9JSOXIhTppujhVdNjC5GYGV+mqCC10QU6XwiABYsF5dlgCj6zpkjbtR?=
 =?us-ascii?Q?ZpT55hO7LZxSvEY4Y0jlniNiTUNy5ONfkbkzuTuQNyWR0Jpw8AyhArfHf769?=
 =?us-ascii?Q?w5gLUs4J3T75DC1NlhKqt04h1FRQbxttl4mQ9emwYchNayzl3+Nn6LyyVEC5?=
 =?us-ascii?Q?9VYm40LSEVoqN7YZqpIHwhgnDUsI8SA8GeW09H4x4aXqEsGfQfwqkG0PwUrV?=
 =?us-ascii?Q?roJtebAcdeqXmllZtnZrB60yq0XGCidmcX8xhy6rjt3xzuo5upCk4Qi46y1q?=
 =?us-ascii?Q?2KFkugIWiS597mg8AtwWkDHY2hSa9MLikd/KSD4F0m4aC7NawoYBDDIxXzEZ?=
 =?us-ascii?Q?pwg7XIv4LjglybWAt43uuwkZduw6SseToQwews8MvpVkK4qrt2cE6ltiZ8dH?=
 =?us-ascii?Q?LeVV3HVLYNEjPbSyQMYvHMXki2FwtoKFflj1tKp43d+jGaxzTavo0nESvl7i?=
 =?us-ascii?Q?TI1ceT8qkOl65/6IsNQVnbWvY/EwmGZkLHVUlUX7QQZJuS+uMTKqH8rG4Cjp?=
 =?us-ascii?Q?PxLOYQJQHWiqDIbbvnEqmdTdlMA3KFfpUYvnFl74P+1/BZnP0Shrn9CXPLqj?=
 =?us-ascii?Q?zdfEKg5GC9q+3Ayx6D8FIwDgONPjiEpiqVbeQ90nEpLoIboz8hVuZThP39X5?=
 =?us-ascii?Q?RoLhug7q2xe/MxpKx+XcfUVRKxe+v3nXDacxR1S4cipxxq0PNRhtEfZUy3D7?=
 =?us-ascii?Q?X054aDOSdK+TpHo4jsJyhsTrIksdKLyB84+qT7cCR0olGLIKZtvyRLnYPdx1?=
 =?us-ascii?Q?qg0243193PK3qFpaE7Vh9Q8zhXTszT1NnXKO2UrEPLpt9siJFggpPc+tZ8+s?=
 =?us-ascii?Q?jqWKaMwHtJh8khhpu1bjDv+rcOK8mMVqdzIqf4ZOzerSK5WUNaq+iWZ3i+CQ?=
 =?us-ascii?Q?NOQ1lRJ6bjj3AaBb1gDUB/1C1l6CXUub81slYevzTSdKZVB3h512ctFKAega?=
 =?us-ascii?Q?fSf5szW4PHDyYDwg6N+w2qTuRshxTW4V9rIRTzlPT76F/scKihJSZkJ7TcP8?=
 =?us-ascii?Q?s5XEKE0TcUFK0k9LgyVT4rvucuxO0sYNTEvo+ZjGUoC30HDcsscOmSbV4IqY?=
 =?us-ascii?Q?0Rlbze2BpeRye/Jnru5fZq7HSOCl2yqWY+Un1G/phMD4tRjhi1AO1XGb99Z4?=
 =?us-ascii?Q?ryTfDFmcePCBncftBBg+8hNg8wCxM0qsJcmANzvgWeQlBrGfrOpVcs47IUNG?=
 =?us-ascii?Q?Bq3j1briKHef+8TLtTtQ622bMUBvkQrtaIYJBXhCzGHVADiOYQX18ovdteel?=
 =?us-ascii?Q?AgeNn5FtYUEobZLd9CV5Bycc8Ctdd9nV/iGLhk2R4zYp0F1nonSxQawpuvkN?=
 =?us-ascii?Q?sDFxp/9Po6OEylj8LKP56OYT5uGOKWP6o57Z2sJBEOXUk9+9SGBQvSs8j5O8?=
 =?us-ascii?Q?5keqJK8RyfVWjx75W3F2HRZkIDlP942KSvnrzEWOPUTG2aAeUuECchdJqiPV?=
 =?us-ascii?Q?cehm2APcrVuVOAa6sxbawyPM4mvfDkkJrh5b3eoX6HTR6zGgIODFLk6dMCWT?=
 =?us-ascii?Q?NayCtlPqMyK/eFHzqD/gIlWAVLZAO8rGUI6tGQLDw9If4ke5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bdea2b2-d33a-47c9-2fd8-08deb7485ecd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 14:50:59.0715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7SJif1T9ggxxRqhqzUqDGtoC87RntFLkHrMFzSfjlPrLgeWsLFjIc3fQZu0iyASnaxXMRjYXD5n0mqKJpixKDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7625

On Thu, May 21, 2026 at 07:49:52PM +0800, Robby Cai wrote:
> On Wed, May 20, 2026 at 02:52:24PM -0400, Frank Li wrote:
> > On Wed, May 20, 2026 at 02:54:52PM +0800, Robby Cai wrote:
> > > On Fri, May 15, 2026 at 10:01:47AM -0400, Frank Li wrote:
> > > > On Fri, May 15, 2026 at 07:11:43PM +0800, Robby Cai wrote:
> > > > > Enable the MIPI CSI bridges and corresponding CSI-2 host interfaces
> > > > > on the i.MX8MQ EVK, and add two OV5640 camera sensors.
> > > > >
> > > > > The sensors are connected via I2C1 and I2C2, each with proper
> > > > > endpoint descriptions to form complete media pipelines.
> > > > >
> > > > > The resulting pipelines are:
> > > > >
> > > > >   - OV5640 (I2C2) -> MIPI CSI1 -> CSI1 bridge
> > > > >   - OV5640 (I2C1) -> MIPI CSI2 -> CSI2 bridge
> > > > >
> > > > > Both pipelines have been validated on the i.MX8MQ EVK using the
> > > > > upstream OV5640 driver.
> > > > >
> > > > > Both OV5640 sensors share a single reset GPIO on this board,
> > > > > which prevents independent hardware reset when both cameras
> > > > > are enabled. As a result, the reset line is kept deasserted
> > > > > via a GPIO hog, and sensor reset is performed via software.
> > > >
> > > > Does reset_control_get_shared() resolve this problem?
> > > >
> > >
> > > No, reset_control_get_shared() does not really solve this issue.
> > >
> > > The problem here is not about software coordination, but about the
> > > hardware topology: both sensors are physically tied to the same reset
> > > line. This means any reset operation will always affect both devices
> > > simultaneously, regardless of how the reset framework is used.
> >
> > Reset framework is resolve this problem. It is quite common that many devices
> > shared one reset pin.
>
> okay, I'll try to switch to use this approach in next revision.
>
> Some devices require coordinated RESET and PWDN sequencing, but in this
> case the device can be properly initialized with RESET held inactive and
> controlled solely via the PWDN signal, which makes this approach viable.

PWDN should go through regulator interface.

>
> >
> > >
> > > While reset_control_get_shared() introduces reference counting to avoid
> > > unintended assertions, it does not allow independent reset control.
> > > In particular:
> > >
> > >   - A reset operation (assert) will still impact both sensors.
> >
> > yes, only when first devices toggle reset signal. Second device do nothing.
> >
> > >   - It does not solve the requirement for per-device hardware reset.
> >
> > It is hardware limitation.
> >
> > >
> > > Therefore, using a shared reset control does not provide true isolation
> > > between the two OV5640 instances.
> >
> > It is not isolation. Just don't allow second device to toggle reset pin.
> >
> > >
> > > Keeping the reset line permanently deasserted (e.g. via GPIO hog) and
> > > handling initialization through software/power sequencing is a valid
> > > and practical solution for this hardware design.
> >
> > If use i2c gpio, expandor driver may probe after sensor driver probe. So
> > reset may happen after sensor driver probe.
>
>
> Just to clarify, the reset GPIO in this design is provided by the SoC GPIO
> controller (gpio1), not an external I2C GPIO expander.

It is just special case. you touch ov5640 driver code, so need consider
more general case.

Frank
>
> Therefore, the "late reset" issue you mentioned does not apply here.
>
> Regards,
> Robby
> >
> > Frank
> > >
> > > This matches the intention of the upstream changes as well, where GPIO-
> > > based resets are treated as simple control signals rather than fully
> > > isolated reset domains.
> > >
> > > In practice, using a shared reset here can even introduce subtle
> > > interference between the two cameras during probe or power cycling,
> > > so it is safer to avoid using reset for runtime control entirely.
> > >
> > > Regards,
> > > Robby
> > >
