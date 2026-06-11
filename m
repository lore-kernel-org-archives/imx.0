Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012063.outbound.protection.outlook.com [52.101.66.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF843CC32E
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 10:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781173312; cv=fail; b=My3RFk8CI8ibterkaTV8CDkzgLaTrvycFi99RXVCjM50kt1q33637mR18Kkd+DIvX/ffWrcKsbKiFHDCYkPxg6jELE2KE1fHEObwbyJbNauBUbFqmt7z4hBw7UeD/YHon3zhYhrFop1aTSyH0tO99NpMcC1h4r8j5nY4j5FQOmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781173312; c=relaxed/simple;
	bh=WrbSgSvnfuba6sj2SUsN9FL4wBeLCsXoM1yVY2ggSWg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LQzMXwFqeib38M1dlwa3rw6MHqpL4rLqJm9OKvU+vfgU1yQYNuAaBJ7uhOfWhaIejYQzsG5F/sIEIccID/hswenWAjyzsf1XFxP8bZCpb9B6ftMVKF8J+i9iM3MmD1BAOZ5T1GmbL0VgcFMhVetVTjKh2+TPmLOOZ5ZyIdRuXVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e9TsbmHa; arc=fail smtp.client-ip=52.101.66.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e9TsbmHa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dajy+mKoI8M9ifVwioe+6zJUDsZ91YA7j38nuCTt+gieviVHyy9rBUz0PJoElMQKXMa+eqVb1nxquN3jxyNCXGRPkA5E6OosKAncaKkQxHd4okeB+iD5Y3ZqJ4BxJTNaUsfjJsnv60Xwf7L+x2m6V4gzYeal6e8g0ZHU1NKqgpIAYdGywrJzE4JiR/zQiRlNXcdoB72XNzp63jKvv2OX8/LAGe+UFv2cO3HJZTlZ5meorDLsv5PL1XOf2H0pUhZP/r8NsK16mjgQKE8Fzf/gVJbCGwVvXx0q80G4+nrT3o/YLfQLgSx+ySY+eNypGpdb0K27vm+1gN0h/DdMS4Ee3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cttnTyR890Ma+ifUaLRTBb84Y14a8eRJhHYxSBpetc=;
 b=FB2696aMQXoC2qOXa6WUWVRzRQjN6znezkLVTQWolkvycL/rUme/vKrrerutb2FodIEBy02HhZncPmyo2HlNq0R/PXTaWl5yF3HrpIRMMmGzvgeoMacLBycWifHfu64/QrTZbb/R3wuN+6RJRFObsbGxMsWQRH+EC/P8QVJWYJuTq8EkusnTDIzdNC+4y9Ncsguhu/7plKGglBv+kx8jAask8brvEb+56IInJRzx6b+6YfDjOEygLUbOKSlfS23dNFcKTr1jn23McP3tQZUaaVw34sX7kBZL9jHP0ybXN2TLhSxRDfP6Qm226A5gZx7KotUBY/RBAtCZLeOXROMAnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cttnTyR890Ma+ifUaLRTBb84Y14a8eRJhHYxSBpetc=;
 b=e9TsbmHaGdgNd93IpoCJUPhS6kxHPeX/dRQczuID4wn3UC0zLb+s7VAT2GRuWUR3eMyVqc1V1Xre+45KlI4DWe+6ksGohmGGPULxe0z5cMufloSDXXshvSXuXwQY9WbeSTlcnm3GYmib7/7XKWlXeRXMjJXOxMmqJVNgdKP+K5fndm/WGvI4efyQR/2MqRzUjWuLCaB10f3WY5UScen7zK4q2IGZIBrAcr4rIh1sXql/kf6WIbRNEEDJBtmyfPCEoOBJDfC7McUWyuuT3AnOLatMcBglDIJRs897clSEYOs9RQbzExPPf+Ymrc1yGRmeqwrFZ6GE9KA3K4+1JsOAig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by DB8PR04MB6937.eurprd04.prod.outlook.com (2603:10a6:10:113::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 10:21:40 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 10:21:40 +0000
From: pankaj.gupta@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	frank.li@nxp.com
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: [PATCH -next] firmware: imx: se_ctrl: detect round_up() overflow in iobuf setup
Date: Thu, 11 Jun 2026 21:11:48 +0530
Message-ID: <20260611154148.3182727-1-pankaj.gupta@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:4:186::6) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|DB8PR04MB6937:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a7dd5cd-e8c3-40c1-4b26-08dec7a339f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|23010399003|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	D9IoGiAFuH2ywWAzgB4yqsobhdo/Vx5WGozz27juPHQCjXMFL0SWG2ZreYVQ48EEYRNEoYT4ybEIABT4aeJlET6x6H1QpIzoGBQ4RGBdhmLU2iS2xnRwR3PJlgHGIbg2t3W4OEsB/SsBbe+sUVLmRC86ergC8aD6OcYoFpWvpM3G9WzTf8+Nv0IDuW1ZZGyqCg8+aMUj5nn7D91EROvhNpl2VNQhiNQwqCk1sGVraxd7u7AGvKUxOAsfZsv/MA8D+1CxwnUsqkQUY07cZ2/tYOBpHcI9oY74vI3ACtdByOKpUb7ayOlO7b0BPdg9L/jYAUElVwVPE/SMvcH3Rejub7HCkEksXC7jjq8QX6+lIyOaMiYZ/C9zne01YjZW9SChtAslhImnWr1LWy30SumKKlReyUHAkjU+qPZZo3ED2/soEqrPSzIn9QUW5I3pNgpS5c2I7oLCl0XcX6ntq6Tzzkw8Ri6PwJiL2wToJN/ObZzFxgJqs1uQ5FE23zamLKJ1ryTFzHg8Aeby1t3EtPdlKHlP7Sck5d4D80WJ4HGSfLZIxHHTLIAZH5kz5HOwzex74NEGlmc4HCpWxTmNpXGBDZcc4u6DD2T86GAdOnJ5JDAByfix36RZAChLHn8qh3tci5UmW2RqNQuszmr5kHrx/2syoA4XNDQZm9hledhztQNIDTj5YKzhoJEcGGA6hWns
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(23010399003)(6133799003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FG8ajQ8qlbsPs6AVmeGe+z4OpOIbB4cuHHJced7Ee1AlDgcfcS0+F+HaRGDI?=
 =?us-ascii?Q?01rG3/X1yF4s4Q3U0A5/4aDixVW1OVH+Of3zDboEZxleYruXKlxD1Fl0blXT?=
 =?us-ascii?Q?ekHkmUK+zW+0MMmoCgFqG/OY5ur6d47LA0eaGmvjqXselaiwYBeTR5iq2tFI?=
 =?us-ascii?Q?tm0ZiffHUVNK8neQNiFUJfj/kHFlmdqa4nTPGDIYnQHUdnEAjfhZqw3O7TSE?=
 =?us-ascii?Q?cqYdcItNw66DeTktkc5YQOTXmcUEuR5wPEYdkU0Q6274cXjC/TYtNpUvOBTy?=
 =?us-ascii?Q?BVlJj55BnZAFk3mT50lck5ftw9MDe5IZoZ2xXR2v5+Z40PXRA7N5wNUvt3KB?=
 =?us-ascii?Q?+awrUfjKZr0pXEPkbVII5lXqg3ngrRL84UejLcjiCXxYtU+OlXha6jzlJJLu?=
 =?us-ascii?Q?koM77OUpNSwOQ4V2KIayHQfnOLcEonOIXVmDUO6muPkxtkifvJoFz4mp/LmB?=
 =?us-ascii?Q?dXA+rz+y7J+wOyaEurZE2s+Hqoy42NGp7Bn++ip3x+gbMjnkiHaHJwTtGr7M?=
 =?us-ascii?Q?JtPbRchCDt3DjqYZNCEFRpPJKy9bog1pe4bvu/s1zqoO0XQ4ES9lZGfxnc3t?=
 =?us-ascii?Q?PyXuXo1MlVFPUCE4pLL4ojQUme/PVa/RgK8S8/5AhmfzUnElSfI/Z0ZTjskC?=
 =?us-ascii?Q?O3d1aJe9/Ly70rbmUu0BMmlvdFySW/Q7VOdiefGhdLhYQ8vIoYhTFvOtC5eU?=
 =?us-ascii?Q?6VfBhJhoMUjSltPwxjqa0F9zr/UP9oRWBLwK+/IvvrIkjALDK2ofUASChaIr?=
 =?us-ascii?Q?15GNbjPinRZgm2cH8LIC/gORnxyAf3dWbrWIzfAsROO8CYS9XqHZHZTRKJNh?=
 =?us-ascii?Q?KmcWU5rDt4BQc/rPq0dGpa9OG8+DKp6c9Ebho4AGZFuIb4Uugsg2kvKKhrGE?=
 =?us-ascii?Q?KhncBJSPUbhc6yGShWoPPh1sunLszlcxCJw5V/Rx5OjNPjo2yLRlSP6A72R5?=
 =?us-ascii?Q?EHdkqgnQv24XmLJcE5i8JG8iaQv4ICtZdRfTq6oYa2gAsmeL/Lyfvkida7fW?=
 =?us-ascii?Q?3uV1jqyCFBPk8XDerEpCr0aWxljVkNIhBvktVxBGJB7y7er0UK0Z7Rafw8Z/?=
 =?us-ascii?Q?y2ao250XZ/LzmxiBF9RwO/t4ifoHzg8UAIgMPEvDWyAusabFY0bKqd6rfvr8?=
 =?us-ascii?Q?1BKPt46ZB1XkCM6rkgmDh2OIjzaGsywdXatzlo/TyXZXXAGJowRNJs4CLNU0?=
 =?us-ascii?Q?dLcM9Jb1BAx+IyCobjXG8u9h4/0IoPn7dRhMEuCG3GeFLNcBl8F5teG0atAP?=
 =?us-ascii?Q?+bjisXAA05Y1yV188Bu303XaHQmcEnu4xbEI92OaQggHdbfTZXN0NmtqNPQE?=
 =?us-ascii?Q?tLZhf/rM9KVURjptOSXgizo8OuegL/LBOR9WMPQNvNSOEcpX0TfoPHpHGw3B?=
 =?us-ascii?Q?qYSW6vYYkUHw4sc10DEVwQ9+p9qbPz6yBbEiGcYBF/cGQFK+BtHk0oocHo4a?=
 =?us-ascii?Q?Yg/10aNLd7EacLtXZfNYq302ioWeXxFGozkxgTTD0Cmjjo7PmziUfYa+WO3P?=
 =?us-ascii?Q?AWlBPtYKCZbCMuG82GO3c4A1a4nC+KWDnWw1ZYD0hL5dvv/lrBVoret/0/5K?=
 =?us-ascii?Q?jMV3iw8bg+wNDbplOese8J4vbTewB9F7cnWK2Axy0abWZNgK1ZBQ3ZRD+hvQ?=
 =?us-ascii?Q?29ty0fBJ7VVTyUe2/j1K8U0AqH3jbVbaqI30C6oq4NrqEt1AxIk19FWRdNI3?=
 =?us-ascii?Q?4iiqimzHxLvfUYIMhpLA/qNPnogwjWX/108qe8BEEHRLFPgA9II0PXXF+QJh?=
 =?us-ascii?Q?xv8xFSmwEa9T+1cB2t0p2L/rSY7g7rK9U+P8f+IndSOiOB68iBN3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7dd5cd-e8c3-40c1-4b26-08dec7a339f2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 10:21:40.1407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpTYEe1DQp2b8k35uqquiV5PZDLTS06n+jFYg8vAUdytnupu+fuUIV+6P8jPABXyrmHOStyTB5dm+ublVmGs3Y9IYMSOSssMqiWYB1QXMnzT0u3DncATI84Mq3TxfNqK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6937

From: Pankaj Gupta <pankaj.gupta@nxp.com>

se_ioctl_setup_iobuf_handler() aligns io.length with round_up(..., 8)
before checking the available shared memory space. On 32-bit builds,
round_up() can overflow for large io.length values and wrap aligned_len
to a smaller value, which can bypass the bounds check while later
memset() still uses the original unbounded io.length.

Detect the overflow by checking whether the aligned value became smaller
than the original length. Valid alignment must never reduce the value,
so this catches wraparound without relying on a SIZE_MAX-based check that
triggers tautological-compare warnings on 64-bit builds

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 drivers/firmware/imx/se_ctrl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 8fab3b7767b7..5b23485fe42c 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -666,6 +666,11 @@ static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
 	}
 
 	aligned_len = round_up((size_t)io.length, 8);
+	if (aligned_len < io.length) {
+		dev_err(dev_ctx->priv->dev, "%s: Invalid buffer length.",
+			dev_ctx->devname);
+		return -EINVAL;
+	}
 
 	/* No specific requirement for this buffer. */
 	shared_mem = &dev_ctx->se_shared_mem_mgmt.non_secure_mem;
-- 
2.43.0

