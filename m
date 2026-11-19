Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.43.123
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078831;
	b=dyPmjOyYHnZVl3zAy2sWoxpMRm8q8ci1TcYRpyW5Q/yBd1BN6yGRU3KMtVBbcQmLUg6w
	 iBJPNdsCx7VyxbcZgwDIjUluHQoGHrTW3AIpbLkRcbRpRrjCYjMO9XBZUAk4A3+R1tXaO
	 uMjNMkGODERdjb8VmjxBFGsPqO0gnhWOLfB5XBKp6huSMRAkmBAjhibwXZ8bfPb6Cxdhy
	 pB8l1toSTdjRAuQrVxtmMo/laaAn1cWlJeNxBsJqjybKqw4b7akz2/U0Y1es90alcEDbV
	 zj/Q5ZX9qzmp5XOCYFFJllAjBomZqPR9MyXi+D+i+N7OfjmrEln1JFJi3RmXD+RTvzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078831;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=sMteneEsSxuDn0rYDx/h6V9rxmYejH1cERqaiIe7Si0=;
	b=LB8Ftcygwybaret4xVfndwpzjpLkFEeDxZ51at1anfdbg2dugvO+46/WPgTOWi3jOn43
	 cKgKlUl0X6j1hM04FCJhI9ByfD9mDylFyE06QqrelpCvwmMMdu/BdZFvw9/4xskROkTm2
	 q85XgzbVtZLqM5ww5Nes9YmFiruR+sWlbE5pTwOL4+mD6mh/NkW6zr+eYlL5k7oqSDnKS
	 eBRC4cBcM9yTj5GRLxGDAGXQXHZRGNIkHCFyVl7hnn8LU9Fw4QVVkyazB2E8oeNBcRvh7
	 FV2jY1kP/Lp0f1JMmiVZ3lW3IHlp36cVwxjaQRP03lie4IJs7gmcZy9RWJ041Li3N9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=MsvU4spz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.43.123
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022123.outbound.protection.outlook.com [40.107.43.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F21060A2602
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 09:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F21060A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=MsvU4spz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELmRJswSBw9sW7SoxzYS248NyGndazZyEoSTUkwGt46leQRRzu5X6NYCRx34pU7U9PFsTGT7OPEcqIm138P39ilsQOyIADH+n1NdUdCJGQY4W2OBXovtyJIKDP5N49JXXbMtUmk6frn58zbDG1TViH3JDQD07jVDz6+uhbaVB5/a7HI6O2AISbYFQyiafeacFqES94oxS73k3BiAy/NSAcH1r4ywzLrJJCgbhLISkVEL82tUEebXdukAXTD14WUC5CGq0djtCnJ18UfGzRi0H5UR6YNju1pMl0u3PrbCHqd6ariDpa20SoZtkZOCKVDXm75q3MAa8EeQIKVjXN6GKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMteneEsSxuDn0rYDx/h6V9rxmYejH1cERqaiIe7Si0=;
 b=OK9WsF9dEFgKGqyJY+fslwWiVibOM902JcLPBUeBFkESHb9eCs+7FAFs0cu2FEo7YpWlNOIBBh8M8ABdvXca5MLkEcnucDD/w54qoCS3gSAKsRZEPbt96gWGrt1lFKzGly0suxt7RyQ+FkyFtvvkiVdwNJvj9W3KvkHL7i2/rYeBgXVIYNyjeeMQdfYOSuVipLPcd/TR0RUybhGjMonkdQoPqX3ZyaQdAKozawCzPtWZ7OqJn0p/+5WfywYInQWv5q65hk9AnwfEjsJsuRKdzoHKeyMpFMU05L3+cmtGHzZXaxZQ6ywpPoAHlQO73Nb2vRJaHWYODPoBxUZEm5m2ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMteneEsSxuDn0rYDx/h6V9rxmYejH1cERqaiIe7Si0=;
 b=MsvU4spzed0bUj4TmFCOR5U4zCj3ByVR/YVH8wMJMu1wuaxtEyGUqKSw+QZlw6k81nqy43jKci0HVpi0YSt39QBnOtjTHVYTYjpW1sWZvoR9HPAoX9U1hz7efftIlNvzkrGP310kUa4Rgmhr2y0sABul2xRSsVoXGDNnwPLlV6BXwk80ic9ozeVIQvFo5i/VKOb2DL9uei04pkTActgVk79HA4LfC04qR03DOLX7BwWk7yYZ2JDlliRCMBLWjwyhXQ3bttqEkhYQ1bbi+YVALPjmL2UvJy7qVtZVg4mh0AjRoqSvZvyEnnOawulURJ0dkwH45rVz1DH0ynIZMVJFNw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SE2P216MB360180.KORP216.PROD.OUTLOOK.COM (2603:1096:101:30b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 09:00:24 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 09:00:24 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	festevam@gmail.com,
	kernel@pengutronix.de,
	nicolas.dufresne@collabora.com,
	ming.qian@oss.nxp.com,
	marek.vasut@mailbox.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v8 05/11] media: chips-media: wave6: Add Wave6 m2m decoder
Date: Thu, 19 Nov 2026 17:59:59 +0900
Message-Id: <131b501b33d697b070553bb5ff9ffafcaea812d6.1795075581.git.nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1795075577.git.nas.chung@chipsnmedia.com>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0060.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::8) To SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b9::8)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2441:EE_|SE2P216MB360180:EE_
X-MS-Office365-Filtering-Correlation-Id: f0df32b0-8f0a-46e1-7287-08df461b8c4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|4022899009|23010399003|7416014|52116014|376014|1800799024|366016|22082099003|18002099003|6133799003|3023799007|56012099006|10067099003|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261022105027099003|261021121427099003|261022075727099003|261022115727099003|261009223027099003|261102123227099003|261009221227099003|261009220027099003|261009221727099003|261009223327099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Nx0/u9HDEDvbaqpNiVc6BN+QfjrKSBjvS613AF8ikTW3PTd/AnjAqlR/G9Pdh7jj5NOQgBTEg6HwrxYbp17tCqpHqylQv05KUoI8Tq/W4kAfsU0UXDxQJ/4RKXYAMGRsUz9GQ18zphyupAr9jUGjNyoi2DIM+hVsMN07OseS3fcm1s2kQftzJwWB9gS9Xrnm2wrIASQcbh15r4qsT9GYabgKadyqse7Y5UP9UlsE6JSgr2qc2aZXYlqIKxSFSNv44YYK+vptKfySZdHs6ho2YBXISneunPT0HFfxEhpRabAlURQ8Cy4H6GDWTkszqPAQ/eM0ArYVxIQTP2ceVcBj7oq6bdDo7HZ26MysR+RZCxKV5Z10kTrZfPPjml9ChXofTDRyjOSAbtKPXIy3Me3g7kNW9tn4+oNmSrOEiERr28qm/B5Ztgx9F21/r1v2sUMdpRpUzJSBE5AJMT7OZ8w1Rqmt6i2j4iQNRrz6ibN6xp0dOL0N36cZ9Hm2qxj98CAhASXKXHl2kwaWCmuCv0w8+BCTeRrKh9hiF9M7Ss19jkkMBb1x9CHEM6STehE+Cj4avqZQb4/SK+y/0jC21qPThrlwtDkdHqdEiMnAq8JNyGphl+zkBISKF5lGKnadAUF9ti6BSv6CLTGIqqap4qaXXbqFz7cpiMe2+ZdCFb0AhSKp0C1oA9P1jUBfBE9YOWgXPGGf4ogjTuO09kwK7Y2hTnDVLv6SwNIjuKonpEFwSKk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(23010399003)(7416014)(52116014)(376014)(1800799024)(366016)(22082099003)(18002099003)(6133799003)(3023799007)(56012099006)(10067099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261022105027099003)(261021121427099003)(261022075727099003)(261022115727099003)(261009223027099003)(261102123227099003)(261009221227099003)(261009220027099003)(261009221727099003)(261009223327099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kQj52Jv/3BYdbX1Kj1hS9cMN39fsNveJKDyq1SRWiV0zLLQgas7ucxM/5jRz?=
 =?us-ascii?Q?iZif3mHiHRaLRfFg1nGDoGBz02+0YpDNIw+RUKdHlW0a1Xj0tzqD4KGgZJwG?=
 =?us-ascii?Q?I71RweVAKQR7Uin4phkk/9FQdcZovN+wVR+ie9/8s/OcKcfJrN6luLQbjguP?=
 =?us-ascii?Q?gm2BXNpoFEQcYd6I0xFAcwzO47CnBNHgYZHlAX0hC4bD5XxhNYcVnrQzEfIO?=
 =?us-ascii?Q?5FF9Tycr/qFURzDhQd0sb0KIEfAOHou8BACHu2XZu1+cYEH4K6lVDVTeC92s?=
 =?us-ascii?Q?bYTYrRt9gCF909+go0I95WDmywUpnoC8gP4Jhr4xpUEwxYXjyR03mAo9Auwz?=
 =?us-ascii?Q?fbIAEjYfO7KXz/B6lWPw9T1fWTbgfiYWYcf1yyPzOgW9SUjdklxI3ukx7JKm?=
 =?us-ascii?Q?p+SHQP1RcJyet4RL8oPfFCk/gRFSiden6GU4x2thI5CEz2izK4nWqszv9WbL?=
 =?us-ascii?Q?odPBu4HsGBYU69hN0NFGUnkbna+ba80txiZax+rvRa/MN63MO1srYQbbdNjM?=
 =?us-ascii?Q?DJBIYr0XuQHEceR8wqVipVQM0owrBVt33PwfCGzviKWFULVrSmwANNH/t5ML?=
 =?us-ascii?Q?FgZ8+UT7auXKSP29SCnGs4uX7kT+olRvfhw7oQWd2luB8FS+7/XjqBeXwvAm?=
 =?us-ascii?Q?MISe4g5qwFbk0RdZDv9HN6KaQpt1I4qpL6YM6XKzjt7UehnE5nX0cz47hxb/?=
 =?us-ascii?Q?+Z1i/PXF9Sk6PxMCxy2eZoJg4cRskqtL0VpxVMmbCDCswgFoYwrkM8cUXPUe?=
 =?us-ascii?Q?lc3CmNb7JH9MVrss0niPy+lvpwapOMWeHtDBTbUQKiwJS1n7fY+RdzQB7RQd?=
 =?us-ascii?Q?lBY9GhJ0/0PPD56CoWjwKn3qGN3MQ/cqVAwKYIwF9fKS8nVYQL//8MibYE6l?=
 =?us-ascii?Q?po6wxjiJYCkeQMw2zbzDWFVFz+cYTaNGzNE+EYzoEvwjafUISy+9sv0oQGyu?=
 =?us-ascii?Q?n4kHUv4Tcz3F5YxrzFb+3FF89sFVn/k4hh7CPQxYFd3Ewf2Kiej6MMhD1y7t?=
 =?us-ascii?Q?LYxL0piuXsoLKiqgidsno/8kFg9x9JSqfj6rreMbkgEjxbcWTFprNXDg97fG?=
 =?us-ascii?Q?UdTvvcPJxJpxnSvItXCWTYKn9D1dgDdfdDbfMped5xvmNNAFGGd1k5zOkMWf?=
 =?us-ascii?Q?zyoUzLF7LPTdwmZek+8+T0FUKL1PMK4TxYM2TUM3RYWnWnbCILY70Llua0+Z?=
 =?us-ascii?Q?vxEheikAlQBZ86naiBkR0ddHzjZc41ZPWMnSMoFm/vgZvvQfwThCq1Hz7rLR?=
 =?us-ascii?Q?SI8vDbzQQpWdiijPU+ZxfEcyqKwVOHavCW24THPkLPdaeQ1i2jfO6wzcYef+?=
 =?us-ascii?Q?XvZ3G2SaxsV32eF9ydyFsCFro9p8H8FLvf+qimqWS/4Ptim/XS11lACbrzLU?=
 =?us-ascii?Q?bf/aCQW4C2DwhzYud+j9MXvVyA61iYUggea1vHiX+1OZRNl1RrzAw4F+5ANS?=
 =?us-ascii?Q?Z8M2KkvPJjys/regCLxZx9kwAszr4mYa5XEkMBjAOYcFYqhT7yHGuOYoT08x?=
 =?us-ascii?Q?wA8M7Udetvj7D7rNTPBrRqsiBAp0opk9o1XLArjMGo7fBehEunKs3mkn4VT2?=
 =?us-ascii?Q?5QzJGfBCyHnm77L82hUORFhw+0Iu6cLMATypN8qgSIqyMSmS6ENGcnXgSb8a?=
 =?us-ascii?Q?KctlviibkNnfJnkMFThukrnRquZ9wAWJl8bDmsr8XxXrbRZG0aQ7sNE5iqne?=
 =?us-ascii?Q?OjBYT30ybtOFZcEynXMvWLYaSbET8koNbcCtt17v9J6iXimDIb3yqYyUuzHU?=
 =?us-ascii?Q?hAPF5MpkXQO5LZX5I6tLDK7CrhCki6A=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0df32b0-8f0a-46e1-7287-08df461b8c4d
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:00:24.6320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UUBfTVW2tyJCYP2soUG8mlTdIHODM0i9viGqwVekyhwOKGIPzJCBDNq32lJKrHYPfpe/tlchx4e+7nd9tGOi6hnTj6JsT0k6UncgBwfiJGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB360180

Add the V4L2 m2m stateful decoder for the Chips&Media Wave6 video codec
IP.

The decoder supports the following features and formats:
- Supported codecs: AVC, HEVC (8-bit streams only)
- Supported raw (CAPTURE) formats:
  * V4L2_PIX_FMT_YUV420/NV12/NV21
  * V4L2_PIX_FMT_YUV420M/NV12M/NV21M
- Supports scale down
- Supports dynamic resolution change

While other versions of the Wave6 IP may support VP9 and AV1 decoding,
those formats are not implemented or validated in this driver at this
time.

Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../media/platform/chips-media/wave6/Kconfig  |    3 +-
 .../media/platform/chips-media/wave6/Makefile |    1 +
 .../chips-media/wave6/wave6-vpu-core.c        |   21 +
 .../chips-media/wave6/wave6-vpu-core.h        |    2 +
 .../chips-media/wave6/wave6-vpu-dec.c         | 1935 +++++++++++++++++
 .../platform/chips-media/wave6/wave6-vpuapi.h |    2 +
 .../chips-media/wave6/wave6-vpuconfig.h       |   10 +
 7 files changed, 1973 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c

diff --git a/drivers/media/platform/chips-media/wave6/Kconfig b/drivers/media/platform/chips-media/wave6/Kconfig
index 6d87d26fa9fc..9f2c2f92ee38 100644
--- a/drivers/media/platform/chips-media/wave6/Kconfig
+++ b/drivers/media/platform/chips-media/wave6/Kconfig
@@ -10,6 +10,7 @@ config VIDEO_WAVE6_VPU
 	select GENERIC_ALLOCATOR
 	help
 	  Chips&Media Wave6 stateful codec driver.
-	  The wave6 driver manages shared resources such as firmware memory.
+	  It provides decoding capabilities for H.264, HEVC,
+	  and other video formats.
 	  To compile this driver as a module, choose M here: the
 	  module will be called wave6.
diff --git a/drivers/media/platform/chips-media/wave6/Makefile b/drivers/media/platform/chips-media/wave6/Makefile
index 08f11724b81c..9bfb8b45d091 100644
--- a/drivers/media/platform/chips-media/wave6/Makefile
+++ b/drivers/media/platform/chips-media/wave6/Makefile
@@ -4,5 +4,6 @@ wave6-objs += wave6-vpu.o \
 	      wave6-vpu-core.o \
 	      wave6-vpu-v4l2.o \
 	      wave6-vpuapi.o \
+	      wave6-vpu-dec.o \
 	      wave6-hw.o
 obj-$(CONFIG_VIDEO_WAVE6_VPU) += wave6.o
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
index 67c6666579d9..4fd86472b427 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
@@ -181,6 +181,11 @@ static void wave6_vpu_core_free_temp_vbuf(void *data)
 	wave6_vdi_free_dma(&core->temp_vbuf);
 }
 
+static void wave6_vpu_core_unregister_dec(void *data)
+{
+	wave6_vpu_dec_unregister_device(data);
+}
+
 static int wave6_vpu_core_probe(struct platform_device *pdev)
 {
 	struct vpu_core_device *core;
@@ -278,6 +283,22 @@ static int wave6_vpu_core_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (core->res->codec_types & WAVE6_IS_DEC) {
+		ret = wave6_vpu_dec_register_device(core);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"failed to register video_dev_dec: %d\n", ret);
+			return ret;
+		}
+
+		ret = devm_add_action_or_reset(&pdev->dev, wave6_vpu_core_unregister_dec, core);
+		if (ret)
+			return ret;
+	}
+
+	dev_dbg(&pdev->dev, "Added wave6 driver with caps %s\n",
+		core->res->codec_types & WAVE6_IS_DEC ? "'DECODE'" : "");
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
index 788b1403c1d3..1c473c8ce562 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
@@ -92,6 +92,8 @@ const char *wave6_vpu_instance_state_name(enum vpu_instance_state state);
 void wave6_vpu_set_instance_state(struct vpu_instance *inst,
 				  enum vpu_instance_state state);
 int wave6_vpu_wait_interrupt(struct vpu_instance *inst, unsigned int timeout);
+int wave6_vpu_dec_register_device(struct vpu_core_device *core);
+void wave6_vpu_dec_unregister_device(struct vpu_core_device *core);
 void wave6_vpu_device_run_timeout(struct work_struct *work);
 void wave6_vpu_finish_job(struct vpu_instance *inst);
 int wave6_vpu_init_m2m_dev(struct vpu_core_device *core);
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
new file mode 100644
index 000000000000..54b408922bbc
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
@@ -0,0 +1,1935 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - v4l2 stateful decoder interface
+ *
+ * Copyright (C) 2026 CHIPS&MEDIA INC
+ */
+
+#include <linux/pm_runtime.h>
+
+#include "wave6-vpu-core.h"
+
+#define VPU_DEC_DEV_NAME "C&M Wave6 VPU decoder"
+#define VPU_DEC_DRV_NAME "wave6-dec"
+
+static const struct vpu_format wave6_vpu_dec_fmt_list[2][6] = {
+	[VPU_FMT_TYPE_CODEC] = {
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_HEVC,
+			.max_width = W6_MAX_DEC_PIC_WIDTH,
+			.min_width = W6_MIN_DEC_PIC_WIDTH,
+			.max_height = W6_MAX_DEC_PIC_HEIGHT,
+			.min_height = W6_MIN_DEC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_H264,
+			.max_width = W6_MAX_DEC_PIC_WIDTH,
+			.min_width = W6_MIN_DEC_PIC_WIDTH,
+			.max_height = W6_MAX_DEC_PIC_HEIGHT,
+			.min_height = W6_MIN_DEC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+	},
+	[VPU_FMT_TYPE_RAW] = {
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420,
+			.max_width = W6_MAX_DEC_PIC_WIDTH,
+			.min_width = W6_MIN_DEC_PIC_WIDTH,
+			.max_height = W6_MAX_DEC_PIC_HEIGHT,
+			.min_height = W6_MIN_DEC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12,
+			.max_width = W6_MAX_DEC_PIC_WIDTH,
+			.min_width = W6_MIN_DEC_PIC_WIDTH,
+			.max_height = W6_MAX_DEC_PIC_HEIGHT,
+			.min_height = W6_MIN_DEC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21,
+			.max_width = W6_MAX_DEC_PIC_WIDTH,
+			.min_width = W6_MIN_DEC_PIC_WIDTH,
+			.max_height = W6_MAX_DEC_PIC_HEIGHT,
+			.min_height = W6_MIN_DEC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_CRCB_ORDER,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420M,
+			.max_width = W6_MAX_DEC_PIC_WIDTH,
+			.min_width = W6_MIN_DEC_PIC_WIDTH,
+			.max_height = W6_MAX_DEC_PIC_HEIGHT,
+			.min_height = W6_MIN_DEC_PIC_HEIGHT,
+			.num_planes = 3,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12M,
+			.max_width = W6_MAX_DEC_PIC_WIDTH,
+			.min_width = W6_MIN_DEC_PIC_WIDTH,
+			.max_height = W6_MAX_DEC_PIC_HEIGHT,
+			.min_height = W6_MIN_DEC_PIC_HEIGHT,
+			.num_planes = 2,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21M,
+			.max_width = W6_MAX_DEC_PIC_WIDTH,
+			.min_width = W6_MIN_DEC_PIC_WIDTH,
+			.max_height = W6_MAX_DEC_PIC_HEIGHT,
+			.min_height = W6_MIN_DEC_PIC_HEIGHT,
+			.num_planes = 2,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_CRCB_ORDER,
+		},
+	}
+};
+
+static const struct vpu_format *wave6_find_vpu_fmt(unsigned int v4l2_pix_fmt,
+						   enum vpu_fmt_type type)
+{
+	for (int i = 0; i < ARRAY_SIZE(wave6_vpu_dec_fmt_list[type]); i++) {
+		if (wave6_vpu_dec_fmt_list[type][i].v4l2_pix_fmt == v4l2_pix_fmt)
+			return &wave6_vpu_dec_fmt_list[type][i];
+	}
+
+	return NULL;
+}
+
+static const struct vpu_format *wave6_find_vpu_fmt_by_idx(unsigned int idx,
+							  enum vpu_fmt_type type)
+{
+	if (idx >= ARRAY_SIZE(wave6_vpu_dec_fmt_list[type]))
+		return NULL;
+
+	if (!wave6_vpu_dec_fmt_list[type][idx].v4l2_pix_fmt)
+		return NULL;
+
+	return &wave6_vpu_dec_fmt_list[type][idx];
+}
+
+static void wave6_vpu_dec_release_fb(struct vpu_instance *inst)
+{
+	for (int i = 0; i < WAVE6_MAX_FBS; i++) {
+		wave6_vdi_free_dma(&inst->frame_vbuf[i]);
+		memset(&inst->frame_buf[i], 0, sizeof(struct frame_buffer));
+		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_FBC_Y_TBL][i]);
+		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_FBC_C_TBL][i]);
+		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_MV_COL][i]);
+	}
+}
+
+static void wave6_vpu_dec_destroy_instance(struct vpu_instance *inst)
+{
+	u32 fail_res = 0;
+	int ret;
+
+	wave6_vpu_disable_instance(inst);
+
+	ret = wave6_vpu_dec_close(inst, &fail_res);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed destroy instance: %d (%d)\n",
+			ret, fail_res);
+	}
+
+	scoped_guard(spinlock, &inst->dev->inst_lock)
+		list_del_init(&inst->list);
+	wave6_vpu_dec_release_fb(inst);
+	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_NONE);
+
+	pm_runtime_put_sync(inst->dev->dev);
+	wave6_vpu_core_deactivate(inst->dev);
+}
+
+static void wave6_handle_bitstream_buffer(struct vpu_instance *inst,
+					  bool stream_end)
+{
+	struct vb2_v4l2_buffer *src_buf = NULL;
+	u32 src_size = 0;
+	int ret;
+
+	if (!stream_end)
+		src_buf = v4l2_m2m_next_src_buf(inst->v4l2_fh.m2m_ctx);
+	if (src_buf) {
+		struct vpu_buffer *vpu_buf = wave6_to_vpu_buf(src_buf);
+		dma_addr_t rd_ptr = wave6_get_dma_addr(src_buf, 0);
+
+		if (vpu_buf->consumed) {
+			dev_dbg(inst->dev->dev, "%s: Already consumed buffer\n",
+				__func__);
+			return;
+		}
+
+		vpu_buf->consumed = true;
+		wave6_vpu_dec_set_rd_ptr(inst, rd_ptr, true);
+
+		src_size = vb2_get_plane_payload(&src_buf->vb2_buf, 0) -
+			   src_buf->planes[0].data_offset;
+	}
+
+	if (!src_size) {
+		dma_addr_t rd = 0, wr = 0;
+
+		wave6_vpu_dec_get_bitstream_buffer(inst, &rd, &wr);
+		wave6_vpu_dec_set_rd_ptr(inst, wr, true);
+	}
+
+	ret = wave6_vpu_dec_update_bitstream_buffer(inst, src_size);
+	if (ret) {
+		dev_dbg(inst->dev->dev, "%s: Update bitstream buffer fail %d\n",
+			__func__, ret);
+		return;
+	}
+}
+
+static void wave6_update_pix_fmt_cap(struct v4l2_pix_format_mplane *pix_mp,
+				     unsigned int width,
+				     unsigned int height,
+				     bool new_resolution)
+{
+	unsigned int aligned_width;
+
+	if (new_resolution)
+		pix_mp->plane_fmt[0].bytesperline = 0;
+
+	aligned_width = round_up(width, W6_DEC_BUF_ALIGNMENT);
+	wave6_update_pix_fmt(pix_mp, aligned_width, height);
+}
+
+static int wave6_allocate_aux_buffer(struct vpu_instance *inst,
+				     enum aux_buffer_type type,
+				     int num)
+{
+	struct aux_buffer_size_info size_info;
+	unsigned int size;
+	int ret;
+
+	size_info.width = inst->src_fmt.width;
+	size_info.height = inst->src_fmt.height;
+	size_info.type = type;
+
+	ret = wave6_vpu_dec_get_aux_buffer_size(inst, size_info, &size);
+	if (ret) {
+		dev_err(inst->dev->dev, "%s: Get size fail (type %d)\n", __func__, type);
+		return ret;
+	}
+
+	num = min_t(u32, num, WAVE6_MAX_FBS);
+	for (int i = 0; i < num; i++) {
+		inst->aux_vbuf[type][i].size = size;
+		ret = wave6_vdi_alloc_dma(inst->dev->dev, &inst->aux_vbuf[type][i]);
+		if (ret) {
+			dev_err(inst->dev->dev, "%s: Alloc fail (type %d)\n", __func__, type);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_dec_prepare_fb(struct vpu_instance *inst)
+{
+	int ret;
+	unsigned int fb_num;
+	unsigned int mv_num;
+	unsigned int fb_stride;
+	unsigned int fb_height;
+	unsigned int luma_size;
+	unsigned int chroma_size;
+	struct dec_seq_info *seq_info = &inst->codec_info->dec_info.seq_info;
+
+	fb_num = seq_info->min_frame_buffer_count;
+	mv_num = seq_info->req_mv_buffer_count;
+
+	fb_stride = ALIGN(inst->src_fmt.width, W6_FBC_BUF_ALIGNMENT);
+	fb_height = ALIGN(inst->src_fmt.height, W6_FBC_BUF_ALIGNMENT);
+
+	luma_size = fb_stride * fb_height;
+	chroma_size = ALIGN(fb_stride / 2, W6_FBC_BUF_ALIGNMENT) * fb_height;
+
+	for (unsigned int i = 0; i < fb_num; i++) {
+		struct frame_buffer *frame = &inst->frame_buf[i];
+		struct vpu_buf *vframe = &inst->frame_vbuf[i];
+
+		vframe->size = luma_size + chroma_size;
+		ret = wave6_vdi_alloc_dma(inst->dev->dev, vframe);
+		if (ret) {
+			dev_err(inst->dev->dev, "alloc FBC buffer fail : %zu\n",
+				vframe->size);
+			goto error;
+		}
+
+		frame->buf_y = vframe->daddr;
+		frame->buf_cb = vframe->daddr + luma_size;
+		frame->buf_cr = (dma_addr_t)-1;
+		frame->stride = fb_stride;
+		frame->height = fb_height;
+		frame->map_type = COMPRESSED_FRAME_MAP;
+	}
+
+	ret = wave6_allocate_aux_buffer(inst, AUX_BUF_FBC_Y_TBL, fb_num);
+	if (ret)
+		goto error;
+
+	ret = wave6_allocate_aux_buffer(inst, AUX_BUF_FBC_C_TBL, fb_num);
+	if (ret)
+		goto error;
+
+	ret = wave6_allocate_aux_buffer(inst, AUX_BUF_MV_COL, mv_num);
+	if (ret)
+		goto error;
+
+	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_PIC_RUN);
+
+	return 0;
+
+error:
+	wave6_vpu_dec_release_fb(inst);
+
+	return ret;
+}
+
+static void wave6_vpu_dec_handle_dst_buffer(struct vpu_instance *inst)
+{
+	struct vb2_v4l2_buffer *dst_buf;
+	struct v4l2_m2m_buffer *v4l2_m2m_buf;
+	struct vpu_buffer *vpu_buf;
+	u32 fb_stride = inst->dst_fmt.plane_fmt[0].bytesperline;
+	u32 luma_size = fb_stride * inst->dst_fmt.height;
+	u32 chroma_size = (fb_stride / 2) * (inst->dst_fmt.height / 2);
+	struct frame_buffer disp_buffer = { };
+	struct dec_seq_info *seq_info = &inst->codec_info->dec_info.seq_info;
+	int consumed_num = wave6_vpu_get_consumed_fb_num(inst);
+	int ret;
+
+	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
+		dst_buf = &v4l2_m2m_buf->vb;
+		vpu_buf = wave6_to_vpu_buf(dst_buf);
+
+		if (vpu_buf->consumed)
+			continue;
+
+		if (consumed_num >= WAVE6_MAX_FBS)
+			break;
+
+		if (inst->dst_fmt.num_planes == 1) {
+			disp_buffer.buf_y = wave6_get_dma_addr(dst_buf, 0);
+			disp_buffer.buf_cb = disp_buffer.buf_y + luma_size;
+			disp_buffer.buf_cr = disp_buffer.buf_cb + chroma_size;
+		} else if (inst->dst_fmt.num_planes == 2) {
+			disp_buffer.buf_y = wave6_get_dma_addr(dst_buf, 0);
+			disp_buffer.buf_cb = wave6_get_dma_addr(dst_buf, 1);
+			disp_buffer.buf_cr = disp_buffer.buf_cb + chroma_size;
+		} else if (inst->dst_fmt.num_planes == 3) {
+			disp_buffer.buf_y = wave6_get_dma_addr(dst_buf, 0);
+			disp_buffer.buf_cb = wave6_get_dma_addr(dst_buf, 1);
+			disp_buffer.buf_cr = wave6_get_dma_addr(dst_buf, 2);
+		}
+		disp_buffer.height = inst->src_fmt.height;
+		disp_buffer.stride = fb_stride;
+		disp_buffer.map_type = LINEAR_FRAME_MAP;
+		disp_buffer.luma_bit_depth = seq_info->luma_bit_depth;
+		disp_buffer.chroma_bit_depth = seq_info->chroma_bit_depth;
+		disp_buffer.c_fmt_idc = seq_info->c_fmt_idc;
+
+		ret = wave6_vpu_dec_register_display_buffer(inst, disp_buffer);
+		if (ret) {
+			dev_err(inst->dev->dev, "fail register display buffer %d", ret);
+			break;
+		}
+
+		vpu_buf->consumed = true;
+		consumed_num++;
+	}
+
+	if (!inst->fbc_buf_registered) {
+		ret = wave6_vpu_dec_register_frame_buffer(inst);
+		if (ret)
+			dev_err(inst->dev->dev, "register frame buffer fail %d\n", ret);
+		else
+			inst->fbc_buf_registered = true;
+	}
+}
+
+static enum v4l2_quantization to_v4l2_quantization(u32 video_full_range_flag)
+{
+	switch (video_full_range_flag) {
+	case 0:
+		return V4L2_QUANTIZATION_LIM_RANGE;
+	case 1:
+		return V4L2_QUANTIZATION_FULL_RANGE;
+	default:
+		return V4L2_QUANTIZATION_DEFAULT;
+	}
+}
+
+static enum v4l2_colorspace to_v4l2_colorspace(u32 colour_primaries)
+{
+	switch (colour_primaries) {
+	case 1:
+		return V4L2_COLORSPACE_REC709;
+	case 4:
+		return V4L2_COLORSPACE_470_SYSTEM_M;
+	case 5:
+		return V4L2_COLORSPACE_470_SYSTEM_BG;
+	case 6:
+		return V4L2_COLORSPACE_SMPTE170M;
+	case 7:
+		return V4L2_COLORSPACE_SMPTE240M;
+	case 9:
+		return V4L2_COLORSPACE_BT2020;
+	case 11:
+		return V4L2_COLORSPACE_DCI_P3;
+	default:
+		return V4L2_COLORSPACE_DEFAULT;
+	}
+}
+
+static enum v4l2_xfer_func to_v4l2_xfer_func(u32 transfer_characteristics)
+{
+	switch (transfer_characteristics) {
+	case 1:
+		return V4L2_XFER_FUNC_709;
+	case 6:
+		return V4L2_XFER_FUNC_709;
+	case 7:
+		return V4L2_XFER_FUNC_SMPTE240M;
+	case 8:
+		return V4L2_XFER_FUNC_NONE;
+	case 13:
+		return V4L2_XFER_FUNC_SRGB;
+	case 14:
+		return V4L2_XFER_FUNC_709;
+	case 16:
+		return V4L2_XFER_FUNC_SMPTE2084;
+	default:
+		return V4L2_XFER_FUNC_DEFAULT;
+	}
+}
+
+static enum v4l2_ycbcr_encoding to_v4l2_ycbcr_encoding(u32 matrix_coeffs)
+{
+	switch (matrix_coeffs) {
+	case 1:
+		return V4L2_YCBCR_ENC_709;
+	case 5:
+		return V4L2_YCBCR_ENC_601;
+	case 6:
+		return V4L2_YCBCR_ENC_601;
+	case 7:
+		return V4L2_YCBCR_ENC_SMPTE240M;
+	case 9:
+		return V4L2_YCBCR_ENC_BT2020;
+	case 10:
+		return V4L2_YCBCR_ENC_BT2020_CONST_LUM;
+	default:
+		return V4L2_YCBCR_ENC_DEFAULT;
+	}
+}
+
+static void wave6_update_color_info(struct vpu_instance *inst,
+				    struct dec_seq_info *seq_info)
+{
+	struct color_param *color = &seq_info->color;
+
+	if (!color->video_signal_type_present)
+		goto set_default_all;
+
+	inst->quantization = to_v4l2_quantization(color->color_range);
+
+	if (!color->color_description_present)
+		goto set_default_color;
+
+	inst->colorspace = to_v4l2_colorspace(color->color_primaries);
+	inst->xfer_func = to_v4l2_xfer_func(color->transfer_characteristics);
+	inst->ycbcr_enc = to_v4l2_ycbcr_encoding(color->matrix_coefficients);
+
+	return;
+
+set_default_all:
+	inst->quantization = V4L2_QUANTIZATION_DEFAULT;
+set_default_color:
+	inst->colorspace = V4L2_COLORSPACE_DEFAULT;
+	inst->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	inst->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+}
+
+static enum v4l2_mpeg_video_hevc_profile to_v4l2_hevc_profile(u32 profile)
+{
+	switch (profile) {
+	case HEVC_PROFILE_MAIN:
+		return V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN;
+	case HEVC_PROFILE_STILLPICTURE:
+		return V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE;
+	default:
+		return V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN;
+	}
+}
+
+static enum v4l2_mpeg_video_h264_profile to_v4l2_h264_profile(u32 profile)
+{
+	switch (profile) {
+	case H264_PROFILE_BP:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE;
+	case H264_PROFILE_MP:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_MAIN;
+	case H264_PROFILE_EXTENDED:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED;
+	case H264_PROFILE_HP:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_HIGH;
+	default:
+		return V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE;
+	}
+}
+
+static void wave6_update_v4l2_ctrls(struct vpu_instance *inst,
+				    struct dec_seq_info *info)
+{
+	struct v4l2_ctrl *ctrl;
+	u32 min_disp_cnt;
+
+	min_disp_cnt = info->frame_buf_delay + 1;
+	ctrl = v4l2_ctrl_find(&inst->v4l2_ctrl_hdl,
+			      V4L2_CID_MIN_BUFFERS_FOR_CAPTURE);
+	if (ctrl)
+		v4l2_ctrl_s_ctrl(ctrl, min_disp_cnt);
+
+	if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_HEVC) {
+		ctrl = v4l2_ctrl_find(&inst->v4l2_ctrl_hdl,
+				      V4L2_CID_MPEG_VIDEO_HEVC_PROFILE);
+		if (ctrl)
+			v4l2_ctrl_s_ctrl(ctrl, to_v4l2_hevc_profile(info->profile));
+	} else if (inst->src_fmt.pixelformat == V4L2_PIX_FMT_H264) {
+		ctrl = v4l2_ctrl_find(&inst->v4l2_ctrl_hdl,
+				      V4L2_CID_MPEG_VIDEO_H264_PROFILE);
+		if (ctrl)
+			v4l2_ctrl_s_ctrl(ctrl, to_v4l2_h264_profile(info->profile));
+	}
+}
+
+static int wave6_vpu_dec_start_decode(struct vpu_instance *inst)
+{
+	struct dec_param pic_param;
+	int ret;
+	u32 fail_res = 0;
+
+	memset(&pic_param, 0, sizeof(struct dec_param));
+
+	ret = wave6_vpu_dec_start_one_frame(inst, &pic_param, &fail_res);
+	if (ret) {
+		struct vb2_v4l2_buffer *src_buf = NULL;
+
+		dev_err(inst->dev->dev, "[%d] %s: fail %d\n", inst->id, __func__, ret);
+		wave6_vpu_set_instance_state(inst, VPU_INST_STATE_ERROR);
+		vb2_queue_error(v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx));
+		vb2_queue_error(v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx));
+
+		src_buf = v4l2_m2m_src_buf_remove(inst->v4l2_fh.m2m_ctx);
+		if (src_buf) {
+			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+			inst->sequence++;
+			inst->processed_buf_num++;
+			inst->error_buf_num++;
+		}
+	}
+
+	return ret;
+}
+
+static void wave6_vpu_dec_src_buf_done(struct vpu_instance *inst,
+				       struct vb2_v4l2_buffer *src_buf,
+				       enum vb2_buffer_state state)
+{
+	scoped_guard(mutex, &inst->lock) {
+		v4l2_m2m_src_buf_remove_by_buf(inst->v4l2_fh.m2m_ctx, src_buf);
+		if (inst->drain_src_buf_num)
+			inst->drain_src_buf_num--;
+	}
+
+	v4l2_m2m_buf_done(src_buf, state);
+}
+
+static void wave6_handle_decoded_frame(struct vpu_instance *inst,
+				       struct dec_output_info *info)
+{
+	struct vb2_v4l2_buffer *src_buf;
+	struct vb2_v4l2_buffer *dst_buf;
+	struct vpu_buffer *vpu_buf;
+	enum vb2_buffer_state state;
+
+	state = info->decoding_success ? VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
+
+	src_buf = v4l2_m2m_next_src_buf(inst->v4l2_fh.m2m_ctx);
+	if (!src_buf) {
+		dev_err(inst->dev->dev, "[%d] decoder can't find src buffer\n", inst->id);
+		return;
+	}
+
+	vpu_buf = wave6_to_vpu_buf(src_buf);
+	if (!vpu_buf || !vpu_buf->consumed) {
+		dev_err(inst->dev->dev, "[%d] src buffer is not consumed\n", inst->id);
+		return;
+	}
+
+	dst_buf = wave6_get_dst_buf_by_addr(inst, info->frame_decoded_addr);
+	if (dst_buf) {
+		struct vpu_buffer *dst_vpu_buf = wave6_to_vpu_buf(dst_buf);
+
+		if (wave6_to_vpu_buf(dst_buf)->used) {
+			dev_warn(inst->dev->dev, "[%d] duplication frame buffer\n", inst->id);
+			inst->sequence++;
+		}
+		v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
+		dst_vpu_buf->used = true;
+		if (state == VB2_BUF_STATE_ERROR)
+			dst_vpu_buf->error = true;
+	}
+
+	if (state == VB2_BUF_STATE_ERROR) {
+		dev_dbg(inst->dev->dev, "[%d] error frame %d\n", inst->id, inst->sequence);
+		inst->error_buf_num++;
+	}
+	wave6_vpu_dec_src_buf_done(inst, src_buf, state);
+	inst->processed_buf_num++;
+}
+
+static void wave6_handle_skipped_frame(struct vpu_instance *inst)
+{
+	struct vb2_v4l2_buffer *src_buf;
+	struct vpu_buffer *vpu_buf;
+
+	src_buf = v4l2_m2m_next_src_buf(inst->v4l2_fh.m2m_ctx);
+	if (!src_buf)
+		return;
+
+	vpu_buf = wave6_to_vpu_buf(src_buf);
+	if (!vpu_buf || !vpu_buf->consumed)
+		return;
+
+	dev_dbg(inst->dev->dev, "[%d] skip frame %d\n", inst->id, inst->sequence);
+
+	inst->sequence++;
+	inst->processed_buf_num++;
+	inst->error_buf_num++;
+	wave6_vpu_dec_src_buf_done(inst, src_buf, VB2_BUF_STATE_ERROR);
+}
+
+static void wave6_handle_display_frame(struct vpu_instance *inst,
+				       dma_addr_t addr, enum vb2_buffer_state state)
+{
+	struct vb2_v4l2_buffer *dst_buf;
+	struct vpu_buffer *vpu_buf;
+
+	dst_buf = wave6_get_dst_buf_by_addr(inst, addr);
+	if (!dst_buf)
+		return;
+
+	vpu_buf = wave6_to_vpu_buf(dst_buf);
+	if (!vpu_buf->used) {
+		dev_dbg(inst->dev->dev, "[%d] recycle display buffer\n", inst->id);
+		vpu_buf->consumed = false;
+		return;
+	}
+
+	for (int i = 0; i < inst->dst_fmt.num_planes; i++)
+		vb2_set_plane_payload(&dst_buf->vb2_buf, i,
+				      inst->dst_fmt.plane_fmt[i].sizeimage);
+
+	if (vpu_buf->error)
+		state = VB2_BUF_STATE_ERROR;
+	dst_buf->sequence = inst->sequence++;
+	dst_buf->field = V4L2_FIELD_NONE;
+	if (state == VB2_BUF_STATE_ERROR)
+		dev_dbg(inst->dev->dev, "[%d] discard frame %d\n", inst->id, dst_buf->sequence);
+	v4l2_m2m_dst_buf_remove_by_buf(inst->v4l2_fh.m2m_ctx, dst_buf);
+	v4l2_m2m_buf_done(dst_buf, state);
+}
+
+static void wave6_handle_display_frames(struct vpu_instance *inst,
+					struct dec_output_info *info)
+{
+	for (int i = 0; i < info->disp_frame_num; i++)
+		wave6_handle_display_frame(inst,
+					   info->disp_frame_addr[i],
+					   VB2_BUF_STATE_DONE);
+}
+
+static void wave6_handle_discard_frames(struct vpu_instance *inst,
+					struct dec_output_info *info)
+{
+	for (int i = 0; i < info->release_disp_frame_num; i++)
+		wave6_handle_display_frame(inst,
+					   info->release_disp_frame_addr[i],
+					   VB2_BUF_STATE_ERROR);
+}
+
+static void wave6_handle_last_frame(struct vpu_instance *inst,
+				    struct vb2_v4l2_buffer *dst_buf)
+{
+	lockdep_assert_held(&inst->lock);
+
+	if (!dst_buf) {
+		dst_buf = v4l2_m2m_dst_buf_remove(inst->v4l2_fh.m2m_ctx);
+		if (!dst_buf) {
+			inst->next_dst_buf_last = true;
+			return;
+		}
+	}
+
+	for (int i = 0; i < inst->dst_fmt.num_planes; i++)
+		vb2_set_plane_payload(&dst_buf->vb2_buf, i, 0);
+
+	dst_buf->flags |= V4L2_BUF_FLAG_LAST;
+	dst_buf->field = V4L2_FIELD_NONE;
+	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
+}
+
+static void wave6_vpu_dec_finish_drain(struct vpu_instance *inst)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+
+	dev_dbg(inst->dev->dev, "[%d] drain done\n", inst->id);
+
+	v4l2_m2m_set_src_buffered(m2m_ctx, false);
+
+	guard(mutex)(&inst->lock);
+
+	v4l2_m2m_mark_stopped(m2m_ctx);
+	inst->drain = false;
+	wave6_handle_last_frame(inst, NULL);
+}
+
+static void wave6_vpu_dec_cancel_drain(struct vpu_instance *inst)
+{
+	scoped_guard(mutex, &inst->lock) {
+		inst->drain = false;
+		inst->drain_src_buf_num = 0;
+	}
+
+	v4l2_m2m_set_src_buffered(inst->v4l2_fh.m2m_ctx, false);
+}
+
+static void wave6_vpu_dec_retry_one_frame(struct vpu_instance *inst)
+{
+	struct vb2_v4l2_buffer *src_buf;
+	struct vpu_buffer *vpu_buf;
+
+	src_buf = v4l2_m2m_next_src_buf(inst->v4l2_fh.m2m_ctx);
+	if (!src_buf)
+		return;
+
+	vpu_buf = wave6_to_vpu_buf(src_buf);
+	vpu_buf->consumed = false;
+}
+
+static void wave6_vpu_dec_handle_source_change(struct vpu_instance *inst)
+{
+	static const struct v4l2_event vpu_event_src_ch = {
+		.type = V4L2_EVENT_SOURCE_CHANGE,
+		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
+	};
+	struct dec_seq_info *info = &inst->codec_info->dec_info.seq_info;
+
+	dev_dbg(inst->dev->dev, "pic size %dx%d profile %d, min_fb_cnt : %d | min_disp_cnt : %d\n",
+		info->pic_width, info->pic_height,
+		info->profile, info->min_frame_buffer_count, info->frame_buf_delay);
+
+	wave6_vpu_dec_retry_one_frame(inst);
+	wave6_vpu_dec_reset_frame_buffer_info(inst);
+	inst->fbc_buf_registered = false;
+
+	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_INIT_SEQ);
+
+	inst->scaler_info.enable = false;
+	inst->crop.left = info->pic_crop_rect.left;
+	inst->crop.top = info->pic_crop_rect.top;
+	inst->crop.width = info->pic_crop_rect.right - inst->crop.left;
+	inst->crop.height = info->pic_crop_rect.bottom - inst->crop.top;
+
+	wave6_update_v4l2_ctrls(inst, info);
+	wave6_update_color_info(inst, info);
+	wave6_update_pix_fmt(&inst->src_fmt, info->pic_width, info->pic_height);
+	wave6_update_pix_fmt_cap(&inst->dst_fmt,
+				 info->pic_width, info->pic_height,
+				 true);
+
+	v4l2_event_queue_fh(&inst->v4l2_fh, &vpu_event_src_ch);
+}
+
+static void wave6_vpu_dec_handle_decoding_warn_error(struct vpu_instance *inst,
+						     struct dec_output_info *info)
+{
+	if (info->warn_info)
+		dev_dbg(inst->dev->dev, "[%d] decoding %d warning 0x%x\n",
+			inst->id, inst->processed_buf_num, info->warn_info);
+
+	if (info->error_reason)
+		dev_dbg(inst->dev->dev, "[%d] decoding %d error 0x%x\n",
+			inst->id, inst->processed_buf_num, info->error_reason);
+}
+
+static void wave6_vpu_dec_finish_decode(struct vpu_instance *inst, bool error)
+{
+	struct dec_output_info info;
+	int ret;
+
+	memset(&info, 0, sizeof(info));
+
+	ret = wave6_vpu_dec_get_output_info(inst, &info);
+	if (ret)
+		goto finish_decode;
+
+	dev_dbg(inst->dev->dev, "dec %d dis %d noti_flag %d stream_end %d\n",
+		info.frame_decoded, info.frame_display,
+		info.notification_flags, info.stream_end);
+
+	if (info.notification_flags & DEC_NOTI_FLAG_NO_FB) {
+		wave6_vpu_dec_retry_one_frame(inst);
+		goto finish_decode;
+	}
+
+	if (info.notification_flags & DEC_NOTI_FLAG_SEQ_CHANGE) {
+		if (info.frame_display)
+			wave6_handle_display_frames(inst, &info);
+
+		if (info.release_disp_frame_num)
+			wave6_handle_discard_frames(inst, &info);
+
+		wave6_vpu_dec_handle_source_change(inst);
+
+		scoped_guard(mutex, &inst->lock)
+			wave6_handle_last_frame(inst, NULL);
+
+		goto finish_decode;
+	}
+
+	wave6_vpu_dec_handle_decoding_warn_error(inst, &info);
+
+	if (info.frame_decoded)
+		wave6_handle_decoded_frame(inst, &info);
+	else
+		wave6_handle_skipped_frame(inst);
+
+	if (info.frame_display)
+		wave6_handle_display_frames(inst, &info);
+
+	if (info.release_disp_frame_num)
+		wave6_handle_discard_frames(inst, &info);
+
+	if (info.stream_end)
+		wave6_vpu_dec_finish_drain(inst);
+
+finish_decode:
+	wave6_vpu_finish_job(inst);
+}
+
+static int wave6_vpu_dec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, VPU_DEC_DRV_NAME, sizeof(cap->driver));
+	strscpy(cap->card, VPU_DEC_DRV_NAME, sizeof(cap->card));
+	strscpy(cap->bus_info, "platform:" VPU_DEC_DRV_NAME, sizeof(cap->bus_info));
+
+	return 0;
+}
+
+static int wave6_vpu_dec_enum_framesizes(struct file *f, void *fh, struct v4l2_frmsizeenum *fsize)
+{
+	const struct vpu_format *vpu_fmt;
+
+	if (fsize->index)
+		return -EINVAL;
+
+	vpu_fmt = wave6_find_vpu_fmt(fsize->pixel_format, VPU_FMT_TYPE_CODEC);
+	if (!vpu_fmt) {
+		vpu_fmt = wave6_find_vpu_fmt(fsize->pixel_format, VPU_FMT_TYPE_RAW);
+		if (!vpu_fmt)
+			return -EINVAL;
+	}
+
+	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
+	fsize->stepwise.min_width = vpu_fmt->min_width;
+	fsize->stepwise.max_width = vpu_fmt->max_width;
+	fsize->stepwise.step_width = W6_DEC_PIC_SIZE_STEP;
+	fsize->stepwise.min_height = vpu_fmt->min_height;
+	fsize->stepwise.max_height = vpu_fmt->max_height;
+	fsize->stepwise.step_height = W6_DEC_PIC_SIZE_STEP;
+
+	return 0;
+}
+
+static int wave6_vpu_dec_enum_fmt_cap(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+{
+	const struct vpu_format *vpu_fmt;
+
+	vpu_fmt = wave6_find_vpu_fmt_by_idx(f->index, VPU_FMT_TYPE_RAW);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	f->pixelformat = vpu_fmt->v4l2_pix_fmt;
+	f->flags = 0;
+
+	return 0;
+}
+
+static int wave6_vpu_dec_try_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	const struct vpu_format *vpu_fmt;
+	int width, height;
+
+	dev_dbg(inst->dev->dev, "%s: 4cc %d w %d h %d plane %d colorspace %d\n",
+		__func__, pix_mp->pixelformat, pix_mp->width, pix_mp->height,
+		pix_mp->num_planes, pix_mp->colorspace);
+
+	if (!V4L2_TYPE_IS_CAPTURE(f->type))
+		return -EINVAL;
+
+	vpu_fmt = wave6_find_vpu_fmt(pix_mp->pixelformat, VPU_FMT_TYPE_RAW);
+	if (!vpu_fmt) {
+		width = inst->dst_fmt.width;
+		height = inst->dst_fmt.height;
+		pix_mp->pixelformat = inst->dst_fmt.pixelformat;
+		pix_mp->num_planes = inst->dst_fmt.num_planes;
+	} else {
+		width = clamp(pix_mp->width,
+			      vpu_fmt->min_width,
+			      round_up(inst->src_fmt.width, W6_DEC_BUF_ALIGNMENT));
+		height = clamp(pix_mp->height,
+			       vpu_fmt->min_height, inst->src_fmt.height);
+		pix_mp->pixelformat = vpu_fmt->v4l2_pix_fmt;
+		pix_mp->num_planes = vpu_fmt->num_planes;
+	}
+
+	if (inst->state >= VPU_INST_STATE_INIT_SEQ) {
+		width = inst->dst_fmt.width;
+		height = inst->dst_fmt.height;
+	}
+
+	wave6_update_pix_fmt_cap(pix_mp, width, height, false);
+	pix_mp->colorspace = inst->colorspace;
+	pix_mp->ycbcr_enc = inst->ycbcr_enc;
+	pix_mp->quantization = inst->quantization;
+	pix_mp->xfer_func = inst->xfer_func;
+
+	return 0;
+}
+
+static int wave6_vpu_dec_s_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	const struct vpu_format *vpu_fmt;
+	struct vb2_queue *q;
+	int ret;
+
+	dev_dbg(inst->dev->dev, "%s: 4cc %d w %d h %d plane %d colorspace %d\n",
+		__func__, pix_mp->pixelformat, pix_mp->width, pix_mp->height,
+		pix_mp->num_planes, pix_mp->colorspace);
+
+	q = v4l2_m2m_get_vq(inst->v4l2_fh.m2m_ctx, f->type);
+	if (vb2_is_busy(q))
+		return -EBUSY;
+
+	ret = wave6_vpu_dec_try_fmt_cap(file, fh, f);
+	if (ret)
+		return ret;
+
+	vpu_fmt = wave6_find_vpu_fmt(pix_mp->pixelformat, VPU_FMT_TYPE_RAW);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	inst->dst_fmt.width = pix_mp->width;
+	inst->dst_fmt.height = pix_mp->height;
+	inst->dst_fmt.pixelformat = pix_mp->pixelformat;
+	inst->dst_fmt.field = pix_mp->field;
+	inst->dst_fmt.flags = pix_mp->flags;
+	inst->dst_fmt.num_planes = pix_mp->num_planes;
+	for (int i = 0; i < inst->dst_fmt.num_planes; i++) {
+		inst->dst_fmt.plane_fmt[i].bytesperline = pix_mp->plane_fmt[i].bytesperline;
+		inst->dst_fmt.plane_fmt[i].sizeimage = pix_mp->plane_fmt[i].sizeimage;
+	}
+
+	inst->cbcr_interleave = !!(vpu_fmt->flags & VPU_FMT_FLAG_CBCR_INTERLEAVED);
+	inst->nv21 = !!(vpu_fmt->flags & VPU_FMT_FLAG_CRCB_ORDER);
+
+	return 0;
+}
+
+static int wave6_vpu_dec_g_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+
+	pix_mp->width = inst->dst_fmt.width;
+	pix_mp->height = inst->dst_fmt.height;
+	pix_mp->pixelformat = inst->dst_fmt.pixelformat;
+	pix_mp->field = inst->dst_fmt.field;
+	pix_mp->flags = inst->dst_fmt.flags;
+	pix_mp->num_planes = inst->dst_fmt.num_planes;
+	for (int i = 0; i < pix_mp->num_planes; i++) {
+		pix_mp->plane_fmt[i].bytesperline = inst->dst_fmt.plane_fmt[i].bytesperline;
+		pix_mp->plane_fmt[i].sizeimage = inst->dst_fmt.plane_fmt[i].sizeimage;
+	}
+
+	pix_mp->colorspace = inst->colorspace;
+	pix_mp->ycbcr_enc = inst->ycbcr_enc;
+	pix_mp->quantization = inst->quantization;
+	pix_mp->xfer_func = inst->xfer_func;
+
+	return 0;
+}
+
+static int wave6_vpu_dec_enum_fmt_out(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	const struct vpu_format *vpu_fmt;
+
+	dev_dbg(inst->dev->dev, "%s: index %d\n", __func__, f->index);
+
+	vpu_fmt = wave6_find_vpu_fmt_by_idx(f->index, VPU_FMT_TYPE_CODEC);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	f->pixelformat = vpu_fmt->v4l2_pix_fmt;
+	f->flags = V4L2_FMT_FLAG_DYN_RESOLUTION | V4L2_FMT_FLAG_COMPRESSED;
+
+	return 0;
+}
+
+static int wave6_vpu_dec_try_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	const struct vpu_format *vpu_fmt;
+	unsigned int width, height;
+
+	dev_dbg(inst->dev->dev, "%s: 4cc %d w %d h %d plane %d colorspace %d\n",
+		__func__, pix_mp->pixelformat, pix_mp->width, pix_mp->height,
+		pix_mp->num_planes, pix_mp->colorspace);
+
+	if (!V4L2_TYPE_IS_OUTPUT(f->type))
+		return -EINVAL;
+
+	vpu_fmt = wave6_find_vpu_fmt(pix_mp->pixelformat, VPU_FMT_TYPE_CODEC);
+	if (!vpu_fmt) {
+		width = inst->src_fmt.width;
+		height = inst->src_fmt.height;
+		pix_mp->pixelformat = inst->src_fmt.pixelformat;
+		pix_mp->num_planes = inst->src_fmt.num_planes;
+	} else {
+		width = clamp(pix_mp->width,
+			      vpu_fmt->min_width, vpu_fmt->max_width);
+		height = clamp(pix_mp->height,
+			       vpu_fmt->min_height, vpu_fmt->max_height);
+		pix_mp->pixelformat = vpu_fmt->v4l2_pix_fmt;
+		pix_mp->num_planes = vpu_fmt->num_planes;
+	}
+
+	wave6_update_pix_fmt(pix_mp, width, height);
+	pix_mp->colorspace = inst->colorspace;
+	pix_mp->ycbcr_enc = inst->ycbcr_enc;
+	pix_mp->quantization = inst->quantization;
+	pix_mp->xfer_func = inst->xfer_func;
+
+	return 0;
+}
+
+static int wave6_vpu_dec_s_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane in_pix_mp = f->fmt.pix_mp;
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	struct vb2_queue *q;
+	int ret;
+
+	dev_dbg(inst->dev->dev, "%s: 4cc %d w %d h %d plane %d colorspace %d\n",
+		__func__, pix_mp->pixelformat, pix_mp->width, pix_mp->height,
+		pix_mp->num_planes, pix_mp->colorspace);
+
+	q = v4l2_m2m_get_vq(inst->v4l2_fh.m2m_ctx, f->type);
+	if (vb2_is_busy(q))
+		return -EBUSY;
+
+	ret = wave6_vpu_dec_try_fmt_out(file, fh, f);
+	if (ret)
+		return ret;
+
+	pix_mp->colorspace = in_pix_mp.colorspace;
+	pix_mp->ycbcr_enc = in_pix_mp.ycbcr_enc;
+	pix_mp->quantization = in_pix_mp.quantization;
+	pix_mp->xfer_func = in_pix_mp.xfer_func;
+
+	inst->src_fmt.width = pix_mp->width;
+	inst->src_fmt.height = pix_mp->height;
+	inst->src_fmt.pixelformat = pix_mp->pixelformat;
+	inst->src_fmt.field = pix_mp->field;
+	inst->src_fmt.flags = pix_mp->flags;
+	inst->src_fmt.num_planes = pix_mp->num_planes;
+	for (int i = 0; i < inst->src_fmt.num_planes; i++) {
+		inst->src_fmt.plane_fmt[i].bytesperline = pix_mp->plane_fmt[i].bytesperline;
+		inst->src_fmt.plane_fmt[i].sizeimage = pix_mp->plane_fmt[i].sizeimage;
+	}
+
+	inst->colorspace = pix_mp->colorspace;
+	inst->ycbcr_enc = pix_mp->ycbcr_enc;
+	inst->quantization = pix_mp->quantization;
+	inst->xfer_func = pix_mp->xfer_func;
+
+	wave6_update_pix_fmt_cap(&inst->dst_fmt,
+				 pix_mp->width, pix_mp->height,
+				 true);
+
+	return 0;
+}
+
+static int wave6_vpu_dec_g_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+
+	pix_mp->width = inst->src_fmt.width;
+	pix_mp->height = inst->src_fmt.height;
+	pix_mp->pixelformat = inst->src_fmt.pixelformat;
+	pix_mp->field = inst->src_fmt.field;
+	pix_mp->flags = inst->src_fmt.flags;
+	pix_mp->num_planes = inst->src_fmt.num_planes;
+	for (int i = 0; i < pix_mp->num_planes; i++) {
+		pix_mp->plane_fmt[i].bytesperline = inst->src_fmt.plane_fmt[i].bytesperline;
+		pix_mp->plane_fmt[i].sizeimage = inst->src_fmt.plane_fmt[i].sizeimage;
+	}
+
+	pix_mp->colorspace = inst->colorspace;
+	pix_mp->ycbcr_enc = inst->ycbcr_enc;
+	pix_mp->quantization = inst->quantization;
+	pix_mp->xfer_func = inst->xfer_func;
+
+	return 0;
+}
+
+static int wave6_vpu_dec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+
+	dev_dbg(inst->dev->dev, "%s: type %d target %d\n",
+		__func__, s->type, s->target);
+
+	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
+	    s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return -EINVAL;
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = inst->dst_fmt.width;
+		s->r.height = inst->dst_fmt.height;
+		break;
+	case V4L2_SEL_TGT_COMPOSE_PADDED:
+	case V4L2_SEL_TGT_COMPOSE:
+		s->r.left = 0;
+		s->r.top = 0;
+		if (inst->scaler_info.enable) {
+			s->r.width = inst->scaler_info.width;
+			s->r.height = inst->scaler_info.height;
+		} else if (inst->crop.width && inst->crop.height) {
+			s->r = inst->crop;
+		} else {
+			s->r.width = inst->src_fmt.width;
+			s->r.height = inst->src_fmt.height;
+		}
+		break;
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = inst->src_fmt.width;
+		s->r.height = inst->src_fmt.height;
+		if (inst->crop.width && inst->crop.height)
+			s->r = inst->crop;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_dec_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	int step = 4;
+	int scale_width, scale_height;
+	int min_scale_width, min_scale_height;
+
+	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
+	    s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return -EINVAL;
+
+	if (s->target != V4L2_SEL_TGT_COMPOSE)
+		return -EINVAL;
+
+	if (!(s->flags & (V4L2_SEL_FLAG_GE | V4L2_SEL_FLAG_LE)))
+		s->flags |= V4L2_SEL_FLAG_LE;
+
+	scale_width = clamp(s->r.width, W6_MIN_DEC_PIC_WIDTH,
+			    inst->src_fmt.width);
+	scale_height = clamp(s->r.height, W6_MIN_DEC_PIC_HEIGHT,
+			     inst->src_fmt.height);
+	if (s->flags & V4L2_SEL_FLAG_GE) {
+		scale_width = round_up(scale_width, step);
+		scale_height = round_up(scale_height, step);
+	}
+	if (s->flags & V4L2_SEL_FLAG_LE) {
+		scale_width = round_down(scale_width, step);
+		scale_height = round_down(scale_height, step);
+	}
+
+	inst->scaler_info.enable = scale_width < inst->src_fmt.width ||
+				   scale_height < inst->src_fmt.height;
+
+	if (inst->scaler_info.enable) {
+		min_scale_width = ALIGN((inst->src_fmt.width / 8), step);
+		min_scale_height = ALIGN((inst->src_fmt.height / 8), step);
+
+		if (scale_width < W6_MIN_DEC_PIC_WIDTH)
+			scale_width = W6_MIN_DEC_PIC_WIDTH;
+		if (scale_width < min_scale_width)
+			scale_width = min_scale_width;
+		if (scale_height < W6_MIN_DEC_PIC_HEIGHT)
+			scale_height = W6_MIN_DEC_PIC_HEIGHT;
+		if (scale_height < min_scale_height)
+			scale_height = min_scale_height;
+
+		inst->scaler_info.width = scale_width;
+		inst->scaler_info.height = scale_height;
+	}
+
+	s->r.left = 0;
+	s->r.top = 0;
+	s->r.width = scale_width;
+	s->r.height = scale_height;
+
+	return 0;
+}
+
+static int wave6_vpu_dec_cmd_stop(struct vpu_instance *inst)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+
+	scoped_guard(mutex, &inst->lock) {
+		if (inst->drain)
+			return -EBUSY;
+
+		if (v4l2_m2m_has_stopped(m2m_ctx))
+			return 0;
+
+		inst->drain_src_buf_num = v4l2_m2m_num_src_bufs_ready(m2m_ctx);
+
+		if (!inst->drain_src_buf_num &&
+		    !vb2_is_streaming(v4l2_m2m_get_dst_vq(m2m_ctx)))
+			return 0;
+
+		inst->drain = true;
+	}
+
+	v4l2_m2m_set_src_buffered(m2m_ctx, true);
+	v4l2_m2m_try_schedule(m2m_ctx);
+
+	return 0;
+}
+
+static int wave6_vpu_dec_cmd_start(struct vpu_instance *inst)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+	struct v4l2_m2m_buffer *buf;
+	int ret;
+
+	scoped_guard(mutex, &inst->lock) {
+		if (inst->next_dst_buf_last ||
+		    (inst->drain && inst->state != VPU_INST_STATE_INIT_SEQ))
+			return -EBUSY;
+	}
+
+	if (inst->state == VPU_INST_STATE_INIT_SEQ &&
+	    vb2_is_streaming(v4l2_m2m_get_dst_vq(m2m_ctx))) {
+		v4l2_m2m_for_each_dst_buf(m2m_ctx, buf) {
+			for (int i = 0; i < inst->dst_fmt.num_planes; i++) {
+				if (vb2_plane_size(&buf->vb.vb2_buf, i) <
+				    inst->dst_fmt.plane_fmt[i].sizeimage)
+					return -EINVAL;
+			}
+		}
+
+		ret = wave6_vpu_dec_prepare_fb(inst);
+		if (ret)
+			return ret;
+	}
+
+	v4l2_m2m_clear_state(m2m_ctx);
+	vb2_clear_last_buffer_dequeued(v4l2_m2m_get_dst_vq(m2m_ctx));
+	v4l2_m2m_try_schedule(m2m_ctx);
+
+	return 0;
+}
+
+static int wave6_vpu_dec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *dc)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	int ret;
+
+	dev_dbg(inst->dev->dev, "%s: cmd %d\n", __func__, dc->cmd);
+
+	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, dc);
+	if (ret)
+		return ret;
+
+	if (!vb2_is_streaming(v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx)))
+		return 0;
+
+	switch (dc->cmd) {
+	case V4L2_DEC_CMD_STOP:
+		return wave6_vpu_dec_cmd_stop(inst);
+	case V4L2_DEC_CMD_START:
+		return wave6_vpu_dec_cmd_start(inst);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct v4l2_ioctl_ops wave6_vpu_dec_ioctl_ops = {
+	.vidioc_querycap = wave6_vpu_dec_querycap,
+	.vidioc_enum_framesizes = wave6_vpu_dec_enum_framesizes,
+
+	.vidioc_enum_fmt_vid_cap = wave6_vpu_dec_enum_fmt_cap,
+	.vidioc_s_fmt_vid_cap_mplane = wave6_vpu_dec_s_fmt_cap,
+	.vidioc_g_fmt_vid_cap_mplane = wave6_vpu_dec_g_fmt_cap,
+	.vidioc_try_fmt_vid_cap_mplane = wave6_vpu_dec_try_fmt_cap,
+
+	.vidioc_enum_fmt_vid_out = wave6_vpu_dec_enum_fmt_out,
+	.vidioc_s_fmt_vid_out_mplane = wave6_vpu_dec_s_fmt_out,
+	.vidioc_g_fmt_vid_out_mplane = wave6_vpu_dec_g_fmt_out,
+	.vidioc_try_fmt_vid_out_mplane = wave6_vpu_dec_try_fmt_out,
+
+	.vidioc_g_selection = wave6_vpu_dec_g_selection,
+	.vidioc_s_selection = wave6_vpu_dec_s_selection,
+
+	.vidioc_reqbufs = v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf = v4l2_m2m_ioctl_querybuf,
+	.vidioc_create_bufs = v4l2_m2m_ioctl_create_bufs,
+	.vidioc_prepare_buf = v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_qbuf = v4l2_m2m_ioctl_qbuf,
+	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
+	.vidioc_dqbuf = v4l2_m2m_ioctl_dqbuf,
+	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
+
+	.vidioc_try_decoder_cmd = v4l2_m2m_ioctl_try_decoder_cmd,
+	.vidioc_decoder_cmd = wave6_vpu_dec_decoder_cmd,
+
+	.vidioc_subscribe_event = wave6_vpu_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static int wave6_vpu_dec_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct vpu_instance *inst = wave6_ctrl_to_vpu_inst(ctrl);
+
+	dev_dbg(inst->dev->dev, "%s: name %s value %d\n",
+		__func__, ctrl->name, ctrl->val);
+
+	switch (ctrl->id) {
+	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:
+		inst->disp_mode = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:
+	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
+	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
+	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops wave6_vpu_dec_ctrl_ops = {
+	.s_ctrl = wave6_vpu_dec_s_ctrl,
+};
+
+static void wave6_set_dec_openparam(struct dec_open_param *open_param,
+				    struct vpu_instance *inst)
+{
+	open_param->inst_buffer.temp_base = inst->dev->temp_vbuf.daddr;
+	open_param->inst_buffer.temp_size = inst->dev->temp_vbuf.size;
+	open_param->disp_mode = inst->disp_mode;
+}
+
+static int wave6_vpu_dec_create_instance(struct vpu_instance *inst)
+{
+	int ret;
+	struct dec_open_param open_param;
+
+	memset(&open_param, 0, sizeof(struct dec_open_param));
+
+	wave6_vpu_core_activate(inst->dev);
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret) {
+		dev_err(inst->dev->dev, "runtime_resume failed %d\n", ret);
+		goto error_deactivate;
+	}
+
+	inst->std = wave6_to_codec_std(inst->type, inst->src_fmt.pixelformat);
+	if (inst->std == STD_UNKNOWN) {
+		dev_err(inst->dev->dev, "unsupported pixelformat: %.4s\n",
+			(char *)&inst->src_fmt.pixelformat);
+		ret = -EINVAL;
+		goto error_pm;
+	}
+
+	wave6_set_dec_openparam(&open_param, inst);
+
+	ret = wave6_vpu_dec_open(inst, &open_param);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed create instance : %d\n", ret);
+		goto error_pm;
+	}
+
+	dev_dbg(inst->dev->dev, "[%d] decoder\n", inst->id);
+
+	scoped_guard(spinlock, &inst->dev->inst_lock)
+		list_add_tail(&inst->list, &inst->dev->instances);
+	wave6_vpu_enable_instance(inst);
+	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_OPEN);
+
+	return 0;
+
+error_pm:
+	pm_runtime_put_sync(inst->dev->dev);
+error_deactivate:
+	wave6_vpu_core_deactivate(inst->dev);
+
+	return ret;
+}
+
+static int wave6_vpu_dec_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
+				     unsigned int *num_planes, unsigned int sizes[],
+				     struct device *alloc_devs[])
+{
+	struct vpu_instance *inst = vb2_get_drv_priv(q);
+	struct v4l2_pix_format_mplane inst_format =
+		(V4L2_TYPE_IS_OUTPUT(q->type)) ? inst->src_fmt : inst->dst_fmt;
+
+	dev_dbg(inst->dev->dev, "%s: num_buffers %d num_planes %d type %d\n",
+		__func__, *num_buffers, *num_planes, q->type);
+
+	if (*num_planes) {
+		if (inst_format.num_planes != *num_planes)
+			return -EINVAL;
+
+		for (unsigned int i = 0; i < *num_planes; i++) {
+			if (sizes[i] < inst_format.plane_fmt[i].sizeimage)
+				return -EINVAL;
+		}
+	} else {
+		*num_planes = inst_format.num_planes;
+		for (unsigned int i = 0; i < *num_planes; i++) {
+			sizes[i] = inst_format.plane_fmt[i].sizeimage;
+			dev_dbg(inst->dev->dev, "size[%d] : %d\n", i, sizes[i]);
+		}
+
+		if (V4L2_TYPE_IS_CAPTURE(q->type)) {
+			struct v4l2_ctrl *ctrl;
+			unsigned int min_disp_cnt = 0;
+
+			ctrl = v4l2_ctrl_find(&inst->v4l2_ctrl_hdl,
+					      V4L2_CID_MIN_BUFFERS_FOR_CAPTURE);
+			if (ctrl)
+				min_disp_cnt = v4l2_ctrl_g_ctrl(ctrl);
+
+			*num_buffers = max(*num_buffers, min_disp_cnt);
+		}
+	}
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type) && inst->state == VPU_INST_STATE_SEEK)
+		wave6_vpu_dec_destroy_instance(inst);
+
+	return 0;
+}
+
+static int wave6_vpu_dec_seek_header(struct vpu_instance *inst)
+{
+	struct dec_seq_info seq_info;
+	int ret;
+
+	memset(&seq_info, 0, sizeof(struct dec_seq_info));
+
+	ret = wave6_vpu_dec_issue_seq_init(inst);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed wave6_vpu_dec_issue_seq_init %d\n", ret);
+		return ret;
+	}
+
+	ret = wave6_vpu_wait_interrupt(inst, W6_VPU_TIMEOUT);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed to call vpu_wait_interrupt()\n");
+		return ret;
+	}
+
+	ret = wave6_vpu_dec_complete_seq_init(inst, &seq_info);
+	if (ret) {
+		dev_err(inst->dev->dev, "vpu_dec_complete_seq_init: %d, reason : 0x%x\n",
+			ret, seq_info.err_reason);
+		if ((seq_info.err_reason & WAVE6_SYSERR_NOT_SUPPORT) ||
+		    (seq_info.err_reason & WAVE6_SYSERR_NOT_SUPPORT_PROFILE)) {
+			ret = -EINVAL;
+		} else if (seq_info.err_reason == HEVC_ETCERR_INIT_SEQ_SPS_NOT_FOUND ||
+			   seq_info.err_reason == AVC_ETCERR_INIT_SEQ_SPS_NOT_FOUND) {
+			wave6_handle_skipped_frame(inst);
+			ret = 0;
+		}
+	} else {
+		wave6_vpu_dec_handle_source_change(inst);
+		inst->v4l2_fh.m2m_ctx->ignore_cap_streaming = false;
+		v4l2_m2m_set_dst_buffered(inst->v4l2_fh.m2m_ctx, false);
+		if (vb2_is_streaming(v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx))) {
+			scoped_guard(mutex, &inst->lock)
+				wave6_handle_last_frame(inst, NULL);
+		}
+	}
+
+	return ret;
+}
+
+static int wave6_vpu_dec_prepare_decode(struct vpu_instance *inst)
+{
+	bool stream_end;
+
+	scoped_guard(mutex, &inst->lock)
+		stream_end = inst->drain && !inst->drain_src_buf_num;
+
+	if (stream_end && !inst->fbc_buf_registered) {
+		wave6_vpu_dec_finish_drain(inst);
+		return -EAGAIN;
+	}
+
+	wave6_handle_bitstream_buffer(inst, stream_end);
+
+	if (inst->state < VPU_INST_STATE_PIC_RUN) {
+		if (inst->state == VPU_INST_STATE_OPEN &&
+		    wave6_vpu_dec_seek_header(inst)) {
+			vb2_queue_error(v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx));
+			vb2_queue_error(v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx));
+		}
+
+		return -EAGAIN;
+	}
+
+	if (!stream_end)
+		wave6_vpu_dec_handle_dst_buffer(inst);
+
+	return 0;
+}
+
+static void wave6_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
+
+	dev_dbg(inst->dev->dev, "type %4d index %4d size[0] %4ld size[1] : %4ld | size[2] : %4ld\n",
+		vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
+		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
+
+	vbuf->sequence = inst->queued_src_buf_num++;
+
+	v4l2_m2m_buf_queue(inst->v4l2_fh.m2m_ctx, vbuf);
+}
+
+static void wave6_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
+
+	dev_dbg(inst->dev->dev, "type %4d index %4d size[0] %4ld size[1] : %4ld | size[2] : %4ld\n",
+		vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
+		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
+
+	guard(mutex)(&inst->lock);
+
+	inst->queued_dst_buf_num++;
+	if (inst->next_dst_buf_last) {
+		wave6_handle_last_frame(inst, vbuf);
+		inst->next_dst_buf_last = false;
+	} else {
+		v4l2_m2m_buf_queue(inst->v4l2_fh.m2m_ctx, vbuf);
+	}
+}
+
+static void wave6_vpu_dec_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_buffer *vpu_buf = wave6_to_vpu_buf(vbuf);
+
+	vpu_buf->consumed = false;
+	vpu_buf->used = false;
+	vpu_buf->error = false;
+	if (V4L2_TYPE_IS_OUTPUT(vb->type))
+		wave6_vpu_dec_buf_queue_src(vb);
+	else
+		wave6_vpu_dec_buf_queue_dst(vb);
+}
+
+static int wave6_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct vpu_instance *inst = vb2_get_drv_priv(q);
+	struct v4l2_pix_format_mplane *fmt;
+	int ret = 0;
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		fmt = &inst->src_fmt;
+		if (inst->state == VPU_INST_STATE_NONE) {
+			ret = wave6_vpu_dec_create_instance(inst);
+			if (!ret) {
+				inst->v4l2_fh.m2m_ctx->ignore_cap_streaming = true;
+				v4l2_m2m_set_dst_buffered(inst->v4l2_fh.m2m_ctx, true);
+			}
+		}
+		if (inst->state == VPU_INST_STATE_SEEK)
+			wave6_vpu_set_instance_state(inst, inst->state_in_seek);
+	} else {
+		fmt = &inst->dst_fmt;
+		if (inst->state == VPU_INST_STATE_INIT_SEQ) {
+			ret = wave6_vpu_dec_prepare_fb(inst);
+			if (ret)
+				goto exit;
+		}
+	}
+
+exit:
+	if (ret)
+		wave6_vpu_return_buffers(inst, q->type, VB2_BUF_STATE_QUEUED);
+
+	dev_dbg(inst->dev->dev, "[%d] %s %c%c%c%c %dx%d, %d buffers, ret = %d\n",
+		inst->id, V4L2_TYPE_IS_OUTPUT(q->type) ? "output" : "capture",
+		fmt->pixelformat,
+		fmt->pixelformat >> 8,
+		fmt->pixelformat >> 16,
+		fmt->pixelformat >> 24,
+		fmt->width, fmt->height, vb2_get_num_buffers(q), ret);
+
+	return ret;
+}
+
+static void wave6_vpu_dec_stop_streaming(struct vb2_queue *q)
+{
+	struct vpu_instance *inst = vb2_get_drv_priv(q);
+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+
+	dev_dbg(inst->dev->dev, "[%d] %s, input %d, decode %d error %d\n",
+		inst->id, V4L2_TYPE_IS_OUTPUT(q->type) ? "output" : "capture",
+		inst->queued_src_buf_num, inst->processed_buf_num, inst->error_buf_num);
+
+	if (inst->state == VPU_INST_STATE_NONE)
+		goto exit;
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		inst->queued_src_buf_num = 0;
+		inst->processed_buf_num = 0;
+		inst->error_buf_num = 0;
+		inst->state_in_seek = inst->state;
+		wave6_vpu_dec_cancel_drain(inst);
+		wave6_vpu_set_instance_state(inst, VPU_INST_STATE_SEEK);
+		inst->sequence = 0;
+	} else {
+		if (inst->state != VPU_INST_STATE_INIT_SEQ)
+			wave6_vpu_dec_cancel_drain(inst);
+
+		scoped_guard(mutex, &inst->lock)
+			inst->next_dst_buf_last = false;
+		inst->queued_dst_buf_num = 0;
+		inst->sequence = 0;
+
+		if (!v4l2_m2m_has_stopped(m2m_ctx))
+			wave6_vpu_dec_flush_instance(inst);
+		v4l2_m2m_clear_state(m2m_ctx);
+	}
+
+exit:
+	wave6_vpu_return_buffers(inst, q->type, VB2_BUF_STATE_ERROR);
+}
+
+static int wave6_vpu_dec_buf_init(struct vb2_buffer *vb)
+{
+	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
+	struct dec_seq_info *seq_info;
+
+	if (V4L2_TYPE_IS_OUTPUT(vb->type))
+		return 0;
+
+	if (inst->state == VPU_INST_STATE_NONE)
+		return 0;
+
+	seq_info = &inst->codec_info->dec_info.seq_info;
+	if (seq_info->c_fmt_idc != C_FMT_IDC_YUV400)
+		return 0;
+
+	for (int i = 0; i < inst->dst_fmt.num_planes; i++) {
+		void *vaddr = vb2_plane_vaddr(vb, i);
+
+		if (vaddr)
+			memset(vaddr, 0x80, vb2_plane_size(vb, i));
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_dec_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
+
+	if (V4L2_TYPE_IS_OUTPUT(vb->type))
+		return 0;
+
+	for (unsigned int i = 0; i < vb->num_planes; i++) {
+		unsigned int size = inst->dst_fmt.plane_fmt[i].sizeimage;
+
+		if (vb2_plane_size(vb, i) < size) {
+			dev_dbg(inst->dev->dev, "plane %u: size %u length %lu\n",
+				i, size, vb2_plane_size(vb, i));
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static const struct vb2_ops wave6_vpu_dec_vb2_ops = {
+	.queue_setup = wave6_vpu_dec_queue_setup,
+	.buf_prepare = wave6_vpu_dec_buf_prepare,
+	.buf_queue = wave6_vpu_dec_buf_queue,
+	.start_streaming = wave6_vpu_dec_start_streaming,
+	.stop_streaming = wave6_vpu_dec_stop_streaming,
+	.buf_init = wave6_vpu_dec_buf_init,
+};
+
+static void wave6_set_default_format(struct v4l2_pix_format_mplane *src_fmt,
+				     struct v4l2_pix_format_mplane *dst_fmt)
+{
+	const struct vpu_format *vpu_fmt;
+
+	vpu_fmt = wave6_find_vpu_fmt_by_idx(0, VPU_FMT_TYPE_CODEC);
+	if (vpu_fmt) {
+		src_fmt->pixelformat = vpu_fmt->v4l2_pix_fmt;
+		src_fmt->num_planes = vpu_fmt->num_planes;
+		wave6_update_pix_fmt(src_fmt,
+				     W6_DEF_DEC_PIC_WIDTH, W6_DEF_DEC_PIC_HEIGHT);
+	}
+
+	vpu_fmt = wave6_find_vpu_fmt_by_idx(0, VPU_FMT_TYPE_RAW);
+	if (vpu_fmt) {
+		dst_fmt->pixelformat = vpu_fmt->v4l2_pix_fmt;
+		dst_fmt->num_planes = vpu_fmt->num_planes;
+		wave6_update_pix_fmt_cap(dst_fmt,
+					 W6_DEF_DEC_PIC_WIDTH, W6_DEF_DEC_PIC_HEIGHT,
+					 true);
+	}
+}
+
+static int wave6_vpu_dec_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
+{
+	struct vpu_instance *inst = priv;
+	int ret;
+
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
+	src_vq->ops = &wave6_vpu_dec_vb2_ops;
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->buf_struct_size = sizeof(struct vpu_buffer);
+	src_vq->drv_priv = inst;
+	src_vq->lock = &inst->dev->dev_lock;
+	src_vq->dev = inst->dev->v4l2_dev.dev;
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
+	dst_vq->ops = &wave6_vpu_dec_vb2_ops;
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->buf_struct_size = sizeof(struct vpu_buffer);
+	dst_vq->drv_priv = inst;
+	dst_vq->lock = &inst->dev->dev_lock;
+	dst_vq->dev = inst->dev->v4l2_dev.dev;
+	ret = vb2_queue_init(dst_vq);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct vpu_instance_ops wave6_vpu_dec_inst_ops = {
+	.prepare_process = wave6_vpu_dec_prepare_decode,
+	.start_process = wave6_vpu_dec_start_decode,
+	.finish_process = wave6_vpu_dec_finish_decode,
+};
+
+static int wave6_vpu_open_dec(struct file *filp)
+{
+	struct video_device *vdev = video_devdata(filp);
+	struct vpu_core_device *core = video_drvdata(filp);
+	struct vpu_instance *inst = NULL;
+	int ret;
+
+	inst = kzalloc_obj(*inst);
+	if (!inst)
+		return -ENOMEM;
+
+	init_completion(&inst->irq_done);
+	INIT_DELAYED_WORK(&inst->task_timer, wave6_vpu_device_run_timeout);
+	mutex_init(&inst->lock);
+	inst->dev = core;
+	inst->type = VPU_INST_TYPE_DEC;
+	inst->ops = &wave6_vpu_dec_inst_ops;
+
+	v4l2_fh_init(&inst->v4l2_fh, vdev);
+	filp->private_data = &inst->v4l2_fh;
+	v4l2_fh_add(&inst->v4l2_fh, filp);
+
+	inst->v4l2_fh.m2m_ctx =
+		v4l2_m2m_ctx_init(core->m2m_dev, inst, wave6_vpu_dec_queue_init);
+	if (IS_ERR(inst->v4l2_fh.m2m_ctx)) {
+		ret = PTR_ERR(inst->v4l2_fh.m2m_ctx);
+		goto free_inst;
+	}
+
+	v4l2_ctrl_handler_init(&inst->v4l2_ctrl_hdl, 10);
+	v4l2_ctrl_new_std(&inst->v4l2_ctrl_hdl, &wave6_vpu_dec_ctrl_ops,
+			  V4L2_CID_MIN_BUFFERS_FOR_CAPTURE,
+			  1, WAVE6_MAX_FBS, 1, 1);
+	v4l2_ctrl_new_std(&inst->v4l2_ctrl_hdl, &wave6_vpu_dec_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY,
+			  0, 0, 1, 0);
+	v4l2_ctrl_new_std(&inst->v4l2_ctrl_hdl, &wave6_vpu_dec_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE,
+			  0, 1, 1, 0);
+	v4l2_ctrl_new_std_menu(&inst->v4l2_ctrl_hdl, &wave6_vpu_dec_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+			       0, V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN);
+	v4l2_ctrl_new_std_menu(&inst->v4l2_ctrl_hdl, &wave6_vpu_dec_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+			       V4L2_MPEG_VIDEO_H264_PROFILE_HIGH, 0,
+			       V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE);
+
+	if (inst->v4l2_ctrl_hdl.error) {
+		ret = -ENODEV;
+		goto err_m2m_release;
+	}
+
+	inst->v4l2_fh.ctrl_handler = &inst->v4l2_ctrl_hdl;
+	ret = v4l2_ctrl_handler_setup(&inst->v4l2_ctrl_hdl);
+	if (ret)
+		goto err_m2m_release;
+
+	wave6_set_default_format(&inst->src_fmt, &inst->dst_fmt);
+	inst->colorspace = V4L2_COLORSPACE_DEFAULT;
+	inst->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	inst->quantization = V4L2_QUANTIZATION_DEFAULT;
+	inst->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+
+	return 0;
+
+err_m2m_release:
+	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
+	v4l2_ctrl_handler_free(&inst->v4l2_ctrl_hdl);
+free_inst:
+	v4l2_fh_del(&inst->v4l2_fh, filp);
+	v4l2_fh_exit(&inst->v4l2_fh);
+	mutex_destroy(&inst->lock);
+	kfree(inst);
+
+	return ret;
+}
+
+static int wave6_vpu_dec_release(struct file *filp)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(filp);
+
+	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
+
+	if (inst->state != VPU_INST_STATE_NONE)
+		wave6_vpu_dec_destroy_instance(inst);
+
+	v4l2_ctrl_handler_free(&inst->v4l2_ctrl_hdl);
+	v4l2_fh_del(&inst->v4l2_fh, filp);
+	v4l2_fh_exit(&inst->v4l2_fh);
+	mutex_destroy(&inst->lock);
+	kfree(inst);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations wave6_vpu_dec_fops = {
+	.owner = THIS_MODULE,
+	.open = wave6_vpu_open_dec,
+	.release = wave6_vpu_dec_release,
+	.unlocked_ioctl = video_ioctl2,
+	.poll = v4l2_m2m_fop_poll,
+	.mmap = v4l2_m2m_fop_mmap,
+};
+
+int wave6_vpu_dec_register_device(struct vpu_core_device *core)
+{
+	struct video_device *vdev_dec;
+	int ret;
+
+	vdev_dec = video_device_alloc();
+	if (!vdev_dec)
+		return -ENOMEM;
+
+	strscpy(vdev_dec->name, VPU_DEC_DEV_NAME, sizeof(vdev_dec->name));
+	vdev_dec->fops = &wave6_vpu_dec_fops;
+	vdev_dec->ioctl_ops = &wave6_vpu_dec_ioctl_ops;
+	vdev_dec->release = video_device_release;
+	vdev_dec->v4l2_dev = &core->v4l2_dev;
+	vdev_dec->vfl_dir = VFL_DIR_M2M;
+	vdev_dec->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+	vdev_dec->lock = &core->dev_lock;
+	video_set_drvdata(vdev_dec, core);
+
+	ret = video_register_device(vdev_dec, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		video_device_release(vdev_dec);
+		return ret;
+	}
+
+	core->video_dev_dec = vdev_dec;
+
+	return 0;
+}
+
+void wave6_vpu_dec_unregister_device(struct vpu_core_device *core)
+{
+	video_unregister_device(core->video_dev_dec);
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
index 7d6a734f64b4..d8d7b7916d88 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
@@ -376,6 +376,7 @@ struct vpu_irq {
  * @m2m_dev:		V4L2 mem2mem device
  * @instances:		List of VPU instances
  * @inst_lock:		Spinlock protecting instance list
+ * @video_dev_dec:	Video device node for decoder
  * @dev_lock:		Mutex protecting video_device, src, dst vb2_queue
  * @hw_lock:		Mutex protecting register access
  * @attr:		Hardware attributes retrieved after boot
@@ -397,6 +398,7 @@ struct vpu_core_device {
 	struct v4l2_m2m_dev *m2m_dev;
 	struct list_head instances;
 	spinlock_t inst_lock; /* Protects instance list */
+	struct video_device *video_dev_dec;
 	struct mutex dev_lock; /* Protects video_device, src, dst vb2_queue */
 	struct mutex hw_lock; /* Protects register access */
 	struct vpu_attr	attr;
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
index d1b53f509dfa..ef261b5d328c 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
@@ -20,6 +20,15 @@
 
 #define W6_MAX_PIC_STRIDE		(4096 * 4)
 #define W6_PIC_STRIDE_ALIGNMENT		32
+#define W6_FBC_BUF_ALIGNMENT		32
+#define W6_DEC_BUF_ALIGNMENT		32
+#define W6_DEF_DEC_PIC_WIDTH		720
+#define W6_DEF_DEC_PIC_HEIGHT		480
+#define W6_MIN_DEC_PIC_WIDTH		64
+#define W6_MIN_DEC_PIC_HEIGHT		64
+#define W6_MAX_DEC_PIC_WIDTH		4096
+#define W6_MAX_DEC_PIC_HEIGHT		4096
+#define W6_DEC_PIC_SIZE_STEP		1
 
 #define W6_VPU_POLL_DELAY_US		10
 #define W6_VPU_POLL_TIMEOUT		300000
@@ -29,6 +38,7 @@
 
 #define HOST_ENDIAN			VDI_128BIT_LITTLE_ENDIAN
 #define VPU_STREAM_ENDIAN		HOST_ENDIAN
+#define VPU_SOURCE_ENDIAN		HOST_ENDIAN
 
 #define W6_MAX_REMAP_PAGE_SIZE		(1024 * 1024)
 #define W6_MAX_CODE_BUF_SIZE		(4 * 1024 * 1024)
-- 
2.41.0.windows.3

