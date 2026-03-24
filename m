Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AB83AC0E3
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 06:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774332882; cv=fail; b=kZ9gTtUBrChpj80gPk/43DhClJmASM/0GQkmx+MqafJ7gX8Mdom8dz0ot2/9QZAjfrLtfrxqHHwZuaYlxaqMNHxI+EEWrRLexdt/juvq4HdC+uWWBnYbukDOMrHExWO6XTWnYuJkfgiCZWaQPk20gvVmX/dw708xX/WfkK4BUVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774332882; c=relaxed/simple;
	bh=ujGp49R6AfZ/appMuRlqf5NgEvZr+J1NgDe/9mfgbaM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RQDvG58+5m2Mf/WRbfcrIcmpVi6FbkstJVDpLQlMlcJqCZ7Wnczk7+f61gph/up7+lgFIi73E+cbMNortwgAHJiUIW+OAVFMpo8B/pi5sGnLjDLD5DvVZA5MfJSNgINro28eG5vd4ua0zTj8Q+qAC7HLZVpDTI3rbKZV5GDRP08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eBUCAqJh; arc=fail smtp.client-ip=40.107.162.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eBUCAqJh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGu8qLtzHqLz7irKVENKz/5emWD/OqYh+o9/v1sWyAgrAhXJkxVe/Pp1lhTPqmExfwlLZ10nJFoOssqiiytt2o29xuAV9GCbE5GF00eZmi2Srabicy78djnyZ72l+Thhvsh1x1htXrQlZavnEoUCGt58WcjwXkSLrBcsTEV1Cr7JzA8HSd7U7c/43AuyST+S4XyzAUKOenH+5+8a6JGyEdg2x2HaATyiCCE3KLpgVaJ/dJZVWw08Khm75qZIJSnK8fHkeFofjSgM96ec+tHo23DQAeWIjSTuIIakUL0QV9caSjNg55e2l4Sb3ZxuIXpWD4LFvWd8cWooaV7MJeck9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2N5vGuBauM4/FPiBLPLtGQdIAbBxbYxl1Qlq1zfCGP0=;
 b=W0MPGW1la0eSx7yKSQTw016uTymWWhoTEt9yY52noK8zjKYS9nGQS/0gIazOaKTeJZfHmVsjVyxoTQbECMsHrNGCcOC+Zo46P02vXM2saTXNr31WqE/vGvyZVOit9MJUZwHPDdTEMkIHdwN5lNvOYLCDkV3ZUcd5EATvh+z9zE9B/rxOo0v0NJKf9Pp8/mhOSLLCSpzdkWfHCi1iTSPcjxLe+ytqBPTw+hNhwPusRthKe+wUSR+LQiCuypeOaI//V0pBgAlWi+3rOrupQgT5w3mdaQTOhPZuPOS0kawmdc/PepdHqdnS89vAyAVKC69OT1wfTF918dFFeiyzKB0+sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2N5vGuBauM4/FPiBLPLtGQdIAbBxbYxl1Qlq1zfCGP0=;
 b=eBUCAqJhnlx59JHNf4GvR3/8aoGJp0YSfOFQJtYeWfm5hXFqZu3bu5DMljIgzCVhwZfNge/A2REQmDe61Ck3VmhRS6Fr5BFdbHkp8tu/xAkukhtl4r93a1+i/yibjJNqTFHksUTZm/hJ+BiqI0sMeWiyNccwI9XzB/HWG09MFDnPMTU945eWphF1oAwXWJt0jpVT18LqvTvbcXq0npWhpJi2mzKWWMPfWIQ3K1pI7UaDMlXubMpFs+641C2dywM/0/CyarcRJjuH6BMU+sLMTuY94SiX9Hc7DYJgJnnrbRjqDozXC8hGWDZPQiV2i9nIB3ybDNIaJ/3QLMnD7yjy8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB8671.eurprd04.prod.outlook.com (2603:10a6:102:21e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 06:14:38 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 06:14:30 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	Frank.Li@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	maudspierings@gocontroll.com,
	josua@solid-run.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	primoz.fiser@norik.com,
	francesco.dolcini@toradex.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Add compatible for i.MX95 15x15 audio board (version 2)
Date: Tue, 24 Mar 2026 14:15:55 +0800
Message-Id: <20260324061556.980621-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260324061556.980621-1-shengjiu.wang@nxp.com>
References: <20260324061556.980621-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0179.apcprd04.prod.outlook.com
 (2603:1096:4:14::17) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PAXPR04MB8671:EE_
X-MS-Office365-Filtering-Correlation-Id: 86105351-de2f-4c4f-9dfc-08de896c9bd4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|7416014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 mlibsTRx8FrykzKL3fTFGci62VLtR0pxzLE1OQLDns7jjkCHSVqkPY8NOWyAdKwL5h7qarKJ7uVTZW11PMeShTsYaNQkg6iqO02pfqHoV2ywq5CgvEtmjYtYuKADqkfjhpCOGYF9DB9rrXL6xKkmtGO7DKGarNvyennEwtIboGxK64upXGtJZBBLob50Ny67Ul+2YaQ5Y8rtk3z11tFBqTOJb/7KFl0eigRYIJo/d7sfA8qcYsPHbnxcDuJ1q6Gj/jnJ/EkiIgnnjRxR1H0csoNXNvZnTudwtx73XmN2QcvVy4CNrD2RxlpRNsqCs6C1S7knNsMW524P7CokBBrBYCS5Crxpo+bkhsIb4OZ9eZfn5U2CHjM84OE2LNNTU9U23pNq+TdKFxoLg8XpLTnkSqX/StuKiEytrzNPuPetn3nz15t2mcqS7yRrX4odm4wGogSra91/XAletXbngjbvFXZWGBixmQYn9iIltoVs9Fo2Qkt+PBdexVHFrbBpiZ4j9Tda+WeU9iM+6L8F5MQ+J4Y7ZCJaGSvdeH5jMqy3Vk7lR2nT/LGpftOW9d/Be91/OiAGKAE1i1lCw2zRqRW/j6YfNMRgmJLGlWUzSR0/hmWrnUWNGu3ISlZjEsrmPhZAIy7nU1Dvp4X0Vl4Ttc/PpqzX0Et70UmDj7U7Exe7SFyZ7wXFWLQNTOTBvNTt26an7Q07PTvx5LJtzfkCtCHmRuIK2yztOCVnmZTCZ2CI1pppn9LgmPCo7JAvtC47vrzq2yLXJeWiDp7my/GvY/URkfbY1PnxJkuI0pWF7OViUOXz56wCqbM1shlOLNYQmMe+
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(7416014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?2DIVAx+OfomOOFXzdiZ2N8mSoP7umlPK8HcgTXepEPl0HvWbB9SapXZiP2T1?=
 =?us-ascii?Q?s29vdbXQoW8O9tAWFu76+vRK+RnkjWU/kBU/RT/aVFQGZn9jlJwZAMVUySoP?=
 =?us-ascii?Q?sDASlali5EAyQN2qa51lbOVwx/TkFi0dIUbTQQXwoKhrJrnT+RjQlUrVX8Bg?=
 =?us-ascii?Q?pN79rQJ6d1w2k7FdluvFjypIkcDtCQNhSG6rfiWQhblwdI7JslUlbL93ycLC?=
 =?us-ascii?Q?93KdDhUy1xEbbyYNDVfVRQ2/gaX+uNYiXPP+2LpgVzp9brmfPf8zVMrWCs4t?=
 =?us-ascii?Q?kkj1Ug98XcIhmf/S4uk/2hHWmhModNEhsvJQCvPm6O69h2dRnvFASaWA6Yvj?=
 =?us-ascii?Q?O6JiGmIk87DsKQDfUX7IuNmKR2GMXyMXjy/KCXCGG1NqF+7e33CfEMcHSaXh?=
 =?us-ascii?Q?3olp0DjqCyJEwtQDc3UIDWCT5jz18I5HhF2T8XTf+O485aEhNFQGNtPXe8Tu?=
 =?us-ascii?Q?NO8aYmj6LCrnbtdUCiCNu/hA3voQsx+KRyrUuWJYwCsFUjVQWXLddyA43kbv?=
 =?us-ascii?Q?YqC/wbHo0zPDjX2WG+jMzW6Jio53wSlPD2t3Zq3H21F+41yGvP3Zrvj4S4v8?=
 =?us-ascii?Q?RMvqvB8l7DoMSTI04JoSDv6wkb7QQaKJlVjG2Wbt96MViJIx+xp2w03tQzy8?=
 =?us-ascii?Q?X60ev1vpemsHouqfEmnAjFptpUezyUxIVvSbEQ4LuRGLC5MMLlqXGceDDsvb?=
 =?us-ascii?Q?RozPOi9wvUSCGbHLsvq6dpXIFcnyBlNjTllE3BQFFZZ8gOYG96BpTe8B9AFV?=
 =?us-ascii?Q?JMBjHxahX4t+pymlNldqsaGjimvBrlIbO0ikh3eqyZEEyfxrKhKcMkylwE8C?=
 =?us-ascii?Q?JfpDmLlyU5osWkdhE0mikn3GEW1WP958Sba0vj5KgfdC9ibdvuRkDejtxBOt?=
 =?us-ascii?Q?zhoSKcoG7k6t788soQvOtLJ4BR1Rb6VYMLpIdAlNiXqJfTLfjDifSu4W0WJD?=
 =?us-ascii?Q?xKtwkez4cImyDRQmwuvBRo7s+RNeqgoe6zf0ImS53D8u1VBzRypA4aTPaJfx?=
 =?us-ascii?Q?VsEP0NzY1XqDhA5w1e8vksWBnUisWPpStkn6RlOGPz1OX25eMrI8F9ihUGvj?=
 =?us-ascii?Q?j0frK5Dq4yzv+rnQVwSK9TXsJVNjkeE0o4jeWWM4dsWOy/hVg/4ly/aZzWm4?=
 =?us-ascii?Q?DQ4VjPuhDBfpd3od57JRrlSpK8D61e5XQOu+Ls7rQ7MoUsW/LoWGcpVDw6BF?=
 =?us-ascii?Q?mBhp8Oq2AIe+kJhSDWPnwp0TJ1ivMrZPbbXl469yh33w+COlyBGTXZdkkScW?=
 =?us-ascii?Q?gHy8I2kgQAu08324nt/dmrglKshO7PPWli++DRJTmuw9+lnZEHgWLSXxCLk+?=
 =?us-ascii?Q?5xKXHXfDA0NAO9KKlIeHQdc4OOYE7Xo34cOxYDKR1YpscjO7psHY9ziLJU49?=
 =?us-ascii?Q?YXG4cMXamREp3UBrdSztKP6yQRxePDumetnmlkn5CHJ9XqBrMNUybPc9lYRZ?=
 =?us-ascii?Q?IjmFGiOWFteACOscau/AxtAUZOdjT7luI+IXs/VvnLTfODr45D5Sxkq584gi?=
 =?us-ascii?Q?1nB2zeNOCIYeruEOWYm88NgONAqp/My9iwj/TJmBYrV77YLUgHSnYINEw7MC?=
 =?us-ascii?Q?LnfYD47fTXGvUpVagdgOkiBjqfgWalsclbvHb4rIG5YYQ2XQoIzRwK9uF5Du?=
 =?us-ascii?Q?0DVO/Ai43tmyetT77IkfRMTWKW4hHyGkTUoE0rpOaYJ0YV4p66ek9IPFLyb7?=
 =?us-ascii?Q?gKybZkDJR2HCj7GukRJ83kVsBq1H34fk6P/+hMkB35s2dcnuASSS3G5S7l9N?=
 =?us-ascii?Q?ETMmxpIVrg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86105351-de2f-4c4f-9dfc-08de896c9bd4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 06:14:30.0263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FOwYEatYQJdvVrMj9xall0YhHqCH7Nk/IEB+YL89kCpps9p/JuV89uudn5kMz4oWqzr45U6oSFSThBVZcG22Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8671

Introduce a new DT compatible string for the NXP i.MX95 15x15 audio board
(version 2).

i.MX Audio Board is a configurable and functional audio processing
platform. Integrating a variety of audio input and output interfaces into
the system, the i.MX Audio Board supports HDMI input, HDMI eARC,
S/PDIF I/O, 2-ch ADC line-in, 24-ch DAC line-out and more. Based on these
features, rich audio application cases can be realized.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index da2be7114f64..04cd1c000ce1 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1482,6 +1482,7 @@ properties:
       - description: i.MX95 based Boards
         items:
           - enum:
+              - fsl,imx95-15x15-ab2       # i.MX95 15x15 Audio Board V2
               - fsl,imx95-15x15-evk       # i.MX95 15x15 EVK Board
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
-- 
2.34.1

