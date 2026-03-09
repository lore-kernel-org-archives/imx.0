Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A28368945
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 20:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773086675; cv=fail; b=iZloP4LqdAPlpRQD+rVMGqTwRfeFVEShmak3bea5NfwJgNd3gC6i/XU95UIqmBXKyiwcQan8fxIWcyW+njl3YtolpRIUzNPbEctFOOOBLrXO5Y77JXOwr4SSeqFLMvS5g6mu7yUy/nfK3kq5BtfgCWlqI8yR8uygVy6M4miomzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773086675; c=relaxed/simple;
	bh=7GA6LF7OBZ1MgYAO3kQBRgl9L1WOlphM5ow1H+0O1iA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GLT18PlrOBOwCcdB84CfWU6EK7b5p+DTwf+5Q8SwkCg1OfteeuREst3vlLHLVQthO5AIxQuttn/t+LFG5GHf+fIsZeB3g2LoRFOStp5RGDoo+Fi0CljEaxfdpbGB69/PzYo4TbCyTav7BYuHTIM0SWf8dGTVNvAkFtozewFiplo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=B4D08qXc; arc=fail smtp.client-ip=52.101.69.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="B4D08qXc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPcacjatGurjnMrEByozIzehk8dsTlJEWc5y2WI9dAdgOAbSqS0MfeA/fJppF2JF2FsDHXi2/bOBxSAcgg/BUWKov/2a0XPuSA6G3vR3cnxdf7vfN374J0h4lnc94x6a/kSRMT5ekY5ZaOYl778dhidj2ewrJnrgO05cbOLoNyMXNGgOYDP/MFsw7BK26cQ4zgCWyjz2B4iwpdEjzc1YaecO/GAqARMkruXx5InU6lG+GXmFhW0qt39bQ1BHRUWaazt2GU6rDJILORnvyuiI9QbO2U9qEQFCZAYq7h0+Ao2qAofDYyMxauk9eahJIQOVkePPYkbYuRWZ6dBJL9snVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJa1sT4bRAoQc19aeyCNpHmBG1Zh5EXGAgUxiG4wHd0=;
 b=XGl30iC9tjpnSLNttlKsjHY0GEOCpq5gcdoCkWqZLEQhTuMCO0u7rDGkFzEhUvmwojSzPmjTRz/7Jc6WglG5BX4KoXedq7lctAd5IldmX9Zu+Dc5EHKszjRxvQaZGy1t6KjmXIdDohSHZ95o98F8Rfd1mfzIPxlLAnVBjtY2F+VeWb+TPKSMFhx7NJ+8dPUmre0T/f8+t7lnYMXq9DiSULN2DAefe+iGOiob6705rZBaFQKXXe7g0dIgqzOKIFk4uHfMwzpRGnhZRuz+RCzUi155Pm1UFNWY5hWsyJ/E7Eq7iSxse6egtIMdvKGJoBhrIqE1OUXshTVrS/bqzKyFjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJa1sT4bRAoQc19aeyCNpHmBG1Zh5EXGAgUxiG4wHd0=;
 b=B4D08qXcV34L35AKkdFdavUO32w8FI6vbWdg4RkOZhmJc3EduKuCelA7uMI3onhvkS2xvLBbWHhZMYD5xLnQIT/OcGrqWcpzebUu/wESYrBoTPSYeBHjHC+FfaPLLaQImef3PAKZhgJGOjTwVnPZPCdFwFCppy88ji4hTJFIEmGS9hmfASe83IjW9s8nRjNBGhL8PBK0Vsnu0+pFezZ4DRSek/W+276D6rS8/PzuC5IE4iTZl4F86dtukc3VWG795bGhMyOBH1Vk3+5WKEWqzGVSx4BzEgb43y7GzGF7k1JsH+Ma2LGynr0a+tqXeITfvRpFnMCqsxBlMizRgkxpow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GV2PR04MB11934.eurprd04.prod.outlook.com (2603:10a6:150:2f3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Mon, 9 Mar
 2026 20:04:30 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9678.020; Mon, 9 Mar 2026
 20:04:27 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Han Xu <han.xu@nxp.com>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 2/3] dt-bindings: mtd: gpmi-nand: ref to nand-controller-legacy.yaml
Date: Mon,  9 Mar 2026 16:03:43 -0400
Message-ID: <20260309200351.1791162-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309200351.1791162-1-Frank.Li@nxp.com>
References: <20260309200351.1791162-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GV2PR04MB11934:EE_
X-MS-Office365-Filtering-Correlation-Id: fae9ad69-ebad-4fd9-b3a7-08de7e1712eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|52116014|366016|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	qzNDaKnrDHyhjfaq822MgTtok+PsGWbRYJaJSMP4Fetpjcj7zLwqXieruswxteuOFXoje46ZxgWjWIoUUPttMCbyhrYZ7SInrw/Ckl/0vDvvKpw2YCqUe5aAOtxsBOfizGFRG61WrHKvbAmAoV7NvyRD7+sPpwVpo/7norTReuqzZCSAdGuYkoMfPMBKXFx6YGCOzayKKKww8wWm2xyZRQkSpbMp8w4eGoRcWTSZgb+pzYdVRX5LbD6ro0zl5QnUxGFcDAroNCwrrHV4g7DH0y4UAcABIMg/JVrEIiu3/njk774G5AnRyrh/0aN6dmpftQpCieMXjyCT1bj2/7AyUM0+T5vGXyRuswxTRoQOpeRlpit3YSs8unEkZbC7JFoFszGT2DalHe7qtPMkil+JFI+Hh8yZOVXqxdzjQ7QPmoH6njPDeN10Qo9nlP3AslbzzL3xBKR0Ugb/OrXl8/TSxSclZg5emGrKwh5iUIU34nUmE2YWPD5ziKzK/nV2hRJsuYo2GvTmO7zvn9MGoe4jyrSJ6yorPWZ/x8UjyyEJbTOpbBm75I8cHuDnhurrfsBuvIofDJ5oEhKJ1FiDBhglIb/L4FJneg8iFp4tO7IcC15ILNhGbVNJUXbsreMypY90eOShDEQsY6byvdPqWp9beqGrozlt7YWgEzFL94Yi1/yCZzAv7+N03Cmt81lmmyy90NzyeM2+v0GN1Wj4kex4kGSaHNm59JFNvX6z6UyuQDjHg4iTDhtg+EZJ7mxK1lSjz+5e1nmSWb2LTFXxfWa7cWc56IkGAXuRTnd/94EucmSgpw9kCEgFp/UrDvCcI4tp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(52116014)(366016)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VNHJrC9GH93fHZ/cfKN37P/an7MTthM/mavORCnmrJT2t7UUvxNaRb4jwz35?=
 =?us-ascii?Q?2GshbZm8WZmzfPSEZvGpvp7r03WNXMB5NOvWEoVVcU2hZmm3JwgCXB4smSAq?=
 =?us-ascii?Q?obbqIlSrEit+xwtUIT/jbsEgWcpMFS2U4M5D+9v46Jmt0Fy6LLTYAyKvN4jX?=
 =?us-ascii?Q?N6xIqDYxrPyvyzGWBnGl3lavfNs99cuhnZpE868tHQFVBmB4cVseGLDeYMW5?=
 =?us-ascii?Q?gugrdBWiyWVONHpjuZGxZMhr5wZUXZ02cYrtlUTjDArZQA0FggSnJNSyMLsu?=
 =?us-ascii?Q?qDoLkttc1yCfn/WjZdqkXG5lXfX5uxv7dg1qlheYCYnlH1joW48IYI7cUqbg?=
 =?us-ascii?Q?iQGdVaej/iL9ZMx/YsCG/XrFZyamfw0IVvYrc8htCGSjJcphDNzovWdrbKME?=
 =?us-ascii?Q?PtPBE1C7FdNMgeRnmijj1HctzvGkI4LCWys7pHUquoP9OhoSwoJMAHaxObfH?=
 =?us-ascii?Q?9ANnDlQBGvIzpPfB05XQEAtwbHQNRvpuNFW4oWZxr3UiV/eZmp0KggjnQfN8?=
 =?us-ascii?Q?a0VoVxbeV/7+h6MgeQaDXulGHmgPqnv7at0x+sqwUuNiTHbuc3cdXsabvVIj?=
 =?us-ascii?Q?f3+wTMEUzSO183o9f19rXhUFfWf253UpYIgBYOiodJiqqqDONZg7jRbrSo2/?=
 =?us-ascii?Q?HQge9EauySV/MluCVacWItJWvr1axfWcKMX0RVVaqESv4hBuetI+nsyicLFg?=
 =?us-ascii?Q?7T9qDlfr3mN37r6R6oOypjspmLszxU9PvWpXgLXa9G2fsSqxS1vMsBPkhb7t?=
 =?us-ascii?Q?bSdkWnjRAOyLeaoQZZXLGGpYBtuz0mVhAVa4cuLlVQcRKimp6n7abQpXeWXw?=
 =?us-ascii?Q?6M6jcGKp94q/dRAQ6iXe9FR7ZdcMgq0Phnxp/W+oJa4Pgq6jbkivoH9kEn+R?=
 =?us-ascii?Q?iGltOW3iUo1QyILNMLH62vmvD1ZzF1swXs4I9jW7wJRSs46Hd8/OcRJQxQ+V?=
 =?us-ascii?Q?eO93Q0/ZudCqOm1BUKlnY4RIdzsY7eCPfSZE3whqF4KpIogEDuXbnJBQolqC?=
 =?us-ascii?Q?7o6xI1qvKqJKweBilBcVmI58tJ79FoKPjFrcvmplnGhuziqeUYcrZhHleFoa?=
 =?us-ascii?Q?cnPD27jLJehD1Y3ey4VX2C5dz7obb5KiozekWL1l2fb5EisldEhk/jBrDRZj?=
 =?us-ascii?Q?LAJYrdBTHjdz7i0FQM7q5wm5r8tmRLSIHMwQ/yeaOmloaWerLAqMbRflnWMJ?=
 =?us-ascii?Q?ffSFZmyAi0mMdldcZmInbqAvRDPJHLJvC7EAqrKZza+BqEukx+s5zSFYsQt5?=
 =?us-ascii?Q?VxKpuCxhkf86UUikLSd3RBteYrMqzpvllD+H8Woa5X1NOToLuOdB2hpyfzoG?=
 =?us-ascii?Q?GIyYzijamDAHc5U5VYCcZt4nz9z5G/qN4nzrnpzgk3uYAlyZQZOFhBEUg5I6?=
 =?us-ascii?Q?4/iVGkXwObWblE0LswuZavaB1oZfjtI5U153GpunJZagKLTEqF8zj/hIK8SH?=
 =?us-ascii?Q?WXeaYDH9vya7qzZNWYtHH2G/UDTRZIkSdg6xYO9cWNhH4rqBo7wWyxsJ/XOn?=
 =?us-ascii?Q?qGI6O3hbYOqKM238oUHS9KCKnGN8z3nskaU9xv9xbCXdy/KmjKG6DOy2UEzN?=
 =?us-ascii?Q?RkWrZf1bozO4vW69pFezfYxn4NxGLtPxxtGucbhHjreVoItrJ0vCw6iGDAE1?=
 =?us-ascii?Q?9NUh50f5UIG/qUgEOBo+xUmwdbeLohRcxOoDClouMtC8NPB8p1SkHQE6fHzr?=
 =?us-ascii?Q?TYhmwjgl7VvKZbunx8zhQI8ymKPYclKM7PAjy0i4oFD0Tql+Y37jwO44DTf9?=
 =?us-ascii?Q?37SbYd20vw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fae9ad69-ebad-4fd9-b3a7-08de7e1712eb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 20:04:26.9410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vgKyADfEdo2Uu39VBalHFYCHxoT4WHSYcmTWVQZO1Hngef2344Ol7heRjnxMXJ4cpWokyUn8ECqypJcwQg3UIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11934

Ref to nand-controller-legacy.yaml instead nand-controller.yaml to allow
legacy DT layout.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- none
---
 Documentation/devicetree/bindings/mtd/gpmi-nand.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml b/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
index 0badb2e978c74..adb684e3207cd 100644
--- a/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
@@ -101,7 +101,7 @@ required:
 unevaluatedProperties: false
 
 allOf:
-  - $ref: nand-controller.yaml
+  - $ref: nand-controller-legacy.yaml
 
   - if:
       properties:
-- 
2.43.0

