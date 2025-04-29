Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2061.outbound.protection.outlook.com [40.107.20.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776A327BF8A
	for <imx@lists.linux.dev>; Tue, 29 Apr 2025 12:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745928653; cv=fail; b=K5VQui333tknx7JBONV5iEWcibkvbH6i3/1WPx1HRXV3t2n02vFicBNdCoAP4JTtUM3Pp+eMk6k1CK0neHwZWjLZFHrygbp9OpI9t18gVNHtnALdpYpg8oCGveVT7JF66ZWMTAzpZ2rl1aeMd+CbW4m63Z7ari46hebEglAxcuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745928653; c=relaxed/simple;
	bh=JslzjvJA3tr0D5cy1/ZOpocmfPw5rr6vLw6x7gTuuKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=U0KLsU26mIvLO+t3/6ricxw/jxVOMz4iUM1j7ylkrUlax7mmHXBXISp05Gp5nYU7HAtVl34xIi4iiMaAnbJzDW9ROHKQxmWzwcbWtGHlqm83/xqfjsw7VoTTBPoUCVik6cbVWSQXQBY04IVKTDeWxAZ9SNts9NyKydZaQDVORcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IewqNolD; arc=fail smtp.client-ip=40.107.20.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IewqNolD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJlmkN1PFjPF05D6veHHgBaW6KyqFsOPSkJnWE0SGL2ru5JWSk9z6g+Zg+VWSnnd6GYV2wVwRhp5h0LI1p53pe/E1FCtRu837SJonJbliafw3C46FXsMPpHKEly9uKOv4YLjzo1PoNyqYmsqD/z/cXcrd7DJIzRvfvpOfMPRmn3yNvx14gFgz8zNvYcqLLOBRZ8wvXRguMle2KYJJuUemNrgScFEq5pxM2EGBZvLa0HhJFwjKA9kn3MbKvY4NU0ehQUN2qfbExDXUliw4rc3+9A8RHsOsL7GCiTfVkQ6c1BNRoOgdYmHvP08QAv3FNG4+MOxNfUmRMSLtxQ64YWYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPyK7OPmSGzm3Zze+gdNib98ih182Uy40k26euou3/s=;
 b=kM5sJRWn8a5nGSZ181oQo8I5PhCw8EUMD2kwBWDJ3hfDlKcNdCCRUV6gUt/ZjMi4v6DMdq1iCnNRlJP/x93Q4s0TCBEL/e0I9YaVRNOqgujjVmI9W0mPv5qXhAJ/o8xLIbNH5QkUGauZ9zPnfrxo/Fm/lhv+MDTCjKO5Lj+tWi0Vg8nq5IH8JiF9glKfj0O3qwQgGfzKkMGBQ7ErZtcnew2+voPSTVVxbY7yVMk0SOPdS35xnkGrx5DspxmnPE6zoZvEYMdul/AR6ByIVMLyDTYABx9Lt/XgimdUrq6BICXAycYNAtovsOUYCiK06M7UPnOv/qhguN8tJPyzSOYdCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPyK7OPmSGzm3Zze+gdNib98ih182Uy40k26euou3/s=;
 b=IewqNolD/0TdU3wkAog5pjGKvpElMGmIKv0VhwTADUDxbmAElYXdL8RTXi0AP4/Zbqyn1R5wnboqXioqET3HrBCXY3VkZJJY3edvhOi4UpJfC2JpNCKi9/v3vjk4BkSUsSJc0+147IluLt2sIlMfKkcOb5IEenlbuCbMWit2dU/wb4EyH1cNydGYadZ7V4mX+E7DV3j75U3sXEdFGJBAyAD+1um5QqxCYPV4Lp7yq4ic8S63mBF+o2IDMCx/u4kFP/ZqGb99C4XR17IbHGvFPThA5P5cl1QYZKgfBiAABfKUvr+RwaIuqbvuOy86ceqXDmMBh2GbcCET1RhZwqEwNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10690.eurprd04.prod.outlook.com (2603:10a6:800:279::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 12:10:48 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 12:10:48 +0000
Date: Tue, 29 Apr 2025 08:10:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	jun.li@nxp.com, alexander.stein@ew.tq-group.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: imx8mq-usb: improve some tuning
 properties
Message-ID: <aBDBvzA11/NXPAbD@lizhi-Precision-Tower-5810>
References: <20250429033009.2388291-1-xu.yang_2@nxp.com>
 <aBBpzljSQEnQwlvU@lizhi-Precision-Tower-5810>
 <20250429062640.cqqtkp3vwkd5a2gp@hippo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429062640.cqqtkp3vwkd5a2gp@hippo>
X-ClientProxiedBy: PH7P220CA0042.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10690:EE_
X-MS-Office365-Filtering-Correlation-Id: ffc16d84-f98f-4923-6dc6-08dd8716dfbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Nd6ca5ONEL7xbQDNNEsfs9iMDL+7NhZLQTBfvEU5f/fHliS0CTskPMwDGcTa?=
 =?us-ascii?Q?7q6YWVOJJEjavWcHSAhTNoy9M30wqxD8g5tRO4wey+mbKbdfL2FAlf/GPb09?=
 =?us-ascii?Q?tXhsyzHmYe29QOlSE/ODKZIoFlH9ALIEDH1bA+emUPV/LCl+4MmEtUon75yP?=
 =?us-ascii?Q?IKOyCE3L4zgOkDtKAG3eavzGB/SoshF8BZ3kkoApk+jQROLSCJLX4s1ikALv?=
 =?us-ascii?Q?htI6H8NC3BwtrZ3k17tD8jI8xSqdwiGNrvbPstAWVUIvEOsDkK+kXemMb5zl?=
 =?us-ascii?Q?jx1lONgrvOA+gjz9x9IxKFAizarOZp+LPprcfso3jXyvdmO8cItkobgYpZ4J?=
 =?us-ascii?Q?evQrzeOXnmX5IPi2GW860dI5tsJeIzLXzeK6ka2Ri2Q14QHwiZN88aKZnorS?=
 =?us-ascii?Q?HRw+nWUS96CmfcMKbYTdQzrkoIJlrw/saB1/pAuVyhptzNZT2gkm4M5WgDrh?=
 =?us-ascii?Q?Ttbp8aZssalB7rHjnFzE3HFpW8gbpNu1h0Q5/4VptZR4iV8FBoDN180AWXKI?=
 =?us-ascii?Q?QnL7FQYaGfqDIxLDcuWu4g3WxT0puvm1dMrM93etffdCp3wwF2JHiEhllZn7?=
 =?us-ascii?Q?1Fp1RzOMHCwbeIcLsB+JLe8t3XyMu4jNfPo8dvpqNiYCvk6UWjy6lcxZ7gHf?=
 =?us-ascii?Q?VlzsU2rO0B5TGmX4rqzbFvCM4yGJaYpN9Dwpj+x9rTXlumrxfAOPgcnR9/J5?=
 =?us-ascii?Q?VkYFFcfK0PIgkN0qr2V/dcNBsEzt1oMRXb5tQ2xWxntcDEcw5Xy9g0Krs9g/?=
 =?us-ascii?Q?6yK+zfO8hMKufwBGT7lNmFHfaExCbvDsxcS+qLc/QSxViQFO6HmuM8LVJVR+?=
 =?us-ascii?Q?SiwqRYozJ/+psbVGystcUYQI0wRawgxWr/sTZitYgg7Sd9WXpEFv+OjI/bDy?=
 =?us-ascii?Q?beRK2jAD3uq7ZKKfAMZpox3nKklzmvziUvqO9/teFdI5QidDmREyel5ZJJ6L?=
 =?us-ascii?Q?M4uo63YTrrpmq1NcUzd3n7zvTzEELp+9/ixe5ndaiyMjWjlkwbVaZxV5UgZU?=
 =?us-ascii?Q?riCnA5DHlnXe84lEOG0jbwmpwvKoWG3nRX8PvtnDGcMm8vvizDVi/C8W7r2e?=
 =?us-ascii?Q?GwrG4uLEI7I2mqhZW/9KJNW78rfqlT5k1t+ynb41jCekK9dGRnMEQ6lb4GOy?=
 =?us-ascii?Q?YmSf9+aOMfluR9tN2+8TOiYEixX4WJWZFrmWvfClXT6hqKrgmWcCrouug1UK?=
 =?us-ascii?Q?ng5GSAQhqZnhGTON3rKnV1VLrdkiq+Hu8wQ0a8xMZ99SQdlYe2u8D8JFD3pn?=
 =?us-ascii?Q?pvaFdgWr8wRBEOrsABNk2T70G/Kx99CLXwW5ZFr4pHbSv9NHwUlXB9b4Tdx9?=
 =?us-ascii?Q?DBjBBEAECulGC/kREG3lfEyNndES9ceu+dvPLHAVlqRwuRikcNinKmNmqMw9?=
 =?us-ascii?Q?k/ZP2swv5lVbiaS0Wk2pewG+/8hGB/QsBTaPBH1yLFRc3iFRjU1J1EGOoJge?=
 =?us-ascii?Q?/lOS3FDWP2Z29nAn9S5sjEe/qyav8B+bSkSJQ+bckZMEUAwnbdxpHw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r64rL8V5oePMgepRCFyTLufIuX1xQAQDOw9momEG133dZJoA1IHbnXRzYNAx?=
 =?us-ascii?Q?LNpwAAtkoCze1veql2uvs0FSQFEhQVgWvcGI8ykuEMd05vhvaGDuK/DnVfLI?=
 =?us-ascii?Q?Oz6m+mMc0odop8g86/BQKW24wsJNarYuLPxruvv2voUIFNNVfQGE0NTT1R6Z?=
 =?us-ascii?Q?pgRuhEKtqKsqN1R1GCQilTT0HoONJfr+5pZK0v5583y80w7maReu9K7ArmF8?=
 =?us-ascii?Q?XSbiopUCdCi8ZyEyo67n/vORIyWGVpjbUbJsQiNzpkXRslSZNIHFgLNCla91?=
 =?us-ascii?Q?oMe2onsTqvQwHEmR94F00CTxYJT1Kpeo+T/soLQHM2BP5lsXOPZnuNUhsgae?=
 =?us-ascii?Q?29wV/3VaIt9zw+50zdwNjR+UGmtkYr6/VMJcIavgy4ONOsVBQXcHOWpa+2dj?=
 =?us-ascii?Q?DB1n/z9y+8pJiJDe8Zi6XPVoyvoolqxKKLdeDmLtUOKRb5nHKRaHwmH2LT04?=
 =?us-ascii?Q?5W8d4XqklSWCy1Hfku6Ts6JM0yNGJMQNv25/spUpRdh1ytQYT+eyz2xI2xsb?=
 =?us-ascii?Q?uIM7t0Iyhzy2bC1BRUnj3P9sJWp9Pjrp3AEKHgd2UkiToWkf9y+Pd6oRUVbY?=
 =?us-ascii?Q?ZpxrTeWr9kznmm/2gRutXCx2mH2A4klQr1RrZ81Ue6jObFRmcdsz3R7PqXSe?=
 =?us-ascii?Q?0aBAeQLFnPiEB00xFq1wkq6QlpRrUHo4kPuQ8GpMxKsIFquhCmpqYnndqrpY?=
 =?us-ascii?Q?C60nVSj6xvps6EEScf6DrWogGqyKrPzYP5pt8muvl1yEUOW6dQbCbhg2qAd3?=
 =?us-ascii?Q?sFu5hAapC97Ol3J6NPzYrigN8kBgO6Mtr4jEaerB3w54XBWoLoPuMXRerLUc?=
 =?us-ascii?Q?weParw6xEJfvdNQind2HqLlfm2fKCcdnCEFz1wQeEDYe5yeoH8cZS1n0tTus?=
 =?us-ascii?Q?ItHobTmaP5IyLnllDPGJFEtzgsD27m7V3YpnLRnEfV1GAmfHUZc8cXPJhqo3?=
 =?us-ascii?Q?qSJksF/ICXdFDWrmSO8Z7KLeTw94g/Np3zdZ+eBbLwTfQv32jQtZ8+OwUodR?=
 =?us-ascii?Q?2xcDYG2TQZowSUpSLF82IDExgS+ES1tHWEPexuhWjARbeuGosHOT9WdYxJ8c?=
 =?us-ascii?Q?W12AI7bPd8Q9WbY7rYYnnnQEUe2fJvKlT/wjfNwVqeTl9Fl7pV1xttsiulYu?=
 =?us-ascii?Q?qFHUnmzfQF3fdWA+0znc4SA2aU8bdLvRsOkvtTDuo7E1xgEGFg0Anm93jd13?=
 =?us-ascii?Q?6JQRMP9NI0OEM4zlYCLRSIFhcdrET6vKoGKLRKPrsyiVPXXJnNGL6J5mve2K?=
 =?us-ascii?Q?xQds12RHMuNVep6h2bOdbWXpjJX+Ol8If7/lEgdhkg+lzV6p1rwRCl9ArJZa?=
 =?us-ascii?Q?x0sRP9nhiGQG3tITcPnVNSGMz+qvN77zeGdw7z9rIWisS7AaX0ruuDzi/6Dg?=
 =?us-ascii?Q?uJqmkM3yEJpZCNSCgIk9FAM4a3ZH7ftKo7GRIzYqxAG8Sx5EJAiR4RdV/cSy?=
 =?us-ascii?Q?tz8n2f1rLCtwJUDSCgSOR5owFlTCkqK+iGp9/RRtNb9lsw4SAfBwYoyarQVy?=
 =?us-ascii?Q?rlerp7R/8sBMp8V1M0FkdOIAtifb/7i/hgi6qJgJkxBEv6lh6PXahicNYHbs?=
 =?us-ascii?Q?qPfudjFurNhR2Knjp9Y=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc16d84-f98f-4923-6dc6-08dd8716dfbe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 12:10:47.3020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6rbLrnlArNI/vC3Tm8KO7xdzwiboA7DK8Y7r52FUiv+orU0P78sT5eSsbN1oz40GHcCiBJSYlx+cPcQcOtvWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10690

On Tue, Apr 29, 2025 at 02:26:40PM +0800, Xu Yang wrote:
> Hi Frank,
>
> On Tue, Apr 29, 2025 at 01:55:26AM -0400, Frank Li wrote:
> > On Tue, Apr 29, 2025 at 11:30:07AM +0800, Xu Yang wrote:
> > > Commit b2e75563dc39 ("dt-bindings: phy: imx8mq-usb: add phy tuning
> > > properties") add many tuning properties, but some parameter value doesn't
> > > match the register description. It made some changes based on the original
> > > value: add offset to a negative number so turn it to a non-negative number.
> > > However, it's not easy to find an exact tuning value from register field
> > > with such conversion.
> > >
> > > Because device-tree supports negative parameter number, this will improve
> > > some propertie's parameter.
> > >
> > > Mainly include below properties:
> > >  - fsl,phy-tx-vref-tune-percent
> > >  - fsl,phy-tx-rise-tune-percent
> > >  - fsl,phy-comp-dis-tune-percent
> >
> > It should be standard unit. for example 0% to 100%. DT don't prefer you
> > direct use register value.
>
> Yes. The dtschema and driver already use standard unit.
> This patch is going to correct the unintuitive expression.
>
> Take tx-rise-tune as example, register field as below:
>
> 		00b - + 3%
>  [21:20]	01b - 0 (default)
> TXRISETUNE	10b - - 1%
> 		11b - - 3%
>
> The valid value of tx-rise-tune is [-3%, +3%]. However, the current dtschema
> add an offset which caused the valid value to [97%, 103%].
>

I think [97%, 103%] make sense.  (Normal value) * (fsl,phy-tx-vref-tune-percent)

Your formual will be (Normal value) * (100% + fsl,phy-tx-vref-tune-percent)

DT scheme don't care register implement.

Frank


> fsl,phy-tx-rise-tune-percent:
>   minimum: 97
>   maximum: 103
>
> When I first added tuning property to DTS, I thought I was reading the wrong
> dtschema. Other users may meet such confuse too.
>
> Thanks,
> Xu Yang
>
> >
> > Frank
> >
> > >
> > > The parameter value of above 3 properties are USB PHY specific. i.MX8MP
> > > and i.MX95 USB PHY has different meanings. So this add restrictions for
> > > them.
> > >
> > >  - fsl,phy-tx-vboost-level-microvolt
> > >
> > > For this property, the parameter value is wrong in register description.
> > > This will correct it according to true value.
> > >
> > > For detailed info, please refer to i.MX8MP and i.MX95 latest reference
> > > manual.
> > >
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > >
> > > ---
> > > Changes in v2:
> > >  - keep widest constraints
> > >  - use multipleOf for some properties
> > > ---
> > >  .../bindings/phy/fsl,imx8mq-usb-phy.yaml      | 60 +++++++++++++++----
> > >  1 file changed, 49 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > > index daee0c0fc915..71e5940ef4b8 100644
> > > --- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > > @@ -42,16 +42,17 @@ properties:
> > >
> > >    fsl,phy-tx-vref-tune-percent:
> > >      description:
> > > -      Tunes the HS DC level relative to the nominal level
> > > -    minimum: 94
> > > -    maximum: 124
> > > +      Tunes the HS DC level relative to the nominal level. It varies
> > > +      between different PHY versions
> > > +    minimum: -1000
> > > +    maximum: 875
> > >
> > >    fsl,phy-tx-rise-tune-percent:
> > >      description:
> > >        Adjusts the rise/fall time duration of the HS waveform relative to
> > > -      its nominal value
> > > -    minimum: 97
> > > -    maximum: 103
> > > +      its nominal value. It varies between different PHY versions
> > > +    minimum: -10
> > > +    maximum: 20
> > >
> > >    fsl,phy-tx-preemp-amp-tune-microamp:
> > >      description:
> > > @@ -63,15 +64,14 @@ properties:
> > >    fsl,phy-tx-vboost-level-microvolt:
> > >      description:
> > >        Adjust the boosted transmit launch pk-pk differential amplitude
> > > -    minimum: 880
> > > -    maximum: 1120
> > > +    enum: [844, 1008, 1156]
> > >
> > >    fsl,phy-comp-dis-tune-percent:
> > >      description:
> > >        Adjust the voltage level used to detect a disconnect event at the host
> > > -      relative to the nominal value
> > > -    minimum: 91
> > > -    maximum: 115
> > > +      relative to the nominal value. It varies between different PHY versions
> > > +    minimum: -60
> > > +    maximum: 45
> > >
> > >    fsl,phy-pcs-tx-deemph-3p5db-attenuation-db:
> > >      description:
> > > @@ -112,6 +112,44 @@ allOf:
> > >          reg:
> > >            maxItems: 1
> > >
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          enum:
> > > +            - fsl,imx8mq-usb-phy
> > > +            - fsl,imx8mp-usb-phy
> > > +    then:
> > > +      properties:
> > > +        fsl,phy-tx-vref-tune-percent:
> > > +          minimum: -6
> > > +          maximum: 24
> > > +          multipleOf: 2
> > > +        fsl,phy-tx-rise-tune-percent:
> > > +          enum: [-3, -1, 0, 3]
> > > +        fsl,phy-comp-dis-tune-percent:
> > > +          enum: [-9, -6, -3, 0, 4, 7, 11, 15]
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - fsl,imx95-usb-phy
> > > +    then:
> > > +      properties:
> > > +        fsl,phy-tx-vref-tune-percent:
> > > +          description: 100x the original
> > > +          minimum: -1000
> > > +          maximum: 875
> > > +          multipleOf: 125
> > > +        fsl,phy-tx-rise-tune-percent:
> > > +          enum: [-10, 0, 15, 20]
> > > +        fsl,phy-comp-dis-tune-percent:
> > > +          description: 10x the original
> > > +          minimum: -60
> > > +          maximum: 45
> > > +          multipleOf: 15
> > > +
> > >    - if:
> > >        required:
> > >          - orientation-switch
> > > --
> > > 2.34.1
> > >
