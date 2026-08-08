Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazon11021125.outbound.protection.outlook.com [40.107.39.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A957D355055
	for <imx@lists.linux.dev>; Sat,  8 Aug 2026 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.39.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786184003; cv=fail; b=Qi9NAIboDnGGbA3dHH4AULj9nsX9+rOnf+B6VxDVWnfb+91CEs8KVOureiaIL5wBRqBDBA/nOe7mdhMAxzV7JQu0CeH3lyRC9p5HbB3BRXYKuxnGaiVuryRxut/IfVLEOmt7RP/RnCqbE6AoxWiVud/gaNIyj7qLSe2q0plG7oY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786184003; c=relaxed/simple;
	bh=1uZIKicCyPfOg1WkYhzTNrA+8ecgoqw3e1vVGnrfE0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qTVSOQEQmkIItTsqhCiP1SIS6uGhoJm76tuRVDNj7/9cTjS5rO9MqJcDkjMTkve6MwMOjENUBaGZmIwUsridiBI9YEGFbGIdmLvRDpEIjWyFJeXamNwI++koptOd91s8xD+kpM4u/7EocfnE3ZhLq7JosHpygulSEvpPVabNY7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com; spf=pass smtp.mailfrom=heitbaum.com; dkim=pass (2048-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b=I7euVkOn; arc=fail smtp.client-ip=40.107.39.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b="I7euVkOn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urTqkaPxvM7y+NQJ1IMNSOyiC4uC/gjYLwNIsPEkMYu8oHhUUqz+GP86ers5y0aLDyOJoTPpMOwohVJKujNVyBvObJYf77ysuSIeJnn0kr92V9mRQt8nJtR93sgx7cTB3iHXeJYNTmCydTuAvc9ii8Z7E6m4nUk+kB90EM9ndTwzVmC9B0kvfD3xYAPvnvZW3D9cMriBhOp2V+TYKPT3YvcJ3fEffJ+ZanMpXyz/QaMowwY0weCOHhp/CFyH48Num0lfxx4Dq8jLjNTyspqWmlGF9F8HC/5j6GRfP6zxTKOd/TVhWj7Bipa52nS+9dhzNKNNWeHKXwRcY4zP+GUzPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsL8HJwNPx/+ZnqDF7GlSRi7BCicmwISmL6dOyhHR1w=;
 b=LnFxTiR1idZoH5MoZXwa0lRXZoJDnZsniuhVqs1Im3m/JVqfAKhu9gclPhbwclzawe9leRwRkOEOSmEz9vFhQBANl/rVAvx4Z75It2RLVqn3oJTtrmxcAZXRtixpChH85+etynxWMv6mj1z7x43OtzQhb6pbK7X5K+fK35Pe9FH6xVLguXpA5GhhuKGiBaYpry1STz9QIuHV7fExVqgN7YXl/mmzWUXdcGHZu1xrvHBuVSAnOTw2W+01O4FCVF4rnQrFb9gPqsJVpPMN+BV0S910/emB0NqvApC8eDZHDgdcvCGq2RLzQes388iQ29kvFcMBfmlT8wvgTaONU6Fh7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heitbaum.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsL8HJwNPx/+ZnqDF7GlSRi7BCicmwISmL6dOyhHR1w=;
 b=I7euVkOnrhOWFP3tCSJTJxj8yESh2QDytcXiNZEYhYe6UK2v9OkYFjEWEF14s7D03uaDLfjCBwjdOQXKrD1mv7yFtr21F8fDGGh0tEPoh+mv+0VLVbq1RxuIxCvGW8FG8Tu1WxJR6tVPa9PmY+/6dcRTcQr/Kh4nti1o3ZKQQ9GtrmRArrk/RQWDSlbHXonZbqiu5SXiJOs6hrogRPhooyZkgOQQDUGa7KHXAlsJq9EYh37sK0pkICIWHtEBaLfKWPAJMsZ3QW4VMXbJ+c7u6VzBPkbCsKmPxM8EWUQfSiN4dnHg+GDs8/umS6cmbmaOwht20uFKtzfbgO2GzwGMTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by SYBP282MB4053.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:1a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sat, 8 Aug
 2026 10:13:17 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0292.024; Sat, 8 Aug 2026
 10:13:17 +0000
Date: Sat, 8 Aug 2026 10:13:03 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: imx@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rudi@heitbaum.com
Subject: [PATCH v2 2/5] arm64: dts: imx8mq-phanbell: Do not hardcode a
 cooling state that may not exist
Message-ID: <0190b6ef209df3e6dc0a9dd2d399a715e5cd1e54.1786177290.git.rudi@heitbaum.com>
References: <cover.1786177290.git.rudi@heitbaum.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1786177290.git.rudi@heitbaum.com>
X-ClientProxiedBy: ME0P300CA0033.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:220:20b::26) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|SYBP282MB4053:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f9f493-f147-42a7-4109-08def535aa4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	JpnKzf1Sb9qLtm4rZI3ORH9g37ZU8kylOMyyck8EzxF5HPucR/8Ib+GrXWsSEpLgX84aSyjc/lgaBw9Woyfr53Esz/uGt2/WiZKBmM3KA+abkVmCIPA6V259w1VllyKaE3hJlG96gvLJx129ud+3ljFsuqwLrghSB8OlxgBDgKD/iaFxia+YjleuOkEWlvz4MA0PSJM345vpfcR9cRzZjRcqZdxX9NG1kz0Jsi/uWODCZVmQGciA02+MEjXTWDLqVRJtjVz1p6RcAJS+eljkclSr/egLuS+ocxXAcblM3X1P561YJtsJ5WFq4zMncTYDqZ5arSFbAmLLeStoo0+IniV4O1or0TPXJEIxc0tC5FtRegwBvjkQQCTSo0iIs40pcNMab4xXTUZb1juf7oTnJlOysnTenndUOOBFeXRglj1zRMPPPO0QaSpK1ozCA5EG3G83MN3LHkpK9vTCQi9AhSdAAiMVZDIhiOIXLcCiYUxAdurmR9W8F4+Z7qra2sZOmTf/XYDcm9lo4NgEWa4qqTNRne9F/0+ajKfzl/XNgqLtj1vSeqh4Wd7GvNknAo3gDihs3g05VQuw0U9xQYWnyZshyrtR7sbqS8Kk0ze/UNpR+REHS1AMsK9cUHremxwosVLnhl/96wp5LIQH4zsRnQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eLRbcXGMEERq1Ok5q2SaD8bkieS1Pz2c5TOG5qCNy7H6t9fJQ+znIBnAlTGY?=
 =?us-ascii?Q?RY1yQDE7vnPy6ywRjd6Y72qmKhIwcgN3w8BRji7ZSrHbFw1Fxu21fV3t9WJd?=
 =?us-ascii?Q?wcIZkvEPlv1KpAKyZCtMwloR4yMwKwerdi6tExI9uCpLYp+mgAmGzWZN3njI?=
 =?us-ascii?Q?Fx/MiYADy1+/mu7mtYD3tPQD43cfuNCLr2/6tl2rhyAjI1osSD444VFAFL+N?=
 =?us-ascii?Q?u3Qc52UioHt7kgnmLQf0Yin54ot/H30sXYSlEIM6H/FlFU+ENV4QHFwu6Poe?=
 =?us-ascii?Q?fjnne5Uv1LUqMXpojoiqXnVJM5aOVbDmP9AUvzC4hsubUNCu3++0ybjQPYmY?=
 =?us-ascii?Q?Vg3OvN6au7li6vMAHqda/1VbRoU483ROOLsOg7per96rfk4aUfH/e9urwzoS?=
 =?us-ascii?Q?dfiD5FZY9nx8ZKfoJkQ7GCEPjoBdr0rVEmgteGWmZSAwbD1KcpJIn0CIqHPI?=
 =?us-ascii?Q?/AVUYbuqfypkdCABCwuFgyMZzTg5T9VDTm1t3yeNkaMvELSOy2ZGkGkF2vsA?=
 =?us-ascii?Q?bhEKfasloObBRgTLNL3+56X9beaoBUYQcfOGuMb2kcXEHrMbUIKNIdzCGGZ5?=
 =?us-ascii?Q?JZs5oTxbWZjE0BtaHZ0JsGDYp9dVqq3IOS98bbeU/k6XhIz0Tplf2DHBCdwi?=
 =?us-ascii?Q?EyyEDnxAQCzp6+MfSVLNfbyiJVaKLe3Fp1NYjoChzT3r90aTqmCnwctxMU0f?=
 =?us-ascii?Q?dibn5YKTxLWjxoITlooJYpv8tuGhgFMLgzk6YXBTBlaSBcPwwBTTfYzPpEAP?=
 =?us-ascii?Q?4ZnzQM60amgxxzVECxczRut+8ujqdaqJ5kWYjTNSLh+4zHZ3LLIoAl2nbYQx?=
 =?us-ascii?Q?mMRuDfYfRIvSfwFDn1mK6aMob8u2lW7imCuQflNPkN06jcmB4jUQaF5NG9/4?=
 =?us-ascii?Q?p6RxAYuBqD22y9RlbyKXnusxAhZVIZLJ3/k1/mOgipHgMwwUbEo/H06nKZq1?=
 =?us-ascii?Q?3tGSmCHRS+Y0jnSIb3KVDNJQHFipGc67cWbEismnfxATp0hvRoQDxtIqOwtV?=
 =?us-ascii?Q?7IvY7PecobZytVvoI9TqNSWsoZ1s6Rdg5b6G9EfmZli2u24Dw6OSbCFoUyLz?=
 =?us-ascii?Q?+J8Xw8nHQDCOz0zAOcCPb9uYP7PvYtWO/HWikzeExpH877ONEHaNyvEOQCs+?=
 =?us-ascii?Q?8i3lxITfwSAl0zoP5WFFzf7gDhW9xhb5lTAnX9WL+yCrVIgDYHgKi/dwZtSN?=
 =?us-ascii?Q?o5+kjfiMfPmjnbhaid2Y+mtF2uLCeTIOM2qWmtVFQHvleL0umZ7I4taVsgkf?=
 =?us-ascii?Q?CEoWnNpiyj3UmVlVq5duZ4YJcNqTRRFoKXD8WSEvvvjciZak2SzSnAw19Qsz?=
 =?us-ascii?Q?rATKHiXsLkkFWZVAG1+rtPU3+S/v8weQ93BGWHXSGySyQWK4n3aHs9FghqQP?=
 =?us-ascii?Q?61LApMes1CpVG+lTfxl0THrbyUkOMpUoC0Xa8WgcDpUgItLChok4H6Z0k/00?=
 =?us-ascii?Q?s7Ali8CeeJRupASUQhiQ+h6rQVAwwNFE6H6l+OxfpZmg9nvpgFyDTG3q3Yx1?=
 =?us-ascii?Q?KyCK/ytmcrYKpN9Aca7mZQbC1DuvDg9PJDZ0EHsqKCkOwrPnGYdlkG8HbJQm?=
 =?us-ascii?Q?9EEWr2T1hxe+wkoOGuYIHimMLEEVfWqes/ZxIeAHVk+01TRlYGUnPHwurApx?=
 =?us-ascii?Q?Pblc8buD/CJnP1SuokxEgLNJ2Zd/yOvee/rc9gFnBX0TX7pv88QI/29jWva3?=
 =?us-ascii?Q?q2ML7ghtWvzk1YwUydx9OsT79GHErL+fzBmaxURAX0iSPdSbExjTZl6b3/3M?=
 =?us-ascii?Q?WsFNCw2gBA=3D=3D?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f9f493-f147-42a7-4109-08def535aa4a
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 10:13:17.3101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvAyWv0i2XHZbRc2kSLuD/I2PYm2zqMLD9rym24M6xUd2FgINDQpKuozMxlEbmbghO83Z3lqkgBxxQppSPkRCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYBP282MB4053

The cpu_alert1 map asks for cooling states 0 to 2, to exclude the two
highest operating points. How many operating points exist depends on the
speed grade: a53_opp_table gates each entry on opp-supported-hw, and a
grade 3 / segment 0 part gets only two of the four, 1.0GHz and 1.5GHz.
cpufreq-cpu0 then has max_state 1 and the bind is rejected:

  thermal thermal_zone0: binding cdev cpufreq-cpu0 to trip 3 failed: -22

thermal_bind_cdev_to_trip() returns -EINVAL when upper exceeds
max_state. The trip is left with no cooling device at all.

Use THERMAL_NO_LIMIT so the map means "all available states" and adapts
to whatever the part provides. On a device with the full table this is
still the hotter of the two trips and still allows more throttling than
cpu_alert0; on a two operating point part the two trips coincide, which
is the best that can be done there.

cpu_alert0 is unaffected: its upper bound of 1 is valid either way, which
is why frequency throttling worked at 75C despite this failure.

Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
index c06a787a4013..4ad206f5a9d1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
@@ -101,7 +101,7 @@ map0 {
 		map1 {
 			trip = <&cpu_alert1>;
 			cooling-device =
-			<&A53_0 0 2>; /* Exclude two highest OPPs */
+			<&A53_0 0 THERMAL_NO_LIMIT>;
 		};
 
 		map4 {
-- 
2.53.0

