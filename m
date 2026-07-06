Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011037.outbound.protection.outlook.com [40.107.130.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8855541F7C6
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 12:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341083; cv=fail; b=WzdQIPznRCfryW0R3Q0TEZWQaMMnrZ8zqEDFmuMOmuoUr5iYd87wAkGdqhLGSUo6cMfDPvg+AFZra9i7j3XkuQJPhiN8kaLe4GCiFrt3TV14C1IMpj7R/332jqJgE6rfXKwwhxlWzdq16TV9spvB6WARAsNa+H5Z7LqQ57HbWP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341083; c=relaxed/simple;
	bh=GaILtUVzHPplq5AwISwVqwsH7pvQAp1rpEk0jwGvtdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Oc9L004LXisSR/pAxy3QwtSxMOIeEVbLfNYClqd5sBOVx+2rBtKi9tVx5dWL2tSma4HQWJXIoA1zt+YXOdTFtM/WztB8br+5TFKKDFd8WEnaUoJfmuznKs7v6oIN2XQZqXqJvNXcny9hegwB16+KoDViWk5J3nwzhTXQRBUjb+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VEprhIeq; arc=fail smtp.client-ip=40.107.130.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VEprhIeq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A67J2UcFqDKVfCkzpgMAMs2efMeC+nedBZvfKWNOIMAQCv5upPVBlGUdD0juYm0BOQzZGu/tJcdwSrEev9prkCBwurdIjDjxWzRXmUvxNeVlsNO80gWQ2tqWilsGAvENHiYr4s/XIbA+TAh1fAEHkVJGH4qQ5mPixtIwt4QrXQXanJr7DU60B5ImsvUyVcNuXhJU7+VyYXXGpXRjZDv8TjUMc2+ULdDa0aSY4k6kvClq8Tb1RLyEP/qqoKL6Ra2HZnuWf6H7sgFMrlw/Zx8tyH8RRrKKSIsQudBZI2+7xHVWH3FJc9lOVm6Vz36Mpzzl/ymu/ljUy3hN1RInBuwiJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GaILtUVzHPplq5AwISwVqwsH7pvQAp1rpEk0jwGvtdo=;
 b=JU6ngDi2z3+k0M9/Cby7nX2iRN1OoXDQNNlCT4YZAMl2SY5akQHUXXzWJ7KYPfz6Mr1A55dFA1M0YkVRktf8U3iJteYiWio8trEJ/qKU2t/X+Y5ilKIAS9VFsC+6vuT+nch9cf7lTJu8OaaXSWtIf9QAXbMry8pJX1EEn6g7T/7rIrgD0DZC3v16MTrbt6OPXX/V/81wZRnRAiwNSYtUmNtheweR9XIOy2Ndi3jBvNt2oEanGPmOVGg/XS594b5Nu/5Ww6k5Oo+nZlvmIFRBkIA49MBfzpsXVX8VjeqLwmkbKLzeKMoFT0IHZWzQA3DbdhVKLdpt/KyffGHBzI9DmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaILtUVzHPplq5AwISwVqwsH7pvQAp1rpEk0jwGvtdo=;
 b=VEprhIeq/nYjEqoYOpFj+FwOy77LAgDoSaD9ozJP8+n+8yx4gCCxf3ipDn2+tGZlUkJqxWQMw37A6k7u4RcyjxSGLNmBUhkwsGVIZPVIga2Ton/3VpcHmNcIcD8pHNUApVG/1/E4RaD4/xkx2C0KwQWTo11BioZI+BIuRsH7QQWboiTmoaoQQo9ZKyoplgxDrp6qP/7YNxpzZfEXe7oJ3h8ClNje3Qm1nt9sqd8LItJsZGfc/qutGtIQ0K4HHx8Lq33d9ePjPfeSOILx1rwveauvI/n1X+tiTxIM7gFFIdA9KlVqjlb21KlvpjW+Cw4l7FEogcFijd84B+419ekJdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA1PR04MB10700.eurprd04.prod.outlook.com (2603:10a6:102:48e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 12:31:18 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 12:31:18 +0000
Date: Mon, 6 Jul 2026 20:34:46 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 08/15] arm64: dts: freescale: imx8mn-var-som: drop
 duplicate USB OTG node
Message-ID: <akug5qstBUosK+B+@shlinux89>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <c9696914817c7e9290de7c1d9f588632e700f478.1783330236.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9696914817c7e9290de7c1d9f588632e700f478.1783330236.git.stefano.r@variscite.com>
X-ClientProxiedBy: MA0PR01CA0121.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA1PR04MB10700:EE_
X-MS-Office365-Filtering-Correlation-Id: b99e3ea9-9cbf-4ebe-b427-08dedb5a7ab1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|23010399003|19092799006|1800799024|376014|6133799003|18002099003|22082099003|11063799006|5023799004|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
 p9EiPj7QlWLkgRLoSSwBieRkPHu0HM7JPB3TRD/XruClfO1qRKGptYuwTASv4REE/drMiAfGNNR11exqXBssTBwBm7yaONwBeyJ0exbfigYWhanYCrnmfUqEdKNkK7pmqoLeyEvp5ZT7QadYlu6NyBQoH1VkP90By9aB37DmmvdIRoBJpClLLey5zdgNkyXnqCbTn9YZCaTiCRhfB2US5WiOs7O1GdInY3bkbTeMHqLt/fOoieZOBDnYFGrGstf0WWmKazUCzSH5w0LTu8IAPLpHfhEUMwILDjXcppUFlZwWZ5jzYtJg01llHNnAWHM3DiwXjORloMv6kdzTxfVmI43888aWioz55NmyLNHmHN2k6FqzkeFpRu4QQgdx4xmPqThTJdISrnWv5RuFwzI7m3iMpuI+zUvhIoUdaklEixxkCcNcrJfKpYeqce+nBSSCrByiOXxBNsW2lftJmmnrkLbaTOdMK7f6WnHKM9gQynl/wVSjTAyubmQXTJjeqMHjIL1gdlv9SJcDJvsnciur4igmt+hygyUX1S1zaobHxq0qF3ihECbcTIZ1s0uIU46nusJNrcXj9G4pliUrNGxY7ni/Qdq7QPSPf2pwlN1kD6wa3/5Ic4/GSlDDbDs17Fl66zlOLaohuF1PtuWPQfkYD7gy7RJdLTHdoiuHojB7LRs=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(19092799006)(1800799024)(376014)(6133799003)(18002099003)(22082099003)(11063799006)(5023799004)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?C3r79APZfjjLSona7ph6dLyKYKQTOsN25l9gndpnaicl8IrE0oHfRmN1LmwZ?=
 =?us-ascii?Q?vvTlm6KO28u1ywwIt1U6q9SJX4Qo4jk2zjtVcNWB5qILa58K/KF2wy3SWC0Q?=
 =?us-ascii?Q?GaoNomnr4TxcNlDw2PS20L0zZgXNgdLEXjMrwEW4OIwMX2slzYo5831bcLS/?=
 =?us-ascii?Q?JQ2J7+Xf2/lTRJtWKc7xa1fxsgCk5eEM95ToRfoS6C4WB1N0lQxmuTAtf6sO?=
 =?us-ascii?Q?1sBkVpjT5n1IZuQxA3tYyOBMnB/gq9ahQzpTBbycf+OyLeSj7+CJXJBp847Y?=
 =?us-ascii?Q?fb+ZMyemw1oKi3IkSHJEd6DISIT3X0+sr2s1iJlC1dnf4BEYCg+NtepiATp6?=
 =?us-ascii?Q?zc4f4k16vEJJ8nGPCc6fJ7Zja830MRUaEZKw8tp2cezGljWjfGkLty08NPH0?=
 =?us-ascii?Q?Ikoe93zTcyIh9P7uL5As18QlKOFALHs+OFMUQP01uRRG8MvexhKOvAI4aQ+8?=
 =?us-ascii?Q?tPongGRlTy4lQ3O+dX8M6RpGHuOYXQLsTAUG0/k0ya6oJb/tQsAZb94tYv+G?=
 =?us-ascii?Q?a/8ApWbLxB6eRJ0QwPHyMwrT5q9szQIfDMFZEhLV+yrYAZf4vde2YZbG+5AE?=
 =?us-ascii?Q?guGFneX/KdXiRMk05Lu5y48iFU8OXQar05DyIRHXK+ekJF3eP5sAiEU4Ooec?=
 =?us-ascii?Q?w+X+VFvooFqJ2P/r/bb8p95a8rxiIAEW1iaEn8TFT5ddDAYG4gusZt6vZjFE?=
 =?us-ascii?Q?YciKYinXD3hW2LJVnUT99MYWUJ8cgCEqYqlCjyJjSiRbJLfq7+W2Thx54yt+?=
 =?us-ascii?Q?aJC5QPgXELYi+c+NufyCKMYZ3Ez31+1GojxVHXb3ZJOgCVNO08O9tIzgLMqv?=
 =?us-ascii?Q?2d6s0Ka0eFVLwGzL/2gaXovotFwIVJcfeXsmZOmXnrFLrpeoUJ7splbi2Zt/?=
 =?us-ascii?Q?3tsUWC7/hodKjWTjdu0THvZ2WojTDX5OlIr376lrY0LwPkA9bjyCGG8SZCZ7?=
 =?us-ascii?Q?mVBJinl5gd9Sh8/xkrUvEP7TO2pxH7McBGQPy1oVmSyzMEvLtTHWB/n6P6P5?=
 =?us-ascii?Q?VynYCn6O0hWvS2B7SOjJrVo9LikF3t16yOvb2GXh437qxnzCzrGCK6iMgx8g?=
 =?us-ascii?Q?AqD/Sye/T+Zz2nbXJ03FTZVJlTDIY3Noeh15mBhvguSqgCNlG0ewXDPQxeI3?=
 =?us-ascii?Q?Y0VcPE1Q6DEBWQJt5H+r0waLMYINpwMfZG967wRKRap4Yu+M2eyH8FYppWUb?=
 =?us-ascii?Q?DB4e0gFs9+Cupd+f0gkdaUOiINNRtxor4jdXJrmjfMf+bN9l+W0yq0Gr/g75?=
 =?us-ascii?Q?CXWbZp+LhPlLWzstkUWAH3+/RMby0Gio1VU6Cl8Ix1pvCW4+/VYvU+U936B3?=
 =?us-ascii?Q?23BibpRpkmDYLsinxt+LFsI4TWi9TgKkY9zquPALIOg1vNSNCbIOPSQbF69c?=
 =?us-ascii?Q?44sTxNe0fnMw963TKlxNlo4AeE3c78f9Ewq9gOsvyYRmQ52CMhg1eHf4INTA?=
 =?us-ascii?Q?6CjdHJPD+V13pMD/fmJVV7kPblY9YScT1GDcDirNxZtcXIfdjeWwsPTK2juI?=
 =?us-ascii?Q?asfCnnFEPjneyAbtkyMW4SRGoP30t0bvTvxoPUN7S00iEGFxnQAGICVRZcGo?=
 =?us-ascii?Q?BZ3ZYaFo4ziNtUCZLbJ8oDy4LrLQzzszUCHzzEQ0HdVjJwQJO5EcgvwVWuMt?=
 =?us-ascii?Q?+XSDwjLeen9ZCs+r3mut8WEsCRg6qFK1J3vuZA1AFDG7xOTsEkWbnlaIMoh8?=
 =?us-ascii?Q?VwiQgmqTa+Dew6ZhEN88aA1oV1hr9M7IAssml3CuHgPMDtvaS4uVWAh0o093?=
 =?us-ascii?Q?ZvSDcNW00i9pyvBNc3L1M691T2kHIjClzzIKvb2UiRMgY/a0pErf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b99e3ea9-9cbf-4ebe-b427-08dedb5a7ab1
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 12:31:18.6196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4EbYb58gZ/HIiLgTL32SkGk8T5GNe9+pEMA2ABk/5RWGS2fj/APo+snlDvcRaTy+WvEl1ePf/PHaK68EUE9yFd6xKQR2ZJ9ZlAeVQVhEq2pa8TECjqh6/x5GS4anqWZr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10700

On Mon, Jul 06, 2026 at 11:34:38AM +0200, Stefano Radaelli wrote:
>From: Stefano Radaelli <stefano.r@variscite.com>
>
>The VAR-SOM-MX8MN module does not provide an onboard USB connector.
>
>The complete USB OTG description, including the Type-C role switch
>configuration, is already provided by the Symphony carrier board device
>tree. Remove the duplicate USB OTG node from the SOM dtsi to avoid
>describing the same hardware in two places.
>
>Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
>---

Reviewed-by: Peng Fan <peng.fan@nxp.com>
