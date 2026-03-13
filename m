Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013066.outbound.protection.outlook.com [52.101.72.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93CF1DDC28
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 16:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773419618; cv=fail; b=B91GvdmoZiUDGJah9hr61byx6F92nTL4LIVWiaj41pxSCtX/P+KQS/rpRRoZq9UX38w8PJW9+0DcEAx/LjZ/CPlhL/VNBhzNVfYwHY/59Vu/Z2x5+JWWrwQB7dmyeFlFd6L2d9SqqtQZQS36KEvmRghJbawITeYqUi5MjvRvzNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773419618; c=relaxed/simple;
	bh=K/vVY18A3mn1p37TSG1sdGjtx3fLaOH8r5YKVVJJeH0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=ob2UnYGlgt/FXoGG8LqqomY0I+paTfWaS1FUx2O+jPmqBbIyw69mrPfD9vYhMvCo0bgtySxSZk5wmrzdiQD2aK3D7sJ7ZWXD+JPecUUuJ3OHK8iVZ+dsdMlkgPejKKuc6JXoIjwSB7x4qcmMZvU17aLnKhn3+BsqruQn3MgXQwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LKKcWloZ; arc=fail smtp.client-ip=52.101.72.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LKKcWloZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHXXio8oqfiPbyTZEohW4iLPr6d2cR7ipWu2cW5KAj/KoQLNM59nj3IYBQOj6KW3iL+hIha7eJTSWrEa22Aou2Tb0OFFfLoNWUeDJXY62h84BgANqKswn1lpEMiN3G/sUYPiNAs6vp70fiCpmcerXOaKh2TurzYSppIlBz2EzGikUmuGjh//w/ARnnpIuUI+eKpDmZXu0lWaX7JPBzOSIJG/EJvCXF+upob9+Aqhy9BEMOFVilq8/31+AHxpZ7WMm8fUhI9vB9ptwHh7LbeEDCghy1wj3EhSsnoQfhTEg8b6yLrMN7e+LkD2bc0p3EhltL8UPr4lZzteFMLqo1Y5Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFUnciPSh/c4//pNwqANKlwCc1ovVn1de14fhxu2v0U=;
 b=kK6YihzFKos2zhrmqoLVnNPtNLgARs//XG9grQ0J5NoZ/PrPhFsWv9DpABhgfbY1LTjDaCFO83DWCXhZg6Zz/AomESHHzvfnX9ey0KdyUGDWAzusQyl0uxxNDgosrmSCapPtojeU9lRbdP5HzkXxcaMXjDUiHnnblYL8Q6VeK6JNDl8r6+3dyTq9TL9mbHfiT1RAKPW/cUgChr61UUhfsWWOleGbre9/OGAAKXNBcQZeT1CWsd2XNiNDg6eNGxTWRnGQGC7p6Fh0Ps839bDIZyb1iEoKjtwQrM32ly9hJx+eHjpGjC8OfJNfk0I0/nOMIxuzWf3lz2KGI+ahgt0J4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFUnciPSh/c4//pNwqANKlwCc1ovVn1de14fhxu2v0U=;
 b=LKKcWloZe6xaZGtTMNeKQm/egp4f7dXPtVHynDYVGn0Hausg74RW1DjD9ylbad0/8PKqCX+45SDoWFcYJcqigDqpax2LKsar5NqSE9BdYIQn425NupBI/VqiA04wEbz7+IZARBGJDsXIPYafydkFtlLoRkmrG2t9dPBJG6snqu2XwOkkduZkHEU6Ryqv9LOorfuyO/6sgyOFnxGGtx5einUkOdDLYm6KKvXoEojqWd4LgshT9fsdrpc6Al6An24dgjDVedS5mqxUT2QYEnwrM0rdMAZuowMHeWezsnPgGNaDIR2P79FE/nWBjJo4ZHAPp3ye8qyY+p2TbQOT/SVuFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Fri, 13 Mar
 2026 16:33:19 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 16:33:31 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, 
 Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, 
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>, 
 Eric Chanudet <echanude@redhat.com>
In-Reply-To: <20260311081154.381881-1-ciprianmarian.costea@oss.nxp.com>
References: <20260311081154.381881-1-ciprianmarian.costea@oss.nxp.com>
Subject: Re: (subset) [PATCH v6 0/5] arm64: Add initial support for NXP
 S32N79 SoC
Message-Id: <177341960983.122442.2667579002982756339.b4-ty@nxp.com>
Date: Fri, 13 Mar 2026 12:33:29 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SJ2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a03:505::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8585:EE_
X-MS-Office365-Filtering-Correlation-Id: c41ad634-3232-4c24-9429-08de811e435e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|376014|7416014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+okZ1XSlPR+8GBhZxD5inglMZipELAaykAqw6TwJgulyVVnuDwZNpM7lukcBMFIvsD1UYpCKXg6dbBsn7rsy9thSCOsmEH7X8FbVld3ndRaPr6p/01m/FmdupP99ppobZj7qNsKw0+ey0+0PyQ0o8i85mvh0nH69f5KRfGWSt6zWwRL2WBXSf8uzsABTNVd/PhVgoAEof3oQQdkL5ymLmDmW2pzKWIN7X9pj4eEcxpo8trs2f2NVIZKiPtr1u+PHIM3sKQFrxg7jKwr9arUPX4alGTWSK4oENs52Sc46eICtQ9/lEFspD3boXLhu6sl2MkkMJfV8Fp7C6r1SY0mOry1IE4pn27v2T0oqQRX377I4i7GnJPCOjd0i7mIvo6aqyEdXdeyHx1Cb7w3n+oookGlpdO9mt6o4zdC+STZRH/652OVgd+zhRieHTG8YiqfjE7uLVYlA8jpowLGVDjUA9SrAjeZSX8gjLmK4mYFkTdZbpKOQ2IYwXauBQ1Tofi9fGqRMsVWw+8yN3+U2BY6CiFSCPtcURdRvQVp5g1fDJ27oph8EFojDqxs4gC8hNFf4/7GeV8GNcMLcMDvrMi+5DISkcOcigfkSxHReGyG+toUjB5QRMdIYFz5TP8lN3EZf9Nj6v7WX1NGJOb6F9gnmzZ/D1eDo9ZdAmIjY1hd0qniMzTL3lLxNUupJlbhUcmWgpVxk9ICQ9O7veFR94j6WaMZrZC0rcKBDX7gabx3e09NfHDyweqLd0VlK9wiyNaqmoYPrPAwf02fkoOGK3ZZwHWNmJi91olF7SpyyqU33lY0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emlGOW1JVjBkQWJvQ3JhWkdWVWVLb3ZjSXBTOXRVN1BWTnhFQmNvRGNYcXJO?=
 =?utf-8?B?N0xNeUVvNG9BTThVYUdJTG13VWlCYWxMUjIzbGZaWkwvYm5rUldySG5mbnNa?=
 =?utf-8?B?Y0RKWXN6czFKd0pTN0hPQzhhWHVQWThlS1ZzQ0NkSmZ5cU9zRVo4UjJqYlpQ?=
 =?utf-8?B?U0RBZUhqaTBlMmZpdm5EMXEyWWFseU5UME9HZXYwVnBTdnE5RTd4WmZNODk4?=
 =?utf-8?B?VDVjMnh6aFMvemlvL1RGNmhIQjA1NzFwbHpOS3pVRVdyVXgvZ3pNaTNIWGtH?=
 =?utf-8?B?bFZJM3Z4RXJ2aEtHVTE0NDEvYXpTckxkL1BQQmgyN2NsK2VEZ1VwVEZOd3lU?=
 =?utf-8?B?MHByZ1lxYkx0ZDlyY2RZYjJtVnQyaldXZWQ0RUdFSTIyc3dUOUFnZU5BMU5P?=
 =?utf-8?B?UC9uMnR5eTlmK25ER09uOU9SV3BGa0JOVjhwZlE4ZGltVHFnQ0pGTEFRZlpa?=
 =?utf-8?B?Q294MFo0NjFRdm5BRkdYQ2ovWDVoeFNPSHpkc0xMWnVKLytFajdJa3RHQmRp?=
 =?utf-8?B?bWdSV3lvVmJMbjlwMHo3aXBnL1NYVmpjTDN5RDZUNlRxcG1KbjJOb0ZLMW1a?=
 =?utf-8?B?VVdFMndNL3FwYUloZDh5cXpQRDRDcFNiRW9lL3pPS0hZZUNSZmo5OU1vc0pu?=
 =?utf-8?B?ZVgxNTV2M1BUL2hpZ1ZGdkFjbUdaeVdVaWJPZExCck1YaUpFQnpWMlhjRSty?=
 =?utf-8?B?REtDMzNuTmxUQnQxMm5PcGQrZUtURG9ickpyZWlwd1l4Z0E3UTl6SFZQSlZr?=
 =?utf-8?B?Q1FzN0hhdGd6RUliY2QrdVplR3FkK1liL0F2V3lvc0daeTJqUVBvbDF4ekU0?=
 =?utf-8?B?Ui9Oa3lZT2VzWEZQRkV0emVqVzduV1owekpoWEtWdXY1WXorYWw5emJiWnpq?=
 =?utf-8?B?bHJSN0Fibk5Ea094SGYxNWU2Y2dBeDBKWlRIWmJHMGNuYllPbWxWUDJQc212?=
 =?utf-8?B?R28xZTVQbXg1YzQxdjdDTTJ4WjdRYWMzdjNieDMxK0VGb1ZaaHpuNnNpZm1t?=
 =?utf-8?B?N3RPMllQbXhvb3RKeDJ5eFA1V3R2WWgwZXBsRzRSak4yZ2JoYTlYQmFBZC9m?=
 =?utf-8?B?OHFUcUZOOGtsQmRpUkdpcy84UFNlNWw2enorUW9LM2VudnU4ekhWMlRVSWJa?=
 =?utf-8?B?YTdKUlR3eG13RjJOTDEzY1QyN1g0SmN4dlJ4WlJWMXgvQWpicXJrM2llVkVa?=
 =?utf-8?B?a1ZVbVBkVzFZMmhhTGVHMW91QVJuNlJodzFTOVF5WUhUeHZFUVRXc0w0QzNm?=
 =?utf-8?B?RG1hMk5aaGl6SnZnNE03NE10MmxOVUZHL2NYYXZJMkczaFpaUHlQUC9kb2k4?=
 =?utf-8?B?ZHkyYzFkOFBZS2N2cGs2TkdxcCt1eHlrNld4Zk1CSkZHcmNUc2ZkNVdsaW1P?=
 =?utf-8?B?cVpnSzhCbTBHOUNSdjFPUjVXNU1pZ0RYY0dPNVF4eVpUMy81OUdqazhDa2FH?=
 =?utf-8?B?bEJjd0VHeWhZaHVQc3BUUldBeUlVMlErRk9reXZNdWQ2blpjaG1hQk1kaHlJ?=
 =?utf-8?B?d0lZdG80Y3BYOWYxMnQzZ3Q2WWgvVUtGbmxOclJabTBmbjZqT0JwcWJlRHVE?=
 =?utf-8?B?WEVJVUswVjIvWXI1QnRFb1dwWnBTUi9LOEc1Ty80SUVTQWZvM0pVVW5CNnRj?=
 =?utf-8?B?WnN5ZS94b2lZMlZzV1JxZE1oQjlaMlZMWFBXT0dJaFdnOUNQUnRVMWQ0cXJQ?=
 =?utf-8?B?bzhmaW4rQ3l4QWFOZkp1WEJVMXN3aU5pVlJ0U2dUeWJRTWl6bCtBM3h3aCsz?=
 =?utf-8?B?WitJMDl2WVdiQVJTbTI1YzBacVM4TEhhTlhZUHpoSmtGWDU0aTNSMzdVVUVD?=
 =?utf-8?B?ekh0dkszNkV3clA4a2RhOFQ5T0dYeTN6aDQzVFh3cDZuWUwyMCtYZUFtS1Qr?=
 =?utf-8?B?Wjk0TjV6MkltZ3h5MkZaUG9nUUx3RFh5czFYWENuZ1VseEdnQitWbnUvcUEy?=
 =?utf-8?B?dGt4Y3VKZjc3OUtGeHFhMnQzZ2Y1N1k1TC9RUStmeDdDS0p2NWJTR1NpWnhH?=
 =?utf-8?B?dkkxNEtCcFlXMVVRUEMzMmcrazR6bERYYVNVTWxsQ1ZQZi85eHQ5WFdwdXpt?=
 =?utf-8?B?N0dNbDc4UVdUdVNTN3BSb3FHcXAvRDNUYUJKaUJYSEVuRlJWU01VU1puYVFr?=
 =?utf-8?B?dlpxM1dZTDN3RkJaUzI2VTBlWjhmNStPOHhXcXlmaHVHNFNUY25Mbm5yYzRx?=
 =?utf-8?B?b29Ja3FZQm1CVDdudXlRSkZHdktSWEUyeGw0YmpFRGxZSnFCWUdaMVZoMCth?=
 =?utf-8?B?bmxnTU1DVGY5MVJoMllkYzQ5UGFMZjJzSEx3eGZUVnNOejNrdVoybVBTQXJx?=
 =?utf-8?Q?e4CbDzfOtmxe2LfV0G?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c41ad634-3232-4c24-9429-08de811e435e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:33:31.3712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vYgEvsii0r06KWj/tP4bvXgaBMr0v+nhKYEa0+skuglYy+dZRxZ+1yAZvF8S08HPL8p0W1SHK0IZ6qLNCjUekQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8585


On Wed, 11 Mar 2026 09:11:49 +0100, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> This series introduces initial device tree support for the NXP S32N79
> automotive SoC and its Reference Design Board (RDB).
> 
> The S32N79 is an automotive-grade system-on-chip featuring eight Arm
> Cortex-A78AE cores organized in four dual-core clusters. It is designed
> for high-performance networking and gateway applications vehicle
> architectures [1]
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: interrupt-controller: fsl,irqsteer: add S32N79 support
      commit: 0c8fb9a7a1004b13adb921c637f06a7b9c2d0806
[2/5] dt-bindings: arm: fsl: Add NXP S32N79 SoC and RDB board
      commit: 14233f267406e6b991923a11e8eda2857a8ec948

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

