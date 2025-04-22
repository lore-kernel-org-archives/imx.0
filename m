Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2043.outbound.protection.outlook.com [40.107.21.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8156E1F03C9
	for <imx@lists.linux.dev>; Tue, 22 Apr 2025 11:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322558; cv=fail; b=KsCp8laI7+KRkLlSfgWd7KQUtmNr20oydoQopkpvQdYf3hnpEDnlSFT2ZD6Oa+YM/nvzkKbENBerAO22hTWvs0bS9BoMMGy8752lzVszfZzHfcCxHpm8iZy480gah5jCv3NcIHj/+RlfpRBEcOOsuYqTeEgdHud31qwgGlGThZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322558; c=relaxed/simple;
	bh=kqg0EwlN2OZd0SdfV8KhJ/o9Z0JgXZa3SR9lnudF+fU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZB1VZWGPQwYMnivAijnJ3qEojEcGk6XmcjNvRXr4MdnwDjjmNVV02Ipr8JJGzDyOzwi+FvEcSVTN5aCdVmnSR9G2eEEGnrNHSyqmee8stW55++ly9IX+5as+Mo3krEh94BJjsaW9T8G9i/lo6ouuxAOOIceUNq5U+r3AUEY/pfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Oad4TpwB; arc=fail smtp.client-ip=40.107.21.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Oad4TpwB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAM0nclKHjiap5YP/S51SsNWuEFA6VdDEla8RS3SOqspYD5eB/J8jp+h61bdAegn5i9ax38s+wcZRDendQx2PwTWoJiyKhPHRnhXOXJuaimEB+URl9KO3jo5wWpMVvnSiv449KsgXg967PTfeehaArj3Qv2I4hTHTDcCzj5AcjRAX4Uh+wfoWa2Sn7u/UsvAvI0QCZX2l8FvBIXgo6dM6Gq7TjylpMJWeusldsN5vWL4CLarFfg8zKbdH57XsWco8xTyppawH/rfhgDt4OAujJCxNH5FecCYGu6mNDmXlznp3KX6yuZiRrPGffYMto1HwrwKYYopo9XROZd3U05mXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8OlzcwEQMUgVJC2UMBg+GbXlm4Cd2mcrqwyfEOPeMM=;
 b=pjwYmfHBvwdOpfqJAP5HaID32QE1CxppFDhVdQ9omr1FwomKdwt0GnUtGmgNUpIaIzMYePxUle+xL3AxASiV2iFuK1qWMHFONMOP+T8D4yKXuY+mHIrgkZUaN96JWCXvb+kYM89NuWITKl0sKVjnK2wQCp1ZraW3SFzU251ASOh8ika/nIFYPNyFCxQ0Zsxfg1GHYesbHPhnYFxx+t1mgwbkMPfFA96jAAQKlpZEcjwGC4O1ApzrrOO5L01J+7fPxPJSLnjRg3FAVf78O7W3loe+qb+Pu1Y4V3bxepTPKTl1K5fifMgw1juVK/RzjR6rmeAuIkEsYw+zYtTH7GHQIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8OlzcwEQMUgVJC2UMBg+GbXlm4Cd2mcrqwyfEOPeMM=;
 b=Oad4TpwBA9tY1n5OmnWUIMQHbRJ/bkkRWZ2wLxA92VYbg7GaJca7XKVARffPHwq19zMeaXzv7rc5iSsEZ6X2ocWD2/Vrr1kFkqD9gGGk9k6NtkENaiCSM/S9J9TonlGiHLFgDQy1IJav1omSo3OHppIhFw3pGv89XuU5fcBYvDRtyU0rFCDLkGfCsENAUgIXe6utIBNrH2L6H4fALvXyotO+J6vIUbVR2z1/tTfrqJXdvtRH2eZhCSYVABIkwH3yJ6ZYhVD9qZVRQEUI+LXwj9HS9LKZcAs/GxopHLCa6k9UdzqxE2mGTQRFyQmfDfzx9nDD+b9vszA99nEkaREbFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB7736.eurprd04.prod.outlook.com (2603:10a6:20b:2af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 11:49:14 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 11:49:14 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: krzk@kernel.org,
	myungjoo.ham@samsung.com,
	cw00.choi@samsung.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org
Cc: swboyd@chromium.org,
	heikki.krogerus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2 2/4] dt-bindings: extcon: ptn5150: Allow "connector" node to present
Date: Tue, 22 Apr 2025 19:50:53 +0800
Message-Id: <20250422115055.575753-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422115055.575753-1-xu.yang_2@nxp.com>
References: <20250422115055.575753-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB7736:EE_
X-MS-Office365-Filtering-Correlation-Id: bb825e76-4d7f-422e-f86e-08dd8193b3f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g2mMWqhoJgv663nLA6hL6/ddGC8RvVogdqXJoYkwNC/g68EmCz2YEdTi83em?=
 =?us-ascii?Q?BFnPYifOGuKykJ8rdpcBn+P7g9fBkC4KGN7qQMGR0fQvEuhDrzv31pze8zra?=
 =?us-ascii?Q?NSPvSXXWAf030jweOBDEeknu33MrOYGr1neNjC6LodWLtQcmCMwjzHUM1zQ/?=
 =?us-ascii?Q?dpUrs0iuE4TrwiRZggeVToSlPRDO3jVCqm1Kk8znbUBxJg1+/Np+tBJWDtPI?=
 =?us-ascii?Q?7VGwfc2b2zK2WxzElOTVU8Y9Cvu1Fxy8ADbmZo54tmXTJ22VeYW8ZDQF8vCV?=
 =?us-ascii?Q?kp/5Fz8BV5/45RlU6UpGBqaQJCgE3brkXTb/nyDf+FGRboBJuGc8GySdKCbv?=
 =?us-ascii?Q?Aq7miR9zJKg5ga5CpYmybdf+0SmZjDKLeVrQXvzjd/cw7D2tTilLZWIq/0aa?=
 =?us-ascii?Q?ci1KPvzV8oLv/FtzQuyevGWvg7eetjNO3qBF4YJOarlXkvIhthX5mu2ll1ag?=
 =?us-ascii?Q?4h0KmDR40xMTU61qYydZZ29gbaEqSsw8gXH1tevZ4+HwpIfP1QfyqVrDGNtx?=
 =?us-ascii?Q?XbdUr2q02qhMaL0Vnb9f/VsqXMhUO1IbdyX5p3hVW7rbCckPFLFHoqbnGe3H?=
 =?us-ascii?Q?6azL8uakFg2+eFrSN4WfwPJAkiPeVDkB8/ZzbnyEKnwI4lIhVk9m8fr0jNsS?=
 =?us-ascii?Q?dOSgbn5Hsn7E1TzdrySyWFT6Z+iZu9YxvEAMZw0KfX64/aPQSCo4ssJU5GCd?=
 =?us-ascii?Q?ogJNjJdnMdRFA8cENbPzIqeoJSKno1DW468f54BSMZ0afFYJT70Ikm6wvN2k?=
 =?us-ascii?Q?+bWNfFLUNMV2j2u24a0AIgY2cdupWW0dh43hMWGcJ/Or1oa5v9GNzTsepOwW?=
 =?us-ascii?Q?uvoXHM130baqq2T/DJP9/qWmaOwKg7bgtHZA98UphWY5cplLd0Gj5emTt9OP?=
 =?us-ascii?Q?Yg1KjyfldLWLQF2Gx3QcQG3T++fdIrw5G8GCCGMuBnH1LiQmzVpSx5G/wvWS?=
 =?us-ascii?Q?fyxVLkLc2uQQNs34DrL9XlUPv+aLEZX4liQPjtdF+4vYRqIDE70q9ai0+CpU?=
 =?us-ascii?Q?hXdfpgwHtZJqA2NtAFXco4wKu9tK7vVfbW9XGSl0/6LVyrUm4+hLAow3bEiS?=
 =?us-ascii?Q?0r+ZvVb2poYGe009r4SxUZ4H+Pa/+SMyYRO/HumZPB0RndnREnz4JJv9fJXS?=
 =?us-ascii?Q?qN7Db/59z1URZnca6Rkvg9Hl/eTYBAJ0dPDV/+2jGMx6JVWf365QlaJt4heK?=
 =?us-ascii?Q?ofXL81Yt9+qGqNzi7O027K6OcVFMHLSh2OkxP0neopjLCwETBFXoWRhwB4Sr?=
 =?us-ascii?Q?EBwJoyKGK+krxiCuX5//ltheFfcdqDhbZz9BSYFfzDvpbFNxIlQ1d7tDqwGC?=
 =?us-ascii?Q?XpaJGhcn5E64uCuRxWnyRzY1VquHg4x2y6s2K0zul6kWBfRWdMxLLdl7VQhk?=
 =?us-ascii?Q?mXLMyj0TGP5H4mEg4onWbmdPiMrkekdNMuAzAckxuOiUWeZ/aY0RwLElV/qC?=
 =?us-ascii?Q?gJ+e95M8LjLavs2nsKo20e+cueZqT3qoxeUUQ6BJusRIPFfue5zR3Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xhUurO44VySBilyDYWA1iSKmCZVB8StJfKExp0wVyHKmgmZGrbOmlLrBlFdO?=
 =?us-ascii?Q?Bj/WJqj7lG0vE8TDY8/VUlxEcwXDi7Np3xDSLkXy9A7mh5faVhar0Rm7qUfW?=
 =?us-ascii?Q?mDmfQoSHN3jMNSD19hxY/26+tc/m4O13xg4LL9lniFsrHqi/ywardQn8Fnfa?=
 =?us-ascii?Q?eDH3F4tEgPWx1bgqWw72LYvXtj+yTge1/RVLjzzIMx5eafffu2sp3s8PJZlI?=
 =?us-ascii?Q?DCm9h+nMT7U9wtv1RRsH41iU8hvAwc3TCbV76qJ/hNSpBKXgDflsAtYxCZ8/?=
 =?us-ascii?Q?/9rgU367szResprp0guPirIiDI2M01Bm4Ng0G9b0MQ3gPK66G/Jws3Jls+zQ?=
 =?us-ascii?Q?DcMs+vS23Bc1DPNdCbFnGYNMrQmvCWUMw2joTU1QT7CqcdcZdkPip37trSCQ?=
 =?us-ascii?Q?nLdmoREziqwi0/xdVGj9uIsocAljYYVDxhXp89FtBamtNiS5XEUWRFcU+NH0?=
 =?us-ascii?Q?FhORxQJAnTYBGPNvB8VkR7uUz/b9zzpWXqHqclKD62eGrQJ4+sa68lsbhG0+?=
 =?us-ascii?Q?49XesKqMBQW6cv6QE9LflwbljhNLV9iCRCkORcEPYTha4ywrPBy93QqaBuNO?=
 =?us-ascii?Q?htPsaf2eYleGIxRFA5kRI//bUUzB4zlmreulWLMcjNo5DZ+T3ZIXT8whWtzv?=
 =?us-ascii?Q?C4TF4yXb8nhP8EzoUUl8ySCe83UwZUIMjNZxPB2+g3vBL76U3rn/88GGl6nN?=
 =?us-ascii?Q?6FvSRMQOk92kBuQtKgwoOCL5dsndMR+GbOACqUfLBGwqqv4vMPdmwphaSG/w?=
 =?us-ascii?Q?Rvsd6QRmLo3f4dYigONmKhP6IRwhHQTX/9x1moIhl9ylYpuSwYYiTKx6Ojz9?=
 =?us-ascii?Q?qkR08GRww4TNp9MAkql82kRE4lfLH3TRBNvG5ni4Pfvnb5lcVfw4xXaeOe5M?=
 =?us-ascii?Q?kRXJsbjjJPafZsEwEQF4pT44KBseQcLT2hQvuXnhLyImFCxUMJx9hGt3YdxF?=
 =?us-ascii?Q?06YJweAF4dS/jrJzSIg4R2eAL/zRTM5b4R3mt8za75rGRYlcUc4e58TaFb9v?=
 =?us-ascii?Q?b3+UTpIsmT4E2QjaZbaLX8HPB9Vi4kZ7HTsydztJbuGidIicJF6LqkkZcFry?=
 =?us-ascii?Q?IPxm1vhOBpz8Vpnb2ifBkNFWnib0SbngEUDA6XuIZI3/H7N1ztfE4OgbGNHg?=
 =?us-ascii?Q?p4LGOWWhUnVB1wV5S2GucvBTrP0ejtrKYqxgGgeL4NlliDpcS3GmwiIGFTDI?=
 =?us-ascii?Q?pH8xPI48WZroliJfN+TkvEbme0k0qa77IAGiQXy5/rQErDXXYOqIiOIGUgRP?=
 =?us-ascii?Q?CMB+qprD6GjaTu4HuG3HLEE5Nk/Fen0k9/NrLYY5XhhzHqzQr6COIKJFPFyM?=
 =?us-ascii?Q?WbOhn2BiONKQK6RQnJLK84Lkz8DI4fasIY8uz+bByep8AzrPTwIQm+s2bbk+?=
 =?us-ascii?Q?COPbHg/FaHObU16sHRxPzzSzIGMKSQSnQ73RmJxZNrzyTbCogY3koX60Fx3U?=
 =?us-ascii?Q?tm8M+is5z3VB4t4GRHj1pC5rB6aL2RqrmUYm+r+yPD5rT9EETtP5kfE+5YQO?=
 =?us-ascii?Q?IJGl9CY8dkjuW55/BSmxc31lScl5Ji3A0LomxJVN1QP+s3gWRoReTekwj+Sl?=
 =?us-ascii?Q?Qkpjug3ntjBhlO64HKxyQ1tQrRwkAzmRhkbZMIcu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb825e76-4d7f-422e-f86e-08dd8193b3f7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 11:49:14.5801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TSdtfEWjG1qsYgbXKKtkGKsXKborafEYPAZpbwTtEb2/BEHwyri+CHfoU16UbIAT2G/WMej18kW3+Wsamyv6Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7736

PTN5150 is usually used with a Type-C connector, so allow a "connector"
node to be defined under it.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - improve commit message
---
 Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml b/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
index 072b3c0c5fd0..79f88b5f4e5c 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
+++ b/Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
@@ -42,6 +42,9 @@ properties:
     description:
       A port node to link the usb controller for the dual role switch.
 
+  connector:
+    $ref: /schemas/connector/usb-connector.yaml#
+
 required:
   - compatible
   - interrupts
-- 
2.34.1

