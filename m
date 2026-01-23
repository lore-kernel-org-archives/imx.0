Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010051.outbound.protection.outlook.com [52.101.69.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AFD303A05
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 09:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160142; cv=fail; b=gDvn2Z20JkUbqBbu1u8QFDJCf9BXBEPeKogtO4bZAlyCjxA55BBk0Pmhs5UEYFBU+12HQJITIwZb/PYQHOjT4AMYPZJiFqKF0lHLjPOg/Ka8wzTSVs1wHz9PkUz9jKjZLiapmwIsVAgEKhPzsRKQJMd+N2ox2rukulqnPR68SbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160142; c=relaxed/simple;
	bh=vBYLg6MB/49NX9jJSqbrYPxGMXdtU2sChQUuTXKDNPI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NissiNS+2U+9UggAqDgh5GfUHHNQzgSi1XZhX82to79Wg1z8fx3jHcQIJ14KfG5BzqI4/wqdHyGA2q2EV+ZX768augSgnMMtQwm1/WaLrDZAsT60AIaS7vg978zVeEy7GuyoZdZ9PozY2gQXi6dL6R+o17MICPCjyQFhsf7jfjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lJD6wMJY; arc=fail smtp.client-ip=52.101.69.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lJD6wMJY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBh9wt3c2YO9smhi+xwBcsLEGcH3tn7IcFeHM8I1DHDVRRn+kvwDjnUcxXAhOBuy25OaMvDQGZyGMUhPjJehkfSuFYOz6wxII3rs8yRWMZVuLV5wbLkEPtGjpsF/TTONTTknrED4k5MIGYEuROedeU6cI9MkBsH7TB836XNPUDGlhpkEdtTydL9LetjGibEM7Hl+Mo3WViJ2QRdPPheBj7l8llcBUXEaHeuMhL86lkG0UL+PGvAOBCD64lwN8SQM0qm/b6fV0Re5paqnnlX/91sM/xQPtAinICS4UFEERk/QAlmlw/aUWp/tSqKDthcupRP0VgXaHI3D9lA/Ub3QVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTYXBBmedN17jfeJ0wxLtYJVIEOaErImuFgiC3kkdDA=;
 b=CjEJlGcaqtzcc7dAu8Et8xj7LFurPNaCcA54TLZjP9z6jjYNjSlmrg29ugc+VST21V7jtgQhU4sA1ItiHDnFH+RNbyxqpV4fuD6ZIBpnhmwrzTRJK0VVSPYpO/EzEVvbRpFPo2y5E/jiNPFOxzq5S24Ayx4Ro507HCj3qC7InxhtOf2BvoGSC9gZPqCMjD94a4ezjpCDbMTigex9qzcqyHAxFksJI9Sn9VVHHRDzH2ttCBk3gFUN/9LbqEyxZsDm7+U06FiYIMNQ7fV5EH3IoxzT6s2jRZ/vY8x120syNy5ZWgHaxZa5LRw9hCwWDd3Xd6a6EbzyuWebjmDd0SpNYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTYXBBmedN17jfeJ0wxLtYJVIEOaErImuFgiC3kkdDA=;
 b=lJD6wMJYUyaU6rHgwOTR/mDbI+rPropAos+KIAx4kHAZgwX/9z/JXFzKCGv/pQj4/MapOrkOSGxo3VV1mu9fkA/BaG2JngrLm1x9qQk2RwVOBgkCRn9NMbqcqSpa1+z8rJzfH1k5rQR0d9ED65MkGVYYk3IpRDPDRnMHF73yx5lT4YP9iFu4gDmD6WlW+mvrYNWY1lfMCe3hINTdb8LNdUFfarHG/eolLMdXsb1WpjLiE/R6sLnBIkR0S+FkzRM5UmciYoIq9Xemi03lhvNlCPmjRzO+B4dWy2nwiKXlqjkVb2cOr+vRWiWp3xLZzQGJPNYWpyzFhBVODvypyQLIpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB8282.eurprd04.prod.outlook.com (2603:10a6:10:24a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 09:22:10 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 09:22:10 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 23 Jan 2026 17:22:17 +0800
Subject: [PATCH 3/3] drm/bridge: imx8qxp-pixel-combiner: Fix bailout for
 imx8qxp_pc_bridge_probe()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-imx8qxp-drm-bridge-fixes-v1-3-8bb85ada5866@nxp.com>
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
In-Reply-To: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) To
 AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: ea7e16aa-97dc-4182-8003-08de5a60e00b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?NG1jNXRMTTFoUlVLbWk1Y1M3TVpTSXVWSC9kNW40TWN5cHptRnp4Mk5HVUtF?=
 =?utf-8?B?eG9Vc1NhQ0diUzFmeHdYZFJoMW9CTi9aWEtuZm11OC9KZWRvancvL0x3S2Zu?=
 =?utf-8?B?dTFXVWNvdFNJZCthUmQwNHljNk1JYVM3aVZvUDVaT2QvbWFhVzhUMEx6c1hF?=
 =?utf-8?B?VUdKbWZxY1hJaXcydVBiOFZQVHdiRE9kVFRsQXZNSVQxa0ZYMXg1cWs1YklB?=
 =?utf-8?B?YkVHNUo3Uk5HNkVldEJTdUhpVlMzYjZhMFlPMnZDM0V4am51aitmTHNrbWtZ?=
 =?utf-8?B?Uys1eTRYajF0TXpCdTc1R1ZQMEhRZXZUTW9uRXNRYWd6cm93K3dremtqM0g2?=
 =?utf-8?B?VGw3S3V2cHJrMDlpNXJhb3hrUlJDd1FmOFgyWHVDTmtEMXpiZ3VaazhLRWJR?=
 =?utf-8?B?b2dtTG1GVEMybXNOajRrb3Q0aHVpOUJyYTlsSmd6NnUyQStMUmdCSnRRNEFT?=
 =?utf-8?B?bTlTazhWUjd4RkxnRmwzL0treVdUVm5ZeG0xTFRyQ2pMeTZlSUhrNFJHc2FY?=
 =?utf-8?B?RmMrL2p1T3AxTU5JNnNmRmgydkU1OGdyeVZZUnpyamY5aG14VXNBMEYySGE0?=
 =?utf-8?B?RHl5b0toTEszN0NEV1MwUGhBTWt4RWlHMUNqcmZQNUtWSW11U3E4S1ZuMDIz?=
 =?utf-8?B?cnVTYkpKWUwza1k1UGU5U0d3ekkrVmo0b0tKa2tJTlpRNlVHVzk4Sm1nZDg4?=
 =?utf-8?B?VHN0aG9GWEV1OHF1SW5sMkVXM0RBbldBOSsxMDRWSWErYnQ4a3JzRlU1TWY0?=
 =?utf-8?B?d2pFZW8veElObFc1YVNZTVRabWZGbWJOMW4rZ1diTEV5LzBiOUxFdEJaekhT?=
 =?utf-8?B?Sk1rd1R6QjI5d1RKTGxEL29aM3ZScGNkWjBreDh4MG5XMi8ra0djbWJtRG1t?=
 =?utf-8?B?aHQ3Z3hSM2NhWUliUVBCcUdPSnNrY2JyWGxWU1hJZTNYNGw2RE5BcktSSGl6?=
 =?utf-8?B?cVNKdUFMMDNlM3BFL09WcEdtZndVSEZSTUE0TVBETklORWpFUFpMSEcwLzRL?=
 =?utf-8?B?ZGNMelpXVlN1SlRiWTZuV284ZGZiVnRDUHdjc2FHWWpXckFDcnlCRC9rWFBF?=
 =?utf-8?B?TllXTmdRRmhhVnhnZXZZWFdHcjlIWEtQRGV1RFpiSi85N3NaL1ZybHJTdGtZ?=
 =?utf-8?B?YXI5dnBBaDdzN3pqUllWNnFWcEN3bnFMRGxMWnp2TEdFaG5SVmRlMVRhTTNK?=
 =?utf-8?B?dUtrU05pQjlROFZXdVg0RE5uSEFMREQyL2sxbjN1K2FMQmF4WGJmSVk5VFRH?=
 =?utf-8?B?Q0UyZDNCalZaQURGdUlWc01RbVZkYW54SjFsNmVpSnlYTit1WHJpQzcrS1Rs?=
 =?utf-8?B?bWNsdmlJZ1Z6R1luS2N1V21TcHZlWlpOcXZFcGF2QVZKeWdhNW9oTzMxdG1Q?=
 =?utf-8?B?VmxiMTYzSCtXSlVKQVZqTWtwb2VnVitoQnF2ODhjL0RWUzMxdWRReXBJTmIz?=
 =?utf-8?B?YjkvaUxiWklHYUZYYlJzVE9qL1czb0d3TDRabUJUMnBKU2FVL2c2TGlTbHlI?=
 =?utf-8?B?ZzN1UU1sM0RpNFp5VDNKY3ZmM1pRdEhRSWRHb2REVUdrdlJSQWRwbDFnNDk0?=
 =?utf-8?B?T21TQXc4bWFqTDZlMFhGc295Z0g1ZVQ2QVFVU052SERrYmVGWmxNMmtBVjRu?=
 =?utf-8?B?NHg2bks3a2ErZ0NpSSt4dmNqKzVSWDNqai9IOXg3RjZ3QUZ2eHlFYTJBdC8v?=
 =?utf-8?B?aEdQUUx3T1pmZytIME1SMlg0ODlQaDFPcytiUHRjS1c0RDFEemtBVVNobFI5?=
 =?utf-8?B?MVozQldUTlVKS25LWDhsbGtjQnFaMVFiRkpNTTU1KzRCU3JOMjQ5SG9lL3Vk?=
 =?utf-8?B?VkJrUmsxYnhqMS9IK1FoT3JiZWJ6a0FtUkFxZzEyTS9Scm0vY1BCUG4wb01s?=
 =?utf-8?B?cmN1REpJSjgzZnIvZlZZL3ZWTS84NnQ3V3AyTFhMNFJ5ei9ZZFVHRFJQWkxy?=
 =?utf-8?B?Uk5kR0JWUE0xS0VYR3VDRklOQUR2SGovZW9RUXZHUVJ4L3dBcGN6TFNabDJo?=
 =?utf-8?B?eS8zSDU1ZTFUeFVxNGpoMWNaVmpuN2pieG1FRG14MUhkRjlKUldFSlNZVTdH?=
 =?utf-8?B?SEpMVzExaTF5MVNJN0ZncHN4YjNLRjYwV3lmRUtoTXJ0U0RoTmNnQ2xpd1Fl?=
 =?utf-8?B?UEM3aXpkNldkUjZseUtRT2UzckxuZ284ZzF6OUNsa0ZhUEpkdkJjZ2pLRWpC?=
 =?utf-8?Q?9+sKVZZ6vgMx5etYE/n+WpM90VCYZdCvTVqr4c4NZyil?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TiswYSsvcUhLNjJ5R2g1T1oxREhSVFVQa3J1d21tY1JvRXlHVDV0TjJDZ1F0?=
 =?utf-8?B?eS9LVE5qZ201ejVwWU5WT3lXdG5HUnlEclpUejcra2s4MnBnaE9EOTUwRERq?=
 =?utf-8?B?Z3UvRUtyZy9SVjE5OHd0cTdtMHhJbE54UU8xZEtNMDBKQXRndk9BQlhxSmc4?=
 =?utf-8?B?Y2pMZjJZaE42cUQvNXhIZ3N3MFJHY1NlYi9WNGFEdGh5Tk5XL3BTRnBFUGFP?=
 =?utf-8?B?MWNweFpUZkxHMlJ4T29FN3B5eXh6M3FXUjN6SHdBc0o0bWFHOVlRMUo0bGpu?=
 =?utf-8?B?dUw1Qis0WjBqTGFKdXkwb2lpVWhudFVqQ2dGVWh6NkNrWHVCYUs4ZmVlTDZl?=
 =?utf-8?B?ZENsQktIUzFsNDcvMWMwVk9uaC9VWjZVRFd2dkphc1N3c0Q4V1BDL2k3RVdQ?=
 =?utf-8?B?TXJWekwrQlF4VjErU0VnSnVXYlpEdUt2VERVMTFMQW5oTjJ3amdRKy9PNFM1?=
 =?utf-8?B?OWVoM0F1YTRjRmNkQXlxQi9seG5JU2JndFZGc0lzQnNETVZNZEdRMXFoRS8w?=
 =?utf-8?B?YUQzQWVHTEFzY0E1RzJXK1IzWHd0bHVlUk1KaUhzQ1FwL2pET2JNT3hjZ1Bq?=
 =?utf-8?B?b0hiLzlXSU1SaXZaOUpObVlNOWxxQ0VYc2ppSEhFNk93TXo4c0hmemlaREVP?=
 =?utf-8?B?M0RmMDZlcDA0dC9KL3BYU2NSaGVTM0tRNEE1VjlqdmZFTTdqeVg1NVdBVTQv?=
 =?utf-8?B?VlNoYVZmQTdXdis0RlhxN09EcXJuaGhDTDFKaTBFVUpUS3NIUmwxNUZDZXlG?=
 =?utf-8?B?V1FCTTR2QldiZnFYbnVHWExNUERacDRnTzNQNHA5RFpuOTl2c0NpK1VVMEto?=
 =?utf-8?B?N09jTkNOR0Y5NWZDS1JzUGxmVnJWZ0oyUVpibzVwK1RibkEvYXhBeWNzWWpI?=
 =?utf-8?B?cFRyNEpTTmNKWUc5QUhEMUE2eDJrZDBLZ0N1bFFST0FBN09hS2pOWVJVeStY?=
 =?utf-8?B?bUVWZ3p5MHRtTDY0RkFTaC9PelQxbk9STEpKSmVsbGtoWDA1MC9VVTNCeXlk?=
 =?utf-8?B?Zzl0Y1RaTzBhMFVjQ2k5UmFwRmprcFN2eUp5MUxzbnFZLzlLNmlhS3V6WlJ0?=
 =?utf-8?B?QnM0eDAzSmpNYnRVMThHNk1yT21zc3dudm4xeCtOM3Q4a29Rcmt5L292L0h5?=
 =?utf-8?B?Zno1QjFJRGR3UjR2UGp1Vk1sWkVFKzZlTTlrY2hDeFk0Y0ZJc3VDbDlNQW1E?=
 =?utf-8?B?cDFEVjFWYlY4bWV2Tk12WWhKaUI5dkxTYUVDYVExd3VvODdyV1FnQ0oyMklo?=
 =?utf-8?B?NE1KSHI5U1FFZmE3ZFJQaFdKS0h2ZnF5NElPQ0NyNlRRVWZuYW41NVZaVmZm?=
 =?utf-8?B?ZUd5cWQ5bldkZ1VNS0E0OWs4RnE1QWMyaDJ5UElkcVNXSWhVeUVBVG5tZzZx?=
 =?utf-8?B?eUtJSHRQQ1F5MktsT3dLV2piTzdDU3hOVkl5RXZiTHlzTXVibmdIVWlMT09E?=
 =?utf-8?B?Q2xNMytRaytJelByOUdzaEVaV0I0dUp3YWk4UjJSbG1RYWlNdUJsSG1obFJ6?=
 =?utf-8?B?bUZiZ05xRk9lOFBCdXQrZVQ2THZ2U1hSVDNKYnlzSlp1bVVPRUE1Mkk4K2Yv?=
 =?utf-8?B?QjFUeGR0L01kZGpkTnJJR0xsa0NGWUhWWDBzMk1XQVVRZXlzbW95U0tudlc2?=
 =?utf-8?B?YmdIS3g5QnBPZTNOZUFLeUR0Nm5RS3FWMDM2YTNrckdQYmFQU1hPT1VMbXNs?=
 =?utf-8?B?eUVQSWNhcGtMQ0dLdnpLT3RmRGhZQU9kZVovRlQ5eTFqNmZpbkxwdVFjMjVz?=
 =?utf-8?B?RndqWVEyL3RsbzIwa3FQTlNFTUxhR2hwZ0pmQ1F2OVA4ZDQwaHBGUWMyc1BH?=
 =?utf-8?B?S21pRmdmVlUwNDdIcU9wOFc4eDIzTm95QjRqWk1DOGNodGJRb3p6ZndOckFu?=
 =?utf-8?B?R0RhNVhCNy9LL3lLbDh5SnpwQ3lTcjF0dnZLbkRmaHRvSWxrREZ4ZTByUHRR?=
 =?utf-8?B?MmMwUmlWS21WMDIyM1Y2WTh3aDdGR1JMQWdYYmNpR0kwenFNZGxybVJsY0ky?=
 =?utf-8?B?NVJja0RjUmt5YVdZd05tdXp2aTFMb1JndkJLaXovZGdNVnViN3RiT1hxRWxY?=
 =?utf-8?B?VkxlN0RyNG5HT3VQZk9SemlBRU5JS3dOb0ZyMnRVWWFPUkRyUTV1a0tCRnEr?=
 =?utf-8?B?YXJvTWxJYzBPb0lwOUhackdXenVaNlV0REppbWl2S2lUNEtzM3ZjaDNLL1ND?=
 =?utf-8?B?VG5PSE1iWC8rWmZxd1ExbU1MUjVXa3QvOVY5UEl2cUVHZWFRNW5DRG0rc2JU?=
 =?utf-8?B?bGZxNHBHWmV5K3FRRFdkcnFZc0xyc2Z1eEZGZmdFTmgyQ05DZDkwdmxZQUNC?=
 =?utf-8?B?TjYzUWdpVVY2WDRGb3p3SmZ2bUdHUkRhSzBRK2tYeWVrREF1SG00dz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea7e16aa-97dc-4182-8003-08de5a60e00b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:22:05.6656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KbnRpspTc7Arepe0UlmTtHTaABKXlRbAnJf7Izt1G1BDiBmO1pjEtaX2o325Vm34EuQKVw8qLI2NnL5IgzcOYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8282

In case the channel0 is unavailable and bailing out from free_child is
needed when we fail to add a DRM bridge for the available channel1,
pointer pc->ch[0] in the bailout path would be NULL and it would be
dereferenced as pc->ch[0]->bridge.next_bridge.  Fix this by checking
pc->ch[0] before dereferencing it.

Fixes: ae754f049ce1 ("drm/bridge: imx8qxp-pixel-combiner: get/put the next bridge")
Fixes: 99764593528f ("drm/bridge: imx8qxp-pixel-combiner: convert to devm_drm_bridge_alloc() API")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
index 00dcd273d8ab..27ad66f240cf 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -345,7 +345,7 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
 free_child:
 	of_node_put(child);
 
-	if (i == 1 && pc->ch[0]->bridge.next_bridge)
+	if (i == 1 && pc->ch[0] && pc->ch[0]->bridge.next_bridge)
 		drm_bridge_remove(&pc->ch[0]->bridge);
 
 	pm_runtime_disable(dev);

-- 
2.43.0

