Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795772987;
	b=XLqjQO4lPSr3P2qiS/N9ENVLanF8T4CwspUHTauhXxBlZojIsfFewWesWKNEbtOQDAy3
	 Tba9000qa0jNvuEgVAbmv1DMRq7Q0zomJDQA74OH1cHBSmnmVl+OhuGtbhDMIwdN7cIuN
	 PpBsQK3RJXmdXPCSyOVeve4v+rv3rJ+mt7Xz1oyKT8Tw49aQlX5wuggpNVg/htLQXS0DX
	 Ak9HV3Fhot7dPmJbnTgksOG+EY8SUyjIQRLWqlcVdI2lIhBEXUkWm2obdmcHafXnM3Gl6
	 4Ida2WNv2UdQVwm37jUTnUOYap0WRCeDr+1VVd7tMTgRqbw48oQ2+TLN7mTKyCKZfMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772987;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=dNt33f0lPXUGVjd4RjIPp3s7kYQaYGmYbx5TxdAcS3Q=;
	b=l6HTk+H7hD3i9Cz8w6DOlLflwJLdrxjSTicppDrO9oqRleA30SKuxlqTYfkxXCKWYNEl
	 M26uGEImCmPL4WZfm5KdfjG6utxvpv9335r6vdTBsqes799IgfizIC00gdDTifcTIf0FB
	 +faD7ojc0tUGUnnKmTrzyl9R0E43wuxoX4gAWBW3Ahp88GZtyrGw8xL4DF2FjQTdsS34T
	 faKW6lNtMWrfkcaaL9HzwfDhxLvyKBmT2e1EMNVavMr7IQdnOYOhHX/Qv4P2ZGcUJ31KF
	 h27ITxx7zckBxehlyL8Ka6xrfBlkblpfFC3Tlv0M6aygn+TnOuaRIkbrdsoQS9C4HPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=oOWvijBb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.29
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013029.outbound.protection.outlook.com [40.107.159.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F19606A327
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 09:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52F19606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=oOWvijBb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXJEUG+GxdGY+MZ36m6k0i2Ezh6dJyoFJc5hxqVxyfaOqZZT9v9hn5Q1DxnNctPsGzKQP2DGVz+oUL4mA55F+sj5QKnw+6fPUed1rqYZyMOAZavIokhayfAMXc+YBb3Ai9KsE63yajda9jU0ASmypNQYdddIdk6bvF5clYouhP+kHfKq89mB4ZlfsLZDwNPD2AujMbCLc3toectmGsZDrM+yqB2+DdnNxUtQ9EiRMzca5gPZFPxVVy6Qhq/Hr25L6sqFKnENyx4O/lwtq8DzGIyXBXTLyN6eQhawLVpSLxyvBMFuY+CF9jJD4dnI7+tpl3T5UgcT9MISzuiRksXaZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNt33f0lPXUGVjd4RjIPp3s7kYQaYGmYbx5TxdAcS3Q=;
 b=gZEMLkt6C7LfkYJDJiWqJhddXfOGA9rgpF134aJTVOSsqZPjhiP76An82Csy3vSlmvNL26hyDVcpyaA22yZfY0tNGBS70UN1fiYWhd8/suadkHLXfe4JzRTs2sUQnaLGapGV1eo9OC2BcscipKEG3yBXpGev2ZUk7DRO6QgZXSi/YmhcarOMSCBJ+M/HS76MLEH0ufB4QgR9yXO0lx60Zs6ukuZXMGICTG+hcz01GyHLvtbCry+KI335LIHACRDtBLeI4ajCd882xoJNGNRXwTXrZwEdmP7gCikLM6wE73M8i11AMcqlNHDh3fB03pxKOG1eJetADPFGo8U4dHuP6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNt33f0lPXUGVjd4RjIPp3s7kYQaYGmYbx5TxdAcS3Q=;
 b=oOWvijBb4KzQ8YF15lfbQYHMum+KvBGtQrDnb2SXpWVquGLSU6VIVzJTDU6XdKsU0OS2KoUNXXXA7Kw7MvKgoVsARo4oYbUBkywoKuukFP7jJcHc8RWYXbnYxlEKvV5j1+vu935Npi6jnspG3aVWivsfo1DoH0QWyfQvXkXcjzIM4nZH9o3XAZbBfDjjwD/GgJdmouJyCodKKlwmyTo+wUzHEEei+Z2yIJFd+MTPSrmJFAEiVH9D99wJio1PZeztV33WlzmZGnI05yMsTnekUKxF+juoJq5wFH6gQW3rrDqL6dpYpqwLKp4JsRyEWVXf/PlptIDFSJmHB72SX2GmWw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from BR2PPF9D47B45B4.eurprd04.prod.outlook.com (2603:10a6:2d0::cd)
 by MI3PR04MB088318.eurprd04.prod.outlook.com (2603:10a6:290:99::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 09:49:44 +0000
Received: from BR2PPF9D47B45B4.eurprd04.prod.outlook.com
 ([fe80::6e42:6ee4:6b13:69cd]) by BR2PPF9D47B45B4.eurprd04.prod.outlook.com
 ([fe80::6e42:6ee4:6b13:69cd%7]) with mapi id 15.21.0639.012; Fri, 27 Nov 2026
 09:49:44 +0000
From: xiaoning.wang@oss.nxp.com
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	daniel.baluta@oss.nxp.com,
	frieder.schrempf@kontron.de
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Clark Wang <xiaoning.wang@nxp.com>
Subject: [PATCH net-next V2 1/7] dt-bindings: net: netc-blk-ctrl: add compatible string for i.MX952 platforms
Date: Fri, 27 Nov 2026 17:47:23 +0800
Message-ID: <20261127094729.1061755-2-xiaoning.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127094729.1061755-1-xiaoning.wang@oss.nxp.com>
References: <20261127094729.1061755-1-xiaoning.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To BR2PPF9D47B45B4.eurprd04.prod.outlook.com
 (2603:10a6:2d0::cd)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BR2PPF9D47B45B4:EE_|MI3PR04MB088318:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e8a50f5-1120-447d-3033-08df4c6bc409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|376014|7416014|56012099006|10067099003|261026121527099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	ZcY3KHZL0kAr2gTOwP1HcF0NWyHnwqTDkhl5lmsiOYXaDzAFAaWIZa19u7rG6nkyvFPTFpgeyphyzXtgtRqIB0iRPnrRx8btWPGlpc3XnJu7KKlKDvpF6degfD2NOUi6pTNqsSjnfdyksvNOJ9dJduyU084tq9MhSNZqq7zfvDW9B+G44YStPeMnATgX/kN0T15NlJbX84LeTlaIppgsicMD+Jt5qJ0fqAiG3Vb3kHqUjAg31N7mCzHCAn5orhrnPucsxaqeSKZhIp5p0yurPlpKEuabhqBfToLF715wmW6Xa3lFtephMgHMGf9r8NQMwi/W8QojOGm7lgqemmlTtVIB+0aVtKrshS4cZyt2r3PWpDd3zFakpOF6l9HA/oOKLjWBsJgYl/gHJlgnNJPsXs8mK0BJzongqSgfd+I9geNOe81CPWXdPN1qK8grNkgj3OnzW9ApBk8W7sbMVN2FwA8jytfs5RulQqKFH+rszWdRmbPlOFcv2HM1DZEkJAVNx7a0h+vcW8TxA95bsGasG9jgjB4WiWR0fbngq78ekBy7poSyyl+fa7NFDRTW9fZg3HPtZ9efe39z3tmoBt2RKglsl36wIDbuw/CVCHFjLF1jOyXOg0X8EGNXBEwf53mFiswoHY2zjRd4KHLPDiR/VOqz2C/8CqYPU/ZlDC7L6SA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BR2PPF9D47B45B4.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(376014)(7416014)(56012099006)(10067099003)(261026121527099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z8qBjiiX9lFB8b10s74biknYH1mRoeK6PlL5QTtjGnOFoQjHrAAY8tz81bDM?=
 =?us-ascii?Q?ND0p8T08b56GsPWLBzSYgyGW1p1gUK87ea0XOZPqgwZKsryEs8SDfJtX+Wze?=
 =?us-ascii?Q?g2l6yF+7OHyf5uNmcr52EEQ0f85nQ/CsxWe1qDArXZN/gVc8KHleYdVjMUq+?=
 =?us-ascii?Q?nzt3f1KGofbdziEoz9uvwqXgoKReQnphCYx8mMOnKgjllbjcsJlOoGjt04R2?=
 =?us-ascii?Q?ibcbDYS9b3f4TiZCE8wimquqxjz0/FyQmWhHzFTCH6NPEKJaJs31dyp1/pAN?=
 =?us-ascii?Q?Bjz9IUp1aswJZL6m6+nhMaNhrK99VbL83LShh5YJ3C/zSFiq4R6xIMZJK/5B?=
 =?us-ascii?Q?VOAiwQ4VZjByUftCHGZ1Qn78qt6+xjFtJztZlwP2bwqZO/8ejrTVA2XEJBTG?=
 =?us-ascii?Q?zhOXPas1cKyv4OYvKIV8JSf+iDdz9IMfjuzEV2GXrS3ZQT7rwxtkVZAc9sXI?=
 =?us-ascii?Q?ookUZvk1qxf0tkimE7/q7Woi26WxK2iykd3OMeiloUIkMGxzwSZ0NSr6XJFR?=
 =?us-ascii?Q?kZUFDNu4GY4eEi4mvRxMh7BgF0VCaG9pqysIkvL3YmjE8hd5KA83vJ+rYbRK?=
 =?us-ascii?Q?YB/pR8KW11dfBnx+V3sDEIuP9pad75a4sUMGZFTOBRsoahCq6WEgWabGdR/i?=
 =?us-ascii?Q?+JIYcFx0ovCXItkR1tpZ2u3l9w46+WfTOMBRV8MuSCrlvtqP3JZPEAyAve05?=
 =?us-ascii?Q?qPxiWyJigVIKD4ceoy7z2sx54efW/FkvKRThGIXeJiBqbthsMiH2nSGRVRkH?=
 =?us-ascii?Q?DSCFtGclRusf0FxqaTTu2NLSt3qvrBlAuoSemAdq82pgHCk1Qy04rt+4bESM?=
 =?us-ascii?Q?5fhJJBxvwAMmcPws9yyZQu1GKVERRvIcf4tpthwvXeVl4Mz4pIYSnqnJSHCR?=
 =?us-ascii?Q?E2bBXkRLY1SX8HKJCUuZaZhuWhMV8gUdMUoAkZ9R/30LPcRJHmUj9oEUdfgP?=
 =?us-ascii?Q?NxQ0J7rq2++5IpnLYcflHmDjSEto93xf9yZAn5I1DsHs4pVcewFUqtlQcEQe?=
 =?us-ascii?Q?MTXV1HAdoVDq3jeGhAgAC5LiAzrT5SeHaH/CBOLH+F0f2Xa8X/vQ1fN+MJXb?=
 =?us-ascii?Q?PmkLXCLD95Q4yKj8Q0AjH8Gfdev6TDhzU76S4iBoxa1mWectAnftIemIKPON?=
 =?us-ascii?Q?NYueGI5O46JZ74uxvzFOiColKGt4FAtqTHnFDVF8MGtlqy+ajq2g/+UZXkfQ?=
 =?us-ascii?Q?DiImosXuOPJZlL9zvHwq3BmRY1ziNrJcALPIgAjSFHgYJ9wAzM2okM1QtQi5?=
 =?us-ascii?Q?DZsagILs/0nW7xooD8xsTTBASjHxrxs91S7tPrM0JUPhmMt5U0IyegFN7Veg?=
 =?us-ascii?Q?3/uZPTWDJoAn5XLoDmfFQcj5virfJyhwGoOf+VIs/5jKUjMmOiCE0BMN1Mog?=
 =?us-ascii?Q?LRBiQpv2B+/Xd6OjTVMy0zs62IagVG4tYTrpNSZrV56LK10WBP4SJ56e6VtX?=
 =?us-ascii?Q?v7C5MXtxfB7535ySBD4sKck+8eg5eLJ/ksxGKcrooz5k7jeN7T7ZzqLMy8Mz?=
 =?us-ascii?Q?REdCSK86QPTMBOwxJgCPol6wMzTc5/qzwz2pd6EHhcO7Am2QtFn5RWgOWRQs?=
 =?us-ascii?Q?5wvl93xOa4viYKTiOjXqJTI4BlbfFxt/TlwpRRd7W+mtMXyaDKpn+9GhL5qg?=
 =?us-ascii?Q?N8tLLVuAUvlxpw/fPbqW9JgbGeUYFqr7hM5pzvZm61iQK9MuyhvgUg0q2NXi?=
 =?us-ascii?Q?EFVsnxgU0IL3YfvK2LSlivHygoaF47Y8FB3gADxgQRga21WhOiGxotJGC0Oh?=
 =?us-ascii?Q?vP4+3121pFVfvsLHj/f0v8Ai9Eo+Wd5cAOEY/XyrjAS1BNJkT4qimfOfhIbN?=
X-MS-Exchange-AntiSpam-MessageData-1: pXTDHmzqU6kSJQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8a50f5-1120-447d-3033-08df4c6bc409
X-MS-Exchange-CrossTenant-AuthSource: BR2PPF9D47B45B4.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 09:49:44.4866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+rGN7dCuBM77zc2TvCrVHWxgtw4nsRD7mqTwCxAaVyUwOiJNcXGsCK2m/933jo/XIVTlpsJq8osLpMUetVNzdIDpcfUiDRJYko7OhF9e1ztY+q9UyD19rjOBjiWFLEc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR04MB088318

From: Clark Wang <xiaoning.wang@nxp.com>

Add the compatible string "nxp,imx952-netc-blk-ctrl" for i.MX952
platforms.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
 Documentation/devicetree/bindings/net/nxp,netc-blk-ctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/nxp,netc-blk-ctrl.yaml b/Documentation/devicetree/bindings/net/nxp,netc-blk-ctrl.yaml
index deea4fd73d76..c443fe0b4693 100644
--- a/Documentation/devicetree/bindings/net/nxp,netc-blk-ctrl.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,netc-blk-ctrl.yaml
@@ -23,6 +23,7 @@ properties:
     enum:
       - nxp,imx94-netc-blk-ctrl
       - nxp,imx95-netc-blk-ctrl
+      - nxp,imx952-netc-blk-ctrl
 
   reg:
     maxItems: 3
-- 
2.43.0

