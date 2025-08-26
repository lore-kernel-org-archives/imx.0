Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB598199939
	for <imx@lists.linux.dev>; Tue, 26 Aug 2025 15:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756221426; cv=fail; b=dCaHjivNQFrF9Ru4Wt/+2siUFM6xC+lWHn/daPCx7SvY6Toli122p58ZE6JViPfvgPfsXa0oxJuQnKaBOEY8+aW0WkZdGNYo8qngXc5FQWik8rwftMXScgalBkT85NKCkAKmACcX7H5SiFrXTzNNKuUr7UspwYhHF44ykkPDG24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756221426; c=relaxed/simple;
	bh=YdGNNA/XZwF2aF5DLK1Z2Badf/wBWv1gu9aI8sNKvUM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=d7ujo+pNd/y9nZpDMxLFk7dRYQc2xzD9fbpkCQdia45zxUb5eTXVZJX2CkbQcf5VyI8od5uMaJ31uMv0r6e/QdPO2CTsAnE3mFPdm4gFWAsn07Hmm6qanbmwO/kVEPwIoxXoLCtPajwH65kajMwp9Avr4SQP2F8XZ3exSC250X4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IWYdMARY; arc=fail smtp.client-ip=52.101.70.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IWYdMARY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWVkJRwfRWbVnbgPphVo3kWuIurgYFhz7Kk+NO4rbaXNxeaGfuh24tIW2XZnBO4Kkm/ke2Wbo0FAlw6DS+pOJ6LF3fEs3UO0teLjqrFeWRWqxIALZqZtCBe6TibXy5IB0llTUA1drz8L6AQ5OUvtMQqtZnkRnelwrIzAGaJnoIqzuX3PwnTyqfU0UD/ilYxRlBP7R6AQWYhx/h+4EPUeH8P3lVNLC0MkL2E0jhUzuiJQxLzDONYM1/MJ3Z6szYkbUmyGZD0zvA4quKyQ63W6NF89Iwqh4ny6yugdfpCB0VXjnzgDwuIgvo63xFmxUc8+vooK8iV4pDVeMAYwIYkLEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3fGcWLsuA0tf24fIuCWYT/xLV8FJYgf/kcbGsY3heQ=;
 b=Au3sLHGHmgLyq1TbmvzkpNiksy9qMfHUbBx7EageBtMa4gfgQlYkp90xhY4w+KbRTeiAGd3f3CNYNFOcAESBaohwXMEDAx6SV7R6ES/GukxmHn4fqz6/V8GcgjaW3ovu6hp1ED7wkjn8A79LsmY+4Q3CHTn9G/WA3ktpLVa6pebNNFLGk5yC/930F7lzap/8cUEYZOLG6Sv5WcfywYDZwxjYFbqLm3hkqMNC32RqbDpjNGsLSLFFg7lyZ2JOAFlkX8HKTnl2a1/Y32pMdgiqIaBG3pKzv09S8dbO0bF0rjZMS5uTHVZMLgpDOCCgGKP8MFWj05arA0k1E2lm16KCBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3fGcWLsuA0tf24fIuCWYT/xLV8FJYgf/kcbGsY3heQ=;
 b=IWYdMARYfhPsRZglO30+nKPs+ZXpa51UUirdruxH+z3UfWq0uxia+fS/DOCA8qhcHozS17EVpMLhL+qMxG9NaZAsjcvXK6i94FBs3yvN4Q9WkKmZ+lQPw92PQJD9VVVxYSHNPNMQCwXFzEpW5FpiSCv1V/sjat4NCt768xCF1zAw1/rXQ4NFDL3uoIuNfT9xU030wBEe3IdWlpvczzDVPU5PZcoJXn3sDGrw3d6NBTvQ7Q/oKIc2ctYatbCs9trC9Rmr4T7oNSbhNsCca/c7Jz2swH68OlH5yaLQIhiE7nDyiAbn805NQm6RPMjQZsM857Fcfkh7Ruf0T36CANqbVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB9PR04MB9723.eurprd04.prod.outlook.com (2603:10a6:10:4ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.10; Tue, 26 Aug
 2025 15:17:02 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9073.009; Tue, 26 Aug 2025
 15:17:02 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] docs: dt: writing-bindings: Add exception for clock-names
Date: Tue, 26 Aug 2025 11:16:49 -0400
Message-Id: <20250826151650.9396-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::9) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB9PR04MB9723:EE_
X-MS-Office365-Filtering-Correlation-Id: ecc7c419-4ed2-45bb-7409-08dde4b39bbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Wse+Bvl2junlrSarTnrK0UJ0mG+HbVo/NHxRN1r6SBAhQJcdoHp6ndiKKW94?=
 =?us-ascii?Q?HW0nG6+h5hRzH0YFqft6vbzosId1xxHwdJxoz15NyCRR9s9SdtFQxm+Gls8i?=
 =?us-ascii?Q?Me4ZPvdKGOUs1CeKrPOB4/s1ociNH0X/t8bkbr9JaAAMA8MeyspfyRyKXTUF?=
 =?us-ascii?Q?JZqeLW+46ig2Xw+5YoxLP5MZ/t/XIJQ30qwyeaAXk2VKNpFNmMuL974jgNn5?=
 =?us-ascii?Q?9sMKvi2Jnq00kmkO7BMXnbTlLGAe9M+CvDDWsJqE9p3Zd87bAIVdbCkyJiEi?=
 =?us-ascii?Q?gVhm4nbf7q8Uu0UOxI+9ivW+FL0EqFd393jARJpNDOmQsi0X/UJzXXx32M5y?=
 =?us-ascii?Q?uRpFj5+2Lx6uTUD93AVFLXhatc8CYC5R5hqeS9tjWfPTlJj+vx18utnZ3QJD?=
 =?us-ascii?Q?0mAIAogo5Pb51saiIzODWP1O4q9lWroSlqBWBb17kil4nRSg+q6548vV/Nyp?=
 =?us-ascii?Q?fgGMWvTX+fxBdlZEWUYnfYk4a5iHki4sqAawSY3rcuFQYUvwKDX8kmdUTrJr?=
 =?us-ascii?Q?vuv5/HvGHA7poy18eaZG+wffQGSDp2XnwwWY1X6zRgaBA4MThwF50Oxdv57R?=
 =?us-ascii?Q?j7Me+fjlp82YQJt6y3kWXdCtM0scGMkbaXB8gxCH6OpbEPNJQwaURBz8jYFA?=
 =?us-ascii?Q?XFeel5PPdjyS6z6IAqoUMRoNouII+mxvY9X1xHzqCVtjj8YjqF2myPKLNodR?=
 =?us-ascii?Q?xuc/9HR/wAF6lG0LnAfqGiYZD/+ZghvcdfS/sLmkFwjO1Erz8i8D3xouTvus?=
 =?us-ascii?Q?fMWCTCVPw2MDKTtfzjVaWFyPskmjI6Lg5xNgm5KQW8pAQIsR8T7kNt0UMC5V?=
 =?us-ascii?Q?yB1koqyyKNe2keSmMxINkskRze8jl+yR5q1xa694rO2LzVQzYk/d80sewUi2?=
 =?us-ascii?Q?S/4VROtWpVmTAct6qbA3B1lEK9/6g77Caxd3YHPuNElP+agNASvBKf4TLwGg?=
 =?us-ascii?Q?nm5iz/nuFdCCreZRpPankatTaEcNRa4kdwAtjq1sEhNVuurdF05c7A2Sg2Np?=
 =?us-ascii?Q?Cr/UBG7SHLdy8MKO+4Nk0Ra8E9+A3xoUNmynBqSrUyZ75JHhuRmf21l8M/JE?=
 =?us-ascii?Q?Q6subEyOi7G4ifOnwjYhdLQXuUN4rceMtHUKDcXd4v41uWnCTiQfDFcNPogT?=
 =?us-ascii?Q?CnHHe2BWDD6ymreWBqFURpgl7WLgujcJiciz+QcJd2buz+QGCAQFI3CBBroV?=
 =?us-ascii?Q?jVPoqHO/TQlT9bJAUzOHdXVBsfaE+rLG0xDfD/BYLdkucuUsCwgqZEc03POx?=
 =?us-ascii?Q?sbjfO+Let6qfRdGk7GJ70XSB/vcEy0y5/OdWsc0Qky2mOi60RIzgMwKqhJag?=
 =?us-ascii?Q?JSNKiOyUv8YOhD63muSto44WnZ84w1+lxF/gOT2zpcoKq7soWZmvNnguSbYE?=
 =?us-ascii?Q?o/WwCYqIXhCwhLn77zogjcJPK1pTgITaCQrmOfWZB8Eap4bcL5CbIJY4CuiI?=
 =?us-ascii?Q?5hVxB+zJOxX5SWedqrk9RBxtG/IrEbnztGWmd61JgbTUL0mkeZThww=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sOTN4mDMfZcP2UNhqCQyxOYNPhveB0Wrf3Pa2DQBikzjK/peP/s86Zq6mJXn?=
 =?us-ascii?Q?/TZ0wPB6ohp0+bBNXBafvJ65jSA8oGuHR8fymx/3dacjTtoiHjGyyp7qrwM8?=
 =?us-ascii?Q?cxln6g3KgoV7S+D2O4a+KloEP6YAZJs4ge4Jf1Gg9wFXMyr/mxJgyT0MeGQN?=
 =?us-ascii?Q?5DNJFvk0UFJs4dfyjRxp2mrWNSr9sE4KScYGLpqFb41NgmJIOIE7zwSqEqNO?=
 =?us-ascii?Q?QUo8QGvkSZv/aElDDYHBHbDUAS8WiST8uDearxGFO9GCQXJkD+b+w1/tw3PY?=
 =?us-ascii?Q?xmk3sYE2RGJ1HCSSJWfZDwxEsXoPayclVtuc1NuIOv8F895J6M/eLZTFgDWj?=
 =?us-ascii?Q?AgUX2kujhRPNAJSaU19Tsigni0mNlYXVoVyIpmCNBWAs64zt+YAWW2NbLZex?=
 =?us-ascii?Q?a6OJmXXhTulpFvAatzUoIr6Hgut+kAFITw2BGIv6HkLKhMArCquCkY8uZkGZ?=
 =?us-ascii?Q?ygGacnqYgV9AzheK6JraOqIUijHp0r3lo/p936af/hR1gs1hvOWmIL1A4mZe?=
 =?us-ascii?Q?jQWa/IeOAozqmu6PvsilQ1qoV9ZJC0YtnJ+TMv8aJ0aA7Bd7vjT9ii2MvBex?=
 =?us-ascii?Q?0HMJ6lHIc+7MAXoc9501icGlb6JnuVwIoCv4dV8TYJ7HvqQfCQeJmkTXDTDm?=
 =?us-ascii?Q?sW2j/MXVDbRmd4hGvLIzR01XD41Fh2exyWGXOcGFaL50o+5x+U2fMJk0mZGq?=
 =?us-ascii?Q?n87TliF5N3u2bGksqU5qpBGvHfTXCeJ2yVzncqEyZ9uuqMBEISCNJRxXWJUB?=
 =?us-ascii?Q?fqBbQAKcwnHw2+n4GhT84w4iolpqHU2jSsgMEhCgBSXr2X/0fEUw7ELX7QHN?=
 =?us-ascii?Q?/oIyAMMeeR2HNCEVfNuDOm4MtE0ltnL1sCKYI/KoAi3HyFk+p94sw+2jyxp6?=
 =?us-ascii?Q?2YxY/jYhCBvmXinW8JoCpTjHGxt2rlYS00Yp0Rr9q9IRu8RyVu7TbeDdIFj4?=
 =?us-ascii?Q?8rSDndzR8d45BrFocHOx0/zqP5NYpO4QzwpBIJ6DcZ8UtvHfWsgUH0nkMv03?=
 =?us-ascii?Q?y8ziPwB5nrL9YRikEV7QKLUQTAKz+h8SKAL7IcTDqjdLIj+QeYidgQlP67VW?=
 =?us-ascii?Q?35nSFWq9l06teZ/qYO2rx022ws0biTSLHLrZPXcNTIkTdho5AcyELQGVPTP2?=
 =?us-ascii?Q?dz+OdEUmLzsf5aJCP70NZ+w3C0U6cRxCEHtiyle7rMcOBpwbNYjCmOsN8bWT?=
 =?us-ascii?Q?Ajgn/jfVuISQMu1GBDWGI5b6XadO/2WbQ9JESQX00hh3gqyYUbPr0AUjYNxv?=
 =?us-ascii?Q?bBjhnDDif23k9R5RhgINMK7eBeLo/Kg8QI6z86Oaw048Nr8P7mFnqEKcJumD?=
 =?us-ascii?Q?sclX44uQAWUpbttxng2ut7H4yd9kn9r4RqE3b6suM3cQA+KZ5Na9bFhiM+ou?=
 =?us-ascii?Q?SA9r4yryWDBIfk7618JPtMSJ+EqW7EY1oYA2eYHS4OxOiH9RdR8i6vIicnyO?=
 =?us-ascii?Q?RPyFK9TN81euc3XTpUoaosca4LLMs7/NF7EqZPj7TUhCCSy4RhdF1qeTSVk1?=
 =?us-ascii?Q?S17vcU/21h28sUyzfSsRYHJT2lxe47CuXqmo23UzRkdpOhT8/GvJ/oxn0Pjs?=
 =?us-ascii?Q?7j99m/nh6AhzPf9JVIQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc7c419-4ed2-45bb-7409-08dde4b39bbc
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 15:17:02.2811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omV5Un1eAU2kvGWjrffJWN5zZaT/4WfbROEbGUt4ahzsXsNNJ07U5XMaP80yTH+CgmcghXmBoieQ/z1Kzf5Drw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9723

Allow pattern like "pclk" and "hclk" as clock-names.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
https://lore.kernel.org/linux-i3c/20250625200451.GA2117971-robh@kernel.org/
---
 Documentation/devicetree/bindings/writing-bindings.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/writing-bindings.rst b/Documentation/devicetree/bindings/writing-bindings.rst
index 667816dd7d504..81f76ca57a394 100644
--- a/Documentation/devicetree/bindings/writing-bindings.rst
+++ b/Documentation/devicetree/bindings/writing-bindings.rst
@@ -97,7 +97,8 @@ Typical cases and caveats
   constraints (e.g. list of items).
 
 - For names used in {clock,dma,interrupt,reset}-names, do not add any suffix,
-  e.g.: "tx" instead of "txirq" (for interrupt).
+  e.g.: "tx" instead of "txirq" (for interrupt). Except when only single letter
+  remains after removing the suffix, e.g., 'pclk', 'hclk'.
 
 - Properties without schema types (e.g. without standard suffix or not defined
   by schema) need the type, even if this is an enum.
-- 
2.34.1

