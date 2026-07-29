Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BA43C1D62
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 15:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340800; cv=fail; b=Bh+W1K2UJS7CjNUivx7M/nSvGgSJvf2nRprRLfyDDKLgksVI0MVvQoNwCURKuZXsWE+fPn8mLV0CMkWzlcDdf+gI0Nzo2RenNbLY08Wmv8IgQKVGPeFz20rcDszfs6OATEmj5J0q4cpmMdMKJjzZQ4ziV4UDP1ytA/8ZSKL5GKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340800; c=relaxed/simple;
	bh=50emvh45xnhJ1AuXI7WQeApEc6C0PVFWC+UD+W3HoZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DH78VsJHZbf1w0EGc74SoIh0eNAoKiCBa+yl3Xg6WF0m278su+EYx4b2mzWAdEQeZoRV5FWNZ6LwN2uEp4jZdjT2o4uq3LR8A4czbDDW8QCo3m0GpIy0VZ07wveCEMMuMvatfF1Av5iEa2Sf9Iz8A3R7fuj7lqnAtfXip6O6Uew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZVbxRhjx; arc=fail smtp.client-ip=52.101.69.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZVbxRhjx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMz1c7thiUU1ZO+vnaKggGVgzExwwNoOp4GpAV59+/XtKaHAqeAHo40fhL1A/Md7J0L/4BHyR9QApAaaBy+ikGcqdj2BVc0upx+mk2X1e0z0sI02ad/qnbbTCPEgLjD/DbOZGJeVe4sPJk6pn0t+2jMhykeXHqs0DVyq7NT9SfHfKbnBjpFp/JbnfzraDKpxgiCoAFTdrOVWMU2+bROPzAKFOTqiQaTvL8ybx0AJWzGLDmaBBYaTCi8CBEFZy4Hf2aL/FLJ8RL7Q7/ghMwj+03e9qQwOS1RvunRXsToDTkigUc8slhmrdrVjy1Rfxu35QUGYU9IVTu6QSAWPM27GoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAQa7qPVMg6o7qAX4Ka6TDwD4dKE4mXwxqe3fH0+a1s=;
 b=gE+yX83Zv2fcOfr9I2+p7NZMsXATqoLZ0mv6/YCM0unGxAyKw0aNA4ucdlj7hopRWzFvzsfxW/VlkzaN3yzbbmux464nlVPCsXWAfncAt0XkCBqzFoZKvQmtaua6+9/tp/0VeHscqJsmY7BFZ6WfWS1oSJxiFdBsyXumHKFkLEc4vMn+LFSaL+xOEq96e2bM6ogJyKDvCWObHKoVdF5lzkSdB/7tyRSEmF/Gt81odSEf0ulLsJwc/f1OGtBqaYc9aVKmGOYckua3itwA2UDWP+iaRjPR+SwmMw3xoPU418mN4hT9Q69BHe8QceiAmZs+y4czTv3hvwiBCxLXoNiE3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAQa7qPVMg6o7qAX4Ka6TDwD4dKE4mXwxqe3fH0+a1s=;
 b=ZVbxRhjxFwgfePji4HxfXO7gWRvhxlYfpl9wvsygOXCfa9UzRhX97x7f+qZrW/j2VToGSwK5FFEXb9Bym+fwLVCYSgky6MUCJllLwhQ0aTQ4/BnyaTRUoLYR9E6oKyAr97MZy/yKmjf64M5vxe8oAGip7xyjEZ8w0WnJK3eizZkPHdSPuN4vAXA9w2S/CEePT0RIh/C9YDUIP6uANSMDeFZtw7Llyk4z5NkasSz0rupLva3g2yvmeJmGbegzxGTonBqnzMNBfIRU5AMtb9Ue+9UraqOSFaZ9FVa1WDq2cJAO/EpHaCCbGKjuyo0MCefitaBNfG9g20vNMsXISI4yrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU0PR04MB9324.eurprd04.prod.outlook.com (2603:10a6:10:357::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 15:59:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 15:59:54 +0000
Date: Wed, 29 Jul 2026 10:59:45 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
Message-ID: <amojcXE2di_lwB2v@SMW015318>
References: <20260727195244.78199-1-marex@nabladev.com>
 <178526691528.3668106.10748099183405791163.b4-ty@b4>
 <amoclu5c3bQH2zzF@lizhi-Precision-Tower-5810>
 <59bbc6ec-e01d-4656-a0a8-bc81c3cfbbe2@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59bbc6ec-e01d-4656-a0a8-bc81c3cfbbe2@nabladev.com>
X-ClientProxiedBy: PH7PR17CA0035.namprd17.prod.outlook.com
 (2603:10b6:510:323::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU0PR04MB9324:EE_
X-MS-Office365-Filtering-Correlation-Id: eaf938c9-208d-45d6-e6ef-08deed8a6e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|366016|1800799024|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TkzUxTIHO1K2NVmoUpCto/jqlTBn53hts/pPdm6FigWLphvnj4CyDKBRlFfNGkDgDGqltAHRc7vU+I1kBEq+8/uHX441Ki0W7s6GGOnPiq5zOCg4/+Tx3pLYCFV9BkcLNmHeuOSwyOnG23HFl3np/XVPpAigsctuMoOsdr3rObqy4Fzai8SKXA553BBLR3PjTbZpICCQsHVg5ORHc3H42eqmsoLH2hRyV6Bf570XwynzAcrPfBSiacYEorJ7bPglGjHHJeczVPl4G5SIoke62+i+wA9HNdWiHy4+PkMSdxkoDzTxNKAwjfIUiKsE1J1dpSzmOTyQd8QvipFgXnHcRR6vwBCvcKLvF5EvHh8ECBhw1t1gixi/VaglO+ND6ghvQ+VDFBIl0GPN6uj8eknDr9qFYY357d1pLGbJ7t5JLkbflA4pR4naYoMI90dW/OwQPnX8x8EYFgk/v7EusplGi7v+2hA0HcNIFV8E++dSPCS/SFu6+7rR3Ilfw8kzaZKbnfyCa9md+1bAdqJ4DhB28NxR4ktAiIoxa+blidHTG/JH9kIj+EbxbeH+AuAFgfad88WgcYnsTrojpjpU2y+RUx0eg44LEBrwgfTpfQQyegZwPYOECqDXgtfxF3+8KiK5+k6Kyj1cTgfmJT6qmT0sYgay4vHNGnaZnkAI2XQi6T8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(366016)(1800799024)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HQWHIC53MDYCi/Oig47b+sF6gORx8g5KMA9med9XieyYvClKFBTkQzIpeqyY?=
 =?us-ascii?Q?KXpT1UAsHrZi5u7ow5kWRkzARfp5K/7jAgFvOusPP+hMppkJJmMzfP6s/GI8?=
 =?us-ascii?Q?kCbvBTXAdlDPlBGxcPanwVIkZG2cj7Ccqv0/wxGq+cAaqKd3sqmeJO9hyibh?=
 =?us-ascii?Q?OrmYdhkBfGVwC6HD5ekflNTBC9Qw4Oo4HoiuIE1RwkGDA5rl/tmDi+MswEsy?=
 =?us-ascii?Q?dxoNUv+zbBpnzol53XS40Rdj4WqXaJV+T2XV88WDfuXW8ewjYmko4UDi4CFX?=
 =?us-ascii?Q?CoChjhnwRJHvKV5KTFHq4LNFi1fzMw+sJaWyK4m7qiQycaVdZ0VQ1ioN8YHb?=
 =?us-ascii?Q?GHxIHb3wLFJP9MhMm2Tm7at4XUoLjMKYnYC/Dm3NcsxKRe9lY9BWkb07Tu9+?=
 =?us-ascii?Q?cWZi6ZxvNzmxT9U4717FWy3Hx3/n1BqITcbN8cvAgrUthB2oIkJo6SGvWSct?=
 =?us-ascii?Q?PCrrbqPx4LI4wYd5q+ANdsyMPe9rLoifhytymJnDVMclvmlJxXIz5FZfnEad?=
 =?us-ascii?Q?qpjIg0SnWJoF0feQnZwcmrT5H3zzGB8/spFn3VyjDNk1J2a4cLvy9ljCizTf?=
 =?us-ascii?Q?S8qaTeL4JVsSD0nEDZSrHil43PY+eRdtJUuI9xzXW+iyxlUXEPjmsCNSW09j?=
 =?us-ascii?Q?kTubPPG2n3ML+c6hPt300CwVandEM7o269rRAQo2k0tVhx0ZEpp7wx4lFZD/?=
 =?us-ascii?Q?r/4/JPsN1RpHIc2hfBmNsXHm9aFDfJm2xRXoYNXH216AZSgcnzc9MdyTbEHu?=
 =?us-ascii?Q?SLe40zi7fSpBcvmHe8/x39nEkC+kxCFbUzlyxd2Dwpoe4Mg5LEkqArNWfNQ0?=
 =?us-ascii?Q?nyyiV/QnbMbBfMveAgVnPg6NmboKaYTAf4tfxK7It1z2xiiR2veqhCmiWFsV?=
 =?us-ascii?Q?7yvH3FG4OF9wm2YIGa7bDpKzyPlk9xC96ytpxc6FgVhsSZPybgJ4+epn7nJR?=
 =?us-ascii?Q?Q5WF7fu/uisGomnAn1DUeOj9fAb+9tJwxUANMXlBChAdsmEMa/VRgyENZJyY?=
 =?us-ascii?Q?GUdwxuSayVTjNvG3mBrSWTaufvfXjF2kyWIgh5DUDlcrefin7AnfNm+SX6Nj?=
 =?us-ascii?Q?cP0e4blvEq3WsvIiuhj9CNow7/tUuZiY/5gtrFaONqcgCs0QkfPAKPC6qJh2?=
 =?us-ascii?Q?VQ24gIiBRDXgb/OJjKABpjisL8O7VQD4cq8j6oMXUNC4wndl2xujgF3Ct2eZ?=
 =?us-ascii?Q?mqH4TdNJnhkcRCrO3jtgiOHyZRDPosQ92gWnWdE4VEzUYtLexzjpjfqodurC?=
 =?us-ascii?Q?L0+UYh1+14ileKKiNlkmRPQLOExGhHrUMCXuuvKYbQz+UEAi/Mt4AMHezsI+?=
 =?us-ascii?Q?miNP7YWMhfhRiWQ85ic1KzsOYyf1tZCsktBJIdPjgxWW3+7ZPJ6nLCIrXORO?=
 =?us-ascii?Q?85TJOd1d2N0dozyx/lnW0kDTcEaZC4ibSdSQEcx65wYDrq47zhl3AQpUAi27?=
 =?us-ascii?Q?mTIlyodYREc6Jclb07nUqc7Mx7Z71bKCUff2eZEG7CHpMhP9c6ovw9wyhheH?=
 =?us-ascii?Q?mLWDKNJceXEqqqoleBUP27VQ50HUGhhl3FGXEeGA6pzPJLqEq+LDCO2VbNL0?=
 =?us-ascii?Q?J/CDcWofxRRkTP7dLTKtjYvNs0kwsf9M4C8taBMJxP9lmfVbfeGd24/pSv8i?=
 =?us-ascii?Q?dJx8YXESNpS53/8EbL2jZ81/Y1JfzHo1Cnt7YdSW0ZZdb/fknA3LhOdrOUmw?=
 =?us-ascii?Q?TC/3reO9MtTr7CTE25r37yvLtO+V/+v3THtMJkpe4oz/I7/3uDkiLsvFtdi5?=
 =?us-ascii?Q?WkBnuRtSMfpL7U8d9D5M8E0thLerskbCOL0RszM1gZO9sFQlRKu8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf938c9-208d-45d6-e6ef-08deed8a6e1f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 15:59:54.5049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbrD3yKk9eTOPQ3YHojLyQXj1Xd814LDIy4opTZ29E7AW4HWu5+sVVDG2xtgUMnrW+p7fBxYoufQjewSPMsmNpdn3V7Ppiw08aECmjzqjwiE1kD+HsJ0w4i+lFuO+uRK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9324

On Wed, Jul 29, 2026 at 05:50:21PM +0200, Marek Vasut wrote:
> On 7/29/26 5:30 PM, Frank Li wrote:
> > On Tue, Jul 28, 2026 at 04:56:42PM -0400, Frank.Li@oss.nxp.com wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > >
> > >
> > > On Mon, 27 Jul 2026 21:52:16 +0200, Marek Vasut wrote:
> > > > Add DT label to SPBA5 bus for usage in board DTs.
> > > > No functional change.
> > >
> > > Applied, thanks!
> > >
> > > [1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
> > >        commit: 697f6889aa50996de067a8d170323535570052ad
> > > [2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
> > >        commit: 3eacea24d258ff5169d84a419b07cb5828e91718
> > > [3/7] arm64: dts: imx8mm: imx8mp: Add legacy board DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
> > >        commit: 81a2094bb922290e4b52a1467037f8d2ac07ad87
> > > [4/7] arm64: dts: imx8mm: imx8mp: Add HDMI DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
> > >        commit: cfdee13eba802665ecd8751fefa754a759f414c4
> > > [5/7] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
> > >        commit: b26192de5d0f4635d73ad2aea43e3e83a9ef5f77
> > > [6/7] arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
> > >        commit: dca8d10e97bd121494106f54f4577291a9bb0f13
> > > [7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
> > >        commit: 8ea2fa3fdc65f2750718aebdcf912cccde5913b8
> >
> > Sorry, I have to drop these because met build error
> >
> > Failed to apply 'arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtbo': FDT_ERR_NOTFOUND
> >
> > Failed to apply 'arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtbo': FDT_ERR_NOTFOUND
> > make[3]: *** [scripts/Makefile.dtbs:94: arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtb] Error 1
> > make[3]: *** Waiting for unfinished jobs....
> > make[3]: *** [scripts/Makefile.dtbs:94: arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtb] Error 1
> > make[2]: *** [scripts/Makefile.build:549: arch/arm64/boot/dts/freescale] Error 2
> > make[1]: *** [/home/lizhi/source/linux-imx/Makefile:1629: dtbs] Error 2
> How can I reproduce this build error ?

Apply patch base on git@gitolite.kernel.org:pub/scm/linux/kernel/git/frank.li/linux imx/dt64 branch

make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8 dtbs

Frank

>
> What is the command I should run and which branch are those patches applied
> to ?
>
> On current next 78bc8af4affb ("Add linux-next specific files for 20260729")
> I get this:
>
> next$ make W=1 CHECK_DTBS=y
> freescale/imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtbo
> freescale/imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtb
> freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtbo
> freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtb
> freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtbo
> freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtb
> freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtbo
> freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtb
> freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtbo
> freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtb
>   DTC arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtbo
>   DTC [C] arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb
>   OVL [C] arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtb
>   DTC arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtbo
>   DTC [C] arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb
>   OVL [C] arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtb
>   DTC arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtbo
>   DTC arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo
>   OVL [C] arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtb
>   DTC arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtbo
>   OVL [C] arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtb
>   DTC arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtbo
>   OVL [C] arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtb
>
