Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C694F333729
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 20:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771964026; cv=fail; b=kQiIRaIY6s/Q6Q+otjT9DhS/TfGwZ2wMm4txtGPHrmAyMzadUXUPrQ/j8t7MNj8FCO0oXJa/RmGl9zq6ho8iehXGIgDNmZuyQqRi3Z4xOlvYM+DHsXiSAd5hiVGjslyh8ASQpUDOfLkZDJo3ESq1MNQC9Werc7Hkb0ujcrVWjbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771964026; c=relaxed/simple;
	bh=hyfsTp2g387c5CHCIEWY0l1CUea7fcQ5ni0TsujthAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eOdecK6VAn3C9xyXzsx4l0lc8ouAqtOqAPcA7Y8TLNirydnu7ALM4Mhx5fBfPoJgVyJUfVbamueQgKY2lxIl7XswrFGiIreRW4kga6HQ6/s7z3RA5QDAdm/F6hPjDZUHahOiKUC/UCVxBUxw+tZ4DOPvcXMIDA0pr7RycmytElY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SoR6bZSW; arc=fail smtp.client-ip=52.101.69.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SoR6bZSW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4SF/P2XcS/L5fW9xeht3yqDlbioNc+jyRrcTZYw+b7gTTEPdATw/DlhX6sa6pUz/cl+DcEVPUn43siHyYRmnVdg5abb+TVEfSF1N6/+qSNPRNH7viAeNqzV8fVmPKT1jkQyl8qwd1nVIb4tE7aIoxJhzMpqIla7fpvPoBh+DmbIZ72VcqN/2sSzSaU1qB3KWyVqPIIPqEtmtQkTIKUEjulbOx5KVSvaq287L2yLxUfrPW5yGYRHPSBh3laIYGIzaol/kfg8Yb48hS6bWx64w/5MYhTgvW5d96Rl4qif93hhjI5dFultTjYhEn8yu6s87l61cJUsNA37h4eNUXIOXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZrFWGvwTgnT3hYaUjR+vnARqHYDWkYCL249WkYcSVs=;
 b=f6m+Y2bqbkKug5LXEkpoyorH09ckv3n8UsaO0EJx4931cf2+z8GYmQKL+ztXtBMknkcx6alCXxRuS2+NnKAiz64imr1NW5tfbi81sVGFQ//6gZDV+SRQOs7X6+Cus3dZd9QmtArZxsN8W8BAJKPy4KSZnZq0JZQRIG8Xy+wy/xs/dJy9pWnBa8sL4eaY+2XERtoUUfdbnfYxs+AAnt23uPCXdLKuCFbBYwp9sK7L3Y1cTXWmUbLv3LcTq00eLCe/2Id6mr2W5jJfTDPziojdax09efcjO9B+8MrvxeDWVTuFv7zt12XrPEFWQwSAz9jfg/fKjlmatFfnsMq+ivsbGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZrFWGvwTgnT3hYaUjR+vnARqHYDWkYCL249WkYcSVs=;
 b=SoR6bZSWPcBp3bFfk9ghLBxdVM/gQmDif/KckUT57vtQYOEe2WpNePaCFgZfHGBgwtWcQGF4mqnDzB2UvmPu9Y0AcdQhKqQFrMplBmryqJmu0+RK4KM8/g2kzh9XezSmtufoXcSeKTWlTMbYQy0Vq/aGRKHkO3+2GgO4sO3+JLiMPVSQzSPV45C9ibMAEXqjo+RzmQxi4hE6yvO4gFBhHnXKlRuJKNNDhzSAXhVQLbFcffxHr+Pif9kZdglXW2IuBC5nJWQW8jSkbOx1L0cXjqJSyR6YCdzXx3hpARHdB9oEyZZy0uDhfpIKJm8KzPkBG+NbD96hx4IkQm3J0NC6tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU6PR04MB11159.eurprd04.prod.outlook.com (2603:10a6:10:5c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Tue, 24 Feb
 2026 20:13:38 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 20:13:38 +0000
From: Frank Li <Frank.Li@nxp.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	frank.li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ziniu.wang_1@nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] arm64: dts: imx93-9x9-qsb: change usdhc tuning step for eMMC and SD
Date: Tue, 24 Feb 2026 15:13:21 -0500
Message-ID: <177196399474.3268930.16292740313089720894.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203112310.2956389-1-ziniu.wang_1@nxp.com>
References: <20260203112310.2956389-1-ziniu.wang_1@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:254::7) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU6PR04MB11159:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba9bc92-1211-4ff9-5b9a-08de73e131f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2JhZGJKQVM3SVhPMzZ2NWJsNHo3OWJxNzJ3cTlSSllnOHdXaDI0NkQ0VG8x?=
 =?utf-8?B?RTlOTm9PNzlQUURGT0I0K1dBRU80V254d1hXKzM0a256R0w4V3ByWHI1VjRk?=
 =?utf-8?B?b1ZBdFlmN2Q3YXFkS29HNS9JdVZKcEtPMHpmQ0ZCYWFKMnp4UzdTY0Z4OU5h?=
 =?utf-8?B?c0dxRVdlVDdYaTlsdW9yOFN2Y0lWS2hFUCt6c0gzckMrYXNrWlcxQnZNKzFI?=
 =?utf-8?B?Lyt2OGh5L3BkM3FielJhTlJQYVE3TUVaM29iV1drNXRJektvdXVuaWQ2U1Fh?=
 =?utf-8?B?VUJQOGJFZVRmU0RXNktKb1hJNVFWVmFhSEtpNkJ6VGVuekJnZDZvT3IzNnBw?=
 =?utf-8?B?OTRVOXNVcCtQT2ZOeWxqUnI3LzJZYVBIYTlHVHhXL0hUZG54cjRxZnRZaUpE?=
 =?utf-8?B?Y2Q3SkZ4R3poRFgvRUhaeFR1c291RFhXdzkzRVZRelJzaWdtMjIvRnUvUWFl?=
 =?utf-8?B?U2JobXFmQk9rQW9CWFE1SW9sZ3J4Tmd2dFdwYngwYlhvSkV5dGFXN2svNEpM?=
 =?utf-8?B?ZGd4Zkg3WWE0REdJMkRFaDA1dFRyWStKZUNjaS9KbXIwZldNWVJ4NlJoaGZY?=
 =?utf-8?B?MUdUVG5TclVJVytwWkp6MS9CSWgxSkVwNEtnY0VCNWNVR1AzSTMzaXRKczdp?=
 =?utf-8?B?OVpmTUJNbE5kN1hLQXFjZnBWd2cyVVBFTndIU1JjZklSRnk0Uzhha2JvSFMz?=
 =?utf-8?B?bk5TWnhhTmQ2eDB6bnlMNHIzdk9vUWRjVjlmbVpOeW1vRk53NG1Vc1NkcU5I?=
 =?utf-8?B?TFpmNGhsNitXS3JIWTFXM05BbjBzUlJuTjF5RmRtNS9sVTc1K1Y5YWU3MHR4?=
 =?utf-8?B?UGw0K1ZSMjljd1labEZucjFwSlkwT3ZmZHArdHc3dWdzQ2NRdVFMdlBqSVRQ?=
 =?utf-8?B?WTJ1QkNXTWQvQVBZbHJLay9odGFEdWJaYzlXQXpYSmc1TkVpTzRqODFOYUda?=
 =?utf-8?B?S1dDc1JseDBaaEhFMklKNGZxWmRMZm1nTk54ZGk3SXM2VmhKcjNRdzNZSzVR?=
 =?utf-8?B?aXp4VVZJazJqYTVIam51TStPRGtYUVk1Q29jdnluSmRtN1ZCa1JVVUlDTlZU?=
 =?utf-8?B?RkZJUU00QXJNbkcrNlVoKzQ2OUd4SlZkR0FSTG9jU3hscjRWQmVSVmlIQ1lx?=
 =?utf-8?B?WGlhTVRMQjZSZEF5c2JFWEd2UFJSTnI1SEdEUzJkd3gwL3d6RjBMbW5Cdm5Z?=
 =?utf-8?B?Z2c0RGk4NVVGK21WQm55Nkg3cHJnZjdkTWF3Uko5UkQwcE9MSlpMK0VITzJm?=
 =?utf-8?B?K3kvMnVDQVdCbCtaZTFLWWQ3Qjlla0ZWd2lBTmpteFRDS0kzVmo2ZU1pdGd4?=
 =?utf-8?B?RzBHMjZtdTNJRDRQVWo3OXBrdFZRa0tWcmRrRk1HQXdrRkw1NFc4WEFscG1N?=
 =?utf-8?B?UEZvRUxSdEtRaUxaL1YycVNYMXJlSXNRNU9UOHoxNG9mODE1R0tkc0p2THkw?=
 =?utf-8?B?VTF2OU9lTHdJbitkWTVCOGJFaFgwRlYxQXZQbnRaeWhqenBhdDQ0VnhrcWFN?=
 =?utf-8?B?endiTHNvc245c1ZVR21haS9Gd1dyVHRlYkNYTXFJL09YWnVsNFFJcWQ1YnYz?=
 =?utf-8?B?QTRVYStMSGdhdzRHMFNLZlprcTZxQzFXZ1hjeWh2WnpPRmFLYlFSaUdhMGlP?=
 =?utf-8?B?M0YwYmh6cHVUSXd5QmN3dDJzemdSVEhoRGNoZGZIWFoxY0dkcUVqQjhXQ0o1?=
 =?utf-8?B?bGMzaEp1Yk1GR1BVQXRORnRLakV0ZXRYVnJ0QnVUUnVFbUhGQlYrbXVlK3NG?=
 =?utf-8?B?d0pVUVorV1ltRXJGc2Y4WEZ6Vk5yc2tlRE9Wa2NQT3RTVDRXTGFleXZMelMw?=
 =?utf-8?B?QWRFZ0NRT0xUaHBLN1NMVjlaU3g5Szg1UDZyNkZEVDlEc1NmQTROa1pzNGVt?=
 =?utf-8?B?U25CMkkrcWpSc3FJbzJwOFFxRkZpYk8rVnlDZlBsdkVHVm5mMld3aVkxVWFn?=
 =?utf-8?B?Z00zb1EzaUZISjBRRVNPU0tOb1ZRWUZPSlZJV014aFRON1dhSjBWdHB5eDBY?=
 =?utf-8?B?akYycnVKbHBkNlJHQjBVNU85RVJwWnRwUnNIeUdqTkdvQ1JLa3orRmFQY3Vl?=
 =?utf-8?B?clRPb2FZRkxNUGZVK08xZ3Y0d29nemR3bkIzbnhsQ2JDRW0yelNOWkMwWExN?=
 =?utf-8?B?YnFyV3Q2dDlzdnVrN2tmTTlzeC9xWDg0NjVRUGZ6ZXRERXBub0VzaEQwemV0?=
 =?utf-8?Q?PAU7QGZi91OjRye5Ik6iHcA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE10aGV6aDdtRUMvYk82UnFwVWpDbDNwM1RkaFl5Ukl4M0dRQnRwQmY5L244?=
 =?utf-8?B?UVgwU05JMVk3dVZyUCs2eDZsUjJGcFpueWdOWEIvRFpLYndCMHMvbEZvMDVT?=
 =?utf-8?B?NUxSZGpZcDFQOVNNdlIwSTFrSUlzSGpIaXBFTWNLN2gzTTh5ZnFTNEhQNHZl?=
 =?utf-8?B?am1nc013c3pFYmpLdUR5UFBYWHBQTEJPaUpHaG10bUMxV2Yzb1UwZGlCc1Bi?=
 =?utf-8?B?YlNpK0NaQ1F3YnhKT3pMblc5d0tEMFk2dDNRbEpVTUVJcVhScHJqdjhLOWFw?=
 =?utf-8?B?OW1zSGxIeDNGaHdkbkJDUFJSRHA3UzdWZU1HL0lCeWgwR1NsWjJobDV3dTBn?=
 =?utf-8?B?SnBieUpDZjVsTmlXMmE5TStMYm9LY2FBeXBHZVllZW41OWtJRmFYbzlYMFNV?=
 =?utf-8?B?Nmg2d1I2QU5uSG02ZTVmSDJKWWJLZ0taRnEzMHhEQ0dUZGgvTWJHL3VrRlpN?=
 =?utf-8?B?YmtMNGVGWTAwN1UvZjVoKzlNTkVvZDAyZ3BuaWJHWlB6WUtQTFVzNk92WWlF?=
 =?utf-8?B?ZmFUME8vdmVHZk1XaTNPaVpOQ3QwYnAxVEpuM3dLOVMyZS9VRnJ1TVFxc3lK?=
 =?utf-8?B?RGZXRXkyc3JTSWFVZkRvT28wVnlNZGhwWXB0bW9DTElRUVVWb3h3Ly9GY0xQ?=
 =?utf-8?B?eDNIUVhDNUVpakJ1MFZjNmRHQkF5VWUzUm9xdkFZc3BCejlyekxDc2lYTGYr?=
 =?utf-8?B?WGhva01CMFg0eHdxWXdqenlyMFl2NUplWTNLaThaeWtWdkpGb1NkTXRHZVNo?=
 =?utf-8?B?ekZseHhEYUNsdWFsVGx6Q3BMaTdxc085WnRqcHdoNnJNTzdHOGsyaVZiNVM4?=
 =?utf-8?B?U3RTbkhxbzlQYTh2K3J6NTR4VWlKeCtEelpVTXVtMFdQWFpVeFJxTENDOENZ?=
 =?utf-8?B?LzQxM3BtcURWc2hPeXZibHJZcG1nNkkwMHMyUzFwSGEyUFpRNFJyckxpZldD?=
 =?utf-8?B?bG1JV2VYcEN5OXNRK1R3OXpkY3BtbFQvZUV5UmhISTViWnZheDh5RnQ3cmdD?=
 =?utf-8?B?dkhON0xFcllGRFpISkxJYWdsYVV5ZzVjRHVpV1VzakY5TXM0N0lqalJoVkMv?=
 =?utf-8?B?VHltdFZVMTJwWXBpSS8zaDJZOTVlQVFxb2NpTFZ3M0pmbVUzbkIyYmluYTlq?=
 =?utf-8?B?MTVrTTFlSDZodTZXVTVld1dISmF6OHpaOUd6Y3JTTmhuYXM1NUF2aE1xemdM?=
 =?utf-8?B?a1U2K090TnRYbEhENlNtWTkwZVMzR3VwcldKTDhMWHBzZ1BPeEdWWWp6d1R6?=
 =?utf-8?B?ckFVaE80YVhBUCtuZkZvTmk5Q3JNdHV0ODNpU0hPQmk0YW9kMXdzbUhzbmI1?=
 =?utf-8?B?NjNPeUJVTjQ0N09CZlpGZFhJRlkvVzJJK2Z5OFRnZ2Y4ZmU4cXdGcTRMUG1C?=
 =?utf-8?B?T0FKWWYvMGx1UFkxdUZRUzgzK3laa0IrVWVud3ZXb2FLQ0hmR05kZXpSdmxR?=
 =?utf-8?B?VUsrcDh5eXFFd0lJcjUvZWhTb3hVRFYzNEFEYnArVG81V0llWGtFenZaRU0w?=
 =?utf-8?B?UUo2TnFNZ0hhZG91TzBYR0hnb1dvbXlQZWJnMFpqVDltTStNaGdSeUNQaExx?=
 =?utf-8?B?Y1dzbm5pdDIydW8wcW9Rck1mSlJOMFNRVEt3VjE4QjBUTkZZY3NWUmMrZXUz?=
 =?utf-8?B?dDVVc0xxbWtVQkdhMGdxTGtzbmhocGNCQ21MY1huT096cVZ4Q01kT3FFeEY3?=
 =?utf-8?B?dEFuVjhYczVjSzh2bGZuMGhSZWpYdHZYbDdaVUY1SEZOcXdXbXRwck54T3ZD?=
 =?utf-8?B?NXgrNWgxZ1N2RmZSelIwNlEzSFZ6NitZYm5oK2wzemFLS2hpNHZxUm0xYnIw?=
 =?utf-8?B?aUdjZEtuYi9iY3ZodTB2TktyRVpvMEQvRE1xbjU2RXdwMVpmL1g2MFQzODVx?=
 =?utf-8?B?c3Y5ODZ4V3FNUytBM2VkNFQxdmdSeFltcWlRMWt4cnZUV2twNTV2K3ovL3Rp?=
 =?utf-8?B?dElnUFlyUkZwVnUrZ0phSnpSV2k3dkpPODc2NnE3d25aLzB4TkEzaW4vc1RS?=
 =?utf-8?B?SWkvNjBvWkhXRXNyMkQrZFljNHB4czdxOWJOeEhrbFVSdVRpVFJaZkdFblFm?=
 =?utf-8?B?akZnSzc1cktxUjE5aXBrdzI4ZUV1cXROYXNSMldRV3dTRS9aTy9RdlQxNytG?=
 =?utf-8?B?Wk5sOGk0ZWJQUEw1c1hldFdnVDF4MW50OWFYK2srU3ZuSWpzRmFvbVk3WFM1?=
 =?utf-8?B?TmsrOWwyK1NjNzZJSXdOVTdYTGh3QWtYMTZ2WkhpVXZTUDR4TlJlcXVIcmNE?=
 =?utf-8?B?VCtnMytOREN4UVlnUGtzRVpoTkg4M1ppSlpVRUI4bktFVGJjYlJBemw1NzVQ?=
 =?utf-8?Q?1UNj6mdKOi9bE0T1xQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba9bc92-1211-4ff9-5b9a-08de73e131f3
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 20:13:37.9574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6CYOILRmBjT2tzMQdgZ7XZfB/SFpi9TXVpQSkEWaTdWep9qXJv0ARvsxTY2zDbGaH/1ef3Evojgj37/GWpHH2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11159


On Tue, 03 Feb 2026 19:23:08 +0800, ziniu.wang_1@nxp.com wrote:
> During system resume, the following errors occurred:
> 
>   [  430.638625] mmc1: error -84 writing Cache Enable bit
>   [  430.643618] mmc1: error -84 doing runtime resume
> 
> For eMMC and SD, there are two tuning pass windows and the gap between
> those two windows may only have one cell. If tuning step > 1, the gap may
> just be skipped and host assumes those two windows as a continuous
> windows. This will cause a wrong delay cell near the gap to be selected.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: imx93-9x9-qsb: change usdhc tuning step for eMMC and SD
      (no commit info)
[2/3] arm64: dts: imx93-11x11-evk: change usdhc tuning step for eMMC and SD
      (no commit info)
[3/3] arm64: dts: imx91-11x11-evk: change usdhc tuning step for eMMC and SD
      (no commit info)

Best regards,
--
Frank Li <Frank.Li@nxp.com>
