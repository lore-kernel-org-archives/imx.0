Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011004.outbound.protection.outlook.com [52.101.70.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5663FB042
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 12:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290034; cv=fail; b=KIZunMAY3oo7qiSY1n5xXiA7erRFJppOuJC/m7iUBxtu7LxMpXAxc6dN302UMGuj4JGVMwAsncpdJIztaB0iFrhnSQ851/9EYh4FoLNEER3Y7odE4Fvv5nOOivDbwCqqnHvDdVDX2j3iGnesaBowyYAJsMlUGte8dNgXIea8/yY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290034; c=relaxed/simple;
	bh=5HjNhSiSmY1uhTc3n52s8BJzZuKwCflz1oaVykN02Ng=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r/ZtWSqlap19jWkkBFX8zsBMLUFDY51fmwGwoYLDVr7Fkx+2hvlIkAuLAwtZi5veIkJQPfS9tG5Av24UeD4K6FvvWfxDHuKqmtuhxlbV9g+riDiDMb7OnlMBjOq0rSsPnSj93w49CPYKZ6OWbyvfUrGUde5g6f8AzQWM2Jta5j4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V9lBmIQr; arc=fail smtp.client-ip=52.101.70.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V9lBmIQr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wP5Fj66wqq0881rPmIcdqPHIb7vov7o+b8ZOrvJyXMF71ryQ6se9IuXMtLHP7h/cbQrZLX5VmHBj5AbAIJoOjgpZvYzGOs7XsETLY4zuOlufCRb0Apuuh8Xz6PwQjND8ww2jp1VsvtIFU0sx7QrEREieSBbqLDFfr68tdRLB9GEAwY7pmmjFz+fRkmwTqbSkggQsM64rczUUNcXj0BegfLmUhHkd1SBrbywfqu6o353SAQ02u5yym59yPhTwWC4BhLqhxqOMNo/2l9TiXcExmB85QvmiEukdjT9b72LeKXdeMrljVOYRV84rSoX8ORedmsoh1HOF8LCv+zB+mgaE/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glJJmp8pI5KvMl0ix2IpOE9clbEPyYS2LWpiIVB908U=;
 b=cKSoszP86UEgruTdhlvquJNo297ll6uIk1nCfx9h/Q1ADBsIF8zqcVFGErz3wdyRaVoJQzKrGwgwBzTWgcoGNGQ83A9W4Pg4/0hAx8aAcG/l6s71929ZNX17eF2IDCIa3nWIUs0sD+EkGBqZ8KbIp0UURpQ0qnFt9lSSzwW8jip5X+FO/4sWEMg49bqLlwaqlOcVwcriunnjYpgBK5rS25dWJo8KoquOCvqUUp4QGdEWAEP0Nrh4093nnkW85oTtN9jHDnERtOEjBJ5YRxmEhlrfDZolC6iI/NYrh7JJcC71Bm6Fi/8Ho4Kx4jCOrdlB8xJidCqnCoi0j8GzUaUQPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glJJmp8pI5KvMl0ix2IpOE9clbEPyYS2LWpiIVB908U=;
 b=V9lBmIQrJQpvSZvPsPw+N2zwTnoIj9IiWlEHqYZDIbz3eYuStFD9sLlawmbs/0FNPNZ/eqI3ReLKV2W4Qyrlyw8ej0tWADk68yzhw1Izij/KZlDBfalg7oKniyTue9CwYCwbTdKYDtH2h8ldQzLbXHV3ckDNMLcQEbwqu+656ss9hV1OKdNlG24hw1Bwq/SqKofaUgTmpngbFOfvI9lWtqmgo/AJtt/QEgHZ+iBRbmpnDrlBfJnhYO0yABN3L25t94gzKfS8tyNfPiB5JuKfdS3MHGafeVTk4WJPhnocxlgMF0eVGoUjZcwHwYv7mjM36IM8PieMkHN+jRwSwvDk0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by GV2PR04MB11863.eurprd04.prod.outlook.com
 (2603:10a6:150:2f9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Fri, 17 Jul
 2026 12:07:08 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 12:07:08 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux@ew.tq-group.com
Subject: [PATCH v3 09/11] arm64: dts: ls1046a: describe the Lynx 10G SerDes blocks
Date: Fri, 17 Jul 2026 15:06:33 +0300
Message-Id: <20260717120635.2118610-10-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
References: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::6) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|GV2PR04MB11863:EE_
X-MS-Office365-Filtering-Correlation-Id: 08fb8ab4-d75d-4de6-5be6-08dee3fbecae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|23010399003|366016|10067099003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	BbpZ42wGG3RmRZfNFH2UvFyEbw5a7f9pqnZF0q3LY+8V2dcLVRJpSctSzxki560ud588Of0eErbunVr4kJG1IuAjPe7Y8sqL6ne5Ppr00kLpXhgMyLYHEhG1AVPEAdD/VuoKo4p8TVclTzZVJBgvjyR0tdfJW1sJjtxDJU6FsaUa6txqWAu9n3ahdyryQsnGzhuBFJ0Xve70xZg62j5V0sn0NCGKtE5ahLQI1eLUvyjzVWrGSS4HSvtax3DfQbwER1rmt0mHmNQXoDzSjJjtRrLk+JVLOw9X0VR3oeeTPo47iSePjCZsA7CznGgu0qtRQO3gy1WpgbjICRoP/dL8XFPoGQkQzyONc/sc6jXUdEs0HQyIyTfOSY//nI7Y4RxwJfGo4QowwoQ672yKLkUX3YdCGZehMs4rwqmwW7RZ/Y/RaELas5LfOI66C5XNGpFSkNsFAu2njFvwA6EthgQWfIvIX7u7qJcEcBzBvbfqyDFm1LUIkVKXoHAF+hPUbbRrO3AGHjd89Pyy+1g05XQ10E7wyPVXFL0iN4RWxhU2WOjNp7ZdsW1KDJxwJRD3ga3GLH0zI+nxLj2UuY5MtOwYQ1v+t+D2yUTd/3nJwkyvTZUDHhBGW6gSKTiNLpi/EuE8DHOMeIn9lrk5iHTuLNBtl+mVOPZEbe6gDHMGtiJa4i8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4hAiKIlFkfS2FBDKEgwg82l0fiR+EGtxsxd4rmaUpLdZFqg1NLbc+m4ryq4k?=
 =?us-ascii?Q?2nT5vrRxNThGvfHF11f90wxjT8Iqa++IdEab1ahF1E6ATZg79ctfVN11Akxe?=
 =?us-ascii?Q?J3g1WyNiQEeSXa2LAPX/mYVdF+IQPB7C7sFN37b7m6ob+TXUGO+11dERG73o?=
 =?us-ascii?Q?+mLnB33i5YWr92EUnDSljyWKIYgzDQTVhHBjE1HGublCCKu82xn9S9Bhq+CC?=
 =?us-ascii?Q?WXRlcNwPB92Lh7iP5t0YAWObhcl+LHC6ZgryOx2ZaARfd2nhpg2p2ObzqKGu?=
 =?us-ascii?Q?VPOeJCf3GIzqy9VHmi91uCUwG415GeHxCgOINywTTHb0dSfPK9Af2QZ7uJzk?=
 =?us-ascii?Q?Ro2erwWA8Vi6qQcHT/7QQK2GgXTp4vZ50IU337IOfy56FDOVrxWgY0VASMQt?=
 =?us-ascii?Q?W4ficyIfDM3NCMrnbm1lQwlaOM/Da4qC2fofl4MPIMWp7tUpsXRQ7VFQ00Wy?=
 =?us-ascii?Q?2enKMW2cEcv+E8IuMxtWRwQCwNJn6keF7b1HGnwjqLYK1meFSKPXotxJdTB7?=
 =?us-ascii?Q?WNjXFdYHziZu6TuzAlOScmurA8Mwqr37EKMpnd8rxKdKsF/5/bbUeBgj3IjH?=
 =?us-ascii?Q?1LM+iPzKhQ/e0QiHni/1aU05I8PdDze9dpAkuY0pK/F8maLXXT3ryouGn8U0?=
 =?us-ascii?Q?shJ1xZPIsd4J/51arZYqMOozUc1yCFeHmAJcD1sxMYRRv6DNYx2AoZWYE1uv?=
 =?us-ascii?Q?ozZdOg/zBQIlSnHdtThmfC8PhEWiJ6IczgnRB/eF3CMFS+uZru7crT59pVCQ?=
 =?us-ascii?Q?M1jxqnBRLkGTjT51TQgjTxueZeE06RuVIvBL3rdFYbg/fx7Dg4CYbm6m8/d/?=
 =?us-ascii?Q?0TqPrFDpeoREHr1A2wanJ4QNxjXx4w1dQYrVkPJf54gK1xZMvPffFdLzYs+P?=
 =?us-ascii?Q?4x2/jHDDhI3NC62ObBNyXNZ61V+KUuXi3bSKuJ0KdQ4oItANUinF4yQA9hGe?=
 =?us-ascii?Q?RUn0FHEM/hWbKsRebQVluvvnzhwcjbw/11q4WhXC+Xb2TZfwUrrwrzzS5vLY?=
 =?us-ascii?Q?NlyyDN0XA2FXmV5lDni2TgjyqSjmY7sqZTAiQeK3ZAnh82Oivm1fNhkO3S1z?=
 =?us-ascii?Q?8m5asVvyySgEx8Rg9yE0EcONCVWcll3ZdHbb78JcTh+C8SWD569hnnRGyFuu?=
 =?us-ascii?Q?fAQaWBAgtcGIGg7A+lm8fEUYxDx2POuoC7GImHLt0PaSrgYl0saKHbtNB8/Q?=
 =?us-ascii?Q?DorWCbDcpxxacHU3JnyJ0p3AeByH90Ao/+1rsmY8TtL6ScPlMEwqYwgaiqHZ?=
 =?us-ascii?Q?3GLlG2ibp14AhzCltq3IElV/ylfilDzCQP/ipYIbd5EXyybAmhu8IAUqzMbZ?=
 =?us-ascii?Q?ZleRYUuliRUa6D6ki7bemiYhZEg17DmLXoXOQYqG7PSXD6wCxZ5fpLGAGNWL?=
 =?us-ascii?Q?9BtjVCO1uBAG7AhhJtKbvYFsGp14HWXO4PtZKaCa5RgFwuK4eo4c4gmi0VHx?=
 =?us-ascii?Q?HoL/uItN9IWR9mdCWKXe9S4r+Ut2ZneH+Xlyd4wrN9tpGn/gfY/cUZnwNZRE?=
 =?us-ascii?Q?ahqGmb+q6rINTsLQTMFG/WEIiU0P6bYPPxJsqSFm/14LQiI90yECq5jnL2Qw?=
 =?us-ascii?Q?F1cZdUWxUm+tyHMRjwLrWQJqD5tbQDTaxX6fpcDtTUYni3oZK34jU8sec8aG?=
 =?us-ascii?Q?+dTx/0jS9Ob7Dh5bEEE3YzJMrH8XMdhfDSm58OFUZM7sJDGl2RH8NiMQo9Gz?=
 =?us-ascii?Q?AZW+O3y3YdeUUyzIhepZ7kGrUo6GMGx+IGsWVO8b2vH+Ld9OCq9ud/F1wcrU?=
 =?us-ascii?Q?Cs8gCEbqKg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08fb8ab4-d75d-4de6-5be6-08dee3fbecae
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 12:07:08.1939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehTydpRvXjf0CKZGfnLoo1svq+XK0A//jyp5fcqAIHpXgi+eHF1jI2Uk1Jm+BaOF4dGFvLjS9kuBdS5jrhlgdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11863

From: Vladimir Oltean <vladimir.oltean@nxp.com>

Describe the two Lynx 10G SerDes blocks and their associated lanes found
on the LS1046A SoC. The nodes are left disabled at the SoC level; board
DTs will be expected to enable them once the consumer Ethernet nodes
appear.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
- None

Changes in v2:
- Change the size of the region to 0x2000
---
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 6fefe837f434..270a97711a69 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -424,6 +424,66 @@ sfp: efuse@1e80000 {
 			clock-names = "sfp";
 		};
 
+		serdes1: phy@1ea0000 {
+			compatible = "fsl,ls1046a-serdes1";
+			reg = <0x00 0x1ea0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			big-endian;
+			status = "disabled";
+
+			serdes1_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+		};
+
+		serdes2: phy@1eb0000 {
+			compatible = "fsl,ls1046a-serdes2";
+			reg = <0x00 0x1eb0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			big-endian;
+			status = "disabled";
+
+			serdes2_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+		};
+
 		dcfg: dcfg@1ee0000 {
 			compatible = "fsl,ls1046a-dcfg", "syscon";
 			reg = <0x0 0x1ee0000 0x0 0x1000>;
-- 
2.25.1

