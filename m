Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2063.outbound.protection.outlook.com [40.107.22.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A700A746F
	for <imx@lists.linux.dev>; Mon, 12 Dec 2022 22:08:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtkrhmIPVMsO+p8MEO0iaEkDH2iCbFkMSC5ipeWd7apA+UuGR2XlX5Q3tTc63RG92XoErxc5UXOUgvuc4DkiqWIRMeSrG4I9kYMXZJVOEDAlFTMOELZm/zKEwzos/+BUw3sxjiRufYGb8LmUihLDJdze4FbkHZrLjB/13Jxqn3hn9/wq3e+RkamyO/xZHr9PWTWeLiUP/Nmumsay+c+EWifh/d9cEugiBikW3o1rPkrz33HzZcOon4XJKxhnATzlrnkLH/Smy+WeOMrbwgeMqik8Tx4tSqI2CmpIiUR5eEA6jdope8XFGrEtvJcxn7v2Qh83qEmr7KiIknFp9F/MIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5fJXSVFJOH1SaEr0rmjfWEiu5EZ6r+dRtsuLoruwZA=;
 b=YKX4Dzg1eZT4aqRO3JTVdaFou5t8PSX2qq4jfy0hbdcGT/ZyKYN5G8WilJgpjS309Z3c3HClX4GsDc8KDG2+jtS3z8R/TWbb8PF7i2H/uGDKtYrE4/Xm5TLbjdxQzRX9jOEBeIOZ5sennEOxR7+xnD814jMkt1mlQNXYxC4rY59f6hzBgp97WPXyFkepRm7NgXXa3T97IwnN4YYm9oj2CJ7QzagmQ9MGrW8wo3kt3HzLBXrDHmmtwG2JIQAz2Xu7P9of6Jl0JDVqElBP++NJaYc/38mOP8YZxxpY1ZAXVCzFo2sJTu29KREfsyWxBVd+wHoz/Kb76GvOh3baSKuc0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5fJXSVFJOH1SaEr0rmjfWEiu5EZ6r+dRtsuLoruwZA=;
 b=MYbr0bBoKGeWHxaQUldePPZUwIlekkCRk+i4RDqlutNEAr0AvxCEim4YF6C88ikHME5UZKLp2441GSpGiMyO5gyPNjTQF/AolZ9TC0wDlziPsmjnRax89AGFlAcB9CWzoTLfJ6BsNciBTpXFjaDvDdwYLOXx2BvbKJaM6NfS+Uw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com (2603:10a6:150:22::11)
 by AS8PR04MB8579.eurprd04.prod.outlook.com (2603:10a6:20b:426::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 12 Dec
 2022 22:08:08 +0000
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::ef72:e2bf:2ff6:a953]) by GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::ef72:e2bf:2ff6:a953%6]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 22:08:08 +0000
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
Subject: [PATCH 3/4] dt-bindings: iio: accel: fxls8962af: add new compatible string
Date: Mon, 12 Dec 2022 16:07:15 -0600
Message-Id: <20221212220716.1829183-4-han.xu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8e7baf59-bc64-4ab4-1171-08dadc8d59de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5WJroYNlfh6PIyUf2ZiRDuiCw62mrNmKvflGJYtRmDOgOsCbzBcfJ5xr0YHEjIz9H1ig5IQPetfGNU9lc+JlVCi5T9kjy0qmlL4OhPfqzak9YAoseJGL6T9XLTT8tDxJ0JBDoplBlxtMhY9wWKtd+jpyPaohV2ULv8Yf1TmvRZF2YfA5Oj0d6546WzDLG8jdXzkfwoEzb0CBmgKjXPFle/RxZ5J99mukEzshklT/FczMFB+W1lnFLKG2VMRnzFemp0Q55AfPYNmHJAjAjcfJvjP4mM7/bawOeLAC7VbwHNE4+8vYnel1eFCoWHKmPiXaf2M/XUKUiamQJDXHliOhgLNyNh4eQv6IS/qvAdvrJ4E5BY8smNyFjjFKGXBqs7f9jzAwDzJyAnxYgpjiBtsmA4WHkf7cutIy1NSuymD8PjHV3R+MqUhH3nqMFbR78+WmdR8htxw5JKNtUGlC7+03FcG3ww19MSStMKaMC0sARn3aarf21BAKjw+hmyHsgR/pOyQeUKg5WIUMFDjVZ492PqS6AFyEXRAReTUMvqAQfKcRUemyBBW+2bHlveILUPSi9WWR4YvLwiUr50jSfJAwF/cBb94T4mvbVPzV5Kqri6F5KbtgKfNYSvAz0ezPECHISc4bajUVyyDmtSovPSog16+zVzevl1zgmUNBx0lyWlPIkCJP/SHAzmXpwFYz8fqaWKGEJN7kaEHOt9XQzTn8JASRsFnjdVDHHJ9ZriR1OY2lMUlr0IA5dCASR0DK/ul7eWHbnwEM7f0uoHZc2DK08g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9071.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199015)(1076003)(66946007)(66556008)(8936002)(8676002)(2616005)(4326008)(66476007)(41300700001)(186003)(26005)(54906003)(6512007)(36756003)(316002)(110136005)(2906002)(38100700002)(86362001)(38350700002)(4744005)(44832011)(6486002)(5660300002)(6666004)(478600001)(6506007)(52116002)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bJmwv4sbB7OhnK4QkorsOfqMCBQT6EzmBnPZVp46TxshasL0K4tT62J7jjrQ?=
 =?us-ascii?Q?NVzcsNinhXAlN2W/pJ5Xzq13AM5ajLNrKYARpSGJrvjte5h37Zk4pRSu/er2?=
 =?us-ascii?Q?YfiTxuMvBCYjINNNME9RmTtj6eejlYqDmn45JAFKW5DmPpeOCG6MHRrcIOrA?=
 =?us-ascii?Q?Cj8g+8RPwB3e5Z4NrEKodoc4UW4B2L41hHhmfli2phNQmSMUcf5PRL7yLxGw?=
 =?us-ascii?Q?D1yn7FkrP1nr8EZMP0qeMacWvS98BCh5VwgbcHoAGMXjQybh0GQ/KT+H21Vy?=
 =?us-ascii?Q?Vb3cM2meXXPgffB3nrZu3FD3WJbDPETqOv5Pr9lc03r5zMH8C57YiuVD+fx7?=
 =?us-ascii?Q?Dbpku2tVXZiKq871+wFk5DuCBb9R9VQpLqaiN+2XXgRMYA+1qHFmtLwKvQWW?=
 =?us-ascii?Q?WoTI7Cb2Z9tDf2ykgkp7wH2zao2Efrog0f55THu588tzo1HV6yIweou/4p4I?=
 =?us-ascii?Q?16ahbGk4m1Sqzm8pO9JMGC56B2O8PM6gdf0IaN5bn53pnaF8GtgYElpo+ycX?=
 =?us-ascii?Q?VmxCyKZXkK3P3RYbwXmKGsv/I7rAvGioHVkqMvTU1cvgrR9jDq1B8AhH9CGM?=
 =?us-ascii?Q?HDqCoET1wFb17e5Ux+dn/yJXBzG9eW8MCzBiB4iIMA+H3bAnpyUWJQMIJhKN?=
 =?us-ascii?Q?yZD1oJLjrADOkJXEnZQXdg4Wvr5svZV6uAX9NGFnaES0kNU0jU8sP8JGUqJP?=
 =?us-ascii?Q?YDAAofjaPd/ceAOUyAMbSuFxtwnjaTE/sexHAdZVWf3nNZWY3QJySBZ6qhXs?=
 =?us-ascii?Q?zk8hDu13Lt6Lb/9d/hWf1gLg15CTL46XL1w355NNN9JCm+75Wo9ke82yNORU?=
 =?us-ascii?Q?t/XOx23nDNpcB0T8xKwiQ1Kne/wO9+L+8Zqi4I5SRglymhvUlGOetWbgmW4D?=
 =?us-ascii?Q?oHhBzW8CburlWDpcMfUT0JHQcGblQeT5bItyOn9vErgHTK5Z5LBab8AklUcX?=
 =?us-ascii?Q?dYkTUCZp7ECy20MZvMgTAcUgBin5yaYRCEb+dEHonzJUImbxx+QfCm+edoc0?=
 =?us-ascii?Q?wa5GNlKBD9WrOVR1SrC4ksjP2I0rr6g1WOFWan+xQc8GAF3Wi7Q5NoIY4vQH?=
 =?us-ascii?Q?qkX/0KbRU+Qu2SPbH6B+djnB6AxiYxajPeM6lIQUCyT6FKs4UoO1Y2BTi8Q7?=
 =?us-ascii?Q?uD5Kq2iPn8x/KD+fzco4oT+8exfvzqKRuJPrwQqWjVZ433i0/mb/PW0zELqs?=
 =?us-ascii?Q?TANmZ6HS+Zm9j52JTfv82i3dXJcVWKNtof0ze9CzcqGExqdfyefEvcJvdUc3?=
 =?us-ascii?Q?laa/z3qxHglrz8FI0aqLUWW+7Z08bHrONZrIFo+1HL0spoeg0puEl9h8tFjh?=
 =?us-ascii?Q?g97wQjfp2pCwrQRzz+aPIvuomwMQSKO7U+vKBZ4A9UT9fcJ8NWUUOFxcf8JL?=
 =?us-ascii?Q?SHnm5JdP0HLlZJi4O8FDNn1DvpUQDTV5H25X3AhDBg+roQeXzO24vM2t+hss?=
 =?us-ascii?Q?dux51ZzG1zljswigv1IC2kPVP2jNTyhIrD6e8Y7OqIC7zgo6CBTj1wjnVdV8?=
 =?us-ascii?Q?7Pf4JqzXracWxeNztpPxvb2M9RG2LakzExOv1jMvFExd6oZCAF2NHs0R+UtE?=
 =?us-ascii?Q?srlTFTg17LdbYiCPP88=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e7baf59-bc64-4ab4-1171-08dadc8d59de
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9071.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 22:08:08.6491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDKUOgeYk+ZDmbh6TPkwamz8r6XItTlhX6YZ/CinIpRkFvWTddV+wUmUSYg3QFPk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8579

add new compatible string for the NXP FXLS8967AF accelerometer sensor.

Signed-off-by: Han Xu <han.xu@nxp.com>
---
 Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml b/Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml
index 65ce8ea14b52..400eff3ff315 100644
--- a/Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml
@@ -14,12 +14,14 @@ description: |
   SPI and I2C interface.
     https://www.nxp.com/docs/en/data-sheet/FXLS8962AF.pdf
     https://www.nxp.com/docs/en/data-sheet/FXLS8964AF.pdf
+    https://www.nxp.com/docs/en/data-sheet/FXLS8967AF.pdf
 
 properties:
   compatible:
     enum:
       - nxp,fxls8962af
       - nxp,fxls8964af
+      - nxp,fxls8967af
 
   reg:
     maxItems: 1
-- 
2.25.1

