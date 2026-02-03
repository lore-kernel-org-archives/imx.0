Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013037.outbound.protection.outlook.com [52.101.83.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBDE392C29
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 08:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770105645; cv=fail; b=jC2XqeWy+8cRBNy0WDpBj7lMEhcWwGOmfFraphBDbiQsekQ7a77RGmaVKCfdZdOEMkBAAheV5VLul/+FMXf4iLUQuJfOya/eDe2QzuGZkmhScyBuqubMjMCgwv7hBVHU/Pb/HKqd26uji1Weiu1voCdL0JnY1/aT3/YnGGbIBVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770105645; c=relaxed/simple;
	bh=SDMG2OUp68wT/V5y0kxhqPywxUWFyS/8lJIjEI8wnCw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QfgWf79cHTKxjT9WWtCREr3ITrCsq30kfYNELZ/3rWkZKV5k0HN2u2EJgjtEaKerfzEjSE8auCyjxI5nC81YW1oNZetUQwDPr7NC+qLoflrPFsqYSuN9SuBcMMH9ERPm524FdBel21WKsZJba1AMg1RrAqm9m4NMOLV/U46vuTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PU3XJUUL; arc=fail smtp.client-ip=52.101.83.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PU3XJUUL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzqeT5r2PKnVOYfoD4YHAlwUzxqPg+s0Q/ilWXLcQgWCFVjSj+4VqPv1lVdcqZE6r2o7ziZchq/C4zobUaxhtZ/gAsUAePnNWiTCXBlktdAh4jbscmkqXItcn1gyJgV9H22v8fOalPw2UgbNyIcJ8HGfgvkFSzf2ajZ0W2duCaYaf9QqimONlUDcS7PDjhqGWtHqffMuF1YaGDh4/A9mpPHzfjtYPk/f+949RxXwvLaZYXIH45X7OEC+HLolpslLzdSkg2Fad76Q90bSU1ffONa57gxuSfqeLffcL0WijXhOIl3nFaNzEG3caPhckTmrkHB4S6pqXkA139s4F1slgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mq3yEq86wsuYZVpSw+Hh4JIsficiXQkAuoCFSwnlpcM=;
 b=hkPIReJnIJQzvC7zVRQBiGcfz36e0cmT2jsFE2cvo2UZpTOlglNoueVTpxZUs2PXBrs/UdzPVILZ9bEN1fMXZJW2CbxzT8e6pEiMvxByz4wxnXQV9YJaMu7s69lzo00RHn9d4cGkNIkEdle9rM4kCB8zg+BHW3+Nfes7GM1SMxx6znH+rZ6MaZGxi/EKsIu6uPxpOsYs+lu6HFZUt1uRVKaJ9VSlFSGrPxVT3r9Xm7piC1qugZGXld+U1ez+B5podHgKVyYFO2+RZyOcFSJmygbrk9oWU8LfaEFgz0zzuoAq8GSP1tLLF3qpcjNRG9cqos7baLdmB6isTVFDmMT+oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mq3yEq86wsuYZVpSw+Hh4JIsficiXQkAuoCFSwnlpcM=;
 b=PU3XJUULxumPmSbKbSbULgDM2rFydG4NqYfzaUPf4D31mmNMwEkGF+W5cEtP2UbGmkJ5yYqnq5wTfwzIU9c+jLXNyNSWiakke3pNoUWQWzw+t9RxjfnFFsxbL60FUCsFv+Q7KR3wK4p8ByJl2PmLdOt3Xy/SRUv6KAbjw5rXugCeNzFXr6h7IOtP5KkyHLjLiBjUDHe2jvHhv39kbq+9QsBFo2SYWgG8WJ3pCvg/pmKoLY6k+5Y/SNngfiboGLPTM2CNMVq1pIj/EiK/p0qo4z4H74wklOAshVFeYKs6r+4ojaq9mhYkLQKfPgeHk4Y1yXb92+WYAUwoeO/1QciABw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7)
 by DU4PR04MB11983.eurprd04.prod.outlook.com (2603:10a6:10:61d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 08:00:40 +0000
Received: from GV2PR04MB12102.eurprd04.prod.outlook.com
 ([fe80::ba38:9cef:8457:c944]) by GV2PR04MB12102.eurprd04.prod.outlook.com
 ([fe80::ba38:9cef:8457:c944%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 08:00:40 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V5 1/5] dt-bindings: arm: fsl: Add i.MX93 Wireless EVK board
Date: Tue,  3 Feb 2026 16:01:33 +0800
Message-Id: <20260203080137.1492376-2-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260203080137.1492376-1-sherry.sun@nxp.com>
References: <20260203080137.1492376-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::26)
 To GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12102:EE_|DU4PR04MB11983:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e06a79c-cdcc-46fa-7c83-08de62fa52c1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?YEmA8fYNv9yxhJzI8W2nvf64fs5CEmCgjwHPGR1WkJ+FzF81Hy6xle0Rv4BD?=
 =?us-ascii?Q?ta9NgrMEPVPUlUIwYT+ZYWVgINgarFN7aBLgKitWVijuah7cIvdSsYveJLEJ?=
 =?us-ascii?Q?hl2a1g9EEjLkycfhxtaBl8MyLVwQoDoYCfghIOoyonpyQ+uNLWIIsa0fjVHZ?=
 =?us-ascii?Q?wqcqdY50+OlbDVGkSAHOyC6otdPFaDanNrG2CkSERGBF2wRdE63Fbw3fobWx?=
 =?us-ascii?Q?iZ1jwBFbnkBeE9b0OrPoUIWKcrA2MQHPgen9ZryO9k2on8fI45I2WsXn8bjR?=
 =?us-ascii?Q?2PGJBIL4eUTVpXavjOn3l4ohRAfTzsyUX42wu6qw/ibFtNHNe74vfgVI3ZQW?=
 =?us-ascii?Q?SNMuZbIUWN6GEIoRY5MC+eefB7W6jxmsaJwlkDEhBVFiL7NBtTwPS8+JJo3m?=
 =?us-ascii?Q?E/0S9t0r566NBW+4zhQof5m9kdnduCVtoxurh3WjoX1JvVWSFRB4w1W98JJL?=
 =?us-ascii?Q?YgllQsyAebnsgNyF3z4mLO0KjOXIORzIXvRQLwx1dhZk/nOYdmUvsvjZsiqz?=
 =?us-ascii?Q?ISd6xPBknaKcH5HVtieN4G1LZGAgeC7BcpobpjfYNZsPGCgx5QSQTIl3zhnp?=
 =?us-ascii?Q?2rpfkQJr6Z4YPtpujsz2z31m3Xw4Ug7RR0cEpQlxEXqVTYScv779/fOtmLvO?=
 =?us-ascii?Q?2v57Grj8s1GWs6HqBq2hWyLoLle01X2s0U55KYuGygChs906C7O4UfB0bI/R?=
 =?us-ascii?Q?zBwvrG9hbiC+43FYPbvLNZL/zgTGIEGxedUg/qaGCjKzNXcDXSCKer/zmuh0?=
 =?us-ascii?Q?5jUXmROT2E+ohI3Ukuxhf3F4WEsRbIFhQS9Omv23p+iuZcoprAL4oehKfq2y?=
 =?us-ascii?Q?RuW6kfHxHGwuJb2BF88P5O68WoyRRkRIC0tI3hsZKAUjPgdcy2+urH2WNiAP?=
 =?us-ascii?Q?hywcFdyrngo6CXszVvo1H3yopoa7PUzui0vMvoK4KLQTI0X87RU0+XASNRSF?=
 =?us-ascii?Q?4Y10fupdKrmaa+r7BzdmDxwhDgUwr7tzFO997Dm4MEbn3gL51G7+0zhnfoVe?=
 =?us-ascii?Q?fDBMkkLX8a+ykCDSE36NkVWhQ4BCU86yiR06955VVKsyQqb+9oxUifgh3p7i?=
 =?us-ascii?Q?y4K5ohZZrHyDE7jJHrfIfTXB4lXRlHpgGLxC/qEBvIOrzkpVCpEphmX51mpM?=
 =?us-ascii?Q?lMCj13iVw2UaZdWeoIYudsqDLXW0g8JRFHz+hoQ2S1gmZq4TjAG/UfMl6em0?=
 =?us-ascii?Q?tLOFz0qy/Ow6xoLky0Pf8iRmcBGrEQihIQnc62SoP0vylgxl+F/hsaA3zqgY?=
 =?us-ascii?Q?OBaxEZm6EquMPgX/SpGKl1P+RbRf5rUFpQVRZezRgVQkpgEvBK9u2edaCVzf?=
 =?us-ascii?Q?K+KBt8av9lnXqwktILRKkGfnrQidEcE8fHhMmCIzO1/deMH1nCmHLW9842Cq?=
 =?us-ascii?Q?IcK4KoQV3cJ5JDZUj2A9vTYiWjEB4tBF8sMSwi5rxQPWxYPmUgCWmE8UJBtg?=
 =?us-ascii?Q?a19MknNDlLiRqnadj7KRF5HTjtd7kXOTy5rPZVVcEz1pZK/diZG+pZn3lj4W?=
 =?us-ascii?Q?9sZRup6WIhCsfsg8fvb65DCSb/6xvS8ffeIQg0vlaGR71L+U9iPHJrhlD9Fi?=
 =?us-ascii?Q?zZvp3xfsO/0z2VuHkIdJiaSg7skIYk9kZ5I6j/aUk9NJgtwZohvUVkiM8yJP?=
 =?us-ascii?Q?ddzSSV9cDdbzW0THrxB1cfpoqH0eFTvjojGIBxzRG8nn?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12102.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?A+OkIdfI8r71tfPmcUg5OW63Jeb00Cwwuv16QQV3pDfBQJxN+tyRy1Y8Qat3?=
 =?us-ascii?Q?HfBokHFOjurdwxp9AN258+o/uHnlvdOtj7uCc2H/iPqrOiDALrGO+HQyzmTf?=
 =?us-ascii?Q?WHxkvJ6uS+CrSIG5EhkcePnYLIjwDn07wYhyw5A7KhJ2EjzKPvEGA62WlgoJ?=
 =?us-ascii?Q?83ve7DamN4C4M7YoK+gEiRjS4AP2uGWiPkwnLgBCKZui3lSZkuEWFqEaNFfd?=
 =?us-ascii?Q?p1tDcNxFaSPS6ohEpnZsHisw0syi0iezyzy7nyMhdBaNcRhgaAmS/Aw7aFVV?=
 =?us-ascii?Q?zzw/oiobAYNUvP4xMlOWO+l6S6pGSJuNhu2feMA6iQxvTOL2JlzkzetXjFuG?=
 =?us-ascii?Q?J1HI059pqnvRsQNA9EEH5LTJm32C9Om+PL9aai9VVtDbruslgdmxaiTOhXCy?=
 =?us-ascii?Q?yQX2SJtdCDIkN0jL+S/Gv8IWBJp6pUUUvoYomEXt68MB3woDN5HIQj+YmhAX?=
 =?us-ascii?Q?zcVqd5U0f8B/IOixHrjBm8tHxsl9TC0c/jPlCLiL4McDTMIx1NUWZDW4+5QB?=
 =?us-ascii?Q?keNMmZQfTxjUHIRBOPuBGrfVrmGffnvOd0q9SwV6Can7vaKJply99jpquPc9?=
 =?us-ascii?Q?Dum3QDjXz1KFO6ncw+8R4Fwd16xJEv2Mh3IufiDZDNosAagP6hYFhNt4L4QG?=
 =?us-ascii?Q?DgLQzp4m760oCabHPBBpemwE3OUBFy/MCE3rOXtbULBZkvfd7oD6bbGsLZes?=
 =?us-ascii?Q?EBsdGMsNsdtUVGR2cQ+R4Ai+lPaFYmlPXC4jtLWYRVuhYlU0FoadXqebstJr?=
 =?us-ascii?Q?CWORGbN+7lIe0R0QbgsSw7gW1UXx73odoBJXjsd8A8DYhQgycxvDIioU+cUV?=
 =?us-ascii?Q?IL2+suh370nR38ucrO5qQLHEVumFhw3ywai63u86QWzv64LnrFcesXo8tb3t?=
 =?us-ascii?Q?46qFga02W7Za8VJWBr5Q7jfddJ/OPhMBGAQhbEMFdhd4bbbAb3PQyad6c0zG?=
 =?us-ascii?Q?Q9lcrkAdJBXCSDzwnqk/OkABM9VngCnmiNfBaji/4Ch6TU9Nk5GSt9cMSRMg?=
 =?us-ascii?Q?7S0Y7zZcYk8PDqhTeMBapgRDvWe2tqQpJNHUK5jlAkkWzkg3+8oJNmKQbqHD?=
 =?us-ascii?Q?5tlmYZ2iz3+FqZUnxBnrFgjEBbuwvv0UtcpZ9/NWPZ8ktlFyI4ht2IT1S7zN?=
 =?us-ascii?Q?q0a/7bb3EKj95/jKK/0eHiB8iKfsKgPqX7DnsLgbor5Ly1c4VJRGtI3Kr2sR?=
 =?us-ascii?Q?+u7zska3RPGvbquDvjv60foqTUtHTNRYRQ7KmhJbF3JqK56VQGx219kTu6bM?=
 =?us-ascii?Q?DnazL1wGd80ZhG+rWX1h8BYSLU8sv1bIxM5sOgu3fHEjYQS67+kPZ7J+Bvw2?=
 =?us-ascii?Q?F874TRUmm7SzGgqHXiF1apv0bDdCZd1IYHcaYDSpO/M05cnvKjCKb1j9nY3N?=
 =?us-ascii?Q?5negis3DSVsIK4Sn85ZzB5+/u03ruSF47kxsRsPvZxnGOgVYgfVi86hKQVR2?=
 =?us-ascii?Q?XJzi3dJ1d0jzq0OPus2wndbqLEfk0WSBi9bUlf79sZGJMT4njGr7jBCwU58E?=
 =?us-ascii?Q?65TSAjsGpflNU4UD9DTsYjFyHsMso9TQ+06k8Qp4k0QvSNpUOGS0/GPi1015?=
 =?us-ascii?Q?NLVZ0eNVfiYw5rp0jSeNKMVa+7lMOlBunqnkvNNGmPbj2Mluc3R6c5ytyxjJ?=
 =?us-ascii?Q?Ck6Q3MkGtPGYupzJmWhcXYKv9IzXNcj5pLn0ByME8tbUPQ8UND7bCvzxIVCW?=
 =?us-ascii?Q?7Ryw3UvgTuL9tWrAwYn7DrPF92ZzFaKAy1I7BpWBujQDz3sFWTPEKZbkA915?=
 =?us-ascii?Q?og0Vkk0xww=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e06a79c-cdcc-46fa-7c83-08de62fa52c1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12102.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 08:00:40.6179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZl1EG3wpje+9ZdXNpffAu7Q6jtXe2Ucu0BBRyVJ/95m3C01YVtxAUhkYo8Lo0iOV5SV4qm156AtrUCFZjjlTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11983

Add DT compatible string for NXP i.MX93 Wireless EVK board.

i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
(Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless EVK board with the i.MX93
Wireless SiP basically reuse the i.MX93 11x11 EVK board, with some minor
functional and pin connection differences.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292c..df01b928c6c5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1441,6 +1441,7 @@ properties:
               - fsl,imx93-11x11-evk       # i.MX93 11x11 EVK Board
               - fsl,imx93-11x11-frdm      # i.MX93 11x11 FRDM Board
               - fsl,imx93-14x14-evk       # i.MX93 14x14 EVK Board
+              - fsl,imx93-wireless-evk    # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP EVK Board
           - const: fsl,imx93
 
       - description: i.MX94 based Boards
-- 
2.37.1

