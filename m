Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3325C1442F7
	for <imx@lists.linux.dev>; Wed, 14 Aug 2024 11:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723634543; cv=fail; b=Jeh6NSF4jpy99XIEqF8n4l6sPWr6IsijLKn/k77Qqj648VOdjtzEazmA9we6HCOgyJxPHJQfvXOawTfN7ECdqwxIbLkoVDQuTHlS3Q4I78w6l2FK37q27YT1mOqP/b/kTgM9unWh+kViHJDT1d1VYCnoHyLxu/zxtNf6aRyLYFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723634543; c=relaxed/simple;
	bh=SOoO+7X5m/QXTawtrUzRut/WY+LuA6cjN12J4r3C4ss=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ZdxeDLuQOph70us2V3IV4qGKDAwnV+32rPZbqDzCQaWy+2I9EufMu1CW7QqXIaMYPbf9tPeQZ0lZXXMiOh70wFbLaHqEwo1R3pQW+t+3OlTOZMApcItjzL+WMYU/sH1gEFSiI7sUev3k2ob2K97P/RsmwqTAUNSKnG3DvVyWlxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Gx/x3O+s; arc=fail smtp.client-ip=40.107.22.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Gx/x3O+s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iX1Hra7DgEeciprorCg5VMUakcEY5gUD/dQQI+y9rum6BCccfytLBPe3xvqyzBwlm68gKNdbl2RIXugGCznBjMsjloPPqXLpoN0zr/UUyu4Hkc6x3N96SEEYuVkSra7rxHawoxEpXXKs3SmF3ZpjtIrVj1DUCKquPI/Wz+lt+v/TuhS7D5hpjmTKy/BB3xUqvfC8XjCpGWnxL5Dqv43MlXO+et4+JRu7z/qjiBBnCSXpcnx8RJlJR6QKel2h4SjVz7eZdkj2bsctRekqCEmfQytMGno8WxFHiZ/D/2Hqm9l8QFOf+UhKP7NFcre4nx1EdXqjXQ/eSt5AeoQXOjJc9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEWs4GX0bfY5H7USpplqUaN8rXVmhi54r+BJNdfdd7Q=;
 b=DQPIdLjabVhJRZXQCj7nIeMzw7XfYBzF6BXvJdq7Lfu4wV4oGJgxO17QeU9BuTAnZuPWpMN8iOucjwTQCZTf21I4Ex4ObwhuPilXfV+OFy/uQAt6pbZlcO3JH3wm20/ESP8Ze7NKVbBkJLownZnnljUqqYRoe7JHOGXzL2Ui8ag00xxgLozmlIesaeznuRy8jA1FNY7jKSuTk8LP0K7OTtcvRwfi3QMj4AGHZ1Nmr67ZLxbWmqbsR3CWjxbVk277B5rvizIloGNWiiE9tDhrqvrRgQI2OnVAnYA/m0yI3PqI4oP3t+Tw/ExTpzR3hNwMPa2Cv3L6FLHp0gmd2s8EoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEWs4GX0bfY5H7USpplqUaN8rXVmhi54r+BJNdfdd7Q=;
 b=Gx/x3O+svrdnlwhQC3GDGXdbjesja/rhkZqfM0pl0MhB2iq+rejUyu3qfHMoY8/P+c9g+yzg0Rkr14Mlapj91GJrikE1OXmRQHxEeTek5Qx64IuJTXyKY40qdFZZs8LE8ao/rj0HqB9/3PNQgreGjc9tOVr8VyqCrHU1RrrF5GeTeHpH+UUqSij0LgK6e7O4W86CR4PP/48uhCgHB0HJrul2pUJVyl2db/WANYNDnl5s4JPnGT22RSc4MFNAHMcaLxICvJZV6dZCqv9FBtzYzBrTfdYqBxTnzHMAwjspSewOAbi6Aq9KaV0vf8rtQiV7qjKvTg5ipI+y6RrLBkhdYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU0PR04MB9322.eurprd04.prod.outlook.com (2603:10a6:10:355::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Wed, 14 Aug
 2024 11:22:13 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7849.021; Wed, 14 Aug 2024
 11:22:13 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: laurent.pinchart@ideasonboard.com,
	dan.scally@ideasonboard.com,
	gregkh@linuxfoundation.org,
	m.grzeschik@pengutronix.de
Cc: jun.li@nxp.com,
	imx@lists.linux.dev
Subject: [PATCH] usb: gadget: uvc: queue pump work in uvcg_video_enable()
Date: Wed, 14 Aug 2024 19:22:46 +0800
Message-Id: <20240814112246.2608882-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU0PR04MB9322:EE_
X-MS-Office365-Filtering-Correlation-Id: 325aac3a-bd03-40a2-458f-08dcbc5358b9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?mieLhZcTPwvakiAU7gn1wQQT9RsyIsAkzhCejZ8E7nERz6Ti4zxedo7XtUwj?=
 =?us-ascii?Q?4z0mt6R/Hh89J44tudwNkzi8mUUMDjs7tZ21QebavAjgKkIYG1UuyagaK6br?=
 =?us-ascii?Q?gPJi8+f4ngz2HL6RCJIh3oCnfEiHQLdUHZziYScm/0G3ih2kk5rtzwI22Muq?=
 =?us-ascii?Q?9+xRW5QTdrIdjzfKwnRNP5O2AbeEhxzGsjSi9WK+JhR7uayLdrIblwsW+Vl+?=
 =?us-ascii?Q?9kYaZZLzLWvdZzDmpuBlOPSgYNF33uVuEEdBQg8SrM3VTjvd8WgsoYPgH4Zw?=
 =?us-ascii?Q?hx542zCWvpiLYK/XFHQrDwkbpQ738WnA08h223MHTkLT8qila4gsLf2uvpuT?=
 =?us-ascii?Q?2rhuXgQmvZ22IUDLK1mL6WXjiTX/icFHxyTw6ttg4gr5wui0xRqxYQwn24y4?=
 =?us-ascii?Q?H5xGKyi8ab+vqomSr8/bouBI8/pb0df01wR4ithNEemuuUsZ+lynUjxuQyDl?=
 =?us-ascii?Q?kNO7OakMbI+mRgWQhY8g9fECbd873X/B5lIzl8WqVWKLIsT4Q8B2GnSZ0eCe?=
 =?us-ascii?Q?lXuRbH4IryhzeQXAM+nDbmjz3Emzdjb6GBexbJMV2xDA56cXjDkQgkbrkj3C?=
 =?us-ascii?Q?n78WZoAMLpMulgjy++VDof6KLmUzCTcK5s3hIqZKalZS/ZhT6AOE5Kr0AYca?=
 =?us-ascii?Q?Y2yQpFM6/rsmW/UhFR39fw9t2E8QhITV+u09T2HmLAaonQktr+Ghn0aSkCko?=
 =?us-ascii?Q?QmpmmJK+rf6/P/klqurOOUT8FpNPHVuCD1kw88LqjKGIW2gROIQskK5Oi+bm?=
 =?us-ascii?Q?vtn4+TRb/D5f2wDa+EvmLE58AcB1vChXwSxmTd18Dln16K/sXvvKK7DxQy7m?=
 =?us-ascii?Q?qroqarBNqelJZtl6J4nY5sQ+PMTt81pmh6biWn5MVVEicR8qIkh6t3QOPsxG?=
 =?us-ascii?Q?s3mQGwHfcox6XBfUDc+Xj+Ae7pQA3IR2VWXjTUuyRIAmCktMmYiXFyJ+ZIAp?=
 =?us-ascii?Q?Q6fZbXmIb9SK7Z+qDkQuLd4HlY29c2S1h6vTb5e2G94i6ww7bp8iPnP6L3fy?=
 =?us-ascii?Q?DS8TFTl8ySw/EbDsSTffH2NdCfmfBI37QfL5m/t9tik24t01wSyxhWGnWa9Q?=
 =?us-ascii?Q?KbufnH62kMv6cTfi0D1u66ggKXUUqmKPW6dov9byCHibGGfhmJaasm298mkk?=
 =?us-ascii?Q?8Hc5JILBQhEWTUuhbOrxphMDo8vpN6uJyAFOEQVBwukAlPrIT6pZJxFa9lyM?=
 =?us-ascii?Q?lrD5OVtaszgR6zKX1LSrSrRNuc1Ov7+ftSPVOpfzKGu4T33yfxbJyHHnznEe?=
 =?us-ascii?Q?zDiXiCVRgtwkMbklU5uy61ZvrfvcQKeLpnbdT4z1B68+tNytl2jY0QSXruPX?=
 =?us-ascii?Q?RyzIusqBXuzLhf/lPZV3mB9/A7tvumYAdgXyAiyRZRy/jgTJMjeC8nwNIo7J?=
 =?us-ascii?Q?f4I7v0tjfxSWIo7ooLMqi8Fdd2E2aTRH+HGg4Gh4O1Kq+Pc2lQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?dxHZ9pd4dF7+8rxcq2BcxRom3N2o6+EQxrLElh4gM9DbX5ZboI8SH2dolNZs?=
 =?us-ascii?Q?owGK7g4S6bW/WgZJ7DpIVvCdgL0k3vLbW/F/KuWMZdAzN8ihMb7SN1eZLJVO?=
 =?us-ascii?Q?hMo+1E122eGj6xoGpq3OeJhBfD8pLr6II61qHqV6s4kr8a5OHxj0F8lrAmoY?=
 =?us-ascii?Q?LB6xADElobGBFVpcSDMPl0xJcweyAkSYPR5t8CSQc8ZOK6oqKJtsrLqpw9zl?=
 =?us-ascii?Q?CtJrX6D7C9xfMVd+wXDapFPl5Un+JpWRxwC+GgRL384d+M4wHNDO2VEmvf9o?=
 =?us-ascii?Q?lXOlF0J69MtYK3i/xOhIUr2Y+o+gNtWki+fLnMHl+0IMySQGvyAgtZ6/P9lP?=
 =?us-ascii?Q?WWUvgeZ997tDQ+k6cu/T5PEOP/lDIvdxXChbUON0yIOeTen5dzY1wjKKGbqG?=
 =?us-ascii?Q?63GYXMuh0kEc1sXkeUjZue6Xdij0SwqwEI+14aLyKksJLa9/QYMq2IYRAdFs?=
 =?us-ascii?Q?WEGOStXb0bewVO4U0CuLVbBkiZnZPTknyRTKBGq/uTJGMzjLbnWDMyEuO/Iq?=
 =?us-ascii?Q?jNujod25yERCiAGUP58ioougff9yvIw4M2a+k+RPRy7JCkEtu1GseJVwg/pt?=
 =?us-ascii?Q?2F6TDcc9vIyxi0UfX/QyYsQqWq/mlg1UHKgmWr3h5by+APvI0qscxxNRtO6y?=
 =?us-ascii?Q?Q5IymrgaYpzCJc9lxynaJ6rc05yiSLZjKB7exYeiWJ5N3ydlD2zYqg+B9ArT?=
 =?us-ascii?Q?MkPhA2kv5PaKAEXbf4tamuf+ErLb85prDgTRJCNtw/o52X2LPBfTzkdMdpIF?=
 =?us-ascii?Q?Y6y9eEhXiaBIAsIVtH+ZEtv3D2dh9BVkCyV6uDRiwHf9uksZ6hRuNQSvA/ur?=
 =?us-ascii?Q?n7lWYIGN88XN2yIuNydLC6FiiUV+aFMW0JwRBRrM4qcIR6fYiGLKiOxg+UpW?=
 =?us-ascii?Q?x5zMDnU7hX05iOEV7Qq8X03xKspP4C3RaQBLIGdkrb0NtcKBZYU7eoPsaXKZ?=
 =?us-ascii?Q?qLWkWDqqH2vby/z2uqJ5RLc56hu1KP+ZjZD2oVcWmZvc8J9jnMxWgtnJ/7Kc?=
 =?us-ascii?Q?s+5MEUKXNqdhmtCLCqYmWLT6+JGNPpCSOlfoLeMstD5S8tiF9zgXHh8LF5aF?=
 =?us-ascii?Q?QJqIFLOqtA1eDj9OCsc8EmH4hwu+/hrJl/XI9L0n3FpYZGNJQSRZ7Ncaahkg?=
 =?us-ascii?Q?QKk3us716VSj6+z1VPAPS23PoP7aFL0YWoUIrYCD5Bl7IKNAlR2i/4cMuhLY?=
 =?us-ascii?Q?t0YqEWjuCUe6tyZtsDIdk7xb2eU6Ybu2t8TvOj9FmkY/XibgcRt24DMMg+q3?=
 =?us-ascii?Q?oCFA1YP+eo4vrBnY0NMQtFS5g4lc9TXYoi/uoaDLHAuJE4F4ze142pLnGUhO?=
 =?us-ascii?Q?oKlptm4mCYflEt5pSjTiaexehM95GQFuvpPASUsKUdMtz3duJR1OUyFZM/qQ?=
 =?us-ascii?Q?8wapas1WonIH/Z34K6gNVyZM7Wnk/dbEhNKdp2CjLBAbE2nW7PDWG+ontmm0?=
 =?us-ascii?Q?WmfLg4ybUyb7W5uVXYX/DIa8h09dap12nPZGC2+dOEdExfEuW5JcXsXqg+4z?=
 =?us-ascii?Q?s1QNNH6Ma/TA+oOkbAT57M5ylcBr37MI7+4OeXWhgl4+LVVH8GI96i+UF/87?=
 =?us-ascii?Q?rpH/K5JZChx7mrrWbMisqIOowQdHnZdVgyZLRmea?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 325aac3a-bd03-40a2-458f-08dcbc5358b9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 11:22:13.8601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1EDiMPG59GBMeuC2Y0sFZ9KBVhPcT8xzJ9WVjAgzPtVcdKm1zmPlHGwjhJpBii2eAS3UuSEkbj3Po9h+d9d/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9322

Since commit "6acba0345b68 usb:gadget:uvc Do not use worker thread to pump
isoc usb requests", pump work could only be queued in uvc_video_complete()
and uvc_v4l2_qbuf(). If VIDIOC_QBUF is executed before VIDIOC_STREAMON,
we can only depend on uvc_video_complete() to queue pump work. However,
this requires some free requests in req_ready list. If req_ready list is
empty all the time, pump work will never be queued and video datas will
never be pumped to usb controller. Actually, this situation could happen
when run uvc-gadget with static image:

$ ./uvc-gadget -i 1080p.jpg uvc.0

When capture image from this device, the user app will always block there.

The issue is uvc driver has queued video buffer before streamon, but the
req_ready list is empty all the time after streamon. This will queue pump
work in uvcg_video_enable() to fill some request to req_ready list so the
uvc device could work properly.

Fixes: 6acba0345b68 ("usb:gadget:uvc Do not use worker thread to pump isoc usb requests")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/gadget/function/uvc_video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index d41f5f31dadd..a9edd60fbbf7 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -753,6 +753,7 @@ int uvcg_video_enable(struct uvc_video *video)
 	video->req_int_count = 0;
 
 	uvc_video_ep_queue_initial_requests(video);
+	queue_work(video->async_wq, &video->pump);
 
 	return ret;
 }
-- 
2.34.1

