Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011003.outbound.protection.outlook.com [40.107.130.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956422868B2
	for <imx@lists.linux.dev>; Fri, 25 Jul 2025 07:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753426916; cv=fail; b=J0cG5nGkRIVne/QxP0+xOTX0D06AfTeTn2P8nW/rdaB3ESR9wafX/BuCSRcUR8+fdAqShL2WJyQ1KP5o8aAsrIwSNNsnm7qf2zSoQyj95bcUEAjgqwQsomckC0ypCq3tHgw6CLAXzZHH8Jk//zsa6nFFwsU4e09AGMwbT6cRjmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753426916; c=relaxed/simple;
	bh=CjYc0jE+BInk+CSZyF75rOOiUl8ovVE3A5bjEy545M0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=CqFlWNVmDRp1Bm3/JPKhoTWZYeAxdhyfmv3ixaartxLeUzTS2wyvJfJm4CnKeD5m/HvyzFufOVRB8mvwk8aq2JfOfSsaKq0W/aocSTIUJow7rmTERx0VNx5OwykGGVJamKeLd6M8l+WzqNR2n5yIYb0gYurZwZsLovPAHmmaiyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d0LV1Ny2; arc=fail smtp.client-ip=40.107.130.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d0LV1Ny2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iNISy7o7LK8EvDqC5bCYZ9rWxi+hSJazlW5TxwCkJmukPxmS1PVWTXhzLUqtZMprC9a6rbfcQquNTSXTDgtFEVAKbW76MI+T+kSta+ckQQn1e6VUYVWGe93vUKn8XBzj0k0WKF4E9RfjPzVBN4J7YlaxsVreQt5dlagqMUyIqyVh2M5AK6HoCoQiuni3Lwr0P5T1QiKMJ6ZAFYRAS0WXKOJwdCnrNGHgWHa0Y7vXqMNjzTZA+thm+rUP1mRFnzDNo0ceh1bfRPzO4PQxvNFIWaGsaajNj7OfRQmlemJ+8vgkQ8/RnqkEUnYzEXZDh4PtVyL2wdD3OLijdCtF72pZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yhw3Juj39lRk/dJZ8hNIZOjLPLQIMt4XhFPFNzVoM+k=;
 b=OtJS4EYoY9G1038eYL8tP2BPxw03XJ4NXi9ufazLwxA4LlntyV3vTwLSIEWPXRgSu562lEBXULjHx4WgWHIZTE4afcxu82+1xwiUqt+ckqhVwQMMRRAnnArGM3aqWlVcA6U+o6NFoQkqlUea/30Df5ph0nYdAO3xc7pqXO0c4HoTV/gNlR1gMEaLXOcak/g0pdwyK7wIHruyeseWpVQhgBWE5sOZWO7mLhh/DBwTlAS9oUSXRrUQO1B0BB7F7Fy8bW71pGTfySg88r/IdyuFXui/U9S+mFhNxHcXmtM+k+zUQ2F3LliYqmPuNnsuDkOmFEGFY/faEHQoZ0M4F3joXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yhw3Juj39lRk/dJZ8hNIZOjLPLQIMt4XhFPFNzVoM+k=;
 b=d0LV1Ny29YRKv8WxZOStBauOKx2fPJ7unCfPmXcfa8lUgfj+byrM//zFNpz0jnLUSocuFkxox90B3B3IZ6RXBNd80R01r26JTGEttIWe5ahN42ZeW5Tzo9q8Oq1456A6x15cfEUcBNQKrug8b1TYhkOiYnddh1MU1R5DALpBnnfU4KV2Q4TNR+iD5+5dwFzJr4tNr4YXw4MxhQZwZAVPP0vC/vJc8/UeYeyTCACR4R9pTlZUFT57/Bfl15HXjjNBMMC6v3gC68fIq/+7QqPThpguYKNQLtpM107U9yekePyVxFLVRDGtQn7V59lvqf+taFQU3sO10Lw3bRmWOdUMsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by AM9PR04MB8383.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 07:01:52 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%5]) with mapi id 15.20.8922.028; Fri, 25 Jul 2025
 07:01:52 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: shawnguo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH] arm64: dts: freescale: Add dma err irq info on imx94
Date: Fri, 25 Jul 2025 15:04:30 +0800
Message-Id: <20250725070430.660644-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:303:8c::15) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|AM9PR04MB8383:EE_
X-MS-Office365-Filtering-Correlation-Id: 63971b8c-264a-437a-fe13-08ddcb4921bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YLVmCkNDI8pj+ejlEdjlWmd/TvZeiqER71YfQnfbc1I/fsjaQ1jRh2TY1XWu?=
 =?us-ascii?Q?usVRuZiwNnk0axq2gDtg72U+mRP3AnhHhYaA8JiqntKhXgjhdCeW31zIkp9q?=
 =?us-ascii?Q?dmYqlfPKli+bXHwilSo8zjqMtda7xfgYUicN43ZMoWjz3KX5ocuvXeyNYMnD?=
 =?us-ascii?Q?+aZl0ogZ7ET9IiQRcl/NKGLp+Ck8/mSyU9CGixgWfnhgZPIlULDZ3TZi/0iO?=
 =?us-ascii?Q?bAecwPRHLfFY+eqmZzZY6/SFEO6bPN8zIFtkPsqTnslgCroUp73iT0SS3+AX?=
 =?us-ascii?Q?cGIWvYUjNOoOCTgrwh/ECD2ZpKtHfUpGL+5XE0ya2qwWi+VEgWWMH1qGy5EX?=
 =?us-ascii?Q?2htfDpn+xE4AsFTAZ6C3/BlDaGKxm/oZe7xP2/xYOMCY1WHgqfb8nQxsKiP3?=
 =?us-ascii?Q?fLrh+gWDJPRj8cDzoF0xT3A4J2K72gyUAHkGqCV1IcsxSfbHDfFt3w4SLCRy?=
 =?us-ascii?Q?UZFFskx+NOu8EoAlPDA6SYDWnWx3iEJ4K7SoP2JbE7ZzEDU0ltkHRn3sLvkp?=
 =?us-ascii?Q?6qgpr5OXK9lv9dQmRQl/bpeMBFFlQRhkkGAQVHxHInh/mqdGcpUweI1hNouw?=
 =?us-ascii?Q?+sHy5H8oiJo1XnMw6h8Ubltml70Z9uQOizrt6bsht7CX5iloy/BMMUbIA1c8?=
 =?us-ascii?Q?I8dd+I5shXnIYbaix5ChU/yVVftg1L0XxYWkbfMVXXLjmvH9dMo0WP86fABJ?=
 =?us-ascii?Q?fIl29kP1J+G52L/PVmqZS5z82hKGLjENegjt+phodsQj+DaHj5H8pO3saXpM?=
 =?us-ascii?Q?qvafbg3iY/EE2qi/iSE3ZvPUZ/ZoA45fvbQCCBcEi/bbUButFcGP3LcFi1TC?=
 =?us-ascii?Q?FZKGoi6woYPnYCwvXpQWCqssRPle0q+TV2WOQWMNmmC8MTAWWc29/kdHpkuE?=
 =?us-ascii?Q?1rSi7WuMzREgLUgL0fSbATL45XsSTcXWr19eHzGKX1Gxwa6h70Km3mKmflXM?=
 =?us-ascii?Q?0DitIyqt2zBnggM1YLGXojzFakBKPpzNXadt1SRO4F2770nXu5vdhXeYI8Zj?=
 =?us-ascii?Q?22SHVmrPmz3PoJM0gWN2YaskcF9E+ErS03fkMUQGVUBNpKNxoNZpWCfD5B0H?=
 =?us-ascii?Q?Epao2BpFZRimON6jzROs5UcPoxTbEyXpd0BXv1+ZR8j5BsiiRt1oLRd3gQaT?=
 =?us-ascii?Q?NsWRy8Qs8bTHmGBvsqZ+NcZN9dTbLqx8pxjdXw2JnIk3CoVS9L7gpC49YQ/i?=
 =?us-ascii?Q?BMoirdDGoGZk+Xril9DNxLRW4/yh6B55hsyXaNN6vIQoCsHtZOm0byqftr/z?=
 =?us-ascii?Q?GuxL8OEqbOoVVBHEEMFIdWaRm2wx0IAenru66kPoocdfM8FzfnQui1FhYVk4?=
 =?us-ascii?Q?mBhxZNFuBXjpDv525tTgO0HvflDcamgMqbj79kulTCbPlekMhXqxABY9Bo7w?=
 =?us-ascii?Q?Z96wSg+vpJxRE1qnndxSEB+mZ8DvFhTODRUSjMHEk8ESq0mBba/v13bkTutr?=
 =?us-ascii?Q?enJ5F1qWYxVYNZReOf9SZKxNxv45vTBr0GmMs82ftI8r7VKJwk+ayQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cQ5qeqA4YQhc0QCG6QAnb5D1/rM+R6Fa5grT+ZGvgs+kzhJnQPqpt3PTq6Vn?=
 =?us-ascii?Q?QSGw6wohmSyqBq02GWEScntbaA7Y3+IFntEfKRp4TP27H2UavnYQFMcHdpG/?=
 =?us-ascii?Q?KzlN9WAUdDbY1TNHxVYcVTmxP4dRgJ00a1nMBQqXOOflrzIwnvQZwrUE5flz?=
 =?us-ascii?Q?aEHjQO3AcMdcTzIo6meU5IHJYFLpYEyC++CHnUqzdK7xBbJSmkjFDtNQqNwN?=
 =?us-ascii?Q?qnYGw2MpbhuxDKdaRy+H2YTSZZ1fyJ5MNFGEcE3fvmJNpRvom4hIw7SD29TF?=
 =?us-ascii?Q?LqjPILHFayDYRbgJUGq/yLV6m6/K6Kv3GQrOVMOFq/8A0ktSlf5ih2N6G+9C?=
 =?us-ascii?Q?u8lZU8KwZKlY41WryIidOLJgC82tNccrPQa1RTy6UWwnOUfm3lQ4lOl/CzeN?=
 =?us-ascii?Q?Jh1Us7NN20iW8NSWk5DKCMjiW61ZawLx3WIt/7Z50e1nscrQ3vK99kHfTSyz?=
 =?us-ascii?Q?S1sLl2yUFUlhX/OEmyAjFjtrdJ/JonBgqjDvte1DOVD7Pe4jvDb3B5UXzQMd?=
 =?us-ascii?Q?4cFj1DsBkXaUiV6XmDA+nF+w2/wkUp+c3UxXC1we7kUts7wjoWQaltaoPtGS?=
 =?us-ascii?Q?oN3eNnLZdRlqdiATlRYQ6yNL28v8s9/FyCGJFQ8/57cCjwyooTta1ybgn7Gc?=
 =?us-ascii?Q?c9cemeABpAcPwnhNIYElgHhRsRoOzR1KBDoW3ygRY0HovKtSa0iSLqwdN+mn?=
 =?us-ascii?Q?NzY28Iw1cOKbzBIMR+t4iq99WNdBNmyv43VO5+dxNsjUE8IEsP67czOjJ0gv?=
 =?us-ascii?Q?eJbopZd5OC8eG8o1OzAfHsHB7ER/OBQQZcubnoAmx+QeBd/v22Tl/eKYl68Z?=
 =?us-ascii?Q?oh+gexmW/AcvVSWEzoN2VecCZyVa0NqKIfPjJrKeq6h/n0lEPBE7DVhRfNjP?=
 =?us-ascii?Q?C492q9ST0UGWZQcKC6tmXqqOdoRplPnOZJO9GKM94KkLKWh1BQG5sJ1tDxbn?=
 =?us-ascii?Q?UXIm1yPM+t3KNIbIuQ7It26l1YHik6DgUdE+oQM91Tm+xD2ZXgk4Z0h3J1jz?=
 =?us-ascii?Q?3LTnmG0I/gMKmFL9JwFRE/Qc94A24cFsvsahQaO0JfWQQ4Tw+m/CX5XY255T?=
 =?us-ascii?Q?7i73mIDKWWo/+w3w0jyo2i4mWCkQwHofn3MhbGTUP4NijKuyz6LS+pVOO6yr?=
 =?us-ascii?Q?/gry85UsWUs6M1ia+ZsYGaUkkz53lBMi8VrgWCAiGbICJUW4olruASOHJjmZ?=
 =?us-ascii?Q?vRqWkLFqebBApK1RJFi+QNiqDoqRL7isDKI6WLFP535Q4URJMRpAqq/uXPWE?=
 =?us-ascii?Q?bZQ2ZQwuYlfjjLxMjhzi05OVvwqRxUkn/DFqAm6CHZlFJMx+qTlzzbITsOgO?=
 =?us-ascii?Q?4GDp++E1NAUASad5FCzTRjKO7FyOGu2RDAJ80Ax1uMOvcniCxC5gCkssgqPb?=
 =?us-ascii?Q?ZDsZz47BU3QtXhDLnG/hDcN8ziqwC8+7dD0JqvABFQmgM+VDrR29YKUskMHK?=
 =?us-ascii?Q?/AHW8EhHAwXWdCW9hiMCRS1NqHXyHWT+vCjo/6W44p4cDBdAYwuCwORvWpf6?=
 =?us-ascii?Q?tbIUxuSoaYIhWg3/lwlOhhuByvWU+Lb26Jwe7tzXIELv0i1+Qkf9/NN2FdlV?=
 =?us-ascii?Q?kFmKSOYCFbbXhM7+TWsU/OH/YIN9NWI4ul0aoZEw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63971b8c-264a-437a-fe13-08ddcb4921bd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 07:01:51.9706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vNubFmd3YHvKoB9Cyw4c2S4+iCKQhAfnkr8nSNR97nP7tYB4x79hw3kq+E3aHy5989RZHzW1rpCHwjzRCf1d6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8383

Add the err irq info for edma2 and edma4. These two err irq are
connected to the GIC directly, not irqsteer.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 44dee2cbd42d..d4a880496b0e 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -212,7 +212,8 @@ edma2: dma-controller@42000000 {
 						      <&a55_irqsteer 88>, <&a55_irqsteer 89>,
 						      <&a55_irqsteer 90>, <&a55_irqsteer 91>,
 						      <&a55_irqsteer 92>, <&a55_irqsteer 93>,
-						      <&a55_irqsteer 94>, <&a55_irqsteer 95>;
+						      <&a55_irqsteer 94>, <&a55_irqsteer 95>,
+						      <&gic GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
 			mu10: mailbox@42430000 {
@@ -619,7 +620,8 @@ edma4: dma-controller@42df0000 {
 						      <&a55_irqsteer 216>, <&a55_irqsteer 217>,
 						      <&a55_irqsteer 218>, <&a55_irqsteer 219>,
 						      <&a55_irqsteer 220>, <&a55_irqsteer 221>,
-						      <&a55_irqsteer 222>, <&a55_irqsteer 223>;
+						      <&a55_irqsteer 222>, <&a55_irqsteer 223>,
+						      <&gic GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
 
-- 
2.34.1

