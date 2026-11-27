Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795777927;
	b=ET9bwCPrE+vcreodBCEOrBlKAecj8ffSWXFmSo7eutJxlpdMrG/0zUTBo/i1XHTBv2zQ
	 6HLthiQJ8qxOKQTw/yFRan9NCaylbJvsNjOOcb76vRBWCZiBr2TlXfbKk4t72HJdUTzEL
	 u/tkAg48k7muokynVOQZ6g0pq1fatnPFiDk4wR4qAnbsxUx4/WWS2qlkJVkTFQiaFs0iz
	 ojiLttCGMCqwzi+QOFNos0+4ThPTyR1Ie8blkYSuNejiTCzi519RerK+2Z5psuHRm0H30
	 1r5CV1qhfpFUZmAGzCoo64PmZk2tbO7itPzsr1OuQAynKwbwUzVeNQ+gusSy3tCWtgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777927;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
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
	bh=euAVffpT37s5B+EfUwQFBrwWGmlInE5p0UfDg2su4Xw=;
	b=oq0p2B5wGcBEjA+P/vwXNGjAjnDbHTYrHCZ5V31kO1u/9G+beVazaSq6nc/lPJl5gq2n
	 Hak3WS+jVqz6pDIBn/TVETJ36oNq7b97ixK6qqBpOHPPgypt510HHNUS0OiMg92IOLKFa
	 1uROm2D8Zzlt/gBQcyssQ4QfGFO4n/LZGhnTR30tXoTg+N6lLrjV3AcDGLmG3SC2aUWZv
	 aPkKnQwfh84jUNS349UGaTKrrstfLVaqee/BLm2DaDyrw0xnG8jq/II2kIBvzub5sIDYB
	 /972QboHls8U9Byz7X9sz3bE4QPQ99hxqlB1esSVr2h69vAHojwag1BZ8V9Y5ozc86w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=arorA4YF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.56
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010056.outbound.protection.outlook.com [52.101.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CED3606A321
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 11:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CED3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=arorA4YF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+tjQCxAPTVEpNKPUyr0AWyfVvmb4QOjqyHYi2fUHQbeZ/ox9WXvY01BekkkFQ/0ADuUUIlY7dedbpd9o97scoZxjW8EKh3L99XcpG2vODkjO7Rr7juhskA2X5QhfCsulxjH0/fE0VN/Tk0FH1etwsA1rZeOIIxesvftbQagEm53UW7R0+0YzaYc+CJtPX31TYUYlXhsi5gzOWVJuGL+cwVsjX2Zlh8G8hi4EeSYBnEdQ+jxgQFFU0sGeUvXwIhvWyZ68A0+zXjGplEUTEP3JiuXkW83QNJOlTrXYOrsrFD3NsdxI4TqmL6USGNI33D2LQBocAtkuop20Um+zG1Kkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euAVffpT37s5B+EfUwQFBrwWGmlInE5p0UfDg2su4Xw=;
 b=ToHYRbAB0csW0w0R/6SYVdk39U/nVGkj8GZr/W1c0aVilot606XVGmBsltg392ysoOkZD786e6Xxd4WGVreA/+58MX7sPQInwcPpb2bU+C6FL89JpQ5xC6VzdqbvwGA0tN8g2WzpRYiPx00u0UlHipVqqFRR/kJ2dlitcXp76fIaS+eF/elbGAgj9aCN6+6deHk3pIAFKgDtfbiZ3uSxHHr5CP/6MpzaXJsUgP4iEfEoPE7YAHjdUkMJv5tCLH/sw5MgpasrY4PqpH90wVNkbyKCTNEyrS2hiQHl3dNRKyop5kFE4/qB7fIlYGoL89FZLIIYh7J9ekkhYSLqAk6kdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euAVffpT37s5B+EfUwQFBrwWGmlInE5p0UfDg2su4Xw=;
 b=arorA4YFdMeOR95/NN3pQjd5oCDilptmKjrVKx71FJ8m1PfQYiR+DaYUbCifIuRp7wOjQ7hzk1Vwb0Vgjq6HO/5NLTqPCFo/3gWgmeksYrXRzENGIn36+sbZ4bTFTWvei20dylpnqL5q7T2qXhYvG1vddLkJfzFW4sXmNlkJUHkmi1HQ4iv9Yybi8B5Q+h8SKp3MgQKqsXPzuUPvj4hYsGQD0yWGpD3JsrjZUMvjPaaJ111hWhEfm6Ej86F1cxjj+vI/bXglNh48Jpc96TaGUjwjIlAkaHohy2LK2t5zt8CvNrVZSt2gz5MB7vZoUDxXh1EBqu2IeiI536h4Y7LGfA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by GVXPR04MB10850.eurprd04.prod.outlook.com (2603:10a6:150:216::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 11:12:02 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 11:12:01 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: Frank.Li@nxp.com
Cc: qijian.guo@oss.nxp.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco@valla.it,
	f.pflug@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Steven Yang <steven.yang@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v2] arm64: dts: imx93-11x11-frdm: fix ethernet PHY reset GPIOs
Date: Fri, 27 Nov 2026 13:15:06 +0200
Message-ID: <20261127111508.2091413-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::7) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
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
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|GVXPR04MB10850:EE_
X-MS-Office365-Filtering-Correlation-Id: 2000a1a9-1c05-4d5d-edcf-08df4c7742f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|19092799006|7416014|10067099003|56012099006|261026121527099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	LHLe8ho5Kh4O/wU2YZ6n1mdBNHyapxl1WNwv1GPNX9OpWD0SQjVFFPLQ6MQM4nxkwFmMA8j6ydXOUvcQX5phHkW7Tb2UG1IHNPR8dP/x5zFk00pEhlerZezz7p+q9ZPdg5KSdo5uy4wTGQl5Tc4wk0m0rY9/Q7E+SwCJjqR3sLqzOIE5xi0wox0o1CTBkRlPq2qSKxa4KBHVRgeRv0vqUCKmq7aeqvS1NxAoCsn0+a+T27Daplx5sOwAA9oADpF4PTArDDfL2emq8uPdadnw7jVvUf0/PQrGZqG4rBvHrShAH4p1Nq6igVk4PDiTWw/9fLmO/nhrKMnNjLi2J81YmREghs7j2Mrjjdb7LyEiGc+S41xfxYC4/6kHsut4FFoVvzWLG/jcIPsu/g69NVW8vPkl/zG0cQ0h2JBGtRw1ExcYHODESGBdCOObHP611VtpsyGDdMRXmrwLi4cKpDl2LODW2wc7KGD9vTgIqkJER/QgiaaDyGH0EEZ9Js3zvW4TdAZm171HH+vlFjw5ysw21fOaZvx7sgPhGfvXYgsuLqO2zceDgEcWcQOkyihgI8QwP6dOCqbJmPzYW/UiX+iK2voiWcGARp8oSKxlmqVCmQuwrXUiuGxWWQ2hwdbpE1MS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(19092799006)(7416014)(10067099003)(56012099006)(261026121527099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/kDM+6EHe9HXRKI0z44dezpUm/OuTvqC8/PRSn0PNKMA31VjPZYbXDqb0+aY?=
 =?us-ascii?Q?XvnG3shIeB6kqcVn1ksoDbs75OVSJJ0HHfauLFgOIpsxBVifK7YqX0nPjKCg?=
 =?us-ascii?Q?a/F/5GCu0JHiVH4YQmYVZMEZrae8+KnkovRSvTCa+AnUrH1prmEtJCRECFHc?=
 =?us-ascii?Q?4hENDV8Q5MLpMPxquCOXnRj2iKr/sltNN15ZgG7I8la5/ufV4jyFI2YWcz10?=
 =?us-ascii?Q?cCaBdqthdpA8iSanzFnfD5xWLt7n/u5D9XIgax6s5/ap6WxXHLGLQ5UKRMjX?=
 =?us-ascii?Q?4jTAFynMmXNIZpC/8n9Ov0rIiOwk31h4iswTX2W+fA4OnPqNHnewGG4CCcGp?=
 =?us-ascii?Q?68pU7eHrS+/rAAUwFDJmrTC7dn+r1bWW/NaaJvAfDb8zJwuToJFxeUHXHlJH?=
 =?us-ascii?Q?LyNqg4FPVbYzgV0wA5IJP0Xet5dJXtnNFduPvi1l4zXu5xpNN21Zdv1RpSVv?=
 =?us-ascii?Q?uVcbgr4Kqz84SfSFj4ld3SvxMOE2CUQhQO0t8Bg6OqNqiky2WIi2giq55jkn?=
 =?us-ascii?Q?QMTvdt88GoN/X6yvdgK14QVFAmT+qgyuqXS+pw9s90tHIqXGmG/HYfsP8YTG?=
 =?us-ascii?Q?nUobvF4apJT/rDoHw57u9NeHIQG9UVd3p2imPIA+4TE0ej7LYHWvW4HjJuQd?=
 =?us-ascii?Q?EwPMnn7JO8cyPadho7DzFm3k0ngqMsz3slOl7fuCh2otOkhLwsh+MwtHDigu?=
 =?us-ascii?Q?No/TzcGOr2ivn20YzRejab2jT91Kw/2H/Bn7O3yxfK580SPvqZ438fJ8Yo/O?=
 =?us-ascii?Q?L6TTjFgYrM8ekFLAzNf4xfqiwEG/CCod0xXIiiBMihIjtAmYYNG1U/MRUrK2?=
 =?us-ascii?Q?lUv9t5RegAVvdGscH4zQPAvpaqqcECFv9JEYEBq0fOL4f1XnwlkXhtDNg8os?=
 =?us-ascii?Q?E2fvW66tKYfuWCp5A6jNp+0UK/Hgwg3cAZY0+lI7hGz9gV4gWMhQc/jtx0Ro?=
 =?us-ascii?Q?rZ3MMVI5CRhU8XIPqKm0E5Hno8BysC0PKd3JB2GragwD5NWzv6incyX1RVyU?=
 =?us-ascii?Q?zS6y4GWsdTIWt+K1tmwi7fL8zXzWFpaUT5WtKVCC3TRMqhsYUd3YACTMDvnO?=
 =?us-ascii?Q?sqiBpKv8KvgtpqFTBfhzQKCvd9xtSN3CCFTCaXtpefVFXK8c0ZK9RUpIZM0W?=
 =?us-ascii?Q?lm3gqmvl82TOHlxweO195z0U1BuxTYeJoZsQ3QTVCTTr3d15GFhzt2JYE68B?=
 =?us-ascii?Q?BgDrwEuyjplF5fB5vhjOH/zdPF7sCjPMS/kl4BIA6x4tnH00LjIBt53ze6xq?=
 =?us-ascii?Q?2170JhbB0463qRXd2Ziix2pSZc/R/FDDtca3xtc0rJanO3SJnqg+H3PJ5rbO?=
 =?us-ascii?Q?dVUL1rIVFK/B/b4yacdLdwtiVEY0g9sqvXH+JkVPzANozaIQpDRdX9z5RKg+?=
 =?us-ascii?Q?XGBZq8aWvB0rQh0Cv6YEW4D09ba2ds3fIukv5Hf3Fjm6VkFKFqflHfEilLUd?=
 =?us-ascii?Q?do8MRubCX1Jmn6Oe2qVzURFn4qe+mPmOq8t/lnQufkxnE9HYlVmCMYtJOCIU?=
 =?us-ascii?Q?3/5z3FGT0IfvosaErgr84L+5wEn9/RJEqcnlrTReEsmoZDALbDOB1DR9Rwyh?=
 =?us-ascii?Q?idvvjq7QddFi1xv1iaQndS/+MOMKb+vDKMjY3E3aaJBBGnLoQqKSxl1dXeOg?=
 =?us-ascii?Q?tkKu59cvchj4pscl45nxGoUMvFVXO65HUTM15st15CPDVHe5Vqz2CzlMBn+l?=
 =?us-ascii?Q?6uYx+VKK6kuk27EDkQBXOi+cgPZTHXd6534Zypl5p9Y3Od4KAlFVxEuCTay+?=
 =?us-ascii?Q?zJ70GBBEqw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2000a1a9-1c05-4d5d-edcf-08df4c7742f4
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 11:12:01.8994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0XfxholMKLZP5Lo23a55dWW165zWnWVaToW7vsxfG+70Ugg8CVVEQRe9iLspgm0gEYvrNHYxj7Nz+SzyCDX/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10850

From: Steven Yang <steven.yang@nxp.com>

The reset-gpios of both ethernet PHYs point to the PHY interrupt lines
instead of the PHY reset lines.

On the FRDM-IMX93 board, the PCAL6524 GPIO expander lines are connected
to the PHYs as follows:

  Expander       Net name (rev B2)  Net name (rev B3)  PHY pin
  P0_4 (line 4)  ENET1_nINT         ENET1_nRST         ENET1 RESET_N
  P1_1 (line 9)  ENET2_nINT         ENET2_nRST         ENET2 RESET_N
  P1_7 (line 15) ENET1_nRST         ENET1_nINT         ENET1 INT_N
  P2_0 (line 16) ENET2_nRST         ENET2_nINT         ENET2 INT_N

In rev B2 of the schematic (SPF-94611), the net names on the expander
side do not match the PHY pins they are connected to, because the
board is assembled with the nRST and nINT nets crossed on the PHY side.
Rev B3 corrects the net names; the wiring is unchanged.

The device tree followed the rev B2 net names and uses lines 15 and 16
as reset-gpios. As a result, the PHY reset sequence toggles the INT_N
pins, while the real RESET_N pins stay deasserted by their pull-ups and
the PHYs are never reset by software.

Use lines 4 and 9, which are connected to the PHY RESET_N pins.

Fixes: eb2f28413e23 ("arm64: dts: freescale: add support for NXP i.MX93 FRDM")
Signed-off-by: Steven Yang <steven.yang@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
Changes since v1:
 - updated commit message with info about rev B3 as discussed in v1
   thread https://lore.kernel.org/imx/7652e6ad-a34c-453b-a461-6105d9c86813@oss.nxp.com/T/#m9665c439ccd322469ac0e1e61ad53ebfee230aef

 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
index 33ed26aafde88..8c7b08894bc0d 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
@@ -145,7 +145,7 @@ ethphy1: ethernet-phy@1 {
 			reg = <1>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <80000>;
-			reset-gpios = <&pcal6524 15 GPIO_ACTIVE_LOW>;
+			reset-gpios = <&pcal6524 4 GPIO_ACTIVE_LOW>;
 			realtek,clkout-disable;
 		};
 	};
@@ -169,7 +169,7 @@ ethphy2: ethernet-phy@2 {
 			reg = <2>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <80000>;
-			reset-gpios = <&pcal6524 16 GPIO_ACTIVE_LOW>;
+			reset-gpios = <&pcal6524 9 GPIO_ACTIVE_LOW>;
 			realtek,clkout-disable;
 		};
 	};
-- 
2.45.2

