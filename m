Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E363437D101
	for <imx@lists.linux.dev>; Mon,  9 Feb 2026 19:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770664986; cv=fail; b=IWR2gbcvq9qrLKtkXj65XczAp8LlYwgGHialDIjbsngGv+JLwnhYiitsgnm07BfeUQPwGE1g9J4mIPkYiwOurc6Xk1e8E+JMR8cMeD+aFiac0PAN7FFZq1T5ozRJh71nv1u1xisq3ej6rI5hj8fxC7tVy8pBVDj4p69YlHW4+hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770664986; c=relaxed/simple;
	bh=tiKB31f0MpPR7XdCR52wmQCAJ7YHRG+4CYMrcDVoFoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IAgRu1nCgHzBP+rVDxy6kOv0Crfwe3eef+iVgNFhPktu/mUKFoQM1oXzzNv+01GOSuTIGoPzND/VDqx0e7htX/McKChU/7T5ztfkLP10OXY9ihYzYqyOk9KqQbgZHof2y2GRQTo6aJk/gd0K2iQ0tNUPys9lhiYzLo9nHWQ0QKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=N+f6nyyr reason="signature verification failed"; arc=fail smtp.client-ip=52.101.72.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="N+f6nyyr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HM+S4pFZDonRoFSbWhF6X0l0iZEGtNcfelDP4dT3YOf1WFqGzNPgEzD3x9xl9MWrEOunIUKDnOrQktzGrt1QxNCNxD+pRyK/PJasN4WvPV+PMomwZmNTj64Q+6e1FgvgDOIQ90XZjBIkE1Fs5IfdBSwmkSoGZ88RXM0g0N9+v7iSPKGYEN9qbxZs4mpkk2Qze7LwLZAH5bnrvbfNFfsUxfky1xUeLXQlh6a9LzhwGkiVQI72/ZWaPQhAEJ0X3WxQhdx2JLgLuCQHeEe563pUASp+ByyG0Qb6qbwAv1BklBnHN5+N585gWo+sO0FgPsg66iKfldJvbIzsvElvyc3dxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9I0qDD4vbyRgiShmrVYHA+hCgNI9yc6PGBX/HdfI9g=;
 b=fyakh8cgfvKo/mmzhFfT371GKflje3FyUtgVdY2oY7tSvI5Tqf+ArvPGXV2SPEfm3yAbGI0cUvyvrjeWNwVtgcfkOdu3+kOUkLVcej5Qsah19QsR6eXq/Y/QHvNCaRmkdLsbLHxJ5DpH7d+q5Qad607H7PG6Id31DqUaJtXVGPIZUAcrXLILKEYyJhUG0L0kivPPm+pI/M+6/MCNMDpICSUxkRBsjXemFeQqbMDraRBn9gRW3jAnbt+la/Bb5MHIz469jzkszapTO75M1tSkHw4xKFUe985DfwXSx/fj7fJYQi5HVvPWKg81A69UwUZgmjCHYMouep3sBu6jKrJmQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9I0qDD4vbyRgiShmrVYHA+hCgNI9yc6PGBX/HdfI9g=;
 b=N+f6nyyr+wvIaTEyJtyQtBlSa/EcPR7goxCgbraxZFuOzUjqPUkWMbe1VCgtjl6HabwyksglMnBTZypxzuX27hLGXIjkqwRTpgKyHUkDd4zJBNQLY71KL8Z/ZQlLNZISXpCjiI7DArgpdSElwinzSfarzZZ0EgGzEwmVvAxHvewRk+/FS5Yz+KK7uaTTyfaAvY8xUcPYwhohCMXEFKM1tstgDVdu27GB4Zx6eSBeS8PZBPb91T2a0bPYi8XkmOGfecjyKqGexnbB1wrYxGLxl0RB8rSZfJiEEf+UzBrEufl23IRhMarq+mEDJFzXqsoaP6O+6+ptEW+EpX7TYg1a9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU0PR04MB9395.eurprd04.prod.outlook.com (2603:10a6:10:35a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Mon, 9 Feb
 2026 19:20:33 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Mon, 9 Feb 2026
 19:20:32 +0000
Date: Mon, 9 Feb 2026 14:20:24 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Shawn Guo <shawnguo@kernel.org>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: imx93-tqma9352: improve eMMC pad
 configuration
Message-ID: <aYozeOpdHo21D8v8@lizhi-Precision-Tower-5810>
References: <20260209155015.267008-1-alexander.stein@ew.tq-group.com>
 <20260209155015.267008-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260209155015.267008-2-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SJ0PR05CA0168.namprd05.prod.outlook.com
 (2603:10b6:a03:339::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU0PR04MB9395:EE_
X-MS-Office365-Filtering-Correlation-Id: 4647f361-93bc-4869-65fd-08de68104b6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?D3xCpnno8Ka+unjSZVYfjMqZqMYn+ipRUtGUwpzSQhv6UpMQHPYOiv7Muq?=
 =?iso-8859-1?Q?VXx15Wlg8OI+iAFVP2fjkbfRFpbcYyrakemxalmtH/oP5jSEUT/5w76M7D?=
 =?iso-8859-1?Q?EGQl4IU3iHRtJkR8QF2fo30ukyWMoIw4TANtX8+w/y8+n4onQtmmTUhsq7?=
 =?iso-8859-1?Q?hy3zF2XEctFuxVVAtIUxMUeO1zXVfVgBkxunVA6/KGcpBd61QeO8GBYYWU?=
 =?iso-8859-1?Q?DiahdXnduujd+4g18U/E0WNgyPlgHLO8KjL9u3HoiLtGg0grDcp9t9wrpF?=
 =?iso-8859-1?Q?t5SQETIPBbNJLN1etE7eB6sJtEoEMgIWJTz76Bif/gHUxlvNvgpRMixJ6r?=
 =?iso-8859-1?Q?xQNooDBa4qNZVkEpmikS/2eUXLkPwqrGcpqTQHvE3KiCpCjmj5k7Jpd17u?=
 =?iso-8859-1?Q?GfM6NKCn7Y6Je23uiHrNkCrQoF3z6IfOvwsv6zoUalJVyDGuIRhC3zLyM5?=
 =?iso-8859-1?Q?1oSdrl2vufoa5SyY+vMiTh93txnaoPiC1Ev9OoBYEYQ1Pz1yEIrSZ6wURI?=
 =?iso-8859-1?Q?qpX+AJ2kuYPlr8sHSwRMw7maGoelRytzkQp0ijBFJNJqVyrhw5nixG53VU?=
 =?iso-8859-1?Q?6xyPJMTtxbKHgChVryAVK6r6eaayt9XMCbGjIBIhPHxSnzLIPhN2T64wEj?=
 =?iso-8859-1?Q?bIJTKMg91ouyPW4xrH0hZS+Y80gYQOolCOxeSXfeoH4Oafyl335BNUgowu?=
 =?iso-8859-1?Q?uAJtn9U/Vb95bC+xg2OW0+6rgWrzNIS+mBw5VmlopQAdOHjUQncS8/RpN2?=
 =?iso-8859-1?Q?iXyoOsB63OyN/d6wbCIm1vQkQk/qjleL/OFkcw6+cTIG99G3yWwyMd0r5e?=
 =?iso-8859-1?Q?7cw94vXWRerOA3GduiqtMqKKbOlsKa9FNJ4Iy94N6gzH90C8BqcAgYRdHL?=
 =?iso-8859-1?Q?w635bBM1WbVvvmB3nATyjruPfUnCVGpmDySq0V/Lw0cgqwDwUDC8T2aPIn?=
 =?iso-8859-1?Q?gjyz6mbaXjwJwnv3mGqUEpMQUyIBRvxn4vuYX6R6iC8g8ricXhXRrHTB/s?=
 =?iso-8859-1?Q?0KFXjC+beDHbPV9KnHhnNQ7XAiC51S4Hf7Ef/qHpvWoEm1+9y6bKN8ljwW?=
 =?iso-8859-1?Q?skEWTWb8WK2G8vbUHN4Fky+Ugoy0L2f4SK+p12itXRCbCk3vU0UGG/5RaC?=
 =?iso-8859-1?Q?oylRsObFwEifRQ7kjVTmIPxRxjOXgCIMaOUaVVlM2JoN+E0UvSwq78RtUM?=
 =?iso-8859-1?Q?w8WGW3cfwn5CTsbywyUYwgqfCaon5Uo11F8hK/ZJKNPWeQX383CKjVwmtV?=
 =?iso-8859-1?Q?rO1ieSfNnCMDq2eMifZ7WHf+Rx+A9dcgqomMXe6ziRj/GBoET/19sxcv2p?=
 =?iso-8859-1?Q?CQzKZ9fa5HYzLb6k93tSJpCWi7QkFUJgjW1b6V/vseRhDNWHP0JojFUC2O?=
 =?iso-8859-1?Q?/PUrIlHoF3f/ykWOx4Albnuxpa2l/y5AbvycyZMyXuorUl7XfQ10ePc9tS?=
 =?iso-8859-1?Q?bbclFtnYxL+UjjZbSZLkl1IH+U5GStONp5gPN0AzUpKWhvXWqtkRt+LTEN?=
 =?iso-8859-1?Q?0EZB/fLtkihcu1jQrvdNcjxf1h+I11IY7EOKPcXoN4VzKGsZLBq6wHd8rs?=
 =?iso-8859-1?Q?SDdkI+QLfffAKEIsMqMax6z3xoxkKGauvJqGprgEq+UmXLPygCtKbffgyP?=
 =?iso-8859-1?Q?VNL8UHgHe0VLm3ZNk4hTyQm1F95rPaI8rDYeZKosuEkK73Kj6j+zmfE20W?=
 =?iso-8859-1?Q?+Fc+FMkZ33tJFP82Bvk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?UsxnmGt1VyAuK8Y5ULEsuCVQPI8fGNMOP/YDWBEWgajIMOM0RmqG+0ctan?=
 =?iso-8859-1?Q?njQreuMoBqamtUhDtI+0HFUFs2SIYGfh7coFRUTsOu+jPhyPuYQGNSk0JZ?=
 =?iso-8859-1?Q?sehk98upzK2NMqTBgrl4oUl8PS/TqJJXr1kMoqZSGDTUy4XlVR9ldn/pJj?=
 =?iso-8859-1?Q?7B5gzIu7xgbp8tfeE+NoGEe8AsDpv6MVXi7hj3ZPP9zlsPDoFa/7Sngrjw?=
 =?iso-8859-1?Q?P1kP0AntqtJUCXWprv/l8KjymmZ4D8ason4YUUHYH50HLdwNZwGzV7kgXu?=
 =?iso-8859-1?Q?pThZghFT2B1kzCrN8PRNWrQezFxbX/zvIzBa/Q8oymi/UeXct/RJEOMFaL?=
 =?iso-8859-1?Q?2Wm15SreHKXZcHk2oEFoGI5PDa1f3Eb+AMGME3yYDm05K+w1hpmRNoT6pa?=
 =?iso-8859-1?Q?SPRI4bxaVrp7NhuSI5Gi6Y00AObt+Dv0SWuEw63bof0NIbR7EeTI483TLp?=
 =?iso-8859-1?Q?dPNgbaCpQzWmdSEN4awdZ8N3ZniNSQeKfNmtQTxRy17Fq0+nSSrNwIthp/?=
 =?iso-8859-1?Q?fQRgQOsEfLcK+s4faLNBTaAJxaEHr+nbBCv1JhUqf/WPuWtcMtu8DawLpY?=
 =?iso-8859-1?Q?49MyPHvCTwxPtqJAOtLrxGlH0nEb8pkWKozBf4VEJjceIxqxcqOxYfcEr0?=
 =?iso-8859-1?Q?XrrtSp1i6ZaO/If1iStQqX6UG1+UlYV7lkL9H1RFRfpqASiGkM+d2T0wWs?=
 =?iso-8859-1?Q?jHI2vLhxDDAbsXaKbL6upZkcWTYbwSdJzjyH30ZqTdkOrEtOjjUIEVL1LI?=
 =?iso-8859-1?Q?qKPzyXA0zyUvePgXPTd2sSpjXo+6A1/vnGFJEVGP54ndxudVPspyTUdQRc?=
 =?iso-8859-1?Q?Jf2awh7f4kb2T6hAfDt6gSCLQfHj3XsN+t+ufz3yQg26ipiVSzs1DNEg5n?=
 =?iso-8859-1?Q?9POd76atZsqEl+VeeERj9asqv4tE5+JGa/bgNI09BYmKdABIu87HB+SpJ+?=
 =?iso-8859-1?Q?tWdGzaQqUvME34nP1LeBu5oUQApZGqxgmK90QeEYA4LQaoG1K98jK/0oX5?=
 =?iso-8859-1?Q?AWzPe0TEq2U2FgpGN6hFarBzrvSdbXmC1cRGAWcedjDNUQ/DfosXu+C1u/?=
 =?iso-8859-1?Q?WKfJioae+406dGWW+GneE21JIcqBk7W4hoGfTzHieXjvyQY4/WP+L4aUId?=
 =?iso-8859-1?Q?Cq7/mDB/vbfdNdNr2I+JHHgVj1d7mbjKiLm3DnPAi3cAstqtq+Qn3zBjFl?=
 =?iso-8859-1?Q?HNUnl6/wW7Z+ar1QF7kgBe1A63KcbgNqV8sJmhNCUfiwrM8Yyf5t0ycP08?=
 =?iso-8859-1?Q?c8+y9DbpIvGIMNCCUyze0kd0HD7SB1qu44jULVhwv9G9cvhEqSi6HYJOjH?=
 =?iso-8859-1?Q?UIOBRyHapnM37H9/KvFqiq74lq1ZeuxEl8ZiEucjucrhoxPonFB0THyBuh?=
 =?iso-8859-1?Q?YZW9Tqq6nswmQ1yblqQ7Z2jFvx58Vhat4p7r8LcjigLz+rBI5eE9tPXq7i?=
 =?iso-8859-1?Q?S6GO8Y+W1NcMECqULxp7vfQpWz0li7Mt1a46L+MB4dtXWak+q51G+ZSVZT?=
 =?iso-8859-1?Q?pl/3rvpXrtlirGqyV2YFcdbyvgyWhaed5zghu7Xw/t3e2Vt5LvCNumLZTZ?=
 =?iso-8859-1?Q?giOAwGracnyut2Hdq07hQudNV97lAiTscbK4qRqNVfPrVxK4OpX+feVTYq?=
 =?iso-8859-1?Q?VuJ1zi99g6RSN/zasbQkcHGwBRPVDd41SvtMOj+OvnJ3/knAKZLHizSWyw?=
 =?iso-8859-1?Q?LgZ0XKi76CIRi6cDiWluFH8dqrkSbZiHOpQ6v7Ka9VA/HFCv8rOftn3VS1?=
 =?iso-8859-1?Q?A/Jw5tFDCZszZjQL3jI5t3RWRyMy01jTizJruBDTztDoWe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4647f361-93bc-4869-65fd-08de68104b6c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 19:20:32.9435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ViXwRWZCVn6DEJcxftxH77LlQEsTe7u0NcKzkTNDabb33LovIk/GLbhLgvgOhGBRraHBht4oH8wb30/n4+TmAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9395

On Mon, Feb 09, 2026 at 04:50:14PM +0100, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
>
> Use DSE x4 an PullUp for CMD an DAT, DSE x4 and PullDown for CLK.
> This improves stability and detection at low temperatures under -25°C.

Nit:

Use DSE x4 an PullUp for CMD an DAT, DSE x4 and PullDown for CLK to improve
stability and detection at low temperatures under -25°C.

If you think it is okay, I can update it when apply it.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Fixes: 0b5fdfaa8e45 ("arm64: dts: freescale: imx93-tqma9352: set SION for cmd and data pad of USDHC")
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../boot/dts/freescale/imx93-tqma9352.dtsi    | 26 +++++++++----------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
> index 3a23e2eb9febe..ce34a296495c4 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
> @@ -271,21 +271,21 @@ MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x106
>  	/* enable SION for data and cmd pad due to ERR052021 */
>  	pinctrl_usdhc1: usdhc1grp {
>  		fsl,pins = <
> -			/* PD | FSEL 3 | DSE X5 */
> -			MX93_PAD_SD1_CLK__USDHC1_CLK		0x5be
> +			/* PD | FSEL 3 | DSE X4 */
> +			MX93_PAD_SD1_CLK__USDHC1_CLK		0x59e
>  			/* HYS | FSEL 0 | no drive */
>  			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x1000
> -			/* HYS | FSEL 3 | X5 */
> -			MX93_PAD_SD1_CMD__USDHC1_CMD		0x400011be
> -			/* HYS | FSEL 3 | X4 */
> -			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000119e
> -			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000119e
> -			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000119e
> -			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000119e
> -			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000119e
> -			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000119e
> -			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000119e
> -			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000119e
> +			/* HYS | PU | FSEL 3 | DSE X4 */
> +			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000139e
> +			/* HYS | PU | FSEL 3 | DSE X4 */
> +			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000139e
> +			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000139e
> +			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000139e
> +			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000139e
> +			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000139e
> +			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000139e
> +			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000139e
> +			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000139e
>  		>;
>  	};
>
> --
> 2.43.0
>
