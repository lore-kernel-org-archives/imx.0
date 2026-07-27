Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013000.outbound.protection.outlook.com [52.101.83.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46263D5C0C
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 19:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785180221; cv=fail; b=iakZcXwkbuzNO+LBAe8e45zFkUHLKGiqZP5XVq8PogD9tEFlTaagNwNmwJvMcC1lb5rmQ4zyMvuHOsdkWdR3ObBGD21Tiq7UUV8MH9sMub/7blkaxOb3qRrdD4SiS9acHbcQ4O0QbOvBH4vN44KfrYIWcLw9fDpOD0gF3prDPt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785180221; c=relaxed/simple;
	bh=G3mv2MmVTXEgWosLoJCvBQYdwMs7szAt3UNwxpWmaFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VY+Ws9ubmwJ2L09+KhE26WP55FFKcmLocSXuUg9ep0+bLHWn9xMN2m2gB5jQX6Bl9twkS4vW1fcseChDTLKsyVhRh4Qs0tCcCTGzEXanAwuHSZDYBEqvcEiOi0PifGdBZAw5MCs44sOMZR4AJ8QkSg04cznRM1SuijlH3R8inB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mqf3WR5h; arc=fail smtp.client-ip=52.101.83.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mqf3WR5h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvTdVIoG+US4UR0m5YIso3CU8VDPwuuGKL9uiFeyXJyy6+lWpxFUEu+dQrPXHV7WmOe/bN8s7aKWnBhS0qa/3kkhL0Jid+Cqt1xyhUAkqbbUzE65ZcMLR1VTXFTBTNGiqoZB+qnk8s1/GewllYgITFxzaThPVLh56pMqt7aoLkKcGLCVJFA2fpXhH+B+Q60mGuIWv4J+Z4owy8B69VrgfhsjnmFkveI/hV6KeNIduzrMdzsUW7r3YXqU1otCVXu8kvda+u3lmrgScPYc/MdZleH3865a5c5b77mMGkvnY8r5/TLmjy8FsgiKTdFSvjeHk4KH9VaMa7LPQHh7Vk9WKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCE1Ryo2iHVAs2vmap581rFoDz5fqAlIASMBQfivIDM=;
 b=SZNyo/6f3iIxXxz6VrQOiFvHaqklbS/K8tLGbfS607vMBWYJwwUgZTPUOHrRHVImcsSGjpTrRcFanrFsuQY+wvnq+km1cqGTw5s/z7aCYTOpEwxV0eaRKZVjM1d3ispAa807pyoXI0bYztg7ptnOX3Q3Oiodlu6vqTj59WLXR3Pc90xAb0cSXkApkIFuthtzMYdx+M40NsRmuJ7jt0RXtNkWh/gUBBI9pdBoj/dPWFiVQQI4yaC0pVFpzlNN/LXXrVRuPBtK8x9T5oUQ93HHil+w0fjEScdMTehB+UGRIhHRJ/IHAOSWSYEesfHkgl6de3gM0jgDgkbotvNHK/zmpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCE1Ryo2iHVAs2vmap581rFoDz5fqAlIASMBQfivIDM=;
 b=mqf3WR5hOsYlu9m9aDaZ7VoNNubzColyk8mib+/FaKUR/qRJwWA/gLR/oajvWSbxmBbxelSgdLs5S8gCdg0jbHKhvk8HkIn0tL52hdVEKCkRejVsAYoyh/y4TtYhQTGlXyqKSHBPrczLpc7d4MO6wZ5C1qjA+lKZP5CRkKdD8zApyef1GxFpB/q/FOS8wg4bnvKHkJ8S26hMPRHzx/w/L8SpiwOhBTQs+Bi+a+Ge3xCAJ3e2wNf6L04s8PHeKMUv6k7djqPAJYqatIVgcHcR1Dz4oUbXkAAPHZfp3ZOcie4mEheOl5JplbZ8QURNDp85Gaqn4JehhVLtK6P4+tXrUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7234.eurprd04.prod.outlook.com (2603:10a6:20b:1dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 19:23:36 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 19:23:36 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2 0/7] arm64: dts: freescale: Add Verdin iMX8M Mini overlays
Date: Mon, 27 Jul 2026 15:23:15 -0400
Message-ID: <178517845497.2620222.4348088456373649192.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
References: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR13CA0021.namprd13.prod.outlook.com
 (2603:10b6:806:130::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7234:EE_
X-MS-Office365-Filtering-Correlation-Id: dd5bd722-ba90-413c-b0ee-08deec148e2c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|19092799006|366016|10067099003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 ACRJQXQr5DGHcKKL6Ur1qIdnHbZ0EfLbBfyTCOK/gxHmBvXGwFf3GsEuONJsaqfUVZq4kpp8N0M+/nMpERh8rOBASvVXceajbU3LfvNpVHvFmBTsyiOXvwbxo+b8Cj4sK0b0jnyyqxs9+OEHCeoc1jk9MqttjK1CDEZ3rXER0qPqjNK7ePMnWNIjn0m2CT0ca+DRgt/3s0Er9BcAoC7RLiE3u0Pf3eNW6PtqQOUbwKyjH13m69LT5xWVu1gEYIfKrVBkGshd0OqFCJ30CjQR+T/y1H1DbJB+WLH+096qXe4aU2pqyy+rFryLHJbHTw6p4Dh5AlZQRBjHaVRFfjD/2KyuU5qkAd+ddgeAtm/hM3KvWEVH2yX1VHR/3/LDgHGR5Zen7M9JW23N6iUWjOcSce6UDidci6XtmA1mb4FvBxuHGTci8GFNCkHhHhMYBx/mWlk7H5rV5Qsj8dgnjwldZbcgIW1ZjmwtWLiTdG3zc59+qrl/Bk17TivfDmJd8m++dYlcXJILMv2s9mxB5Zkit9NVHp02bQUnu9g+ZzFlDG+EXL2gxnWHT6ddIhRqAXa8PTrYvBrRgcWrlWHxwwjoYWiacSE8yI3i8bowad3AHSUgUDFdm6VK2SwnO6SridXfRAX6wKbAtVgpz1WvnCVTnreHdiq7Ssvy32xkNrx+SO8=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(19092799006)(366016)(10067099003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bzZxRGNJcWcwUlZySFpjdlZ5SFVGdHNzRzAvMHRPbmVjZmZ3eWtDcXdrWHNU?=
 =?utf-8?B?dVhhQVdMOHd1TGF0YUJBd09pWm9NNVhwTEJSZWg2OVJMUTBUdVpzTFhHRjZn?=
 =?utf-8?B?ZFZmR28xZTZXZ1ZTTVRNeXJCSHI2ZTNIOHc0UjRqUXRmS2JZNHdUYzhOc1A3?=
 =?utf-8?B?Y2pkM0dJK0JqcjI1VzRaRTNyNm15WUVHazVFMktSblhZcmJRWmI1MEQ1Tzhn?=
 =?utf-8?B?TFlGTnNOYUZPZFJwUmNzdGVVeWZVMG15Y2hhbTl1K2NwcHBxNUpEeS9JSmVa?=
 =?utf-8?B?TnE5K0F1VzQrZjNDeEl2WldFMDlYVWIwcDZMUkJ6VjZTQXFnWHJzaWdKYW5X?=
 =?utf-8?B?cC9DcFpCSElmUVBrRUdHYmRqeVpTTTRjYlFxZlFLQzZFSmNwZGE3UkNPUGIv?=
 =?utf-8?B?dm1VNmpqQWJUeDdFai9McXJhSjNxRjUxR2tlOEMweTduRFBMZk01bmZvRmo0?=
 =?utf-8?B?U3Vrd3N1M3E1K0hTWjdVQTNZQmloa2x6S2kwUnJnencxT204NHlySTNsMWtH?=
 =?utf-8?B?Ym50Q2NFd05GL3lzcHAxd1ZnVjBMSHpUUnprUmlhcjQ0NXlmZlhzdVlNNW9T?=
 =?utf-8?B?bmR2ZEp6elhtUjVJWGltNW5kR0dSV01CSDFPdEtTOXFkTnoveUs4dVVUcks4?=
 =?utf-8?B?RFdzejZqQStsT1lhUG50ZWwxc29FNjM3R1FDczl0RmdkclRJb3FkVkN0UUVI?=
 =?utf-8?B?MDJvZ3phZXNMeVJmWU5XQ25tOVkxRllITk5CM24vc01MSkhMWng4WWhJZm5C?=
 =?utf-8?B?Y1BXL0NSWnl4VFlYWDIveGNQL2ExM1UwV01JL1B6Wm1yZHc4QU9yeno5RDBL?=
 =?utf-8?B?Q0gyalJGMkcwQklHV1JXQ2RhL25RbDY5Vy9EZ3pNeU13c29seUk4L1p6YXdC?=
 =?utf-8?B?YmhaYVBSZEVqeFhuRlpzUlRVMExjdytLRERJNndtaXMrZVkxK1lYYkJTTFRV?=
 =?utf-8?B?dnJ1Z05qNnc1TGs0eE5idVhIZlRMN00rQm4wSWcxajZqK2o3b002YmNGRDNX?=
 =?utf-8?B?d25LakxrRk9KaEZjU1VzUnpvZ2M0Rzh0UEZqaTdwVzFIeFNJazhVc2oxeGhW?=
 =?utf-8?B?NFhmTGRHMlJ4azFTVjJsZ0RrY2lndmJsMHdLZExXb21ZUGJiNkRGRHkybEd1?=
 =?utf-8?B?SjFaUlViK2dqeHk0MDI1ckZ4NkNvVlZ0MDMyMGJnVkVNWFZmZnc1bmFDdjFt?=
 =?utf-8?B?QXd5d0lDZzBhaU1HVWEvRHBncnNZYjg2aEQxQmZlM05nNHdYc2FXcDVKYi9j?=
 =?utf-8?B?d1I4ZTVsbDUxQW1JaG1YMEZVK1dQY1c0Nk14YnpSTCtxL05GL0NwZ0JkQ2li?=
 =?utf-8?B?bXhnOXF1VW5ia0YvUVRiR2hBNXc5YmRlN0ZMaHFkL0ZTckZjMGdXWlhEOUo2?=
 =?utf-8?B?Z2ZRRlVIUU5HR3RPcGc1eWhZUmJ1Tk9ySXpmMzdDTlYyeUl1Wm1Zd1hSZU9j?=
 =?utf-8?B?bmJFelBkUTRaRUt1WmlaUytEbmFIc2JxL3VWcVlObkptUWdxTG1DK1JxMTh1?=
 =?utf-8?B?TUpHT2QvYjhwalJvUE9Rb25ta0wyTXYvZWVJVTFlRi84ZnpMVyswUmlDUXEz?=
 =?utf-8?B?OG51TVhEeHBvSWN0SXZPY1RhaURXbDVUU0UwRGxKSjNjSEZ2c2txWjluU2JX?=
 =?utf-8?B?QkwzRWZOMXFUWjBrMGExMm5ReXgzRUdOSjJOTVNjSEl0OVNnRzFMZjZGZ2lo?=
 =?utf-8?B?amczWFExTXQ2eDlkcnEzYVZkV2JCODVmYTN6QVgzUHZoQWZra0hXSDZmR0Ra?=
 =?utf-8?B?UGhUVWNyWlJYV1gzUXFSWFlmblQrcVVIazlZek44R2QyZ2FjaE9DdnN6UFN0?=
 =?utf-8?B?bDBKazhIOHkraVBJSVR2K3NOeWl6OWJUMlRTTVB5U2pNc2s1dFE1bktzNHBJ?=
 =?utf-8?B?S3hyOEN2clBJY2FMRER0TXRUd1ZNOW5zOHNiNlNtY1Iwb0ZCNUZZVUZCMkdD?=
 =?utf-8?B?OTd5Q3Z3cmlOeEZtdjNRSTlqZGVSK01UNkJ5QmpUdE1FK0ppQTc5Z3dmYkNh?=
 =?utf-8?B?TkZhcitCRk5JYW5LdzlpcXRjS3I1c2F5d3RYNlNFRjR3ajNOUlhUM3dqbWlP?=
 =?utf-8?B?MHBVazM3QldtY2c4cmc3b1ZmNDJTSWlJeXIrV0l5V0hocTNIeU1hUWJEQXQ4?=
 =?utf-8?B?V0lhU1FwTERSc3pQL0dvQ2lIczNkS1hINmNTVEc3ajl6QmpJVDBTYlp1NGsx?=
 =?utf-8?B?SVJ6aUJuWDZJMUh3UHZMRFU5ZTFvOERjUDRuRG1hZUJwYzlGeSsyVktkWGcy?=
 =?utf-8?B?T2k5dFBTR0d5UGFaK2RNdmhZa2dDL1RaeTBCV2R2Qm1OT3BrcWMrQnNVaFNU?=
 =?utf-8?B?S1JZc2VTUGZvQVVQbjU4NUd2bEc3Qks1V0I0UmVVbDdyaU9DK29VTkpFRnpW?=
 =?utf-8?Q?A061CsrRB+T182Qr+7FNvMFfM2BGdvGF8b4A2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5bd722-ba90-413c-b0ee-08deec148e2c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 19:23:36.3457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/QZVox4j0EMuRsLksl1AHGFqYnO3BXRHffnAU2vs59VNAa8vOLRI1xMZH9X93NsS4IjaGjVVNvMyV46QHzT48KY80Gq5QDWr+e2YW96zdt9gAWyfD0KZdmlSNk4+Zwb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7234

From: Frank Li <Frank.Li@nxp.com>


On Fri, 24 Jul 2026 18:24:26 +0200, Ernest Van Hoecke wrote:
> This series adds device tree overlays for the Toradex Verdin iMX8M Mini
> SoM. The overlays cover audio configuration, display adapters, DSI
> displays, and Cortex-M4F integration.
> 
> The series adds support for:
> - NAU8822 Bridge Tied Load configuration on the Verdin Development Board
> - DSI-to-HDMI adapter based on the Lontium LT8912B bridge
> - DSI-to-LVDS adapter based on the TI SN65DSI84 bridge, combined with the
>   Toradex Capacitive Touch Display 10.1" LVDS
> - Toradex Capacitive Touch Display 7" and 10.1" DSI variants
> - Cortex-M4F remoteproc support
> 
> [...]

Applied, thanks!

[1/7] arm64: dts: freescale: imx8mm-verdin: Add NAU8822 Bridge Tied Load
      commit: 0a0ed37b68ff9e09025f9f5ed780e6b8b343302b
[2/7] arm64: dts: freescale: imx8mm-verdin: Add DSI to HDMI adapter overlay
      commit: 70b923a721c9364e43967a9a0e7b37c52bc57ec7
[3/7] arm64: dts: freescale: imx8mm-verdin: Add Toradex DSI to LVDS adapter with 10.1" display
      commit: e23768eba9badb72bf335e77cdfdc4eb73174bbc
[4/7] arm64: dts: freescale: imx8mm-verdin: Add Toradex Capacitive Touch Display 10.1" DSI
      commit: 16790c0bdb2b20f8ab0286f74a617839cfa81e29
[5/7] arm64: dts: freescale: imx8mm-verdin: Add Toradex Capacitive Touch Display 7" DSI
      commit: 4bf5b8862fae3865069b34bdde2492e3e49f1810
[6/7] arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F remoteproc
      commit: d4fc54ac184d036b51d1638a83f717269b86ddec
[7/7] arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F UART_4 overlay
      commit: 0c4a972d869eff8070685c055b6a9366d6c63710

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
