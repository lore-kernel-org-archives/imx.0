Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013045.outbound.protection.outlook.com [40.107.162.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084E7346FA0
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 21:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772833372; cv=fail; b=Rp/m295po/q9vc4FBKd/rBEsV+RBlTt2yW/CAZSUhXte1dQYv60YIMtIm7MjyO33C/C0EGg4GuCdb7Etrnsy8WwRDnBIlrHWr6rF8T5UvlGXDV2wFucK4eoOKb8wzrzpzUVQwakIENTo8MfO/vgU9DkearDST+Co6QmOtui3Ri4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772833372; c=relaxed/simple;
	bh=7vZv8MhJlHfg3LCrY8r4HFw+La9uPIky2G3roqvIT3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UZaga6vqm/tc+D93VstsYGRZ9LtRPmSHQoNYmXHgFocfOxXILZY0nBkycp9y/ave15kyD935c0fpi5U2hhsZZEwJFNpmcj6iJiDg0lMdqpZOtgpVqEUpc+EpSVRpWH8Wzlqd8yVds70j6h5FiriumcCjzdzaYkwmrcl5ivYrAo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YauQ9xVg; arc=fail smtp.client-ip=40.107.162.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YauQ9xVg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3KTyW7DeWKgQSXeuO/wwZwQRrzZw+MKyqxqlfwH1BaBv6YiEDtiTO18EPbPb9P5jlVvq184Syt1vCGgyctwYRjSPqyggcxUn/my+RCW47w2xuLT5BSst7AwvrVlWfEdB5zYrmYkwl1emSxaaOm0jSpRIL48omHamO6IWnankBObTHmHQpJFJ0qzpK972My/530xRz4FNbZiKlu3I69aJkMQKVZKj4YmF89yq5J+fuHft8eTUo33wm9K6WKpGNEg5y1614M5goGyO067d1q/XNPyRorIbbL/+Xzsbdr+YLzL5pcCmfzuJ4QA+paWpCRW457bjvUZVN76ugK+SnJu9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ehQQfx/c1b1hlrJ4R6w79ghHxrL2O2rcEQ4Or6nR0M=;
 b=S9dla1nPy+qMD/5ChzxmHhkOVeMy6uo9HgaDH9RY2C93cIRSOW5vV41Hg5sBZ0upa0GD+g+tWWX5yzIF9DM1MFTExOHGmm3oIGPk/Woieg5Jo2+D8D7gEc1OWLdHn227qXWDOqzPbxOxhORKkOx44s1ifNWzsDNJtPVDnQCCXogW1RlFRvJeqbgGL8ryg2pgbXlK1qx2Goec17l1v+byU5eCXfIiHmqGgHJJK14N+L74UOgaqorMj5zOlj6eyjYie3T0uWqWlGg5Grz9TT766fxZg7lqCJ8gsCgMzXubzQqUMsNAqfk9ByZACZsg1CiYbOVvrRcSu9+7p76pPUb7sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ehQQfx/c1b1hlrJ4R6w79ghHxrL2O2rcEQ4Or6nR0M=;
 b=YauQ9xVgvTTHdBWppslqoU/iGtTLWDvXxcrIDPDgsV7eHNjH+dXu7u4AdVJmQs/JG28x0/54ip9POuyJHz7h5/b5XCsvo2I4o6DK8DxvDwK8FO347mckHhZz/5jyic46bzEiqJ/LFfTh2pVoxiX8Tm1AUS6dghtF1ZdnBYqMJn8lXkxJVvwOYTR8E3ECwAi7v+lFKWfjFKDb9MugGGJX/c45hNsExNPAbtCMTdVMtq2nQ11jRLrz0fxkagSpJlzG8SlAZtstxN5F+ObrknHZ7kAicEPdPuXLmdy/a9i8v5oBgPWyU1h2J6Cxf9lwVx7wa+MvrqzGgL+i2AFCjJf3pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB6770.eurprd04.prod.outlook.com (2603:10a6:208:187::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 21:42:49 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 21:42:49 +0000
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
Subject: [PATCH 2/3] dt-bindings: mtd: gpmi-nand: ref to nand-controller-legacy.yaml
Date: Fri,  6 Mar 2026 16:42:18 -0500
Message-ID: <20260306214226.403672-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306214226.403672-1-Frank.Li@nxp.com>
References: <20260306214226.403672-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:510:5::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB6770:EE_
X-MS-Office365-Filtering-Correlation-Id: 7061ed91-9156-443d-3c67-08de7bc94fa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|19092799006|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	yJb9/U5UcQbnOvoujQaPcykv4liuJ3WJlfzAZjfsCRtMrLr7w/VYHKULVNT0PQ1lCY9MG9IrFhWXc9WRRPHez0cmhZdn/N+UyPvG0Yw/5HetpAzznSga80VSc6tR8TOjVKMjQ0FsqcYdKgwqZPOxdBdujgwv7TqwQIRg5gPGuACnDZ+D/AiCjXgYyHxJrJXyiTac/vXvDTDpKXz/vOZ7E1EHrnzm3D9CHcylWhG9SE1BdbpBT0BuYUjSZnjWWdYfcEydSVpS/G7IUnubqdYJLQyUE19V39dryFCIDTpJ/zXXxa2lWA1PplIkaACpCyjH4qVfysw7SUQmhEHXAQvxAnEj1kh1L7w2+teu6uDJG9GdiM0EroAQTKQBWlyFeu8H1uS5Zv27EwiEb+ZB39Y/K2IbqK43Q/u2C0ksiSDJzlXs/Avm7Og/kcyx5YqeTaQp/Nn5pTfctzTBoE03qnGfb/H9B8yXOXWyL2AUFJFmAd46lB7hFoT6U7L2P64zewfwSLVugRj1LM/060QQYEOn1keG+qy7IX0FhD/7ClAW5QdEsMzT1jO2smHG0PK1OMKAmhniAyXOQ3RNTkCfuRqRiv+PHK/b+2V3uJWu+8NLEyaDHgP1K6DQZCyuz8zKpjrDxantBYo4fvq1CwkAsYLfPngly0CNR/KnuINk3MoOS4ZOtWrE4DNG4oYdb6pVsSjzOqmSivHeG1j6COty2pJ519ikrPJEfCcNZ4zgrMD2jU5c6y3a6iJkPjAxVRzqXElFduBGemTq23IAxapYXrwkLAl72mdGt+mZ5oYj/Xj5tX0KVe74wU5OG+cQqYMvxcUo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(19092799006)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?glbtOBHp85yjOU1uRS2aNem61fIoSDY/6QTe9Rqzp/SpHgF6FlWyvAUR5WSi?=
 =?us-ascii?Q?hop87kHdRx/+fj9wfRo5UOK3wjRzY1Cr1GN4r5Hn2vZfeDwXO96Xo4oM4XZZ?=
 =?us-ascii?Q?1n7w5/MOMUPwwHkL2JoU2n2+EygLj+FSiWZ8gvS+G/pzKg8f2rQ97FfjIIsn?=
 =?us-ascii?Q?iS+Xn3Kg9hTtaMQbB9GwtfztDGQoL9MlJZusJVyejj5RS7LvWYcQC+01QMfS?=
 =?us-ascii?Q?vN4hvsWKXVY6Xh9KKQ+QcQWrjTxMxKFZMsqc0boJGcJVNjZ5G49QWMVuRSSY?=
 =?us-ascii?Q?NDS2De9dFAjovvdYgGu0DXsa9Mvatz1W6EkVcSFQ9MIPwfSNcjCiE080iXUZ?=
 =?us-ascii?Q?v11qiVHS+5btzVoCcCE7/S7X1i4sm0NWZTuJ8Vc04Ir/EYgHsYM/q0eFfuH7?=
 =?us-ascii?Q?57jR05Wy0enSwELrgJWkhkDwO1JUm9JxOQwuOZKXbCW5RnPuNIvsnfPIBZVS?=
 =?us-ascii?Q?GVfP1L+cLkY1oKhiCqIoDPcuo9CxMeYBNV18q3a4weGQj396ETGUoZyC8H8Q?=
 =?us-ascii?Q?HUC057Vrh8ygvGIhYwem5HpVNDAHVusFx1/1DXxJYSVMqoBPTjI9BiYCwftn?=
 =?us-ascii?Q?UN73UWokbVsWa1I8pKut8dsE7Iau+XqJIp3WBj9IiNJqaiONpPREgjzJTPK4?=
 =?us-ascii?Q?GrYAUDh23sUof8HXs4h+VwxugIofEnudA61xES93y1PuolZGPaoOdDdFqHx0?=
 =?us-ascii?Q?X2FMZBbEqgGG0KBgKY+fzQzA1ORVCknij0R3cooXRw1nUfzLMLvxiBUpLWns?=
 =?us-ascii?Q?FOtoFKT1vWkCYTH0MnmRQaK5Lm0byX/nCjstctaALUSxGbUkyzmgr1MGF0uE?=
 =?us-ascii?Q?Pp11063TotjdHnDeeEQVm7NkIBFZht6tbO9fngv9NsrsONTgk/b4PwzGAki2?=
 =?us-ascii?Q?iUjoiYDgP2pKIv/P4HqhexrO0Vgp7eD4YdEfJ9JThJUL9Z5HKfz3JQzjonwG?=
 =?us-ascii?Q?8izte0J2Pg0eFd49aT/3b3bRP8dSkBBmLefV54+YP24mWjkzhSG3pifOZHDx?=
 =?us-ascii?Q?XPaPasCNvlsi7ufNVreZEf6k79gDamebpq6lNCDWvNBHpm45wA2pvuwV/FNi?=
 =?us-ascii?Q?iY58kyw42Psah5fX7A1AJZSl5btuclrYQMUF4qCPy+foUiQXiPqTL4U3b8dy?=
 =?us-ascii?Q?3RGi3KxUYTGDag3I7d5qCsWqeQJ4fI0b4OD76j0eAz2wY0C/tZ3ZxXKBM/qo?=
 =?us-ascii?Q?EmYQSKy+FvaS+nAzBh4JD0/lCiwOmBVJ6TDAuO2aTDf76cjeQNEwRAzdRcLT?=
 =?us-ascii?Q?VUw8kZ9cH4QGnLBkbqdqDC++U/ODGpUXEoL3V0wxTrZH3pBZSe23ayS3L2g7?=
 =?us-ascii?Q?D5thoh6syZZQtSR6756PKDyDCx4LN0vopSQI6MUoLNpucBOn8N7c0a6sypfM?=
 =?us-ascii?Q?eR7UWns+MBVmiAoEK+K6q+uIKiiQv92EnnBSIx7x+DkDWL91IXygXvFaiFXt?=
 =?us-ascii?Q?dVsLbS/5VVF+H8o/Q9dsbYzPg5tw4EcinX08OWlTx2iyuI2r/l+9FS1b2LjI?=
 =?us-ascii?Q?fjSF1Ng6Xf/mKPMWM5pqlNzC6YkLQEM2uk7pfaHZu3hDJ/BpM9cVXp5rLfAy?=
 =?us-ascii?Q?QtvDCCk294/CVcwtK0v0/VwCTChn+tc4pUYgRd3vWVZz02um++tRMOq/b4w0?=
 =?us-ascii?Q?ho03bWV7+yUybK5dr8Hv/mF8BlhoHbqhvBcGF0Kr4aXGQrKupjJzy5MFm87U?=
 =?us-ascii?Q?xc5QClV/1Uxa16Et+FI/nxj7xa1QLmNH6aP30SrQEyHuydJD+cfV9P3DJoEU?=
 =?us-ascii?Q?UtuwWyeK8g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7061ed91-9156-443d-3c67-08de7bc94fa1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 21:42:49.1031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8w0MXIgtf3jW8Z9lrPpcDBRCvo/JOb+2CS/XeZx+ft1vgT2XHwLene3nF9xk+X6jn99AwFQPy/n2i5WfAm7ujQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6770

Ref to nand-controller-legacy.yaml instead nand-controller.yaml to allow
legacy DT layout.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
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

