Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012000.outbound.protection.outlook.com [52.101.66.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FF23F44DB
	for <imx@lists.linux.dev>; Mon, 17 Aug 2026 12:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786969946; cv=fail; b=OJz1zpKRSX5lFK7Y7NSv8139ooCzNIWW5brgUxEvA0G/VSqEu0b3wxZKDdgtPOxxfzYRCdV1Xbh2klAffvfqflmIeSlLp4a2VM1GqoV1Wca/tp/I1wZtSM6vChXHx5XVEJrBFgbMfK/vjuK+Qr+VvDK6iVxwF6mr1Bs+OwVnCE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786969946; c=relaxed/simple;
	bh=X30+MXRrYgLDWd5I6t0bGtD3T7c8CWqzLcN7Bifgyf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LGKpfALwhQT9QPlfyvxXcA2pJsB9zISPFglFKAAymXaC0/navV/BmD6e8+LcA4XFgs3xFxHCFXjOaT0TZNYWnSIMwvUUd4CfpumQKBCDvPReJM5NntXwcx2EE/EY2z3BogxgNau3XoZvjdvVEIB404liHHakg3J4ACIlK9QOqy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ml05K5dq; arc=fail smtp.client-ip=52.101.66.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ml05K5dq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMGyNjmvI9XLSMrP2ypuAtQ+LrTRleciF3CFB6Z6g6/NL2cwHTyqwJU2b7UIIzttHpA5033jWT4zMCuFryF+z217C4uKBjJTZFlwpikzReGvGA7FIxSG7rWo4rbNx07HFLC++PwH9tGGQX5HeQ4Ijinc04VcehT0Pl50iF7VvUGtHK2tCnUduyw4XKMXvtkbe8Eb/UJHW25SSOTV4jUqhlikEfdZn69lu48JaAq4pFOoC+u3Ec4kXVI8leK+Bk84rQ6vkyMXr8+7xkEufR9uf0XHHwl47jZxDG7a6w/dBTc7tq8UN6kfHxAQzoRJxv46z01Fkk8i8aNmAKa0GWWJyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHDHkEDtSJmoujyJQ1CupMdOF64KQ2b/gfVqOwBOop4=;
 b=qyQUB2u23SnqiO5QPL7v0Y6FQieciZkVKgHjAwZ9FtZsh7Ln9HEqrX6rHSH8pmrJ4OxYLG/xjEMvY9txt3uh0AYOyoCbV/WhP+tYrfhGVD7B7rHWwWN24A7K9ZkXlzG3fsV16qTiM24lpDW7Sh0COmpN8FWRTmEyHRVTBGGFVhDzBuAK2GUcyTpNvJpAdat+LC0L+RHnkhtORCU98ou6zQTLZNiKdB2RVWyvAuDrflz44P+AnIcwqDNRXF7fnBrU/G338hbjrH9/4JmfcyO4FxvW9yn+/pF77K2IaL7RhezqngdnjgSexxUmkln8u1NFWxNWWaxlThJT9ZxIaqhIsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHDHkEDtSJmoujyJQ1CupMdOF64KQ2b/gfVqOwBOop4=;
 b=ml05K5dqMLjhJ0cKEQY+7cqp+EfZH9KpuYM83TdEDxV3ccbbBcUpn8s14RVA/CtyfhZ71iK0D63NQ1HK4ZLcEpqws783CPhFLl7tsMcYKa2QYPw2AsqYzt6Lbx0IZ1Ine4hjwUiX4CqGKXRG0sDPMMUwNowFDfVvVlSXeAVzS3PE6FyxC0MASq6QYY2ag57aYVS6T7tkQQIsoPoxGdmI3/wuEPc8sOQNwEhuzrZwlboYB+pgWpk7AdJ+oGrWy3FGbH/hLE1Pb3BGp/P+f5iSei7ZgTUi+TCril33YF4zOutDbqjB2uMPy6VqbsH7IYM+c6cflawv4RqnrsRPhIokFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MRWPR04MB12331.eurprd04.prod.outlook.com (2603:10a6:501:83::21)
 by AM9PR04MB8650.eurprd04.prod.outlook.com (2603:10a6:20b:43d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 12:32:21 +0000
Received: from MRWPR04MB12331.eurprd04.prod.outlook.com
 ([fe80::66eb:ed06:314b:992e]) by MRWPR04MB12331.eurprd04.prod.outlook.com
 ([fe80::66eb:ed06:314b:992e%5]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 12:32:21 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	nathan@kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 4/4] soc: qcom: ubwc: Fix missing include
Date: Mon, 17 Aug 2026 15:35:41 +0300
Message-ID: <20260817123542.48475-5-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260817123542.48475-1-daniel.baluta@nxp.com>
References: <20260817123542.48475-1-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0254.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::16) To MRWPR04MB12331.eurprd04.prod.outlook.com
 (2603:10a6:501:83::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12331:EE_|AM9PR04MB8650:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d4df47e-0cc5-44d5-7d6f-08defc5b957e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7733PT9dcWxFav29reSjhLnLFbCjmLP3g+2+Gm5hEeGjC33OLrVV257ZcHZTp3BqjQupX7mbWkCwwjBNZE5NbqWHawA9Mh6yut411yOo/om28/qQC42CkgVydqSjLW8l2yruDcPYMONoDhtoZJlZoUl1Puidjv/fBfIS7aZ/M/OEjrdLQTwE5X4ezTJyDVYz0dqzMxGzb5sPUM9OyTPgNJxa+d54KeakgHNDeovtszKh8J3Yc5KF5eS3UhBKH1B7qu0h0+f9uNJTbs10+cudBM7TjB0i/xv5DaJ/eYSlL1F74g2R+/hE6+Qiz7IawqJ5fbPeRq/vOxP/VJ0YBXOriWh4As6v+tni01qLiKI0t4Ikg0EITH2bh6Bil1+gjhq/u/AIR0cndoRf17/T8BrXeKsTJmT6iGUDNBNIDgBabYcgmTET8Z3T47xw3Bb1U4Y34pl/vgHZCQnxC5wLTdAqMJ6zTOzjV1akmSqlWRBUWAv6+6kXjOY0Liuer+rTyAnSI7LElPHk29OhtGNlKh35Tkk9FBpWTRbwuTX+erPLxVlEp7JNH+XpCVr6waCpuJ10HQUHGczjRRHVkEc64jdBl2WgFrm5Bwv0UDcUxvCqUhx63BLMwk64LnxqolVRPcN/4gGZHy3Y6iNQaJske/LmspdsUXdJV44plNXwhLbca0E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12331.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cldCWFkxa2RFMVNYcG8wcDc4N2RTZHhWTHJDam5BRzhLNDhuMnJqSmtUNGRN?=
 =?utf-8?B?NUkrajVpV1g3SDg2elpkd245V0I0d00zYU1ndHBCdUtMWkV0RlB6YjdkZWJk?=
 =?utf-8?B?c0xhbHBnYTBhcTg3SEhDZ3JVMUNra1dqSWlwdVBQdVZ6SXZ2TERlN1FEa3gw?=
 =?utf-8?B?QmwzNXRsSTZ6Y3JZSk5PL0xaUDdYVW1EVitYcFpYMWhrRVdubXJva2MyZS9u?=
 =?utf-8?B?TTFQUjZleHZERHRMbEV4aS9sNkEvMFlUaGxrNHg5bjUySVRKTnRhSVBLSm05?=
 =?utf-8?B?M25JTFJrVGl1c3RNSTV3NHF1aTYyQzFTMysvZkpWL2dYSlM4bk16OTZRNEp2?=
 =?utf-8?B?UCtvRm1WRFRPd0o3aTViZnZDNTE5dkh2SkZnMXBqQWRQMjJiZ29IU1dmSmJH?=
 =?utf-8?B?Q1RKZjk2Y0lZV0o2eEZVV3p3UlQ5MTdvbUpQbGxLekJTZWZsbC9YTVZBanNI?=
 =?utf-8?B?bWxRbmtpQVNzTlBWNXk1aGppRU4rNWI4LzloTGRXb05rTzRvTmtvWGpZUitX?=
 =?utf-8?B?VHptY3hqRjdNcEJTQWE1OEFJTGNMb2wxbUV0Ukt2RzQ3TUlDRjg1eENVMmZq?=
 =?utf-8?B?V1lXSGxtay9oOGN5N1dRQW85U3gwSUovTWJ3RGZLeE9ZRU5wckY1VzlGL1Fk?=
 =?utf-8?B?TUsyOEcxR0tEQyt2Z1VCZTJsMzNDS1VTVjdkMGVuaWI5OHpqayt5VmZSRUJs?=
 =?utf-8?B?OGc3ZEpQTVNFMWd2c2V3VXNlRlAxeFdaTjVkcWcvdlFKWlFXTmpBWWMxRVYr?=
 =?utf-8?B?bm9idEFiT2JxUkgwUnJOaUNHeW5qcHh0Ti92aHZWNTBZalNCRWNWZ3FmbTFs?=
 =?utf-8?B?MS9pK2ZBT0NuTjV1WXZsU05Gbkwvb0Y2VUI1WG1obFZhZTA2STV6Tjd2LzI5?=
 =?utf-8?B?THh0eGlmdDN1TGMwR1dSdVpyV2tTTy9qWHhJVHVuTnlzMDRTMkFaazRyN3dO?=
 =?utf-8?B?Q1BIdm9VUEFwZy9RbUNMWk5vUVpzV1daeUppZFVsMkpzYjc3bDh0cVNMQWVR?=
 =?utf-8?B?NDNJVVpUMVVQdTYwck9LMkZVdENramJDWklSWE1LYkxpMGFYSDYvQ0NFQnRU?=
 =?utf-8?B?M0poMlV5bkJtem5iU3BtZ3IwclFPNml0YkpZWXFSQ2RBVWFEWEZYalZUMXZ1?=
 =?utf-8?B?enZ6TGk1Ykt3VVZLM042RW9LZk5QRnM3ZVJSTUlZcnV6ODlacnk4WGxDWm1n?=
 =?utf-8?B?WG5uN1NiS1ZlVHcvKzRxZDl4dUczV1NnVExTNjdMMjM0ZzdxbzhKS1dsUU9z?=
 =?utf-8?B?Um1QaGR4S005SjRoa2RuNzRHdFFYOHhVZmhuWGJ3V0NYaTFqTkVyZkNra0NZ?=
 =?utf-8?B?cGJ3QUN1dUpPVUVqWVpIQldxcm9MR0p0am1DREZkZUtzejcrWEhMc3NxWVFU?=
 =?utf-8?B?bkh2NEtQWlhEYXpVV1k3dWx4UkZRT2pGQ0FIcDlDQVpNL2xId25LOFFQNTZ5?=
 =?utf-8?B?SVpiVGZ2elZaN3NibE5ycndHc2dOc3R3M2lvNk9abHhwWUlYYmV0QXMvMFRy?=
 =?utf-8?B?VjVkWnBKL0VOcjlOR0dXeXFxdUVnbFBFQTdHOGY2dFpXRFZSQkVLa3BBVlJV?=
 =?utf-8?B?SURoZ0txdDd0eG41L244bWRZOWhvSVZRcExBalZqK3ZYMVZYUzk3N2JqcXNQ?=
 =?utf-8?B?dUZ4TCs1REg0U1RvTTZXcS81aFJ0ajVNOGcxdmRTbkdwc1M2TE5jcm1ZWk1h?=
 =?utf-8?B?bHIraXlxOThJdlp5K0dKTVRrbXh6bXQwdkJydEdHakxzbnQrVXlEM0pLOXM1?=
 =?utf-8?B?MHhib0s2djhIMEdNSitqazNZNG9HaE9reFlVNS84dGk5aUFaNWdYd3lnZmVw?=
 =?utf-8?B?R1AzdEs5THZ6RUZrQXUyTis5SW9JYWdxd1JvSzNOeDk5WHU5YXVIMXI3ai95?=
 =?utf-8?B?aE92T3ZrWURydGQrcVBkcXAwS2tWeVpuNUpnSUNmVFRXUEVNWHdLMWpYN3pF?=
 =?utf-8?B?Vk1yTXV2S2hMNXdkeE9ZVDlYenFYZWZhRitrcjB6TmExbUlVdHFiN0FRM1hM?=
 =?utf-8?B?ckU2TnhpL1NqTU4rbit4MG12NExPMjZVd0V0eE5JZnM2cGk2dkRxNzJxWUlL?=
 =?utf-8?B?ZVlrRjhjMklaMUphbVlnZG8xK3lSeDR4RG5FSzJyRXpvOHpYK0twV3FNT1BL?=
 =?utf-8?B?NWkrblBLWEMrSnB3OCtoOGRMWGlEcjF5YVNFSTNyV0tNSy92VUJaQXMwTXBi?=
 =?utf-8?B?ejRYdFFsNjdpNDRQMHFKRTN2SWlaTzdsQkZTZ3hPa2tPRTBad0E2Q1pyS3FK?=
 =?utf-8?B?c2dRb1NFb0l1bndCK2dWYWhzS01SOU85TUFta1BGYk5vNldSRnlEdWhWYVFG?=
 =?utf-8?B?TlVkYk4xRjVIZ0luWkE1aCtoSFo0blN1OE4zN3BmalBRNzhkV1FMZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4df47e-0cc5-44d5-7d6f-08defc5b957e
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12331.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 12:32:21.4481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BoX8cSf2eVtsO0VWD7zZbM/sDASAg+xMTeLGbZhFzx3cYNxFJM5808gaZy6p2xWfcN4BkO+5EP3NPXN1qdNfFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8650

When CONFIG_QCOM_UBWC_CONFIG=n, compiler needs to know the definition
of ERR_PTR otherwise there will be a compilation error:

In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:7:
./include/linux/soc/qcom/ubwc.h: In function ‘qcom_ubwc_config_get_data’:
./include/linux/soc/qcom/ubwc.h:45:16: error: implicit declaration of
function ‘ERR_PTR’ [-Wimplicit-function-declaration]

Fix this by including <linux/err.h>

Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 include/linux/soc/qcom/ubwc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index a7372d9c25fbc..f3a70360b177b 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -8,6 +8,7 @@
 #define __QCOM_UBWC_H__
 
 #include <linux/bits.h>
+#include <linux/err.h>
 #include <linux/printk.h>
 #include <linux/types.h>
 
-- 
2.45.2

