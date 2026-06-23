Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010047.outbound.protection.outlook.com [52.101.69.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EA03BB108
	for <imx@lists.linux.dev>; Tue, 23 Jun 2026 06:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782195525; cv=fail; b=Zu9uLfBGECT8iWBAChFIDoH1j/QCdIdx5MFjqbRGdaXJ8Neb0GCqdV99O7b3WdlXuKPTDlfGyGoE8lk0YBgpr34gxk6ZCWL5F3BwzJSf4XRcff2ad27PvueRWWyST1+6XMC1OblHiFQC0f1p/rX2r3bLscCOLC+8FlT6wCYAXv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782195525; c=relaxed/simple;
	bh=dPzyIQ0+hP3LVyXIF/McueTe4GVzbchxBjBVOeR1s3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lX/tmMGsPpMhDUJrsxvHDo6hZpgNrIv2TZTOSXhEEDWluqQsUgssn+LakGlV2Ih82cGKuuBmI1PK9MQosm6BhcYyPyxmb6pulIx2gpVCpLkgRFT0RNxkp6HU5V6aFjDw4UnDjfyIc6nhdNXKhY34OH3q1O3zpqdOXevI6N/6roo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Hm4xDo0t; arc=fail smtp.client-ip=52.101.69.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Hm4xDo0t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4mt4PFVGibB/iQ3n9aUZosnpVi4Z8ZStQjiC2KjZKiwQg3LTPJz0098StbEr6c5tuh2sVy7LK+WyRJDSe+MSMwO5ZN1vQO8cgtGvPYw58h9ROnXfi9DNL1K2Y54hh23c6HKMtnX5hklydTjmezUY2BTokeFPAzF6dnolebkhgc6LMkse3I2CS+Rp2H8GmYms5n5i9QmLjll3QzeAeXoNYXLp3qlaqyhjH30eLc50FCEy3bk9CsE0YuP9n+HsTW2vf/eNQ8z771x6HGRYU3uV7mQXwYbyMtQrfk/auit6dAKKBMZZEcjtXOuTlCemybNqKJXAL2Ok8uVioQ1kxK9Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMLErjs1o4nvE2S59GnJKu3s0AoeCqC8vyrzrdvpXH0=;
 b=KQE9f8800tsxvJuTN+FVHy7PIA1rdj2bPnUrvr4o52MKrl3azr/JsMC4ifFN1QwAWk4B+3g/70eoZ+uAcU90cvcpf6Mdh5nmmOMAh6DdOH5FKbdIo/HZQZyvvcqN2uuIIglU2M+yWBneXd/wZ5GsqnRXDREs2mWMrqEDn70kAJsjNcZmpnPqF5bhT6q9kPBk03KyQMAcmxPHmvefMplGQOn/QYlxUgsoK9VO4AWnPnGtMeJl+eb5r4glT9DmJ1owFamZX/R6JMA/wwlKGaZLyd1tWDthwVD/+cmmbZughf5JQwWKTD4Gwh+Y9SMTKtWrBSx1bwjkFro+kGCy4UTlPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMLErjs1o4nvE2S59GnJKu3s0AoeCqC8vyrzrdvpXH0=;
 b=Hm4xDo0tRRq84OGXCzLCdx1v2FP55YzZ3pnT1luJLZtMDflKXNuBP2RPR7/YVva/mcrX4H6MBFWw9eLqk8KlrxmexuwyBcvNHPpNZMsEgHg1Fsqwiocd1BERygTpFF/WPB4dh8X1c2hNw9zhb8ehpRN3zoDlcT/DEEWS695LlOTb9ZJiMAyd+7obJ1iu0GEDo8Mrun1DZjl3y69uhdheVgiH2cTKtDmgc5rkbQR62NJNbPu1FrHUyvHjK77KaZj7/Z6d93bhrJgBsw3vOQ7ZNB2jUCBT65zE9kzvzkpm7C87XDLLYrDBDCfV8TNP8IYcb/2Vf8JQfGB72r53kVt9jA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU0PR04MB9300.eurprd04.prod.outlook.com (2603:10a6:10:357::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 06:18:35 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0139.009; Tue, 23 Jun 2026
 06:18:35 +0000
Date: Tue, 23 Jun 2026 14:21:54 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: freescale: imx95-toradex-smarc: add alias
 for lpuart5
Message-ID: <ajomAoUrhUyJ349X@shlinux89>
References: <20260622093507.44132-1-francesco@dolcini.it>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622093507.44132-1-francesco@dolcini.it>
X-ClientProxiedBy: JH0PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:990:77::19) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU0PR04MB9300:EE_
X-MS-Office365-Filtering-Correlation-Id: e748dbce-852d-45cf-c36f-08ded0ef4193
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
 vd48/Q/vl60v4Q6D9VF4KvWLz8g/fCHd4KEGaagf2SAc5V/DoTfubMo54wdHAlIW/f/vBIhGHMyO8lhAUaQ10qBTfH5YU+zUX79ri56z7lMRX6V0Lfqbd4OEjwDpv40Sh+k+S3GtlDWIAnvO/axdRtvkOnshN5XCIp6ETgZBnhGrZ4H2oPc15jWwlk5aZQoslJVsxjQkErdCWx/cvfSI6OdpxuM2UvXUA57ZrEwv45LBD0JWvbxtDjt+T0+ztygAokcx5DhcWcur3a2hfc1MnRFkRnc65OhCgxiDUoZUdZmGpAoGsvY1vWX/jzqg3rzcSKiZoVMCd3n1alDPTMmj7OWBcpujKFg2Jt2Mx5oFta8ucV8lgwKQv6YJiOamBBj2CykI/N6HpxidPJWFqRcSQbHylreHuiQagRPeX7Apvgbw8iGi+PIStHkV9BuGh1gYxcZZGYjiI3lxXDdPyNsfU+4YlxCOA0eNBNXcUaLIJqieMhQTApqfEbZrppP1CDWeKuvPqZVSkpp/kzyyoVhBugeqRdv0Jvc/unBlUFn+1E+MakvbCnJHyOcn3CoRUuxx0B/qHkczyreUPO9BmYwYMHisk9W17NirzeeKimy9PDSDmIkPFTZs2UgyhdbugOCtiBVRjBsROlf/H/TnhA3A97pQhrtLreUd6bo02VHaBUI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?7+77A81GPmX6YC9+eUOk9Lci50ocmjyDO91b5+P50WbN8H+Mtv6MoBNcREbG?=
 =?us-ascii?Q?izNGOSFL7J4zU1Sd5inumsKFkOOeVnG063yrSq3qFDS2p6Dv558wCte+2oYt?=
 =?us-ascii?Q?N39IF6LLyP7SMxZayVkVPDy3mdBQQA+nBgYChwbZOi9o1EaWsc35e4RzgfKp?=
 =?us-ascii?Q?6tycAueWyXQZ8GuD4mIRs+FtVwKiHCIFEG5yThFG4K9XAWCUJiNnPeMyDJyT?=
 =?us-ascii?Q?6GnDIT/AcsI5O8Zjh36GaDrrMElh+cjy/80I6OmLz9caXK8UwYbUNl0FAbLU?=
 =?us-ascii?Q?PoiPZFi/g+tGNsK5HOCq6QNA/iTx9aDaTMvUhKoiVmCb+sa+4pFwGXD/mxqO?=
 =?us-ascii?Q?JkOGodiDyck8eTf7z+RAr4Ghx2R11dPQd/Blv3YOXMKfeoqHOylTuraxzyKB?=
 =?us-ascii?Q?xenZ/4ouJOpr2Rz/+vdXRTFcJoP66JJeWFjL13gNfsc6+AJ4hooUHDH/REhJ?=
 =?us-ascii?Q?lEZieUwA8oWP1FxV32eHP2W/EGnSNIhAC7zjf8uTZAG+Xkfseg/Fg4mSF5wC?=
 =?us-ascii?Q?j6MKtGlbDsRchtZjB9z5RYxFQibpNd+4pJZTWDcqxrrLaR0eFq/2ouuaVa4S?=
 =?us-ascii?Q?VlhCyWfyhi+dMnF0sRmswrZlOOGrAycuSBQvD4hNRrQ/zxdUa8fPN/gND7tG?=
 =?us-ascii?Q?S1q/xeKaEZo3doKxuJMyL06I0c1/iniRh3jNs4ckBbuZCKT/NZx4ySNL3kZl?=
 =?us-ascii?Q?IhiFm0u5b3ZGyVtDQNYDmdWUIEhAIVSo12+R2AOS4bISi83oNf/3idSTu3ck?=
 =?us-ascii?Q?tzjj4o25QcQA9Cw09fBJ4DhMN/bn5P6VtuMlI5aZxjjtJcV6ODqn/TbiJRXI?=
 =?us-ascii?Q?ozrexNxBTsJuU/7ZtRhgIb8vpcABAgrlAMR/LM41S/E3hZhW2nzzpjMJMvz2?=
 =?us-ascii?Q?kbuef6+R2De/MqiLRqAADo8phn4qpFZ3L9775sFQhoENMayBClamWnZv3rKv?=
 =?us-ascii?Q?mma4eafJIxSOlm5KXkdlHsd9uZlIltb/+xn/57ekWIk+n5YUamdSA/mbbfpQ?=
 =?us-ascii?Q?KMRNnyEAHweMGl+TMSIURHgycBsKi+QiVerK+2yn+QKCVS/J+NDPV/bcVlTf?=
 =?us-ascii?Q?7h5zwG3FcydObHwLMJOKKREjCq3EIQIsBLQl6A45gjjvlv7TJ4KdVc78v2lC?=
 =?us-ascii?Q?YkLbYqj9+vk8/35OPwuG9aD2CiQt03nFfOy0tfAjiMaqOdMjdmdXDsyFuajN?=
 =?us-ascii?Q?zgItKW+sVHS8YEf+RETLK63Kc+jXbReovLPpEUk+cPPfwVRtZXPyMNfoq6MR?=
 =?us-ascii?Q?iDqW5gtoHGJUzFQuRDEFIrk0GdM+WiicgC5wLF5FAtRyTchLU3x6N9tsMlnN?=
 =?us-ascii?Q?HFZ8taLwlbadBc4LDF006lmcE0sN0yfEQBVRwL61v3hc4t0MaYDUs224OsaN?=
 =?us-ascii?Q?2QUs6CZLm40yvwBHqCBp+xss/460ldImAKS/2jZy3bLlylLSQOtXGyKVyvQ2?=
 =?us-ascii?Q?nIGaaqAuxtUq6GfY5+GgGVIlvPt4e7o5IWUyZQmD7ahGrhJOnQ7fl00w6ahP?=
 =?us-ascii?Q?rIUGCm7RiHh3xpp97ZClEqIq3L9PbZ8th5fJ+Km23bPo1c7vAzNo7jw7wK2s?=
 =?us-ascii?Q?JAfzNqCKWI1lMh1dpGsZVySyEiVI1Bo2hli+glvPJF5hGWBT8APha1E8NPQ7?=
 =?us-ascii?Q?YHEUMw4wwvbXhiC20FfgGyW9HWwIrX55k9GlYVqANGsRI6WnAQOEwMIHinjk?=
 =?us-ascii?Q?CAGEQzr/xaHURkOsFgPSsWvWI8aYyRSifkPHgOlxv/s+cg8P2/vUuekNLdi4?=
 =?us-ascii?Q?aSN8lMOG8lABdHBxO6ZPERlXObAtVuwRo89c2ourGxFeBLZxnsas?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e748dbce-852d-45cf-c36f-08ded0ef4193
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 06:18:35.0371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/dBEMUH7ZcnL/iMbrm5g7k3RnNzvcotdan9GfGWhS6z+cLcaKTi+i5l8ZgIpE1C31/8VIbvbD3J9nkVfeMnU+H+wsor+Iln6d5ccsXorEdzwzSq6DcjEuINuOjx8URL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9300

On Mon, Jun 22, 2026 at 11:35:06AM +0200, Francesco Dolcini wrote:
>From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
>Add alias for lpuart5 so the UART gets a stable line number.
>Without this alias, the lpuart driver fails:
>
>  fsl-lpuart 42590000.serial: failed to get alias id, errno -19
>
>This prevents the Bluetooth controller connected to this UART from
>working.
>
>Fixes: 104a391bb6ff ("arm64: dts: freescale: imx95-toradex-smarc: Enable bluetooth on lpuart5")
>Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Acked-by: Peng Fan <peng.fan@nxp.com>
