Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013036.outbound.protection.outlook.com [40.107.162.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC943783D8
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 05:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769751856; cv=fail; b=neLQF2F3ne3oL0ifruiKQgOfSuLYFaxhov/YcMifRTyKl8udv8YJ9zKwNniZlJNf/+DfI74Alhw7CHkZP7UzegocAc52JWRIWZvh63O3r0T+AHDoumjTbVFjHwPH77do/6smZEpnf0tTigfc23U0i5B4PW1tIS9LEIgiuc9SxL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769751856; c=relaxed/simple;
	bh=jBUdBs/tLJmktfkilCx+BC0tAMLUU0ZJCKrYE6ffv9s=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IK5c8wOvMlD6kWRlphS/a4dhykgUXCVHzDRLKAPQqrw7IVjcBP3/NM3d/3cqlu02lCppASVvpIIrFHCVfyxXgvvkv5eD5j81PlvzTOybu8LwZZAEnFKczc+i6cIlnw0Ji6i/VrVHdcKP5e4nOwpsaTMm4m/uJtP1FwvyCLE+m0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eo+VAE6E; arc=fail smtp.client-ip=40.107.162.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eo+VAE6E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msQ3g27oSLjkmeji/FBF9tbY2ZgmHJwFegujh8+fgHUZ1OWLnO29UfBn9QtparYQyYIG0M2RjBzc8Iadv3IgOaXVzTMNQXGOmpWUT5RNQqbEsMCv/1cRRsMUWBWI4/tLvb0Efj5XFEtsveVJlyFBTcuDw/wWbBfLQ9UgDp0RscratFK6joQ+fkPvcqDj2TOsC0Ww/2JmDRoXh2cR59n3NMXppDLAi4KxsH2G9Oy7lFkEOpasCD3X0npXrcFEJLF4wjoILkgDsE4MR3XbVrZ4u+LKYGh7BxbvXblwjTWjqPPTQ75tG6GTEFFvCpmz8lSW8pmUq6QezXvY31k/DWkX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yA6L39XcGQS9q/2XZInXMG/kiehrTH1eu83n6LXKJ+A=;
 b=DSmFYKkSmU0b1PrB7Yyx4NocD7y3vTA+KWqQW4g5zKhidCGElyzAyc5+MH42z2vgpcQ1tBFttbisRqjMtqvhRsFZhYdstZDSJtFcXS5oxS8Boma6mAYu6AbP8/pJTygVbIYfdkKr8tr5FcxYpNfazDRBNRxLt9jYYOVTnyzX/S7cSmBURFaYkcxUZT9hj32eEeuxSzBCgnyRboUEku/8VwgEEm4rFknEqX5ZFwtjBrW4INhjmqdgRajipRVLB86Vy3+mxXMFLpIEFm7Z8ALTirDPlHFTrCrdVyPmXCRA3KtMoy6/2e+tIIOUeYfjO6vM8GME+UydW/hysTAFhkKNag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yA6L39XcGQS9q/2XZInXMG/kiehrTH1eu83n6LXKJ+A=;
 b=eo+VAE6Eg5Mmq5mZsR/O95de52x3CywVENAIGO9fPOZlsT5Sl22TFFMU0/bsRBLGE+XyeiXjHm5Y8oU9xVzyxc6YqEz8/v+SOLbirAJowNtSn9VPEaD1iZmqWV9/WlztqN8U2qiTbnK4KioF7Lw1kM78UXyh2dGxTvkyDigx0bg2VIPsvf/guxfm8mHnf2DF+HTlh9jwChmZDO8uTVZ46gYCfnI7FidU2HtOXOJyIj55qG4Vdoupt+RuBEfUSnF/Dl1cceartKZfxTvRUrYA6TMnqcOqrUo5eJ/k/QrRDCaxOXuU6mp/7r7seU3nuVpPxJpRDOcWHt8R9x6kLBShJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VE1PR04MB7277.eurprd04.prod.outlook.com (2603:10a6:800:1b3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.9; Fri, 30 Jan
 2026 05:44:11 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9564.008; Fri, 30 Jan 2026
 05:44:11 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/4] ASoC: fsl_asrc: Add support for i.MX952 platform
Date: Fri, 30 Jan 2026 13:43:28 +0800
Message-Id: <20260130054330.3462544-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260130054330.3462544-1-shengjiu.wang@nxp.com>
References: <20260130054330.3462544-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VE1PR04MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: b55c1267-e9c2-4a73-6b07-08de5fc29816
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|376014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?noerCIQmJL0szHRTXXc+19NtCdubvPpft/y0qtKEz6Y08fxOAXSpe43Sqqps?=
 =?us-ascii?Q?ie1RDeqINdHCZgu8KUrBjcWKupdsYVQjNdGSEBW2uPqEPLS0Gn439+UVyOW2?=
 =?us-ascii?Q?kaQkbPC1wuFu/FS99b9QSGKUzWA2j9CThtyZKOUbvARw2YY7dmGGnBKJL/4c?=
 =?us-ascii?Q?vMgoMdKJnOLTqJWnMYOwCBSfKOe2iUW8BO2FPGZ3/8rP8U/oq3q/yDapU6Mx?=
 =?us-ascii?Q?nzbJweLkfRciTyWOua8RNCFf2M24qTS6WPI47ZBIf6O0UT5SMagRrKPpC/tB?=
 =?us-ascii?Q?7GdIwVuvMq/xEKSp5HmTS8VzMyNYJbZ6X8AWa6FBXWNfx5FAX2gd7ji1UWF3?=
 =?us-ascii?Q?42ZNMCaurl45iOmEECpBn3HUr4HzgW3EE87duSXQYnjMFp1FqQyYPJ57Wp4U?=
 =?us-ascii?Q?+ufTaJEJbclqspCMOTRapzowmuYmgI9Ward7aYeQO8RrpizlshAFDDEU7mJ3?=
 =?us-ascii?Q?YwGkLuxOG254+ExJaNPKENPh1VRNFZo/yi3UdyyGcRhTX73Mr+5W3coZm+eT?=
 =?us-ascii?Q?pFQSvDWdw46AfEwgKv3dD84QV6ihfvrAwL4vZfSpYXFbhH3mkQW7VRB0wTQT?=
 =?us-ascii?Q?dZM3YWftjQbmNaRRfhznHoLOcP8fxXbQiOouZwZmP32K66mL1BHsHZM7wmDs?=
 =?us-ascii?Q?2JCu3gKrarmCM4TPRZ8B0sqbJIG15SMf9JNbPZ/tfJsPGJ9f3i2zJI19qiEQ?=
 =?us-ascii?Q?cVc1ryWvSiJJusao/EX3j3STNJ86PoG7Y5pFl9uBqtLcEjyTdWr1L5LgqZm3?=
 =?us-ascii?Q?CeBfjfVnoYLl2Fs/5diswFnCOixSgmLlGlTD/thbVU10NqCd1Bziy5OcgsWB?=
 =?us-ascii?Q?5QEhQf0kYqZMJM9Od/don4c7FGuDeCl+v5EUmtWbuUm/+Y5prmhhwn7AnZ+b?=
 =?us-ascii?Q?Ur1oBOv8pCtV1gNBo4NHye82pWP9kQYysYA9Zx2cV/GdC/ZLcFEsckRO8l5S?=
 =?us-ascii?Q?8w6d33PFBrowpv9pAkB6nV2pv1Kf+HFuAsGyLta09PMIZagHRs8BEa3oGqX/?=
 =?us-ascii?Q?8q1D3QJh+L5fGp0VyMT6hhWtZeCiuOLGrnl9NJgAsHELSDM998m/X+ItaMcN?=
 =?us-ascii?Q?xfzxqGRdZCQyQdiLZbOhgLTp77J+CLhLJWr/X5wFpbL+85Md5DYl4wlZI5TO?=
 =?us-ascii?Q?GbNdr/APlDOxv9al3V3hqlnVfnS31R7LR7xjkLwenDYKFP4dcr0td6aRdQiG?=
 =?us-ascii?Q?O+k4rJS5hj65kKDab2vSgNugVxYorjipHTKsgSt+6J1u6SZJerZGfLQQ7naq?=
 =?us-ascii?Q?9OMQZhdiPFN2z5Gafxy8HI3VmSNoNXgHbyp3l8JOZzCkMs0+qu5knumYyuSc?=
 =?us-ascii?Q?MLWdzKisGE5UmR0pgzBSQHrNXnT4BsdwgYv3fYI9wk+V3boK2BvkPPkNy3W9?=
 =?us-ascii?Q?YIpc+AWYlx1q5Jkloq14rOMal4+cGqP8mWG1hkpAaPLLCTrUNi4kITOJjIdc?=
 =?us-ascii?Q?tLDllrF0Cx64nEGrvGKV6NyXvg3OjCqbXHbJkXE9CBlOZ82m9ejYFpATIPaq?=
 =?us-ascii?Q?ozECS9s5b65jdOUzxU4BhX+OHzLQVf6IN2Iv3o/IF62a6kvgcKJQhC/YvNb4?=
 =?us-ascii?Q?Hhpz6huyK3PfR9oPvdITKrRVykB+jc4TYrbrQmwB5U7YePxWZaQ7VhBVsIY/?=
 =?us-ascii?Q?HwQlYKhyudGtWzCelAEhfMRxkvNOJPiGI/1f1hOuHQZi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tPbmWRIgphDn8n7n7NiA5S/G+RNQfQReRzbilbsodb1T7pgviEwAAUQUaxaw?=
 =?us-ascii?Q?lclMiqsH8zedR7JNMxMfZnjnQsjAfM2uMMmF3Ycf6lY3Bk05adlajZM6tcKN?=
 =?us-ascii?Q?tFoyO6QdLv7dIJ1kWEJkCELPyF2OUtxrOaN5SLz+ZTblA9+h22OpQAbDjIY9?=
 =?us-ascii?Q?Bjc0/HuQ5MpWIRx/l7oAxKjN3AybZHzIS48emd0Bbj1MQ5EHgxid8dIcWIXR?=
 =?us-ascii?Q?enBv5vl38wouptAmOn+lEqhW58FOG+Vv19GORrGqptXlThte0SRXmworVMHG?=
 =?us-ascii?Q?es4vNoY/XJIWJyJZxeO9BoFOf6ajfavB+kr2+x9vxjv09N6IhXNT4jGOU52S?=
 =?us-ascii?Q?xweu0cnIoz1ijTe0NPYvPIcvE90HUfwM1AK1gsy3/FqQAamDOEgNyzQIqEqb?=
 =?us-ascii?Q?kZZ5ZgW/pN1H1vS4FSjelKAti5FeWsmIJlggZVxmK464B+sM3IPbjYiE4UzY?=
 =?us-ascii?Q?7QsVMvaAWCf8V/d1F305BpmM2xGZ0mEs2hbfiiIW6mBC5teoNtJQoLsC6i0p?=
 =?us-ascii?Q?EBB36KJyAUxuPVPEwmRhJ/fG1kP3mYNmoncHh1Sou8bFVTH0j/6wSals7pAn?=
 =?us-ascii?Q?qmI3F+Tfss6MUbxrekHQ8UI6+92mCyc/B4HPIye7FthkeQeXetJ0BKQQ1IRX?=
 =?us-ascii?Q?qwBnRKZ2FhTfYQQmdYPicInmDInq8fxgWVvnyPog8BAW3lG4qFdWyf85luxZ?=
 =?us-ascii?Q?Ks68Q1/nSorf7v4YqLN25mibLW9cvOZlbK66GsJsYO3OV8OQMpBNXqqRJah4?=
 =?us-ascii?Q?OH0W5ru5jdto5Ett0gyLp1Wj/zhH+JdAy9BkujesnZY0nEonv45Mhu90ODcD?=
 =?us-ascii?Q?5x8Gqi7c6XGycEFePv9PPOQkmO1snF/9UDhxLo/fLhCzlRNH+S9i6RV8/iLD?=
 =?us-ascii?Q?aTYzpg9FHMU9M4Qv1jaFzeJUCYSXcwT+CgKmw0NyJd8KR68aBnmitX24z/W9?=
 =?us-ascii?Q?TMMztQzbQr3J7G436fDfE4B2E4SOp5F5htF6y5zKbgOyXsk3hIlyd0KwQBQh?=
 =?us-ascii?Q?UhVbJW3AZPHpPFp5U9UK3BJRrjd9ukTA2HrWAVepGPIM3L3KFGruD4rHCi3k?=
 =?us-ascii?Q?3tOpyPYLqmNFYJvEK7YLyBahZpz5r/sa2VqDLo+cfi50JeYSmfnfBeAMZsX1?=
 =?us-ascii?Q?GrQlZJjuOm5QM5jITKdEyihkbBw8wIOBMmo8M0Q5I+iBaA86CQ6URc85x+GK?=
 =?us-ascii?Q?UZv3OGzjDprYjKDWsb5DiDm+9jmv4CjUsHQ3naGV5J+6J82QyOuU6t/jWXm+?=
 =?us-ascii?Q?Vp3tEq19eYg3Sp3LycubpeqnVvkrnOjx+hrCWBlFJPYL2y3RZ6bd3pzCNfWG?=
 =?us-ascii?Q?mAnj8ZtrxijN+9YgrElHwEh6ff77qn9+USly29JSlTy6R/4NZhCKN7RNMb5Q?=
 =?us-ascii?Q?Ocn2RVAmWnOnRj4HVUJgd0kAkPwYQY3fduoeqHtPpNVdoJr/y7rTCpsYV8O3?=
 =?us-ascii?Q?ShRd9oufYc9Vt/YMf4I+MCJ6reyI+kULkXVMCNshCb5MfO4HKVBuUYxPhG/n?=
 =?us-ascii?Q?JqsX/Ptv3ZxAlR61UisbAjjwwTeaDuwAP90wYzE0Tobfg0C7NSi/FXmmKKX7?=
 =?us-ascii?Q?aLrgp6KjhkgJCWSrjS+LBE0BmsO8pnQ9V2WeLDd1qyaCWC2BTN+mqQzy29bW?=
 =?us-ascii?Q?qVfinLIgj6tytvsJDO6BBMULZ3TJZ9AGFCimSjCbsPnhX6ntmSqm3oYEQEbr?=
 =?us-ascii?Q?5CRymJHpMjjSZAIH3/8nYvrhihQyZmtjVR/Qe4+iQHrpE4zGKpGU7iiz2Sh+?=
 =?us-ascii?Q?0rVFoECdhQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b55c1267-e9c2-4a73-6b07-08de5fc29816
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 05:44:11.5479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oSfP6D1SBQKWobHWQ5IetLiayRaNiIBQirgE7gFgHCS9OXRl3/In/q+szQ9DCoLnPZ16Sf3PfYjXsRGp+KIMTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7277

Add a compatible string and clock mapping table to support ASRC on the
i.MX952 platform.

The clock mapping table is to map the clock sources on i.MX952 to the
clock ids in the driver, the clock ids are for all the clock sources on
all supported platforms.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c | 15 +++++++++++++++
 sound/soc/fsl/fsl_asrc.h | 14 ++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 92fb16f7be45..5846a2b1f73c 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -106,6 +106,12 @@ static unsigned char clk_map_imx8qxp[2][ASRC_CLK_MAP_LEN] = {
 	},
 };
 
+static unsigned char clk_map_imx952[ASRC_CLK_MAP_LEN] = {
+	0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x0,
+	0x0, 0x1, 0x2, 0x3, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x4, 0x5, 0x6, 0x8, 0xf, 0xf,
+	0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x7, 0x9, 0xa, 0xb, 0xc, 0xd, 0xf, 0xf, 0xf, 0xf,
+};
+
 /*
  * According to RM, the divider range is 1 ~ 8,
  * prescaler is power of 2 from 1 ~ 128.
@@ -1315,6 +1321,9 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 			asrc_priv->clk_map[IN] = clk_map_imx8qxp[map_idx];
 			asrc_priv->clk_map[OUT] = clk_map_imx8qxp[map_idx];
 		}
+	} else if (of_device_is_compatible(np, "fsl,imx952-asrc")) {
+		asrc_priv->clk_map[IN] = clk_map_imx952;
+		asrc_priv->clk_map[OUT] = clk_map_imx952;
 	}
 
 	asrc->channel_avail = 10;
@@ -1553,11 +1562,17 @@ static const struct fsl_asrc_soc_data fsl_asrc_imx8qxp_data = {
 	.channel_bits = 4,
 };
 
+static const struct fsl_asrc_soc_data fsl_asrc_imx952_data = {
+	.use_edma = true,
+	.channel_bits = 4,
+};
+
 static const struct of_device_id fsl_asrc_ids[] = {
 	{ .compatible = "fsl,imx35-asrc", .data = &fsl_asrc_imx35_data },
 	{ .compatible = "fsl,imx53-asrc", .data = &fsl_asrc_imx53_data },
 	{ .compatible = "fsl,imx8qm-asrc", .data = &fsl_asrc_imx8qm_data },
 	{ .compatible = "fsl,imx8qxp-asrc", .data = &fsl_asrc_imx8qxp_data },
+	{ .compatible = "fsl,imx952-asrc", .data = &fsl_asrc_imx952_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_asrc_ids);
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 1c492eb237f5..2f67b085de24 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -324,6 +324,13 @@ enum asrc_inclk {
 	INCLK_SAI6_TX_BCLK     = 0x22,
 	INCLK_HDMI_RX_SAI0_RX_BCLK     = 0x24,
 	INCLK_HDMI_TX_SAI0_TX_BCLK     = 0x25,
+
+	INCLK_SAI2_TX_BCLK	= 0x26,
+	INCLK_SAI3_TX_BCLK	= 0x27,
+	INCLK_SAI4_RX_BCLK	= 0x28,
+	INCLK_SAI4_TX_BCLK	= 0x29,
+	INCLK_SAI5_RX_BCLK	= 0x2a,
+	INCLK_SAI5_TX_BCLK	= 0x2b,
 };
 
 enum asrc_outclk {
@@ -364,6 +371,13 @@ enum asrc_outclk {
 	OUTCLK_SAI6_TX_BCLK     = 0x22,
 	OUTCLK_HDMI_RX_SAI0_RX_BCLK     = 0x24,
 	OUTCLK_HDMI_TX_SAI0_TX_BCLK     = 0x25,
+
+	OUTCLK_SAI2_TX_BCLK	= 0x26,
+	OUTCLK_SAI3_TX_BCLK	= 0x27,
+	OUTCLK_SAI4_RX_BCLK	= 0x28,
+	OUTCLK_SAI4_TX_BCLK	= 0x29,
+	OUTCLK_SAI5_RX_BCLK	= 0x2a,
+	OUTCLK_SAI5_TX_BCLK	= 0x2b,
 };
 
 #define ASRC_CLK_MAX_NUM	16
-- 
2.34.1

