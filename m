Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA101AE01F
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 19:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734636461; cv=fail; b=Z4cId8TMOwAHT3s8BkFfUR3uBtIMh5hICtwMFZZ0HTmeDbRqGVUB1HxgJrSp7dr5ssC/KKtGOgz6kpfKX3VmujWbnUYi7KpbBbovgwYJkfYrD/v37Sm+2Gz09AxX9ah/1k0Bco034rgsUTChNr1+ohvdbrjJpZ9ZQLEllnzmZKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734636461; c=relaxed/simple;
	bh=MWdBEdGwe4GmFkdBKa0IkZlTCa/YU9B9cEB1vf7Sepo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XIq8RjQcoRC3vTcnp5eVv3nGCbcz1P/qoBTDTSeCTdE1nD/lWI/T66TC0TmpQN+2+fODmF+ir9hywW6HVHahgLpC+fT2o7gGsv0vK0XKcyMGV/k9pNJmiv03DhPR/5Jf7C1pwW1sieMk7pwiB0Qz58xJ1Ebh0saLZNqXLliL47w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QbGkbd+l; arc=fail smtp.client-ip=40.107.21.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QbGkbd+l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLmdDs9uf82pPjIli+tgQ4rD5vCSuq8lhkNAGTQuTeJlOlqqAAMSB70PsYkl+IpuaKvlQycEAdmZdfqfy4BVnDFthJ5/rKAsgkiv6fBb6V1JDHRg3VAnDZS6W2lOZcwLd1O9aFYql9UWpupLrBQ78v8VJKAH7uSTk21N1DJmMd+AmEWYLKkxRLLDCjuxKm1WHSBj9NGUxpcORl3KGb+1CQRQQqYL3SYfFUP1Uc8J3VAd88ftAh3/kl5Epodu4WjSub1We9GqWf9/tPxSHeeFrEzi74LUuDBb1NdzbPttE/CDBuCDw/6OnSmRD2NsaUebHaUFPdaH8ofVqXLD08BZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBw5kp9SSBwQvZpMGmAbVD+2jgyl0mQ5vHpGEW5CPmE=;
 b=rHwtJV/UYIPnXrkoBMAt5Rvheg1fOSM85gKJSt4Xo9K072L2ParQnSTmQRZs003IHxYxNqyGtWxTypu7LU7MgvvP2E+t59wEsx5LnnxYyWiHwIWj4iCFGtdJX9hCQBwymWGKEhLRxL3DJA/8sWEGQlTpUxzZZnSotXwt6mvvvMqOMYV2I+Pd8k555zmhJ1k6Ag3e0oBkbSYMkh3kZJXcAX54rumpPcbfi9iXKS6OMQjSFMC1Bnmnp+VA7PqVCFSkCIrlOxyKkj0qPJJD2NOMrw1295xS6hzEYAfWzBTbelL3qLHCJw3YB5xdXD5GwMgbtJ4rikiXbDHLbOK6KKgc8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBw5kp9SSBwQvZpMGmAbVD+2jgyl0mQ5vHpGEW5CPmE=;
 b=QbGkbd+l62j+ZjwGuLRMUsSe3fKqgTxvk/U+Fts8WEpKyfQUZvRiuKzswM2S/HFhxVTIq5Di1uh2/oYycNMoeQ1Pamjieb4iakXxf7+xZ9+WyTWXFxXAcx2BE9o1MrIw7/9Wfi311y5PECm/pNWq+DEZ4H7NGoCNChoqQSTZEoIfKKvKt5AoQGWVCHo1+3VVQnvJU1x2FWQpBm/o2wGAyOUWHSGdBfbNUzRJ2VwT5Xv5ZoE4NzOe8ucL5DRihCMnVv+dmQ/3tJrATXiXWKMFRd96hNSooh1K/TE2c7up/DgbwfnRLgrcyJkQBRbr6DKLNCy1sMLTe0SbC24CUX7BoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9453.eurprd04.prod.outlook.com (2603:10a6:20b:4da::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 19:27:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 19:27:36 +0000
Date: Thu, 19 Dec 2024 14:27:28 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/10] arm64: dts: imx8mp-skov: use I2C5 for DDC
Message-ID: <Z2RzoITPUmZFoX09@lizhi-Precision-Tower-5810>
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-3-38bf80dc22df@pengutronix.de>
 <Z2RZG7pAElG3TGLx@lizhi-Precision-Tower-5810>
 <a30baba6-6252-4c69-b6a7-e4099e823920@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a30baba6-6252-4c69-b6a7-e4099e823920@pengutronix.de>
X-ClientProxiedBy: SJ0PR13CA0228.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9453:EE_
X-MS-Office365-Filtering-Correlation-Id: 2adda695-47a6-4485-8720-08dd20633196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDNzaFpZb293bFFsa3Y3amY4OEdXUHE3SVhVdEJiSnIrWFBwTFQ1RXUyU2U2?=
 =?utf-8?B?NTB5bnRZa0dmWm1CNmR6R3cxTjBIdEt3RVRuMGFheHdMbE5mMkdqN2FLWXdl?=
 =?utf-8?B?QXgvY0VvOVRiWlU5ekNmNGRzZk9NbUJhK09na09iVWpVK20vQ29KRTB0TkZ5?=
 =?utf-8?B?U3Y5dyt6R3d5d09lTHU4NDJOVERQSlJZazZWckwzbXhWa0RrWFFXdHZtUC9C?=
 =?utf-8?B?Q29hUmdDeE5QaExYL0trenZ6bFg4L0ZVSUVCbnBPYS9JK25OU1NlZm9wZ3pR?=
 =?utf-8?B?Z3RRUXNzdGJJTW53bkpXWldSb0xiK2t2QWJoR1Z1L1BIM01NeTI4cXFHZFRD?=
 =?utf-8?B?QjNIS0VzcXowM3VFaHNCNVpUS21mdU5xQlBXLytmSUdlU2Q2T3NuanUveTNp?=
 =?utf-8?B?a2ptWWlGcTl3ZmpRS2VIOUgzMG1zUU1pcDcybWNnU055a1JiSnFRa1ltQ3U0?=
 =?utf-8?B?b2FHcFErVTBpV0RQZERVdGJOYTE1OFNVQmpiYXZsc2tGNzlyY0tTL3MxczlS?=
 =?utf-8?B?NFhwTWxXVStWVXF4bWR0b21wU0hFTVM5Z21wSTU4M3VIRkdzaCtJK1ZtRXV6?=
 =?utf-8?B?Z2VXQjN0WE1nU01zbzJaRjd1Z0cvWUJFdnhsVHJUMFRRZVlKZGxZTUVMQU0v?=
 =?utf-8?B?em1LbFJyZzdnOUcrT2hSdG5MVlFVSEdxMVFYRjNMcnNGUzJJUTNBK2h5QTY5?=
 =?utf-8?B?WDZCVXNSRXcwZE90bVRNQnprTVhCUkZFTkRSNTkzSEZwWldQaDgvMndNTnhX?=
 =?utf-8?B?Szl5LzlaK081N3V6ZkdOYUlNVlc0VllTU3NqNGdkcU5wOHdQTW1TVW9HRUZF?=
 =?utf-8?B?MVd4eXJGQy9od1lZSVB6QkZSdllsM3Nkd0F6dkVNbzliZWUzQzVSTkFtWFli?=
 =?utf-8?B?YWthQkgrYWtWZjBUOGg5LzFTWGNpTmNMV09vSTRpaWZMUHg4bTc5b2xWWmxm?=
 =?utf-8?B?UlFLVUpjdjMyNjc4b1pJdmVDb29sWHA2QVhITW5GNkRmOFNOTVdYV2E5ZVR1?=
 =?utf-8?B?OC81ZWw4TklkMGg5cit3Z1FIajVObytqTlcwRUdBdVQ5UmhMTmtLUnFyU2FJ?=
 =?utf-8?B?SEdKYkRvYTdkWVVubnpDYkIxZHdhWGxWRjMycTRLNzJHcS9OMXpackUrS3Zr?=
 =?utf-8?B?RWVZTGJkWm4rV0F1VmRyM1AyQ1dhUUt1azVPMFRkR1ZUUUxtWTdCSDlPVkZM?=
 =?utf-8?B?M1lNSmgweERFUCtTY3I4Q2NLZC9PK3plUHVBQ1hCMDBIQlY0bXpVR1lyS3dY?=
 =?utf-8?B?MUljdWFaN1o1dU8wb1lrMUxpNCszSTRtYnpoTjVHRXRNL0lZYlFWdXNMSkcz?=
 =?utf-8?B?bXRBZDcza2orTW1VZHZybXJhbEYvbjRJMXJ4K3VSWjFqeXFSaWFsY3h6elJH?=
 =?utf-8?B?T2NCamhMeUhXaUI2QmJXaGR4VmdCdnhhQlJRaUgvL1BzQlNNdStOSytFcUlZ?=
 =?utf-8?B?cTBKcnJmdzc1cjlob2NCbTBudWVzLy84eXRlUTFKMHN3OEhIQi9yU2pYN2U2?=
 =?utf-8?B?dHdKVGh6U2V3V3YrRzRtWHJBVklTdmJId1JOV3QzZ0NKVVdxQnpFU2pNQ1Na?=
 =?utf-8?B?ekFkU1J4bURBTWV4Ni9kbjNxajZEQTFLWG9ROUcweVJyOGxPOVhJUlJkYjdt?=
 =?utf-8?B?TUpIYklWOWFkN09aaDRHR0xTNkNEOUZOMEZpbUdJT2p5L1MxYmUxMzExdW1J?=
 =?utf-8?B?YXdZbzRrbE5PTnE0QzN1STQ5UUxhNFluc0o4QThaaEdNMGh6Z2Mra3pGRG5G?=
 =?utf-8?B?alNteTRUazR0QnNWanNLbjFiRjdnL1Z1dnc2dHJ1c2tkQ2xCZk5FelVZWDlt?=
 =?utf-8?B?L2dRS0VKVE1yYUwvM281MVhmbnlUaS8wTVdJbXZoSGl3cWlmMXpkcFJxRUhN?=
 =?utf-8?Q?t5Bc2KW3nmg5W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(52116014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M29sK3VDTUk2NmJtWk9iWVNYajM1R1lTQk5weXVlVlVYc1JXYjMrZWNjTW8w?=
 =?utf-8?B?R1dWc1lObjIzeVVoaVVwclg1ZXJXYys3RmU5Ti9UNlpHS1NSSW5XanZQaXc4?=
 =?utf-8?B?OGZDV1V4aG9ETVh5aksxUGl1Z3RCUi9PMWNUREtDNEFUd3Ezbnh1RjdwWkxU?=
 =?utf-8?B?YzNxVGwrQmhiLzBJVW9Od0Z4MEtaZmczekRsa1crdFc2cC9ZSTIxL2FIbVRD?=
 =?utf-8?B?L2ZPSG42ZTBORW5DVmdKWStJTTBubm0wbWxzb1JJRER4L3RnT3Z5RU5MdDJN?=
 =?utf-8?B?TnYwUlg2cmdUU3RFbjFzRGpUKzVVNWU4blJwd081d2JCcVdyN2lhN3FwV2J2?=
 =?utf-8?B?WThmQXc0L3FIcDR5RGp0dkkxR3Vqb3ViRythRklKZ0c3VFhuZ0NnbWJVcjlP?=
 =?utf-8?B?Z0dDSXBHem1OSjJweTQ2VGhYVCtud0RyZGJhaXFaYmMxTUVReG5MR3M1VzV1?=
 =?utf-8?B?SW14cmNmZURobEFLS1RKSytSc1U0R3RTc2x3UWRuZkt3dFhrMnltWjNWejlq?=
 =?utf-8?B?Q3dIQ0NKTnBDZ2ZTNWtVaGZ5eUtGUlFsb2FBVU90enFxOTVvWUFlNEN1a3FG?=
 =?utf-8?B?bldyVU1JcWh3aVBNdnppTEJTNkx2WTZZMGx1eFJsY1MxUjNLQ3M4Mktyd0N6?=
 =?utf-8?B?R0MxWHY3RnE5b294M05Gd2JLeFpaTVlsOTVZNXJFZ1NqdDBGdkY2VzEzQnBu?=
 =?utf-8?B?OEFwcTJ0SmFLZmhmMHJiMHhOMlpOUVhlZGtkcGV0VDh6dFRLcElsekdBTnZE?=
 =?utf-8?B?RlV4RUJkUG1HTTdVZ1NSZ3FpNEtsUGVxRjJJbms3dVRJYXJ0MkxCd1g1dFE4?=
 =?utf-8?B?V2hycGJNYzI4L3A1U21SUzZpaWdybFphbUJwZ0hPRm1DY1hkd0s4NDJIS1Uv?=
 =?utf-8?B?U3RqZC8vT1ErUFpYUHJnV01uYXVPcXJZMmREaE9VaWw2SzQvdWh4b3RTT1Ez?=
 =?utf-8?B?a0RUOHowR1FRME1yY0F3ajloRFhaMk4vVUIwVFRIdUpQcDVnSnlqTHZuUGdi?=
 =?utf-8?B?aGRTYUZHVThUdjNKU09SRVBoeXVpQW41OFZ2U01pZEw3MXlIcUwwdWlqUkR0?=
 =?utf-8?B?Tnk2U255d1RSK3ZxYmFSZ1E0QVZTL3Y1WTg5Z3RKWXVEcFk4RExOaUpPWU9y?=
 =?utf-8?B?Mkt6NlVqM09XMGVGVkhXRjNuem94bXVRUnZmV0hxUkprR1YzSnozOENvRDla?=
 =?utf-8?B?Z2F3TjErejBoQi9aQkVuWDAwUytVcCswdDVMMDZNS0pqcGZsR2o4cldkSDMr?=
 =?utf-8?B?c1VzclB0Vm9VZW4rR1VxM0F6a0wyY0tkYUI0cy9RTGhPNmZEaTVqaVFmRFRv?=
 =?utf-8?B?V2Y0SlNJbVgwc1hLQW9qcmUxWVBXUWhMbS9NS05nN0RGWVN5NUpoYnhVdjJo?=
 =?utf-8?B?enBwYVlZQ3hkK0xWc1dra3BMalBQNWRwL3U5VGtBTkFKYzNDUmRQbytkNVMv?=
 =?utf-8?B?Rk5OTzdkOFEzdCtvN1BsbzJpSStsZVArdFRaTEVRUlRJcWZwU3RDbTJrZGJO?=
 =?utf-8?B?TlZUUUp3NW5YYjNqRFJHbVZBVXJkZ2VRMDg3R0pFUndHRmI0U1lERC9YaTRj?=
 =?utf-8?B?RzF6aUMxZHVPOFR6aW5XN3ZlcXJ6QnFUTjMyRUcrYzFtQWFBbFhzY1lETGJI?=
 =?utf-8?B?QS94VUc1aUdaSTV2ODJGaVRKeFkvVk45bFlvK2IvaWpWWmd0dm9rL0JrbTEv?=
 =?utf-8?B?VEdaZzFoMmFLMjJ5VzFPNWozbzJobEZPY3BIS0pNdVhxMDVuOHJua2JXaG5F?=
 =?utf-8?B?Z3hVeFBkKzlScnkrcFlMbnF2Q0VtdnBkK0pCRXBrRmoxZkdsSHN4Y2VLamJw?=
 =?utf-8?B?N0FmOXdaR3RXN2todi9BY3BZenI3VnNOODVMV3RtSm9UREdFT1cxNTVxTW9G?=
 =?utf-8?B?NDVIYXljWTUyd3llR3JLZEU2V0JYenZ0bHc2cjRKWVR6SVdlVUNrZ2t4eE40?=
 =?utf-8?B?MUVPM3M5ZHRZVVBwbS9zT3VuR0RWbUswcG5kWmlyK0s5Rloza0w4K1M4ODky?=
 =?utf-8?B?ZnV4RGJTMFFsVzhTRGdpL1NDZ0VpTDdrSTdtNklpeDNiUGovdVZuNmhrSEFM?=
 =?utf-8?B?aytjU1RqSGxBVHZJNjJvQkNSMlZSejcwRmd5KzhpS1RiMWdHRUptZEJyRG81?=
 =?utf-8?Q?pHTSz8W/JRlWnYaQ1BSkEwmJN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2adda695-47a6-4485-8720-08dd20633196
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 19:27:36.4819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cjid+8wMkygXiR/vmTNzyiNOq1VGVcoGLmwsc3Pgb4sysxDb09jCszkFA/jiSgJhfSDSUFXWnwiyLyF9VNGs5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9453

On Thu, Dec 19, 2024 at 06:43:56PM +0100, Ahmad Fatoum wrote:
> Hello Frank,
>
> On 19.12.24 18:34, Frank Li wrote:
> > On Thu, Dec 19, 2024 at 08:25:27AM +0100, Ahmad Fatoum wrote:
> >> The HDMI DDC pads can be muxed either to an i.MX I2C controller or
> >> to a limited I2C controller within the Designware HDMI bridge.
> >>
> >> So far we muxed the pads to the HDMI bridge, but the i.MX I2C controller
> >> is the better choice:
> >
> > Switch to the i.MX I2C controller because
> >
> >>
> >>   - We use DDC/CI commands for display brightness configuration, but the
> >>     Linux driver refuses[1] transfers to/from address 0x37, because the
> >>     controller doesn't support multi-byte requests.
> >
> >       Designware HDMI Limited I2C controller doesn't support multi-byte
> > requests and display brightness configuration by DDC/CI command need it.
> >
> >>
> >>   - The driver doesn't support I2C bus recovery, but we need that,
> >>     because some HDMI panels used with the board can be flaky.
> >
> >       Designware HDMI Limited I2C controller doesn't support I2C bus
> > recovery.
> >
> >>
> >> As the i.MX I2C controller doesn't have either of these limitations,
> >> let's make use of it instead.
> >
> > Reduntant. can be removed.
>
> Sorry, I am very much open to review feedback, but I fail to see how
> your subjective take improves things.

Ref https://docs.kernel.org/process/submitting-patches.html

"Describe your changes in imperative mood, e.g. “make xyzzy do frotz”
instead of “[This patch] makes xyzzy do frotz” or “[I] changed xyzzy to do
frotz”, as if you are giving orders to the codebase to change its behaviour."

Avoid use "we(same as "I" in above example) ..."

Frank

>
> Thanks,
> Ahmad
>
>
>
>
> >
> > Frank
> >>
> >> [1]: https://lore.kernel.org/all/20190722181945.244395-1-mka@chromium.org/
> >>
> >> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> >> ---
> >>  .../boot/dts/freescale/imx8mp-skov-revb-hdmi.dts   | 26 ++++++++++++++++++++--
> >>  1 file changed, 24 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
> >> index c1ca69da3cb8..206116be8166 100644
> >> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
> >> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
> >> @@ -9,12 +9,34 @@ / {
> >>  	compatible = "skov,imx8mp-skov-revb-hdmi", "fsl,imx8mp";
> >>  };
> >>
> >> +&i2c5 {
> >> +	pinctrl-names = "default", "gpio";
> >> +	pinctrl-0 = <&pinctrl_i2c5>;
> >> +	pinctrl-1 = <&pinctrl_i2c5_gpio>;
> >> +	scl-gpios = <&gpio3 26 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> >> +	sda-gpios = <&gpio3 27 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> >> +	clock-frequency = <100000>;
> >> +	status = "okay";
> >> +};
> >> +
> >>  &iomuxc {
> >>  	pinctrl_hdmi: hdmigrp {
> >>  		fsl,pins = <
> >> -			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL		0x1c3
> >> -			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA		0x1c3
> >>  			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD			0x19
> >>  		>;
> >>  	};
> >> +
> >> +	pinctrl_i2c5: i2c5grp {
> >> +		fsl,pins = <
> >> +			MX8MP_IOMUXC_HDMI_DDC_SCL__I2C5_SCL			0x400001c2
> >> +			MX8MP_IOMUXC_HDMI_DDC_SDA__I2C5_SDA			0x400001c2
> >> +		>;
> >> +	};
> >> +
> >> +	pinctrl_i2c5_gpio: i2c5gpiogrp {
> >> +		fsl,pins = <
> >> +			MX8MP_IOMUXC_HDMI_DDC_SCL__GPIO3_IO26			0x400001c2
> >> +			MX8MP_IOMUXC_HDMI_DDC_SDA__GPIO3_IO27			0x400001c2
> >> +		>;
> >> +	};
> >>  };
> >>
> >> --
> >> 2.39.5
> >>
> >
>
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
