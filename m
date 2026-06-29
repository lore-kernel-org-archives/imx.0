Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3777743E4BF
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 17:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782752476; cv=fail; b=KSzreGVlc6z++gjhhwmAs4pnF5lTHLGNJgZFqMb1a/EXhwTqcm+sy6W0UF2FR6Toln2+3H4pJI/Mwt/RR9nDEoagMyKScx1/BHXc5+dfpktqaQ6KzwE2tgznnvrWBZOyY0ssOWUGDn++ycE8nfNDxR6qKrYS4ftyw8oTjruEr04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782752476; c=relaxed/simple;
	bh=ZajqzxggukqFH+D1DAWUtgLIB57NW6r1sAhv3G/G+1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j+GyvCdt5FUCDjLl4sE0bAWqp1NjzjieFq3t+ECJ/WLSsTajzJKB3+PEBji0sxd2WKEp5XiYYSQRMNf760CNTV7/KjorIUqnVSzesZCwZqUC4wlXzwxVC5a4ENtaNt/tWG9ANvKq+snBEorWY3p1swdX98tcvu64UQaXg0acZwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KevU+8PZ; arc=fail smtp.client-ip=52.101.66.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KevU+8PZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvzEe3qi9s4+pFzFgj98OxWbFlQ5caH3yT70EMJ3YunRRW42fwrACgESim771+aS+wujQbXsbocJ8w3RLLtMQz4QBCK270LbnhwOQCub391GP+DWvO3qp0ccGS4RcG00oafuiqRyBBKePHFsXH86kV9+a7uPJ/pKYJzxkaPPAlygs2/S3BWtGQV7mvI+elvEEyvmW+ZACCpBXYkP0AgLMg6lEce6x7F3i7dLU0E5MwvB4dmpwL4a7j+gyLqIdshGneMqhUqH5XYtdrPwHw4tHCWUPZYaIdQ57cZeV2xmGAQHEHS2AQSNO75W2HqNhb4h4GQrYwXu7OYPScx7Yj/AJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CGg/h4zjj1Y8Pof9f8bymzJ1UzZN61E8GSHjYk/ixx4=;
 b=hbEb1nyn1XUkBXfNGmC22wzBrIqS/IS2kYQiVnuY9vw682PIowNQnnl0ucvKD+JIwkCwDNJLuLwGoWxPC3oWZVRbMyKuNTN30YT4KDZ1b1zfR+YGmj6zbGJG2RwgsK5zMuow2ikFvnKfQs8PBgXX3cn+2dwHsUcMpgP8pjl1HEeQNh2GN3uSF0vz8qlDhBTwos4d385sBXIhb+adpEuTyf5a1x6oaOSSOlYahwu9T9mrEl550rKlOvhQFxF3+Z3AzvRQlzZ8IVhE1qTiKChy4VxJjG8dSV/lmgrQLn+GYknqshBXuLYeFoG/fzGrZJDU7Ocd1/jcihDQvppC6lDAQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CGg/h4zjj1Y8Pof9f8bymzJ1UzZN61E8GSHjYk/ixx4=;
 b=KevU+8PZ6NR349t7EOW+vI5WalkJ2ukZfLWNX6QZeGAH57eRp/lluLTltqUc1sGz8cc+xUhcPNiDV2zMDyvT6scEapb6OnY1voN+vOSiqvhk/lYd4hgrIpABgu7fitW4VeVocLeyaUEkWhUYeIxaYacoJt7ZaR/BxuaY5cETSGiFW1Znpt7nhXQDNi1xyXMInlXupfg4GsAMvAVhYQYM9+OhEqtYoFnP22TQfeAqccKqu21QVIMZxlp6juTD5h1Co709Nxnfot/BTV2BDtF6fDh7UmPCSxgmBeY79BaJigqbQTD2jxvt3cxWIyTpuBP9/lBD8yf88L43sVs2fpFGqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB8495.eurprd04.prod.outlook.com (2603:10a6:10:2c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 17:01:12 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 17:01:12 +0000
From: Frank.Li@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	"Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sherry.sun@nxp.com
Subject: Re: [PATCH V1] arm64: dts: imx8mq-evk: add uart3 and bluetooth node
Date: Mon, 29 Jun 2026 13:01:04 -0400
Message-ID: <178275246055.2306539.11994611470837896829.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616105201.3214395-1-sherry.sun@oss.nxp.com>
References: <20260616105201.3214395-1-sherry.sun@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR17CA0031.namprd17.prod.outlook.com
 (2603:10b6:510:323::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: ea275f49-db15-4a76-4a30-08ded60005b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|7416014|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	9CQPFsbZ2ken0IuimmIV0W2CaSXGZ9DJR8chI8Up80RU8ZPf3uyzm4I7PdKtsROoYRQFngdi+N7E+46gJ9zjqR2ASuHnom5g8u4a7MJwoHE/NFSncDm0dt2ib4YPWCrLo+q8ZdJn+QgPBmglaN/WwiRz/YHSZOi0O7kdqeIsESWTILn+PYA0Cu9f9HW48YYhaQx+3XoIjwzDnIaxMruCfsfT2xfWii2Lk9WjK6qo9z4crnwdw4LdJLLUZ0fZNJALuN40dZJLDooL40qIEHACL1dhSIiJC/HZxI49yiJfZAT7byAS98pymwZZvFNR21Cd5f8CyV0wnkKq67s9JBRfx5ZUDkKnUhHhFGYplk3rBnqomquI5jazWdWhhFf2dzi61oz3yS37kqicseFkgUAO0HAiIJ4OoVPXvgMFEDisUHT96k99mbRd7biYX0QiJ0kWzE7Lx62MsLPMdODL67t2a9hc9gcv8kwOn3YgOmR3LDPw2ovXizjLtc9nPAwvBFwhNd5qjpgcn7fhgA9Ghlx4s6iKjl2VA78LubAUEnaYXjaoSZundUpT7V3bKOgBd77NZsBPtOrNGa3O9aZg9Cu/2jeMpogNGMBgSZl64ojd1l4n6g91H0ujwx+wK8tKwDtd8xapkJdspX4REtc64EUwsUXwtOlAzBeQrJJZT86Ac40=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(7416014)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUVrUmpadzhNT2VFRjNZbEJRZnJ6Z2lpYWFzQk4xc3hqQ1FZbU5zMnhtUjNT?=
 =?utf-8?B?WXErSHppT0Vsd1p6Uit5ZFlxKzVRNlRYMnhiMlMwdHBybnlob3VIWml3WjZD?=
 =?utf-8?B?WldkUzRDcnlJTnRvTG96NnVCZEIyN21CWStRcWtqbm9JS2Flb1BnY3lQanNF?=
 =?utf-8?B?dEZiM0hnUEN1UGhiU2lvNDNlVU00TlZKVmlOZUdvKzJKUmJ3dEJoVTdoVER3?=
 =?utf-8?B?U1NQdFpCSEE2VEEzbVcybHNReHI2T2RpQTIxY1R5WFhkVFlmZTl1NWJkYlZr?=
 =?utf-8?B?V2kxM1BuTG53SE5tM2ZGbG81Uy83VlhCTTNBTXdBMGpiR3A4ZnJyajRXQldR?=
 =?utf-8?B?YTRNSlBLb3BGSXZoeWJQeVBwQWthNWtERVJnV3NUZFZ0SFJUVGNKajJkcWdp?=
 =?utf-8?B?Unpta3luYUduMmYvNGFydXBJK2lFeUN1U3pnMFV5N2duU1VZUzMvc3VRb2ZJ?=
 =?utf-8?B?dVh1SmdqcnZaaUgzczVFbFYrZ05ld05IdHVrOWQ2Z3lLWEZobWdUQUcyTXUw?=
 =?utf-8?B?MTVPaWo1NE1ONTdUWTRLVE5nblRjZHRsa1prMnNrYVRseXErbmlDbE1FTWpT?=
 =?utf-8?B?WWROTnZ3RHZuMkx4QnlwZlQxdCtYQVhmS3pRSDJrdVlrTCttTFREOWFnTjFI?=
 =?utf-8?B?cFpzRUt4TjNqOVFSRVVnRnBFMHpDNTdCcVZDWDlmNXRFQldNeDBVZG11Mi9x?=
 =?utf-8?B?RG8wVlBxQXZaY3lrUlpSTFMyTGcyenNHcnhlYVE4K1RTYXBVaFE5UWp1aENv?=
 =?utf-8?B?WFBvWXd2NVJ1KytTSnJaOGNHNW5YN0lJVnEwdU1aTmxUV24yMkdsZ3Z0c0Jx?=
 =?utf-8?B?b1BvSUcvcnJyV1lxbHNUNHNqS01CMm1LeVhnY0hvN1l2cENOUWp3K3pSU0Q3?=
 =?utf-8?B?c25JbnlEVlM3MWJ3M2xoUUw3bkZ1ayt6VCt5VElpWFY5QU8rdThXUUFuSlJH?=
 =?utf-8?B?WVhReWpybFphNCtESEU5cEM2L0MrOEdrL01pQXFOeFN2RkY2dGp5Tml6VFJ3?=
 =?utf-8?B?SlBYYXhONmEvVGllTXQ2cWlrTnZNVHM3L0FpSmxRRVR4dEJ6V2t6bkFLSk15?=
 =?utf-8?B?elhidGFHb0dYbUoxdEdsYit0Z2x0cU0yNkNzRXZCWHl2bDRSL1NkaW9mUFZG?=
 =?utf-8?B?NXdQekNWcG1vQnZJTC9yOTJPYzJnZmRsdXdxem43cXMzSVlXZFZXNUk4SFFD?=
 =?utf-8?B?T1VKOG5rcVQ1bG1XQUdZK1pFODBNTFFZUFhWM2NLcjJyeXVvZ2Y2aTNMeEdZ?=
 =?utf-8?B?V0JGVmpxOE0zVVkvZHNGNjd3SkhaMEN0VU5LaXRNUE5KNm9WVzh5TERsZGtW?=
 =?utf-8?B?d1F5N3o1bUxVNVptNWZWRDZ3MHBraXZYWUtoMCsvNS85eUtwcTZ5TENkT05x?=
 =?utf-8?B?ZkpLME0xeVh4Sm80OXhPNEtoeDk2Um9WRHcybFlFTFRtVVMxWDQ1TE55UEt5?=
 =?utf-8?B?NnN0TThXMjJUd09LQ2grYjdRVlpIZlF6V2dyRVNPWkxqb0dSK05SY3I2cjRn?=
 =?utf-8?B?dXAwV2ZWMHhRbW1TWExBZUtIZmZCRzFEblVhS0Z6RkpVZWlPc0JQZjltWklj?=
 =?utf-8?B?dkNQcEhlQ3VPcGxrbUxDcVZLcVVsaGxVaFRJcktWR1RqQ0pPbVFKbVR6RGw5?=
 =?utf-8?B?cld6TkxLRUlGZ0Z4ODZxbXpHV1ViZlVzenBhOHJqdnUzS3dQYzAyU3F5bDVX?=
 =?utf-8?B?Kzhjc2NoWUxOZWFYeFFVUEJKcWRnUVJJVGVGb2RYd3NtQm5QemdFZXc5Y0RR?=
 =?utf-8?B?MkpLdzFNMCtlVnc1TlN6bzNVNGdBTHRwKzBLcC8wL3d2WGUrUVdYbG1YQTV6?=
 =?utf-8?B?eTNsV0xWcXFvLzI5UkttanF1U282M01BRTF0TzViUjRCVzN0bndXWjV1NFVk?=
 =?utf-8?B?TkpxT1o5b3ZGdjJYMWNNSFdMcU5BZS91Z1J1QkpOa09sVXIvUjg3MXJLM3Fl?=
 =?utf-8?B?NVpKSFR6TlMwMU5JK1hVZGNjc2xCdjZyanh2OG5PTXorRDJ2R3NUV1ZmTjJP?=
 =?utf-8?B?dWRCVW1HU1FvOWZ2Q3BkeDI2eXRETDFJcHNJdzVUZVplb1ZyakNGWUM5R2d3?=
 =?utf-8?B?V1RlSHZDYVQxVCtvL25Tb3Y4RGFUWDF0K1J3NnFHNmJqL2w3MWs2cnNkK3BS?=
 =?utf-8?B?NmtqL1RnYTllVjJrN25Zd3QxMnY2c3pjQkpmOUZVc0RlVjdKVk5xaWliK0Rz?=
 =?utf-8?B?R2VkMk1oWlhvakxGb2E1ckVRR0ROUkFSQ3FFaTBLS0NENlk5clBPbXF2dnVp?=
 =?utf-8?B?N1JuQk9ZYkczUm93TUE0WXAvZGZ5VWIzQitjL2NSL3NSMDNYTVVTSTFYcDVp?=
 =?utf-8?B?YUthOG5GMUIxTGFWbk1zMUpZbHNXYitOQzNiTWNxbDB0Q0IvK25URVZja21Y?=
 =?utf-8?Q?xig+6BeJuLvFC7LLU0u40WNMcGtOJcZ2hDSkr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea275f49-db15-4a76-4a30-08ded60005b6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 17:01:11.9251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pEU9b0vd+DzWIlsOzFlf9GpXf6xBhNw6eOrVvU7M9gzdKmNj6C6EPeBswv+4pH1KojhE6sJrD/aYoqvwXkkDbrOQQUlsCt8TowVdH2wlrovdyqG5pLjTtFS6fE1Tzv42
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8495

From: Frank Li <Frank.Li@nxp.com>


On Tue, 16 Jun 2026 18:52:00 +0800, Sherry Sun (OSS) wrote:
> Add uart3 and bluetooth node.

Applied, thanks!

[1/1] arm64: dts: imx8mq-evk: add uart3 and bluetooth node
      commit: 4f36d5cd0dce934994da4b4be5776abd74c837ab

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
