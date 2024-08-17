Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010038.outbound.protection.outlook.com [52.101.69.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3720C53BE
	for <imx@lists.linux.dev>; Sat, 17 Aug 2024 02:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723863293; cv=fail; b=G1T+1VOJqzLcwLdyW+azaKAu2g/WhdXJsRq7bPswDUpIsPKjuW65rnlAPEok+krjOVz8vMF0OCgJ15VqGfiAojqQKb8NGOA+BAPI2S5iuXB2pZgvEYZOduaBA7HBFn8poiRNe7mW6YrPXU28CO2X49wnFehRA8LKvF8EldusBdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723863293; c=relaxed/simple;
	bh=WnS+bo+vLnvYXP9eMUtI5MZprYnaTPDGekACZRP5m4M=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=DivAIG9zcG06sDxSNJ8m3gShWyrsJgKyuy6oQlIw52rrMtRkieUb4D3ZTLSb2a7B3HHkeGoZxKB++gFuZZu1v/KcqyWPEWQEvUFtgN2b7wP9lEX3KAnH5CW8T5Lvgjb1iBFWYPeZSAIH7k5aoNXD+Rs2QG9bnPiBiIIfQJ2HoPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QNs/Gr5X; arc=fail smtp.client-ip=52.101.69.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QNs/Gr5X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqTL0WRgelxKWNUJjI4wdl9cMFzMy76jxOpQeZNvPIKmoRav89jn9iZOHfA0xTM4FX4IeVy9xyMtCRvwR6LcijY8P17s3NleItFoMnLkrQehM01d972fk51HAWBkcLLCxTAgmbj8HNT5jjmk11+v5+XMTKfLbc0lox8j9U65vr8FNvIrSdxsuVKO8AiKJWI+BSQr3RgFT7VybvivV/Ire4kUS9TCQoxDYgstrDkDLmNUVvjcZO2Wdr7LFS4JJ21mFNkVHe4t1Q8wFLDxZNcF3MljT6L+HluIZ2GjdRHreKYmyaD9Ybr0rUzEQuM+DWildBRlw9L7Owcs07A/2cjgwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiZOHkCP3ThEiJaQsVoy9sV54O6zbOBJYysl3ZcBz/g=;
 b=wEYUlalEdDj98hnXVkn0C55mximfQfTE1CI+M8QFonwVT9AazEopCAITKJFG31ZWNcy1v7OfBoq4qpE0qHFTzyHMulEap6HW4WFAyGASI/pVfOBp401LQ56FAzW9HtSOy6IbJlHWU4RnAtQAiMWwTTCHgvsOiwVhdIy7/+AHKQEp0qR+AqNIAALAwjIN9ARK1nkWwDqFMUxA34hnXGcmiglmdEXVNmV73/YbFEsBpds3firmlCZhFxkWk3cXhIamcFVo25k096UyUH5ssOydk62t2zCL+T9meO1zBRcFLhVoRKJevaNPgwZ6aZMlIaN4nncrIuQtR8Jgj6PbYc42hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiZOHkCP3ThEiJaQsVoy9sV54O6zbOBJYysl3ZcBz/g=;
 b=QNs/Gr5X27xPwBAap2C013h39i145hw1ieBggZ5c928WbMG+mFVfOvyCN0kRaRelUcrGQqXr9D/2CVaG54nNrYGuvHgG894rwDK1ME6stIe3FyEB1INFlLRCVnnPoKrqlNbXPbPh3U1zmOMQq2NpY7TiwDbSqq9djcmd2ud4UZrxRaHv5cIM8UxtGq45/NOcox0IpEPbSM6n7ITnrKMvOUGk2xWAbKQTgfLyOlCTRHoM0PlLKXW1tOTOKtP9QrNLH3+XIv3eQHn1d/G4e9q80wzXDwwsAs5ga57xVcFR0OwvCf4/LmEQ34vBE41unCjaYZR9Dp4IHoe8g/Ob+dnkPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8680.eurprd04.prod.outlook.com (2603:10a6:10:2df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Sat, 17 Aug
 2024 02:54:48 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.016; Sat, 17 Aug 2024
 02:54:48 +0000
Date: Fri, 16 Aug 2024 22:54:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: imx@lists.linux.dev
Subject: checkpatch false alarm
Message-ID: <ZsAQ8awLIT6Nglhp@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8680:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a14829d-5cb6-4cc9-d95e-08dcbe67f4f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2gHunLDMqVSKx0g5oP6SwGlfThBDbCbfO8PX+sSQXjvzSOLZ+wphvZ6YroEF?=
 =?us-ascii?Q?DfALuW5yJvcb6IyfBZUN65zArUazaBNekux/kuBNxmzvKaRzlZkvTERNBvZ7?=
 =?us-ascii?Q?UfswuXbl/OBK0qpZtSwHHLs0tUuAcWWEpkwQzABmPxk7xFKLuAYm8eXsPub3?=
 =?us-ascii?Q?yB3IZSdgvkiNBHidc5bicr/2hROfflNwMPuyok9FRdCYCOlyrLx89hmLVoRd?=
 =?us-ascii?Q?akr7g1UJQeJ5UgxWRitF119IMOJDoAiXU9b0EpvR1DqoX3LeIFNeNKqXKUA8?=
 =?us-ascii?Q?RO44KbvHc5FQ/1U6Ub6dGvYB5+brtR+5RFYWPUyCI4Z+B0FZPaJ/lFr7bkth?=
 =?us-ascii?Q?JZ5dbTTFA/K2KSZ2gAlEEcvdz4syfQ3LGJfTU/EUerLvN4wlIwrOzoYaVh3d?=
 =?us-ascii?Q?g5pNqBHKEPgJTXZmM+6gE15cbGOJATavPnUkX6DMaWuiBziDxsCbUYnI/qR3?=
 =?us-ascii?Q?f3gxzh/OHtyfomuBovpfGLudJOcP9cn3+2T6BUtPDkOFAP/lHGRG2H6Lvyi6?=
 =?us-ascii?Q?qw3R/3WFnHYNVVntQqplhenWcd59EkUVh5Sdps9LWqS5wkuFESxFKM0JzGry?=
 =?us-ascii?Q?NwQWnBTs3QRDocI/1sIies1SIwu3QhjTF/aY1dhz61V8ks/set9r9K9e5Net?=
 =?us-ascii?Q?5C+hCoHl/7mK3L3XJxCSRV1l5pJh1Mf1rsPGbpt5SQuSetPXW46/sIkwwuVG?=
 =?us-ascii?Q?kZH/Yr8ALJDfFaVHkoC54kG6rVfM9e782Af7yVF+vCqzjaW+iK3KDW/Z02ZP?=
 =?us-ascii?Q?JQS0eULdWlVCUse0CroyOcYZqBxm7AmOigZgPv+wX0xev7RJWrp6KeXA+e6Z?=
 =?us-ascii?Q?gxaPACIsaAgPhAUPKeCmoXBnfF2WW3NJVVUfeE6TSelXJIe9Y6zu99hVBrlQ?=
 =?us-ascii?Q?ykTtXQjpCTOjd1fpd1pbe3vSqmNSYsoZjhV3UlKnvlg2eAyQlIIlqmpxRaH0?=
 =?us-ascii?Q?evtC+ZsdB1GkSlmoM9mlhds/CIlk+OmelBR4KhPllkQ+G40qSWxaQVXC7dwp?=
 =?us-ascii?Q?wj4tyDs9MEyvuEYE/KxgH+ag5N8mtbyaiUiQM2mqOEfeeYaFS66URMIencsu?=
 =?us-ascii?Q?0MH05Yngr5z1GTDe40w+eVKF1Jf843Ucx80EpfLn4EzxxtZg07awCloMDtpH?=
 =?us-ascii?Q?X2CS66ZI60bQ4/uGc286taxRtoT0JdVR9PE7rPlM/EVtFtypdndXZujL0U6j?=
 =?us-ascii?Q?GUFQjABH17RBz8IeaUW79r6gNQkrnjztT7XVcSb12dNHdPg7E3YnXs0Czk6c?=
 =?us-ascii?Q?c2qJeb49W6EuJOUA3sARou5g7x2FqnLn1fGp6z/RdYp6Q6FjWSVgOW3R6t3G?=
 =?us-ascii?Q?r5RWTWLTWjgnuVTzguUNp3smJc3RBPmtaL7VstwWom3zI1OQq3t8SPsy8+qZ?=
 =?us-ascii?Q?cDwK4Xr9R2oSBgY2qioiRcfZ9hi+nbRknA8QTfeonjN93CVq9g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bshRTraQr60Mnz0ZNp/hkls704ucbMEl01DmK0SgA3oDXxDcH65wvDf4/9cA?=
 =?us-ascii?Q?yGOcZQgJfXmEi1AIKQUGrCrZgQYSap1Bsnc/ERKKCx6RuzmXz3Ue3odz2cfO?=
 =?us-ascii?Q?de7p3emh9wNHk5MsRTEL/C8O/o7t837OMZUQux6nAwF/4+OA/OvJxDHY8r3c?=
 =?us-ascii?Q?S1J6iZ6RLiVtY8CB2OMPuXRBe1cVMhM4VJgCkhWAgnEch14803KWvwUYHwna?=
 =?us-ascii?Q?qTWHpbdmYKaXuMj1j0wgs0QuWYR+edHwvA2huzFHjm3Bqt1kwCgO8/Z6lO65?=
 =?us-ascii?Q?fMHwcQXR+ST1dNtF93DJDIrSSubGdspI+IMf9qwKFC+oC+CgURxgjAhJRoSa?=
 =?us-ascii?Q?K1Vvape6y7HxPz/Xkt4fr9KBctioC3lfwoj/x59XZYE3YXWrU3tsVU0fHry5?=
 =?us-ascii?Q?nBJBPxHe1N5pJy43SLAu6u6uhaDmCll1MOAap60Ix7EObSLgBljCiWO8bcnH?=
 =?us-ascii?Q?GMF0EaI338aJQHQWBMkEpeFloWdveesSXI3GIY0rFBBY8mg5bgWcRFHShHfD?=
 =?us-ascii?Q?aoB3nTvY5HB45dxmnyxXtbRbe5B9QnLibosyNC23K8P7YLVT81KdvxJhkgzW?=
 =?us-ascii?Q?Jft9oCxtXu08JcjFugm5eGdqV2XgDXYJ6UZrxEvRrif2EW7tiaIWcntxsDwq?=
 =?us-ascii?Q?cwyleKo6HsDG8VeZ2R8qvOreaig49gSZTmQA3DRLPXLHjkRa0hqfdF6aB8Dd?=
 =?us-ascii?Q?S02oVg5eOJAki+4WsmZ+ylBdGhNZmOnFwZEVaj5Piy0mkX6vTTcQ5GWXrXBJ?=
 =?us-ascii?Q?YvqlX+a1e6DcxSU7Aemdj65M586ZidEYJ/ZuRD+XLtnGmAWr/hEUF7qmspyy?=
 =?us-ascii?Q?PES7VnAsRglMdqayJ29PleQQKXzr/43wrT+efvzM1Lf8ydP0Gn/+/E+fw2EQ?=
 =?us-ascii?Q?KDfnq9t0AgV765kc6OJRAv4KOr8ZQUUCWRIxIrHGQFYzTYQbTSWkObEQ4EqG?=
 =?us-ascii?Q?qwGz+Ka1sSC7JNLDlI/PeWKK1kBlAfmxkWqa3XUqtl2UkG2KRw9DYKaHjII6?=
 =?us-ascii?Q?6C3lLqcfhzNHEqBL8+rGMzxr34W/TS08pJdZMxxY52FmBH+ZbGVXgYCM8qw3?=
 =?us-ascii?Q?fisMi6tXbA0oT8Ve+QzQ02SaT03M9FlVOsBusM+SNXCHBiCnRBQqTGVF15z5?=
 =?us-ascii?Q?nR4Kl0hcktZv6G39r4HKmQrZX5bnquuukkbiMVR2VOFXAU97SoU8Qel9sgED?=
 =?us-ascii?Q?mTr6iTTIg2vpQFZkz+A0YRohLNdTYqY7kVApzarNyRGfvPXv/7t/B+aFHlfu?=
 =?us-ascii?Q?8JdMDBV07Umoz30Yrpp4XuSalgLGUdO2TY8BgD9DJQq81YfVZUuTp6emHuWR?=
 =?us-ascii?Q?wBx9FL15BUxRWJqMB+XVW9t8vlt+X5TOz2YGGHjifjf5xNiIAkCKpMYajiUj?=
 =?us-ascii?Q?FS0JYUYlA8LDYEWEBT/WKnOEJnW3E2Xfzqthv+5G48lrUkd9v62pyezBfADL?=
 =?us-ascii?Q?+mvkIEl3xvBtoRj2qfstFgqKnJJxlqb0G0fxrIjxzZlXWaLcnq2UPWOTzZJy?=
 =?us-ascii?Q?CpQ6D+uAxdGDI+kULGRU0VuL3vAX2FubWeardmI2tuS1gitS28eREU5SN4p7?=
 =?us-ascii?Q?I9kqKHlYxPWgJNSL/T0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a14829d-5cb6-4cc9-d95e-08dcbe67f4f9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2024 02:54:48.1474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wa0fpIEwXaPCf1s7pqkP7BD1PGdN7z0efJnWBCYNIHq2Q2cbs2uKHZywJarGAx6O9yHdi7u4jRL5xqF3APZj7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8680



+       reg_audio_pwr: regulator-audio-pwr {
+               compatible = "regulator-fixed";
+               regulator-name = "audio-pwr";
+               regulator-min-microvolt = <3300000>;
+               regulator-max-microvolt = <3300000>;
+               gpio = <&adp5585gpio 1 GPIO_ACTIVE_HIGH>;
+               enable-active-high;
+       };
+
        reg_can2_standby: regulator-can2-standby {
                compatible = "regulator-fixed";
                regulator-name = "can2-stby";
@@ -127,6 +136,24 @@ cpu {
                };


check patch report

WARNING: Non-standard signature: reg_can2_standby:
#32: FILE: arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts:81:
 	reg_can2_standby: regulator-can2-standby {

WARNING: Do not use whitespace before Reg_can2_standby:
#32: FILE: arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts:81:
 	reg_can2_standby: regulator-can2-standby {

ERROR: Unrecognized email address: 'regulator-can2-standby {'
#32: FILE: arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts:81:
 	reg_can2_standby: regulator-can2-standby {



It miss interpret reg_can2_standby. If I change to another words, not
error report.

I suppose "by" trigger this problem.


Frank

