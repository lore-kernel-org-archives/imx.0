Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2063.outbound.protection.outlook.com [40.107.22.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFE8746F
	for <imx@lists.linux.dev>; Mon, 12 Dec 2022 22:08:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/VcFF+SL11Qb4/su63/ZOyhSJ5TG+4Yn0emwZj0IDj6F6yvuEI1ZmKcbTvx9Pw2rNnX9g1J6ROoNrhJB6pMbizwOm3xarQCS/QkqozGJdusyB0OcD4d1L9GOus+0GXXxmmooI2KobESST20sM0LN2ekSlE6YU4QkaAfyx1wx7PboHuC/Lnq+QcfKdqycSbSWAILl5TRE+m3m3K2SE1v9iRaGZ6iXdvboOPpwY9ojD/bZXdNMB3qRNZTa3ZaAoQKol+BUCCRNXM72/zNt7yRZOsJTYeBaTzgJxtsFT8U5wNiD0icvpGXPUjQu/So+/b6fq3EjN7mrFssz62z0MAR+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mjul39VvoCWsgUG/dfTWd7kRVigawZP/golmyPbOfXg=;
 b=h30SUqOeZy3e8X6oGvEVgGHfDoSZgYZq3e2nKlOIpC0YeDagHM6EnKOjGeUcx0+jRp4YCJBqF3yDcJx3a/kveoHNJfQ3LJwpWi8vWcJyZvB/S1ce9g/bwFSXWlmkjAfyyP61OapwHU6nanDK5JS4zihnr2lSf7fcD9KEHdnuVBr8XyWrZdNbBogKoTf7FKYuGk2BoyAbZUO2bVP46szZ5CjjHo8T2xbYNAH5p6c6qd/96MH0zMIOFIGVmGBgTQD1w17VS6UC2gB9IraQPxjrDtIKQiu9BEiUQSF6OTg1Fj0BaaN5/Pt7rQUAqPhH7QgaXe2SlFS7yYunC+tcQKvoaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mjul39VvoCWsgUG/dfTWd7kRVigawZP/golmyPbOfXg=;
 b=GtBsq+s6kIN6No8Q6EhttX7LJC+ouZrdWd5UAVDpxEzy5UCXnNDJzgXPhZ69QIvDgdAf4BSYHmVuz6qYCy9rIYnI+WisGT0/NeDrIW+TKDnn2wd9/8wVGyNj3bn9QtTewgzcPCWWwvAeHB0UP8KyQiZbIScinC4n85fw9WNXWYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com (2603:10a6:150:22::11)
 by AS8PR04MB8579.eurprd04.prod.outlook.com (2603:10a6:20b:426::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 12 Dec
 2022 22:08:05 +0000
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::ef72:e2bf:2ff6:a953]) by GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::ef72:e2bf:2ff6:a953%6]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 22:08:04 +0000
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
Subject: [PATCH v2 2/4] iio: accel: add the new entry in driver for FXLS8967AF
Date: Mon, 12 Dec 2022 16:07:14 -0600
Message-Id: <20221212220716.1829183-3-han.xu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3fd0de32-5a41-4004-27ff-08dadc8d57b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MkcW+LJkPWfVztlLj3YtW1s2/bj5xjgNk5+XOoWl62P0tIK1C7+IUqcG34MiGGDVuSvQnhc4wW3rChbbMG0ITG0a2XM7cRlhTmG3kHs+TbHUlH6b/L/y0DlooIciKl4Gt/vYNpVqYz4zHmeNvtr+kzl31qnQbpxHr+h6dJkDQkVEr8v3+o1RMmtr529lJICDh01QcI4v+Xy+5JJ3iFTxmEJKtqQnFX7zVPvH6s1/WOttbWfhtz5SewtHcaxt+SEO2Zh5U34WhJVKKMlqJMPU7Yti38Gj5n4hotUkmk4ZJoEO6X7FcAYlHnosTuFESvGzLVj0/UCKY1W56JOc/nAVxvYLHllrejLmrbY7YsBxYuHd2aoRSeFDKjxPOFbcFu5vgOs7FABGLpK6V4p4Qk1S2sGPfvEepQAyTYbnmHpNKuGEUJtItbZObuTe3f5uHPVfX7PI7j33ODD0gnDPLPeX62Pk+JWLDUBAgKKfElCjyhzHzQ//c2tDozM9SvOJgWf7bLCYFCwiQtjLLkoLA8t/TxQCLh1dUsU0S/h8q8wl9GDX52bYJcyGK5Lr5/gaa+JGplgpv1VktFXbmYW1KF0mR8AqiLCtyg1DeaOpPl9SIcxxCPrGiDYE+pdFDBuA02JF9bJ7PefZbgybx49V1KS5LFlc+4yPeVuobUVItMzkvjDa9F+gEGtLMidEyTBt4VGXTV+LlK8ezGdabdcjtBzbsw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9071.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199015)(1076003)(66946007)(66556008)(8936002)(8676002)(2616005)(4326008)(66476007)(41300700001)(186003)(26005)(54906003)(6512007)(36756003)(316002)(110136005)(2906002)(38100700002)(86362001)(38350700002)(83380400001)(44832011)(6486002)(5660300002)(6666004)(478600001)(6506007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iRPgIGts82WD8J8iX/QBKpkdHXRjWhtdzuI/lXny5oevIWdKpuvHQUb4F/0V?=
 =?us-ascii?Q?3ETnZspJTzGe+g4O75ItPwGzjUWitTfXaWqzzXz+4uv6sQns5Jds9ysmki6x?=
 =?us-ascii?Q?wC8BXV9o79mb6JHfM1xhDMqaKmWfdKNU2dY4OGrpdESXHKpupgzSoxDIBxce?=
 =?us-ascii?Q?g/B1eG492ijCydy663nEW50ZfEebo1KEUB7V26+GlP/oLGUgWTLmwQaSTJpw?=
 =?us-ascii?Q?1Ha1d4J3gjG0OBhjstTJGoa7txGQl5O3IjssIqgjsE6x9AzFHrgRMHFut8U/?=
 =?us-ascii?Q?4KAvrv6ZCfsCBftxv31XMy+/XWODJzOgMpQjnDZBVFXVErzQY+UgvlqgqudM?=
 =?us-ascii?Q?dC6YCleFqWQnu0vPinYdBQkeC3qaYJ7qipEFet7Cgkcbr6WvBnLYkoj8K1Fl?=
 =?us-ascii?Q?vs7ziKl6U6oVM74EPiveuYJm+tRKiCzVOP92tYEBYjiwmQWJbVLea6g2Fdhl?=
 =?us-ascii?Q?kxLVsog2pSkpkTkad+Hat7mDIHX44VcKNDmMJ5m5nRp2VXbajYsgUj4zsPH6?=
 =?us-ascii?Q?3vPUR9RdaAolBdGmpoDsxQEjOyrWOO0iLusW8xf7FF2R8jIXTF3yaEfC6UeR?=
 =?us-ascii?Q?8hOeIcsTXmv9hnvGAqqqoUhXcQvwhw32BUHYJotIdRB3VFvyB688QBuXBEhd?=
 =?us-ascii?Q?y8sIPN8P/fnheL2JpsX4pKAIqPGz87or7Av2IRiRy88kNBn0KZMhIMRcDS9e?=
 =?us-ascii?Q?w85FmWpmVMk9Go9JlYqx/bDUsDtJBL2tMX9hU6JOSJSzuzznQy/iTBDNrG3M?=
 =?us-ascii?Q?bjGqKKG5/kx3pBkBiZimBjTiMO2zLrPrEhorYajbUZI2e/MLHDGzHR5/0B7H?=
 =?us-ascii?Q?M/9iWV1F1lBwXOzKt19+Myu6yPLg0+uwm6O2p/i+JNN6V/2WaN4KGF5VA7uo?=
 =?us-ascii?Q?DSDm94b4l7kMQUo8dro3HA/Me6wPeQ+1DjUMZzTgIU2EFibtKsA379SG2CRL?=
 =?us-ascii?Q?P3CgNSXRBhHla86kcqCkMbOSHzl2qzuzDaBOcu4LWyCG1ky5CET1ucBy1WX3?=
 =?us-ascii?Q?nb7cs0ZUcBfE5UMlSvkn3q7JtSw8hTSZkwnruDd64Y1e4+KId9mTqXzvgkHu?=
 =?us-ascii?Q?dpNOIi7ar3Q2ZIH5d6YGOsUG0dNCgrpfNLy+yp9Civk2pjGwTfJ0xBVSABvg?=
 =?us-ascii?Q?3spWwRWg20ef7ykhhsn3T4ySEQrXXBratVXA0qgbXVxm8NP/NVvb7x8Ocqaj?=
 =?us-ascii?Q?/E+y7rKWAVJLsFxsFHABWzsedft+COnLMW4BtyT1Bqs2/TbCP2/IwQ+lngVU?=
 =?us-ascii?Q?oujB5LE65lc7aMyNY2eFOHR8QNk20+eMPUkR0MyJeakg+vDOKZc5+nDTjGdf?=
 =?us-ascii?Q?ImkaOeDKAEaiPz61UHF4f44J/bDP9Pc08aFEodNxtvs7U04+LsGaN0KjkYu5?=
 =?us-ascii?Q?f61bza13zSSOY2Vx7PLgZdgYKITwOrMuSCTgIxIksofownfq2ILNXGCC730C?=
 =?us-ascii?Q?/VH2AyFN9jbstb9189ocNYFiebTwoMg4uxnHkv+lbLLB8K5XR9/YeIGyMMH/?=
 =?us-ascii?Q?nYEQv5MPQaEy8pdNBrmVnyUSJvGV5Slx182qijkwdnhWBRbf/oE7W0f9h1zW?=
 =?us-ascii?Q?s0+v/lh4+nivy10DBak=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd0de32-5a41-4004-27ff-08dadc8d57b9
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9071.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 22:08:04.8316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xslg0EYg7zCvQff9LFHzXzF8ypup3hlQRiz3tBiniAmIogy0JJcffcYMOJZno8Tv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8579

Add this new device entry in the driver id table.

Signed-off-by: Han Xu <han.xu@nxp.com>

---
changes in v2
- change chip info orders
---
 drivers/iio/accel/fxls8962af-core.c | 7 +++++++
 drivers/iio/accel/fxls8962af-i2c.c  | 2 ++
 drivers/iio/accel/fxls8962af.h      | 1 +
 3 files changed, 10 insertions(+)

diff --git a/drivers/iio/accel/fxls8962af-core.c b/drivers/iio/accel/fxls8962af-core.c
index 98811e4e16bb..c3589c3084ee 100644
--- a/drivers/iio/accel/fxls8962af-core.c
+++ b/drivers/iio/accel/fxls8962af-core.c
@@ -127,6 +127,7 @@
 #define FXLS8962AF_DEVICE_ID			0x62
 #define FXLS8964AF_DEVICE_ID			0x84
 #define FXLS8974CF_DEVICE_ID			0x86
+#define FXLS8967AF_DEVICE_ID			0x87
 
 /* Raw temp channel offset */
 #define FXLS8962AF_TEMP_CENTER_VAL		25
@@ -765,6 +766,12 @@ static const struct fxls8962af_chip_info fxls_chip_info_table[] = {
 		.channels = fxls8962af_channels,
 		.num_channels = ARRAY_SIZE(fxls8962af_channels),
 	},
+	[fxls8967af] = {
+		.chip_id = FXLS8967AF_DEVICE_ID,
+		.name = "fxls8967af",
+		.channels = fxls8962af_channels,
+		.num_channels = ARRAY_SIZE(fxls8962af_channels),
+	},
 	[fxls8974cf] = {
 		.chip_id = FXLS8974CF_DEVICE_ID,
 		.name = "fxls8974cf",
diff --git a/drivers/iio/accel/fxls8962af-i2c.c b/drivers/iio/accel/fxls8962af-i2c.c
index 17dd56756ff9..a8944b255a28 100644
--- a/drivers/iio/accel/fxls8962af-i2c.c
+++ b/drivers/iio/accel/fxls8962af-i2c.c
@@ -30,6 +30,7 @@ static int fxls8962af_probe(struct i2c_client *client)
 static const struct i2c_device_id fxls8962af_id[] = {
 	{ "fxls8962af", fxls8962af },
 	{ "fxls8964af", fxls8964af },
+	{ "fxls8967af", fxls8967af },
 	{ "fxls8974cf", fxls8974cf },
 	{}
 };
@@ -38,6 +39,7 @@ MODULE_DEVICE_TABLE(i2c, fxls8962af_id);
 static const struct of_device_id fxls8962af_of_match[] = {
 	{ .compatible = "nxp,fxls8962af" },
 	{ .compatible = "nxp,fxls8964af" },
+	{ .compatible = "nxp,fxls8967af" },
 	{ .compatible = "nxp,fxls8974cf" },
 	{}
 };
diff --git a/drivers/iio/accel/fxls8962af.h b/drivers/iio/accel/fxls8962af.h
index 45c7e57412e0..ba33eb2b807d 100644
--- a/drivers/iio/accel/fxls8962af.h
+++ b/drivers/iio/accel/fxls8962af.h
@@ -11,6 +11,7 @@ struct device;
 enum {
 	fxls8962af,
 	fxls8964af,
+	fxls8967af,
 	fxls8974cf,
 };
 
-- 
2.25.1

