Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010037.outbound.protection.outlook.com [52.101.84.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AE38405C
	for <imx@lists.linux.dev>; Wed,  3 Dec 2025 06:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764744559; cv=fail; b=hWYlzrLjlLxp0YaoWc1UuNRKTyVgySkWI8T/Mu5j6PDMmkAbmcFk54AecR7K+Rj9CQg1OrQNQnUHB+QkrRwuHL/0iDBYskmDU1zYOM+RV+1KaveGaeVRbf//8QvG6bITYdCnoiVSQnSu0mH7WPguHsKiW+V9isg5pRoquBn41Qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764744559; c=relaxed/simple;
	bh=tOtSXomq2KH+8clEacb9RWYs1iYcwyaRAGNdBtHVSY4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=h9OkG1o2ReBKreMd7LCoek3N6v5rb/MNPqQJps9IvN9UGqhaF1ipYIldWFVgSt/rvy0Ooccv1+nJyWjEOWiY1Vd9Xuti0F37Uh5LjUS7df8dts3+ikd2oldgRWfa8Yruc0/JVJoDJ/HvvCZzQ0z53Do1MerkxgR90yHjPqKtlSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AGa0RwLq; arc=fail smtp.client-ip=52.101.84.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AGa0RwLq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JUCPXEFD4XzgxPD/pMt4kzqMEBL+nqYpbiuyXadD0/4AU/aPbsnlChk5QHwMbVSZw9cZsmhcJBYyTJh/9ekXfK8G2oYszko2C/a9eyKS6951RMmL+i8Pj34OW1yrHpiLIJ7XhRstXoOBg45SqA5ocOOD7eRtDCdA2VWi+mbqS5CM0LHLa5zg6AzwIuKDx/xqipzCmrRlkto6+AG/EJcYUHLXC5JigmNIEOeSaD/NSylZpYJK2Ej41LrFl+NZrqrK5iAyqlfwKNyK3ui7a4pJmKE2nv3vRKh1Ld/sb0WIrQ2lCOW9RYnNvQLIGGHPPmSZwfDKQYMcBfOCyiBsT6toDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9LQ6U97DJmOvAnP/Hm3/sLsl0YOZft52i2nAtpwopw=;
 b=hWZtMIT8VNy9ITwYN5NqOhpz3kZx3jo1Q3QIB+hDWHsmzKBE23fzojpSRuzm7usXfoXDIpBclUJJmOUw451mirfqcPj2krQc9xEQpoO/5TWNiY+JMYIYTAKW5gKi6VqN86YzFWLcGqD2l1oL783lgrGzE6j1uL25maY1kxDMe8vMcTXL6bwJgt4Llq6l5HMFdbnGio058jkZqXJRV2pz99PmYBOajaDt0zeX4EWsFLwHlNo/OScIUqhYN+dIwKlQdTL7+4qrl6RX2SDmIHoK7lAE/Bv2UTgOAQsMv3ItNslrVBJxiu9ePBF8WVM2A6wvEQYpbUFikhl+6Jl7m2LUFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9LQ6U97DJmOvAnP/Hm3/sLsl0YOZft52i2nAtpwopw=;
 b=AGa0RwLqF+7sytybHdMAX0tEK63wnZCeDaAwlGjIeGKOtjHTabbWblfUyPaS7901kdw8uKjxojHmZ/Dzo+oYGV7cWJcjGpRKiKdLLpC3ImBzjy/pd0U4QUby8GRgWuyXGPsM3PI+9DFCHks3CplpZzMuFnlgg3iffk/MhKq6OAP5JQ0pGV7toRA7WgKIAD2PM1E54/Wjcy/m210HuYDbxS1zxBH3nW64IL0rQM3KEH+EXLQ1et3YqQS1s9o19R1ajJ4w1pZYZdpUncljPNbSXuQDCg4Iec2l0EPrMQsRUoc608GqSaDI1+cZADxbg2UzO1u352/IzN930TK3aLQ7uA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by VI0PR04MB10758.eurprd04.prod.outlook.com (2603:10a6:800:25c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 06:49:14 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%3]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 06:49:14 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Wed, 03 Dec 2025 12:18:07 +0530
Subject: [PATCH v20 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-imx-se-if-v20-2-a04a25c4255f@nxp.com>
References: <20251203-imx-se-if-v20-0-a04a25c4255f@nxp.com>
In-Reply-To: <20251203-imx-se-if-v20-0-a04a25c4255f@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764744504; l=3201;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=tOtSXomq2KH+8clEacb9RWYs1iYcwyaRAGNdBtHVSY4=;
 b=5BoDvwaSV0TGq22FNmV3R9ERkiMg9zh5A83l6kRQzUnf8uST0ox/JeI5wg3hvV+lEFh+vPCAf
 OTXTaiPxI2BAmYg4jsb0tzJSq5sDxWXbO1ylGAZWlZZG3PADPRSCCXV
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2P153CA0020.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::19) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|VI0PR04MB10758:EE_
X-MS-Office365-Filtering-Correlation-Id: e0498705-4cc0-45d7-6da4-08de32381256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHRHRHFNVjhJTE43VFpkeVVYQ3J1SkJoczhCVjQ1WFVrS2wxRVoydEhjU0hl?=
 =?utf-8?B?RUNGMXd6MFFoVFdFK3M3RHhXWHBjaFE1aEE1bWJFbjZBYTBCeitJeHFCaDhz?=
 =?utf-8?B?L083dnpzNlNsTEQ3OFB6Yi9LeDhRVDAxTjhVQktFaXZHRktrNHg2ZUs4cGMw?=
 =?utf-8?B?cjV4MnV3TjY4d2dGREpJcUk3L2VmUkpHYjNxRmsvNzYzVWhqMVRpMzV1c0dz?=
 =?utf-8?B?bEVoY2FxZGVlSFJEeHpxajRUM1hERTJ6aXZzdnJqZ2xOeTZEV0x3WnBkbElG?=
 =?utf-8?B?aFhFMUNkZS9XbVhmVkRVeVc2ZWtOUmdWeFkvKzl0SFdJVUdqZmlZNzZ0N0RI?=
 =?utf-8?B?eS9IL2hMSmtlei9iZXhITjFoY3J3QzBxKzNaZ09jaWdCRjZtaWE1YzV1TUx0?=
 =?utf-8?B?NVhxTEMyaDB6d3Z2RkNXNXd0WnFxT25KN3VTSlNpN2RRL01QRVB0SmtmUGcx?=
 =?utf-8?B?QmVWeWVLNE5vbFU0RUFNeGxBQk5UMWtsNjhsSDhVb25jZ3c5ZXZkVm5xTzZB?=
 =?utf-8?B?ZWRWMEU2SllPK1hrL1VGNU16eUt3RE9lQjc0Z244MGluZE1jN2EzL3l2NHFn?=
 =?utf-8?B?MjlubFVLODFnaHpDT0xNaWo1a1IrZXFjKzNTaFBRWlpndUxyMHVxb25kRTl3?=
 =?utf-8?B?WnJPT1JBK1c4RHRoMW1OSDlibkIyREZ1dUR5aUdnQ3JqMjhZY1FVNVlKM2Zv?=
 =?utf-8?B?a25GaXZrOEd0aTdoWC91RGl0eXhsN1NDMVgreTZGRkpJaUcwVXE5dE9sRm5l?=
 =?utf-8?B?N3lXMTFiaHY5aUhTRFIzcVhJclpoRXN1K3diNUd5ekZPWW5ROTdHeGlieGVC?=
 =?utf-8?B?MEQzZUxUaHhuUTU1R0tWQ2szcVNDRkJ1SFVqOHBtT3N4YWtQSTBtU3RXOFlq?=
 =?utf-8?B?OXZaWUpQZDF0LzNidnFBeE5qN2Q5aERTR0YrcWdYNEVySzJGK2t1T2ZDMUpa?=
 =?utf-8?B?NGZLMFhzTmk0bTB6SzYzSEtvRDJGTzJGUUhPZzBoMGVTV2xNd1BjUVp3cExQ?=
 =?utf-8?B?Wk9TVTdyUzhlUzMrMW8xTVh0WjZjZFZtcXEzYkZFRGtHckFQVXloNU9wNHFJ?=
 =?utf-8?B?VzVrVnpnQ1g0endYRmMwbVFXakhTdG5nUGI5NUdtb0hOeUN0UXlHT1JQNWRp?=
 =?utf-8?B?VmdReGIzT2FLNWR2VVFJZTZmWDhzelBkbkdmUHorY3MrSFgrMXZMR3JqNXY5?=
 =?utf-8?B?STY1MkljaVVrU0VscTRudVRmTlVQZDF0TC9wdzFjdHgvRXB3K010Y2JjcDhN?=
 =?utf-8?B?dk42UzNBbTBNcU5KQWwvVnlDMzA3ZFMrd3JDYVVhOUlmY0JaY3BUdVFpWkMv?=
 =?utf-8?B?UEEzMktoTDlQMFVxbVpsMTU3SmpuVU5BQzlNN2V0TUlxa1VIS2ZTTUp2azBF?=
 =?utf-8?B?ampiaXk2d2lQWW1xYlFmREJ5bGdhNXN2UTFkcGcyODErL0JnOXJ5NzBqSE9E?=
 =?utf-8?B?R1QwOC8xS0pUQkNnOC9uRGt2b0g1STN0RHBPNCtCS3AyWXZkOEkyNjVSeTJK?=
 =?utf-8?B?WStCTm1taFNkaGZMOWdLSE1SU2lXc00xa2g5RjhzLzF5blJYV29EMm5ZdUI1?=
 =?utf-8?B?ZE5LZ0JSOElDaG8vKzg0ZCs5OFJEMGM1emRIK1JUeU9yZEovZmhQaitRQnhi?=
 =?utf-8?B?VlNrc0JMcEFYWkxSbHN1RmlRcGErc2Zsc2tDUm9YSzJSV0c3dE1WRGhNU0Yv?=
 =?utf-8?B?eUdIUHlEbHA5VFdiNjJlNnRHR1Z0K1FyUElaUlZ0aVlyUllkWWNtaXA5YXNs?=
 =?utf-8?B?SWRvUXpDaHEzY1dFeUhSWmNla3RJUXlQZFF4Z01QNHlGcktTVGQwaWxHVTFG?=
 =?utf-8?B?N01iTTZZZjJxTW8wWkZiUkhtMUViSERzaDFTS0tkWFpFU0pXaHpieVpQSkVW?=
 =?utf-8?B?KytaNXpXSE1SOThjY0F4UXFqVlJqYStRcTZGbzU5bUo4d0dwRHNHQjFZQngx?=
 =?utf-8?B?RTFvVEw0WlFwSzhBRm5kYkVlRytVV0xxcXpXV2QvYi8va01iOWlCYWZtcVFD?=
 =?utf-8?B?dkYzUitiaW93PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ym1pNXJQa0xVa2IrK2FsNDN1b09zajhwdVNwRVlwSkRscnpDTmRMMjMrWlQz?=
 =?utf-8?B?RFNBMExuaTVQU3pOQk9aZmdLMVlWa2hXZjhZazlvUEQ0dG0vT0ZlVnZjb0lW?=
 =?utf-8?B?UUFhZ1dHcEJlVUxtMGtKQTN6WldyS3BYdnpQY2ZZSVNOMHBrQUhhV3RXQkRZ?=
 =?utf-8?B?bkNiRXg5THE5TGF3Qjl6SXpJdk9mNEtpakkyY3Bic2Y2UFdRNkZpdkdPaXQ1?=
 =?utf-8?B?UDQwR0RySW5rMkJjbjFNVXkvanRlSmJVTVhPV2E1Tk5SNm9rWnNLeC9jRGVI?=
 =?utf-8?B?R3dpZTBmZHJRNmhrUzBsUXJkNzA3dmxWR2ZWYzdBS2lXMU5weHVUdXlYT1BM?=
 =?utf-8?B?dy9oZzIwQUVVem90YUt0c0h0Q0dxRWFNQWJOenp1dFNlK2FCUnNZaFlqMERT?=
 =?utf-8?B?MTBya3l6MWl3NDRMbi9BKzVZbkdJalhUU2N5eElQbEsrS0FWeGZrK3ZKc1NC?=
 =?utf-8?B?UEpRMVRDU1Y3S0xldmlkSTlpSVMvb2xiaFVBTDZtbkRGZmpwV24yVUs3d29q?=
 =?utf-8?B?d2NIMzIyVC90elpnTzhXS1dLdkhxcWxlNzZ4TUFlcHdaN2p2dXRkZ3ZDL0Nq?=
 =?utf-8?B?S1N0dnczb1doVUVHT3VtSWIvemhtcmEyRmdrd0RRUUlHaC9YYkxGaWduZWsr?=
 =?utf-8?B?ZDlSaWYxSTdMYmY4YkNYR3NsdFhCdWFPR25mR0xUU295K0NKbWJpYUdCM1ha?=
 =?utf-8?B?UkdJU1Y0NmtPVlEyRTI4SzdFZjVrK0lLWnFmeGxaZUlidU96MDRTYldpMG53?=
 =?utf-8?B?VGNueGtHd2IreTdPK2hlNWhwbmdzRkVOUHFTQkFBSFB2S2JGMDROdDA1QmJn?=
 =?utf-8?B?TlV2NERTQTA2UE9WQUQzTkl0VkpRTEUrOXFsOXRLRG9IMXFQUVdOVldpVmxW?=
 =?utf-8?B?VzhRNEJWempvSllIdVNDMnUwK0pqNFBnc3JQQjViMlFLeTUwUFE5RUhZSWhI?=
 =?utf-8?B?NEQwVHUvOXpsUjJCVEMvNlhYSjAxVW40RTdjS0dHVlMxNFZsNTZ3aGY5dDZy?=
 =?utf-8?B?WEdHRUJiZUhWS0lWMGNHbENudW5ad3ZCdm1RZVRyTGwwVEdLeElYc1lpUW5E?=
 =?utf-8?B?ZFAwSEZmMnJUbG40bU1HLzI1ZFBqQmhELzNPSytLMFM5K2VKQ3F2Q3VRTFl0?=
 =?utf-8?B?dW9nQnVzSWY1ZWxMdStnanQzSzBKV0FOUk4wVUVnMFN2KzRzSEwrNEZQdVo2?=
 =?utf-8?B?K1ZWM0ZXVDhReE96c1J5RlNMbHd5cVRzalIxVVFjRkJrOWs5ZkVpMWw2R24w?=
 =?utf-8?B?blhIUzhBQzZFVXRwZFRwTGRrUDdBWnkzK0g5NDlISzdzc3MxUkFCaUlVU3BV?=
 =?utf-8?B?WGV6WGpPcm1hampXSng4a1UwSmtQWFdybjJKekZCQWJGck4rSTlVUUd1Mmgx?=
 =?utf-8?B?U1o5eWtMSGljZFZxUGFoMHhuQkdvQ0NIbW03NThMeXh5ellkWWkrQjVKbHBK?=
 =?utf-8?B?dld0WjFmb3QraDdyUXVqZU53b0hrejdRdHM2VHlRUG9jNUNxNWQ0ZHRoTDVZ?=
 =?utf-8?B?ZktpRlNkVjdKYjNOdnRrU2RFYmhLQnQrb1dkNWhCYXlxWG1qSm1vTmZtcVpL?=
 =?utf-8?B?d0JsRDA4N3VKQmdVMkkzMnNES3dVTHprRHFUWmdweWwvWDlwVDhXSkNxOXE3?=
 =?utf-8?B?eFZjczhoWURFU21RallqVkU0K1EzV0k0UlljcmhyaE0rTEhDNndlWFNFbFdQ?=
 =?utf-8?B?SlRsUkNFUDhwb2tGN3k3ZmsyMm5Dc0VMVzM4VS9zRStwVFhYZEJ3aG84MFZh?=
 =?utf-8?B?RXVUR0JBQVFTclA1YnNoMmlPUHBQQnN3ZmlUSTVOZ3ZtMFpqNzNYaVhsM1p5?=
 =?utf-8?B?YXlKSzNZSVB2STdidFJLTmIwS1hMWUFJUk5DMys1VXVZSEs4YkFWTjlHVXU1?=
 =?utf-8?B?SE1NR1VFWGRFZzlDVTV5UGJCNlJUbndHb0dxUGlHMlRwWHgyREh6c3h0T1pH?=
 =?utf-8?B?SXc2ckxKUFRTcy94bFJTS01YT3VnRFJyV0RoYzJLZ2pJNmdrU1k5YWNpTi9Y?=
 =?utf-8?B?SU9KaVgySGFxeTJscC9WakNZMkthdlFsbVFXMDFrZk9wVEw5RW9pWEtHNFE3?=
 =?utf-8?B?WndRTGYySlhMQW9tQzVRZkt6QTBIYmdsemM2TGtHakRLbE4vU2RwT2t3bS92?=
 =?utf-8?Q?tCkTUZZBub8PNGfVkurnfdVu+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0498705-4cc0-45d7-6da4-08de32381256
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 06:49:14.1368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7FAVLVhTHFufVacpebwhNVXogqa+k65TR9Mz/PI5ayFuywwcKBzpirxstVvI0nzLE8ojnV2undXVSXyqMql8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10758

The NXP security hardware IP(s) like: i.MX EdgeLock Enclave, V2X etc.,
creates an embedded secure enclave within the SoC boundary to enable
features like:
- HSM
- SHE
- V2X

Secure-Enclave(s) communication interface are typically via message
unit, i.e., based on mailbox linux kernel driver. This driver enables
communication ensuring well defined message sequence protocol between
Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications, to be able to communicate over single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
new file mode 100644
index 000000000000..fa81adbf9b80
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/fsl,imx-se.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX HW Secure Enclave(s) EdgeLock Enclave
+
+maintainers:
+  - Pankaj Gupta <pankaj.gupta@nxp.com>
+
+description: |
+  NXP's SoC may contain one or multiple embedded secure-enclave HW
+  IP(s) like i.MX EdgeLock Enclave, V2X etc. These NXP's HW IP(s)
+  enables features like
+    - Hardware Security Module (HSM),
+    - Security Hardware Extension (SHE), and
+    - Vehicular to Anything (V2X)
+
+  Communication interface to the secure-enclaves(se) is based on the
+  messaging unit(s).
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8ulp-se-ele-hsm
+      - fsl,imx93-se-ele-hsm
+      - fsl,imx95-se-ele-hsm
+
+  mboxes:
+    items:
+      - description: mailbox phandle to send message to se firmware
+      - description: mailbox phandle to receive message from se firmware
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+
+allOf:
+  # memory-region
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+              - fsl,imx93-se-ele-hsm
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
+
+  # sram
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+    then:
+      required:
+        - sram
+
+    else:
+      properties:
+        sram: false
+
+additionalProperties: false
+
+examples:
+  - |
+    secure-enclave {
+      compatible = "fsl,imx95-se-ele-hsm";
+      mboxes = <&ele_mu0 0 0>, <&ele_mu0 1 0>;
+      mbox-names = "tx", "rx";
+    };
+...

-- 
2.43.0

