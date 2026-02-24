Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8280036E465
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771926268; cv=fail; b=pW3t1jGIADlKyi+L7iqnxUqug6ogI6kLejIP6TsvN41BDO4lhPscy3cn9hd7y7lQ3mKeVYWVMIZ+PtfEiRoZuPFTEPSCnDMCGoS6Ts7RH40Ur/jk01uAhhbqPCKxv3XLYzg87KxqcbTV1/yYmqqr9yI2u1rjCaTnW+KOoVUDi4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771926268; c=relaxed/simple;
	bh=kp5EucaGBQv7O6522/m860l22rZt72EfVTlGpmGdLEM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EIIBZjSBjAInJEeSCD/MlhTg+01f7MZb60v/CpHsyd0QEVzQJTLLMt21dOZAiaxk/A3zAIPD4oWUK8DJAuHb0w9W6gNy0fEVNzXpReMT0qnX+71HVIVifKbRGOy46FFA0w8TQ4dQLsA5d5/8X0kmPi+jbtzPqQMQFD0Ykr3xkIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RBsqGWps; arc=fail smtp.client-ip=52.101.69.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RBsqGWps"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQvD5xCkthSI6b/hNrA87ZxsPzFz8XO2n1lKL18gkoGqq488F17IEqEw9OxQLIUxWrnNdVGe6jOxrjUIo09aAyotJFfKociIA75lvYDnOlHANIbHWBs9INwVvXy+HMxukLQnwqIBDl0Jm0gjqljl9DPoqtizQyr9sO8pQj+Jq9CHVj9Ez+1jl2bVQCNElk4yXOLKTckKhbtvzAFZaHmW8/sShra9oicR641hs9QlT0YrKbjcd1GkMh5PyMH/7LmWqduc//hy2l5NYw4G03LCv09bc9K6CYvPmZzpTnynQXmwcXEi88b1zfFMzFgFUvbf2I98aA5Y+2pWpqvcUvgABA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWcpBezkrQNxjapPE/TS0mMu7HoIXmfm0uA3Abkpu78=;
 b=X2wHq8VuZ+rHItX7qOsBBm+8pFZbPwFEbMHA6CklkicmSBbWdwXyioZkgBM94biucZdJnm5G6PGS4dQbMD67ecnEDyAi6SiS0pDyOZMC5Z4EGpfxitZRlNm8+3oJRrEJb/dPTlm/0p2SRUNH375bwDAe4GS+8yLwcO2r67VKn+S9tzPq5HfhUZTdnt1fNS1wxJmHyGh+nxQSarj3eabZHJ/OwYy0s3ZdHqvBuFSWbRztx/Pux87bt+ljjQjHbRisE8kYP0BIkgVbwGRm1UBH95bZnhcu6MlrPXYeuKjl6B7e1zNxYYwMHQyMJuiux/Ur8P6CzHEViDyf5c+L6LLP6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWcpBezkrQNxjapPE/TS0mMu7HoIXmfm0uA3Abkpu78=;
 b=RBsqGWpsjXoQnejA9XLDaK48E/Ue4T/kI+CXWP2T5YaBWw6DzNN6QVbIlKWUaTtkCF2+X5O87QvUAOPqEGl8NX8Uz1bcgDoqMefqnmrrOOO1IqZKn1CyFD1gR+4HUHnvusdw/gFNSWpN7ORUO4Gix4JgSI4+njROAhi+iWBFl04N5rugQm5MwQi+NJdwIYMqBUQG+93VDOHu3E6/vJa3MB1ZZGdfDaFL2nL53sFe/4LGoSSDvEFCJGBKK7w4sjrCH7ZLeTUNE8pfSI19tMjweg9wRuBVCqRmqktPUIRxp4M+7nTolUK1foL7OUiZnx1NFpXfv1HQviN3s45YNN76LQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GV2PR04MB11325.eurprd04.prod.outlook.com (2603:10a6:150:2a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 09:44:20 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 09:44:20 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH  2/2] arm64: dts: add support for NXP i.MX8MP audio board (version 2)
Date: Tue, 24 Feb 2026 17:45:27 +0800
Message-Id: <20260224094527.169215-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260224094527.169215-1-shengjiu.wang@nxp.com>
References: <20260224094527.169215-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0067.apcprd02.prod.outlook.com
 (2603:1096:4:54::31) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GV2PR04MB11325:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b90aef-02fd-448f-efc1-08de7389489d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?vFSDlhp0O8bUsmHVELnxJChCp9JCMlTsYa8VOcXkxTC/NorXWMcF1vHYwltU?=
 =?us-ascii?Q?qd5+gz6dAPiN/Vn/l2/JmFgPyQ/Q+DDUjqjJvQ5GHNiOq0PfjQmw6kvOk1Df?=
 =?us-ascii?Q?45ohXlm0UjKVhfWOWUQWB8nZN+tN+uzQcXHYn6Y2r3VIfHsbAzkI6W8h8SAO?=
 =?us-ascii?Q?64dMAWYNVH+H9S7r66X6aFQNo0Jvq0PvDH+4Peb9rSmUpbZOV7wLWG+BqTEa?=
 =?us-ascii?Q?dcnloSXlQBBZJygYteXyloyVpdpBpl7jfxxdMTU5r71GQdRIRXF/STmcMIHh?=
 =?us-ascii?Q?557+BWjgMYzRKVUqqJAdFX9qbuSoS0VXcFmSGl7s3nGubK7NDDsPdV7338qc?=
 =?us-ascii?Q?t71bCC/lVQzfa+xq7G+sBlT2RZJ5JgK27ihiSpbbvOKyEtgtwtcaD7Oq/bPu?=
 =?us-ascii?Q?HU2xfRJEnAB4pLN/qAwPhIMFYyCntdabERPiJ04O4S+hiPD/feWiJj2eo7Yu?=
 =?us-ascii?Q?S1P92eErQhprjky851VGd9wCnZWzHxX2eFsygxvpzZfJWheHIWwQaztwyha0?=
 =?us-ascii?Q?hpoqwjn1WykEnySezU7si6a6LBv0zUq+1Ls68JZLMHxpRBBy0pgUPK9bYUNh?=
 =?us-ascii?Q?+hpyWwyp9iR7RFCPhghbNd/KaY/55RiGy5RlUVy6o1oYbJqtU0YQAfVwNH2J?=
 =?us-ascii?Q?Dh0FnpmHe7j+X0C/kaYY9CEsXjnHStv1ci81qYyFVtq3/ZzSWxooAMSiPyet?=
 =?us-ascii?Q?KvWaI3ef7CD6hWc2nWJBJazq8sjwy/2s6OxGBL2a6y1qZn9L2zXKziAMdZLw?=
 =?us-ascii?Q?o66y0lrZRGCab7lepWB/uY26XZhSstCBHLvK0n+eh6oNNqw25x6x1WAYu66m?=
 =?us-ascii?Q?l9L+ePFtdeEGgXvhRr5hjass78g0UoiUvAeraIMwU1LvJYSQLb6HSRG2t78I?=
 =?us-ascii?Q?VvH6stIQy1Sf/1+GRvPZcmBENAnYzIi1dchHZq+kBPUi7vp5g9HndZQKpj00?=
 =?us-ascii?Q?wHni0B3kKnsG6ydolxB6Xz+oA8eMrB5AFVjkfPApcpeRanjxpouVhsMLbclF?=
 =?us-ascii?Q?movQ3cz3SF9kRoJxoJy0sGDvCuUtAEqjm56TaisyxX4qYbQEQcWuZMywgMQl?=
 =?us-ascii?Q?cbQ7gQkFInsf8SPN2GWMuFI3ZP65QXcDYAAaHrKgp6ZdWCV3NixmZDNE+Ni2?=
 =?us-ascii?Q?rbuMklSgJo3v2Cgdf21XUT2woNd9+5BA5PhN6RahnObxAAYjMNW0jrJdeTar?=
 =?us-ascii?Q?FMjRaCfNloaIvk0pRnd0/8NYMqRCZ3klsbySKRSyzPxOAYwide/gRoY30G1/?=
 =?us-ascii?Q?zRTOS3t++xp43ROJkMfkU1eJ7NusKChma6zobNblU7IN5xo8xabF7xfRsZJb?=
 =?us-ascii?Q?1TWWYkPKqcIs56reK6Xe2cVyXS1+uiAN66pNbsv0U/7vRzfHoXS08ZQOSi+F?=
 =?us-ascii?Q?yxpRFYg4eVRtm8Sf86Q3+e+YHJ5Znjp/Pt8dF335//8gjjC8CfwPAYGAJNAc?=
 =?us-ascii?Q?hYDFKh9RquiApvbTkNKQKVb1S88eijc2AVMD2b/RoVs6ba6s9w4S9pQjWbT3?=
 =?us-ascii?Q?0mGuo8M5fqNfGWzUd//LCj1PcQUwDo/fwtG4dx/Ju1XQrRuCE/2D4DqLCkwX?=
 =?us-ascii?Q?ezu9P00un/Mw9+w+dIXR1t3KHITtcMuhdpxQv44XxZ+SYsGU+bhD115o6E8D?=
 =?us-ascii?Q?ELLfT2CGBp30P8ypsh6HXhd+lgbuKTYsTQwKlJ2naqc4?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?R2TD3A5UOppda53LHiQua7QxpNhXeRRzIqMtdQthE7dfg861/ukpJy/FPSqI?=
 =?us-ascii?Q?lAWZs8tZ6vLM8naEolOsHvfkn27qnStbVFu3JI31Ubf4eNq1Il69Z3lTdf7N?=
 =?us-ascii?Q?x9+8dL1ozRe46i/05IkY/sG2TaT1Xi85oOMC9/AWPWa6BDP+PuxGfTCACFwd?=
 =?us-ascii?Q?iCyOT4PGhOQ3j4pij/JD7f0vhThKmXBmlWc5sJJgQ7VEyCefKDWqP3ZsfXRs?=
 =?us-ascii?Q?kHg6adryZCxenrVinpqj8EOFn8UTIdoIE4b/hZfqgAT69n7mQtGJjW/m/2nW?=
 =?us-ascii?Q?0Fhon+D9tHAfoZJXq/whoWX9sH+C4S2YpYfM7GkLPPO0lq+OTB2mkbnWVuJj?=
 =?us-ascii?Q?6A0Nly5Pr82igEbQGPn7az1moyMjzikgSB5a6i8bU6hBe5/ZiluETFfDYU+v?=
 =?us-ascii?Q?vxiXJJQ+vi0JrO/92Agu99RqZmMhTjbpeA9+SXTsWwrxUNPTlDK32+NFLVbL?=
 =?us-ascii?Q?pVvxcYYGEgZSw3UNbx8sND8PqL6or4HuW1BAIETUBRF/hz9uJ+rmFI1BPcml?=
 =?us-ascii?Q?koqVZwEHaXZil3whtj3ZL5ypEmeK1pTneGsoLB/ED7hJrsXvNuN/BZICBepq?=
 =?us-ascii?Q?uJXc6+OPVPPL9Gdy7yeE29izX1mlHk0rjjfYRKU8qtaSh3AeFzbKVMifT4gw?=
 =?us-ascii?Q?rNZbgQvxNGSgzY1fVE1/7RJ9mlQSk5rT4E79Ly6bGJcgUvlf+IAYyNIxNZyd?=
 =?us-ascii?Q?GZrdrLLCrtnpzqIUqyS2VYo2kSBsTGfAgrtgPNwAv6H4MrPzr5UWlkTT5dTX?=
 =?us-ascii?Q?hEQLYU8MWHI/uT2iRcSC82oxLqi/45sbtml8JcwVZA/I4RkqP4MPFTKw4Qwv?=
 =?us-ascii?Q?ez9d0QP429DbY38qJmFzvGpkW4RDoQrkdYgXaFbYKNC0GvdRo8mOsEfQ1WOg?=
 =?us-ascii?Q?FNsl2KyKZIh72C4clcDVN6CTS/Lt4jjcxsRvW4jGjLdXa7Gv7FNmhLKX1NDt?=
 =?us-ascii?Q?Z39FdGHlMrsJsB8flmu3VEU+EGPiAs9tv1dNb2U/z3woWMBNMfRkZDJ5ZC7W?=
 =?us-ascii?Q?DUnSHdtoB6zmqV1sZCnFpZ/rEQfl4bE42CV0218hESLvM10KpsAXpedtGk7d?=
 =?us-ascii?Q?TvqJzvacIEgskGdMxgVA7kZvNDR4Kv5cdoysx6jtV1rMw7o2gq9HjCeICzNc?=
 =?us-ascii?Q?2UhDg5jtAGOjoIO9mnQ9k0n+EV2dmuO1ky1OHJ6NijyDgWJJ2vaRR3OJAi6r?=
 =?us-ascii?Q?cQKnzxmWAUYfUk8Niph1fUS/u1A9GCLk4TZ+H2/Ku8z3hxvM3x3lmaYT0820?=
 =?us-ascii?Q?dypcUYIrEiu+Bl0NSd7Z7pOgCq5aBoh9kvjSuYE8sIblJAgnt+SgsO6tjhPX?=
 =?us-ascii?Q?LmGekQRSsEsaGvod7PUI6RPHDBeAjGQgPP4fW3ZP83RGgOBOi8omviY8ulQH?=
 =?us-ascii?Q?SEPciwbDqKa76dfMKbY40uVbWvz6UQqO7tW5UMp+POlGIKNZV/kWxcy3x/cD?=
 =?us-ascii?Q?dh15ZYIqQF7td19DtbfCEsnsvr5nATOlBivbYfEVnOws08iRY3eNzGXFjtZy?=
 =?us-ascii?Q?9+/N9ZtvkJAU3cj5cIBIc4dBbKJsqOKc7IZAlxkKCXGYIplnHwimDj25XFp4?=
 =?us-ascii?Q?nSP6lThKupf1M9stFKavm5RTf/k0Y3IwI8hpNFwGbZAP0ugu/0OVAIL4rfKQ?=
 =?us-ascii?Q?gbfMlbtFXz4QUVZdjK1jV7AGQjenyqERfmRHHqoN06I2VZQ7/xSfNAeboXnB?=
 =?us-ascii?Q?tmWyF/3+R4zJ+MuNrNMnHtgBkRCRNjaznPAPpNtJQ5TdQUxiZOZylmT2By3Q?=
 =?us-ascii?Q?YDkygvz4ZQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b90aef-02fd-448f-efc1-08de7389489d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:44:20.3062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XdmZctQk9EtUAmWwL+X250eQ/aCsPrHk8l8ofndXYMyEgX8a74Ryh1gqx9iVLG95HPWK785/BvK1YajcS1VtPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11325

i.MX Audio Board is a configurable and functional audio processing
platform. Integrating a variety of audio input and output interfaces into
the system, the i.MX Audio Board supports HDMI input, HDMI eARC,
S/PDIF I/O, 2-ch ADC line-in, 24-ch DAC line-out and more. Based on these
features, rich audio application cases can be realized.

This is a basic device tree supporting with i.MX8M Plus SoC and Audio
board (version 2).

- Quad Cortex-A53
- 6GB LPDDR4 DRAM
- PCA9450C PMIC with regulators
- NXP PCAL6416 GPIO expanders
- RGB LEDs via GPIO expander
- I2C1, I2C2, I2C3 controllers
- UART2 (console) and UART3 (with RTS/CTS)
- USDHC3 (8-bit eMMC)
- SNVS power key (onboard power button)
- Three DAC (AK4458)
- One ADC (AK5552)

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile       |   1 +
 arch/arm64/boot/dts/freescale/imx8mp-ab2.dts | 941 +++++++++++++++++++
 2 files changed, 942 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ab2.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 700bab4d3e60..271333059514 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -217,6 +217,7 @@ imx8mn-tqma8mqnl-mba8mx-usbotg-dtbs += imx8mn-tqma8mqnl-mba8mx.dtb imx8mn-tqma8m
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx-usbotg.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-ab2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-adpismarc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-helios.dtb
 imx8mp-aristainetos3-helios-lvds-dtbs += imx8mp-aristainetos3-helios.dtb imx8mp-aristainetos3-helios-lvds.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts b/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
new file mode 100644
index 000000000000..af1676fcb69e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
@@ -0,0 +1,941 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2020-2026 NXP
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/usb/pd.h>
+#include "imx8mp.dtsi"
+
+/ {
+	compatible = "fsl,imx8mp-ab2", "fsl,imx8mp";
+	model = "NXP i.MX8MP SOM on AB2";
+
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-0 = <&pinctrl_gpio_led>;
+		pinctrl-names = "default";
+
+		status {
+			default-state = "on";
+			gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
+			label = "yellow:status";
+		};
+	};
+
+	native-hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "HDMI OUT";
+		type = "a";
+
+		port {
+			hdmi_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
+	reg_ab2_ana_pwr: regulator-ab2-ana-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "ab2_ana_pwr";
+		pinctrl-0 = <&pinctrl_ab2_ana_pwr>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_ab2_vdd_pwr_5v0: regulator-ab2-vdd-pwr-5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "ab2_vdd_pwr_5v0";
+		pinctrl-0 = <&pinctrl_ab2_vdd_pwr_5v0>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		regulator-name = "VSD_3V3";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		dsp_vdev0vring0: vdev0vring0@942f0000 {
+			reg = <0 0x942f0000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0vring1: vdev0vring1@942f8000 {
+			reg = <0 0x942f8000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0buffer: vdev0buffer@94300000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x94300000 0 0x100000>;
+			no-map;
+		};
+	};
+
+	sound-ak4458 {
+		compatible = "fsl,imx-audio-card";
+		model = "ak4458-audio";
+
+		pri-dai-link {
+			format = "i2s";
+			link-name = "akcodec";
+			fsl,mclk-equal-bclk;
+
+			codec {
+				sound-dai = <&ak4458_1>, <&ak4458_2>;
+			};
+
+			cpu {
+				sound-dai = <&sai1>;
+			};
+		};
+	};
+
+	sound-ak5552 {
+		compatible = "fsl,imx-audio-card";
+		model = "ak5552-audio";
+
+		pri-dai-link {
+			format = "i2s";
+			link-name = "akcodec";
+			fsl,mclk-equal-bclk;
+
+			codec {
+				sound-dai = <&ak5552>;
+			};
+
+			cpu {
+				sound-dai = <&sai3>;
+			};
+		};
+	};
+
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+		model = "audio-hdmi";
+	};
+
+	sound-micfil {
+		compatible = "fsl,imx-audio-card";
+		model = "micfil-audio";
+
+		pri-dai-link {
+			format = "i2s";
+			link-name = "micfil hifi";
+
+			cpu {
+				sound-dai = <&micfil>;
+			};
+		};
+	};
+
+	sound-xcvr {
+		compatible = "fsl,imx-audio-card";
+		model = "imx-audio-xcvr";
+
+		pri-dai-link {
+			link-name = "XCVR PCM";
+
+			cpu {
+				sound-dai = <&xcvr>;
+			};
+		};
+	};
+
+	memory@40000000 {
+		reg = <0x0 0x40000000 0 0xc0000000>,
+		      <0x1 0x00000000 0 0xc0000000>;
+		device_type = "memory";
+	};
+};
+
+&A53_0 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_1 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_2 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_3 {
+	cpu-supply = <&buck2>;
+};
+
+&aud2htx {
+	status = "okay";
+};
+
+&dsp {
+	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
+			<&dsp_vdev0vring1>, <&dsp_reserved>;
+	status = "okay";
+};
+
+&dsp_reserved {
+	status = "okay";
+};
+
+&easrc {
+	#sound-dai-cells = <0>;
+	fsl,asrc-rate = <48000>;
+	status = "okay";
+};
+
+&ecspi2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&pinctrl_ecspi2 &pinctrl_ecspi2_cs>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	spidev1: spi@0 {
+		compatible = "rohm,dh2228fv";
+		reg = <0>;
+		spi-max-frequency = <500000>;
+	};
+};
+
+&eqos {
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_eqos>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+		};
+	};
+};
+
+&flexspi {
+	pinctrl-0 = <&pinctrl_flexspi0>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mt25qu256aba: flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <80000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+	};
+};
+
+&hdmi_pai {
+	status = "okay";
+};
+
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	pinctrl-0 = <&pinctrl_hdmi>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic: pca9450@25 {
+		compatible = "nxp,pca9450c";
+		reg = <0x25>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&pinctrl_pmic>;
+
+		regulators {
+			buck1: BUCK1 {
+				regulator-name = "BUCK1";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <2187500>;
+				regulator-min-microvolt = <600000>;
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck2: BUCK2 {
+				regulator-name = "BUCK2";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <2187500>;
+				regulator-min-microvolt = <600000>;
+				regulator-ramp-delay = <3125>;
+				nxp,dvs-run-voltage = <950000>;
+				nxp,dvs-standby-voltage = <850000>;
+			};
+
+			buck4: BUCK4 {
+				regulator-name = "BUCK4";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <600000>;
+			};
+
+			buck5: BUCK5 {
+				regulator-name = "BUCK5";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <600000>;
+			};
+
+			buck6: BUCK6 {
+				regulator-name = "BUCK6";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <600000>;
+			};
+
+			ldo1: LDO1 {
+				regulator-name = "LDO1";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1600000>;
+			};
+
+			ldo2: LDO2 {
+				regulator-name = "LDO2";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1150000>;
+				regulator-min-microvolt = <800000>;
+			};
+
+			ldo3: LDO3 {
+				regulator-name = "LDO3";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <800000>;
+			};
+
+			ldo4: LDO4 {
+				regulator-name = "LDO4";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <800000>;
+			};
+
+			ldo5: LDO5 {
+				regulator-name = "LDO5";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1800000>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pca6408: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	pca6416_2: gpio@21 {
+		compatible = "ti,tca6416";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+};
+
+&i2c3 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ak4458_1: ak4458@10 {
+		compatible = "asahi-kasei,ak4458";
+		reg = <0x10>;
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&reg_ab2_ana_pwr>;
+		DVDD-supply = <&reg_ab2_ana_pwr>;
+		reset-gpios = <&pca6416 4 GPIO_ACTIVE_LOW>;
+		sound-name-prefix = "0";
+	};
+
+	ak4458_2: ak4458@11 {
+		compatible = "asahi-kasei,ak4458";
+		reg = <0x11>;
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&reg_ab2_ana_pwr>;
+		DVDD-supply = <&reg_ab2_ana_pwr>;
+		reset-gpios = <&pca6416 4 GPIO_ACTIVE_LOW>;
+		sound-name-prefix = "1";
+	};
+
+	ak4458_3: ak4458@12 {
+		compatible = "asahi-kasei,ak4458";
+		reg = <0x12>;
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&reg_ab2_ana_pwr>;
+		DVDD-supply = <&reg_ab2_ana_pwr>;
+		reset-gpios = <&pca6416 4 GPIO_ACTIVE_LOW>;
+	};
+
+	ak5552: ak5552@13 {
+		compatible = "asahi-kasei,ak5552";
+		reg = <0x13>;
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&reg_ab2_ana_pwr>;
+		DVDD-supply = <&reg_ab2_ana_pwr>;
+		reset-gpios = <&pca6416 2 GPIO_ACTIVE_LOW>;
+	};
+
+	pca6416: gpio@20 {
+		compatible = "ti,tca6416";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+};
+
+&iomuxc {
+	pinctrl-0 = <&pinctrl_hog>;
+	pinctrl-names = "default";
+
+	pinctrl_ab2_ana_pwr: ab2anapwrgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10	0xd6
+		>;
+	};
+
+	pinctrl_ab2_vdd_pwr_5v0: ab2vddpwr5v0grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07	0xd6
+		>;
+	};
+
+	pinctrl_ecspi2_cs: ecspi2csgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13		0x40000
+		>;
+	};
+
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK		0x82
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI		0x82
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO		0x82
+		>;
+	};
+
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC		0x2
+			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO		0x2
+			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0	0x90
+			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1	0x90
+			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2	0x90
+			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3	0x90
+			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x90
+			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL	0x90
+			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0	0x16
+			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1	0x16
+			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2	0x16
+			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3	0x16
+			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL	0x16
+			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x16
+			MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05		0x10
+		>;
+	};
+
+	pinctrl_flexspi0: flexspi0grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_ALE__FLEXSPI_A_SCLK           0x1c2
+			MX8MP_IOMUXC_NAND_CE0_B__FLEXSPI_A_SS0_B        0x82
+			MX8MP_IOMUXC_NAND_DATA00__FLEXSPI_A_DATA00      0x82
+			MX8MP_IOMUXC_NAND_DATA01__FLEXSPI_A_DATA01      0x82
+			MX8MP_IOMUXC_NAND_DATA02__FLEXSPI_A_DATA02      0x82
+			MX8MP_IOMUXC_NAND_DATA03__FLEXSPI_A_DATA03      0x82
+		>;
+	};
+
+	pinctrl_gpio_led: gpioledgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16	0x10
+		>;
+	};
+
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x1c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x1c2
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x10
+		>;
+	};
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x40000010
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL		0x400001c2
+			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA		0x400001c2
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL		0x400001c2
+			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA		0x400001c2
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL		0x400001c2
+			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA		0x400001c2
+		>;
+	};
+
+	pinctrl_pdm: pdmgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXC__AUDIOMIX_PDM_CLK		0xd6
+			MX8MP_IOMUXC_SAI5_RXD0__AUDIOMIX_PDM_BIT_STREAM00	0xd6
+			MX8MP_IOMUXC_SAI5_RXD1__AUDIOMIX_PDM_BIT_STREAM01	0xd6
+			MX8MP_IOMUXC_SAI5_RXD2__AUDIOMIX_PDM_BIT_STREAM02	0xd6
+			MX8MP_IOMUXC_SAI5_RXD3__AUDIOMIX_PDM_BIT_STREAM03	0xd6
+		>;
+	};
+
+	pinctrl_pmic: pmicgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03	0x41
+		>;
+	};
+
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO01__PWM1_OUT	0x116
+		>;
+	};
+
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO11__PWM2_OUT	0x116
+		>;
+	};
+
+	pinctrl_pwm4: pwm4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXFS__PWM4_OUT	0x116
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x41
+		>;
+	};
+
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_MCLK__AUDIOMIX_SAI1_MCLK	0xd6
+			MX8MP_IOMUXC_SAI1_TXFS__AUDIOMIX_SAI1_TX_SYNC	0xd6
+			MX8MP_IOMUXC_SAI1_TXC__AUDIOMIX_SAI1_TX_BCLK	0xd6
+			MX8MP_IOMUXC_SAI1_TXD0__AUDIOMIX_SAI1_TX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI1_TXD1__AUDIOMIX_SAI1_TX_DATA01	0xd6
+			MX8MP_IOMUXC_SAI1_TXD2__AUDIOMIX_SAI1_TX_DATA02	0xd6
+			MX8MP_IOMUXC_SAI1_TXD3__AUDIOMIX_SAI1_TX_DATA03	0xd6
+			MX8MP_IOMUXC_SAI1_TXD4__AUDIOMIX_SAI1_TX_DATA04	0xd6
+			MX8MP_IOMUXC_SAI1_TXD5__AUDIOMIX_SAI1_TX_DATA05	0xd6
+			MX8MP_IOMUXC_SAI1_TXD6__AUDIOMIX_SAI1_TX_DATA06	0xd6
+			MX8MP_IOMUXC_SAI1_TXD7__AUDIOMIX_SAI1_TX_DATA07	0xd6
+		>;
+	};
+
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK	0xd6
+			MX8MP_IOMUXC_SAI3_RXC__AUDIOMIX_SAI3_RX_BCLK	0xd6
+			MX8MP_IOMUXC_SAI3_RXFS__AUDIOMIX_SAI3_RX_SYNC	0xd6
+			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00	0xd6
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX	0x140
+			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX	0x140
+			MX8MP_IOMUXC_UART3_RXD__UART1_DCE_CTS	0x140
+			MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS	0x140
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x140
+			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x140
+		>;
+	};
+
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX		0x140
+			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX		0x140
+			MX8MP_IOMUXC_ECSPI1_SS0__UART3_DCE_RTS		0x140
+			MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS		0x140
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x190
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d0
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d0
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d0
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d0
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x194
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d4
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d4
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d4
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d4
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d4
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x196
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d6
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d6
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d6
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d6
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d6
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12	0x1c4
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x194
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d4
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc0
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x196
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d6
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d6
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d6
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d6
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d6
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc0
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x190
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d0
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d0
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d0
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d0
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d0
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d0
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d0
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d0
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d0
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x190
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x194
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d4
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d4
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d4
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d4
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d4
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d4
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d4
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d4
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d4
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x194
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x196
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d6
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d6
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d6
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d6
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d6
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d6
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d6
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d6
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d6
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x196
+		>;
+	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B	0xc6
+		>;
+	};
+
+	pinctrl_xcvr: xcvrgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__AUDIOMIX_SPDIF1_EXT_CLK	0xd6
+			MX8MP_IOMUXC_SPDIF_RX__AUDIOMIX_SPDIF1_IN	0xd6
+			MX8MP_IOMUXC_SPDIF_TX__AUDIOMIX_SPDIF1_OUT	0xd6
+		>;
+	};
+};
+
+&lcdif3 {
+	status = "okay";
+};
+
+&micfil {
+	assigned-clocks = <&clk IMX8MP_CLK_PDM>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <196608000>;
+	#sound-dai-cells = <0>;
+	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm1 {
+	pinctrl-0 = <&pinctrl_pwm1>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm2 {
+	pinctrl-0 = <&pinctrl_pwm2>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm4 {
+	pinctrl-0 = <&pinctrl_pwm4>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sai1 {
+	clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_IPG>, <&clk IMX8MP_CLK_DUMMY>,
+		<&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1>, <&clk IMX8MP_CLK_DUMMY>,
+		<&clk IMX8MP_CLK_DUMMY>, <&clk IMX8MP_AUDIO_PLL1_OUT>,
+		<&clk IMX8MP_AUDIO_PLL2_OUT>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
+	assigned-clocks = <&clk IMX8MP_CLK_SAI1>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <49152000>;
+	dmas = <&sdma2 0 25 0>, <&sdma2 1 25 0>;
+	#sound-dai-cells = <0>;
+	pinctrl-0 = <&pinctrl_sai1>;
+	pinctrl-names = "default";
+	fsl,dataline = <2 0xff 0xff>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&sai3 {
+	clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_IPG>, <&clk IMX8MP_CLK_DUMMY>,
+		<&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>, <&clk IMX8MP_CLK_DUMMY>,
+		<&clk IMX8MP_CLK_DUMMY>, <&clk IMX8MP_AUDIO_PLL1_OUT>,
+		<&clk IMX8MP_AUDIO_PLL2_OUT>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
+	assigned-clocks = <&clk IMX8MP_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <49152000>;
+	#sound-dai-cells = <0>;
+	pinctrl-0 = <&pinctrl_sai3>;
+	pinctrl-names = "default";
+	fsl,sai-asynchronous;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&sdma2 {
+	status = "okay";
+};
+
+&snvs_pwrkey {
+	status = "okay";
+};
+
+&uart1 {
+	assigned-clocks = <&clk IMX8MP_CLK_UART1>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	pinctrl-0 = <&pinctrl_uart1>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-0 = <&pinctrl_uart2>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&uart3 {
+	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	pinctrl-0 = <&pinctrl_uart3>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&usdhc1 {
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC1>;
+	assigned-clock-rates = <400000000>;
+	bus-width = <4>;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	status = "okay";
+};
+
+&usdhc2 {
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
+	assigned-clock-rates = <400000000>;
+	bus-width = <4>;
+	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
+&usdhc3 {
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC3>;
+	assigned-clock-rates = <400000000>;
+	bus-width = <8>;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-0 = <&pinctrl_wdog>;
+	pinctrl-names = "default";
+	fsl,ext-reset-output;
+	status = "okay";
+};
+
+&xcvr {
+	#sound-dai-cells = <0>;
+	pinctrl-0 = <&pinctrl_xcvr>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.34.1

