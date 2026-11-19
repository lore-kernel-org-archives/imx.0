Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.43.123
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078824;
	b=3JEz9NZP8/Nk9gQbjVPuJ55ZnKA992GSiPOLsn+UOGEMMs9Z+aXPPaV3oJ6XVFzrNGju
	 m7vc0nPg1JODOuZFRejYS3I8SmV0CVRV0c26GKoClBmqck6dNvktILzI+NC4ql9dVjaZC
	 /VEM7sKqBkLdHjNpxm07XYjCeDpLSfVW4izrBasM9T/KQdudV4BLkvrAyaW8si11bndE8
	 q9Mk+5ajYleNS8vUQzr/89aH456SrxYLDtG349jFg+1pIMnOFHqV3inYcjY1mYFHG43r2
	 lUtvc+mJWr1hx1BcNWuusRMtvuuMaepMoraAoFyMZn/V5pZSYnYQxZZTSzWDsnNFiFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078824;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=R7Dk7xg1RqNy86vPVRlJxL26Pldn4DXwoxiSv4WOSCw=;
	b=UgVQWRGgckCoUX3rEGj3f86qFd/Mx1rFfGi+ZeeGgiybVezX16B2ITAvCFskaU9URKYU
	 /XaGc0n4zAgX9fdkWXGVmmIQ514ND1Py8Gpv5VxZvufjPEEzyRHQPC/kVajCg3vImFFD7
	 sznnuaUYoU/QccjBFivc8e2PPA/N5es7+B9kZYBdxNPAxLtjMTiDS+iHrO9HplYfn0QYL
	 oF06wKeMR9USo4fK2X5tQXqTEjTYgnSlKmi4CRmILzkzGPBAOGyp4c3EZlue6XEGtw2n8
	 qcG9RRil0szuR9ni8Z8Pancgaj3pXutV1XtRuApOmR6+NR9aMZNzf7beGO4LggUIZNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=sU2S59bQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.43.123
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022123.outbound.protection.outlook.com [40.107.43.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEF6606A324
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 09:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EEF6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=sU2S59bQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oit5kvuabn2yiwc2KFc1IWmGehrDpAw0eCBrMXHvMczTsWkGigaK0oFLLe/bEPw4beCOsXJVwM8dACSSDTL2NOeLMjxxfN3H8fIxxx4Q8JOo3nWJUViZ4N2Unf4d5GrcNxS+ctgHRmvLcI4s3o+pTfkIcaSs0nYKKA/MtWDUbB/2Lu1xut82wd2LNRC2u4zEmJWypQmkREpSvs5LE4qPabICMTYgIUGFlcPY9oBiCwgYWjZ21zwMcv1yBdAoPvGpIYEdrYy07BvT2TPVbN03A1dhDEWtNxsRgWandqqvsGu0d2s6I3VuEhJAP3qnmOSIwMoIzBQpjJmfpQgQ7RpZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7Dk7xg1RqNy86vPVRlJxL26Pldn4DXwoxiSv4WOSCw=;
 b=hVghyPDWRBg0Bb/LUNJ/UGc+CU1ikqACcYa0xyf5bq1K/jrdoUQ5FpS2qptCngKXn1bn2bSjuC/7LUseNUtp/7kaDT/LcKxtizQwdXOqJJbkRnyW2ZNH64nsnFAhHMRKEyzORlLYkBrxczhLSaQW9phGEscCQGoIB2T40/lLQCcIiacK56R8O9I93vTtfscyMQtaREkBt3XpP5T3yFg6utf8ndjzHd8axvZaO3GffN0Y5jagGu2C5ZoFnPGRnPUS0SD30jpqHP7NsfVsCtFYQ2Kzaes2bmEzRq3IKtpOSKFpoKY9GFNhOs3e3xyIBiyBzfKqKu0zTCqw5DFYNBk01g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7Dk7xg1RqNy86vPVRlJxL26Pldn4DXwoxiSv4WOSCw=;
 b=sU2S59bQMwyfEHlnNhPIZCGZia+x0YE3uF0Uw90bFBe4FUOmVHg33kSMtQm4gnDWYoCYN3oeRE4q3OqVxKfNahU/kHRIOp+CpULQCIDuUZlj46qSYtiNUxA3EZ6aJcZBcPPQrbnWCEYAD536tEDBFDWQuL/1wUHL0fo/FaleFfVC6Tx6dRABKbM9yle4fEm2Z/d8Xc4e8sBiaYd2GwlZtc/5ocGvSs5PzHIjOW40LhEQwrEY0312IjrGoUJrD2CWkJ2YNjla6Jt6VYZ56IFqbjJQ7vDaWkIEOIYu5AT6H9hiWX93sQwR1t4nQbPKYy6tlI5bIq4XaZrVU69DSx4wnw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SE2P216MB360180.KORP216.PROD.OUTLOOK.COM (2603:1096:101:30b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 09:00:19 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 09:00:19 +0000
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
Subject: [PATCH v8 00/11] Add support for Wave6 video codec driver
Date: Thu, 19 Nov 2026 17:59:54 +0900
Message-Id: <cover.1795075577.git.nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-Office365-Filtering-Correlation-Id: 79045ab1-48ef-4adf-3a63-08df461b8956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|52116014|376014|1800799024|366016|18002099003|6133799003|260925021311599003|260925021911599003|260925022911599003|56012099006|10067099003|261026140227099003|261026121527099003|261028144727099003|261022105027099003|261021121427099003|261022075727099003|261022115727099003|261009223027099003|261102123227099003|261102130727099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	X7f8/8QLLtwvI1fkmNZDDQ6M6NCdKmSInwLoLRUuA1of7GJM5sojfyEIe5CRQxuh/dsdNU91mql14bOAQpTeLKxBYuOYB0UVHZPCxr5v53IkdnaIL1W0j+unn5JM5cTPJG6z4zx79MXLfEsXAPSXFnhI8k3pTxIZlPUAATyKZJR3szEqBtR+bTc+WyhQp/nUBgv3WlO+JJYj+jPOXfDA3KAeMFIfbkH0nOcSvICewkgDDBPgnaOSccGhKopj7dtMw9lUQyYxVHcI/WszNMNy1uDFi+DnN88T666l6fuN3gVZcZ9BqlKhajPyhwQ5Ve7CDWLBD79egxPU9BZBpRBZFK8egFhNBhPmKaaWepop8lGGUf25+OOR0dqmS5ptMAO2u6sENjfmhGOls/tsFh2UQf31f2bxvAx929JyxFc4CXjsinFHdqeXv0/t4EcX9hSjvQAWZ+xf4zDukKGFCUEX0rE4//1jB6qXYb+MPA3BdTCBJio7fJtufUia0LGJUaq6SWDOvd4bDNLQRTADWKIDcMogJi4cHKk0MvdzJUapPRETblihiyKJM7IzVeApUE+i8/4JxOnW9biibqjWj/EW34WAyaHTKfBUQAokN5rTwj0UyyFi0HeobFSzSL5iYfwSBsBZ0MCcgcyOG4TDZS/uqUYUdgqL9yTFojMzrMO6il78JDyOEZ9c0PxJ4S8uDv6ZsKIbAP5bhacG67Fi3OvFL7qrqRI84aCIiOKrtHCz01U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(52116014)(376014)(1800799024)(366016)(18002099003)(6133799003)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(10067099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261021121427099003)(261022075727099003)(261022115727099003)(261009223027099003)(261102123227099003)(261102130727099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1Y/cdMEn0ceShDB2gc3Aq4dBdylWmss8lRSjY2NFFCtTBVWwzuij5WBngzjY?=
 =?us-ascii?Q?1liutI7yO6GUrwDLLzDt2Mk/Qp1gOEw4rh5fAWArvJZqGYZFLyrVswReXOXo?=
 =?us-ascii?Q?IyDDcqHbljTUE8qIqxH9MSA1FeBzioYhPOdujxdExP669W6h32TUDD8q6iIF?=
 =?us-ascii?Q?4em9jmL2e3lQ6JPrPArfeOovz5pUTSp/7evJGIobP4OCcDjt6EXYtsRMlhzV?=
 =?us-ascii?Q?FJNMkT/evxo30+sQ4dTotwwsSrvtb+hf8dBZTHQUDr3luL/7moiSlbKmhpiv?=
 =?us-ascii?Q?mKwT6IP1B9FL0HHo3aYSKPimzOecx3Is06kML2FMgYyhSxXAz+Tt3C7jemyO?=
 =?us-ascii?Q?UkaAlOEz0v7y+eW2VKBbijnU08b1fWwsFFRj84Az0b1EAV+ko4EkeKwCi/yQ?=
 =?us-ascii?Q?Yc/HZCmztDZZTnrd+ruhtVpMWd7eK7d2fJniYZDnU/Kg+bqbpTdfU0ApwHLR?=
 =?us-ascii?Q?UwttiTjHuIOs1qUAW5Vq5QJgUsGYPkd4ezXVfLoAVm6nQx37ZTIRBoY3TSoK?=
 =?us-ascii?Q?dWJC94+BaItvIOEC+u9uLak4pi53C+HdqoYRqtBHv/KjIc97lS0QuHb5rEAI?=
 =?us-ascii?Q?RclPDwCbM/HaWxWkRj3P8iwBHQg7PuPdyMncywJFpuZ7H8Al4s/anP///mMl?=
 =?us-ascii?Q?PMOD9vVewFXo9SrfWFTeTNbNbzY+PA+DjiuneHWL+saIZ+g+Ulzv6WNJgwpc?=
 =?us-ascii?Q?e2UU8wMJwZgW1s9BRIlHysOPZmOYDVOWEYaUsVJOM+Hc3T+20+ed/MKBez32?=
 =?us-ascii?Q?zmRUUTkUap/xPJ7bQVXdpREzBKTtwatjNEiBYMMkgtZtvalk85FKncLTwTuF?=
 =?us-ascii?Q?BK0uvTrxXN7YNT5pSMyMy1EEbRPThR3mFAkGBMWH1Z74ag1orl8IpN4o06ca?=
 =?us-ascii?Q?oyOCH4C5RoP1ZBfTYkyzyjG2VFJ4uwH/J4Zvf6a5fPpOpvSbZK7suij1mp0/?=
 =?us-ascii?Q?/rFl7meN1eoWWUAgy/4Y3hxb+jprT+WsJmJgJJKfPV1ZQJPJVpFReShUZqto?=
 =?us-ascii?Q?Iqf+PUTaeu9e+qGj506y0YKjgJJ0GO7zn7X5Vb/Mg7cNt+KWnDc0nEnVIInP?=
 =?us-ascii?Q?jpWB8IpKQeAtbyekbtk8qwbdnWC41XmF+cUN/2mVGr+7WJ93OYA7RywkmSeo?=
 =?us-ascii?Q?cn9f30Ap8hyYV1aDPbkCLW+kV9sNPJjtKi9eLHmNEjCT3tyCPXzaXiivIJGY?=
 =?us-ascii?Q?hPCNVJIZnId9SpDNRt/lrlOahXmMhduGcRYT2bOhzjbKAglNyFvSH1dKCZZP?=
 =?us-ascii?Q?ANpwc08gT6ZzXDhAsuJxenIlrEwPsF8+dZsiNolt7uYYzmg8RhP9ZPl11uJ0?=
 =?us-ascii?Q?55402zquJ5Spgl3yApap5E5PUUf/jN8AZiyLzXfj6A50YrOxpcjUdlSlt9Le?=
 =?us-ascii?Q?mCelhZtAwWLwHhIckjOVwudQ1XDAiZ9zwFJtAZBR11G0vXvDWxGBjasp5bku?=
 =?us-ascii?Q?ZexnkWls4naJeJzD0LQGCKfYmIWltj2VgEl3fwRtKIB3id840mjtBER36wP/?=
 =?us-ascii?Q?F7Qg9WrIV/+9wiIYVhQvxW3t8WnqebLfiD7XLCXnQ2/zZl58YVqN39VrQ3qO?=
 =?us-ascii?Q?RuvK9gpZDHjZ41tZrwqaJeaK0PUgNSs2+7dVKRHfM+LF8fM5LW4opeWbOvJ4?=
 =?us-ascii?Q?BDZysVU+1Tk0fo3zn/4Ldcl5uy/m+ru1/AIcUaCwAZbFCYzqNK4JdiAr9x8G?=
 =?us-ascii?Q?l3sEfHkRE/acO/28jRYWfE6NlRAOxz4XNOxRuJHwMRp/LmgT+a+9KOIhynuB?=
 =?us-ascii?Q?eXpNwohSMbksXRGJQnFWZKt7zio0AHQ=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79045ab1-48ef-4adf-3a63-08df461b8956
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:00:19.4049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSNx382tOnEebA1NxExl8RFUxdhnPr2g46i3NgBFAHArrLpYRnqwhnZe0gXHDDabT/kl7JYSY5ma5/GTcm5duGacaA3mR3Ox3PoLUMOExgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB360180

This patch series introduces support for the Chips&Media Wave6 video
codec IP, a completely different hardware architecture compared to Wave5.

The wave6 driver is a M2M stateful encoder/decoder driver.
It supports various video formats, including H.264 and H.265, for both
encoding and decoding.
While other versions of the Wave6 IP may support VP9 decoding and AV1
decoding and encoding those formats are not implemented or validated in
this driver at this time.

On NXP i.MX SoCs, the Wave6 hardware exposes one control register region
and four interface register regions for one shared video processing
engine.
VPU Control region, Manages shared resources such as firmware memory.
VPU Core region, Provides encoding and decoding capabilities.
The control and interface regions are distinct DMA requesters and can be
associated with separate IOMMU stream IDs, allowing DMA isolation between
them.

The interface regions are described as child nodes of the VPU node rather
than folded into the parent with reg-names/interrupt-names, because each
one is a separate DMA requester. This follows the same structure already
accepted for the Qualcomm video codec bindings, and was mentioned on the v6
thread.

The firmware tested by this driver has been upstreamed in linux-firmware:
- Path: cnm/wave633c_imx9_codec_fw.bin

This driver has been tested with GStreamer on:
- NXP i.MX95 board
- pre-silicon FPGA environment

Test results for decoder fluster with -j2 option:
- JVT-AVC_V1, Ran 77/135 tests successfully              in 24.180 secs
- JVT-FR-EXT, Ran 25/69 tests successfully               in 11.157 secs
- JCT-VC-HEVC_V1, Ran 132/147 tests successfully         in 45.534 secs
- All failures are due to unsupported hardware features:
-- 10bit, Resolutions higher than 4K, FMO, MBAFF
-- Extended profile, Field encoding and High422 sreams.

Test results for v4l2-compliance:
v4l2-compliance 1.31.0-5386, 64 bits, 64-bit time_t
v4l2-compliance SHA: 48316b8a20aa 2025-08-12 12:44:56

Compliance test for wave6-dec device /dev/video0:
                fail: v4l2-test-controls.cpp(1204): !have_source_change || !have_eos
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
Total for wave6-dec device /dev/video0: 48, Succeeded: 47, Failed: 1, Warnings: 0

Compliance test for wave6-enc device /dev/video1:
                fail: v4l2-test-controls.cpp(1193): node->codec_mask & STATEFUL_ENCODER
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
Total for wave6-enc device /dev/video1: 48, Succeeded: 47, Failed: 1, Warnings: 0

Note: the failures are all related with the eos event.

Changelog:

v8:
- Dropped "media: v4l2-common: Fix P010 format info", now applied upstream
- Split the core, decoder and encoder support into smaller patches so
  that every patch builds on its own
- Moved the performance profiling code into its own patch
- Built the control and core drivers into one wave6 module and replaced
  the function pointers between them with direct calls
- Reworked the decoder and encoder drain to follow the stateful codec
  interface, using the v4l2-mem2mem helpers in the encoder
- Replaced the instance STOP state with an ERROR state set on command
  failures
- Made the job timeout watchdog per instance
- Fixed runtime PM, probe, teardown and cooling device issues
- Range-checked the frame buffer registration counts
- Set DEFAULT_NUM_TICKS_POC_DIFF to 1 to align with the codec specification
- Added the imx list to MAINTAINERS and updated the copyright year
- Cleaned up the code: helper macros, relaxed register accessors, devm
  helpers, unused codes and includes, coding style

v7:
- Moved the sram property from imx95-19x19-evk.dts to imx95.dtsi
- Simplified the sram binding property to maxItems: 1
- Fixed the issues reported by the sashiko-bot review of v6:
  - Bounded frame buffer and aux buffer counts before indexing
  - Added vb2_is_busy() checks to the decoder S_FMT handlers
  - Fixed video_device lifetime and driver teardown ordering
  - Propagated hardware init, runtime PM and thermal failures upward
  - Fixed tracepoint field widths and debugfs handling
- Balanced the VPU reference on the core activation error path

v6:
- Fixed the existing P010 format_info entry
- Moved all encoder parameter validation from the HW layer into the V4L2
  layer
- Removed redundant HW-abstraction wrappers from the VPU API layer
- Computed frame stride and sizeimage in the V4L2 layer
- Added explicit instance lifecycle helpers to the core driver
- Enabled the VPU only on the tested imx95-19x19-evk board

RFC v5:
- Move all shared resources to the parent node
- Drop child compatible and use data-only interface child nodes
- Update the VPU driver to create child devices and load the core driver

v4:
- Fixed build issues reported by CI tools
- Updated commit messages to use imperative mood
- Avoided using the same name for both nodes and labels in devicetree
- Removed unused labels from YAML examples
- Added description for child(vpu-core) node
- Added iommus property to both parent(vpu) and child(vpu-core) nodes
- Updated probe() functions to use dev_err_probe() when returning
  -EPROBE_DEFER
- Added wave6_vpu prefix to trace functions
- Updated HEVC decoder profile control to report MAIN_STILL profile
- Fixed bug in multiple instance creation by pre-allocating work buffer
- Fixed interrupt handling by checking INSTANCE_INFO register and instance
  list

v3:
- Removed ambiguous SUPPORT_FOLLOWER feature
- Used WARN_ON() for unexpected programming errors
- Split thermal device code into wave6-vpu-thermal.c/h
- Dropped wave6_cooling_disable module parameter
- Replaced mutex_lock() with guard()
- Added lockdep_assert_held() to clarify locking regions
- Removed exported function due to dual-license and used function pointer
- Added documentation and validation for state transitions
- Added documentation for device structures
- Added patch to enable VPU device in imx95 DTS
- Updated DT bindings and driver to align with parent(vpu) and
  child(vpu-core)
- Replaced magic numbers with mask and offset macros when accessing
  registers
- Placed goto statements after an empty line
- Printed HW info (e.g. product_code) via dev_dbg() for debugging
- Replaced wave6_vpu_dec_give_command() with dedicated functions

v2:
- Refined DT bindings to better represent the hardware
- Reworked driver to align with the parent(VPU) and child(CTRL, CORE)
- Fixed build issues reported by CI tools (Smatch, Sparse, TRACE)
- Improved commit messages with clearer descriptions
- Added kernel-doc for exported functions
- Removed redundant print statements and unused code
- Reordered patches to prevent build failures

Nas Chung (11):
  dt-bindings: media: nxp: Add Wave6 video codec device
  media: chips-media: wave6: Add Wave6 control driver
  media: chips-media: wave6: Add Wave6 core driver
  media: chips-media: wave6: Add Wave6 decoder firmware interface
  media: chips-media: wave6: Add Wave6 m2m decoder
  media: chips-media: wave6: Add Wave6 encoder firmware interface
  media: chips-media: wave6: Add Wave6 m2m encoder
  media: chips-media: wave6: Add trace and debugfs
  media: chips-media: wave6: Add performance profiling
  media: chips-media: wave6: Add Wave6 thermal cooling device
  arm64: dts: freescale: imx95: Add video codec node

 .../bindings/media/nxp,imx95-vpu.yaml         |  162 +
 MAINTAINERS                                   |    9 +
 .../boot/dts/freescale/imx95-19x19-evk.dts    |   10 +
 arch/arm64/boot/dts/freescale/imx95.dtsi      |   37 +
 drivers/media/platform/chips-media/Kconfig    |    1 +
 drivers/media/platform/chips-media/Makefile   |    1 +
 .../media/platform/chips-media/wave6/Kconfig  |   16 +
 .../media/platform/chips-media/wave6/Makefile |   15 +
 .../platform/chips-media/wave6/wave6-hw.c     | 1934 ++++++++++++
 .../platform/chips-media/wave6/wave6-hw.h     |   58 +
 .../chips-media/wave6/wave6-regdefine.h       |  651 ++++
 .../platform/chips-media/wave6/wave6-trace.h  |  284 ++
 .../platform/chips-media/wave6/wave6-vdi.h    |  102 +
 .../chips-media/wave6/wave6-vpu-core.c        |  446 +++
 .../chips-media/wave6/wave6-vpu-core.h        |  130 +
 .../chips-media/wave6/wave6-vpu-dbg.c         |  184 ++
 .../chips-media/wave6/wave6-vpu-dbg.h         |   14 +
 .../chips-media/wave6/wave6-vpu-dec.c         | 1969 ++++++++++++
 .../chips-media/wave6/wave6-vpu-enc.c         | 2762 +++++++++++++++++
 .../chips-media/wave6/wave6-vpu-thermal.c     |  141 +
 .../chips-media/wave6/wave6-vpu-thermal.h     |   24 +
 .../chips-media/wave6/wave6-vpu-v4l2.c        |  500 +++
 .../platform/chips-media/wave6/wave6-vpu.c    |  824 +++++
 .../platform/chips-media/wave6/wave6-vpu.h    |  142 +
 .../platform/chips-media/wave6/wave6-vpuapi.c |  333 ++
 .../platform/chips-media/wave6/wave6-vpuapi.h | 1014 ++++++
 .../chips-media/wave6/wave6-vpuconfig.h       |   72 +
 .../chips-media/wave6/wave6-vpuerror.h        |  252 ++
 28 files changed, 12087 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
 create mode 100644 drivers/media/platform/chips-media/wave6/Kconfig
 create mode 100644 drivers/media/platform/chips-media/wave6/Makefile
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-regdefine.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-trace.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vdi.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuerror.h


base-commit: aa0f4c41d4870a18e65772a1817af16427200371
-- 
2.41.0.windows.3

