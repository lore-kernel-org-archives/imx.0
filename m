Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012056.outbound.protection.outlook.com [52.101.66.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CD02F7F10
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 11:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783336708; cv=fail; b=XcKjUESEe1TExl18pMmtOHJKmZDr2Cf11bwBy9YIvT5lTHWZW1vb11gw1WKlmeaews2w4MXH5Uf4tB1I4GmuhvButO5E7H62oRNmN6Rc5fDgP9jS6Pn/x3/lQbArGxn3Tsq7eiyHy7AAkUTw85xbMW5cyLj/oHaROpw6NVQc+Go=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783336708; c=relaxed/simple;
	bh=2xXUF1+tANGO4rchO/7NUHjXRde5fmDVApNTawt8okA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nDogcQk5JcpfhYboeBEy7jVEajJsclTq6149xVGO1aa4l7ZKxQHP9m+9XVUrtYF1VuH144rD8YFU3KvUVPb72HNGqu2pTTYWf5W8nHDdZJ/DPrgBgAFVm33xRca8JOUhdFhpXGwUipFFEy5cQYU/JkHI36L5YRnMdNh4o6I/eeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=W7HJPUdR; arc=fail smtp.client-ip=52.101.66.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="W7HJPUdR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0BDwirRAMOB7Nk2IfAoA3bJjk89mT0dfiCcz9+rQB2PBlA9/NLmg+DPyVLehW0BJRNxcC60bIV6luaxJcxMJ/h5IWhy6zwGYN2XOIrzX8mavUnMsNUQCv9wKxd6BYfnoSAtally0Gh8yN+2JdEBKWYAiDyzOTJirECn30KkkB4uAZTZJLrfMyzxT1l7ALGbGlXgaWaoNTa9kX9re3aF/O/fIui4AUvedF0n4Y1SlqPzpwbemBC94VwKcWuZVXbi3Qic0ELzJHOV7gHZXJL0m7uGBKRLVYDMpwROFkwp/MEJG4/GZpUhnEhgl2D64nxTDpunBJ9+pCIVvtBjOV0QlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xXUF1+tANGO4rchO/7NUHjXRde5fmDVApNTawt8okA=;
 b=W9q0NAs07FMogN7l9M77h86f05D436YD4sI9djoF3LlyyzXwi/YxQKLSD3ZaJIYylE77bgULN+EoEOl3y111uzzxejIEwCrp+rvewfp4O/D2mLrjOzhxEEEEb67CujlhC0O0ohL6Ya1OKOXytZ0agkxmjqnugYxqlUFUXlXQ8KJiJSKeH2OtKtqhWxEcnIxpRDH77RPpg+vX7AEVHDP6S/rxjxdiTWyDVng0uo1beQO2OxeFFrZq7NVyRB6eWKdhv20p2/lbH8KewdSDE4uswaizkrcjNZVKq3UW0RLO9vJzNSkRO0CIIXjwj8bJNCWjPVIgG0aSQMRtqbq86eTW3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xXUF1+tANGO4rchO/7NUHjXRde5fmDVApNTawt8okA=;
 b=W7HJPUdRsggvyASth6Blg7v1B6oX3UJaNsAZDhCDiljfDibQS6lM3IQpcld+2ehcWMKRJQ+khyC7+2mJgZtbeF854prlXUK8Z3rl0bBg33o348kudKzz1R5FsepfVECWxfYYYnOhih5T9MDzU580uPdJaRHPfBzi2wl9tR+lvjFbfz+vhMXObP0PTO7l/bKGAjBg4XSh9MI3PvKS4gjB4SnRLuWFZTz0G3iuECvLYMbP1VqZU+Kgsjm4OyZP1x9MXPn9O+C7ByiLdIKhsMIUqrb3M5zqR0uAQIyyaFDWPVjCrQ2b7O0xGBzvgwDFLcD0ig8UQ0zGZItVTv/S50K3eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM0PR04MB12076.eurprd04.prod.outlook.com (2603:10a6:20b:743::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Mon, 6 Jul 2026
 11:18:24 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 11:18:24 +0000
Date: Mon, 6 Jul 2026 19:21:53 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 04/15] arm64: dts: freescale: imx8mn-var-som: Update
 FEC support with MaxLinear PHY
Message-ID: <akuP0TkjaZVuHPb2@shlinux89>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <8fdacc1d5c213685db8552460d04c44e515e85ea.1783330236.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fdacc1d5c213685db8552460d04c44e515e85ea.1783330236.git.stefano.r@variscite.com>
X-ClientProxiedBy: SI2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:194::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM0PR04MB12076:EE_
X-MS-Office365-Filtering-Correlation-Id: 46958528-4f58-415e-63a6-08dedb504b60
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|23010399003|376014|7416014|1800799024|366016|18002099003|56012099006|4143699003|11063799006|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
 GSPU5OlzRhlAOuPch0pePGR0ZV0DrPYUc17pLKegzy/44Brt0vD2SLg8P9yB3my4TXUSY+tzo7OuW7iOw9rC8ZHGX7e0kgMIT+DxaemjoXo8/wZLM4qnFuoew7XSklnIm31FENv1CkM03AXgVYwtWr9qAPhASuLAgxhEFPI02cfBdHcdadWcpp73Vd49s2pYIMCFYfiBEE5PX9g4MtBiaBcQ1p16lmSB1B35zPI5MARbvKn5QiVsxkH6GJaeM8+78eJU1uYt73Bvkta2MLGgJxS0O7niQsrsNm8krggJ7WVZphK7zN0NhTgmDkvNUn04uUBldZpTV6T1tlGtYgMV6/6+5A5eTJkfqVOVJ627UBXDEiS7ePPZwzTuheQJxPgbAqkaj08UeFnRTAqaYiaf9vg0JzPhUDp9Wt2z7D/WnSoHSPGpFhZR/gvigL0Zr8k0w6uscpWG8c1wkkNUh0jDWak4PkU6IZtRcKiAKTac6JC7sCOYsKzKk0Xa+8ZlZLwAqqkBq/pXEUUxPHq4x4bBXpzCKkhk/k06hUz6LgUPUkr8gpeHf3aNXJ+0+QKNryqNdb3lcLGE4/uopXs8mIFwjimbUu9skVbdVuqeXT5WsAJzWCes93UQzXN/wjBOQCMZi3ORZFvtbwcFTITdQ83JH+S9WOxvDg1Yz7xOY4JpECE=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(7416014)(1800799024)(366016)(18002099003)(56012099006)(4143699003)(11063799006)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?rA8SA5687kAlmbpE+SCZvLPgG5wGanRA/Vp0qKB81E2A/tRuokBEoGYCe5jn?=
 =?us-ascii?Q?68qd5G4Dlln7TWRuMMZh02uuJmfGVkTZxFfQRbyZ55OtKa9r91MMCaor9YgN?=
 =?us-ascii?Q?YJrZBLpKr1xid3Ix8TRwwIBcEOKPThWrbpQ2LJMGoin+I520h0r68uHg3spQ?=
 =?us-ascii?Q?P6/6195gSGMyAoS/PAOyqufPuTuJgN4wqVdmxex6JtL5rpv6gLyHAafqC59l?=
 =?us-ascii?Q?r/ftmEO/EhNPkiRWM1U00jjWPBydVX/kHrw4tXobuXZ5RHi6JhhnxV6jK+IK?=
 =?us-ascii?Q?hroGgdat/n1nXvWO2QBnVeSBZG/7FFdEVS9GhNqFMwMmqgJwcjk77Z5yhAsi?=
 =?us-ascii?Q?yfBg3mC396vP9aIt3h19taXV1MCfiaPjzbxjMIEtICG7/P7eHpphsc/gbSZH?=
 =?us-ascii?Q?+tAve0H/tY0Uh4OXYpTqaOycvjz3QJ2BFCb8LPFmEmx5Kvf1O5RwhWbS2LRE?=
 =?us-ascii?Q?fZx+tXQnZXR8WWgy9+5qnDFBVpENUeM1ldwNKzPucFUFJL9KTQbQT+jR84t/?=
 =?us-ascii?Q?pkITX+ErIvA4QaWAd4E0U0DhlXz+pqp1lsqbzv6lgY2enncBLwMYwtqhb+7m?=
 =?us-ascii?Q?kfxrHjQLDEipdJBvIA03Z9OXeO7fXV0V+lyXIvaCREPrxxbQQL5MSLyiu9gX?=
 =?us-ascii?Q?Chu5kcA8aVwfBgXTPjf5KxDFcuHRQKg1DZFaN6gmwSDDhAdwMw1B1dnhcf6c?=
 =?us-ascii?Q?aAQjiNJOJ/adaqtoZs8XZnQZyHnzhOJ/F7ztN05ankqPnSKLjUzMpPaaGxbX?=
 =?us-ascii?Q?I9F5XYhoMVowSutsjnezFcYiIRk0iquhaY1sVeAZzLi+6J1D27r+it9+cZJr?=
 =?us-ascii?Q?AZL2AEQeA9nJFVR1RLL7oTtoUUWDD/tyZDVFVtFUGhhpAPkhaTUO3JF6u5as?=
 =?us-ascii?Q?KTZCAkU+jrHVEyzsQpq077w9RWqdRlTDd6OJKfZMN7944uL2JCqCO1nKLPqP?=
 =?us-ascii?Q?Dk0436fH6HHlqwLNqHqb3g8acPsZH7kYXgOc+lJ72C4RUO5E+ue5a9IX4sG4?=
 =?us-ascii?Q?tLpiszxpoJrtwRb1jrL4ahoZfF3Yi/LhEt+DbPB0Xf4uUD59QO9wd8tA0IZS?=
 =?us-ascii?Q?cXYNOYVUcQ0hCLuZ159+I25F00m8/wfgVDHD7wgHrXuVbxB270ELdqGy5yJV?=
 =?us-ascii?Q?mXDPw9dXNvuQPpvNHlLIwtcZY+e2eKy5ziEOJ3lcPEOf+babQkl1CKma8gu2?=
 =?us-ascii?Q?R6QrcgFk9+ZKnUQpxAsyVFH45+MyE0+1Dt4RklAK5efwFfMbvnwo8VHwGxmM?=
 =?us-ascii?Q?ymp3HT8vVBg1FFauDyLKgnhFbZTF6apLz0OE8VslAC4y35dkUvfsYfyO11Kb?=
 =?us-ascii?Q?HKCEAHZkybI9rWymSlidObUif3gCVBHjyr/JHG4N6w6aH7/vnrhgmuLJAmTd?=
 =?us-ascii?Q?AxMkRi9l0uQjGkYg4FTDnqQdg6mt7y3NBrSUcq4QycfE78Fy+d/OO/tG7RWU?=
 =?us-ascii?Q?eDQ6pHaQy6rtb/8pD7+MMTJx3XL+WJLLXdoOwAOJHOwd5bkq1uUw/pOpb2h1?=
 =?us-ascii?Q?Uz6TO5DHuAOug/Ubtsu/ZoL/iLTz3aFPpeENFA5+RUnCBaxzLOoHry8zyUJJ?=
 =?us-ascii?Q?pnXLOqydztfymOvAqybpaQwsZT9bCFnHK3F9m/5LIRQzevAJ70L8kJrll3zo?=
 =?us-ascii?Q?k7jbmixTaEJGhyLMQwnSPAzgaFLBQT5ETMAKkVnJsIUe/YRur6uHaFifyW9G?=
 =?us-ascii?Q?jUTx+V++WED0b3FA6EOvQNU26QYM3LynUKDUI7LwEi5+p90mWpU6yvdlsCTC?=
 =?us-ascii?Q?Onf90iGssm8w5HaySkTqyheAIpo8xe3kzdQvemfavsTE/kpEXrvC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46958528-4f58-415e-63a6-08dedb504b60
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 11:18:24.4340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6y6/BR37bdAz6n31Qn0xjqoHIRvoPFVqpPwXz0Xxl5NL6vwC/Wphyw0vRrtXOzhQv2c3CtPOF3zaFiZtsmqsWc2Mqtqyssg5FgTsWNI/6LRjqDxei6fLkXONYYPoKL8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12076

On Mon, Jul 06, 2026 at 11:34:34AM +0200, Stefano Radaelli wrote:
>From: Stefano Radaelli <stefano.r@variscite.com>
>
>Update the FEC Ethernet controller on the i.MX8MN VAR-SOM to match the
>latest SOM hardware revision using the integrated MaxLinear MXL86110 PHY.
>
>Add the PHY VDDIO supply regulator and adjust reset timings.
>
>The PHY LED signals originate on the SOM, but the actual LEDs are part
>of the carrier implementation (RJ45 connector). Move the LED
>configuration to the Symphony carrier device tree, matching the
>evaluation board LED wiring.
>
>Wake-on-LAN via magic packet is not supported at the VAR-SOM level and
>is therefore not enabled in the SOM device tree nor in the official
>evaluation carrier board configuration (symphony).
>Designs requiring WoL support may enable it in their own carrier-specific
>device trees if properly integrated at the hardware level.
>
>Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
