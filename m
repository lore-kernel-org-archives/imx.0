Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013061.outbound.protection.outlook.com [52.101.72.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700C92D592F
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 18:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773082558; cv=fail; b=paM7I2TDyKf7pTd9E1EHQmV7JYQix8itsnvmEE4i84J0CMQpxotUm8Wkzs4QiQSQgnybDhwzXi4pqFdSaiW2mltcc5h16QEpjLeKntCGUaDqTCs9qmuB1is3VUhDAtgp1ng2ZYAdLKECKF8RfiLS7wgIRkPj0JPH45GzZJDGLto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773082558; c=relaxed/simple;
	bh=WkapixBAOvTzmSsKKpHGzwJnV1kCfD4H6Jv04+s6DS4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=XWxn70ZfNUqGQYG8ifiS2ej4PSIsviiQg7rYiFljmckm6PaKRh3NiJOKU7ec5B+Ph3c1r07cvIpwzHhSTLp67Y+26vLuqQ/tFRJHn9Ts6GimQxdYuXWtwJuGqgUbZoAL18QEtPjnp0kr0xu279nIHTjQ1VnU6nqQ8vdg3Vw5Haw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gcPOhs/g; arc=fail smtp.client-ip=52.101.72.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gcPOhs/g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dK3u44H5A4wG3K1+V7BnOFvqcE01TPbEcc1lnQEdne/3Fl3bX0ddFlstvzcNCkswNLmNPgjoB5oLihOdzi38k/wLhbLm3mQ5L1xxpO52YvePY7FSWYZp7FVdryabqfT0K0PBO+nkVFUEUIBVJYvZ+Fo6GODOzHYnX8jACnITKe0khVN9dtk6HEHP5wZLwnOkOxYS2kNs4zavlSEFTof5bF/LfqQb1ujHFDmdOUgCalWapIlhTdWbpcCogXJRCqsylZpQyEE50X1HGV5mZ2sEITtO3Rs6hWG/NtMFFsoX1qrip9GtkNVudAvSIs5iYkxA0wDIlEVKwO1A8oNXSHT/4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VymbtH0UWy46EuKPi2te0r3GeUC0HLlnAueaBFBoClQ=;
 b=MDyacNSYDIpHGN/oyXJhnkRDeQv0UEIS92yRQOmRmJ8AKgywkU9y4GpnvC6ACgQH197phfOz9CT6MMTQ/WHpFYISKN/SrkQ3NGodeLKyP2f3rdAWlhBxp98raRkQ9OpXXXaVOn6CQWRhyTYtao/cCf54eEv1sCSm6AV7d45e7Hqcef5g0DH9cjYGijaFlucWL3IjpXQhtQitemN9b0Ep8G3YbNmovwpmLuAm0NlDBcTITGJDN3DJUOuT6Mg8iWO3EtMkFnXFUa888wOgra0ly+Cg95lYh1DvXZ058RhrwGHcoq4Vxeahnh0MQK951VEudPCC+BC45gqTuJoR7zWxgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VymbtH0UWy46EuKPi2te0r3GeUC0HLlnAueaBFBoClQ=;
 b=gcPOhs/geqiRXHGQVvsAChTHpbgTL7YLodX3tRZjdZ0lW6Cjq4DheydCq7mJtirauOv1Rs28Qr+u610JRoY8YdRxRSMgzrV9z844/GepZ7YOAXkNMf5WR6AK7G2yJqRKX7dyqWWaGYqouUMZPoe5VIPeXwufM3a9lB2T1KANFEn0aC7shVCYYZO90+Z2XRjRNXjhitHUQ9ghvBZbwwn65zn6hKG+1lTX9SWyUPrd08UpIVIg8oEXypbNj8zmPteco2YhMWv6249D5cEotAOjcpBsZLU6C5BahoN4NGcTDJ5wI5wJfJAb5ZEsl6ydKc9U2WuhTm+7jx9GroqYX9hWpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by AS8PR04MB7542.eurprd04.prod.outlook.com (2603:10a6:20b:299::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 18:55:54 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9678.020; Mon, 9 Mar 2026
 18:55:50 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, 
 Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux@ew.tq-group.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260302084548.6471-1-nora.schiffer@ew.tq-group.com>
References: <20260302084548.6471-1-nora.schiffer@ew.tq-group.com>
Subject: Re: [PATCH v2] arm64: dts: freescale:
 imx8mp-tqma8mpql-mba8mp-ras314: fix UART1 RTS/CTS muxing
Message-Id: <177308255034.1763666.18406005031679155907.b4-ty@nxp.com>
Date: Mon, 09 Mar 2026 14:55:50 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SJ0PR03CA0050.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|AS8PR04MB7542:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ce8198-09f1-4aee-ba43-08de7e0d7d6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	ERac/0KWcapIVtnstBkEX1QjdJ82/+PbE9Jw0tkRZE/+GSOiiPPiU8Sp2itE63yUP9VmhshtfO2YLJ+PYkg15kVsS01d8+SB2Frc0MZWPcrT4AFv5nHw4cFS8ac8uOLI67ER8GkQfQeqWhRKXC5qJ0vgb5lwWNhGuVW0NURWhsjZxj2pNTiYJ2BIq/ai+FyQaYlT2Id3lypGWHEHwn7J0Uki+Ct7JNURCePt4hpMblgXapS9TS96mFAe1Yx8h621QFfvAHkOlK6Vigh/TbD/Ly/hGzc4SpmrEyu6YdXtvkJh7kV2+KNrL+nfA94s8JUfxx8IyYUkH2NWqfpIc7n+dyZNQxmBN7G/uq93gDPEncMjTHPnMXqu5y5Lfbr3z6nukSRx+XzdphZgymJD1HIGqyY2fns0UPZjiqaED5smfchITmgEVlL1sR0cCOnnPRGN1TGrKeMmdXtLZfE5uZ493A43X0HH3wZnv7a9+d6JFj0uN24Ra21dr6o4ClXVd++ldbHj+7SNxGSgDa6MYfTFxum2FEzNUOpolUG/aLgUyNEpMLF4RgH31FtCU7U1hQhvQImM0dhPqLJ2AYiIriKIbOM0VoGSelTHItgXTkfqFJpx1KkRfvSODFp3Ssssr3KCWMcG8VavLVtEp59S4eP8EiTY4PpIVFLoksJLxKt747o/rgKSdaTQx7+FI/y5gvVEFB7PgLsVo9xsk7+6EhWkT5j7rv4g9RCCvRVhZQydg/EmSW2yL/AtZJiwrlzLYbZKK/NXlZtEzSN4La1r1SvnhfkgZgtPXnF6qz94LEMHxgo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eitHVzZFSm1YWFlTdjdIL3g0UGVUdHF5UDcvaE9JSm43Ym4wbWo3OHcyMlR0?=
 =?utf-8?B?WVVmZnNzaVRJZ1pRdDhoRmpWSkVYYTlteXJqaXI2YnlpeWVSQkh1QVlzbjJW?=
 =?utf-8?B?ZStDSnIvdldmbDdVZGRvOTQ0ZUR0WEVlRkQ3QnlZZERCL1Y1bll2QkN4Zi9m?=
 =?utf-8?B?WGRMMEdWTVMvOW40cGptUlE3UVJNcm5NQUhLSTM5OGZlNTJtYmlITnRLV2w0?=
 =?utf-8?B?Tmk2Z1U1U1J3VmtRSHdKN2o0TlQ1cm9obDFUbldsdnkxSVRyeXBocTF4dmNr?=
 =?utf-8?B?SlpWM2FEUmJ5N1FJTEY2amcxMncyY09UamswckZ1NWVBUXdRWHNRZDFXNXNC?=
 =?utf-8?B?dCtRY3RtL2NaeXB3M3h4aFVSUGtkczZHdkRWL3RUbUR1N1BxTklzWDgvNlgz?=
 =?utf-8?B?Tm5NOGhmcW5jcDJPZUFBbFdLYmlWNUk5UXlZOUwzNmJqd2JuQnBlMWRvQmg1?=
 =?utf-8?B?NC9STks2NTFMSnduMVFRVGFkeGJkalNwbTJNVlRDcTJUcEFTeGg3K0ZEcGtT?=
 =?utf-8?B?eTBnbjNLUHNpWGdNWmkxbnlJOVFXaUpHNENCMXp1RFFZWUN5ZVZaTWI1VHQv?=
 =?utf-8?B?NVpsNFRnbUtsZDd0TFJDK1RrMElPTDBzdGN2Sy9IY09kLy9IWTduaUs1bFVl?=
 =?utf-8?B?SHlkN3JEaThrcGN1S09TOTN6eXJKbkx6azgxZnRGVFFKaTR5U1kvZDVNTlRZ?=
 =?utf-8?B?NXhpdWhSUGswS0dtNVFxWFJMaE9WSUFvSFFmbHUxMzFYcUJySUJsTWMvOEhQ?=
 =?utf-8?B?ZFZ4Y3B2cWt0V2wxeE5kWmFyVHNKSDBoZTRvaUZyMElURWJSUnd1OEk2a1E0?=
 =?utf-8?B?SStXWHB0bXg0emh1eUZibldwR3RiSVR2TFY2aU1EVDV2NWtzTXRnUlNUMjJO?=
 =?utf-8?B?b3RjbmowT3liSjdVenhIUVBURVhCcWVHVWF2MkVkWlhVZHZaTmRZcWxxT3F2?=
 =?utf-8?B?RHJxSGpNdVd2ZzVIQk5sbUFzeGhnOFNpcFUvZE1oSFl0SXZqcUlFcTlPYzFI?=
 =?utf-8?B?NkpHVkZYdVdBVlhWRVJGOWVUOHBheVVKVmNIRXFiMlg2TkQvZC9RQlcyOCtZ?=
 =?utf-8?B?ZENOTWhDekI5YXM2K1h1VEJrdVoraFloam4wSmlNTTVjS3lTeFo5RzNwalpr?=
 =?utf-8?B?REh1dnJEZitWQ2FSVFZaRlhjYkdURk4reDYvMHRrVHlKMGd4UlVSMStRaXdU?=
 =?utf-8?B?YlhqUHdMV1Z0OHZpNWc1SS9uL0J4S0dYc0FidjJkNkx1VmY2eUpPa1pzbDRY?=
 =?utf-8?B?VlNaa3NLcFNGR0pKeUtsUmk3eTBKT2ZKS00zcWlpWTJmMVRQMVRmRTVJenJt?=
 =?utf-8?B?Mng0SEcwY2NrejhsRU9uRHljaklDYk4wZDZmTDAvZWtyTjNqZ3Jmc1ZMU3pL?=
 =?utf-8?B?V2hyeTJzaE1ObEVIV3hMRGFXWVpEcTB0a2ZzY05zbktTYWZqRGRmYVlZb2tr?=
 =?utf-8?B?eXNQcWVaTzJOMkd5WC96bHR0ckI4bG9iMVJpZW9LNVdnT2hJYU9pQk5DbHQ0?=
 =?utf-8?B?K2Zkck5FQlY5THpBMCsyTFhkNER3aHh3dmlzdkJnQnFSOTMzTlV3YkFoTlla?=
 =?utf-8?B?NlRQaGlhdEFCU0s1bDFGdGRwM2VHSElVbHA0ditxMWxkNmM3RzI3dUFRZHNP?=
 =?utf-8?B?N1ZJRkhjM1hEOGdRak4vZnJYQktxZVdGWDlKcHRqUGxRUjZ3UXFXaWNYSHl1?=
 =?utf-8?B?bjR5VVFuV2lDMDZBOU1weWJDTkVSTVVGL0ZhaUZVeXUyRmliS0p4NW42RkNX?=
 =?utf-8?B?cytrV201ZmZpc01lTmhBNTNEamZrOXNnUWltMHBLU3N3WnBaZS9ib3p3TUVQ?=
 =?utf-8?B?VUNqZk1Nd2hBUXZWZWhxT0oyVFg1TFVIZ1JqZmMwN241dW1lMjFtcjVJVHU2?=
 =?utf-8?B?TkNOZGpBaHRRa1hwekFDMlFjUklPdXRXSFk2UjR0czJaanp0SkNtNS9PODNI?=
 =?utf-8?B?cFZhUCs3UXNRd0s2MDU2RTdYSHl6Q1BoK2ovRkZ5dk9NQWJabTFjNEFyOFI5?=
 =?utf-8?B?Z3kwZUFtbTFYQ2JvWnU4UzdzdGRULzJXK2JNcFRoVlgyWFpqenZhOVU5Rzdq?=
 =?utf-8?B?MjJhbFdRd0RVbEdNK1pGc3BnSERHYVVpYTREZTUwVytTbFo1WmZvK1pvQy9E?=
 =?utf-8?B?bjZ5YWtaSnRmYmZHTWlUcVo5Z2NBcG1Zdi9YdUxuL09mUGxMOUpqWG81dUpR?=
 =?utf-8?B?alRDVU5VeXJjMnJsN1d0eEJGdFVmUVlCTG1iR1dKcHcycUlWSGZGY1pJOHV3?=
 =?utf-8?B?VmZzVkVNeHE4UHdMYWNabFFrVU5zRkhuOExCSGZ5Z3I1ekJHOFpWN09BNmE4?=
 =?utf-8?B?cThVczd1d0NRTVRBYVkzOTA0bjFWTUJzTVlwTisvc0dJbTc0aUwxUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ce8198-09f1-4aee-ba43-08de7e0d7d6a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 18:55:50.5609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VMYQgR3G1cdN4edN8446iX6c4DsrB2GWpuEgpaVu2PEB+Hq4hLzPa532pBogrKQs0ENMObKH5PHAODi0xiDWhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7542


On Mon, 02 Mar 2026 09:45:48 +0100, Nora Schiffer wrote:
> UART1 operates in DCE mode, but the RTS/CTS pins were incorrectly
> configured using the DTE pinmux setting.
> 
> Correct the pinmux to match DCE mode. Switching the RTS and CTS signals
> is fine for this board, as UART1 is routed to a pin header. Existing
> functionality is unaffected, as RTS/CTS could never have worked with
> the incorrect pinmux.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: freescale: imx8mp-tqma8mpql-mba8mp-ras314: fix UART1 RTS/CTS muxing
      commit: 3faad5f8819ac1485a14a028177ecacb1c0f3591

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

