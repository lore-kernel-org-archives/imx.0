Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011014.outbound.protection.outlook.com [52.101.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42E8313298
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 13:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408620; cv=fail; b=EWL1fxSYu3ZhFbR39bTs+9GlAGZA6KN9BNmDPajFIqASj9nsnCWAwh9E+6mpln+ULRv5HUxR9eayNUxnvuuH+FAoP2jWYwlUDji/yZ8byskqJ2kFbcI6XzCyGxARybxM9l+C/3GdT5l2MhyCt4j+AKMEFxnCEtAgmkvfu6EwIV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408620; c=relaxed/simple;
	bh=M7uatAbA4iI4Maplr2b6bebcc9tzP7EeNRj6YxZHypI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QuSoVGgMJQ8mItCJb0bLNLtsldF4H7t4zjzSnFi36adfQnXGV9JjpB5uYFW0zWWuByEgxktnli4FsD8HJHxKIPTkCI/Jt5tE2UnadWJtklUo0uPu3+mbvJVho3MMMvc9y5e849cMBeJnpvEJgrO6m3j4tDkPsLDPTZJI+QTw+hY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=b4QXX2yA; arc=fail smtp.client-ip=52.101.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="b4QXX2yA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twTjQZb+qReDBMUAviuWnUG+BNNUn8YGRXjfOCvI7Sp8mClIyGNupJ7y/vF8xZ80X07PFqVN0dm87WWP+GCZEEVugkOYTL2MH+BEEeI3q2uNqy8yo4YIdEgScik0gpFLAU6LG23jD5rhyMLxVdauADPR5nWZqYeyXOFPg78IhdRtoKcqJ+pFSTPt+4zEmkBMyUbIm3hQ06Wuo69b67sMj21FFvyKoBs4eTOk+GmBXB5Fst/8+IiGmhizsMqprVD4yDkOXrCtNiXrjas/8noAXA9h48qXb4WiJmU1CcEABHGtrRb2OyC450Ei/uXWyC9E87pcKEMr9Q2A1BXBz7O0hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/B+kcq+dcfD//lgMRQXUx29aHBkwuigPC7wiCGOHuHQ=;
 b=bfYtvmb044Y+IvgNqptEr2760ktdnAMHz17huiow8entI8E6oFWmxHw/e4IpMS4SwNZof9rkse8s/OhbwnGjgbK8O6j2iptkTsp5HRgCwePOnTK8rD2pEheitlvlClL5RXefaCfnfv2KRAyW+hIEWFsa1pXXQoj8GNKDDO8p7NKScpNmLWPtQlmqR2gAwpXRB9MdkR/Ok3c6HGJwUouqKmE8HStuaqIV16yAqCvwpIp73Xf9Vk7MMHdBmDqBIxeALkpdywXKwlmIoQcXt0eQZkw+YG4yZ50xsPac+6x7NLACH9tO2OqT8gllgmlCd+gq3B54MO/EtbInL9dW9X1VyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/B+kcq+dcfD//lgMRQXUx29aHBkwuigPC7wiCGOHuHQ=;
 b=b4QXX2yA+jIAU6ZsEpVRStHOkt3zUx1CcNv+JoqugEAz5SRCouTfh2KJeoCkv+bnUmJ0Vdtslb8hm17BTJliJhNUJdOpuMie35/wSFB+f7w+dG/Wx92wYBHTUwX+IleMLXqa2nVaD0zXsBmaqmTD6cOj38ZlDCRgReKlPBsqZgKwbIu11ZztoisGnB8Q2jFi2dZ2ib/xqRHj4OHxH8WwVFrUkzf6L3V5HVWahth+IuV7PTY7o7SSJsYWZksf9O350Msu8gtNd5dZyGgC0e9u+O4UCO2Z3CjfCgTDacIa3UeNfYxnC/Tn4yR33/cfyue1VcDkXq20L1xPqE0Gj8Ez5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7819.eurprd04.prod.outlook.com (2603:10a6:10:1e9::5)
 by AS4PR04MB9458.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 13:30:15 +0000
Received: from DBBPR04MB7819.eurprd04.prod.outlook.com
 ([fe80::334:2a7f:2afb:e243]) by DBBPR04MB7819.eurprd04.prod.outlook.com
 ([fe80::334:2a7f:2afb:e243%4]) with mapi id 15.20.9700.013; Fri, 13 Mar 2026
 13:30:03 +0000
From: Robby Cai <robby.cai@nxp.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andreas@kemnade.info
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 2/2] regulator: fp9931: Fix handling of mandatory "vin" supply
Date: Fri, 13 Mar 2026 21:31:02 +0800
Message-Id: <20260313133102.2749890-3-robby.cai@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260313133102.2749890-1-robby.cai@nxp.com>
References: <20260313133102.2749890-1-robby.cai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::22) To DBBPR04MB7819.eurprd04.prod.outlook.com
 (2603:10a6:10:1e9::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7819:EE_|AS4PR04MB9458:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a17f7a3-73f6-4861-3864-08de8104a247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|52116014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xAHjmL/8FfKaIKwL5NGBWQ/GKF7lvYD5Rbhn3Tf5beUrDvCZdb2h0sDPxg4yjY7ZyjnpnAg+5Z3cH+e1dF0tvPVaUh2xsac5duJNZpAMnNhFSJs4HSjEOuJl+dAqVxthJajNmM7yfAJ7ZmxCt5hBJ4dyVuFbumjoUZEYzrZZTnThKrXfO8JuFOBHZPXlTMkeokHnVOJmsY8bLVp45I4r8Ds+xjh8pLALEDUCaEmEgRPGQmsRphttuOaKKCtXTktmgcA5ygOR/ZF7GryHh3Hx9JjhyobLUnTvfIV9zP+YBCJ4IhjWZsXwGjoEZ7pP0C3t4XvxBSLQTr8xM4kRCA0IfjJSJgg3AOLsncJ+8j1YC8z3FPvH4tDZ+SHTl5d0VRhp9HJxTN23QZUmI7nNg/MHqI47wcqaocXiobolEjk+FAwycCDUz9/RFUKLaWATq8SuF5/as79Kl5kz6HqACyESUihdt9jr4jgaSqQbzgdOciv6hD9XvwqJzA2BZ/tSiPYOkXZVJI3Su862Ks5lECtsa6QJrjNCwS2kiPfGtQLn6zBc2P2sjbdgR1IJ6P+QvX7IMTCjApXqljmtT8xnoasnVSlGyC/xv0Vx2Xqz1Cozp8ULnnh62rG9e/FpIS5IkiYr2WpPvX8Joeq5Y199qGXKSz7AEdxFDxDmnRHjv23nNGsAZQTzhlt0AcBMHGfLQDcmpj57IJE3HByTx8NlrOaJFPB92BAN8twCv+HCacW8RiOMkoW5ekWBJgqHGcajIZlq76qhwyLRsJ4w2CQivzvJNLNjpMimGjTlgETIkNCiGnE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7819.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(52116014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cmqagOSqVjDG0Yu+1igYQue0vGTvpwbJL0FFPOUw9heOkGL8FuaSxYvsHKia?=
 =?us-ascii?Q?5huFvYwQ/AEVjwWfajj6op80xXbKu1vFa8PMqZ9GpQRE9Rj3Lz2TJSzqd8SX?=
 =?us-ascii?Q?/dr8faBWwcgpNkLZlmYVuoWW9fsEOsPN6efoNXunF1zMm3OMAiDZucD8g2Bd?=
 =?us-ascii?Q?Dn4sVN15FujpwYRStOZJqxXRP8ikxE7XxDh2RYUJjG2RijPCxiikosuA7IMl?=
 =?us-ascii?Q?QXBziSRAccwIsBl8fwhppdNR7ebL8XY2p9qhDPFRdqjxIwX0RZNQEIKVj46l?=
 =?us-ascii?Q?Q1cTtzz5ImXZRyYraiFAoLNC9NK+pcN4+IXcccBaHhHVSp6HwtphIbhee4XK?=
 =?us-ascii?Q?9FagX7AD2Dx+5HxeOmcmLa5HzMNJ/mm+hDIxTouwDZCZ9t8qdkIdUVpKSvi+?=
 =?us-ascii?Q?0tLDgE/l/9Xi9EEFv0pGxbF1RtI82BJtjJjF+tUO463S8/KpCEBsGR1GYzJU?=
 =?us-ascii?Q?dTaiLSDQviR76pL7MyyPiR2+vZaNK5mgTsap8ynDHkq3NW/29C5oej5wKG1E?=
 =?us-ascii?Q?L0xQph31lUHgMzWdt261PJZOPIaPCu+CcC1fbdccU1DG/mFzk+jypJgTLAYg?=
 =?us-ascii?Q?dPvZfRsm17OAH54H0Ve9sBTgsQhcofae5LRyUClFvePVc4eSdF5dPLbRskLf?=
 =?us-ascii?Q?wh/XYUQ0K3IJAJAXCBFbGnkqmNtpWYDZFnBw1yF4cnNBY6xyiM9vyoIpNs4r?=
 =?us-ascii?Q?JSRYNsEJJJJCTty1SrDQ48+QaGrBHN31fhq5epG4KgxaaJ554wh84R9hu9O8?=
 =?us-ascii?Q?IwddK5S+UQBGUAXyXC52PZW+JxMGo5c3QxVQeXvd1oNUz/Hx+7jPShF+snF7?=
 =?us-ascii?Q?gYajmYNt9sUls9ymD2FQsPKr3n8L4Q820ikDfDZsZk8+UsqWQyrp0I6oLvRN?=
 =?us-ascii?Q?eE9f3xdgjlfSscrgO5KBuuWQyR3ZoyvAXuyC5YAnj8ENCPAW64LYZJ/97ov8?=
 =?us-ascii?Q?sC5m/GvlZ9B2RqBQTitBxIh86f0joWfajzWyvnJiZa6ADYithz7o3J5CIZar?=
 =?us-ascii?Q?xXgxZ3SdIclNjw/BVZbEF+I/+t5eFEFn6diMaDZI/12IjJ4ySuPiid9iyhA5?=
 =?us-ascii?Q?Hhuudz3t9qY6/K8w5CTGDIipOUyf39kvSFU6rTnomPc0ZmI+hKx281ooqWrI?=
 =?us-ascii?Q?sojTENP4stWQpz03rxbOBWPsdqP6AndM9lANiDmG/lPQ9PHUA55PfgsDfjeL?=
 =?us-ascii?Q?qRVDMMWFBpbw66woopyfff4XRBfTCCPPDFyi/zveRtEjBs7/DNbwEtHNMP/m?=
 =?us-ascii?Q?xCa5LuUXFT4odAaU59uc3f9qHr3N8d/JSLgyPdMIAysb5DUXMMGWVFW3WG5c?=
 =?us-ascii?Q?dGTE/iXlSQHydXz2ZCfWgCzH+I+EZbPRDniDij96/iUMF2JG7GZItnP/YJiS?=
 =?us-ascii?Q?jrgycGGhxhz1bJGOBRFlBY688/ComeJ/Ns/JfdYfmiGUIKI8CSJpA59ARILO?=
 =?us-ascii?Q?/yvxSkm3N9ogR9yIWVkEJmWkx8rPd8SqOrZWquli2ukTUNGgqtg7zs7jOMvX?=
 =?us-ascii?Q?dZsQIAjgE2w/WHTfeRsGGGet5SVtCllmHIJG5bT9vRuPIqFyCRMWBsc6hsrA?=
 =?us-ascii?Q?ZceJPgTXRtRbrBgCtZe8aKwd7xiQRWcuPPIh+b61j+F0kBShLu0gLYX2QfFx?=
 =?us-ascii?Q?OIURqQgfgf7fk0csVIZ04s98/41HAhdfzk/Vn+Ie6SNlxu4kgFPQ/5mkTbZy?=
 =?us-ascii?Q?TrTfXG1iR6C4zVmT2dso72rIPxGzlj0viWBS40vqaiykpPnkY2YrV3nXRED3?=
 =?us-ascii?Q?wM84yzptOg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a17f7a3-73f6-4861-3864-08de8104a247
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7819.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 13:30:03.8436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbvyyj2oqT9SK83YV968CizMhpMEZ9CihmZQwmUltpMDigvxEoBDz/09MOAolD9PycwSY8SNenOjpU7LzVQ8ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9458

The FP9931 requires a mandatory "vin" power supply to operate.
Replace devm_regulator_get_optional() with devm_regulator_get() to
enforce this mandatory dependency.

Fixes: 12d821bd13d42 ("regulator: Add FP9931/JD9930 driver")
Signed-off-by: Robby Cai <robby.cai@nxp.com>
---
 drivers/regulator/fp9931.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/fp9931.c b/drivers/regulator/fp9931.c
index 69b3c712e5d58..d4ba818ec2c15 100644
--- a/drivers/regulator/fp9931.c
+++ b/drivers/regulator/fp9931.c
@@ -444,7 +444,7 @@ static int fp9931_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, PTR_ERR(data->regmap),
 				     "failed to allocate regmap!\n");
 
-	data->vin_reg = devm_regulator_get_optional(&client->dev, "vin");
+	data->vin_reg = devm_regulator_get(&client->dev, "vin");
 	if (IS_ERR(data->vin_reg))
 		return dev_err_probe(&client->dev, PTR_ERR(data->vin_reg),
 				     "failed to get vin regulator\n");
-- 
2.37.1

