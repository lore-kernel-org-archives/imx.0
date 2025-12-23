Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013026.outbound.protection.outlook.com [40.107.159.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D19E22FAFD
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 09:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766480699; cv=fail; b=LBT2pNYwZvokqHUFbW8eZ4oViTzuTN/im2Zo6nQqQ85Bj7gvvkmhonnjXQT3MHEdsxU+QVAugzRhcaSrUyjsv2Dl0rKR8G/AE7MRjFXdJYvsJ5vQRw9E8pOhLg+owZEo8GIY3pFtbYOJ8t9kyuiMPsSejmu7WBA5D5fnXSFusFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766480699; c=relaxed/simple;
	bh=zJTUZLf/yvPkoBJNDbc/VZbSK6aQ1MFj3x+SmLtWDoY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=UVE8jgAGXBFNGVMZvS3lXYODeACt7b37fu/yWwzydtCC/OdMQxkxURRK8gtlRIwJN8hhgYiBcEg5aV3KXi16/of4LR6lNoAO9RWw3XTSV9Tsi2/co2oStt3F+0hN88ZloN/GSD2j+h0vad/k1T2l92RpFJc7CbKQJ7rspWEfOg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cuM0AfHj; arc=fail smtp.client-ip=40.107.159.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cuM0AfHj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0OH+yxjkAbAv3LERzd79zky5eqrPqOfoemZGYgFaIeCT9OY64LMW00SceTIssbK2OW5Fux4SgzNAkjFS6ujBbeOMizcnKhS/My58PkKDwjvjWnOLmEjP5JJ6bwylNM8wRJL9VYXK/1J4YbdJH97LcrEd+KmzBeh0ejjbhfWyPxjvlqCgXl5GNGp1NHWXc4ae2VLd5/xfR8bH+o23vKoA4OZ9WNWbIsHGPXrjehWs1Q+3YoaHPpIPgwuO7Wf7oqGSnEK6XiP0psE7INTByhm5jnQ2Qc1SJXkhgmzgttMTHldqjfmCQDoWoeOODPgv3WCLcr6Cvan4OfQaX5eHtpCSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZEtyDERd3ZgD32qURsMl1zKbhLOlDdTqXy7l8HoSIs=;
 b=YfWP48EqHtVbjirbQFUvFPhKCD/sr8iQp1iswLbVRKl8OAGNbeDcpJ80Gi+JCfmFKZW/UoWwIcxPB4vtH4LyV///v2SZl6HCtUL+ZH9aMf+CmOxiMoSq7Iqn5Eu4+eiP9D07/pmQvwwIW1nSZ4GwGYopAoquJBPF7YtGDAVlgBM9TR7uN1R+uZB8rVoy495XDBt3MoZYC33ILxz7XXVRXI47zs45CEZsQ77Q5jiSbSZM9q1LyqVgw/Sz2X1+baypomQQ732/uwzQ43i1fnasM0ykwCJDy6rU2s/bxC+coENJrbKhb7Gv9nB6IG74r5AaU/I/KClFQwDjCtDDa8rRGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZEtyDERd3ZgD32qURsMl1zKbhLOlDdTqXy7l8HoSIs=;
 b=cuM0AfHjvruc5jofY3aQv0dW9fEd8saodT9vViRfLnJN8thqsRJb+Yj6ftLQfeE+RPe5YRpr5z1d5vh3MnN30imlEhDgDTxOtwX2XERa6xzvdoLVwUgAUQQg9zs5avTKjAFRlprXenkNWAV5DvggMpO73w0PaoWH1xJBlMF++ZYN9PAr9PKKvarVlOH1+B1Y6GWum7kwtMLU/EcaDHq4DAyMDDbkQIL2umnNsDsVEmKZItRo8wweVz8YYldB5rEBypaXejVMF5tQu+cdkhVBAJQQuWqu1djE1lmJu6uD2VVuWx54XajH+ATa5XoKVXX2IdK2C0gK6wkrAh5VbAKAuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by PAXPR04MB8912.eurprd04.prod.outlook.com (2603:10a6:102:20f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 09:04:53 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 09:04:52 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Subject: [PATCH 0/2] Add xspi device node and mt35xu512aba spi nor device
 support on imx943-evk board
Date: Tue, 23 Dec 2025 17:05:55 +0800
Message-Id: <20251223-imx943-xspi-dts-v1-0-7c18e5b4f97a@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHNbSmkC/x3MMQqAMAxA0atIZgM2VVGvIg5io2awSiNSKN7d4
 viG/xMoB2GFoUgQ+BGV02eYsoBln/3GKC4bqKLGEFmUI/a1xaiXoLsV287NZrHU2JohV1fgVeJ
 /HKf3/QDuMufhYQAAAA==
X-Change-ID: 20251223-imx943-xspi-dts-68da1c32534e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766480776; l=877;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=zJTUZLf/yvPkoBJNDbc/VZbSK6aQ1MFj3x+SmLtWDoY=;
 b=0Or7CuYwDyRowIEs7WIYibno2CQ9gGDTyGMhN8aez5L8Ck17I+RMiml6OAPJ7e5+tEtuuADFj
 5dymc/yg15xBGm8D4Py9PtyXlIhSc0t5CJnc0VNEPPmtVHiQ3BCWukD
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SG2PR01CA0183.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::16) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|PAXPR04MB8912:EE_
X-MS-Office365-Filtering-Correlation-Id: d1174e30-3359-4cca-f2c3-08de42025581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|19092799006|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTh5b2o2eGRzcTBHOUFPaUt6c29VMWZHR09MelRxbGlYODdKOHI4TXRKby9N?=
 =?utf-8?B?aHN0akxaZ1FSNXRqQmpJVXNkOTlWYW84bFZGL1hZSWc1cUo3cGxRV1ZueVg1?=
 =?utf-8?B?bkZEa21wT1ZuMjQxUElrZGdOaUlKWFlkNTU5OWRsSUNZdDFobFVwRWgvS1dj?=
 =?utf-8?B?cE5DT0ZOZURtK2gyS2JhWlQvL0c3eG0zVUNaOHNIYk05ZGdpZTVTWkFrdnhr?=
 =?utf-8?B?dmZZTzdmNWMyRDQ4dDNmV09Gckx6UEhPTkduOFJHRWdlc2NLNjZoWDgzbXlF?=
 =?utf-8?B?N1pHNUtrWXN1NGpLbkY2bFl3QUJzODRreTgvY0pVNEg3UzJNdVc1S25oSlEv?=
 =?utf-8?B?K3BBcVlmb0xidWFQSktkYnJhNnBManprVkk2ajNrb0JqbjkrVkV6WTdLVGRJ?=
 =?utf-8?B?d1BGNC8vcEkvMDRWYzMwYU5CTHpRVUQvUE91SFpYdEVRcXh3Rm1VaDc5dlR0?=
 =?utf-8?B?c3hqQ1dYUmxOMEc2d08yYjFYWFFyYUkyL3dWUFJwakJBUHpBdmtyMXo0Nzlj?=
 =?utf-8?B?V25ZSDJYTnZWQlJlZUFhZ1krR09zcVVvU0REd0NDQ1QxNmpPS0Q0bUhtSEcx?=
 =?utf-8?B?a0IxeFN1UWlSRkQwR0lKaDhSVHZXWjIyaEs4d3dQZ2lRenFJYW9UZktWSUdh?=
 =?utf-8?B?NERibWk2SjcrUmtNUWpVWVRjS0xTOFE5UzJRQTdFa2JvU290WWVnWk00T1dQ?=
 =?utf-8?B?MWh5VDVwZEluTmZZVTl2amFDdFlKZHVqSUNMZDlsam1yeVMzcVhScWxDNEJH?=
 =?utf-8?B?a3FPcnltOFJDeXB5bmxyZU9VRlVNK2Ntb3dvMDRKNnNDV2cxSzBWTlJLVUVj?=
 =?utf-8?B?aXMrejNSTSsrbVhUUmV4STRKN0hxRi9iNm1lV1FpNFZvekRqSHNFOGljTWFl?=
 =?utf-8?B?NzdtejlNM2F0dkpJMU5pWWs3N2ZEU25FV3ozcWlNRjkrM1V4WlFsUnRlMmRz?=
 =?utf-8?B?R3dvMWV1MnlnQWdzeHJVemIvb2VMdytJc0ZJVU5neEVNdGFpc095V3V2dlo3?=
 =?utf-8?B?ejE4dktVVkdhRDl0enpvQnFLODJzZlYvaGZvVGxMdXhGV1BTbVlUMWVJeXBG?=
 =?utf-8?B?YW1nbktJdStOaUNHejhKc3dGVDNTajlmb3ZIL2RIdWI2MW9PSlhNQlFXeW9Y?=
 =?utf-8?B?Q2hRUjI4L3pCQmNwMk1IUXNLanVTbXhyemVWY1ZGN2U3NTdoYXdDbU9CeUx3?=
 =?utf-8?B?M09MOGdxWDljS203dHBWZXdVaHFTell3NXJGRzUyLzVicjRSVG5BMHZTWW1z?=
 =?utf-8?B?alBqd2JoNm94VEIzRVU0QXNzY3JwN3BxUUhRSDBLRGZyc0VSV2ZWUlZ5Q094?=
 =?utf-8?B?dC9zUjd0OVVNa0F5WW5PTXRWcHZrT2tIN0JndGg5Q0ZXOWwvN0EzanNOaDlD?=
 =?utf-8?B?UzZNYUFCckNJRTQ1aTNmcjdJd0FkczRKTm1KeWZBU21qOVpOdEtLTnJCQkZ3?=
 =?utf-8?B?RHVGSkEzbUhpWTNhaWltTGNBRW9sYStJNjhWSHVxb1JyNUZGL01IdFdOV05a?=
 =?utf-8?B?Q2EzZ29haHRGTXFBZDZKYjhZdUF0UEpRRnBSNlFkSUFxTWdQYWdxNXhaaUNS?=
 =?utf-8?B?dDQzM3pPWktBRTFYS0hkM3daNXgvdFFTRllScW4rWlR3Tnp6R2t5VkRaMklM?=
 =?utf-8?B?d2hGTktoVmxoZG8vOXIxRnNMdEZ3cTd0NVVtbmFWcnZ3VnVtdXltWGxnSkZk?=
 =?utf-8?B?aWd2U1BRYkpxV1RVcS9HNGRRbDhGUlE2OWp0eFo4Z2ppMzVEYmQ0bmRkTyts?=
 =?utf-8?B?NWQvLzBWOVFjUVFBMS8xb2pKQUFweGFLTTdmb3N1QWU2c3gvZHpYMzY5NElV?=
 =?utf-8?B?SmxURlpNMU05RXE4UERJSndJVnlQSWJlWDIwbW9QM21ZQ3NkMkFNNmNTVWxF?=
 =?utf-8?B?Q3dmT3QyTFNSRWJvQUExZlM4eUY2NE9ZWU5tZ1BTRndEWndwTTZpQkUxaC82?=
 =?utf-8?B?aFMrNjROMzV1OUhWMTMxRnNIYlljMXJqY1BKNmoyeWdWa3Y4ZjZPL1NIMS9L?=
 =?utf-8?B?V1V0K3RMak1idW5XMFFFSTRRano5bGFFNFRuMVVqbVd0eVdWb3JycTI4Q21F?=
 =?utf-8?Q?3bOPuW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(19092799006)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmMzMUlpZlYyY21mZXNuakJVS0dLZFJJVUp1dGVxa25ONmpMbnQ5dXViZm1D?=
 =?utf-8?B?QkI0bTRmYXpING9SSVYrODl5QzNzNW93MTZ0cG1KTVhkek1xTGdmNXZhVndP?=
 =?utf-8?B?d3haMlN4V1NVeVVPcFhaSmVNQWp4azlEcmhFcnVqZzZ2NnZHM3NYTHQrMXBn?=
 =?utf-8?B?WGNHV2hRQ3ZKdElaRkZkUmRXcHFtMzdsUU1EY3ZrR2FoOUdsNHRaNUx1ck1X?=
 =?utf-8?B?dW45TEcvaUVBdGRvLzJ6c0Z0bXB6b0I2WFErZGtpcUliSU1WWWNVNU9halRq?=
 =?utf-8?B?STdlUmF1aFJYazMxYkJFbTNONjVpQ042NmdZcVVUdk5jdnFacDIyM1JuK3lx?=
 =?utf-8?B?UnVyT09ZUHlaay9Wc1VoZzZyZmlUMklGdHdidm5PYnpSRGJndDk5MzhNZVE5?=
 =?utf-8?B?RWtwVXI1dHVJTkpQTWVlWEw0MmcwcmQwYWF0bUZUQ1ZFdUJ3RGlXQWduYjY5?=
 =?utf-8?B?OGJRTy9OSjY0UThlems2eEtIc0dHUFAzTUQ3ZE1PT1kySzRDSjl5NWZVM29B?=
 =?utf-8?B?KzVHSk95S2JFOXhVcUU5NVJNcTNDNkRiWmZ4NVNSM3VSajgvZzN4QjNLQmxJ?=
 =?utf-8?B?MnVnbHBIbVE0SDJpa1lod2dzMm44N205U1NHdlRBK2ZLcy95bC94aWdKd09K?=
 =?utf-8?B?V1FVa1RMbFc0RjBZcU5wQXkySE5qeVptcEpXNXk4OFk4KzAxNHRPUXZHbDMx?=
 =?utf-8?B?QmpwSEprU3pHMnBaMjE3UEtvNlU2MWJSTUJBUzExWTNqQzdCUFNmTjQwNW9l?=
 =?utf-8?B?VUpxMnYvVU1BNHpIY1ZVZVFuYnVDcURZVk1ranR1dU5hekNVcDZNOVpBSTI1?=
 =?utf-8?B?RkVxVzN4clp3MG1lMTNCam96UTZBeFFIaXJ5YndTME05dGlaZVdGS1Z4ejU2?=
 =?utf-8?B?N1ZBLzNSZlNwWk55ZldpZFVHOSthTUFCNExlOWdaek00RHl6UXZNRG5oaUNv?=
 =?utf-8?B?T0JoTmlQWGRheUs3d3ljQm1wQU5GVGtxK0NFa05YQnBGUjFrUHhBcm9OVktX?=
 =?utf-8?B?NCtnS0Fyc2NkQVdIWHNDZG80VTh5dmlKajRkc3BMQ0pES1lKQXpOaGFxNEdT?=
 =?utf-8?B?dEIzUmphOTgrWUJEcE93ZGZzUElMQVdJUmxDeU0yVHRSRmF4T2VjcFB2NDdv?=
 =?utf-8?B?b054bGVNdG13RVBYd3d2NTJYNFFIRGpSZVBZaGlFNmYrNXdJM1VabEtKMFBz?=
 =?utf-8?B?ZWhKbmtJNTdQaStXU1dObFR6MVZjaEc1czU4R1hKQ09ob3NSSEU5Y1FoeWdu?=
 =?utf-8?B?UVl5VDdJVktGVEkyb2NtRlRxS2ZGUlY1UWNWVUtiaUZCdVNyZVNzNVZzbVZ5?=
 =?utf-8?B?Yk5WSFFmaFZON3Z4OTc0bmxkU3BRNEFCcmI0NnVaWnV1S0F5dS9icS8zQWtp?=
 =?utf-8?B?SG01THBTVEIyU2k5cHcySnpzYm9ES3VQMWJoQW5PbElUN0hPSlpJQmhBNEFt?=
 =?utf-8?B?ajdRdWRYZ2RPS2JYTVdRM1VuSG9BYzlSU3B2bTB5WnRscStUSzFtVU51NXJl?=
 =?utf-8?B?NWg5RVAzV05oWUIyMzdySnVBQ3lrY3JZVFBNYWp3TGMvaDVYRzBVYTBjcnI3?=
 =?utf-8?B?alREekJWWG1xQ1hXZUhtK2VWVkRFLzJZbFFGVEFKT2pQVW44dEZNcnBMMzQ1?=
 =?utf-8?B?ZUhQMUEwNHkxcFRpcStBY3c0S2hlc2NBRCs3Z1p4VnpuYW5leWFOeitiN2pn?=
 =?utf-8?B?ak9RdW5ITEl4b0taRi8zWENrdVVvNlRNS2UzNDZoOHpkUzFiZDRuYTZJL2U2?=
 =?utf-8?B?SEw5eEdzYmZITE1tcnEzOERrams2N21IVmtGdHJLRkozbm9TK1RVREtFVUhO?=
 =?utf-8?B?U2R5THc3R1dLeEFqUzNnNDJ2WHFLRTgvMmZyNS9UZ1A3YTcyVGxzQmlzaDh3?=
 =?utf-8?B?NzU0NlV0MFZzeXNlRnlPUG8rQWJTc040SE14d0Z6cFNJdlhXWFhSSjd2MGFH?=
 =?utf-8?B?M1d3aUF5NFNpWndaWGVnemgzTGgvRFlGSk1vVU4yR1BzeUpPa3pFMnRtRitk?=
 =?utf-8?B?enpFbUJkSTVmOEVHczBFNzB0UkdLV2VtQ2tmMFlzNE0ybjVLdkhWZmxKcmZU?=
 =?utf-8?B?NHZPZnY0NkM3Q3NrMXYrQ0tTcmptbldZc1JMWENNWkZ3ckRSU1k4L0NVY211?=
 =?utf-8?B?eXp1M1RCTEk5SWUxdnBCTkl1ZHVpcnYwNEFuNnpiM3RIVld4RWxtSWJjVUEv?=
 =?utf-8?B?SGZiZmxKMkcyTDJpbFJKVnM4NlUxSHIxSVJUdEs3TGVyYUJTNFpPWjBIelpL?=
 =?utf-8?B?SXJnYWRxdEp2ODZtaVRBYy9QNDRDdzNzSTl1cXlJUlh0VVhoWGdsSCtKWmU4?=
 =?utf-8?B?R0d0SFpWSm1jcGIvcW8rcTJodHlHS1VtdU82clFuNDRGNFp1MVB6Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1174e30-3359-4cca-f2c3-08de42025581
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 09:04:52.7115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d1wmOFG9v5Jnxx8Gan91VfWvyWW9K2fdQG0dZbN0YCv/hxRP/HS+dF0w3PP0pWxqpFdYzsNTVC2ALSt5rWmSFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8912

xspi is a new flexible SPI host controller in imx94. The driver
already merged into linux-next, refer to the following link:

https://lore.kernel.org/r/20251216-xspi-v7-0-282525220979@nxp.com

The first patch add the xspi device node in imx94.dtsi.
Second patch add mt35xu512aba spi support on imx943-evk board.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
Haibo Chen (2):
      arm64: dts: imx94: add xspi device node
      arm64: dts: imx94: add mt35xu512aba spi nor support

 arch/arm64/boot/dts/freescale/imx94.dtsi     | 34 +++++++++++++++++++++++++++-
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 34 ++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+), 1 deletion(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251223-imx943-xspi-dts-68da1c32534e

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>

