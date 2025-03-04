Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013000.outbound.protection.outlook.com [52.101.67.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F42020101D
	for <imx@lists.linux.dev>; Tue,  4 Mar 2025 09:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741080690; cv=fail; b=cLOdfrvL8+JLBWnLvQfVW1mU2Jt3Txyxt3WwVOHEpQ4zH4WjhnhaFpu/LCGDFRerSpneoLq/IF3lP4gz+WkNQ52djxO6BoF0ACD/btwysOPyXFy1SKH5N4ff720CdCTbFG9GIp4szDo1H6zacOnhAXpyki0cDous4qGcsGYc6kI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741080690; c=relaxed/simple;
	bh=kSdgUQCAhrC2Zt4gKA7dbYAYL4ksRGpOGZKo29EpUL0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p1lCgRb6g+xI3g++/D+NDf0B3aREbYjIfdVIKSkbVuRzsNrL+17ddw1kX/O6e64mFj1rVwu8NeM2vDwgg630kwRcl6F0/H8QatW9sdblIWqD7PZpRrnCJh97LWHa2B9xsD561UOGf++xwnCBbA02O7aPTWM1MclMfWTxUoGJvvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FJbUqInb; arc=fail smtp.client-ip=52.101.67.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FJbUqInb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BjhYdFccrCTsDWFDeSw8SDY25KQVSfyPXnPYlO+wO8cK6SF3cJlHzBZL2JYc6utAn//m4yu5iwk3lTcmq5QRWqIhrfZ3NudiuQBDICRjW5kt+UOQZ6hP8Ty7kaNGfB9G4xIQbhhQvVBtq7XffCUzqYj6gGZbWv0POrurzMOzShcfkrasWCqMUEsXdJbMw8z679379g3/1hDKiZMsbZMFItxzpyiIvkDyBNVUkeGXUIrFEd5dMi4ntd4yi6CPyFyAmVPpm4952EeWHbfMfNmNSW0ivHTNHAThV9Zxgfpl1PFpGRBNuDKbnA/2whQRi9F1Uft03yBRIUBabX+itbECyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcO0EG2zutLagIAuhgpBCMa/Lvp6uAoS0/y/YM7SUbc=;
 b=Av6eT9XkdBLEuD3BRbO7xweIhggweo3+o0nTsG3Q1BRBdLgJdaGwbkzOTtgjwKXVpsgFqvbDNx2Q7U5JilDG8HZhI5eNsJFY67aQwWEO3UrLMAeQPcnriyjU4zQKtrX0Y849cYpdOJcnxTqG6jym/JCQSZ4gc+PpywJzzLXxv4dZpH2QPKLTvyV9Gbp4Ojli5XqK/WNLGwnqe/uM1eMQ5kdTT3IAojw3JM5WGu082ean3Kt0YZEjokK0G9E6THYOjiebxe23JLQvFvoKy2mzs8WnQJUbsIK1lhxAMFatJASaJC/vsIzr7t4AivZkp+J4xpryuLxCbrAyhkQKgb4fzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcO0EG2zutLagIAuhgpBCMa/Lvp6uAoS0/y/YM7SUbc=;
 b=FJbUqInb/+evzxv0KA/ezFU2KirskYNOVQOiEvWdCdw+ddDqGgkJOqVWJfPNDfsfuNxjMCxYch+5xf3iMPcWomlyaMMEj8864SQwYe4uyX46XPE6gJbHRw9N5jIm/ppZoQPxPBUgW28BmwwG5VB/q4OiqKV7H9NhuPe0UWD5CMoVaTsA1JfKzPBeABIpILCtEZ/UrWYbJ502WqVPXyTwknIUaEnAlAHv2cel2aM4flmwHL8rd6OTroSmVjMBkFsJXVOxI6pKjB6woQBlUsWoeH2iSgFg27ckL7LhVk9O6OBdN5yvssGsbLKEzoj5vKrr/K2PgcsUrK13Zo+YzzprWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by GVXPR04MB10381.eurprd04.prod.outlook.com (2603:10a6:150:1e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Tue, 4 Mar
 2025 09:31:25 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 09:31:25 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	aisheng.dong@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com
Subject: [PATCH v2 1/4] dt-bindings: dma: fsl-edma: add interrupts-extended property
Date: Tue,  4 Mar 2025 17:31:24 +0800
Message-Id: <20250304093127.1954549-2-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304093127.1954549-1-ping.bai@nxp.com>
References: <20250304093127.1954549-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:3:18::19) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|GVXPR04MB10381:EE_
X-MS-Office365-Filtering-Correlation-Id: c1dbd073-373e-4bf0-9514-08dd5aff5561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pzGv4TKD4+oMqgQkW5Nh0YKuMnBp4YPV+HVXIgqrOI8RAOb66bfBekrEwhhD?=
 =?us-ascii?Q?zSF+mxNF8j2AgzyQ0dNa9oMgmP7TjLa/6HLY9/8UrGzfcHoeRmb297LkRkgZ?=
 =?us-ascii?Q?LaFgkwqMPNq3+29oRaCCAgtCvjGW4sox1LERGIAoL65g4g5Z/cvQA5b0Q+Mf?=
 =?us-ascii?Q?rG5TMqDO1ogZO/CuR3QWmgVtGip78FeQwFGW5OIS/7avVuUsp6suMJqkGEfG?=
 =?us-ascii?Q?u2+XcVeULaKRfPKVp5WV6OASaIUQ8/13Yg5kWWsySQmMuqKsQrWLiWcDNU7B?=
 =?us-ascii?Q?IOTSRh+1Cx38xrtpHR4RFpEYkfHfBvybvh1D2lkWhm+tJaNMGT0t/x4YhtEn?=
 =?us-ascii?Q?m9EShDIyC2rdig3yXujQbcyx82z661/dazkGL5yCQhzdc85QHqPuoQ8eaeSK?=
 =?us-ascii?Q?Vgq2RClYEi3xqXBMbRi18npKaJpGKQfWgIG1xFzORdlKqoMaR599vqk2lqQZ?=
 =?us-ascii?Q?nYCuoVehcjdB0pvtyM5mOWThNOLoVbKHi6sjiWLc0tLbx46yg2Ot2umHDW22?=
 =?us-ascii?Q?gShdQ259CAsONuFHAxUOX1cqlKBjRqV42uJHvBM+ILBDGpVE0PBH9EgWkNYt?=
 =?us-ascii?Q?O8we6loot2m4h4qU141wUaowpxfCiUr7Ku4w489C64imhygSupwOmZSL8lH2?=
 =?us-ascii?Q?qW0bN3RDydxZtXhlu1G8cIKoZ+jk/SrKHbdq+B4IHwL32sra1ttftWx/RJIz?=
 =?us-ascii?Q?uBZ636eX/LxX7u88C9v6kCfGiD9JdG/IsZdHC9HcIy0/Pak8ovLjsgRA07k+?=
 =?us-ascii?Q?WpCGYG3IVqwuH53MjIeEBjBJx76mFTE8qBYzPFJ80gp66iBnAB2uCDMxr49D?=
 =?us-ascii?Q?G+OElnxOjAi7dXlKM7O9E+9vxeDoHo5vd8xk/IedzQP7/QQfA3tlJev7Qhbg?=
 =?us-ascii?Q?cD4VB0y9RVqwy4lAIaOH1nX0QajB/ak6eG/sBzj4TfpPpI2Em6wEVIgAiur+?=
 =?us-ascii?Q?chIHBHfgoAslV6RJw7inBbLfQ1PFES+w/kCl4GrBIxtMqDtnIw2XCN3Frr9w?=
 =?us-ascii?Q?pKNjt7wZfIB9bOHPz4duYRUs3rRGj4Iqx7cNIlp41z4StZekB/ShcAZHIHT6?=
 =?us-ascii?Q?oT/qwdjHTbjb+mN2PdJxGunuc1gui+qrF4HqCzAJV27UfoB/0IG66rrm7MQa?=
 =?us-ascii?Q?GIv2+uMlkIBdF4mo1Bwoda0kG49jvZ8W7/Shu9AEjofQ2QMksqUW0Qt7lCx4?=
 =?us-ascii?Q?tCh3n72TA90RVW7sq9yRL4QLF/QX6ApfImaL+jcj9FPJBGWPwx2+jRxTFuug?=
 =?us-ascii?Q?BokU7rSlFRLYIQ+jsxgERFj8cv7H5slqgxnvxFaIXrHrY6y+tr7boQeDX+GY?=
 =?us-ascii?Q?C6uOEJnZr19MTVS0+dZLQ+Xup7z0G51Ysrym7oHRAQy+hv6XnfxYAz0w1cHB?=
 =?us-ascii?Q?bvCvOK/5a0VhYdDBATMPYa3Y7zhI4btXGVV+S62JjrAFnbxRSV8xjEu0fAWK?=
 =?us-ascii?Q?3gF1sw6dwQ2nJQ6WX2Mipntfm+6naF2a?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fdhw4Pl/BiOT4kGRlshOVZ2KHeH1ZOiSDfnfeX8lAolOK/9eMwkSyPBKFpEX?=
 =?us-ascii?Q?gE2gLN915DHo24s3pO2tjlqGa0dbAd9XqVIq9pZ7115tPGDediwNWA/sS2T9?=
 =?us-ascii?Q?bk3IC6lUmqWDQCaLJYdKoCShty6hqllU9kL68wz0AGBjb5nFQSaE6Zudmc2P?=
 =?us-ascii?Q?zk7UGVtaDKuM+xDshpNf75nHhNe02lhHkFMu/mTiRY50U3f6//zBv8RrcLFX?=
 =?us-ascii?Q?gtWT6VdsOJjuLPZWMrXEvDL7Je9sT2NtFTAURKy0jfAhPTD5RbC490xwjgjq?=
 =?us-ascii?Q?d82/qtqq87cj1sACbfBaywkb3d6l6aTpOQsePDlIkuBlKDVBVHepbvh1guRM?=
 =?us-ascii?Q?EEmckSpQf8tCxOX8lgjzTyiqzCpivsuoV8njc97E2bEM0tTMyslbW4rUd9IR?=
 =?us-ascii?Q?uQt3XGKzdEbiltd9FoP7HkBP73m+20dhthRsD88O35bUyvIHgl4Mo7Hyo6Wp?=
 =?us-ascii?Q?wTlRFP6EKqkJ5DKJBLR/RzwfQ/pr3qRapUZXfKVOggwbLXHlnpemf3V6NruB?=
 =?us-ascii?Q?2pDi0+IFInDnDYkS976gfzpwXX15NBaDm7S8altnq/OLKQ1VO228qmLJJUh4?=
 =?us-ascii?Q?HPnXDt9AJoZ3uBAZIUwsx2jmU7topC7bVwBaDjJj6IgpxyB8dLtGEFCoOK66?=
 =?us-ascii?Q?MeeoOKvbJbJD6QTUKomFDzLOzh5dkg89GrWOYtw25meCANznSKIznE0HNdxT?=
 =?us-ascii?Q?sY9C/6Gqf/5/juVIA3ALDfPHhzDJCC/NT2UFgwKhU+xgUyJd1jcZPJIl2V11?=
 =?us-ascii?Q?bMLoxb3pAdElvdRXvx2Kn5wKKxy8ouTbdEVpcVz5OdxVtVr/featNbZrcP8J?=
 =?us-ascii?Q?RYC7U7uDA+hJmMA8w4EscJZ8ahDDf8bCrdApMink0FnpFGqa5zEUqt2x0A7s?=
 =?us-ascii?Q?2YrdnTr9AImNz6fuw9KedYu6HsbYjtJwh0RbpvtePVTmbc9+EAnvourr/br7?=
 =?us-ascii?Q?P+SyEuV8yea5ukpcuHVXQr2MeRrCinaeDUBbBPN/07WTAOjuZcxvREVSobl9?=
 =?us-ascii?Q?GhdGbIf+J33yhbwkG7d5OK9pF5m4eg/TyNeW49SZYQDbm3RWGJkK0qjFp2lp?=
 =?us-ascii?Q?A1XjceH37bFgnOVFY0ULefoPLL6ehJZ6iiQSXZi6tCEXqIQYYtJmJ9TWs6Rv?=
 =?us-ascii?Q?2LEYPreXj0YBrgOysMjHqd3Mj6i0Dd8cus07xK4ZewPXvgDMeMUh+xbSlfom?=
 =?us-ascii?Q?mmHTrQdQGtvYSawd8779cqqymR/gcgBcORebQ8/WxtgI3uE2UJoq1+gii/3V?=
 =?us-ascii?Q?PDyBeOTLVjV3oG5CFfOGTKhwUrvU5bGeX44WwiLa/CJQtgfosDoVYhEpxNMb?=
 =?us-ascii?Q?NX10HHJDHP6tfGd/SzUngbxkQzYAg4Rsw9lrN6tIO34kVq41XmCVsGrZ9NOd?=
 =?us-ascii?Q?FG/2EU3YZGMs5fFDsgLBXxCiQ0m9oCHMoJnkMHizLGiQJiucv2K4PPtiBDcD?=
 =?us-ascii?Q?6+ysUjnHPh6RndcUs8E0GKr6MxTN3GS50TTP6PalriizYCPx8GzrD2YH5pt9?=
 =?us-ascii?Q?Qhv1Fgew4eCd3KYufzsZNBw1paV962GEQ+lXf901aH8RLn18BULnVFkNaZFy?=
 =?us-ascii?Q?Ji46xCBjAPhSctifwVQfwcZt6nm3hpRrhMXw/38O?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1dbd073-373e-4bf0-9514-08dd5aff5561
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 09:31:25.6967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0FqLDZcvma+HeQbNUriKGkLGbAdkq9hsH3pzI2X2StwUZtXqioovZjautVzIJvv9eeEm3SZhlUGUUdAZnQtf5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10381

Add interrupts-extended property for edma that has multiple interrupt
controllers used.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 - v2 changes:
  - newly added entry
---
 Documentation/devicetree/bindings/dma/fsl,edma.yaml | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
index d54140f18d34..549afb8611a9 100644
--- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
+++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
@@ -38,6 +38,10 @@ properties:
     minItems: 1
     maxItems: 64
 
+  interrupts-extended:
+    minItems: 1
+    maxItems: 65
+
   interrupt-names:
     minItems: 1
     maxItems: 64
@@ -87,9 +91,14 @@ required:
   - "#dma-cells"
   - compatible
   - reg
-  - interrupts
   - dma-channels
 
+oneOf:
+  - required:
+    - interrupts
+  - required:
+    - interrupts-extended
+
 allOf:
   - $ref: dma-controller.yaml#
   - if:
-- 
2.34.1

