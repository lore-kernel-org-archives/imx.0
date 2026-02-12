Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013071.outbound.protection.outlook.com [52.101.83.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87AC4A21
	for <imx@lists.linux.dev>; Thu, 12 Feb 2026 16:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770913239; cv=fail; b=k6I8dpY/GH9ClPDVAyKYkXGUd/3hatFccIGMpg6vjznosA0oifi83+xdH7l2rBqBfv/1+0iN5rPm1xIrpEpvtAsj0kc4u+PPFDo9s5MmerZ2G83c4fmmATIppZKaUw3QmR3t7nqgcTkDrt6iiQyF5qawT2NKoO+eOC50ZSQYoYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770913239; c=relaxed/simple;
	bh=rx9L2QFugyejyPs+Lv30BtP0U0ZpzzmYcbUMKvZj3Mw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rCsW01bXaPlECT+Qjio7tuzZ31FNq4Vcm2KjRFe+W6iKaoHzLQghENCm6aP/lqm92aWYsdKm7vh1umWsXe74ozHs29S/gBXQ9/b6hK6rerZvWsz9w1C6GNjrjHeAl9dwxc6lDNZcBrXi2zs/MGf28FRoOURmaL22Fonp7ipuwVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RVE5n00f; arc=fail smtp.client-ip=52.101.83.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RVE5n00f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQrb3mB9q43vW0nHJR6fsveerXK8/eWJzxEd7LoGfhq6jaykQXwAfKl9ugRQeAVDPEVM5ZZ3VVibfUe2OcADCM3eLEZJ2SxJjD5Lqo3QZohpyjYINNPoRNvQ9JD9hQ+ENOM7XMC9tsI5h0j0XGoR5MOp1cy5pBZbPK+KI4m438ygoqWf8x2RAbUymhHogyFM5f8zePH6wL1qh9XpSj9fZLQ6hxU3nHpv5yh7C1quMTS9hgc+w5P/KeD9m+CN27Uca1p06b7/T9AMbo+7efDGOqAn03m4ClVRCD2RAWaQWPapHqZKUtbzivXuUgNP/SgDhF7mgFYCyLq9ffcJt6yXqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8XfI1yL8yMaCUbqQN+0QjJVJHdqNIn1LaWYM6CxBWU=;
 b=vEWkWBgS/vV7Xy1m9giia6m+TGehpx/noYznVpDDGuBpfAVdjZiuTiiR29dxjdMwaES4MnYgl62wRXEiFliE3No3s8308i5dLEgeiJ7ClvQ9fKjk+gNwvLpMmX2ykTEGC5Jqi1WuCfXiuJwZbAIGFYzpB2go603IBHyFVac/e3a7DPzKZfZXkin1b09Dghz0iEMDCrLeYhJ1EGOuwLcAKPHSETVCj97KzqGbpHaV5bPuva2Lh6lcDsXJtoYS2g8gWydhNSb+yFbHrfgEtWd+Oto1PtR/mm/7Re4Auz9BX8gdSIL8Cu2o9pUUl6nmFEBlLzATQtGl0vHrEfBX0vS4cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8XfI1yL8yMaCUbqQN+0QjJVJHdqNIn1LaWYM6CxBWU=;
 b=RVE5n00fuadtqmc4VxqgTXa/NbGImHmTPoSjLnUlDtnW4Ol/6Yv3biqACDp8ShmTV+h9ZgUtJK9C80QDcT6Xsv6l3Q1aQKK7eySBOOLxuZ/ayzsmuuB6XI18iascVNibg6tUbesTA0DZ/FK+B+V1Oo1HQGQreQwioQn/kadiN22AI3EiT1bt7CDPEuiVpLNIiXmKOCmu2r3HhM1pJPjPFUWSJaLfZoy1JZSFj5RhVOnsrRPDywbMlJWp9rpPNysJjz6LP0wvVwWvdmaqE6QakfC3+9ZkQTyfRf5FmkBR6xZGenDYcL4QTxiF5hxv0L7cPqX4Ax2MUBUJepriUvAvSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9704.eurprd04.prod.outlook.com (2603:10a6:10:303::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 16:20:22 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Thu, 12 Feb 2026
 16:20:22 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 12 Feb 2026 11:19:49 -0500
Subject: [PATCH 7/8] ARM: dts: imx28-tx28: rename compatible to
 "edt,edt-ft5206"
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-imx28_dtb_warning-v1-7-696bcf1a992a@nxp.com>
References: <20260212-imx28_dtb_warning-v1-0-696bcf1a992a@nxp.com>
In-Reply-To: <20260212-imx28_dtb_warning-v1-0-696bcf1a992a@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770913203; l=963;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=rx9L2QFugyejyPs+Lv30BtP0U0ZpzzmYcbUMKvZj3Mw=;
 b=zHMRqGvkXvgKDtaPVQKhEFso2g5MvWoDblsW2D8xBSvpv/CjqORHHeLvZv+kblHJgRCsDWowr
 4QyZ2J9hhiDAfJPpK5v7lQpaCXZGsgtPCCZgHkowpsQlAQCHAH7r3JC
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN6PR2101CA0011.namprd21.prod.outlook.com
 (2603:10b6:805:106::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9704:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e10235e-f5e3-4682-3a57-08de6a529f14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXk5SlVIQXhOVEVVVkJUa1NpQWdWWVF1dXpHTVJIYW1wRW1oVXdwSWZQcTNB?=
 =?utf-8?B?MmRLZFVHNEU0Smk1ZnBIU3JFaE5pZ2dLZklRMlFLRFowdExBWUtOYmdxQjNh?=
 =?utf-8?B?QWRDOFVHZXhCQitNL2p3NEl3RjFoZjlQTDV6MHFueFpuVmFldUlYT1BiU2dN?=
 =?utf-8?B?ZmpDeE9UUlVVWUJvbFBqNjltSjRRR2VTcVJrQzRhMVBOT3hZYWtCYmxYMTlI?=
 =?utf-8?B?Uy8xbkNjTUVXenNtUjhoamFzSVk2Mm1EZ3FidkdJdEhVQ3psV01WcHRpUTZv?=
 =?utf-8?B?ZmhSejNGbHZuTlpEWDl3WDY1YXFJcTJQVlRiK3BCc1NlZEdFREI2akNtVzI3?=
 =?utf-8?B?WWNRenNHcUZhYktZU05uNjFIOFF3N1kzT1E1Yi8xQVlaQmplOUFxV1ZrNE1G?=
 =?utf-8?B?TVI5Z1d0NVVpb0xJeXBpVmlqN3llbkhMM3BTTU84ZERUS1JLRWRWY1o3UkhU?=
 =?utf-8?B?ZWM0dUpIMmZ5dTY5UXNnc3hHSjJsQnMxZ2o5RjJvc2Y2OWQ4OG9OZ1JsNDh5?=
 =?utf-8?B?cnppbit6WkFJbEtpM2ZJV2lzVlhUV200Vnprc3FJMjhTSmFDS1F0ZDBGVmRP?=
 =?utf-8?B?dW54SFdmZ013S2d1cTVlQ0tKMTlrV3JmNCtseUhSU1RnUjZ1TERFRk44RVZB?=
 =?utf-8?B?S3R2bGsxOUVkVXlGVlVWUHNvdUFQZU9OcG90dUZkSjJWZ3pLTGFyZXlaalJD?=
 =?utf-8?B?ZXF4WlhoZXVlaFAyakZ4ZWtvK3hpK2RiZENPQUI3a1RneHVZKy8yWmlOK0pX?=
 =?utf-8?B?cU81WVFHTEppUXRETTNiZmhSREtNTG9pNk5valpSdjhaQU83b1JLdlB6YUQ1?=
 =?utf-8?B?SzJjdVhFQ0crd2xpeWtMMSswdU5SRVhMOHpWQzJpTW4wZC9jMVA3bGNZQm5J?=
 =?utf-8?B?Z2NZQlpDNnFFakludE5jSTNwZjlPZ3M0WE5NNzc0c0RVTTgrSEdWQXdQS1NT?=
 =?utf-8?B?dVpPdlJqQlRHamxwSlFVemVMc0NTbUZPazFVVGNsM0xjaHk1Mm53R25HTkVy?=
 =?utf-8?B?dTZxYmNEUVRwS1YzNFNsVEM1bGU3ZGNOSjJORkorazhPZDBwTFBGU2U4aWs4?=
 =?utf-8?B?RFlsbzN0R3YvVlJpOVNlam1veXpialJ4TXNKOHR0dzZheUFEcFRkUkVuR28x?=
 =?utf-8?B?M0hJYjdBYm1MSzN5S2hMYlpSWUs5ZlNyMGJVZlNxTVZTMFBRa3hTZ1loUGJi?=
 =?utf-8?B?dkpIR1BFWVFZVjdwcmpiQUsrV0htT0x1M3VJMVJjbXE2RDZndUFkY2RTL2Nw?=
 =?utf-8?B?T2dtTjlaRFF3NEt6RHZlcCtlVExEcFlRQy9VOUw4T1J4NDdGN0UwZ3BQS0xK?=
 =?utf-8?B?ZnpyYzAzbVpldUZ0YmNocy91NkplYWM0WE9ScllPUW9HanE0SjRNcTlQV0o2?=
 =?utf-8?B?WUdQL2l6SWJjeU1Kby9mZ3JSd0xZVVRyOVVVcFUvUEI3TC84NU1yZlVaSjNK?=
 =?utf-8?B?K3J6ajM4SVlDczFRYm5FVHYxek1wd1VUMkdVMVU1UFVYaDZlUmo0SDY2cHRz?=
 =?utf-8?B?T2daODF2TVNacUhDTHpZWC9VRWJDNFA5YkhDMjExUDU2L25DWlBMY3BPR2F2?=
 =?utf-8?B?T1o2NUNOVXNJWHc5Y05DYlVSSVpqSExBNHNvU2VGSXhuMkVBM1AyamE2VC9R?=
 =?utf-8?B?MDdUSXJGQmZ5aDdXNW00VzAwbUVPTVZTcXRUVmdjK01OUTZ0MllCRDl1S0wx?=
 =?utf-8?B?NjVKaUlWcWFrR1h5VGNEdXlGVWNBKzdQYkFvODU2dkQ1akFSNTBrWnpLWllx?=
 =?utf-8?B?eGYwelczcTVvT2lyVFplL3pVbUwwTjAxZkhsbjlOMDZmTytQVzYrRnhKQmJ3?=
 =?utf-8?B?K09QZDFQOGZkYkNxNWZhbmRQY1ZPWU42NERHc0k0OHQ4QTNtdDdnY3o5KzJl?=
 =?utf-8?B?c3Y4eWtEOFZvSGxZMDZWSVdFb29vdTNIamJKeFo1Y0cwTHRhWkhDdEQ1RS9v?=
 =?utf-8?B?SzNUVUx1MHpRRnhMZUhkNVhsVXZmenppNjdpY0hnS1E2ZmNEbVFOd1J4eDIw?=
 =?utf-8?B?T1laZEt0bGtSUmtLbUQrVlIyTlZPMFhRK3Y2bHdZVDJ1SDEwZTlFZE5pWVhq?=
 =?utf-8?B?WklxUUhFYkZONkQyb01XOWxrSW1tTTNVQzM5VW8zOE5RUHRWN3ROK2VzK0dv?=
 =?utf-8?B?NVJOaVlLTnRCL2VibzFDQThLT3hVa3RpUWdnTWdEVm5HMzhaZUpMV2c0aDNM?=
 =?utf-8?B?Unc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXRqeUxQcG1MNjJFZWJ2MTdMcUlocjBFbllTTWs2ZWJydGhtaTdpMDkyWi95?=
 =?utf-8?B?b2VnbktmQjc0Y21WS1pzQUFncGNqeVdoNk9rOFhWQXFaQkI5aWtnZ0lrNytj?=
 =?utf-8?B?Ly9YbGZTSDRXNjZIa1c3a1A2TmZZNm9tT0dlL1ovZ2ZMMEc2ZmNYQitrK2xL?=
 =?utf-8?B?UW9pL0I2ank0aFFESEpYU3lwMStBbUpucFZXdXZvNFVXd045SjdCMk1HRG1O?=
 =?utf-8?B?MnBxbUtKc1hqWjNrYkowbEgzNGlNZjFRNFdhUkkyRFMxMTRORFJFWTRjOGtp?=
 =?utf-8?B?RDJNYU1sVG5sRmlvNlZhTGNEbEduWUxsVUpJakJOZUdoNnJOM1FGb1U5QWxp?=
 =?utf-8?B?NGhZekNXOXBrZTR5TmtRQzBNQ013aWlpQ0VPTXp5dlJZbHFkcm9TbjBaVHNw?=
 =?utf-8?B?NHloMk5ZL3NTZnFXSGxOQXVkdzFIL1Ava2dnQzBZbVJTaE53NlprclRMbUVq?=
 =?utf-8?B?VUpQeE5vTnV2NWp4MnU0VWxwck5MYzRlRzdGb3htdzFjNVA2TkxhSzVXbmIr?=
 =?utf-8?B?WWJxMDB6a1NhdjFuczB2QVlOV2FPemxiOXo3WDdhbGdmYzMyd2I2NlcrdEZK?=
 =?utf-8?B?TVJ6MFZoL24wbVh5L09kK0t1cGJnbHRUa3FBL2xKL2EyMFRtaVQ4SkVlakV2?=
 =?utf-8?B?R2JDNTQrWXRpbzNrNkw1Z0cxdzV1b2R4Tnd4eWF2M3U4S21OcEc1Q01XSnR5?=
 =?utf-8?B?aWhxcVpOdG9uVGNoS2xzdVR4SlI1N0oxb2dYTEt3NnZ5R21TOWpIS3pDSUxO?=
 =?utf-8?B?NVRUN0hVcVVhc3dwNjI5UXM5b0FDQmFiSW0ra1RNNjBGeEdtVWJoamdxZmww?=
 =?utf-8?B?SjNvbjNDbGlnOW9oWWpEYXBoeDZ5SVR6ZFBoNFNSNnhRMCtRbndoM0RLbndr?=
 =?utf-8?B?eXZnKzNBY2wrelBOb3pKamg2VDdST1E4NmhDdGpqc0VEU295V1dDaVBWazR0?=
 =?utf-8?B?dTBUcWl2OGpvNU9kNERISDhsT1BIK29tek9Bc1BGM1pselZwMlFMM09YZXNj?=
 =?utf-8?B?MFptN0t4UnFSWkVjVk9ucm43RmVJTExwRVJIUE1sQzJBNU9xdU01bFVNeC83?=
 =?utf-8?B?TTVjVlpLT0ltN2EwMW1sdmh0QlYyNkFmQkxLRDNwYlhmbGpuTEJxTEJ2WTZq?=
 =?utf-8?B?ejNKbXdobE0zODAxK0xxMk0yNlpFWXBXM1lmZllzMmlma2g2L3BuYjRQUFh3?=
 =?utf-8?B?L0RDTW01SUtIOU1LUFZIVnFWekxOVzZRNEMvUERad1RCaWQrTkpwbUtnSUVP?=
 =?utf-8?B?TEJGQVJNTHpEQ09qeUYxSGk0dUhGOHJtVStrVlg0ZHhxWXNFam9ISFpKdmx5?=
 =?utf-8?B?SStSYTg2blltRWVEQXhqcXhKOWViQmlvYlpoeTZJd1VrT1ZMT3BJcm5qYkhU?=
 =?utf-8?B?VkhBNVRseWFML1VleXNsTE5oVzFqZGhsNkJQV29vU0U5dlVJdlF4UHdKenJm?=
 =?utf-8?B?aXV5eVJ5UlQvQnJPaS85OWV5VnlKNFhQWXVOdktkYnZUOEd2WUk5aVlGR1E1?=
 =?utf-8?B?cGFHZmh5MEhNR2srS253QmtILzJCZGlBdXhlWnZlT1hGQzZ1QjE5YUsrODJQ?=
 =?utf-8?B?a0NoTzdtT3BmUmZ4WWRqQVBIY2tUYmFrV2tsaTdFNVFyZDA0K2swK0NmTThi?=
 =?utf-8?B?MU1nZEpVbXNDdFVvZjlNWEZwT2ZpaEcrU2Z0ejBLcnVneGZUa0dmelJnM2FS?=
 =?utf-8?B?bTM5N2ZFeFZHSFdwSjVaWFh4b2dRYWtOc291T0hGU25WdnM4eHVBVTEwMnF0?=
 =?utf-8?B?UE85MHZzOUdFVGZuM3VqdFp0YUkzbnhlcmRtS0p5TVIxeFcvc0ZqbkJWRTF4?=
 =?utf-8?B?aEE4dFZiZnRLczM0cUoyUlBmMEpkazNjUVRJdnFRZndQdmx1QythMkIraGZn?=
 =?utf-8?B?ODRFQ3VDemwxQklmbFpHN3IxbTJOeE5tYVFCTFFoWDZDV0kwcmV5bTZxVEU2?=
 =?utf-8?B?TWhEUmlmbEEzS0Z5bzJCTWdpYXpkZlV5N05tUXNvbHFrZzg5dUY0Nis1ckFO?=
 =?utf-8?B?bnN2MENCbTBtcXhtSVI2b3Qzak52cDI3Q2MrK014M0RCWWNQSzJtQkZBR3hm?=
 =?utf-8?B?Nm1uQmVkYXUwRmkrdWRJcW9KUFJBbHpsSW1jaGNSZVA3ZSsvWXg1dHk0aWtF?=
 =?utf-8?B?clo3dUJ5MGhGWWNXOXZXMXZmQ3piYW0wVUptcTJLdHhubFZHc2FJMjNOU2NE?=
 =?utf-8?B?d2xxTEJ2UWxOQkMrcWpzMEZxcmx2UWZqVW84aUxGdzBqTWpzeGJYK1Z1UXBK?=
 =?utf-8?B?cE8zZU9KQ1VxcGZOSTY3ZkxtM3FML2ZNYS8vc0lPdGRJREJzU0tCR1dKVXRT?=
 =?utf-8?Q?2vAnSXgqlxUiPxrkTQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e10235e-f5e3-4682-3a57-08de6a529f14
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 16:20:22.3087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2IVrNup79/2aPTIhgLls5g+oW3ZC10Ckd8YQItJocRjueLwV35h4TwWrkrUzl7Zr0Lg98T9gyuuFOPqYAYj1LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9704

The compatible string "edt,edt-ft5x06" is neither documented nor used.
According to drivers/input/touchscreen/edt-ft5x06.c, ft5206, ft5306 and
ft5406 are compatible.

Use "edt,edt-ft5206" instead, as the datasheet does not specify the
exact touchscreen model.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts b/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts
index ff2cd1db5fe5f5618ed0f260cfcff6b05de26521..c28fd07aec2c7994d0df1d3ed1763644784f14e4 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts
@@ -284,7 +284,7 @@ gpio5: pca953x@20 {
 	};
 
 	polytouch: edt-ft5x06@38 {
-		compatible = "edt,edt-ft5x06";
+		compatible = "edt,edt-ft5206";
 		reg = <0x38>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&tx28_edt_ft5x06_pins>;

-- 
2.43.0

