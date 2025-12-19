Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013051.outbound.protection.outlook.com [40.107.159.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DE4246768
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 05:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766121717; cv=fail; b=l1ONeMYzcrB334b/k72xCwrRttYamwOHfqGntGy8wJP4D3kicn/OFTaTZvNlQNEoh4HztJ/u3CgE4OAaonyA5bBzBUnokWfOQRM3NWcHsa7CWBB77iVMvlaxuAPN4oW4V7FweCuPbZKt0Tqs0GSx/c02J32ieFbf2f59r0MPqkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766121717; c=relaxed/simple;
	bh=OGudE4kvJKIcCujWbKnAIhMZmTCfUNyT1XKn//TVFvM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CBRJgJrAhQoNlb1/BNNdB24f+IY05gFP7ueW7CV/rlML6oIAY7K2Q56xS5GsgOcF4SR01hn7nFXMSwQ9NCdQPuX46wg3mhaXPli8evty1EHT2z+y+eHOz2I6XOt1Ra6eId+b1LETv+l4uo40JQoDXLR8PXAn44jBZzcvgWJlfDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IDfExpHh; arc=fail smtp.client-ip=40.107.159.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IDfExpHh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fkjiCMJ2nnNaUpf1MeOMWKjDxaVKfqdvieHPv/GqWyUUXVA8XFlyOswKlfjR2C5OcZOHTlLyGTa0LHdpjxfLlgJyR7GC6/TlqKPu+h4Cj00g5sq+co0jA/a6pFjspckLKurn7aem9v1n63c/gUXsn4SiVWNjoJvO7AG6rxMy3nDg4wA2whP8rXsf9bjDNiIQvDArfrSh2T0V/ncx85pKin6Hmm3VBwy9gkJM0NvBWKzn2o2Uk5qaN6wcE1I3keM5ciiXsawZPvGn4GnKLwc4MF01aHGKRQVVAK1b5X+agMH1F9+nHEjQWc9YQbYPmi+FrWn441h2N3ZLgZ0T1SKdew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHnyxSzA6BjHjJU5k0LoH5zEz6gkN1C0oKNPwGlk8AY=;
 b=UFOJpy6n2gtcVPpIgujjWuR5mykhQm0s+gpyFU9pA215eq8/LXKDcSi/JJ9nZT3/L+zxROJx+DERh/zGfvjSJP7GC7ZwF3GHTcj+K5JZFX9lH44oXx9QURTtOnb0M/dTwhFCW6Crae/D/45HsqYuottRWwH1prULxA5zygU9rxRUPUIFZCYofwF6mMj4HjHGxDH/d71mEauQyOyzrncsIRStvYFfnKHYi8GUIjG7vDH/Mn93+yF/NeOe/bWNAS0undR33ulv+vS0aX40Ffc82PN3TH52nMzMZgKnLtOSozv5raSs+YUah56Nh+JHk60wBHYQhhUevBuZAJm7ujjxyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHnyxSzA6BjHjJU5k0LoH5zEz6gkN1C0oKNPwGlk8AY=;
 b=IDfExpHhOI9kKwRIfqiN1l+A7Xv4CLkdtVBoRk1OkRyKv++vc7FqVDpXm/SUAEMqIKQEhUyuEPTLtsJPNPLJOPtE0Q1bWFvQ5rt6zV8AAF5AI9ajJFIjB6v7TppOiYViW6N2W4EImElJBxmb+56tVfHs8NP2ROH86usuM42my4SeNB9fuwTi5ttVzdeP5uC89bbjVStEMBer6qRPxP/0vqBqu3W2Fssq+tkHRUJTjwmORbdfRFl2zOK9PKaQcar7pWL6AyZpjG9pkRCV32fjylMnx29qQ52apRWtzH1TzQ62q146Jtw//CETyvgRUooxx/8EyP9bIo0a6whQ0Uur3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AS8PR04MB9062.eurprd04.prod.outlook.com (2603:10a6:20b:445::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Fri, 19 Dec
 2025 05:21:51 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%3]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 05:21:51 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Fri, 19 Dec 2025 10:50:39 +0530
Subject: [PATCH v23 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-imx-se-if-v23-1-5c6773d00318@nxp.com>
References: <20251219-imx-se-if-v23-0-5c6773d00318@nxp.com>
In-Reply-To: <20251219-imx-se-if-v23-0-5c6773d00318@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766121652; l=7425;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=OGudE4kvJKIcCujWbKnAIhMZmTCfUNyT1XKn//TVFvM=;
 b=vVK2PF6hFGh7A252kaPsKZLLJ6W8EOja00PVC/QjaGzHZZh/B4BZ5nO2NyCWw+DmoLc4fopSt
 nu/Z1sGUI3hBtxHWzJSrqhgrI9WT57yGt7hEQscbat85el0oEdQhlj0
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SG2PR04CA0200.apcprd04.prod.outlook.com
 (2603:1096:4:187::15) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|AS8PR04MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: 329cc1df-f31e-42e4-413e-08de3ebe840d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWNOZU9HMnNUMmg2ODdSWWJNYkJJa3BKK3NhSHN1S2l1OUwzb1BCYWcrZzMx?=
 =?utf-8?B?TkFTT3V3aitLYTNLcTRuZWtNbjF3R1FtVmlmUkEwVEkxTEtxVURQdnkrQnpz?=
 =?utf-8?B?UFFVajRUNm5JMkxEZmVOQVFMRUtEMmFuYnAvSEJ5d0RQZnhHdC9mNXlxQ0FG?=
 =?utf-8?B?bHE2MVI2VmJudTV5LytRQjJYSzl3NTYzd1Q4VzlpV3dmVitvVmc5NnJTQUtP?=
 =?utf-8?B?eURHVTdsaEhhcWtVZzNLdE8wVERRNGJ0UEc2MGsvd0NPd2lLcm9QMjJXYk9u?=
 =?utf-8?B?R29YZXcraUZTQm5OdGNMc2VEZzExeERUUGw1eUFFS0ptT1pOQldVejg0Q0Zh?=
 =?utf-8?B?dkVGUUU4YURqVHFnWjYwZ2ZqWkxEWW1nTUJDOFR2bTFBQXF4a29ka0FrSFZr?=
 =?utf-8?B?aFVlbmlvSlpRdEdOWTJ3OVhLeDUvTjBkRm00RHNGQlVqK2cyTEpjSm56L0cy?=
 =?utf-8?B?Wk4wN3Q5NEFEVmNjQ2VNYWZOakpMeGF1M1VOck9kM1BDQXpST0gxZjlMeE85?=
 =?utf-8?B?d2tFdEljV0VCWXNwTUdRQktqeDFacEJQZkczRmxEYWRuYWxMU093RVdyQ1Vn?=
 =?utf-8?B?QUswSE11dWJWb1hla2lzdStJR3ZVMXoyZFFyMFU4Kzl6aXZBMUE0SytxUlFa?=
 =?utf-8?B?VEZWcW16ZFpKSGprMzEvbHJRQ0QxNTRoQ3lEc3RxWmxIcEJ0djRTU0RLWkhV?=
 =?utf-8?B?R2ZOT05xQ09RUWs2NXJaT1FyQmQ3cVFCVWd5NUM0ZHg0TE5xckpPRVlyNzFq?=
 =?utf-8?B?MkhRNjNiTFU4ejRoVFBVdGR4ZGdVcFJVaTRGS3JnbUVEZEZMNTNRVEZYMDg2?=
 =?utf-8?B?OGFhSHVSdlR0VnBYZzV1WFIzdjBHL0ZtUTNLcmkxdHN0MjhJTDdzSEE5Y2Ji?=
 =?utf-8?B?bHRSSHE4RVNVTVBIVkJGZ3Q3L1dDb1pHZXdVRk5jaWZuMVYza1pYbFBHUUkr?=
 =?utf-8?B?RE56Q1l1YSttbFJYSUN0T0htVnRCNVFjcGdZeUZ2RzVVY1ppUE9QbzlQQzIy?=
 =?utf-8?B?MXI0ME5NVTdGb1FjVnlGNmphUTBqWkdBanZlUllwK0lIYWNEY0dEMWJFbytE?=
 =?utf-8?B?eUVtOHI5cTQ1S2pzdWNHdDhoSGxQVU1sNnl6RGZGRU5SaDhJRWFLTlkzdWV1?=
 =?utf-8?B?b1FMamlzZlI0TjdrNy9KZEx3ZWI3U2FvTnc4ME45QVl0RTB1cmNEUEM4aDRQ?=
 =?utf-8?B?QkZsZ1Z6b0dhVlVOSjd1dmJwKys2RU81bjJ4dXBUSlV6SVBxemtFMEloV0dY?=
 =?utf-8?B?emNzelVERDR4VXg1ellhaWUyaWxnTVFlNW0yd2ZLWDdSSG4zekpWd01DUFBJ?=
 =?utf-8?B?RzUxUWlsOW9maDFiaFRuMTRqQUhBdGNXV1c4blhMaTJzNVYySGJpbUNWdVJV?=
 =?utf-8?B?OGJYTkFPaWNLOUt6TEY5WGFmMGVUaXA3QTZKMTFJUkM5YjUwZ3hsb3RwazBW?=
 =?utf-8?B?MmtMVFlDaVk1b1FPQmJxZHhudEtUbUpaU3JicDByVkdIYldBTmViMTZoMENK?=
 =?utf-8?B?aEdiekdITmRENGw0WVM3R2pHbFo4Vm4yeTdVZjJ1S0owSFQxby9sMkJibDhs?=
 =?utf-8?B?YWNSWGRuQWlIR2NLNFNjclUwdStMNTdQeTlscENBYllTbUtIU1BwL1FDcExP?=
 =?utf-8?B?WXJZSW5aUmE2cDVtRFlSK21DeXNXUnVDNFd0S2NBeGFhQlhUM0tIUjQvVTlh?=
 =?utf-8?B?TTM0TjlqQitHZlR0MFUydEQyUTB2MC90TGlpcndzYmZyWHR3TnR0aldLNCtU?=
 =?utf-8?B?cWhLVXo4aE14V1VUeXc3N1drTlZVOFpkdVF2RlZrSEVUK3M4TVU0dU9KVDl5?=
 =?utf-8?B?UHBQdVdFa3REcVErcGJmU1hWd25Kck5rL2cwZ2hxSXJDdmNOMWJUVE9BMVZU?=
 =?utf-8?B?TTllMmZqZWxpdzlmS1g1OFZYK09EejZRMnpYU1FpOTVqUXhHd01oWHVRT3RJ?=
 =?utf-8?B?anJ6R2doSWt3c0VLUFNLTzJ2aVFmV1ZYbXlWYktlb0JYOW9HWG9JOVlOc2Zt?=
 =?utf-8?B?SHRkWDdJSTlSTmRsV3BpSlo0QWV0NjdjaDBxYm02Wlc1T0xQdGFyRUlGcHh5?=
 =?utf-8?Q?PGg7Ls?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjI2STdrUFZHSVhIOTdqWU93OG1xa0cvSXM4Q21KOUtCU1FtdHM3UnBKdW4w?=
 =?utf-8?B?QVVlYTU1bXhjd0pLdnJkRmc2VTRPdWhiTlh5MUZwUmR1UnlRL1M1dlh3alhI?=
 =?utf-8?B?L2NOOTZITzJUVGtNQzZGcERiSFVPT3VyNUxwNWxERWN1am9QbFJidElNZndw?=
 =?utf-8?B?Zk9SUVk2cUVHZU9BcDdHT2EyMWtHQm9zSHEvN1VpdlIwSUF1Umo1V2orTEp2?=
 =?utf-8?B?dHQ2VE5OY0pZOC9qUndFS1VwV0NMeGFTdDNBMDV0YjFJanVzV3JmNVUyVVZC?=
 =?utf-8?B?cTBnOXF5cllsUmtzcWpYY1VTbzB4Q0FSRmZZdFBSMEUvR2dhanloRE5WSFlS?=
 =?utf-8?B?ejJxcXB6WmxydmdQOUFzcysvekVzekc3SE90Q2lvOTdnRUJhVTdoQ3Y0RXIv?=
 =?utf-8?B?VjdQSjBZaWhUSlNwUHA5NzlHMDlsdk5rQ2ZkcHRaeU5xRGhwdXY2aXBhQjFu?=
 =?utf-8?B?T3JZdy9aOXBreEJtaVlJajhaKyt3czlGek1aSE1OamdPMHYxWjVpY0ZrdmJE?=
 =?utf-8?B?WFBES1JmbUhOdnV1bFU3Vjh1aGlPelZQVXlxbEJKLzRDZ0JGMXZMNHd6d1g4?=
 =?utf-8?B?NWNxUnFxbDZ5ZmNUcGwwYWp5N3RzVlFUUUVqWTlIYjYvV3BRbGYvRURaMVZJ?=
 =?utf-8?B?c3dpVFV2Syt5TXZnaXhpejlXMEU4OVBvVWpjeTRoRk5PbUd1cnpqdmhYMGNt?=
 =?utf-8?B?b0tKRXlReEpXVUhSWVBDZlJocTVpS0JIUFIrR3NMaS9JeitEYnNTeTk2aTc3?=
 =?utf-8?B?NklVeFkxTFhVZ2YwbytMelZUcFpGUDE3L0RqVnpWMlJkRk1aUEk4SmRubmNU?=
 =?utf-8?B?YmpMTUw2c0lrbFN4eWFyUEtidk5Yb0VpL0RyaXFiODZxcEM0RE9rN3lkVEw5?=
 =?utf-8?B?VzVKNU4ySXJCbFZ2WmNDNWl3WTZuYnFIZFFLeGRiZlFLVzAzWG5YRUJGZms4?=
 =?utf-8?B?SmNKeGdTdkw1eGRCbjJUbjJsbTJjV3V0em5YQVRkVG9JVkNCTDhWakFjM1JO?=
 =?utf-8?B?OFJSVmZDM21wSW5vNWJqQytrUDB1bTFJV2xIMDI1b1M5UmRRNjNnT0xkV1lr?=
 =?utf-8?B?amRUck5LaWRaRVo0K3U0b1FtcnpHeUl3d3JvT0EybEtpWlNKV251dUZRUkN3?=
 =?utf-8?B?RmpCVHpTK2hLTmhNQjEzMENad2xCUVRDbjlUNlVBQlk5c3VyRjdBR3pSMWlX?=
 =?utf-8?B?cS9nS3JpNno2RUFhdUFpQ05FbmVTR3Y0K1ZaS1gxa1k2U2VLVUhuaVVRbU1M?=
 =?utf-8?B?dHp5NnJxeTZCeEVjVzhDL1lqZDlYTlc4M3JxU1VERUIzUWpnbWhZYjNEK1M2?=
 =?utf-8?B?OEZ6cnBEb29tNFlBZXFtWlRlM01hQlRFWWdsZUJBTVkxcWYySk8ySW1OMTNC?=
 =?utf-8?B?T1pCUGV0OEg1NzA5NEhOUU5YckJHblRBMkhCemh0S2NzUjY1ZzQwVUFyRUNG?=
 =?utf-8?B?S3lFelFUM21IV2JSR3hoQ28ycEFRMk9xdnZvcXQ5NDJKSXUycisrQ2VWTUNx?=
 =?utf-8?B?NUNpdGZUMURMZU5GcWgvSE1UclVtVHkyYjl6TFpPUVRGRUFoZ0tWRjR3Z0Rz?=
 =?utf-8?B?MndCSzQ3Q2Z4cGhzMndrSCs5ZzU5K3hic1ZZNmFHRVIweHVHeU5LMFA1TTdp?=
 =?utf-8?B?b0s2dVlBb2NQeDZ5ZlF1Nm1sZC9uaEVHTjdzcFJqUjF0UkNuK3d0TnZ4SEs1?=
 =?utf-8?B?aDZIVHJxZVhUODJqOGRhTFV1Y3ZJSTJWTlVXMUtQOStJQ1BwdExmOVFwbWs3?=
 =?utf-8?B?b3V5UVZyTlBYQ3pXKzA5Sk9vcTlUVDFtYmJrK1ZvKzFrRXg2ZkZpVE5GRW9p?=
 =?utf-8?B?dWp6aVBFVTh2ZkxBeDRqZzNkRnp1RUsySnkzZkFJMzl2V1h0V0JlNUl1MzQ5?=
 =?utf-8?B?Z0hFMlRGME5XV2hQYUNhSTFqSlpWdUdQVzJOWUFDUWJFd2lpTW45QUQ1ZS8v?=
 =?utf-8?B?bHJjYnRZUVV0WGZ3dkZRQVRucTQ3NVdNQmhnNWFybFNWYU9iN2MwdkErcktk?=
 =?utf-8?B?Nis1VUxuWCtxR0tjRVIzSElDWHVkREkxQ1RTUWRhOUZSZGpTWDRMVG1YdUdP?=
 =?utf-8?B?QStCZHpGTnZySW5zeDBrNGpXSFFvSkRWeFg4cUp1dEMrZUw0MWZKOUM1MDZk?=
 =?utf-8?Q?wQUb7xr75mUUpH1X2CuJ7swko?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 329cc1df-f31e-42e4-413e-08de3ebe840d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 05:21:51.4330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: al0dpqlWyjacsw28GYEPt3xPAaooQA1ifovGO2LU4IwABW/+FMnxfONcbTb4U1x1wPLMUsrJYdjyci0k/5dkCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9062

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
Changes from v21 to v22
- rename the se_fw.c to se_ctrl.c
---
 .../driver-api/firmware/other_interfaces.rst       | 131 +++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..cbd425c5a11d 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,134 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
+enclave within the SoC boundary to enable features like
+ - Hardware Security Module (HSM)
+ - Security Hardware Extension (SHE)
+ - Vehicular to Anything (V2X)
+
+Each of the above feature is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure enclave)
+can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are dedicated
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs. Communication
+of the MU is realized using the mailbox driver. Each secure enclave can cater to
+multiple clients by virtue of these exclusive MUs. Also, they can distinguish
+transactions originating from these clients based on the MU used and core security
+state. The communication between the clients and secure enclaves is in form of
+command/response mechanism. Each client could expose specific set of secure enclave
+features to the higher layers, based on the commands supported by that client. For
+example, the secure enclave could simultaneously support an OPTEE TA and Linux
+middleware as clients. Each of these clients can expose specific set of secure
+enclave features based on the command set supported by them.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+Although MU(s) is/are not shared between SE(s). But for SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE; all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprise of twp layers:
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+::
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+  - Serializing the messages to be sent over an MU.
+
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are getting multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol:
+::
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                +-----------+      +-------------+       |
+                | se_ctrl.c +<---->+imx-mailbox.c|       |
+                |           |      |  mailbox.c  +<-->+------+    +------+
+                +-----+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+ kernel space   +------+      +------+     +------+      |
+                                                         |
+ +------------------------------------------------------ |
+                    |             |           |          |
+ userspace     /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its device_ctx
+as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management, over Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_ctrl.c
+   :export:

-- 
2.43.0

