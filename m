Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011016.outbound.protection.outlook.com [52.101.70.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B8B33AD8B
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 10:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772791691; cv=fail; b=Q7k1mSikavbhwij4FexJUCWQrgD00Ce9ZZmLKP3IHSjvgc1Z75MgOhEJnNgdgXpWM8BCIfpcastG/uzsyvC+kgHifF5pWvV1Dps4hnBNBe9E6rU++K4/RaFGgT0fxSB/ICaiC01cjV98DrVmPWlJETQyaUXIpSui496Uk8Jc5tA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772791691; c=relaxed/simple;
	bh=EnLUQnHzLdKVxRk7Ft4ljGVaEhpf7UauZV3eHFZ1eyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M9scnRhM1k0oWvbNLGp4Rw39fWqjGpp1urLZXd7LcXuFposIp+WNiJEUIE/f/eVoYPocXY0ricCrtzRvDwc1XYLwBnucycmDWbTk2exeJV9xxw17HUueJTcAdQ3v2gWMt7LJgr7iYqt6BwC0rXyXkx67JR9cqZbBd5LhIZ4lbv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IvyjNevZ; arc=fail smtp.client-ip=52.101.70.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IvyjNevZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0f0UxubXmontRwKg8+fOaHGcin40pWny4MlOokkc5MW9yuflqhPEGusnwi1Vmx6OJFMYNJKUPp0zW/pNnHbd7NWITIJQsBjAfZrV/22dxjmeLfPDOJj5TjMtcawsGY8KhjUsbydxCzVYVHmZoNE6RhkXuwo2Og/LMIhl7aXk2yC0EFzehdXzrcVVHcalxAMXuVEEixfaaXcdx9z0mbgRWfQnXcE/7SYzMvq46VapzQ5J1Yv6pl14F79HNBSDGLRJiwfVY+1MEN45f+v0Rta+LAGZ/zwTAflVMfHrp6F8JZLsgu/zVzcQa0wi6hc5Z9dyz3gOO2jLwv2Pu4+kegcsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjxD2azxx86MtrhKnWbALaEngbdhn6j+ntNKGIi5nmc=;
 b=iftFtk09EJGxyLDJKDuj7aT1h0aFzN3QcTXgE9wo0QyjUVbdQVbrYy0yFiZ6K2olHUgcVRJxpSuq3BWIhM9EvbRN/44JBVbcjl6G2l9/x/cMXAvBZQf9EgHj6B9/0rMPKcfpwSlpH6NmiPdmBG8ivmvgaPyUb0Mkk+u1Oh9rSqCCoUUku0a7JoG0IfA7J+JlL3dpnexLCbzbvV0sHINRvJkfJNidyRZgZPFaRs2jBJh7MZN6hvfR6BA6KLRs9GA/E0doUtDwL1rnUfdbJeXKpfei6iDoNRiHhK6V8knzSqFRNmBT6lPnblIHSHXbSq6Gkl/z3g7bJqQr+q3oQPgYUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjxD2azxx86MtrhKnWbALaEngbdhn6j+ntNKGIi5nmc=;
 b=IvyjNevZ0q3V7ftgwKq6ACPOjtQ+Wi1oBUGfxDfOxMVHSjd+23XqcHNr5jmCxfdP7291WHdAHXAqSMyq0QUazceQ7wLxoR9ECgKhC9DdwtmmDnoSK/MfyLqko++FLjwnNPS1d/KdSxY+uLHloWnu660SsS9PJPKKogactfl2a5BIe/G6gMBmnmD9xY0n1EvkQQinjLebJTC6WnSlKQbGlMMDgBIoETt7zOz+BfTsabHBSSBR8itKxXk4+N0ju19FyGLdRLVVAataEUlXkFJSUB3mIY/C9TjgD6LQ+poiZDZdAY/T8dwAH/6gf9tXv3AUtQJFDJjQmmzoPbWoyyEMMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by DU2PR04MB8517.eurprd04.prod.outlook.com (2603:10a6:10:2d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 10:08:06 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 10:08:06 +0000
Date: Fri, 6 Mar 2026 18:00:26 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH 2/2] arm64: dts: imx943-evk: add Type-C node and enable
 USB node
Message-ID: <shfsnwlb5raj62vjkfdcz5mopyq4raaabquwxmc2gyeeois5r3@gmxqk2svtufx>
References: <20260305075527.1116943-1-xu.yang_2@nxp.com>
 <20260305075527.1116943-2-xu.yang_2@nxp.com>
 <aamkWBGOPDlc8Bxu@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aamkWBGOPDlc8Bxu@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: AS4P250CA0024.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::17) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|DU2PR04MB8517:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec79537-3c38-468d-32b6-08de7b6842b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|52116014|366016|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	1kUIorcTGedHVrwdii7Uk3nHdGJylPtoMNmHAQyNXZPYvnuevQWneyfU6dm7HKdv4vioRc5veoxXNWV2wycfP10Dc9T17w5sFrVEtmE/0MJarMho1VVfvonifNGAf9183AyQt69qH8FU7kSRcLkb4uzG85YgWb7V0IeTJD1CoaMsrX8lk9Cdpuj0/9uZ4rbLgwEEiwEgx27PrmhNOzI6HnNZhip729jQvXRQY1M4W95i/w/JGx0lQbPT52/0cL8YwChr5UG+lFpPVW5z9DXvfnAxuDBJD/5hRShJELnpa/NbBnlLjq4gl35ZZDxumgqCX3MNQZRo5B1kKitpX3KBYTXGX6ycVjz6K9bfNAYe06DiWvcPuoyyT+u/KlAttAqaijtYtHqguuouZZoFZ8F+kAV2BJUfjB/gfkNWJMDdsPKG0KL6p9mvaZeYavGIDk2qnG+Ped0AkHYFIIjcxEp6j+uRRJttQv2LHvIZDv7K6J9JSw2okZCI9394K8cjbDn64t5CnMY+Vr/fVsU5ygCCG9FHx9AfBDNTDMCrHY6odsR4mvxRXeUJOgX1XWyQPJrz3INeoDW0vnmY3UKMswbKYSj2ND+tDS2w6fsk5lawp2NILBl8cEkYU8viI+lrFGHgN5uEVJrcx6bmOhlLs03vbFS5OUz4YtpBZ7R1v0lcdaFqrxmVnMMmOr+179abg0W77kzk3/OW0nB/+UZULMVEAQAuXBnuffrMREi+FM4/rTJbzZIlygAbYntBdw8+JNW9lugoWzioY7AN4q+FK1UAVQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(366016)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FoaWcwoSBh1oxx7uW+ig55zVUbDEDwFnPgwtFw+Jcia99Fr/J7Gzf6eycz7o?=
 =?us-ascii?Q?2Iu8B+VeYMCQBrOKG59H+NrSiA+Ie3/KWTe42Sr/lFq0vh7ItSyra8yi4dsf?=
 =?us-ascii?Q?Z6hnt0mO7KjnuQkMPGt0e56DAxyqfbir6/icwM6A9dBBsyJF/F7s3hXeG43t?=
 =?us-ascii?Q?6enX3D6S0GDc86n6KFXsr2qtMyG3MVFnrX4qj2R8oy3P2VbCArWYsrYHKzIe?=
 =?us-ascii?Q?2Xi08a476XEdVKN+vDNkkiZieCn93luBNKSyyh7/iy2atpbjCmmdjXbO5dF3?=
 =?us-ascii?Q?EL+c3Xwe8fz6wbuoPZnfBxIUfzQ/PFnUgnWNdf2kIkiXB0ec4NgiRVnQrV9t?=
 =?us-ascii?Q?gC1OTj3CR7ZMdYGTUgScnGv4TfHZBAVP3zMiJr+ERogchYoNnSQi04eJri4Z?=
 =?us-ascii?Q?W6ropy9jLSGKnhp75/1ay/SaqNduTIY7Td9H9oT/SqFDSipJP7QjXZbfGdNm?=
 =?us-ascii?Q?9KcpJFZa8NwMLfcFALyZI7ibI0REy93WdqbF/9x5a1kkS5eTC/jbK671cmJa?=
 =?us-ascii?Q?kpEXr01Y+w4EdALAZUhLjSKSEPqJXXo069vBK8jt/leVO+UfSUVEvqH8l0Pm?=
 =?us-ascii?Q?8aRFVqQiZIxH0F3IiV3ayIRWlbcMepSYEhvC9+ur7m752bhmmnIDSzUd8hDL?=
 =?us-ascii?Q?uXLhj7nXJUp/9pv4mInpNChzyAXtng0Z2nUEQY3r/7o6moer3Abj4pCTsjjw?=
 =?us-ascii?Q?LzVd/pzLMunUXLz+uFJI+rN99JIZhnKCX9yZOaK0HyRIDt96gLU0pSuDI3dS?=
 =?us-ascii?Q?Gm/XsT63KbJc9bsgSfM/L9HPuiCEit/7WlYpmLI18xXLNtz324v757+iu8Lw?=
 =?us-ascii?Q?ehLDJBaloWpMT5OdD45XtpIpN0EYfVcW1EmmCrLQ1m6SguhRwyc0wUuPIk3+?=
 =?us-ascii?Q?wvM6TWh4Gn3Iz70Qb/vJixVwFnTKm+CSGtNoiBRXZQIC1E5Al2JX/67ZcsMC?=
 =?us-ascii?Q?DksFVRz0Xl9HrWOT5sQ+XLNtxFhyvqj97YXrL9Z5j4jq1j2Mx2edzQaq6Ftu?=
 =?us-ascii?Q?Jy2/1aKaWw39FJyjYaKMXPdhDQOA/F4hmQRZhaVFq2tCx/n+K0ame+IPhvAk?=
 =?us-ascii?Q?2FhW26QrLltYA2oxWpbz7IZjhNwPoamZNrdUqmUtMMRh0r4u2aVHNWVpUAkd?=
 =?us-ascii?Q?LDHXAlRfB+biaBjEIqRRD99JmlbPycObjcOh004GfmUyTnVpo1sXtCtYPmNE?=
 =?us-ascii?Q?JF54YYYD0PKBp4y+Am4g9gOUTCj1yGrrY99HnSLRGSJolOpebvDNXI1NSonh?=
 =?us-ascii?Q?CIsg1B7emHhohETJrqP7YxDvRgRwb5znsW5a0KetTMtEvmymvG9Tp0RaQvWZ?=
 =?us-ascii?Q?xklmjlF2Opc1IVf4hXIH9akyeYZ1rN48Ev/0tRLlkzCm/r8RPEacAaz8TeZU?=
 =?us-ascii?Q?UK4hx8Ai4pHCKCegxSw0Irs7X4fNRYDwSvununRT+0hQGEv9wSki/faNan3j?=
 =?us-ascii?Q?UzsGQ8F2NqXFmAJxsEbiHReGBBzLvFyNk2gui+SJ4/L8/rM4vCLnGnIAbIxH?=
 =?us-ascii?Q?v+x7PW2Wv3m6uyi90EL6lrUqyWqj94hzU3Otv0vtWUyxjipLFoYP0Y+NXQ4m?=
 =?us-ascii?Q?YA/LHp655NRX/h0mhAi49AruciC/TNfeOnKfbA0HyMMxNEfUUqcuHisAYnIg?=
 =?us-ascii?Q?mDy6KKPjBGAz9ni7J7GwQCaVyaALwZZYFZi/hc86blD795Cwwtjw5IqfMiZ0?=
 =?us-ascii?Q?lxn2anYS0VIqXXOCuesjjaV8yoKpXaLvKwnHi8aE1/IM6gWFEfRXFZb/lJ//?=
 =?us-ascii?Q?bBiE+vJkdw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec79537-3c38-468d-32b6-08de7b6842b4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 10:08:06.1895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5xr1qok/E06SvNR4lv8+it7MmDIybKYVsFxHGWVvZvy/3Ix2lEtC47HQKmnD8AIRYqwi/8lUUWAvKsP+xVy7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8517

On Thu, Mar 05, 2026 at 10:42:16AM -0500, Frank Li wrote:
> On Thu, Mar 05, 2026 at 03:55:27PM +0800, Xu Yang wrote:
> > This board has 2 Type-C port, one has USB2 capability and another one
> > has USB3 capability. This will add Type-C node and enable USB nodes.
> 
> last sentense change to:
> 
> arm64: dts: imx943-evk: add Type-C and USB related nodes.
> 
> Add Type-C and USB related nodes. There are two Type-C ports, one is USB2
> only and another is USB3.

OK.

Thanks,
Xu Yang
