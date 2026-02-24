Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D65D330654
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 19:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771963060; cv=fail; b=oOzMylw0jFfeqpQSFG40Bq4FReA+t3C7NT3ESm9vp5B1Zc1M5sJsWPkb8Ki6uzMudKomwn5UVs9IZnZjrolPerrDK7myP9gz9alCtnqQ0WZEW1YBczlsApXevD0TkTP4cfAnifG6HAMJXwRqHU8/CBzT4+fZfq2Rk6v5r+/nTF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771963060; c=relaxed/simple;
	bh=wc1IdbBavblai619ADEzhFXIsNGNjEUtRf+9fxEEvlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d+Kfx4qRTFVM2NglRYzfBBv/YHWPKGUFzGhxlo3S/SqBTV2AC/N1tMciDzEFLTp1aG9/nuoUf3TCd64fp+ARV0eWtNIkZDzl83psIteqHUGkWm4jK6ynOJYcG7aWQfmqRx8OjS7VOLrncUy7cUFsUdEF+DaGC0Lgd96zDTygi7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jLiYU1xr; arc=fail smtp.client-ip=52.101.69.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jLiYU1xr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=juqsWfYn//hwO9c+GgGeLhXNo5HCmkAxKoGMZbBmMcme01XDmLoXluHiVPQOxI4PZddtGv7BenzV7feTfFZcr/cS1f2Gt3jM8/gJVmSVV/H3+W1G/Mqdu3vQHLtKbS2qy6wW1q6xc/bMi4kE6KycX5Kbfbr3m09kdcTwewAWjZjSNHGxFgZJIucFw/Z8jkYuObbLlsoRO7+rcX84F0n+fvCJ5TnwjTHtc2AmuXcWl6SwZ+JxDDTkONtteiEHuti4fV43VD2cKRJRL9Sva595Vu3c2vYk48jFxMf763QotjgBXaiV8r6NKkdibpayd6d8xdswjR3djFq/3XU0L6pMaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wc1IdbBavblai619ADEzhFXIsNGNjEUtRf+9fxEEvlo=;
 b=HbN5U4LzCyM71EwYcObPvpAUpcKpx5u9U46I+gP0Va5+kYU1Mls1bAgSjTbMdAC66LlThBxkTknTGatoWJnNU9mfuag3G3olQkGN+1sUnP5RShfcAL2ETd2uAfOgs15XJEoYLhpYdm+kveoGDt2VoROhWlWk/UMfnwVqpCNT9NbwHRkHKRmraT2cMmXek5Ba3dgHjBJqgevif9wnrLIMih/F57g2buzWJGchPGqzN1CV2fybex0OrQTltIzg74ORqeZvhxQpjwoTYLYamIKVr3+kq7vRDvXG+W0b2/fMTP3fOq1eaAi/cgDe+gCVTNxls4A/dw2Mo2UCGxVbEeiq1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wc1IdbBavblai619ADEzhFXIsNGNjEUtRf+9fxEEvlo=;
 b=jLiYU1xr8yKnKXcyvcE2nqQrpJXD1SkFv/o6V4Cxqkf7ztyAz1MqlfyNrUkzBHIPZ9nxl3xF7ED3Xrv/y36biAg4P5+GzCtaI+fgWghjUBX5AhPbQ4Eg2BnEiHCUKvQkLYRuDsVpk7Oj6uXDB93eXE4yGP7yLameLMWjVcSVIlCva+8ivMpD7yGqwfl1+lEANiZS4j9vRXs5mtETLAASxULMuaRIpL7ScFYb/W5NEyCwRIBsgUY59CxOhHH6BFxAP3Lv7tkcF4qHTfOCbWkAqC5t3JIBsbTJf6pY98JVcBgCmhAuhOWvHAgVsyHuxk1K7wLZ1+J35IOPrQYne8pkzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB8965.eurprd04.prod.outlook.com (2603:10a6:10:2e0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 19:57:35 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 19:57:35 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 00/10] ARM: dts: cleanup some CHECK_DTB warings
Date: Tue, 24 Feb 2026 14:57:14 -0500
Message-ID: <177196297980.3237710.1324735332276057143.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
References: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::33) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB8965:EE_
X-MS-Office365-Filtering-Correlation-Id: da25b4e4-db31-4616-3b8a-08de73def43f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVlEUmdJUDQ3NithWUx3ZnUvUFJOdlR1NTV5amlkUFJBNE1LVEVYNWUwWlgw?=
 =?utf-8?B?S0cyWHAzTDB5NXhESXoxanBSWnpFSnRKenlCUzhBZHo2aGxHRVpyOHFrZ0Jw?=
 =?utf-8?B?ak1ac284UThIOGZGa1hBUzZoLytwVThXdE1yakxMWFF0dHpOdXBXd25GN3dF?=
 =?utf-8?B?czdySldmLzc2MndFaG1JV09hWGdFTlJWMjBwWFRnYURybnVlM1p1cTJMbEEw?=
 =?utf-8?B?TkNaUEdoNWhCVExYR29xL2NsMUxSQWwreER3SVo5Y1ZTRU1lQS9SYUxKWEdT?=
 =?utf-8?B?bzBnamNoOW5zNzFBNXZkQ3p4R2haWXJDaTVXM2x4SjNLcDFoZ0QwekovYVhv?=
 =?utf-8?B?NFpEb1hnMS9TbTdqKzhQc0VlRGtkRG5HelllSVg3WHc5akxCcnVjdGlMYzFx?=
 =?utf-8?B?Y2t0SW9tblgvNExCdXMzemRHVDFjeVpmVHUrWmU3eC9YMmFGMHk2akU5Q0dv?=
 =?utf-8?B?bHZpM25IVG02bWM2OW1LbFVIQ2QxMUUwakMvUWhZaUluTmh1UFZLTnZjTVJ4?=
 =?utf-8?B?aWRQMElQYnF1NHpLdVJ2K01MMjVvN2pzamVLelJNOFpnakR3WU5PcG55b2VU?=
 =?utf-8?B?N2dlamlFbGx4cjFHanRVclpaSThFL2YvYnNjSTBUaFpQM0hVaW9hbTdUYWNH?=
 =?utf-8?B?RmxMYkFUNlhoaWQ2c3NNZHhVbktXUDF6YTJRdWowOStLY2g0ZkpqeE5mYjBw?=
 =?utf-8?B?MGVkMEpRRTdHS2RKNDh2eHhpL2NQeXEzcHRXOEpqOFhEcStvOVgxY1BoUC9Y?=
 =?utf-8?B?c3ZhbnlRK1hEaUNtdWxEa3NxcDZqaWx2WGgwQ2tMb29GTUVTTUpzK2l1WEtF?=
 =?utf-8?B?VURHSmVQNTN2VVNoc0xTWGpXOUhaRnJRd1lvZHE2U0QyK1N3cThkQ3FEeVEw?=
 =?utf-8?B?QkV0ekNBaEpDSW41Z0N3QVQyTXpFbDBiOVp1UlVjWHJZKy9SV3N3d2NTeFdE?=
 =?utf-8?B?UWVGdFNOd0RjUFpvUllKN0VmRmo0WGtUYnNWbFJkK0F4ajBNcUFreHg2YlN4?=
 =?utf-8?B?LzF5cG8yWXM0bHVFcGNMN05WclpPZHNDSHo4Wm9sUHMzRGJ2d3diYTJ1cG94?=
 =?utf-8?B?YWRSdTJXcGtUaml2c21sUjJUZ3paOWZJd1k4eWJZb3hCL0tPMUxOcUxXNi8z?=
 =?utf-8?B?eFZFVjZ1NSt4SEtFbm1yVXlQYjc5czZhZW9rSTdkNHpId1o1Ylk3TW5McTJL?=
 =?utf-8?B?YlYwMGVYQUNsVWtTM0YzMEV0ZXR0VlVkdXoxblErZzNORFdYMkR2c0tXV010?=
 =?utf-8?B?OWI1c0tPaUhyL3RxN2dQYW1tZzFCZlRkaHJ6WXVoWlgveGhMd1l6cGtHRnVZ?=
 =?utf-8?B?MkQrcG9wZTJhdzZ6L3BpU21aNHc4NHhkUVhVWm9BN2hmN2NvUlIxalNSUVp5?=
 =?utf-8?B?MWRIVExKVVFFYU9POW9DY0dNUnRzMmY5TklKZVNoUEl5Y3lpZHNwNzJVRUZx?=
 =?utf-8?B?VVBmREZ6SUpmd1l0OUdaWmpvYXpJVGtNZUJaU0d1OHFFczdZSk8vZnI4QkE3?=
 =?utf-8?B?QVlOSmwybEFZMXNnZkZyMnJRdWlHbmVreitBcS9zc2ZZTk9BTFhxekdob1Js?=
 =?utf-8?B?SWxRWHZYNVNncDJLRjA1RjExN0tWSVoxTUlvdnZoZFo2UjRoZTR1aWRhbTdx?=
 =?utf-8?B?V1hCWmdQQjJUTGJBSU93a1NNSWN0dFB1RG0vTktHZS9YOUpMSWlOOUhVK1ND?=
 =?utf-8?B?UERJOUJZMFFXbytqMVdxUGJIcWNNTXNOTWVpT3dqZnc4a2hLeWU0ZEpuazZF?=
 =?utf-8?B?NXhEZkc0UTQrQTRhR2orb0tRc29jQ05SVmZsb2Z6TFZ2a0orOWNRMTRiZzZw?=
 =?utf-8?B?T2NhblNINm1tenQyYW55OUJKeUxyV3dFNXdJcnAzTWRJbk5GS2FQdEVWcHVs?=
 =?utf-8?B?NEpwUmdvUWNYcTdONkw1YjliZjJ3RXRTMWZ4YjdOVmM4dFNYUlp0SzVVWWQv?=
 =?utf-8?B?OVY4UUtVd3pOcjJoVkJZUE9Ocll0MEZUcE5JcUJFS3NKdFJZclBNYU1aZUxl?=
 =?utf-8?B?UlMydFp1K3paazRXbkdhZ09KRGNBcUU3b3JEQ1ZLNXl4d2ZnQ2tTMFBqU2ha?=
 =?utf-8?B?Z3pnYThOMm1IazhxQVRlTFZ1WndtOGdybGd5WkpMMjNNK1RmYTcyMWxienk1?=
 =?utf-8?B?OHhtbDdpZXF1aFZ2MzQ4Z2NQY3BuOG96enB0UEdzUnAvQ2RVUFVYbFBpclN3?=
 =?utf-8?Q?MxwlVo4bb5wKDSX5hO46Fl4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YU1SaURESGFFbWNOS3NiNHB1Um9jNFpkbHBqUzNDWmc4Q2ZXTDFCQmRndzlJ?=
 =?utf-8?B?NTQ3elMwalNYQ0Z6S3FjS0VQeVlkbi9UZWNSWnY0Y25YVDVmUm8xanExaHlG?=
 =?utf-8?B?OEVMTVh2QjY2VTRkdEw5U1JXd08yMGRnTnJnZzVyNDZZT2R4bnRTVFFTQnFn?=
 =?utf-8?B?L3lzVTl3NTRKcHhTNjVYZ0J3VTJTNkRXSzZ5NEpodkozMnp0STErRTNVWGR6?=
 =?utf-8?B?Zm4xaVAyS0o4b2x5dnJ5aWxXOTFHZS9sb3l3Z3pIRnZ1K0RzVHN4Q1JzZVBo?=
 =?utf-8?B?SmNTeFQ2TDNBUUhoVjMvOUwydHprczVTWTlrZHdLTk9MbzN5S1BxMG5sZzZI?=
 =?utf-8?B?TXJRWjJwY3hvZVZta2NFeVE5SmREc040Z2JSNjlMVThxUWd6aS9nL01VNjg2?=
 =?utf-8?B?TGlUemZjZ05DdkI0NzM0VnFEeU0rOFNvNVBaeXozVElPMWRuWTZhd3kycHZZ?=
 =?utf-8?B?K2Yxc3hpWVozVlhxV0VpY1Fsc2JKMVV3MFFZeUZpRklzVm1VdVhRWjV4UEIy?=
 =?utf-8?B?dGFxdngwWWlZNFRIZVZUYmthQ3VFcWFEbkFWenJTaVF2M1J2dTlDSDBSZG1w?=
 =?utf-8?B?Q3RYak4zNTZoUFpTM2VubVNTWG11Smt1bUpjdkVlTmJJLy9XUVRyZVFkMVNn?=
 =?utf-8?B?NXlLOGZ0RjZLS2FNdndTTWVwRThwQW0yZzBNUTRiY3ZHUXA2RGNnRk5ZZVNF?=
 =?utf-8?B?czJhNlQ5cUdlWkJ5UURTSEpPTTUxc1hFY0k4aDh5VGgybmFEdVhTb0R2bTBq?=
 =?utf-8?B?NFEvZWlPMmVsZzJ0L0pyMnBLbEs5eXEvUW8rOWNacEJIWjFyakxGUjIvOUty?=
 =?utf-8?B?bVRxTWlsREFTU0hhQXMwczFPZkRKNngwMHNxNERSa21RQkV4MU9NWHA2Q09k?=
 =?utf-8?B?Uk1DSlhqOWV2RVYxSlhET0VDaHFXdjBRTkJ0dXJrRXc2ZTFBZE1FaE5yL1hx?=
 =?utf-8?B?RlEwSUFRN2ZDRi9nblI3cTZHQmNuUmNtemt2bDdkUHo1T0ZxQmF4M3pwVkdT?=
 =?utf-8?B?UWIzNkhEbllid2RVNDl4bHhPbXI5bDVsZWFsc3EwQTIzRU9OdzlPN0NiWnUv?=
 =?utf-8?B?QlQ1ZHZabGtpSmQvZW9CRXJlWTJaY3V5ckE2TzZKMEQ5Nk1BODgvY2dwODBu?=
 =?utf-8?B?R2loV1hVbk5EUmQyL284dXBuUEV5dFZRd2xIbkc5b3ljVG5PSngzN3kyTFdq?=
 =?utf-8?B?Q2Z0MVYxc1V4c21xRW1zMU4wS0VHVWNPRElNNUNWQm52YnJubE4zQUZjMjNU?=
 =?utf-8?B?TVp1bXlRZmozdU95b1Aza1BDL1prN3pTUU1pS0phM1htTmRIYVlWbE1IZHY1?=
 =?utf-8?B?WmtCZzRrcWpHNUZqSnFrV3NXNWRKb2VUZjFOaE5pNWFIV0lvdTVEVXdIR2FI?=
 =?utf-8?B?RUw2eGVNRFR4RXNIMi9wWW9yVm9JS2MybDRocjFVZGR1UEhKNmpWMlpQUkJZ?=
 =?utf-8?B?YllFVVM2QXlaSS93dVBocDVxeld0dThXWDhWWUszcWJPSFI5d2RhUXdVVldC?=
 =?utf-8?B?OGFncXVVdEU3NGJXNlc2Q2ZrRXJkQngxNGQ3Slk4MXA4RXpDaFBRKytkUXhj?=
 =?utf-8?B?SGJTTzBITURPQW1JU1RBd2U5ODUyME92bGVLTGpVSXZjdDczajJqVS9MQkgz?=
 =?utf-8?B?Q2pnNnFSR2k2U0ZGK2tHZ0FtWmVtQXhiSUFpZitOM1ZBTkFlbzR2ZkZOdGhR?=
 =?utf-8?B?WC9XMjkwVnN1OUhaemUxVi8wRWVQTm1GNUFiUjdpUVIvc050VUh2UkIrdW9N?=
 =?utf-8?B?YjNrMGVoMTRrTVRXb2tva0VKcjdMN2twcjdtbDNDZzFvVFc0ajA0VE91Y1FX?=
 =?utf-8?B?VEQvb3pqS0I0eUhacHpDS3IyWWNKQkc0R3dRSjVUUnEwQXRoOC8xRGhGWkdF?=
 =?utf-8?B?UVNodFJHUDV4T2NOUEc4Z2JPR3BWcVM3Y0JVcnRUME5GanVzU3VZUTJ2U213?=
 =?utf-8?B?T2ZnanVvWkhxdGI1WXFRcW1Tb0RMdDZJS1k5dGdhSjBvdnA0TnRDNFFiZTNK?=
 =?utf-8?B?VW5LV2pKSXByZmZVVVRXV0ZzM1pLdGJObjlyK3VqZno4RGV5TFJpZXZES2lN?=
 =?utf-8?B?L2szU1M0dVZseDVUY3RRcnRmd0JoWnpYUFA1Q2p5OEQvWWNJNURLV3FFOU9s?=
 =?utf-8?B?WUYvWHpCUEE1YjBDL3NTMEhvOXBHcW9saThGMVZVanRuSnBkUmtqRjJiNUVH?=
 =?utf-8?B?dENiWXU3QkNkTlhIdGcvNXFZZWtIc3pzR3RmRU9La1pJRlpqMmhwYlFBSVlB?=
 =?utf-8?B?RUpCbTJzNDVIYXhoQjJYb2JIMDljeEVnRXlvTnNZM1k5TUs1eFZxbWJxcnBQ?=
 =?utf-8?B?VlVFTjBRQk9VVFpUS3lpd2U5MGZlcXM4c05FQXR4cUdyRnQ4VWEvQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da25b4e4-db31-4616-3b8a-08de73def43f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 19:57:35.4343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6peHqQMLGi5a0II7/BFFjRHNdi9oW7nWWDXFxt/LdFO+GJH/26c1m6YikmHYpxxQDMNtzhjF6R313TkLMuXhaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8965


On Mon, 02 Feb 2026 14:43:17 -0500, Frank Li wrote:
> Cleanup some CHECK_DTB warings.
>
>

Applied, thanks!

[01/10] ARM: dts: imx35: rename emi to emi-bus to fix CHECK_DTBS warning
[02/10] ARM: dts: imx35: rename i2c clock-names to ipg
[03/10] ARM: dts: imx35: remove simple-bus 'usbphy'
[04/10] ARM: dts: imx51-ts4800: rename fpga@0 to fpga@0,0
[05/10] ARM: dts: imx51-babbage: rename at45db321d@1 to flash@1
[06/10] ARM: dts: imx53: drop fallback compatible "dlg,da9052"
[07/10] ARM: dts: imx6qdl-sr-som-ti: use fixed-clock instead of clock-frequency
[09/10] ARM: dts: imx53-smd: Add power supply node for fsl,sgtl5000
[10/10] ARM: dts: imx7s-warp: Remove data-lanes and clock-lanes for ov2680

Best regards,
--
Frank Li <Frank.Li@nxp.com>
