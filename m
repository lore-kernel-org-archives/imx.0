Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010006.outbound.protection.outlook.com [52.101.201.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1F73E7BBC
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 07:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495094; cv=fail; b=t+BtwxuyHa5YSbNyatJlx53g0aMBC6pWYVeoPrv/QAXVk+NSnS0Jl80/D9f+jJcNIrVEqgaTbEgfa+yQhhb0lEGeYAx3bRodZCJkJxlR8emLtXBuEG1OwaAb3bixnDRwqhwjul1w6l9DE6C327KNf5vZYUGKExBagr1vhcyKrJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495094; c=relaxed/simple;
	bh=ik8mlKqgFZNWegUCt3Q/ATZN3v2qE56qck0cmxBMOZk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U6Pozge3yloHpQ3/BxB75a6zqIuiOAh1YWtMxFYrEyyTZI13sn58UgiVjzyNKOKFoFaje8o1v6mTHLfpilgBLKLtfpGodD4aLsokrCuaDdl4W30Vm1KpRMCg4SO65+PeHEx7K7I7QOJp+BvdzkoddpUpP1mCzZxneVO3+6YrWZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=WETqjSps; arc=fail smtp.client-ip=52.101.201.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="WETqjSps"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3JNBi+jdx2jjV/+iNsUeN9NJyjCyVm0XO95K37uLQn8svm6Y+dnGhjaSiFkGhyvpXzcSCmUp6O+zefrcutbwjnHfdTUh8z35D1BGQhJHdwC55xiwWO3rgBspdDWyaa01wWJJnqMyJFWfUujRmjTCdGL6fsNW68PcHLT6u3WctXCuuhlzHZiWx4rM3Gr3qAVR2rtmhOH/xOiGQOIlkniun5mlo1nYydeHpooC6w5Mi1x31v8OLOR7KyLrdkN3ma/Wv8BpDgKAEnBr4KZ8SkmlWnnDz6gqUCYvsevAUxTwM6tdwKR/X+OOiKmniTc24T9T884Zin4R0e7zVyXAUlgfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFK1IVui1LeOUM2EFqAUApTUQOVl3zJTOmCgCUK2tik=;
 b=C1bLjqFDBRUa/y8h1YegyAC9ETwa3gPO/eOhhuIi7cTcjyqPnOdjEjXYm0GhOWgMuY5kSRnuPhCo87sXxqa78fLupI4S4GrdGh5wOGvjOLRHzKttlYpNu5TQ7xdqSsHywc0P7Xd/KXOgg73ZIrNMiNbxwB/yJNnLNQaFGqqzZO8OeURpKxvO3Z29SOyGu2zQriZjkf/0R9BSsfCxAV1fSdkiaJXF59t/rVgy/X/XY27QEpYS4oyzvwr22E849vJgUEggUWjdQiZY+cG4I2ndZTJtvzj6UM/8TZ5GrqfrkMOB9CTT9xtKU/K4qUt9+j+l3+Ron8Orw1eiaxP2sKKJow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFK1IVui1LeOUM2EFqAUApTUQOVl3zJTOmCgCUK2tik=;
 b=WETqjSpsZNTh8Mfy7hF2jiqe4HI2/il2+mNZEHCZ7//2Ry58SVXzxKYfqVqC3dk8ApwHgMlH6+Y5E7alogELQiG9IP9wCn++aaMZ+6iJV7F01to4KnpBoWV1PSTKllRc813fFErfzN9u4KNvFKiqWv9KI1Nz6yl8Vtfoxan258Mk5Eoklvo83NcXJVhqsvcTTRry+4ECVsJZFdYFKNrvZ4kGEZ4scW7THv/gDM/uxSpisZOa4hE3YafnIf4GYqPnQ2xDBzJ8HFgODN28YIgaKN9hrTQRwdxQxTFTu3x7zEk4KwqYFeqb6V2I3kHw5cghm08ZoKba4W6suNySYYIekg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by BY5PR03MB5061.namprd03.prod.outlook.com (2603:10b6:a03:1f1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 8 Jul
 2026 07:17:48 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 07:17:48 +0000
From: tze.yee.ng@altera.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jorge Marques <jorge.marques@analog.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	imx@lists.linux.dev
Subject: [PATCH v6 1/5] i3c: ccc: Add actual_len to struct i3c_ccc_cmd_payload
Date: Wed,  8 Jul 2026 00:17:37 -0700
Message-ID: <e452777c3a9be734a97e20b9822d8a4264ceadba.1783493868.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1783493867.git.tze.yee.ng@altera.com>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0154.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::9) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|BY5PR03MB5061:EE_
X-MS-Office365-Filtering-Correlation-Id: ac805670-f0d6-44c7-5d5d-08dedcc10320
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|23010399003|366016|376014|921020|22082099003|18002099003|56012099006|55112099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	kBdb++o06wsqux6hJm8a8JaLPKPny5uSDWYNfvG02xNhcGnUuA/k87Imu2Yn8Dvqh7j6lBt7W83bMtfoaT/RVKDxqVcxINYCDbDihnzvMvRxyG3IOcWsiWM0AZhJuYsZPgkq9rk1cfFBCkCqFfNTlg9Vn8zOVdw1Kd08UpvGNaEklW5ccTnlmWDCsqs9HXOBrIVhXFylM+0+0YLhRyAJNq3ifj8HhV11T/NLjKKWaBvCcadMK7wLebWcCRiNwmkAatRKmB+EvIp8ozaLaSkTqU9nJyb2cW8HP9GCoe35MMwXBn7c1iLOEv5Fl6tsGME1tsNewZxL8Gwy5cDP/Jy0tgJ+fMUPrLRwOYiR2keI9LtO+2j2VofTXdNqEespSCOBOAc8QTZC1Y8YMP9eluBc+Pcgxa1ZUt7tBbUn7LF0h0eg4b4/+krW544U7O9z/oeAib9hbFOHzby9WZ7ypZJJ24TBUqlCfzMgdRj5QjKp9v9dJVRbsGJOXnfwIYM1yhXUKseqKhI+abDfk05QGJJvaHYP6cx5aZS82leO06YAb2oiLkwiG4akAXHvNN83KIgFBLWyH+x7AAO5KPnOYIzokhE6KKgwPgSG4swnhyvVR6Ckj+ffdpbdy8Y/YpDWPdyuyI983Dd0AywsGG8WYyfx3bJErHUJmwLYUdcK1kE4vPDejzH3BU8oQ7GeGQVmNXqH11CDBuL6ZubEdYE+dmezuQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(366016)(376014)(921020)(22082099003)(18002099003)(56012099006)(55112099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qlyiKjGut5m2+/ax9hxisSjPtIMgHgtkn+6XvKzFoYfg8ZspqKaSUKXG+Y/C?=
 =?us-ascii?Q?I77s6fZRt1/UMQAZN9gfTF/0d5b0C3DFS7RRoWK+JJRwBidU39QUMASc9Jhz?=
 =?us-ascii?Q?bTldbXoMSZnyfvp8nTR/SbOCFv6FzHAlW0BNgKIyvw1TozNenQ/4ZnpObr6y?=
 =?us-ascii?Q?hoNfXJNyfR22xTt8lp8EsDhoV2noyuQY4IFrA1Oe/tua0tGIJeXbLc7gijYb?=
 =?us-ascii?Q?1WJmR1ufZbiHafH0l+KOkyjgvISiL9p23ypjqtESiI9dhyKaKMNESybEBvwq?=
 =?us-ascii?Q?9WNX7PIWKmaE1zqlaU5AJh4cqthpW/LGFBtOW+ToSWv30l4fL6ygdFWwbiD6?=
 =?us-ascii?Q?lDwK94KD8v/mxnQEeHe3OOa8UcbPI91+cApck4dKQWmB5kLksRI3ae//ZDWV?=
 =?us-ascii?Q?W4LmNiwhJRi2YLvKoX47fc6LOYw/EF002Y8aiL+UceZmNqBkzl11/O39uKC3?=
 =?us-ascii?Q?8E9gbeJWQVOWYhfUhiEsavzHmymbI3w35qMAgDWsaq8deAMlqgLgnMugv55s?=
 =?us-ascii?Q?1RRsTuGSxDfr2bswBYMxpWuwVhHphoZ5VTmHOUFy2Kub5G3MTqh9aKtjUaN6?=
 =?us-ascii?Q?C59BSdGhcRKxAE3ry2lJZkm88Ei/FaP8M1Idro36D7kHBPZvIwnKZgCtyLpe?=
 =?us-ascii?Q?6YUmKbbDQZeAh3JbEwlZ+L0HWIvgYXV9k8F3jQlyvMiRkjfURdjrBZsUaFkn?=
 =?us-ascii?Q?RZ2tcW1bzoD3TruZVLdaGLOMEJ/v5tZ3hThO0WOt+ZryRjAcSHN4OlA1tTje?=
 =?us-ascii?Q?fLBqxqBZYcf2g4kUMx7MFkNNsVOunoE8TxQpzSmbhNjA/unlkFAVUi6YTmuV?=
 =?us-ascii?Q?RAjfa4Sgq01C2HpYVdb5lCkmFJyQ/+GmRJkh1r9RXaD+p99RqwIh6FMviuQE?=
 =?us-ascii?Q?fOCLWQRQgOzVZVXo5LiomfPFKkCF3iFQ1HGEOf1OUcaaXhayB9Li9ZcIbILX?=
 =?us-ascii?Q?RNTDFBz32Evf5CwVrPQJJPsVclJB5H9LmWbaCnoMsFHpHxUdljoyv51gniUX?=
 =?us-ascii?Q?vtAzzve9rgd1XWcDu/iOgSjCTGEHWrTef3L+uriNbHu+ueK5IPM/IwANkK29?=
 =?us-ascii?Q?8N58yRn+PXQhi6z68IL90mRri2cfZyTH5VWmvcrEGk4CnqEfKGQGztcoaDjN?=
 =?us-ascii?Q?bVcQvoSdXrpS6sXnRT7mTG+gbLoliZ5WPK3JXegTrZTioOCVGBh2ISoKmCc2?=
 =?us-ascii?Q?1d//8dn4mbe7gTaVY8nWNmXcs+/YfOiAbW6lQlMt+oNVKUdPV9HN1ZS/PIyh?=
 =?us-ascii?Q?RmG+xH42LDLAYyFH6KPiFDliUKnznBt8i92P6+WkQeN5sBNhepnEkDz3d21U?=
 =?us-ascii?Q?TRmg07J+L94PFSTpBdKWJ1nwkVd7JBtehZd5GAgkjNCz7LTWo3NIz8Yo28F7?=
 =?us-ascii?Q?PqtGefGLmJaQ0rOFjSM4mr6Tu0NLDysHgwkE6J1fel+brGBcDEtkzSLgviWr?=
 =?us-ascii?Q?nrEPjBQvr1DHjH3J2rJHQ6rVjyafxwZNrWUUZDi/EnTEprkWotgvJr8b25t9?=
 =?us-ascii?Q?EMTtDDBOLEZep195b1qA6vqj2hRJDfGuiF5+M5aeyaPtkIDp9cQxgdQX8zU5?=
 =?us-ascii?Q?wjpbntVplXF0TPOOD3//hmGFG+NvZ4sXFijkt3coGNTvUAiD/bygMYxzRjRM?=
 =?us-ascii?Q?nekayAro3Of7bu6/0mcUlk83AzeqGeFgKajRjMN1gxjDe9aq6XDRcQZydpOO?=
 =?us-ascii?Q?5JGdPZHiajxNF0md/bW99H1vVaouxJYx1W13mTbIA3D3JmFEnuKSAL3iKEI0?=
 =?us-ascii?Q?y5A6F/Wz6w=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac805670-f0d6-44c7-5d5d-08dedcc10320
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 07:17:47.9207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cdkEj/7crq9fmEk6pxELy0o3DmKXwD3iYRtbNzfj2Mi7uLXVeFqrlVMYS8ax/5PTd57HwAaTDI1Hv8dRhdjUKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5061

From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

Add actual_len to struct i3c_ccc_cmd_payload so drivers can report how
many bytes were received on a GET CCC without overwriting the requested
buffer length in len.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v5:
- Split from v4 patch 1/3: ccc.h only; no driver changes in this patch.
---
 include/linux/i3c/ccc.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/i3c/ccc.h b/include/linux/i3c/ccc.h
index ad59a4ae60d1..d8052949e57e 100644
--- a/include/linux/i3c/ccc.h
+++ b/include/linux/i3c/ccc.h
@@ -343,11 +343,13 @@ struct i3c_ccc_getxtime {
 /**
  * struct i3c_ccc_cmd_payload - CCC payload
  *
- * @len: payload length
+ * @len: requested payload length
+ * @actual_len: number of bytes received on a GET CCC (filled by the driver)
  * @data: payload data. This buffer must be DMA-able
  */
 struct i3c_ccc_cmd_payload {
 	u16 len;
+	u16 actual_len;
 	void *data;
 };
 
-- 
2.43.7

