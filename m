Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013035.outbound.protection.outlook.com [40.107.159.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913F01A680C
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 01:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288119; cv=fail; b=hVxJSS4ovr+9L8RW+CkNSOkEWBpqVRNGF8ckDYJqkh3CHOWlyv6+wvoleCQcTRaUiwAza3odEK687R8sPMkSYaqkIKEMwGnUGhxwzCka0Qhxccgp6h9fAoahTNF+F3xq6iaU8jTG3JnRacIF4rAn5JibjwGe4fHfAFuLMzGUNdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288119; c=relaxed/simple;
	bh=N9CbEHYXLkttpPTqIyZ+jt1CZwm15YLm40sJFPLonGk=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=W1Mx7CcS5Hz4CebbRA7DeBPsZ2llPHM/PegCMd7F8lmNJKm8TtBZe8VygirA5QceIsyyOZk+xaDKGyiPtO7AiKDAeA7E3izimk4o9sg12ExjaPjidwbP5ta3t5AE0/nFSdGfVfd4y9h2kmjAsw7mInxcrlOb2ZXlzj5vdsLp1wI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=l6s97X97; arc=fail smtp.client-ip=40.107.159.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="l6s97X97"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJZw9HIlsWcoYXnTdbrrKeMI27nbb+Lz3OeeYvbPio/tWVahNtj3Eo9TpW3SKX/QWNM1wIib4620Qq4vUHn7gqKIH2CagboMNZCi+WWfd+6VjhiC3UPELKuW9HCoM3FXcBEOgqfsZbJ5243TkEKFhNch/4EuvbOXCRo7UIkfHPHAherVG2kOk28unogbLrUS7wcTt1gESEFUQiqTVQhHTcRvv92dlR4UFW+q9vvonBcj53JiJb9sBorYIwkjsbZTFqTz0gHR3pLxgMGiJ+RRjeptm1eQXkHjlPGHAbzTCexznTy9lfRj08Y0K9y7iUTnHNOk5NALZKpWA+nQSL+JuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xm5DFAo+VX9a4ezM/0xvDvsb22fQqXVWusY0bfnvFYk=;
 b=iIuaT/Mq/35q6bryfh9j5nEJ9+7tHEReSk2CFrDlFDQd21J+SXzBTkpWhdctf7Sj0P97dMI+F1q0XHySBoiQdYUxG2WphL/8+XUAgv0xdR5BtMmLal3p3u2vLyZ4tsbqyXc8EksicCX92O8v6YDhzPEOEw6Rdka6HQwjuYXr1gf7wVAhu9CTANeYeChTuxUvJjtmBS2HvwJnuYWtLqvb3IySzzbs5S/9bP3/emjC+JUPdA0jemksflayBZf5/SQlMagUkwnznvzn9TPkAbSGqNpzjochck+vwpoVeb5dAesBvpBd7ibad2fcQ7QaMAMuY4iJ8fOYIzt9OZTIPJcwIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xm5DFAo+VX9a4ezM/0xvDvsb22fQqXVWusY0bfnvFYk=;
 b=l6s97X97lmFbXJdLPN5bWVWoL4q0Au3ZjDCseyBLqivbCwLqIpDWXuI9UyChskpALGafr4su3floVL4wICUAgnhlHSKGUChNnIdEdG2lensz0Z4iZXak8c+5KBC/v4ihhk1rzuvzr2+mCDInoKZEmDx0g03BXn83Ry8m9ITyxcP4TM9k9xyXVdlv/lFs1Mk33TLVNbi72M69YZNRgOwLdxt9dDWnmkXyYDDe8ZD8gHNy+iM25Jy29F39BqvGXANeL2ZeOBq0q+w9zve6fg4yyoOdbKxJPE5yfZ9eWWR68CU6TcrOQAWZGXCkNZ+O5w4Dr2heoMYufFEViP5U2dvBhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB12274.eurprd04.prod.outlook.com (2603:10a6:10:62b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 01:21:54 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Wed, 29 Jul 2026
 01:21:54 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/7] arm64: dts: freescale: rename vdevbuffer to
 vdev0buffer
Date: Wed, 29 Jul 2026 09:25:35 +0800
Message-Id: <20260729-rproc-dts-v1-0-368bca0b309f@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI9WaWoC/yXMQQ5AMBBA0avIrDWhTRBXEYtqp4wFMoNIGndXL
 F/y8yMIMqFAm0VgPEloXRLKPAM32WVERT4ZdKGrotaN4o1Xp/wuygRjSh9qh9ZC6jfGQNf36vr
 fcgwzuv0dwH0/aX+PRm0AAAA=
X-Change-ID: 20260728-rproc-dts-3f331df7ceaa
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Francesco Valla <francesco@valla.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5P287CA0261.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB12274:EE_
X-MS-Office365-Filtering-Correlation-Id: ca42c7ce-b202-4ef8-6e76-08deed0fc64c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|7416014|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tHFbekVoc3tt5/eXvJBzaZyI8q53eBuFRgJxBnMezm+kgin8ZA4Z7/i6o467g5aUKUfatcJHJAJe0v7p0XMrO9tDTqBcxZb4ix7ZuwmxvNKtS28zOOVqh4RmrYRydocQEva/LPScmzjOsW9y6fnJK1VD7lSDUDV8PiIJYjBtuXVmUDThQh29LcBL7FFBUaVhPWZr7YgRo/vb+GsqOc2moE0NSQTwZaQmzJ63yA7kLuepZ2jXPbKwbpTIWBhqQOAx4t003enE16xcP+QOM5+0NTYNbpp/0sYgnlmBULWj0WLo1OI2dpVl1TMFSD7AomRcC/3YLMByA+7BwHH9QqJvtNXijwsReI3bMQbSLyEmaKMC+lYlLXmap5KkY+Sz5p6p7F9E0wFBFkFloqVRvf+ILvD7Fp9chHa227SNSefMATERRL8x7aYx4wdpg77By0V+FGshwtPdksHVrFtHfYtSLD4JF+bFzR0HL1zIAHSjxp/7hHlYbxj+9QJ7OS71Uyhit5yh2c2KAXnujSaEbCmU+P7t5Bw/Z2EYGbG0NxN4S63edc7JUCJbuT2wPbHkz5r6erPUPQZovd13O4Mi7LDIfkhqwmxdFWjzIZUBlM6cGrvRnd0oyReQGAQdCF/UOw67XybzVhGM5pgrZtLlXvYxWQ/bvRu+YkzYAaMpP7Hjues=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(7416014)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWQ2OVVweEg5dmZBRndIakp0cTR3Y2lrVjNhUWZQcDhFd1dzS2lyMlVwUDN3?=
 =?utf-8?B?UmZyVmNiQ2lGU0tJQy9nLzM1eDZLV01nclUvOUdMdEUwOWNVSzZkcW9Rakhs?=
 =?utf-8?B?U0JscTdGVm1pZ1FGMTN0aUpjT0JwdWtmV0JGdzlqdFZSWjZwQk83MDhkSThq?=
 =?utf-8?B?b0tKV2t0eHJXWHlvenc2Yit6SmNCeUdhRG1CNTdLL2ZianJoeGhLeUw5OG9C?=
 =?utf-8?B?clRrbjVoMFFNaXhCRzNORWplT2h4WUxHd04xZUIxZDdGR2V2MU1CNEdUTE5F?=
 =?utf-8?B?cWh3VUo5a2pYTUxYdHRDaDFDYlI4V0JNK2U5NXRHYmloL2FUVmVEMlRHaVAw?=
 =?utf-8?B?a0xPbHZlZE9Bam9BN0lNMHNsUUZFMlpWSjNTaVBQZWhNUFZ2QStxME1MNlhR?=
 =?utf-8?B?ZEF5TVZDWVE1MjZWTUlkVWF4NGNZMmJFWFZTc0dwejE0VWNSTURZUE9NTzVa?=
 =?utf-8?B?dDFieGdFSDgzbUNFV3J6YjEra0pFSDAxUHpmMjJ1REdjN1cvNFh3YVcwZ2Rt?=
 =?utf-8?B?azhBdnZXQ1VEMExpbXZyV3dIbjFFbitZS1huTDNRRU1LeUIvVjdyVGpoODdy?=
 =?utf-8?B?dGtrOGQrTGR0Z1MvTzh1cUJJbmtWWVNEQzFxOVh1c2RETWlFOVppU21KSWNY?=
 =?utf-8?B?MzAvQnZvTXd1bnVEVktBV0EwdE0vUWFrdUhtK01SRnJyS1ZRYkVobW9Lc3dz?=
 =?utf-8?B?VllhOXRzV09ISjVpRGFscDM4QUtLdWxXSUlkeGdCdEZQT3JTc3laeVg0c3Vr?=
 =?utf-8?B?d3dKVGZzWHdnVlZDMVlvTVcwc0hsb0pPdi9yQkJRK1FLNjhGZnBrQ1ZDMlpy?=
 =?utf-8?B?TUFSVTEyMTZnbVQrTU9FZk9CeVk5Q08zWkQyRWU2M0dXWW5kT0xMRnFCbSt0?=
 =?utf-8?B?K0ZVZlVTWmJpTXhjZkk2UTRNQWFsek0xV1hqOVhzRlRObHhSeGtMS2J1Y1BD?=
 =?utf-8?B?YTNzT2swalcvRmhkZzhwUmVxU0I4by9KNVlZQUdtZnQvWUVGcXU0UGthMllV?=
 =?utf-8?B?cVd4MkN4ZGFiSkg0T1MxYTMzTG9MYzRSV0FCVlljc1EyWmpTR0twenVCRHM4?=
 =?utf-8?B?SmU4b1kxRWZQTXBLVEZkT2s1SFI3bWxVM0IzbHZFRlpWblRrNDVlRUthamhT?=
 =?utf-8?B?L2lUVTFvQnVQaDdoeTV6VUc4UExxOUdURTQrWVZGUndqR0h0UmFvWCtrSkdh?=
 =?utf-8?B?QkxBWC9jWFlLWnNXZXBoeUpLY2djV2VVUlFNUGpRV2sraTNDY1J4d3dYWkNp?=
 =?utf-8?B?SEFZM1FUUFE0UFdoYmZ3QXphVHBuZDhUM013QllHSHZoWmFHWnNGdWFxSFZB?=
 =?utf-8?B?MG9xcVp6aC9MVWJRamtvdy9LcHJQTyt5a0pQa0JrSXpObU1TZlMwN0JrYmZZ?=
 =?utf-8?B?enM3WW1qY0QydWFZUzhib0xqejBxZXdaeEZwbllXRWhQaVBFVjFCZlVFY25U?=
 =?utf-8?B?bTdERHVhV0ZMdmkrSzdLRUhwVVhFSVpPTk1ReHBBM0RteVZmVXhNWTdVbzlB?=
 =?utf-8?B?SVFrUWxSQ2dpZUZsaDVxRTlpdHRXMjFTRngvZEw2WjdCZW1qN1o4akplNjN6?=
 =?utf-8?B?bmdVSGFNOVRkdm5Hb2t4REFScDdnT2luL1Y1U3BqUHhhQVcrUDA3ajcwNFN1?=
 =?utf-8?B?MWxtdnlWaWRJRldKN1JmK0dvTG9ZVElOOXRYc042QTBzQmE1dkYrNkloMFJr?=
 =?utf-8?B?ZjI4WmlJU1EvY3RSNThNQXRlLzNpa3pDSUtxajhsMndHd25LQUpFOE12M1NF?=
 =?utf-8?B?d0dTbU5yZk14WnNCYTBQckQwTmJuRThscDBCc3FoK1VadHA4OXRQMGxhZjM4?=
 =?utf-8?B?M2wvaXdQZ29EOVR5ZDExQnl4V1JTWlZrWjVNV0NtNXpPWWRBK1ZTZSszbzRR?=
 =?utf-8?B?bUtoRklRSm9pS0VxZzZBaEV0Sm9sd0p2NndLR2E5cTZRMjBNbWFCOTJtU2Er?=
 =?utf-8?B?cjBzcFFZbktXRDl5VVFGUXo5Z2pHQmxJblZEbHYxN3EyTUdmNEgydEYzL3hm?=
 =?utf-8?B?T21ucW5uK2JXbnFYMGxOUUo0VHhUTFZXR2hHSmdTK3ppMVdaOElqeUxhZ0Z5?=
 =?utf-8?B?Q3IyaGRwNk5jTFlxd3h2eVNJdDBMcUx2M0pnTXdsMmJWRVFVbTduNVlFRjNj?=
 =?utf-8?B?TTBONzJnOEFCaUZzMzI2WlB3REQzY3dNWTVMcWxXL0tvWE9hZ0dDVzF2VTFv?=
 =?utf-8?B?MEZxVjREeXpJMGtWWnJnb3RnYXZkUllnYkg3T2h1WU5WWVJEakwySUcwRFFh?=
 =?utf-8?B?MWQrZ3RnR3Y4ZHlZNExsL0JPNkN2TEMxWmFTeXhmSEsrd05RY3I3eXp3emNG?=
 =?utf-8?B?NEVzMzVvNW16Sy9GZzZuYTJ6enJaSjdHZGtPRDNoeE02ZGdHMm9ERnUyN28z?=
 =?utf-8?Q?xsds/cKJqvKcQC5ijTMrqxGrrxw0s04J6NDWX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca42c7ce-b202-4ef8-6e76-08deed0fc64c
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 01:21:54.3113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11vDVASFd4XxQt8aCBv+NFkqKNhIvvPToJcSY37xa6cUz29vGRxNNa1tn5Rh12W3G0jKQGBE8m96EnrgMigsCIX38hglAmc4X4PdSzI2atbfFyUKvgIROGDRmXGjcQ6C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12274

The imx_rproc driver checks for the name "vdev0buffer" to skip mapping
the vdev buffer region, as it is handled by rproc_add_virtio_dev.
With the node named "vdevbuffer", the check fails and the region gets
unnecessarily mapped. Rename it to "vdev0buffer" across multiple i.MX
board dts files to match what the driver expects.

In theory, dts should not change because of driver expecting, but the
dts changes were landed upstream at late stage, so correct the dts in
this patchset.

Not critial fixes. No rush for 7.2

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (7):
      arm64: dts: imx8dxl-evk: rename vdevbuffer to vdev0buffer
      arm64: dts: imx8qm-mek: rename vdevbuffer to vdev0buffer
      arm64: dts: imx8qxp-mek: rename vdevbuffer to vdev0buffer
      arm64: dts: imx8ulp-evk: rename vdevbuffer to vdev0buffer
      arm64: dts: imx93-11x11-frdm: rename vdevbuffer to vdev0buffer
      arm64: dts: imx93-14x14-evk: rename vdevbuffer to vdev0buffer
      arm64: dts: imx93-9x9-qsb: rename vdevbuffer to vdev0buffer

 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      | 4 ++--
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       | 6 +++---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      | 4 ++--
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      | 4 ++--
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 4 ++--
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts  | 4 ++--
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    | 4 ++--
 7 files changed, 15 insertions(+), 15 deletions(-)
---
base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
change-id: 20260728-rproc-dts-3f331df7ceaa

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

