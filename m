Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011001.outbound.protection.outlook.com [40.107.130.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0142A32863D
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 07:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768461584; cv=fail; b=OL5oq7ok8hRAaRUP5NUdLt/7mNX9zqObSnMaANCS4SEjQSPyiPsxNI24lEvugsLlBz8Hfs0MbQI9G2qa9pnfiDueZ8+CDdZjRlagHcNbKABf5DgW4tsetf241JPf/28drgLvmIefJ0A2VQP+ypRK2TQdtcHeTCIJowkJ0kQK9B8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768461584; c=relaxed/simple;
	bh=oYd9vWo6EJXIpXVup9DSCCm43T6B+ihAPdJU9UCSHKg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XivMgcEmr/7yBscxN2djpbu5PWKUfcd72lehbq/XOEe+Q+ZoaAKtvbYUWAmy0d/x8JH8ZaeMunnyEiGIk4jIIrYsiaYQf3cUy46zijiui5YV+SmEaZy2n3o3DrVBrI3/atM2uIZuIaVoLmFo76ooDaEmfQDW4hrDmcEQOs692HA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=X+fY5C9l; arc=fail smtp.client-ip=40.107.130.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="X+fY5C9l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nbil4SGM0VLrZ8Z2poCS4Vy6Q65/LS4kJqo2yoyz8f7NTqdmfQPUUHDzfsQMhSTy9YnN41hqq+XK4D/wYQG9QiP2wzJ596NA12InbEetRCam+iDhdc7OGeu5yXBtR+7/DLPajUbtgmQ/9pE2WZ0FnccayyGiV0cJwV1yBQr40T0TvslNUvcGA2my1DSOfscjdcVARCKwlonrmF6CIzwRAzU2275jRvqVXfq1CYXMFsr1DnklE99ORYkDvkE0pdjOVqqG3ICDlbfRgh76LvdJlMyW1/nmNU8OytTkkJ56Fo6/H6pmCN/CMuF+B0NemIY2sbm2GsJKRyKKFfd6aLAZDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Qt9SU9Dd9ybafhv6atgczmvsmtQqJAiTds0w4qXwSQ=;
 b=IkloFxrQ47r2e29xD5xCX+rt86924Zx34FLE3So9QboIbeB70ge5SWmJgCLSv31R8rDWAe+Aj2/lqE6t4GPID24B2ObPntnwfIbxlaMZ9MtjIns2p0b8nhvAU8HCP02IXDqB2eJXoqSEzzUfXXjuc91jm/ria3KPojfQ/19SdcuvZswBy2CuwyPDCryHW4dEXF18R4gaTdl8mzeeNA3d3PyHSoamf7rbGibIWU3uIvHtna8n5o2T8Mwl0+ZaFBP0bbx5IWKncw0XAcSK0uLIPvKDdQzG14OgujSP6IVOyphZM3Z88ffyNxe2fR6prr+Bw7wJqAQH51+qj+Zu9hjCFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Qt9SU9Dd9ybafhv6atgczmvsmtQqJAiTds0w4qXwSQ=;
 b=X+fY5C9lXVydHyedREpZd8hT1DRaBU/qlKfRQMbX/nFOiZTOM9uaQEG3IV9Z5dtLiPQTTE27DcK+5YYfF0xoznfenYwsFb61tbre9dAkakElibbMtbU7EZyt0raitN5QymXxeShoBD+6KFEI64xs2BPbCJ6KDuoDtBAXqP5kgBBNRh8l+CdqfFszraYqmTEpDPNudvgV09AJIX6KB9FhjvJq06+EOGilQR5Y0nWjwYVE9FrHBTbyUKsyBtK1nvx6FuJM1zCaq2wTlWLSoUnyY8vEDQ3ki4xRZ0Xo5RBvmptXaeZZCATL9kK9JUNfXI0db/gP2mQ1E8j0UM59H3JnZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PR3PR04MB7322.eurprd04.prod.outlook.com
 (2603:10a6:102:8e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 07:19:37 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 07:19:37 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	kwilczynski@kernel.org,
	mani@kernel.org,
	andriy.shevchenko@linux.intel.com,
	bhelgaas@google.com,
	hongxing.zhu@nxp.com,
	frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] dt-bindings: PCI: fsl,imx6q-pcie: Remove the deprecated "reset-gpio-active-high" property
Date: Thu, 15 Jan 2026 15:18:16 +0800
Message-Id: <20260115071816.115798-4-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260115071816.115798-1-sherry.sun@nxp.com>
References: <20260115071816.115798-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0150.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::30) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PR3PR04MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: d3a26385-4564-41fd-8608-08de540670f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7d+RNrfvZAks/yBbIibUhk5pK8Og4+gZQEXpGrEIdprVxwC9nuOm4Bwdy4Hc?=
 =?us-ascii?Q?w1vurEp7vYzZYYp3L9AQwlYl1cbq8qg42GTJLfkqrDUdoej64Qr9zAdUOUAV?=
 =?us-ascii?Q?raF5XQXhRI6C8btVcHqHp0JFSaqN5ayOcei/nOQeCxKBx0IUhN8HN9cNucc/?=
 =?us-ascii?Q?Y/BHerrtbLOlZn4VEDYaMtFaRHAV9/jpYvZgPlecccND7AaIRoUcVWY6Sni8?=
 =?us-ascii?Q?zHX6VBxEX9ytrsFZBdnvYj/awrN3EksUFGfBTfVAViCHZN411t4UAIcw9Zxe?=
 =?us-ascii?Q?bmL6L5awQyDSULyxhPqjTMJdTQpOZLJLIgrw7JvrdJ3G6Y3Dd/JJWL/htLTm?=
 =?us-ascii?Q?5SQ2iuet0G8F4rgaIg0iiHg4BsBS0REawjShpKhWmyOzs9OGClnV9DZBYOMD?=
 =?us-ascii?Q?hwVDIbWjQq3y5h+iEtZTWPzkBotCu69S3axtdF8gb2+tXjizApAVZQu90iZM?=
 =?us-ascii?Q?TZgDdGHOQPQ1iAead8cIRmcANySsAyxv8LiTQfCg1SDfHVPLMYBF8rJ6ObnJ?=
 =?us-ascii?Q?6arnCCSecojc+2Yd8Dnj+ShdIdc/qAO2BoqKUCCTV4Z+iCyj6bXOceBLSUa3?=
 =?us-ascii?Q?lJbSNZKS/YOMq1+3ktmrNp1Y6tm2dpvCzZu8k4zGRpEWfZ6S7Jz0fOP2brWb?=
 =?us-ascii?Q?xFsvfbNPOex8C5KUHKE0DOhLA3oXzata0r+XEbG/N9swxPPmZMRuSoeXS8OE?=
 =?us-ascii?Q?5NbCLGF1xix6r76Z36V1ZIphYz+afhSlpziFKJXotTq9mmDN+QUcdBKKJYVn?=
 =?us-ascii?Q?NiPceL1J1pULU8hOpmdk0jbBcIpcfH1BMn0pGPxBAPuHavZui3EfFp0VuFe5?=
 =?us-ascii?Q?+4Xu4EJ7jUhBY8PF3cx3ytv/5sJZQ+0hd86XAa3u347JRP691du/83NugAKY?=
 =?us-ascii?Q?OSDQy0RfTIaJImAMzz+bZ4+ptAkXdgsQE7TaYuaEv/Q4c+iT8vFwpn+UvCta?=
 =?us-ascii?Q?yTJRUoOci2be3nnc3ui/oTo8B/hOV7TZcx6ie/W+MCpnXTiUHWAw84xRlUT/?=
 =?us-ascii?Q?6M4NxPxNjhTvbLOQcL9hG/qPSmScAhesbGDThqyiaZEoSnuvA9vuJl6tVO+Q?=
 =?us-ascii?Q?fKFuqzaBbemkKTMNrbUAePNnaVW8LZB8OOWzyXFUXKl91nJPeI2k2clDfNFT?=
 =?us-ascii?Q?OjJXZOjA5CUnIyHBOl87TgRILsbgHrhbWrbXVooVqnCcmlweXGEv2VF1bKsX?=
 =?us-ascii?Q?86dw4KkeRUpjSwNlePPlfEKhBnWyKd+3O+Bd0K3a9JokjDI1LKCDvRWWzLEg?=
 =?us-ascii?Q?nnxytETj7ee97fECaBdg8+Ewg5sUdsM4qppRjVeJmWGM+c52Liz3nAONLLnF?=
 =?us-ascii?Q?i7jmj8qx8tYhFypY1k1hVQD+hzDnagKh/O9p/FCI3LFGZqYK7wCTFdtP5250?=
 =?us-ascii?Q?SejUWJs4QtFtXBasaKAPCLDCF79oZhOrbIOQDtSjp2jdwDfmDhG8llCxlAdu?=
 =?us-ascii?Q?NKDYI5x60r4mG7Hu3+LfaJoTI1OvVcJeV7ZYAG9YGVeiq8SW18oZfjd8+4xA?=
 =?us-ascii?Q?21wGvCr/BTOadFcmvsegNr76VGP3Ow2zcsfxbz8GJK2TzD26VTHFUtUT50ba?=
 =?us-ascii?Q?lKTWEvwO7WS9ND1mqcAQK9hxlkPrRGOMh1RQ1pFaiu6rJPeJXa5+b9CYlt0J?=
 =?us-ascii?Q?44O7shf/JrDp2wtWxS8pODFYqXt2OOtc44+XO/AGDPwy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J63tyq3wm+Nt4dJWMmq35RLDXnWt/MtOXgHpOksHIVkow+LvpMn11n1pdcTY?=
 =?us-ascii?Q?r1gxEmw+NTW5h/FpBxWKH0YVQ/SpXvCWm4N5754g16KQWYL8WiheCUAM9lUS?=
 =?us-ascii?Q?MsYRGu2FZiM3RaooBW+MwFaAOn2oJfeqysmTH6e6MciplCy7tOl9TlYYnngI?=
 =?us-ascii?Q?tzyvN0mld1e2JqnQhrwdH9atq2dViPno+LulUtsuDhdLQd9yFoeKj/kAtzP3?=
 =?us-ascii?Q?iAaJirKwJaVMhMSHXVcZtaxJZNyWg27IHHmIUwndBSiBaxzIowZiySqIHm1J?=
 =?us-ascii?Q?0mEeuDFVIU7gwAPYpgbEol/NI1jZq21Cc1PZCHM1+o7CGRqGjsqlw2I+LoGB?=
 =?us-ascii?Q?pcKCQeXx5RLlGwQ3PAOCTLNuYouS4Et5bjX+V+/ius2qNllhOHZ8gf1bnJ7w?=
 =?us-ascii?Q?TyBLTYsbibb+P9NxX2hOjw60M9qY/LBL3yTbRJ3AJZ1cpHMxuFFpDsxF+Uf5?=
 =?us-ascii?Q?qwXMGnthSqG3n3LJCUCD8/y4tZrczFaexNs0kJLuB+cFijNK0P7isRwV1A6D?=
 =?us-ascii?Q?/+VB1YRH7OMaiJN0r0LhzJ83QDZavBQX/YjnnUhM4PldUxgJH43awPjLqYWy?=
 =?us-ascii?Q?Eg9djsMNzi6GmKSx4jBJvsjrgyRaw/fi+HhOInAuhIn1HAEXdkUUGnsSWj+8?=
 =?us-ascii?Q?an6P8Vw34lKwCRtvuOBAIlJcUlZkcCFjDHUc6pSQnPPRTpaLreThkahIK7DN?=
 =?us-ascii?Q?+EZS25FKZ/CmcGz7d/ZqS6Dh9UjXgNd3C7FGiEbh7gjVdZEwfB9g9o7e4TL9?=
 =?us-ascii?Q?TZSdhaqyRKV5/CKtGxB4A4/w9x/H8BzGsMTJOOPh1ucdBelPpuoqWiBGLvpZ?=
 =?us-ascii?Q?O/LBdeggX3CiAjj4eWl4ej2cXSvdREvukQAyixhFvtPXzVTL9RIvpLQgUiEP?=
 =?us-ascii?Q?2BY8UBreZEu6PKejoihlyeuoHfb9fC+bapTvCcv9q3APdzR7cCLYqBLiR9jU?=
 =?us-ascii?Q?a0t5WP6cGSBvFzMVTUGO3mzyYSL8Hpc4nym3fO6nOsrlNPT1qSjO3eej89nO?=
 =?us-ascii?Q?OEZkpas4fKxpRkeb4CTLuImes+fe8vs3vIdY9GID9nCI3NA4hnHPyE2cWqBP?=
 =?us-ascii?Q?RIwLbTEGxK5gq8vzNkRycdywwIUu0iRZI0q/PMrZYV2WGM/BIJem41xDZcQt?=
 =?us-ascii?Q?pZmhTN0UI3RF3+z6ocSAOe6/uuU8XEz61BKoWsmU60JbozXsa45a6Op93LmK?=
 =?us-ascii?Q?o4FrQ/qpxgG1cwF/vo0bwbYnN0OkbRm6P+Eq+94S8lRFP3IEkstUGYnuC6kp?=
 =?us-ascii?Q?c3rOY6IwX27A2h1EEphgKcxnKu3YKyFHN4K1XDK8uBuCyTDt+8UgnnJzCJF4?=
 =?us-ascii?Q?pwYUEitx7zyXZtJlqnP65XxH/Nq8biqSX2Q+V8M1j3O/8xYIBNKOzipIAuDQ?=
 =?us-ascii?Q?LKZwCah6W/fRxGF12yrRvhQbh9MdsLT3kFh0rxMqkXYj80R0lLkfZ1KIhHKK?=
 =?us-ascii?Q?d0jIh7etPr0jlhglINEgp7CecJGpFz7twaOJOvLw9WV+K5IAMCyheW6lIGbY?=
 =?us-ascii?Q?RBl95V6QGyNuiZoMt62BqzG/JrbHCclquwgn5RpqdfECmN38uRydx6oJ9YCd?=
 =?us-ascii?Q?1yp1RIueKpgwxcEPE+F8C/xU72A38wiPhyeU0CeR7szsR38cGAP2DCAG/kLq?=
 =?us-ascii?Q?GMUVXisGJkpwm8pHmJ9DUj5/6q6KnLJ2BKet+4m4AKBgwP0xHEKCg9qwLCva?=
 =?us-ascii?Q?XlDmRskN5avOsHWVpP23j+XVByfCqbAAg1Vnjqc/JwpI+tZFjVL7twUK+j60?=
 =?us-ascii?Q?SD0e4pimBw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a26385-4564-41fd-8608-08de540670f4
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:19:37.7473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxTYatOJgrpgANZALq3FyAhK2gUlBtN7/ovZXloYOrEiGICvt65fJsLcqPVMiwiZLqBj388NZJtiQwn3po94Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7322

Commit 2e81122d681c ("PCI: imx6: Convert to use agnostic GPIO API")
deleted the support of "reset-gpio-active-high" property in imx6 PCIe
driver. This deprecated preoperty is no longer used in any DTS file,
let's also remove this in dt-binding.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
index 12a01f7a5744..6b18264afecf 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
@@ -63,12 +63,6 @@ properties:
       reset signal. It's not polarity aware and defaults to active-low reset
       sequence (L=reset state, H=operation state) (optional required).
 
-  reset-gpio-active-high:
-    description: If present then the reset sequence using the GPIO
-      specified in the "reset-gpio" property is reversed (H=reset state,
-      L=operation state) (optional required).
-    type: boolean
-
 required:
   - compatible
   - reg
-- 
2.37.1

