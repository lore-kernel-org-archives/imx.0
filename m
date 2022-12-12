Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2080.outbound.protection.outlook.com [40.107.22.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BE3746F
	for <imx@lists.linux.dev>; Mon, 12 Dec 2022 22:08:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOdDXv1fOEalbgP7fioQtJ9YIbjiXE76BKzlTgO4AziWkYyIjURKtJ9I3CpUbHl0lTIoYsICWRkOGcxtXhLRDxZTqTzeyU383gtJCxECrTHAv7GwMeKAdngbep1TvhDERHzIoWiDYWljOzec6p6G9nXywxZtvk7i9b10dXVkz1SIIKieWyDyVphZ+4blirwGtO/MQxMyLglXwa7bgUd/wOwmtAPoyhcg2i0ovRVMF1P29D9d0QlX3XyHk2xC9SwIgOZoqneer8og3AZ9ozsfIqSkEXYL34DOwtnEX60aMLWzXU9If6R8Oj2HzmF4wspAzJA3uCVYJfaomgwWknXrVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1Z+ejyl3t8DeIfISjqKDId18MKMcVJEqP+1bydjiSc=;
 b=PobUqw+d6N38BfMdk3g/7JZnINsEI5Y9Aj895QzA6aWewFRJp9Li69Uxl1vZatfNoA5WeBBH2VX9L5qnOW30FQatiH/C/feWnKY7COSmL2mT7uji6A1TyEAJjbOMnhVMJ4pMhTMLmFsmAhKVQvuKkoGaJtS+ZgHGG1TtokXyhlRBmt7RO144NUzs16mIH/4YVTV+wi1jG+QflrYvSnupLxI9UY5+kPOojzInFFL5jCPIvfRh9l3+5i0M+t31JnTQuXq2OMS/04SWjFenr3dSTBnmvy+sPOuSftNEdCrMTmqmai22GBHiKrpZocdLbiP1IBNqlDOde+JBIGT6UyEaFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1Z+ejyl3t8DeIfISjqKDId18MKMcVJEqP+1bydjiSc=;
 b=BpE3n3QleCSGNVba8KuggwhYgxYnu8S1Sv8i9ktn/TPa60/+ZKBQ0s+Wqz28mhsiP/EltN4+5Jiw1f6f7QqCIU8kvB7pHScNOqHllk+ytffO8fY03PWaFoEscwIQn1kuPVHd3RycMhwqkyNfP38Fn3k0JXaauJ0MQ8rEXrz0/2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com (2603:10a6:150:22::11)
 by AS8PR04MB8579.eurprd04.prod.outlook.com (2603:10a6:20b:426::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 12 Dec
 2022 22:07:57 +0000
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::ef72:e2bf:2ff6:a953]) by GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::ef72:e2bf:2ff6:a953%6]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 22:07:57 +0000
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
Subject: [PATCH 0/4] FXLS8967AF and FXLS8974CF support
Date: Mon, 12 Dec 2022 16:07:12 -0600
Message-Id: <20221212220716.1829183-1-han.xu@nxp.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-Office365-Filtering-Correlation-Id: 331f56d4-fb59-4244-8a37-08dadc8d5195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gO1uuPtQAju30v5X7mgWcX1kDtD7RXWm4GBu7fqAD3qo78UthioiMb27X6gkaDtGpt/w7SThxcWQPQV+cVaB/QKM9TSsBfl8Jhr1USx8jLbRZKV639pisAIU075qbel9TSrtuuX6rfuz7hsDadpPmkISYbvZkNw6SdG2of5KTQ2QJnmI6s3SHxVL96FtRFqMyU5PswEEFJnZra5j/m3DwM81NEMgHD1P0vF+oasy57Nt3vDmWjsrm9tBN/dU2WLrZy+uAC3UJYKki5sXbxgNnxTtwcqOvM4dYpVa8OkP3YxyoC7q5aS/fiXIIf6Ig/KgcKUDFT8gP903eDNAUCvzMTSTEpg5PHLGHuy3Z6fG8mswNlkJJlfW0c3Ol9sXRm+A5lZDIMApbySdZNOZSP1OiIBZzNSQFBAyFPmAk3G82f5/PrY2GGuthZisId9i8UHsIAZmN7J1SgAgFE2AiCNIEULGl+1uUSJCCfdl5y83KOFr1LcFsBqo/IFZniS9qgqOEhAOe9Ixb2syqTUQkxiQfG/fmuu7QADvyHqjzv9HDuPwcsnFRC0nEDhZK/yAgSuBca98lkKwkbATRFBtOI0ev3h7+BZT/1wIt3kTJxfq3uJ9Wlenlxma4IsZbPae1UJraMTDUGn0CKamRonJcGs5Y6ejORrEtWOIt2rqOWMCccEJBF9pzoJE3u+vl5P7xSr+0oEcyMO8eaBfbljsc29wuA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9071.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199015)(1076003)(66946007)(66556008)(8936002)(8676002)(2616005)(4326008)(66476007)(41300700001)(186003)(26005)(54906003)(6512007)(36756003)(316002)(110136005)(2906002)(38100700002)(86362001)(38350700002)(83380400001)(4744005)(44832011)(6486002)(5660300002)(6666004)(478600001)(6506007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vny8QepzYz1VhMd2hR1hllkpv+tl4IyyJ8i0WOKRVJHSdXPtk/Jcyzs2UgpG?=
 =?us-ascii?Q?mykZq0oXmtnjDuZzpJGMjTk674pGsD+Bu5YwV0gO/9Mve1wABFPWdJ201+pC?=
 =?us-ascii?Q?cjhwPqfdmRuVDTLN6hdQyEPiEdr+FkKnaeosEteNqNNiGAIYxAHoO9ASK9Nd?=
 =?us-ascii?Q?pQX2oA9Vi4Qu0I0KOcJiNwPYTRAEqIEp23zFU0Mm47IxuQROMLYTyzOHPvqU?=
 =?us-ascii?Q?0O5bXExQth3A+2HDpUXJDceH8zmCiGXzXAi0X2Hyg8kg47K6sztxUSzYB9tJ?=
 =?us-ascii?Q?S4K6z/c3ohJ1qBpyRT7QFz+sBF8cdzI1aaT9iKSgMsUQJQbFGZfJ9ldPCTUN?=
 =?us-ascii?Q?f2HMml1vo+0Wz2qOhhDs2lHF+akD+83nN9dHg78/5L70/gW20uc5M4BMuCNh?=
 =?us-ascii?Q?9waS6yhfU+FK4fsbaWmwkQmZe/KoIlrfGffCr43T3NhMpBdqDwUNBA7Cx44t?=
 =?us-ascii?Q?yOmP0pLqYO9qbdN5fKS+UW8uI/YdDQACfPhGGttWKDRPcWCga1y66VAXVf2j?=
 =?us-ascii?Q?JASiYKs8/CbweqwR/eEiXdWz2+OZDbpAGuzvuDdjkN2tX22QI52paE+UwzYG?=
 =?us-ascii?Q?WIHJUqYfDYm4XJPgqgqsv97FwZyrLhQEIWw7lx6NaOen9E/aAImQg8ktbKQH?=
 =?us-ascii?Q?rDrLlyIfX34xTayL6CRbBJsHnK/g5buMgxDpoaX2lnNQxrstoTiUXWPsP6qN?=
 =?us-ascii?Q?KtTpoU+83OnHY3NmX+k4R60KElL/6VK/V5hkbr2H/tHK4jEKGqVjmoAkOI6b?=
 =?us-ascii?Q?aXVTE0Ux23HNCa8QMSlWlPY+7cd57eGHsMFtXYaQtrvGppQhHsNjLKt2sPEV?=
 =?us-ascii?Q?nHY3pWNmviAa8E9vVEhwnCZKK9JHnbcAx8Zm5Qo+2YSKBM7xdXMQUiU+St9u?=
 =?us-ascii?Q?F0Ay+41+GfKBNz92CMTAUeZj3V8Y8YB1lngvjsg78/w3ndrQHKGr9YJkDouQ?=
 =?us-ascii?Q?CeG4xwF8Enl6EX9zCoXTGUmj7TybZP8os0aQoW78UxZ6Y6qmA05G60waPp7+?=
 =?us-ascii?Q?67KRqKNmK75MWPbJzYRnJJwjxQ8F2IdRQGxA8N2NsWNBLV2FVfmTq34u4WPk?=
 =?us-ascii?Q?+jISqkZ8gb3J+tT20X1aLNjHsyKpSUizW/HPfRNcgMe8lBM2+LhTa653NI/q?=
 =?us-ascii?Q?+2yNJxR7nTbBLftut6NyW+rH+Uw+AvmTOta2I6f8ZHzbkjRK6Ke+mRy6lFr0?=
 =?us-ascii?Q?VCVg1eVeHDCwSs82Llj92OUTCD8VcBwM8/G4FKgXhz2eIac3pk94CAzDeDvF?=
 =?us-ascii?Q?Y/j/7pxMDcYZuMyDmXa95AzNLKW7HdSD8rt6zlOl76t2GJfjEVPe6KSIyKLZ?=
 =?us-ascii?Q?qq+VI80ypaGZiu2SPf9QopgoSSlbFKk/kZztEsLADWMTAnTIeolHIm4kTDFF?=
 =?us-ascii?Q?1b5ri6Auh6/v09oCpywKBR0bgw7uEGmc6JtiKq+eoNqgCfhmu+GXgv2X4R6A?=
 =?us-ascii?Q?XqHujJ5e3AZ/tD04Ts/LGJPoTDfp71/0a/QF4mfulc6Jq7XAxZHcaAbm7CcN?=
 =?us-ascii?Q?Rr/pNRE0j3GQ9ZyYuXF2HzAx4xPPdnSnpI5a9QMOGZ6Sqv5zjJkMdG7qG/Nb?=
 =?us-ascii?Q?Zp3M55nZAn2bSB3URSE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331f56d4-fb59-4244-8a37-08dadc8d5195
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9071.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 22:07:57.2514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T6u5PlEv0crau5q9LZHBnl9PX4mj1fwN9ZG6hemsZd5ZNr7ME3bJwqz2icAIKIXK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8579

The patch set add two more NXP accelerometer entries for FXLS8967AF and
FXLS8974CF in driver and update related compatible string for dt bindings.

Haibo Chen (1):
  iio: accel: add fxls8974cf support

Han Xu (3):
  iio: accel: add the new entry in driver for FXLS8967AF
  dt-bindings: iio: accel: fxls8962af: add new compatible string
  dt-bindings: iio: accel: fxls8974cf: add new compatible string

 .../bindings/iio/accel/nxp,fxls8962af.yaml         |  4 ++++
 drivers/iio/accel/fxls8962af-core.c                | 14 ++++++++++++++
 drivers/iio/accel/fxls8962af-i2c.c                 |  4 ++++
 drivers/iio/accel/fxls8962af.h                     |  2 ++
 4 files changed, 24 insertions(+)

-- 
2.25.1

