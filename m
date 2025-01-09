Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2072.outbound.protection.outlook.com [40.107.21.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D02748F
	for <imx@lists.linux.dev>; Thu,  9 Jan 2025 01:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736386066; cv=fail; b=E5QnylDdj3ZzrAaueP/6Uhu0QafuOvOS+LOz7N6qmxhM/01N3Y4vwy8VonEeK5euTbtNFKqEmFsYhMZFpcGtg86dTI7NIQxX1jW8mjrWxQMfw2bc/zcnQCz8bmAnfEzxHbOpEpb2PkZSxucT48JHlu09yZWBGZHFSYhsfYV+yho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736386066; c=relaxed/simple;
	bh=xAoTdxYw6llIF/kGoB0/Gw6Mtp4ul0uw/NlSful8Dv4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=odAl8Vno5wgC+4tG3W0XsTN62ZQCxTHGTMcJycHLrJQ6qyDj6i42vJBGSIgFLTtMUxP7KIUR7QaoCscPAlXFZTjPZblHufLiehfC2vrBeXDF7DbOJrLLj+3vtFtJRXwXV0RAkueba1YadXZksdz9IZBtmAU1skUtJbBxbfcIZrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HQ/Vfx4v; arc=fail smtp.client-ip=40.107.21.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HQ/Vfx4v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tViS0NXzZjlycXQ7EjRGQAi4uDs71APWeA3IkE+EJ0TsFFgHt8E5y6UP2+WbLBJRHzAvu3cnbUdatxDK7In4xI2qmEmafA7onYE538pb2FTKaVycWJZnGE0c0knPz6tWXMIRZ1by8rNYSxt3kZXzvutrjuV/ojd8IdmuqLNkowRwO39OF7EKqqhqQqR8tgs29qOuuDOiQ+7F3J5hzq/FaGI9EHZl073L59eaKAqkG7ZDQzJofB9EToiThAGj+2/Kmo4ZaVFLZwPnhbWmASF7YnkBGevlM78Q7AJv/xa5Qk1Mjq9Xu7kUBoAbAa5a27WD/S5+v059m/O+FMOvy6vHOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HWbvx+x+w4KsPaJffDRG2FWQVXMwMr7So5YX/IYycc=;
 b=d0u28+CG44MWLLyFdL9TBQ+ExBCTmmROSv8COjb2WI83zYIRYyA1zkCSoc+Aazy/6FJC4Gv2j5r89RPDMpsb3kTTxYmomxatWzENqwDCOuSmCUQy0MF60OXFN6HF8EI5Kg0x0/n71Qstg6o8nhtfqMu390DNfoCQsqHir17oKaKgS090stbPVHQolcRxRXAzN5qEtxcezU0I1bGIB/EklxhcaJUwtpXf6gi3iUMSriTxXWZeKqTHfiRxd+eiP190+nbS41VE9oeLA5zqUYfV3xWEjLlQP0wnWxFdLnQVt9io7Xrc6Flr3x9RtPTbGGexoaGpP07+0iVdClwwXNNXcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HWbvx+x+w4KsPaJffDRG2FWQVXMwMr7So5YX/IYycc=;
 b=HQ/Vfx4vwhQ6LRMFmmAALNDPik2X4Il6pxtXt6iFEEE9vw77rhwmELXKYKATugdIuaJUSlWh/0GWVVozm07NDOdJ0G7jBY74RRhDlDIjyiDvPWIlf/mVTNYe/DD0ET/mCEXxOjgkvX+19naipm+ApJ6FIydsmv3IR5NaKKqvdeNIDdW2zuTDtdb0X8wHkAWUeeNzr24CisCf2Bezj6qXtRzmX7pKUqO01K+lOr9t4ZmjE+Ou3tH+lBvxDRT2aq+lSbucogTH13GYbzMkPp+339jYmyS+SMOPSTqViPycXGwYojo1t1qc32n8FVCfeUmfEmZnuHALkEydSaPzW3/jEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by AM9PR04MB7668.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 01:27:40 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%4]) with mapi id 15.20.8314.015; Thu, 9 Jan 2025
 01:27:40 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: shengjiu.wang@gmail.com
Subject: [PATCH 0/6] Complete WM8960 power supplies for i.MX boards
Date: Thu,  9 Jan 2025 10:27:12 +0900
Message-ID: <20250109012718.328692-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::18) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|AM9PR04MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a9fd9da-03dd-4fbb-06b0-08dd304ccf02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hYv/zc4IaKPG/MMHHOx3Y6k/roktOSMjTUQtgF5hLgxOpW/Q51cuc/+YKJuo?=
 =?us-ascii?Q?bXOdezZum13BXEcLlijdLWhc9EwqgREpGb+uw4aEjvy2Re+8b52Bs7UC7YxD?=
 =?us-ascii?Q?weSJ2JzlpSKt1hfBuykrPCIGqaNtKR3TkuIRd+8DmM6+c4w567eHZpferL1b?=
 =?us-ascii?Q?Q+69Uefmp4BLGjM45fnr8kZhowiSpCS910f8fhvW3x4LVqxVHGi/ZcqZXqnY?=
 =?us-ascii?Q?rH+Sj1I0nbZbPjUike6jWpZUg0yol45neMDFO+5PL7CwToDbKlJ/ew9GkgjB?=
 =?us-ascii?Q?QxqQyty9n94nTpEw1jHsKU/NSjYo4TORpVo6lb8+W90lv6b5BoGSnwXxSHQG?=
 =?us-ascii?Q?ttOSDnDUfFZtDdZcEljDcUsAO6NdkW0H59lYOoSpsLK3dCxLI1MX2K7sR20x?=
 =?us-ascii?Q?lCa+JcMIdnJB1JU2YzrfMkScgviNV3PQRcHSoJvCtrkWlQ30kC+iW/Zn5/s2?=
 =?us-ascii?Q?OgUcxw6AOaTSC1MJGUHT/40a+Vx5SFW/jgbSrzsdmeNvSUkBeZHW5gA64T37?=
 =?us-ascii?Q?DP+N4LSIzczvVeNzJQ27vvI7xylpMQ2wwuLma9kohNu2cZDBr0P9o5fLc3s2?=
 =?us-ascii?Q?VCfAi3M5by+CIYHVmnwQRiGWMeCSLKOqNH1u88bodqCggNqsw9cidcQeQTQi?=
 =?us-ascii?Q?BTadVQdHT0ddz0aXtH6un5IoWHjO3f7kCCC66lgsiZuGPFdQkPnyDJ+t1YQT?=
 =?us-ascii?Q?5ZnvjM+gisNEBEXPCJ8wG790hZ+ZzRtjEe4i1NfhEeyFmQsXgv7XrQPgSIIS?=
 =?us-ascii?Q?4F/9rVWokBvZ8eZa7OR8M8YPoGOBsUDMmSBYi3O4et1HyODHwbQumJoZyzmW?=
 =?us-ascii?Q?ThpGAO4yxsuBT5n5IkZKBzE0qqFZuRwhjVG8Vc15fgMsRwSQ9Gecx54NIzwi?=
 =?us-ascii?Q?YLMhQetbofM4WCPeNLWswvUFPdylnk14ZziQfgT9xPTFifu7R+1H6UOAALPg?=
 =?us-ascii?Q?9SFFV/JOCXTtI0alO+DTwwFC21z93X3DmUocL/5aOtrbz68j4suK+hCbZRGD?=
 =?us-ascii?Q?0fXqi+QnKsR/2k+0mdxvETNI+kiL9LXCgD0xGJo0dWWCsEL/tDbsw4BQGDc+?=
 =?us-ascii?Q?ng5r7CXMNFo5HM/YZLVKD6H7l4flbN7De+1wmnUtpR2YucJ+4FHwijwdgJg/?=
 =?us-ascii?Q?lN4DJ6iTcMPkZAufdThedFlHjnjRQR2zq/R0DuePp8uJq1DI2s1AhqV/4G5h?=
 =?us-ascii?Q?scpdCIm5Mx7URTPVeu2XLNT10OCZ+58PBnpXPYJDJvWYMMCm98Xegzo8IIiM?=
 =?us-ascii?Q?c9d83v6UinNOy5fgmM9DDYIweagaqOxNGTjl2sqsd/Kt/RNKOF0vqRQdV0AF?=
 =?us-ascii?Q?CPDL09EeQGTtKRoY5G0L3qUhwb8JpKm6kXm/cXtBe0ecri6NJc3nJPdFCgR3?=
 =?us-ascii?Q?wYTH5SYeAWpOkr7DkdpbMpCbqyO3wJQEQrpBkBG0iL/8Tdx6XDIXqsAYzqlJ?=
 =?us-ascii?Q?pnhwrAi4XQwWWwwCCNfhXndrj/1Jk7CdxG8wsAWTYd0u2ovZ5LeWkA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xlsjsvuCCzCWPcT0a11JmHBRUmBMIpiwYIMjpF6kxqXVw6oMOYZ2BVIiZjN4?=
 =?us-ascii?Q?W0Lg915GBcLGTJXc08rDaKnzPJ3Kq6cuIPxaHdelnkwCpCEOUddeSY/DT8kE?=
 =?us-ascii?Q?bMXcQgnw0Gd9ecTWX9EXAYOCWWF4Tt+5Fhg190DIP7uJnsN6qIdR1Alymu05?=
 =?us-ascii?Q?R/p4+sI3YiDi+1E4m0LCWff0YhPQkoGmDQB/AHoGtudiIPZ9sa2hJdU/M3O8?=
 =?us-ascii?Q?1oYUNqZcYD6pw3XUlL/UfzOIB2eJ2roCD+kjZOwpvEB3WCgIVA5HkmC3akeC?=
 =?us-ascii?Q?bxPMTKeEST8IWAwXCM7DBe5ZHGx41WoxXvbJ1DKhKTJFtm2gjDg5Njy5JI0Q?=
 =?us-ascii?Q?gJI1UCgyitxrB3dNw4KWgqT+xeyi7zYuCtZADWK9Tl3hZj51VsUMxnzO4fku?=
 =?us-ascii?Q?crYapLXAs4mvPSqM45DGf08q5WVREhvueja/1tA/wEd2s7CpMVUIkjkJPtw/?=
 =?us-ascii?Q?+FJLsycwjJB944gqEMwkaAPLS2d5WwxSfHbol6rUNevF7IPSGuBmY98/kWRS?=
 =?us-ascii?Q?bb24fOUb/T9XvgHVtxKsacB0hlQ+xD0Ldj3WG+LJsQbjrZM2/SOJMGJltSY6?=
 =?us-ascii?Q?UKMgD9J97OtyV0lTjtlk211IenfVvIjOL3B9Pvazrw+kuFFvnBNFJEpKdaB+?=
 =?us-ascii?Q?9e/ZheTZYO5hmv08rBkH4lk83OYcw6VzZwDKnXwDvbvkQvlDnDWlVFzVVsZY?=
 =?us-ascii?Q?NDk2Hg2t90oD569uirdMJiAoKMKL8PgA+x3Jl/QdkSQMsjK/WcmCeuioIQ23?=
 =?us-ascii?Q?CxQtZ5BUiFptU/KFCaDWmnpyd8Sasqfu5RCB6f0FaP4L+kMJLlhS9a595DrS?=
 =?us-ascii?Q?szjkSTFWAUqKE/7H1AMuaQI/wFyr+gxgAfO66dxAYaGWo/9ydUfI9q3T2K2w?=
 =?us-ascii?Q?agLit9Y/PUp1DTsF0RcZkUzUJipvfhyhee+NdEm/scGOJlCKVXbXFdWL64UA?=
 =?us-ascii?Q?ck+5BWaMTqAkpx5AuLTfnDnLjBPlFL7rjJ1Pn4Rpp12Z20PzJK7mzfuYNbcn?=
 =?us-ascii?Q?47CwKL5kFbHwzo9DrWqaM/QMtt6/Si+YOibcTU9gPyULcso85gOXOFtzpy0+?=
 =?us-ascii?Q?U/rlRlzVHCRWA2ehZCbnVFcITBS48tx+92ggcDDCBzs9ueqpqzwFEq/V9J2q?=
 =?us-ascii?Q?KBQDTPO4Whr4t4uNEtKMLt94p387dxrAZMFdZgvOjkPSSQ7qN/uEhZnYYQm7?=
 =?us-ascii?Q?PzNW34V3GXnHkgMY/EeWwNlIBsVboWZEsdTn6Wz/vjcABDg29/W9SOGVuaNh?=
 =?us-ascii?Q?FIDbePax9UoQuTmgANah1RJWiUwBndWueX4fyyzHpgGgbb4xJ02PQwRgsBz6?=
 =?us-ascii?Q?62PyUxZ4J9wr4m0KimzmbIbHHbB4+CE0Sc40MnGNRqk4dlWK7ypAtw/ztBtB?=
 =?us-ascii?Q?vs8c5QZAtl4kMA2R90UG3iU16EP6lW72Zi/Baylx6uqmW98dj7apSypgrvB8?=
 =?us-ascii?Q?QKiQjdiPCo37SFJvWRti8zmlydV69sN1jCUflTPjtjmqmgqIoFizhRj4A9r8?=
 =?us-ascii?Q?f5cXQMZmm6c7JySdZQ+QDQarss2N0w6034kjl9/tfoC9901hGtYu6HZQgZaj?=
 =?us-ascii?Q?hnoNx9XnpSRc4VhuzqFzl6zjaHMn6tzytDZ7iSjv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9fd9da-03dd-4fbb-06b0-08dd304ccf02
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 01:27:40.8336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/O9r5ecyKFVhfSDQyN+lntYaoc1JSPcxkj9RU2MvdY/qYCS0Iv2kRIu4QvvqLVsbjOVQtMF3d9/67ocb5Y/wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7668

WM8960 has the following power supplies:
- AVDD
- DBVDD
- DCVDD
- SPKVDD1
- SPKVDD2

Add new audio regulators to reflect the schematic and complete missed
power supplies.

Chancel Liu (6):
  arm64: dts: imx8mp-evk: Complete WM8960 power supplies
  arm64: dts: imx8dxl-evk: Complete WM8960 power supplies
  arm64: dts: imx8qm-mek: Complete WM8960 power supplies
  arm64: dts: imx8qxp-mek: Complete WM8960 power supplies
  ARM: dts: imx6ul-14x14-evk: Complete WM8960 power supplies
  ARM: dts: imx7d-sdb: Complete WM8960 power supplies

 .../boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi    | 32 ++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts       | 32 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 42 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  | 22 ++++++++++
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts  | 32 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 32 ++++++++++++++
 6 files changed, 192 insertions(+)

--
2.47.1

