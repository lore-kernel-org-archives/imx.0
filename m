Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013065.outbound.protection.outlook.com [52.101.83.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BCA37BE8B
	for <imx@lists.linux.dev>; Mon, 18 May 2026 06:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779086160; cv=fail; b=qD/yYz7IGm06tC+2P232qR/9Rdu6ymq3CGdVu4Pi8kfSOD2a+ClioYU3XgeTU+UjFSYrN9MMNCkeNj25/cnaAUSKLJY5byjZ9r4qmH9OG+kM7HxiU8pp7+k5mSSyLZsFvZ9U8/d8orYw/dLvvuMSh5pDGX467DoGzvd/MhQFV/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779086160; c=relaxed/simple;
	bh=nds5vXdUvt5Kq0/Pu1fIELzNLjICKtDDajjb5lMP1iI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=uN60QOUCLcfDN4deOJyE9fnBub/BdV6Cp8SZWpjgMPBcFwCGsJKCjSv9sWdpIjdNW8zHG5yMTwtuFv5rYalGkrDplmpZp8Mg1wqyJsBqX009RoM0z7qOE7De1EK7sLC6iZUfACVWhOVSXqPbG1SZ4D4LdZUCfB7F482qRE2pmX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uEDI1LXx; arc=fail smtp.client-ip=52.101.83.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uEDI1LXx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcjcjUuREaBXsq+QLRU9yjyd7hKzKslCFL5xxSshIODmOmDKBouK7bwrQKdlWcvb3NQgs9Jpc9aLPDI7WY6n0DiLOyHLZrGoSK1ZrFXTFKVfUlB6/FPvuVKIFoA/wUYKpyRYDQNkCXLuN2m9e9w8a8+wW64680u62zQsHKGzc07+JWkP8+QDAQIU6Em5Fl0gZ5ARGWYpW4sfuswPzGRK2YdUwgRJMdGTnZ/Du2rvgox2i16HYGxcH6Ca+gn1scfeqa28FeMt/8cCGSTpGSZQqga1ivaDpIJHYopb5yrq297ZqfRCSJDZu9sqrPeZft5wpF8bMXRo1C+ZRdsTcBBsig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1+Aztmjiv3uZ47culu/k47pzQbKX8vvhZjG0gkDkFw=;
 b=V3cJofFj6lgsQuYtjnKtwX9LUGgd01oLTb1yqI7PAIcZxGs5Yaa/lUlHuz62AfLh0Fcm3gUReCYvv0b/CaYjAn5xVqhkwSZIS0OqOrIl6UOOkECUEi2xkNIbf4QwYS7bbUgzmV1/fT6eIy0DKczmCJYw4IMsbsheIkcLBLGC6Onp9IhyhCswtrwVynEcK/ZpbKCaBmyX/Zk3xEwZ6kOgSAI5dbIKHWdgN4FJjSbEyG/BFVwejjSR+UmJ6KGYJg6og0P/0GiYjEdMNCkpqT/Iiyww77E5YuaZyFDD/LPMZ/eSRfLvqPJM5sTdt0ObgYNwH9fOG716uRPyANXS4SfV1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1+Aztmjiv3uZ47culu/k47pzQbKX8vvhZjG0gkDkFw=;
 b=uEDI1LXxi/Q9yEtM5O89Rtpj6vppnHVMc2T9TMAyzvbxgW4eBw/HB1mI8Ti07NO8hZVY0f5w5fNF/oRRZXN7YFv2So8VvkkabpGT7QY1FkVm7tjWy+UIM/2HwxuOlM4jo8NKgFyAxnN2m5xspIOJdcsRegYNHoPYr5X/qNFhJn9yPZVjKhFV6MX+KOSABLqydLxjvoTcZjH9fLDZrFXoRlaQyP5/kcG/I8jXWkwGM6xDwH/Lq6+Y6oNk9vbyfZ8oCzT/uLxX86M9AuMJffqgtdjvUnu6nchJUWQKRpbxxd4HBH3/t6nkNmLZ/4BqCn8Ol8X710PYlk7bq7uh9VEBgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com (2603:10a6:102:1bf::23)
 by PAXPR04MB8093.eurprd04.prod.outlook.com (2603:10a6:102:1c9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 06:35:48 +0000
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::4608:7dcb:899b:e4a1]) by PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::4608:7dcb:899b:e4a1%4]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 06:35:48 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: [PATCH v2 0/1] add PIT DTS support for S32G2/S32G3 SoCs
Date: Mon, 18 May 2026 08:35:46 +0200
Message-Id: <20260518063547.2890353-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P189CA0001.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::6) To PAXPR04MB8190.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8190:EE_|PAXPR04MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: c04debba-f4ef-46eb-748a-08deb4a7b2a4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
 aGELCGc+362dXYRzs0p6YxCi48iyloTVH1anB5VdFCSavBH/TmA0Ep0ClkapX0sKBFnSqGbDZhhfbtmmJjIwL5nO8elNjAmg8wkt1BHSG3HBljUqQrQFfFOXygIxOsvbfCvGBpQVqbrCb98MrSBFott1Xgv8RzyDT6aZbW7hAaLzkoM/9zvNCRvZ7eCS4AilfLA9PtKQNYR0HXQ0yYe4PA6uXeO/X2+WbobaviYLsgXvGWdcHcO/msBEupWD/m+WoXioMQeD7bUybpzOBwdEVTWVprUYT/XC6VTO2cqorGbdUBLzHyUYEZa4XRkXrCS5B0R6UHVmsd+ZDpKs7DrPA05v6UQRpUgwbeqZ0sgxQnsWcrGH/D8krf/yED+rpcQ8na4URUP0aoXeYl9IR60eDH6OqQJdKOtp1uHLA3gmBMXf3y1dbskH7RTZOYDQui/wyTMQ3RpSJfTaTMYQ1bju7lIXVB3HP4oUve2nLGdFpwXEFG+J90LUKCc/Fjb+r7BTP+/LimBCeRJm6KRwaiF4c/i7TI2bxBiPORixa8Jf0ZwtETqq+xHaB44O+0U1QP71Sp2jfc9ZY4HWqeDheSEo15Dtu/lrGUcIP9oKtwyVYSO006VQkv6pU6JjdOL1KVAtJ1fXRjiDnvbjxV/EQc4b1luJImW9TQqgQ38elP4qPyuwIRU9P0+i9gwMSEUuOUSr
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8190.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RHFyamV4a1pPZHpwOHJacjNCc2JzR2dHNUR2bGFVVzR5UGV6ZFZ2YWNjNmlL?=
 =?utf-8?B?cG45UzhUL0RyTnY1RUtRS2g2bzlsMkFkVWZaMXd2NGZ0aWRVWU11aE92WU14?=
 =?utf-8?B?d1N1T2E0NGV4NlphTEFDV3RNNGpBakQ2MHNXMVhKSGxKL2lVU2lKdEl2OURj?=
 =?utf-8?B?UjlLMTNQL2EwSU1Jb2d4QlBGMHAxVXVnTUgvNG5Pbm1LaGI2dTlablJZbWZr?=
 =?utf-8?B?WGJXdmZzRHBUd04yblZ2MXNpeWlNaHJtVm1YMjFZdVFSMXVuTDFjVTI4Sm5h?=
 =?utf-8?B?cUtBTWdOMlZpOTdhdVBnb2xodWtXNGEvWE1qMVpCZEZpVWs2OUpQWDRzVHE4?=
 =?utf-8?B?bWpkQjRQaTJsQS8zOGVNTnZNU1Q2VTFBZ0c4L1ZOaE9JUk9EVHNDOWNITDF5?=
 =?utf-8?B?aWNGQkNLSFpScDJMeUZTVjJhZUZUNWQ5dTVrdGFGd1ZKd25tdGJFdTR3Q3Yy?=
 =?utf-8?B?Tmx5bWJWeWlJYTRIZFFqanUvYUt3SU1pb2JiQ1hrd2hnZUQ2UnJXeU0zbXZT?=
 =?utf-8?B?YkswQi9HYk5ETTRkQ3Z5a0RZUXh3WGlwVTdESm83ZmRVRkhwN1dBZk5sN1NL?=
 =?utf-8?B?VjBvaE9EYVVrM3hvR2lXaWJRRkxFamdCK0piM0NtTldnQ3I2blpqNGV0VGxT?=
 =?utf-8?B?YVVnRnp2WFRGTDUrSGdiSmlUeGhmWlU2RHR0OWc2VDRCckhTbU9PY2wvKzhV?=
 =?utf-8?B?NFk5dm0wL1J2NEN2d2lrSWN1NE1uZE1zajNleWZ1U2VidjR0ZXUxME5ualN1?=
 =?utf-8?B?TjNmUzQxQmJENFRhUmxzY1RaRCtpNE9rRnd1d1AwTnhRV3hobHUzbm9HcHNk?=
 =?utf-8?B?ZmhXV2UwdmJLV2l1SWwrTVNkQ2pXNUJRT3Vqc3lpQ0FXTUJuMGl3S0Uzd1Zw?=
 =?utf-8?B?OGZ4Wkk4NEpVZjhDLzJHdXl6ZEpQQmxJOHhESmw2VTlEcFZDZ1ZPR3lpNnAy?=
 =?utf-8?B?eWdta3o0bXZORlVROFZ2cUUrUWl4MXMxWVUvZlY5NG81ellyckRCSVFJdkZs?=
 =?utf-8?B?S3RhMjZ3R2lXSVAwbjljUGE3OS8vbldIUXpyN1RLa0dRMUVGTW9oR0JDYWcy?=
 =?utf-8?B?djJvb25COEJ5bC9abnhNbnBEem13cWdLbXMyZjFVU1NjL2FpazJORUkwdlEw?=
 =?utf-8?B?Q2VVUUNpanJJamhyRXBDREpsOXVQVERWcE1uZzN6ZFMrd3kyN3dycHlVRWJ3?=
 =?utf-8?B?UWtzbnlpWmhyRGN0dHBkTGlibVlYZWVqczFrUkhaVy94UjdhcGFtT1JlRFNX?=
 =?utf-8?B?SjRmbUJiaVhleW5FSUZ4am1ZUXFzOXprZXpaSDc1eDdvUEY5RmZYWm9JVlF3?=
 =?utf-8?B?V2M1RDZFUTJXSFg4WFE4T0Y4V3hGajdEdVhndlVxeE13R0pyQ0t2U2QwRjRP?=
 =?utf-8?B?WUJ3bWRURHQ5bmRuajB2cTZWZHNHZGwxUHdrN0RIZm5nbDNyYW8ydTQvU3I3?=
 =?utf-8?B?azQxcXhtSWVFNFU1YjdtM0tsUjJlQW04WHhsb2k2cFJFQ3ZSZ3pKUW43cUcr?=
 =?utf-8?B?VmMvWGxFaklrOWk3UW1DQWZWczcvVEFTYlhOMDRiVzVXMzJyVEpteUZiajcr?=
 =?utf-8?B?S2ExZHpER1Q2VlpxT01xMCtoSTdhT2RMWWsvdXkzTEd4VW8yZHNsUGdId0Vy?=
 =?utf-8?B?KzB6OWp4bDk5Qmd4TmNLOFZIbmxzMHl1d1haUUtKQStEd0lkTlJOZ2lHT0hx?=
 =?utf-8?B?bm02aVQvdGd6WWptK2RvY1M4TVRIcW9HT3p5bEVqVFZObDdPYng0azBiYXh1?=
 =?utf-8?B?S0NCcFFGZHVBNTMzTkZqcGNkcTdDTTY5ZzFiMzFFMDdMbkpUVUxCT09XNWl6?=
 =?utf-8?B?L0U2WmRsRFdoTDF3R1VSWXRtRGRkc3BpdHcyay9xbUdYOEI2S1I1RUZoOUs2?=
 =?utf-8?B?ZytSNGZ2ZXpoWkZLT1hxWlVSNngvNmJKTUFIUkY4Qjh4Ym9xTS9LZE9PYkti?=
 =?utf-8?B?amxVdG1LN0NkRVFBY0tLMlIzejN0WnZTdlhhaFVqR2RJMlp3N2g2d2dWVUdJ?=
 =?utf-8?B?VVNmMDg3eG1jallGbGlDQXlDY2xjT0l3NE5LK2xSQW1QL3dOR1dXeVRNQkxp?=
 =?utf-8?B?MVhKVDlRTFFxSjRzR0tWdXBpL3hSNzREUGZ0NVlIc0YrSWxNV092ZExxS2JF?=
 =?utf-8?B?MkdlOGZLMVY0REtLQ0hNZUVhazU5aGRmODYyMTFwOTNiTU93Vk0xOXhvMjRZ?=
 =?utf-8?B?S0JtVEorVDJzRll1dHdjWnE5L3lSa0l2ZVN6R3VNbE82eWJtR3lFcFdGZVEv?=
 =?utf-8?B?VzRXSDdMMVNvbVBVd1Ftc2dlWEs4Sko0YVl6M1hwYkV1cWV5MGxMb1ZCVDdE?=
 =?utf-8?B?aEFpTnplNlE1cDU2SiswU0x2NGpQU0FaaERObE9YaWhEQnh3UTMrUXBQQll1?=
 =?utf-8?Q?bC6idsGf1b9Ioyp83y8aOZOU1hfwomAcBk1dU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c04debba-f4ef-46eb-748a-08deb4a7b2a4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8190.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 06:35:48.6178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: on5mnqeYXkbmZjaU48wo2sK5Gp3gk0DGeFePdBOe0FWmfgczNkhqr7fbuY0Ly5p96EhcmHZ/SZIi92ZEmH3TeWY2mCLgOv5ALzSAZNKYKF8rpzOR/nkp7qHEKDUaTbGA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8093

This patchset aims to add one change to the S32G2/S32G3 dtsi support:
- Add PIT dts support for S32G SoC based boards

v2 -> v1:
- Drop the redundant PIT example from the binding

Khristine Andreea Barbulescu (1):
  arm64: dts: s32g: add PIT support for s32g2 and s32g3

 arch/arm64/boot/dts/freescale/s32g2.dtsi | 20 +++++++++++++++++++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 20 +++++++++++++++++++-
 2 files changed, 38 insertions(+), 2 deletions(-)

-- 
2.34.1

