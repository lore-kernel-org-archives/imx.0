Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011007.outbound.protection.outlook.com [40.107.130.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037D13A9611
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 16:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771951721; cv=fail; b=aIjSAhz+fHplndA3Hxh36Bz5JLvvvwBBsX2yE8V2OXGvRl79l3vzB+zrfqHDsv6W2lDr5j8VaBum/uxZiZ5/Pnd13ufIea5/gqO0Cxbmywlmudpe+Buy8yFjoOthQjYNlNQOsQ2SSxx8i89myGIdDq0c8PDsBfdLwjnGuJaqvWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771951721; c=relaxed/simple;
	bh=1vxRlc4fInaV2BayRLZyHHa5xeJ7S0vuu36dqvrGaWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t1qPpsKwsrWlbOTiQ1sVNbVg3usxvEZT+uKr+eGQUPivJvghj1g0TFhZFoMctIy2vjphcCijfmfORwvrvXrEKj/7Ai+OUYxzLffSWBGuCINrK6P/M4eZEs4ivSEptR2caXbeA4VbYyyLdr5flnYDQh8Xeov3ZWhF0i09qDhv9TA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=alyxjK29; arc=fail smtp.client-ip=40.107.130.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="alyxjK29"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdm7hppgBLmlGD93pK0415gtB6ojAe/ylVV1sZTVA0sv4cQf75A9FE5G8jppR84U5ps4kBVgCqekM7uEAiDkxcmsG8PVa+j2qFqQMr2q0RsPLW8zALNX3W8a5O+jzRKchTZy2sWIRiU+Fg/KWV25NffUJb4pfoXL4MhLIz1M8IljK2DhF/PwUzp4jS7VbBEPhAmh22rCjYSecOxAd0c8s3yZ1s/jwMmae7nHw6+FwMIf1bvqbJP5uaD704S7KaXs7VPaxtUuawd64Y5aKTzvPI1t03OhESg9G0wlP491Hwj2QJDQQtDg1/7Oj0aCEjhCKsnQtzbwFxt5qm1mzJ1CpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vxRlc4fInaV2BayRLZyHHa5xeJ7S0vuu36dqvrGaWo=;
 b=u1BpIyLbsrYdbhsLkieRPVADmkhZwJm9V51O0lGAWiePZyX629fPrD6WEB4ykzxgwmC+Tm1RgeSBOsyXzAKHCRlHAGTWWL+1hw+3x4wR93HcccmbEdBrISlIyF1ZKJms1Z53SxQ/PZa6fCVebX4nLDG/AmEIH23ln1YkVE6g4Ha+SzvRVp9j+TwV8zFBwDJA48qFdSn8tRRPOHTZjGVXabkp+6wdeBmj/yTrSGysjEI9iNVHBZ9oHItLWoY+/SPqOwZO5yocDaUUH2LofdxJ9NHIuLpK+CGkGtX2XrUQF8VyvUboZn6upOcwQgs0wIpQthp4NRfi/a4GhUlQVH2Zhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vxRlc4fInaV2BayRLZyHHa5xeJ7S0vuu36dqvrGaWo=;
 b=alyxjK291mcCavYqfVdavTSp6NP+VG1K0ljo7HnFeY1LF92ljzG0MKEar9OGk/A1xttNC4epdTAQwxnsFFdzSdLkcWKPfPUwQVP0mZTI+x73Uw0fFCsFP4z+Lk+zDzufCi8Zffw/3UnIQRVjSn7wo3wn/iSOp2L/F91YshGpb+uImCnWY/gSRoGOj6mFIq7D5N52nYHQVhcuZBRdQfYCve3cqT82AHlqLckGHpShPf+hLSSkTkVKex+wyQj8Y+fno1RwNVwLXDYczczZDCdKEURVOYtQjtJf2QMhSQrd0G/Un+4aca22UGbCMI5GLlmtp1IztzFA+1khXN+k81N8vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GV1PR04MB10155.eurprd04.prod.outlook.com (2603:10a6:150:1a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:48:35 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 16:48:35 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Sherry Sun <sherry.sun@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx95-19x19-evk: enable lpuart5 for Bluetooth support
Date: Tue, 24 Feb 2026 11:48:15 -0500
Message-ID: <177195167113.2896333.7248672446573272861.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120104842.2025697-1-sherry.sun@nxp.com>
References: <20260120104842.2025697-1-sherry.sun@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GV1PR04MB10155:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c1a6e37-0f0f-4175-5a12-08de73c48cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|7416014|376014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTYwYnNJRTJRd1FsZ0l4bXpVMkRJNyt0aWlZakRkeWxRWjMrcTR3empNVGhN?=
 =?utf-8?B?MVdCSXkzejl2Z3haQnFpaloycXJsc3EzeVlMZzVaZnZ5bkpQbGJweHc2azNv?=
 =?utf-8?B?RXg0bC8xbGRjV0lieFFtK3NqbXZJVXprMGNzR2FOQTdYNE1Kd0N1eG1RZUtO?=
 =?utf-8?B?RlFDZXVBUmx6YXNRWWdKMElwS0I5UEpCTG5aVWRicThOTmxDOXUyaXFlKzRH?=
 =?utf-8?B?LzkrYWdNR2drY3FQbjJCQUhIZElZdUFNbjJFY1Z5cCtlZHN5UWFodGtnNnZq?=
 =?utf-8?B?N0lEVHp0bGZ2OHJqbmRiUWJ0RVFkL1hGdU80U1hGMXhnY21wUW5YZnFwTUxQ?=
 =?utf-8?B?aHFQT1hoZ2trOVlOVWlVZTF3K1dWR1QvSnp3VitYYjlKWHBUZEN3c2VBRm1N?=
 =?utf-8?B?eXBxRk9Ib094TUdwTlMyVlVzcUhMcFpjeHBWWEFZYnlTUytzRXNvTXlQR0xx?=
 =?utf-8?B?ZEJwd1k3WDR2c2hIYkdnV3JzUlF0Q25sQjVXUjk2dTNUc244ZzRVTDFOV2tL?=
 =?utf-8?B?QnAwbmdrblZUajB4TDBIbGpjcDBZbnNPaFhzZkZBdHZDTG9IcXRaZFRJN25P?=
 =?utf-8?B?NXo4YTVuN0xodzd2NWtseEdRalRjS29qdytiRlM1WnAyVWdqdUdoTmpYSjRM?=
 =?utf-8?B?U1FXUU5aT2hCKzRWOXRaenZmcGFQbVZVc2tEdlcxRjh4NjNObXF2MXk2OVZu?=
 =?utf-8?B?UlJmRzNvcUZCR3JiRHNUZitSQ2lkTG9WTnZSaktuSW81eVBTT1NQSWFtM01u?=
 =?utf-8?B?WHpaVzFtWGdQbXdrOG1pcFUvaytsRklKOFlnRUNhaitvVDdveVdnVHh1Q25Q?=
 =?utf-8?B?REI3eHlPUlFUaVROTFBHamtCaG13OHhKcjFTcVdMQkxBWnRtZHNRR0l4WnpL?=
 =?utf-8?B?VjV2L1RhZ0RvTmNIMjc0dVRmRHkzQXI4RUdsV2dCVklsTkxzTjYwUEM4anBq?=
 =?utf-8?B?cFEvSG5xZFVUZ09tbUM1ODRqZXlmNGFkUDVmdEVkZGQ2MW5sQkROWVk2Sm9Y?=
 =?utf-8?B?VjFvSnR4T011N004SS92MU1hak5EUnRPYnlrTkcxbUdGM2cvd2JwWGVMQmlv?=
 =?utf-8?B?TWhwYTRWYitUWW52bVZYNVIwTitkOElCc3plS3VXTlFwR1Nlc0lTcUZLY2Fn?=
 =?utf-8?B?RzFJNndhYmExTGdqU215dVNPbDZMQ0Q1TGFtSnN3YjJGeHJNVlZkWmYvNE9U?=
 =?utf-8?B?VHFGTlhCUDhmUFVJRWQxUzdQYVg0NmZIdFRXQ21YdTVuc3ptaXZudGhKK1No?=
 =?utf-8?B?bFVhVm0ybllsUERDQ2Rta0tvTmIyWktvV1dKcmp6amV6MmtvWUNuOXp1bnVl?=
 =?utf-8?B?eXM1dnFkOW02SG0veU5KdktGeGx1a1I1MXNra2lNcjFlKzhYMlFCbTdWQmkv?=
 =?utf-8?B?akErZWxNdlZZQXZPY1FEaHhpVkh0MnJsckMzQlhDNTFyTWJVS2ZtQlBiS0Rn?=
 =?utf-8?B?U2RkdTNWVTZXVWdwN1VBVHZnSHZRYThkc0w0SStmbnh0NWZHYWdXNGhFaDFy?=
 =?utf-8?B?MDdWSmc1NVdpOE1EV2NHalgzWFhpYmx2WmhKQkdSOEVKbWFiZ1FyNVZFNWZy?=
 =?utf-8?B?UjNuaHB2MG85N0VHOWNCQ0xqcTU1QTN1Q0RLL254emdHSVhKTTdpOC9qTmN0?=
 =?utf-8?B?Uk16QXlkMW9iQ2l2bytVbVBWL3JsdC83QjN6QytRR0pqTnlFQWdDZEoycDZZ?=
 =?utf-8?B?VkprdlhzRFZLaXRmb2FxamxOTVhaRldaU2VQaDlsZkFOa2hsUFU4MUhNNWtp?=
 =?utf-8?B?U3FnaUg2SHJFdnBHNVNlOXJ6K283SEtmNVRoUHowRGdNVFFOaFJ4TFZoZVhm?=
 =?utf-8?B?eXNiUWx0YUlhM2VGU2dvOGpDK2V0eURuaVpObzJhYURQNGsydXpFdHhPQnBV?=
 =?utf-8?B?M3E2MitrV2JOcThXajhHOGdOekRlNE9RaTUvYlFNOHk5U1BUS2dob0VWdU1Z?=
 =?utf-8?B?NC9hOEY4Si9LaUpKQjgzWWk0RExaRi82UytLbDM2YzRZcWt6M1NYRktvUXZX?=
 =?utf-8?B?L09RelNjR1BVbmFtWW45S0lzcUxBZmxlenZxZ1dLeVJUR2lBMlh6VEE2Zk1N?=
 =?utf-8?B?d040Nzd3bDRHQ1I0SzlZV0JTd1UxNDA4bUswUjFoRFZoWFl5OU5CVDE3U1BL?=
 =?utf-8?B?N3hSNFZSbFJvM1FXTmppTnRhNEFBZXcwd3o1Zkh2Z0k5TGxLdkVhRnE4d3I1?=
 =?utf-8?Q?sgkf9959QESjlr9ludcKXHg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(376014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWN2Yy9ndFdRMGFINlI0cEQvVGxWU0V4dTg2ekZ2Y1RHZjd6WnlNMzZ1Ujdh?=
 =?utf-8?B?b21vbkx3Q2l6aUNpelRVL0ptTWFmOFJyUmdicTJyTVdzZHdwN0tNQnM5bTZP?=
 =?utf-8?B?YWNDZGh5YW5TczNCUnhPcnhIakJadlZBNWF2UkxDOUNwTE1laTFzTjh3SStQ?=
 =?utf-8?B?aFJ2Nlo0SkNtc1VYR1JBM2psTWs3cWIyVnhpSklzeHZVSVRnYWphZGM2eDdV?=
 =?utf-8?B?ZGpWQk84NzRoSjk5VGg1RHErbExNRFhMYUJjeDJmUkNyR2NjTndFUFdqLy9p?=
 =?utf-8?B?bHYrWGVCdnYyY2V5bitIbm5kdWxiOEh0bGtVZXJ3Ymw4MWh0NktpTE5nVldq?=
 =?utf-8?B?SGFBdUVnUHg2b0hHZ21ibkw5TFE1Uk5keG9reG1jOVZXMUtOd1hJN2xvcXVD?=
 =?utf-8?B?Tk9BNzloVlErSEE5aE0wbUZRQWJGTFNLT0hUY1Mwd0VBUzNvczhNbDFZbGRz?=
 =?utf-8?B?UFk3cEJoVHJEWXJlNnhZRUF0V0FCazdoS1NoUFg0d1g5SE1KaWowTU1TYk9i?=
 =?utf-8?B?dG0remh2OXI3MUFrVUxodVB1bU03N2Y0Z2ZXN3RkOHhxRFcrUndiREJLR1Nt?=
 =?utf-8?B?eHJxWEVzVDl4eUxTbEUwQnhUNWpCZXEwQkdiV3hyNy9YdXZVKzg5cnV4b0g5?=
 =?utf-8?B?SXBQdkNzK0lzckRKNzRDRTAyd0x3Yi9yVW1KekdRbGV2U29JaTIzOS9KRGlQ?=
 =?utf-8?B?WjZ0bEV5Tk1qemppekZELzZBZVNkR2FqR1IvTXNuQ3dVd3l1eUxkOHA4Rlh0?=
 =?utf-8?B?UHhqM3lmZ3ZVMkd2L1RaZCtOYjA1V3l0OTNONGc4RjlJMDVwek1VSTdhWjFO?=
 =?utf-8?B?NnlRUWdKbW5DUERxYUtHcHowTTlneGRHcnlVdUlINEswQWY1MUV3L2UwQVBw?=
 =?utf-8?B?UHNrM1dBWDJmWUV2V0pnSGJUQ1BSVG9qcmNGeVVkRXovWTVnWCtmZXJSOUll?=
 =?utf-8?B?STQzdVFSbTdXV0o0ZU5adnhjaGIwcnhRWE0vZU1mc2JTOWdxYkFVRVNEZ0ds?=
 =?utf-8?B?cG9aK3R3eEFIK3BZaGZZY1c2WVdILzUzYmE3blZ2Ukc3bkowWkdQUFVXdHBi?=
 =?utf-8?B?dms4SFo1TGhoMDlFV25MelJvbWllOTdZUWljeXhwSFdtcFNSQWtOUm9RVTVP?=
 =?utf-8?B?UDdsVktsWWJDSkU2aVNDY01naXZxNkpHTjVkSFE1S2h2Nk5ldDFNSEk0R25x?=
 =?utf-8?B?cEpod05mLzdmZ0FNTll3MWIrMjIzVG5vRWJPb3lacTlQVlZBaUdVRTJrNEt5?=
 =?utf-8?B?MlI4dlVEVHBjQVFUSmJIM3c1Y1VJalhRU2V4TVFxMmV1OEFEcXBqM2QvS2Zu?=
 =?utf-8?B?Nkg0NWZ4WXEwS2g2aWJxS1ducVBscytqVmE2QU1ybHVjbzY2WGRwRTZ1Z2c3?=
 =?utf-8?B?SU1rVmhjR3pOSVBBOThvNFFXTzEyRTR2ZEI5R2xlWVpwNENIdEp6RVRHZ0hR?=
 =?utf-8?B?MDd6QkhjS1FieFd5WjZPMkdnQU1yTThsWm1LSVF6VVhuL0UxNjFZbFJJM2FK?=
 =?utf-8?B?eHBNUEFRWXp6Ym9GY0VYSUZiYVJzTU1ub0tqMXVwU3lsQlpzdGF4eWJjUk9C?=
 =?utf-8?B?VzRuT0orN1J4RTk4Q1FscUF4NFlucno5YkN6di9paG9RTFYyM0xOWnc5eWNp?=
 =?utf-8?B?RnI5Vmx2U2hDdVc5NzNYMDVpb2o1YjZJMGdMaVdTT1B4K0w1QStGU3dZNndK?=
 =?utf-8?B?Mlowa08xRmY3S3lpK1owN1pQZlg4YktsbGRJbTNuNGF5c1IvV2hNa0JpR2xa?=
 =?utf-8?B?dWpOa3JwMXNVdUhHWWROdTltTFQwT0kyUE55NXlEZDZCOEk5VXFVemwzWW5E?=
 =?utf-8?B?SU84WTFkK2FKVHlmTWpaeCtDOE8vTzRRU1o4cU44T1JRZXZBSGpEVkRTWnl3?=
 =?utf-8?B?NE0vb1ZsdjU4U3BWaEpZM2hZT2pkTXZyZkhmL01JVCsxNGVEbzA5Nms1RXhV?=
 =?utf-8?B?ZWNUTHB1Q09Rc2E0MDZCQWx2bVR3UktVMXU5ajM2MFZqZ3BUWHZEaGlMbGlJ?=
 =?utf-8?B?aTdUN2h5Z2xTYWNRN21tUVkrdWQ1ekZwY1MvaFNUWDFhNm9EeVFSejVJOXI5?=
 =?utf-8?B?Nm1TSGJsWk1zL0lsZThZbnUxTTNYSGJTUW43QWxMWmVVdlFtNzJEczR2N3ll?=
 =?utf-8?B?cnErSWREM0MrL1ozWVk4ckI0WDl2MG9yNnN6N1htY1kybUNPWmJqVVJ0cFMw?=
 =?utf-8?B?VUxDSnUya3BTeTRQUG5iSS9qeUxCUU56a0EzZnFuUjh2WXlpdjlpVkpHQkVF?=
 =?utf-8?B?eWdJaVVOdWZMeERyK09LSWNjNHIzcEUra1YyR3lZbVBZWVJKRVQ0cTlVSnor?=
 =?utf-8?Q?kcc9DGDtsbEEuDfBQ3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1a6e37-0f0f-4175-5a12-08de73c48cea
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:48:35.1288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FQbWIYm1DkDu449ps8Zq3/y54+rtIbIv3bniPt/S28BNZ/hqHOSdzl0nWKk2DpsWtUE4cAfcuCxQKA4+47lNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10155


On Tue, 20 Jan 2026 18:48:42 +0800, Sherry Sun wrote:
> Enable lpuart5 on imx95-19x19-evk board for Bluetooth support.
>
>

Applied, thanks!

[1/1] arm64: dts: imx95-19x19-evk: enable lpuart5 for Bluetooth support

Best regards,
--
Frank Li <Frank.Li@nxp.com>
