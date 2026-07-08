Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D263A0B3B
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 19:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783540154; cv=fail; b=CtacDrQOdiVv9eOvZQe7Jc+1HSlpfVkiJvJCza7GJ4JzHPyreQw7Hzm40uZWf+Lej2XResZr/7lkkuKafwLTDBI1oiqS/JskSI6Kw+WbKB8yvW9wlzUT563mX9hK2qftPrYf55Ec/avE2UVIapiySmZvwopCfBtPYYbHZNeLD60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783540154; c=relaxed/simple;
	bh=1SRsm25n2cqErcfSp4ghUm/DaLQ/+6vgqwtMoqLrF9E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sIDd4/fG7fPtV89t7lrv1DxYL235mSccD5PfjK6Lt+cMBo1f+fio53LUa9SwjA0bVabb5jtk1zb1VMTjraaAOJtVILdRGP9d1WAoaPZjWPFfgWLOjWbGWN1MNiIdPlgOlDDvhOWBTvuIi498KDlRieoLmYVGrZ1M+Z1BYVwhvko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qT0P+yfD; arc=fail smtp.client-ip=52.101.69.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qT0P+yfD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICXiHcC1HrnDCrw1ay2der4ByTydWN+aa6IqiqeT/6M4i2xF9B5juPOPQWbzef4U2T7TQ6okujujSTI11+i9cjHCuvnW1B6WUv+kzHDmXSXsCdl/y12Q5BmNNHtwyMkYXAK5xMuBgXWfehFWjquMvxoeN6Ve1ERNnPc2V7uX+m8CTPkJPqCskHCVXQ+holzrHsqJtmbEcK1qf5nNGud/YqGZT982epExaWFYPiV5OlQrr9gQntVj6DV93DHKVRruBmEVYt0OqZjdefGZGH5WvNKcDFx55vEdaYHzGHAxY7mlj5N06X3JbWQiJ0nIfgxdvXKyrpA3cGsCh2956NByBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wx2fn2hZbx9kRqpMwidreFKn+v6y8pJWamHPBv3F6tk=;
 b=TErkN9z/AAYQkE0lovhaIHDoxDmnqQmPL9En7sULvGmiyU0xC7raz186jncyrx3KNNJ/sa/d8shbqwZGBNFA4aqrHzGtj5bN3wfUlOP3s7IRCx/lBwvmn4LJl+FbHdC4xsxWcuDp/hsM/xtX9d5PGmWwqKCB3Gu8qdGdvuFhw8UQqSujG8PD3Ak1m4XP+k2+YMdPPKVlA2v+s5ACKs6qG7sUch7O19DdfiEG1UCgfpZTNVX5ZLaHK1UVf2IGfRbIEyaGNWTTBIihUB10x/S5210LG6ypcxWAoFN8V4MBygPGRbkQCSCwSNfogUv1TP7joZfmXQgr9C7OU1U5aiCbbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wx2fn2hZbx9kRqpMwidreFKn+v6y8pJWamHPBv3F6tk=;
 b=qT0P+yfDAVV+f5jPXfyJ5emNI94Wy1S1BxdwRvFIKutzepkRP/yioga14pS7uUNx5TUkGIJXBWISqYkTzUZs8ORsZp/lYbgAYmFHeOyBiW0+tIaMBZ+CU3STvs2xjvMkxBvOS5M9YtTQkso67okjame46PmXkmqXEuLTHWLeOGfOeld58SuTfGpypeqBSoacL66hlQhnXdSkvR/P0HoD9qIvgd7AegdysA4uQD9yyFIDsYTxVnePcxeguZ4OwbmNbOcv8WUDS/+J4gRHf/3Myu9j8xJ02LD9uML/wHA4WbwC1JcpLxKyR8myYE5fJZXWuhliXjZYO0etom8qgjDuKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 8 Jul
 2026 19:49:08 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 19:49:08 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 08 Jul 2026 15:48:56 -0400
Subject: [PATCH 1/3] dt-bindings: mfd: st,stmpe: add deprecated properties
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dts-stmpe-v1-1-1f51d15bb358@nxp.com>
References: <20260708-dts-stmpe-v1-0-1f51d15bb358@nxp.com>
In-Reply-To: <20260708-dts-stmpe-v1-0-1f51d15bb358@nxp.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linusw@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783540138; l=2069;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=FRXAWt+Iz+1/1X6ODGzVHGBczaOuuFjuplPOIrPDt3M=;
 b=kloPSwb7yGW3kkfT6EJWbyi+XODSvcwbu13chZZzFBXW8T4TEgS5I7ZGFBKaS+sLbrZdtqV5l
 B7Dj2B6vviCCzEOcCEeZngbWV/0pHNtDnTYpUjeNUVeJo2/e+vMlgw9
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P221CA0055.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d34d20-70ec-40fc-cd43-08dedd29f986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|1800799024|366016|921020|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	qurNeF0efMRZEKb3fQB6s2da3OvafC26L+zMaHxwBuNlRVyawmV2LM8e6+JmvslsG1ZCfyVh+IkRNAJTrkIgpsdh48jhZ0xWE5owjQS1Eex3Qbba16E2smtqHNEmWgoLdUTCwigjKVLHxFzVjRtoMxQfCTjDrIAON/1hjCqfRYQ8Qf1qLRDrgJ8I4e09E6mbwgNNZwMuaAfCQB/sa2tlDumIcDavReVWTNLdpJmgTHC50HngyuyxPz59XFOsBepyogYAfj7sl38W+2H01nSuQf6zHvtfQhO+mE313g2Rc+bYY6A1Ivg1+nTFSKLBiQRvk3lgOJPyxxgzKvKa2Q/5BX3JuSnIzCsar2GcbY8kn28ru2k+yPv5svJm+EtIg3og0CJaTzoXt65ePiFPrELK/0o6FxT3D2DH+VbQCy5Lhwi+yTCuIJGZM77bPb1LtSU8ir9T/axZY3m+84yzgBHKouFM0LiKY0ybIF7jxDH6fyhAnRa1pnRfGzb8nW0uzhqPj7XNQwg8AHA1cehbyA/STmSPrjqVOK4zjFM0a3GgF4Jp2FRBOSz5HptxuVEBKcEFfS3Shmwva3tXhys4JAQaSdxDtJxsNrwf0Z/s7Wvn2bfB++pX1wF65AsBM2mbOslnm22ei5mQXcVWuv89zN4tRmHNq15ZBDBm/dBxcI2UoZ5Dh6E7FJg0TN2RgfrDQYjXPC8p3Vns3oCZ4oAfsTP0Fw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(1800799024)(366016)(921020)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXNIa25MT3Z6eFZZWlNuV293VFVJMFpJLzNuUzYyeFd5UTJRZDhQNGowVEQ1?=
 =?utf-8?B?dW9Nak1GbDB6VGtQcmJZN0NYSDdwSXEydzFJWTRDNldvQ2JRV3h3UkNzc2tR?=
 =?utf-8?B?c29oaEYyaXBqUGRweGFVMzI1ZHpQZkNJWHF2MnhaZHNWUnFTVG0yU254K2Zh?=
 =?utf-8?B?eENPdDY5QXdiOWZZRU9pdDE1K0VOSDRKb1dkdVRHRm1pSHIzT1FWdVB5NHJU?=
 =?utf-8?B?a2srM2RBL1k3c2YxRWhaNTZJRzBldW9OQjk3U0FzdzBmWStSYlR2QWRKQk5H?=
 =?utf-8?B?bHZTQlhmRHhmWmg3Lzg1VTU0TjZQemVNRG5ydlZQM0NNZnV3cXE4Tld2THU1?=
 =?utf-8?B?SlozVGx2enJyUk1yYy80T096T05JdFJkaGR2OFpGS09wOE0xNU4xR0ZkMytI?=
 =?utf-8?B?RGdDU0FiV3l1Z2pFQ2NEeXVBT2JmemVKd3lVRFZMZllsOHlMOXo3YSs1UWp0?=
 =?utf-8?B?bm90dEFxdkFSc0tsRnIrSmN5ZHJXOXRLSjQyY1JSdGNGWGZWcUFocmFqZVhT?=
 =?utf-8?B?WGwzRkgxait3aGljM3VBU2E1MHZnUjRIRVladTBSOEdhYUw2eUxXK2d1UGR2?=
 =?utf-8?B?OEVSRmNvRVhyL1RVRVA4WHNDRDkyS08zUHRUUlJxRmFNclowSC80dVNIbENm?=
 =?utf-8?B?OG5MVTRxTFYwRmVvNjg3c2k3MlhDMk9EWkg3R0ZBcWtqYlZvejBSWEhYRWIx?=
 =?utf-8?B?aEhpM2dQcW5CL3FMWmFrbTA3UlR3Qy9POG5lZjBPWkhpQm5RYmNzT3IyV1k2?=
 =?utf-8?B?TXRIVElGdjh0TjB1REZWbEtscVFNaGJXRDRmMmNKRW15Rm81YkpjZWhVM1dX?=
 =?utf-8?B?V3RTT1ZlN0tSS2NzaEVydHlrSFNUSHJjSHdNa0QvRFlyYWJadSt4c1NyMGxo?=
 =?utf-8?B?cENlTzFiUERGTFBCbU5aZXd1UDc0QythaTRxYXNEakhuMnVOSGh1SmxTYmFT?=
 =?utf-8?B?M1hXejhJQXhBRjE4Z3V1S1lNb0tSR1Z1bVVBUzFjT20rd2I2R0ZFMVg3U1pN?=
 =?utf-8?B?QjNkcDJPbnFiSS9zTjdTaEIzNk0yQXVJY2xXeDMva0hOelEzeFd3TU8rbWZM?=
 =?utf-8?B?MUc3SDJ2a1FJSHg2aW1RWWFYd3R5ZytzRGNlSzFrN3RsRTl2MmlMeFU1QXdk?=
 =?utf-8?B?OS9QWHkzTUV4ZXRPMkMvd1FZSjVrSS9CUVUxdVhFWkdnMTRVQXhBM3g5aVh0?=
 =?utf-8?B?RDJ4TW5NOU9hb29HV0p0dUQrQVZTamxxdFVsSS82SDFUdVBEcy8zczVCQm8r?=
 =?utf-8?B?T0xIQkJ3MmRFM1pmT0VmcTI3U2tXbnN6QXdJS2tJeEoveXhuTGl5ZEc1empp?=
 =?utf-8?B?NVlHaFI3NEo3WUZiUmNmOXU0aTEwbHJ4TXVDNUxRWjZ6NmoxQTlQVHhDc0JK?=
 =?utf-8?B?b0pzOExnVGN5bm5LQzhUV1ZJWmxiWXhHckVZWm9FSGhiei8xT1E2YlhDS0pO?=
 =?utf-8?B?N2tkaXRnRjN3VnMvQ1lvUm00dW1QS2N3dnRKRmtzNndXaHpzWlM0M2tqd1Ju?=
 =?utf-8?B?SXJMUDZ5Y3c1d0FpNDJTT01IdXlCa3lVcWNHS3E4TlE4eFg0djhtTWd0RW5H?=
 =?utf-8?B?aXBDZEdORDdDVUFXNE9TcjR3b042eXBuVU5MVHczalB2T2lKTDVoREhzOXFE?=
 =?utf-8?B?bkZLUVVleVhLSzJTR1FLVFY0Z1lQRXg3dlFOQ3kwK05WRE1WUGREcDNhMCtC?=
 =?utf-8?B?Mmc2NkNpaEpiVEVmcnVlVE93VzFvTUczOVpYUUo4clBGQVBsUnh4Qkh3NXpY?=
 =?utf-8?B?MkF1bXFTZWM3akVHVDNGVVZNTy9WRGQwRnRidFc3YTQwbjlIZEVnVERqZXh3?=
 =?utf-8?B?UFUxRjd0eVBXVzZWZ1NxbndtQVU0bVdQUFB4dU1YK0FwS3kvTVZpTTllK2N5?=
 =?utf-8?B?N3FTa2NwWjB3ME9rbDFycFdpWGM1czAvNnFoMVVYV1VWeG9yZnB1UytwMFBQ?=
 =?utf-8?B?QXlYTFgzMlZqTkI1dHlNSTJHTkhFdVdaSVo4T0FWQkxrT3V1K21XYVB1RU1Y?=
 =?utf-8?B?VmdiVGhQdFJjUVp6d3pSYnR3UjladGRrMHhiL3R2UDd1ZTFvckp3amIyS0Zp?=
 =?utf-8?B?azNKMk5UcmdnNUpGQmdtVVpBSXY1TzFPdTdBRnZUNS9nSDQzVEhCMVJidEJl?=
 =?utf-8?B?S2UxSS83UVc0WFNBVXRTSGxCUVpja3NwbStCV3FiYTB5UnVIR2dnblVjb1Rn?=
 =?utf-8?B?MGVMb0psL1E1SkpKNFBTUUVPRGoyY3VJWHMrbUorMHM0Nnk0R093K1ZJQTR1?=
 =?utf-8?B?a3JkMTlVTHlKNVhSOHhseXRrYS9MKzkxRjd1SWhLUUZiazUreURNazliejZ5?=
 =?utf-8?B?QnJuSEVkL2VzTmVUU3dtaGdpM0xuVC8rbUF1L0Q1ZmdoQjNQN3k4aGI0SWJV?=
 =?utf-8?Q?HkTuU9JQPZstl8ZenaB52AP19plkrVf3ZSBia?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d34d20-70ec-40fc-cd43-08dedd29f986
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 19:49:08.5410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cs66BTT1MNWKk7Pe8O5hVL/648XGapPcF1nRFkVdypmKvBaXbj226bkaOUH1o2Ft+xP85EjPR08dZbI79PdL9RIbN4tq3YbAMfTGwOqFTgZWYsuF8J188g5rJeZhlr/A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

From: Frank Li <Frank.Li@nxp.com>

Add deprecated properties st,sample-time, st,sample-time, st,mod-12b and
st,ref-sel. The both driver drivers/mfd/stmpe.c and
drivers/input/touchscreen/stmpe-ts.c parse these information. Some dts
put these properties under mfd, but some put these under child node
sample_ts.

Allow these properties put under sample_ts and mark as deprecated to fix
below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: stmpe811@44 (st,stmpe811): touchscreen: Unevaluated properties are not allowed ('st,adc-freq', 'st,mod-12b', 'st,ref-sel', 'st,sample-time' were unexpected)
        from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/mfd/st,stmpe.yaml          | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
index 4bb05d544901c..56aa2570def83 100644
--- a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
@@ -141,6 +141,30 @@ properties:
       compatible:
         const: st,stmpe-ts
 
+      st,sample-time:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [ 0, 1, 2, 3, 4, 5, 6 ]
+        deprecated: true
+        description: See top layer st,sample-time.
+
+      st,mod-12b:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [ 0, 1 ]
+        deprecated: true
+        description: See top layer st,mod-12b
+
+      st,ref-sel:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [ 0, 1 ]
+        deprecated: true
+        description: See top layer st,ref-sel
+
+      st,adc-freq:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [ 0, 1, 2, 3 ]
+        deprecated: true
+        description: See top layer st,adc-freq
+
       st,ave-ctrl:
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [ 0, 1, 2, 3 ]

-- 
2.43.0

