Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013043.outbound.protection.outlook.com [52.101.83.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11799304BC3
	for <imx@lists.linux.dev>; Mon, 15 Dec 2025 00:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765759787; cv=fail; b=GcXdAIsaiFP6fh2iE7rUlJq6MTYCDc4WLiuNBzdTCpOPf00LpaM6T4jn3feoWkXTzuYGyz9Uigs3Xp5YYkVi/qRmAJZEdoFrWN2qZfli4ura0bWeJpiUu537iwzEFXEuxhcwegCmwvcPbIl9FXVSAmXjAdOMT0EMEky8w3v0F+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765759787; c=relaxed/simple;
	bh=FG1dLIYkaEeVt88hOPtIisNa75hlZFvdC0+MvUEctn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JAx6eacACKbDQD8Payssri36i4QGrNsaIF847TTUV6yA7UrNgdP0BkVFjra08ZMC++8PI/i7oz/QyFMkT3nL1FigKv9k+yAmyU80terE+QNOmPoFWATk0iVmvRJche5UaoTAUPqlzDb3E5yJp394v5AbuvvZ2zalOmtruq2s8ZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=t0WhAQuT; arc=fail smtp.client-ip=52.101.83.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="t0WhAQuT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e28u4dI0g+HeghpNNKK41w2LB4woo24NDpMrbh5/kW1gf5ZJOtFdLCgD6LhrVloBl6bxLQjztYtihUFOxEsw7W4JA35ejVZ/kFKdYltQ2JjFaWsjOwcv3NKyYNPocnkpxkYoGn3C75RpCxeD8aOjMeuTSfKoS9FFZ5JB8vZV9rnmm/9JCtA7voy1XaV5Q0LkkP9DnvIT0WENDPAmRoyeNAEUWUTjNjk1RhYaGJwqDZlPaTW7W2i2W3sjWqQHxM72hSmebUPPgO0kVcOgmAIgunSERAdCkf5eDIxnRNN0+CtGBXjx+uUBOV+te1zPZsislkXodAejtTBLr9DE6FDrQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FG1dLIYkaEeVt88hOPtIisNa75hlZFvdC0+MvUEctn4=;
 b=n/UOb+XGwK0JM9ZQSMQpK0xVzatC/f5xwFZFCMbiJfnAoTL5ROqS3bKRUi56bF29emDR226PBb01tCvJT4ofnoiZMk3uTju6J2jdAykiNskUO7ohPQoyllgpWc7i5WD3Ab1uVFkYWaX73CVLui8VLRjQ8/nMfQGL7XVESGKzPYdJJrAoTLbBZN0kknYoBoqSYn8PajR8rLZEsqJJhEL0epYgDB6V3U6HBIgmoCCZCrw3TWbUSbOFOSlK+vmxIuhZSYNyTZufw57q9R/t4e7odj1o6ooM37vimReyNjOxZxWMdlRZgN2UDKZXvJY9pWVS8rBUnS0SDuTiQj6kyZvCQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FG1dLIYkaEeVt88hOPtIisNa75hlZFvdC0+MvUEctn4=;
 b=t0WhAQuTrwXryzoXvQ/YqWOmUSdLBep2r5OmNYCVzYmJdh4UyD0BNP0Jk2BNnuswXYPLfEcu0/uvYa3ZTdevb+sH+afslblQsHRi2ej+STXKcAVQtzwGH5cHC0Zb3MAPb1HR5/xrzT2Y4hwa1o4VRfPc1bshgFxLvGV87CB8KtMVDRYsQzlnCv6AAaMWa6h2YwvB5LUOK1rN+MhCE6Ce8PKNFA3FIUP5BLzHoBGddRJa0EBTfcMKE2o/3ACdlfv8kozv8Ye94jJ4SivmyugnEetiQzKzP7o9QOYhLfe6bJsOM/OK0xkDGCJZp45jNRb5mTsfCh6cw7tCRk7YdQ1/GA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8972.eurprd04.prod.outlook.com (2603:10a6:20b:40b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 00:49:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 00:49:40 +0000
Date: Mon, 15 Dec 2025 08:50:47 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/4] arm64: dts: imx91: Add tempsensor node
Message-ID: <aT9bZ0hiOf0dldz5@shlinux89>
References: <20251212-imx91-dts-v1-0-2bb3c13762dd@nxp.com>
 <20251212-imx91-dts-v1-1-2bb3c13762dd@nxp.com>
 <aTxGJfQDQVXb+Nd9@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTxGJfQDQVXb+Nd9@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: MA1P287CA0016.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::33) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8972:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d7836f-ac94-46e9-ba4c-08de3b73d446
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|19092799006|7416014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xN+5Gxb53GKE7EB5W0oblfTNwQs36Owd3K+j7EL2bZAIFOhNO3lKSYa+DVr8?=
 =?us-ascii?Q?u87tdI8vxqmiDu163CtiXxzq1XnwquvWaiUKN8UJFsC3AxYq79JjqhS9Nate?=
 =?us-ascii?Q?NlMBpcB9u5IhwCviz6LHX7RX0+qaZ8/si/iN2rYHCGovBjjz/KkcLqQ1FA9l?=
 =?us-ascii?Q?LR3kuay54Qdr9IuLGmFdDro6oX1xx0fJcRqB8mr+htXffDo2OU1VHBEVJCv1?=
 =?us-ascii?Q?giAtzb2b5Khu25Ns2EAg+bF5ErvwyInFyXyOHw2OphA5SEPC4zpXepYbfSZ4?=
 =?us-ascii?Q?FF/5fBt659kpw+gyHz3x4POf+v7Pir0C2Y+57tAgSS/ojLkSFsuV0Hxe1FV5?=
 =?us-ascii?Q?uNH9x+slZEc9tjfIo4odsKUd3DsRiUY5m+XQGyOytljIg6bnFGH/dexEh7d2?=
 =?us-ascii?Q?CNvdalVkwsBTmmokcVQRxnmp6H3ubKTVusLbvpFw3VRexKsO0dp2DDddctHW?=
 =?us-ascii?Q?I2VA0JTdmK4ccGtfoHYIPebRb5HUMdr5Jger6sM9iwUbKsJZhFiaMtvLDQgB?=
 =?us-ascii?Q?FU9azivcbR+rpvPG2voF14qNGDrvuZ8gG0n4yPDCoCK4u2ImQ+OZCh/rT0NN?=
 =?us-ascii?Q?ONoKLzm2LNB1f5ByDXbJNUfK/purNY8YTe1dR4HwHd4po9nde5cNsO48Wo0c?=
 =?us-ascii?Q?m2AUdkrvvvCfzK6OnsQr3Ndt2OVwX6mLILEtl2GItquX/L0VC5d2Cty8X/G3?=
 =?us-ascii?Q?rXMJTztuxDEdtWgepx+XkR7QYfJnVCzxc8UFw5XNTtO2HsTdPzkRUsPB8a2e?=
 =?us-ascii?Q?ynJVQLay90pbEAR9SJrKb8p9hMsiHHIzd7QVTuIL2oh1wb2jcSQ9niFI+ytZ?=
 =?us-ascii?Q?8Ox0JbG78S/pXEpAeR1gv3NDffK5geitTIY2XgUvOoZ8Ca5njWDPejDUPAnU?=
 =?us-ascii?Q?oqIumX0s9gBW/pmE+qS6PBxeVKXezVfekwrbE36Sa9wBvoLq59NsLGe9JxtL?=
 =?us-ascii?Q?6Le9e3PLN4UcdUB5UM698/SNjkworHbBA1N1VdumLl69ZN3mhPxYboBJBQGM?=
 =?us-ascii?Q?Y8ptAQJOQDuORRkr7nwrXdHz35MIIy0HFKk0v7uj6kkUp1JZ7lbEoEHKBERg?=
 =?us-ascii?Q?t7cTzYkUfyMmXucao7kG22ri2FtZrpR0Jhv4hgNipTA1vpqyyRxSSguLPV0i?=
 =?us-ascii?Q?V5TLFaueSPi+FrqHZkgG8yTLRWRPifJaIXYsk6QGARMtQLjEuNEZ/5MU+IYA?=
 =?us-ascii?Q?HTAiDmEN3LR61LI70DlTRKXwZ5WIhTUoox0RSr5gdJh1mZNjDV7qUnz3DWK/?=
 =?us-ascii?Q?OX5F02EZCWJIIvSfAPy77gD0XwL6HYzLZbedkCQo4JD+b9Pms9pFkURIZzIq?=
 =?us-ascii?Q?duulurrQ/UrmQpih4AAuQW0WltbCO7yn0A5N04J681Ya4ExjDKjMGXArH+tS?=
 =?us-ascii?Q?v5h5x5K3u7DwU6JgChVPQI3l4xLMY8i6F1Bk1/iR9KY6c64jaQjqHj0YXay2?=
 =?us-ascii?Q?tY4l/3YVFL+kQK89WBN3bLD99ojoG7A5+7s0FG/f/vqVQ4tk/Ox/HeGrVG0w?=
 =?us-ascii?Q?KRrss31Y/owE+H0Ny3L2jjBc7OE0wCtBClK2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(19092799006)(7416014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MuvjLdPkLxhZaKIThnjRuVScj1H77dr0GQOlcF6iNy3Ml+E4wskQsQjL55jY?=
 =?us-ascii?Q?+47IZE2IitLTEvT8NH15ak/JTa9G7AiXUb+tODlMjJqYDYTMFc26sCNWB+NQ?=
 =?us-ascii?Q?juxvjBhxWbTsNV8Gd0vnA0VKvWeg1Ji8wcqaJdNBqbTTfpR4BxDnzywkDS/1?=
 =?us-ascii?Q?Oz0Vd+bkCt67YVuzWDs0hL0ebzVaUJPcviV3CNSbSJTqa21OX7ONKfieuEsY?=
 =?us-ascii?Q?hfZ+iksbjciykZptRXMwdhMY0atkkJ7/SomNZYK7KadpeiU8nd28BRl0kwvG?=
 =?us-ascii?Q?PiI5By2TrEcgXKvjRsQ74FmlwisCY7iCSQaG6gxN1SjsWRDB5Pn0Fct10EO9?=
 =?us-ascii?Q?wQ8rCUwnmr2PeEh4gX7wO48wlvWbBfiFWl8qHnN/hN+mkqzWtelmFoyoHGLo?=
 =?us-ascii?Q?HWtX8gIjbytvTRiLGrh3kWBb1lY/0m5/gxq/I+UYCMETlvpPMkXGKb8wUuCK?=
 =?us-ascii?Q?hb1PR8OtfJqrYTtT4xX4NCNzrd9n/tSVhZyGdbCpImhkJulhEp3gqPXBSRE0?=
 =?us-ascii?Q?g74sbxXVbbmI71W3ax3KYvzM0dSbxUONCxBOXXnzOQQ9EQiK415Jcm75V1yl?=
 =?us-ascii?Q?HgADOwilr/i3ne6lzu8TU/yRUtNtA1uEoDtyORK/4k5FfJsVhCtwVxdOBuLY?=
 =?us-ascii?Q?sxTmT4iPKqNb2cv1g0gwcHUIrmnROkMqi61tKD6lXvD7aLFHWSt7mZ/5j1RE?=
 =?us-ascii?Q?RKImB3qGnTnPSBYkl0z4JS9ijbUJg1R3hTXSYVuCMgM+IDz2B4TRnRvq1BB6?=
 =?us-ascii?Q?/cYowGQuKUz1QYtqfMJvi25EDjAvxOfof44/2lXh1Z5skCpNZWnIcoHVzD9b?=
 =?us-ascii?Q?aLtw9+WfjSd9WoAVuQ9+xyYioP9aHaqeeE2kyrBsClr9k+9FGmF2E4jkC4Bh?=
 =?us-ascii?Q?ijYlLouECgQm4pFe4MWw9XGRIsXOHuaRUwPlqJeyIAUDKFopUQWuhwXmGV7d?=
 =?us-ascii?Q?38+hHByuLahm0jCjP5hK5VqaOSqC2zKfqXH28656JMXS1LZueckBkHWWiPa9?=
 =?us-ascii?Q?5BlPeP7OWGOG/gc65CsyA8XO4unVdDDwnWMy9OVNQLbiSKLHml1VoGPb4Mb5?=
 =?us-ascii?Q?KmyQ7KpFtZzstlHSC5pjOdqiDtTemrVM81dJH9NPMiwNrEvAr9cruUfZavb4?=
 =?us-ascii?Q?49d/ocSimxQL8/mI7iy+xz6fzrZpWk7P3g+HLOZDVrkeduRlyP4XagdBNzfg?=
 =?us-ascii?Q?Yjded9USO8eAYimlDGVHY1zVWcq4dPSgoX/d03XM5btwqZsT9t4uFHFO21FQ?=
 =?us-ascii?Q?Ya6pKD0s8lh41FwTPoBjsvpbwYTVgJ7sS0cZ4AKYuqompynUFLUuoUtYV/I9?=
 =?us-ascii?Q?Qpt+iXu7sReDHYqk57JtqFYMN+H2wCcrjPeXmue58l75mOnpwrINh4lvgZMR?=
 =?us-ascii?Q?Ov+VEyF/XTZeFshCedyBaIhGBymgsjHD92ibC1RoIvxD8KQFqGJ/0XrpLTpU?=
 =?us-ascii?Q?FUbmm3Xqmk04o9Qk9TFfygUTANkq/R9GjeFbE5FOW9yutA0OSvhf1zLGEY7j?=
 =?us-ascii?Q?b5S6vUQI2L4QK35teDA6fcCiYRHPknMhhWYyQncNkiKOxrE5PPAo5a5+8f7q?=
 =?us-ascii?Q?AfhPLuUVZSZICnG4EvgMO7t2Cl/Aw1G/CiI78mY5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d7836f-ac94-46e9-ba4c-08de3b73d446
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 00:49:40.5232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLhKG1LuZ3jLK9aUDNLKNc7GSlOpDmHKE6vB9u0xgScr3pNPbbVjKSD7ZBpOiz/HTCrqsRtIfY+jm3LvldTTLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8972

On Fri, Dec 12, 2025 at 11:43:17AM -0500, Frank Li wrote:
>On Fri, Dec 12, 2025 at 05:16:07PM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> Add tempsensor node and trim sub-nodes in ocotp.
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>
>I posted it when upstream tmu driver
>
>https://lore.kernel.org/imx/20251020-imx91tmu-v7-3-48d7d9f25055@nxp.com/

ok, drop this patch.

Thanks,
Peng

