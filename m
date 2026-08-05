Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011046.outbound.protection.outlook.com [52.101.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA413E5A18
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 07:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916461; cv=fail; b=GjiLZckyov12PyTRI9Z80EshdouyGl/PXowYRLyeBZ9pzxyEnxXWaYgu9rocQR09yLPbxF+lvS1poePLc9R8dU0doIlAxGxBWLomwl2su/TGB6UJxMQvqhgS8DgaEcJumK+0Dnsyv5syqmrI7ksqlZT4XwyrzGdM45y0ugqPfiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916461; c=relaxed/simple;
	bh=WweNHDHiElH8o82jk8npSceeFRcm3zMBKegXgf5E3CE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GNjHTdbJiWIFPRwHrrkQAvdFNV0hkGYM6hpbazaphGqIjixZAqWtsYMAYDpzVRjoU5LddqwtE5Du+ip2fmdrPxHCrKVCueGUO2wCUaPZyf3ZME+OU2GNPI/VM0BxOMarRYAAotHJfa03gCIy/RjhNb2UyyjrjM/jdsrBF8KrRrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JSU5fXqN; arc=fail smtp.client-ip=52.101.65.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JSU5fXqN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elQPYpE/7WwF4gXJj8g/LacuGDJcQsv0bHbIIXc4wxjetLOaQpZk6aQrARrEVrzuZHBSRMpnoqbO4/ugq2WSf2LnQ/EypZZ+4BadbY8FVlIxCSznNpfaiaBAFQZwvSD2QL8NuCRbdqMmmBvrR5sNPSvc+NdkX2uS4yxyBqBthnMZZhCMLJLL0G26S6XoRsXW7Bl1o0LPGuZaLDGqvh0KVXHnMkCv5tNO4VRNg/qv4ZQ/3qogJ4NqQb1JMLRJ1xwQCO58fd7kd0GS37P+mapQrvEjr27t6pRMpzqJXGmBonbrslybCxl2Ueon/0mrO6B72LXrGsi2ic7Gc9iSHbHG+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=v+NY+kUDDoWHXyiq7aA9eevpeH8hiQ1JEE/Db526UdlLoXgox5UGLkWBdqhv+ondOYJDvowq8Znpk3uVZpNAOfImltOHPUCiFNCZnPXt4vmdZwcbUuG3pRdLjXRLfXNv5TXgQLmf9fyXqnE7Lnh9P3R2KXBjaw73B5H1qzO3x3jcN+fJPO89SMFu6f5wPtY/HL/ditdanBgHBN6Gptw95T9yxRDYqKspG6F0YOQTvFcb85DRW2OQXyF/53ZK7Zqp1FvldIRVgFZB224QEVZWlGefLnZrzgDxTiHjhcePCDubA79t7m0oFHOa7jn/ci73hZ4ND3Z/ocKwJXLXx+tfyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=JSU5fXqNQTW5WiFSpakamscpcDbzCOVl1HOlUUKCoi8+n/DKE3l1vReYqq62l7h3DDmm7sg0GQUGY9RJZwwryBJ/mZnz3k/3EgzL6k3LKcfxAAyEa+HyO8H3IbqTuxotwFi07qR7LzhM7MnsQ8I48khStevs92D2S6l4wjfW3fpZ+XQ0xYCelx8/ggv01Tz/dhI3zcYM0siHHEwvcoHFYVUkO8UTbuMO6a8hcuF8NjiXJtFFL6W35/JcGKtg3Jk6oj53F1XUjm2g4k3yROtgNic1AU0em9JOBR65Vj8J/VLrpcP1WNFatv0EJEY4xtDY4PhL5TPX5zDRlpO5JiJn7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com (2603:10a6:20b:348::19)
 by VI0PR04MB10687.eurprd04.prod.outlook.com (2603:10a6:800:25e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 07:54:13 +0000
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::36fa:43c3:5ac6:9545]) by AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::36fa:43c3:5ac6:9545%6]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 07:54:13 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 05 Aug 2026 14:14:48 +0530
Subject: [PATCH v33 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-imx-se-if-v33-2-212e32ff0295@nxp.com>
References: <20260805-imx-se-if-v33-0-212e32ff0295@nxp.com>
In-Reply-To: <20260805-imx-se-if-v33-0-212e32ff0295@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785919487; l=3245;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=ALR8XCHNZDChHHHCzpkA1nukL9Ps8kvNPA16LBr2P9ZJKStXnHn2is2aBraL7Jqf/CnGvtIGc
 mL7z9MJyH/IDpfk4SnIXRd5jaJBlI79BlAi9HnGj9rtWbUxAtNGAxC7
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::15) To AS8PR04MB8465.eurprd04.prod.outlook.com
 (2603:10a6:20b:348::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8465:EE_|VI0PR04MB10687:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fcf35b0-e335-49ff-0b02-08def2c6bda7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|19092799006|921020|6133799003|22082099003|18002099003|3023799007|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	kEjPRahYOHA+Aa1WzG4V8Yo3I0MWFUikp+sW3ETRBD7e86T9jh4daSJB+IFS1qAV8C3oag0v9reMC9bmkhU0d4jsaNHgE+ARILeJ5LUvbnuG4kvJB207PzwKk5g9v8VFGN0HGQ4KNkVgsx43V2eEGNCVWWvla38pj+mGBPzFDN0ppJx1XMlpcdRwr3Hb4QEUoFEAUqrGlyikCPAACYCWq5WnjYEXRGxnGhNkw2OWKwB+eYYIoOqisU4xf2Bpi/ZdFgQNN6esh54E+vuAHCyeph/OgW7PP1Y0C1jpFNfXTMrHqzm4EySS1ubnvW3WgxKn+HUyvl+WRZ+XCucrlFEC3myEOlzZDnDjvKN41u5iDRzx9RaJ2/8wLCr6hcy899w/glSHQdigfZ5x18TJkgM+PW8ggmPoniQNfY7kJidzVYQIiB/PqeK0nk+RR9CWVdjWPau07MguOIwLmehuUnOxiKOWv5R32sQfwKd/oBdbeNOddcbuerF0ptdMYWksN6P50UcrtWBZyl0RyxJcjPdf/OdmCGVEgbaL9r7+ONJlvrQvOviqXSFU1fYHeShb56fMf2+/hIZdWn1PGKKXCuEcWV6oGLbNDkXkiekx67L7/x6MDj4cNmB1u+S0UEkR8JRr8CPN7louJ4YFZv9Eqru28mmjrtWXsBK0m+/OvbhL3Vo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8465.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(19092799006)(921020)(6133799003)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UC9VcGl1SVVRekRzd1FhTzhLdFBaWUZUTXkreG1UMEZKa0g3djBzS0dGdHN4?=
 =?utf-8?B?cmdZdG92ODM1c00yTzduQk1ScnJWUERJT0lKRGc0MFlzeW55dkhaRkRPWFB1?=
 =?utf-8?B?bUdrOHZVS0I2UWRCVlh1Nkh4SE1HUkN1L2ZjWHJMQ09wMXJSN0Y5ZnVwOEhU?=
 =?utf-8?B?OGFwMHVMb28zdGU4K2E1TnZpd01DeittZDA1TUpQZ1MvTW5CL3hOc05RWkVJ?=
 =?utf-8?B?Qk5hOGs5RW8xYThzNk5uUS9UUVlTd3dyUVRWdFBTbnRaTURYZ01xRTh2TXJO?=
 =?utf-8?B?R0VkbVJZV2ZFb2pPc2dlTC9TOEM4Z1NhYmtCYXA4M2lIWjJNcDBxN0lyWVJK?=
 =?utf-8?B?ODhWaC9XZG5lMkh4NGhRcHRsRWlBUVpHQUZWK1JaamdxNXNjS3FMUUROMkFU?=
 =?utf-8?B?Nk5uN2xLc0hndGt5anFUMWc2aFNUZllZRlRJQ00zOFp4R3Y2cEZzNWhYeWsr?=
 =?utf-8?B?ZGhQVW9ZSnY2b1hxRkF0YUJEanJLbVRyaHlzT0cvbklLdmhMYWZKUzByd3dF?=
 =?utf-8?B?U2lIYVQ1Ym5PdHRJaXkveDFLR2gyQ3ZsblZPbk9pb3VVTWlkQXhnYTNHbkI1?=
 =?utf-8?B?ZUhmL3M0eVJMWmFOQ25QYTQ1WkNkVHlvUm5KK3BlK2pxWk9LL1RZRUlGcU1j?=
 =?utf-8?B?eXJSb3NrZlNqRnVTWS9nc29xOHZkTkJSL2IxYXhsbEtxYzBiaElVb0lVU3FB?=
 =?utf-8?B?eWFHL1dCREt0VWVNZmlKSklhSHZHZysrci92NDdPUlEvZG83aGlqSmNQZmI3?=
 =?utf-8?B?cHNCMGRtdVRmdnZWQ1pIbDhiWDBDZzVhcDJuSG5neFhXVFVwSGpEVVFyQmZL?=
 =?utf-8?B?Vm9xR3BPOWhhNHRjUk93NDhyN1owS1p2T2ZsSmR4RUhqTTlld0RxME9BWFpI?=
 =?utf-8?B?MDhKcENPd2JmaGpvM1U3QUt0aTBiMUNFOVZNQ0MreHVtdlNoK2xQVHpzV0Jt?=
 =?utf-8?B?bWRibEJZaGVTUUNqbHFIdFZsd2toZTkyeXFkM0lxVzRZdXR5elhoSkNncGRq?=
 =?utf-8?B?OE9Xc2VyWU5GdHFvd29tem5wMTdOWUppb2J0cTg1bmY2ZWlYcUt1NkpVdFhN?=
 =?utf-8?B?Y043MjhrRnVZaDBCQ1psSHl5TURXeU1BWmxmY1d2Nm1iUzU2UFVsS2FUVHJp?=
 =?utf-8?B?aXJ5YWdHY3Y4RW5SNTIxYzY2S21qM2JrMCtMZk9PU1UyVllua09rb2RYY0tX?=
 =?utf-8?B?MkQ5YkxOeWNMMFdVQkV4Zy8vNWU1aitRL2pkWW5kK3VRQ1JGZEtIUnoyNmNL?=
 =?utf-8?B?V1dOdU9zUkpJakJteit6bGIwZmNtL0VCNEI5QW1NZER5UjZMYkVDZ3Y5Ty9R?=
 =?utf-8?B?ckNTME5YTEZqVENGUzBlcDJaWFFMK0MxYXFPZFdCVFlLd1lpOUVjRHJOemIv?=
 =?utf-8?B?bmxGaTRRU2l0UVZUU2ZtMmpXMG1lL3lvZ1hLS0x1a2p6ZG1vVHlMMlF4ZFQ1?=
 =?utf-8?B?cVJmbUdUbU5DL2RZOGpBY0dBVTA4QmNuMEIvOFAvTnllVWVnUFJDNVlkSFZx?=
 =?utf-8?B?WCtRdldUbkl0aGJOREkzVGRjZ3YyeENSYUdMSy9zWFB1VDJINGhUUDdQWGFr?=
 =?utf-8?B?ZEZucFNQNldaV2hpRWdCNG0wbHpaMHlUOWNuTmNlcEtUUUJkeHBOYngya1R3?=
 =?utf-8?B?TlZjNk1yY29BZjFnOUlBdDl1bXVXc1dGdXZPdDdzQ1JWdEpOQ3VzSUlvcUV1?=
 =?utf-8?B?NUNFOUZ4ZTNORVh0K2dBQXhkdjV6N0ZWQnRQb3pkWEdqU2JsbW5rMHREekRP?=
 =?utf-8?B?WkhudG9mbGJFa2pWRUR1bXF2K2o4akhwWk1ieHhFMjVHSkdJT3FQSzAwRmM2?=
 =?utf-8?B?eVNuMHlOMWtVN1RGUGtBRmhUNHY1dkszOTd4NTF6QmhxNk1wMTBuOEF6UnEv?=
 =?utf-8?B?cUJqY05pR1BEVVpTNGlER2x6L3lsMHlWeWk3QmlBTXljQnFIeG4xcEJweTFX?=
 =?utf-8?B?ZHpROGxMZG04RE1lNFREWFIyQVpJaDVmUTIwQ3FaWTd0cFF2VHJuektFaUhM?=
 =?utf-8?B?NTB4aWRIdm9HYjlGdXJRR1F5dTFVNUVIL0dQemN4b092UHRoSmppQmh4bWdM?=
 =?utf-8?B?NmliNGpLSW5mcEo1UEl2YnZLNHNHNnNHd05sb0U0ZVcxdjJ1bW16ZCtuYkdV?=
 =?utf-8?B?bGhwN0FPSEJUZ1Erd3NoUUhlLzFTNjQrTlNRL0hPakNEQ1hFSEdEbnh6OHpn?=
 =?utf-8?B?M2RDeVFzVm1wcTV4U3RHSHo2K21NSit5K3RKVENLNjJmMVUzdVAwSjdwcXVC?=
 =?utf-8?B?d0tqbWVVbytINEdRRDF0Q1RFcm5RRVNiZ3R5YWFkLzdvYmM2TVVHNlBMZ0Rs?=
 =?utf-8?B?dUx4cEVvM2daUWpnWUxuNlMxTFZOcHU0VndGd2tJZzlESVY0WFVRM2hFODVi?=
 =?utf-8?Q?rr69oAFIEBqGdeZ+khqlOfMjn4d7ZXH22MVnB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fcf35b0-e335-49ff-0b02-08def2c6bda7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8465.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 07:54:13.3897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8iR3lgusV1XpjKiBEO4oe1Y6NhLRwBnue/QsESRzuY7PafRzIEzZKktod2wo7pC0zldDdjAf3ndYwqnFZXJCy7XjT4DcB9RgQ3cjhfvUXAZmzmaRihAK/X1G0s+e8kGw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10687

From: Pankaj Gupta <pankaj.gupta@nxp.com>

The NXP security hardware IP(s) like: i.MX EdgeLock Enclave, V2X etc.,
creates an embedded secure enclave within the SoC boundary to enable
features like:
- HSM
- SHE
- V2X

Secure-Enclave(s) communication interface are typically via message
unit, i.e., based on mailbox linux kernel driver. This driver enables
communication ensuring well defined message sequence protocol between
Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications, to be able to communicate over single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
new file mode 100644
index 000000000000..fa81adbf9b80
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/fsl,imx-se.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX HW Secure Enclave(s) EdgeLock Enclave
+
+maintainers:
+  - Pankaj Gupta <pankaj.gupta@nxp.com>
+
+description: |
+  NXP's SoC may contain one or multiple embedded secure-enclave HW
+  IP(s) like i.MX EdgeLock Enclave, V2X etc. These NXP's HW IP(s)
+  enables features like
+    - Hardware Security Module (HSM),
+    - Security Hardware Extension (SHE), and
+    - Vehicular to Anything (V2X)
+
+  Communication interface to the secure-enclaves(se) is based on the
+  messaging unit(s).
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8ulp-se-ele-hsm
+      - fsl,imx93-se-ele-hsm
+      - fsl,imx95-se-ele-hsm
+
+  mboxes:
+    items:
+      - description: mailbox phandle to send message to se firmware
+      - description: mailbox phandle to receive message from se firmware
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+
+allOf:
+  # memory-region
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+              - fsl,imx93-se-ele-hsm
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
+
+  # sram
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+    then:
+      required:
+        - sram
+
+    else:
+      properties:
+        sram: false
+
+additionalProperties: false
+
+examples:
+  - |
+    secure-enclave {
+      compatible = "fsl,imx95-se-ele-hsm";
+      mboxes = <&ele_mu0 0 0>, <&ele_mu0 1 0>;
+      mbox-names = "tx", "rx";
+    };
+...

-- 
2.43.0

