Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013033.outbound.protection.outlook.com [52.101.83.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828FA3112C1
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 09:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530952; cv=fail; b=C6dMrywO60VGpEZZSroAD4ZJI5ZwG39KvExwdcgkFM8WCONN6iJA/IUC/vRtAPS+UcRnNQgZI6tkDCyAOY+y9zEF350gkNLjP3+L5Zds90ym0UgcBngagMbprYwvmrWk6dY8m1rpnSQokodjgjlRA7UW27qtahy9N+U48dYdhEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530952; c=relaxed/simple;
	bh=Q1VJZtoM6gswB5Vqcs1ZKYbmHNVwp6lovh3Kn7bl2Ng=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YsHuYItFATNpu3xhcpBjZbUims6xD7CgOSF7gMXPm7ta/yc4EdQ3k8SBjFStkGOEI0JOleYxKWlBq1IzrBqoevFLXq2ffM1oJ0wNLl03J5TJfRw1JI9t9rh6OzwzOJnOcvswWlsx/1CDA42SEGkopN3b/gGWCM8jxwFksjXyapw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mXp1YvY4; arc=fail smtp.client-ip=52.101.83.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mXp1YvY4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2GJ9GfXEI35RPcBkXa57dNkfA89ATtXSjx6xpm2VBjjbHBqv4rqBG/tEAr7h9S9N80vh0vlgdIAtwVuDs2jmBeMGX+QrNpK/R5EtPluLXZvtTKIrApr0QPm0m7zXS0+mEgmvq5kQr3XmXK8fglrkhJk8Qan4QzyKMrYcm46MMMtmD2fhsZAzkk8Q8ZOc6kcE7bSoVSYaOwkq80Q9cUNrOatftzLrG/jrJf5H9Ahn5JDDz5BWyKrQ8JOE+0G2WDx0pLYojz8+2buFTLeS7dXBRJaU9S94fRgA9CcnFikyrGjt06LYjYsTfDXRveNBFMMEO8YHbr+4iKkcaFMyg5ddA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYMZZA78I0WVPIqhfF6Nqj8t/8T3kxfjIUB7j+zgWzc=;
 b=PIPFw10ZydztQvNHJC0m7AXoAvgUVoxUUkWg9oDH8No4mV+bhTM6/0E6yoN0xBIhPRvt7FvY1oFf8nHPhS4e9JXrRIzJjt2q/2vH2rNDZVGdHuVsNX7Z9BfsRCwVulR+Jiujt0BJVFfzwzOoVQqeVXwBBjyI+YGeNgw2VEYBzgx0twBUlCDmhS/tod6NfTwsvREYBMflqySfGwTYWjQywSHqhxaDttEMcDcH6pGc7EnADWlUepNYDBMlV4/fsubf2Cy4pCtWJ30LIuUoUBqfAWEX2+HIAYyPbf2fS3i13bFAJW6hyMfKib8Ofq5fOQqgO83Ni5BYlYdK+a7fvDKWng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYMZZA78I0WVPIqhfF6Nqj8t/8T3kxfjIUB7j+zgWzc=;
 b=mXp1YvY4/D5LcGCkGdRh3mVxcod7vRer5X0H47ovnV63eoDyeQDWGgQ9Ai+cuaTo34JNXiaAsjq0yBgoRHjbrHIInNjm6z5Ian1R5RZ7kr0E11ql1/t474t7B1jtXJNoMdv0+o+TEGYSD2fggXtPoZzo8t59tgcKlxihtZMn+LLddsJmRbc2JtaJVBSKT65LwWR2vDjfvs/9sqqixsvAbpOiH0yg4ayO8FZ2JzY7cPAw/2OZqE3wHRc2OnOH/6D6+woIN5NVEV4EpS6rwClyTupYe3zfrza5mVP9gjn+uTGOGwB37PmWmzg51wPJJAjmfqwrQaoHUGZB/bwU7h5PYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by PAXPR04MB8735.eurprd04.prod.outlook.com (2603:10a6:102:21f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 09:15:47 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 09:15:47 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Fri, 12 Dec 2025 14:44:12 +0530
Subject: [PATCH v21 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-imx-se-if-v21-1-ee7d6052d848@nxp.com>
References: <20251212-imx-se-if-v21-0-ee7d6052d848@nxp.com>
In-Reply-To: <20251212-imx-se-if-v21-0-ee7d6052d848@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765530894; l=7358;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=Q1VJZtoM6gswB5Vqcs1ZKYbmHNVwp6lovh3Kn7bl2Ng=;
 b=/7exqPcHV/HOH6ICLGjm87ldTZoJCXD0O/OEUP2I1cKnlHH5t88wA0sRpMDd8Hi6xudrqwWsk
 6pLd6Hx0ZBrCVtgh/OoB9jf9w9zBCmzqpx5YTf7KjJsRHXEBtI+96k8
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|PAXPR04MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d8f43a2-ebc9-4cb7-c91f-08de395f093a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R083aEcwNXppRWthd20wT1ZqcHFzRGlhTENaMzJmYnhNdFVYMS8yMzR1ZUFZ?=
 =?utf-8?B?eklIeG4yeGcvaXFjcmZIbmNoODg0QVowWGpzenV5WGsxNlVMQnc4c2tqVFRi?=
 =?utf-8?B?bVpBYUMyeVhQZGY5c2kyVXBHblBGbWdqU3VDUUU4UUl2TmZsdkVoMFRkUTJ3?=
 =?utf-8?B?MytVK2Q3RTNDRit1NE0vWXhDME5scmtZTG01d3JtOURic0V2UTJ3UStlMVVi?=
 =?utf-8?B?eUFqVDl5bkhTVjZrczUrWUNCQTBjYzN3WGFTRi9pNDZoNS9FZFpESmNhTFYz?=
 =?utf-8?B?WjRBS29RNENZV1ZrcTRxeVNrSEhodTBUK0I1MlpYcUZ2aFFWRjcraGV0a2Fn?=
 =?utf-8?B?elBrNXRPNFZRc0VjNCtoN2NYUVNPZ2hzYyt5ZW93UkdVREtUa2JES05ieW83?=
 =?utf-8?B?dmtBODBnbUJ0Sk80Nk5wckhaS2dNOHNiNFIzSFh3RVNPQ3IwckZKOU9qQm5t?=
 =?utf-8?B?ZTdMdU9PNWVWNC92aGx2RUVJT1JsK2dUMWtvbTRUeDNOK2VjQm9NcVl4bXd3?=
 =?utf-8?B?UTZxRnhFTS9xSG4yK2wvVmIrTFlHSlk0YVlxNVdnMGt5RGpaWVlab3dyYjBF?=
 =?utf-8?B?T3lwdXZpenFsV014Qk41cVpPVktySVlzcG5IZERKa0pPZU9GOXlaV2VsYXN3?=
 =?utf-8?B?UFlxM2VwWCtyS0NqNTZycW5vNkg4c0MxN05HNXdaQUpwM0xvVGtUNjhwcjhL?=
 =?utf-8?B?aTJ2dHpvNEpCTmxnQ2dDTkM5eTdtbzZ4VXFtTVNMVllGM1VoV2N4WU5BTmNU?=
 =?utf-8?B?UjBxV1g1MWloYWxWRDBiWFdkbVJhcGMzT2hxVnRIeUhQbUZibDVvMURhaVFw?=
 =?utf-8?B?MklSU3MvWmo5Z2t3QzZkNlo2ZTlkZ1RwVGVvZHg0R2NBbWNMaWZybWhIdU1P?=
 =?utf-8?B?Q0ZISDU1N29tcnJZRGpJQmNleE1ibEpUbU1vNFVHUkU0N3Z3SjREUU1PN1pI?=
 =?utf-8?B?Ym9kdXAvOWk1bmcwUjF1aWxOTytTRWU4QVl1OEJmaHdvdEVVQW9Ndk9BZWJM?=
 =?utf-8?B?cThLV1UxWTdaSWdma1IyZFVGR0M1dnRCSE03WHU5MnlseFpxc3JXTFgxakhQ?=
 =?utf-8?B?bWI5MkR4dEJqZmgwYmxMT2tNK0dSV3lxQTBvTlNRZDNIRmRncGJFUU1Remt6?=
 =?utf-8?B?aElCNE5sUDBLK2VvSUFPQURYSHJ5V3dpQm9Bell1VTUzMi92bWluV3RLT3hr?=
 =?utf-8?B?MDRUdjhWUUNha3RFV2lYTmE5cGRGZTNNNlZKK2VYeFNYM2FlNzFpMjRkM24r?=
 =?utf-8?B?QXkzNyszTTk3am5uckFveUM2RjhzVy94eWkwVjJLbUZhMjhsTFZLd3pyMXZ0?=
 =?utf-8?B?eXpQRGlFeUtPb1lRM2JWSDl3RXl5ZUp4RnRlMUQxNVpTU0RMRlVXK0d2d1kr?=
 =?utf-8?B?WWZ0OVkxNE9uYVhObTN1UEVHSXhtdG1rRVhYS2JYZ1BVRnJIUmY4cWdERmFS?=
 =?utf-8?B?djNGaU56djhsam9OTEZROVhZdGZPcTYxRGpNcHRBOXhYbFNFR0JVRGpNNWs4?=
 =?utf-8?B?U0J4RGsvUjRzTXBhRGdYaFlnVzdIV1RJVzI3SWJwR0JiTzgvajJ5SDNmOFlj?=
 =?utf-8?B?RFlNUm9WSXVtNDlPK3JVdW9OU0N5SERScU4yUHQzQTY5anhNTWtYVVh3Tk1m?=
 =?utf-8?B?bXVxeUNBVlEvTmoyZnNseVBmTFpjNTZkZC84S2VRWWRBVUU2UjRCWkJsUHFY?=
 =?utf-8?B?b09kYmcya0JuQldtVWgvdXpyL2syM1VKTy9MVjM2SmVJQ1IwUHNnRG5kdzg4?=
 =?utf-8?B?bVZQSlg4cnJ4L2lwWFdyc05MK0w2bDdxRGZPTktXSlU2b1hKcldsNWtLTkwv?=
 =?utf-8?B?RWxMT3FvNlVsSC9yRTBjMHBSM2hTZ0ZjUWdyU3ZtRG5uZTA0Zmx3czVGZ2F6?=
 =?utf-8?B?OVZ0WEd1aUo4RFFlK043bGEvcVpNZlZ5Zi9mL2VmdnczU3J5SUU4LzF0VzJI?=
 =?utf-8?B?QmJUa3djUGY0QkpoR3R4OFd5Q2dnMURhUXFyUkZJUys1TnlxY3RyeTNSVitv?=
 =?utf-8?B?VVVWMXV1UjkwTXpzMHFWZGw0SGxnVmwyNWFKeGhFSDRpMUs5QmtXL1U1ckVu?=
 =?utf-8?Q?Eu6c+f?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVAwcWV5MGxpcHZpWXE0RWwzZktJSDZvOG03UVRCUU84blFKNk5yNDVpT1J6?=
 =?utf-8?B?eGpSQ2hFdStKVWZhUGw0ZXRabjZidkxOSW1nT3BHcVVhc0d3M2JPVDd4Tmg4?=
 =?utf-8?B?V09XOHNIbE10SzBub1BwbGs2R0Rqb3dkam1ZOFp6d1RZVzAzbldycWw2elVH?=
 =?utf-8?B?T01zcjNwU084V2hBUUZ4YjQzSzlOZUNYemFHcUl4VjU0QXdVQkZiRjdRUEVV?=
 =?utf-8?B?ZE9DYzJiUUkyb25EN0JnOU9XWTdkcGk1OHJUQmRxWmNiMjBSb3hNdXF4eVdU?=
 =?utf-8?B?TlUwYklOYkVMZXUrL0lJcU1ISVNsc3pwRTFsQ3ZxQmhkMWN3SkR5QjRnME9V?=
 =?utf-8?B?YzJSSVBZWlVyRnM4SGZySUV1eEM4UzRjK1dCYnJyL25SaHhkTGtmS1gxdWRy?=
 =?utf-8?B?NFpZeUNud2dpZHJBeTRRQ0I4UUF5M1RNQWFCdVBtYWw1UWxYM1NRM2w5czNn?=
 =?utf-8?B?bTdxN2NLejl1VG9kNGZXTWpYaVJmQk56bEZEbjFYWGZRUW00VUdabmhiaFBq?=
 =?utf-8?B?T0RLK1V3SnhnNGFjbnFKVkRpeG9VSnBFZHdtOGVhMnh6WkxVeEcrdTV3Q3hn?=
 =?utf-8?B?TE1lY3pUSjhOUDlJb0g5em1JNzR6dGRNNWs5b1BKaG9peXl6QzNWTy9hS2t3?=
 =?utf-8?B?NXVYQWZsbFVoMzFiMlV2L09wY2dLaDVWL01weGNsV2R5NURaZVpiY2NCTU1m?=
 =?utf-8?B?VG1RYkdhNyttbkE4TUFScDRpWEtXSGpPblAxbFRLcllLclN3bWkrVm81Vk5Z?=
 =?utf-8?B?Z2dNZWlULzVwSEJoY1ZsNHhQR2h4WWFScEVOU1lBUitZRURVT29XUktzME1L?=
 =?utf-8?B?TnZBUVFRaVM1cVBVcWJuMFArQkdsa2VQTzZQWkNPWm1tejI5NUx2M21ldk9E?=
 =?utf-8?B?bFFya0wrek95U3NPdnMzZ3V2aDFwVHZ2V0FtNUNFNms5TnhCbG1EQkxxY3dj?=
 =?utf-8?B?T2ZKMW9kbEh2T1Y4OHZMNG9jc2NwR1RETUkvSDl0YjV1NXgzN2hRdWh4Z2Uw?=
 =?utf-8?B?cGZMWUNiT0FqV2VxU1BXeDRxZlYrSEtBd3VnWEsxWXJHd2RkTVBhcDltUEJi?=
 =?utf-8?B?dm5NVFIyOXNQMno4SkNOMUdyeDU2SXNtQUNmUjRqQXZndkc1MzYyMlBMUG1C?=
 =?utf-8?B?Q0hNK3hCMXFpRkE2MDlkQk5veDNYbnFOakd0NFBYYjVLWHV4QnBDamNPZk9o?=
 =?utf-8?B?RDhhVHFsS3U4YWlXeGkra29VYm5rN2h5RkFnc3J2SnJvWVNhb0ZoR3RXbWdJ?=
 =?utf-8?B?VFVHV21QN283ZTU5M0ZwZVlLR01IM2p6ckJXNGhlZXpMSU1tUktZMXpLMk1C?=
 =?utf-8?B?YVpPdDltTXZ4Z2RSdWpjdXhBanV2d0prTUhqWCtlQUpuQ0NUZ0xLUDBRQXUx?=
 =?utf-8?B?N1g5NGg0Q1pSamtWTjN1a21mU2N6Sm1EK0Q1YmhIQmkyR1Jhd25FZ3M2eG55?=
 =?utf-8?B?Z2dhK2ZjYWtndUFvWUFPNWZEd2pwdEVsOHYzR3pZNUY2Qk9VOEp1V09YYm9Z?=
 =?utf-8?B?WUN2OGtwOFlVRTByMkRnU0xxZ3ZMNzMrUDlvYUFCdEVWUGF2Q2hWNWFxOGtx?=
 =?utf-8?B?M0d4MzdMNzJ1eFp6MCs4YUFYbWo3MnU3Nit4VFFrY2E0L2luL2FOMnduaTJI?=
 =?utf-8?B?SXAzR3ZnRWJibjc4K3FuT21HdmozaytQM3VFREl3cCt5RVJoWGRhSnJrbnl4?=
 =?utf-8?B?UWhjam4ybVZrT3FRMEpkMElta3hKRjBBRnNuMEhwc0p4S0s5WDA5YjFuSi9v?=
 =?utf-8?B?d09VV2ZoZWplc3BPNUZQQTd1b3hLY09vRW5wK1UvbkJJMDNlNWRycXdJK1Qx?=
 =?utf-8?B?VmxBVFlrWmNlb1BwVFZjRmdsVGo1RmRuN1QxSlJlcTJPcjBPWXk5eGNaVmhX?=
 =?utf-8?B?cWVVNExyWS81cllnUFhZbGYrY2ZsblRZUlZoaVVPY0FIYXZZYm0wSHRCcXBz?=
 =?utf-8?B?dXdVYk9FeG9pV0VHdG1PaUFvZFpqTkMyOXNYWjJWZ3Bkc1VqeXQzSm45cENx?=
 =?utf-8?B?Sm5KWjBZcmo1dmlQQm9TemhyRFZKeE90YkhMVGZxZVFqZVVoOGpiTm5ZVDBT?=
 =?utf-8?B?djNRam1wbzNWaTl0czR6NzlsbXFFWnhrOUIrOGJiRDByMkdBa21ON0xFSUxj?=
 =?utf-8?Q?sTZMYyZpQ+qdFj+Cs1CbXRbIO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d8f43a2-ebc9-4cb7-c91f-08de395f093a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:15:47.4096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8gkdQ8Neikv9NPpTyZTL3nxi3UPu+9G6wsThX+PzZnWWWSTLi2XKTmJIQb8OvaZQNmIjOe0Nm2+CYOmyCTOzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8735

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 .../driver-api/firmware/other_interfaces.rst       | 131 +++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..2a7d7100fdd4 100644
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
+                  +---------+      +-------------+       |
+                  | se_fw.c +<---->+imx-mailbox.c|       |
+                  |         |      |  mailbox.c  +<-->+------+    +------+
+                  +---+-----+      +-------------+    | MU X +<-->+ ELE |
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
+.. kernel-doc:: drivers/firmware/imx/se_fw.c
+   :export:

-- 
2.43.0

