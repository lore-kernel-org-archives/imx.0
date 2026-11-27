Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795776527;
	b=YeCRttMSxK0mUw343OECbwh3HvSde6u5NPemdwwR7050fMIcwDfupz4UjEFI9NNtrO9r
	 DGHVnRsrbyzeT2IlkqQdxGM641xTrvddR+d5Z/hoCkns+8KyawxoxkuH97Aui4OYIwStR
	 NiaH9n7EzQUwa5SLh53VMRdWeaUdd4KLDugzwn2rvd4djNBUufo55LTCOjb8+37s/mmym
	 ivc2mihGFQspyiKQz3eRRNeNLrl1EoDk178WsziInCQU9aMjtUNZxBteg5F9xNaxSauWd
	 J42W9Qk72mLXNBOzqCuf4ss0MXdbUYa/e5i8Owl6DCoNFPgCrJ4KN75JrM4+vf8NZ6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776527;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Ke2l/NITUtdsH5sLdztU0LH39XMho81LihL4fiv644A=;
	b=McHhSXSztz6NYf4Xvm5sK36cAi54nXb9vv4jR/1iTnVNnxdTQgzMB0iNmV/DatmAU65Q
	 MczgR2PgV3z6OW5AsuP/CAZiCmoa9cJmYFUpspGiZepevlSLsKe0gsvkTXsEwKZd7wrnA
	 WAhcwqtUVVArrUlX/VXxpAyJn3Xq8QatdJ1j9RbxGml09ZvNqT17jjR4CCIsbG5qkvSNh
	 Z951+aWCV0Hcl1Ag/t5Xf15ql2TSQaNg7x51WKDz9fy61ANETRMvy3Hg3ZJki91cVouai
	 MgO48+eBJZ5CQDEE1cUUENyfv3l9FnSXwTMYJS1VfYbX67Q7w5YlIDRD35ZZy32uQzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=MQWjNrUD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.27
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011027.outbound.protection.outlook.com [52.101.70.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51547606A31E
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 10:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51547606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=MQWjNrUD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPoe7B4kpWkCcRl5s1WB7Sos+SEu8aHFmZDOcJm6wIfYuxImvNAmVxLK8fCtBZoaNipYKiGtrrbMT8XCwMMUQJLaGyTr9gxGVcz62411JiE1lM2nkzrZQd3Vm6t0vlDZiDFDpzTou1VMb3/m1y8VlwgaDOy+m6oL+fQNRmblsIr0jkz3LbFuSonrJ92oZBoh4siDzAxputvTI6mb6dvZGXbv4fGo3MoVk/Mgr5qCPYhK23cBr8DKxR7oZjTVH47HEJASr4n3B3Dakf4kzimCnTTl6NdGPpZdLF6qMmI+pw7Llck3oZb2FPC+cYfdwuuQixQxllkVZxmXaUYS7re4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ke2l/NITUtdsH5sLdztU0LH39XMho81LihL4fiv644A=;
 b=BH86yqKnIym5ZJQaA+6liHo4E+tAU9ecw+tkgdyXcdFhMXEDyLGrAhH3gchX5FxWlkdysZOOdhfaLHqvSrPnORehjqvNyv7BnCx/XohPFDgtJ6Vk0hngFmcJ+hPZOAb6fdWlsXX0hsOA+uZhfWYC1/4kYu7qFUsm0cY6hfHiOKMx+BoQ54e+75TIZ+UEgMbWrSD+SQm5ObrRlsiUGrFRDss2+TUW41SHSre7t19rNuswateiQ95QfXEmpuQN8eOSYs8EGB1CB4lzU65RioWtP9PuS1tevYmchL61yLiKO2OkbHPO50lOmlbzReoqUIc+1cGtnUU2IFFfEH9sUlUGxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ke2l/NITUtdsH5sLdztU0LH39XMho81LihL4fiv644A=;
 b=MQWjNrUDl4gK7bTHhuFou76bKxKVzfqECU5tj5XxPfLPR6fjkaqNEPR60sovPlM1+EMSwxZPo6df52sYL/E6fvIcBuQ+wWtQ5hnlopDV76XOzRa1jrHmMAlkKnykQ/6QxFCOCra0rEyYg3w2xNUBnUA4xeDEPk2zLRSlmqhFQAXufG6b+qsXD79shLJlZCdOX+keJQEoOefzwMbHIZ9p2oCMR4pVdLcOWQWn9S3HIG0MNLOIud0tZnF5PPTfdgO/gkJMuUFBXw/tOWo+0kx9xZ6+cfPxfUBFMvoAUA8aZeo4MfKJmWLTL+AqFZ1zZor1cm7dwZzr0vlfZ+Qeej1NCg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17) by GVXPR04MB10270.eurprd04.prod.outlook.com
 (2603:10a6:150:1c0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 10:48:43 +0000
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8]) by MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 10:48:43 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev
Cc: kernel@pengutronix.dd,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/5] arm64: dts: ls1088ardb, ls208xa-qds: wire up SerDes lanes and SFP+ cages
Date: Fri, 27 Nov 2026 12:48:15 +0200
Message-Id: <20261127104820.1990733-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::18) To MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17)
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
X-MS-TrafficTypeDiagnostic: MI9PR04MB019273:EE_|GVXPR04MB10270:EE_
X-MS-Office365-Filtering-Correlation-Id: 91add1a1-b416-4534-8d9e-08df4c740158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|1800799024|11063799006|261009223027099003|18002099003|3023799007|10067099003|56012099006|261102123227099003|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	+sVJD8iXqWTi7iOnQfe0n2za6FClHZudRFjptXPhw8iOEsAcIhVp/uJjenHC6P/Hx0B68ScrWTlWLTJTOP6LJUNXAdPN5utZzOmFjFinuVKJ9DxyX1lAZ30yTmd+zJBRXi4Mt8yMjwlcBigIWRn6C0FwvxG7/vaPej522XYpRQoMpgTzv0WnnNE+dQxUIc0g+88LYnqFUkySueEfYdbE2SHrLiJTL7ELmA0/rxgNwATyC4L1ArrmTZD+rKEJkTpMT2O32jlUMY7Hr4h4SnXzyF9IUsn+fhZeYrQUUqniyD9h110VhajizI1LVMkWNyY+6uE2alODO0GJivxczQxxtN6vlzfVV162D8BlQfjNt0G5cx+b5BVLeRDK8ooCBm4MLZLuOtrQuiP4AejN4soye8PEmApdRdeUpMwoD4ce3OSUhf2m8Eog6YN3hFWP4beMPX+NtNviFN0K85HVvFxK57UrutbJK3TUWfVW0/v2YEQaA+J7y5AtUnsZgkDiQ4xf3Yf9+dq4TNpgCIJpBKFVyI7vIIIK3c6QxfsZOJpOR8eWv8W0MrwVgIzYbJGmfExPnFFGtwhSO6k8+GdYIw0Z3qksM7k/HpJENo3RDqKA1vfXNd6AfgjwH3H7bKPAmxZt1TI6p764vntZwug7Z+/vlDd/R5zbq8BH/2lYD3wfPMc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB019273.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(1800799024)(11063799006)(261009223027099003)(18002099003)(3023799007)(10067099003)(56012099006)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P45/YRnLzmBds4tAXkKd8Fi1dkocH0KTXiiskt2s4zbi2arpNWw3xetj4wV8?=
 =?us-ascii?Q?p0b4LsvxDE9jUrZFzb2ovP8UJpPxxoFqwxM1vVazy0gKuu4yw91KhI5HqqEZ?=
 =?us-ascii?Q?3Gt3aGklAytKHvmI883FI02zBbSSTuZBtxJtZdRvOmF4UES1qDl1eD5z9tm2?=
 =?us-ascii?Q?Nk0pvc1tVGlk08cyYef53GuG/RyNO6hXskZHPIJiajlfbr3/S0ToMd30/5B1?=
 =?us-ascii?Q?HPQVyLEtvF/GIVHQRd/zjJyNlA+M140hlqQDgzsYmtnkdbCMlscAJVXhPzc9?=
 =?us-ascii?Q?JeQdnkHkiPtNCuOQ2K6mxeMUByvJlX8Zpw5I4tau5AqZGX8Fzwa9YuYr6eAf?=
 =?us-ascii?Q?vSu4oVN1XizRra5CvWF4O4iwuufFzzEKSQA1gRG8fO3yPMwrqtldkq/pFyn4?=
 =?us-ascii?Q?Hs+DvGp+gGjTeI8oJaujVgUakO7zbS94H1gY884FHfFA8+X61O9tnjRPjGaB?=
 =?us-ascii?Q?dOU2TRbEXrmWCU4MagzpZcVDFdqyo9dZKTW9bdv/LRLeQDY/2KZL7rbOTJ4p?=
 =?us-ascii?Q?e1dXMrlsSTu8f36r/G/t8K+OWWiqlPhWAQ/pEyqNNXtBqJyFsS621aMKsdgo?=
 =?us-ascii?Q?8n7Xopaw8eutaLxwXrN3z/GUBCQ/CcXefLVf/xD3z8XKoXJnRwp2NX04laUN?=
 =?us-ascii?Q?3GdNFQI9TBJyQ5d+Q1ZLf56RQjnUtrYO1g9oQCcD5tT+CVd/U01rTVCcgfi7?=
 =?us-ascii?Q?KZUe33zgsc7OIiZBpI0GA+uo6l2Nbkj1db7lrpeHCPivDNKWTtXtpHQFi9gD?=
 =?us-ascii?Q?qWpMs8kr3La/yHEfNqdJ/6Pmc7l/qNdr5yK9MQtc1HckFdfHMCLr0MmzcJn5?=
 =?us-ascii?Q?mGKR0+0aeIN6BBHt4pgFQzZTLVwnXJBHHD6sx1X0LAwkaeF9PFKi0L6wM3Qe?=
 =?us-ascii?Q?yc2cemywlgbQWl5JWwPojOsji5So9JVHQTmkjxNW4oabxYtw/e1qEalP19Gz?=
 =?us-ascii?Q?Xmg6i0CwoFKJZtQHzVbqLLv6icjqeRf1W8h6GrzBFmOMw4ocNsRXjY3gcMpn?=
 =?us-ascii?Q?9oUVdzpAFJm6nFUh2RGGQvejXf61JYTCNnbcgEWbh7g9jts45YxadeXJWaDi?=
 =?us-ascii?Q?d5fGbgeh9Gqnacy8E86iWrf1SN3w3w4vjZWF0Fs4BEHoniEpBTY6Bo2cTUYK?=
 =?us-ascii?Q?1WQHFJM9mBijncEc+z6+LxyVSOEHgHulYliFiahGwxs8o+O0zUiHzfCLxNk7?=
 =?us-ascii?Q?XOgqHFZJMgy5ZMzQqDUhn7BFpHvyhS4mcE0TcXn1+VOrE3FKjkRWIj5oOoYP?=
 =?us-ascii?Q?Ju/47uYmfMgYJ2dWNyctJhryKNbcgYJS+pnzbEhGIHVfJhQFqSm/ctJx3w0d?=
 =?us-ascii?Q?YmMsf6mQWIGjOAMFiqQs1tqsMXBxsIV59TV0Q2z+vHpXms2WBU/nCNGOU/6L?=
 =?us-ascii?Q?OMy8/y9fW13arfQAOjs7mbiGZlvvYi1gtQdoxu0IvOklJWbY7xnAnfoFpfqX?=
 =?us-ascii?Q?bt5+mDrb8Ip5ybx77sX98ZvDxSHK6q5+2jAvhrIYKHlR9l5HscnGG3rGJSXN?=
 =?us-ascii?Q?ZnK7IpHuZqVCCZ/hRNDm6G++yVP/8WuzXELs3jr2nFwCJrmRuolXmesrrVfT?=
 =?us-ascii?Q?B5GPnNZyfuW68Q5omqLBXqs2zT9VBKQ311z7kF1P/9Qe82yjNhhZFqaMFA6w?=
 =?us-ascii?Q?XoBTsG6f3MF0Kz+theN7A44qXS0rYVNhoZmQYfJ/n1fDnHZ0JJ3FhgOgTNdN?=
 =?us-ascii?Q?emE2YPFdD3i67fWdV0Lp0YT8t2O8WOSYn687fhXiKkQnzRAZ0pu4xqH8Gqdb?=
 =?us-ascii?Q?uA0Ek5dvSQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91add1a1-b416-4534-8d9e-08df4c740158
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB019273.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 10:48:43.3532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D4iREE9VdpyYNUSrGatE5KmLmyaJY0/nutZ0gWIlssOLsyjHAfvAUufAxg0zxzHYk91sCNusZ9G3QXkMi/HZiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10270

The Lynx 10G SerDes driver can reconfigure SerDes lanes at runtime, and
the TI DS125DF111 retimer driver can configure retimers along the way.
This series updates the DTs of the LS1088ARDB and LS208xAQDS boards so
that they can make use of these drivers.

On the LS1088ARDB, describe the SFP cage of DPMAC1, link all DPMACs to
their SerDes 1 lanes, and describe the TI DS125DF111 retimer that sits
between lane C and the SFP cage.

On the LS208xAQDS, describe the eight on-board SFP+ cages. Their lanes
are routed to the cages only with certain RCW protocols and DIP switch
settings, so the DPMAC nodes are updated in a separate overlay for
SerDes 1 protocol 0x2A. The resulting fsl-ls2088a-qds-sfp-retimer-bypass.dtb
targets the setup in which the on-board retimers are bypassed.

Patch 3/5 depends on the "dt-bindings: phy: lynx: allow downstream phys
on the lane nodes" commit, which is accepted in the linux-phy tree and
is already in linux-next. Without it, CHECK_DTBS reports 'phys' as
unevaluated on the SerDes lane node.

Ioana Ciornei (5):
  arm64: dts: ls1088ardb: describe the on-board SFP cage
  arm64: dts: ls1088ardb: add the SerDes lane to all ethernet ports
  arm64: dts: ls1088ardb: describe the on-board TI retimer
  arm64: dts: ls208xa-qds: describe the on-board SFP+ cages
  arm64: dts: ls208xa-qds: add overlay for on-board SFP+ cages

 arch/arm64/boot/dts/freescale/Makefile        |   4 +
 .../boot/dts/freescale/fsl-ls1088a-rdb.dts    |  55 +++++++++
 .../fsl-ls208xa-qds-sd1-2a-sfp+.dtso          |  91 ++++++++++++++
 .../boot/dts/freescale/fsl-ls208xa-qds.dtsi   | 111 ++++++++++++++++++
 4 files changed, 261 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls208xa-qds-sd1-2a-sfp+.dtso

-- 
2.25.1

