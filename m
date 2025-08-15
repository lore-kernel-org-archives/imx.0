Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013023.outbound.protection.outlook.com [52.101.83.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6916322A7F1
	for <imx@lists.linux.dev>; Fri, 15 Aug 2025 09:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755251299; cv=fail; b=nsA8zREM3JnaQViX40ujx7tHbeSVX2539I+fheRsXOFtFQ9+14ShiSd8EBL/lVMHLE/Xb7EE7bnIvWtJNpTdL/yTbqIF27B+9crvuD19068rjuS7cuKaCG+A2t1TPiJRvzPpCyH/4FH/agXxOsu6wUJcjhkI6ZdYc/4Ld+Jk2fY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755251299; c=relaxed/simple;
	bh=D+kbuaGZ0TeJS2Y4TVbf15/qAInKgr1ElaLBIHzUuOI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sjYQscDeBlPXzqVOLm+9PjgQJ20Dfn0xQodc8tba1C6Yj9FMUEUNhvTlNx1Gge//QfP6Qt5KVoIh7c6nBhhcUondC1DJ4855kt4qMV1O7XVljdKjV5D+c+DU+o78vK0Sm9TeOagLZIVE+LjUSKQBPPTKyZ5QH3OMJL20myT+shA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VaNDuXMY; arc=fail smtp.client-ip=52.101.83.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VaNDuXMY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbZGzeIVsH7pKG8wsNyq8YevmAUxq36iiSPONKrJEIunteUc7SY9Kw0A57kR883rWAkU2aRbGhrJJr76fsgJ4fIy841GIZi2DOs/mKSGb1KtOxRJ4clbRcQNvl+fCR30sqJDpWYxaa6+KTIewjZb8M6drZJ/bXY1ZHwuW/PxJohKM0Pvog5UuO/KVEXUIas4Iaz+qGvqom9ydJePVC91MyRbvErQKG/ptqu5vgcb1igsAgMVreUkgmcyLHZQNxfpm23TVpx/dIMpt8+0Mi9iUFrtKKw4xbkhBKfjDMD6UM9hpIgfOy99nsDX5qUeQbTg/XpAf+/M0CKPnmQf6UBkvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+cygregaWaKnABHRZj5lPlmw3YevbG5WiH7sqIp2T8=;
 b=vm8iTyG2p51ILSg0YjQd7AsEi2ADpRzGjSuqG9YDzrHSDVwmN3DyEg5QXNEDBFsehr6+a/aElBES7D+ykZy3OJDY/GY4BdYHvITPOSWyW1ajsbCMtir8Nl3RwxiYqYgae/LSKQBxie2cM06Ft/JvBp8eKEfWLmrzFP17DTbPHQOC/JB0K85mdJyMCYZy6Rwawkwt8Hb6EQHgYbPRRvh0bf8bKMmmiBt4/cwE2L6KEzM7lEQNIQweqFaN/a0GaxOoDgSjA3SE06F99JgI+Bkl4NQKOpdxvhg/JMVR/YOkMympkxjLpbJmG7nancwVA6ScEeyB4+W6UN3k+I/6CmUGLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+cygregaWaKnABHRZj5lPlmw3YevbG5WiH7sqIp2T8=;
 b=VaNDuXMYcvW37urCSkEm/wT8DAY2lBPcHY0jwylnkO7DgA/ghJxgxcAaytV32RZjAZDKnwEWmT82dWTKgBpGJvH4bdtDC6iNNfdvHnFc/YC5MxXIylQAq20AaCAZJvheFsw3A+DUUgpsy+ueqwyLHVazwZQgfruUHWPAWDgmGQoXfFoylLc5+bfY9fe72Lyu2Vl74RHy/vsblJJNXXTc6WL8mAq2JrETIEzlx8Yclg5X7c7QNwsMuyAQXt4i+vfa3HsD9AU/6cFELyK7nfOoOmLyVcBJWCAr8B18iojJDCG4RuBgRLzLhtEVmAfNrdyN2P7rBORAoJ5tp7TOxTsNvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM8PR04MB7922.eurprd04.prod.outlook.com (2603:10a6:20b:249::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.7; Fri, 15 Aug
 2025 09:48:12 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 09:48:11 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: krzk@kernel.org,
	myungjoo.ham@samsung.com,
	cw00.choi@samsung.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org
Cc: swboyd@chromium.org,
	heikki.krogerus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [patch v4 4/4] extcon: ptn5150: Support USB role switch via connector fwnode
Date: Fri, 15 Aug 2025 17:47:33 +0800
Message-Id: <20250815094733.2353916-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250815094733.2353916-1-xu.yang_2@nxp.com>
References: <20250815094733.2353916-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0052.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::21)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM8PR04MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: 862baf24-d1da-4cf8-09bd-08dddbe0d8f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?co41bkUhtDsQP+UdA842Xopi8fXmnFiPZZpzusTku3bQQ5qYMYjQNyLZucFZ?=
 =?us-ascii?Q?XYtTB0oJqOgIaNw1BI4liiQ5p5tLHlWKML2iyo5ngZOk/OOuuIsSDfOXdz/H?=
 =?us-ascii?Q?sD3kn26i41+coGgG49gvgSqLYQPaLAFLQBybevTqk4UDDpKO5jhME6vPe27D?=
 =?us-ascii?Q?HNYjsanK8Fl3hi1cfpaAQLl1RzPn33ai43+dFJ6RS7ZcrBWkZb5BW2zU4UYk?=
 =?us-ascii?Q?pRX+j2C/qwJz7Llx7doIFC7lP9As6XymMb+eAAiXTrc92wurB98yr7fY9j5L?=
 =?us-ascii?Q?Y1uQBRhhott7vhaI7wgdWzSn4wr/wNNb+q6Zt6AXJEhFCS7k1Puz5Qx8I5vd?=
 =?us-ascii?Q?kFDe+AgcNz85FsVXkh3fhXLvO60vsAwjFdrkdjvommc2rjwe8LVVQb9JfUXl?=
 =?us-ascii?Q?lYcLPKZNShLIXPHSix8x/i9zITB2F/cHXjBx76rO4sxsYMWPQRpzmdBdKAx7?=
 =?us-ascii?Q?Qo9ykvKvxALWyac+T133c8yjXRu4r7gFYafA4tklewblsTwLxkDPedXLs03o?=
 =?us-ascii?Q?+Y6sWk6l1D3dPYl0GJ4z1FOMQvl1j3p8tGqYzUSQMBQdy79FOwYMVw02zAZv?=
 =?us-ascii?Q?+eRUUhvU1JjY4naTMI2yzE1Jv9V1/SzNBbiLm/Q1jrFN3v/9GKYZKz5ax3vS?=
 =?us-ascii?Q?w+nOAtGomeZkMzyFwfo/u8PhDMoVVmUEIwtAOGyz7sw7lWVqQgDm0XnPmIbA?=
 =?us-ascii?Q?kIOMT9hTdJsOnN0AUVCxyEodZgQ53vfsqHx3MgnXO09ytZZdITtx1nimMQOA?=
 =?us-ascii?Q?z+EYDVRkT9Ox/L1Tj1FIEuhZCFlYUGWveBmhhgYW97ocztu3flgHWWurhL8U?=
 =?us-ascii?Q?xj+UuPOQlbVN4Q1QKRwy0K2xHRfM0gIvTyd9IiAbSgGxCG52ATjEIgl21tuJ?=
 =?us-ascii?Q?gT0NxknLQ0L5e9R3cY+mNJ5EQfy6FoNl7YXZdiXbYa8qfET8FzCVbhMtG3X4?=
 =?us-ascii?Q?KIysPKoqOftx+KocEkwBDlprsaXrTYzW37rwEhLZwhU0Sg2JLqPKSVTfwjgZ?=
 =?us-ascii?Q?tGS8JnmSvLfTKypchx8+t/lwePX8tX/RZrrNNU8YCxXs5Mpie643xnklhoo5?=
 =?us-ascii?Q?Zh/MySalTuIeIxL+9bJxr2kNZZud8R1Htq0epI5F7nZsiDeOqKPnPmoDfABL?=
 =?us-ascii?Q?r3ebPfkRNfgH0WjBxfTrUtMq4vnLi+KWzVfK2TgFR/Jmp2PlCTzEQSTA02iv?=
 =?us-ascii?Q?dypUnT+vlak8GCudXPil0W+9F2wh9sjK35zH0Hu3uuKhbNWqg6+qPs6/jqyZ?=
 =?us-ascii?Q?d1d7aIphl5CLaP7k1rDBcq44WkEJCn/miWcuCio6JlTsx7/fgpIb2zE3AB/G?=
 =?us-ascii?Q?aCqACrg0kbHA93SIwQEtz1G8BVWjMFlYsNzoi1cVM0uFxXFRSyl+S8V85pVs?=
 =?us-ascii?Q?DeP+PGNJSgk/HDyeNx1yjyW8jf8CoaRnBzJyHpAXOl3dHN1Cm878pLao7VRh?=
 =?us-ascii?Q?AISmYzvqeHLd93MW6Q7y2FZDgk2P3e90S22k2WMkzDrxrkJsOqQMKQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q9uTUU/FETaprPynKKyO7UlgOV7GgQftRuXbytPt++m1Lzgu7zVmDdrDT0wk?=
 =?us-ascii?Q?ihqU1eDP5HaDo+Goki4rFn3vN87cYiL9afltRn1QhdVMz29RQmG+tt23ORYX?=
 =?us-ascii?Q?16N9BD3/mOTmykRrqJOp82WA1omKOcAixElcUYeigvIOD2hdNQcxD6TbnrqI?=
 =?us-ascii?Q?kSFpTWkXZhUVrIYT7BNaY5rwypTObgG30jpyI6lNiiUmIKAsh2IEeHVg3SVS?=
 =?us-ascii?Q?IOP4+2t08h9QdzytmrVMpPKDjmM1cKSrI36PD8O4ejX4Wco5u5SMk2/60KLB?=
 =?us-ascii?Q?/90482cqa7lgFqyV3yTEVF2V/P2F7cjoYG+N7Tbkp7mLOLQUCKo0uTPWI60G?=
 =?us-ascii?Q?d9ik1B1SlIz5Jfb1MzHGt5O3yjD1MEc3Hk9nad7cOOSCPTVhdKmxwuHN5+Jh?=
 =?us-ascii?Q?om2PuzazrYVUcVgP3VOno1fZlnUUX8z4si4bXb5ueWs4gu5ghkHa7RtPmcCi?=
 =?us-ascii?Q?a4dBVR/rvy6S0W8SUs9vAlh7CboHbZ8CCunT/j+XLrCwsjRvbGWGB6EzcuEU?=
 =?us-ascii?Q?qjcgNbBTOvReulrQKdp8AE+5r/ROUBJ8VB4Krcy8xOpta91aVcotUF0Mnhab?=
 =?us-ascii?Q?IHDCHiPzSoIf9UNWL4Sc3nqvjKS5Glb+yl/G7B8QY0dDmKJqGZtwAvPqJla7?=
 =?us-ascii?Q?y86b6BOb4uvJMwQ/X/AwSN4UFMIfDVD1k8Y5hnVGac5vYyCNVZqfLsi5ZCHD?=
 =?us-ascii?Q?Si40hh4ZEN2C/CiYqO1jaYZo9w0IeDgglmtWzHrRJdpPatAQUwjn3QGWtgVX?=
 =?us-ascii?Q?fminDijiFEQQWDwNqw3HI4o/Fv+wO3ccfs181SzPiqKmSmgOWsg2mJOeSdeG?=
 =?us-ascii?Q?rV6bYvAzFmzkxWvBoo5vtvZNa01f16zE4nbQIamPUni9gjuQjfiop2mlkGkt?=
 =?us-ascii?Q?51Hp5YGXHaFRCQKHz9IzY3k8o9EtOHWdUef6AfElK/EgpZf9FHfD0EFatrAN?=
 =?us-ascii?Q?dKFpbH9Vg4RH6EAw6KWIymL7CFR495zmHrGhCVba97ktQGrTXFm2/dJrO/VL?=
 =?us-ascii?Q?QbbTfgxam/WDJViDRvE6W04Z5PiUgocgSImNN+U4mNx4TQoRRT9jQVk5XVMW?=
 =?us-ascii?Q?0ajhAk6cBQyCgJlItk3E66ZhRGmAaiRhVBpWtRunqBxLZ/fGFPY2YKoc7BjH?=
 =?us-ascii?Q?6nVbi9TfVJNJqcEF8hYtQO6WTTBBdroiSK3TGYC51k1tZdx0fnM5BkrOG6Od?=
 =?us-ascii?Q?ekqimz3ep4qFmtsliojUFQVeYovgFzMu5S6ns8fb/n6mr88Zo0DAOIanuKFU?=
 =?us-ascii?Q?y94Oq+cftNJhZ242gh7CvK2F45anRZACKzLS/YcQK/zActp3QQgdpxwArQqT?=
 =?us-ascii?Q?XGNzbHEwZg/lQ5lDuLyq+tVf7hqc59Ds5I4UOQ8EZaJ6BPxNcR1Rg52Ne8bc?=
 =?us-ascii?Q?yKi/YJxO8jApQqV/DthHwNO3jlhjjYg0MdSUJ0g3r6UAOunHYtkChwbALeAa?=
 =?us-ascii?Q?iBK650jvl1Hwt++iPZqbaBtqqnRBmc0ueXDwDoykLf75sAbG8Y45VD0b3ZRj?=
 =?us-ascii?Q?BTTRaGeX57RMnvYRnn0PkjrYRijApM4jy0H9ndk2J+y/XaSsB7t8eZoWbaaW?=
 =?us-ascii?Q?zz/a+DPemSpM2l+QFG6Qd4mT6pEA0YYhHOfyKqDB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 862baf24-d1da-4cf8-09bd-08dddbe0d8f5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 09:48:11.8932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y74IpSsD9zMpIKUShqPAxPppt5c9Rf+UZJf9gDpiL0XPs2B/1C22Y7pdgqWW4GkadWWl+fueagbXK2umC2Wqpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7922

Since the PTN5150 is a Type-C chip, it's common to describe related
properties under the connector node. To align with this, the port
node will be located under the connector node in the future.

To support this layout, retrieve the USB role switch using the
connector's fwnode. For compatibility with existing device trees,
keep the usb_role_switch_get() function.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v4:
 - add Rb tag
Changes in v3:
 - no changes
Changes in v2:
 - improve commit message
---
 drivers/extcon/extcon-ptn5150.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/extcon/extcon-ptn5150.c b/drivers/extcon/extcon-ptn5150.c
index 768428d306ce..f33f80e103c2 100644
--- a/drivers/extcon/extcon-ptn5150.c
+++ b/drivers/extcon/extcon-ptn5150.c
@@ -352,6 +352,8 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
 	}
 
 	info->role_sw = usb_role_switch_get(info->dev);
+	if (!info->role_sw && connector)
+		info->role_sw = fwnode_usb_role_switch_get(connector);
 	if (IS_ERR(info->role_sw))
 		return dev_err_probe(info->dev, PTR_ERR(info->role_sw),
 				     "failed to get role switch\n");
-- 
2.34.1

