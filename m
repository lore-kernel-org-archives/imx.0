Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2040.outbound.protection.outlook.com [40.107.105.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4AF1CCEF1
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 22:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729635888; cv=fail; b=Ukdh3kn4MhP/nPuh14KJYzB6uAjN0qre/HUwT0KneJuCJaaPaXMeZyDRLzCApDfE2X2NoV+nlIIr8IVdxzB1yARTF2MuFRqthYqDP+3CAweXQGXiG/REO3hEZpzTDLpvLftDttqglzjiORPjLSEQ+od9nZvyHeNV0TzRIClAF/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729635888; c=relaxed/simple;
	bh=L+Bh6sjN/hnxb1saxJd2gHbQl/uCpKFaWRSf5BvDFT0=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=jnkmHQCNh8alDSkDpgtHJhGx36w/PClF06XGUOvpdv5Gy7ZNYNJrvVRO2OZBHK/H3E+lBTxYnRAy/hmUQBCkOxQbNcRrhE2BmJ+7BGTQ+iYv7CFzy1vJ/ICnl7rL/buN2SToFJiT2rM2F5iFKWIZ2R1DIzUwJNpPs+f/wB//Msk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PXwTN9h0; arc=fail smtp.client-ip=40.107.105.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PXwTN9h0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVbVPIF74spP3l81548nOI2w/XRhZ3wDi23HtfRlLrA1Glxux+J7ql9MNVvfwWpBeBLTSyNC8NmaAJBONaP/eNT7BCi7puvvhQuI1G/pqd1L7p6eJEjV+0XpXasWsOZJFoLtsDFj0VjPCHE3XKXHS0xGfDI9iFLE2dsDmpQWom7Hr2M0C55lmJqc8Ed3aCHnEAmxluf3K3lsTJ2IHv0c/z81MY9WY2mawTyGvSMy8/W4iiKCXghvSMFADWPoN26F8yS6ypr9qnkn6m9F8m6/bAG9mshiJeSO/TV1JERinFjzdILrA8S9XYI/I39ioyVXYjiT/BlcKwcqCIw2Ld0vgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3x7Xr8saiFcIOTxOnsHAjnd7S6DcoSc9+tOVnpKkp7E=;
 b=iOg+8TtMT4zvGjZP0UOkESMo2Kb10r055+U0VitKV94tVq/puMyeFINJXtpKMdLCn95VSCe+ttZIEjRXsE/7/+TzHHCCDb1m3lfMGm8WqxQhMawTTzpflbzww5kuVy/07r7o1upLUUnEs8Rs0UPJkr+aFMo/j0hrjoTHSlG++t2mxNoCYsKItx+TJaccuVFSa+uQkwVzB35PANb3ViNh2OJFwnrqHenED2LwrU9qz9xRaQzfvapiBNJyiO+PzABpAXhKcDY2R/UwAalK0l1GIju45AwiYP7K1EEDE+Gpzbno+e7YTzbK12S4ZTEQoMv74R6bv2+IDnyjxNrg8NAstw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3x7Xr8saiFcIOTxOnsHAjnd7S6DcoSc9+tOVnpKkp7E=;
 b=PXwTN9h0KRHD4XPhaN3mMlEzN7WZpp16Y6+ZNc4kCF174c8OI92qxAcJIdtD1KPVgedDjGJFfk9inVrxF3sAkzmlkt2AnjMkL+SGez0g0cGa8iR1naRrZuIHhxdiWwbWKT6xPi9Wmhbdv1cGT3yfP6vJ24YUc0MrJOxGWuUPCgN3tG6fxlReepkll7rLl78AkI5ahmDtAq0k9h5t4Oq2ZJdeREf6kMCId+oVgUOBpEackX/6OSItiWyhg/QVOIbIASXQxkMQbMbtmcY13bD2IFCeUTfRFnDVL8FEp15xdGCCTGRZ1nbotqqfb0llTeObwFb3u2t3zVa0mnTMXv8WZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB6941.eurprd04.prod.outlook.com (2603:10a6:803:12e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 22:24:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 22:24:41 +0000
Date: Tue, 22 Oct 2024 18:24:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: alexander.stein@ew.tq-group.com, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: dts: delete-propertry doesn't work at overlay file
Message-ID: <ZxgmI8eRA/cIp6zY@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR13CA0109.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: 60eff359-ec63-4a77-3ed3-08dcf2e852ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gF515QLjGvBeknzF6U7AU8Dr0zrJiFAM11IDwYVe3ClbPQEbDs+a3SN/OpIt?=
 =?us-ascii?Q?3KCZNOQB/NgDqtvDLqWh//hFDpxUyUANPzywPyObEVJ8C301l6OQY1Vlr2sA?=
 =?us-ascii?Q?0JxTXEL1ArgXxTgFElrD8CYRV/VAJfVOP7vQQVXt2UEHJlGSJtFl4Xx5HI8v?=
 =?us-ascii?Q?GTSfCVFpcj28cWK4Op2HBzgKIMW2w6U+1BzXJJsgo6BnoaguQrJFmY5mliWA?=
 =?us-ascii?Q?c5M3RP0ZOvnRjH7go960p7RdwTpQhHGXlLUXSbsbDHjyXJRfRqpGf9vEe5/w?=
 =?us-ascii?Q?gDJTtdD1FqWR0IlNJHuUZevcEDQVNvYe0KD6yZTCkLW4RKaV69/2LY/SFqoV?=
 =?us-ascii?Q?WRSlh3U841ssTQXtl8HeRUlcX4oGOxw+XZ2MRNs+dV5Xa/Z6vzKq6cNm7zn+?=
 =?us-ascii?Q?VNRvpGyGIhNfGl80ws26aow0FWwkTXKqBAh+MumzjdenlF4YBf2Iier97/YE?=
 =?us-ascii?Q?gOs8y9zyyuYgzVB7xDTizt6T20k2yoaT16hHCvKVVcI8x5mERylc0BYH7aEJ?=
 =?us-ascii?Q?lmNPF3jPEr3B2MfbRV4oomcHzrF4J2j8upvlLKl0yrcAmj25mM8sgpJiJbPu?=
 =?us-ascii?Q?gmBD3g9wLqQwwQfmXKRUtOC4qJpjQZ71tUicy56+ctciyQHydCWCZb8kgrhL?=
 =?us-ascii?Q?CHBmR5Vc/q+m40JHCoqhPcmXRxDOrHJsjGysT4hRhFC590dWsS2xlsJ3Ngb2?=
 =?us-ascii?Q?mj3LDX3oYjDNnktRyYqhvXfsej8OLaJb9jOQI3292gexyMPltHMocl9MdXdA?=
 =?us-ascii?Q?bszJzi3QRktuNJ7oqW3c05M6CdWcyDq1NX+Y3Wg+9UvAfAQwMEm6peVF8F3+?=
 =?us-ascii?Q?jtir1EE1Hd60BuBq4Rsjl/uWiTwBo29B00y7sBvUwEiXjQ5o5iYOKgelSKvO?=
 =?us-ascii?Q?pp3tAf85PboMjUvdqLolamlCs6/BTB2n81TCzRvDLUoMJRBv4KcmJB2gpQVf?=
 =?us-ascii?Q?+qTLDXkeAQYu3D/cgqkyS3MJJA7SwWiZWz0Kf0DiVKc/pbgpspyVuBrFeII5?=
 =?us-ascii?Q?/mO/hZBhy+W3eMl/ntuFWCur1iKmL1E1eNbwSKjPdwcE5k5Bai0/0xRkl/PU?=
 =?us-ascii?Q?vBg2Qi+YgZx/TLESkNOQQNO5sLRTxRxCmDKsrTJolf0KenCygkXPcufywRfY?=
 =?us-ascii?Q?0YfvpwackfsZbzdJVCFxDk++fvoLnPmYunXGSdCZDgBPNiIkfNBuPTXlHw/O?=
 =?us-ascii?Q?YhObLb/l6g8A39U4i6paSKHuQ8Ob1pXMsIS3BFnSdyfqsc/TTY+5Q+XTI0RW?=
 =?us-ascii?Q?JNUZB53et3d3WNVEmmKElXh8S3gbReDWfAN5zqFXMH60eZpnpiCj7ksgcO23?=
 =?us-ascii?Q?fo88UQxbBdJ12+LxsVfzb+JATLHoyJdE0KZNEO/nHbWTeX2WU29PgJL8G/Gq?=
 =?us-ascii?Q?Hw/Ryoc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D5Wml2yUG70sFqOvuC43sqLYWiLXmMGTBhEGXFizmqwSeiFRwUb999mP72QD?=
 =?us-ascii?Q?00Q2iCLCb/IV+ShxAFk/PQR6sV13mSTs3BCVqvNVvslzKkLTgi0GCzwD67+R?=
 =?us-ascii?Q?awN4lRhE5S1y1xkpLdReiazrViI4Q2T6QcaiFHlbSHaVy/LKz14/ZCks6oyy?=
 =?us-ascii?Q?t/lyTiJ3IV1i1zk0zjpQ6JZqW+r/G/vlcKvKCu6VgZ8aOqHC/yk1KrCCmCeA?=
 =?us-ascii?Q?cg4+/Hv+33jGMeSQkG966WkzdoUWAVHbpQuPIHommMwB6KCphv/ihfZRmhg+?=
 =?us-ascii?Q?cV+v4J3mWkse8pq4T4j4OIvxCiNWBshhTWf2CQdbW37xtooyg9TptlC+8+ni?=
 =?us-ascii?Q?F/NlULikKHnP0drg87v9R2F6CldP8iNA9SAocbymsJV61cy8ZKRbx6GbUoZ/?=
 =?us-ascii?Q?6oiIp0dQydPB+gTaI3nMiakmov2bj7ZFqf1RgYCE7MBjp9AvMS8JgZ1eyjoz?=
 =?us-ascii?Q?zIo30bvLDgBUZdbikSg/L32Uqv4kmru0aPbIwQJuG/2HU05wXYOT7FzGOiUI?=
 =?us-ascii?Q?EqgNXwb5fv6iak7i04Z1KhBwu9MCCWYdDsI/m7qqfLAO7OfSrKPQq1fPRcq5?=
 =?us-ascii?Q?Yhm1edkcMYMvDBO5slh0+kNJJdAY+S6PXtwZk5k4Vp/H681lI+oA1ONfMHUT?=
 =?us-ascii?Q?TDFFE/uUqajl03y1NLcQ0x0a6B/PtryiI728mtRJwabtLei/w0Ejtj1A3f4O?=
 =?us-ascii?Q?eldfM4SfURiMRW8jJ1GqpAlBp8MIdPd0OWqo6lM3YVpi1h3GkYIBbGh7882z?=
 =?us-ascii?Q?PI/BehFqOxLGjAsGCYJzafSRG3JTAkY21948+OV+RwhSrcGkSlRc9PxNu3f6?=
 =?us-ascii?Q?416GcoGDFz3gtpKMltwP1wkCTADfnbRyLkq5QHccFB9DvI3nD9MiPFrrtZNY?=
 =?us-ascii?Q?3m2o/R0r2JWHlSlyrYM+vwUxUEJommS3SJGArbkYzqLcTuboKahw0mer7+X+?=
 =?us-ascii?Q?6QLNuYQmFybP2CIZxI4b7G4+3WHeXcezhkkJYpB1mYFklv6e/bprvRJDJxVW?=
 =?us-ascii?Q?2VsWtA2vKexA3/bSHZ5iu2FMByR40djJ3XkN7sX7Jzgtky1w2r2Tbx1s1WJj?=
 =?us-ascii?Q?qMgQZ52nithXpBERLjzJKi/wPVV1VWRi6aLpCgfsGsQ3Qkgv6BEbhFhxZycm?=
 =?us-ascii?Q?jtPGyrpHj/0NqY53U1mNb06rEtIzZr1OXK29C3B/f7qfJs3mryAL8NQpOXH4?=
 =?us-ascii?Q?8zxUyijn/1XknxvytZ6zYTlcjzWsWPEh8QKE2kV9YQ369j/OkF0LaUrCwU/i?=
 =?us-ascii?Q?OX/DVV4pivLcswbl9ezSCkbC9zGuO5Z0YGqmK6jaI8e2bfukVW4fdT3TtWLa?=
 =?us-ascii?Q?LSTlWJmnQPkDvSV9+by14jwUGLrs0s3QrGuKkP1JHsVv1joY0YBRZEun/r6h?=
 =?us-ascii?Q?wMjlLGkPvMVQAhS0xj4LHtMgJTOxA42bRRj3nqqqPWAIQtGujY6JY4d+K+WK?=
 =?us-ascii?Q?siJZwgKzYFCDs5Kg9AmkVDeIxqh9oL+UNuKbjZL+CIxGSn0+OUZmBPgAWxqp?=
 =?us-ascii?Q?tExdmP7J8DE0AtXni/36v1W5ptnHBCgIW+vcjDoDyI6Tk7w7NZbXmJQCYtR9?=
 =?us-ascii?Q?VvFrJlZ0o6g7kK3SO5Wc0+9zHpsuH4E9JoF6fzCB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60eff359-ec63-4a77-3ed3-08dcf2e852ef
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 22:24:41.8400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZjlhegcraRK84eNRrjiKDniCJ2S3exnJRlcPbnLAW2aVLjtORIAMvcNd4i2r4j8AU86eLzXdV54NtRJzjmy1Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6941

Alex:

	I found /delete-property/ in imx8mn-tqma8mqnl-mba8mx-usbotg.dtso.
actaully, /delete-property/ doesn't work at overlay file.

&usbotg1 {
	....
        /delete-property/ disable-over-current;
}

'disable-over-current' still be finial dtb file.

And another big issue is

&rst_usb_hub_hog {
        output-low;
};

&sel_usb_hub_hog {
        output-low;
};

You set rst_usb_hub_hog and sel_usb_hub_hog as output-high at dts. You add
output-low here,  so both output-low and output-high exist. It is totally
dependent the order how driver parse these two properties.

May a fix is

&rst_usb_hub_hog {
	status = "disabled";
}

&gpio {
	otg_hog = {
		gpio-hog;
		...
	};
}

I have not your platform, not sure if it work.

Frank
