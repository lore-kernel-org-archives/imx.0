Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012014.outbound.protection.outlook.com [52.101.66.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DAF3AD522
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 15:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773415255; cv=fail; b=Pbc7ijPMn/S88FJzNj+FG8Xs5BDPUaW4+dh3DQ5w9UHxMCzErWJNTOIl1KFIij9a5hIHfAhyL+6pG+arSq6yag2kN1c5ZWZ9s28fn0jWTASKiHyPpJAiJj+vkSL/elVAh8Vi+jKSz/rge06TI57vQbu5/iHrnb+a957rs6XDcGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773415255; c=relaxed/simple;
	bh=mOP/Lnp/6dkZOoBZfbCfK1135gnq+c6OllJLwGHE+Es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bU8IA92RotlRYonPzQ4LJF7dLxQnlUlGXaQY/a3jbtSwRxv0cqkvoZ1XtogQZ1kupNb8DFkHb75HodGOpoNU8qJsenduToKP6XsdebA5Pgrav7hPhFBrryS7OP39kbbG4a2/+egXoBOtktv7KqgmCB0JTKDvgYMpbBpYhDip+Ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M+SZhaXk; arc=fail smtp.client-ip=52.101.66.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M+SZhaXk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOIEyZaK1sS0ccLegetBWe75FWPtpGs+YrCVfoRS5a+HzBKgKEFvteKkfn575tcbIW3N2zWN93mYcDIDekWzhFnKPjk1CvtwLeF3Ztj/twZ7kz2WycVzgUlYnK3nxsVQ4zj4glveR0jVwYBxU1wjdd3CmSYP8yiIcCFG+Q7VinTv1ft4RglwZE39la3GbiA0lVOgm13MwudtfD0VNV/xWjW4oWGJiUtYA+yJxP8z7rF+n2ooP/wjAd7PxWgGJAETTC1uerbfMnYO4A4UU6mR5ea3lCBWJUiaXI0BPqJ6kt/C+7vKemNPrYHKWesLo6qr5s+aFgTeKXdjMxhXQSDTfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOP/Lnp/6dkZOoBZfbCfK1135gnq+c6OllJLwGHE+Es=;
 b=Q2oKb7DlviU/8hwNEi2F7qcqbnrGqCqh2xpZIxF3EGwmElf9daNrRXBn0wl0ID+UUevGMMeO17dvC4cGCdoW4YRzmNIiprXYG1pD5rLRDhFJwFxPs4djEn01XChe/J0iELzxWM3t/KcsvuWlyf2W9ZxHr57XrEARAP+L1RCOgtoxuzuVTBBtQXNtKuXedJNkBCM3L6d2tRG0iY2MtMrtbpSEtgDaf5jzfVE/MJFX13IJHllgqV4UZvA+btQYBK7bsZexiFnJvLEFLo3TA5aM9hL0Nl3OcPomDyd4AyiSgis8Je0n483pYPIqJLrIteEmrNzZPqPMCwQRg5CPyUwgNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOP/Lnp/6dkZOoBZfbCfK1135gnq+c6OllJLwGHE+Es=;
 b=M+SZhaXkkR/vWiSjYUp5nZLS4ooUgKXAW7YQxN+dKyDK8w/bGWCb/i/R0fp3/uNUVZKSIghZpWnWhqKI6oZ76r0wRovtcq9SORAHQygz9szK6aHWVxW65tud9dSOwW3C6pCacCicPHVnuqoXvSnoK/vnuWvBmRFX3R8OfwmPZEmQwXfnlnm1c2Pi5u0CtnTvKEmRMDl9bBgy7Dbj4Vih1CZSxSSuuBSFESOKQNZaMeVfRveFjmj6OMX6tZxo1yv7asui47J1pLDs7X//9Jf6k7f1Wen7yUkq7Fex26Tuqx4C8phAmg1DsCKDOfzrmKV3Po476oGoPRBNeETU/wrxZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI2PR04MB10265.eurprd04.prod.outlook.com (2603:10a6:800:221::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 15:20:45 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 15:20:48 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: tqma9352-mba93xx*: Fix Ethernet PHY IRQ support
Date: Fri, 13 Mar 2026 11:20:32 -0400
Message-ID: <177341516342.72297.4793680692027111093.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305111040.1899965-1-alexander.stein@ew.tq-group.com>
References: <20260305111040.1899965-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI2PR04MB10265:EE_
X-MS-Office365-Filtering-Correlation-Id: 7438b03d-2df8-42ee-f712-08de81141a77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|52116014|7416014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sqZAnUzmIGkZFIEAILIEB2O6z/Y5sTx7SPy0E7neDaTlgH3F6e5FojpxE4yPCv8rJXrzlaJKOHM+IL3tYnAgHQdWG6iswN8WUa3qM9+8Leij+Rox1sMqTj0AogulRdTGcengQLHhI++zm6njeBlBRvH7GsQEDeaaFKd9aV5vwUJbkFoNcsyW+Dh7aoTQ5JUqzaRZZBB2/llQHS8rxXytyEu0WkqWA5V2B8mggiIXE92fnXeBJMyOMTb/b2ny/dKEjjsnXtdpo9HTov4hfu2yx8yTCCuHjfz6OZ5CX3t8CoUG5/JaNCJnuLe+JO2cbgAVhQriDbvPNh89u16UBPl0aZsijyeOTvjCl4rsE8Wm8U+rwZhEwzS0npxeWMkPkXpT60V5XU2UvmNKnPqMpb/i3e8ePXbIU4UXxklErmRsBo33LMaIjg7SdeljIDcsSdPUppp2yHO2/APkA08keXZ3dkmATzEN2YcQNCXQyPeO4Al4ItCEQHWzwtH9iWDVHHSGVSRCB6WDdyHmsoMfi5B7j4617/4xSajOXU2DW6Y3yg1nGckKcxY5VmqdT1bqD7s8RdhIi3lC/RqHWHRhvcjo9T3875cbJYZylyY0eduhjJI35VqPMTT0E8JNyRm1uNN7ocoJ+xMeEbyDV//UNywk4Kh3Fw8BiMEv+Lkh2euiGwG4Lcbr5xOEbpVyg3YIMJDxF9QXd7asQElNSDMwlQoLGyDklUdu30CmkFffiC5EwNas4SojbVpcyIwETHBvKyeiqEAeoAI5xZbtT/0jzeVbYgy1tL/6+LJQh0aubzBG/qA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXBFRFVJdlFZQjlEaVVuYkt0c0F2Q2VibHBTSmJRUkNTU1dleDlGWEt3UWlB?=
 =?utf-8?B?MStlamhHcVdjRUtnT3orcTEvcG9EdG9EaTZBdnY4TGlaWGdpWE16SkJtOERs?=
 =?utf-8?B?bUJLV0QyTVBuRStRMjRtYlZ5bEpreWNidTkwWlI3RTl3MXptSnRIR2hNcUlp?=
 =?utf-8?B?TGxPRHhaNU1JK0t4dXpLdStNb3JxS2lYa3RlbmRsYkRkTnBVNjVYM0FsVjZH?=
 =?utf-8?B?U2lyZk5BdUFKUjg3aytWYWNsdzV0OG1pNUJHUTkyTjRqSlRaSGZxZVBqdUtT?=
 =?utf-8?B?WjZMMWVxeDdHcFd2YVNHKy94Y3JDUzVPTUxLQkxXVkE4clJzNDdYeFlGTFpX?=
 =?utf-8?B?VmcvQlNVdmdGWEZSWFR5cE1FUVhyTGRhbUtibEdBUFZuaU95UGpkaC83ZWRR?=
 =?utf-8?B?bE5uRDNVdWhHd0dtaTJOWW9pVWJrRW4xQWc2ZmhuTmpYRGhIbEVSQmloN0dW?=
 =?utf-8?B?VGRzQjBnY2xuanpLd3hsVjZkejJ0bTNYUUVzNGJ2NllwYzhqcndZN1YwRUJK?=
 =?utf-8?B?eGZyemM2dEprV0tkTnBoTGZKTkVCaGxPYmhDSFZNTTlRdFhUMnVRamx3cnd4?=
 =?utf-8?B?NndFWGhBcmsvaUY3MUtSQUtKdmg4OEcxcm9FS05GU044bGpwVi96bG5LZllv?=
 =?utf-8?B?T3ZmWkltVExpWkZHWGVBQkF3aC9jNEx2SUpoQWx5amgvWGdRS1lXTytvdDhP?=
 =?utf-8?B?NDJIMU81U1ZSSW5wUE1WQytHdHZQblBHYW5RK0hUQVRFTDYzU1J0aDRaUEd0?=
 =?utf-8?B?WGVRWURDanNjQ2d3ODUwTEhxSi9SaXZXUG9IdFhGY3prQXlBZ0NmeE9KbElR?=
 =?utf-8?B?cG4yaktaR1k5MXVNalg2bld0SUxvY1M0Q1krVTB1NHFtdURkZDh5QmhDWExL?=
 =?utf-8?B?alVlSFhsVUYxVllsMm90NEw0MUE0VmhLY0MyeFNOcFJEUk5Yek10KzVieFJl?=
 =?utf-8?B?aVZMNjhreUtRRDBrazF0eWlRa0IrUkh3T0tNSEFiVVRDUGM0S1phR1BrTURw?=
 =?utf-8?B?VmJHcWVEdXZqZUFScFlkVUhLNlZmd1JnWTZENmhOQWRLZE5zYVJRSmtKa2RP?=
 =?utf-8?B?Q0VSSGUyRC9JZmJGQnZNODUzcmpuZ1lxUkRlMHZWVXFsSSs5SVJDbnVyWXRm?=
 =?utf-8?B?cW80bmg1NEJsN3k0TkRpQTJudnQ1T3ZSaGdhdW00b1huSGhzbVhqOTlKMDl4?=
 =?utf-8?B?Rmcvd2Yrb3I3c04zQlptdkNHNnBxeXlMeGlwcWk1WEpISVlaL0MvNHpwRUp5?=
 =?utf-8?B?SDl4VmdKcEdCQ1FEbjdUSE9sb0ptc3k1cHNQZ0V6dWZ1SUdaa1lwb0k2L2Zu?=
 =?utf-8?B?dDZmZGthQzZEOUN0dlJCYnVzWTBHRDJxR08yb1llNDNYbFVFOTBhbmdsUnEv?=
 =?utf-8?B?Tys3ZEoyTWhra0MwOS9tRTA1ZndFdld5OVIxa0g0cit3aHQ4cVpNTmcwS0xa?=
 =?utf-8?B?d3YwcEtRMkM1MDZTZzRhdTN0VFhhV2tFQU5uc0JtQmNaOUJiaXRnNWtXVTJ4?=
 =?utf-8?B?RXlrQ01qNXdXRk5vY0x3R1JtaUtsaFRrNUdGZzZiRHNWcjc5MUhZU2pSaDNL?=
 =?utf-8?B?RzlmUU9qQjNMYTYwNzZiMzBWcW92eW44V0tLR3FpOExhWVRQelFKdForN3BK?=
 =?utf-8?B?RXpGM3VQaFh4YnZBRWJQRm4xSE5PV2VPNStqQmF3OGR1aXpNU1I1TzBFSVVx?=
 =?utf-8?B?VS9xVmxvdytYb1ppRmZoOGQrK2xObmthY1hiOWR5UUdyOE1Ea1NPZWJQK2pn?=
 =?utf-8?B?dnFYNGd3SWk3dTJFMlZxQzh5RnlFNkEyY3MzZnllWFV2K3JYT29iNXpuZVpI?=
 =?utf-8?B?c1dlTkJuSjUySWthcy9WOXVSS1lsRTk3WFYvUi95TERyeDRGYTZoaElyTE16?=
 =?utf-8?B?U25aK2FKY3lPOVhwVGc5YTdBMFNFSzRuMFl5bUxSbjlRWnQ2UEtqSjhPZlhO?=
 =?utf-8?B?Vm9DTktsT3A0Q0t0LzQxbytYMHNXMDJ0TE1BOGQrelRDZDBHSzlSeEowa2N1?=
 =?utf-8?B?azlobUZWU29KNUg5ejJkcUNNKzl4TmZENDFtRk92WUhFUU10MHRRblc0QUtO?=
 =?utf-8?B?UWJHekdENjJtRjNENG9kZ0I1V0RIcElSMHhpWHY5cnE3ak56QkluekkvNC8y?=
 =?utf-8?B?Y1J5aUVjdXBNNUpaam0xZEFzcitjSlFJMHhPRFJ2ZUVOZk1YUTNYRjdHWTcr?=
 =?utf-8?B?ODVnUEMxajZsL3BJZWJIaFQySmlzeVJqWDhKeW1sdzFmaklSWGllK1BLSkhi?=
 =?utf-8?B?SW5LQUVRMGx0Q2E2dklOWk0zRGZrTjJpQXh2TDUwVlZzeHhpRk44V212cFVs?=
 =?utf-8?Q?5DUcA581jzvSNY6Ohx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7438b03d-2df8-42ee-f712-08de81141a77
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:20:47.9629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ML1J/7By/K3aenow2aLCyy4dHZjw9x8DW6IG/ehAYmsGgOfvr7soW1kedjxeNPKKVGw4XhowfI7Td7MKXWWPFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10265


On Thu, 05 Mar 2026 12:10:36 +0100, Alexander Stein wrote:
> Ethernet PHY interrupt mode is level triggered. Adjust the mode
> accordingly.
>
>

Applied, thanks!

[1/2] arm64: dts: tqma9352-mba93xx*: Fix Ethernet PHY IRQ support
[2/2] arm64: dts: tqma9352-mba91xxca: Fix Ethernet PHY IRQ support

Change both subject to "Change Ethernet PHY IRQ to IRQ_TYPE_LEVEL_LOW"

Best regards,
--
Frank Li <Frank.Li@nxp.com>
