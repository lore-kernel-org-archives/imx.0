Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2052.outbound.protection.outlook.com [40.107.22.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4F9215061
	for <imx@lists.linux.dev>; Wed, 22 Jan 2025 16:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737563691; cv=fail; b=mMEHpSuVUe3simdxuCK799+7mTMbFxPSY89IKmDO+Ar0k3wxmS3uPPqzdsxKeIq3sopR5CNFIg6dgLZRuBplB05S57SHvyya2qvjpgEDyf4I1YXBKeixXOCpk7KHD8nYtayGxnPUFFZaZq5DhJkiFRZgWAJxCObiSgWbrTHhQCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737563691; c=relaxed/simple;
	bh=1xT2/ezNg8kgV0wPozLeByjS1lgCLtJUIvv7rBBew6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hqw/8HyBgLh+eWSmr//ThRMUh4a2NJehZ1kSYF7R0ouOIPBTqA10BoJ0fTacHel4cdMDabiVfo5oTyKTmBGCKnzeujFdRnJmVFZVLp17nTsO6A+vonBJFWiR5ZXg4GkFu3vfRh7pMrfp7AbQczVNKBP3Ia12y3jXy22Vp6h2zY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=I4MEtRjH; arc=fail smtp.client-ip=40.107.22.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="I4MEtRjH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U178bFOtNNEmL5bXhcoYwmQHVjdUz6A0KsFssOCGW7jg/qmGlpQKE8sWywXgZZc7m0QZ/wcyMTPhKWtPOCptAzA70JeLn3FwjCOFMUZ+KvRGCPqxYluw0q6chCrB64jqn7hxawuNOsZQOnCHZprJwcj8PBriMeaow6oV3CfQ+p9GEA4eWQnz2wqSRdyjILo/qrRNoSjqvWU7gBaCajNiIaAN969q7JEZHgoOAVTaJhY8qIxNilbOMj2zUQ2yUWllUjpM1CCtBvpe5e5lG/Y3io6lR5KWZtmkedaRGYLI+/ecfLaSmS9SgKaml3hRNQsWz2PrecVlNXnAYaszwpUEFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1whFnT25BMhzFtnWGAmGXTdzmvHo7yRHLVPXZze3pk8=;
 b=i0Of8ajLf6/M0tDCKkDXhcmSQJUSzuGRfNhW+yhwVZ66ZQnsjI+Z2z3oQcJA55+ePc7wcNK02kRCeadxzjvfuFKqNPf/PU269FZT3aTZQ4A0/w2iilCLZs5+EBvqwpOqiOt4uN2bUidKo52ThTXqkddrOEBnwJXGz42d8znH1oCevi0z/xfPSRPePSYrZqwjc2hRtxSLN9O58uF09NFhhxqx/WYz7kCuLw1bB84Jf9ytXl08ALd9++6C3bIqfQPT0/l2wodJZ1JpmtAFK5yUsXOC6SD29V0pVIZFxEPevYxndplwMCJcur9Av/32ivhm8Tt8V0sqRN9UlI2zqeBQEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1whFnT25BMhzFtnWGAmGXTdzmvHo7yRHLVPXZze3pk8=;
 b=I4MEtRjHcmP9R8mbtQ8EDZHN4xXnUAYTYZEILRbO1hJQ/nbZ/u+IodIdQeAMHP6XQnSBHbRWTaMrMAswNOUYshq5xdtf/FVTehsWSCkj92MtofIpHInjqopMIOoEljYbvcyjBqBDBfuOmtELjzSU9VIko1/WdM9WnL1SjOWenJTsAX0RKSFUcL9GJor7UsncBgrk2DrA8QLJgp9iN6YAx0YeffhuyFeDDXY6bfJkHKHakHfSBhG/AFVIoEW0mslnoEN0lYvksLyFzBUnm+JD3YTZMhHvRWjlHTMCM71du0mneCdgXLGQrADCMmJeXq+ltqyU3J4o5CwYFFOcrigtPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS8PR04MB8403.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 16:34:46 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%4]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 16:34:46 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	broonie@kernel.org
Cc: shawnguo@kernel.org,
	conor+dt@kernel.org,
	peng.fan@nxp.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH 1/4] dt-bindings: arm: imx: Add board revisions for i.MX8MP, i.MX8QM and i.MX8QXP
Date: Wed, 22 Jan 2025 18:35:41 +0200
Message-ID: <20250122163544.1392869-2-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250122163544.1392869-1-daniel.baluta@nxp.com>
References: <20250122163544.1392869-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR0302CA0005.eurprd03.prod.outlook.com
 (2603:10a6:205:2::18) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS8PR04MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: 12f5ef83-03d5-4179-0f7b-08dd3b02aecd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FoyC5C6ljL1El9XY2rUwZ3EeXsK5j7+zbk1xsY9sjI+PwSDO/2nJQ9QXWsIK?=
 =?us-ascii?Q?sHXp8amXB6bgsuUZUeduUJy2kjVuBBQsPSinEKUp3Ce56xk3sfB/P5q7f4aQ?=
 =?us-ascii?Q?BlaKHr/VnLTOIXYXXYKKisll5vz7gg5RGg0ktaq1+nc4aB1jNwfzX2zSgs1E?=
 =?us-ascii?Q?K951+Q+AwZhVaKemOnNwtkN/y+gQOCKAQVc7XoiyVqpdRexTlynz2mJ6eWwC?=
 =?us-ascii?Q?IkUVA7S7MwIwdZ2r5nykzsPNBaDegnxUBq90NlsUxw4vGIyxvO6aJhcWXy/D?=
 =?us-ascii?Q?RygFW/JTCecfQ5z5/WseIhMOBPjk+MyAdcunn/ovM93KumyIGQmAg15rs0m9?=
 =?us-ascii?Q?5vzbzasNbUAbYnJTdjDFBsOczd55jHr69I8NXAl9WSKHciyQrpQsfU3TENuT?=
 =?us-ascii?Q?38uwOuCR1SIbpmGw3XvHRE5/EftoKiRQSL56uYs3J0XQLxsJeJ7vv8KhZuDv?=
 =?us-ascii?Q?eyeERbX2HsEoPEdOXMrDHJlUR/0JifGqS2+pQHnjB9HX3PVKHQ3r42D9hHlP?=
 =?us-ascii?Q?rJSaZ+XhUzQKAw1uYvaAVRU3fVES4p4axrnMJxUz9Q2ZcBGy9GSaDqo+YfIQ?=
 =?us-ascii?Q?mV6cV9LQg8Y9JBQ+CRKPWoRP9ij4c6Wod4omAV8rwvr1UzQ443yMObVxPXsS?=
 =?us-ascii?Q?dAH+vs3X8t/pkGqPBvpSfICeEsngSZlwCdyNa2cZFxNwMZaeUI1q5EWpv1Bt?=
 =?us-ascii?Q?y62OlX02gSOX16Mc99y8qARhhrvtqishEJgIy8CxmUqJo7d5WGE5SOu3k/SH?=
 =?us-ascii?Q?zJTQCm6CwTDySTIdpx716TWZ/YqgUSFm55yheWpaZRWdTG4hYJi6WokgFXT+?=
 =?us-ascii?Q?AvrQFMKNF/P1B27OWg6JRgvGZa5erOiRYJHmofrIHxW4cVG5whwMLc+VshS1?=
 =?us-ascii?Q?68HG/8OdERXW2zAnzI5P3SNSsjUq+RpXD2hsA9F3wTyp/jT9XUr+40hyytd+?=
 =?us-ascii?Q?7rmWHXLgU4FGMla8IzdafMXmYuAmmjzrdMXCVolSwVZw8Dx6k1m9R+Ags41m?=
 =?us-ascii?Q?SpxBykGBlSUursuv5uuiO9NL/SVFh0JjvZDVyoHdGsChwg/+o6HQvJFIVSrX?=
 =?us-ascii?Q?QGizi+3gN8485hdYldGOaVktTXOi1CwZAsVZLgi4RxItGe7xXLHPWnurl2HA?=
 =?us-ascii?Q?jAOJdMBywdVUuGgJGooEnrLXAxHI1Z0ZnkucOG0xj3GULXihQTH9yP3DIbu0?=
 =?us-ascii?Q?uW1+btAhgDWu0LTK0ybRrzEmdQUIl7fs01+m5U/TNZPIl3Kz0eqi468DKNdz?=
 =?us-ascii?Q?dcMGVTys9fObgXa3XJemZWBbXX7sBJImrk6almPIBIkAgsOKqiwfSOERwOep?=
 =?us-ascii?Q?BIj8pw9ovBYv7wD/s/i7Ef+3y+vqXqJhWjnCjEQ+Eb2eaXjliuKDE+jzEWcT?=
 =?us-ascii?Q?JLMCdoeYFFSi5/0FPlcAsH5k9Cg7gPGZ1jWJwPrDXscrBjRTMMLTvG0pb+g+?=
 =?us-ascii?Q?P4OHCjnku8i3brDkZA/KJj52meCxV5RG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3rbgJm+BaaELdfH6yH7GgTxB8IJQHW7rL/d1vDpotu+8cO3v7BplwS4WlKL9?=
 =?us-ascii?Q?6UT0z/iSwPc5WlRmwtFyS0DMzdW+eC+Gr7hd+uMSfJLW5n7k4aTCciSIvHeY?=
 =?us-ascii?Q?u0jHeeyl+ZsgcE3TXg9baJM0qeERonJwcDCfV9JOIug26uLDXF22CezHNIoq?=
 =?us-ascii?Q?w9HGs58ijftFD3+HwntdsjxI3JKsuuF67aTAmgPaHYQgkG/qCcrtAcR/1Z+Q?=
 =?us-ascii?Q?knSnXDgUDAMzNodZ5ewEP0wcjBlCaWFSgbdY7gHADjyNN9gCYns1gNNAA1tF?=
 =?us-ascii?Q?5LI9f/T/DvzI4N1JIsjmZ24Zk8d8pmVuiIcyzx5U/AkMO+MKrR9hSXkyxdm1?=
 =?us-ascii?Q?LvxWPyB2g80w8Wwwfms8TnJnV1eF7zhwO+pAsSmxneUzVVjz/JFDhCACUMhW?=
 =?us-ascii?Q?0AUVh7Iwp3xon9Vc4lJqc2PYs12FIXBh8Q8CcMUmOsF6LC+Vpd0os02tpB+V?=
 =?us-ascii?Q?fczSYxuI9xzr3XeRVvaZs2s2odyCb6sWuzfN3vD92IEmbilTveeQAaHZPK8b?=
 =?us-ascii?Q?cBf4txKBc6AKbq7QKxO5J1lDVgekxVD3GNfmHqCZfGK2x3TlqWMSEaJiialp?=
 =?us-ascii?Q?EBoYPXyyzWm7WW82IxtE60RocDLLSOZofiPVb6k/1Jw+0rpmCyzqdJoRWbVM?=
 =?us-ascii?Q?gpdc0xNQs8L9ryZEtF8zUk7Gc0DaPV0b1A2prv3xJlf/Yi4LLY3s5iW4g0JC?=
 =?us-ascii?Q?mztI8l7GHS1jPtXuWaTuNoPz8i8ncgSaBAkT61WGCNpSr8Lu+aCeD4GB6hcO?=
 =?us-ascii?Q?oLPo275rK4UW8/gHa5XYpxDhB+C0lY4+SrTFIKFeurYuhBKX4e7B0nAKBoRB?=
 =?us-ascii?Q?hBIKWnAO7OhA+6OEDFrcfpYee3y2egYjkyQSjTzNZ4Hb7rHH/u611c5aXdBA?=
 =?us-ascii?Q?KvQfBsMHjBVRQJpfYGbEEX5N4simvIeOKCKVOKrVhI1h00jM2PQcA6Ul22Wr?=
 =?us-ascii?Q?KSDCT/ny1ZeCUDz6YFZdvSazQkCTepSgF4P+D0FnlczTs3f40SahAkN7A7zt?=
 =?us-ascii?Q?+nCV4H0RMcTUCZQT6Oy0LE4H5aejV60NmQcuck1TdI4Lb9FFVjfInmGrl+1T?=
 =?us-ascii?Q?tLWkfKX6HyCnJDk802qpq+204IMy2NjV47kur4VQbf8R3hz/p/Wvh1QwMAa7?=
 =?us-ascii?Q?/GAdn+EXV70c8Fd5kMa1XPtI/vaxJhBU3t0exgSW5BXNiaa46r4SJaox21ai?=
 =?us-ascii?Q?KJzJan3DeH8f0UQ2zraGA454Y4+68LIIXrs3e/GghXsiWnSqk7hpFbrWQnaC?=
 =?us-ascii?Q?siktFeX53lj1e9W720hi0kCpnitQ8w6k2DaBqGsmuxNBuLVUr8a4D0KG3MuV?=
 =?us-ascii?Q?LjcHfN9Wdi1TLwi06rb5MgHP5JMAyaUFuAtyrXy2Mzy2e3xscx3JdK7YkYmr?=
 =?us-ascii?Q?WmHZPEY6f3xmc4p30Va5P0xEeya8q4sS0dvastn6I4MtE0I4e6EoUwUFkM7z?=
 =?us-ascii?Q?Mawppuu1/Hyjyv87XqDsHGRM2uDvtpcLrjMcNghqIyVxKhg1g3TPCenR04Hs?=
 =?us-ascii?Q?usy1W9BNAI3VwbwB4Oh3zpAvSZkFGiXS24A40EsuUhWUfl6uO1AwkalAc6KR?=
 =?us-ascii?Q?P4gwn2Y7rhjcw8Mnl5ObbupjjjmhFyKpXQa4dH7f?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f5ef83-03d5-4179-0f7b-08dd3b02aecd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 16:34:46.8817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDmkx7yChQg+syQhk2yMZvt15zegyLwEX7Cygw3YVjef3ZAMv0ZhMn6IoLsG4gkGBhNSH4Oc3/fihVqoNrd8Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8403

From: Iuliana Prodan <iuliana.prodan@nxp.com>

wm8960 codec is EOL so we have i.MX8MP EVK Rev B4,
i.MX8QM MEK Rev D and i.MX8QXP MEK WCPU boards with
wm8962 codec.
Therefore, add compatibles for them.

Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6e0dcf4307f1..df26b6b26e8c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1091,6 +1091,7 @@ properties:
               - dmo,imx8mp-data-modul-edm-sbc # i.MX8MP eDM SBC
               - emcraft,imx8mp-navqp      # i.MX8MP Emcraft Systems NavQ+ Kit
               - fsl,imx8mp-evk            # i.MX8MP EVK Board
+              - fsl,imx8mp-evk-revb4      # i.MX8MP EVK Rev B4 Board
               - gateworks,imx8mp-gw71xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw72xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw73xx-2x # i.MX8MP Gateworks Board
@@ -1262,6 +1263,7 @@ properties:
         items:
           - enum:
               - fsl,imx8qm-mek           # i.MX8QM MEK Board
+              - fsl,imx8qm-mek-revd      # i.MX8QM MEK Rev D Board
               - toradex,apalis-imx8      # Apalis iMX8 Modules
               - toradex,apalis-imx8-v1.1 # Apalis iMX8 V1.1 Modules
           - const: fsl,imx8qm
@@ -1290,6 +1292,7 @@ properties:
           - enum:
               - einfochips,imx8qxp-ai_ml  # i.MX8QXP AI_ML Board
               - fsl,imx8qxp-mek           # i.MX8QXP MEK Board
+              - fsl,imx8qxp-mek-wcpu      # i.MX8QXP MEK WCPU Board
           - const: fsl,imx8qxp
 
       - description: i.MX8DXL based Boards
-- 
2.43.0

