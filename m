Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013023.outbound.protection.outlook.com [40.107.162.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CF8414A3D
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 14:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348198; cv=fail; b=dJoHWmj+jtwhMrmZIyVUGKxOYSacnIBMyNBydjW5dvknN74p3qcJRQCd10bMFIxhdyj8/pUghZva9hB0z8ZTTVwxuX8Va+zfjnA8HWhsW2fRcGoXzTEz8nNhEahauYEqiC+xIRc24R8K8OBbQ+NBnqz8gFEjTykrEqNqj87pGyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348198; c=relaxed/simple;
	bh=NR6S4lr06hNOoWlA6n91tszNoZucCF9CiiDg8ieA/+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sISr02mndnY6YReBm10C0FJQ5emi3PMknoc+entO1vgrfim5J5ZXviKVGm1nh2vdpd4nyQNupwZErEkipPxubPaW4rmqh68z2gLt9mL1PxMD/pIXiZ+c8MX67cJyJQ2Y8nydS0iPb9IRLNSIHJzPU9RYaTEKqAs+IF5CcpGADZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KORif6Dn; arc=fail smtp.client-ip=40.107.162.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KORif6Dn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvctVKYtUhs7IATMXzIdEfDIhyT/VU9RwSTswgR1B3qjG9jdUttRCjPx8JofKGg3ZdWnf5SO6f99Qyy0Muk4n6FhyWS0bJBo2UFDZ/mmCbV8s2LyffOv16FMvltGEyqg+Z9tACCYlzD8+z+y+rywHpbViTiYCf6m+ssLnyZOU8typ0TmuCPrGEuZmOJTI+OGzrUs7tIuCA62Ld37DpZ2hGRKW6WVibtper9dZRPZ0q3jqf8TX8fvKbEuaHPwyvn/ExANS/HwIfV6tK6SEbcJrNhyM+BZnhHO9AyqHSRMBWP9VDAmh2QatNwj2xhiUNv37K3qA9vhM68XP8EBHaCNsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ss++j/cSmkbiHOulJpM8+5G1YFhsVDd06RmldNjS1k=;
 b=emtE9lD5n5WFYIJS9cRwqX8zTgd7kI+eqRNb9fzLwkX1qIqTxtzGGZxzF/iAHDo5bb0OOn7oBxvnsGd9J9ctgrAMcZxD1DT/J2e89qD7O3pkhmM8lkDNqxxCpdNazBFhg9+9s3ZygEMzdBeET88eDrMBCO4B9mMqN/i9Xe0qZ/3FmiIL3QQK31zs83v4QD8G/Goi4IwWQSrtTrEFu4XR8b4ktapaGm8pIW+DEtp2wTs3udRdyViGN3+vjJVgT+VxqLLYDaP470WLgAWsma+lvSKMRfu1x0LHF2B76qRpQBiQpcDzi9Uz9b2g/0Jj9XQh+U0Z43Yxc7+VmXa8viHL7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ss++j/cSmkbiHOulJpM8+5G1YFhsVDd06RmldNjS1k=;
 b=KORif6DnOsSooQ9gNimnwLyBFHor4DL2bn+uqr1XCsTDqOC0y7ShnGEyEXR1WRbT3mgaIxJ54+y6oUEHNkYOShA2niT+s4badn7LLyB60kbtR3rsE/Uec1xE+A87HZFO+jYKhFCZqxgsvaeoBJ1HRWZjesFg7RkJuEjI8d7fHAqIDmz2ui1GfwyaojX2elnNv6s9TBck/K/WLgAFs/l83PHkuagaYYFt5Xl3qc54Ctdhf0hdLgakFu9Uc0mfCJlELPy+OWzxk1OwNhYTqiAosPxXKtLoth9Yw0DI3AyG5Wef2eIP4p9FYo0cqqXiSSFQwjGVQwCquHk5A2iLVLlWew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB10460.eurprd04.prod.outlook.com (2603:10a6:10:567::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 14:29:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 6 Jul 2026
 14:29:50 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH] ARM: dts: nxp: ls: Correct indentation
Date: Mon,  6 Jul 2026 10:29:43 -0400
Message-ID: <178334817276.1319341.8269579854399142820.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706101834.341292-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706101834.341292-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:806:130::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB10460:EE_
X-MS-Office365-Filtering-Correlation-Id: fb90dc7d-456d-4622-1989-08dedb6b093c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|7416014|376014|921020|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	MED9bz4qtLc0qQm41HWHgD3JVy5wyHtSU8HZNPFsrpDdeI8gcmvnzA2ZHu0MFcY+5DJbwKkfETLdJbha4qBK/0wfu6mYraJBjMsWJIxYNaGG0wIzd2jtFg0rQQR8y4fyH57M7UUGjCR+2axwd8euHQf8Z8z79qzSzj9oqn2HJA6N+73h7XpHTB1lEmQ1xFnnfSRx1ucQUxuWWjVwUjkEulk6EUgvT7FRiQSy7HRdIQwD81GvcggKlT5sfI6LLoO5Z4P73BsmiR1/XemQUCzb9PfLdHZjgOFRegJKWiAQ6OQhq+L5qDCgl9kkI5N5qnbuZc6GfGNz/Sw65Lt5VF2d8UQWZ1ETCgpEtXBotj23oyKJCAQ9kDPISjEDuiOJDVkkAqOqrHntspoa8hzeoaMJkPPdykkXuWJHVrXaCpkFx5HTnp2xBzpPNP/p0nppHPltiKiLO10mOBZSOSQlcwBzfddFI+vYzCyF+op0/70yRkWxpyqqVgnXhWC75YIdWZ6xOCmHs8xbZ0JWSQdIA4jWGEbRZf83pjP+SrY0pZAKLjTcmyaXkZZSnDjd3Hgz2dCG0Od1dfIUq3jGM2ysVhqIYfeZ4u1/mZJTYdUxXrnXXb7lSJ9Jmsac0re14dK9eFLrxXWs2wJbIDgDwc3cvq2g3RjJwudnPv0nM4QmvI88wP1/EFSP7cnP+1l9rCm5l6HyIkLfY9trdGMnmltBimCkRQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(7416014)(376014)(921020)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHFFaUVNV3JybUNpNzZrWlJVYU10T0VyRDZBcXdRWDBLMGlITVJSUGg5N3hz?=
 =?utf-8?B?SHhTYTlLcmYwMnFzRkwzamRYRDBtVFhUOUxoRVRYN2hiUFkzN09iczlZNlZl?=
 =?utf-8?B?ZEtZbCtidHRGVjBaVHp4bTFZMEREMlZlT2F3RHdnVTNoaVlmTFFPUFBrL2s4?=
 =?utf-8?B?NkFaWFRMaHgzN0d4bUx5RkI0dlp0V1p5dkZGQ0VSaWMzVW9XU1VIaFQ0VFFi?=
 =?utf-8?B?SnEzbXZiTVJVc0ZmZTZFZEszVUR6RUZaSDA1T3JuMVJDRlhEUXVlSlVuN1F3?=
 =?utf-8?B?R1pLKzVET0trZXpzNlFETGxIM1RIZllNKzlRWG1tUUtzRktNZWFlYXFEZElJ?=
 =?utf-8?B?TlpMSUUrWGMxSThhUHF6SE1YOWZublM4RDQ4NmkzcDRqQkloM05xSlFxZEhO?=
 =?utf-8?B?WGtTSk4vTXhPYjZrRHF6bGtpSEdDYjBOZVc1M2dUT0hrSFFDa0M0ZFN3bDho?=
 =?utf-8?B?L0R0a1plMnpHT0tZOGZYbGVWN2lWZk1CZTlMdGhZOXBvNGNVOGJaL0RmRVlV?=
 =?utf-8?B?OW54KzV3Wlc1bmxHeDgxL1hJYnVybnBmVCtnZlRUNXFCajNPYndXdnc5WkVW?=
 =?utf-8?B?UGJoeVZOSU9NSUpwN2Z1SWVRZTYydXVPVHNRaUpJUDVOT00zemZFRzBkU0F2?=
 =?utf-8?B?dElKclVJeThzRDMySXQ5ZzFSUStWU0RHVEJSWmhjVEx2RlhZS2tTR001M3VW?=
 =?utf-8?B?em5naUFpaDhJNG9KMlZqSjFhOFoySHR0VTd2MXQwVWE0b09vNzA5M2tuQkxK?=
 =?utf-8?B?czhoT2huQlJuR3hwRnBJTVZXRkNWdDFxNmYxbUY5KytrdmFXZlRuRDREUmI0?=
 =?utf-8?B?WE1qN2lrenBWK2JhbjN2TjBFSXlxdGwvVnlBSmwyOWFoQXFsNkk3dzNRYmpE?=
 =?utf-8?B?aVFGU05DZmIxcG5DUm5ibXBydVhacnM2and4aFlaVVRxdzdJVWpUazcwc1By?=
 =?utf-8?B?RU1BYWRWWC8yS29QK3lSVERtZVNxeFlBYmNyY1lpMFRHN3dCeFFQOENUNkw5?=
 =?utf-8?B?ODRkdTBwR00wMytJSktVTkliaFpKVkVLdDZKVlpkUkZJa1VWL01HbFBJempm?=
 =?utf-8?B?MUt2QThKZEVxK0JEeGZ2citnN0FhWFptME81YUZML3dRVEtKMDdTbWl3N25y?=
 =?utf-8?B?S3hMMDJvSWdJTlU0amtjb0hTMVA0ajNoaTR6TzJnanI3NTkvU1lNbFBNUC9m?=
 =?utf-8?B?VWI2b0NmOGJucFNiNU1VeXQ1WVJIVENZOWloMGloQ1NuakRFdVhFaXh2ekNI?=
 =?utf-8?B?Qm9meG5ZRFlpK0VhZnEvYWg0K1FRZDQxNEE1TW1Sc1hweGdYdTFQcW1hTWsy?=
 =?utf-8?B?R3lwVTNYbEJEYllUaHFXVXFkaXhsbzJORFAwb2haWkE5TGQxaDc0b0hnVGZI?=
 =?utf-8?B?ZnBTUEMwMzVsSDlSWFZ4VHlzRVoxLzJqcktWamZZT2xpWFdOQ1Nqd1d0cUsv?=
 =?utf-8?B?WTNxWXR5UVQralJDOXBncDdTY3FpUy9TUVRaYXdjSXRxaXNLVTlSajJtL1By?=
 =?utf-8?B?U09PYVZManJYRTBKTWRwL0pIcVhGczV0aHpwQjl0dXQ1ZExteHNLV1NJcW1F?=
 =?utf-8?B?dDJHSWsxRm1tYURsbnNMVWFtbVc5Q3Z4VHlUZmFkeW0ybHc4b090dFdpeFhT?=
 =?utf-8?B?Sjg0cXh6NnE0YlpSMSs5VHNWQ005OUpMdnZKdlFBeTBJQVlhTkRaYmpiaTVN?=
 =?utf-8?B?ZGFKVUk0TFFxWVVWN2oxR0ErazM4NzArVmJ5Z1pIQzF6TmVKWWxkRitBRWpI?=
 =?utf-8?B?eFRjeTRIcGp5L2plQksyRS9ycUdLQ2E0L2lOa0VtTTVkQTJibEkxMHJTRXoz?=
 =?utf-8?B?UG1aRk82R1ljVnNGcERrVlVmaHc1U1dJU1pMMkU3NXhpbEdhSzFxMnhxQjRo?=
 =?utf-8?B?amsxUzlzS3pFckpmNlpVMm5DWEo2YlJrcHpGeVhWekI4aWRFTnNickxRa0lT?=
 =?utf-8?B?VVBhWHk5YnE4eGsrRkxqQjBOSHFsdm1vdWJwTW1rdG0reWMwUG1lUVlGSE5Z?=
 =?utf-8?B?bEpzbzV2OG5ZcHM2WmNpYjF1c0VqM1NWRWw1WitRMEt6U2F0TXljTEdnVnk3?=
 =?utf-8?B?ZDM0d2U0TDV1SE0xKzA1UWZVd1VZL3BKaysyZXloTXNLQk90R01OdFFuWitO?=
 =?utf-8?B?VnZUdnU1UUFzeTZzYzNmZmRhY1h5ZVltZEo4TDZPSlNGMzZydkttQUZ0MGJO?=
 =?utf-8?B?RklreGhXeFJLQkFpR1lIY3lxM093NjEyYTl6b3RMYnFqR3ZmdWY4SG1sN0JR?=
 =?utf-8?B?MkZna1F5dGV3NjgxbXVscFMzd2ZTM0k0ZGJFTkVlZVRZMUFIb0x0OS9ZNTJG?=
 =?utf-8?B?YXQ3SXdpZllSMGZTZHNjcStBYXdrOTBXaEtPQk1nbjlyWjg5Z3hSR1pDT2I5?=
 =?utf-8?Q?WTGN5+u8FWRcZPdaIDky3ObL14uqzKqzlmf6O?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb90dc7d-456d-4622-1989-08dedb6b093c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 14:29:50.0240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4F2zSm9Pl9uDtY5NqyzicwgX7TBsG8M1bwKdqWj/GdpumfsDSj8RTz7etgax55aTsKhDnrQXCkL/H7ussxfx9V+IjmC+4DGI1iPrYMIYqnzTn6m4huxjSg6fRNVeuCGr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10460

From: Frank Li <Frank.Li@nxp.com>


On Mon, 06 Jul 2026 12:18:35 +0200, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).

Applied, thanks!

[1/1] ARM: dts: nxp: ls: Correct indentation
      commit: b99bc64c0fd91d0dea4147919184b7c8db9c615b

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
