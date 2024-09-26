Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F3417BEA0
	for <imx@lists.linux.dev>; Thu, 26 Sep 2024 07:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727336338; cv=fail; b=NsPQbuetZB7rC+oOuCTSmfThNGrddvSP6HhIPzDarROsJBWbuQJRRg0Q71LWDa9MAFMNHtbF8MkATlq1zIgbr50Jop2jZlbkU05aSfsNykLT2g++4Ew2oND2UHQeQ2AdvNSOdcX4FenWvdzhE43gLxP3fIvtCdX9hhGIzP3nk3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727336338; c=relaxed/simple;
	bh=x2mb/ndcwMocfTu5rVbGmrXZz0Cqaz74I813dH7RvF0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LCbupH6e9QTpf/JPrkHOwMhGCXDA8JQiBZ09C4ZvO6bQ5LOf6PJI/EP0acgYPDi2433YhZjZf8PIhWi5cg4KlGC2oQkI4KyROR59pe7fBBxjrdYtlxAT8rYwBdxRtflS9FI74SD31tRWxaCcb7MHdM26p2JxTBYqWk6U/UoayDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oYkmG8uQ; arc=fail smtp.client-ip=52.101.70.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oYkmG8uQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9dXR/TGzjIC2MOY88aLnuuwVUqrN+/QCE/dFM33ty/D1h4RKZajlYliDepTQ6f6ZYQRf2FJ7c9wdr4oTTkYNHSRVZllUkUP+r5FEnw+H4Ck92kVrMbcBkmmtSFE+mx0B6pk0R9tpE/DOX2wldjJwQk54pOiNIyxU1v2k3mmIhqAvf6ZBQaPhhLGkCw5ChPM/dYoy5Hr7AWEQJ29OMNK1N0cVgiYxCcLysyLrO2VZ4Rc1LuspP8QvFkGVWBdH7+GfyssdM43mjI+ENuCtEoBCHntqcAj9eaC0xesjVDjcmKZDE0tsNVmFcch+U4HN02Cr0Z1vptOSLCJ2W9PNwRZdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCAqS7YpgseIxR6aiiTvBy//O/gfwBlSrF0m2kF4jQ4=;
 b=ELI5sRValjvk5dpro0/TSdZXYnt2/Km+/KskZvnI8SGZbnUutbfk444z3Q8NHS1tO/S1ocCcRaniNM8XM3/CBpJ6CGRLKtTRCF3BembtKSc5Oiwq4+BwjujtoG512bKQUSITNQD8XEE9tG5U+spCpNE9q4Ud79VblizKkDQYwXKl+ukgywoCwHZY5ey7E3+yAx0yCzRtpsda3Lc9kJOC+qq+WfL+Ps2pirBK4XQ7dHnT6bVYHgqyc98ixMD18bJk8MIBykxKbdJ/CxSY28VWJtBUMdkNnM0XSOo1Tqxci/okoeiQmN4tkR1lzgyDTae+u3aJ/Bch2qxgYxyenzAHuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCAqS7YpgseIxR6aiiTvBy//O/gfwBlSrF0m2kF4jQ4=;
 b=oYkmG8uQKklkoHwCV9iHgI24A/OUwlTRHTOObu5EVQPdBdnwsg7WJyJG7W9jY1Vp+8Av9WC2JeIcN/H9YpymSJfxym6/3IbCZFOCMKWrgN9NeJjFetrLQWLsf1ZxiiGujdShQxukb6ArIAVkQqdn1TipzrqKxDGAZpoAui2pQgrhUtsVfpuSmefzyJpcftTPqwZveRSnlmhktLKPFMTI/kjpOuoZp6hrC1pRIv92OawZPzdIC3H5mLsg2jqPj0oX5BzbRFlZKywf42tGfUYgEu8t7oXHR+M2G1HzP44g4UjRyINf7AadMEz9aEfBhNG3xHk/Nh3ZmHWFqv456lI5YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AM9PR04MB8763.eurprd04.prod.outlook.com (2603:10a6:20b:40a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 26 Sep
 2024 07:38:53 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%3]) with mapi id 15.20.7918.024; Thu, 26 Sep 2024
 07:38:53 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/5] dt-bindings: phy: mxs-usb-phy: add imx8qxp compatible
Date: Thu, 26 Sep 2024 15:39:47 +0800
Message-Id: <20240926073951.783869-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240926073951.783869-1-xu.yang_2@nxp.com>
References: <20240926073951.783869-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AM9PR04MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: ceadf00a-1a56-40c0-04c0-08dcddfe4502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IQgdF8z5kJ611kHDTfeaImjk9QFGSMuSIrkomYjr+DbMcFxDxzqoLXGT6RCT?=
 =?us-ascii?Q?OdcUK8v6CKHtTFYyzkxB2sXNlYy+66zJKrnJjeSJmybYXuQ5dF5IF1jKb+0W?=
 =?us-ascii?Q?q9aYj2nG5rmOvC9DDUnOvrHBvfzwWyMXkSnTCaVRIZC1KNu6RHYkCraoJev0?=
 =?us-ascii?Q?NUQ96UYMwI52qf2lZ2esQMw9d0GzWseXRkVAETVgIQCSKQb1vSiS+5ru/gDW?=
 =?us-ascii?Q?xdeq7aE1P2r3mUXUOs9tim48/pcLzN4onqYPL2heQzTQZ02tNI/mcLAbDP9D?=
 =?us-ascii?Q?6NugC8cOpH+KJmQzLh+dpF9K72E/Fk+ISkLZDuaeZiErHNhOxHnZtrnYega/?=
 =?us-ascii?Q?6LcAsEaDX2Nm7aeAiSWFZ6BSPC18ZGzpiQjYaSbj0H87X4fuJJe9Ycb4qKMO?=
 =?us-ascii?Q?PJ/iijrJX+Yfk8GddTQJL36XcoQH+Bn47qJwJmnds38AzVJEToyxG6TBrDkn?=
 =?us-ascii?Q?AiBtdpAK+yGFC/hP2hxn2ixil1ise69K/5xQNjnB6QG/IJNRESWRXuPtY47k?=
 =?us-ascii?Q?oruJjdnhP/3TF/OH2q2JEUIxfKLv53bd1/oBO2eadeq2zWMcfkwuE6hw49n8?=
 =?us-ascii?Q?AOziO82mQObBrtwTks9GANcmMUvj0dywbH/rDX7aG5sjgIGOO3VLYRRI6c0P?=
 =?us-ascii?Q?uAUWThNB2hcofzXt0AFYnSDY47boXYDmen2aWMfUeqIcLn5tQ4i9HbeZ7sCO?=
 =?us-ascii?Q?Tlho12XC6EkMtGBGZZREBuwyKfyhyr5HRZCMCB46F3qnif7E0F4b+Ji2Uahc?=
 =?us-ascii?Q?aiFSa23WG+WYardLtuZgmp6XBtL1Y48Eh0CzfaKKXkYOwog1zBpcUsCo7I6Y?=
 =?us-ascii?Q?84TZd2z6WulE1urQ0LDDP//bniuri0Gewz9YHzihjqkwqRK7kw7EmeLgotzy?=
 =?us-ascii?Q?JWTggf6p5++Nd5g9qXHDClKt1pNfDF8ZtOYJK7NcObtqdyuY1RyO+yY3L0pY?=
 =?us-ascii?Q?LN0EBK4ZdoCETga5J2ZaCO4eIskn1zPbhiRCZfPtXVWK+jItnkscwc+4hQJl?=
 =?us-ascii?Q?74/xjJgkJiXMpcxGu9+2gArC2KCPGbMdE7yCFBPJZ+9I9NlSqyzv0IsSfEv7?=
 =?us-ascii?Q?z9oLkLESjhpDsWJKiYD/nvorWpne8SiTiZ4TfrMMsErf1O347MkZnB///17F?=
 =?us-ascii?Q?F9E5lZQsU1ALRmPnx+X4yK/2kogQiVxk9E01fUeG9DpMqi33UUoHEm/RzIy8?=
 =?us-ascii?Q?KQBrpx5/qh4FWlT/myoOzsgfG2RhLvKaa9T0iIlH6kmllByBpa2iNWkcozGs?=
 =?us-ascii?Q?zDyowiiSgM7Y8fmLjsx0NZsIF1STGqLTDq3/wQWOWiloLMgaPAlVzOmsikFe?=
 =?us-ascii?Q?TIn7jmT+R+E1gh+BtUf3MRprbfyGU6GPyOSn83ownmMH+g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yXNlRrRrRvBHcxQLeZepfX23vXmKpSJanO7kT2A36G975UeNhdJaJ+KI4sZ3?=
 =?us-ascii?Q?AqOe3nI6xcMD8n82N7qsL9D7AF3c+x06XtV/2VxsLz4ukbUA/SiI5ogo+npj?=
 =?us-ascii?Q?ZZsHJl31iR4hJ4QGzCMJTv/UsZj2e9z/atatyR8KtOu8I1nhtig0LCDQbHY/?=
 =?us-ascii?Q?J9upM8gPuvjeDZ/PZKPB14C9AcE2TvXbnct/kh1/t4Je6DBDW1KKz7RRoZiU?=
 =?us-ascii?Q?PGu6aUWhmXnqV3R7ivJrhlyElss5Um3AlekT3A7mXLqVAw6cz8KVaqjYVGRD?=
 =?us-ascii?Q?eTN7sOkQhQw5UdTE7uHc7Sc/PdNwzWRV83L8s3ZgG0FDJgpJOGIwXjIEWQkj?=
 =?us-ascii?Q?hzh55GU2gI833YpOglg7rzjR1PywolcI4zY9qzk04Jqv6T4qO3yBurYscH80?=
 =?us-ascii?Q?B6atWWd5IDLjmGboCKuBoHdKAPfox6mFaM69SxId61k3hrcTlsVRxGIj3chq?=
 =?us-ascii?Q?LpsCCtXvBZPw9PDI5mCFc/nmA+5Bss5OcQ9Nybt5gF7V7BaBcdFJv3ahJJAN?=
 =?us-ascii?Q?vHHrzhLMWnKZZPQe5wLtJviY3aESUgf25hEHz4kZJ8Tp+lFKymjm3+rHh/SI?=
 =?us-ascii?Q?mo0iVCWPXY0X7K/6sG/XGxfJtrqeNpncXvcLWRvfHKM3k0FG7V1zr2FdfVcN?=
 =?us-ascii?Q?Tpe424+lV4+MYvcnleDdxEejQfjfByM3r3KUpI9J5wH9YB0xIicUtvl28ivr?=
 =?us-ascii?Q?fzXO6hjJYidUL2ZlELQUc4mm4mX1c7QubQhJ0RZSN5QJ/loWfZHfW9FOIj/y?=
 =?us-ascii?Q?7ra5GXrrO0XSbeQcA+2DK4lsTc9aiyIIUD/LbmBe/Yzo7FpjOpDTFq/qn2XX?=
 =?us-ascii?Q?jHu/lfecEHiMyuoZHj8dnv8e/toLVvIZeLn/Cw9Uj36ICSrw+QdsquGhcibk?=
 =?us-ascii?Q?jYBIlfTjuiXt+U/Ptu/iC9M/pW9H79mbuRWNIbctUrmZj8NORD93WNgmL3Oy?=
 =?us-ascii?Q?HES31CarOuMqoVQOw2Hh4lYbYHuKHeaCpvv4HQ8/2TQ1udLhiz7yxGWyYZJr?=
 =?us-ascii?Q?B/hno1yqnX8ytf5OYj/z1vDQmlpBuBFSa14KEd9/GgbA9juQmEr2YSPmq+19?=
 =?us-ascii?Q?CXxmDEQeM0Td32v2Dq4VHOCS0BNq+9HSj8yBMn0pJ7GeHKqbBXLDaZUTJS/k?=
 =?us-ascii?Q?dC1LZwFFlHW3UW7AnF18XFA7hn8Et6g9G7D8mdXIU7ajIPRQLYFkVuEFMlzW?=
 =?us-ascii?Q?A75LFa6LoynvC955yQ9+5pLrybWDJIex8S9MKftgM4dNUdsdC/r6d85GHgiZ?=
 =?us-ascii?Q?xNUC4YcjKus1lLbDRWZAAhgqLCv1eMdC8TuF0ZP44UcNtZi76HRGkaIXuxek?=
 =?us-ascii?Q?ZKA4RONXx1Es7me1/Av19Sq0UiWpZgVDJ9lNSzNjWK3S6zjLlHp7AscAN/jO?=
 =?us-ascii?Q?x9uJbZ2W7RmzxG1IezBc9s7BLu3XR3fn3yzOViOTJb3HC9Mk7XX7Ljks2wGV?=
 =?us-ascii?Q?UImj8Uu2a9Ws7MtNHs7WOkZvvqxirJQQSeS7/Kv5iIE/kqKozzauP6+wqbo3?=
 =?us-ascii?Q?DXicBWj2KOW+R0EKpSMO/kdHWncslSHwYTm9zhbT0bff8nmr4KelIKyWHtIe?=
 =?us-ascii?Q?zgAp27WRC0hG7cgedbxzCPyKdxGpGikojlagrOpJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceadf00a-1a56-40c0-04c0-08dcddfe4502
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 07:38:53.1961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imdClbOXp2mozDH8wn8CbNSbPn9uKa7IK0J4TUuo7HrXAJOso+S76C/eB8UqClLRJqk0WVWw1YxePsKYC9HLcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8763

Add "fsl,imx8qxp-usbphy" compatible.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
index ce665a2779b7..d01b7d187040 100644
--- a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
+++ b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
@@ -32,6 +32,7 @@ properties:
           - enum:
               - fsl,imx8dxl-usbphy
               - fsl,imx8qm-usbphy
+              - fsl,imx8qxp-usbphy
               - fsl,imx8ulp-usbphy
           - const: fsl,imx7ulp-usbphy
 
-- 
2.34.1

