Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2049.outbound.protection.outlook.com [40.107.247.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3EB2153EE
	for <imx@lists.linux.dev>; Fri, 20 Dec 2024 12:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698373; cv=fail; b=BtqCqFAczprNR50oh9/wK8lf+3QazCNJ+62JKdrsAMkLyvGQpfPeTXm0HUAcrRkbfUW2s19w0rXFjNinguKmCzimRPcpQb/NvV+slVR0QoHtya3T6Te29ZQyKMCKpBbFxKbZCa5ZIt5o5ajYLuTDhUxD8+AkNHAVXTa6IuXxpvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698373; c=relaxed/simple;
	bh=V6Z4ZVwvqpMn16SzKuQYkVBLoy8s3e08eftEKp1LnJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FOHst4R7DRe03vGh3o5dirj9dham2UWKdEEMo/2bKO2fmHfc8H2NZT6rDQ0wdxy4i/3lVEMk1h95M0S7++wTguVHgHldhCcI+UK54sihLg/8Tgkjmz+Ewgtco3+SEwKIkwBn7nV+8Gn+nR4SZWRWskxEzm9NblX1WoratJTp/Q0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vrroVWVu; arc=fail smtp.client-ip=40.107.247.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vrroVWVu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MiaPUX3K+p0PAZ+xvyqpH/VYoyJiab2TurgoYd+GM/9utMlYvmqEW7ysK0imdpGimrBKcmaG7l+46xZVOIfheEkKeb1WFTeOtMyfjqM0rudM2WcPLf9sZeKiRLzyuedYggMXoBoVbdk+qEXJPIrGHFxQD9JA0dINZn+RajV97sdwPLaFNel8C0nIO1C36HpoZwU0/4JG8r14mdRuPUbIihxFYeqTozTo45XV1R5qdAF/saoeLaZdvSBZJGt8D8dt56JPE4hpD2oJNTHqOF91g9VYoHsQjrzSuQLf7gam+uhFPEuaKjZicBcbv6qacse4JvOQEwhU4JdzfTcq5Zdvqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpJH0m5r5QjlS1rUHDKPt57GkZmO1r8jol7GkA50rNM=;
 b=IZb46E0Glh50LUWKF80gxvkh7zv/iRCSRJt/LeeRvQ8TJez6d9cdYLeHr5tNHv6cQHs9W5y3kEFL16OZSIJjnXThG43wCyi506MLO6GasMWH9OWFBKYmng0KaQ0cJEpC7hJKhrygVOof1c75IxeWBHb5TgfFFjocuJuVLEcjFFibrxovf6Rx+/8lcADRMS3Z/wQsPMx3zfCPpx33EFkMJpDGY8HBNZ1JyhJlfJ8V0l09wwpDntvh521wKtBhuGwxU5tX71BWMX6LIIJjJ/3XYHmDW7waaVEDjrQRArTGl3DwGC3fNmobVmD1DPK5vxeWQ1/gLrCfTUyKbjnw0kgOKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpJH0m5r5QjlS1rUHDKPt57GkZmO1r8jol7GkA50rNM=;
 b=vrroVWVusOdrS3kDuC5B5ExXw9naAUCyD2/6gMdryTIXjopO3mVFUBlohe5varktIr2yzLF1tTY/OKMVCBNTafeExzbJkzC1OFJvdpN3ZFXCgxUs17EASlTXTNHjo+HcmVklojSDP7LQs1zmXbrymi65gdjCzsgq01Fdc905qwXvgiot+Q2Jbfv9Xqs11kBnVEVA4ZbZcY0XYF3IJG2awKAlJ2WjS/mKJnUCDuK4jCeDcDNNsFSsq//20sNpG48EzRq18McoycMIktf8ya04dIjCcsiCqFWVlerMENvG2w2G83/0y0oCwCOcljMr2FNrkI04ujB0ce6Qy018qhPgYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by GV1PR04MB9516.eurprd04.prod.outlook.com (2603:10a6:150:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 12:39:26 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 12:39:26 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v4 2/4] arm64: dts: s32g: add common 'S32G-EVB' and 'S32G-RDB' board support
Date: Fri, 20 Dec 2024 14:39:14 +0200
Message-ID: <20241220123916.1452582-3-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241220123916.1452582-1-ciprianmarian.costea@oss.nxp.com>
References: <20241220123916.1452582-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0007.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::20) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|GV1PR04MB9516:EE_
X-MS-Office365-Filtering-Correlation-Id: efe9b32e-e19e-42ce-92c9-08dd20f356f3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TW5nKzRGWXUvUlFwSzZpOHVBb2NUS1N3QXk2QVJTcUFHQlJKckZ3YzJvalRa?=
 =?utf-8?B?RDVITWRaNVhlRzFzNjc4cXVpU0VqSVlvcm11MGxrYzFwVUxRNUV6OGpIMFgw?=
 =?utf-8?B?cTdnZXorMXZiY0hpRU96UVBzQTZNbHZkWDcxOXNSb2dxUjZ6Ty9zb0orbWp1?=
 =?utf-8?B?NVgvcVl5Ym9zRHdiVDdBUFZZT09LejBrZ04vaXIwT1R4NG1tdXg3UG93YkU0?=
 =?utf-8?B?eStlbTZ4NTVjeVV6V0JDZk83MHBsNFJXeDdKaUhKN1Z5NUgrMjl2Y0tGSDdt?=
 =?utf-8?B?RFB6bU5nNzhzWEtZS2lRV0dYYjRENjRjdEhIYUd4dFFJajNjdllBQ3pkcy9F?=
 =?utf-8?B?WElnOXpsNkNFTjc4Vmg5VnUvTmdtZFMrcTQ2OVhWVFU3Y2JkcjZFck0zL2U2?=
 =?utf-8?B?bTZzS3g1UG9VbjRPZnFhSWRWWlp2V0RPRXJ5OU9xUVpiMXV4ckVCZkc3T2pp?=
 =?utf-8?B?K1RsbEFYdEQwQ2RseVVWZ0xaYzg0WGtmTUg1RW5lci9JYUdTU0xNTUw1UXAx?=
 =?utf-8?B?SUtCRitNTWw5MHpLOWpmWktDL3dOWEUrOUlXVFdHLzhuTGdJK2h1SXN4TjZr?=
 =?utf-8?B?SFdCN2tjc1I0Y3hCYWcwTm13Nyttb0V3RWV4S0xjVzgydlVuZFM3dkpVMGtI?=
 =?utf-8?B?dDNrSUVyMUdPMm4zdzBZSWxCNEtGN0daZGpYb3d5REUyNTlPd0VWZnFQMDdy?=
 =?utf-8?B?MXNLZ3VlQm5abVNyUWVlOFFvem1tbWJ1V3pJWWM2NlJ6Q3JGVEEvY011QjVq?=
 =?utf-8?B?UE50Zkl0eld4dUJ1YmRtYlNKVlE5QUowaFVkOG1kU0ZpMVFONGNmTXRSanBD?=
 =?utf-8?B?aVFsVnFiYUFZaE13UjRTREJsYXN2dEVhSmNkUFQzRlMxVXBTMGxGNjhNMHhi?=
 =?utf-8?B?VUtoVzc1OFU0MmRDWjFMNVRkaUcwdHR0SFFCTXdkSTBVZnNjSWlWTTQyTjZn?=
 =?utf-8?B?eGdGdlBSM2d6b2phU3ZLWFRTaU8xY05NaUV5QU40eU1rdnp6NHlpOHZ4UXhV?=
 =?utf-8?B?YjgvUU40b0xXUmlPRDM5ZUtPVkkrVktWR2h4NTZrcXZwcEJsak0xdUJXOUQ5?=
 =?utf-8?B?cW15NlRDV3pxdXVoRkhJTFpnejExVUpKSFJJNG5oZXNYV2xhZ2d3K3FUcHZY?=
 =?utf-8?B?NXY3V2IrR0hZNVloNkQwTlM1WVA4aTVFRVZjNDliRHlrYzRUaEZtSS9YZWJ6?=
 =?utf-8?B?dzlKRndSOTAzTXlzUnhRaGVDdlBVbWkxb0RHNldtMWFybVlSbnE1UGZwekVM?=
 =?utf-8?B?MmpRcmh0cThOYVVuR21lb1VKN3FBZlNQTjhqT2ZJdW1zNVRmNTBSTmJOQ0Fm?=
 =?utf-8?B?c09aU0laZ1VzcGxmcVJIMnQyYzIxRVFiNCtkVHJWRy9adW1vbm11bFU1WGJ6?=
 =?utf-8?B?dVc0SVdpeXY2OVAvQVVDMUdlekxJUzNsZ3NYT3lYeHRhWjQ4ckltN05LMTdH?=
 =?utf-8?B?T1ZvUTRMcFNWNndkWW9OWDBsRjQ5emVLK2MrTnJWbXRXWmEvK2hGajZ2U25w?=
 =?utf-8?B?TVAyQ3BDNzFRSXhlZDYyZTBBWldXWmdORWxBOWdJYU53djd2Z3dSY1J3bjVM?=
 =?utf-8?B?azVQUkw5UTVjNTkvUEJUV1FEenR1Um9kYitjdlU3L0NxekNFdnZqeUlsVENK?=
 =?utf-8?B?aklHYndjb3BOdjVXdzFjNXV4SUxjQzFtcjJGYUx4SE05SWVGUDU4NzJJNzF4?=
 =?utf-8?B?Z1R4L3FnMTl3MkNJbzlncVd4UTBhaHJqb2RHZzhZWlZQVkhsZFZXWWV1Sit5?=
 =?utf-8?B?RHJQczdtd3BBNDVnelpkblFyQUhzZFZ6anRlU3R5YlFlTUFGNllqbUVuR2Y2?=
 =?utf-8?B?UUtUdW04Tlhob2lVRUQzSWM1REtVRW1ET09rRys2aHo2Ri94NnVzT1Ixa1JS?=
 =?utf-8?Q?xklHU6WYp7N2M?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWRodW9OOE8rZDZRV1hWL1IvbnVVdmtVdHZZSVpXWVptcTBnbEtXOXVaMDBj?=
 =?utf-8?B?V1BlbG9kMGhYVTZPNzVrVEpKSHM5SDUrT2JKanFmUTlCVnFVcUVDOXFjajEy?=
 =?utf-8?B?b2NyUDBJRjVHdEF6MlFRRDF0UWR1cjVnWGF3ODRmQmt3VXFjZ2lFQ3FBSCsz?=
 =?utf-8?B?OGFxL0VCN1QxREc2S25ESTU5NVR6Nm5GZmE4WXJ4R05uK0FZc3BocWU3WHhy?=
 =?utf-8?B?OGx3alFMQ2t0NnVoL1Qvdm5SL0M1RTFZei9xcFl0aEZvRVhQQ2VIOEc2MTFE?=
 =?utf-8?B?VTY2dGpwZ0pqM3liVUlneFR5WmI5ZTY4NzNyZFdaSXdpVXR5SVVENk8xV28z?=
 =?utf-8?B?dUcwWUFtcVRyQytaNmcyN0g1d2FYTjNmL0NKWXJ6TDRBQjF1TmxjT2hObXNq?=
 =?utf-8?B?bXpMWHFCaUZIYXZLMldjYy85THJXdVlPTVJpUGRUbzVKR0N1RG9XTXMxYjJW?=
 =?utf-8?B?bC9tbDM2WFk4UThWNEkxUFdPZXkxZmJsMUJVRVdUVkNMOUNNR2pKZHdPQ1RF?=
 =?utf-8?B?QllucVJ1aGY3TC9UR2pqY3ltRUpiNGtOZkZHUmwycDZVQ1dKakNMSEs0c3du?=
 =?utf-8?B?YzRnL0pncGl4dVBndEVQeEdSTmUxTDJBSy80M095L3BuRmpQNkJrZERQdEk5?=
 =?utf-8?B?QWhVY3l4YlBqSnVhSWtTTEkrZ2xaYkQ4K2xxZnpOWG9XRFNNdEVGa0YxVFdZ?=
 =?utf-8?B?TWpOY2lOUjNoU2xXSDRpaEk4UFdFcnhmMk1rUHRiV1Q2SmNxVVBYTFlncDIr?=
 =?utf-8?B?bkNUL3JPd2lhL1A1R0xQb3ExWlhGRHkwN3kyZWR5aVpPUmdFWk1XbDVDUFhC?=
 =?utf-8?B?Um5YVFlPRHg1V01BZ2NvR3QvaVVzUE1sb0phL3dnZHp2eUpFRVVnSFZacGQw?=
 =?utf-8?B?L0laeWZCNGcwRWJKU3RsS2ZQb1p3NS9iT0lURFN0cURkSTZFQ0twMDU3djJq?=
 =?utf-8?B?ZFpZOWg1bFVZcS9sdlg0RWhFbU42MXdSYUxVSmhSUHR3eEl2NnJ2RldhS1ov?=
 =?utf-8?B?bnIyZVdTODRBM1JhRTlBNTIyTkpMUGgwbmViczlQTjArUFl2d094Zmt4UkJw?=
 =?utf-8?B?aEw0cGFsRCtuRWJ4TDUyK2xnWFhNTzNodDFDL3BNaUoxRlJ3Lytmd09wdjBG?=
 =?utf-8?B?V2NGZG9hRjBBa0wyY3IrTlJja2IrVnpOdVJiUHoxUEg5ZW5TTWRhQkJLZEk5?=
 =?utf-8?B?dG04Q1ZBTHpZL3oyMExWT2MzU0tHdEZ6QWVoenB2VUhCNEpKRlhHQS9CN0tp?=
 =?utf-8?B?Nlgrd1hjQXhFVXIzVVFyazdBajN2UUtxL21sVSs1cEtjbHdCSE1jbjhsdUg1?=
 =?utf-8?B?UkhlaVJ0Tm1Sc052ZDIxd1F1S0ZpeHN4LzBVZ0ROQ1RaVEVveWwxcjdBb1lN?=
 =?utf-8?B?YzRJbGkyZG5aQy9iSjFqTWZmTmd6bk9YakcrU1hwUU9yTG9xRlJPcHdXM0tr?=
 =?utf-8?B?QWhuMU1FMVVGTTArY1l5WDlTSXVvQ21iMHdLWGJPTUNvaWtpQ2dWMEN0UEtj?=
 =?utf-8?B?K0gxbWxJOUpKQmVvbFR1S0oyODhYNm9zWWJsbVYwcWRQQWprOERmZUZ6dGFp?=
 =?utf-8?B?ZVVEUHZ3VmtlZHYxdFJ3UCtKMFVwbjZya24yeWNIZGJIK283aVBmc2xmWGQ4?=
 =?utf-8?B?cU45OTlUWlFsTGRQZDB5SE9jM2ltOEpoWDVGS05kQ3ZRdkJzaUJrSUIwaldW?=
 =?utf-8?B?a1RsZ05JY1dldVVTNWZudE5DVmNoeDRIRlNBb0E4b3ZXbm10SVBVUnZDUWdW?=
 =?utf-8?B?c0N0WVJQZzluZmM4S2xacXBKSVZmUHFUSStpU0F3Y3JxNHpwNVptaTMyM2to?=
 =?utf-8?B?Snc1ZU1IUTZNKzlqUE54Q2ZzdWxmaEpzTlByMzJ3U2tYand4ajFadGw4eUVu?=
 =?utf-8?B?TWxIK0dDUEFxYTB1azd5dzRlaHU2Znc1K3cyeWZHQU5aRXF2cUpkaVZJWUcz?=
 =?utf-8?B?ZUkwNzhxM3dyK05yOWFoTDkwUzdxeU95LzZhZnM1UyszblFhQ2VQaFAyMFRI?=
 =?utf-8?B?VENSMVZzVjZHcThKTWEwNnRNdm1zQ0NWQWZnV245dWExWDNrL0ZubWtzLysv?=
 =?utf-8?B?VGZlUVNlTGFVektlbmFVanN0eG1ENjNZMWpOUUdacDBlMFF0L3FHSGlHZzF2?=
 =?utf-8?B?Z2kxYlJPckF0UVVTWUFnOVRuTzh6cEUxZnpKM0tRUEMrWWJzSnhOaEVWSzJB?=
 =?utf-8?B?eXc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efe9b32e-e19e-42ce-92c9-08dd20f356f3
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 12:39:26.6450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Txmaclv+iR3v+J2//xAj/1Fvo+nHJYZC4xJuUydXSq/IMGkECru4VGlKYcgCyUZ6cVegl1iXVpkU6WOXteBNLxnz7bCiBuh7rdBoHWEKmx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9516

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

With respect to S32G2/S32G3 SoC based boards, there are multiple RDB
(rdb2 vs rdb3) and EVB (for G2 vs for G3) board revisions. These versions
are quite similar. The common part for the EVB revisions will be
centralized in 's32gxxa-evb.dtsi' file, while the RDB commonalities will
be placed in 's32gxxa-rdb.dtsi' file.

This refactor will also serve for other modules in the future, such as
FlexCAN, DSPI.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 150 ++++++++++++++++++
 .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 122 ++++++++++++++
 2 files changed, 272 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi

diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
new file mode 100644
index 000000000000..a44eff28073a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright 2024 NXP
+ *
+ * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
+ *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
+ *          Larisa Grigore <larisa.grigore@nxp.com>
+ */
+
+&pinctrl {
+	i2c0_pins: i2c0-pins {
+		i2c0-grp0 {
+			pinmux = <0x101>, <0x111>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c0-grp1 {
+			pinmux = <0x2352>, <0x2362>;
+		};
+	};
+
+	i2c0_gpio_pins: i2c0-gpio-pins {
+		i2c0-gpio-grp0 {
+			pinmux = <0x100>, <0x110>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c0-gpio-grp1 {
+			pinmux = <0x2350>, <0x2360>;
+		};
+	};
+
+	i2c1_pins: i2c1-pins {
+		i2c1-grp0 {
+			pinmux = <0x131>, <0x141>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c1-grp1 {
+			pinmux = <0x2cd2>, <0x2ce2>;
+		};
+	};
+
+	i2c1_gpio_pins: i2c1-gpio-pins {
+		i2c1-gpio-grp0 {
+			pinmux = <0x130>, <0x140>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c1-gpio-grp1 {
+			pinmux = <0x2cd0>, <0x2ce0>;
+		};
+	};
+
+	i2c2_pins: i2c2-pins {
+		i2c2-grp0 {
+			pinmux = <0x151>, <0x161>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c2-grp1 {
+			pinmux = <0x2cf2>, <0x2d02>;
+		};
+	};
+
+	i2c2_gpio_pins: i2c2-gpio-pins {
+		i2c2-gpio-grp0 {
+			pinmux = <0x150>, <0x160>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c2-gpio-grp1 {
+			pinmux = <0x2cf0>, <0x2d00>;
+		};
+	};
+
+	i2c4_pins: i2c4-pins {
+		i2c4-grp0 {
+			pinmux = <0x211>, <0x222>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c4-grp1 {
+			pinmux = <0x2d43>, <0x2d33>;
+		};
+	};
+
+	i2c4_gpio_pins: i2c4-gpio-pins {
+		i2c4-gpio-grp0 {
+			pinmux = <0x210>, <0x220>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c4-gpio-grp1 {
+			pinmux = <0x2d40>, <0x2d30>;
+		};
+	};
+};
+
+&i2c0 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-1 = <&i2c0_gpio_pins>;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-1 = <&i2c1_gpio_pins>;
+	status = "okay";
+};
+
+&i2c2 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-1 = <&i2c2_gpio_pins>;
+	status = "okay";
+};
+
+&i2c4 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c4_pins>;
+	pinctrl-1 = <&i2c4_gpio_pins>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
new file mode 100644
index 000000000000..91fd8dbf2224
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright 2024 NXP
+ *
+ * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
+ *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
+ *          Larisa Grigore <larisa.grigore@nxp.com>
+ */
+
+&pinctrl {
+	i2c0_pins: i2c0-pins {
+		i2c0-grp0 {
+			pinmux = <0x1f2>, <0x201>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c0-grp1 {
+			pinmux = <0x2353>, <0x2363>;
+		};
+	};
+
+	i2c0_gpio_pins: i2c0-gpio-pins {
+		i2c0-gpio-grp0 {
+			pinmux = <0x1f0>, <0x200>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c0-gpio-grp1 {
+			pinmux = <0x2350>, <0x2360>;
+		};
+	};
+
+	i2c2_pins: i2c2-pins {
+		i2c2-grp0 {
+			pinmux = <0x151>, <0x161>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c2-grp1 {
+			pinmux = <0x2cf2>, <0x2d02>;
+		};
+	};
+
+	i2c2_gpio_pins: i2c2-gpio-pins {
+		i2c2-gpio-grp0 {
+			pinmux = <0x2cf0>, <0x2d00>;
+		};
+
+		i2c2-gpio-grp1 {
+			pinmux = <0x150>, <0x160>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+	};
+
+	i2c4_pins: i2c4-pins {
+		i2c4-grp0 {
+			pinmux = <0x211>, <0x222>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c4-grp1 {
+			pinmux = <0x2d43>, <0x2d33>;
+		};
+	};
+
+	i2c4_gpio_pins: i2c4-gpio-pins {
+		i2c4-gpio-grp0 {
+			pinmux = <0x210>, <0x220>;
+			drive-open-drain;
+			output-enable;
+			input-enable;
+			slew-rate = <133>;
+		};
+
+		i2c4-gpio-grp1 {
+			pinmux = <0x2d40>, <0x2d30>;
+		};
+	};
+};
+
+&i2c0 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-1 = <&i2c0_gpio_pins>;
+	status = "okay";
+
+	pcal6524: gpio-expander@22 {
+		compatible = "nxp,pcal6524";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&i2c2 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-1 = <&i2c2_gpio_pins>;
+	status = "okay";
+};
+
+&i2c4 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c4_pins>;
+	pinctrl-1 = <&i2c4_gpio_pins>;
+	status = "okay";
+};
-- 
2.45.2

