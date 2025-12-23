Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013026.outbound.protection.outlook.com [40.107.159.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C8B22FAFD
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 09:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766480702; cv=fail; b=LahrKjngyCTFBgjTjetVVTQwroT9E1QzufS1WcGOgLIRoQaxaSHiEU1n5wVg9FsnghXHbeQFrt04+w9B8WA8ixqpfw29be+o4CSncrv77bntRVeOx2XwpRYVp8o7FhZAywXvTejw1aP3JmzSibW1icHROhevO4CrBHhIyYQuv7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766480702; c=relaxed/simple;
	bh=Mwj8B21/WHvgW8s54kPrhtE+yJJxRsT569q9eMoFRh8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=t4xPsaNVoaaiHO3UwmxU42taC0Zh8kynknLnuHl2xaSIhFRXeEsGGJ26DjJWqooWHKLOzVtKRwfpjNDFMtd2yg/Zq4htj89HcDvN22IjpTiWUPScybRShI2i56ky/U0tz1g5QjNs9CWot2J2LdpEC0MOzBMa+XTWRGqrQhWvg/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bLv2TjeE; arc=fail smtp.client-ip=40.107.159.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bLv2TjeE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPE16kx01rHDtGHqIRv/xXd0CS8EKsX3acp/xi2uOD57Cc5YeC9w4EomYLWpKPK23AVykkTri7JHMnVfjGzK2JGGRZepz6APtYVhATDR6aijjydLk8ib+SHNmRArgcBn7iF2IjxF6SKA8mI1hp24RU/qevfjW61uC6vDdTVmv/YZfKaWTJ9WWsFD29Twer1qQ1DHHmlaDWITnx9tmaaZZkpyqad1fEK7/fHqLvayLjh6KqEHhJ8EfZW4B9OV81xKZZ91zhgFF7ks7Csbmrh67F9CE7PK3FVLJxvFOt8cW8THJd3IVD//MlFL3B+AiiWTTIP5RO7uLSbX60bV6QCrrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4j/xNibahRPL3rnu1HE3sQmOijKdj0e4e8jZzQYiJw=;
 b=jl/Oj++cpyVsVDXJW/Bfc4n4DtlRIc8N8EWNiH3RwuWPnbZc/Nw/9N3qr17wN1zvXljWmmLHSAEB6KN/5ryzftWsbIGN9f/qwXMQ9m6FzRYtbpMGo5ZHMe0jHV159DdYnkdamuXzXXUyjUMj0nr6s3eyuNFDv8RBAHn+UvlbBrQCGj7IYoOMSGW5qAmuxCazYKqLCCiWw/cEk8JEGvbNa/m1U/gkgOI6HVb6T1dMhsdudPU4lCeYo6shx4plMe2NYFlUMz3aBQ9G3ZwJE/9gKZ44XBksq5fgOX0zxH19dRlNlyWVcpr2XqKczUKHyAoOHUiGXfUBWdgYLrYTmH2LfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4j/xNibahRPL3rnu1HE3sQmOijKdj0e4e8jZzQYiJw=;
 b=bLv2TjeECzAEIKznUxxV78gc9RbOEchiAbD3TKNFxyF9EcOGaOswY4FgDZKO6TdGr5lJJrv0eZFiHSyu6sM8/5dLemH2FhKvzABDC0c8A1hVjSSQ/TMZ1XQxlvuoaYKDhPp+/y07VHXrW7vyQ5o29Y2sjWji/e0AWPKsV3SQ2FTGVcw2H/4LHYEL+gPLMcJKb2phGZ3srlwMqYXUwxHfxU35KEqgXTOv70BzeU1Idxs5/gK6DSXvgAOCH8y/rrX84JqlHpaY8CRJDpTanq+4ON6auTZB4aQYr11Us1NtGSjGjlVN4LMWnR30D7JrbGplczAJF1fpWIvWUcHCYB7I+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by PAXPR04MB8912.eurprd04.prod.outlook.com (2603:10a6:102:20f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 09:04:56 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 09:04:56 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Tue, 23 Dec 2025 17:05:56 +0800
Subject: [PATCH 1/2] arm64: dts: imx94: add xspi device node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-imx943-xspi-dts-v1-1-7c18e5b4f97a@nxp.com>
References: <20251223-imx943-xspi-dts-v1-0-7c18e5b4f97a@nxp.com>
In-Reply-To: <20251223-imx943-xspi-dts-v1-0-7c18e5b4f97a@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766480776; l=2232;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=Mwj8B21/WHvgW8s54kPrhtE+yJJxRsT569q9eMoFRh8=;
 b=Mer2UPctYNgnOokL8p1SS++Z1qzKuujAzKzxQ60y2NXy4syyy68l3RACP2ybTWdhvaDQLBRrQ
 1uJRZN/1sxiBDFkVhAxVC+IbXaiuOh08/OzLkec4jpJTrnf+GwPbODg
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
X-MS-Office365-Filtering-Correlation-Id: 654f34b1-09cb-4cdb-457c-08de420257cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|19092799006|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dU5iSXRpdno0QlQwWFpmYmpyUThVTzhRRU03Z3hYYTJzYWxSOHo5L2phYzlI?=
 =?utf-8?B?aUFsUFdEdWZrRDF5WkxmUmlUcTNTSlVOMEdXNGhva2FyL3RLRi9sdXpyMUJY?=
 =?utf-8?B?aExsMDRlV2NVUUtDV2d3d0VsSkpaSGxLZHR0aHJBNXJMSTRNZHMybUduUGRq?=
 =?utf-8?B?LzZxQVBFd3R5azlxaDNZY1RKbXp6R1ZYRnFzRmJGR2RERzVUS21sNitYbThF?=
 =?utf-8?B?dW5vdUlkY3RSN3ZNS2hCR1ZoSVp6WE9Jend5SjEyUzB1Q01tZ1BpbVBXaS9Q?=
 =?utf-8?B?bjJIMi9rK3puMTE4dk8ybGhFUUlmZXlBREs5Q0ViWDJXaERrUXBhcWk4dUFl?=
 =?utf-8?B?bnByZzF5TFhoWW9GdEwzRzN1WG91VnhkZnVaeksxbmI2RndtY1U1cS9VcWhQ?=
 =?utf-8?B?UEJHTGIwTXgzUERJSW56blIwWE8zUE02cmpWRkM0UWZJVnhKbWJ5UnFLSVM0?=
 =?utf-8?B?NWJsdFlyVUlaVmc2bUQ5S0tRS2wzM1ZkTWtpVDR1Q0FNM1NpekZJaUVJL0tG?=
 =?utf-8?B?Ymo0K0Nmam5DZTJ5MFdja01YbS9zQUhjMmliVUNNbVJSVGdCNzN2S2tEQnNi?=
 =?utf-8?B?ZWtsdmJobnZ5dTFXcFJQWld4QWk4RGYxTDRuMUVoTlNUcU9PenUxNlV3VjlW?=
 =?utf-8?B?ZUhybE9tMVF6czk2dENzTEFyYlByUTd5aFlNWVJoR3pxaW9GWjJDU2RBbGo5?=
 =?utf-8?B?eFJWT29tU0xTc0dQU2FSYjh1WlNpSEZTUmdkalF2UTN5WitMMms5VmMzVTdt?=
 =?utf-8?B?TjZ4QzBrelBiL2xrSWJ0SGladDN4c2dPTGFVUVVEdUl5Vk9ibW1jNjBONXk1?=
 =?utf-8?B?SGZCOWxnaVpHUFl5MkRUUG04OVBOZkhKM2piZnpLUGt4Q3FnSkVGL0k2ZldR?=
 =?utf-8?B?azVZSlorNkdNVzFyOFJvZ0lxd0NCbG1Lbzl2ZUdDZ3ZTNTEyM1E0NWx1ZEUz?=
 =?utf-8?B?dUpxd1V3TisrNnArRTRqajhGRGhEN04wSzh5RHRyV2IwOWFQd0VjZnM0eHBx?=
 =?utf-8?B?R0kzZHdoYk5YajA5YXZVd1Jnd0ZpRW5YTmMwTDdjdkcyWWxZZ1pSUGI1MTY1?=
 =?utf-8?B?bmdPVFYyOFdaa1JiMG5sOE5rSzZGUFJXY2pRRDZYQmhXUUZTd2Q2UzU4aXJM?=
 =?utf-8?B?Z3pRSGwwcWN3MnFRWXVPYmxkOE5TU0QrSzVzeVFjUWFUcEgvYmw3YWlDaXpC?=
 =?utf-8?B?K2ZSNy9EaS9LTTZjZ0VnVmV1OVEzSUluYmdweVFZOGllT3ZIUUZJMjBjaUxO?=
 =?utf-8?B?ZXR3T2JUSGFNaUpXQ0VaMlZqSTZZMTdjdlZOTklHeWtzMnRFTEpkU0xkeHRn?=
 =?utf-8?B?Q2xSMzA5NDdjbzJDbkVkV295M3FkMkl5dE5RQ0pWdWthSEpZeG1yOGtWVjY3?=
 =?utf-8?B?V25kNHZCS1NaUjc5dW1HZFpQYmNCUTJiTnp1QkJONklleFpBamhPWklOQ3ox?=
 =?utf-8?B?Qkd6b2hmRDVGeTBVWlhUNjJ3M0lUVlpHanprS1Qxcmo4VDB6Wm5SMEVQZHdr?=
 =?utf-8?B?SmRHNS9WTEpFZmRwOXVIeEdFMXNNc3hHTDc0cXltRkhMLzhJV2pTYnVTVHlQ?=
 =?utf-8?B?bDVVVUpTMlhrL2hvd3J5a3ZCbjV3Y0RKZ25XMXp4WWhUUkxJNFFGRHduSkRN?=
 =?utf-8?B?TXBLZFMyMkVSQ29vTDVTNVlTcEVjU1pEV2NPS3JmUEZKNWxqdU9QUU5FY2Fi?=
 =?utf-8?B?Nk9mRENUMEJvYk5aRTFQeDdnTDFnOEY1V3VHMEVvTkhLTHllN3BxNzlzS2U1?=
 =?utf-8?B?OWhqNkpxR1MyQmlPNi9pWHJWTlVJR3pBSVkwNWR6SkxCL0wyQ2kzekl5WDl0?=
 =?utf-8?B?MFIzbjhjMnlvZFh1R1RKTW9HcnVpYUdZa2JHK2dSdW1BSzFCTlBON1RleDZq?=
 =?utf-8?B?T1BvMjJCRDkxdWlDMW04bXRrQXcvaU5CQkxLQS9vQkMyMSs3eXVQdTkyVjM5?=
 =?utf-8?B?Tk5YOFJxWUd0emtrZXBGVi9PKzAwaytMQnR3dDFNUjdvU2t1aUN5cFhMZFpq?=
 =?utf-8?B?aXdxMG9jMzJEYVRGaFZrY0ZCSW5OU1ZSNFhtSmVvOFNNMnV6ZGtSKzZFQU1U?=
 =?utf-8?Q?2QoBZK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(19092799006)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnF6aWgwcXFjSlB5M25SOE9DcHF6K1BuZGdzR3pXbXFMTnA4SkpVNmZzUW5s?=
 =?utf-8?B?Q0FmSkR1c2NqdzQzaGFqbnE0S3pka0oxeThHcG00aU9qdzk1VTlXcHJVWWtC?=
 =?utf-8?B?dThwTVlyWFVKRS9zZUJzejlWMVZnUzZGVzNQS1pudmFpSSs0eHpwS04rbGdj?=
 =?utf-8?B?VFFGZk9IR04raUFaazBuKytQUmpTM2NOcEJsMUw1a3FIYWY5bW5pcEpDNnJp?=
 =?utf-8?B?dzZJY0RmRklYL0tLQ1dwMFg4cDliQlZxb25rUEo3b1lhNVVvTDVXOE1EUkxL?=
 =?utf-8?B?clVvOFdIVjYzcVI4alk4ODhnakh6cWZKd3BWWGthRU01ZG45Vzg0dUpFQVVO?=
 =?utf-8?B?RktZT000REQyK0dXRFhFaThPUG1MelpsVUNFelF5eDB1dC9NckV4SGtFMUJs?=
 =?utf-8?B?bkplcFJJMU1iUURMQ2dDUjFTa0twa2F5TExqcEdYYkVPWDErR1ZjUnRXTzVN?=
 =?utf-8?B?QU1rdzV1QjAvYnF1Qk1hY3cwcUlqN0oyc2xMQU41dElOenpNVWs5c0dtWk55?=
 =?utf-8?B?ZU1iSk1RMWc4VjBDYVFnSjRiUHRHR0Rhc1loeGZpUGJOaW1CZmVORTJIV0hl?=
 =?utf-8?B?MGU5bXVGZ1NjR1pLWmJLY1JjeUNuMXIvbGo0MUZIYmtHRFRBeW9OYVBUTWt1?=
 =?utf-8?B?M1g1dGEyRkZFbmdmbm5EQXNwV3BOTkh0alliZWcrQit5QzNFTzFRYzN4b3dT?=
 =?utf-8?B?US85L2QrWWNlSks2N2NJYVp5eDg5eHJtWHZYQ2dQMG41VXZwMWNMYURFME02?=
 =?utf-8?B?QVF4Q0hIZXNoUHcweDhTWXZaNFlZVW1zY0RyVGZ0UkR2blBqTHRtL0RZMDlO?=
 =?utf-8?B?d0NiS1FKNDdwc0VSaXMxVWZqcGxNY053UkZQWVgrZzFtL0RRZzZVWnQ3dkdj?=
 =?utf-8?B?SnIxeXJ1RnhhMnRvcHl0VHNKOHptY2pFZjFiRjZsbHRTY3lmSEE5TXkwVUZ6?=
 =?utf-8?B?N1Q0M3ZPSFFpTGQ2MUFxWG9XbHRxWStpYXBSOStBUTZ4TG1TUjgrMDVMUUhC?=
 =?utf-8?B?NEcwOVB5NlFrK0M2Wk1JWVBGVHdoa3F5NG1Uam1hSFV2REpVUEk0VGQ1aFNO?=
 =?utf-8?B?UmFaeFBzdFJmMTUrTld4cjROZFV3TjlzZmozZXVLdEtiMDFUMUV4cWk5WFJp?=
 =?utf-8?B?TTdiMnA3bmZKQmtxaHBvVTQvYWU2QlYwWlpDMGI4alQ3eUVMNW5yZms3VWlt?=
 =?utf-8?B?aU9qUmZtZWlxQ0hVdW9zaktFa21IREhZU1Ivd1VxR1hFdEhoNkN1YTQ2UXli?=
 =?utf-8?B?dHc0WkFQZ1o1SXFMdDVkazRILzRtWDdBdHlOT3pBWmh6UkQzVkk4eEVPcDdU?=
 =?utf-8?B?SUxMOWJTVFYyZ3VoYWNBSUc0WWdaUTZ5Q3p5Q0MwL091YkFCQ2tFNE5KZ01Q?=
 =?utf-8?B?RDRJeXNwYXZpam1DUjc4eUNSQS9UQzV2NzgzRWh4VmlEVTA4ZDdud2dxNjU5?=
 =?utf-8?B?ZUZZQ3dkNzFZQTFiRUUzWWtUbWsrUUFmc2dzWDF2L3lTNHc3RXUvSThsUzJ4?=
 =?utf-8?B?eXBla2QrZXI2NjFqNHBsYkkrTktUTFNpZDZ0ZXJ6Um5IdGk0MEVjS0NyQmxK?=
 =?utf-8?B?bGVZRE5tOFpLVVZvYnBkaWRXQ1EzQVVpWkZ3a3lxazFrZ09hWHVFQmU2YUVW?=
 =?utf-8?B?TW5wUmdYd1pxbmpCUlVTVXkvVEtKT2I3d215T0xtNkpSMW1YcTRTdFB3bXZW?=
 =?utf-8?B?bEdNalYxTG01T1dvNHFFUWt3MFNBNzVHUEFpL20wSFpCOE43RTVxcmRSbEtS?=
 =?utf-8?B?bUhPeGtBRTF5b1JVenl1SmRGb1NNVVZNNmFxZ3hMRGRVK21EcS9ndFlSYUJI?=
 =?utf-8?B?b3pRMUs5eTI0L3FVVzNpb2pHdFMzL0ttT01hMFFHYmVnODJZSEwzUnpRNEkw?=
 =?utf-8?B?YU1WMno3S0d3RkgvTEx2RU1PeExKNjBOUXc2NEJwTDVwanhja1d4YVJiQmR6?=
 =?utf-8?B?MEdBb250QUNNSDMzVGo3c0JqN2JxdzZQdnlLNDdKTStOdFFyWEJoTXZDeUlQ?=
 =?utf-8?B?dGVpZFRoMi9JOHNhMU52UmVWUE4wNXI4NVFyWTZTOUVkK2V0T0dQbW9Ia1lP?=
 =?utf-8?B?S3NNdEV6VGhvT0xQSnlaSDA3eWp0eHhyR3pkWjgxeDhXa1k3UjlRR1FMWUNv?=
 =?utf-8?B?UzFjc3RUNUZlcDh3VGtQNVVnK0ZUelBzY1RiZ3hUbHFaUmdqMk1mWW5sQ0FJ?=
 =?utf-8?B?eVE1TTlyeTJEaUl2WnFZaFlZaGhhYVBISUZLVGhSSzVZcktFUDA0NWl4ZS9l?=
 =?utf-8?B?MktHMWlFMTBIYVhTZ3VBaFAxV20wa1BoK3UvNHMvVWFDeTRUT2RZc252ajI2?=
 =?utf-8?B?dk1jQ016YmhxckRFSkdzTWwwQzQ4SmNQY0ZjbWpmQytDRitRd0NSdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 654f34b1-09cb-4cdb-457c-08de420257cb
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 09:04:56.7152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LwFMb4OaIGSu75AGlIppoZLnpOrtnfcNQa/iwbEXHNcQB9+s/zNRUko7avb5N54ElaPAx5M0DlObQu925mfAFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8912

imx94 has two xspi, add these device nodes.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 34 +++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 73184f03f8a3e134abc03dbd22ea24eff17be79b..96dd87800c8b500f2a885c1c1726e314b839fa8a 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -629,7 +629,7 @@ aips3: bus@42800000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			reg = <0 0x42800000 0 0x800000>;
 			ranges = <0x42800000 0x0 0x42800000 0x800000>,
-				 <0x28000000 0x0 0x28000000 0x1000000>;
+				 <0x24000000 0x0 0x24000000 0xc000000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 
@@ -785,6 +785,38 @@ mu17: mailbox@42b60000 {
 				#mbox-cells = <2>;
 				status = "disabled";
 			};
+
+			xspi1: spi@42b90000 {
+				compatible = "nxp,imx94-xspi";
+				reg = <0x42b90000 0x50000>, <0x28000000 0x08000000>;
+				reg-names = "base", "mmap";
+				interrupts = <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>,		// EENV0
+					     <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>,		// EENV1
+					     <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>,		// EENV2
+					     <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>,		// EENV3
+					     <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>;		// EENV4
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX94_CLK_XSPI1>;
+				clock-names = "per";
+				status = "disabled";
+			};
+
+			xspi2: spi@42be0000 {
+				compatible = "nxp,imx94-xspi";
+				reg = <0x42be0000 0x50000>, <0x24000000 0x04000000>;
+				reg-names = "base", "mmap";
+				interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,		// EENV0
+					     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,		// EENV1
+					     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,		// EENV2
+					     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,		// EENV3
+					     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>;		// EENV4
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&scmi_clk IMX94_CLK_XSPI2>;
+				clock-names = "per";
+				status = "disabled";
+			};
 		};
 
 		gpio2: gpio@43810000 {

-- 
2.34.1

