Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012057.outbound.protection.outlook.com [52.101.66.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6445741C63
	for <imx@lists.linux.dev>; Mon, 15 Dec 2025 17:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765819461; cv=fail; b=s3O//NWunrT9yRW12WPQvkHHWL475cjAEnEWDbRIaTPRcy1H5BpH1FW4MnxKnaImpVyRdGZ9CeKddVUAz8YpggtgxWTld9FLp2PL+t/0Q4MbQ0CnzmPKHo3imMUKygPDotWGDJpOrTGGSkhv7o4erzAurALk072tPbIzNyle0Aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765819461; c=relaxed/simple;
	bh=TLIUYDotWMHYvhIo6/hGklQl5trEGrvprMdJowAiqVE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=A7N4UuKP+EkX6UX7XuVIIVVFOtVcN6LODupmcPhKEHNcF9rVkjwvexNNVTZNHHxWgxDX5qlmyKDnrF0x3boGNHCHIndBYCucBafC4Rms7zlJJ1EAnQ74mX5tRYCoQBNo1OrE4IWU1gdhkaSAQhZ3jpsZxicN9RnihhhfTXmKxgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZQu0rMTk; arc=fail smtp.client-ip=52.101.66.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZQu0rMTk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0QCRdcyrdRmuS0jT7ur+PaQDj/jA4pa/zwfs3ZwIkRmO7YlWrlcd7QYPr+pQCWSSS2khSHtOXeKYb28NqxKaIpCu6ua+dHNgzOq9JrC+PmcKCDnmSEkAUOjJN7Vo7BepI58baD3iT0LqoQM8uUWPRjy39W2xEx5uKwo64QhAJU41HJ1CcnK2TU7TjbdtBzlqjB872jJoXQA0mcXRDH3GBgOBG9OcQZRUZxz5GqPwvCQYgG1U/ISDiLGIo30m6Jx3gquP6mSU7ow6M8j1jRikVq6ppJFeZyzT25LMiUxjXKlN6X1B1WwGNLszIhyMs8c1FLCcK16R9w1Epc/4IpRdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpWA0r8BWHlWAHEHhBszkODC2FOPys5AxETqlW4niEo=;
 b=Tu/x2yRvAv7m88SqxuvFLr0baIk5CXlRZ4V2xYzMh4J4FqPXuq5d1ti7e2WKvsaAYb63kQSdjwlOM4wGvJ6ZW9LrxdRaTgtQtxA3MPQJdBx3Bxx6vmoL4XZxpBoacZ6Db/Pm2wIftI5S3bIbzLx02i/ZBjVQcVLy+OHn7ipZmYAoM9u7uBt1ApVnKVgHhXnR3YKJS8t4XOhh3kzs8J3tAadnzOVRz/XppjzGN7+ZOYS+QgmG9iHAsepXz6tU/1xpjLIK2IHc62KzjbZjYPVIMND3rFMqdwgEKtOs1vloXnLdpLTs6EPdzO22BhN6HJjQY051wr19mDm7xlj3+OYwHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpWA0r8BWHlWAHEHhBszkODC2FOPys5AxETqlW4niEo=;
 b=ZQu0rMTkJxcEUfZCVGJd/rWFpbybStBK88p2FXfPeiPJK/zvhYn9nOrbf6tN63byBebzA09vMpSkOF7VIozw3mDb1HfSAhsw0JAE6f1h1bJbXm2MBzTEznyPA/a7QOYTfTO8YGhHg7N8E2VUjOUAyXuXneUqn0e4GMynPYcjFRdxWTuqIoYhhKdBqyJ3/P/7H3UouVwD14evawxi1egQnh5uzyf9cTREoExam5XlyKFMiEnpxsMgWk2msdemSkdjxWBJIbNAnvq1+jo75i+etAj9xbiF8rA2Gsf/AcwWFzRA7CkBmwKJTCFLk+Ngs9Q6vA2FJpa70m+ik99ZGMQ9BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM7PR04MB6983.eurprd04.prod.outlook.com (2603:10a6:20b:102::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 17:24:16 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 17:24:16 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org (moderated list:I3C SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] i3c: drop i3c_priv_xfer and i3c_device_do_priv_xfers()
Date: Mon, 15 Dec 2025 12:24:04 -0500
Message-Id: <20251215172405.2982801-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P223CA0004.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::12) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM7PR04MB6983:EE_
X-MS-Office365-Filtering-Correlation-Id: 3689be16-c1c6-424e-7f9d-08de3bfec5d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1iV+kYxpXZ7ELtZO7L495socFCHa0PSil8IbCm0CQIAD5a6wtJt9HHX1vmJ3?=
 =?us-ascii?Q?PojC267THXw1YeuoqSWyiQx+czHZZvaVTMxWKJBQSEZGBzHiiwp6LZ/+LWmq?=
 =?us-ascii?Q?Mi9q28pEZZ1ZenB6YOQ/25GxLYj0ni769XPJ0u69j0eFqrgLAb+GTYOAfZpj?=
 =?us-ascii?Q?+kHHJEyWbwlnDqMVc+J4WjW0QgKrMSlvUDWyACj+QDpdwd5zifV9Hixl6dEQ?=
 =?us-ascii?Q?lT0P94e+ruSjoh4Aod2erjV2NCUIMk2xoU6a08vmFBtZhIZ7hqeKycjmpaDP?=
 =?us-ascii?Q?VOXuv508IMsWaYk/n7cpa864KPkcvlcvIFSSAwM/0+VWynIbbzjBmIB3VQlN?=
 =?us-ascii?Q?0hXDnpdHiNUGZ0s2OqPgnegF7vZW9YVNsbvwVFDkf/tLOThQPXHzkcRT6m8L?=
 =?us-ascii?Q?/32+kT7UHdI2PKMvGTZqvTxkxmApTaozzFhlutWW8AztM0YbWjzkeYHuO0mo?=
 =?us-ascii?Q?lJCVS3ASQKK14O0r54IDtE9Yk2UL4YCIDpt0wctQC7EwhBxJnBQwRD2yMrY3?=
 =?us-ascii?Q?8ZcaeabEZtQRLiL7Mm0OHRUfFOfOtv4MvXHxhAqCQhOC8p0helWK2SnmZJzO?=
 =?us-ascii?Q?nsDus3W2ySd9VUOJFfXL6VQ0vb2xHf4qFr99t2BOmfpk9YEpcTvEoNfQhpQq?=
 =?us-ascii?Q?+AR9oI2hEMp+9ckkwuMR3LPep7jvLH8KPtA4tts5az2RDiGdmLsMefpLwGh9?=
 =?us-ascii?Q?84KnS8q7nF8U1HNzIpn0hfa+rE8C6fS492l3wfGMB3S3hU6qHW3jek6E8LK9?=
 =?us-ascii?Q?B8LG+nnJ91Ptb3bHzy1D14MXnSD26ahVCJ5YAZC7G9cgeeOEXmGurxqSDgKu?=
 =?us-ascii?Q?2woTlC00j5S9KS3bSaJbTU/hsVteXV+oghVOqjKxMD1aFuzbz+RX5W/7xCVo?=
 =?us-ascii?Q?yjFYuYpKPMuwMm4lKaOWBRdkIsQ/CjnP8jnUuyx8U6+z0JRkYFVZK1dLGrvg?=
 =?us-ascii?Q?DUaAc6UGf87NFGTjvKKS0js2juOx/HpAFtVQUBZIA6+voyo4DGPywEAQaGM7?=
 =?us-ascii?Q?EHPudV/GUl17lIs+wNDE/VT592lzoWoDafoHvWJCRi426AyxqwDVc+BAjRDh?=
 =?us-ascii?Q?xsa7tP7EXEGfYcnK1iPPEvk9q1TlxwmZF6G6k1/dKVfWyAKNthY4roQhfigq?=
 =?us-ascii?Q?oIghTZipvP6MyJHn+KeMyjp4n7R89b+8JYSyefJ4ElitevbkCn6hn4OXZsPT?=
 =?us-ascii?Q?wemifkz3jzBYiEX4hpzTPmxk4LBO0qe2KZAu5g+TshMp4a2p7YBzg0BKhuVq?=
 =?us-ascii?Q?pm8F5Fg/RkSZUCCBBK/0OJyhw5z2lyq54+7RR74ZU/ji54IyptbtQfhs1JTo?=
 =?us-ascii?Q?V045MnQ84dYdNlUT/o8f7E0vmM/xzcYVpP5qi6BMfzhXWzbpU6qcKG88jDG6?=
 =?us-ascii?Q?Kc79KclMQul6+nfKXDhqcLN2n/kx7hRYTnBv2cD4ZpbiZtN0Wohc43PxGjEP?=
 =?us-ascii?Q?isbBzstmOYH/lPgyiT2wUfE5gvN+Oog/2JY2pwgM0JRLpFmQFUwHo4SHcqy5?=
 =?us-ascii?Q?5SQGSDA4/elpxUfNBm4GKaS8kJL+EfMedOzB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e7ifdW8n2jvSRqyscaRAtyX/7h5iXtN4rBoxn23cuLJOzwyNfJDBiM3FrtaH?=
 =?us-ascii?Q?NAmgVoxfH0cK7sMQlAgQJNmnnOcFlTedendXS+wWW3Od7ULDpzGPX0RtR9UI?=
 =?us-ascii?Q?8BvN2hyWe3i21UYIld6oRyKmH+txg1pZiZmV/DezKNrNXZX5mZI7qirlQX3x?=
 =?us-ascii?Q?kP3FvlUGZsif1NFdNFl9iY8aYCImJ+rDzrfRLBafUttbFOOhmObLP8mv5sJv?=
 =?us-ascii?Q?lrpJ7Akf91y0OSJzVw5tXTqMciQOqmu4N10tAGIXm0jQncqak5TBY28rXgtG?=
 =?us-ascii?Q?LSXgYGnqKrqLmfVipLjCBr0lq8OVzXjU8S4ivO0pFnp6pd6qO554PR4j442e?=
 =?us-ascii?Q?ETeGn096/TT8U3CQstTEqlXQH+gcZRF3UpSNvE4sZ6bX1K5TntBHhAd01p4w?=
 =?us-ascii?Q?+Ji5lVu3Dlw4Z4CWmhaCOs9w48JfLfj5BurT2xZRXFD/QegUnX6OmWhXLznp?=
 =?us-ascii?Q?kBwfAJEUG1S57hn9CZqgC5HNcnHdEs55DEb7K8IyRFuYu5vmp3E5EpY+faYE?=
 =?us-ascii?Q?U2VOdT7RaOdoJaSq70w6eOXzAIjL4W3qxjyrc5D+UThlT9CN9HgLfaDh4Ia+?=
 =?us-ascii?Q?kcm2PCA9/8TzxTccruHYN85kxOvOaSBWbkTT/kwHi6lXnh25/vCTHmDSqycf?=
 =?us-ascii?Q?g4nUpYIq30KWbXF6CXGYfpzJ/0IrRvo9cXlYuq5onJtp0gDqKgMroyVp8Hj0?=
 =?us-ascii?Q?X3D36EBJt6fKLn2o6hbiNYPzNGynXshUwxXWmmprTZEk3FPPWc8tYQjijS+O?=
 =?us-ascii?Q?ggSiR4bDMaakoEwezkuBqeZYg8Vu6pXKhHiJnEUc99eOn1fwT1HAZI0+AMr/?=
 =?us-ascii?Q?plx9OjwBiHdHYdnZ6SKh7EWzvDZm1hz6c47QVwnIfT7kyW5j4adFLWl5PHBf?=
 =?us-ascii?Q?XgzY8xX9voBRNlCzoJItKF46RG41Wa3Tcwjt/vPl5+Qf5s+/VcKLka60mggN?=
 =?us-ascii?Q?2JbbivdhCzSW2RTkLenIPnlqfrekoWsqrGxEEBWR1lbaXDWKkxbjrZTCfUDO?=
 =?us-ascii?Q?Z6q8R0uNGGIpGPPJLYbwV1L1Myi1Gi8MG9uHSOx0MyR5h/c8iw70P5bF+gX8?=
 =?us-ascii?Q?Kbhhw+dYQI+Xl94gXIhGKxPRgg7NSoKNTTYs8GU0fu6zmMqlxk9SUdVw90Qs?=
 =?us-ascii?Q?8ztc9bQn6FyEyNDxy2m2y0yhSoYzK4o+k010t1Nyiw3NRxh8xNBFKCEd+eSg?=
 =?us-ascii?Q?MluRHFsc5fVioxf+cHASl2zIa8FuczY4FnzhBJcX1XwYoG8zxoBK98Z7tKU0?=
 =?us-ascii?Q?HZKXxHdyBiOrm7dl1lcSDicFfFudkfa1mucT6fsNrSeaVy0aJxNOx7e/CyUN?=
 =?us-ascii?Q?7zrpqO/g3JcSqbBflIulkkOs8GZ1Hs9lOYid64VHdWx/g8zMBX/WBXwO85uP?=
 =?us-ascii?Q?Et1OrfWe2/vsUKoH9IQUj5nlW76J+W5XEp4y4Lfp1BzcLq9DGewcuZ6CYUPe?=
 =?us-ascii?Q?3P+0M6BGFt8hX2v2dw555obhaS5Ew/Vb4YGm604QJn/+KxDg2lwhh+cxZ7vW?=
 =?us-ascii?Q?S8O6uJgpJnHeu/35rRTu0vNnmZIElAgqsK2YXcPjUfTunhkO4+1yJ9VnbvLo?=
 =?us-ascii?Q?HXV+Q9HiCVyN7+rBzwE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3689be16-c1c6-424e-7f9d-08de3bfec5d5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 17:24:16.2111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wyqILDd7MVREvJzEWmkV6qRKaPsZQ7hpNmxsTVPmlPNtJbH/WaGmYqnKu0C/r51cl9ZfEa2sAHULxdXU05gn5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6983

Drop i3c_priv_xfer and i3c_device_do_priv_xfers() after all driver switch
to use new API.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- rebase to v6.19-rc1
---
 include/linux/i3c/device.h | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index 9fcb6410a584f..39a1ff1808711 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -25,7 +25,7 @@
  * @I3C_ERROR_M2: M2 error
  *
  * These are the standard error codes as defined by the I3C specification.
- * When -EIO is returned by the i3c_device_do_priv_xfers() or
+ * When -EIO is returned by the i3c_device_do_i3c_xfers() or
  * i3c_device_send_hdr_cmds() one can check the error code in
  * &struct_i3c_xfer.err or &struct i3c_hdr_cmd.err to get a better idea of
  * what went wrong.
@@ -79,9 +79,6 @@ struct i3c_xfer {
 	enum i3c_error_code err;
 };
 
-/* keep back compatible */
-#define i3c_priv_xfer i3c_xfer
-
 /**
  * enum i3c_dcr - I3C DCR values
  * @I3C_DCR_GENERIC_DEVICE: generic I3C device
@@ -311,13 +308,6 @@ static __always_inline void i3c_i2c_driver_unregister(struct i3c_driver *i3cdrv,
 int i3c_device_do_xfers(struct i3c_device *dev, struct i3c_xfer *xfers,
 			int nxfers, enum i3c_xfer_mode mode);
 
-static inline int i3c_device_do_priv_xfers(struct i3c_device *dev,
-					   struct i3c_xfer *xfers,
-					   int nxfers)
-{
-	return i3c_device_do_xfers(dev, xfers, nxfers, I3C_SDR);
-}
-
 int i3c_device_do_setdasa(struct i3c_device *dev);
 
 void i3c_device_get_info(const struct i3c_device *dev, struct i3c_device_info *info);
-- 
2.34.1

