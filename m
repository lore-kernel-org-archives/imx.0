Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013018.outbound.protection.outlook.com [52.101.83.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AD4360EC2
	for <imx@lists.linux.dev>; Tue,  7 Jul 2026 06:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407476; cv=fail; b=NYbBUpRtLc/aMZ+6737jfGpWrnYHbl7cZ2k4gwTk950Y4qmSW32kyYjbsxmj1spRwC+dIPb8N+skNgNDXZaiQn1I1W/3X/f1+eNg26Wy8lLgp8eiyyMwh3h7xn/eVLC9ODHCza8qvM/lBYcvAeztA4aEVqCx9qplqNWucr9/aAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407476; c=relaxed/simple;
	bh=JcfkHg7oO5XEhSL58RGlwiCZc1q8c35G7yCkIjeaImM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JRpVvW7ToToVllnc9rhf3Bdv0KjlGkuhmj5l/n+YvuZB5nDLa30nqhjB7y3VAHQNHsw8JfMmh0qAoJMmKzBF12lACmHT6dtGO9UFFET5ESpLazM6oNYyignDNPE3R7/jFTkIlvqOaPJhphYixVcvchp5/TcSFkAoQ8AtezabCGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=m12K5BR1; arc=fail smtp.client-ip=52.101.83.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="m12K5BR1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCkjSSPApABDb5XRN0J9wZFvvonBv5QD0i7lRVl4wF1a5O24zzhZlo8/Li4mtNIZB2Jx6b6CUl8V8JXKHYJEfZN58lTwOx/RI1VD7CPfIy/iZAx5arHV/HPNWem1tEJL6DMzc5pwHdS7Jij+pdhzGAKBMemUkY/7aK27Cs6iuhyOIjaCacmpwYOJkKrHruu0gp6oL94adas460YlFHJKsUuEJgp713mHh9lHmh9Ox0ZZtR5Dc3ynEGj5gR4/gAK0pFokt+2NbuXJvnXTs9I6HpWNEjwkocYFz9SqqFDV5ASJDVfTzQSEXsWy/maWukgvpHfEvir+lbVy6DRH1Vs2EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uz+Rv4KrW6LvrUErlfZGgG1wi2piAsq9FSNJvDZO+9A=;
 b=G72qUuXg8nHSydkIaTFlyOQu3uEyGPebG77TrGsMxxU33eZR7Drs2R31sJRDSXFuxtK92W8fL08iRejKZXj2zMq2kdjoj5trDzn3oXCwxM8SOehsQqoces5VfCK84QO/d5naV5IDQ9lzCi5aB3OV4ow9Ede9agqLRuV4wWcHOKqYdngzR8PuDM2M207c/DYdDZ5pLMd0iQH/dt/edgzmKtlI3QHlCiRVSDt4358/YnBrEhEr9LBPqj1YDbGQvsOhyCm/BhJV+RVxymVYJaz/12abvnG50HcbxRVY+BWIgHvhULfVxE85yF8SIqPX3auq6qHtEOpLRuZvNrgdK6oikw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uz+Rv4KrW6LvrUErlfZGgG1wi2piAsq9FSNJvDZO+9A=;
 b=m12K5BR1i4+y+ZR4SoTKHwNk6bKZpFQdn4Xc+2gw84hO02rgBuQpnbUIsRnH2QESUV7R5Jp3op9uj7I1UDKylVi4nIRe/ucV971Fvm98hI72v9yhsl3I69WOMIVJd9g+i6tI2UjiPLYTkO4UE+iwPMGuFauvPupV8YTDgk2b2I2aAjzUtPR0ZucC5yOmrZLonLvvAWeSR2u3NMdT9O1rgdTbMzxdTSztiR/S7lGzUBTItO5jS9A3vdpjOH5+B6A8PCio1G2UkjahHv0alQhO2//IoLpBq3EyeeNB0NbVBjm73rNKLv8CIlVenWVPeGfeKNgmB9QaJfIdl2FBOc14MQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by GVXPR04MB10945.eurprd04.prod.outlook.com
 (2603:10a6:150:21e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 06:57:46 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 06:57:46 +0000
From: chancel.liu@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/6] ASoC: dt-bindings: fsl,micfil: Add audio-graph port support
Date: Tue,  7 Jul 2026 15:57:21 +0900
Message-ID: <20260707065725.312450-3-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
References: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0179.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::14) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|GVXPR04MB10945:EE_
X-MS-Office365-Filtering-Correlation-Id: e76a6879-f472-4b2e-ef18-08dedbf50cbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|23010399003|11063799006|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	8FWR2d2Q1wJPi3Aeu73bOvLyvdcAKb44rsUQeIvaVH/bLHvKEDfaGg+jNLEraj5e4XUPWDe9S0xxNXv+TA3MY3jxJaPljx2ayzLFthJYRwQ2PpJwnH+lNwo0h7reA00LyIdaa9Kde0w4cGpEBdAvLYgQeoeLTm0JJMpfL+vfPb1YBiA/9h8yFMmGqpLsGMlzVUlZabnteiagMs/6rVih3Ii0hS5SQ5wp7DpkBkQ9Hr/9DJpxQESda2kPWnWj8OleZ0ZCMjLG4pxlucI8XmgRQSvUXg5qU/3wgV2waInB6mZs3vJLiSLqByOxFZiz9IBkswJq1cZ8gzGAX6+UpMwCf+easwNFghsK5UOr6/AJrIJ9Pw1myECTqi5zQK2hPvo6eo07IZQ+e6/AAyVGIBdQ4vNinEnK7w1P71Adil1A1KRUcprYJ61tYF8FV7k6vvs/1cV5c4a5EJ5LA0T5KPDovcf1wKD28okRnz3teYEeGFnDniGwRKcJxP16Fx4fP2Dl83T67uR3sbY7w3hoc/xuxfWMlWr98oKS1ODl2dLm9jUVWm7r5Cd3VWCRsCX/YJuyGJpMJlVPvqYYVGYcM+y0MQtpzw1s+4QQXudpw14rb4IuqvybtSZuSSCI1fKN4HIt8JxY8mNW9uQXyr2rvb6QIgkHYm9aX1nCFImGYkeHwD4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(23010399003)(11063799006)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XMvllkleFFm2i8ngavRXMSZEGoTlqm+b1SnFskL5CC4c8e8MZwRHH5u9V4x/?=
 =?us-ascii?Q?xRv42qL5lJZfoGwDE4OpbtH3gERglbtf0bG/BFPt6hECrmiap6MUte/zEOZX?=
 =?us-ascii?Q?p2Ss9Ahuq5sUxIBW3v7xGK6Rao3XdVkg40oEBZnginRK/7JnO+nUIx6xHQqv?=
 =?us-ascii?Q?SxtERdpxtmpySrRi+8KOszemlcnExZgy+rYzdDvQBx+K/KLF62psnEWquyYL?=
 =?us-ascii?Q?kcA6HqMbWoagCGkURPmSxORL+Ucl+PChIayIFsQGinSuQAZfVHwKJTQYgtPb?=
 =?us-ascii?Q?sBkTXGhVachUqoN+ZGxf7FmUy5B+5bocwD71xuvdJBCHqpCXibykBL/j0u36?=
 =?us-ascii?Q?Ib8sQzCGvwSLXUg591PKrZuSWQ3TDOMq9YDvHSAoCNUnfvKmEJp+9zpoCYcm?=
 =?us-ascii?Q?ubq0fO2sezLjMB/QmYhAIoT/IF3uzl7gM2/E8P0qxuhJSPOzTRdzbtHrbOAq?=
 =?us-ascii?Q?98mCw2oBH4rKmnpWaa+5nyv6gSkH9Fy6CZoMzkh8UrFsdVsd9ZK3Ce+V9IiT?=
 =?us-ascii?Q?4kNyc4sxcQvtRZ3kBvFwFcr/XjcOEL27zr+crwkG/ZgNy5/A5VDt87o5RG7p?=
 =?us-ascii?Q?9B3vX6kAfjcOCc00xccSZrmCq8vB0MDCic6c/Yaxe44t7KLjbNKgh3fRQjvB?=
 =?us-ascii?Q?lpCy0wrj5Gaj+jRgVK2tlmyazbxLOZ7XmxnMEupX2RFw7wJ3/6nFopq+k2j5?=
 =?us-ascii?Q?Ls7prB/re+3z9dYXGpFIZ0BEXsTWm60OALsiI6O46A3qrtBARKm9iw2NJdei?=
 =?us-ascii?Q?yqPyW96ir7CzaUmGuT+tiyQ2J3OJQpOaDwwpsd/wH31kSlUZMBYEA9JC7bYS?=
 =?us-ascii?Q?SeDy6zknDjIVW1wjT5MMpfRosy/RVhwTnIM1DJk6UjUgq1TmWMAuJMe7HZYv?=
 =?us-ascii?Q?G7TX80099W6nXtnBghbGtHbNcWQqEOyxaC9Pxygva8h4KoOR1Jf+BvSz9Gmo?=
 =?us-ascii?Q?R4G1jH4zhNA5IIaNBMwibThZDQ6ncr2X8j+HO47kLTqtZRGzxZ31H0PSIkyt?=
 =?us-ascii?Q?26YKEq2GQwhUd29DJXunZukD+FIoSncPBFzKXWGv+lt+XTMDC31TRT1wWPGS?=
 =?us-ascii?Q?CDH1r09v59cbzLtDqnHs+O4nw0s2Wym+HxSQTgJW0Re6gowfPSYJxgRnxScs?=
 =?us-ascii?Q?izemZrxNoV+dUZjeSPq5gT4EiTleBG6uObyei8y84K7fVELh0/wVM/67CK5N?=
 =?us-ascii?Q?DALOIw7mbl6PCKnJixTjij0S6zEszEbP9QoF7eAI9x7x3Jpu4lOsL0Uj0gkI?=
 =?us-ascii?Q?t72kN0DaYLydtqaTNKnLAe/d+gZJMhmSanxBzBJJL27lP5CqfPpBDKEQFmKu?=
 =?us-ascii?Q?NKHjRHlnj+mvKJ81kV/de1h4PcF9xwkGl3rrNtJasAbA779+0BXANXXk/qtG?=
 =?us-ascii?Q?063RnJC6tWsx0BHqdPiYLktNnCqLB9CRRlv7BpCCZRq5WkFpXb35FFy/U/Jp?=
 =?us-ascii?Q?RDDIiSW+vL4ElVTfD8O3LxYi4qRNO5LYvRZGUwjApfwctTIZ4fkV7OWsKa/Z?=
 =?us-ascii?Q?Zk8ef+pNv7vguRlUp5tQgHzjnNwUHdjpVeao7tfXBQ+eS7rsjhxzc4FYi+1/?=
 =?us-ascii?Q?FaMw9cWxHksyTcfOjqIKQJghXUyfEwOjWVeVt8+kdKjXPiEcZ34aGn+NH+mU?=
 =?us-ascii?Q?0BBm+8Mm5TYPc9vAYu6RAr9hfO51NWtNj9BhG8tzMQxiQT2+iGJ5QTii+1MM?=
 =?us-ascii?Q?+GxfjfOjXnT8YI20LFHfqkYSJucbKEVy7RqCDxMTNsBnK9mjUTwNRJFjZtT1?=
 =?us-ascii?Q?E1yp6roEGUSzktKyh5dUUFIvHKGjWTi/MWlNXb9H670gWG32/Rud?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e76a6879-f472-4b2e-ef18-08dedbf50cbe
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 06:57:46.4545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZCeKAip/BGAeBduVEv6+7Vr4j8TwmFGbFya63/lUt+ZEl0Fa41RyXqAHeF77GIrNnLCMDBMZK8bVcJoFvuDVZfUSG3qiFr9ZuYHliOjTnrW+NBjoE5hnOSfwCiScgh4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10945

From: Chancel Liu <chancel.liu@nxp.com>

Add port property referencing audio-graph-port.yaml to allow MICFIL to
be used with audio-graph-card and audio-graph-card2.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,micfil.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
index c47b7a097490..4c7dadb310de 100644
--- a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
@@ -66,6 +66,10 @@ properties:
   "#sound-dai-cells":
     const: 0
 
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
-- 
2.50.1

