Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010020.outbound.protection.outlook.com [52.101.84.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B9428D8F1
	for <imx@lists.linux.dev>; Wed, 31 Dec 2025 06:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767163649; cv=fail; b=XGPp8YwNHWe6VN+RqVbGNO0HbLykb7x90+lWS4fpyC00+1P8Yd608fv+nehfDlSTOHVJdiSo3yuGY6f5RbgTDzMgXU0+FwG5qjF50ECnOYUiqFRIg7Hx8MwxLeDk1fAo3oYg5TwmIkUxLfbHniW2YernkMajhvJC4xsNvHOesRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767163649; c=relaxed/simple;
	bh=iztcw5EfuzSsuB1CKPtypxHS5cKeXxxnTH1lCa2/3vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Se86yOyCQrzt+LJtTFGAWaeexx+z9sT9uCzWzIGW/vomxw8OPnBjrqgBGyOyc2fvN3ZJqY4tI4opC2jsXxDnDXn+WEwm7ra8htM2g0+9aL9bZzi2t04Nc5PYv4x2DaSYCPkl6nfRwhYjRIvU2wxmzpPlOKAUa7uOFk9ABDj9N3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ihPyX36X; arc=fail smtp.client-ip=52.101.84.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ihPyX36X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tTsrpRx213WKZVvRedgnpSFcrfq3mVAgofQ5bCZB7W0gInFO2/xrQkvCKoCobjy3kQSJ4eMIb9FaRMHq1DgT3L4klZbvylEcgMzjELPFsPPVyIfMO5MqjmA7/iSarIVhcng+uF25jLGFm445XMljiUVgngixj9oZmpsIsnPQLG7sTiGz4ZvxBfKp03obruEE9a22x0CdQGT2/K/SQquB2UIefbEAKIpQVYVX0sthzWqQjseK8TrDNagQhEyN6ikfCzVzXA+hblkGKheARrGEpQ01CZUYxvgTZ8OGl1JhbzL4mD8Jf+n286+38+tZ2TZbECgV1Lq+f/VOVd15Fs5H0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iztcw5EfuzSsuB1CKPtypxHS5cKeXxxnTH1lCa2/3vs=;
 b=e10DeYTj3UQS1nXH7KnqCRa8ro4df65VVJI7ZYKjK4AXM8Ww1RpoSldzNDcZmhdg4FQtIrB7yZzQwXAknMM4btvoRgKZKF/bMdojZQYBURdPLS6vmxNlf2wLoG/0c7G2aLTbdi7tLNQEG3+C/6OZyTjN5PQiikJuzWBtVL2KvpXJQ1ob/tKqpQdDKrlsJ+nIVMQ13rNvgeDS7GsA04cdcBVlUk3o+i1+cROm6FcvTDB6BYn5gsSk+86c08jcJYdd0sKVHlVehNGto5dzWmb3W+wgm1bebHQTEHy0l1+6A3fbagu8hzLGGX4heyVyZWF5AK59BTjA3G1LqsKORqHIEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iztcw5EfuzSsuB1CKPtypxHS5cKeXxxnTH1lCa2/3vs=;
 b=ihPyX36XlmqNuwSgX5oBBpWC/ceOGcofOk/QNrX63aeP6KZzJeyc51ljkQ3jESNk4ilJ5O+cGggmxWoJcVBFLADBiSJe1ZwK3EjWDea8pfCfDIJlxKxNBRJm8zskvKfO4RGnU3symoGvZKHdAo91rS+xHcMwmD04+H9mrk/mDeVnZJldbIc9K4QxHOgS00PdDAMWCWzhM0ylp7QOiPdg0DtNeKuwnF4B7fTNEgiDq+/xcdAxRK2NjY6ZVV5VnrvtQPQEsBU9RR+nsgiHp5Csp0+LpbJ7Ln8kRyeXvOaDjzXVRyJJhoUOmoMRViv/BH2PXw64ykKRsR4VRpamLDbhKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10110.eurprd04.prod.outlook.com (2603:10a6:150:1b2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 06:47:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 06:47:21 +0000
Date: Wed, 31 Dec 2025 14:48:41 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH 0/3] soc: imx: misc clean up and support i.MX9[4,52]
Message-ID: <aVTHSVvdJ9DUW3cv@shlinux89>
References: <20251217-soc-imx9-fix-v1-0-0c763c2dbe29@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217-soc-imx9-fix-v1-0-0c763c2dbe29@nxp.com>
X-ClientProxiedBy: SG2PR02CA0093.apcprd02.prod.outlook.com
 (2603:1096:4:90::33) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10110:EE_
X-MS-Office365-Filtering-Correlation-Id: 6991233f-94e8-45a2-50b0-08de483872ab
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4bCVczLwDn+76hmZnVeVkHnoyNKIhaWjt/6SFMJEEVAdko2rq3zxfr6/sNa6?=
 =?us-ascii?Q?Ig3ggtHaP6OxOKfKFVqc+/HlsHa082u16jLyujLYq4WFYAl7V+BRPFYgWjZU?=
 =?us-ascii?Q?99NH5S/nF+62lAk75vtJ2X15n5qujOeCo+ppQDAp++aIpF0Ty9bivaeAuxh+?=
 =?us-ascii?Q?s9TmYF6FHJeeLerhpPJNC45ddV9IHV7MxKgtCYHHvPr6947KfILFm6twjcIf?=
 =?us-ascii?Q?I/cwsnJZzG0GLiN6jzxD2ldhGEABeSNviTIdYJ7oTILT40noOLHWEiCV8B9u?=
 =?us-ascii?Q?/gtuEGxd/pu3/QvKaLXkSF2vhpjFbjUAIES8Y749toXJFXS6pQ93tO5IX0Am?=
 =?us-ascii?Q?XKTCVu5G7W5FZsciAP0S7rtp43n4ZCA+cAi9RDw9ssO4pSop3c0AQlnksp0c?=
 =?us-ascii?Q?4cwsHI9H3kJM3YvuloL9PbKcGnNASuGecb6hOJYykqgpppQbnsQqgV+yjzu+?=
 =?us-ascii?Q?geR8zygNZRYFcGYctyP46RKP9SM7AIvftyb/03JUD30TILq3IKsKuFPMVJXw?=
 =?us-ascii?Q?oCVGdgJ1V6hFq30J8Jsd7Y17cUbgQl3nyykTZy+vnHfH9qbCWYv9VpipqfiF?=
 =?us-ascii?Q?D6Ji1VEPDm8KTldyG4K+ShVKQkdgrO3fAQEblGTRYOtVPD5wqAPFoCsfLme1?=
 =?us-ascii?Q?FnmPUY5YA5ZgcxSIUVXLkTLMDgFeXILXvGjzWACbDT2VAdILJqw3FsKJKb5A?=
 =?us-ascii?Q?rmbIASjj/dJ5uN+M0EWil0Cb6/dByuPMdVH04LgoxIW5RJ7uvfAgaXaRhmbB?=
 =?us-ascii?Q?tu+Jr3eeDVoA5Oz/kQuWBIK68yL4JSXGfj4jG/okfh1Y9OniPZBSC2cAwWsh?=
 =?us-ascii?Q?frZQnBDvw6Fl8b54JFL24WSL73EH2JfbMrb9sxLw0KlyiY75EAtYHkO8uj6w?=
 =?us-ascii?Q?Dn3jaKg+bQTwXg2RMm1KfdhzMUcRl8C+eL9zcm1NNnij0FcqCsKBK5MXLXVo?=
 =?us-ascii?Q?YVcCqYLEEKRAS2xxYv5Oj+k9z8AJ6S761VCZmfNix0kXJgZGxqTDaZeQLoVu?=
 =?us-ascii?Q?nGD9ZBAfKfWRk8c/eO0zDoVlLuRN/mIslg7GhT5WlK+t71aV3I+OVPwpnaw/?=
 =?us-ascii?Q?ecXA3LwPjhlsj8M3k+m/cvgYYh8MntpOFMtmCAZO/MMCGlXqkYYpZNWiUXKA?=
 =?us-ascii?Q?l8CGbY+MTHy/PMA/2zFpPj/C00SPIqO0mu5/gW+Uwk/r3F0tL0BHhPlKmZJB?=
 =?us-ascii?Q?xu+0N09WkoOv1TCx3lfuAX/j1ryjf04lyJ2B2LDjEr4eDDkZybQQtk2GTPym?=
 =?us-ascii?Q?cTXPM2WslLRs9Rmggh0nQafy26Ug2k5vgymMPINZ8sVg293g/oHbeRRzEWPi?=
 =?us-ascii?Q?Eopq9+gbjDfEQOb+QKXQOS0MxxpuIT7p23rpYbKO01qftrf4XwLBMe9BQNbB?=
 =?us-ascii?Q?0/zBaW0ebwK5/miZnkOQiMJoizeSaOdqeRYvYQG0VUZDcJ1M0nGgva9rTwGZ?=
 =?us-ascii?Q?Miy+DEZDDW5y6kr70warvHrd5MvBqi22pnilE41nl/9ahhQiKEl1U9UrPMJG?=
 =?us-ascii?Q?5GEkci1r0XWEgT3TYXOYTn3MWgVsh5FMKfxd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?95C4uNBTXxDT9Q9LfTZGjTgICPxaZhDzmD4uhu8N72jBRuHy1CRAJmQEkkOT?=
 =?us-ascii?Q?4S8cyywq/z2Z71JPQ/2ggOusd8tlK5vKwbkRoLN4TaUyhssN3S22aXxfr3+z?=
 =?us-ascii?Q?ARGM9v4v6f+ygJjc9d8wW5WnR5pOo0oz6r0pzol1ESNA0KLMmzoDx+2NwcOH?=
 =?us-ascii?Q?JmQe7UK+Nib6zioL6lyobEhxrmwwsdMQ3N1Cv+S7SJTssVaN/7D9eNhqHyMM?=
 =?us-ascii?Q?apnIxfgA4WRoaFASupo7Zmv1s5Yp1QMatbstKhCwTf7mP0j+2HQFj9f8+TMG?=
 =?us-ascii?Q?G4zQsU/MaI4ip96b1xyhhJn+AFXMZ/gDlpiQuhRKxblKG66xz+qXovkOYXMK?=
 =?us-ascii?Q?MGH+JQG7yo9b84MrBGz1poezwxW8OzS4tfLUZznvKK36OFqG6i5wmKg3Unqg?=
 =?us-ascii?Q?0EKde1olPtxfoxore5CCTo3lCigutgbXJuUy03vFmTFh6lK/uHL4I7IClhSc?=
 =?us-ascii?Q?lfR/sGhBNGA3wmX/O7n81vzxCcCL/ERBtUYAyNfoETWhfc+MzSorRuhcQc27?=
 =?us-ascii?Q?y7URvRpHc0aeR9ZTpRxURZlrTN7yJcd4+e/Li3OgC5VqKUJQQVL3udp0tCcA?=
 =?us-ascii?Q?Dv45cUFwzvn0cegg8liRE1XQV8NgK8WIN3NDQvaP3mPX3JZdn7Iv0FELLmsS?=
 =?us-ascii?Q?c2ZsPwzdTOmVwEE+6GLupr2nPYCFJ5Ol8LQd2mwZRs7COPYA++uwKgyCpqng?=
 =?us-ascii?Q?bSgveQswuKGY7ZOm7ad+KcRkWx6XyaDulWI+8Y9kD8ecSFNElkuvzkcwIACq?=
 =?us-ascii?Q?pL+jOXz5i4zyWLxC6xHUuKaoqss/oQ3yXRmeiDAy5ISF/Gvr2fXFyUlJz3QN?=
 =?us-ascii?Q?cjclK6CE5bnN7GQcUmGPvuyp11xUryaCNUmtn22kMQwP8EaymVQRMOZuzqgP?=
 =?us-ascii?Q?1fDSPpEKVgMYEOe4M1lTiKaV7DBThw+6Ocgifgx/zUpM+xvu2xIuKuN1cOaL?=
 =?us-ascii?Q?2gXFyVYQqPdYky9/KXTHlyXF4eyYLDQOorldVicoL0vIzF9YJOZKhUa+5LWM?=
 =?us-ascii?Q?4Iy+xzm2bHrOlkrHt9zuVTUQa30bpMXZ/xKcWFxh0l1I5FP+40fJxZMxWuZZ?=
 =?us-ascii?Q?9rMvJfsVwlJP/a4QUHvfB10HNPRZcLTgRj2dmn7MAcunodFglWqfpbMNhxsl?=
 =?us-ascii?Q?CNIlO50tF57jIkdukyddH5buhs6PUUabjiAGcTPnn4HDw8B6dInvtBPtDxBD?=
 =?us-ascii?Q?qymWdzZ0/aBpw0T2VNqVnRA7cmn0XPMFSu+DpVmmbSLQ4q1VJIn2/0Ta8d1W?=
 =?us-ascii?Q?3YZGU+o3T084Nw9Jybf4f3NXnPrWmGEyj6B1xrML6iyjXTg273D3ZxUPC8Me?=
 =?us-ascii?Q?aKJTqfGRx+0hSO0nzMxkReNaswXPhoktTLohVxA9P/oBM1uloxLfC7f3ozcw?=
 =?us-ascii?Q?6Pjjgr6jG8AfnuZyQKemH+HojO/MxiBAyeudyfNsKzUyunzAjLlWvxI6oi1t?=
 =?us-ascii?Q?N54/oZKgVE+plpyXzWyQTWzmgOtE4h4kFs1I2LoJy/rOydStMSS4SPfFz0i4?=
 =?us-ascii?Q?ai1S76xGtgXjpTwLdEpyNFBJn/Bw1FJO/BxBfZcNkB5Zq1AhMccC4LZWuQGH?=
 =?us-ascii?Q?QeZ01aSPxYsNw8VvETwLQ4lAVgyqSsDNy0N7ZqsUMXhCw+A/gu3Nfjwk/Cz0?=
 =?us-ascii?Q?JfdlKnHxcVjDPRmrQeZ3V7ySqIvTUUzVy80u+drGPN0AWbvblcMxshXH34s3?=
 =?us-ascii?Q?yNJc6nNQ5GtHL8yDSxoXmbQPMI6i2hOCJo0qigjfW7d4ZN+t0/4fCLj1cajO?=
 =?us-ascii?Q?RPgL/Rl9Sw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6991233f-94e8-45a2-50b0-08de483872ab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 06:47:21.7383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DlOITZO3dnDunhjX3MKGYgajeycA0S58A9wImEAA0/x5FuWbmcTItMrjMl4qiS8o6z5DAiUNNEEUqE0Zdrn0lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10110

Hi Shawn,

On Wed, Dec 17, 2025 at 08:42:06PM +0800, Peng Fan (OSS) wrote:
>Patch 1, 2: Use device managed API and dev_err_probe to clean up driver
>Patch 3: Support i.MX94/52

Since you have picked up the binding doc for i.MX952, the comment
in patch 3 from Frank is cleared, will you pick up this patchset?

Thanks,
Peng
