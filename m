Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010006.outbound.protection.outlook.com [52.101.84.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77A947CC74
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 18:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777574877; cv=fail; b=G+9J6JVxgBGDDz2iZLBMKPKXd76lg5A0/ELc+dkwT3wsMq3MEvJNTJJfKrZojx8uzM0mScrqn0f5PUHCyI3afOAMJ88arZTU9mtc3CqHESNefDDneW62Su5OuQ/xRrAfG/QQuM39nn8lfuuumoD+1TcKIEG0s7b5qacUTHHpeb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777574877; c=relaxed/simple;
	bh=xloobRUm6TFgfz1u2AMzIWtf1nVLzbMEW91tyXn93KM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p90bX19KjrIoYjE4xZWsuJL3FBiU2AvWvCLx3efMsFjC04mJiHP0VS7qtacei2JLvYONIWrVNWW7LQMVRStlLYAGESRt55SVAk1XV+hlD3FGtFlbprxNnNP0ziy4WPT6JXFIoutZcLwwtOHzUgUetPioEeda3s/zATHurz4bsG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kCRYz3z9 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.84.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kCRYz3z9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYgml5FzPgCc1ZOiAaiwRIkItkDwZ6iFHF+7UT72k0deo+qHDMq2AgOJ3YTZwsAR2H74z+JGAhqqFkRBhMb2104kktd03SyPEqE18pSPIPSD+Solzy/JgLtit+4itH2I1E4d3C+Uoi6pNODr8DjfwkS8Q6anE8Y8Kx1veRWg05E9tKloYzfcNKJGRxs4lBW7gvDXaV57M7lTaOAz++f0ec2SJed4/1Vnyg6mowTIyZ6p3qBOPDPAFQZcsc7e82AviwWT+TzrAswI9EbKCyUXQoxp1p3cgLpOFRkRFnRPEgGqrl9i/mjnywHHHLov7jlkP0ctdTDYCQHljQe13Xs40A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qGSCEi2wZ0er+ZZWsKvF+CAxJaEwBLZyb9HcsbyQwo=;
 b=YyaCzOm0p1CTAIFQmiHv4x/8z0vz6hCSHufKYlOTDOI6ecg683f8dl89QQeoXnMt8ClmBKo7FBKh2NDdGUt1C+Xyc/yf5PDW+Hi2vNo25BWD27/il+jjGlI6hq1CMOLvvx7ZZ6nJEmy4h50EKVATc9GguoV+bjweb0uwYCJft9L45JrkZkbf63p3K4dvJ3AKOPswPXVpwyOtWz59KAxagVFQa3bcqVwbfYJNA4U4THDhiLt+VXf4WYf/QyKJCxqqFOtx7zOZFrPR2lg2skBX5xdw12PMo4eySDhlozjsUJtmF4q1A8i+cLi8JFGKWTvpE7pQulOOBy9N2uI77/aYVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qGSCEi2wZ0er+ZZWsKvF+CAxJaEwBLZyb9HcsbyQwo=;
 b=kCRYz3z9QTJDQsAlEz5wXrFLIJk6Hubhz0LfI0xCYArGErPWCMYtbZnLGnohdHuoLpUuAM8sQVhyeJqRUpeA0mqz+n0Stfr2aL41YXmfyIAzBxaltafebtXQ9sv/qbYI9ffuBUwToBrPdeRcXFaEmyD8Yc+bxoX+7ixZNmvN+tyV4kyEtFNl2VzvKSeN6jAMiKIwb1177iFuXMXWh+AiP+LskAOMG8j4FJBO12bKUTsZdMGjsM3dTvbzSWdi3mZzV6t4EOSUp+1qS2nB2pfgvGhtCKshUDVTdkXIo3m/XJgxXi0j0o2Evwb1CURHjH1FizTIakDrdrQCEHVGVz9muw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB8712.eurprd04.prod.outlook.com (2603:10a6:10:2df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 18:47:50 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 18:47:50 +0000
Date: Thu, 30 Apr 2026 14:47:43 -0400
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>,
	soc@kernel.org, arm@kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 2/4] i.MX arm dts changes for v7.1
Message-ID: <afOjz03KQGa8sHRY@lizhi-Precision-Tower-5810>
References: <20260330141444.3789193-1-Frank.Li@nxp.com>
 <20260330141444.3789193-3-Frank.Li@nxp.com>
 <ab6b9b36-f08d-451a-9c2d-ef27b813d744@armadeus.com>
 <0c5a5204-331e-473b-9969-ff96bf711ce5@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c5a5204-331e-473b-9969-ff96bf711ce5@kernel.org>
X-ClientProxiedBy: SA0PR11CA0192.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: f362fe2b-e4c5-4804-c2ed-08dea6e8fa7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|52116014|1800799024|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	xa7qpps9YLC7ei0Zp1JsMYxFK0D3HV0tka9nz/Yc8ZlvShprCzG8iWoLweXX0k8u49+4GySBR/5lQDTVHKCm7OYWlxpvraq3l1r47qpizr7Y0rjUKGba3ohPrdM4rqcGFTVeduZml1wiGW9Zckjm+n6ZY/1V2GCfayPHw/6oGFXkW9wmpqc5uJ+ekMPNAd9VDiNJnPPhu40i0wZ13OQZpl/BG3ZXb0j6wPQkNwUFTijbiDi8g/JacdNPNOjG0rwgKFtBRAJ+wt1M0Tr9L1r8AsuR9JrVVD4knstXb5DcU3ymrNOKkoHYhKIV5phdwwUZRbcqhEuWJ1544TpT/msNkucltlIqWt/ym+3h0v4dIvi7uvScPHn+5Tt0Eefou0Ecm4OSYJKzFlljZ40WabiWIAuIEWkV98thjdUrb2KMTlWphvxC8+HHzYZ45EYIee3lpysHN283pBcg5ScrDRMjP0wYI5jOfvNwILnm+94KGQ1Jb/B8lUZNdt/ZTZ78I0hA7zNo5z27jwxDzNgQ0g35JXP/F4bwgYvQupNOR8CMaITIkz2p87FEg7N3UIYCdvWNBb+Zixf4AG6owMUcIWN+ZWMMleEiIVuGSlH8LEdJeFipUeFNpF2TX43OklfMUn8Kmdl0kMAk5pZ88l0prvEA0bBIAgaG553gNUPZniTEoLpoCSe8S2Zrn8CAZ3my9Axg4/ilKYYp9UBcaPI4nwtLInaFkejll47R51u9iwq/1ztREEutGuEPggK1w5X1KaaD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(52116014)(1800799024)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?2gQI7Uusz/idJro/L/JThBdT7WXmHaKEvar7xnthzlwEJknXJmfhLEvXLQ?=
 =?iso-8859-1?Q?7q/ymIV888wl94i3JB3qm+wWoUR2hRUu+AA1bIF496pOt7odvm7S2oMGIM?=
 =?iso-8859-1?Q?Bt/NPkBWpL0DJIc/Q4CatKSO8TVjOHVEr7/V8i45Jage5ypzt/fTtKrP/W?=
 =?iso-8859-1?Q?j38vHp8QzzAeyx6ZPpTj2ABV6pLytD/FNw593ALJ5VQWw8zfu4eTSPtkPn?=
 =?iso-8859-1?Q?AbGOWMgFCbo8TkXdaI4MitThyGC1YaKwHL0nWh1i7gQTXcr/HL1QaLIUe5?=
 =?iso-8859-1?Q?9mTLu8whgIU7yvvU2jxrqqMGTLuXVmQnuxgDCAv1efjsyH9lYvzaEQbCnB?=
 =?iso-8859-1?Q?0NQLE4wIqvYSG3rgqhvI8DecuYCT3gdrQOWyp98C6q5yUxMAgTZAsWGpU4?=
 =?iso-8859-1?Q?TiZqf7cTpUg83oA6zNprYz8+MSiuO6Rp+MBk19rBXJdWcLOWsgKK4lbgik?=
 =?iso-8859-1?Q?in8bwgjX4GmkMC9/ERrOduFiM/FNCL+iMNsmxdxnM/97dMl0AE7AyMgmw2?=
 =?iso-8859-1?Q?8/Q5O73Sq1JJBsg6psEUQUR8mUpGUddunoc84XS1+NbhuRTRipDnZpjpic?=
 =?iso-8859-1?Q?pWVzFsqiPGqnXKXrfcMEY7JhoG/qQowX45LuKk/SxH0/Xo44xLE0khKPv6?=
 =?iso-8859-1?Q?g85DeP41deXX5GoG5/5yk+f0db1NAjLROATQBG8XqPRUyTGwINpQ3Vth+H?=
 =?iso-8859-1?Q?/eiATjCMIPYWOarg1b82Qvrhhu6KST3hPXe8BSq1zvOcHrmCj/Gc9IuwjI?=
 =?iso-8859-1?Q?zXSk5WtAKsQI8JFnGm72feVftCU83684WafLjf8ujF9CalsYatyaxjvq5m?=
 =?iso-8859-1?Q?wmregAqGAvb17M0hAqhHvvr3iapjQpIDl1L80kpOqVMynr8sU4uP6c8iYe?=
 =?iso-8859-1?Q?aG49KQqIRYsfzRnAwWYsgF7tLYomUCU2VNrGnhBUpm+fOnuZ8ndjkLC3kS?=
 =?iso-8859-1?Q?w0WAlVSNELMJDEeUFj0jRzpfTFebO8GQ3g5DUsX29bm2aH9RqZCJj0/7ms?=
 =?iso-8859-1?Q?72HkOTpgNbK8b/AKjAPJab1jHy+izJl9bG1vk4n/PRgV4kIlMXhvtgR4ll?=
 =?iso-8859-1?Q?kg7Z/W5GxF2hg5J1MP+eZxV2shV+hdGR8YE3JY+H1nVudAlIUBINp/jm5Y?=
 =?iso-8859-1?Q?djS1bdHWSVqpmKvTm6aX95FByc0DpE/DdYOFvDCciFIRlOn3HgoPQSvX94?=
 =?iso-8859-1?Q?IEEd/D10Njo8CxuheLJjOm1iex9nnw9wRM6HqMUqljUpLCLL+kKVs+TDkK?=
 =?iso-8859-1?Q?gMrINTH76NI93hWFjIAT9Bpdpfms1Wfh97kLHmABVEV/1mS4x1EG/sSNpu?=
 =?iso-8859-1?Q?E1OIUqENoSWtEgweZIFBVx48LcozB6T7yiC+Z1gw9t/0TO80yAOqtL2OvI?=
 =?iso-8859-1?Q?D2k8gJCGOAG1zogZRO02tyNJNAjR14nJlxGsOfhlq/TGrvsOf8mhZ0ewIo?=
 =?iso-8859-1?Q?uO7W6AB7dDC8ySts1VO347hbTtvE/HEeUBnjWPUo4y7zH3GdA015l313eK?=
 =?iso-8859-1?Q?LwhXzvDQKnEZopZkuFL2dmxm7SR2rsWG5WakIkHSF6QJUsLMg7BjlxwemA?=
 =?iso-8859-1?Q?RAbPW+CW2YHLDGhm/at+WiQJIESuwBIVlz0Au/GvqJRbPcGc56FjAFarNX?=
 =?iso-8859-1?Q?mSktwWUfBiLPDkQWYjGCaSdVyEZi6bvN8cq2XhLOQ8X1e3KiZkjzTyCegj?=
 =?iso-8859-1?Q?c6r4HvnVfYbgxwwvYqW8yBSQ1rZprmG6wArgkjCpzYKOXU94/u5n9XsGx6?=
 =?iso-8859-1?Q?TlR3tF5zrG/myWRByotd8fj96N7heLG/zxSBfOCvo7iSZx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f362fe2b-e4c5-4804-c2ed-08dea6e8fa7d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 18:47:50.0761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uf59RnXjFZeT/4BiN/RPfWj/7DgqoMJO5nVdNnvEJSPn9uT2Y6upigNl5QZXpKxH2EsB7UHdHQILPWS5CRgwEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8712

On Wed, Apr 29, 2026 at 08:29:49PM +0200, Krzysztof Kozlowski wrote:
> On 28/04/2026 16:03, Sébastien Szymanski wrote:
> > Hello,
> >
> > On 3/30/26 4:14 PM, Frank Li wrote:
> >> ARM: dts: imx: remove redundant intermediate node in pinmux hierarchy
> >
> > This commit breaks Linux 7.1-rc1 boot on my APF27Dev board. I see the
> > following errors with earlyprintk enabled:
> >
> > [    0.346162] imx27-pinctrl 10015000.pinmux: unable to find group for
> > node i2c1grp
> > [    0.354438] imx27-pinctrl 10015000.pinmux: unable to find group for
> > node i2c2grp
> > ...
> > [    0.636217] imx27-pinctrl 10015000.pinmux: unable to find group for
> > node pwmgrp
> > [    0.644346] imx27-pinctrl 10015000.pinmux: unable to find group for
> > node gpioledsgrp
> > [    0.657247] imx27-pinctrl 10015000.pinmux: unable to find group for
> > node uart1grp
> > ...
> > [    0.868102] imx27-pinctrl 10015000.pinmux: unable to find group for
> > node cspi1grp
> > [    0.876513] imx27-pinctrl 10015000.pinmux: unable to find group for
> > node cspi2grp
> > [    0.888903] imx27-pinctrl 10015000.pinmux: unable to find group for
> > node fec1grp
> > ...
> > [    2.413181] imx27-pinctrl 10015000.pinmux: unable to find group for
> > node gpiokeysgrp
> >
> > Reverting the commit makes the errors disappear and the board boot again.
> >
> > Should I send a patch reverting this commit ?
>
>
> If you know how to fix it, then better fixing it instead of reverting,
> but otherwise yes, revert is justified. Just give a few more days for
> Frank or community to reply, because maybe there is a fix known.

Thanks for your report this problem, let me check at next monday since I
am traving.

Frank

>
> Best regards,
> Krzysztof
