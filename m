Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010031.outbound.protection.outlook.com [52.101.84.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF201489897
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 19:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785353655; cv=fail; b=Q0yR7/NflQSXYCgsQPW6Ok7fGxKsuyDk10xl77WSlKsMKDZM1kWGEZUGboyO3EVOQrkZRaC+/cfxGxuFa9NgvkERPTLqozGt1vIjqZ90FP6xeVWcByy4c2L92uWOFFWpT1Oj41WHo2AGS+NU62mtFcbEtiIl1L79MXEA4/rz93s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785353655; c=relaxed/simple;
	bh=yBoeVgbYc2+lzDbX9aYHn6hiJ5k3nW5CH/FkuQQIXuA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pKci7ElD2dDzIStAoYjLmIF2V5m/nhoCUeptnEZVltJL6xah0QLb9tl0oNHUFCyPp1tP/MDe6eNoTUOaLVwfKQIDKdlcKANN6SCUni+mwS6+1jrDv6KMaRPe36v9xkAZ5jB/Y4E16iEpa2V9Evs3yyslA4RvpJ86pTOxBNErG6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qogYvMpL; arc=fail smtp.client-ip=52.101.84.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qogYvMpL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2mZD3tNdh638sdNTPZRHYsfOWUlMhA2FI6qO99UWL+Ao3RpTo49iGlfajkjCOy6tvhL6wqKzc6tJnQf61RJkS/K77vftKjzB3XHYICpQNDxHN1WxBj0/UBQlOZg5JM60lzlqWJ5ydHwcI3O7W+pFc1q/uTVT9A1YQkTRKEIFS2SL+KTsd6h16/hBDZdOY6fv00h9Rw7cTkcwrXpOSPDBc+OVdeKNG0Kwd7d5hW/SgupQTGgLWdelPMkjaTpDlnccHv4VumWBjzT6AAaJsPtaIfox1Ze7gpfUNAhZFz+dwkDB6t9MTaDy3P9+hjXA0RCMdNhJh4xjEnHLF7KbwnHcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6XWy4CavOByvO+9EmekMwlrifxTpxf2tUNp7fbmTKFU=;
 b=ctkOT9u7QrJOmQFMKrpu/ofiWU0CXzzldIVdhD0LFMMq5ZmTpyKi9aRxhaRzB8ViFoI6A0gfH6+qZzvAUUg7e/CZj98NkTOOgsJ1OOIIykIhHH3Gw7mjWUkUA0cdGxYiZlvujaJD0d7MZG6yl7sgRVq1xbRDQEBzZ0AhelXv2PaSTRi7ZCVBeZcpLy5qILHRJcCfAmQ9i9/Xu6+OxmfIG665t5KVmKeR98jtNihZUKeI9kHHS3TcVDnTHIYamWkxTGjZ2yzbuE1A7z4rAwjXrPHP4bRwdmznM7tUUepekKXNgUcAqLGlrA62KSD+oX2Q7sQmZxnTOIZpGqdCIKQQFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6XWy4CavOByvO+9EmekMwlrifxTpxf2tUNp7fbmTKFU=;
 b=qogYvMpLhDtSwaOh5JrTjsH+WOy3nm1aJ+uc3LsKLVzLA6jQ59JNsCRd4GLcZR6d9ffuSSU0LNSmUFzY6rO+zGsPVl/o9Qyi1u4mVEOpu3QP5Fnp61wuybs3y9ypdolKda3VODkzJFmqq1/yVlYr1Z+DwO84Gt8fwvKr4uBhi14LL4NP5b1JZRsnWuobCx0NhBCVi//KwNGZcKDN4jm49DKRymweAsCdkD0n3X4KIRZ0yY21DLyTcq1coeRZnghbt7K2d5fJcRYNzjPMVTcqsF3zFIDqlfVQQ8kLHIxkspi+OJlesletbbh0uoKUClJ67fexhevP4GzfrypN8eIeJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by PAXPR04MB8492.eurprd04.prod.outlook.com (2603:10a6:102:201::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 19:34:10 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 19:34:09 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org,
	arm@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dbgh9129@gmail.com,
	geoffreyhe2@gmail.com,
	griffin@kroah.com,
	lijun01@kylinos.cn,
	pengpeng@iscas.ac.cn,
	u.kleine-koenig@baylibre.com
Subject: i.MX SoC Changes for v7.3
Date: Wed, 29 Jul 2026 15:33:56 -0400
Message-ID: <20260729193402.533533-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR07CA0027.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|PAXPR04MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: daee8c5c-a7df-4b36-62a2-08deeda85c36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|366016|1800799024|6133799003|56012099006|11063799006|5023799004|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2ogtwt3t/h9FZi8KJYkPnB4e4piDp+z60C30edJt1RBlRQktoL68LG0uyz72JSUD0qACeKGm720Uz/s4+4mgwcPRWfEKLx5KhUpNxR7KBTY5hMUfsuE6wLatDlGkVVWS9eRq8VbH1PdVOtTxkJS8kBipE1+zDI8gGHZ8x+vRitIP0VXa/kbtGn2QUMLs/cgkJrMHA3Wnzg6NnD8IHKmn+Lc7txgFLkSruLTu+epjFg3/h0zi9w76MAYtjgpgOFJUVdFADTsE5aCd1XfhF0yW6rB8h7PFc8AuIJGDd0mGqeEVIWHxapkcXGIZvXMaSvwdCe+RusbJWaIjzLHgfLHxXKvLFcZsY9wg2V6MbgAvdB4uCxd61roVefd6Croh1ry6PZnFv/y8fqFb33v0zcuVoYEmipF/CWFxeWBODO2QYmdLJ0qE+yjkzzlG8Z/AHnNZfanBbV2nFfNGu6qRKbfRmiVasUh5YV85Wky7tvVtMEeYSF10GPmePmJC3ufp6SRsoabbd3LgC7tmFGhDn6i5evKSX54adbetL/szUcjBSS0gY4l8dCRMx1+VL6gLXRDT5zsP8dh/9jUtzBkAF+sDYubWI+yiTu8CApgR8vEb99rWoe6hjCVOc2nxdWWZCvr3uIHob4OEElSqyPpMxRT5MijbsuDLH0OBF40yQQ5VeH4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(366016)(1800799024)(6133799003)(56012099006)(11063799006)(5023799004)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWJKSWkrdUZzVnRZUnQ2ZERNU1BQd2R4WTNIYVVWVk90dlE0Q2RzMVN6ZGd1?=
 =?utf-8?B?eFlSQjUxQkhIWXRPVEhkc1lGMy82REtWc2lPRkRIWmhZVE5CTW55dWNQeXV2?=
 =?utf-8?B?V1ZaV1ZxZkMxNkxsVmc0RDViUkxqVzV0bHkxd2MxQmE5ZjdDZ2tqU3EzU2JE?=
 =?utf-8?B?V2dsRkswWEMvYUJ0MjhacGl5c3FsMFF3ajVxSk43bTFUazRPWG9lazBPZVJz?=
 =?utf-8?B?QWNWVGhkWXJINEwzYjhzQ0NMaUs1TVNnM2RPbW96cWtkTWozbkZSV3prT3N3?=
 =?utf-8?B?S3dSL3JzZ0llMGRqMklCUDh0cWFTSWRiV2crbHAwOUxETlJxYlpJZll0R2p1?=
 =?utf-8?B?VUEydUIyaFhmRmlIZ2YxMUVIdi84Ym5UZDgzaUFFQlA1UEpjTG1TOFJ5aDNS?=
 =?utf-8?B?NlJoZWo1czVpcVl5ZFZNa000RzlQclRQYWF4TXRDZnJ5aCtGb1pWZ2NMaHMw?=
 =?utf-8?B?R09Hc2hsb05Jb3N6cXR6NGtuWEJ0QjlCNzAweTY5YUYwRFFOdTd5cW5sQm9J?=
 =?utf-8?B?Z3l2N3Y3WG5tTWEwRmYvTHJmamNTQXVzcGt2ZURXWGFMclRmdTJ0bkpKQk1P?=
 =?utf-8?B?cDV5WGhsRDJ5QlhRbExjTUozT2Z1UGNKT3ZqQVliMXVPc2U1YmRKUllCUTNs?=
 =?utf-8?B?b3Z6alJYd1lBUGRlTVh0bGpYZkhlYnNyYlp3K3RuZ3NwNHB6cjBLSm4xcHQz?=
 =?utf-8?B?dVh5YkpOTzIvOVRiakgzbCtvSkFScXc1a0NOd21vTGs2VUNjNDk2NEQzYkhh?=
 =?utf-8?B?SmxSR2RtUzQvTXorUHl3L1hyRkNZNTVoYWVOVENHeW9CMEFsQmV0ZXNteHZ4?=
 =?utf-8?B?cTFRSXJVdGYrbG9ZM0p5TEpaVlQzZ2RuNVNhZURXZ1ozZURrc3BXd2x3eVpi?=
 =?utf-8?B?QWlSUU1GZVJ3cEZveDBNK1RsOVpBTzFlU0U5MFBVZHdmNkNXQndNRHA4UU1Y?=
 =?utf-8?B?L2UvblBpRk5GUE1uWUk4MEVKQ1Y0bk5KNWJNb2hJbkFHUFVIbkhWeUZZWVlw?=
 =?utf-8?B?a3lVSEdSSktDQUlJaUJrS1RsaTY4MTFvMHJOb1I1Z1k1di8zaEFTdTBFNWlN?=
 =?utf-8?B?SUpOZ0Q3YmFNUkhxTUpGQWJIRVZtbmNRRGFrTnV0ZUZaUXJFaW4yRDE3bDEw?=
 =?utf-8?B?bmVBWExUMSt1M29rbGhpaWdsYkRxK3RCaVIxc0lUaHRuUkE5aDM3SDlNSTVn?=
 =?utf-8?B?NzV6L0pSb1ZPYm1zc2p6U0FQN3h5ZzY0cC9rTDlFTXpJVUdOb1QxZVdCUkR4?=
 =?utf-8?B?ZEtNd3ozSisvZm1LaUhBRTdlSzQ2SDFEWGwxOHRiYTBXSXEzaS8zOTdTb1U1?=
 =?utf-8?B?RTNvazZPSFBpS29pNTZmQ2tYSHV6MXo5NTV2KzBxRElBNXVpS3gwQkVsQlIw?=
 =?utf-8?B?czk4cFBoN2lZQ1FPbk9PYXAvRUw4QjNtemxBVVg1dWFlbjN4TVd0MlVDWHBT?=
 =?utf-8?B?SVYyOW5RZFRkeGRIcjBRdWVUQnRacmdkRGwzckNiazhIbHlEODczcHdqdE5Z?=
 =?utf-8?B?bjByZCtBS0J0Ui85OHRsbnFWbFY3d0VMZ0tEdlFaU3ppRDBqMjY4UjZ0Q2JM?=
 =?utf-8?B?REFubis1bU5EdWQ1eG5tVXEyby9TbTNjR1Iyd1lmUGhuYnBidGFGY1NCaVIw?=
 =?utf-8?B?SXBNWHEwM2hBZlIwbDRjeXJiVFhPNW9DaHhWdHlhYjRLV1RWbVZ2aS80Q05i?=
 =?utf-8?B?Y0FCRWVOaVVxU2luMWg5OFFCZVgwMEgxNEl4L2RMZFNWV1drM056SStXT0E5?=
 =?utf-8?B?Q0tYMmIrMUNxNVJZbEJkcmpLaVdMZGtRbVh6VmtGaWJwMWtvcFFxUXk4Rm5B?=
 =?utf-8?B?RklFTU9lNzF0cjVSLzM0YkxPWkI3SnlEaG0zS3BXd1NBazg4MEViSGhTdjcr?=
 =?utf-8?B?M1NkKzRZZFpwYXJ5Wk9oMUlkR0YyK1dwR1IzcUtDWGEzNlVYK2pWb0N2ODdP?=
 =?utf-8?B?YlhWM3ZuWHVVTFNENEZ2U1ZMTnpJcnZEdHBvV1lsNFMzcG4rQXRkTVdKZ3FS?=
 =?utf-8?B?ODJXOWF6Rlc5NUhLVThNbndmamxSUTNqSVZwNHFTMmxBVlh6N01xWUQ3MkNi?=
 =?utf-8?B?UkJPNE9QcjFCb1AyODQrb0RLUTlSTjJQbU05S2t5aEExWWYyMlFhcWpycGU3?=
 =?utf-8?B?KzVTVGZ0eUFoTUtjOGVDek5HSUIxZDhhYms1YWZyK0ZLUjNtblRTMWlFSy81?=
 =?utf-8?B?Y3pkcy9VM1BUOXczUDRKQ05aczNhZEpiK0ZBOTA5RE1aRlpWWDFpQm0yR0c3?=
 =?utf-8?B?bVpDekpobWJQUUVOQzVRbXh6dUo2eVVVbXpsY0NQckFkcm5zTzc0amV0SkZE?=
 =?utf-8?B?WjE1bXJheW9GL1ZFalhUdjVsYWYxd0FIdjluc2NsTVROZE5iYS9xcjFVZ3lF?=
 =?utf-8?Q?siKAEdi5jjpcFTtB/43xz//PKdWp3RZL4t4I2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daee8c5c-a7df-4b36-62a2-08deeda85c36
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 19:34:09.8519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkKhF/6vdMJQZY7eFWvghvQz/dU+ESJSSbJ+Tyylr6U2W/EMI189XuNAy5ciqZyo9Q+Nz6147rPSYier2ZmtY05ktCbUHUcEfinV/D7UBoQi4ajLKd1uEILXOMRUYHNU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8492

From: Frank.Li@nxp.com

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-soc-7.3

for you to fetch changes up to 55c748d596f841a18cf659ce0999f64029a5c88c:

  firmware: imx: scu: manage mailbox channels and global handle (2026-07-24 16:28:37 -0400)

----------------------------------------------------------------
i.MX SoC Changes for v7.3

- Fix OF/device_node reference count leaks in imx_src_init(),
  imx7_src_init(), and the AVIC interrupt controller driver
- Drop obsolete/unused declarations from `arch/arm/mach-imx/common.h`
- firmware: imx: scu: Refactor mailbox channel management to use a
  per-instance handle instead of a global one
- firmware: imx: sm-misc: Add NULL check for `kmalloc` return value in
  syslog_show
- soc: imx9: Add error handling for `devm_kasprintf` return value

----------------------------------------------------------------
Griffin Kroah-Hartman (1):
      soc: imx9: devm_kasprintf error handling

Li Jun (1):
      firmware: imx: sm-misc: Add NULL check for kmalloc in syslog_show

Pengpeng Hou (1):
      firmware: imx: scu: manage mailbox channels and global handle

Uwe Kleine-König (The Capable Hub) (1):
      ARM: imx: Drop obsolete stuff from common.h

Weigang He (2):
      ARM: imx: fix device_node refcount leak in imx_src_init()
      ARM: imx: fix device_node refcount leaks in imx7_src_init()

Yuho Choi (1):
      ARM: imx: avic: Fix OF node reference leaks

 arch/arm/mach-imx/avic.c       |  2 ++
 arch/arm/mach-imx/common.h     |  7 -------
 arch/arm/mach-imx/src.c        |  3 +++
 arch/arm/mach-imx/system.c     |  8 --------
 drivers/firmware/imx/imx-scu.c | 25 ++++++++++++++++++++++++-
 drivers/firmware/imx/sm-misc.c |  3 +++
 drivers/soc/imx/soc-imx9.c     |  9 +++++++++
 7 files changed, 41 insertions(+), 16 deletions(-)
