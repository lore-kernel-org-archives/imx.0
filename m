Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010016.outbound.protection.outlook.com [52.101.69.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F29441036
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 06:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768976898; cv=fail; b=N0JfZC6s89dl8sWORPn7OUHbbCahH1FDRhzpdl43RmRxLCJW/KKqZj/t8snSomvDkgTybLiDJ8/85v0mkLvbK7oMJGPMApeKVN5Rhu+FjPsq4LH5J/yZqmxGQ6Uxk1hm2wBt3dX/39/YW5Pbg+boXyHr4H8QnpfI4cUk0sN5i/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768976898; c=relaxed/simple;
	bh=SL9UUrEHXNSL4YX2SoqQBH9Lb4nN0Qha26ObFlvpu30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tOK/1dRwdM8sN6G7wFUsbKBUnI7QE2QveouWoPvzF8OKGkmmJoZwLE/mXFnTB5g9Ztl/cqlqR9ImyGOQ0oYh52B81tzpZNLpW/1RMasvSA2THlQ+9iq+yqHx0Z/oexFSOjiHgXtp5POUoBdAsVN88ScOHPaekQaGsHQY2wbSIts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RRqxZ91Y reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RRqxZ91Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SobecKN6bhxBzRq8Eq9+t3G/3RjKme5cRi2ZPoseFurscKgT/gvAkpV3My9jE8oUFU05xQI88a3PELDoxqv1jnC7VujSutTwK+lADGfzbOtJ++LX39BTqgj1PO2DN3hjsGOlP8bRN6EJq41Jt3Lha2bcTt2dL7uc8wN3DbmQbt8Y4a/LdHcdt7RTu2W0Zo9nhPgKVVZLsyNvrek52uIBcTmBjioWOjJarVSywh7zVJjKJEEphh4WFO97k+jwz3M1YDOmlRN68s2j97DSpsOYn5cYW4EogHpexM/tdP7msOl1Ky4PX/iK8jpXIjUXRPuoCSUEBcpFPPkajDCJ8jrZww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qP4VvSkObF8UrRu11pv2V6LVVgNw3qDwmrq9oJcbIoo=;
 b=F/Kwq6IJy5RlLQ2+WNfGtxv9G4e9tieYR94CLlTXUL9yiy8tugBw2iWV89E6hi5GqRxe/Pbwu/to4YwXmKCGJENA2KPL1sVPZO00hrJKnn0Robd/LuIWJkkns0gYGDm6axP6bVLzW+5/vsEX2DbIENOZP/r/sgKsHxQm0w8ENcTrbbOOM2Fm3DHNdCjwChpD/TrDfqoAJXVrD6EJ/LhAmsReR3ISdQNT0NMU4McU6qkbZkDDzL/1A0nOx/Go56ef/41WolGYNv7MMazgAJyQ6HRll9U9R+c49uFLwH3Zo4qAl6erXiOgQvOV4MceWbRRrKMmRqVDtzDDUaCt2DE7vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qP4VvSkObF8UrRu11pv2V6LVVgNw3qDwmrq9oJcbIoo=;
 b=RRqxZ91Ypw1YXUH06DuxqvKvsBltlDEMmvpWWLjs07ZYWQ/Yf92KRIQK1EctQYBh1IpWdPbTbymrTkKmBpp5eUwjHH1Ncr4Q+d9D6cmgCfvxs3vDJcJfpR+HvOjQieWaK4WKY34KbHA3HYGg4g/XYpGxvKalraapHl3pdpLsTQk+HV0v/7CBYHtyxrUuoWoPPDsUGDCQNbc2l0xW2NVdcS3CzkIornpsdXzBJdlfZifEY1s+Zer019puRRIpCSuhk01uZeh/1U+HyMwflUVav7GOTliU1PwVAkkIOoQtZL3iipXq4K5ueHE6OL87YM7j3Dz9XNQkdHBUz7ax/GQxyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by DB8PR04MB6969.eurprd04.prod.outlook.com (2603:10a6:10:11b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 06:28:13 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%4]) with mapi id 15.20.9499.003; Wed, 21 Jan 2026
 06:28:13 +0000
Date: Wed, 21 Jan 2026 14:27:55 +0800
From: Joy Zou <joy.zou@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx95: Reserve eDMA channels 0-1 for V2X
Message-ID: <20260121062755.GA2474386@shlinux88>
References: <20260120-b4-imx95-v2x-v1-1-52b2025b27a0@nxp.com>
 <993363fb-8ce4-4a89-b6c4-8fbf181ad410@gmail.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <993363fb-8ce4-4a89-b6c4-8fbf181ad410@gmail.com>
X-ClientProxiedBy: SI1PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::20) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|DB8PR04MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 26bc42bb-9997-41d0-b7cc-08de58b64105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|19092799006|7416014|1800799024|366016|38350700014|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?/IwhncHBJA1Mltwfp2X8FB1wbas5nm3I/p4AzS/mtMDvRcLshrEuqPgO92?=
 =?iso-8859-1?Q?HYTuMSldjDc1yv2vBPq/dnxNJJ924knHhi4Y5TkXjtC5y6o9Ab3Mi2KLK7?=
 =?iso-8859-1?Q?toO3MEgCFY0IJfPlYTXFHRis6NhIt9Jk2ahP0cKYyQJMFOS7XS18W31J1v?=
 =?iso-8859-1?Q?KzOmBRwdcQ+LAqmZSfXJos/snyc6TZWRXZVm47JSbMDsssnPV47X1MgFZz?=
 =?iso-8859-1?Q?HDVcvHQ+tzXqVki8B87KXxxElHdSdhvGRpQWl1qwmIp37RblTojDpwc83a?=
 =?iso-8859-1?Q?rYzTmHOChChKnZ94GK+bWCgW7e4lpPRnLoJOFD/CPYZCT1SOXzZVlJMgDO?=
 =?iso-8859-1?Q?azDzSXI55m/TxUWBCvn2zeIoWM48dRZED0a0BUzI8vcJELpzIvjy0mM0gv?=
 =?iso-8859-1?Q?/BwjBmubZdrPxsuzeiWeSgkwcIxg1oR8/NuV3iOFMeXLBRHuMBIVyRkcot?=
 =?iso-8859-1?Q?NyFbzUyPamDxAWSl4+YRbN8nWGVVcvANIS6jMLL1waxge7J8Mr7a70uNxP?=
 =?iso-8859-1?Q?5xVm6oKh1x8Qe6qtP9ZV/q4svlJKPJcToThBE5xMmgt2P83T0jxZSCVDON?=
 =?iso-8859-1?Q?FTDAsJrfUIJpCCTHwSZcw51EqFXxf7OLP9G9mHLiay+ymj+KpmPQj83WXe?=
 =?iso-8859-1?Q?y7D6ro+evHjYo0Gcg9HFNjPdbHH9/O0cvD/OE864iMfv5KpA5R7XgKKpjj?=
 =?iso-8859-1?Q?wb9DIU6jppoCBHOHl4VuwrxrzmwW3xbaKvzEKOJ8ffas8JBAx/oi76Lo31?=
 =?iso-8859-1?Q?jwV10zwF4hcY3x2k/2e4Gr8rqsioShQ13AbbTTdQrT8cstJPqRkM6/mOGP?=
 =?iso-8859-1?Q?/OLFzPLwbCFCGwVhCl3a6HedcCxvhnZUKLrOYIetLZLx28RW0x8dfxChSx?=
 =?iso-8859-1?Q?j9b1PkWBQRv21LbItSO3Zcqj9l4VaW3m9GeTPFJNxVEaZ4O/mNTFCs9eGQ?=
 =?iso-8859-1?Q?F3eU5NG08nwr+0aYqu2LltkPwTLeuHIbl86e9z3n3bc2QE8jDprilC9fQh?=
 =?iso-8859-1?Q?E09rvf6KRVHEg0abxtLmuHtaJeQTy0adpWsXDgNFjShP7V15uH8MNEReZN?=
 =?iso-8859-1?Q?j4SZHTIZK5OjxS0qT7MqJgDLXBpWsZEk0Az9Pq2Rcum69/x8TmJShrpXZF?=
 =?iso-8859-1?Q?UsrihcH03iZPCkOX4FonM7JkJ8mxmCfxuB1OLQoDXDg5ATC8Yg1zHSpHZM?=
 =?iso-8859-1?Q?JDGbHwPDrDwASV4OwaYu2bIBSxVlKAT+or41gr5KxZJgPD2CmcL3lxRciC?=
 =?iso-8859-1?Q?z+gHUA7tKUuojoS3g/hXLWL2VC9gASGGlNjtKDErhiW91DkzAn7ixjWhdC?=
 =?iso-8859-1?Q?m8t86QcI/o4D7FC3YO0P6OrXfnskR7XpLM3k1YtAbe169jobQYc0+63bgc?=
 =?iso-8859-1?Q?bGJFuyVyYALwHQEz3tmLJP9H2Wv+KQ6q+JTkxTppsjdg14fHpMNzOlw98u?=
 =?iso-8859-1?Q?R4x9Pn0tdEsy4sU5tteP5cMd+NgKJNv0tyAf9ohTlEX1zd+HISvN0jq0ym?=
 =?iso-8859-1?Q?LOo8uqSiDQdfkqpMKNwxVg52K6T38mthaplc68FEynY9mNPmjO70dOOCBV?=
 =?iso-8859-1?Q?6jvKSYKV0idLGm+0Gh8veA2D3OKyHK5Edfg2e/zkBUPEfrlcyK4dPhHKi/?=
 =?iso-8859-1?Q?ow7Irtqw7sdRpkWYq/krD4gfO6Pzj2c/n2Ix1TclKAPeHtd6pLHTpfXE3l?=
 =?iso-8859-1?Q?hPsuEEJjDmwdPHmQQxw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(7416014)(1800799024)(366016)(38350700014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?7NC1Sj3yV35Dm9VxveaO7TST2T+NoY8oGydviiZtABcnPqErR1yXEjNCHA?=
 =?iso-8859-1?Q?auK9FWDZQIHZXQid9NGh641Gd+d6hXmg9fhAjEoWEuSmDKSRKW+Ih+n9M2?=
 =?iso-8859-1?Q?zxC4IgZonWr4ZbUBodsMDglrU3bBJf2jjk7W7iJlPNzUGEdE3/I7d4yd8a?=
 =?iso-8859-1?Q?P0pCNp3OLF6tJwGWh74zbq0AONiRinT3USROTAK5aRO5bTHa0nNnivUnct?=
 =?iso-8859-1?Q?b8DpE1+ILcibHSRUbFIAd60U/iu0bv+957O094aPHevgP4Knoxn0zrt9hX?=
 =?iso-8859-1?Q?CECbsJu1Ka9lXS6vWEjzxEC70Z2vvSg52PV0sdALu/T+Fjs0mi04ZU3FFY?=
 =?iso-8859-1?Q?fHKxzdNYew/DtX0DYri25LP43TNstPMZEp7E2llI8YPy61rseqxp0+p2bi?=
 =?iso-8859-1?Q?+he/+wF0xYjlpXlAU+JvlYI/OcEeAFNco5jVe14aBQ67BKuMKgOgviLxDQ?=
 =?iso-8859-1?Q?DLP60ZNOFkUA1Xz6utv/uw6heUqI8I2SHm61QpvnPFGlodbtraQt0SOSRZ?=
 =?iso-8859-1?Q?eljcNax0+wM74Gna/WZjZAvgJd4v+D8TTYxNZRF3d2TdqaXsAPKZOOcpff?=
 =?iso-8859-1?Q?03IGvf/9KciejtvunygUfKsvt0zHOgDKYsBoAGStIeaFVAniLinv8BSz4c?=
 =?iso-8859-1?Q?RDsuUfQflnPnyPoEj/wgBvshcPwiiA8qGo1s756bqZ1REIMfaLz9fUgfuZ?=
 =?iso-8859-1?Q?NanY4TUUG1JQjEEm7jGK1In/bNLXrwWhxero5YrxWREQQm7p3pSXdsT1T6?=
 =?iso-8859-1?Q?2AWXZoD93Oig936vwjL+rLcop5BtYZ0+gmi2NHECZ55DMoEGzWOuScjG0L?=
 =?iso-8859-1?Q?vzPx02dp9uDSF8dijpG1zqqdPKZFKdRvz7uRjtEsALPjMsVMxqBSVmcKEK?=
 =?iso-8859-1?Q?Xlylo7LqDSmI5TZCrilmm1CHm+GDtTVuMgZu7SFwE5EmOln1D66usbqkHd?=
 =?iso-8859-1?Q?iJ/iiFBeAtr9MrH6riCKW15tMdczwUkQQAOKLTeJvANuaDhSeEB4V42gu6?=
 =?iso-8859-1?Q?/UYCmTnxpssWiLwpqw0nq+E7KerbOgCS8B0lVvhD8DaO6AiR4jSZmsuQWc?=
 =?iso-8859-1?Q?WbDMDfOfhdaTBi0yf25jxLOPZ/nWm10SYeHreQ5YiEz4Sidb1c6ZPyUZIR?=
 =?iso-8859-1?Q?DiZblVS6N0UvYmKCqhByiBCzGI/lCoJFSpPScv8LLpHFe95EBzM1LksaRE?=
 =?iso-8859-1?Q?ogKiP7BBHXoI38iHkuRC9q/a8k3RRDtjLFk8GIob1D3eOKYO2SNEwfySXd?=
 =?iso-8859-1?Q?zu9siDt7EDxFv7aKnyx+QwYQgbQTlG57DAlvxHgGx1I0vlfHqMrQeDdfTU?=
 =?iso-8859-1?Q?Kxad0oBabVcympECmh7y8iCTpunuVZdIyPpdlFKzdCOu5UYsRsHG5UCbhh?=
 =?iso-8859-1?Q?2RAPTzMfdGLZUqUdnM19Ny8dmcHS0iH+k9QIh8MSmRnOMnMLrhQZy096kk?=
 =?iso-8859-1?Q?2UsMLh29OjmhE7sC3LyOK5aLehWMzb2Y9YF1qH+el3r6LgYGDnXBMaVJx9?=
 =?iso-8859-1?Q?YclW+LqLERNqd0d+hIN6uRymaz9asqwZWDB0uX3YjvIkk2DoF9ZPW2eeAj?=
 =?iso-8859-1?Q?DCPkMCfyCDac7zyVzuIYOB6qq/wCtytOUr4+GhrQ6bxAy+Sl5GLlt9KDIA?=
 =?iso-8859-1?Q?sBDGXqzwfuUzvtpTmA3XfjSlxBmCCNV1t8LSfb5F5OwDAhXJq1NUO+b8To?=
 =?iso-8859-1?Q?IaHj6iP/hLzSBnequGkcqUBVSynp/ZQB7uG4koaw4Rc5NSbhAO+5V0K4+z?=
 =?iso-8859-1?Q?UwwsK2WY/WTBQsM1Cz2KEjIb1kfU8kXt9keBxhmbGie1xH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26bc42bb-9997-41d0-b7cc-08de58b64105
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 06:28:13.4468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RsOInpklSDcC0YC8IgUrRbE2BAR+yRWdY/qd3atu/EbM0rEJnhxCApWB+Ou4lAXP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6969

On Tue, Jan 20, 2026 at 04:30:32AM -0800, Laurentiu Mihalcea wrote:
> 
> On 1/20/2026 12:35 AM, Joy Zou wrote:
> > Reserve eDMA channels 0 and 1 on the AXI eDMA controller for exclusive
> > use by V2X (Vehicle-to-Everything) fast hash operations.
> >
> > Signed-off-by: Joy Zou <joy.zou@nxp.com>
> > ---
> > ---
> >  arch/arm64/boot/dts/freescale/imx95.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > index 55e2da094c889fc7c1096d0e36f31ae118d2a982..24d02aa18b2f480bbffdc30bc41c658fb3aaf67a 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > @@ -631,6 +631,7 @@ edma2: dma-controller@42000000 {
> >  				reg = <0x42000000 0x210000>;
> >  				#dma-cells = <3>;
> >  				dma-channels = <64>;
> > +				dma-channel-mask = <0x3>;
> >  				interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> >  					     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> >  					     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
> >
> > ---
> > base-commit: d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
> > change-id: 20260120-b4-imx95-v2x-3e01c7bc6881
> >
> > Best regards,
> 
> 
> Thanks, this fixes the kernel panics on MX95-15x15-FRDM and MX95-19x19-EVK after
> 
> AP access is removed from said channels via SM.
> 
> 
> Just one thing: can you do this change for imx95-19x19-evk-sof.dts as well?
> 
> If not, I'll just send a patch for that later on.
Will change imx95-19x19-evk-sof.dts.
BR
Joy Zou
> 
> 
> Either way:
> 
> Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Tested-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com> # MX95-15x15-FRDM, MX95-19x19-EVK
> 
