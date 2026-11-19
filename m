Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.110
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078843;
	b=X74WhTCGVvVD+tt7OujIDJxNkcngvZ2o8lCQuapI7UgTgjNJqrUdvTA+zp6bmllj1I19
	 RRRXT45uNLES5qms3PwSloeXWJYFZjZhdvZGan8dgBc3f3uEx7TKCq+Bg+6hM35wuiAg8
	 3wHn1uykxVqwlyp/dOtrOrvwqmEa2FyJJzIm8E/WprvUpFC8MkSwUv3RhAE6VJYT/tshx
	 HEUNLzTa6mzfrbkStpbut8XjCwoFFagarySoUzreO/8Uw5Xy5JgLev2pgZXWbUN79Sq6I
	 kRPNsGdDh1BX7IRNMz4D4dWJqidXFfT7ajIEyrFi3KrDmVqJl/ZWqnvjty06PucR1Eg==
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
	bh=ooGTyD9cINo1BOVzIujOSh7E6nNjykPa/1JHAv8torE=;
	b=P3XNRigooE5WBVDdyAE19YwnWWxn/5LQxEFxMb5fkAkOebM6NzfuMdqUCOHyFsk65F1Y
	 zKGIEArAwYGBq5Gky6T8W8RWqNSF5KYivUA2eEbdxXzwN/2+YAz3J0RNIcOI4ttX8KBB8
	 rQEWez7yItNj6mmasI1ATdLGYilTXYGG3JeMnW6xnopX8uiFdtWKL9TOG67ZvZ569AUEv
	 7pdSVWhJiEKb7iysycbrMOYnf3wbQotqRApZVeHGuf8/Sc/7WRy2d/GMqoRchkbyDpVK4
	 Y69rjw3fZ/FcXhpBQVjZ1t1bmSuaQcdrTiCea4BjcwrM+jn6ym5lvyWw6p8nTlHUP1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=Mt6PUEQa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.110
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021110.outbound.protection.outlook.com [40.107.42.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D9860A2638
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 09:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58D9860A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=Mt6PUEQa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sU+omZFJyuvKmgP8GGc2ihyqS17IV14xBAFCjARtz2EDQwwVUK4zOw9DyO9Z9xlihxoQbWH+5DNhfwupVjcMBJoKpSL34Ih1pJftpx8v9NOiY1uwSPi0+lnKMNXSAqSsvbGn71tJOqlJ5Mjbq1NlQo+aAvf0DgKoLRlGQd7XQCraQ2cv8mlyb7XddqfZNqWzlSIHU+I1h4Z8bcDjAXhOe032394q9IPhSuxQkleXeWGSjp5lWVt0roWDi3+1xGU0GHDHEzWs7lqzQjNHdVZDJX2gtLWwOlQ8XLwpI4OX/yucTBJYjfkcNAt1Xp5lYxgS4ezxD8VVhSnzrlu9XXOOQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooGTyD9cINo1BOVzIujOSh7E6nNjykPa/1JHAv8torE=;
 b=GwlGco1PD6DZUe/iwXWGLCcQPpIIiar/xkRlGr84FqV7B/shZxhGZvMqLymv0IL5eNlXWGmr1HESipEDYqap/V56gFLAfo1Nm42KzwZqhPADoAkTYBVv5M7vXk6DgbIOgYJH08dcpCQfLB5b6S4ikAyM0gs8vURkdsPcWDr3Y1/kGsFQGzxtpHRJA/WhlyniFLQ2AswB7LBqRWv3EtTfghLiYOuiTVE558pF4kdOHN/tTaqCJOfPUCL6wiw42S8MDa32rQcpl2QTf39ZnVniWNnP9rN5nZ78VuvgZL9X9dIrvZFQZC1fyk8S+vtcU1Gjg8e2PAdQhTa5O0bipJP7oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooGTyD9cINo1BOVzIujOSh7E6nNjykPa/1JHAv8torE=;
 b=Mt6PUEQaR0umgPo5xyXz6IZqVqChhTTfBWD48Nmb0BMZXKcYnnotD7cfGV7U3PmtB/LvMJGXNFDFN04+/N1qw7WsP3Sks/Cm6//fMT2rvA1Q4073vL1dzpD8uLOeYDOMVw1y6UwetzHWJn+QVCBpJaULKFXEOzEM4wmbesM9OQWlQzA5U+szP+SuO0P48oscxxFbNDiAi2o+knyCXaXNDw8/RIVl1hKibiZwsDdJMOg2MYLPmsBS1e+bgzF84KKChHdp6fpfIrMhNsoDOUGkSVltKphS74GYgYyYMOAOJw8ktgQHZBDvmGC5WhnkPY4gzwVIou6Ch8MoRICsXk2f2Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SL2P216MB1466.KORP216.PROD.OUTLOOK.COM (2603:1096:101:33::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 09:00:31 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 09:00:31 +0000
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
Subject: [PATCH v8 11/11] arm64: dts: freescale: imx95: Add video codec node
Date: Thu, 19 Nov 2026 18:00:05 +0900
Message-Id: <e89f330486c8b986088278b563d0c4364d35f19b.1795075582.git.nas.chung@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8c2b7006-8baa-4685-be0b-08df461b9079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|52116014|376014|1800799024|366016|22082099003|18002099003|56012099006|10067099003|261026140227099003|261026121527099003|261028144727099003|261022105027099003|261021121427099003|261009223027099003|261102123227099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	yIdp84kEqcNCVbAxJfjYUceWEGJNKkYkXSUCVq2+rlzvArnBU9qoeiLTwrVUpeLjH0cKDVqbmIc8Ua4vv7wrXjFZn95xI9GpWMiNnhjwb6zF3b2r2JLe1aJxTaVe2KIuny3V//7t70R993tF0wcaJEmaXmOshKSc3hGrRp0qpCyB/x4w352MzU7i0ol2eq5c/eSPcQn11yQM8N2HThZappU0mf4p3eKUTe0tdEDXKDyBg07SwfSxubj5c71PYYKuIhA75dCY9zD0Pppjkit2fyK/zilnrlSoGm8Gkfwa1qoOjMooKWlx/bi813itsdhPrq6a2YC3WYqUmD0Ok2QoOv+DOr6TdkrOjSn6fFBvbuFV7z1aYu55VqWLOmBXHaJfm6F7f8PRn+sXmS25REaNITL9j8oP4G0Cza/ZL/UNjUdUgU/qSNwFV64tX/ptbRSXX2FtfwAdkvkCW5Wx5NCCSi+Mz7eNsc0fXnrgGsZEivNTVVwhOr/pydgk01DgFUzwxQ4dQNzG9h4OoUOoeZCq+5+a/5MH6aUCfVihSBGavozeaIWijCuNh6lNT8wwxlUL05UQg7x6bhCHu+92uB57rY7Lbgqn+Fn6TP/pnpK5I/uYN6tzTTLO7vwc0niF3wLvzmv9rvS5cp9PQxZWuiQXGkVUbVcI4qagxYc6d8Gq5j1A0e3XxPj9qlG43l5eFnmCBVWyq56B4SpIIhrwSbn+8Shlmez6mr2HHYa0SyF1ejU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(52116014)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099006)(10067099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261021121427099003)(261009223027099003)(261102123227099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/g3BOJk7x0QKG5KAyLsiL0v8i3z5htUGYdvvHz2d19HVsWW0Aer2BzVM3GjI?=
 =?us-ascii?Q?nUUuTTiqRP9AwgA16UpsWwZ7bWe0pRWbIaFQviW0PNKTqOY34ZUeyM5L9xHQ?=
 =?us-ascii?Q?wFCK/jh0wt4QSHp67GxfPpE9Cfya1q9BqdePlBkIn/+EOscls+wxdRnWVlF3?=
 =?us-ascii?Q?NU60BivWpMNdpAq+obPE4RNEFYOAh9+kOGSaGBHAOkV55t9kP6ONyOdk4Hi1?=
 =?us-ascii?Q?0Z6SGwIcCqSdAP37bmMzkH/3qW5C2c3VRSiysBaEfGeei5r+P1socWVN5mVx?=
 =?us-ascii?Q?lzAKF8sAjBvqz6LEYt9cesWv15SgMmKIFPfCKu8B8Ox90a0iLhkJ5TXcZcwf?=
 =?us-ascii?Q?mGTWQh8Ip6QfGLuZ+l4sH++YBk0BN5Ljczsb+fGWre58U49YVT2zfcs8a25T?=
 =?us-ascii?Q?URHyklXdA2SCqWeD2CHBl9uiBlp89Z+G1D21+MUQDDg79fvZeJLFy4SkufrB?=
 =?us-ascii?Q?6T/2Rr0SWDlgEd9juiP3sH15DqJvNA+OEUyCHH984SXJqDmpB1+fqoGl/YhD?=
 =?us-ascii?Q?ju1dQMkcHcgZxA+zgfCffXkUI7PgwBWYbxtldsVxfJk/ENujU0G+d0N2NuhK?=
 =?us-ascii?Q?8Bi+IF1V+Fn4qhYVNWY3kBe5n8LbbbhZ9TOGGBUkjSQcQ4iVOTJz+LuGeNLl?=
 =?us-ascii?Q?w/9CevJhrYc9J34/8c89wKBgkXhWFi2cP68Saja8LqNaYKcLmTJEHUzLojUt?=
 =?us-ascii?Q?bKEn/FzBGRPtT5hZuqB7GYkEJvC1aSGQ+pUqwH6AZiJrAxBSJODoJr9WKZWV?=
 =?us-ascii?Q?N0fJjHagbYm3xG296HFpxddu6GTVo1vyKj9q3eqZgmpmV90EM0GSkv0v4Bxz?=
 =?us-ascii?Q?zjgsCZUVx3KrrFMNGqfXF9FvdVAAyOCtTZliISC3kEYqWEyrMATYsvBMVTl5?=
 =?us-ascii?Q?6Cvf7fnX5lm0A6v5SxdTaQAUWBnuoQJF4qgeBJYzt5jBXYXSN0HSGxzShDoH?=
 =?us-ascii?Q?XR31omkH9mI7Z6894BK3whaWSVr1wjelxnOuoa1Q3gX/Jsn2oW4WP5xE5F4v?=
 =?us-ascii?Q?wJS3UPVy4Yl0h+JUfhruMFRB98igbZgYhAtHD/VTUY/G3G5YH23cVlA3LZ2A?=
 =?us-ascii?Q?o6pT9TLzL1bCjEa5spZfTMwPHUFY4fql2ELNI58YXqVYfbM37ayMiRfH5s1Y?=
 =?us-ascii?Q?+4Gl/30sqNnTsex5Av3zYflqQB05jRFeEf9p8h7bri7KFh5As0GBJ3yn7NX4?=
 =?us-ascii?Q?yQor81eYRoYJlP/0PyA0Ytzt+EtbRERvpFXOem+793kkuGzqXHXMgYJlbu3e?=
 =?us-ascii?Q?yQJMscSgxeZJAU1lgj47MI+hSPc37UkTL2Y+5Vy8YBGEz1CxlhN8OBALv/1F?=
 =?us-ascii?Q?2tthvCn+Us1Wi8YRYaA0RCpzXEC1BKpUdFa2DO8A/d7vpyQ8HXzlZvA8ImTb?=
 =?us-ascii?Q?a5fyJA1gtLdnPdujxlvnFVzJjKMoIydQVoK6wKGYuv9VjOReWhmxvhEI+rz/?=
 =?us-ascii?Q?/i0lfG/rtcz8xRMW9usJ7KzJ6uBkJmveOcPlET15+NzHqQZK/gKrp+J0Eypr?=
 =?us-ascii?Q?Z+E97gEQ0FZnyRWMvx2gVH9YfKDlHXNGvpKsilVe1ybLLsSfp0Vj/T2n3Toi?=
 =?us-ascii?Q?QP0lLs8uCK4glrnPMb+hGJRx8V1BzVZ68S34jzV8loPbRHpcENORXXuZSnkR?=
 =?us-ascii?Q?/0Y8feH7C9JSina6YyDPSBwthJ5iCPdFv81mOl9As8+TNbUUSOnETPXFnW9m?=
 =?us-ascii?Q?5UZWSffWTfamvbxDALUscO4iY2OVOySQ8DnFTyoiSZLrRUfxRc8OBjVQNsj5?=
 =?us-ascii?Q?opQsJyETDB/3F87yTo1rnCYDFFJfW6I=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2b7006-8baa-4685-be0b-08df461b9079
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:00:31.2773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: En41O5uiH/FdLm9aAielNyWF2BXgH4OrBx0N9Ov6BM1talq7JoLX7LHQcdW5EaL69gNIpcvo2lMv8Qxqs4YUvEf6Evaq9cWBIRaktW+LzeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1466

Add the Chips and Media wave633 video codec node on IMX95 SoCs.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 10 +++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 37 +++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 47ed0ef67611..a15d5b471708 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -143,6 +143,11 @@ vdev0buffer: vdev0buffer@88020000 {
 			reg = <0 0x88020000 0 0x100000>;
 			no-map;
 		};
+
+		vpu_boot: memory@a0000000 {
+			reg = <0 0xa0000000 0 0x100000>;
+			no-map;
+		};
 	};
 
 	flexcan1_phy: can-phy0 {
@@ -1225,3 +1230,8 @@ &tpm6 {
 	pinctrl-0 = <&pinctrl_tpm6>;
 	status = "okay";
 };
+
+&vpu {
+	memory-region = <&vpu_boot>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index d20c2498b9aa..b6323e527ab7 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -2139,6 +2139,43 @@ vpu_blk_ctrl: clock-controller@4c410000 {
 			assigned-clock-rates = <133333333>, <667000000>, <500000000>;
 		};
 
+		vpu: video-codec@4c4c0000 {
+			compatible = "nxp,imx95-vpu";
+			reg = <0x0 0x4c4c0000 0x0 0x10000>;
+			clocks = <&scmi_clk IMX95_CLK_VPU>,
+				 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
+			clock-names = "core", "vpublk";
+			power-domains = <&scmi_devpd IMX95_PD_VPU>,
+					<&scmi_perf IMX95_PERF_VPU>;
+			power-domain-names = "vpu", "perf";
+			sram = <&sram1>;
+			#cooling-cells = <2>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			interface@4c480000 {
+				reg = <0x0 0x4c480000 0x0 0x10000>;
+				interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			interface@4c490000 {
+				reg = <0x0 0x4c490000 0x0 0x10000>;
+				interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			interface@4c4a0000 {
+				reg = <0x0 0x4c4a0000 0x0 0x10000>;
+				interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			interface@4c4b0000 {
+				reg = <0x0 0x4c4b0000 0x0 0x10000>;
+				interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		jpegdec: jpegdec@4c500000 {
 			compatible = "nxp,imx95-jpgdec", "nxp,imx8qxp-jpgdec";
 			reg = <0x0 0x4C500000 0x0 0x00050000>;
-- 
2.41.0.windows.3

