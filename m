Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2080.outbound.protection.outlook.com [40.107.22.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36746746F
	for <imx@lists.linux.dev>; Mon, 12 Dec 2022 22:08:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8pIE5b80yO/W5H0u9Jfrn7aRVZ1E5fyWmcl34NLJAFQgUMDR8QZ6ZP4OckaCCnXaVhEQ9obTbuyp/10/nN4EJLnMHMZAe+hnbg4zLoxYE+StBOrJsxX5huzLVe7lzZI+xKuimLC4MzkyzpQaS3P0YV83GwKkJeI6Kq0N3GIGo47PELqTT3y+vqimx+nE2NtWfmd5gTR1rO8gdMzm1koK5AXEEOsOtFMT7vDbK9Vb2u1wD7PRGEJoPtTzpG45JAlH1V5gJQ1YjZfySP3lZjEFynlstWaWH7VZDttQiS/Ooi3ySGP5seb3OCHs4cRbpZH3DlC5yJdVcREgIgIEfXFgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAxp/Y2mfz11SFoTlqRjobZqoT4tCyqhPVnnS+oxGE8=;
 b=VVyv57bIyxa+vAHQ3R92bTrYJms4dqEXUZFM6twP58+FzYv+yOY88yV5YGfU1y19fVtmyNFlFRxid4N64M1n+PKtmt250LL9WvvOB6HjKuXzr+AdHyxC1cySKHG3kMJ1k4zfzvNGgLlfEpaarNYQHyTDjmbsYdTDWEypPhKSgX7yddq6F1HsLolAXIWYGQRkVTXCep1Kfg1Zw8PuNMUVxRqhRW6cK6/JfAUaaaNWARmC35CvYFonj8hh2Qazwq+jBHfChTxwovNSNOiTXfMlDSDSDPX28V1mwZZ/3ApD4DJjb3QiCk4mcAHFcPJnuibYSnId7kQh8Lr/asXY5+RWPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAxp/Y2mfz11SFoTlqRjobZqoT4tCyqhPVnnS+oxGE8=;
 b=NPuvYDAEF/Ksef5dgof+bjfi1Fwj00qICn7iFdF3pot/RPLbS59LFYS01w5wp2vNKeCihic+igRgF6et7uEGj05MQKXkUz7NmBWu8hESBMmMev4dstc8rIVReKUcNlbJihuHSVyUwYUqKBp2dvDqxFrn5VwyoWBzdnif1reoS/w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com (2603:10a6:150:22::11)
 by AS8PR04MB8579.eurprd04.prod.outlook.com (2603:10a6:20b:426::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 12 Dec
 2022 22:08:01 +0000
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::ef72:e2bf:2ff6:a953]) by GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::ef72:e2bf:2ff6:a953%6]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 22:08:01 +0000
From: Han Xu <han.xu@nxp.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Han Xu <han.xu@nxp.com>,
	Sean Nyekjaer <sean@geanix.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	imx@lists.linux.dev
Subject: [PATCH 1/4] iio: accel: add fxls8974cf support
Date: Mon, 12 Dec 2022 16:07:13 -0600
Message-Id: <20221212220716.1829183-2-han.xu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212220716.1829183-1-han.xu@nxp.com>
References: <20221212220716.1829183-1-han.xu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0154.namprd03.prod.outlook.com
 (2603:10b6:a03:338::9) To GV1PR04MB9071.eurprd04.prod.outlook.com
 (2603:10a6:150:22::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9071:EE_|AS8PR04MB8579:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df0da73-592d-417b-4feb-08dadc8d5560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uNiYGooVc8KsAzjSmh4PYMyY/KlSZxypnG0tRzY6Mee119LSb0LU19oEmI88anRbHbAHQXGFZMUXVzpIeFkFKHB75UWD2CiFXXOnrCqNX5tiiUgHNgJLknrqx2y4pgaf8geXE43pIxSWgxg03AiAA14Gy76rsOUZ8ZpEV6/+w8G2Y9Cc/wOIi9Fy1WxT78E3Pon3+D/gn73wc7nufvFCY/CWdKREHZgxgmmC4TpMP8eUAZCmcXjSaFenxBhc2ox+FMJV4pRo8qqOpSv7H3Qy8+uRsrsuYjEkQDwCVwrKPPI5jvUSYu+pjVH2vj5lyYDPqTwGLe+wB74/bXUEHB+j0c5b4sn0n4xjeDHoa/7Yx9CCyaGcdy/EoufgWYFERCSVQ6bzQDfzOYsLWjHmh0CkoIM/qM9a86C2U5AOR+cBQWzE99dzcinSBKG2qcW5mrLq3JqLCy6PXXUNpucIxb1TMq+gAor9zVPS4i1PTXbuXh+DJRFaGcgisct/8Pjt+kByRZGK8Rq6M3OhJ6wLMarWHx1ApfalFoI4dN6gBis71GGPWFaM2mZkh/bQ1pN3epMWRE01jcgXVRyRcjLgqVzAcOXx9AUeVaIH7dQ9X61ZC1up4QA23w/xR3+fOA7R2uty6ces0Ula1/OvFNhCDPIZ8gOKinBHrZhKol5V4fLrioAJfmnh0uRvJv5l/Jq/7v6/G6G+tL6ii2LUhNLF6oTtXA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9071.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199015)(1076003)(66946007)(66556008)(8936002)(8676002)(2616005)(4326008)(66476007)(41300700001)(186003)(26005)(54906003)(6512007)(36756003)(316002)(110136005)(2906002)(38100700002)(86362001)(38350700002)(44832011)(6486002)(5660300002)(6666004)(478600001)(6506007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SH5gC8mJ93gbmjiPiajTo4PgwH1rc4sMonJszoi7crdhf/qQjIISZ3gyc6Vz?=
 =?us-ascii?Q?uFhs9YyguqjWUZaQiJB/ykJiY7C6ZN6oRmK8KA9ueD1eb+5iVrYJZWi1csfX?=
 =?us-ascii?Q?CHnO4jIjpDrHgGYZJJ/esjXNxgRblIuPxeCqeyn1/l5ewqw4GdeB0R/lN/+M?=
 =?us-ascii?Q?jNZPt/FIZ93HQAIllUIqs4RDb5G8s7SwYmthmaO/tHhzv+hGYLM8V9AEpq13?=
 =?us-ascii?Q?kBRiQ7I2KMxJ9c0HTNtodNXM3c5QuGO+8RA68hcjvBEQeuL+EyW7dBIapHHc?=
 =?us-ascii?Q?qoYd1xc7pstxrdoLnMo+f8jGQJI+S5gQuLiaKcvbtEiR9vyMqCpSS/LpS2K+?=
 =?us-ascii?Q?8PCk3LzYorn74fjRnF2Bcfx+eZsyHDX1Kn17rwim4N3+Ac2limtBvVG2JRru?=
 =?us-ascii?Q?JWt5V1Z6B9cp7mjKgriYLL1iUns0redjD16bRRAFI3nyOWvqNndqOTx6c/vQ?=
 =?us-ascii?Q?0+f65OqnplooPeQlmeVkhkrNTKZyWGAB2dhNUAWp6l47CiObfmrYbZHcketK?=
 =?us-ascii?Q?zgDvGXGjqTr6Mz/XfjKX7MgsISTSOvj7UNB7dk7fsRjuwSFfysh+tVBY5aEe?=
 =?us-ascii?Q?mnk/BAV/r2C+Oc2jZBOW9YtdEhfirTGRGH4H/D8wdJOimoyrvdTTRtWRM+C1?=
 =?us-ascii?Q?qRWQJsNL17JQn/EweN6Z2x5B1VSLlhkW8ayBViiLkltIL3Qavg47YTMv1U9j?=
 =?us-ascii?Q?ahY8SKOp0dWpUh33pA+JdP6pEg8MSN8XzI9rg7pOeNKUED79NeAFTSOGX6Ql?=
 =?us-ascii?Q?ZELslXDaXbiAuWb2WqzyfJOa8mUsP3cHl1Z5lswJ9t+zOKigQCFfyrH2OXcO?=
 =?us-ascii?Q?VrQyJzuMnjit/2utfGEBN+dya3d5L1lva74us849EOLmRVhBPtESdiLyi88t?=
 =?us-ascii?Q?k4EErm2SYOtDBs0Qrk4nsc7w+fqBRUKYz5emipoxB9sjUexy+AFW1TvPfR3k?=
 =?us-ascii?Q?8P0PjqlyOo4tUWw1Isy/Hhs3x2WVIkc6FrnB3sIUMue7LQsg1VgMnWlrM+ip?=
 =?us-ascii?Q?JXpZMzSeM3PURIVJ1uW4bsGRlkcKhDs+DvQa/3nFz+XNEJFcfUfvi9elu/pj?=
 =?us-ascii?Q?D6U908E3oTrB8oijRq6SADlTrj/9Wnnv4fypdKaOXWy52lfU5eqUtkozihEt?=
 =?us-ascii?Q?qQhRq8vYvBRGumfKv1dJ3wDNlVUa0nHVR0kwtcKRWAR93YRlMarPRGsIpZz7?=
 =?us-ascii?Q?nlk35hbxZ977XqFGbtsZYfsFimI6yq7uFn3CpAMA+EpbT0soKcpRnI1pdXBk?=
 =?us-ascii?Q?IK4mRyi8qWT+9dzkux3n3mwMxeORfeIxlGtmusQK9Kj+H6YLCr58sQuGg3DK?=
 =?us-ascii?Q?3af78TRWyZ9orD/tseLQLSKPdfW9NlrDU36N0bWTvuq4YIxV+ChiHX5yJttB?=
 =?us-ascii?Q?uH9Dldq6G4XJkvT9tgyUDmAzOFnW3Nve+jUfWt6nyaOsnuKKPY+J8cwVD6p9?=
 =?us-ascii?Q?61uNA23Nktjdv4U/yOerVTxtz9PDN35lYYrnE5MtgYWETTbeKuyhrt8bSucX?=
 =?us-ascii?Q?nnLvJ4bWgXlYrYax1d0MstnNOgIg/z9Qh/hZu7DDbLC6huX9RQeLE20PEYXt?=
 =?us-ascii?Q?sKXXOzlsLhrjKApyUTs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df0da73-592d-417b-4feb-08dadc8d5560
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9071.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 22:08:00.9877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pm30N62DcFd3nkTomAH4etUqrp6gOBQhVJLY6CogDZfL51Bu0Fj9Bmxs6Z0pS8Jx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8579

From: Haibo Chen <haibo.chen@nxp.com>

fxls8974cf is similar with fxls8962af, the only difference is the
device id change to 0x86.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
Reviewed-by: Clark Wang <xiaoning.wang@nxp.com>
---
 drivers/iio/accel/fxls8962af-core.c | 7 +++++++
 drivers/iio/accel/fxls8962af-i2c.c  | 2 ++
 drivers/iio/accel/fxls8962af.h      | 1 +
 3 files changed, 10 insertions(+)

diff --git a/drivers/iio/accel/fxls8962af-core.c b/drivers/iio/accel/fxls8962af-core.c
index 0d672b1469e8..98811e4e16bb 100644
--- a/drivers/iio/accel/fxls8962af-core.c
+++ b/drivers/iio/accel/fxls8962af-core.c
@@ -126,6 +126,7 @@
 
 #define FXLS8962AF_DEVICE_ID			0x62
 #define FXLS8964AF_DEVICE_ID			0x84
+#define FXLS8974CF_DEVICE_ID			0x86
 
 /* Raw temp channel offset */
 #define FXLS8962AF_TEMP_CENTER_VAL		25
@@ -764,6 +765,12 @@ static const struct fxls8962af_chip_info fxls_chip_info_table[] = {
 		.channels = fxls8962af_channels,
 		.num_channels = ARRAY_SIZE(fxls8962af_channels),
 	},
+	[fxls8974cf] = {
+		.chip_id = FXLS8974CF_DEVICE_ID,
+		.name = "fxls8974cf",
+		.channels = fxls8962af_channels,
+		.num_channels = ARRAY_SIZE(fxls8962af_channels),
+	},
 };
 
 static const struct iio_info fxls8962af_info = {
diff --git a/drivers/iio/accel/fxls8962af-i2c.c b/drivers/iio/accel/fxls8962af-i2c.c
index 22640eaebac7..17dd56756ff9 100644
--- a/drivers/iio/accel/fxls8962af-i2c.c
+++ b/drivers/iio/accel/fxls8962af-i2c.c
@@ -30,6 +30,7 @@ static int fxls8962af_probe(struct i2c_client *client)
 static const struct i2c_device_id fxls8962af_id[] = {
 	{ "fxls8962af", fxls8962af },
 	{ "fxls8964af", fxls8964af },
+	{ "fxls8974cf", fxls8974cf },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, fxls8962af_id);
@@ -37,6 +38,7 @@ MODULE_DEVICE_TABLE(i2c, fxls8962af_id);
 static const struct of_device_id fxls8962af_of_match[] = {
 	{ .compatible = "nxp,fxls8962af" },
 	{ .compatible = "nxp,fxls8964af" },
+	{ .compatible = "nxp,fxls8974cf" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fxls8962af_of_match);
diff --git a/drivers/iio/accel/fxls8962af.h b/drivers/iio/accel/fxls8962af.h
index 9cbe98c3ba9a..45c7e57412e0 100644
--- a/drivers/iio/accel/fxls8962af.h
+++ b/drivers/iio/accel/fxls8962af.h
@@ -11,6 +11,7 @@ struct device;
 enum {
 	fxls8962af,
 	fxls8964af,
+	fxls8974cf,
 };
 
 int fxls8962af_core_probe(struct device *dev, struct regmap *regmap, int irq);
-- 
2.25.1

