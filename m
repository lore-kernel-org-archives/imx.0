Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2056.outbound.protection.outlook.com [40.107.20.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE341F4CB3
	for <imx@lists.linux.dev>; Fri, 11 Apr 2025 14:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744382663; cv=fail; b=lPXDiXDQ2QMJdcWTxePX6iLaxeDxpYfebs6mnGeqXUNxYcxdExvui8nuz3RR2uTEDYY/1OLvvQOZLei7GbQiRHaskgaemo1bDJ9btQzaPJyo1s2c8Mth5hVaAPAN+rjq+hmy312gi1GkX3biFN7qJrwdjMI4MBfB6mF0ckIkmk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744382663; c=relaxed/simple;
	bh=Gs9Dufcl9DQWX2OIG+f0L1hm5nPw1pcwXCe6O+TNUU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BznImBl8hamdC0MGsLua8eBgokP4iFOjgH7cVeEUKorlDXRkDV9VjaLzIVr1ciAjDfDy64Lb69S/wFhdvNi/gM+wrsvTIjPzTo2Q0wMzKK7ZLve7mOSFceFwqp0iY0QbUOlpL/sINsO9C+51HRDbRSEP3bYnwY/zVpl9j/TKqUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iZQdMAa2; arc=fail smtp.client-ip=40.107.20.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iZQdMAa2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJjMD4uZLF0pB21IFLsAZfbnCWBfSccoJFnGeh51GszL3CXBn4dy9MgrU82vw+i6kF5hlrBhsixXRL2DEP/49VLjwIhQkXxDFc0457Mdwh3INX3p+V9HxYffkuB69PycA00h+4UEkwgER7lePNXk2xPjqLR9fHg2aQNO9KqlG2BZK1hY9ebE3Qw2392HlM2QKO1EFj4+wd8yvnOcOkdB8LUt/HQ7I6320YquX08SahQgciBWEswKL0HiRVQaFiSwgzlkfYL0UDVwREYppsxj0NDuPVppb3kPlWOaa1NKm2fF55rvovTa+/t3UIeZul/oBKxId0YAf9gLBI6Dvsr1vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4iKof3/i7uvAJTHh7pYKlJwN38TZS1Xwmiw9FjmeYo=;
 b=sbpxQ3QoE1Yclo8ry3KXrqSsIFUPsjf0h4OB+KD8by+TaaUSe/wgo8Jmp60FNeugJiw7uxRxsAT23IeIM0CMbJc2sXz5YswHC5Pjv1DZo/SD08EtwxXeGwc+Vmq9J11nruPa5W+zdja/0KAH3cyQak6XzqnFl2tsM9MDYBf1r0+ssdYtZ+9FCjgMivhweadjj6/81N2sx85GcrmcH05UPN1VRnhiNLk27WQfluCCawp1GcF7WnKOv5T2hLpKFkDYf0xVR1zsi6+opEulMAuIiytvOVRql6DxJCF2lzAxQY+D5DcjWFA05dTMOhNbDeDO9ze9C7m/ZPY2El2r4wIIDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4iKof3/i7uvAJTHh7pYKlJwN38TZS1Xwmiw9FjmeYo=;
 b=iZQdMAa24h9NZygZxNoPK0Qz5b65D93x5NUnzVZny8fOyxwrri6cCoLFQsirAAtaYdNittlsR3LNgs7S+M5WYpOD6gkV8uy3jKEuwRnSqJp84Sr5AmYZ5d5zKu1aDmOwpeYzTsjMCSh9C55l41sE5pB0T678tv2bkeRME6Uol+JB8SogDDOCk7lHoKTr1z14xRLPyZ60WDmS8XG8rtZ/Eo2++huMUJF7rhHrpxrJbtdAKFCTBaef1G6JgiEq8oUA8/pdMZqirSuwbi+akLeCPHOhq34X8C5lgdt3zQR7eyXxbsiGlTJKyiTx7XVz4Pj9XBeRbwiOWeYgHvFSSeB5GQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB9256.eurprd04.prod.outlook.com (2603:10a6:102:2ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Fri, 11 Apr
 2025 14:44:16 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 14:44:16 +0000
Date: Fri, 11 Apr 2025 10:44:09 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Aisheng Dong <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v5 2/3] arm64: dts: freescale: Add basic dtsi for imx943
Message-ID: <Z/kqudXTP5yzeQZ4@lizhi-Precision-Tower-5810>
References: <20250410062826.3344545-1-ping.bai@nxp.com>
 <20250410062826.3344545-3-ping.bai@nxp.com>
 <Z/fmnHmYLF/TlTnA@lizhi-Precision-Tower-5810>
 <AS8PR04MB8642DF14633F13B88D959B1A87B62@AS8PR04MB8642.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB8642DF14633F13B88D959B1A87B62@AS8PR04MB8642.eurprd04.prod.outlook.com>
X-ClientProxiedBy: PH7P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: a1569a08-3d06-4acf-7223-08dd7907556e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B3HX6Fvb3riiG7p9pQAqhhz0c35Tv1JeEYFIXInDCoBpZGeMKd4N3vFJB4CL?=
 =?us-ascii?Q?9zGibkHUhKGsmX5whiKVhDRuG++o9xQOO9V0nIYoRTuQMXy0dFkHHPwRXfEx?=
 =?us-ascii?Q?bNcP6ccbrpYh5b54uEpSXmFLYKkq95cyFz7OILuTbD+oS8NY8yRrhbxzHVaD?=
 =?us-ascii?Q?WO33AnazlM6zcad1BAWiCo/SR2TTkMwqYJPAsxVbpuFiy2hYyxq7n0QleooW?=
 =?us-ascii?Q?y86FcIoVN1Off6OrYjyyNbFYQAftKc8U5Q6CzlVtCNOw0N9y6WMfbpYUtrwq?=
 =?us-ascii?Q?t+XY/s0Fwpo83tiQ2cb2wTdHjtda2cDfRRkF1dDJsTD0NGXjlEoajNDGFlhb?=
 =?us-ascii?Q?ay+24IX4PSU790MfVxHXf3g9gaqI/tk5unvdInZ2UkZWJv7yu7+J2h3FMv/+?=
 =?us-ascii?Q?Fdg7jzYvTGpaHvKR/jKn/vtYkUWKIkv5+uV3EsOA1qfRMbeHWxG7PmXVhYoI?=
 =?us-ascii?Q?rJWEeNoLTE/uUARHrwHA6QFpAchBBtsbA8iEivKuEou+NnfMyY+2cCwupTsf?=
 =?us-ascii?Q?9g/XtqS2eA3A+eJtjmQGh3GQtUvELvU51I4nKTbL4tTal5wETI13CPUiCaul?=
 =?us-ascii?Q?w9/impHzyJPyXwJHGW3XawCcsamYl49rtzxK78rjMT1jBMcDpYD7Mj19J2Cb?=
 =?us-ascii?Q?K1XGpA79YuIV1JtuXK6u92I1oiM1JWzr4ipafJi4dkqPbxj7cZIjHpJ0laN0?=
 =?us-ascii?Q?0+gZ9xdiOJ2IIJTzBeaFdY0o389FrqNwMSYSiI/q/CzVaVm7zkN/I54aFV2b?=
 =?us-ascii?Q?4xoD7tR0gZrsz2Pdhug3ZhetPUQb6PtRp8mQ5v3OoLqS3EEyoPezDwFxo+vE?=
 =?us-ascii?Q?lnUEx0lwJS+7iY6oyp4ijwrEYkd2ViHYbadhABh01RgHHIKRfvJLQT5p7S+8?=
 =?us-ascii?Q?ZVMPd/ap7KEIVks9cfJZzuK9e/Aqzja1DnGHpHdbbel364pzu3DoCoIiWgUL?=
 =?us-ascii?Q?D93kOrsnmtCi9z62TLYNDUF78h8msU4DhEYXHVTZIsg63QJaLce1cgjqE89Q?=
 =?us-ascii?Q?ihLcTpatRMMKmKUxGhPaGz81GQWIC0qXNmzLyNSFBQxtQGQ/6rPRkttTy5DK?=
 =?us-ascii?Q?FMgwTmmRHohvBC10us+OSirOkIVRaH/HvNVyPVgr7rgSRkN71k4B2CviZm2r?=
 =?us-ascii?Q?9uN0a9qeXpF/YuXk+Mna4sCA3geI1mYdvAQsKeEdNi5jWNDqKUnQ8Ywe6OHc?=
 =?us-ascii?Q?EcmpMxQv+eSBstf6mMJyTGYZi4PEsQsKTE1n/7qIQz2oq39o/ChtIAUEOwXZ?=
 =?us-ascii?Q?3FaPiJ0h+fXA8ctcIvRJ6faduCcfeiFaQmSMVLigOmUjRLbfMm1cH85eCxqI?=
 =?us-ascii?Q?6Fy0LkAs4ZdFCd01HN0UaYRzoM4gWbClH2E1fAOtH2x2KCM2HkfmnyjZJhEj?=
 =?us-ascii?Q?3IanhRaMVUa5M21kWA6MuUJkVwBs/Ur3cqYZDo4ejvON36gqJubQkrEEF2yl?=
 =?us-ascii?Q?H9hY5siUgSVsxyIqguaqvqHGB01ITat5c8CWoCBX9i2ExiCNUT8aCA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rdOXm/ihSSRSMqKR9xzC7vFGiUibkF54WonfF9gmRb7weV7X7sEshdolY+Er?=
 =?us-ascii?Q?uArh2tJfEeCOag3YolRd55r1z+iL79qWywq0EZcScnLokf56HjaPOH1UeYJx?=
 =?us-ascii?Q?wk77/oIWsu9Cie3ECH3GwA64UD9U8ksyVzqvVRTUddmD/bssuPGQdWALHAZv?=
 =?us-ascii?Q?O7WHtKT3CV66yUotxmHZ82Bqgs9c+lEu+ShoW+VycG4RWCJ8fnbcu66MVaUX?=
 =?us-ascii?Q?76jFkXe9gavbhu2FTpiV9IqQkwAypO7lXkJXO3QYzGuxVcEEjnC9ev5/XcFt?=
 =?us-ascii?Q?Xfu6ZbxByul01uikXm4SFoEVPk+um0p+hm3h7b4EX2ueN/7W0UPOXp7jW+9T?=
 =?us-ascii?Q?omtP8ORKTtQSi3EcX9PLgvFqqCSU13dGOz8F2Qj/QqwTtY0USRvSmg3aKs3I?=
 =?us-ascii?Q?OxUFay+H03q5jZw/ZKIbbMwvPTdaegbYo4QiL2LqeaMZ3rgRfJWtXm1RTNPX?=
 =?us-ascii?Q?E5H3+MM0hF4VMP0S8c6rVDTtvgSw8H4y3ChtHp/Km9fer4dqSjyH8Wl+ePjf?=
 =?us-ascii?Q?XMQ7Q1AjA4BxOykdDHl0FILcd27ZusVrqgXHu+JP220BrldLEXXm94EfQasR?=
 =?us-ascii?Q?LzcWIgCyTBIXUY94YU1NRFwIiRYTGZ5g9na3CiHSma2nHqG7+A31bAU9rDqT?=
 =?us-ascii?Q?akO2o6Jdi6ZegoPcEj3AbrgApvbcV0ek1r/tlkQvIFUAgSRCSwyn2Z3K9oXI?=
 =?us-ascii?Q?M1tNP2bUkDZrcZaajFJ/tSmFrc3UcZ97Kg+Nh4BanLgEazcSDxyLwQiswQHd?=
 =?us-ascii?Q?vVBBzL0ayLcS3AT8sAalnrOg1ajJKMjgL21DMIo4nnbg9uLwGAxr+nX+eDuk?=
 =?us-ascii?Q?ahMEao8kQmca+926aTpznXONB4hN35WXI3MRPh3Yy3rryHDuDkVsGCegR3ia?=
 =?us-ascii?Q?LTWvfDtXTD1+sV6O7x0rkSxcWxUp89IMGrDgah9+TFsnRJTV8VjyoHYiHS45?=
 =?us-ascii?Q?aLuzKc77XEGmzoMK18D7tC8vDo5c03yhhxd7//XVSop6eUqUqKqIswGNzqbZ?=
 =?us-ascii?Q?4X+dwx/3jNa2s5tDKe02v2/RqpzrNTKsky4+bYgvlqq00omVo2ihdQrzbtfr?=
 =?us-ascii?Q?xro3dMIOnpSV1ORhPXG6M3vPZcRwzIUFeuT/L2yHKlqmirFkh2pjVwevsPdN?=
 =?us-ascii?Q?/xomFb2TNiQ0N9/c6kojNWw9HQ0ciaKtN5elte93ZxK8A5nM1ZriBOsylCfY?=
 =?us-ascii?Q?uNu0fRDdBmXupHEsxy4LuNEbOAFiRytIEuBb75TZ+Gyg+pQXYsipOFn3qdkz?=
 =?us-ascii?Q?pu2plXQu8AsFvi7M8l84yRY9EORHFVZZjmHji4eLYzHeogB2Bc6AGj3UeUfZ?=
 =?us-ascii?Q?g4nLRBbS5BNWcwIYGf+S/nhy10BJlvv9bNQOg1IPoLq1Ufv3rQjHjtDpEt8U?=
 =?us-ascii?Q?U0qzKNR6FGi2deTLN0BXwD0JffdPS0hvmMjftH4z3H0d91X7+fZWqrRl/6x/?=
 =?us-ascii?Q?L7SWQk5Pa4CNFWZW4oybCEM5r9LCHrJYkuHiwShEEmRvTMXTpqtQX1oTUrTY?=
 =?us-ascii?Q?UYPSFroBAxs28jg+WLW4AEQ4PRKcjYGWOUMMc15cnoWWbpjiZV8WXpNXipvS?=
 =?us-ascii?Q?nI48ng0Z5OgntfPfVNVyMwAQ6XiLh2pLJFXsFSif?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1569a08-3d06-4acf-7223-08dd7907556e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 14:44:16.5392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXaZDztxIBFf05nUzUm/+JThuGoDRDdpPtZ0GMH82GmEGPKcPBbadBujlwCemdabn1PGSgTSqgkODeNFx12t4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9256

On Fri, Apr 11, 2025 at 01:46:28AM +0000, Jacky Bai wrote:
> > Subject: Re: [PATCH v5 2/3] arm64: dts: freescale: Add basic dtsi for imx943
> >
> > On Thu, Apr 10, 2025 at 02:28:25PM +0800, Jacky Bai wrote:
> > > Add the minimal dtsi support for i.MX943. i.MX943 is the first SoC of
> > > i.MX94 Family, create a common dtsi for the whole i.MX94 family, and
> > > the specific dtsi part for i.MX943.
> > >
> > > The clock, power domain and perf index need to be used by the device
> > > nodes for resource reference, add them along with the dtsi support.
> >
> > Please wrap at 75 char to maxium use sceen width.
> >
>
> Ok.
>
> > >
> > > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > > ---
> > >  - v5 changes:
> > >   - remove the err irq of edma node as the err irq support in driver is not
> > >     ready. We can add it back when the driver is ready. No impact for
> > current
> > >     edma support.
> > >
> > >  - v4 changes:
> > >   - reorder the cpu node compatible string property as suggested by
> > > Frank
> > >
> > >  - v3 changes:
> > >   - remove the blank line
> > >   - add PAD config macro define as suggested by Frank Li
> > >   - update the device nodes compatible strings for imx94 as suggested
> > > by Krzysztof
> > >
> > >  - v2 changes:
> > >   - remove the unnecessary macro define in clock header as suggested by
> > Krzysztof
> > >   - split the dtsi into imx94.dtsi and imx943.dtsi
> > >   - use low case in the pinfunc header as Frank suggested
> > >   - reorder the device nodes and properties
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx94-clock.h   |  195 ++
> > >  arch/arm64/boot/dts/freescale/imx94-pinfunc.h | 1570
> > +++++++++++++++++
> > >  arch/arm64/boot/dts/freescale/imx94-power.h   |   41 +
> > >  arch/arm64/boot/dts/freescale/imx94.dtsi      | 1138 ++++++++++++
> > >  arch/arm64/boot/dts/freescale/imx943.dtsi     |  148 ++
> > >  5 files changed, 3092 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/freescale/imx94-clock.h
> > >  create mode 100644 arch/arm64/boot/dts/freescale/imx94-pinfunc.h
> > >  create mode 100644 arch/arm64/boot/dts/freescale/imx94-power.h
> > >  create mode 100644 arch/arm64/boot/dts/freescale/imx94.dtsi
> > >  create mode 100644 arch/arm64/boot/dts/freescale/imx943.dtsi
> > >
> > ...
> > > +			#size-cells = <1>;
> > > +
> > > +			edma2: dma-controller@42000000 {
> > > +				compatible = "fsl,imx94-edma5", "fsl,imx95-edma5";
> > > +				reg = <0x42000000 0x210000>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > > +				clock-names = "dma";
> > > +				#dma-cells = <3>;
> > > +				dma-channels = <64>;
> > > +				interrupts-extended = <&a55_irqsteer 0>, <&a55_irqsteer
> > 1>, <&a55_irqsteer 2>,
> > > +					<&a55_irqsteer 3>, <&a55_irqsteer 4>,
> > <&a55_irqsteer 5>,
> >
> > need align previous line "<"
> >
>
> Ok
>
> > > +					<&a55_irqsteer 6>, <&a55_irqsteer 7>,
> > <&a55_irqsteer 8>,
> >
> > Does it work by use
> >
> > interrupt-parent = <&a55_irqsteer>;
> > interrupts = <0>, <1> ...
> >
> > if it works, it will reduce many &a55_irqsteer.
> >
>
> But if we add the err irq back later after the driver change is merged, we need to change
> it back again as the err irq is connected GIC.

Make sense, thanks!

Frank

>
> BR
> Jacky Bai
> > Frank
> > > +					<&a55_irqsteer 9>, <&a55_irqsteer 10>,
> > <&a55_irqsteer 11>,
> > > +					<&a55_irqsteer 12>, <&a55_irqsteer 13>,
> > <&a55_irqsteer 14>,
> > > +					<&a55_irqsteer 15>, <&a55_irqsteer 16>,
> > <&a55_irqsteer 17>,
> > > +					<&a55_irqsteer 18>, <&a55_irqsteer 19>,
> > <&a55_irqsteer 20>,
> > > +					<&a55_irqsteer 21>, <&a55_irqsteer 22>,
> > <&a55_irqsteer 23>,
> > > +					<&a55_irqsteer 24>, <&a55_irqsteer 25>,
> > <&a55_irqsteer 26>,
> > > +					<&a55_irqsteer 27>, <&a55_irqsteer 28>,
> > <&a55_irqsteer 29>,
> > > +					<&a55_irqsteer 30>, <&a55_irqsteer 31>,
> > <&a55_irqsteer 64>,
> > > +					<&a55_irqsteer 65>, <&a55_irqsteer 66>,
> > <&a55_irqsteer 67>,
> > > +					<&a55_irqsteer 68>, <&a55_irqsteer 69>,
> > <&a55_irqsteer 70>,
> > > +					<&a55_irqsteer 71>, <&a55_irqsteer 72>,
> > <&a55_irqsteer 73>,
> > > +					<&a55_irqsteer 74>, <&a55_irqsteer 75>,
> > <&a55_irqsteer 76>,
> > > +					<&a55_irqsteer 77>, <&a55_irqsteer 78>,
> > <&a55_irqsteer 79>,
> > > +					<&a55_irqsteer 80>, <&a55_irqsteer 81>,
> > <&a55_irqsteer 82>,
> > > +					<&a55_irqsteer 83>, <&a55_irqsteer 84>,
> > <&a55_irqsteer 85>,
> > > +					<&a55_irqsteer 86>, <&a55_irqsteer 87>,
> > <&a55_irqsteer 88>,
> > > +					<&a55_irqsteer 89>, <&a55_irqsteer 90>,
> > <&a55_irqsteer 91>,
> > > +					<&a55_irqsteer 92>, <&a55_irqsteer 93>,
> > <&a55_irqsteer 94>,
> > > +					<&a55_irqsteer 95>;
> > > +			};
> > > +
> > > +			mu10: mailbox@42430000 {
> > > +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> > > +				reg = <0x42430000 0x10000>;
> > > +				interrupts = <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > > +				#mbox-cells = <2>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			i3c2: i3c@42520000 {
> > > +				compatible = "silvaco,i3c-master-v1";
> > > +				reg = <0x42520000 0x10000>;
> > > +				interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
> > > +				#address-cells = <3>;
> > > +				#size-cells = <0>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > > +					 <&scmi_clk IMX94_CLK_I3C2SLOW>,
> > > +					 <&dummy>;
> > > +				clock-names = "pclk", "fast_clk", "slow_clk";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpi2c3: i2c@42530000 {
> > > +				compatible = "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> > > +				reg = <0x42530000 0x10000>;
> > > +				interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPI2C3>,
> > > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > > +				clock-names = "per", "ipg";
> > > +				dmas = <&edma2 5 0 0>, <&edma2 6 0 FSL_EDMA_RX>;
> > > +				dma-names = "tx", "rx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpi2c4: i2c@42540000 {
> > > +				compatible = "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> > > +				reg = <0x42540000 0x10000>;
> > > +				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPI2C4>,
> > > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > > +				clock-names = "per", "ipg";
> > > +				dmas = <&edma4 4 0 0>, <&edma4 5 0 FSL_EDMA_RX>;
> > > +				dma-names = "tx", "rx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpspi3: spi@42550000 {
> > > +				compatible = "fsl,imx94-spi", "fsl,imx7ulp-spi";
> > > +				reg = <0x42550000 0x10000>;
> > > +				interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPSPI3>,
> > > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > > +				clock-names = "per", "ipg";
> > > +				dmas = <&edma2 7 0 0>, <&edma2 8 0 FSL_EDMA_RX>;
> > > +				dma-names = "tx", "rx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpspi4: spi@42560000 {
> > > +				compatible = "fsl,imx94-spi", "fsl,imx7ulp-spi";
> > > +				reg = <0x42560000 0x10000>;
> > > +				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPSPI4>,
> > > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > > +				clock-names = "per", "ipg";
> > > +				dmas = <&edma4 6 0 0>, <&edma4 7 0 FSL_EDMA_RX>;
> > > +				dma-names = "tx", "rx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpuart3: serial@42570000 {
> > > +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > > +					     "fsl,imx7ulp-lpuart";
> > > +				reg = <0x42570000 0x1000>;
> > > +				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPUART3>;
> > > +				clock-names = "ipg";
> > > +				dmas = <&edma2 10 0 FSL_EDMA_RX>, <&edma2 9 0 0>;
> > > +				dma-names = "rx", "tx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpuart4: serial@42580000 {
> > > +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > > +					     "fsl,imx7ulp-lpuart";
> > > +				reg = <0x42580000 0x1000>;
> > > +				interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPUART4>;
> > > +				clock-names = "ipg";
> > > +				dmas = <&edma4 10 0 FSL_EDMA_RX>, <&edma4 9 0 0>;
> > > +				dma-names = "rx", "tx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpuart5: serial@42590000 {
> > > +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > > +					     "fsl,imx7ulp-lpuart";
> > > +				reg = <0x42590000 0x1000>;
> > > +				interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPUART5>;
> > > +				clock-names = "ipg";
> > > +				dmas = <&edma2 12 0 FSL_EDMA_RX>, <&edma2 11 0
> > 0>;
> > > +				dma-names = "rx", "tx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpuart6: serial@425a0000 {
> > > +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > > +					     "fsl,imx7ulp-lpuart";
> > > +				reg = <0x425a0000 0x1000>;
> > > +				interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPUART6>;
> > > +				clock-names = "ipg";
> > > +				dmas = <&edma4 12 0 FSL_EDMA_RX>, <&edma4 11 0
> > 0>;
> > > +				dma-names = "rx", "tx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			flexcan2: can@425b0000 {
> > > +				compatible = "fsl,imx94-flexcan", "fsl,imx95-flexcan";
> > > +				reg = <0x425b0000 0x10000>;
> > > +				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > > +					 <&scmi_clk IMX94_CLK_CAN2>;
> > > +				clock-names = "ipg", "per";
> > > +				assigned-clocks = <&scmi_clk IMX94_CLK_CAN2>;
> > > +				assigned-clock-parents = <&scmi_clk
> > IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> > > +				assigned-clock-rates = <80000000>;
> > > +				fsl,clk-source = /bits/ 8 <0>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			flexcan3: can@425e0000 {
> > > +				compatible = "fsl,imx94-flexcan", "fsl,imx95-flexcan";
> > > +				reg = <0x425e0000 0x10000>;
> > > +				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > > +					 <&scmi_clk IMX94_CLK_CAN3>;
> > > +				clock-names = "ipg", "per";
> > > +				assigned-clocks = <&scmi_clk IMX94_CLK_CAN3>;
> > > +				assigned-clock-parents = <&scmi_clk
> > IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> > > +				assigned-clock-rates = <80000000>;
> > > +				fsl,clk-source = /bits/ 8 <0>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			flexcan4: can@425f0000 {
> > > +				compatible = "fsl,imx94-flexcan", "fsl,imx95-flexcan";
> > > +				reg = <0x425f0000 0x10000>;
> > > +				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > > +					 <&scmi_clk IMX94_CLK_CAN4>;
> > > +				clock-names = "ipg", "per";
> > > +				assigned-clocks = <&scmi_clk IMX94_CLK_CAN4>;
> > > +				assigned-clock-parents = <&scmi_clk
> > IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> > > +				assigned-clock-rates = <80000000>;
> > > +				fsl,clk-source = /bits/ 8 <0>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			flexcan5: can@42600000 {
> > > +				compatible = "fsl,imx94-flexcan", "fsl,imx95-flexcan";
> > > +				reg = <0x42600000 0x10000>;
> > > +				interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > > +					 <&scmi_clk IMX94_CLK_CAN5>;
> > > +				clock-names = "ipg", "per";
> > > +				assigned-clocks = <&scmi_clk IMX94_CLK_CAN5>;
> > > +				assigned-clock-parents = <&scmi_clk
> > IMX94_CLK_SYSPLL1_PFD1_DIV2>;
> > > +				assigned-clock-rates = <80000000>;
> > > +				fsl,clk-source = /bits/ 8 <0>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			sai2: sai@42650000 {
> > > +				compatible = "fsl,imx94-sai", "fsl,imx95-sai";
> > > +				reg = <0x42650000 0x10000>;
> > > +				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > <&dummy>,
> > > +					<&scmi_clk IMX94_CLK_SAI2>, <&dummy>,
> > <&dummy>;
> > > +				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> > > +				dmas = <&edma2 30 0 FSL_EDMA_RX>, <&edma2 29 0
> > 0>;
> > > +				dma-names = "rx", "tx";
> > > +				#sound-dai-cells = <0>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			sai3: sai@42660000 {
> > > +				compatible = "fsl,imx94-sai", "fsl,imx95-sai";
> > > +				reg = <0x42660000 0x10000>;
> > > +				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > <&dummy>,
> > > +					<&scmi_clk IMX94_CLK_SAI3>, <&dummy>,
> > <&dummy>;
> > > +				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> > > +				dmas = <&edma2 32 0 FSL_EDMA_RX>, <&edma2 31 0
> > 0>;
> > > +				dma-names = "rx", "tx";
> > > +				#sound-dai-cells = <0>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			sai4: sai@42670000 {
> > > +				compatible = "fsl,imx94-sai", "fsl,imx95-sai";
> > > +				reg = <0x42670000 0x10000>;
> > > +				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > <&dummy>,
> > > +					<&scmi_clk IMX94_CLK_SAI4>, <&dummy>,
> > <&dummy>;
> > > +				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> > > +				dmas = <&edma2 36 0 FSL_EDMA_RX>, <&edma2 35 0
> > 0>;
> > > +				dma-names = "rx", "tx";
> > > +				#sound-dai-cells = <0>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpuart7: serial@42690000 {
> > > +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > > +					     "fsl,imx7ulp-lpuart";
> > > +				reg = <0x42690000 0x1000>;
> > > +				interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPUART7>;
> > > +				clock-names = "ipg";
> > > +				dmas = <&edma2 46 0 FSL_EDMA_RX>, <&edma2 45 0
> > 0>;
> > > +				dma-names = "rx", "tx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpuart8: serial@426a0000 {
> > > +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > > +					     "fsl,imx7ulp-lpuart";
> > > +				reg = <0x426a0000 0x1000>;
> > > +				interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPUART8>;
> > > +				clock-names = "ipg";
> > > +				dmas = <&edma4 39 0 FSL_EDMA_RX>, <&edma4 38 0
> > 0>;
> > > +				dma-names = "rx", "tx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpi2c5: i2c@426b0000 {
> > > +				compatible = "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> > > +				reg = <0x426b0000 0x10000>;
> > > +				interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPI2C5>,
> > > +					 <&scmi_clk IMX94_CLK_BUSAON>;
> > > +				clock-names = "per", "ipg";
> > > +				dmas = <&edma2 37 0 0>, <&edma2 38 0
> > FSL_EDMA_RX>;
> > > +				dma-names = "tx", "rx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpi2c6: i2c@426c0000 {
> > > +				compatible = "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> > > +				reg = <0x426c0000 0x10000>;
> > > +				interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPI2C6>,
> > > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > > +				clock-names = "per", "ipg";
> > > +				dmas = <&edma4 30 0 0>, <&edma4 31 0
> > FSL_EDMA_RX>;
> > > +				dma-names = "tx", "rx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpi2c7: i2c@426d0000 {
> > > +				compatible = "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> > > +				reg = <0x426d0000 0x10000>;
> > > +				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPI2C7>,
> > > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > > +				clock-names = "per", "ipg";
> > > +				dmas = <&edma2 39 0 0>, <&edma2 40 0
> > FSL_EDMA_RX>;
> > > +				dma-names = "tx", "rx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpi2c8: i2c@426e0000 {
> > > +				compatible = "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> > > +				reg = <0x426e0000 0x10000>;
> > > +				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPI2C8>,
> > > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > > +				clock-names = "per", "ipg";
> > > +				dmas = <&edma4 32 0 0>, <&edma4 33 0
> > FSL_EDMA_RX>;
> > > +				dma-names = "tx", "rx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpspi5: spi@426f0000 {
> > > +				compatible = "fsl,imx94-spi", "fsl,imx7ulp-spi";
> > > +				reg = <0x426f0000 0x10000>;
> > > +				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPSPI5>,
> > > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > > +				clock-names = "per", "ipg";
> > > +				dmas = <&edma2 41 0 0>, <&edma2 42 0
> > FSL_EDMA_RX>;
> > > +				dma-names = "tx", "rx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpspi6: spi@42700000 {
> > > +				compatible = "fsl,imx94-spi", "fsl,imx7ulp-spi";
> > > +				reg = <0x42700000 0x10000>;
> > > +				interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPSPI6>,
> > > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > > +				clock-names = "per", "ipg";
> > > +				dmas = <&edma4 34 0 0>, <&edma4 35 0
> > FSL_EDMA_RX>;
> > > +				dma-names = "tx", "rx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpspi7: spi@42710000 {
> > > +				compatible = "fsl,imx94-spi", "fsl,imx7ulp-spi";
> > > +				reg = <0x42710000 0x10000>;
> > > +				interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPSPI7>,
> > > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > > +				clock-names = "per", "ipg";
> > > +				dmas = <&edma2 43 0 0>, <&edma2 44 0
> > FSL_EDMA_RX>;
> > > +				dma-names = "tx", "rx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpspi8: spi@42720000 {
> > > +				compatible = "fsl,imx94-spi", "fsl,imx7ulp-spi";
> > > +				reg = <0x42720000 0x10000>;
> > > +				interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPSPI8>,
> > > +					 <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > > +				clock-names = "per", "ipg";
> > > +				dmas = <&edma4 36 0 0>, <&edma4 37 0
> > FSL_EDMA_RX>;
> > > +				dma-names = "tx", "rx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			mu11: mailbox@42730000 {
> > > +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> > > +				reg = <0x42730000 0x10000>;
> > > +				interrupts = <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > > +				#mbox-cells = <2>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			edma4: dma-controller@42df0000 {
> > > +				compatible = "fsl,imx94-edma5", "fsl,imx95-edma5";
> > > +				reg = <0x42df0000 0x210000>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > > +				clock-names = "dma";
> > > +				#dma-cells = <3>;
> > > +				dma-channels = <64>;
> > > +				interrupts-extended = <&a55_irqsteer 128>,
> > <&a55_irqsteer 129>,
> > > +					<&a55_irqsteer 130>, <&a55_irqsteer 131>,
> > > +					<&a55_irqsteer 132>, <&a55_irqsteer 133>,
> > > +					<&a55_irqsteer 134>, <&a55_irqsteer 135>,
> > > +					<&a55_irqsteer 136>, <&a55_irqsteer 137>,
> > > +					<&a55_irqsteer 138>, <&a55_irqsteer 139>,
> > > +					<&a55_irqsteer 140>, <&a55_irqsteer 141>,
> > > +					<&a55_irqsteer 142>, <&a55_irqsteer 143>,
> > > +					<&a55_irqsteer 144>, <&a55_irqsteer 145>,
> > > +					<&a55_irqsteer 146>, <&a55_irqsteer 147>,
> > > +					<&a55_irqsteer 148>, <&a55_irqsteer 149>,
> > > +					<&a55_irqsteer 150>, <&a55_irqsteer 151>,
> > > +					<&a55_irqsteer 152>, <&a55_irqsteer 153>,
> > > +					<&a55_irqsteer 154>, <&a55_irqsteer 155>,
> > > +					<&a55_irqsteer 156>, <&a55_irqsteer 157>,
> > > +					<&a55_irqsteer 158>, <&a55_irqsteer 159>,
> > > +					<&a55_irqsteer 192>, <&a55_irqsteer 193>,
> > > +					<&a55_irqsteer 194>, <&a55_irqsteer 195>,
> > > +					<&a55_irqsteer 196>, <&a55_irqsteer 197>,
> > > +					<&a55_irqsteer 198>, <&a55_irqsteer 199>,
> > > +					<&a55_irqsteer 200>, <&a55_irqsteer 201>,
> > > +					<&a55_irqsteer 202>, <&a55_irqsteer 203>,
> > > +					<&a55_irqsteer 204>, <&a55_irqsteer 205>,
> > > +					<&a55_irqsteer 206>, <&a55_irqsteer 207>,
> > > +					<&a55_irqsteer 208>, <&a55_irqsteer 209>,
> > > +					<&a55_irqsteer 210>, <&a55_irqsteer 211>,
> > > +					<&a55_irqsteer 212>, <&a55_irqsteer 213>,
> > > +					<&a55_irqsteer 214>, <&a55_irqsteer 215>,
> > > +					<&a55_irqsteer 216>, <&a55_irqsteer 217>,
> > > +					<&a55_irqsteer 218>, <&a55_irqsteer 219>,
> > > +					<&a55_irqsteer 220>, <&a55_irqsteer 221>,
> > > +					<&a55_irqsteer 222>, <&a55_irqsteer 223>;
> > > +			};
> > > +		};
> > > +
> > > +		aips3: bus@42800000 {
> > > +			compatible = "fsl,aips-bus", "simple-bus";
> > > +			reg = <0 0x42800000 0 0x800000>;
> > > +			ranges = <0x42800000 0x0 0x42800000 0x800000>,
> > > +				 <0x28000000 0x0 0x28000000 0x1000000>;
> > > +			#address-cells = <1>;
> > > +			#size-cells = <1>;
> > > +
> > > +			usdhc1: mmc@42850000 {
> > > +				compatible = "fsl,imx94-usdhc", "fsl,imx8mm-usdhc";
> > > +				reg = <0x42850000 0x10000>;
> > > +				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > > +					 <&scmi_clk IMX94_CLK_WAKEUPAXI>,
> > > +					 <&scmi_clk IMX94_CLK_USDHC1>;
> > > +				clock-names = "ipg", "ahb", "per";
> > > +				assigned-clocks = <&scmi_clk IMX94_CLK_USDHC1>;
> > > +				assigned-clock-parents = <&scmi_clk
> > IMX94_CLK_SYSPLL1_PFD1>;
> > > +				assigned-clock-rates = <400000000>;
> > > +				bus-width = <8>;
> > > +				fsl,tuning-start-tap = <1>;
> > > +				fsl,tuning-step = <2>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			usdhc2: mmc@42860000 {
> > > +				compatible = "fsl,imx94-usdhc", "fsl,imx8mm-usdhc";
> > > +				reg = <0x42860000 0x10000>;
> > > +				interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > > +					 <&scmi_clk IMX94_CLK_WAKEUPAXI>,
> > > +					 <&scmi_clk IMX94_CLK_USDHC2>;
> > > +				clock-names = "ipg", "ahb", "per";
> > > +				assigned-clocks = <&scmi_clk IMX94_CLK_USDHC2>;
> > > +				assigned-clock-parents = <&scmi_clk
> > IMX94_CLK_SYSPLL1_PFD1>;
> > > +				assigned-clock-rates = <200000000>;
> > > +				bus-width = <4>;
> > > +				fsl,tuning-start-tap = <1>;
> > > +				fsl,tuning-step = <2>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			usdhc3: mmc@42880000 {
> > > +				compatible = "fsl,imx94-usdhc", "fsl,imx8mm-usdhc";
> > > +				reg = <0x42880000 0x10000>;
> > > +				interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>,
> > > +					 <&scmi_clk IMX94_CLK_WAKEUPAXI>,
> > > +					 <&scmi_clk IMX94_CLK_USDHC3>;
> > > +				clock-names = "ipg", "ahb", "per";
> > > +				assigned-clocks = <&scmi_clk IMX94_CLK_USDHC3>;
> > > +				assigned-clock-parents = <&scmi_clk
> > IMX94_CLK_SYSPLL1_PFD1>;
> > > +				assigned-clock-rates = <200000000>;
> > > +				bus-width = <4>;
> > > +				fsl,tuning-start-tap = <1>;
> > > +				fsl,tuning-step = <2>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpuart9: serial@42a50000 {
> > > +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > > +					     "fsl,imx7ulp-lpuart";
> > > +				reg = <0x42a50000 0x1000>;
> > > +				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPUART10>;
> > > +				clock-names = "ipg";
> > > +				dmas = <&edma2 51 0 FSL_EDMA_RX>, <&edma2 50 0
> > 0>;
> > > +				dma-names = "rx", "tx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpuart10: serial@42a60000 {
> > > +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > > +					     "fsl,imx7ulp-lpuart";
> > > +				reg = <0x42a60000 0x1000>;
> > > +				interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPUART10>;
> > > +				clock-names = "ipg";
> > > +				dmas = <&edma4 47 0 FSL_EDMA_RX>, <&edma4 46 0
> > 0>;
> > > +				dma-names = "rx", "tx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpuart11: serial@42a70000 {
> > > +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > > +					     "fsl,imx7ulp-lpuart";
> > > +				reg = <0x42a70000 0x1000>;
> > > +				interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPUART11>;
> > > +				clock-names = "ipg";
> > > +				dmas = <&edma2 53 0 FSL_EDMA_RX>, <&edma2 52 0
> > 0>;
> > > +				dma-names = "rx", "tx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpuart12: serial@42a80000 {
> > > +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > > +					     "fsl,imx7ulp-lpuart";
> > > +				reg = <0x42a80000 0x1000>;
> > > +				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPUART12>;
> > > +				clock-names = "ipg";
> > > +				dmas = <&edma4 49 0 FSL_EDMA_RX>, <&edma4 48 0
> > 0>;
> > > +				dma-names = "rx", "tx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			mu12: mailbox@42ac0000 {
> > > +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> > > +				reg = <0x42ac0000 0x10000>;
> > > +				interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > > +				#mbox-cells = <2>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			mu13: mailbox@42ae0000 {
> > > +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> > > +				reg = <0x42ae0000 0x10000>;
> > > +				interrupts = <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > > +				#mbox-cells = <2>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			mu14: mailbox@42b00000 {
> > > +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> > > +				reg = <0x42b00000 0x10000>;
> > > +				interrupts = <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > > +				#mbox-cells = <2>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			mu15: mailbox@42b20000 {
> > > +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> > > +				reg = <0x42b20000 0x10000>;
> > > +				interrupts = <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > > +				#mbox-cells = <2>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			mu16: mailbox@42b40000 {
> > > +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> > > +				reg = <0x42b40000 0x10000>;
> > > +				interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > > +				#mbox-cells = <2>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			mu17: mailbox@42b60000 {
> > > +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> > > +				reg = <0x42b60000 0x10000>;
> > > +				interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > > +				#mbox-cells = <2>;
> > > +				status = "disabled";
> > > +			};
> > > +		};
> > > +
> > > +		gpio2: gpio@43810000 {
> > > +			compatible = "fsl,imx94-gpio", "fsl,imx8ulp-gpio";
> > > +			reg = <0x0 0x43810000 0x0 0x1000>;
> > > +			#interrupt-cells = <2>;
> > > +			interrupt-controller;
> > > +			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> > > +			#gpio-cells = <2>;
> > > +			gpio-controller;
> > > +			gpio-ranges = <&scmi_iomuxc 0 4 32>;
> > > +		};
> > > +
> > > +		gpio3: gpio@43820000 {
> > > +			compatible = "fsl,imx94-gpio", "fsl,imx8ulp-gpio";
> > > +			reg = <0x0 0x43820000 0x0 0x1000>;
> > > +			#interrupt-cells = <2>;
> > > +			interrupt-controller;
> > > +			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> > > +			#gpio-cells = <2>;
> > > +			gpio-controller;
> > > +			gpio-ranges = <&scmi_iomuxc 0 36 26>;
> > > +		};
> > > +
> > > +		gpio4: gpio@43840000 {
> > > +			compatible = "fsl,imx94-gpio", "fsl,imx8ulp-gpio";
> > > +			reg = <0x0 0x43840000 0x0 0x1000>;
> > > +			#interrupt-cells = <2>;
> > > +			interrupt-controller;
> > > +			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
> > > +			#gpio-cells = <2>;
> > > +			gpio-controller;
> > > +			gpio-ranges = <&scmi_iomuxc 0 62 4>, <&scmi_iomuxc 4 0 4>,
> > > +				      <&scmi_iomuxc 8 140 12>, <&scmi_iomuxc 20 164
> > 12>;
> > > +		};
> > > +
> > > +		gpio5: gpio@43850000 {
> > > +			compatible = "fsl,imx94-gpio", "fsl,imx8ulp-gpio";
> > > +			reg = <0x0 0x43850000 0x0 0x1000>;
> > > +			#interrupt-cells = <2>;
> > > +			interrupt-controller;
> > > +			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> > > +			#gpio-cells = <2>;
> > > +			gpio-controller;
> > > +			gpio-ranges = <&scmi_iomuxc 0 108 32>;
> > > +		};
> > > +
> > > +		gpio6: gpio@43860000 {
> > > +			compatible = "fsl,imx94-gpio", "fsl,imx8ulp-gpio";
> > > +			reg = <0x0 0x43860000 0x0 0x1000>;
> > > +			#interrupt-cells = <2>;
> > > +			interrupt-controller;
> > > +			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
> > > +			#gpio-cells = <2>;
> > > +			gpio-controller;
> > > +			gpio-ranges = <&scmi_iomuxc 0 66 32>;
> > > +		};
> > > +
> > > +		gpio7: gpio@43870000 {
> > > +			compatible = "fsl,imx94-gpio", "fsl,imx8ulp-gpio";
> > > +			reg = <0x0 0x43870000 0x0 0x1000>;
> > > +			#interrupt-cells = <2>;
> > > +			interrupt-controller;
> > > +			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
> > > +			#gpio-cells = <2>;
> > > +			gpio-controller;
> > > +			gpio-ranges = <&scmi_iomuxc 0 98 10>, <&scmi_iomuxc 16 152
> > 12>;
> > > +		};
> > > +
> > > +		aips1: bus@44000000 {
> > > +			compatible = "fsl,aips-bus", "simple-bus";
> > > +			reg = <0x0 0x44000000 0x0 0x800000>;
> > > +			ranges = <0x44000000 0x0 0x44000000 0x800000>;
> > > +			#address-cells = <1>;
> > > +			#size-cells = <1>;
> > > +
> > > +			edma1: dma-controller@44000000 {
> > > +				compatible = "fsl,imx94-edma3", "fsl,imx93-edma3";
> > > +				reg = <0x44000000 0x210000>;
> > > +				interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 236 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSAON>;
> > > +				clock-names = "dma";
> > > +				#dma-cells = <3>;
> > > +				dma-channels = <32>;
> > > +			};
> > > +
> > > +			mu1: mailbox@44220000 {
> > > +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> > > +				reg = <0x44220000 0x10000>;
> > > +				interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSAON>;
> > > +				#mbox-cells = <2>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			system_counter: timer@44290000 {
> > > +				compatible = "nxp,imx94-sysctr-timer",
> > "nxp,imx95-sysctr-timer";
> > > +				reg = <0x44290000 0x30000>;
> > > +				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&osc_24m>;
> > > +				clock-names = "per";
> > > +				nxp,no-divider;
> > > +			};
> > > +
> > > +			tpm1: pwm@44310000 {
> > > +				compatible = "fsl,imx94-pwm", "fsl,imx7ulp-pwm";
> > > +				reg = <0x44310000 0x1000>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSAON>;
> > > +				#pwm-cells = <3>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			tpm2: pwm@44320000 {
> > > +				compatible = "fsl,imx94-pwm", "fsl,imx7ulp-pwm";
> > > +				reg = <0x44320000 0x1000>;
> > > +				clocks = <&scmi_clk IMX94_CLK_TPM2>;
> > > +				#pwm-cells = <3>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			i3c1: i3c@44330000 {
> > > +				compatible = "silvaco,i3c-master-v1";
> > > +				reg = <0x44330000 0x10000>;
> > > +				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> > > +				#address-cells = <3>;
> > > +				#size-cells = <0>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSAON>,
> > > +					 <&scmi_clk IMX94_CLK_I3C1SLOW>,
> > > +					 <&dummy>;
> > > +				clock-names = "pclk", "fast_clk", "slow_clk";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpi2c1: i2c@44340000 {
> > > +				compatible = "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> > > +				reg = <0x44340000 0x10000>;
> > > +				interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPI2C1>,
> > > +					 <&scmi_clk IMX94_CLK_BUSAON>;
> > > +				clock-names = "per", "ipg";
> > > +				dmas = <&edma1 12 0 0>, <&edma1 13 0
> > FSL_EDMA_RX>;
> > > +				dma-names = "tx", "rx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpi2c2: i2c@44350000 {
> > > +				compatible = "fsl,imx94-lpi2c", "fsl,imx7ulp-lpi2c";
> > > +				reg = <0x44350000 0x10000>;
> > > +				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPI2C2>,
> > > +					 <&scmi_clk IMX94_CLK_BUSAON>;
> > > +				clock-names = "per", "ipg";
> > > +				dmas = <&edma1 14 0 0>, <&edma1 15 0
> > FSL_EDMA_RX>;
> > > +				dma-names = "tx", "rx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpspi1: spi@44360000 {
> > > +				compatible = "fsl,imx94-spi", "fsl,imx7ulp-spi";
> > > +				reg = <0x44360000 0x10000>;
> > > +				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPSPI2>,
> > > +					 <&scmi_clk IMX94_CLK_BUSAON>;
> > > +				clock-names = "per", "ipg";
> > > +				dmas = <&edma1 16 0 0>, <&edma1 17 0
> > FSL_EDMA_RX>;
> > > +				dma-names = "tx", "rx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpspi2: spi@44370000 {
> > > +				compatible = "fsl,imx94-spi", "fsl,imx7ulp-spi";
> > > +				reg = <0x44370000 0x10000>;
> > > +				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPSPI2>,
> > > +					 <&scmi_clk IMX94_CLK_BUSAON>;
> > > +				clock-names = "per", "ipg";
> > > +				dmas = <&edma1 18 0 0>, <&edma1 19 0
> > FSL_EDMA_RX>;
> > > +				dma-names = "tx", "rx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpuart1: serial@44380000 {
> > > +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > > +					     "fsl,imx7ulp-lpuart";
> > > +				reg = <0x44380000 0x1000>;
> > > +				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPUART1>;
> > > +				clock-names = "ipg";
> > > +				dmas = <&edma1 21 0 FSL_EDMA_RX>, <&edma1 20 0
> > 0>;
> > > +				dma-names = "rx", "tx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			lpuart2: serial@44390000 {
> > > +				compatible = "fsl,imx94-lpuart", "fsl,imx8ulp-lpuart",
> > > +					     "fsl,imx7ulp-lpuart";
> > > +				reg = <0x44390000 0x1000>;
> > > +				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_LPUART2>;
> > > +				clock-names = "ipg";
> > > +				dmas = <&edma1 23 0 FSL_EDMA_RX>, <&edma1 22 0
> > 0>;
> > > +				dma-names = "rx", "tx";
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			flexcan1: can@443a0000 {
> > > +				compatible = "fsl,imx94-flexcan", "fsl,imx95-flexcan";
> > > +				reg = <0x443a0000 0x10000>;
> > > +				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			sai1: sai@443b0000 {
> > > +				compatible = "fsl,imx94-sai", "fsl,imx95-sai";
> > > +				reg = <0x443b0000 0x10000>;
> > > +				interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSAON>, <&dummy>,
> > > +					<&scmi_clk IMX94_CLK_SAI1>, <&dummy>,
> > > +					<&dummy>, <&dummy>;
> > > +				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> > > +				dmas = <&edma1 25 0 FSL_EDMA_RX>, <&edma1 24 0
> > 0>;
> > > +				dma-names = "rx", "tx";
> > > +				#sound-dai-cells = <0>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			adc1: adc@44530000 {
> > > +				compatible = "nxp,imx94-adc", "nxp,imx93-adc";
> > > +				reg = <0x44530000 0x10000>;
> > > +				interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_ADC>;
> > > +				clock-names = "ipg";
> > > +				#io-channel-cells = <1>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			mu2: mailbox@445b0000 {
> > > +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> > > +				reg = <0x445b0000 0x1000>;
> > > +				ranges;
> > > +				interrupts = <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>;
> > > +				#address-cells = <1>;
> > > +				#size-cells = <1>;
> > > +				#mbox-cells = <2>;
> > > +
> > > +				sram0: sram@445b1000 {
> > > +					compatible = "mmio-sram";
> > > +					reg = <0x445b1000 0x400>;
> > > +					ranges = <0x0 0x445b1000 0x400>;
> > > +					#address-cells = <1>;
> > > +					#size-cells = <1>;
> > > +
> > > +					scmi_buf0: scmi-sram-section@0 {
> > > +						compatible = "arm,scmi-shmem";
> > > +						reg = <0x0 0x80>;
> > > +					};
> > > +
> > > +					scmi_buf1: scmi-sram-section@80 {
> > > +						compatible = "arm,scmi-shmem";
> > > +						reg = <0x80 0x80>;
> > > +					};
> > > +				};
> > > +			};
> > > +
> > > +			mu3: mailbox@445d0000 {
> > > +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> > > +				reg = <0x445d0000 0x10000>;
> > > +				interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> > > +				#mbox-cells = <2>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			mu4: mailbox@445f0000 {
> > > +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> > > +				reg = <0x445f0000 0x10000>;
> > > +				interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> > > +				#mbox-cells = <2>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			mu6: mailbox@44630000 {
> > > +				compatible = "fsl,imx94-mu", "fsl,imx95-mu";
> > > +				reg = <0x44630000 0x10000>;
> > > +				interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> > > +				#mbox-cells = <2>;
> > > +				status = "disabled";
> > > +			};
> > > +
> > > +			a55_irqsteer: interrupt-controller@446a0000 {
> > > +				compatible = "fsl,imx94-irqsteer", "fsl,imx-irqsteer";
> > > +				reg = <0x446a0000 0x1000>;
> > > +				#interrupt-cells = <1>;
> > > +				interrupt-controller;
> > > +				interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>,
> > > +					     <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSAON>;
> > > +				clock-names = "ipg";
> > > +				fsl,channel = <0>;
> > > +				fsl,num-irqs = <960>;
> > > +			};
> > > +		};
> > > +
> > > +		aips4: bus@49000000 {
> > > +			compatible = "fsl,aips-bus", "simple-bus";
> > > +			reg = <0x0 0x49000000 0x0 0x800000>;
> > > +			ranges = <0x49000000 0x0 0x49000000 0x800000>;
> > > +			#address-cells = <1>;
> > > +			#size-cells = <1>;
> > > +
> > > +			wdog3: watchdog@49220000 {
> > > +				compatible = "fsl,imx94-wdt", "fsl,imx93-wdt";
> > > +				reg = <0x49220000 0x10000>;
> > > +				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> > > +				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
> > > +				timeout-sec = <40>;
> > > +				fsl,ext-reset-output;
> > > +				status = "disabled";
> > > +			};
> > > +		};
> > > +	};
> > > +};
> > > diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx943.dtsi
> > > new file mode 100644
> > > index 000000000000..45b8da758e87
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
> > > @@ -0,0 +1,148 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +/*
> > > + * Copyright 2025 NXP
> > > + */
> > > +
> > > +#include "imx94.dtsi"
> > > +
> > > +/ {
> > > +	cpus {
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +
> > > +		idle-states {
> > > +			entry-method = "psci";
> > > +
> > > +			cpu_pd_wait: cpu-pd-wait {
> > > +				compatible = "arm,idle-state";
> > > +				arm,psci-suspend-param = <0x0010033>;
> > > +				local-timer-stop;
> > > +				entry-latency-us = <1000>;
> > > +				exit-latency-us = <700>;
> > > +				min-residency-us = <2700>;
> > > +				wakeup-latency-us = <1500>;
> > > +			};
> > > +		};
> > > +
> > > +		cpu0: cpu@0 {
> > > +			compatible = "arm,cortex-a55";
> > > +			device_type = "cpu";
> > > +			reg = <0x0>;
> > > +			enable-method = "psci";
> > > +			#cooling-cells = <2>;
> > > +			cpu-idle-states = <&cpu_pd_wait>;
> > > +			power-domains = <&scmi_perf IMX94_PERF_A55>;
> > > +			power-domain-names = "perf";
> > > +			i-cache-size = <32768>;
> > > +			i-cache-line-size = <64>;
> > > +			i-cache-sets = <128>;
> > > +			d-cache-size = <32768>;
> > > +			d-cache-line-size = <64>;
> > > +			d-cache-sets = <128>;
> > > +			next-level-cache = <&l2_cache_l0>;
> > > +		};
> > > +
> > > +		cpu1: cpu@100 {
> > > +			compatible = "arm,cortex-a55";
> > > +			device_type = "cpu";
> > > +			reg = <0x100>;
> > > +			enable-method = "psci";
> > > +			#cooling-cells = <2>;
> > > +			cpu-idle-states = <&cpu_pd_wait>;
> > > +			power-domains = <&scmi_perf IMX94_PERF_A55>;
> > > +			power-domain-names = "perf";
> > > +			i-cache-size = <32768>;
> > > +			i-cache-line-size = <64>;
> > > +			i-cache-sets = <128>;
> > > +			d-cache-size = <32768>;
> > > +			d-cache-line-size = <64>;
> > > +			d-cache-sets = <128>;
> > > +			next-level-cache = <&l2_cache_l1>;
> > > +		};
> > > +
> > > +		cpu2: cpu@200 {
> > > +			compatible = "arm,cortex-a55";
> > > +			device_type = "cpu";
> > > +			reg = <0x200>;
> > > +			enable-method = "psci";
> > > +			#cooling-cells = <2>;
> > > +			cpu-idle-states = <&cpu_pd_wait>;
> > > +			power-domains = <&scmi_perf IMX94_PERF_A55>;
> > > +			power-domain-names = "perf";
> > > +			i-cache-size = <32768>;
> > > +			i-cache-line-size = <64>;
> > > +			i-cache-sets = <128>;
> > > +			d-cache-size = <32768>;
> > > +			d-cache-line-size = <64>;
> > > +			d-cache-sets = <128>;
> > > +			next-level-cache = <&l2_cache_l2>;
> > > +		};
> > > +
> > > +		cpu3: cpu@300 {
> > > +			compatible = "arm,cortex-a55";
> > > +			device_type = "cpu";
> > > +			reg = <0x300>;
> > > +			enable-method = "psci";
> > > +			#cooling-cells = <2>;
> > > +			cpu-idle-states = <&cpu_pd_wait>;
> > > +			power-domains = <&scmi_perf IMX94_PERF_A55>;
> > > +			power-domain-names = "perf";
> > > +			i-cache-size = <32768>;
> > > +			i-cache-line-size = <64>;
> > > +			i-cache-sets = <128>;
> > > +			d-cache-size = <32768>;
> > > +			d-cache-line-size = <64>;
> > > +			d-cache-sets = <128>;
> > > +			next-level-cache = <&l2_cache_l3>;
> > > +		};
> > > +
> > > +		l2_cache_l0: l2-cache-l0 {
> > > +			compatible = "cache";
> > > +			cache-size = <65536>;
> > > +			cache-line-size = <64>;
> > > +			cache-sets = <256>;
> > > +			cache-level = <2>;
> > > +			cache-unified;
> > > +			next-level-cache = <&l3_cache>;
> > > +		};
> > > +
> > > +		l2_cache_l1: l2-cache-l1 {
> > > +			compatible = "cache";
> > > +			cache-size = <65536>;
> > > +			cache-line-size = <64>;
> > > +			cache-sets = <256>;
> > > +			cache-level = <2>;
> > > +			cache-unified;
> > > +			next-level-cache = <&l3_cache>;
> > > +		};
> > > +
> > > +		l2_cache_l2: l2-cache-l2 {
> > > +			compatible = "cache";
> > > +			cache-size = <65536>;
> > > +			cache-line-size = <64>;
> > > +			cache-sets = <256>;
> > > +			cache-level = <2>;
> > > +			cache-unified;
> > > +			next-level-cache = <&l3_cache>;
> > > +		};
> > > +
> > > +		l2_cache_l3: l2-cache-l3 {
> > > +			compatible = "cache";
> > > +			cache-size = <65536>;
> > > +			cache-line-size = <64>;
> > > +			cache-sets = <256>;
> > > +			cache-level = <2>;
> > > +			cache-unified;
> > > +			next-level-cache = <&l3_cache>;
> > > +		};
> > > +
> > > +		l3_cache: l3-cache {
> > > +			compatible = "cache";
> > > +			cache-size = <1048576>;
> > > +			cache-line-size = <64>;
> > > +			cache-sets = <1024>;
> > > +			cache-level = <3>;
> > > +			cache-unified;
> > > +		};
> > > +	};
> > > +};
> > > --
> > > 2.34.1
> > >
