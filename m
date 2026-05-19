Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011060.outbound.protection.outlook.com [40.107.130.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCCE3DD504
	for <imx@lists.linux.dev>; Tue, 19 May 2026 21:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779225511; cv=fail; b=X5XUDERdQq9QgdiVImusUwljaDlyU2iqkZizrTpJEOVsUDLDQ+6JGWjw3nwWEVQMubuBf/+t8pGwM0lICmTlYJW2TPFD4Syg1ZXG/V356DfrxEdw+XqOUIR9h3Fj6vNps+ckpV8vTjxfK9ttip7M/1jCo9Tcl5AS+ukiTVznppk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779225511; c=relaxed/simple;
	bh=CCyKyY8dPNCqiRcD37zRx7I4lSvgvFzSBiB18DXfYZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H6FKB/XB0nC8wTMRlJG1H1r4QyzoPePL5MNJlfIRt1zTLUPw/8xfeBmg6YRP3TvyfQD9ZfaEaMf69sGwKhEasaiczMpK3ofYoFRmEth6na7QvFTir9LEju05bda6AoPBHGKtXDQ+1THU7Si6WQT/1bHmfJTwu/wRW8We3JNkARY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WusXRoQi; arc=fail smtp.client-ip=40.107.130.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WusXRoQi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJ3WnsguAQm331xdTwyrGG6UZs9sJrxH0QcyMGBWIJkJuST9O7Wnog5dF74ZxlJ9mNJYXyF1nq2TZm2dFOsWFUOw4hATsUh7wJ1GLYf7xvfDEO0FhD7ALGz9H/DNGko+yP7IhyKr0eHL61rrl23E2LPcwAvTv5RiaRbK7nQRhTdO5HZ+Mfb80ApE8v8DoGKMQSop2DjO1uw9u5IE5JlojF6+j7wNXGcUOYU064hXPr4x3aPaaE4uZV12TR5FU3HHZK5VNpaqYkRKm5v9DHjhzDMom/1/lcmLgmIRFTnnh5kmN4ro8ioeE6myzS+j5lXUMJwhwJYqaKPlC3NLot/2ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQuJpJaojP8QoNznDYUMwJHcjrNPOXnjpKVs+Zf6AHc=;
 b=dSomOtXN/0xaF52nVyf4FuQN8RFIP72ZxNj2giBdoE8yvLoHXEuRhSjbBRzLfVgZ8YuZL6vBAeJBAqRnMkc1nsbMMY6I++E/TtjT+96oUmGaS7eVl91mi9tQhqb0o2kgPfh47eE1H7BJltN3dC5RyaqpsogiUI4Gn457NEYsDD0Kf3Z5WnRAAWINZmKq4pPiU3NxVnpcRFiE9mcUD/RUMhrtMxDzEAcZYMr+21GthXKm8a+jen8u559i+t4WEoqkI7jlix1H2cwG+ix5/Sa2i/fxMV4RxreISpljeLp04D6KqL4j+HyimR15vhKe/032Eo6ml6hIAz2M8o1p1CqYyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQuJpJaojP8QoNznDYUMwJHcjrNPOXnjpKVs+Zf6AHc=;
 b=WusXRoQi5muct9/8BHt4RT7s8vl5RUIds/ROoiIwF5g9V9KDEzLwH+XPFsryIQpq2j6LvYzmTPIvUEU7pqHqRWz7NzS3/2bOdHmrU6mBUjTNsQXufARaHYX8mrfSNMwzMSAp6jrFLHov5YgX6eW9RbusGQSNJ3vizayd4VYJf1L65rGOgnHCGLGbV/3BEShzvONOeDKHu+xCk7H1VEhDo5dKEGRLH5gshRR1iZ9njv9+gnwFLLieyzIInkVHWXnhaa8cKbhpWmpxgcbKi5FRw4sUhXTzQm3m4IpG/wByPbezmvEPFu/qcVOzP3kUT+N5XdybzO+1AKRQRB3/VIQHNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BESPR04MB12564.eurprd04.prod.outlook.com (2603:10a6:b10:101::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 21:18:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 21:18:25 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Antoine Gouby <antoine.gouby@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Antoine Gouby <antoine.gouby@toradex.com>
Subject: Re: [PATCH] arm64: dts: freescale: imx95-toradex-smarc: replace deprecated gpio property
Date: Tue, 19 May 2026 17:18:18 -0400
Message-ID: <177922546724.3325441.3811377585257660736.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508-replace-gpio-property-v1-1-ec67cc64e576@toradex.com>
References: <20260508-replace-gpio-property-v1-1-ec67cc64e576@toradex.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0148.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BESPR04MB12564:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f84f84d-7c9e-42ea-fecf-08deb5ec2a1c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|7416014|11063799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 4iLc9VoNJxGm28vksaq/4a5jbWzlIT5Tz9TbfflR6jhQNW/w6xBdxZJgNbhA9MrqVRrkSDcl3KwzHftJHxWRzUVHw/5C44ipVPANlEbRN2qcUgwoc0SIN6rYqAbqE1CEZpC6sUM0jRgu6ouTI/m3KIz76KZJWLpdSLkmQcsufM780CVCF+Rx3rst4MHiPiCQ0W2Agp46B5fh/8ux2fVqjmEdg+BZMqehy8dc/Xd+3Y6+2BIByqHxBWzq6olb5f1A3TTKhey0pSXB9g/SDuhpd3RgyHlYamQ+HxeZ+4Es1sezFdAd87USAf1eIJplkAHTC45djiUVB+zk/m4Au8zW9zrGoc8y3RpIEBmNH2r+Ic4wdwR836RIPBgV2vxT81aT60CUz8H8bYCuEMlwjMUVcIfL5pXwIrycCzNLC7hUvSz9/7JURA1+n2VAveKee7ZdiG7wvGOMJzfnkVSnKYehCUZmeJCmcfOiBtU+q0G62aTGT/lrcLXS9iXV+ZO29f6Owz6GKPrp2WFghELgNWY3wkfO7B0nxpVdaZMY9UrXW8xzSoW9uUxWdywGDs70OLFYrWVzBmXLdIhsdrpruxe/5awJQ46C8mB68+4vqGP1pFBfmwWTebnR99HgF0PbIY7LSAHljqR1fcHvmNjBgU11VGVwvo4GWBFos/7/d6b8Qng0rje/3iHHQxDfK4zGqHSa
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(7416014)(11063799006)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dVY5UDJXRGwyMzY5RnlDL1JFREpnZjcrMnU3ZjY0Q2ZaUW9URnk3ZitqWlc5?=
 =?utf-8?B?SDg0dEd1QWlHb2JVazNXekY1aXllVCs1SnkzMDZCRThEN0lqSHFDOWdnbkQ5?=
 =?utf-8?B?VTNLZUxWVVpmMEg5cFBwNXVGeEJHWVVCampIODE3YS9yTzI3SlRQT0R4SWs2?=
 =?utf-8?B?S3kyMWdQT2NoYm1RMnRpSEJxRzZSZ0RJb3ZwUUYxNlIwN3pQN3AxRXY5d09j?=
 =?utf-8?B?eXJJOEl6V0IwbFFrSTNWUjFjNWFyMXV1QmtzZWszOUplUmRwdUYrcW92ZDZk?=
 =?utf-8?B?eDJ0ZEEzMzVONUYzWUluR3BCZWZMSGpIWjlLZ1kwQ0NVaVI1cG9EVjJpcTJl?=
 =?utf-8?B?TkFkZWdoUFErQzRMZHJmbTYzelZTem5zVUF1NU1ZdkZiVThKMEFYcGNoZzZ0?=
 =?utf-8?B?TGZVandCdVFjRCtyVFBmWEx2Ym16am16VkVVT0hQSm1RS1JNV1VZbFRoRCtF?=
 =?utf-8?B?OVo5anFRZEpPRUVXeDNwMlhQdGV3MmIydlhZcHVwMU8zWmV3S1p1Y2c4dHFh?=
 =?utf-8?B?YkJNb2wyYld6bXZLRFNnYzZaUWdYUzhVYVRSZjlQbklPYkN1Nlh1aGM2M3JP?=
 =?utf-8?B?ODZnRFRsYnRRWXVmUTBVUnducWZ3SkRnMVloS0thdkhQdHpjRGVpb1JOV0My?=
 =?utf-8?B?emRRNWRPakllZXJMdTNDc3NBQlhhNHByN3p2WFJhR2RxNkNBQ0d0U080aXJI?=
 =?utf-8?B?MHY0ZjR3OE1ranFjUEtobW9DckliTEYwVlNSSjZWTWlMalp6NEk2VVlxY3g2?=
 =?utf-8?B?RlkzMFNXOG5DbHBmUGpJU1NVNjRERFhDZTB4WDJ3Z2FBMzcvQllvWFdlVVRO?=
 =?utf-8?B?d2hhcnRGSHN0TEVSWGtaMVdZOUppWGF2ekVsWXE2ZXBOS0JubGJZcnNDUnhC?=
 =?utf-8?B?OWJlRkg0TVI1T2d2QWk2OEI0OVRPdytMNXJJOU0vbTNLeWREamplVU1xVHZJ?=
 =?utf-8?B?ZUdlTHN0V3l3Q0w0VFdLS0VkMnluWWtkTDdFOVlpb1NhZm1BOEc1K0FqM0FS?=
 =?utf-8?B?T0Rzc1pqY3JEbnV0VTNoakpuREM2ZGJVcGtuTGR4d2YxOHloU0l6MmYzR1RP?=
 =?utf-8?B?NzJJRG1ndnpEcGhHbEhGVUp6akFKZWY3ZkpLSWtIdUU1dDVtK21WQUYyZnJv?=
 =?utf-8?B?dXQzZElsNlJHdytDMDIvQ0lHVk1TSW12bzZrUjMrQTUrK2RRVGR2a3JPbWw1?=
 =?utf-8?B?TWNDb2FzNERzeWJ3ZTQvNWhENHpRT3hYU3V4SEFOY0J4U0gxVWxnZmV0Q25j?=
 =?utf-8?B?N1R0cVRkRWd1WTBIRlM0aFpSaE1oajNmTWRZYlIwdk03eXhGdmJ5bXVDVXJ0?=
 =?utf-8?B?UXZZNWowR3crM0hVY3l5ZitxR1ZkSFlweG1qZEtFMFNLS1V1WWF2UEhsTnRJ?=
 =?utf-8?B?Vmd6dE9VWWVLdVZnMW1VWGprdEtsUFRSc2V6a2h3K0xUaDh5R3ZlYUhCQVpt?=
 =?utf-8?B?RDFhTUMxRlZ4VjlQYlBRRUNiUFlxYUkwMHU0ZzIxamQ4eS9DRmFNbG5rcjI1?=
 =?utf-8?B?bkxYcUxtTUxydjNaOW4ycitYYlNxVXZZNzdsVEdsQ2RZWWExTTQ5TGNYWWRO?=
 =?utf-8?B?WEVmZkoxTEFuanZVVGx1Qzh2R214UDdYSUY1V2dKWkJKMllya1hQVHZkNVAw?=
 =?utf-8?B?eGtMS1hxN0JxdlZ0U05abGsrUFoxVjg1TmZldzBrWUROQW5odHE5aUFWQS9Z?=
 =?utf-8?B?VTI0aTRkV2hNYmZGUVEzY2h1NUIraUdEa1l3MXRLZ2xoRXJsbkFOcDdORWY3?=
 =?utf-8?B?OHZTcStQOWRyNWoxUWZ2MjVBblBUSHQwSzYrK1NVM09BOEZRc2MzTHVDeVg5?=
 =?utf-8?B?RDdXWk1HNEorZkJzZ1JMSjBmUzA2UmFPOUh1NkZaWXliL2UzSGovUEV0Y2d1?=
 =?utf-8?B?NU1SYk1GWmZHZUw5WUZuNHVOSFh1M1VnMm1zSkhBS2dUNDNHYzRFTWpQdGNh?=
 =?utf-8?B?SUo3VUlIUU9ZT2ZMaU4vRzRpNXZaYUpwakNjWWJOM3IvTEdPZGdLZ25jaTIv?=
 =?utf-8?B?MkgyV2REYzhodzQ3dmR5WEtmNHlqVWFudjZQR2JlekkzNzZBZEs0ZzNEdkVK?=
 =?utf-8?B?MGVCT2l2THRSS1h1R2E2RFhEdldiZ3pNL29KVGhKQjYxM0pzM21XcGtiVFkv?=
 =?utf-8?B?aVRhNlMrU1BWNGtvSi9tUzJOZXMwN2JISTlGYTkvOG5PS01kcnVsRjhlUndi?=
 =?utf-8?B?dkcvcVZxUmtwbUk1WkhhVlc1MGxOcW13QnA2ckk1TVF5ZjAxL2FEMG94M2M3?=
 =?utf-8?B?NmQ4TFVSK0ZzRmV4eW45S3dFR1V3ZTM5N3FSTjRLRFlHekc2Vyt4TzRjRjBt?=
 =?utf-8?B?R3hFa2lsUnB4VGdyeCs5QWJJaGFxWkIreC9QTzdyYk0za3JURE1GRjk4Nm93?=
 =?utf-8?Q?4/U+5Cwt7i8Vhv65IaeRejqOJKxSeHFsPwK76?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f84f84d-7c9e-42ea-fecf-08deb5ec2a1c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 21:18:25.8991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNTI86p2Q1wvb81cTkccDC2LJfmDdy6aKxA5LabQVkvYpfk02BqIPSiQea5U+GjaBXEngbyM9kV7S27ZFC6jHJWuGXZ1z9jjpv66CmCPpcQxAaROcNhiK8uAgoXWz4gE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB12564

From: Frank Li <Frank.Li@nxp.com>


On Fri, 08 May 2026 13:26:36 +0200, Antoine Gouby wrote:
> Replace deprecated "gpio" property with "gpios" in
> regulator-vmmc-usdhc2 fixed regulator node.

Applied, thanks!

[1/1] arm64: dts: freescale: imx95-toradex-smarc: replace deprecated gpio property
      commit: f68aa04e6eda5c1c673c6bd1cd76447bee1d03f2

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
