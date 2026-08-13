Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013030.outbound.protection.outlook.com [40.107.159.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351DC353EE0
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 06:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786604068; cv=fail; b=phU1MWp4ue0lgIKMloQUVnxQrlrlDj3lMGaBO7OdSR9116azA7MjmfXovEcChTZdg9kMU95Vs2fnPgTdbOL0Fjuf3txX1mqH6O4dIzUIafDSxCuOvx6Oupj0kcUCwXI9jYfsn8gq8HSBx1fm0w08g3BM+nxpqIdwvpCnk1r1Qyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786604068; c=relaxed/simple;
	bh=mlBPhWxSyzDSYBlKm+Whfd0aA501orwL55/NuWvR+5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HrSgTadVMjgq0MeyB9u9HzCRMo3Hs+1BJOKAMn3aSQ4+vengtOAfpnGpMGIrIAjn3ZEtZ/D9cMDVQbsuqO+nJLRx5xA2Zb6q1Lm3tDQAz/3RZtz8kG3Kfnye6Qnvw4gnCuCBj260CGIfGpTJTDKxoxcFhhQuQu7ggZqxN7UH4yE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cgxzecOG; arc=fail smtp.client-ip=40.107.159.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cgxzecOG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmhPksCjSUZEAlTHXe+GJYaCRr/ZNVfZ6mbJpHTsbuZ7Bv5KTOW9cZIfDg9tbn4qPgqGUGBT7A5jMOhrkxv08C6cRQiHapDHVBMn/dRtjfh1y5TMGBBS7Fmwcpm/JRO4eeJwCJSWlhRVALWB9b069qf5F/XkLAfcaGpEvIjU2MsIixKoqbtgSuCzEhSAv6mU+EMb/m9g9+dKihQObeTQ0mKILY0olJRl4JYtiDdnUK72yLzkhSILdQMMnY9B3+k5jLZNlaPG5pJWLdSwbuxYcMoFZ+ExeJWftlvaMxmUb5nWQfjl+yFdr8jNEuJqrns4KF9+RuphMAwsMFQo9NxVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCtEhRWKsfPE5fxpbyuqgsKvw4OXZH7FBGuyAcGHfQQ=;
 b=hlwWFQ0g8lbTymRg0My+/D/Vlx0I82MqGOqHe7bL/MBKUxZPbrWJW3RFwtLbhGKNANnnxR/evHxPIQY+yh14lDkr6TJMeJpRl1JG13Ca15ZCeKhoHJjmo7VoRmM1J0TKo83KDlJL3f3nZOGfYWZ1LH8FPIE3JS2Sa5d+Xzk2AvwjjTo6ZmhQ/53fHjvARz8g11zQK8s2q+qrpYrt7jgJn7s4d3ZogQoEPTf9n+jDXj2gNTCpBMJ/Tuvdbb5QKA8inTK71MOzEisbS9f528RJbEHhv+vVSz1qNSsmovvwNjfXFIYxaRS0khOfkHnEDNOcVvFNdWsIYZGNxnZIdjA4Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCtEhRWKsfPE5fxpbyuqgsKvw4OXZH7FBGuyAcGHfQQ=;
 b=cgxzecOGhHled70jlupvGh72IGiKxalcXqTABHz0aupwdR05E0fjdRuC76DBa8/CVzssjZnqu3w8lnYfGgay2eCcvjYPtuil2r/+mx6zpvlYEmQwND422H8XI94BE7fzaqCgJU7i1tGMBIQqA0Cwzh3Ie4ss/Nh3WewrQrYGFHSdblxHHin99wLORNOc9yd4ijhl/jTNd9YcZa+LtwIfczCRuWjDHIbu0dN4hQ7v/H/Q47Y7PcLbK3x0CgnrWBTRqCwUb0Z/zWSSjv5pHfh921bGVpDnKUP7we2fIw+aprmiDertBq3FMMS30AR1y3buWjylNkLPkKjU51uR5JM6mA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by AM7PR04MB7158.eurprd04.prod.outlook.com (2603:10a6:20b:120::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 06:54:24 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0315.012; Thu, 13 Aug 2026
 06:54:23 +0000
From: shengjiu.wang@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: [PATCH v4 2/5] ASoC: dt-bindings: fsl,easrc: add ports binding for multiple conversion paths
Date: Thu, 13 Aug 2026 15:00:17 +0800
Message-Id: <20260813070020.719810-3-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260813070020.719810-1-shengjiu.wang@oss.nxp.com>
References: <20260813070020.719810-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::8)
 To PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|AM7PR04MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: ba3bfc80-9e7f-4ad3-63c7-08def907b566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|366016|19092799006|1800799024|921020|10067099003|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bwXlupr3e0C9tVtMEkeen2cBU4IszfAXiXtlm3c+jhw+m+hsBdjYgHqDNYDSwaHt9vM4U0juC9Wp0dDs63T/PBbC9bQQGUGo4d8rvSVAzfetoWWCfTa/xjhvJQjIJmQLIktiWLBOt++rJ9VKxiPHIS/jCjc/UnxRjWRFE8gqjltTOO7mNRH6RmEEF8lTAcsaX82Gc36OvNYKt9nFO8Llq1HnKso2riE/RV5mztNB//irKKFZ32QBmERwI12F3v1oc1QUO8XW3DFR1P5Z4Chl1Qu+TZ2WJoX/uP+dGoAaen91G63/7po7BVFt9/rXRDar+5+4DR+rYYEWxgCiO1u2bzr81qFjtWUEfSXSQrufYsjdLsxmRKWzwE2bgzC68gkQMDt/N4NwZXNH8DrPhtH3QgywxkvTDImRR//ziYiSb1/c+xsKVZBUoe6LhetIX4mq3dyIBjNyJDKFctl3vDUM+cCb0kTpAlqifNqWI/7ZiE24Un9fUJre0siXfO0miIPFaSfICzKS64oCwSvFSACS/gHjtozRDapEiW4kz7F0tMVG+wpkdiEKfDR7madHCixULJ76ZIwHuAQqtsV4Mj1P/Ks0P/RS140fEaD/eGZfeMbPLOa0YeqsM0ARk04k/tuDeB8D8pNgowZU3VEzvvwEyhjkFuQonsSmaon2traxokhnshm3yuCXrPcbZ7vxb5YKCbd4w37ye5WAwkqKIOaUXA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(366016)(19092799006)(1800799024)(921020)(10067099003)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xFzRpUgJejfDWGNlcuxK+7nOgZvDyIZOV0FBj52khUl3M/JncxnNm3yDH7iM?=
 =?us-ascii?Q?af0/pQgcSBZ1zFcwngNRJ+G22QWZtpKMV2u0KZQTxG1vXguVMc/CHymzZT9U?=
 =?us-ascii?Q?0xrLLCPCxwUMHQZIB3HJjI/okPvkZ9DjsSsOPBXLgUEqPgNE2wxkNKjpKNxC?=
 =?us-ascii?Q?DUM7vT3KO24IDUru1liAQ08txL+0dfvr/9U4utkjtPiPwjOdro/PsHRzIQQ1?=
 =?us-ascii?Q?RG/1Vd7k7NE5031vQ06JcgYyjJnHkIP3OVnhyraa4vED64lqAtcYBmqNPkzw?=
 =?us-ascii?Q?LhMRTavCgdNLHAOkoE95r1SKlvs0jssqE8lhrwZmn1uLReknA7DNFXCsjeYw?=
 =?us-ascii?Q?xE3cKGtty6yS3r3egHwQwx1cvJGSnwyh/82PidHgyiRnu/whyyzwF95IIv6K?=
 =?us-ascii?Q?IPwzyBKaFhRpY32i5nXrSk22OJ/KvWJgCyS0SpT4t4n/AMeO9hgUlrKLe9pa?=
 =?us-ascii?Q?kBsWsJuOAfuNii+/L6t4ytoWg289fNuZ91iD7qFP9m/D4CjEGsRXGfXNWPTz?=
 =?us-ascii?Q?llTZqmFSkPYxdhi54NFxlszTP+2qVkewx5VVY5WzsbwRQdPmwQotZOUy/d16?=
 =?us-ascii?Q?XIPSHbDGGDGxmkbnzZYn2TZN5Q70UMeec5vxh/lj1Hpoz22Dfh9l9ajhp8kJ?=
 =?us-ascii?Q?HmCfInueAeoUOS8QTLUnj5wvJRxU0E492J34Vy2mkTaidhIHNulwz+45+XNy?=
 =?us-ascii?Q?mTsJSCar1qgGfs3Nq5YPSfWbpjvgApMgOgLUNEt7mVfegB0dMU+c/iA9q+EB?=
 =?us-ascii?Q?4Aytf1btX0P/lmk7SlcOp5DIG3wk/2GijO0S3aVy72HjcvOcgmL45Jwvo5O4?=
 =?us-ascii?Q?FVZi5iAjRlav9zAUI6kBjNSTmfVEMWCbR0xsbPwG05hC6jbkm7QB+MRpfVAL?=
 =?us-ascii?Q?/GQy6oiuaT8AJZvBS3AzJYPu1GrfQeE0r8ju7pbDRSgwJnrG635Zg1LFBjXh?=
 =?us-ascii?Q?f2jLF9UoFhrvAVMV9CrWUWMDZlRNfGJAOcKexum1LhMI2sTQ0unJbg9g/lvt?=
 =?us-ascii?Q?hFwWRkuK/HnTMs8WiF3qCfRetISH7jtZtV99jztuc4Gi6qoYK+s1JPHKnJct?=
 =?us-ascii?Q?D8QHqHGKc7W4CvK4sbkKsemUWta94hg5j9baf8K8eyD4fh0qU8Vn1tgyXnwN?=
 =?us-ascii?Q?BtOsHoUvwRaoML3ybtSSkx90HvhxAbbu4G+FVmbky/spuNQXUYs2UtOXMnVH?=
 =?us-ascii?Q?wxzxdkfxJMpoVcXJ8OMWtfemjrpZKGOZnsBYTDn7SYngI6eaFyLc20nEKMht?=
 =?us-ascii?Q?rx+t7OAH3CynZ522YZJS2orfAflhSLAl4+Lr39sCCD+PcTwA1DKRf9j7jt/8?=
 =?us-ascii?Q?QdiG1UW4ARCW4MAM3n1ttwNP+bxtYVVNXjwW9RUmjN82ynxZEbm+NmOmWnpl?=
 =?us-ascii?Q?8cy4+iIAIlc2LzWbGnbUCVpmLCrivBe85RJtQRlhDMdhZAKc45SpQJOldZTX?=
 =?us-ascii?Q?N6wuFpDOFme5ZUn88Dp4FscsnWfk9tGbTcgu3qY3EeZJiHKJk5R1K+R1dFrK?=
 =?us-ascii?Q?+AOHS5d4SxqbUC8IFjfFBxJrWpk0lvNZ7oC9/jAip6a2Ye3qD69C6MedBydC?=
 =?us-ascii?Q?GBIQE4wvaKSrSSQRYQPZKQunaKazhclGCzvwNMMWxG2tY1OOpF3OeI1e7WVp?=
 =?us-ascii?Q?MnTpASt9oaKgH/P8lgrI/rBixlKXxzSKQogPmo9BRdO1fyW5/p7a9jUzORNN?=
 =?us-ascii?Q?MM03h9SlK0ky6hHRHPUhMnegfjYxOP7QseFAmYHtynA1QJDxHowfz3ZTGl9g?=
 =?us-ascii?Q?K9PU6hrvR1k6RrND8cTMFqAsFwjUdmPyGWURw5G1qgy13oVhVa3C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba3bfc80-9e7f-4ad3-63c7-08def907b566
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 06:54:23.8317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6ZpXAE7Fx0QmGw2Aj31NczpGmN3VevqbYfhWFpRz2M9bL5N4zEAlcqHzftUfvVi7i4drgOABO/UG1WsFLQvGvndhs5b+/rIjbzbwJysmsz+Fya3KYGx9xpS8YdoaQMz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7158

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The i.MX EASRC hardware supports up to four conversion contexts
(A, B, C, D). Add a ports container property to the binding to allow
each independent conversion path to be represented as an individual
audio-graph port:

  port@0 -- conversion path 0
  port@1 -- conversion path 1
  port@2 -- conversion path 2
  port@3 -- conversion path 3

Each sub-port references audio-graph-port.yaml and follows the standard
audio-graph binding conventions. Contexts are allocated dynamically at
stream open time; each active stream direction (playback or capture) on
a port consumes one hardware context.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/sound/fsl,easrc.yaml  | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
index d5727f8bfb0b..a53ec4f6f1c0 100644
--- a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
@@ -55,6 +55,14 @@ properties:
       - const: imx/easrc/easrc-imx8mn.bin
     description: The coefficient table for the filters
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    patternProperties:
+      "^port@[0-3]$":
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: port for an independent conversion path
+
   fsl,asrc-rate:
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 8000
@@ -106,4 +114,41 @@ examples:
         firmware-name = "imx/easrc/easrc-imx8mn.bin";
         fsl,asrc-rate = <8000>;
         fsl,asrc-format = <2>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                playback-only;
+                endpoint {
+                    remote-endpoint = <&fe00_ep>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                playback-only;
+                endpoint {
+                    remote-endpoint = <&fe01_ep>;
+                };
+            };
+
+            port@2 {
+                reg = <2>;
+                capture-only;
+                endpoint {
+                    remote-endpoint = <&fe02_ep>;
+                };
+            };
+
+            port@3 {
+                reg = <3>;
+                capture-only;
+                endpoint {
+                    remote-endpoint = <&fe03_ep>;
+                };
+            };
+        };
     };
-- 
2.34.1

