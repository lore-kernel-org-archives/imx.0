Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazon11022074.outbound.protection.outlook.com [40.107.40.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE574478847
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 13:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.40.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786109484; cv=fail; b=e7ql8QqtLkGCP7Yn6hOmxhOY3KwtXr4lQe48fJzIPK3zS9CJWQuAKazV6rGBsAfShjq/6PkTC9SRayJZapsTU1OfGnTT1WR8vzWLxTuREmPqGTeYc1Ndz74rz6yFRswMXpnyMD5vI84x2EDB3vJvD5l0JI6ivHAxfYx7EQNXwg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786109484; c=relaxed/simple;
	bh=Xd9fZcxiyb50Ic4LNkr7/oq06Hl3DJvS6wfrgGqvLqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pjOPVmXBdqExWZdVbkNubbZGVAvuXhLzDvFMtWCzrt9ZGegEx8WQkV0UVgqvMLakIbcgA5poOk3KCSlYgdxQUC6P2qUjGsAeSYWJ5q1k4orz3/JeMtYyGvVxshVm5KoILAXNXjSociPG/TQHa/UNt9ZiTAvN4kBzIu+L0miODGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com; spf=pass smtp.mailfrom=heitbaum.com; arc=fail smtp.client-ip=40.107.40.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heitbaum.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KvieMUqjTX/RyVc2j/b4P+XehY3AaibC7JbYhujpOzPVu9nNXtC4oLXCs2+e7vdzLUhuxZxbXJzhgqe7+p5YBp+IpN3L0UL6s0utntpqhY4GaHlRtN2BlHxQVV7YCes9a8M55WxzoKbQwdfR1XoidZqrmCZtcYtrihSuXJcECrGMz5kQfke+noBC3Nsl1+V1pZHM0b9hzFgDEHvVKLE9MnAvlplj8iwoeSOrsAuVbNagUW3NIZ1pmaaHWYLINQKP0VP9O8JFwKd3Z1ybdBFZVvny6MQ9IGdmlSVDpq/9dFJCNakYfY68O2R+fNaXjj3jSa/S427jGYAWcNZM98B1Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYiQDod6H2YBtG5T0NCzwvc1NGcSuoX9dPHitwvrMag=;
 b=ifUL6SfLZfCOPucg3Qf9yo3MoZEnjp+zT+L0t8jjyAkBQ/H2Chf0hM6Unuvn55cOvBN2A73fxJBwY6J0bSRfXv5Sd/llFbJrfoKgFdpSg3sjx5LTevrMAenSpBzAdBkbsFzocRPGnrQBaaneUltmS7nMuo7a8eRjqS4tWmQA1OYtrFurIt70rj5hW4xd4hF29jvPpdK54cLmQxnAD0rR4DeFjvfkU0mLcyoVl8jB70r9acvXB0OoSUQfI2kA/vQS1XXPS4S/sKPSsTjdhzJNETWobcEOoXZKeLaa2oR2XIxsIjcl4zLJrYuXPez4uN8qZ8zouoiiIIJmL1W4JLn5TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by SY7P282MB3978.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:1ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 13:31:15 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 13:31:15 +0000
Date: Fri, 7 Aug 2026 13:30:57 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: imx@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rudi@heitbaum.com
Subject: [PATCH 2/5] arm64: dts: imx8mq-phanbell: Do not hardcode a cooling
 state that may not exist
Message-ID: <0190b6ef209df3e6dc0a9dd2d399a715e5cd1e54.1786107926.git.rudi@heitbaum.com>
References: <cover.1786107925.git.rudi@heitbaum.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1786107925.git.rudi@heitbaum.com>
X-ClientProxiedBy: ME3P282CA0158.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:1c3::14) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|SY7P282MB3978:EE_
X-MS-Office365-Filtering-Correlation-Id: 807fb442-823b-4b22-02cb-08def4882784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3r150mcRxYMfYVQ2X62iIZzJm+9wLQaITrYbsKEMNU0t7pb6xzcbkihTMLZQ+p71T76XkRyWPiRMeSXgjGK4z582E93rHICttUQ/WnsSgwfcwO0LTZm30+yjj6ITKeJ41ODycHAGV/dP4qa2nW7UuipkAq+oIIgAWxV3sWoPzYcpbGFc9H8fZq0UeV8u3LgfKzghpEvpEg5We462A/fvoeGU6+r62XEzJ6TFoh2/p1DkwVr1rmIVR2K6VoJJ9v0hMaY+NDvY+PChxDd5tezygR4K8tLAJr/6Gof4yBhWEmYm5pefrd2iVjWGA7VYjIA86UrQkmtFRxm9DLWtQCdKPUH9+sRKVA+qgJ1FMiZaPiRiDLsi1KSWyykz5OhgR8gD9UckS5KKCo+Ps/cY0SSh6W/vwjz4M86K4EGV6yfosigZcujYMh0Db0YflvzPap5fBtpdIMJb5Az9AvlLQ8lIl1OXD0aPkNo7kIG4HNiLTBXYA5kzGZeycI4YyI7uxCGEz0fu0243cu5KmuRDv3bzyUh6+wqaWtFBx5Zl6C8mSS3BgcjMTEIySV+fZQIB6JXQZon0J41a6yUkuEAjBtD/L1AkpDcRSBBSRa+yEkeN84Ta4lKiyhM9F7mECQKEC+pED7D5NGDrLFLOzJLku71/Zg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YjBzlXHGzSfg/VmbJWDg/Qtw00Ch5qilznJfw39Bg98hAU1FH1e7UJbrq6BQ?=
 =?us-ascii?Q?Tdsy2Ip6fth3wr878k1EZ10h56IoP98XAHlxfmlirDA/SZlhOf6dbJ5Drebp?=
 =?us-ascii?Q?XrP54h+qF32jIJipf8/jhprd2r9cDD7UOTDJR/DKZptaAgh0sU1LBVs7lza9?=
 =?us-ascii?Q?GpEycHYhiizCXIowlZAk9Z5126RHd1pWGds2YsJJc7WC+wrwCkybQsdYzWqT?=
 =?us-ascii?Q?VGaBf+AGEqgVONvu5NpgjikoZ3OqoWWACwBP69j4TS3JW0L4cxf9sG3UePQz?=
 =?us-ascii?Q?jD7V2iN94IqFhAM9hZ8L/dlY/0q6ozynKrmoVMdQaWnrraUQ0Z1fSmMRlFzi?=
 =?us-ascii?Q?COzoTbVxjQB2/noqgFIPlCkd/FXxddmKpflsWxDMZGwDHoUCWTyj0k38j2ee?=
 =?us-ascii?Q?Ra72HZ/mXdjSnJZiTlNeuoenYEYc9ajpCkh7OYDQFNb6+dus2FI18TlhoVXd?=
 =?us-ascii?Q?VI8n8n3CSqoBolWtlvJz4j4eExnzgkGnrB2G1jMjqAg9oAIu+d4MJFc8tL61?=
 =?us-ascii?Q?NHji5fOxPDpnRL4lQ2HGJWn4M3f/GynfA4LiejB3UwRZSqdwQLjf4qrFP2oy?=
 =?us-ascii?Q?jz01d/odj5fe3e/uzJD4ffElrKYFUW8u7fgLAbmdZj5PbiGwMN9bJNozuJHT?=
 =?us-ascii?Q?7XRyhqx/Y7jcWlH0Oe9e2c3hADXKxWz1QL4E3f9whWou/GKe4pFRHyWV5Wyp?=
 =?us-ascii?Q?3huZA5q0aeApxXaPtNNk3L7KA9nf0jT1b+1iBsCto45xB8c87Lm3mMeKH3fC?=
 =?us-ascii?Q?Msdg/KXKDX5cX0ZZAd2ABZTT9QiG4r9lrxqcUhKvw1vuSSBzqbqxWigv1Zrr?=
 =?us-ascii?Q?tFWANOBLiiQC0m1vgKapgTFD9dXh+6m+58zTJov7OvkiwOsGnItWY1FsiPMs?=
 =?us-ascii?Q?F3EchknSSZQvC6EgK8EmGItdI+5rYlRoXiK/2geilSM6jfh+TSU6tQlnry64?=
 =?us-ascii?Q?iTDFiViXmlC3opZxEPKrpsdel44fcg7RlD0y7yJxDPOh6yoI7UI6X1XL47fX?=
 =?us-ascii?Q?ZbOpgYdHw4M9yRFHNJCueAeaa81938dyN2Kr2rbi9Lay3zbOO1/EsMw8IuoH?=
 =?us-ascii?Q?X0AcpYANTyOtr1Tqvnz2GcWWiCL5eGiSQov7Z2BR+evb62lidf3QUNp3hHx+?=
 =?us-ascii?Q?zvuRBMfP3b44jrdbPiWHymTFpOEr1srPhwBs+gvmsc6u5tEeMZDSkSJnLqAW?=
 =?us-ascii?Q?9JNk2PsdUtF1cGv63OGQTK1queYJ40Rj9lunuU8zPJfbXMPMyOejmkrr9B7r?=
 =?us-ascii?Q?3SeRvLqLrNodLqudBNlQesbNTsDoB97XxGIKah1M1TtD8mPltpTq+vwsNyqG?=
 =?us-ascii?Q?xG2D+6a/6V97jnObRdqpfeGpTWRzOX6eRHLW7uSOd2l7tKfxq9thiXj7F1A5?=
 =?us-ascii?Q?hDyxweonqbrnHvDkZhCQiScsj8RkfYvyNSlEyGiVNRXOf3b6NjLC5MYEOIvD?=
 =?us-ascii?Q?Qq84jQIsKKkDsBn09FtxZpkXEeloH03AUpx5z+U8bTTBlBTooarJDX5qHRJz?=
 =?us-ascii?Q?4mVp8cqJyfgu46opDFS/HWN3ry5klDOWY9DxHWu/Lz07iWl5IySWO8PAO4Sz?=
 =?us-ascii?Q?Z1RTtdFtxUjlDUWp0/8CagH7LHvBgO6UEi3ge3i0st0CfL6vLvBy4PDl9JBN?=
 =?us-ascii?Q?Tz4pJ18nS1HFCcyuAo0IaJluXIFdBXWwt1X4uV+Df+trq7cCN+bdDkwaEQuG?=
 =?us-ascii?Q?2e5EYeMwp5Ms6206abNSP+OBvrgyZr7rBB4WIjF+b0eaYmQv?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 807fb442-823b-4b22-02cb-08def4882784
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 13:31:15.0382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OphPRfJIpYTVQdUOZzPM2wt682sZ4mqoYIQXjZsjDALcAMnGMZB5KH0unZ9mhz9obKEkI5wueohHvLzztUVHgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P282MB3978

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
is why frequency throttling works at 75C despite this failure.

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

