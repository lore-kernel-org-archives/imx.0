Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013010.outbound.protection.outlook.com [40.107.159.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764903A4520
	for <imx@lists.linux.dev>; Tue, 23 Jun 2026 04:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782188119; cv=fail; b=tGdVJTlFiIMWe2/Ja//w9paipSssZTyo+Y8QCb35s4Sc+Guiq2fEOkxlhQxRsYLb/YF2JKS7r7PqIhv6N0JoBVt6vi7zglWf6Rt/ux5dCamWTu/snzgEYGH/WR8oR+Yc4FQuseWxJlRzEj9p8sre9yzopeMErJ/A0XJ+kY2jJp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782188119; c=relaxed/simple;
	bh=O7Y48YRO5aVUCS/IMnOyiolPPGBU+gZtv8JXrTlrCxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k7+M8VTE3H35F+Rb9Wm/0oIX+E0Z4XA54xSCizbMLen1lGVHOWSqUD5jIliu8XetSEfJKjZZGVefc2Q5abeErP6gVa0JU1JtCzkuz1m7TWfcuPS8OR67XFwSO9Z2I6AHuHvNbhvzH2ZCzKiyD1pJZkD1akSleFvR+AAnqEWiDvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iCxlMcLd; arc=fail smtp.client-ip=40.107.159.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iCxlMcLd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uibf8YqfT3XJpnSU8Lm69FAiveiusoS7TetKYcreGnFywu9+F1oHGKB5xbSnmVrqNNaBYlDt5rukNawdlShNJXUcVaXkHkeExnBy+OXm5WSd20za180VAg0InvMk+CEtjR7YMs3jN7JP77e028ua/lPffP8+jJ9k4+jmXBDsFDCIMhV2QQwUETCHiQse6yOe5+BESVW2TwASvw4hTtPvKnM5p6RIneM2e7ttTyjdLQquWLDuFGhYFqNmO1bbJyWoe7lFNAfgKIPaJJ4tH3kqlwxuFMcR/26Q5QXRv1TyQs1Wd1vBYCLhFUJkt+7YdIe8lBFy1+XCL2Edyii0QFTiwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQn4JSUsMF4E8X+fw9jUor2hCz+i6RQjvK8cr4LrAGM=;
 b=OfuxxIF7NeAIDfOW0F6cLxnevjJ90l7jnIUSW1Fb3ngIdDNz50WzcT8I6Bi4K0CeYVo05ajOmTBfJnViw7cNYu4mhjFL3Ro446t3QgJ/TxqxhWQrYTXZYfarB2zxqe/t6biyypNxURlGI4H44BUB1YKRdgBXE2+iDZmCouEF7SSfEPPqa9fUJ4UanLu+TKtfh2VLqQ3Pcjk4M+RhxDCR/RmE6o2pNDDUHHKh7SlzsFRTeB34EbT42e7DfPkUp9pApwIVjW2Bb7/E8/LOpLGEqqgFBP5fGYGNN+Yl55t67CNrU7aDE4Yygc0MYtmJaAskyE+kHDxbZGlRop1IYB39Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQn4JSUsMF4E8X+fw9jUor2hCz+i6RQjvK8cr4LrAGM=;
 b=iCxlMcLd0yLoGCeDQJo3SV8Zyn4ZPfKz/eiHefCKvYz15/LWQgy0Im1tAzlATUHCRUolMh9p3wue83fOmal9cY9vSh9+7W5zCErPOBG71SSh3gfSPRBBrffdkdrllyvr6J7aq6I+nF3o4jX2ZdFF5y4W+NlRZfWpbqQhqP2ui5KGqz0OL3mQwykpykpXHYHOyNV9y5kwD2IIDuA8MUXvFuJuRUtQ00CU4+aoLukHWjhUf1JT7zcJzAvmXSrXr8A1mTd+MbsNGy4d+EJqCrMmIYdMGI6l8efX9dnR3fhkBuuTvsXKQhifaLDKajFx3La3uwPWOZnv2yRi4fn3jeqsuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by VE1PR04MB7343.eurprd04.prod.outlook.com (2603:10a6:800:1a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Tue, 23 Jun
 2026 04:15:12 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0139.009; Tue, 23 Jun 2026
 04:15:11 +0000
Date: Tue, 23 Jun 2026 12:18:30 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Frieder Schrempf <frieder@fris.de>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: nvmem: imx-ocotp: Add support for
 secure-enclave
Message-ID: <ajoJFt6c1cKELlH6@shlinux89>
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
 <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-1-cb7f3698c3e6@kontron.de>
 <20260617-prodigious-private-inchworm-beae1e@quoll>
 <085262ba-32e5-4011-8df3-5a677575b2db@kontron.de>
 <ajlDU6FVl8XIjCWW@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajlDU6FVl8XIjCWW@SMW015318>
X-ClientProxiedBy: MA0P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|VE1PR04MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: 6652c927-3b0e-427a-458a-08ded0de04d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|19092799006|23010399003|366016|11063799006|4143699003|3023799007|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ybpfsv2sy7oRPKactDh33s2YGm3yuzT/wnV8bq3/M3SW0p6ssTKImU1p3BKjB0GVP2LioeZR1bZVxIRRGsq1imuxpWGNd4h/lFnJGc55OlkLyhBzRrOu8KKhdfHMk/lp2+MfLezwDefjn7fxKMIt0xerLTRiQCv6ll5lWAvj98QKgjRqWCQ+bAvbMXdJUqL1yo/49Njy2Q76XbDDUuqJYRZRH5MCtjA+y9+DvGYz4n+uMfDj6kL3OM1gpLEpxGv+qyRxC3AXa5D4s9lp89s8z1T50rKY3uZnh9IwCzuruI7SZoLBipfdVWihVrw75GZh3zxR7/QWsDidjfVikJ4iEuPKvChIYzsGVCoNiRAKSdodMZF5W4waPDgKuKDmSYbm+V3QchoCW1sLA7U0XYOSYLtrujvrVewY6B65md3ilhodJ1ixFiQNf9u+XJZwrmqvV4lQjH8Bv+MSZZAPyAzLC0aOrCuu5T/VpxmheRImXnhkMrMD4p0OemJjU7vHfY5u3YxaRRIbmzeKnnk05PybjvVvKIXItKJRcEJWgNKCn1riNJkFIuPS4fCLc5vmGBoxzvgEBPFLHIe+UYrCpyIGcAkjKsY+zu2VaBlNpBOPg2ypBxvACtHkdaFOrghdRX4OGRnnbfRgaAfu7Ju/cMfjfLss7RDvOVlff8UkQnJKhaw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(23010399003)(366016)(11063799006)(4143699003)(3023799007)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NmcuIadoa/u7qVjMRkPmbVbnvzbqvgINSL3tedkGIVk5fCOpKO77Lfycf2bz?=
 =?us-ascii?Q?YYxZMQd9bE7G0U+Pp2g2YAJpbFZ2KmNvtUDuspPYjI/TBih6NEPxBEgkT3+J?=
 =?us-ascii?Q?OrBLXLfH7csKNmv0OOheWKe/4/+zKajTor8PwxCFKBjufM/DabbXsgbFfWck?=
 =?us-ascii?Q?cwOjvJQiczLxBFEazk2zNWbtwaMoS0JQ0QkXNCKAlvsQe+NzfSjGjUp886QA?=
 =?us-ascii?Q?uMvz7snGhTnDvvLwB/8+mpS9n8vmjV2HGnR82n1Oc0AUmDgthcTatXb3aAia?=
 =?us-ascii?Q?oyvEe19eKEtD02nNmBp7jln6pOYs0GuDd7a3IXO9QB43LpL0spcFu+C87Zjt?=
 =?us-ascii?Q?MhrGWgdtX7zhBZTImB2q0vbFvyvGoCDhNkPU4eJKrGRfgN76qS8UH3lG1j3D?=
 =?us-ascii?Q?iRTsU1EjVLFD2pqYLMYUqUQqMpDugEPsRg5HkZe3VxB/e48cyhK5MIWl4Di5?=
 =?us-ascii?Q?PbANLdAYxNfH88Nx52Q7QwP4kjFwiK/wqhH9p31FTebgBZcTC3gBLtG2c0WB?=
 =?us-ascii?Q?2X2TMpGbRmliqnyzFVlKcYzxRPAFecD1HkW1ZCgZL/iWvhKIQkYt4a94hriY?=
 =?us-ascii?Q?IBNOOjoWfTS9OCqwUbOktpslu+WNXWM4VDkSNPkhmh0ZSNtdnkiycIRw0wjz?=
 =?us-ascii?Q?hzaeGXsAM87Q2UCoP6Z5/UXtkwJGcMQG1J+uTblB85C8yjujqxceiVEk7UVz?=
 =?us-ascii?Q?DmdFP7kMjRbETSAoyMZtQ2jUmckL0l5p3hU6Qb+3FbRpbMWf565n7MdDi5hK?=
 =?us-ascii?Q?HXnn9XqrsholDNrax16IyThPKfrIugfa4iad8eAwvm/HR2FWyF6j3g5VawJb?=
 =?us-ascii?Q?5BmsDEteifKsxy1MjRdDMwkQdCE6yLi42bF/11HAvpruikVMaRXDfxLyJb44?=
 =?us-ascii?Q?ZzEXe/t5cRGLErbnh2NRG4TKx1OT3sqAO/lkz6Y1pE91yVtbh8woowGJGvVB?=
 =?us-ascii?Q?3uxLMgKu8+TqrReAWOYmBChabPDM3CQa/zDsuA3v2+r/hfAv68eJY5MUmFuF?=
 =?us-ascii?Q?+4HLFVszLJ8PfYjLaJvcjkWOCnfbvcGcSBpd9I4QSQoIuOnFRtmXnoZwL8LD?=
 =?us-ascii?Q?ZkjffYCa+FBIBxZu2c2NFcqnzFkJORmNn7V5zvMZ0usS8H+4rP0yx8fNFb6o?=
 =?us-ascii?Q?5QILE3CxjZmJ5uZ42b6qJOeeA26M7BYT1G/WM4PUvGIecnUE4Y7Q+TtTEQec?=
 =?us-ascii?Q?wjsQgy+QK6XTLO7QsIiTHBE1EDEEA2O4rWqwqELBQkSt7buZxKiUZ8DyXrXP?=
 =?us-ascii?Q?1AvnWfioEc+Kbs5YhFJc4vOOhREyxLsEevMU61NILVlG6DOe5PI8VwB3KtQ+?=
 =?us-ascii?Q?0hyYx2yTLfdTttYdErJcOsKNQf2rnKk1wRd+0kvhoSxuV0GlIgGLzMh9Jql+?=
 =?us-ascii?Q?VPyi7hHpqASjR1i25rIk4E7ljNb88Wpsuil7/XvXhW+ywi9aVYnLKM/SUZDD?=
 =?us-ascii?Q?6VOODknATAziXa3R19UeQ7Ld0dFwOjrawMl90n1MFGZc1SBuWk1WdUor5QyQ?=
 =?us-ascii?Q?y3Sr++reV/sfDhbTKThk8IZnI3f7Kr7PAZ9qWDyHuZMSo/h2I4+Eljj5GPBG?=
 =?us-ascii?Q?/Hb5v5F5Rc/tRQ84ZrAKmOoLs1N9sBcM2q29pPIgdRKsIOZjjcv/dKznNphV?=
 =?us-ascii?Q?RZ9SzJDH3n5OXMzsbYZzeva1qPip+nXTn78s4fv7XlOpF91NMyGHHUTpJ1Wl?=
 =?us-ascii?Q?8/FhQ8MQ6XpmfJt7mKrQDZTIz+ZBhkyDrBhoGKG7kT2NIJkQ7ow7GlExD/L1?=
 =?us-ascii?Q?8lf+zve/S8/amoxOGvnOAdHU7hhaOWNH1gIaUprt6ky2xXKjPkM+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6652c927-3b0e-427a-458a-08ded0de04d0
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 04:15:11.8042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kO2JQVOg7SUbthXRB7rr35+vfKG2TUx39kBPEYEJwOoKSfybR0q9Ym4dZKQ9aNjAEep480CvaaIH5kOJxHXlhUM/1ocXIaU6UR9ncPIII3zqPQbYxfrYufUQ5SmmDVD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7343

On Mon, Jun 22, 2026 at 09:14:43AM -0500, Frank Li wrote:
>On Wed, Jun 17, 2026 at 01:36:30PM +0200, Frieder Schrempf wrote:
>> On 17.06.26 12:49, Krzysztof Kozlowski wrote:
>> > On Tue, Jun 16, 2026 at 01:52:16PM +0200, Frieder Schrempf wrote:
>> >> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>> >>
>> >> Some SoCs like the i.MX9 family allow full access to the fuses only
>> >> through the secure enclave firmware API. Add a property to reference
>> >> the secure enclave node and let the driver use the API.
>> >>
>> >> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> >> ---
>> >>  Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml | 4 ++++
>> >>  1 file changed, 4 insertions(+)
>> >>
>> >> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
>> >> index a8076d0e2737..14a6429f4a4c 100644
>> >> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
>> >> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
>> >> @@ -53,6 +53,10 @@ properties:
>> >>    reg:
>> >>      maxItems: 1
>> >>
>> >> +  secure-enclave:
>> >> +    $ref: /schemas/types.yaml#/definitions/phandle
>> >> +    description: A phandle to the secure enclave node
>> >
>> > Two things here:
>> > 1. Here you describe what for is that phandle, how it is used by the
>> > hardware. Currently the description repeats the property name and type,
>> > so not much useful.
>>
>> Ok, agree.
>>
>> >
>> > 2. If you access OTP via firmware, then this is completely different
>> > interface than MMIO, thus:
>> > A. reg is not appropriate
>> > B. Device is very different thus it has different compatible and I even
>> > claim should be in different binding. Devices having completely
>> > different SW interface should not be in the same binding, at least
>> > usually.
>> >
>> > If any of above is not accurate, then your commit msg should answer why
>> > and give some background.
>>
>> Thanks for the feedback!
>>
>> The driver currently uses the limited MMIO (FSB) interface to access the
>> OTPs. The intention is to support the firmware interface alongside the
>> MMIO interface so the driver can pick the interface that is available
>> (firmware might not be loaded) and fallback to MMIO.
>
>Does ELE and MMIO access the same bank of fuse? If access the same bank,

Some fuse banks are only accessible through ELE firmware. Some fuse banks
are accessible using MMIO. In theory, ELE firmware are able to access all
fuse banks.

Regards
Peng

>why not always use MMIO. Any beneafit from ELE firmware?

>
>Frank
>>
>> Following your argument would mean a driver deciding by itself which
>> interface to use at runtime is not something we want to have in general,
>> right?
>>
>> In turn this would mean we need two drivers, or at least two
>> compatibles/bindings for something that is effectively the same hardware.
>>
>> Actually, my first RFC approach [1] was to create a separate driver. But
>> in the end it seemed very weird to have two drivers and two DT nodes for
>> the same hardware block. Also I have no idea what happens if both
>> interfaces are used at the same time.
>>
>> The other idea from back then was to replace the MMIO (FSB) interface
>> with ELE, but this would mean that we rely on the proprietary ELE
>> firmware to be available for simple things like reading a MAC address,
>> which is not desirable either, I guess.
>>
>> In which direction should I move on with this?
>>
>> [1]
>> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250416142715.1042363-1-frieder@fris.de/
>>
