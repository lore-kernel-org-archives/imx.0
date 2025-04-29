Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2042.outbound.protection.outlook.com [40.107.22.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3522144B7
	for <imx@lists.linux.dev>; Tue, 29 Apr 2025 09:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745919090; cv=fail; b=BPCQdjElW2zM8YDAjjpTWAOSnPlVlC9+2LA5OCy4vEHk0PoNWDAQHcze4YNRUtT4fFlQUfFEOgzVGsidzPY5PeRhKK4sZ6Z6wwItH5aCi9dOlPOeIiY3zVS81GkNPnB4229hvvcXUt8dXqcwjiFtSHhyrWroU0yK1nmVHLRXk+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745919090; c=relaxed/simple;
	bh=C4xsuoVNItDm0CVjAOgDu1qwYvSBIWrGuTz8MRS7jxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pDFeyKHw+nyWHty1yoY9l6WfIARW8yOeNj7uVdKpE2wA1m+6GVoFbeSE+Tp4L7uGokrWzTFQRo6PokT70IUSl+mTM1H8sMclnU+gn7BZGclkNiubVEUCv+hNz013HTpblMkG5D/91SjZowB4Cs5MdQS4cas40TeseHdadBsXf1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bbHwEjLQ; arc=fail smtp.client-ip=40.107.22.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bbHwEjLQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZZ10YpLFF1oMVpQwwRvzdQ6+e+MdmPt7kl0cE2/ffcenggmJCSzuMBkedvWhaAlJBForqqt+L3s3+8G+aFM3OznqnrXqOjRG3LTck2W6ALit0gsIDU3a3D8h6iCvrVFyVj0YYmYeGvM+kKhKLlolPY4V/H/f6ZmBQ8EeMEi16GS2B52VJP6+ph+IaZQCFrj3HKL/5HD2EnkuqGLMtJEdpkpII+HPoaW2CynCAjOK7op/uL+V2X9+ju2qgLzAVEuhQIKlLYyCz2hyD5TiQTkldNvj91xzpBeG02RgYOvbcnltMZa5vDZ2TP50QQMMLj1THqjWO414bxOHk+u7oasuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOyzFzHBZ/hSLaBwcvhEIdihMWAPigSTjIDeY1SUzKc=;
 b=Z5qMrLpBTA1O9SKloEjiYM+BoHmTPh/j0O/Uxk/BSNFTskMv38f9CxDL+SuSGS6QIEQ8d4a3YXSEnIdXIWJ15bzp35f3VmVOXQNeoNH6FqOCRTPAPJgiVUcqj+BwB3nxbIxS5DY4wMwhZxhm3lQv/Q7c78iC+q6hruvJ7vd0h6Spf0E/ETj69+SH+PqfkfTjSQvNocdiaeOspCQo1mYyYRcO6ryoyRse4ref7siJorPF/XZGYBaU0wpcexWR6vzUuyN69iRH235H75za1TXPGoAM10EUR7m70cigTZK2Fm0rXDXk7hYN+f8RSP5cuncU2wo9OVigbpmzmc0+ZvqeoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOyzFzHBZ/hSLaBwcvhEIdihMWAPigSTjIDeY1SUzKc=;
 b=bbHwEjLQMhj5zeUuNfrDTaz2eiMVHtYzfW430M4urqS8eKpdDQT0bXfWbFbVZN/XqaJNtlTvdthZ8kVR4RNyAhGCfRZUxNsc5hELP3PIpckAUtmG+3SxDOFqzFzTkSgttu60i88Y03g4DYDkyx0IKLq1tCdw+zuEc8K2JaCzqXqPa7yeggSBT61a55zuD7khixUj5l1ixFnbQT5DPvUdkeTKnwYIRUQbF/MqFxdgoY3i9ZWJRiHYaCXOSaAqjPjkxlsKFTclZ+kClAeTRWXp/I0VI8ksYBexyNl3/viNPYryCq5eigFCCV4yW/3FOfaYKS+buzsIuyU5jEBj3VfP4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBBPR04MB7817.eurprd04.prod.outlook.com (2603:10a6:10:1ef::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 09:31:24 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 09:31:24 +0000
Date: Tue, 29 Apr 2025 17:27:24 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	jun.li@nxp.com, alexander.stein@ew.tq-group.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: imx8mq-usb: improve some tuning
 properties
Message-ID: <20250429092724.guqscrxtihn73jpg@hippo>
References: <20250423094607.1029429-1-xu.yang_2@nxp.com>
 <20250428-thankful-observant-trogon-a5a003@kuoka>
 <20250428082002.gd275e2rqollatcj@hippo>
 <91d5c505-3fa6-42e3-be24-3b35c366d007@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91d5c505-3fa6-42e3-be24-3b35c366d007@kernel.org>
X-ClientProxiedBy: SG2PR02CA0118.apcprd02.prod.outlook.com
 (2603:1096:4:92::34) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DBBPR04MB7817:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d435487-c3b6-49af-2fb6-08dd87009bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XiSWZaZmQv+b/4b607uCMm3CMLA1/jOyKwDo1T/ZTLU4RAE9TpKkbNhp5xTx?=
 =?us-ascii?Q?j1aHgWeaVc4lFzpDBtV5ldgUKX6hkSuoj0n97z6tktkdkHhJAhKGvgyHCS2l?=
 =?us-ascii?Q?QKLp6R9jGMHWjY9PedCcZ5QpT5WH9kEJNtj1ScoBCxIq/8jIOifuL5iiTG0O?=
 =?us-ascii?Q?W6yVumRrOdLU6O/fTREk9nYvay1Ft/C6ViEgZoc5TfMfTptCcpW9tDQXKHO5?=
 =?us-ascii?Q?3LIAijDzk4p/PBJK0yYPy0Mj7igHve9XH2Yp6YHHUEk+djHvPIKx5ng2WoUl?=
 =?us-ascii?Q?yZTgfNsIXLRkbs+Jt8QAGooODT4QPLtnOd4EbeNNBi2EhEkN0CQBPGQE+SHr?=
 =?us-ascii?Q?c83Ki1HD2UBia5cCIAcTcVthV3PQHkt/Qj2XWr1wn9dyD+bM7U5UfyDB0ayY?=
 =?us-ascii?Q?XadcS3molM32OB2wfVO/awIhFDxRHgmXe/NaD2FQ9vZEd/HX16Qbu2tB8Pqz?=
 =?us-ascii?Q?/S9cj54ggH1LoZK8XT4t5ihInxGDmdMsouHuPUwC3gDcf6N0UxT8qQpdYvUz?=
 =?us-ascii?Q?WXMldBwbiRcsfRV3pwpWBosy6auugVuYWz69i6Q8wnlYfW7U96rfYNDmmSEg?=
 =?us-ascii?Q?j0a/J75IZhMb2yrFbO4Ok2JV83qjQPoWFsP4AGNKw1Woa4r3V0mAHk7hvzKI?=
 =?us-ascii?Q?2waTx2tySmZnVVenV005eRXgixWJfb17RhdDF5NcleYja9pYJryDRtPoMk3k?=
 =?us-ascii?Q?mSeA157Ho8vnXkB2PsDiAXkSddV15MgKfU1473dubCS2kVAVaTrmD68lWfFL?=
 =?us-ascii?Q?SDO1V+D+gQLIb/nrv4wVFF21u1Xrjc7g4xRDYSbZ+s3TKcj8NznXu9XYmf1F?=
 =?us-ascii?Q?viRjgGZXrBCftEHxsm+MCAX9FDPgisFZG2iJCNutYv7KC/ocLX+remDE8ujO?=
 =?us-ascii?Q?uasIgnh8p/Miw8S9ODHQRHfjZDtTIwFmK9CV3OT+XKQWKs07deQBbPDpCfSu?=
 =?us-ascii?Q?e7pfKGkFftq0APYH90m8V8eLHdpzhZIA1bjQIr0JHrzHX/vEDzf7Xj1yJ/UX?=
 =?us-ascii?Q?KAqagtUAIkfUpe8e6M9Q30hFwcAlvvDlFKxFn1lQEa3dN8XbzqIsvsd6uhhg?=
 =?us-ascii?Q?KuYGF0iwAva31XVJvGfSxKlMi1s8dYaxWXHOqMGFeeeEJArOGuR29G+ZEqHZ?=
 =?us-ascii?Q?JldcJi8S1ymBvyV0P0cnn3Ypk2pT6ehfoa+LiFYDWGD5y/DGuQRdcMh5+PyO?=
 =?us-ascii?Q?EFNf6YVw8Jx6BDCR5xdlFYN9/ods80/69CgaNHvctnAREIqx0DxV6DbEN6lU?=
 =?us-ascii?Q?Ic+Dolvmn7bZCtNOjwv5fnbxQ3ZSTMuI33fmKV+SvSQLf3oUyaZT+mxtlWio?=
 =?us-ascii?Q?3vEyEevpU17QxJuvnR/Wkunza7ugS0EDPkoE7fyuKDc+WijBiSCoe3S0m7Or?=
 =?us-ascii?Q?i1xe29OKe604xzkNcSWMBn/p1/7tici2Evnag4hMbJdompLUBuWhZ8ikwplK?=
 =?us-ascii?Q?/zhLyI0ko8h+djqhymMRS09H+yINeTBTxuFJThliOXYflzAz19u30Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QdxzlrMKstDRp3vBowhsYOa5UKJy+9VFFhGM0a5wqTZ1BBfW3+WLGsI/hPg2?=
 =?us-ascii?Q?/oYOfA+ExlklXJn17aP0iDRS7Xvc6H+dDYxrXjdqMEDJ39zCSQ2UGAswNTE0?=
 =?us-ascii?Q?dfpZgBjtpXBB3x65ZXsqmYEKP4YnffkWiA6+MyEckgbmr3NfNdMkwHZDGOip?=
 =?us-ascii?Q?yySCANkGqJ9Exc9IZ/FI7JJaiurxAzOf3OyZDlKgJqhf1AANqmtL6e8qweoo?=
 =?us-ascii?Q?wPIq2qoW+EOC/1TOMa//dk+fGhTQ4wvLp9u4QKAAbymFMFefnob2xL5fJte+?=
 =?us-ascii?Q?+9VIcexfyhhLxoXxMjxEVwZQj5lWGJcKFyOqtyXPjHlTSkh5tji1H+Rjh5eD?=
 =?us-ascii?Q?bjOS68D906g3807s0GMT2OS9lYwfwMW7gRjIpZRxEvFWRcn4z8uA2N6PhA0R?=
 =?us-ascii?Q?xA0WCIK8D0MvKLlP0OlWCGvB1Vxz86FO9DLlJJ+I/SqIStJgDsYI6eDGA6JW?=
 =?us-ascii?Q?f6c1jIymlIX0bU4XpQTlU1l6zNedKHsrOqAsSaC/XKcwWgwCA//DEvHsEPoG?=
 =?us-ascii?Q?nIfzA1TB1dV4LA/JTK1g3GG5MbwBqJz1GXndewFYMwRE7A5ZboLZrFe38RK8?=
 =?us-ascii?Q?LjTwnp7l+lfMaeujeImZL8po1i/5e8SfIgJ1ByHgynEb9tBlN/nhNOkVnOG0?=
 =?us-ascii?Q?K/oUc+4jXZJNH6R++wwQFBEMYzH5BqLaOgacpGE4JpKhv8TupJFkelw8so48?=
 =?us-ascii?Q?hBF3eUVyZbG/mCqqHTVrneQDK6Vrz4QdfMp5kkwFLIc6oR/vhWWhCmVDBhGp?=
 =?us-ascii?Q?SdjD+qeHCaX+Fw/lUc/KywMfEZUkn2c0R9OeOuvYIssSr7Ko3qoMuZG7ViGe?=
 =?us-ascii?Q?jKdwUTA6y74VG6bO8vkr2D0I2WLYpmMg6YLePkiVAcmObEe1OWKWkWTOovIr?=
 =?us-ascii?Q?bvfOd1yCUP2lXpm4xgtt9asJEvHEVJrE3Iwr+opRznnSzkIkxqXxp/DnIMwu?=
 =?us-ascii?Q?JKTj2yDU2rRfMBfD4mzYFao1pWGHkReYFtqU9xc7+hCcBZLNIvu+zvYRfgSG?=
 =?us-ascii?Q?NdTcwSWwSioFJyY/yHHhg86J55vSg7cUjXeegISGga1fmQYeXC8EUeaFTfqR?=
 =?us-ascii?Q?Toqesc4YzZVEzZZczZzdaSgkkryyGe+WMnVwHVn2DDzGtf1zG72/Pk31zbhZ?=
 =?us-ascii?Q?t7yiR9u2IqxemuNaC6uvM2m/8S1FiSwi35aoHzXTNmEn4h/8QHz2igiJ4nDN?=
 =?us-ascii?Q?515W41Yty7yZV/14JVUPDhBNleDyjUJjVLhqAqstMEfHhZiWOyIragrALKk6?=
 =?us-ascii?Q?t97+/0aQEW7UgmUmsd63+6gFB46ydw7w/4341YtrOL/gzdtuM2khjvIw0tvp?=
 =?us-ascii?Q?9ZBdRrPntIUfgiNezFiSSrIqhHSwyh5tS3/Biqr9Mn8QWB601R0wgt4X1dXO?=
 =?us-ascii?Q?1tot+hvYQKTL8r3s5D3bGKBRjedydkT1n8PHcoss5M0ggc9VhfKnIAxs0WUo?=
 =?us-ascii?Q?xMPkNXsTNCxavgj3kCnC3vDpumX79oijiEwkYLrR1g6bzmj+r7VOBicboaRA?=
 =?us-ascii?Q?Eeo8Wps5PjGdStHulo4szChijZrurJNAPaZaRcnC9gp3JR1f6u7TvvL0gMRH?=
 =?us-ascii?Q?zW0vCBIYpnEowLeGLgj+pqYHcdWpfxCwf+KPUTMj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d435487-c3b6-49af-2fb6-08dd87009bbb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 09:31:24.2697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CUABg0uKeBP4Fjzr0PQhs0mLE69Om/A+VhZLp5kKIIXEJjomw9o1pqTzYhHfnbsPQOR0ZTQB5oN8lY8EhS9HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7817

On Tue, Apr 29, 2025 at 09:33:02AM +0200, Krzysztof Kozlowski wrote:
> On 28/04/2025 10:20, Xu Yang wrote:
> >>>  
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          enum:
> >>> +            - fsl,imx8mq-usb-phy
> >>> +            - fsl,imx8mp-usb-phy
> >>> +    then:
> >>> +      properties:
> >>> +        fsl,phy-tx-vref-tune-percent:
> >>> +          minimum: -6
> >>> +          maximum: 24
> >>
> >> That's ABI break with vague reason "some pain".
> > 
> > For these four properties, no DTS files use them now. So that's why I'm
> > going to improve them. I think no ABI break here.
> 
> And which out of tree users did you investigate? Read what is ABI before
> you keep insisting that it is not an ABI break.

Given out of tree DTS need also to be considered, I will keep dtschema as
it is.

Thanks,
Xu Yang
