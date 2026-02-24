Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011040.outbound.protection.outlook.com [40.107.130.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AF43A9616
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 16:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771952367; cv=fail; b=kycfYVQ6CRoWJT7T6eoVbkEUYkXRauho+Db+E+jQIwILSRnFL/vySIgfh1mM40d+tAJyJcRlP1kwSE9Cw9MB8sQ8Bh2iHIWjYoixZmC0n8Wy8lja3M+CK5f+OlP4lXfMy5vahJTS1Hj5kA/IdpXRtEKBU7ebzuDLvIGsIebUbu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771952367; c=relaxed/simple;
	bh=SQowpq+Znbm4v+EA1Ni6atwP6QM9VQzA/52RhGjTp5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FreSILvzIPl3Tz66XJIcTozLfU224DTu6o7ZIumY1bGFW7RtmHNrIQFRkNbfpWcsd4Qk4bpQlrhfIDBVFSxsKLOJbLEcFvV+gjZk9hnlyK5JEPl8s6ll2dK78TND31m2B2ndqReTo+Xpz39J9ST5v19vLsG6H6Kko7q81VuA/DY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jvd0mNxs; arc=fail smtp.client-ip=40.107.130.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jvd0mNxs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYCRuzjCnbTVwYCaxcnjRkP6uZ5tPMQf6xQdzbenVdg5euzfZFjOheINsFChUHBIzRIm6CmvqUIxieIQz3V8HYogqJ7/x7u0hzWdLNEkPpxqt6qDCtg1MWUdsZX1VX6Kj4LLgL1ISgtw5rl/cZnFnUiPLhdjxipWhkk0JimluqUmaZqDi5RE+gaHyi3dkIyRWegxnWZFMRgLF8FrEYddagWG+P7fClvYmy465FPrCrQOqSH31F4+ZQpASYd5o9QlXpE6YASXAm94VHSpNAioqLwKnmEpUEu4F/4qlxOEyxVw8GLNlZUQj3sPOpeFGm668YaGDC6cqvqQ+NgqANVj3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trZSkwqBxb/jfyQQZDkkU0vvP2DHrjR+Ru5xsT4/3X0=;
 b=jm1CoN9tFmVhoBm7j93UPcDf2B2Qwf0v9pfUlhB71mXmwG07MZ/m8/NH+CisE5UK4hoNrEBYzM3bOcIVzZ/V2Oub3YWqZTrxTNPzPB2NImsBKuEOH8BFLOqs4f+ymS9dyqd4tbSpgAJ4GEfokC+3jBAYfv96wf7JIb0z6DY7WnyJ1UYs6VeDKdnHXzzQrY6UWkDykxzR7Td74mPVCTNaUJQGWmFZ56ak3EuEBt5UOs0+csHnGcW28uyDNYUu5RGblOuHMyNKPXkmLjrTHCmhoxkS28rTnB2+hmmX+fEWVA/04g9yIIJIWzms8QzjhbVLCrBwGLxFnkMB1ZtWOYOsHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trZSkwqBxb/jfyQQZDkkU0vvP2DHrjR+Ru5xsT4/3X0=;
 b=jvd0mNxsu5r8UjlaRVtaEMrJ95V9YNvxDS7L4bCGRcYCFPrUzFxOLC9tZW+oT9AbZWKjqMP5oykpLeMt5ak5QCqNgyfq6riGQXZ6HO7nmQBvcYASj0GOAEFdSPwlP2KdoWdi/Qdj6J7pCLW4D4TdN0VfvlJsd7Nkh/tFljFFm1x4gWi0ABCMiZZ2Ui2YcRpjd1Jm4y6MXYSNSAI859r/b0EeGDg3BGrJv8uFq/bIjE2LxsjSsG54zt0nMtK3r8SVRoTh3Z8ZqRhYpxKOCqxcnEfM2cHXSe7yDXJpIkwsxGrGhmzzwE5Sp4r+gGV/b2XbpBqpzrmUYRIphy4sGdIeKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by DUZPR04MB10061.eurprd04.prod.outlook.com (2603:10a6:10:4df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:59:23 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 16:59:23 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: imx8-apalis: Remove obsolete TODO comment
Date: Tue, 24 Feb 2026 11:59:07 -0500
Message-ID: <177195232898.2916716.8238475017730114240.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119103654.51318-1-francesco@dolcini.it>
References: <20260119103654.51318-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0134.namprd11.prod.outlook.com
 (2603:10b6:806:131::19) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|DUZPR04MB10061:EE_
X-MS-Office365-Filtering-Correlation-Id: cffd81eb-f852-43b9-1fea-08de73c60f56
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cC9iTWJMVGF5VnlsVDlXbitPY3JjSGkwU2dkTFlRd3BrSXZQSWZIN0EvZjJt?=
 =?utf-8?B?OXU4K1JPU2ozNFY0eTI4V3MxZ25zVk8xd2FoUmsydS9meXV0dERzdU5EM3hU?=
 =?utf-8?B?N0NDMXdZVnNNbUVUQU9JdkEwTHcxYUN4UTYzN3ZRSWdyakVxeUpxUGtRM1VJ?=
 =?utf-8?B?SXk2cDBMMU1HZEtvbk1ZMkVCcWhRaFVHNmdrKzNxRG1XK1FoaFd0cHRUMDho?=
 =?utf-8?B?a1hxSTZHVS9LdEhmdzl1bmtUOVR3WEV4Y2dMZHR1UVpqUE1mei9RMTlaeDhG?=
 =?utf-8?B?b1NVKzVpbEZScE5SNWFUaDFTZ2dHSUxyUGQybllUeWhiVk9wSXVlSkVlY1gw?=
 =?utf-8?B?RUpmYk85NkNSWHVBOE0xZWtRWXdOQ0RzODlKbDFCenc0RXNTRU5JNTlHTlN0?=
 =?utf-8?B?UXFualpXbVNqdWV4a1loWitiN1pKS3JsOFBKcnFtdDhMRGdtdU5UNXlHYUZP?=
 =?utf-8?B?UGdnUEI2bzJDMEpBWkVld09adk9JclJEUEUrbEdCK0JHR21nZXBJV0g0bE0y?=
 =?utf-8?B?R2N6VVA1ZWJPR0o5bU5FbjltdEtFcW9EaXRTdGRlMEtFNHNTdXlXSTlDYVBT?=
 =?utf-8?B?NkF1WTdraWR5NEczcUlYOG45U2RyMU9XQmZMMFdxS0NjZ3M0ekdvY3A4SmNG?=
 =?utf-8?B?c1ArdmovZ1dRWU5YNUhaci9JSk1OdUJXR3hzRkZOSTNEY3ZNempXdWROdnEr?=
 =?utf-8?B?K3BDQkg1alVEYzhPU0FSVjlTS1hjR1FrVkl1bkRQUjArRVQvZzFDbnJNV0Jy?=
 =?utf-8?B?SHVsdXZZRWhic3hYMmR0emNKRnM5Q1lYN0JENE0zdnhGVzhPS3Q5L0RsNXBZ?=
 =?utf-8?B?VlNRdUN4L3lGUGdhU0hWcjlzYk5EVFN5aU93RCt2dXhiNE9uanRuakduVXN3?=
 =?utf-8?B?dkxvZHlreVZSVzJ6Qk01QVBCdXhwYW5WYldZWFRzaXhhSVhjQ09QV0xIZnAv?=
 =?utf-8?B?TkE4VmwxdWVDLzlmRVI0czJkejFzQlRvcHJVMlhCUlYycGwvM0JaVlhqbnpF?=
 =?utf-8?B?UjBXWW5wRWVJQ0RpWnB5NVNSVTBpdk9weG5FaUFrR2JtS0dhVysvcUEraWNY?=
 =?utf-8?B?SHNTTWlaRnNrM1Z5bFZTWjFLbjV0dVl6aE5yeWsxaVhRY25LWkcrRHAvRXcz?=
 =?utf-8?B?U01sVVFYZC9YajlQNzArVjlQNG9RVGdtV1MrRERISlhJTnExU0UyYndIR24x?=
 =?utf-8?B?b0VtNUswOVpNdkxWVGNyS0dLN0RlU1czbXNOMTBidFowNWFVODB2RGdFR25T?=
 =?utf-8?B?eHZpTHBIOHBic0xCZGhrOUFWRG10bW5aMUtJMk9wODhsMjVFMldyUHRPNjlt?=
 =?utf-8?B?T0gvQy9qSDRiaXMxeld4aUtrWmIvdktHSUIwaC8yOXkrTy9WQnUvTVF5a2M3?=
 =?utf-8?B?azJOdUVEZEdubVRid29kSFZkRlUyS2c2SzZpS0lvejdNeFpuditOZEVJeFF6?=
 =?utf-8?B?Y3VXNDh5aFVPVytNbEVlcTc2WDQzZW1mNEc3VldxWFRQcVRTQloyS1NhbUxo?=
 =?utf-8?B?eElIMUF1amhudnRiZ0JUNFZkNUhsYXErMkhnTnhhU29xbzhCdmhkZlIvS1F5?=
 =?utf-8?B?R1hHZUdRS0hBNm1uTHpzWU0xTEVpd3FiSm5tcC8za2NzRnlnRFZ6aGtiS3J3?=
 =?utf-8?B?dWNJR2VTWlVON3piNVhaMS9VTGpJTysrU0xGalhsRURiTDd0VDMzNU9QYTdG?=
 =?utf-8?B?YVQvMjAwVWZkbk50UVRucVR6bGZNbDJqdktqT0Jodk1KS21vNHlrdEpZd0xo?=
 =?utf-8?B?Yzd4VDg2WmFiUkZrRE1SZVlxeGFBY3gvZWdUMnVmUFVkaEtiM2VUZVBma3p4?=
 =?utf-8?B?WUxsWGNDWHRZZWtWVzNZK2xxRzAwdk1Kdyt5SUlDVGVkTTRFT09MTWlEOW1a?=
 =?utf-8?B?MW5tUmthcGU3bTFmeXVhQ0RTRzdvYUVacm9LQkdVWUR2emZuUU9vc3EwbVlp?=
 =?utf-8?B?OTFDcEF6VkFpVGluSFJDa0NqcVFuRk01aVczUnpLcHh1alI4TnEvaUFPUTFI?=
 =?utf-8?B?dllhQllrdDF5TUpDZHpiaGRKVzRXRldHeXlsdG9McW5raldxcitaNitNeVI2?=
 =?utf-8?B?bjJyN0FXaUs0Unp5S3dyMWxacm9JbFpVWWFRWTZWSkUrNFJXellmbzlwbms5?=
 =?utf-8?B?cnkzK1k0ZzgyWlFkVUxlL3BZNG1pMCtnNExDcVFCdENKSHVPVlJkQmdPQnky?=
 =?utf-8?Q?J53EHF3EUMKZD2YUZVqvhW4=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MmZYY1VGVE5kbW5pVVpJUDU2MkRZSFREOG0wT0VmenVTaU4ra256RiszUHVP?=
 =?utf-8?B?VzMvRmV6eWFNeXh0SldXdUJ5a2ZhVEMwQVN1NWpuK2I5bWovRGNtcVJaRkFu?=
 =?utf-8?B?K1o0ZmhrRWh0d29xNk5BTmUxUlY1SnNaanFVRCsraVdPbnlVUWZmSExYT2gz?=
 =?utf-8?B?VjZDMjlaOVR0ZnVmQ0RTOTlLNkpUbkczeWlqS2xxa2tzUWxmcjBIc3k0eHJl?=
 =?utf-8?B?YXJNWFlKQjdCNGpESG9GdUkycFFmRkRWeURMMFJUaWg2eGRpd0ZQbVhoUVpD?=
 =?utf-8?B?aWthTmFtQmhINlRVcDJzNXJ6ZFdGUzVYL1ZKc2pXSURveVM2UStJMjFHY0ZK?=
 =?utf-8?B?elJXVkYwWXM4eERKRnV1Z2FXdk5iRzZybjkzT25na1BkN0Z3Z3phRWtoMm9i?=
 =?utf-8?B?NVo0U1JJYUVXQXAvVHh3ZlZUUUhXV3o3WWpZaEpmd3JHMlduelFXRmxFYTZp?=
 =?utf-8?B?OGFqNnk5UDBRYXVaTE9jWW1Kc2lxc0IwM3FwbmY5MTdYckNPTUJvdnVwOUl5?=
 =?utf-8?B?UmpiTU9pMS90RkFERjdQUmRZbldxN2FVdnk4ZlZXSlBPdDJQSlA2NlI2Y1FD?=
 =?utf-8?B?dGE2T2xDNGxQNVBOMk1oZkkvTWN4bFY3ZHFGL3Y1K2VpRll4VUttMERIYzNa?=
 =?utf-8?B?K1pwVkE4TlhKWXJjZDNEOGdaR28vQVJUMC8wRnV0WUg1bElTbTZnSEdjMXpY?=
 =?utf-8?B?cmNEc21xbnZpYUx3MXRYY29QNnR1aEVLTkFuYVlQY2x2eW5YelVIMksxRENJ?=
 =?utf-8?B?S0hYSHJ0Sk80RmtOVVo5UThENTNQbTBnSnVTSnRsRnMreDBkWFpJNEUxdXRZ?=
 =?utf-8?B?OGVDaGYvaUI0aWxwZEhlUThZV0Mza2FzZUVzNlh4dkgxeGJHSUpCWEd0ZHp1?=
 =?utf-8?B?VkF5SmlLVnBOQ1lUYmZNSUVVNmtQNzNHb0VjRTQ0SnZMSEtpaTZCS0JJdENo?=
 =?utf-8?B?aURJU2FQRXF4NEdDb3BlLzliZGZ3NnNrdmNkSmFZR04zalBCWXJVNFVmM3lj?=
 =?utf-8?B?aFlremRXRExnRmdZc3R6VzRTMEZvSHI0VHk0b3hIekVBUzRUT0J0TklUSHpR?=
 =?utf-8?B?REtTdkxET1MwTjhEdlVYVXh0ZmtpMitFYmNUVDRGdkFvcDlWSzdRKzlqR1dM?=
 =?utf-8?B?Q0tTZFRqNmFUTWlNUFBROGNmMnRrM1djaFZET2dOSU1xWlRLNUJrd0Q2dGly?=
 =?utf-8?B?ajVXWmpTWkl6UDgzblJ5dzhxTGNZU2xxcUw1clVKTkU2d2JsdHY0SEEwakds?=
 =?utf-8?B?NXVKVUZnRG5FY2JURElXSG9zSDg3UFpRZm9Zdnc2US9XaXZiSFRrRGJEZDZM?=
 =?utf-8?B?eEd5WnJCSVlVdloySVdxTXJCdWtzcTUxK0lpc21UeDVid0R2VExaZnVjTkJi?=
 =?utf-8?B?Q1pLc1RsdjhacGZoNzh6dzZlUUdlQXNJa2QzU0tXNHh4REszRzNQZnNzcktV?=
 =?utf-8?B?SHNmc3p6eTQ4OGp0REVpYVVGemluMEswcVZOMU9VczZxYm9rWlQ3STFNaGJF?=
 =?utf-8?B?ZTFHQkdYNyt2bHBzbldFWjVEMnZyZkhMcUErQUVLRkJGS09Va3hoaVZUV3hw?=
 =?utf-8?B?OTlzem4vdnVnWC8zZmg2RkNJQ0pQZEMzZVFRRXFsalhqZ2J4TGR0UWtkUmFD?=
 =?utf-8?B?ZVJKcU81MVp6MGNhbk9OaUd6ZktGOXRZQldtL1dpaFc3TjZGT1hyc2psbW9o?=
 =?utf-8?B?TU5yYzljRVNhN0E2TEVDbHJnbmIwRjdJcTdWTitXSXVHME9mSnlITjNOdk9p?=
 =?utf-8?B?ZXdyRkNMRzdxNU05SWlrNzQvek1HMFNBdFB1RGxTdE1jUU1hSGlKMHpBam4y?=
 =?utf-8?B?RHFkTmJDTDh6YVQzTjA4RjVwa0c0UGVhbjNoZkpQUWJZbnRIb3BVN3N6bUlF?=
 =?utf-8?B?cHhkcXYxZTJvWGtoMnNlVFZSUDFwWjRSbTM1ekEvNzVmS3VvMmxKcWhjd1lH?=
 =?utf-8?B?TG8rQzl1elJTU2FZb2JTYW13UVQvVmJKeDNvTTlOSTVoWmFWcDVyQ0phYlZ5?=
 =?utf-8?B?ank0NmtnWWEzVGVCaTAvMTN2Y0FFdEhWazFwQ3ZrWjBVYkZCNmNmRGRhVGl4?=
 =?utf-8?B?ZFVXQm8xc1VHeDlKZzFPcFFOVDFlV3cxNGtlZ0IySE1wREdISDF1WGhKM0tM?=
 =?utf-8?B?WjJlMXV2aVV6bFMwdW01bFhVNVFqRVdBVzRiVVd6L05HODdxZXFTVGhSdElC?=
 =?utf-8?B?RUtKT0I2NWNaNWM2dmM4UUhoZHkyVDM1YnJkaXhJaUVnUkRGK0lJSmt3T1JM?=
 =?utf-8?B?RlV6MG9LN2swcUNnOWJKV295YitvVjU4VVZCRHJ1Ym5EUHdHL2dacmV3UGRx?=
 =?utf-8?Q?uOxS1CLJFcWVr/9/pO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cffd81eb-f852-43b9-1fea-08de73c60f56
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:59:23.3707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2G5YQOWRPgVhpPjgDxvfjoAT4FMpi+9YrR+fwojrclbn1qf1YOr63JxSdP1qHpw2Kdsjk7s/OXrljJTAgHzI/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10061


On Mon, 19 Jan 2026 11:36:53 +0100, Francesco Dolcini wrote:
> The GPU is supported since Linux v6.9, with changes in the SoC dtsi
> file. Remove the related obsolete TODO comment.
> 
> 

Applied, thanks!

[1/1] arm64: dts: imx8-apalis: Remove obsolete TODO comment
      (no commit info)

Best regards,
--
Frank Li <Frank.Li@nxp.com>
