Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.110
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078833;
	b=E6YiiQtq/gbY3cFFmSGU1BBFsgLCVDjq6o72DFnvwtYlF0BwxDE7Ywl0l45mPUZC3wLw
	 WFAC0baGRTNU5Qntoz1VJZKRud05dNoXekPGtofpOEytxUutYSnhrHOvcmubgcyrMNYBB
	 L3HCfU1T+OT3Z0xBIKRTSsSi0/o9saZIylDyxC62zVHPsNJNUbSgd6e5wM8Gq2eByEX/k
	 LuDI7KSTf7+ASPemRtb7+DeYu8w7mh1isDboYKPiAKBJh4Q7Wyp5BXfNLeVsyt8FaNqJU
	 ZkxaHp5ljlIMhJl4TCHh5qrqFpYWR46iCMe9RlybjVXalI3SZrOZmDy6/5kwZ5+/wTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078833;
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
	bh=myDRvYM1zHhn0g6kqS+d9w2UX1gfThKrApLdnzst6FE=;
	b=bxlr1OhI3VyVJ/7hOZUeV5zhCfGk8uN9qn8LGI6lRdCTb/OMfOe+WscqdNXTaxwZngSR
	 yAQeetm/B0bpjlFJBpEWVfvFMILSYXGGVlaiD1XdcAIAl9IfW5wLEiO7o2FJxyc3fp1CO
	 HehBlzPO4+fU9dJjuYKwpdlPKIxGKhb2dyifrGMtbKC1KKbv8GECL0elgdzoH5yXikKi+
	 0Gx9hylJ/ecKQZMFwzwWWDSE2hHXEna9L6T8KII+9to1kr3UoKpFUD2bbbdgTlnSO/pMM
	 xt6gg/jCwQXRZiXgjOqSWY/r04PnTE8grGgI1QdEDcHbAeJ5Glr5VS0trq0s1nXGOcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=ZKx9AgF+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.110
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021110.outbound.protection.outlook.com [40.107.42.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B8A60A2602
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 09:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26B8A60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=ZKx9AgF+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cb9M+iodzlB8ZO6tYWYMuWYcHSb9WB1rRBHVxKEwg6Vqcu6j/nxstLD6hH5SJPkmQtKbNnTAja5e5g8OkxM1f10G9WJydmVLQYtT8Lk7Dj3Tunu/J6sgwI8wvezfSWpw9+ijqA4EG9pyZPGf2AkYwnX0E4uZqOLSdgFBUtaUNddHHJM/EebWG30zhllucdCV1CALlHR3xXjTzTFEniknRTBAL1vjsIUSSZ7A7NnkZKp/Xp6rQx36N6C4PEFKzH+iedFsUhi8wTScNtZ9Q1m1HQfyofiQbehv/i9J6idAjFReu5lIGYoMLnJCWMvF7r6A52FynUthuGVFL99HvP4TLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myDRvYM1zHhn0g6kqS+d9w2UX1gfThKrApLdnzst6FE=;
 b=XVWVJe8EbcOClsWT6fXi9RQfX41BwhLvrB9GhL+/gpdDO5zEta3sW+Z4lIaEoEwQITxOsSoWLGox3IgSgqxSVJUgv156DXzL6Z/P+xLeZf5H7bW9OJ/K6BBaYmqFdAkxS8HZ2tzUcVksk/vJVnJepqp5vKLNld1o2IZzDHbdddda0AaiwVJCeEp5uWlO9QJ8i7jwt+xdgX8gabjShtJJCX0uXkPa855ejchVN/aXtjXlKuXhAya3p2nS86qmB01I/Zd3jPiDepscP9Q4OcN5ZGHZTI3kwerql3zQYgqANnahGfkSx/L8omOF2aBQsyp9narwCq0EN2Iv0tir0RJ+/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myDRvYM1zHhn0g6kqS+d9w2UX1gfThKrApLdnzst6FE=;
 b=ZKx9AgF+aTOLq939uBEOsqeQyNUk4e0UkX7WzIE0ToDMXpiDv3Q/Ho2v0BzGHeVytYz35HjVrEIgHVgGrgPZ7cKxRiMKBjlraNHBvfitdVTKhrJWBJ0sKypfBoFBNsBRD/L7PCDBew7u77nAsq2Am/rb/Asb9e6uPk6KhXdJ+ywUO6MoOzhDlUGpcHrfSNLofT7QYMsAGGfl/u2dUZKoccBD1LR5Wna7NCW11W7mCFLWj/AK0zhVYdbeX53aV80Wms51qbKFQ6NxGE/uzxrE5hrkfOzPapMC5g+0WwIUTYFeFijbsWvCDxqzpGL02WVgdvtZ6b3SCb4N5n+H9JYskQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SL2P216MB1466.KORP216.PROD.OUTLOOK.COM (2603:1096:101:33::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 09:00:26 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 09:00:26 +0000
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
Subject: [PATCH v8 06/11] media: chips-media: wave6: Add Wave6 encoder firmware interface
Date: Thu, 19 Nov 2026 18:00:00 +0900
Message-Id: <85ce28c44e167aa05ffc19dc02ce2be26dd99893.1795075581.git.nas.chung@chipsnmedia.com>
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
X-MS-TrafficTypeDiagnostic: SL2P216MB2441:EE_|SL2P216MB1466:EE_
X-MS-Office365-Filtering-Correlation-Id: e972d57c-1fe7-48b4-6640-08df461b8cee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|52116014|376014|1800799024|366016|22082099003|18002099003|6133799003|3023799007|260925021311599003|260925021911599003|260925022911599003|56012099006|10067099003|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261022105027099003|261021135927099003|261021121427099003|261022075727099003|261009223027099003|261102123227099003|261009221227099003|261009220027099003|261009221727099003|261009223327099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	m0Ysj1npMdrmss2ts7tHR3lYZoKg1Wa7YiM/Rpwpx4+tVrk7a0VDPgaXk/00Kqc2i4jnJCuGkcI+LEakwg4N0/NzcHFSBNtWzbGah3M1t7xkCdEs6h0DNy/Xqkbxp5feGiBkJdV5h1zS1mMsaLliglujzfj3Z23mNlxxNrS9SL/JCyEsggL4/Reb5zI1/Ujt5SN3q/RE8S1WNwE8MjopIKa41R01xPQ1NzZsaQu51I+0kvn6RAi6a2oFju2ECAVfb5pWqHRx2VTnsrBjoXP5rYpbo893OBRdAvMSf76iKNq7YyMwS32arYxtATQqCZorfS1Q71x7vGt0tCkeUV+nzoiSeSRhSM3Kdyrsm9nUhyg41CP2uiR2NTRYKt1EBr21XnevZmWGH2Q1tT92XD21643Yevoe/Jhy9DCININAeupJi9GNrK4BHCN/B2G6hhigVEoR4pWTrLB/wsubcT3QjNCotpBgU3eSlJ7966hM71aeuCW3cjRipq/FlxaU1jGuc37kHJeZ3Qrw5ySkW6BLUf1yPAbyKLWiKXOWTYY0kcV6tkhlBHQ2vl3rEM45erksiZ1t6fdyPqvvmFOpHSstZTJRPu+YeN/+RmwmzMIcyJ3cgMepqa+1yqJ+6zkybbHHSGUMZ36wm0y1g7nWi5oHIyO0KohOECfjCD4Xc7MkZDkkh/R0yde5hzLltJNnB46q1BAuTHsfWkszojUE7v24KEKQcjD8t7mHkVPuTCfCxBo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(52116014)(376014)(1800799024)(366016)(22082099003)(18002099003)(6133799003)(3023799007)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(10067099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261022105027099003)(261021135927099003)(261021121427099003)(261022075727099003)(261009223027099003)(261102123227099003)(261009221227099003)(261009220027099003)(261009221727099003)(261009223327099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?utHjjlkWtj9rHYqn8KaIKiVOe8CY/tBUEIm3nqQxTubGO5Ds0yzDPNAXwLNz?=
 =?us-ascii?Q?3ry+62XpJ5QF3httNSaGm3SjPto5LW5I0IMtnW4jmSZTKq6FlcT1euQA7PYQ?=
 =?us-ascii?Q?cjKg6DdiEpgwwHGdEp6xvpUUXn5ZjMHHtnPzqJl2UpmaY6VXbGbTqOJBNT10?=
 =?us-ascii?Q?3FWL8fa3brE/LmhLoNQ9sCMxlMpEsGM3j/0TqTY8/FdZS5495d84iEGTz7v3?=
 =?us-ascii?Q?8aAqMqOM2G7sds3xpXeLq8zj2M9n676m6Pvc6OCnYZyAZEgsuamPznuSw/OM?=
 =?us-ascii?Q?X+3hSpLQWR1uyNeJ5Af7f260C77uDBHpqhWf9z2W+02dfrcQsGnHF56+Pl/r?=
 =?us-ascii?Q?kbFc7F5Eigx/zgR36vS5DyVzXzIdo2WgRBkcsHbOi2brtsQpWxhGk+VuB6OZ?=
 =?us-ascii?Q?JoAO6i4QzSXHWueQL1kafq3ipLcK7DMLjkL0rLlaz06MiysvUnAAZ4G+44Su?=
 =?us-ascii?Q?IgiXEkvNSuy1Io8diVG4Pe5p6efEWWSdcotxa5x4H07kbcvScYOgupl4YK0A?=
 =?us-ascii?Q?AE59E9vpLCX2lIrrwQj+xi+FCT/zNKrlYTRr4mESdLqEz5JXTBBdQekp1rMS?=
 =?us-ascii?Q?ZK03L+oy0+30P+69QoTqloXyu47O0p0JuRnDFpj4LZ9gzt1hSPtxL/8gpGve?=
 =?us-ascii?Q?DkdPRWZZs6n/Fw110NJVlvOrcifrdJfNNl3poq+HzDr9kHTEmeYaqsOqvaF6?=
 =?us-ascii?Q?MdBiJGVmRiYxpCdOF7qc2cEmsY0+ey+b3F7mL+1u3WKLB6+QCqVN1/j2M99K?=
 =?us-ascii?Q?j4ImiRZZRrLWwDgNn8UoZwFs3D9lW+WyQADoxtadk5QnjpCJ9yEQL1favGLW?=
 =?us-ascii?Q?8jdqthi6FAPU8wKfL9CgKwPEh+36+lSNMXtz+jWMg0CjMfu3uChKb4FbTP/8?=
 =?us-ascii?Q?i8j8zvv21S5IQSysaEiRvjpG8iof7fFz1tMfw3Wm/uEP2BSqQPruScOFBDO+?=
 =?us-ascii?Q?+sRf4vAPj0sz60Y0b144h3uqDQsVBBQbYR6Zoz61zvi8jJyGDSFpmkiY/8FF?=
 =?us-ascii?Q?hxzNh+xgVO5//iavUIlXq3lxvoH7w9i4EK5Un4GseKSJGPY26lM2Z6Dqi6Nk?=
 =?us-ascii?Q?24hJd1vwIjHVgWOYweY/W+NocEfcs0bu+JC/v+QTgWeZH7CT+Cw+S0ZGOeax?=
 =?us-ascii?Q?eWjVdt3PzwCpPK6xZ7r+J8mWWbjQfl6kcJaxwhkQN+Mab0pD0gEfYzLjELMc?=
 =?us-ascii?Q?2bNAa58gOfSX9qEcr6ZM3Lqfrt5X/9Pdze3s1F3dXokL+2w5No915k9i4VhW?=
 =?us-ascii?Q?oYVLgkankjaZpC/9BUpMIkGiPmCl21+/sRBHUFiP4uu6ftpfMPryKN9wYIO7?=
 =?us-ascii?Q?B1ftkwQCyK8RL1dTLKhbzc+QgSaJv6AKEmuJFjbYh3N91MxEAIGKkw76OQFL?=
 =?us-ascii?Q?q3XFoIrAR6smC4Dz0v6v5bXCy7Urdw90LTS5sPsgs/0PMrEp069CjyHqfa0n?=
 =?us-ascii?Q?mdJm4CYpnLe6UU1wQmgwS20Cwz4FdAjS2pIPVjcdhoHCv+YWd8L7TJudhXRr?=
 =?us-ascii?Q?YP8vJY0/2yuYa9KWaNyiEfo4AM+iLWahlrHqgNhtpRQZSnnZOV193XJKOZv0?=
 =?us-ascii?Q?CopMKELsCYLvu5GOO5Z+h+o6mmiHAeGiHtqM15xodYQcdEt3jV19JKGXOFU7?=
 =?us-ascii?Q?EYKTZHxtHC6+tAw9VKQI5D90Le8iFHFuHL4Snbenh7qr7wYBhj9kHqAU7A7Y?=
 =?us-ascii?Q?T+0/o6vvLVs8MLiYkcdz/lWJCizrZvGqOMwgWyJ/eEk9+H+PXKiWMVCTpLYb?=
 =?us-ascii?Q?ysSabpydEVHYBLm3f0jrJM/L1vPpZsA=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e972d57c-1fe7-48b4-6640-08df461b8cee
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:00:26.7456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8mh2T3sKIqwXMuQyTcWKYibYW8vArYPALbq4MNVuz6qe71dccRzUmrRyP2cWprHoP0xyncqV8S3YSMBxU6fgBPA8hOa5Py2FB9JbJsUoHe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1466

Add an interface layer to manage hardware register configuration
and communication with the Chips&Media Wave6 video codec IP for
video encoding.

The interface provides low-level helper functions used by the
Wave6 core driver to implement video encoding operations.
It handles command submission to the firmware via MMIO registers,
and waits for a response by polling the firmware busy flag.

The encoder commands cover instance creation and destruction,
parameter setting and change, frame buffer registration, and picture
encoding.

Parameter setting and picture encoding complete asynchronously:
the interface interrupt reports completion and a query command reads
back the result.

Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave6/wave6-hw.c     | 940 +++++++++++++++++-
 .../platform/chips-media/wave6/wave6-hw.h     |   7 +
 .../chips-media/wave6/wave6-regdefine.h       | 312 ++++++
 .../chips-media/wave6/wave6-vpu-core.c        |   3 +-
 .../platform/chips-media/wave6/wave6-vpuapi.c | 131 +++
 .../platform/chips-media/wave6/wave6-vpuapi.h | 428 ++++++++
 .../chips-media/wave6/wave6-vpuconfig.h       |  14 +
 7 files changed, 1833 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.c b/drivers/media/platform/chips-media/wave6/wave6-hw.c
index 872a540df021..171391f797cb 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-hw.c
+++ b/drivers/media/platform/chips-media/wave6/wave6-hw.c
@@ -162,7 +162,9 @@ void wave6_vpu_enable_interrupt(struct vpu_core_device *core)
 
 	lockdep_assert_held(&core->hw_lock);
 
-	data = BIT(W6_INT_BIT_INIT_SEQ);
+	data = BIT(W6_INT_BIT_ENC_SET_PARAM);
+	data |= BIT(W6_INT_BIT_ENC_PIC);
+	data |= BIT(W6_INT_BIT_INIT_SEQ);
 	data |= BIT(W6_INT_BIT_DEC_PIC);
 	data |= BIT(W6_INT_BIT_BSBUF_ERROR);
 	data |= BIT(W6_INT_BIT_REQ_WORK_BUF);
@@ -932,3 +934,939 @@ int wave6_vpu_dec_flush_instance(struct vpu_instance *inst)
 
 	return 0;
 }
+
+struct enc_cmd_set_param_reg {
+	u32 enable;
+	u32 src_size;
+	u32 custom_map_endian;
+	u32 sps;
+	u32 pps;
+	u32 gop;
+	u32 intra;
+	u32 conf_win0;
+	u32 conf_win1;
+	u32 rdo;
+	u32 slice;
+	u32 intra_refresh;
+	u32 intra_qp;
+	u32 rc_frame_rate;
+	u32 rc_target_rate;
+	u32 rc;
+	u32 hvs;
+	u32 rc_max_bitrate;
+	u32 rc_vbv_buffer_size;
+	u32 inter_qp;
+	u32 rot;
+	u32 num_units_in_tick;
+	u32 time_scale;
+	u32 num_ticks_poc_diff_one;
+	u32 max_intra_pic_bit;
+	u32 max_inter_pic_bit;
+	u32 bg;
+	u32 non_vcl_param;
+	u32 vui_rbsp_addr;
+	u32 hrd_rbsp_addr;
+	u32 qround_offset;
+	u32 quant1;
+	u32 quant2;
+	u32 custom_gop;
+	u32 custom_gop_pic[MAX_CUSTOM_GOP_NUM];
+	u32 tile_param;
+	u32 custom_lambda[MAX_CUSTOM_LAMBDA_NUM];
+	u32 temp_layer_qp[MAX_NUM_CHANGEABLE_TEMP_LAYER];
+	u32 scaler_size;
+	u32 scaler;
+	u32 color;
+	u32 sar;
+	u32 sar_extended;
+};
+
+struct enc_cmd_change_param_reg {
+	u32 enable;
+	u32 rc_target_rate;
+};
+
+int wave6_vpu_build_up_enc_param(struct device *dev, struct vpu_instance *inst,
+				 struct enc_open_param *param)
+{
+	struct enc_info *p_enc_info = &inst->codec_info->enc_info;
+	u32 reg_val;
+	int ret;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	p_enc_info->seq_info_obtained = false;
+	p_enc_info->sec_axi.use_enc_rdo = true;
+	p_enc_info->sec_axi.use_enc_lf = true;
+	p_enc_info->mir_dir = param->mir_dir;
+	p_enc_info->rot_angle = param->rot_angle;
+
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_CREATE_INST_TEMP_BASE,
+			      param->inst_buffer.temp_base);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_CREATE_INST_TEMP_SIZE,
+			      param->inst_buffer.temp_size);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_CREATE_INST_AR_TABLE_BASE,
+			      param->inst_buffer.ar_base);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_CREATE_INST_BS_PARAM, VPU_STREAM_ENDIAN);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_CREATE_INST_SRC_OPT, 0);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_CREATE_INST_ADDR_EXT, param->ext_addr_vcpu);
+
+	reg_val = CREATE_INST_CORE_INFO_CQ_DEPTH(COMMAND_QUEUE_DEPTH) |
+		  CREATE_INST_CORE_INFO_CORE_IDC(SINGLE_CORE_IDC) |
+		  CREATE_INST_CORE_INFO_CORE_NUM(SINGLE_CORE);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_CREATE_INST_CORE_INFO, reg_val);
+
+	reg_val = CREATE_INST_PRIORITY_SECURITY_FLAG(param->is_secure_inst) |
+		  CREATE_INST_PRIORITY_VALUE(param->inst_priority);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_CREATE_INST_PRIORITY, reg_val);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_CREATE_INST_TIMEOUT_CYCLE_COUNT,
+			      W6_VPU_TIMEOUT_CYCLE_COUNT);
+
+	wave6_send_command(inst->dev, 0, inst->std, W6_CMD_CREATE_INSTANCE);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret) {
+		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
+		return ret;
+	}
+
+	if (!vpu_read_reg_relaxed(inst->dev, W6_RET_SUCCESS)) {
+		u32 reason_code = vpu_read_reg_relaxed(inst->dev, W6_RET_FAIL_REASON);
+
+		wave6_print_reg_err(inst->dev, reason_code);
+		return -EIO;
+	}
+
+	inst->id = vpu_read_reg_relaxed(inst->dev, W6_RET_INSTANCE_ID);
+
+	return 0;
+}
+
+static int wave6_set_enc_crop_info(u32 codec, struct enc_codec_param *param,
+				   u32 rot_mir, int width, int height)
+{
+	int aligned_height = (codec == W_HEVC_ENC) ? ALIGN(height, 32) : ALIGN(height, 16);
+	int aligned_width = (codec == W_HEVC_ENC) ? ALIGN(width, 32) : ALIGN(width, 16);
+	int crop_right, crop_left, crop_top, crop_bot;
+	int pad_right, pad_bot;
+
+	if (codec == W_HEVC_ENC &&
+	    (!rot_mir ||
+	     rot_mir == (SET_PARAM_ROT_MIRH | SET_PARAM_ROT_MIRV | SET_PARAM_ROT_180)))
+		return 0;
+
+	pad_right = aligned_width - width;
+	pad_bot = aligned_height - height;
+
+	if (param->conf_win.right > 0)
+		crop_right = param->conf_win.right + pad_right;
+	else
+		crop_right = pad_right;
+
+	if (param->conf_win.bottom > 0)
+		crop_bot = param->conf_win.bottom + pad_bot;
+	else
+		crop_bot = pad_bot;
+
+	crop_top = param->conf_win.top;
+	crop_left = param->conf_win.left;
+
+	if (rot_mir == SET_PARAM_ROT_90 ||
+	    rot_mir == (SET_PARAM_ROT_MIRH | SET_PARAM_ROT_MIRV | SET_PARAM_ROT_270)) {
+		param->conf_win.top = crop_right;
+		param->conf_win.left = crop_top;
+		param->conf_win.bottom = crop_left;
+		param->conf_win.right = crop_bot;
+	} else if (rot_mir == SET_PARAM_ROT_180 ||
+		   rot_mir == (SET_PARAM_ROT_MIRH | SET_PARAM_ROT_MIRV)) {
+		param->conf_win.top = crop_bot;
+		param->conf_win.left = crop_right;
+		param->conf_win.bottom = crop_top;
+		param->conf_win.right = crop_left;
+	} else if (rot_mir == SET_PARAM_ROT_270 ||
+		   rot_mir == (SET_PARAM_ROT_MIRH | SET_PARAM_ROT_MIRV | SET_PARAM_ROT_90)) {
+		param->conf_win.top = crop_left;
+		param->conf_win.left = crop_bot;
+		param->conf_win.bottom = crop_right;
+		param->conf_win.right = crop_top;
+	} else if (rot_mir == SET_PARAM_ROT_MIRV ||
+		   rot_mir == (SET_PARAM_ROT_MIRH | SET_PARAM_ROT_180)) {
+		param->conf_win.top = crop_bot;
+		param->conf_win.left = crop_left;
+		param->conf_win.bottom = crop_top;
+		param->conf_win.right = crop_right;
+	} else if (rot_mir == SET_PARAM_ROT_MIRH ||
+		   rot_mir == (SET_PARAM_ROT_MIRV | SET_PARAM_ROT_180)) {
+		param->conf_win.top = crop_top;
+		param->conf_win.left = crop_right;
+		param->conf_win.bottom = crop_bot;
+		param->conf_win.right = crop_left;
+	} else if (rot_mir == (SET_PARAM_ROT_MIRV | SET_PARAM_ROT_90) ||
+		   rot_mir == (SET_PARAM_ROT_MIRH | SET_PARAM_ROT_270)) {
+		param->conf_win.top = crop_left;
+		param->conf_win.left = crop_top;
+		param->conf_win.bottom = crop_right;
+		param->conf_win.right = crop_bot;
+	} else if (rot_mir == (SET_PARAM_ROT_MIRV | SET_PARAM_ROT_270) ||
+		   rot_mir == (SET_PARAM_ROT_MIRH | SET_PARAM_ROT_90)) {
+		param->conf_win.top = crop_right;
+		param->conf_win.left = crop_bot;
+		param->conf_win.bottom = crop_left;
+		param->conf_win.right = crop_top;
+	} else {
+		param->conf_win.top = crop_top;
+		param->conf_win.left = crop_left;
+		param->conf_win.bottom = crop_bot;
+		param->conf_win.right = crop_right;
+	}
+
+	return 0;
+}
+
+static void wave6_update_enc_info(struct enc_info *p_enc_info)
+{
+	struct enc_open_param op = p_enc_info->open_param;
+
+	p_enc_info->width = op.pic_width;
+	p_enc_info->height = op.pic_height;
+	p_enc_info->c_fmt_idc = get_chroma_format_idc(op.out_fmt);
+}
+
+static u32 wave6_enc_rot_mir(enum rotation_angle rot_angle,
+			     enum mirror_direction mir_dir)
+{
+	u32 rot_mir = 0;
+
+	switch (rot_angle) {
+	case ROT_0:
+		break;
+	case ROT_90:
+		rot_mir |= SET_PARAM_ROT_90;
+		break;
+	case ROT_180:
+		rot_mir |= SET_PARAM_ROT_180;
+		break;
+	case ROT_270:
+		rot_mir |= SET_PARAM_ROT_270;
+		break;
+	}
+
+	switch (mir_dir) {
+	case MIR_NONE:
+		break;
+	case MIR_VER:
+		rot_mir |= SET_PARAM_ROT_MIRV;
+		break;
+	case MIR_HOR:
+		rot_mir |= SET_PARAM_ROT_MIRH;
+		break;
+	case MIR_HOR_VER:
+		rot_mir |= SET_PARAM_ROT_MIRH | SET_PARAM_ROT_MIRV;
+		break;
+	}
+
+	return rot_mir;
+}
+
+static void wave6_gen_set_param_reg_common(struct enc_info *p_enc_info, enum codec_std std,
+					   struct enc_cmd_set_param_reg *reg)
+{
+	struct enc_open_param *p_open_param = &p_enc_info->open_param;
+	struct enc_codec_param *p_param = &p_open_param->codec_param;
+	u32 rot_mir;
+
+	rot_mir = wave6_enc_rot_mir(p_enc_info->rot_angle, p_enc_info->mir_dir);
+	wave6_set_enc_crop_info(std, p_param, rot_mir, p_enc_info->width, p_enc_info->height);
+
+	reg->custom_map_endian = VPU_USER_DATA_ENDIAN;
+	if (rot_mir)
+		reg->rot = rot_mir | SET_PARAM_ROT_ENABLE;
+	reg->src_size = SET_PARAM_SRC_SIZE_HEIGHT(p_enc_info->height) |
+			SET_PARAM_SRC_SIZE_WIDTH(p_enc_info->width);
+	reg->conf_win0 = SET_PARAM_CONF_WIN0_BOTTOM(p_param->conf_win.bottom) |
+			 SET_PARAM_CONF_WIN0_TOP(p_param->conf_win.top);
+	reg->conf_win1 = SET_PARAM_CONF_WIN1_RIGHT(p_param->conf_win.right) |
+			 SET_PARAM_CONF_WIN1_LEFT(p_param->conf_win.left);
+	reg->gop = SET_PARAM_GOP_TEMP_LAYER_CNT(p_param->temp_layer_cnt) |
+		   SET_PARAM_GOP_TEMP_LAYER3_QP_ENABLE(p_param->temp_layer[3].change_qp) |
+		   SET_PARAM_GOP_TEMP_LAYER2_QP_ENABLE(p_param->temp_layer[2].change_qp) |
+		   SET_PARAM_GOP_TEMP_LAYER1_QP_ENABLE(p_param->temp_layer[1].change_qp) |
+		   SET_PARAM_GOP_TEMP_LAYER0_QP_ENABLE(p_param->temp_layer[0].change_qp) |
+		   SET_PARAM_GOP_PRESET_IDX(p_param->gop_preset_idx);
+	for (int i = 0; i < MAX_NUM_CHANGEABLE_TEMP_LAYER; i++) {
+		reg->temp_layer_qp[i] = SET_PARAM_TEMP_LAYER_QP_B(p_param->temp_layer[i].qp_b) |
+					SET_PARAM_TEMP_LAYER_QP_P(p_param->temp_layer[i].qp_p) |
+					SET_PARAM_TEMP_LAYER_QP_I(p_param->temp_layer[i].qp_i);
+	}
+	reg->intra_refresh = SET_PARAM_INTRA_REFRESH_ARGUMENT(p_param->intra_refresh_arg) |
+			     SET_PARAM_INTRA_REFRESH_MODE(p_param->intra_refresh_mode);
+	reg->intra_qp = SET_PARAM_INTRA_QP_MAX(p_param->max_qp_i) |
+			SET_PARAM_INTRA_QP_MIN(p_param->min_qp_i);
+	reg->inter_qp = SET_PARAM_INTER_QP_MAX_B(p_param->max_qp_b) |
+			SET_PARAM_INTER_QP_MIN_B(p_param->min_qp_b) |
+			SET_PARAM_INTER_QP_MAX_P(p_param->max_qp_p) |
+			SET_PARAM_INTER_QP_MIN_P(p_param->min_qp_p);
+	reg->rc_frame_rate = p_param->frame_rate;
+	reg->rc_target_rate = p_param->bitrate;
+	reg->rc_max_bitrate = p_param->max_bitrate;
+	reg->rc_vbv_buffer_size = p_param->cpb_size;
+	reg->rc = SET_PARAM_RC_UPDATE_SPEED(p_param->rc_update_speed) |
+		  SET_PARAM_RC_INITIAL_LEVEL(p_param->rc_initial_level) |
+		  SET_PARAM_RC_INITIAL_QP(p_param->rc_initial_qp) |
+		  SET_PARAM_RC_MODE(p_param->rc_mode) |
+		  SET_PARAM_RC_PIC_LEVEL_MAX_DELTA_QP(p_param->pic_rc_max_dqp) |
+		  SET_PARAM_RC_VBV_OVERFLOW_DROP_FRAME(p_param->en_skip_frame) |
+		  SET_PARAM_RC_CU_LEVEL_ENABLE(p_param->en_cu_level_rate_control) |
+		  SET_PARAM_RC_ENABLE(p_param->en_rate_control);
+	reg->hvs = SET_PARAM_HVS_MAX_DELTA_QP(p_param->max_delta_qp) |
+		   SET_PARAM_HVS_QP_SCALE(p_param->hvs_qp_scale_div2);
+	reg->num_units_in_tick = p_param->num_units_in_tick;
+	reg->time_scale = p_param->time_scale;
+	reg->num_ticks_poc_diff_one = p_param->num_ticks_poc_diff_one;
+	reg->max_intra_pic_bit = p_param->max_intra_pic_bit;
+	reg->max_inter_pic_bit = p_param->max_inter_pic_bit;
+	reg->bg = SET_PARAM_BG_DELTA_QP(p_param->bg_delta_qp) |
+		  SET_PARAM_BG_THRESHOLD_MEAN_DIFF(p_param->bg_th_mean_diff) |
+		  SET_PARAM_BG_THRESHOLD_MAX_DIFF(p_param->bg_th_diff) |
+		  SET_PARAM_BG_ENABLE(p_param->en_bg_detect);
+	reg->qround_offset = SET_PARAM_QROUND_OFFSET_INTER(p_param->qround_inter) |
+			     SET_PARAM_QROUND_OFFSET_INTRA(p_param->qround_intra);
+	reg->custom_gop = p_param->gop_param.size;
+	for (int i = 0; i < p_param->gop_param.size; i++) {
+		struct custom_gop_pic_param pic = p_param->gop_param.pic[i];
+
+		reg->custom_gop_pic[i] = SET_PARAM_CUSTOM_GOP_PIC_TEMP_ID(pic.temporal_id) |
+					 SET_PARAM_CUSTOM_GOP_PIC_REF1_POC(pic.ref_poc_l1) |
+					 SET_PARAM_CUSTOM_GOP_PIC_REF0_POC(pic.ref_poc_l0) |
+					 SET_PARAM_CUSTOM_GOP_PIC_MULTI_REF_P(pic.multi_ref_p) |
+					 SET_PARAM_CUSTOM_GOP_PIC_QP(pic.pic_qp) |
+					 SET_PARAM_CUSTOM_GOP_PIC_POC_OFFSET(pic.poc_offset) |
+					 SET_PARAM_CUSTOM_GOP_PIC_TYPE(pic.pic_type);
+	}
+	for (int i = 0; i < MAX_CUSTOM_LAMBDA_NUM; i++) {
+		reg->custom_lambda[i] = SET_PARAM_CUSTOM_LAMBDA_SSD(p_param->lambda_ssd[i]) |
+					SET_PARAM_CUSTOM_LAMBDA_SAD(p_param->lambda_sad[i]);
+	}
+	reg->scaler_size = SET_PARAM_SCALER_SIZE_HEIGHT(p_enc_info->height) |
+			   SET_PARAM_SCALER_SIZE_WIDTH(p_enc_info->width);
+	reg->scaler = SET_PARAM_SCALER_COEF_MODE(p_enc_info->scaler.coef_mode) |
+		      SET_PARAM_SCALER_ENABLE(p_enc_info->scaler.enable);
+	reg->color = SET_PARAM_COLOR_RANGE(p_param->color.color_range) |
+		     SET_PARAM_COLOR_MATRIX_COEFF(p_param->color.matrix_coefficients) |
+		     SET_PARAM_COLOR_TRANS_CHAR(p_param->color.transfer_characteristics) |
+		     SET_PARAM_COLOR_PRIMARIES(p_param->color.color_primaries) |
+		     SET_PARAM_COLOR_DESCRIPTION_PRESENT_ON;
+	reg->sar = SET_PARAM_SAR_ASPECT_RATIO_IDC(p_param->sar.idc) |
+		   SET_PARAM_SAR_ASPECT_RATIO_ENABLE(p_param->sar.enable);
+	reg->sar_extended = SET_PARAM_SAR_EXTENDED_HEIGHT(p_param->sar.height) |
+			    SET_PARAM_SAR_EXTENDED_WIDTH(p_param->sar.width);
+}
+
+static void wave6_gen_set_param_reg_hevc(struct enc_info *p_enc_info,
+					 struct enc_cmd_set_param_reg *reg)
+{
+	struct enc_open_param *p_open_param = &p_enc_info->open_param;
+	struct enc_codec_param *p_param = &p_open_param->codec_param;
+
+	reg->sps = SET_PARAM_SPS_DEFAULT_SCALING_LIST(p_param->en_scaling_list) |
+		   SET_PARAM_SPS_STILL_PICTURE(p_param->en_still_picture) |
+		   SET_PARAM_SPS_AUTO_LEVEL_ADJUSTING_ON |
+		   SET_PARAM_SPS_STRONG_INTRA_SMOOTHING(p_param->en_intra_smooth) |
+		   SET_PARAM_SPS_INTRA_TRANSFORM_SKIP_ON |
+		   SET_PARAM_SPS_SAMPLE_ADAPTIVE_OFFSET(p_param->en_sao) |
+		   SET_PARAM_SPS_TEMPORAL_MVP(p_param->en_temporal_mvp) |
+		   SET_PARAM_SPS_LONGTERM_REFERENCE(p_param->en_longterm) |
+		   SET_PARAM_SPS_C_FMT_IDC(p_enc_info->c_fmt_idc) |
+		   SET_PARAM_SPS_BIT_DEPTH(p_param->internal_bit_depth) |
+		   SET_PARAM_SPS_TIER(p_param->tier) |
+		   SET_PARAM_SPS_LEVEL(p_param->level) |
+		   SET_PARAM_SPS_PROFILE(p_param->profile);
+	reg->pps = SET_PARAM_PPS_CR_QP_OFFSET(p_param->cr_qp_offset) |
+		   SET_PARAM_PPS_CB_QP_OFFSET(p_param->cb_qp_offset) |
+		   SET_PARAM_PPS_TC_OFFSET_DIV2(p_param->tc_offset_div2) |
+		   SET_PARAM_PPS_BETA_OFFSET_DIV2(p_param->beta_offset_div2) |
+		   SET_PARAM_PPS_DEBLOCKING_FILTER(!p_param->en_dbk) |
+		   SET_PARAM_PPS_LF_SLICE_BOUNDARY(p_param->en_lf_slice_boundary) |
+		   SET_PARAM_PPS_CONST_INTRA_PREDICTION(p_param->en_const_intra_pred);
+	reg->intra = SET_PARAM_INTRA_PERIOD(p_param->intra_period) |
+		     SET_PARAM_INTRA_HEADER_MODE(p_param->forced_idr_header) |
+		     SET_PARAM_INTRA_QP(p_param->qp) |
+		     SET_PARAM_INTRA_REFRESH_TYPE(p_param->decoding_refresh_type);
+	reg->rdo = SET_PARAM_RDO_CUSTOM_LAMBDA(p_param->en_custom_lambda) |
+		   SET_PARAM_RDO_ME_SEARCH_CENTER_ON |
+		   SET_PARAM_RDO_QROUND_OFFSET(p_param->en_qround_offset) |
+		   SET_PARAM_RDO_ADAPTIVE_ROUND_ON |
+		   SET_PARAM_RDO_HVS_QP(p_param->en_hvs_qp);
+	reg->slice = SET_PARAM_SLICE_ARGUMENT(p_param->slice_arg) |
+		     SET_PARAM_SLICE_MODE(p_param->slice_mode);
+	reg->quant2 = SET_PARAM_QUANT2_LAMBDA_DQP_INTER(p_param->lambda_dqp_inter) |
+		      SET_PARAM_QUANT2_LAMBDA_DQP_INTRA(p_param->lambda_dqp_intra);
+	reg->non_vcl_param = SET_PARAM_NON_VCL_PARAM_ENCODE_VUI;
+}
+
+static void wave6_gen_set_param_reg_avc(struct enc_info *p_enc_info,
+					struct enc_cmd_set_param_reg *reg)
+{
+	struct enc_open_param *p_open_param = &p_enc_info->open_param;
+	struct enc_codec_param *p_param = &p_open_param->codec_param;
+
+	reg->sps = SET_PARAM_SPS_DEFAULT_SCALING_LIST(p_param->en_scaling_list) |
+		   SET_PARAM_SPS_AUTO_LEVEL_ADJUSTING_ON |
+		   SET_PARAM_SPS_LONGTERM_REFERENCE(p_param->en_longterm) |
+		   SET_PARAM_SPS_C_FMT_IDC(p_enc_info->c_fmt_idc) |
+		   SET_PARAM_SPS_BIT_DEPTH(p_param->internal_bit_depth) |
+		   SET_PARAM_SPS_LEVEL(p_param->level) |
+		   SET_PARAM_SPS_PROFILE(p_param->profile);
+	reg->pps = SET_PARAM_PPS_ENTROPY_CODING_MODE(p_param->en_cabac) |
+		   SET_PARAM_PPS_TRANSFORM8X8(p_param->en_transform8x8) |
+		   SET_PARAM_PPS_CR_QP_OFFSET(p_param->cr_qp_offset) |
+		   SET_PARAM_PPS_CB_QP_OFFSET(p_param->cb_qp_offset) |
+		   SET_PARAM_PPS_TC_OFFSET_DIV2(p_param->tc_offset_div2) |
+		   SET_PARAM_PPS_BETA_OFFSET_DIV2(p_param->beta_offset_div2) |
+		   SET_PARAM_PPS_DEBLOCKING_FILTER(!p_param->en_dbk) |
+		   SET_PARAM_PPS_LF_SLICE_BOUNDARY(p_param->en_lf_slice_boundary) |
+		   SET_PARAM_PPS_CONST_INTRA_PREDICTION(p_param->en_const_intra_pred);
+	reg->intra = SET_PARAM_INTRA_HEADER_MODE_AVC(p_param->forced_idr_header) |
+		     SET_PARAM_INTRA_IDR_PERIOD_AVC(p_param->idr_period) |
+		     SET_PARAM_INTRA_PERIOD_AVC(p_param->intra_period) |
+		     SET_PARAM_INTRA_QP_AVC(p_param->qp);
+	reg->rdo = SET_PARAM_RDO_CUSTOM_LAMBDA(p_param->en_custom_lambda) |
+		   SET_PARAM_RDO_QROUND_OFFSET(p_param->en_qround_offset) |
+		   SET_PARAM_RDO_ADAPTIVE_ROUND_ON |
+		   SET_PARAM_RDO_HVS_QP(p_param->en_hvs_qp);
+	reg->slice = SET_PARAM_SLICE_ARGUMENT(p_param->slice_arg) |
+		     SET_PARAM_SLICE_MODE(p_param->slice_mode);
+	reg->quant2 = SET_PARAM_QUANT2_LAMBDA_DQP_INTER(p_param->lambda_dqp_inter) |
+		      SET_PARAM_QUANT2_LAMBDA_DQP_INTRA(p_param->lambda_dqp_intra);
+	reg->non_vcl_param = SET_PARAM_NON_VCL_PARAM_ENCODE_VUI;
+}
+
+static void wave6_gen_change_param_reg_common(struct vpu_instance *inst,
+					      struct enc_info *p_enc_info,
+					      struct enc_cmd_change_param_reg *reg)
+{
+	if (p_enc_info->open_param.codec_param.bitrate != inst->enc_ctrls.bitrate) {
+		reg->enable |= SET_PARAM_ENABLE_RC_TARGET_RATE;
+		reg->rc_target_rate = inst->enc_ctrls.bitrate;
+		p_enc_info->open_param.codec_param.bitrate = inst->enc_ctrls.bitrate;
+	}
+}
+
+int wave6_vpu_enc_issue_seq_init(struct vpu_instance *inst)
+{
+	struct enc_cmd_set_param_reg reg = {};
+	struct enc_info *p_enc_info;
+	int ret;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	p_enc_info = &inst->codec_info->enc_info;
+
+	wave6_update_enc_info(p_enc_info);
+
+	wave6_gen_set_param_reg_common(p_enc_info, inst->std, &reg);
+	if (inst->std == W_HEVC_ENC)
+		wave6_gen_set_param_reg_hevc(p_enc_info, &reg);
+	else if (inst->std == W_AVC_ENC)
+		wave6_gen_set_param_reg_avc(p_enc_info, &reg);
+
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_OPTION, W6_SET_PARAM_OPT_COMMON);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_ENABLE, reg.enable);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_SRC_SIZE, reg.src_size);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_CUSTOM_MAP_ENDIAN,
+			      reg.custom_map_endian);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_SPS, reg.sps);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_PPS, reg.pps);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_GOP, reg.gop);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_INTRA, reg.intra);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_CONF_WIN0, reg.conf_win0);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_CONF_WIN1, reg.conf_win1);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_RDO, reg.rdo);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_SLICE, reg.slice);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_INTRA_REFRESH, reg.intra_refresh);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_INTRA_QP, reg.intra_qp);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_RC_FRAME_RATE, reg.rc_frame_rate);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_RC_TARGET_RATE, reg.rc_target_rate);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_RC, reg.rc);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_HVS, reg.hvs);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_RC_MAX_BITRATE, reg.rc_max_bitrate);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_RC_VBV_BUFFER_SIZE,
+			      reg.rc_vbv_buffer_size);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_INTER_QP, reg.inter_qp);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_ROT, reg.rot);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_NUM_UNITS_IN_TICK,
+			      reg.num_units_in_tick);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_TIME_SCALE, reg.time_scale);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_NUM_TICKS_POC_DIFF_ONE,
+			      reg.num_ticks_poc_diff_one);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_MAX_INTRA_PIC_BIT,
+			      reg.max_intra_pic_bit);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_MAX_INTER_PIC_BIT,
+			      reg.max_inter_pic_bit);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_BG, reg.bg);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_NON_VCL_PARAM, reg.non_vcl_param);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_VUI_RBSP_ADDR, reg.vui_rbsp_addr);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_HRD_RBSP_ADDR, reg.hrd_rbsp_addr);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_QROUND_OFFSET, reg.qround_offset);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_QUANT1, reg.quant1);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_QUANT2, reg.quant2);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_CUSTOM_GOP, reg.custom_gop);
+	for (int i = 0; i < MAX_CUSTOM_GOP_NUM; i++)
+		vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_CUSTOM_GOP_PIC(i),
+				      reg.custom_gop_pic[i]);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_TILE_PARAM, reg.tile_param);
+	for (int i = 0; i < MAX_CUSTOM_LAMBDA_NUM; i++)
+		vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA(i),
+				      reg.custom_lambda[i]);
+	for (int i = 0; i < MAX_NUM_CHANGEABLE_TEMP_LAYER; i++)
+		vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_TEMP_LAYER_QP(i),
+				      reg.temp_layer_qp[i]);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_SCALER_SIZE, reg.scaler_size);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_SCALER, reg.scaler);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_COLOR, reg.color);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_SAR, reg.sar);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_SAR_EXTENDED, reg.sar_extended);
+
+	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_ENC_SET_PARAM);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret) {
+		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
+		return ret;
+	}
+
+	if (!vpu_read_reg_relaxed(inst->dev, W6_RET_SUCCESS)) {
+		u32 reason_code = vpu_read_reg_relaxed(inst->dev, W6_RET_FAIL_REASON);
+
+		wave6_print_reg_err(inst->dev, reason_code);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int wave6_vpu_enc_get_seq_info(struct vpu_instance *inst, struct enc_seq_info *info)
+{
+	int ret;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	ret = wave6_send_query(inst->dev, inst->id, inst->std, W6_QUERY_OPT_GET_RESULT);
+	if (ret)
+		return ret;
+
+	if (vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_ENCODING_SUCCESS) != 1) {
+		info->err_reason = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_ERR_INFO);
+		ret = -EIO;
+	} else {
+		info->warn_info = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_WARN_INFO);
+	}
+
+	info->min_frame_buffer_count = vpu_read_reg_relaxed(inst->dev,
+							    W6_RET_ENC_NUM_REQUIRED_FBC_FB);
+	info->min_src_frame_count = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_MIN_SRC_BUF_NUM);
+	info->max_latency_pictures = vpu_read_reg_relaxed(inst->dev,
+							  W6_RET_ENC_PIC_MAX_LATENCY_PICTURES);
+	info->req_mv_buffer_count = vpu_read_reg_relaxed(inst->dev,
+							 W6_RET_ENC_NUM_REQUIRED_COL_BUF);
+
+	return ret;
+}
+
+int wave6_vpu_enc_issue_seq_change(struct vpu_instance *inst, bool *changed)
+{
+	struct enc_cmd_change_param_reg reg = {};
+	struct enc_info *p_enc_info;
+	int ret;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	p_enc_info = &inst->codec_info->enc_info;
+
+	wave6_gen_change_param_reg_common(inst, p_enc_info, &reg);
+
+	if (!reg.enable)
+		return 0;
+
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_OPTION,
+			      W6_SET_PARAM_OPT_CHANGE_PARAM);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_ENABLE, reg.enable);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_SET_PARAM_RC_TARGET_RATE, reg.rc_target_rate);
+
+	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_ENC_SET_PARAM);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret) {
+		dev_warn(inst->dev->dev, "enc set param timed out\n");
+		return ret;
+	}
+
+	if (!vpu_read_reg_relaxed(inst->dev, W6_RET_SUCCESS)) {
+		u32 reason_code = vpu_read_reg_relaxed(inst->dev, W6_RET_FAIL_REASON);
+
+		wave6_print_reg_err(inst->dev, reason_code);
+		return -EIO;
+	}
+
+	*changed = true;
+
+	return 0;
+}
+
+int wave6_vpu_enc_register_frame_buffer(struct vpu_instance *inst)
+{
+	struct enc_info *p_enc_info;
+	struct frame_buffer *fb_arr;
+	dma_addr_t fbc_cr_tbl_addr;
+	u32 fbc_count, mv_count;
+	int ret;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	p_enc_info = &inst->codec_info->enc_info;
+
+	fb_arr = &inst->frame_buf[0];
+	fbc_count = p_enc_info->seq_info.min_frame_buffer_count;
+	mv_count = p_enc_info->seq_info.req_mv_buffer_count;
+	if (!fbc_count || fbc_count > MAX_SET_FB_GROUP_SIZE ||
+	    !mv_count || mv_count > MAX_SET_FB_GROUP_SIZE)
+		return -EINVAL;
+
+	if (!wave6_check_aux_vbuf(inst, AUX_BUF_FBC_Y_TBL, fbc_count) ||
+	    !wave6_check_aux_vbuf(inst, AUX_BUF_FBC_C_TBL, fbc_count) ||
+	    !wave6_check_aux_vbuf(inst, AUX_BUF_SUB_SAMPLE, fbc_count) ||
+	    !wave6_check_aux_vbuf(inst, AUX_BUF_MV_COL, mv_count))
+		return -EINVAL;
+
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_OPTION,
+			      SET_FB_OPTION_END | SET_FB_OPTION_START);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_PIC_INFO,
+			      SET_FB_PIC_INFO_STRIDE(fb_arr[0].stride));
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_PIC_SIZE,
+			      SET_FB_PIC_SIZE_WIDTH(fb_arr[0].stride) |
+			      SET_FB_PIC_SIZE_HEIGHT(fb_arr[0].height));
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_NUM,
+			      SET_FB_NUM_FBC_END_IDX(fbc_count - 1) |
+			      SET_FB_NUM_MV_COL_END_IDX(mv_count - 1));
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_FBC_STRIDE,
+			      SET_FB_FBC_STRIDE_L(fb_arr[0].stride) |
+			      SET_FB_FBC_STRIDE_C(fb_arr[0].stride_c));
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_DEFAULT_CDF, 0);
+
+	for (u32 idx = 0; idx < fbc_count; idx++) {
+		vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_FBC_Y(idx), fb_arr[idx].buf_y);
+		vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_FBC_C(idx), fb_arr[idx].buf_cb);
+		vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_FBC_CR(idx), fb_arr[idx].buf_cr);
+		vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_FBC_Y_OFFSET(idx),
+				      inst->aux_vbuf[AUX_BUF_FBC_Y_TBL][idx].daddr);
+		vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_FBC_C_OFFSET(idx),
+				      inst->aux_vbuf[AUX_BUF_FBC_C_TBL][idx].daddr);
+		fbc_cr_tbl_addr = inst->aux_vbuf[AUX_BUF_FBC_C_TBL][idx].daddr +
+				  (inst->aux_vbuf[AUX_BUF_FBC_C_TBL][idx].size >> 1);
+		vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_FBC_CR_OFFSET(idx),
+				      fbc_cr_tbl_addr);
+		vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_SUB_SAMPLED(idx),
+				      inst->aux_vbuf[AUX_BUF_SUB_SAMPLE][idx].daddr);
+	}
+	for (u32 idx = 0; idx < mv_count; idx++)
+		vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_MV_COL(idx),
+				      inst->aux_vbuf[AUX_BUF_MV_COL][idx].daddr);
+
+	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_SET_FB);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret) {
+		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
+		return ret;
+	}
+
+	if (!vpu_read_reg_relaxed(inst->dev, W6_RET_SUCCESS))
+		return -EIO;
+
+	return 0;
+}
+
+struct enc_cmd_enc_pic_reg {
+	u32 bs_start;
+	u32 bs_size;
+	u32 bs_option;
+	u32 sec_axi;
+	u32 report;
+	u32 mv_histo0;
+	u32 mv_histo1;
+	u32 custom_map_param;
+	u32 custom_map_addr;
+	u32 src_pic_idx;
+	u32 src_addr_y;
+	u32 src_addr_u;
+	u32 src_addr_v;
+	u32 src_stride;
+	u32 src_fmt;
+	u32 src_axi_sel;
+	u32 code_option;
+	u32 param;
+	u32 longterm_pic;
+	u32 prefix_sei_nal_addr;
+	u32 prefix_sei_info;
+	u32 suffix_sei_nal_addr;
+	u32 suffix_sei_info;
+	u32 timestamp_low;
+	u32 timestamp_high;
+	u32 csc_coeff[MAX_CSC_COEFF_NUM];
+};
+
+static u32 wave6_enc_src_fmt(enum frame_buffer_format fmt)
+{
+	bool is_csc_format = false;
+	bool is_packed = false;
+	bool is_24bit = false;
+	bool is_10bit = false;
+	bool is_ayuv = false;
+
+	switch (fmt) {
+	case FORMAT_YUYV:
+		is_packed = true;
+		break;
+	case FORMAT_420_P10_16BIT_MSB:
+		is_10bit = true;
+		break;
+	case FORMAT_RGB_24BIT_PACKED:
+		is_24bit = true;
+		is_csc_format = true;
+		break;
+	case FORMAT_RGB_32BIT_PACKED:
+		is_csc_format = true;
+		break;
+	case FORMAT_RGB_P10_32BIT_PACKED:
+		is_csc_format = true;
+		is_10bit = true;
+		break;
+	case FORMAT_YUV444_24BIT_PACKED:
+		is_24bit = true;
+		is_ayuv = true;
+		is_csc_format = true;
+		break;
+	case FORMAT_YUV444_24BIT:
+		is_ayuv = true;
+		break;
+	default:
+		break;
+	}
+
+	return ENC_PIC_SRC_FMT_C_FMT_IDC(get_chroma_format_idc(fmt)) |
+	       ENC_PIC_SRC_FMT_CSC_24BIT(is_24bit) |
+	       ENC_PIC_SRC_FMT_CSC_AYUV(is_ayuv) |
+	       ENC_PIC_SRC_FMT_CSC_ENABLE(is_csc_format) |
+	       ENC_PIC_SRC_FMT_10BIT_ENABLE(is_10bit) |
+	       ENC_PIC_SRC_FMT_YUV422_PACKED(is_packed);
+}
+
+static void wave6_gen_enc_pic_reg(struct enc_info *p_enc_info, bool cbcr_interleave, bool nv21,
+				  struct enc_param *opt, struct enc_cmd_enc_pic_reg *reg)
+{
+	struct enc_open_param open = p_enc_info->open_param;
+	struct enc_codec_param param = open.codec_param;
+	u32 stride_c = opt->source_frame->stride_c;
+	u32 c_fmt_idc;
+
+	c_fmt_idc = get_chroma_format_idc(open.src_fmt);
+	if ((c_fmt_idc == C_FMT_IDC_YUV422 || c_fmt_idc == C_FMT_IDC_YUV444) &&
+	    p_enc_info->c_fmt_idc == C_FMT_IDC_YUV420)
+		stride_c *= 2;
+
+	reg->src_fmt = wave6_enc_src_fmt(open.src_fmt) |
+		       ENC_PIC_SRC_FMT_CSC_FMT_ORDER(opt->csc.fmt_order) |
+		       ENC_PIC_SRC_FMT_ENDIAN(open.source_endian) |
+		       ENC_PIC_SRC_FMT_CBCR_ORDER(nv21) |
+		       ENC_PIC_SRC_FMT_2PLANE(cbcr_interleave);
+	reg->bs_start = opt->pic_stream_buffer_addr;
+	reg->bs_size = opt->pic_stream_buffer_size;
+	reg->sec_axi = ENC_PIC_SEC_AXI_RDO_ENABLE(p_enc_info->sec_axi.use_enc_rdo) |
+		       ENC_PIC_SEC_AXI_LF_ENABLE(p_enc_info->sec_axi.use_enc_lf);
+	reg->report = ENC_PIC_REPORT_MV_HISTO_ENABLE(param.en_report_mv_histo);
+	reg->mv_histo0 = ENC_PIC_MV_HISTO0_THRESHOLD0(param.mv_histo_th0) |
+			 ENC_PIC_MV_HISTO0_THRESHOLD1(param.mv_histo_th1);
+	reg->mv_histo1 = ENC_PIC_MV_HISTO1_THRESHOLD2(param.mv_histo_th2) |
+			 ENC_PIC_MV_HISTO1_THRESHOLD3(param.mv_histo_th3);
+	reg->src_pic_idx = opt->src_idx;
+	reg->src_addr_y = opt->source_frame->buf_y;
+	reg->src_addr_u = opt->source_frame->buf_cb;
+	reg->src_addr_v = opt->source_frame->buf_cr;
+	reg->src_stride = ENC_PIC_SRC_STRIDE_L(opt->source_frame->stride) |
+			  ENC_PIC_SRC_STRIDE_C(stride_c);
+	reg->src_axi_sel = ENC_PIC_SRC_AXI_SEL_PRP_PORT;
+	reg->code_option = ENC_PIC_CODE_OPTION_ENCODE_VCL |
+			   ENC_PIC_CODE_OPTION_ENCODE_HEADER;
+	reg->param = ENC_PIC_PARAM_INTRA_4X4(param.intra_4x4) |
+		     ENC_PIC_PARAM_FORCE_PIC_TYPE(opt->force_pic_type) |
+		     ENC_PIC_PARAM_FORCE_PIC_TYPE_ENABLE(opt->force_pic) |
+		     ENC_PIC_PARAM_FORCE_PIC_QP_B(opt->force_pic_qp_b) |
+		     ENC_PIC_PARAM_FORCE_PIC_QP_P(opt->force_pic_qp_p) |
+		     ENC_PIC_PARAM_FORCE_PIC_QP_I(opt->force_pic_qp_i) |
+		     ENC_PIC_PARAM_FORCE_PIC_QP_ENABLE(opt->force_pic_qp) |
+		     ENC_PIC_PARAM_PIC_SKIP_FLAG(opt->skip_picture);
+	reg->timestamp_low = lower_32_bits(opt->timestamp);
+	reg->timestamp_high = upper_32_bits(opt->timestamp);
+	reg->csc_coeff[0] = ENC_PIC_CSC_COEFF0_RY(opt->csc.coef_ry) |
+			    ENC_PIC_CSC_COEFF0_GY(opt->csc.coef_gy) |
+			    ENC_PIC_CSC_COEFF0_BY(opt->csc.coef_by);
+	reg->csc_coeff[1] = ENC_PIC_CSC_COEFF1_RCB(opt->csc.coef_rcb) |
+			    ENC_PIC_CSC_COEFF1_GCB(opt->csc.coef_gcb) |
+			    ENC_PIC_CSC_COEFF1_BCB(opt->csc.coef_bcb);
+	reg->csc_coeff[2] = ENC_PIC_CSC_COEFF2_RCR(opt->csc.coef_rcr) |
+			    ENC_PIC_CSC_COEFF2_GCR(opt->csc.coef_gcr) |
+			    ENC_PIC_CSC_COEFF2_BCR(opt->csc.coef_bcr);
+	reg->csc_coeff[3] = ENC_PIC_CSC_COEFF3_OFFSET_Y(opt->csc.offset_y) |
+			    ENC_PIC_CSC_COEFF3_OFFSET_CB(opt->csc.offset_cb) |
+			    ENC_PIC_CSC_COEFF3_OFFSET_CR(opt->csc.offset_cr);
+}
+
+int wave6_vpu_enc_start_one_frame(struct vpu_instance *inst, struct enc_param *param,
+				  u32 *fail_res)
+{
+	struct enc_cmd_enc_pic_reg reg = {};
+	struct enc_info *p_enc_info;
+	int ret;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	p_enc_info = &inst->codec_info->enc_info;
+
+	wave6_gen_enc_pic_reg(p_enc_info, inst->cbcr_interleave,
+			      inst->nv21, param, &reg);
+
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_BS_START, reg.bs_start);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_BS_SIZE, reg.bs_size);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_BS_OPTION, reg.bs_option);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_SEC_AXI, reg.sec_axi);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_REPORT, reg.report);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_MV_HISTO0, reg.mv_histo0);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_MV_HISTO1, reg.mv_histo1);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_CUSTOM_MAP_PARAM, reg.custom_map_param);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_CUSTOM_MAP_ADDR, reg.custom_map_addr);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_SRC_PIC_IDX, reg.src_pic_idx);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_SRC_ADDR_Y, reg.src_addr_y);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_SRC_ADDR_U, reg.src_addr_u);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_SRC_ADDR_V, reg.src_addr_v);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_SRC_STRIDE, reg.src_stride);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_SRC_FMT, reg.src_fmt);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_SRC_AXI_SEL, reg.src_axi_sel);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_CODE_OPTION, reg.code_option);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_PARAM, reg.param);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_LONGTERM_PIC, reg.longterm_pic);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_PREFIX_SEI_NAL_ADDR,
+			      reg.prefix_sei_nal_addr);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_PREFIX_SEI_INFO, reg.prefix_sei_info);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_SUFFIX_SEI_NAL_ADDR,
+			      reg.suffix_sei_nal_addr);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_SUFFIX_SEI_INFO, reg.suffix_sei_info);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_TIMESTAMP_LOW, reg.timestamp_low);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_TIMESTAMP_HIGH, reg.timestamp_high);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF0, reg.csc_coeff[0]);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF1, reg.csc_coeff[1]);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF2, reg.csc_coeff[2]);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF3, reg.csc_coeff[3]);
+
+	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_ENC_PIC);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret) {
+		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
+		return -ETIMEDOUT;
+	}
+
+	if (!vpu_read_reg_relaxed(inst->dev, W6_RET_SUCCESS)) {
+		*fail_res = vpu_read_reg_relaxed(inst->dev, W6_RET_FAIL_REASON);
+		wave6_print_reg_err(inst->dev, *fail_res);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int wave6_vpu_enc_get_output_info(struct vpu_instance *inst, struct enc_output_info *info)
+{
+	u32 reg_val;
+	int ret;
+
+	if (WARN_ON(!info))
+		return -EINVAL;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	ret = wave6_send_query(inst->dev, inst->id, inst->std, W6_QUERY_OPT_GET_RESULT);
+	if (ret)
+		return ret;
+
+	info->encoding_success = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_ENCODING_SUCCESS);
+	if (!info->encoding_success)
+		info->error_reason = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_ERR_INFO);
+	else
+		info->warn_info = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_WARN_INFO);
+
+	info->enc_pic_cnt = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_PIC_NUM);
+	info->pic_type = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_PIC_TYPE);
+	info->enc_vcl_nut = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_VCL_NUT);
+	info->non_ref_pic = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_PIC_NON_REF_PIC_FLAG);
+	info->num_of_slices = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_PIC_SLICE_NUM);
+	info->pic_skipped = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_PIC_SKIP);
+	info->num_of_intra = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_PIC_NUM_INTRA);
+	info->num_of_merge = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_PIC_NUM_MERGE);
+	info->num_of_skip_block = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_PIC_NUM_SKIP);
+	info->avg_ctu_qp = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_PIC_AVG_CTU_QP);
+	info->enc_pic_byte = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_PIC_BYTE);
+	info->enc_gop_pic_idx = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_GOP_PIC_IDX);
+	info->enc_pic_poc = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_PIC_POC);
+	info->enc_src_idx = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_USED_SRC_IDX);
+	info->wr_ptr = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_WR_PTR);
+	info->rd_ptr = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_RD_PTR);
+	info->bitstream_buffer = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_RD_PTR);
+	info->pic_distortion_low = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_PIC_DIST_LOW);
+	info->pic_distortion_high = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_PIC_DIST_HIGH);
+	info->mv_histo.cnt0 = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_HISTO_CNT0);
+	info->mv_histo.cnt1 = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_HISTO_CNT1);
+	info->mv_histo.cnt2 = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_HISTO_CNT2);
+	info->mv_histo.cnt3 = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_HISTO_CNT3);
+	info->mv_histo.cnt4 = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_HISTO_CNT4);
+	info->fme_sum.lower_x0 = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_SUM_ME0_X_DIR_LOWER);
+	info->fme_sum.higher_x0 = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_SUM_ME0_X_DIR_HIGHER);
+	info->fme_sum.lower_y0 = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_SUM_ME0_Y_DIR_LOWER);
+	info->fme_sum.higher_y0 = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_SUM_ME0_Y_DIR_HIGHER);
+	info->fme_sum.lower_x1 = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_SUM_ME1_X_DIR_LOWER);
+	info->fme_sum.higher_x1 = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_SUM_ME1_X_DIR_HIGHER);
+	info->fme_sum.lower_y1 = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_SUM_ME1_Y_DIR_LOWER);
+	info->fme_sum.higher_y1 = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_SUM_ME1_Y_DIR_HIGHER);
+	info->src_y_addr = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_SRC_Y_ADDR);
+	info->custom_map_addr = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_CUSTOM_MAP_ADDR);
+	info->prefix_sei_nal_addr = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_PREFIX_SEI_NAL_ADDR);
+	info->suffix_sei_nal_addr = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_SUFFIX_SEI_NAL_ADDR);
+
+	info->recon_frame_index = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_PIC_IDX);
+	if (info->recon_frame_index == RECON_IDX_FLAG_HEADER_ONLY)
+		info->bitstream_size = info->enc_pic_byte;
+	else if (info->recon_frame_index < 0)
+		info->bitstream_size = 0;
+	else
+		info->bitstream_size = info->enc_pic_byte;
+
+	reg_val = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_TIMESTAMP_LOW);
+	info->timestamp = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_TIMESTAMP_HIGH);
+	info->timestamp = (info->timestamp << 32) | reg_val;
+
+	return 0;
+}
+
+int wave6_vpu_enc_fini_seq(struct vpu_instance *inst, u32 *fail_res)
+{
+	int ret;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_DESTROY_INSTANCE);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret)
+		return -ETIMEDOUT;
+
+	if (!vpu_read_reg_relaxed(inst->dev, W6_RET_SUCCESS)) {
+		*fail_res = vpu_read_reg_relaxed(inst->dev, W6_RET_FAIL_REASON);
+		wave6_print_reg_err(inst->dev, *fail_res);
+		return -EIO;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.h b/drivers/media/platform/chips-media/wave6/wave6-hw.h
index b163c6bb6724..7adb0a07390e 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-hw.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-hw.h
@@ -32,6 +32,8 @@ enum product_id {
 #define WTL_PIXEL_16BIT			1
 #define WTL_PIXEL_32BIT			2
 
+#define MAX_CSC_COEFF_NUM		4
+
 #define H265_NAL_UNIT_TYPE_IDR_W_RADL	19
 #define H265_NAL_UNIT_TYPE_IDR_N_LP	20
 
@@ -46,4 +48,9 @@ int wave6_vpu_dec_get_seq_info(struct vpu_instance *inst, struct dec_seq_info *i
 int wave6_vpu_dec_fini_seq(struct vpu_instance *inst, u32 *fail_res);
 dma_addr_t wave6_vpu_dec_get_rd_ptr(struct vpu_instance *inst);
 
+int wave6_vpu_build_up_enc_param(struct device *dev, struct vpu_instance *inst,
+				 struct enc_open_param *param);
+int wave6_vpu_enc_get_seq_info(struct vpu_instance *inst, struct enc_seq_info *info);
+int wave6_vpu_enc_fini_seq(struct vpu_instance *inst, u32 *fail_res);
+
 #endif /* __WAVE6_HW_H__ */
diff --git a/drivers/media/platform/chips-media/wave6/wave6-regdefine.h b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
index 0651f5c1e652..1038b87b2ff9 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
@@ -20,6 +20,8 @@ enum wave6_command {
 	W6_CMD_INIT_SEQ		= 0x0040,
 	W6_CMD_SET_FB		= 0x0080,
 	W6_CMD_DEC_PIC		= 0x0100,
+	W6_CMD_ENC_PIC		= 0x0100,
+	W6_CMD_ENC_SET_PARAM	= 0x0200,
 	W6_CMD_DEC_SET_DISP	= 0x0400,
 	W6_CMD_INIT_WORK_BUF	= 0x1000,
 	W6_CMD_QUERY		= 0x4000,
@@ -30,6 +32,11 @@ enum wave6_init_seq_option {
 	W6_INIT_SEQ_OPT_W_THUMBNAIL	= 17,
 };
 
+enum wave6_set_param_option {
+	W6_SET_PARAM_OPT_COMMON		= 0,
+	W6_SET_PARAM_OPT_CHANGE_PARAM	= 1,
+};
+
 enum wave6_dec_pic_option {
 	W6_DEC_PIC_OPT_NORMAL		= 0,
 	W6_DEC_PIC_OPT_W_THUMBNAIL	= 16,
@@ -53,6 +60,8 @@ enum wave6_interrupt_bit {
 	W6_INT_BIT_INIT_SEQ		= 6,
 	W6_INT_BIT_SET_FB		= 7,
 	W6_INT_BIT_DEC_PIC		= 8,
+	W6_INT_BIT_ENC_PIC		= 8,
+	W6_INT_BIT_ENC_SET_PARAM	= 9,
 	W6_INT_BIT_SET_DISP		= 10,
 	W6_INT_BIT_REQ_WORK_BUF		= 12,
 	W6_INT_BIT_BSBUF_ERROR		= 15,
@@ -125,6 +134,7 @@ enum wave6_interrupt_bit {
 
 /* COMMON - CREATE_INSTANCE */
 #define W6_CMD_CREATE_INST_BS_PARAM			(W6_REG_BASE + 0x310)
+#define W6_CMD_CREATE_INST_SRC_OPT			(W6_REG_BASE + 0x314)
 #define W6_CMD_CREATE_INST_ADDR_EXT			(W6_REG_BASE + 0x318)
 #define W6_CMD_CREATE_INST_DISP_MODE			(W6_REG_BASE + 0x31C)
 #define W6_CMD_CREATE_INST_CORE_INFO			(W6_REG_BASE + 0x330)
@@ -136,6 +146,7 @@ enum wave6_interrupt_bit {
 #define		CREATE_INST_PRIORITY_VALUE(x)		FIELD_PREP(GENMASK(4, 0), (x))
 #define W6_CMD_CREATE_INST_TEMP_BASE			(W6_REG_BASE + 0x348)
 #define W6_CMD_CREATE_INST_TEMP_SIZE			(W6_REG_BASE + 0x34C)
+#define W6_CMD_CREATE_INST_AR_TABLE_BASE		(W6_REG_BASE + 0x358)
 #define W6_CMD_CREATE_INST_TIMEOUT_CYCLE_COUNT		(W6_REG_BASE + 0x3A8)
 
 /* COMMON - SET_FB */
@@ -147,6 +158,7 @@ enum wave6_interrupt_bit {
 #define		SET_FB_PIC_INFO_C_FMT_IDC(x)		FIELD_PREP(GENMASK(26, 25), (x))
 #define		SET_FB_PIC_INFO_L_BIT_DEPTH(x)		FIELD_PREP(GENMASK(24, 21), (x))
 #define		SET_FB_PIC_INFO_C_BIT_DEPTH(x)		FIELD_PREP(GENMASK(20, 17), (x))
+#define		SET_FB_PIC_INFO_STRIDE(x)		FIELD_PREP(GENMASK(15, 0), (x))
 #define W6_CMD_SET_FB_PIC_SIZE				(W6_REG_BASE + 0x304)
 #define		SET_FB_PIC_SIZE_WIDTH(x)		FIELD_PREP(GENMASK(31, 16), (x))
 #define		SET_FB_PIC_SIZE_HEIGHT(x)		FIELD_PREP(GENMASK(15, 0), (x))
@@ -155,6 +167,9 @@ enum wave6_interrupt_bit {
 #define		SET_FB_NUM_FBC_END_IDX(x)		FIELD_PREP(GENMASK(20, 16), (x))
 #define		SET_FB_NUM_MV_COL_START_IDX(x)		FIELD_PREP(GENMASK(9, 5), (x))
 #define		SET_FB_NUM_MV_COL_END_IDX(x)		FIELD_PREP(GENMASK(4, 0), (x))
+#define W6_CMD_SET_FB_FBC_STRIDE			(W6_REG_BASE + 0x30C)
+#define		SET_FB_FBC_STRIDE_L(x)			FIELD_PREP(GENMASK(31, 16), (x))
+#define		SET_FB_FBC_STRIDE_C(x)			FIELD_PREP(GENMASK(15, 0), (x))
 
 /* W6_CMD_SET_FB_FBC_Y(x)
  * Address range: 0x310, 0x328, ..., 0x478 (step = 0x18)
@@ -181,6 +196,10 @@ enum wave6_interrupt_bit {
  */
 #define W6_CMD_SET_FB_MV_COL(x)				(W6_REG_BASE + 0x320 + ((x) * 0x18))
 
+/* W6_CMD_SET_FB_SUB_SAMPLED(x)
+ * Address range: 0x324, 0x33C, ..., 0x48C (step = 0x18)
+ */
+#define W6_CMD_SET_FB_SUB_SAMPLED(x)			(W6_REG_BASE + 0x324 + ((x) * 0x18))
 #define W6_CMD_SET_FB_DEFAULT_CDF			(W6_REG_BASE + 0x494)
 #define W6_CMD_SET_FB_SEGMAP				(W6_REG_BASE + 0x498)
 #define W6_CMD_SET_FB_MV_COL_PRE_ENT			(W6_REG_BASE + 0x4DC)
@@ -330,4 +349,297 @@ enum wave6_interrupt_bit {
 #define W6_RET_DEC_FLUSH_CMD_BUF_STATE_USED_IDC		(W6_REG_BASE + 0x580)
 #define W6_RET_DEC_FLUSH_CMD_BUF_STATE_USING_IDC	(W6_REG_BASE + 0x584)
 
+/* ENCODER - SET_PARAM */
+#define W6_CMD_ENC_SET_PARAM_OPTION			(W6_REG_BASE + 0x204)
+#define W6_CMD_ENC_SET_PARAM_ENABLE			(W6_REG_BASE + 0x300)
+#define		SET_PARAM_ENABLE_RC_TARGET_RATE		BIT(10)
+#define W6_CMD_ENC_SET_PARAM_SRC_SIZE			(W6_REG_BASE + 0x304)
+#define		SET_PARAM_SRC_SIZE_HEIGHT(x)		FIELD_PREP(GENMASK(31, 16), (x))
+#define		SET_PARAM_SRC_SIZE_WIDTH(x)		FIELD_PREP(GENMASK(15, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_MAP_ENDIAN		(W6_REG_BASE + 0x308)
+#define W6_CMD_ENC_SET_PARAM_SPS			(W6_REG_BASE + 0x30C)
+#define		SET_PARAM_SPS_DEFAULT_SCALING_LIST(x)	FIELD_PREP(GENMASK(31, 31), (x))
+#define		SET_PARAM_SPS_STILL_PICTURE(x)		FIELD_PREP(GENMASK(30, 30), (x))
+#define		SET_PARAM_SPS_AUTO_LEVEL_ADJUSTING_ON	BIT(28)
+#define		SET_PARAM_SPS_STRONG_INTRA_SMOOTHING(x)	FIELD_PREP(GENMASK(27, 27), (x))
+#define		SET_PARAM_SPS_INTRA_TRANSFORM_SKIP_ON	BIT(25)
+#define		SET_PARAM_SPS_SAMPLE_ADAPTIVE_OFFSET(x)	FIELD_PREP(GENMASK(24, 24), (x))
+#define		SET_PARAM_SPS_TEMPORAL_MVP(x)		FIELD_PREP(GENMASK(23, 23), (x))
+#define		SET_PARAM_SPS_LONGTERM_REFERENCE(x)	FIELD_PREP(GENMASK(21, 21), (x))
+#define		SET_PARAM_SPS_C_FMT_IDC(x)		FIELD_PREP(GENMASK(20, 19), (x))
+#define		SET_PARAM_SPS_BIT_DEPTH(x)		FIELD_PREP(GENMASK(18, 14), (x))
+#define		SET_PARAM_SPS_TIER(x)			FIELD_PREP(GENMASK(13, 12), (x))
+#define		SET_PARAM_SPS_LEVEL(x)			FIELD_PREP(GENMASK(11, 3), (x))
+#define		SET_PARAM_SPS_PROFILE(x)		FIELD_PREP(GENMASK(2, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_PPS			(W6_REG_BASE + 0x310)
+#define		SET_PARAM_PPS_ENTROPY_CODING_MODE(x)	FIELD_PREP(GENMASK(30, 30), (x))
+#define		SET_PARAM_PPS_TRANSFORM8X8(x)		FIELD_PREP(GENMASK(29, 29), (x))
+#define		SET_PARAM_PPS_CR_QP_OFFSET(x)		FIELD_PREP(GENMASK(23, 19), (x))
+#define		SET_PARAM_PPS_CB_QP_OFFSET(x)		FIELD_PREP(GENMASK(18, 14), (x))
+#define		SET_PARAM_PPS_TC_OFFSET_DIV2(x)		FIELD_PREP(GENMASK(13, 10), (x))
+#define		SET_PARAM_PPS_BETA_OFFSET_DIV2(x)	FIELD_PREP(GENMASK(9, 6), (x))
+#define		SET_PARAM_PPS_DEBLOCKING_FILTER(x)	FIELD_PREP(GENMASK(5, 5), (x))
+#define		SET_PARAM_PPS_LF_SLICE_BOUNDARY(x)	FIELD_PREP(GENMASK(2, 2), (x))
+#define		SET_PARAM_PPS_CONST_INTRA_PREDICTION(x)	FIELD_PREP(GENMASK(1, 1), (x))
+#define W6_CMD_ENC_SET_PARAM_GOP			(W6_REG_BASE + 0x314)
+#define		SET_PARAM_GOP_TEMP_LAYER_CNT(x)		FIELD_PREP(GENMASK(19, 16), (x))
+#define		SET_PARAM_GOP_TEMP_LAYER3_QP_ENABLE(x)	FIELD_PREP(GENMASK(11, 11), (x))
+#define		SET_PARAM_GOP_TEMP_LAYER2_QP_ENABLE(x)	FIELD_PREP(GENMASK(10, 10), (x))
+#define		SET_PARAM_GOP_TEMP_LAYER1_QP_ENABLE(x)	FIELD_PREP(GENMASK(9, 9), (x))
+#define		SET_PARAM_GOP_TEMP_LAYER0_QP_ENABLE(x)	FIELD_PREP(GENMASK(8, 8), (x))
+#define		SET_PARAM_GOP_PRESET_IDX(x)		FIELD_PREP(GENMASK(7, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_INTRA			(W6_REG_BASE + 0x318)
+#define		SET_PARAM_INTRA_PERIOD(x)		FIELD_PREP(GENMASK(31, 16), (x))
+#define		SET_PARAM_INTRA_HEADER_MODE(x)		FIELD_PREP(GENMASK(10, 9), (x))
+#define		SET_PARAM_INTRA_QP(x)			FIELD_PREP(GENMASK(8, 3), (x))
+#define		SET_PARAM_INTRA_REFRESH_TYPE(x)		FIELD_PREP(GENMASK(2, 0), (x))
+
+/* W6_CMD_ENC_SET_PARAM_INTRA for AVC specific fields */
+#define		SET_PARAM_INTRA_HEADER_MODE_AVC(x)	FIELD_PREP(GENMASK(29, 28), (x))
+#define		SET_PARAM_INTRA_IDR_PERIOD_AVC(x)	FIELD_PREP(GENMASK(27, 17), (x))
+#define		SET_PARAM_INTRA_PERIOD_AVC(x)		FIELD_PREP(GENMASK(16, 6), (x))
+#define		SET_PARAM_INTRA_QP_AVC(x)		FIELD_PREP(GENMASK(5, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_CONF_WIN0			(W6_REG_BASE + 0x31C)
+#define		SET_PARAM_CONF_WIN0_BOTTOM(x)		FIELD_PREP(GENMASK(31, 16), (x))
+#define		SET_PARAM_CONF_WIN0_TOP(x)		FIELD_PREP(GENMASK(15, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_CONF_WIN1			(W6_REG_BASE + 0x320)
+#define		SET_PARAM_CONF_WIN1_RIGHT(x)		FIELD_PREP(GENMASK(31, 16), (x))
+#define		SET_PARAM_CONF_WIN1_LEFT(x)		FIELD_PREP(GENMASK(15, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_RDO			(W6_REG_BASE + 0x324)
+#define		SET_PARAM_RDO_CUSTOM_LAMBDA(x)		FIELD_PREP(GENMASK(22, 22), (x))
+#define		SET_PARAM_RDO_ME_SEARCH_CENTER_ON	BIT(21)
+#define		SET_PARAM_RDO_QROUND_OFFSET(x)		FIELD_PREP(GENMASK(17, 17), (x))
+#define		SET_PARAM_RDO_ADAPTIVE_ROUND_ON		BIT(3)
+#define		SET_PARAM_RDO_HVS_QP(x)			FIELD_PREP(GENMASK(2, 2), (x))
+#define W6_CMD_ENC_SET_PARAM_SLICE			(W6_REG_BASE + 0x328)
+#define		SET_PARAM_SLICE_ARGUMENT(x)		FIELD_PREP(GENMASK(31, 3), (x))
+#define		SET_PARAM_SLICE_MODE(x)			FIELD_PREP(GENMASK(2, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_INTRA_REFRESH		(W6_REG_BASE + 0x32C)
+#define		SET_PARAM_INTRA_REFRESH_ARGUMENT(x)	FIELD_PREP(GENMASK(31, 16), (x))
+#define		SET_PARAM_INTRA_REFRESH_MODE(x)		FIELD_PREP(GENMASK(2, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_INTRA_QP			(W6_REG_BASE + 0x330)
+#define		SET_PARAM_INTRA_QP_MAX(x)		FIELD_PREP(GENMASK(11, 6), (x))
+#define		SET_PARAM_INTRA_QP_MIN(x)		FIELD_PREP(GENMASK(5, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_RC_FRAME_RATE		(W6_REG_BASE + 0x334)
+#define W6_CMD_ENC_SET_PARAM_RC_TARGET_RATE		(W6_REG_BASE + 0x338)
+#define W6_CMD_ENC_SET_PARAM_RC				(W6_REG_BASE + 0x33C)
+#define		SET_PARAM_RC_UPDATE_SPEED(x)		FIELD_PREP(GENMASK(31, 24), (x))
+#define		SET_PARAM_RC_INITIAL_LEVEL(x)		FIELD_PREP(GENMASK(23, 20), (x))
+#define		SET_PARAM_RC_INITIAL_QP(x)		FIELD_PREP(GENMASK(19, 14), (x))
+#define		SET_PARAM_RC_MODE(x)			FIELD_PREP(GENMASK(13, 13), (x))
+#define		SET_PARAM_RC_PIC_LEVEL_MAX_DELTA_QP(x)	FIELD_PREP(GENMASK(12, 7), (x))
+#define		SET_PARAM_RC_VBV_OVERFLOW_DROP_FRAME(x)	FIELD_PREP(GENMASK(3, 3), (x))
+#define		SET_PARAM_RC_CU_LEVEL_ENABLE(x)		FIELD_PREP(GENMASK(1, 1), (x))
+#define		SET_PARAM_RC_ENABLE(x)			FIELD_PREP(GENMASK(0, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_HVS			(W6_REG_BASE + 0x340)
+#define		SET_PARAM_HVS_MAX_DELTA_QP(x)		FIELD_PREP(GENMASK(17, 12), (x))
+#define		SET_PARAM_HVS_QP_SCALE(x)		FIELD_PREP(GENMASK(3, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_RC_MAX_BITRATE		(W6_REG_BASE + 0x344)
+#define W6_CMD_ENC_SET_PARAM_RC_VBV_BUFFER_SIZE		(W6_REG_BASE + 0x348)
+#define W6_CMD_ENC_SET_PARAM_INTER_QP			(W6_REG_BASE + 0x34C)
+#define		SET_PARAM_INTER_QP_MAX_B(x)		FIELD_PREP(GENMASK(23, 18), (x))
+#define		SET_PARAM_INTER_QP_MIN_B(x)		FIELD_PREP(GENMASK(17, 12), (x))
+#define		SET_PARAM_INTER_QP_MAX_P(x)		FIELD_PREP(GENMASK(11, 6), (x))
+#define		SET_PARAM_INTER_QP_MIN_P(x)		FIELD_PREP(GENMASK(5, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_ROT			(W6_REG_BASE + 0x350)
+#define		SET_PARAM_ROT_MIRH			BIT(4)
+#define		SET_PARAM_ROT_MIRV			BIT(3)
+#define		SET_PARAM_ROT_270			FIELD_PREP(GENMASK(2, 1), 3)
+#define		SET_PARAM_ROT_180			FIELD_PREP(GENMASK(2, 1), 2)
+#define		SET_PARAM_ROT_90			FIELD_PREP(GENMASK(2, 1), 1)
+#define		SET_PARAM_ROT_ENABLE			BIT(0)
+#define W6_CMD_ENC_SET_PARAM_NUM_UNITS_IN_TICK		(W6_REG_BASE + 0x354)
+#define W6_CMD_ENC_SET_PARAM_TIME_SCALE			(W6_REG_BASE + 0x358)
+#define W6_CMD_ENC_SET_PARAM_NUM_TICKS_POC_DIFF_ONE	(W6_REG_BASE + 0x35C)
+#define W6_CMD_ENC_SET_PARAM_MAX_INTRA_PIC_BIT		(W6_REG_BASE + 0x360)
+#define W6_CMD_ENC_SET_PARAM_MAX_INTER_PIC_BIT		(W6_REG_BASE + 0x364)
+#define W6_CMD_ENC_SET_PARAM_BG				(W6_REG_BASE + 0x36C)
+#define		SET_PARAM_BG_DELTA_QP(x)		FIELD_PREP(GENMASK(29, 24), (x))
+#define		SET_PARAM_BG_THRESHOLD_MEAN_DIFF(x)	FIELD_PREP(GENMASK(17, 10), (x))
+#define		SET_PARAM_BG_THRESHOLD_MAX_DIFF(x)	FIELD_PREP(GENMASK(9, 1), (x))
+#define		SET_PARAM_BG_ENABLE(x)			FIELD_PREP(GENMASK(0, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_NON_VCL_PARAM		(W6_REG_BASE + 0x370)
+#define		SET_PARAM_NON_VCL_PARAM_ENCODE_VUI	BIT(1)
+#define W6_CMD_ENC_SET_PARAM_VUI_RBSP_ADDR		(W6_REG_BASE + 0x374)
+#define W6_CMD_ENC_SET_PARAM_HRD_RBSP_ADDR		(W6_REG_BASE + 0x378)
+#define W6_CMD_ENC_SET_PARAM_QROUND_OFFSET		(W6_REG_BASE + 0x380)
+#define		SET_PARAM_QROUND_OFFSET_INTER(x)	FIELD_PREP(GENMASK(23, 13), (x))
+#define		SET_PARAM_QROUND_OFFSET_INTRA(x)	FIELD_PREP(GENMASK(12, 2), (x))
+#define W6_CMD_ENC_SET_PARAM_QUANT1			(W6_REG_BASE + 0x384)
+#define W6_CMD_ENC_SET_PARAM_QUANT2			(W6_REG_BASE + 0x388)
+#define		SET_PARAM_QUANT2_LAMBDA_DQP_INTER(x)	FIELD_PREP(GENMASK(19, 14), (x))
+#define		SET_PARAM_QUANT2_LAMBDA_DQP_INTRA(x)	FIELD_PREP(GENMASK(13, 8), (x))
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_GOP			(W6_REG_BASE + 0x38C)
+
+/* W6_CMD_ENC_SET_PARAM_CUSTOM_GOP_PIC(x)
+ * Address range: 0x390, 0x394, ..., 0x3AC (step = 0x4)
+ */
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_GOP_PIC(x)		(W6_REG_BASE + 0x390 + ((x) * 0x4))
+#define		SET_PARAM_CUSTOM_GOP_PIC_TEMP_ID(x)	FIELD_PREP(GENMASK(29, 26), (x))
+#define		SET_PARAM_CUSTOM_GOP_PIC_REF1_POC(x)	FIELD_PREP(GENMASK(25, 20), (x))
+#define		SET_PARAM_CUSTOM_GOP_PIC_REF0_POC(x)	FIELD_PREP(GENMASK(19, 14), (x))
+#define		SET_PARAM_CUSTOM_GOP_PIC_MULTI_REF_P(x)	FIELD_PREP(GENMASK(13, 13), (x))
+#define		SET_PARAM_CUSTOM_GOP_PIC_QP(x)		FIELD_PREP(GENMASK(12, 7), (x))
+#define		SET_PARAM_CUSTOM_GOP_PIC_POC_OFFSET(x)	FIELD_PREP(GENMASK(6, 2), (x))
+#define		SET_PARAM_CUSTOM_GOP_PIC_TYPE(x)	FIELD_PREP(GENMASK(1, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_TILE_PARAM			(W6_REG_BASE + 0x3D0)
+
+/* W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA(x)
+ * Address range: 0x3D4, 0x3D8, ..., 0x4A0 (step = 0x4)
+ */
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA(x)		(W6_REG_BASE + 0x3D4 + ((x) * 0x4))
+#define		SET_PARAM_CUSTOM_LAMBDA_SSD(x)		FIELD_PREP(GENMASK(20, 7), (x))
+#define		SET_PARAM_CUSTOM_LAMBDA_SAD(x)		FIELD_PREP(GENMASK(6, 0), (x))
+
+/* W6_CMD_ENC_SET_PARAM_TEMP_LAYER_QP(x)
+ * Address range: 0x4A4, 0x4A8, ..., 0x4B0 (step = 0x4)
+ */
+#define W6_CMD_ENC_SET_PARAM_TEMP_LAYER_QP(x)		(W6_REG_BASE + 0x4A4 + ((x) * 0x4))
+#define		SET_PARAM_TEMP_LAYER_QP_B(x)		FIELD_PREP(GENMASK(17, 12), (x))
+#define		SET_PARAM_TEMP_LAYER_QP_P(x)		FIELD_PREP(GENMASK(11, 6), (x))
+#define		SET_PARAM_TEMP_LAYER_QP_I(x)		FIELD_PREP(GENMASK(5, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_SCALER_SIZE		(W6_REG_BASE + 0x4B4)
+#define		SET_PARAM_SCALER_SIZE_HEIGHT(x)		FIELD_PREP(GENMASK(31, 16), (x))
+#define		SET_PARAM_SCALER_SIZE_WIDTH(x)		FIELD_PREP(GENMASK(15, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_SCALER			(W6_REG_BASE + 0x4B8)
+#define		SET_PARAM_SCALER_COEF_MODE(x)		FIELD_PREP(GENMASK(2, 1), (x))
+#define		SET_PARAM_SCALER_ENABLE(x)		FIELD_PREP(GENMASK(0, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_COLOR			(W6_REG_BASE + 0x4F8)
+#define		SET_PARAM_COLOR_RANGE(x)		FIELD_PREP(GENMASK(25, 25), (x))
+#define		SET_PARAM_COLOR_MATRIX_COEFF(x)		FIELD_PREP(GENMASK(24, 17), (x))
+#define		SET_PARAM_COLOR_TRANS_CHAR(x)		FIELD_PREP(GENMASK(16, 9), (x))
+#define		SET_PARAM_COLOR_PRIMARIES(x)		FIELD_PREP(GENMASK(8, 1), (x))
+#define		SET_PARAM_COLOR_DESCRIPTION_PRESENT_ON	BIT(0)
+#define W6_CMD_ENC_SET_PARAM_SAR			(W6_REG_BASE + 0x4FC)
+#define		SET_PARAM_SAR_ASPECT_RATIO_IDC(x)	FIELD_PREP(GENMASK(8, 1), (x))
+#define		SET_PARAM_SAR_ASPECT_RATIO_ENABLE(x)	FIELD_PREP(GENMASK(0, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_SAR_EXTENDED		(W6_REG_BASE + 0x500)
+#define		SET_PARAM_SAR_EXTENDED_HEIGHT(x)	FIELD_PREP(GENMASK(31, 16), (x))
+#define		SET_PARAM_SAR_EXTENDED_WIDTH(x)		FIELD_PREP(GENMASK(15, 0), (x))
+
+/* ENCODER - ENC_PIC */
+#define W6_CMD_ENC_PIC_BS_START				(W6_REG_BASE + 0x300)
+#define W6_CMD_ENC_PIC_BS_SIZE				(W6_REG_BASE + 0x304)
+#define W6_CMD_ENC_PIC_BS_OPTION			(W6_REG_BASE + 0x308)
+#define W6_CMD_ENC_PIC_SEC_AXI				(W6_REG_BASE + 0x30C)
+#define		ENC_PIC_SEC_AXI_RDO_ENABLE(x)		FIELD_PREP(GENMASK(1, 1), (x))
+#define		ENC_PIC_SEC_AXI_LF_ENABLE(x)		FIELD_PREP(GENMASK(0, 0), (x))
+#define W6_CMD_ENC_PIC_REPORT				(W6_REG_BASE + 0x310)
+#define		ENC_PIC_REPORT_MV_HISTO_ENABLE(x)	FIELD_PREP(GENMASK(1, 1), (x))
+#define W6_CMD_ENC_PIC_MV_HISTO0			(W6_REG_BASE + 0x318)
+#define		ENC_PIC_MV_HISTO0_THRESHOLD0(x)		FIELD_PREP(GENMASK(31, 16), (x))
+#define		ENC_PIC_MV_HISTO0_THRESHOLD1(x)		FIELD_PREP(GENMASK(15, 0), (x))
+#define W6_CMD_ENC_PIC_MV_HISTO1			(W6_REG_BASE + 0x31C)
+#define		ENC_PIC_MV_HISTO1_THRESHOLD2(x)		FIELD_PREP(GENMASK(31, 16), (x))
+#define		ENC_PIC_MV_HISTO1_THRESHOLD3(x)		FIELD_PREP(GENMASK(15, 0), (x))
+#define W6_CMD_ENC_PIC_CUSTOM_MAP_PARAM			(W6_REG_BASE + 0x320)
+#define W6_CMD_ENC_PIC_CUSTOM_MAP_ADDR			(W6_REG_BASE + 0x324)
+#define W6_CMD_ENC_PIC_SRC_PIC_IDX			(W6_REG_BASE + 0x32C)
+#define		ENC_PIC_SRC_PIC_IDX_END			0xFFFFFFFF
+#define W6_CMD_ENC_PIC_SRC_ADDR_Y			(W6_REG_BASE + 0x330)
+#define W6_CMD_ENC_PIC_SRC_ADDR_U			(W6_REG_BASE + 0x334)
+#define W6_CMD_ENC_PIC_SRC_ADDR_V			(W6_REG_BASE + 0x338)
+#define W6_CMD_ENC_PIC_SRC_STRIDE			(W6_REG_BASE + 0x33C)
+#define		ENC_PIC_SRC_STRIDE_L(x)			FIELD_PREP(GENMASK(31, 16), (x))
+#define		ENC_PIC_SRC_STRIDE_C(x)			FIELD_PREP(GENMASK(15, 0), (x))
+#define W6_CMD_ENC_PIC_SRC_FMT				(W6_REG_BASE + 0x340)
+#define		ENC_PIC_SRC_FMT_C_FMT_IDC(x)		FIELD_PREP(GENMASK(30, 28), (x))
+#define		ENC_PIC_SRC_FMT_CSC_24BIT(x)		FIELD_PREP(GENMASK(25, 25), (x))
+#define		ENC_PIC_SRC_FMT_CSC_AYUV(x)		FIELD_PREP(GENMASK(24, 24), (x))
+#define		ENC_PIC_SRC_FMT_CSC_ENABLE(x)		FIELD_PREP(GENMASK(20, 20), (x))
+#define		ENC_PIC_SRC_FMT_CSC_FMT_ORDER(x)	FIELD_PREP(GENMASK(19, 16), (x))
+#define		ENC_PIC_SRC_FMT_ENDIAN(x)		FIELD_PREP(GENMASK(15, 12), (x))
+#define		ENC_PIC_SRC_FMT_10BIT_ORDER(x)		FIELD_PREP(GENMASK(6, 6), (x))
+#define		ENC_PIC_SRC_FMT_10BIT_3PIXEL_4BYTE(x)	FIELD_PREP(GENMASK(5, 5), (x))
+#define		ENC_PIC_SRC_FMT_10BIT_ENABLE(x)		FIELD_PREP(GENMASK(4, 4), (x))
+#define		ENC_PIC_SRC_FMT_YUV422_PACKED_ORDER(x)	FIELD_PREP(GENMASK(3, 3), (x))
+#define		ENC_PIC_SRC_FMT_CBCR_ORDER(x)		FIELD_PREP(GENMASK(2, 2), (x))
+#define		ENC_PIC_SRC_FMT_2PLANE(x)		FIELD_PREP(GENMASK(1, 1), (x))
+#define		ENC_PIC_SRC_FMT_YUV422_PACKED(x)	FIELD_PREP(GENMASK(0, 0), (x))
+#define W6_CMD_ENC_PIC_SRC_AXI_SEL			(W6_REG_BASE + 0x348)
+#define		ENC_PIC_SRC_AXI_SEL_PRIMARY_PORT	1
+#define		ENC_PIC_SRC_AXI_SEL_PRP_PORT		0
+#define W6_CMD_ENC_PIC_CODE_OPTION			(W6_REG_BASE + 0x34C)
+#define		ENC_PIC_CODE_OPTION_ENCODE_VCL		BIT(1)
+#define		ENC_PIC_CODE_OPTION_ENCODE_HEADER	BIT(0)
+#define W6_CMD_ENC_PIC_PARAM				(W6_REG_BASE + 0x350)
+#define		ENC_PIC_PARAM_INTRA_4X4(x)		FIELD_PREP(GENMASK(29, 28), (x))
+#define		ENC_PIC_PARAM_FORCE_PIC_TYPE(x)		FIELD_PREP(GENMASK(23, 21), (x))
+#define		ENC_PIC_PARAM_FORCE_PIC_TYPE_ENABLE(x)	FIELD_PREP(GENMASK(20, 20), (x))
+#define		ENC_PIC_PARAM_FORCE_PIC_QP_B(x)		FIELD_PREP(GENMASK(19, 14), (x))
+#define		ENC_PIC_PARAM_FORCE_PIC_QP_P(x)		FIELD_PREP(GENMASK(13, 8), (x))
+#define		ENC_PIC_PARAM_FORCE_PIC_QP_I(x)		FIELD_PREP(GENMASK(7, 2), (x))
+#define		ENC_PIC_PARAM_FORCE_PIC_QP_ENABLE(x)	FIELD_PREP(GENMASK(1, 1), (x))
+#define		ENC_PIC_PARAM_PIC_SKIP_FLAG(x)		FIELD_PREP(GENMASK(0, 0), (x))
+#define W6_CMD_ENC_PIC_LONGTERM_PIC			(W6_REG_BASE + 0x354)
+#define W6_CMD_ENC_PIC_PREFIX_SEI_NAL_ADDR		(W6_REG_BASE + 0x358)
+#define W6_CMD_ENC_PIC_PREFIX_SEI_INFO			(W6_REG_BASE + 0x35C)
+#define W6_CMD_ENC_PIC_SUFFIX_SEI_NAL_ADDR		(W6_REG_BASE + 0x360)
+#define W6_CMD_ENC_PIC_SUFFIX_SEI_INFO			(W6_REG_BASE + 0x364)
+#define W6_CMD_ENC_PIC_CSC_COEFF0			(W6_REG_BASE + 0x374)
+#define		ENC_PIC_CSC_COEFF0_RY(x)		FIELD_PREP(GENMASK(29, 20), (x))
+#define		ENC_PIC_CSC_COEFF0_GY(x)		FIELD_PREP(GENMASK(19, 10), (x))
+#define		ENC_PIC_CSC_COEFF0_BY(x)		FIELD_PREP(GENMASK(9, 0), (x))
+#define W6_CMD_ENC_PIC_CSC_COEFF1			(W6_REG_BASE + 0x378)
+#define		ENC_PIC_CSC_COEFF1_RCB(x)		FIELD_PREP(GENMASK(29, 20), (x))
+#define		ENC_PIC_CSC_COEFF1_GCB(x)		FIELD_PREP(GENMASK(19, 10), (x))
+#define		ENC_PIC_CSC_COEFF1_BCB(x)		FIELD_PREP(GENMASK(9, 0), (x))
+#define W6_CMD_ENC_PIC_CSC_COEFF2			(W6_REG_BASE + 0x37C)
+#define		ENC_PIC_CSC_COEFF2_RCR(x)		FIELD_PREP(GENMASK(29, 20), (x))
+#define		ENC_PIC_CSC_COEFF2_GCR(x)		FIELD_PREP(GENMASK(19, 10), (x))
+#define		ENC_PIC_CSC_COEFF2_BCR(x)		FIELD_PREP(GENMASK(9, 0), (x))
+#define W6_CMD_ENC_PIC_CSC_COEFF3			(W6_REG_BASE + 0x380)
+#define		ENC_PIC_CSC_COEFF3_OFFSET_Y(x)		FIELD_PREP(GENMASK(29, 20), (x))
+#define		ENC_PIC_CSC_COEFF3_OFFSET_CB(x)		FIELD_PREP(GENMASK(19, 10), (x))
+#define		ENC_PIC_CSC_COEFF3_OFFSET_CR(x)		FIELD_PREP(GENMASK(9, 0), (x))
+#define W6_CMD_ENC_PIC_TIMESTAMP_LOW			(W6_REG_BASE + 0x448)
+#define W6_CMD_ENC_PIC_TIMESTAMP_HIGH			(W6_REG_BASE + 0x44C)
+
+/* ENCODER - QUERY : GET_RESULT */
+#define W6_RET_ENC_RD_PTR				(W6_REG_BASE + 0x300)
+#define W6_RET_ENC_WR_PTR				(W6_REG_BASE + 0x304)
+#define W6_RET_ENC_NUM_REQUIRED_FBC_FB			(W6_REG_BASE + 0x308)
+#define W6_RET_ENC_MIN_SRC_BUF_NUM			(W6_REG_BASE + 0x30C)
+#define W6_RET_ENC_PIC_TYPE				(W6_REG_BASE + 0x310)
+#define W6_RET_ENC_PIC_POC				(W6_REG_BASE + 0x314)
+#define W6_RET_ENC_PIC_IDX				(W6_REG_BASE + 0x318)
+#define W6_RET_ENC_PIC_SLICE_NUM			(W6_REG_BASE + 0x31C)
+#define W6_RET_ENC_PIC_SKIP				(W6_REG_BASE + 0x320)
+#define W6_RET_ENC_PIC_NUM_INTRA			(W6_REG_BASE + 0x324)
+#define W6_RET_ENC_PIC_NUM_MERGE			(W6_REG_BASE + 0x328)
+#define W6_RET_ENC_PIC_NON_REF_PIC_FLAG			(W6_REG_BASE + 0x32C)
+#define W6_RET_ENC_PIC_NUM_SKIP				(W6_REG_BASE + 0x330)
+#define W6_RET_ENC_PIC_AVG_CTU_QP			(W6_REG_BASE + 0x334)
+#define W6_RET_ENC_PIC_BYTE				(W6_REG_BASE + 0x338)
+#define W6_RET_ENC_GOP_PIC_IDX				(W6_REG_BASE + 0x33C)
+#define W6_RET_ENC_USED_SRC_IDX				(W6_REG_BASE + 0x340)
+#define W6_RET_ENC_PIC_NUM				(W6_REG_BASE + 0x344)
+#define W6_RET_ENC_VCL_NUT				(W6_REG_BASE + 0x348)
+#define W6_RET_ENC_PIC_DIST_LOW				(W6_REG_BASE + 0x350)
+#define W6_RET_ENC_PIC_DIST_HIGH			(W6_REG_BASE + 0x354)
+#define W6_RET_ENC_PIC_MAX_LATENCY_PICTURES		(W6_REG_BASE + 0x358)
+#define W6_RET_ENC_HISTO_CNT0				(W6_REG_BASE + 0x360)
+#define W6_RET_ENC_HISTO_CNT1				(W6_REG_BASE + 0x364)
+#define W6_RET_ENC_HISTO_CNT2				(W6_REG_BASE + 0x368)
+#define W6_RET_ENC_HISTO_CNT3				(W6_REG_BASE + 0x36C)
+#define W6_RET_ENC_HISTO_CNT4				(W6_REG_BASE + 0x370)
+#define W6_RET_ENC_WARN_INFO				(W6_REG_BASE + 0x3AC)
+#define W6_RET_ENC_ERR_INFO				(W6_REG_BASE + 0x3B0)
+#define W6_RET_ENC_ENCODING_SUCCESS			(W6_REG_BASE + 0x3B4)
+#define W6_RET_ENC_SUM_ME0_X_DIR_LOWER			(W6_REG_BASE + 0x3B8)
+#define W6_RET_ENC_SUM_ME0_X_DIR_HIGHER			(W6_REG_BASE + 0x3BC)
+#define W6_RET_ENC_SUM_ME0_Y_DIR_LOWER			(W6_REG_BASE + 0x3C0)
+#define W6_RET_ENC_SUM_ME0_Y_DIR_HIGHER			(W6_REG_BASE + 0x3C4)
+#define W6_RET_ENC_SUM_ME1_X_DIR_LOWER			(W6_REG_BASE + 0x3C8)
+#define W6_RET_ENC_SUM_ME1_X_DIR_HIGHER			(W6_REG_BASE + 0x3CC)
+#define W6_RET_ENC_SUM_ME1_Y_DIR_LOWER			(W6_REG_BASE + 0x3D0)
+#define W6_RET_ENC_SUM_ME1_Y_DIR_HIGHER			(W6_REG_BASE + 0x3D4)
+#define W6_RET_ENC_SRC_Y_ADDR				(W6_REG_BASE + 0x3E8)
+#define W6_RET_ENC_CUSTOM_MAP_ADDR			(W6_REG_BASE + 0x3EC)
+#define W6_RET_ENC_PREFIX_SEI_NAL_ADDR			(W6_REG_BASE + 0x3F0)
+#define W6_RET_ENC_SUFFIX_SEI_NAL_ADDR			(W6_REG_BASE + 0x3F4)
+#define W6_RET_ENC_NUM_REQUIRED_COL_BUF			(W6_REG_BASE + 0x404)
+#define W6_RET_ENC_TIMESTAMP_LOW			(W6_REG_BASE + 0x44C)
+#define W6_RET_ENC_TIMESTAMP_HIGH			(W6_REG_BASE + 0x450)
+
 #endif /* __WAVE6_REGDEFINE_H__ */
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
index 4fd86472b427..2baf51a5709d 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
@@ -92,7 +92,8 @@ static irqreturn_t wave6_vpu_core_irq_thread(int irq, void *dev_id)
 		if (!inst)
 			continue;
 
-		if (irq_info.status & BIT(W6_INT_BIT_INIT_SEQ)) {
+		if ((irq_info.status & BIT(W6_INT_BIT_INIT_SEQ)) ||
+		    (irq_info.status & BIT(W6_INT_BIT_ENC_SET_PARAM))) {
 			complete(&inst->irq_done);
 			continue;
 		}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.c b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.c
index c8d1138334b3..b841e3f1c9a1 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.c
@@ -200,3 +200,134 @@ void wave6_vpu_dec_reset_frame_buffer_info(struct vpu_instance *inst)
 		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_FBC_C_TBL][i]);
 	}
 }
+
+int wave6_vpu_enc_open(struct vpu_instance *inst, struct enc_open_param *pop)
+{
+	struct enc_info *p_enc_info;
+	int ret;
+	struct vpu_core_device *core = inst->dev;
+
+	guard(mutex)(&core->hw_lock);
+
+	if (!wave6_vpu_is_init(core))
+		return -ENODEV;
+
+	inst->codec_info = kzalloc_obj(*inst->codec_info);
+	if (!inst->codec_info)
+		return -ENOMEM;
+
+	p_enc_info = &inst->codec_info->enc_info;
+	p_enc_info->open_param = *pop;
+
+	ret = wave6_vpu_build_up_enc_param(core->dev, inst, pop);
+	if (ret) {
+		kfree(inst->codec_info);
+		inst->codec_info = NULL;
+	}
+
+	return ret;
+}
+
+int wave6_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
+{
+	int ret;
+
+	if (WARN_ON(!inst->codec_info))
+		return -EINVAL;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	ret = wave6_vpu_enc_fini_seq(inst, fail_res);
+	if (ret)
+		dev_warn(inst->dev->dev, "enc seq end timed out\n");
+
+	kfree(inst->codec_info);
+	inst->codec_info = NULL;
+
+	return ret;
+}
+
+int wave6_vpu_enc_get_aux_buffer_size(struct vpu_instance *inst,
+				      struct aux_buffer_size_info info, u32 *size)
+{
+	struct enc_info *p_enc_info = &inst->codec_info->enc_info;
+	int width = info.width;
+	int height = info.height;
+	int buf_size, twice;
+
+	if (info.type == AUX_BUF_FBC_Y_TBL) {
+		switch (inst->std) {
+		case W_HEVC_ENC:
+		case W_AVC_ENC:
+			buf_size = WAVE6_FBC_LUMA_TABLE_SIZE(width, height);
+			break;
+		default:
+			return -EINVAL;
+		}
+	} else if (info.type == AUX_BUF_FBC_C_TBL) {
+		if (p_enc_info->c_fmt_idc == C_FMT_IDC_YUV422)
+			twice = 2;
+		else if (p_enc_info->c_fmt_idc == C_FMT_IDC_YUV444)
+			twice = 4;
+		else
+			twice = 1;
+
+		switch (inst->std) {
+		case W_HEVC_ENC:
+		case W_AVC_ENC:
+			buf_size = WAVE6_FBC_CHROMA_TABLE_SIZE(width, height);
+			break;
+		default:
+			return -EINVAL;
+		}
+		buf_size = buf_size * twice;
+	} else if (info.type == AUX_BUF_MV_COL) {
+		switch (inst->std) {
+		case W_HEVC_ENC:
+			buf_size = WAVE6_ENC_HEVC_MVCOL_BUF_SIZE(width, height);
+			break;
+		case W_AVC_ENC:
+			buf_size = WAVE6_ENC_AVC_MVCOL_BUF_SIZE(width, height);
+			break;
+		default:
+			return -EINVAL;
+		}
+	} else if (info.type == AUX_BUF_SUB_SAMPLE) {
+		switch (inst->std) {
+		case W_HEVC_ENC:
+		case W_AVC_ENC:
+			buf_size = WAVE6_ENC_SUBSAMPLED_SIZE(width, height);
+			break;
+		default:
+			return -EINVAL;
+		}
+	} else {
+		return -EINVAL;
+	}
+
+	*size = buf_size;
+
+	return 0;
+}
+
+int wave6_vpu_enc_complete_seq_init(struct vpu_instance *inst,
+				    struct enc_seq_info *info)
+{
+	struct enc_info *p_enc_info = &inst->codec_info->enc_info;
+	int ret;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	ret = wave6_vpu_enc_get_seq_info(inst, info);
+	if (ret) {
+		p_enc_info->seq_info_obtained = false;
+		return ret;
+	}
+
+	if (!p_enc_info->seq_info_obtained) {
+		p_enc_info->seq_info_obtained = true;
+		p_enc_info->seq_info = *info;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
index d8d7b7916d88..d5ecf381276d 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
@@ -56,6 +56,12 @@ enum vpu_instance_state {
 	(ALIGN((_w), 256) * ALIGN((_h), 64) / 32)
 #define WAVE6_FBC_CHROMA_TABLE_SIZE(_w, _h) \
 	(ALIGN(((_w) / 2), 256) * ALIGN((_h), 64) / 32)
+#define WAVE6_ENC_AVC_MVCOL_BUF_SIZE(_w, _h) \
+	((ALIGN((_w), 512) / 512) * (ALIGN((_h), 16) / 16) * 16)
+#define WAVE6_ENC_HEVC_MVCOL_BUF_SIZE(_w, _h) \
+	((ALIGN((_w), 64) / 64) * (ALIGN((_h), 64) / 64) * 128)
+#define WAVE6_ENC_SUBSAMPLED_SIZE(_w, _h) \
+	(ALIGN(((_w) / 4), 16) * ALIGN(((_h) / 4), 32))
 
 enum codec_std {
 	W_HEVC_DEC	= 0x00,
@@ -78,6 +84,28 @@ enum codec_std {
 
 #define H264_VUI_SAR_IDC_EXTENDED 255
 
+#define DEC_REFRESH_TYPE_NON_IRAP 0
+#define DEC_REFRESH_TYPE_IDR 2
+
+#define DEFAULT_TEMP_LAYER_CNT 1
+#define DEFAULT_RC_INITIAL_LEVEL 8
+#define DEFAULT_RC_INITIAL_QP -1
+#define DEFAULT_PIC_RC_MAX_DQP 3
+#define DEFAULT_QROUND_INTER 85
+#define DEFAULT_QROUND_INTRA 171
+#define DEFAULT_INTRA_4X4 3
+#define DEFAULT_NUM_TICKS_POC_DIFF 1
+#define DEFAULT_RC_UPDATE_SPEED_CBR 64
+#define DEFAULT_RC_UPDATE_SPEED_VBR 16
+#define MAX_INTRA_INTER_PIC_BIT 1500000000
+#define DEFAULT_FRAME_RATE 30
+#define MIN_FRAME_RATE 1
+#define MAX_FRAME_RATE 960
+#define DEFAULT_CPB_SIZE 10000
+#define MIN_CPB_SIZE 10
+#define MAX_CPB_SIZE 100000
+#define AVC_MIN_SLICE_MAX_MB 4
+
 #define SEQ_CHANGE_ENABLE_PROFILE BIT(5)
 #define SEQ_CHANGE_ENABLE_SIZE BIT(16)
 #define SEQ_CHANGE_ENABLE_BIT_DEPTH BIT(18)
@@ -95,6 +123,11 @@ enum codec_std {
 #define DEC_NOTI_FLAG_NO_FB		BIT(1)
 #define DEC_NOTI_FLAG_SEQ_CHANGE	BIT(0)
 
+#define RECON_IDX_FLAG_ENC_END -1
+#define RECON_IDX_FLAG_ENC_DELAY -2
+#define RECON_IDX_FLAG_HEADER_ONLY -3
+#define RECON_IDX_FLAG_CHANGE_PARAM -4
+
 #define FW_VERSION_MAJOR_MASK	0xFF000000
 #define FW_VERSION_MINOR_MASK	0x00FF0000
 #define FW_VERSION_REL_MASK	0x0000FFFF
@@ -102,6 +135,20 @@ enum codec_std {
 #define FW_VERSION_MINOR(x)	FIELD_GET(FW_VERSION_MINOR_MASK, (x))
 #define FW_VERSION_REL(x)	FIELD_GET(FW_VERSION_REL_MASK, (x))
 
+enum mirror_direction {
+	MIR_NONE,
+	MIR_VER,
+	MIR_HOR,
+	MIR_HOR_VER
+};
+
+enum rotation_angle {
+	ROT_0 = 0,
+	ROT_90 = 90,
+	ROT_180 = 180,
+	ROT_270 = 270
+};
+
 enum chroma_format_idc {
 	C_FMT_IDC_YUV400,
 	C_FMT_IDC_YUV420,
@@ -110,6 +157,28 @@ enum chroma_format_idc {
 	C_FMT_IDC_RGB
 };
 
+enum csc_format_order {
+	CSC_FMT_ORDER_RGB	= 0,
+	CSC_FMT_ORDER_RBG	= 1,
+	CSC_FMT_ORDER_GRB	= 2,
+	CSC_FMT_ORDER_GBR	= 3,
+	CSC_FMT_ORDER_BGR	= 4,
+	CSC_FMT_ORDER_BRG	= 5,
+
+	CSC_FMT_ORDER_ARGB	= 0,
+	CSC_FMT_ORDER_ARBG	= 1,
+	CSC_FMT_ORDER_AGRB	= 2,
+	CSC_FMT_ORDER_AGBR	= 3,
+	CSC_FMT_ORDER_ABGR	= 4,
+	CSC_FMT_ORDER_ABRG	= 5,
+	CSC_FMT_ORDER_RGBA	= 8,
+	CSC_FMT_ORDER_RBGA	= 9,
+	CSC_FMT_ORDER_GRBA	= 10,
+	CSC_FMT_ORDER_GBRA	= 11,
+	CSC_FMT_ORDER_BGRA	= 12,
+	CSC_FMT_ORDER_BRGA	= 13,
+};
+
 enum frame_buffer_format {
 	FORMAT_ERR = -1,
 
@@ -183,6 +252,14 @@ enum pic_type {
 	PIC_TYPE_MAX
 };
 
+enum enc_force_pic_type {
+	ENC_FORCE_PIC_TYPE_I = 0,
+	ENC_FORCE_PIC_TYPE_P = 1,
+	ENC_FORCE_PIC_TYPE_B = 2,
+	ENC_FORCE_PIC_TYPE_IDR = 3,
+	ENC_FORCE_PIC_TYPE_DISABLED = 4,
+};
+
 enum display_mode {
 	DISP_MODE_DISP_ORDER,
 	DISP_MODE_DEC_ORDER,
@@ -207,6 +284,12 @@ enum aux_buffer_type {
 	AUX_BUF_TYPE_MAX,
 };
 
+enum intra_refresh_mode {
+	INTRA_REFRESH_NONE = 0,
+	INTRA_REFRESH_ROW = 1,
+	INTRA_REFRESH_COLUMN = 2,
+};
+
 struct vpu_attr {
 	u32 product_id;
 	u32 product_code;
@@ -243,9 +326,17 @@ struct vpu_rect {
 	u32 bottom;
 };
 
+struct sar_info {
+	u32 enable;
+	u32 idc;
+	u32 width;
+	u32 height;
+};
+
 struct instance_buffer {
 	dma_addr_t temp_base;
 	u32 temp_size;
+	dma_addr_t ar_base;
 };
 
 struct color_param {
@@ -260,6 +351,8 @@ struct color_param {
 struct sec_axi_info {
 	bool use_dec_ip;
 	bool use_dec_lf_row;
+	bool use_enc_rdo;
+	bool use_enc_lf;
 };
 
 struct aux_buffer_size_info {
@@ -358,6 +451,320 @@ struct dec_info {
 	enum frame_buffer_format out_fmt;
 };
 
+#define MAX_CUSTOM_LAMBDA_NUM 52
+#define MAX_NUM_TEMP_LAYER 7
+#define MAX_CUSTOM_GOP_NUM 8
+#define MAX_NUM_CHANGEABLE_TEMP_LAYER 4
+
+struct custom_gop_pic_param {
+	int pic_type;
+	int poc_offset;
+	int pic_qp;
+	bool multi_ref_p;
+	int ref_poc_l0;
+	int ref_poc_l1;
+	int temporal_id;
+};
+
+struct custom_gop_param {
+	int size;
+	struct custom_gop_pic_param pic[MAX_CUSTOM_GOP_NUM];
+};
+
+struct temporal_layer_param {
+	bool change_qp;
+	u32 qp_i;
+	u32 qp_p;
+	u32 qp_b;
+};
+
+struct enc_scaler_info {
+	bool enable;
+	int width;
+	int height;
+	int coef_mode;
+};
+
+struct enc_codec_param {
+	u32 internal_bit_depth;
+	u32 decoding_refresh_type;
+	u32 idr_period;
+	u32 intra_period;
+	u32 gop_preset_idx;
+	u32 frame_rate;
+	u32 bitrate;
+	u32 cpb_size;
+	u32 hvs_qp_scale_div2;
+	u32 max_delta_qp;
+	int rc_initial_qp;
+	u32 rc_update_speed;
+	u32 max_bitrate;
+	u32 rc_mode;
+	u32 rc_initial_level;
+	u32 pic_rc_max_dqp;
+	u32 bg_th_diff;
+	u32 bg_th_mean_diff;
+	int bg_delta_qp;
+	u32 intra_refresh_mode;
+	u32 intra_refresh_arg;
+	int beta_offset_div2;
+	int tc_offset_div2;
+	u32 qp;
+	u32 min_qp_i;
+	u32 max_qp_i;
+	u32 min_qp_p;
+	u32 max_qp_p;
+	u32 min_qp_b;
+	u32 max_qp_b;
+	int cb_qp_offset;
+	int cr_qp_offset;
+	u32 qround_intra;
+	u32 qround_inter;
+	int lambda_dqp_intra;
+	int lambda_dqp_inter;
+	u32 slice_mode;
+	u32 slice_arg;
+	u32 level;
+	u32 tier;
+	u32 profile;
+	struct vpu_rect conf_win;
+	u32 forced_idr_header;
+	u16 lambda_ssd[MAX_CUSTOM_LAMBDA_NUM];
+	u16 lambda_sad[MAX_CUSTOM_LAMBDA_NUM];
+	struct custom_gop_param gop_param;
+	struct temporal_layer_param temp_layer[MAX_NUM_CHANGEABLE_TEMP_LAYER];
+	u32 temp_layer_cnt;
+	u32 mv_histo_th0;
+	u32 mv_histo_th1;
+	u32 mv_histo_th2;
+	u32 mv_histo_th3;
+	u32 num_units_in_tick;
+	u32 time_scale;
+	u32 num_ticks_poc_diff_one;
+	struct color_param color;
+	struct sar_info sar;
+	u32 max_intra_pic_bit;
+	u32 max_inter_pic_bit;
+	u32 intra_4x4;
+
+	u32 en_const_intra_pred: 1;
+	u32 en_longterm: 1;
+	u32 en_rate_control: 1;
+	u32 en_transform8x8: 1;
+	u32 en_hvs_qp: 1;
+	u32 en_bg_detect: 1;
+	u32 en_temporal_mvp: 1;
+	u32 en_cabac: 1;
+	u32 en_dbk: 1;
+	u32 en_sao: 1;
+	u32 en_lf_slice_boundary: 1;
+	u32 en_scaling_list: 1;
+	u32 en_qround_offset: 1;
+	u32 en_still_picture: 1;
+	u32 en_intra_smooth: 1;
+	u32 en_custom_lambda: 1;
+	u32 en_report_mv_histo: 1;
+	u32 en_cu_level_rate_control: 1;
+	u32 en_skip_frame: 1;
+};
+
+struct enc_open_param {
+	int pic_width;
+	int pic_height;
+	struct enc_codec_param codec_param;
+	enum endian_mode source_endian;
+	enum frame_buffer_format src_fmt;
+	enum frame_buffer_format out_fmt;
+	u32 ext_addr_vcpu: 8;
+	u32 is_secure_inst: 1;
+	u32 inst_priority: 5;
+	struct instance_buffer inst_buffer;
+	enum mirror_direction mir_dir;
+	enum rotation_angle rot_angle;
+};
+
+struct enc_seq_info {
+	u32 min_frame_buffer_count: 5;
+	u32 min_src_frame_count;
+	u32 req_mv_buffer_count: 5;
+	int max_latency_pictures;
+	int err_reason;
+	int warn_info;
+};
+
+struct enc_csc_param {
+	u32 fmt_order;
+	s32 coef_ry;
+	s32 coef_gy;
+	s32 coef_by;
+	s32 coef_rcb;
+	s32 coef_gcb;
+	s32 coef_bcb;
+	s32 coef_rcr;
+	s32 coef_gcr;
+	s32 coef_bcr;
+	u32 offset_y;
+	u32 offset_cb;
+	u32 offset_cr;
+};
+
+struct enc_param {
+	struct frame_buffer *source_frame;
+	bool skip_picture;
+	dma_addr_t pic_stream_buffer_addr;
+	int pic_stream_buffer_size;
+	bool force_pic_qp;
+	int force_pic_qp_i;
+	int force_pic_qp_p;
+	int force_pic_qp_b;
+	bool force_pic;
+	int force_pic_type;
+	int src_idx;
+	u32 bitrate;
+	struct enc_csc_param csc;
+	u64 timestamp;
+};
+
+struct enc_report_fme_sum {
+	u32 lower_x0;
+	u32 higher_x0;
+	u32 lower_y0;
+	u32 higher_y0;
+	u32 lower_x1;
+	u32 higher_x1;
+	u32 lower_y1;
+	u32 higher_y1;
+};
+
+struct enc_report_mv_histo {
+	u32 cnt0;
+	u32 cnt1;
+	u32 cnt2;
+	u32 cnt3;
+	u32 cnt4;
+};
+
+struct enc_output_info {
+	dma_addr_t bitstream_buffer;
+	u32 bitstream_size;
+	int pic_type;
+	int num_of_slices;
+	int recon_frame_index;
+	dma_addr_t rd_ptr;
+	dma_addr_t wr_ptr;
+	int pic_skipped;
+	int num_of_intra;
+	int num_of_merge;
+	int num_of_skip_block;
+	int avg_ctu_qp;
+	int enc_pic_byte;
+	int enc_gop_pic_idx;
+	int enc_pic_poc;
+	int enc_src_idx;
+	int enc_vcl_nut;
+	int enc_pic_cnt;
+	int error_reason;
+	int warn_info;
+	u32 pic_distortion_low;
+	u32 pic_distortion_high;
+	bool non_ref_pic;
+	bool encoding_success;
+	struct enc_report_fme_sum fme_sum;
+	struct enc_report_mv_histo mv_histo;
+	u64 timestamp;
+	dma_addr_t src_y_addr;
+	dma_addr_t custom_map_addr;
+	dma_addr_t prefix_sei_nal_addr;
+	dma_addr_t suffix_sei_nal_addr;
+};
+
+enum gop_preset_idx {
+	PRESET_IDX_CUSTOM_GOP = 0,
+	PRESET_IDX_ALL_I = 1,
+	PRESET_IDX_IPP = 2,
+	PRESET_IDX_IBBB = 3,
+	PRESET_IDX_IBPBP = 4,
+	PRESET_IDX_IBBBP = 5,
+	PRESET_IDX_IPPPP = 6,
+	PRESET_IDX_IBBBB = 7,
+	PRESET_IDX_RA_IB = 8,
+	PRESET_IDX_IPP_SINGLE = 9,
+	PRESET_IDX_MAX,
+};
+
+struct enc_info {
+	struct enc_open_param open_param;
+	struct enc_seq_info seq_info;
+	enum mirror_direction mir_dir;
+	enum rotation_angle rot_angle;
+	bool seq_info_obtained;
+	struct sec_axi_info sec_axi;
+	u32 width;
+	u32 height;
+	struct enc_scaler_info scaler;
+	enum chroma_format_idc c_fmt_idc;
+};
+
+struct h264_enc_controls {
+	u32 profile;
+	u32 level;
+	u32 min_qp;
+	u32 max_qp;
+	u32 i_frame_qp;
+	u32 p_frame_qp;
+	u32 b_frame_qp;
+	u32 loop_filter_mode;
+	u32 loop_filter_beta;
+	u32 loop_filter_alpha;
+	u32 _8x8_transform;
+	u32 constrained_intra_prediction;
+	u32 chroma_qp_index_offset;
+	u32 entropy_mode;
+	u32 i_period;
+	u32 vui_sar_enable;
+	u32 vui_sar_idc;
+	u32 vui_ext_sar_width;
+	u32 vui_ext_sar_height;
+	u32 cpb_size;
+};
+
+struct hevc_enc_controls {
+	u32 profile;
+	u32 level;
+	u32 min_qp;
+	u32 max_qp;
+	u32 i_frame_qp;
+	u32 p_frame_qp;
+	u32 b_frame_qp;
+	u32 loop_filter_mode;
+	u32 lf_beta_offset_div2;
+	u32 lf_tc_offset_div2;
+	u32 refresh_type;
+	u32 refresh_period;
+	u32 const_intra_pred;
+	u32 strong_smoothing;
+	u32 tmv_prediction;
+};
+
+struct enc_controls {
+	u32 frame_rate;
+	u32 rotation_angle;
+	u32 mirror_direction;
+	u32 bitrate;
+	u32 bitrate_mode;
+	u32 gop_size;
+	u32 frame_rc_enable;
+	u32 mb_rc_enable;
+	u32 slice_mode;
+	u32 slice_max_mb;
+	u32 prepend_spspps_to_idr;
+	u32 intra_refresh_period;
+	struct h264_enc_controls h264;
+	struct hevc_enc_controls hevc;
+	u32 force_key_frame;
+	u32 frame_skip_mode;
+};
+
 /**
  * struct vpu_irq - VPU interrupt information
  * @status:	Value of the VPU interrupt status
@@ -441,6 +848,7 @@ struct vpu_instance_ops {
  * @src_fmt:		V4L2 pixel format for source
  * @dst_fmt:		V4L2 pixel format for destination
  * @crop:		Crop rectangle
+ * @codec_rect:		Actual encoding rectangle
  * @scaler_info:	Decoder scaler information
  * @colorspace:		V4L2 colorspace
  * @xfer_func:		V4L2 transfer function
@@ -456,6 +864,7 @@ struct vpu_instance_ops {
  * @frame_buf:		Metadata for reference frame buffers
  * @frame_vbuf:		Reference frame buffers
  * @aux_vbuf:		Auxiliary buffers
+ * @ar_vbuf:		Auxiliary AR buffer for encoder
  * @fbc_buf_registered:	Reference frame buffers registration flag
  * @queued_src_buf_num:	number of queued source buffers
  * @queued_dst_buf_num:	number of queued destination buffers
@@ -467,7 +876,9 @@ struct vpu_instance_ops {
  * @next_dst_buf_last:	Next queued CAPTURE buffer is returned as the last one
  * @cbcr_interleave:	CbCr interleave format flag
  * @nv21:		NV21 format flag
+ * @error_recovery:	Error recovery flag
  * @disp_mode:		Display mode for decoder V4L2 control
+ * @enc_ctrls:		Encoder V4L2 control and streaming parameters
  */
 struct vpu_instance {
 	struct list_head list;
@@ -489,6 +900,7 @@ struct vpu_instance {
 	struct v4l2_pix_format_mplane src_fmt;
 	struct v4l2_pix_format_mplane dst_fmt;
 	struct v4l2_rect crop;
+	struct v4l2_rect codec_rect;
 	struct dec_scaler_info scaler_info;
 	enum v4l2_colorspace colorspace;
 	enum v4l2_xfer_func xfer_func;
@@ -503,11 +915,13 @@ struct vpu_instance {
 	enum codec_std std;
 	u32 id;
 	union {
+		struct enc_info enc_info;
 		struct dec_info dec_info;
 	} *codec_info;
 	struct frame_buffer frame_buf[WAVE6_MAX_FBS];
 	struct vpu_buf frame_vbuf[WAVE6_MAX_FBS];
 	struct vpu_buf aux_vbuf[AUX_BUF_TYPE_MAX][WAVE6_MAX_FBS];
+	struct vpu_buf ar_vbuf;
 	bool fbc_buf_registered;
 	u32 queued_src_buf_num;
 	u32 queued_dst_buf_num;
@@ -519,8 +933,10 @@ struct vpu_instance {
 	bool next_dst_buf_last;
 	bool cbcr_interleave;
 	bool nv21;
+	bool error_recovery;
 
 	enum display_mode disp_mode;
+	struct enc_controls enc_ctrls;
 };
 
 void wave6_vpu_writel(struct vpu_core_device *core, u32 addr, u32 data);
@@ -548,4 +964,16 @@ void wave6_vpu_dec_get_bitstream_buffer(struct vpu_instance *inst,
 int wave6_vpu_dec_update_bitstream_buffer(struct vpu_instance *inst, int size);
 int wave6_vpu_dec_flush_instance(struct vpu_instance *inst);
 
+int wave6_vpu_enc_open(struct vpu_instance *inst, struct enc_open_param *enc_op_param);
+int wave6_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res);
+int wave6_vpu_enc_issue_seq_init(struct vpu_instance *inst);
+int wave6_vpu_enc_issue_seq_change(struct vpu_instance *inst, bool *changed);
+int wave6_vpu_enc_complete_seq_init(struct vpu_instance *inst, struct enc_seq_info *info);
+int wave6_vpu_enc_get_aux_buffer_size(struct vpu_instance *inst,
+				      struct aux_buffer_size_info info, u32 *size);
+int wave6_vpu_enc_register_frame_buffer(struct vpu_instance *inst);
+int wave6_vpu_enc_start_one_frame(struct vpu_instance *inst, struct enc_param *param,
+				  u32 *fail_res);
+int wave6_vpu_enc_get_output_info(struct vpu_instance *inst, struct enc_output_info *info);
+
 #endif /* __WAVE6_VPUAPI_H__ */
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
index ef261b5d328c..36daea5d02d1 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
@@ -30,6 +30,17 @@
 #define W6_MAX_DEC_PIC_HEIGHT		4096
 #define W6_DEC_PIC_SIZE_STEP		1
 
+#define W6_DEF_ENC_PIC_WIDTH		416
+#define W6_DEF_ENC_PIC_HEIGHT		240
+#define W6_MIN_ENC_PIC_WIDTH		256
+#define W6_MIN_ENC_PIC_HEIGHT		128
+#define W6_MAX_ENC_PIC_WIDTH		4096
+#define W6_MAX_ENC_PIC_HEIGHT		4096
+#define W6_ENC_PIC_SIZE_STEP		8
+#define W6_ENC_CROP_X_POS_STEP		32
+#define W6_ENC_CROP_Y_POS_STEP		8
+#define W6_ENC_CROP_STEP		2
+
 #define W6_VPU_POLL_DELAY_US		10
 #define W6_VPU_POLL_TIMEOUT		300000
 #define W6_BOOT_WAIT_TIMEOUT		10000
@@ -38,13 +49,16 @@
 
 #define HOST_ENDIAN			VDI_128BIT_LITTLE_ENDIAN
 #define VPU_STREAM_ENDIAN		HOST_ENDIAN
+#define VPU_USER_DATA_ENDIAN		HOST_ENDIAN
 #define VPU_SOURCE_ENDIAN		HOST_ENDIAN
 
 #define W6_MAX_REMAP_PAGE_SIZE		(1024 * 1024)
+#define W6_ARBUF_SIZE			(1024)
 #define W6_MAX_CODE_BUF_SIZE		(4 * 1024 * 1024)
 #define W6_CODE_BUF_SIZE		(1 * 1024 * 1024)
 #define W6_EXTRA_CODE_BUF_SIZE		(256 * 1024)
 #define W6_TEMPBUF_SIZE			(3 * 1024 * 1024)
+#define W627ENC_WORKBUF_SIZE		(512 * 1024)
 #define W637DEC_WORKBUF_SIZE		(2 * 512 * 1024)
 #define W637DEC_WORKBUF_SIZE_FOR_CQ	(3 * 512 * 1024)
 
-- 
2.41.0.windows.3

