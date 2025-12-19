Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013035.outbound.protection.outlook.com [52.101.83.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449322C1786
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 05:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766121739; cv=fail; b=oPe3Zlsd34HSDq+UZKkS9a+kwGlhUrs2IlKE2knr3Vsu8cYbSYCz5+HtMDC33tiZW0ut49oo3XnOykUyxVkuWxMkv3KXCKEruy1GDHvzst3ltJ93TNYg0E6YQSYOq9PCcWDVHgn9wCj/52m4lVxhdM/H1XPngKovHU6rpBL5J2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766121739; c=relaxed/simple;
	bh=7QEuAhxOIw0u2oO8DRHrZP/iK1N7H24f44E0a+y4C1Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=i3SjPd7VnVs2zEuJicOjwXCW34eJmm8QcouiNa5LajoWZB5DDozxS7TnQ3/6NVA1INMLw1GhLTEJizXUrHiVtwJCp/PCCU/Q6JrUawpgRQsxnYw/TGWrm0p2J1spCk8ui9JiGkAci1LSlsmYhfDeg+hwEgyVC/IpyC0mpeOyaGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Gxc6eHOa; arc=fail smtp.client-ip=52.101.83.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Gxc6eHOa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqB18Bk4fqL1F5TgOs5VUVhvqjeyaG5dQiTrKIClFi8z/jgSGVyszsbJ21bpOJaFZQCodm5Tbn3DG/UJJHF4D/HdYtL96VUdUjXe7Mrt7dsydM0QDXEOXOBPIlvq7U+rL+fF7U+5vQ2Vb2u4JpIc4ulsehw1jhmGOz+btJwUTEsPHSiwZNPCZgI+C28gTCjskOzDhP5l/OOb6KhnRMU+tb7tzm42K42x/d6ehA6+poyrihUJOGdHAbaR+zWdeAXZsHkpTRGW24j/KJy6oZdSNWDdwv05r2qn179je5AlbI+re2fKNG0jJ1Ng5I2ApEoabFaehwGFFhBUOkY5PHkVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaQYmFXhZmj9KETYFrL1rTXvxZAHd+VSOAIQc0lwt8o=;
 b=PGuWd0YNf4371t5gGOPANge1ug6vHWC9VoJSYDdGjD8C++CXnfUzMEdjiFYSq25YP6tq7NLkAp5tPwxokfjuQ83Rjv46NAaFCtWfCebUc9q1W412/ZEG3KRAdVKxDBBpH1e9HHBZPhfkqC68PE7QCaQsoBqb8YMJlgc+bOBHWe49j1ct1zqTWa/xJdGEJYcVf6tCwakgSY0Rttgy/CayEsuKLNOnKh9rJ6pZwqE6wOdnjs8apscn9LUPmcHckMv6NjifwgQmnNMexcT20dhApRNFNe4FJvywNPAsFp8gSI6FJDamVUGbkQas4Ny4QQOeGK99pqCE1F5Swqnu8iYqWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaQYmFXhZmj9KETYFrL1rTXvxZAHd+VSOAIQc0lwt8o=;
 b=Gxc6eHOaKHODq2LvIha3zgJPL+PCHj+iSWVU9OZ/K3FFfT5+/BfR5DsZWZq0p/d2QmGslXTUNYUl3pHL3NJfXIvVbgBtBZAsDPAl59LCB7Q2NfMXe5LZ2Dctp3s/zvmmeyosqjaWTsN9kmetApl9jeJ26chr9hoR4rcgkNKzwLgoFtx3yo0sxYYvcgLl5LZ1cbBf2+x9fOnm1ozBB5Wl5i8CzyIVmpsOjkg2q2cLj7u/OmkaY571wl+SEGRd2a/KnaD6MIPDKaLmJ9zfIaPMzoW191tGephhRu+DGmkRFfY4VMa6OUubyUA2TMeljdnRJ8jIKK5XJT8LUhvyEoOk5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AS8PR04MB9062.eurprd04.prod.outlook.com (2603:10a6:20b:445::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Fri, 19 Dec
 2025 05:22:13 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%3]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 05:22:13 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Fri, 19 Dec 2025 10:50:44 +0530
Subject: [PATCH v23 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-imx-se-if-v23-6-5c6773d00318@nxp.com>
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
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766121652; l=1320;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=7QEuAhxOIw0u2oO8DRHrZP/iK1N7H24f44E0a+y4C1Y=;
 b=SSs7lw2gYQCSCAMLMZBqttTwvu3gNzsvXX3TdfKyJJUOJqqbhYbWx8QXN78lHI+WRrTuuM94S
 iYHVUYCN/ZOBeBMJgC+PUYVfqFL+qfS1QKl9kMQjW2CX1vDVdiyQ0Vt
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
X-MS-Office365-Filtering-Correlation-Id: 20ffd158-aab7-413f-50d8-08de3ebe9113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVpYY2c5U0d3bGJHNGxuYzNxcm9ONFhOUmpDZk5PMkRyWU8xVk1JdVU5UUo3?=
 =?utf-8?B?Ui9wam5iRlgrU2ZBN1ZCMmNzakRzanQxOUJLOFVWaHQxZklmNWVZYU5nclJD?=
 =?utf-8?B?bENxZzQ5cmZ0UDNvNTZRdmVMMUFRMTd5MGFObTVMQ3huT3J0bVM3aWdLMmZ2?=
 =?utf-8?B?L1VZQitOVzNVdU4rV2taa1FaTkVmSTgza1RobnJCblZMV2M5c0lMeWZTRzg2?=
 =?utf-8?B?MkkxbWpLTVpUTFhPZFMvOXk0S0liMGlHZUVRUlpWdGlmWW5nenJWOTJLTXNh?=
 =?utf-8?B?V1lhWWRzTFBhNXpmZytReFRpNmZjV05COVI0UnB1ZjlOSWtxSG4wNG9mVzkx?=
 =?utf-8?B?RW9lS0pOWmJKY3Fjc1JkRDJjVTgyNWhUN2liejBBU0ROOUk2ZGVObHNsTnNr?=
 =?utf-8?B?ZWh0RGlkTW9kT3NFckwrTzJydFhNNSs1V3dOT0lwT2hoM3JuMk9kUFc0NHE1?=
 =?utf-8?B?SVluWUR2b0JxdDNDWFMycFU0bnB6czBISDhkSjZvZE1jSmlVVUk1bnViSWZI?=
 =?utf-8?B?Q2hkLzU1amQ1MlRieVFOVmRqUkpheFN6Qm1JNW92RWhsQnFXVmVKTzV0UHZP?=
 =?utf-8?B?RlhZV0lQR0s5UndMcDdyT2dNYmZZb0J0YzZrakI0NzR3NzhpZU5wVmFwYWxB?=
 =?utf-8?B?Y2Y2MXhoWE1QSFRPWTQxVkQ4NVFiMjZhaElJTWttY0drODkwYzlvNTh5RHdQ?=
 =?utf-8?B?anZMMkh0d2pYUk9jaFRldWovc1pVcEd5dllTTkRhOENFQWFWM2tuVFBMaGFi?=
 =?utf-8?B?TDJPOTJLTk1tREgxV2p0bWNaQXpIV01jMjlORndKdjNRbHZET0RYS2xYY3Y4?=
 =?utf-8?B?U0VOUm81RFRjVDJ6YkVYQTgveTJzTU56dUJ2b29LK2tKQnp2SWRmTEJmSUpL?=
 =?utf-8?B?NnBJVGk5MDJqeWVBTkJwUWZvVWUyajZHMXQyblRjVXJHM01SRFgrZ2VRbHNP?=
 =?utf-8?B?REVSTVRuZVFGNkNkUXMxRk9SRHVmZTdOejA5T1NaSFlBT2tzdWNCRDhISU1Q?=
 =?utf-8?B?S0JVNndrWUNicUErQ3doeHQzWmZKdC9mdWdidnp0cTVKQlBHcUhJUXlCWm9E?=
 =?utf-8?B?dVVMWHZyTnlsNXdZUEIwQVRmeFNYSU5TdWFkbENuQnZia1dnbTQrTEEvbUNx?=
 =?utf-8?B?RTFJOTF1VmxjVEwyQ2s3cENndkJxL1VhWC9jN0hXL00rbU9TWDNpSXZpejVi?=
 =?utf-8?B?Qnl2ZEptYlBLcUtLVyt0dXB4ZzFMeTRxdXVmbGVMQ1F2My9kVkV5RkxsVkFE?=
 =?utf-8?B?YTFodEQ2R0JWTm5HU3JhaksyV1NLSVpNU1d0L3EzR3RKYllLUnhZNVhybzhR?=
 =?utf-8?B?QlZsUWs5QVdRK3F1VnR0RDgyMlY0VGdIWTRtYnhPWU11TDVaa1h4OXp6Y1NK?=
 =?utf-8?B?Y3JLZ3FaNm9YMjR2TE9CczUrQVUyYXRxTW9iaHJnRFc1eDhRa0ZLVVVMTFQ4?=
 =?utf-8?B?UmdWWWZxL1ZXTWNGNXMxbzlMK1dxOCtXQkY5K2pocHZ6eHg2UDFVVUFqNlcv?=
 =?utf-8?B?NWwxNnlXRW54NEpWQnM3dFNCaERWNHgyV0lJOTROQjBEd2grL20xWjNGTWE1?=
 =?utf-8?B?WWdmVVJUd2JVbFlXa2RENlJINTZxdFRLd1VGRXQ4dHB0aVJ5cjU2eDFYZnp4?=
 =?utf-8?B?QmNVZjR4cmRTdDQzb3NaT1NZMnBOTEVrWVB6amdLcXlUSytPMlNpaVc1R1hF?=
 =?utf-8?B?Vm0rUWFiUkJVbWR4bWhybmdrVFUxSFF0WkRrTitoUUdJTnozWTFSYUFMZzdz?=
 =?utf-8?B?MHgrMDh5aENCeXRpUWdkSHo5N2UyeU9yUnlrVkR6N0pkeVU3UFl4UEtGWU9q?=
 =?utf-8?B?WXU0Q2hVMlkzeDNjemhoajlsYjRoOExwSWNXaFhSWjFjUCsrdFBSb0hzZnp1?=
 =?utf-8?B?a1hYRkY5Ui9MVC9aN3FoYjg2ZEVZNnFDM0FybUpJVEdtRWxKSXZUb2MyM1pJ?=
 =?utf-8?B?NmNlcXVySmFXOWdqdml0aDY3UTczeG5mUk9ZSnVOS21seVNOdHFaU0RMUnZH?=
 =?utf-8?B?eWdOYS9pelpUdmNHVjM1WVRneW1xbHorV0dSdEluQzZWRkwzeldHR2R6MTQv?=
 =?utf-8?Q?N0NVu6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTBBbUErTFh1YXhYMzdjWHg5Y0hhSTVmWVZ0dnhPd0Y0QmpLalVCMWc3b3Yr?=
 =?utf-8?B?MWtmUnQ0MW53MVhsRjR3dEZZd2xxM0VSK1k1bHF5Z0J4c3JtVzZ4ODF4cVlt?=
 =?utf-8?B?d1cyQWNPbWQ0cHFUOXJacld3akUwanlYeEVibVozdFZlMVFna1hKVFRIbnN1?=
 =?utf-8?B?WkM5cVpLU0NIUzhreTg4RmxZanlGUmFvTENNMUhualB0ZlVGWC80OWVCOXZL?=
 =?utf-8?B?MStqLzc1MitpbTBJdXFvWi9JVU10MW1yNFlmdjdiT3ZydFQ0OHdmTzJudHNl?=
 =?utf-8?B?ZnhqaXZjeDNZTWNobXp0N3dqb2MzRDZaZ2ZGUkFWN3F3TWhPQjFKWW9HVjcz?=
 =?utf-8?B?aVpxMVVmZ21Vd0tEd2kra1kxZmd5cTEzUGkrZTgrNzRLcG1wd1ZUNk9icUxK?=
 =?utf-8?B?SlNBZlZHWUp0UzZhL2VZdmdCS1BNcGh2Q3ZsNkJkRVJTRkI3NW0rYTZuakJj?=
 =?utf-8?B?VEY5bzZwNXQ1dmVNVDlhRDFNTTFYcWZMSVZ0MDZWQzRjQlZUWi9GemFFd1BH?=
 =?utf-8?B?VGRZU29SV1FkcWIrb0xETDVJWlAyOHkrYkVhaHdWaVIxQjVTOGhld2lRWjcx?=
 =?utf-8?B?eWtSem9FaW9GVS8rNGQxVnk2Mzc0OEgvZkl2WUY5dnJRZi9mZkNqRUk4SjBq?=
 =?utf-8?B?cHVNcHg3amE1QmJHWDZvYmNWM3FtTzFtUjhmcUQvd3NyY0Rva1lrSlg4T2cv?=
 =?utf-8?B?WW1lNURFaGNqeFozR2c4dmJmQWg2UDAvSWR6ZmxNNnVuTmYxWktSeUloUmNE?=
 =?utf-8?B?N3ROWHlrZlJtNytiNTVJVCtGalVWVkRYWis3alBJUVMrZStVY1FxK3ZEZHJI?=
 =?utf-8?B?dTVVck1rL29WM2dOeUZyYTBnYVJ5YzdqaVlKNnhxWU40cy9zWWlObElWNEVC?=
 =?utf-8?B?VlptUHZUcFd0eHV2OGRFOEFyeDE3NnFhaDNhODFIOUtiQkkxckJTYzRlUGp3?=
 =?utf-8?B?K0ovWGpQSmtBMU5kT0tBQ2NHWXFzQkpONnkxSnV2NWVBSWVaUVdRQXZBL0Mw?=
 =?utf-8?B?S0FwdXVYZm8ra2pSNjl0NjZSb0FrZjRCVEFleUFYMUxRbG9DTjcrUVd3N2ZT?=
 =?utf-8?B?NklydG0xTm1JakNiY0o2a1BrMG5zMituYTVoUURJMTFYcko3cTVsbWxjeHM4?=
 =?utf-8?B?N0N4OEJRNWVobzV0V1FxTmVWYTQ3R3BJT3VLMmVKN0ZuU3AvckZCVXhET2ww?=
 =?utf-8?B?Z1ZiYkVQYzk0eE1yNGd1SDU0NVZhNXl0NEY1aG9pZmxwc1lGRWVvbDBlVmNU?=
 =?utf-8?B?M08wNkJneHVpMWdmVjRiUk5TUnNmMzZJUjVoUXhkWUFzUFk3V0JLTlkyVkZE?=
 =?utf-8?B?Y3VRQk9RaUptdUhqMlhKSlltYmg5ekliVnBCVEZxbWM5WHphZVVCdTdQQUgw?=
 =?utf-8?B?ckdEU2IrUjFwSHFqdUE0QllEalF1SXBRcXAvQjdqS2VJZEFXYktZMHVFT1Nj?=
 =?utf-8?B?WGpCUERrTzYyYStGeGJ3SlBqY2hlQ2h6Q09xZnE5ZEFLN3FCcEIvWGlpS0dE?=
 =?utf-8?B?K0lkQ0Zma0ZlREd6bERVSStRVmsrc1lzMzNXTGo2eDd0R0NkK0RRN3FKdzNR?=
 =?utf-8?B?aS9uQWZnQ3lNUDI2cDE0U1A5TkNQR2ZCOGFGQWJOQW9rT1JJRHcyeWc1aGNI?=
 =?utf-8?B?T1NoSG5oazNqSkJDazFxVDI1TzZQYnR5Rm1BZGpOV1NGVUdwRVM3dFI1Q2tp?=
 =?utf-8?B?SVFmR2E3ak93d2lKN3dsWnkwQUxxcjE0RC9va0hvNXpkd3VMY0d3NnlCVmlB?=
 =?utf-8?B?RWNoMS9mekc4NTZIaWx5L2Vma01aS3EzQm4wTVlLRDZia0ZqOVZTZWdKNWtX?=
 =?utf-8?B?WXVlZmZpamZWRXBOdUFrY2Q2Mk5ZNGwremxJK0E4TTVaay8vMmQvNnFJc0ls?=
 =?utf-8?B?VDFiZ0pvZjlRczJYV0NVbkhna0hpYThvQmIrZmRwSmo4LzIyb0RXWGVzT0hr?=
 =?utf-8?B?VXd2cDFlaDFxS2lMYjUvK1pWckwxOGZwVTdQZURkMVQveFBaWFBMaTNnN2h0?=
 =?utf-8?B?OWJvc0x0TjVweTZheUVNdmZWU2pGR1lnTjlhK2ZVR1phKzREUk01Z1hnRjE3?=
 =?utf-8?B?RzJVbXRaQlZ0RU8xK05sOVQzaGNxSmhNTlhNK0YwY0psK0QwMjk4d2h4bklJ?=
 =?utf-8?Q?3ccytAcpc4s4cbpfMifAz0q6x?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ffd158-aab7-413f-50d8-08de3ebe9113
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 05:22:13.3397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8808DeF+Kui25rb5ZXbq/n+Mo5KZsikgOUyVv45jc52ZNcqoNnBOLTeRBSERUbWIFo5QWoETsKKccXnc6OFEPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9062

Add support for NXP secure enclave called EdgeLock Enclave firmware (se-fw)
for imx8ulp-evk.

Add label sram0 for sram@2201f000 and add secure-enclave node

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..10a4779dd24c 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -154,7 +154,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram0: sram@2201f000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2201f000 0x0 0x1000>;
 
@@ -186,6 +186,13 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			 compatible = "fsl,imx8ulp-se-ele-hsm";
+			 mbox-names = "tx", "rx";
+			 mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			 sram = <&sram0>;
+		 };
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0

