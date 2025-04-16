Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2069.outbound.protection.outlook.com [40.107.20.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD34221FDC
	for <imx@lists.linux.dev>; Wed, 16 Apr 2025 10:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744801083; cv=fail; b=FDiL8T29D74QtuM7WHehWQ9aAA9cQPPgS02/ViGSvL2OHUZiHCBQan6ji5lCHnovCPj/KGHw3At8XNe7CQhyfsk3lV0MAybN2sEivTnmV1fbkU2dsN1z0iXPbxtxaC2vKpyaeZlDu2ygI8h0ydHMEBbIymIhKdDckcmJ9j4TXcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744801083; c=relaxed/simple;
	bh=kXMJlms4a0/e42FZa6Rdtyi67mtMXZjAQUbzl9/SfLE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=TINJ3kKYJiFu/Sn17HVpa59lO92cox1R2jiyHRMdq8urtnIkmGPPYYA+M4wND1x92pOfQ6sHhbhFhL2BgJv20e4kJzTkXPnHOAnunWFjUh5i7TKZEh8yIpeZYgc1Jq1r3WTASgP2uxpDJFZCL3QoeIMUEaBl0tum4EpTfYm2wLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IiFchhPw; arc=fail smtp.client-ip=40.107.20.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IiFchhPw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8B3gt1iCHr1/d5lOp7NblV75vfRnBxfIUqZ4mlhVMCgl+7Xbc4Yo/6IiqXZwcqRian+vKNgTRLsxrElLiqCd4uVZpT3ceZPJ4nvAH+EOW1+USaSfxZM+56C/ohuZwa4L4/aqLy1e3UHfOunQ+tOHM42wfD6cd4RQdxBoK2R+3qUQkUGQsmg03qPAPtXy9v8tXrff1bWo4SP+DbU7AwCzj4TqrG+wq3kKfpPE9AB5xY16s5g4qFxcTfF78xUyQ5nlq4nYCfGahJUARk2xndrg7clSOHDHstnDnLJYaAFXqLLtNbVCaADshBuuYB7R23jtBqKublfbgrljs8dr/k9Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCQNt/eh6oUNwRz2ywrez4ktVAPrq5DIeH7YFyJtHhY=;
 b=nckU7cA5sXaK8qvHoMGN9o441W57Xvt+pVauIjTih6coi27tXoHevMsr5TMbmdomaQ3ER6kLlk2huPmMm1rZhNC5f5VE2UozYwAwWwFwNWid7Xri9NbVJFuYptTRhtaT9uJdAu/O8OPySdP7Ya3Dvl84LCIAzcbM8WUGU+WBkIqwoamosefmPqPXuAQu2oYm/5md+i8Ov+jftnCJ2pbOx3iiaunFIvcHVsjyQOyWpc9R8lojvUG7N40wVqHMqwVP0KV5SpW3RhwsaXwb0fQBrp+5EgsPoTSSERqALMt8RG4IYF6fGZRIc9wWH2aKo3lBw0wjSJ9KzzhhtoNzE/nZVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCQNt/eh6oUNwRz2ywrez4ktVAPrq5DIeH7YFyJtHhY=;
 b=IiFchhPwISOTdfwilVARBbRzBdtAwcDtLhyLvm5MN7khRcpa0CzCTSHLZW7JKqWreXcp6JfI2e/P05H0COJK9AZhnYoDWVGP63+bSbQAeGMvR8v9VaZ9WSGWVW2Y8zJUHVlyyD6Mctl/O9ID8PvqWEOswJkAe+dj7fzVh2353S4J8j3vYjlvkNNJqQmiJ2gzVQ/pEIgeooPA8HZt+OnksRHefNaVmeoK1gc8MnpOErmgUPhQkRmPkVEJ2raqmNzQPilvFhP1h0NicJ8rfLfKlIB6nvLI5WdSIta4QSRxKMpS0EEVszOD7wx5OE/O+FAT+gbQQ6lkFvSJ6IK+OJf1/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB10106.eurprd04.prod.outlook.com (2603:10a6:150:17d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 10:57:56 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 10:57:56 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: krzk@kernel.org,
	myungjoo.ham@samsung.com,
	cw00.choi@samsung.com,
	robh@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH 1/3] dt-bindings: extcon: ptn5150: Allow "connector" node to present
Date: Wed, 16 Apr 2025 18:59:38 +0800
Message-Id: <20250416105940.1572672-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:3:18::21) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV1PR04MB10106:EE_
X-MS-Office365-Filtering-Correlation-Id: 22e2854b-80fd-400c-cb53-08dd7cd58b2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zM+awPXpFoV7ENrExb5Q7eM92Ot8yYVbv2EBDoLg8SGoKlME2WqsmOI0gntg?=
 =?us-ascii?Q?qDbwZObxX+bgSnkwBL8RbippnQ5nGmm5Pu3IMCG6NgUpCumBklTWemRn36DL?=
 =?us-ascii?Q?dSoZhwFNtyRkCdy5w2dsLnj4jQWqEKKHYCHBUrgajW8N/4vEgL+saVyxHxCW?=
 =?us-ascii?Q?s0jkze2i2x25uDIungQMA8Nl6R7X+dwIyndqSQcWdftWXqA4NW3zZ9Z+r3Wv?=
 =?us-ascii?Q?Ol5ryWalpqU8Z+GIPr751Wx64becVE21tW+wO7wwWx3RPZLgeGyz3TLbITPP?=
 =?us-ascii?Q?7P8uV73pOk4Y9Cyv7/j2s+azZ+TsIphpnM87zFQ08DJbvhpfu6nJkHyD7wO2?=
 =?us-ascii?Q?7iHpQPMXbn0Qlw4msl/eQdJRlsZV08E7xZLbneORygn7tv7juprxn7R7MrYj?=
 =?us-ascii?Q?tuk71afcBzbF+gO64matUCcGqaiptxpKl/YqWTD86p4twPhb+STo4838Uj4J?=
 =?us-ascii?Q?oh4s2BO+hDAwFaWsLsf3OOJ0RPNCvf65sbMvaWgLdnaKyZKt0X6vx9pXpTfk?=
 =?us-ascii?Q?Tq4j13wOmPMzyESe2f0p7OhiRMRd9alFhUtok133uI+XDXwwU++8bkST0QAz?=
 =?us-ascii?Q?Qo1Nh/DOxhbnztADYkj7K/5P6CDX3fkHPlfTRevbBplBSff86/IH4r5iv2D9?=
 =?us-ascii?Q?SUx64DfJN1X8QfZkRhYs/zZY8Dkv+tQifQSUsRqUG9EoyNjuCPR2ReUMYZEw?=
 =?us-ascii?Q?Seb2PLp93JWwD2L3Lb+sZrR12YunurT6UcVEByyg5PubPI49VRWbpxK7pFcz?=
 =?us-ascii?Q?21Lo9OVqmHaiaLjP3YoKSm/YNGBi/VGbYq+h3upO7DtZVPPLJHeN0jP4uTji?=
 =?us-ascii?Q?808WTXAmf1Icp9z4xEnFeukgtuMhletvn1IWUabd73c/1r47OGB4URpMwymG?=
 =?us-ascii?Q?C2gWHLUvFLq4ClRHfaYucmIZR+/PlsL5DHv6WdT8I4tXJIp7+9sx5V5Fk+rG?=
 =?us-ascii?Q?r28pLo3sbJ0mg1+HIufU5qZ6jFFZHx4Dx3xucxAuxQxhNqHjLPLwC781B45q?=
 =?us-ascii?Q?pWBABhuSvXCUOD4WGf2yGzi+fv+lnLftGUeXlk5AHdB5ZCCm6Ph6iyHuv9Lt?=
 =?us-ascii?Q?X17mN43BdIdSLEMcFSY3E/i/wjfAud3d8fITXSP5uuTVKqE1mximheasikvL?=
 =?us-ascii?Q?j86KM23GJxqfZgzk5zj8SYICboc2iPwkhHxciQbzsOgPr5jwuN6cF5l3jNBf?=
 =?us-ascii?Q?RdYFKHSe/9HYcjn+XdeAYPOiw25EDbPzQedbzYCzWPZ/yVSoUtNdaQQpy24g?=
 =?us-ascii?Q?ZupLnmmluGY2FCLdRlkIuhBo6fR5RAnuPc/pe9a7DWr20umnxtAWXLABGI9B?=
 =?us-ascii?Q?2zjqWw2VeVzrcU62gJiWKx6dZaU/vNr55POa6eePHiRxZgn9IOS+t6LB/W+P?=
 =?us-ascii?Q?Ix8E6OPnVECcaA+w3oacRcb+uVtlmUigyaG9a1KDQ22AOqaXCaAzu1+RYDF9?=
 =?us-ascii?Q?/BknZT/bQSz+eroz+ME64nY/8CDOjQ1+1KtHpz+6p55EMHsFhWuy/Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H/QPHD6Z560yynijqKkceniihQO4jzUNMn6NF99vW63IsMIJVuBjepTIwVow?=
 =?us-ascii?Q?CNN9W765RK2zde8kNoh3ympx18F9NmeltUJvFPisn7B2NuGyu9BmryHERd4z?=
 =?us-ascii?Q?votpqlxdssOavetDSLee7n1vk+OCdXBE1RAYRYxcJoz7+DxuI1EcBUQoHYBx?=
 =?us-ascii?Q?pZLDBaGAflsk4ky+8lobpox0Omw4mgiw5G1r6XTNrnevYHFkVAx3gMZvxGB8?=
 =?us-ascii?Q?LrQlnx8rwz+/fYKkxBhUbhqUIMqQRtCTheslv0s9qd9QhOfZQiNop7LfBxeH?=
 =?us-ascii?Q?WD/mZAtC4Hpz4joylFO/a1Yd0/tz6ExcyWPg9Rrk8Nj6dhKlOUNj81TXv/eK?=
 =?us-ascii?Q?tYm1jBINqhTmXYjy5n15dOgtXLgISKpuNBJBRnLNdkYwG2fLfaSat/DNaiS7?=
 =?us-ascii?Q?lLTdH3jz9UNzFzzX8kHFy9qu6eMNh4v5gxDDg2hzmjQldTeNkoEhm3b/fU4q?=
 =?us-ascii?Q?CPngl18IAEG2tE18iIiTZHOmKWp8U4Uvlc66nj+m/g8fi/9SchIwu1awGmkT?=
 =?us-ascii?Q?RLrgEdpNn9a/Qj6Iqd5GVybLtjnE3U8eepMFlHjmVK17hijdiaULDGhraUNx?=
 =?us-ascii?Q?7GMkVaJUqwnpwpFsQhyuYuTdF7NRiOS07XeBZTCHsLCLjzY4LWLmL5t+CirW?=
 =?us-ascii?Q?gmPtHvEfinB8qmlEinpp+VC0dk5Asc87/+gxA1YKTtZJGZiGRvO7nCN+NdNM?=
 =?us-ascii?Q?x/mRbKNZOPBFQvAmD5YT7nQBoe7yPYwKd70JeIrxlx+7doCByZcHM4FdLGLp?=
 =?us-ascii?Q?bgFSsr57PRBzYDoO1WoasFk0JeyjMMHnEOG8lzclq0/qDvCCHW+5rO8v5Q+y?=
 =?us-ascii?Q?cUoboYSv6LCsVY32Y2g5u3qkxDlqyhsF80PgVHyC1t0//l5kKHGFlZrPUnii?=
 =?us-ascii?Q?zGam7/I6q5rOFs7tb1SpYYcGKR+r7H6Ssc0+JzUXrW0ova+Cgzw7D3KrByQA?=
 =?us-ascii?Q?Igx1cYePhgoTzRas0L7FUC9y2qtvDp4IhIi+ECt3s0v48ceyEqXOMWqr0efa?=
 =?us-ascii?Q?nsHArQswp26cIulSkputFxUZ3dGpt5DTrVUsIC4hlBrU+jxokkllzjyilIKY?=
 =?us-ascii?Q?46R2Zyd4mPNCtJdhDBlI/XVigM8LQ7gMXtJLFke+wSlw7dPnaNozwV0XbdQQ?=
 =?us-ascii?Q?rL2jeBkw9ollcsJ+pzFtKcLKlOTFURLN+QauRxYJf9F/To0w8IWFhjeQPh8e?=
 =?us-ascii?Q?tXWjiKjgTsJaojG9r/JwwL1P1T9nRG/5e5ks2BCXXWT7HBY3GdHdLdjyWmZC?=
 =?us-ascii?Q?mmBTqblsmgy909LIazJbMYQ8Qfsbue+Tknv7jiTirqhkNlZH2HSWAWxyvnE5?=
 =?us-ascii?Q?z0R8weZuZEoVqnugmhcEmxierUsB7Kp009sysJBiIvhNAqq08zeOlhrTRxrG?=
 =?us-ascii?Q?zCEsyLbQeDym5fiS63gVrFMqIBCOiXhu8g+u53VvpmZHFgp3vDp8NPGJjabk?=
 =?us-ascii?Q?dBf8WC1m4CJGdHYcPqHoGXqO/bki25AS0cntUwxxoP5vDjYmZrGEBmYEsO/s?=
 =?us-ascii?Q?CD3EcK9G+Fk+bEcNV981Do30InQ11LDXGso1/g+18VqojDSKMCKSDAJRUJa4?=
 =?us-ascii?Q?hifCSFBRLLJ03vjL+7lXohAW+QlbsziQ3OJ3QCNg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e2854b-80fd-400c-cb53-08dd7cd58b2d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 10:57:56.5200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mueVmmTKyAwkOkZk76hdWWg+2XhhvYA2xmcd687h9cz0Swm+QZLw/NRw2j/AuJmGNoxrs5z8FsmEwQls8lWUEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10106

PTN5150 Type-C chip normally binds to a Type-C connector, so allow
"connector" node to present under it.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml b/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
index 072b3c0c5fd0..79f88b5f4e5c 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
+++ b/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
@@ -42,6 +42,9 @@ properties:
     description:
       A port node to link the usb controller for the dual role switch.
 
+  connector:
+    $ref: /schemas/connector/usb-connector.yaml#
+
 required:
   - compatible
   - interrupts
-- 
2.34.1

