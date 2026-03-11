Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013011.outbound.protection.outlook.com [52.101.72.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E7D374193
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 08:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216742; cv=fail; b=rPXIQC4GXtfr9o+pb2kz6hPE0eeLR9Ke16HZHHOcwA8M/uR7CHXPp7q7jrNWST+LNZZbIKVPBldg9l6BrEU/LqLZbJxYzC4UtcL+eLH2Wgij4YURfI7H3seSMGfHZTgKjINWCDfW3ajU8XqtBOFa6wsTJqgPsV0eqlwJ1+tCj+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216742; c=relaxed/simple;
	bh=ILhrfO8Efp1nLHwQHSPOvckZ70QBlinth/nMKWLrXxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=twJHF3yzB+GuXLHfwfZfvuVh9koPRGtH0DmqdVtWFz9fMnOW45KzGw6SFf1OT0N+qtmTFH6wcFNV3CJkaiWa/i/d50HZ7KU/KtSHkYxMRi1ao/9FsWaP4/TKON0OB4q1KghFN2v7YHHkOyOqwMtQaFNvyUZQz9lo24xNxU7Fx2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tRJiZ9gm; arc=fail smtp.client-ip=52.101.72.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tRJiZ9gm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G8MJSHaw/qo2QJsmaFt4vPJWTe42WaUeUMZYKkhWjKBxC9+0BZwnTPZzKlcjjZggU8oN9QQyKADt1ZaECZeLYwfHGANPjB6UkPuZxlj7jliGtKcbBVY0JsKRkc93bcA928bPDQQE/6IUGweGsIvidjhdIl+rWt5M2cdkhATtiTkRJYH4z/fNn2Q5C6UA3G3cRO6p2DhHR/6R9nx/NcRish7+RqvVH1T1WdfGbnWdZu7hAlW0v4dZv1nTFZ3KGf/4T+SgIWkfomk+d68OkDOYqjc6xMc1awatcbdLq/0z4DDnsdarR9byOSAiAez1LTmLzmu1VG6X5aCdMXh7sopobQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05BkJVEhe3gSrrR7zwNYJaYt9wji3IaWLx52seYSMxM=;
 b=bhdc7wM51llN04u9jnF2+JlAmkjF2msrxc/5fYu0zDAQnvjpXUe4SX9QDuZJrojiqXnUeyQy1TDm90eLucWAP1lv0DTxoBg+KizHchkPokdyNnc/26qs7iVdae6LO/DoegiCTiW4z8vUCbfjCDvhfQVwHsG6qGBXZXGO2R51r1TavY9mqJwV/cPPyIEjgjlTNKP/wRi81xOvOWnqmqi4oshOmzZ/h3Gcm9yzSecSp8sGcQG3jpG5zdLsRolr8KAjHDIXOa3ag7lhTnCd7IQ/GVU+vi5K9AIUOEG8EfuP2cBDC/ko4CLWzK3MeuplMQIn723E7+RfizLGbuYpFtRwOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05BkJVEhe3gSrrR7zwNYJaYt9wji3IaWLx52seYSMxM=;
 b=tRJiZ9gmoYLq4EAE22Iad96WfKmNu7mvt7YmJCf1DCJ2mCW0uMHNgfrqXWUJhYQo2SUnGDue9Lj9ZDmEW+TewWqPlFKrOT3YxvBB7aECVLFxb/VMVOl3O01Km4nnzu1h/Wi1OyPWpYoMNxO8/YHKe0d+ybolzuVKgjNf0HD0+duZmrAVAb5NWx4kFz10kIGpL0dFzSBxKsRdREsOlX/aEBfTXxssBPErlNqD38yuMc1dZLgIESvxC/0n4XH/YIsz8IGt4gMZ/GpiHF85Q/T/h5SfJpV1B6yYULxLMi2hqNLa/2BEmYtUPASipt9N0eAtO3NMgWu4qFcJdXjFRh8vNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS8PR04MB7559.eurprd04.prod.outlook.com (2603:10a6:20b:295::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 08:12:01 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 08:12:00 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 2/5] dt-bindings: arm: fsl: Add NXP S32N79 SoC and RDB board
Date: Wed, 11 Mar 2026 09:11:51 +0100
Message-ID: <20260311081154.381881-3-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311081154.381881-1-ciprianmarian.costea@oss.nxp.com>
References: <20260311081154.381881-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::27) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AS8PR04MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: e75c1fbb-60c0-48d3-5a44-08de7f45defb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DETQGGYH2P5f4ucSeK7x9pGRSAamRY9Htxy58exV5LoPIMIaIhq0mAnHOpT6x/pepMrf/8NWHXyKuJhvC6tdSIB2ZTtM7KYwfZj/hZ9gP/DbCRWRKKPz9JEVcxSliiKlL0LnEciwXxzPQuNywQbrvzNKK2t3irkX6cnA/6K3dhQmoWHYwCnKe6q3a/GmUMi4MZKzE8cYKvnzJvM49Un9Gb1rCETbrL/N4iOvqd0uGSfEwQBuZW0xpWu218Rf625B1IGEtpCB+nUiqhc/0iJy+sPd1SPbyad0kWQsEUAO4bm3vUhs4OAZEciRTGPrGxwcgTqyFeuiY5kxDEjX6OcHoEWkzWhd9OSSZcPoJbYDLbee8BdGQSAFZeJmwwXlnnLFcgZfpIU5ns9k0Y1TadOd2aD8BiynuErtrJZX4GGMgMlTBPYFTlx2jZVANkvUhaJS2LvQFxaLZVoOC0MmmBife18HMMDFLgQsaRssbWSR+AJ42g3P5AKwlv/Ee1RFrtekbs3NME0SuVMBI41WkyL0nF932/61V+crnnAaV9nul23aSouTLTa0Tsn4aXGF/dU3EcWhD0NMr5lx8Lg/+7pyY6IwNnyovZqDfvXRqvmrxGW9CX7rY9aVkh3OA1ih/vum3CUyOk4tDfXVvXLTSjjXwZUlxwSDA34V6xU4j4WOY1eGaFhwDHAr34ocsLQN0Sdtp2FyHtcImNUH7TEKLNQu4Rzi2SGFzKa43fq8xRCgkNE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1RBempSbmNLVGtwNHo5R25Vd3IrKzB0Tnlya0NxU3FlcVhaemszelNpZ29m?=
 =?utf-8?B?c0tERjRSNkkrcy9HeUxUTTN3dDJ1UGZvQ0lET09VZ3dDd2toZWRCZTNnRW9H?=
 =?utf-8?B?OXhwYjRRc0NMYWVPNG4yYlNiNGlybW5PamhFWHZTcnhXeXBhU29ndzc0U3Ir?=
 =?utf-8?B?eFJEWlVVaWNFeWVyeHVlRUNoRWs4TWNIOGJkcmw2OWwvMTlxRXcvckJYWmVQ?=
 =?utf-8?B?dXhGODBDMGwzM1d6V0tSc0JHa0JBbTZFWm9ZOFBkdXVuVkZRU1BZRkxZUytF?=
 =?utf-8?B?OTJ4aDVQeFhtWjJqRFFVVWRVeXlSZ0xvVFd5Nml0MlFsWCtIREZObXgzaTA1?=
 =?utf-8?B?MndoVXZaUElWNGw4aFpZNHNRejhlM0luQVhEdmF1RTJ6WmFaYmF4MTJxRUxD?=
 =?utf-8?B?OG5YbVBiY1dGR3NTKzc4Uzd3QmFYQmswMkxZNVErTFVnRGQ2OEdJcFc0ZnpN?=
 =?utf-8?B?NDBnVXlqK3RDQnRkT3pkUDVEWStzVlhROFVzWGRBeDdmNnhYZ0xOT0plSTF0?=
 =?utf-8?B?WDYvMEpzK2JNWXVZZDdiZFZqWFlhZ1BRL0R4ZDZ5VE92WExqTXVaMklNZjFZ?=
 =?utf-8?B?dUsxajFmbWZPZzlHeUxwSEUxQXpqVFZpWW5SNnUwZjBuNktwTHpEVnlDS1pv?=
 =?utf-8?B?R2M2US9vTGtEUGNNczgvekJ4cXphaWV5WW9WRlg3QnpQdHg3QWNUdHhsdm9D?=
 =?utf-8?B?ZkN3VUp0SE40S0liY0h6b1ZFOUJIRzV6M1J4Zm5yQmdKemRzb09vN0I1SGsx?=
 =?utf-8?B?ekFjOURCM0MxTlMrOFNJbTZNbjlYR1EvejVqdllQM2FvdS82QS9RVGlpUjJt?=
 =?utf-8?B?eHR2VUxuV1ZoKzVxdmNVWGh1QnVueStmbEQ1MVZidDFpcTJYTjlGcS9UN3Zq?=
 =?utf-8?B?V2prUG9rc1JtTDdIT01XTmpucllBTDhWRkQrMHM2K0NXZ2hYUTIrcTNTU2s5?=
 =?utf-8?B?ZGxZL0VTQjdLTWFBL2JWM3FRZ3lJYk5HejVTdURyUWxqUjhZSUNMcjBzTVRD?=
 =?utf-8?B?MFFMa3l5eHBJT2pHVlhSRUQ5OWtzWFQ4bDVFNnRCN2dMOXc5SDZxTjhxMUU4?=
 =?utf-8?B?UEU1U1Y2OExTeEMwQWxvak1veTVNU3ZrakQwT0pzeGJlS0twMW8xRXltaU9D?=
 =?utf-8?B?S2l6dUpmREcxK0x1eXBNaUZGY3BDLzR1VGZWNzR3Z3JPZDliVEVpcittaVQz?=
 =?utf-8?B?UmEwM1g4QThWOW9wSjk2U1Z4QlI3cUlsdytVbnFvejVDZTAwbUNvSHE1OUkx?=
 =?utf-8?B?djhJd3NYVjJxNTZLRWpTOTF1cjdVblJHU0lHdEpxZXlIdHF1UkkyRW8vMzFN?=
 =?utf-8?B?Mmk3SkxzbVlpVXpXZkY1WnhObm14MGhIVktmZ056TFlnemZWL3FuL0lsZ1lv?=
 =?utf-8?B?eGNKV1RTRlhCL1pTMjA4M2VTTFRoYUZ1cFBYRDJpM1ZQT3dJQ3hKaVkxTlc1?=
 =?utf-8?B?YXNKeGlObVJSckY5Y01tQXhSQ2dGeTBpTkxuMlhkUlRiVVVjZ010V0wwQVI1?=
 =?utf-8?B?SUFrYW90L1Z3c2plQWdOU0FKU1gwVGJPb2RmVytheE9janRMNWtDcUVVSVF5?=
 =?utf-8?B?YXpwRUhCdUp0WmtJbWR5ZWd4UWJQZmdiMkx1bmd3VGt1N0V2UURkWHIrcDVz?=
 =?utf-8?B?TjdqNjNrQXFxczA5Um1QVVBHKzFCVHdaTVVnQ2hlblpEL0ppSFA0a2tma3Rt?=
 =?utf-8?B?UHcxa0RDTE1qMmFEWnpyalJKYm1PZnpUUjRwSGY3NnN6RTNkQXpGRGkrVk9T?=
 =?utf-8?B?VGVia2x4RGpWWk9TMGZoR2xWRmdjbUs4QzZ4Rk1HTGxtbDg5TGp4MEE0ZW9V?=
 =?utf-8?B?VUR2eGovMFI3ZDVWNXRuLzNYY0lwWXdCeDRhV2w0SjRxRDJzQ3FkaEh4bUZh?=
 =?utf-8?B?QWdpV01wWTY1K1BMTDNDcnZKSUw3blhmM3FMWm1jUG80R1RrUmZObzg5WWM4?=
 =?utf-8?B?QmlEcXJXL0x3Qmc1dWZWUGkwMFhjWHRDNXJUenF1RFZacEg5bW0wRER4a1JE?=
 =?utf-8?B?ZXZCUWoyQWNLNGlTOU9ldThLZHIyYUhrdUFSK1VsOThITDl4WlFBbVBBMHdn?=
 =?utf-8?B?SnJORjVmQzlSOEVDZlZQLzh5RnZrRDJQTkxORlBFaExCSGdVK0JjemlMT3Z0?=
 =?utf-8?B?cENRN1piS3o0WHBXdGNpNDZFeVhoa0FtSU5vL25hWE90Q2dMOHlHNVVZdVlM?=
 =?utf-8?B?OFMyVGhwa3doR1lsbXcvRm5vTSsxUWFwQ21LS3VqMUNzNEVpdUp0bUNGUmNz?=
 =?utf-8?B?dEh0eDV5ZGtrTmJGd3ozZHZ3U3gxUEtTbDRnQkQrZ3NPeU1GV3VjQWNEbDFt?=
 =?utf-8?B?Q1J4YmVEdGJHa1AxUlo5YjFVMVhtVXo4bjZqRGRVdHJqcXdXV1BLT3M4cmNt?=
 =?utf-8?Q?f5VeI1DC5eEVJHhU=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e75c1fbb-60c0-48d3-5a44-08de7f45defb
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 08:12:00.6857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+wRWR5DuZo2NZW0uxQId+1HuTSu8bQmWtHfjR9R6SNlREi+GLU2HZnIXFCgPmQICWAVtCWRi59Nek9OBWxtJIB9+XmEunQLFdtolJ2M9NQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7559

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add device tree binding documentation for the NXP S32N79 automotive SoC
and the S32N79 Reference Design Board (S32N79-RDB).

The S32N79 is an automotive-grade SoC featuring eight ARM Cortex-A78AE
cores organized for high-performance networking and gateway applications
in vehicles.

Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292c..415081423a30 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1827,6 +1827,12 @@ properties:
               - fsl,s32v234-evb           # S32V234-EVB2 Customer Evaluation Board
           - const: fsl,s32v234
 
+      - description: S32N79 based Boards
+        items:
+          - enum:
+              - nxp,s32n79-rdb
+          - const: nxp,s32n79
+
       - description: Traverse LS1088A based Boards
         items:
           - enum:
-- 
2.43.0

