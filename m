Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011057.outbound.protection.outlook.com [40.107.130.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9EC30C601
	for <imx@lists.linux.dev>; Tue, 18 Nov 2025 08:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763454585; cv=fail; b=buxQxujGJm9jhSz6rnEbsLdj/RAAEohyNlmBU/Du8KN0VLVD5aUfkR2ypRbciBJ4wt4dA4uh3ktVQU/tcqPWa+OgeEBPwBmDPmQSSgM+GpcKYRABdsOTbmyhA/UVENHol0p2DaD0aiMx4+CECOtMeLtg9te5dgoLTDZyl6xfAMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763454585; c=relaxed/simple;
	bh=JdNS43hfjN2TUTdjbBWbOG1enH5v/+HLIFrtBNJDdNQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=keVLCusiaaiMcR4D2PCnJEXLPm6AEbrBjdS0ptH8pljdG9h/MwX4wGa3dm6wiv+qy0N7cUK3vRrNEgnHlOJWZ6iwOQ0yIfIN2rG5G81mvUeg6Lb8IVYeKJx575qSNtdXbI06CJOXlpf2USNux0SFK+ChBFJa3vdX4LtWrSPxR9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dd1IIS2Y; arc=fail smtp.client-ip=40.107.130.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dd1IIS2Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xeRi1e7Vpu7j9QDqYpy1KCItVeuPdIx75BWKDG8ezWbPWkVfN8He6SyqJLI+BDLf4Uk3kG2tVXFesDimOi5DF7c1ypnwcWR+ycYA+EgHjPe8w0DxRJM78UBsR4idVHalNdgnCqlI161OPE9eky99NsUTmt7SqQoepE1jHG0/NBxDRN4PRpHCccsjrJE/cdwt7mn/oVR+u7rfOi4hwY1x6zvJiQT5zMw3sBlVgqwvGcTzp7kmHB350se/9J5h6qkVBi10F3waf3/STfsU6jG56c8WBPDyF7jQ1rt+nzz9M21F80TL6Df9T2kozchUe9c3NO6/rImyUuiAUispcWlZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAklVVWz+gQY736Yx9lbYfOiK6CnzMZs67yHzkLuKQ0=;
 b=dyJ2v3eyfysHdEeXXwzwnVBwaULRuKgjsaag0/aiYiwHh4MU7YB8s8mKywVP6hAWTVIjpCCiBor9H2xaJEFVM1V9kikGCI+sc3dh0Nz6dJ9NqiNsYy5J9tVgq4l4XVh3wpf0ZnYpC8eh82T1xTM+IMasWkEjNOVlAc/TQvI1sF/qLf50ECU7JKp4cP+3UuY4yO8hoOGT1cSruh6fGnubAHQNGFLnsYFn9VVgkGWDm3kHF0MuEjwMMucZpvXAE/eAHWTSZjlpqESYYkNegsZ7b6TUubLhtbU5iXGswRBFZyNFcIzbvRZdpe1DyCXM0fEfI/iIIZGZqavCHNxCsB83wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAklVVWz+gQY736Yx9lbYfOiK6CnzMZs67yHzkLuKQ0=;
 b=dd1IIS2Y16hOeYeW9I7Xwx8toaU4LUz8pgxSecKZTBKAeTcEBCnthBgqN33/Lx4Xk9cyUddkI9Z0dBdlmuQR2rxkKwt9NTGtDR/jr+z62Aoq4t/5WfuawiuyM7PR+dWo9UajGpLMe7+8mBdcj6qlhkonYf9CMG4oy+wf7eZbNhkNv8qVOd91roRAHlk+HvOq3/YzQKAAooOIC9XV7XlYQfnCZShaw87I56aFdMthlQs6ar3sUITRVFXZAONh4cEvsaqWkKDcIiDmQdc9ZS6GRo3tEXu6Ixdg4CH+wo+GGdJMW6xYhCgngdHQgb+e0eALPA/3zdN39jVie6kSaoopXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AM9PR04MB8970.eurprd04.prod.outlook.com (2603:10a6:20b:409::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 08:29:40 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 08:29:40 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Tue, 18 Nov 2025 16:30:17 +0800
Subject: [PATCH 1/2] arm64: dts: imx8qm-mek: correct the light sensor
 interrupt type to low level
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-dts-imx8qm-v1-1-63e226ffe512@nxp.com>
References: <20251118-dts-imx8qm-v1-0-63e226ffe512@nxp.com>
In-Reply-To: <20251118-dts-imx8qm-v1-0-63e226ffe512@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763454631; l=1066;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=JdNS43hfjN2TUTdjbBWbOG1enH5v/+HLIFrtBNJDdNQ=;
 b=iywo/taxu7//umEqrpTNu/nCuLPnDvYJ4l5EhHE8gOtxywe2HFFm+hWOh5R97krxxFtIsY65K
 N42F/A1OHqfDtVBBni7TNUoq4HL+vyMQcW1ZBx6M/ijkRvXh07vIsLM
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: MAXPR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::14) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|AM9PR04MB8970:EE_
X-MS-Office365-Filtering-Correlation-Id: 78d85b5e-eb98-403a-b5ff-08de267c9dcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFI4NzRKOEdYTmxmcVBLVUdyc1k4SEl3SU4wdWpiS1RSY0pyS3ZaS0hxUWZY?=
 =?utf-8?B?RmFOb2VNWXhsV1pWcG9wZ0VFbkl1eUJHUCtDOEl1QS9UcXNYcGVGWVJ2cmpx?=
 =?utf-8?B?TnA1akp2dWRRWkNhdDJHT1RaV1VKN2hvQ0hFZU1KTi9vZWFxa25KbWw3dnRp?=
 =?utf-8?B?eDB6RllnRmV3NTNncVhJNTBCY1ViaDMvMGtaSk53K3FJMmV6UUpjaWdSNVY2?=
 =?utf-8?B?MzdiNUZNd2U3eThManlZbG55bERKZitjMXp4bmJvYXNhQUJ3NHh2bzlXazNl?=
 =?utf-8?B?aThxaG1KODZseWxGenlDS2lobFkvWDZjY0J5YXpMRGdSMmhrR291K1BTNE5j?=
 =?utf-8?B?ZytFUXhUcGFYU0hWQXRLcnM4WWRJU0ZoMDgrQ1hsZTkvbFQxZXBxL2ErMGY1?=
 =?utf-8?B?dUVISHFxWlFhcDdNand2MVJZdmhSc2l6MVdNbGZyZ1dMQU42VXRFRHFsVUlL?=
 =?utf-8?B?Mm9kK1dOUWlZODQ2akFac3AzMHNYTEpkdXBVVit1MnpEb3UwTVF4c25KMTFr?=
 =?utf-8?B?NW1MWlVRVC9QOW9pV2lEQnczbnVWcHVtbTZWMHdVQ0d0Z2VWaloxcDVNd201?=
 =?utf-8?B?bjhKdWp6TWFwY2dMNUFIRGY4VVRNcEJRMlBRNG43L3o4MytTb0Z3ZXUvaFJX?=
 =?utf-8?B?TXBQUk1lUjRTUWV1T1c4Zm9MMlJmUFRWQnBBSEFCOEtDdEg4YVRDSGZtVDli?=
 =?utf-8?B?cXpmWHMwN3RKL1NuNU85NmVkYWlzcTltMm45b3V5d0ZTOVZSNXIvQ3QyaGg1?=
 =?utf-8?B?ZDNIcXEyOWFySGtuV0FzaU45aUU3ZERtVit1Sk11dUN6eWlXbUhkL3lyS0hj?=
 =?utf-8?B?WllzVGIvUnE3MGhCdTZNWnFYbjN0Skw1RGhGNWF4S0phTlc0SGlGby9mbkVH?=
 =?utf-8?B?L3R0bE82aDJ6MkxPUFEwWHQvdmtDT2ZNSlpaUGZDNkV3eG55WVRnK1hrVEZv?=
 =?utf-8?B?Q2RrNm8vYjBpdTRnYVluMFp2emZCTWFIaW1BNzRhZHRJSVFhczZsNXA3SEQy?=
 =?utf-8?B?WmJ2TkViNXhZMUtKMUdMNnZEZGZHRm5LM1dGdXRHOXhJeGhZeGtQaC94cm1K?=
 =?utf-8?B?S0NBT2kwZk1sUlVWTEpkbWtJd2pSRFd0d0laUTJucWl5QWhqcjN4VlVUZUhT?=
 =?utf-8?B?bmx1dGREWkRvanFRWkJjdEFJS1NOWXJoWUhHQWwzNjdqZHo1bjNPWXpjTnFi?=
 =?utf-8?B?S2piRkgxY3ppZlAwYmtOSHBrVlg0bGE2Q1pRZ0hKTUUyTmh0UXRDazB1d3VT?=
 =?utf-8?B?M01FSWxKMWhxWjFrbzNCK3BMQ1VMNFlnQmRIWWV3VHR0cHNUUm5pR1ZZTnZj?=
 =?utf-8?B?bXdQNzlHWWMyMmpod2xtZ1VnR1hSQW9KVTdjTnVUeTRHNldzc2NXUXFGbmlh?=
 =?utf-8?B?Rm5yZ21GSWlTdUh3VTVFK1gzQmpqVjdIY3hEK0JPQldRNzZGdUtNc3dYRzJW?=
 =?utf-8?B?WXdTMWVLZ05ia3NMazJPYlFEazFLbHlIV2hhdWU1NXFYdGZ4QTBiWFVwTFhu?=
 =?utf-8?B?MXhab1dEbXZWYTF3YS9ydkJtZlcxcE9tZWkvMVU3NUlRNjdNZW80WW9MQ0NS?=
 =?utf-8?B?aWc5ZFB1Z0xLZlgvYzRMVVlNUVVoWlhnemp5ZGlRbEpkTUFOMGhwYk9MUlkv?=
 =?utf-8?B?R1NuWnBxZkx1Ym1yUDdzaWozbWd0WE1Qdkc2L3ByM3lteFBhZGR2SElYTG5T?=
 =?utf-8?B?cStMZnZEQ2dtb3dxS2k4N29IK2hOTEpZNVEybG1VOTZtT1EvUjBWb0lWVHZX?=
 =?utf-8?B?N003NG5sMzc0Vk5IcDQwQU93RGJJWUo3dE9FVEhWS2hnM0l6dVhZK0J3cGJx?=
 =?utf-8?B?YjBLbWt5cGI1SXRxM3VEeUVZczF4VHNKMGVPQjdueDBoaitYRFFVN0QvNDdP?=
 =?utf-8?B?cDVCSSt4NzNKcm1JRklJdUlBcGRvbnZJU01mZkxNUkdvT2FpZVlDRktBMlJr?=
 =?utf-8?B?UEYwZVI1OGp5bW5IdE5wdVEwOWFTQldVemUwQnRURmptUlZyKzV0bmtpUnlu?=
 =?utf-8?B?KzdFdC9VNVRqUXBUQ2YzNlNKcmt1V0tNZTVWQnA0R2lkOXI2d0I5Tkp3cmlS?=
 =?utf-8?Q?sVklyg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHNHazZKOGFYYkcwdGpmalhDd1ZuNzJXK3JSNnY5V1haSXBQWkg2WmpsN1JS?=
 =?utf-8?B?N0xld25adzBUd3dGNG1hT0xNTFdCaHNDcXZDRk42Y2YyeUJKZWwxR3lTODVI?=
 =?utf-8?B?QWJ1aXhiTmFIVTJoTU9XQjQxWTFyRDRPWWRRMGJVaC9rRk1TZVkvQlZnb2Uy?=
 =?utf-8?B?ZU83UnUwYUcySVBBRk9BSHh1aGJWbHNMQ2JnK29oMFdPM1FpZGRoditQYTVJ?=
 =?utf-8?B?Z2NzeXNCSUpneXo2RDhxeU9oUVNleW5vVkd0QVk5aWE2SkFGRzNUdzlmS0do?=
 =?utf-8?B?N0RrcExPSFVzRWtubk5wWmxhUlp0QWFma0FkbE03MFNJRFJDWER1dnVrYm9v?=
 =?utf-8?B?N1VVaWttY2VvdlgzUGJWYUFFcDgrSENuc3EzU2h2bkFmRTRROVZBVXo4a3Z3?=
 =?utf-8?B?OWl2YnhSNGhkOWtxWDUrSWFVdmFkcHpnY3ovdzVUNGJNZXppZVNiN2xYTHFK?=
 =?utf-8?B?MCtkVGFCYURGRWF0OHRpUnpLaUxDY1JCc0NpZ2YyNTZvT0xaUnptL0Y4UEVj?=
 =?utf-8?B?ajBITFlIbjZTOXpJQnl4RW1CUUhqWFJ2L0M1Y2VheExMNFRmVXMzKzN4dE5l?=
 =?utf-8?B?dk5MSUg5cWRKNnBHOE1Ma1FZcnl2OFVQOUh2TFFGbzA1UElWbFU1N3JGZEpV?=
 =?utf-8?B?ZjBONGJrL1pDcjJJOW1hZDZmYVZVT2YyblQ5QTdZSGkvOXVRZUkybTJ0QU9m?=
 =?utf-8?B?Q24vRlpkM0YzNXJuUGczdFNSWlo4aC9hL1JoT05Fb0tsaHdIRnMrWE5kd01m?=
 =?utf-8?B?ME5GSUkybm1NeThQUlB6VTBYU1cybWZabFlDZk9xMVZpczN5NU1xR2ovc3hm?=
 =?utf-8?B?UkRQeG1vMW4wRFhVOVZCTWYxZXdpY09UNjZvbjhsT0pUVjMvYTZLWjMzU2xL?=
 =?utf-8?B?WnkxSUMxbVRycHBMVXlxQzM0SVJhUHdyeFlodGtLWkRUVDlsLzZyZkQweUYy?=
 =?utf-8?B?UjVKK1ZUckY4RXQzdjAwZE1rRXJFOTlIclNFdWIrZG95QWtkeTZpT2svaU1N?=
 =?utf-8?B?U283RSsxRFpZRlkwZXpPVUY2VzNWbFV0RnI2bjRlTENDa1NLSm9ralpQZGxy?=
 =?utf-8?B?ZXhjdzVxZTJ0allGRjJucHd6WWJhcmJJMzVnU3laM3libWJWTmJLMlZEWkZk?=
 =?utf-8?B?aDFRbVJ4MTNXc0FmMzJ6MWJGd0h6c2ZvTlNwR2hiKzNacEFiTHpMdi91dTlH?=
 =?utf-8?B?TjJCN3o0cW03eHVaeG5mVHJxbXRPZ2dpQWt3Rk8vcHk4V1hyTE5OMzQ2OWJk?=
 =?utf-8?B?cURqb0IyVU9vWklCd0txbUg0NnBvZmsrSFpTdS8rUnViajZvbVU3RjgxQXJu?=
 =?utf-8?B?QlVVMGU0WmRiRU91dnNnWSs5ZzkyRXIwWUsyK0JJb0c4M0hLR1NTL2N3c2Vi?=
 =?utf-8?B?bnVNZ3FITFI3V3dsTUxUUnZrMFRWWEpxZTE1andvazRRUXZEV0E2UDlCTFdT?=
 =?utf-8?B?UjlDUWYxM3ZEU1MwMFgwZkVKZEFoYW5pV25zL2hJUUR4SHdxL1pwd3VHemNC?=
 =?utf-8?B?elBFY3NNZTZvVGpCOUl3N0ppYTNWMVc4c295bmNSK085R1h4MnZJdXBCWjdT?=
 =?utf-8?B?MVRQUXYxbGN3OXl0QjJ3V3VhbEFmY2llVDFKZDBPbUVsaDJTcmFQWDRoVWxD?=
 =?utf-8?B?SCtXMkxzVC9LamtaRkJ3QzdUSHRHVlJtSVp2bTNKMUlITTdaS0xTVmxGUWFB?=
 =?utf-8?B?bXdBTnluNG1LemM0MlJUelBmeFI5QTRBRDh3enVWSWY0bVU4UnZpWWM2cHVm?=
 =?utf-8?B?MzZ5VjVuM0c1ZElrbVEvV2NHWWtpRk1paTRqNnJxTjFWbEhYYTdiTlhnMDRR?=
 =?utf-8?B?WEM5NGJ4KzZFZERJaDhlbnBaWGtSbFdXcEVLLzUvTnl4cXVxL0M3U0RQVjBS?=
 =?utf-8?B?ZUtORVZEdVZTdWJkUlVhU2U2OXNOdHkzS2ZmNVpUSXR5TVFmMTNMU3g5QnIx?=
 =?utf-8?B?WjZNNkYxdUcvSWdraHE3MnlNemNHWGpad01rSE1KQ1FDODZnSVIyR3NLTGEw?=
 =?utf-8?B?WG1IK3ZSMEp0YisrR1NQQTlNb3Q2SW85M3dXdXMyNDgzbmNxdmNJbVE0N3Y2?=
 =?utf-8?B?NXZCMGlKRFlHU09pT3RpcHBVelpML0ZvbGhXZms0bllZaENleVRYcUR1VE9K?=
 =?utf-8?Q?Qmognpl0IcXZ0g46AFYMAF22J?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d85b5e-eb98-403a-b5ff-08de267c9dcd
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 08:29:40.5186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUPlFmgPM9tbDD8pl9Im4wDhn+KiQBphAsZDAA3Oc3bCjcC3mFecoqOMFVgPgiOVe8qdHYbN6RQn43208wi6Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8970

light sensor isl29023 share the interrupt with lsm303arg, but these
two devices use different interrupt type. According to the datasheet
of these two devides, both support low level trigger type, so correct
the interrupt type here to avoid the following error log:

  irq: type mismatch, failed to map hwirq-11 for gpio@5d0c0000!

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 779d9f78fb8196b04c41516963f16ece082360e3..667ba2fea8678215c611dc0ca19e8fbc397f9273 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -576,7 +576,7 @@ light-sensor@44 {
 		compatible = "isil,isl29023";
 		reg = <0x44>;
 		interrupt-parent = <&lsio_gpio4>;
-		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	pressure-sensor@60 {

-- 
2.34.1

