Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2076.outbound.protection.outlook.com [40.107.22.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C99746F
	for <imx@lists.linux.dev>; Mon, 12 Dec 2022 22:08:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADMLnRWdd6xvJstqm7uZth/7HcCFuCMdZjZgChCiR6Pz9CoPuT8ttyiD8n+5Kx8AySvdmf4QJI9m1wYlpriDLqxhpVHkNQULRu/DtKhIVlOMV6cWRmrhBt92rSNnCcY/mTmomwsZE9U/iKRZo04go2FYQjbMH0AOaqb0ddXt6pJ6F3lT7dnkuglOI/S0aAhsNXBLWjPHDmVOr1Ch355S7zLQx0RHiM6yPEJ6v0WDrZn43k8Bx2NJlncAuBLvHy3HIlT7Np7CgxS+0mTpwIrN0/FvzbKdvieIqtUKlYjDDH9MAFIChbrvMzeRl4aZ6zujKEKmvyrMR/3a7EUJ9Dhdvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ir/noRuxw4AOVijnIXfBTGv+6cucycPnx1XTGL/P99c=;
 b=EnAgvs7rSSgbypiayP0wo7ymbgejBfPFVPgsamseLfI/uEfJCoMr3GoXe6uU/TwoR7w1pnq4CKMpgvNMzfRuFHfYLeAh6X+KJYTmB4/r4JdKo/i2b/1I7BcDwtAlJQWXZPrC9gSgk73PyBv6W54ZQ164XOyXirNPIPQhNt6B3BrDjdzf79P3xupkDXJ8/aq0qtDk+yy1yTee7oeAwWM9HPTohxxyfQiFg3IdvqTW4jLSsGCJtxb/ioWZuIcRpUuF2SGFZSLyJznKiF3nG+IQszhlx+Fg9jVZvujqvqNn2VqhP8BbMveCQZBckJm54gM21fXkO5DKBs/Om8NdggFVCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ir/noRuxw4AOVijnIXfBTGv+6cucycPnx1XTGL/P99c=;
 b=Oc5SgB9rMm5OUonkay/Ox1xY7GldG96I5IGwASE/WfliTjVHcSDbttF0A8OEwYnPYvDjhG9IdzRgZkvHtmm1mtjE1LZ94tW8WLdzVBcoH5HQs8oUdkdUj6aLpGqdWhtadcUPE1Zw2m31QRuIfBAdxIv9Slhxlbs7eyLivBho1ZM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com (2603:10a6:150:22::11)
 by AS8PR04MB8579.eurprd04.prod.outlook.com (2603:10a6:20b:426::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 12 Dec
 2022 22:08:13 +0000
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::ef72:e2bf:2ff6:a953]) by GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::ef72:e2bf:2ff6:a953%6]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 22:08:13 +0000
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
Subject: [PATCH 4/4] dt-bindings: iio: accel: fxls8974cf: add new compatible string
Date: Mon, 12 Dec 2022 16:07:16 -0600
Message-Id: <20221212220716.1829183-5-han.xu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: e902639b-2568-48a7-3ebe-08dadc8d5c4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4hSbYjyhs12F6E0Do84SkNNrFHRK/qar6XB+N7vpY7S6P+J79t8Jzjag+GftA6BQmJZkOLfFw5g2H5LydSeOguFd7VsCgAJa4HHUmW9rlagz0GirgrSI1KSP513HbAZbF3ZgX9XqGUsjp4amFO9t0EcwffmH0mjSMQrYiNNLyipvsP6WAXoFIVPLiW414r6wVndkNex02XcPYODigLdVRpDBHvNQIf04MFXIxTzfxi6MzCtALFJdxVuAqI9Qg9+r3T4eLkEJ5/KKFi4g8HPPZpziwEwsco/vtMM7aipRB8KW4S0yFPenJEr0KD/evm5EcUZzSKYglLhRwREPoavych5SvFOQGDup+8y7hs6S5YZGFHiYRThzI+kwfU9FJBjKeistC6b4pQuAXYgMiCQ/KDyKU2OC5UYB8ncZSdcZTpLwjGjEL5HGmcT7L8C4pXbGrWe4Rn07YgBXeyZqN5sM9bTndQN6ssjqu3lcHpI5HzCXnah0CjvwI604YpiPUboqJ9ndphwv0jX1g0buMHWvHO1drDDiVS06BU7gyRmcaFf6z5btZrkuIvUyp2IG2zHSLtRQ76/SqukdUvdQZK04LHd846In3ywbo0rwVaPEfz10pBFa6N4H/rQpEC74kp3L3FSMCy+gBPikZ1e/4kNwwKnfkpYgPpjNte9V87w7OKafxYttzJU5mbe2JBf4uyNSD8oDefmQtD3p3+EIRxHety6cQPVgqFRpaFn0eMPnglGosIMQ0lrWayIx8p6dcLYkLMb12GJSwXsV6NfD/cpfXg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9071.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199015)(1076003)(66946007)(66556008)(8936002)(8676002)(2616005)(4326008)(66476007)(41300700001)(186003)(26005)(54906003)(6512007)(36756003)(316002)(110136005)(2906002)(38100700002)(86362001)(38350700002)(4744005)(44832011)(6486002)(5660300002)(478600001)(6506007)(52116002)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g4hffA+0NkmETppCSGLnQb3+1nbFCfbrkJ3fdmQ0LhcHOOCmD6tJpNCwUipO?=
 =?us-ascii?Q?QsvRptMyzpYJ9pPMHbJ6OsOrHsSR/e9ReBDhH+kWiZBSM+DpcCTMh85sqEzM?=
 =?us-ascii?Q?E08suBS/f9RRly9R085v7daOKKJrg94r8wd2LsTQWFDOERHKp4FSpByMJEER?=
 =?us-ascii?Q?jN/0aSgfXoCtKLhH/X6s1mHLkLNpKWXfhUfuZ6xxO+LY71vaKkITeZLWSg6J?=
 =?us-ascii?Q?7Yrl4FHUoYFqRihbLaV0LlWynnuedc0WHyiniQ5x3lz4b0y6n2fjZT8aQTOG?=
 =?us-ascii?Q?5IkyF1Ht4ZyfOXbTr2jZb+yjrgeakC6GbNGbxUmqVh2t9EDI42ga2vu+dCSa?=
 =?us-ascii?Q?d/G6oU8Bn3CoFrmbF8JP4A06eRIcV8Tk58s3Oup/me9JqNHai7OlnnqfPuIA?=
 =?us-ascii?Q?rTxXCtD2nrZldAxJ6aXmAp9/Fei6E1iQjarGIC5cNZIVjrMgGjsgsaAUOG0A?=
 =?us-ascii?Q?D7HgJEyNkom6kesQFrVhxO50jexNyKSDCQAjXi0j4FNTOVLZ1Om3ByNsC4mp?=
 =?us-ascii?Q?wUM/Fad/4f6ML1VxjFFTPyUy+d3/xkL92r7JcQU8clBpcq/cOjd+WSbrkzZR?=
 =?us-ascii?Q?ympGaVl7iJ9BeFKxI/eNIuaY7Vj/EAiZM2Nyq9IxZhC6m2lBH2HS6FgAQmQU?=
 =?us-ascii?Q?3tICyFRtvusFN3HtMRcT1xamQPN5zKtIMA9eRZ3THQgKQur8Kw1pSp22dHVT?=
 =?us-ascii?Q?u1dn9Jf3SbcQBiAjq3FSpcWLuqf8l5CMYdiA+kpbrJJYMvqfwTMbwo4MBk3d?=
 =?us-ascii?Q?MwQDk/j4CB2v0CEfBT+8W0C7XxBSQ8MqhVhIN1fERvBfAb8CnZz5rkhV0rms?=
 =?us-ascii?Q?rgjbPIhDCJPG9wxOiVGtBIeWZUc6wV9tomoFPGd2qPAHkUmWzcJPxBatT2yo?=
 =?us-ascii?Q?OuVOx+M67ZnP0jeL1ShGb1UR+fDs/xVxSs7OTGWL6reUtvipXR/w7/IYEoBV?=
 =?us-ascii?Q?TZe+IQZhs/qp+LJwxPtODW+vlyrD6/J0aE+NHeqR15f2vxBGOvrt1KPFQYZF?=
 =?us-ascii?Q?WcV584fVKF477lFMTRq8YM1cVbH5TdqRUrGVV8ef4DXO64MFds1m9HpcQNNZ?=
 =?us-ascii?Q?fku5fr/YIiXeqskfqutOEZZO8QVBljHk85koCpX4IebB5LD4LHY8UmW/7wWI?=
 =?us-ascii?Q?1zm79FKkOsnLHGSUHD1YC6eA2JXxxdGws4Xmw71QDvYZ43FaT4mRKxkoYFTb?=
 =?us-ascii?Q?ljYKEcmqkcUNKF4Og0B9Nc0k5oGfrgieTxMpwYSWoIhkSND01tHq7w+qi1gG?=
 =?us-ascii?Q?EV8o46UOoaL/ksz5ebYlYKnumrHwUMTyYEYC8byyibCNxtnB+re+jyA/03Nk?=
 =?us-ascii?Q?i0aFP+mpBYC6VteihjjlmbSilhkPs3DuIXEYIMI+C8TK4TxKMCIRPc1MHKXC?=
 =?us-ascii?Q?HrTMcI0/7bm3CmIk62E3Tg52lma+zSY9O8DkRDKl/07CAm58rP3ksn2alvpU?=
 =?us-ascii?Q?2GTbbfBUwh/3Q+UTx5IpGIxo0wdpqRNK40CePuAVLhglLpSkLROki75O6Xz3?=
 =?us-ascii?Q?Hh/A1IwSdzGRskrVw26T5qGuTM2XMNNdGYjTRKc1OBLTgZbFeFaWhiCeO725?=
 =?us-ascii?Q?jWW0jjoSKvuYTLlUV4I=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e902639b-2568-48a7-3ebe-08dadc8d5c4a
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9071.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 22:08:13.3369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NqAi0e0VKPhykNR9LkUh5KSg7t6TampuwPZoz/4ZFfMEenOABihIdnhhZR8H4Dmb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8579

add new compatible string for the NXP FXLS8974CF accelerometer sensor.

Signed-off-by: Han Xu <han.xu@nxp.com>
---
 Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml b/Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml
index 400eff3ff315..32cff7fb79ba 100644
--- a/Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/nxp,fxls8962af.yaml
@@ -15,6 +15,7 @@ description: |
     https://www.nxp.com/docs/en/data-sheet/FXLS8962AF.pdf
     https://www.nxp.com/docs/en/data-sheet/FXLS8964AF.pdf
     https://www.nxp.com/docs/en/data-sheet/FXLS8967AF.pdf
+    https://www.nxp.com/docs/en/data-sheet/FXLS8974CF.pdf
 
 properties:
   compatible:
@@ -22,6 +23,7 @@ properties:
       - nxp,fxls8962af
       - nxp,fxls8964af
       - nxp,fxls8967af
+      - nxp,fxls8974cf
 
   reg:
     maxItems: 1
-- 
2.25.1

