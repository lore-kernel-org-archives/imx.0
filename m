Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.110
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078843;
	b=E4wf5ApGPk/j6c3RtIoW29VrZ20wePoRCaiqve0Cm6N/fmDxRHviz7ltjjHO6XzhLlYZ
	 zEFKgxfrDdU7SvU49s3HQRt17SgF3sVhHtqTIdDSWkbdwq3lS/aEZkcXLkd4lOFQQDIbA
	 8WwlhaXtXjaaxMGi9hme19A9rqze45VmDTgrJcf2Ym33X3/TdwcuzC1pie9yFREMw/zue
	 lCqrl+3X17bW8MZIDw57XrbYIvqjT8pkAD3WCPSf5nw946CPSkkXpmkdb04KK6wnK536h
	 ZYbAEwPut6+bCH5iREUOtk0IIc4B3ovzWLpWJyzXcY87wNUYUhqy0ilzusqIG39+Tew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078843;
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
	bh=pMxlAoiDVJkoCabVFzq4uMr7hDSFZvl8gyKly7NpW8Y=;
	b=ZGcjfHkvHcx8B2B4xUthCcSEUaUsbMEjQ+XqZLgyqzpa6imNfwwUarA5WjZ3fytVMKuL
	 peMUMWTcN7TOcB9MPO7OSW6ng/zr9eRzh41yzBBP5j6nQtsX3c6IRW+I8SVykxDSaTF2X
	 jgfYSv8iSjXtPaB3bj6h5WnkdIGtH20AMToCYw+WDuPPmGePbPe4kzomNXS3AB8DWH+lA
	 noyZieN6uEue42mubAI1htP2afyDvAZa/yNco58Fua5+dwARjpwPXVYcTqkRfdDdk2UMw
	 jLyiYbhJt0S5LCfPbYtHOlFqDh7y1xcAUL838GKMohJ184oEa7zRBtEQ10iFyX/7T5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b="M4czXHl/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.110
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021110.outbound.protection.outlook.com [40.107.42.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A8860A5BDE
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 09:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80A8860A5BDE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=M4czXHl/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbtrDczWu3Iq3TQEjolCz93HOYPJVKY/MV7xSxqCTHDlXFjyNt12T3EMD+wVjeve1VPsKbhUfsNyjdzfSPv8XAGi+wDlgbcIV0qoMo8Lj2PelJgxdYU9bK20Bufxoulk9Tl9ITX2lKjFWwoXTkW+MBQRN9xqE5T/t2fPoa25c/MmT6EAYyBMwb8go0xMqQ92WyOQe0PfLjUzC9bkecZlKDjGwCFNZQmYpiqjksGhwkmE3MSISGrUkm+iH8bw8ckgidynY7ls8pgLt2oNyvdm908mbUysYOSsDVdHaczS5AWmdNyW4+/WDdFJQ1B4VxDh3pcWWlOsNLBpSZkHqOIOgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMxlAoiDVJkoCabVFzq4uMr7hDSFZvl8gyKly7NpW8Y=;
 b=HtiKnusa5l8iq8P7BNGJFqtWmaDPQe4GKc06ADSAHcPFdLPmDFivm+TpTHR8kac1/yTnyXsnn6Fmw/WhXgrgTmF9/ShqL7aGK75Ps9vAmmOkIPSY4g0+SKhAvQzxg/SOHpBjUTUuVipifHuqwI+J2+yU8hQ1d012ItIUtucfUesUqHbZiuz8wvf1WCENNn1QrcB8R/hBh2qf0OQSG8sSa9gHxPhJ7fRvSu6ezQFBYse+AWYkYZOBjPHEAgFNTMS2RNaeWz6JrQYwbS+vOOGpf1A8CpcrYLq1UDZgxw5DmDN23FSM1yYpIxdLGtHuSCMRJp+LNMufIcUhdazGul5Q7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMxlAoiDVJkoCabVFzq4uMr7hDSFZvl8gyKly7NpW8Y=;
 b=M4czXHl/D4zFLNFSHr5+PrU73iYbVHHz3y859X8Kd8JAJVZjRxFB1GY0u9c43/RR0euepuXnSllq9nfH+xmga7CM8nJzB5qaNJEYIXPIlN5q2nbs2PU33iIo+ppGrTmRECR94CrhYTExzaqCF2cv28cAfwbsnkXBagvqyUNyskoBKNytXzFXcPxSssbme2vCofH7XWMoA23ePvpSH5pLuemzLW5JuLLWF30WJqyjuKxFVHeJgeNPToAZj08reRs0xm+eAN1D7zsoCm5lEpLudyhnRc6KVbDaN11Oq42sNcM1IU3341Zm4Rc2AEcLL7IcTr4A3XWXYInkJFQ++oQZ1w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SL2P216MB1466.KORP216.PROD.OUTLOOK.COM (2603:1096:101:33::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 09:00:30 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 09:00:30 +0000
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
Subject: [PATCH v8 10/11] media: chips-media: wave6: Add Wave6 thermal cooling device
Date: Thu, 19 Nov 2026 18:00:04 +0900
Message-Id: <d973e48036b43e9f1e5fc254153303a4c21deebb.1795075582.git.nas.chung@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 559877b9-fae0-4bde-6623-08df461b8fbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|52116014|376014|1800799024|366016|22082099003|18002099003|56012099006|10067099003|261026140227099003|261026121527099003|261028144727099003|261022105027099003|261021121427099003|261009223027099003|261102123227099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	bd3l0gaUT1invYPT7aZBSdXBnK85eu9/+FdxVX+t5BvRboufjbSXks/Hx/P91buYlAnvElRToJtt2VNP9vEXhnHoeE1DtfnYZ3ch4ixT3zcP9xHiTEe5iWp68vQCJo2bdHkFUvu0vyGYu70rBymvAU8JsnNGKSxlYmnOheETROV4OWcIWDouUfoOQBmhNIWNtfDC0kU5Xlg73wxNKboptZ9+456ihSyzqhf9kh/2aO+KNoAIFgOdK9c9YKSDB0u0CtZoSv2xxlI+WrCsMFG+OCmF7L5x3cBkK8d6s0+mP0ID8DUbIpLPMIcIEwRazEFULGZYv+OLsY/PLvq1pq3yUtWGaZAo8Wt9OaGVWz6OWdZj0tXHpq7ie3tue3qgGA31iSo6VgNO7WBl104xeVltY2nuBC3TOZqp7vDVQZ7XyxNx6g9nXC5edNZ2oeeZXCRx3+ONgIiDuBcWaq4pmT8Hvth1MHediyqUkjBxre7nQb53WSvqeO33bKYebf7hdIesmP2kXdsiQg7ArZhxvOKYQ3gYl5C7mB7HhakbyuAjJ+GRmHO/u9wve+bIu3uPLScpiTNk/DjmcQJwZKLPefN8r1x5BKMINJlZRHHPXrY2iMIqBw/6uUJzclMVtExWZPbMIokDfvyyLV3SJ4MggpyRbE0ZzDq/JZJ4/oYQsjfSySBtVUSBkdpaP3gP8pMpRd52T8gfbdWyPzO52iIc+DYNSSCOOWPlFJjwekqggmSl1Fo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(52116014)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099006)(10067099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261021121427099003)(261009223027099003)(261102123227099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DcmjjV6RqTgnCKA/l6a3onFBEdXsfDegBSjXL5OPaXpnIYv+TnBc8kEumwCZ?=
 =?us-ascii?Q?wsG7MDGXuUfHh9HKwjBQZP0yF+/wtFcDy8SDY6hpsGM3a2SzEIX5c9a+kBS+?=
 =?us-ascii?Q?RfezxryDeKi+VQlxKa6J5Oi0FR7MfLfcuQNBSPWLeM1Gl+9AVrczVz2PMlVR?=
 =?us-ascii?Q?2M7Y8bP2uHYWIGKGTc8+gZq9WDXCR3HhcBYx4+rcs0oD5jok6XGp9SxVCqKl?=
 =?us-ascii?Q?OkdETTIYFrmPU3Tf2orFhnuiD0IUF6EGlz/pDQ71/pEnV4w2L//fj4QeYc6q?=
 =?us-ascii?Q?b2WsZnYkZhKEOKQCW6T00dUPqHBkx7i9cA8K/zDKkM6XP/hmdTWPeYBzl5N6?=
 =?us-ascii?Q?WP/ZCsdIeGTrqZVs7um43MqIVvBg+rpLV+RX1L/DkaXuiq29jeKDjlB/ty+i?=
 =?us-ascii?Q?dVuaUSeG9sk80GD3iNznU4Ul1IsQz5rYe0Tmbzko5Nki9qOukhTFqQGB88xf?=
 =?us-ascii?Q?gY8xo8eeob3BIdJN+XnuHzB7BaV777bfdwleDFohUFsyHOzNpfenFXIZ8V1Q?=
 =?us-ascii?Q?CPO9y6cO/ZE/0kq5zNsb9zA0EbTHY5jATzkrB4VzmLnQ+WDHHKVhYn6g7WI9?=
 =?us-ascii?Q?/SmR2oI7g5CupD9JHMqAtMg4B8+e1Cp6hE52RHNrxniXMu7c7/YcAc70p9yy?=
 =?us-ascii?Q?6ZvU03pSsz39sNEAbjKo7hWJPSH22vO7PQp7ZHgoZvG/5Ra2k7QEzqGTvqv8?=
 =?us-ascii?Q?po/tTgSyj75Okby7BhQuRwMtOjIFPWL843oHT74qOU0RI4dgfLMsC0ssi98q?=
 =?us-ascii?Q?9kp7sGYtpaYvMckxxgWzbEuXgFMVQfOp672a56u+EEU1/l9zXUvKHmvdMR9r?=
 =?us-ascii?Q?W8LfcNy3b0q2K7Kfv1Tt9SKCvLDybUB1g+Fq6OLz3J+SK1+FXM1AoFrNX20o?=
 =?us-ascii?Q?z7fzW5QBH/HBI7Lj/tgXjPtSo3s4DgTP1ZHYm81WgBzTfBCpwUAzHhRdJSKV?=
 =?us-ascii?Q?ZNVpiaZaWeMejnYo3PtsKWVtCN6gT5RzxHOR73agcXz0iY8WKPP5lbpSB7ru?=
 =?us-ascii?Q?LC2jF8XBSCrdImuOfIaZ7P/42eRZzfpQJ1qb0420Xt0V3szL1/kgxOEQ4g+Y?=
 =?us-ascii?Q?cSSG+0Bd8PBqWvGAZZB54kLj5t8GdgpMK8BahwP5af4yeFC+s1ROYAqxDxUO?=
 =?us-ascii?Q?wyJ4JSir0ZylIAPq27VPCx1YzrhZiCkZfOiEZjeCKvKe3QfEalUAdd/hFB5M?=
 =?us-ascii?Q?z+jF4fgpbN1/0X0A/6769+o8UNIgxwft+C8LdMXwrHNcvYZadGdewzzz76BM?=
 =?us-ascii?Q?5rvJopyLjNMpczZKrWFPSa9F7gptMZOZ+8S1GVZUizcJa8AVT53WFxnIIl+Q?=
 =?us-ascii?Q?3XNj3JqtHFtIMwQNweTOg+Xvw/MybU1rPMV/cT2IqOcDU4VXDaPxmQ/qweMs?=
 =?us-ascii?Q?u5A2EE8yJTYh/t71jFDUTqzg0OWZJ7CzQgdQRByHQ+J2II54GOIPkAWd4A8M?=
 =?us-ascii?Q?yz/HT7y6ZDa7ZXYE7aV7PEVE9+g0pSZW5HPNYRjOgLU+1U5A6RrkVBo+PY9o?=
 =?us-ascii?Q?/IC3jTZnrfv6ihgR7Z1qohCvjOCZrbJ5Ee07FbtSb4D9H02PXu+NEpcaKP8y?=
 =?us-ascii?Q?bHcYNJxpXkMUS/faoD2vlxF4KK6b1NPy6RO6asM4k0OCALBF1LVW+TJhaiAu?=
 =?us-ascii?Q?uXndimqgbLzhvf0l/sB72DAy3mdX7VWug3G9Eh8b6SshVYBcjzXbrf3dxJq8?=
 =?us-ascii?Q?QfVs+71RKPi5QSbkUei0SR15Xr39EG5sYL+Vj+tOpwzZESaujdBXfWyL+yMU?=
 =?us-ascii?Q?zIbcOkGGYFhZcsnwV6AqvztD8BNXo5w=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 559877b9-fae0-4bde-6623-08df461b8fbe
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:00:30.1202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0dho74f5gUhJeLGRrkg7vsvc/FjLalHrZ5HIK1o3Xw34+mM7Cr+r/VLdLNKBJSWmEBQWgEM5+QcfpRLvAwis7VR5dojL70dAGgtZ6nQUKgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1466

Add a thermal cooling device for the Wave6 VPU, so the thermal
framework can lower the VPU performance state when the SoC gets hot.

The control driver registers the cooling device on its device tree
node. The cooling states are built from the OPP table of the "perf"
power domain.

Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../media/platform/chips-media/wave6/Makefile |   1 +
 .../chips-media/wave6/wave6-vpu-thermal.c     | 141 ++++++++++++++++++
 .../chips-media/wave6/wave6-vpu-thermal.h     |  24 +++
 .../platform/chips-media/wave6/wave6-vpu.c    |  22 +++
 .../platform/chips-media/wave6/wave6-vpu.h    |   3 +
 5 files changed, 191 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h

diff --git a/drivers/media/platform/chips-media/wave6/Makefile b/drivers/media/platform/chips-media/wave6/Makefile
index 426af279af6f..4bdf51c58f46 100644
--- a/drivers/media/platform/chips-media/wave6/Makefile
+++ b/drivers/media/platform/chips-media/wave6/Makefile
@@ -4,6 +4,7 @@
 CFLAGS_wave6-vpu-core.o := -I$(src)
 
 wave6-objs += wave6-vpu.o \
+	      wave6-vpu-thermal.o \
 	      wave6-vpu-core.o \
 	      wave6-vpu-v4l2.o \
 	      wave6-vpu-dbg.o \
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
new file mode 100644
index 000000000000..3e21c7edb9e9
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 thermal cooling interface
+ *
+ * Copyright (C) 2026 CHIPS&MEDIA INC
+ *
+ */
+
+#include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
+#include <linux/units.h>
+
+#include "wave6-vpu-thermal.h"
+
+static int wave6_vpu_thermal_cooling_update(struct vpu_thermal_cooling *thermal,
+					    int state)
+{
+	unsigned int level;
+	int ret;
+
+	level = thermal->level_table[state];
+	dev_dbg(thermal->dev, "receive cooling state: %d, new perf level %u\n",
+		state, level);
+
+	ret = dev_pm_genpd_set_performance_state(thermal->dev, level);
+	if (ret) {
+		dev_err(thermal->dev, "failed to set perf to %u, ret = %d\n",
+			level, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_cooling_get_max_state(struct thermal_cooling_device *cdev,
+					   unsigned long *state)
+{
+	struct vpu_thermal_cooling *thermal = cdev->devdata;
+
+	*state = thermal->thermal_max;
+
+	return 0;
+}
+
+static int wave6_vpu_cooling_get_cur_state(struct thermal_cooling_device *cdev,
+					   unsigned long *state)
+{
+	struct vpu_thermal_cooling *thermal = cdev->devdata;
+
+	*state = thermal->thermal_event;
+
+	return 0;
+}
+
+static int wave6_vpu_cooling_set_cur_state(struct thermal_cooling_device *cdev,
+					   unsigned long state)
+{
+	struct vpu_thermal_cooling *thermal = cdev->devdata;
+	int ret;
+
+	ret = wave6_vpu_thermal_cooling_update(thermal, state);
+	if (ret)
+		return ret;
+
+	thermal->thermal_event = state;
+
+	return 0;
+}
+
+static const struct thermal_cooling_device_ops wave6_cooling_ops = {
+	.get_max_state = wave6_vpu_cooling_get_max_state,
+	.get_cur_state = wave6_vpu_cooling_get_cur_state,
+	.set_cur_state = wave6_vpu_cooling_set_cur_state,
+};
+
+int wave6_vpu_cooling_init(struct device *dev, struct vpu_thermal_cooling *thermal)
+{
+	int num_opps;
+	unsigned long freq = ULONG_MAX;
+	int ret = -EINVAL;
+
+	if (WARN_ON(!thermal || !thermal->dev))
+		return -EINVAL;
+
+	num_opps = dev_pm_opp_get_opp_count(thermal->dev);
+	if (num_opps < 0) {
+		dev_err(thermal->dev, "fail to get pm opp count, ret = %d\n", num_opps);
+		return num_opps;
+	}
+	if (num_opps == 0) {
+		dev_err(thermal->dev, "no OPP entries found\n");
+		return -ENODEV;
+	}
+
+	thermal->level_table = devm_kcalloc(dev, num_opps,
+					    sizeof(*thermal->level_table),
+					    GFP_KERNEL);
+	if (!thermal->level_table) {
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	for (int i = 0; i < num_opps; i++, freq--) {
+		struct dev_pm_opp *opp;
+		unsigned int level;
+
+		opp = dev_pm_opp_find_freq_floor(thermal->dev, &freq);
+		if (IS_ERR(opp))
+			break;
+
+		level = dev_pm_opp_get_level(opp);
+		dev_pm_opp_put(opp);
+
+		dev_dbg(thermal->dev, "[%d] = %lu, level %u\n", i, freq, level);
+		if (freq < 100 * HZ_PER_MHZ)
+			break;
+
+		thermal->level_table[i] = level;
+		thermal->thermal_max = i;
+	}
+
+	if (!thermal->thermal_max)
+		goto error;
+
+	thermal->thermal_event = 0;
+	thermal->cooling = devm_thermal_of_child_cooling_device_register(dev,
+									 dev->of_node,
+									 dev_name(thermal->dev),
+									 thermal,
+									 &wave6_cooling_ops);
+	if (IS_ERR(thermal->cooling)) {
+		dev_err(thermal->dev, "register cooling device failed\n");
+		ret = PTR_ERR(thermal->cooling);
+		goto error;
+	}
+
+	return 0;
+
+error:
+	return ret;
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h
new file mode 100644
index 000000000000..35377a104aca
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 thermal cooling interface
+ *
+ * Copyright (C) 2026 CHIPS&MEDIA INC
+ *
+ */
+
+#ifndef __WAVE6_VPU_THERMAL_H__
+#define __WAVE6_VPU_THERMAL_H__
+
+#include <linux/thermal.h>
+
+struct vpu_thermal_cooling {
+	struct device *dev;
+	int thermal_event;
+	int thermal_max;
+	struct thermal_cooling_device *cooling;
+	unsigned int *level_table;
+};
+
+int wave6_vpu_cooling_init(struct device *dev, struct vpu_thermal_cooling *thermal);
+
+#endif /* __WAVE6_VPU_THERMAL_H__ */
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.c b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
index 54a6567bc64a..3e8cd67e0d71 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpu.c
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
@@ -613,6 +613,21 @@ static int wave6_vpu_attach_pm_domains(struct wave6_vpu_device *vpu)
 	return 0;
 }
 
+static struct device *wave6_vpu_get_performance_dev(struct wave6_vpu_device *vpu)
+{
+	int index;
+
+	if (!vpu->num_pm_domains)
+		return vpu->dev;
+
+	index = of_property_match_string(vpu->dev->of_node,
+					 "power-domain-names", "perf");
+	if (index < 0 || index >= vpu->num_pm_domains)
+		return NULL;
+
+	return vpu->pd_list->pd_devs[index];
+}
+
 static int wave6_vpu_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
@@ -696,6 +711,13 @@ static int wave6_vpu_probe(struct platform_device *pdev)
 		}
 	}
 
+	vpu->thermal.dev = wave6_vpu_get_performance_dev(vpu);
+	if (vpu->thermal.dev) {
+		ret = wave6_vpu_cooling_init(vpu->dev, &vpu->thermal);
+		if (ret)
+			dev_err(&pdev->dev, "failed to initialize thermal cooling, %d\n", ret);
+	}
+
 	wave6_vpu_allocate_work_buffers(vpu);
 
 	pm_runtime_enable(&pdev->dev);
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.h b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
index 35a1d9f8a003..64e71a8ae597 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpu.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
@@ -12,6 +12,7 @@
 #include <linux/device.h>
 
 #include "wave6-vpuconfig.h"
+#include "wave6-vpu-thermal.h"
 #include "wave6-vdi.h"
 
 #define WAVE6_VPU_PLATFORM_DRIVER_NAME "wave6-vpu"
@@ -93,6 +94,7 @@ struct wave6_vpu_core_resource {
  * @work_buffers:	Array of work buffers
  * @work_buffers_alloc:	Number of allocated work buffers
  * @work_buffers_avail:	Number of available work buffers
+ * @thermal:		Thermal cooling device
  * @core_count:		Number of VPU cores holding a wave6_vpu_get() reference
  * @num_pm_domains:	Number of attached power domains
  * @pd_list:		List of attached power domains
@@ -121,6 +123,7 @@ struct wave6_vpu_device {
 	u32 work_buffers_alloc;
 	u32 work_buffers_avail;
 
+	struct vpu_thermal_cooling thermal;
 	atomic_t core_count;
 
 	int num_pm_domains;
-- 
2.41.0.windows.3

