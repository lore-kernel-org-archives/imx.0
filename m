Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.110
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078836;
	b=DBKOkXqtWKwMFrE7fScSjXYw43tdnToqK4PhJnjzHGLYB0L5dkgKNyjMx3oFREOrYtr3
	 BbkTaKg9ocIN2PgzvpDgPb3SZzAqtBWgpG+4vi7LFiOANDUpJKKGtrzTtF6tlged+C1Nk
	 umBxVGaz+cJEJl7fP8uZThXbi10Uoy6b5VMT6UTm8nSa/AfELfXQAEea0N/hbvwI+A+Ti
	 87fJ0bxEIu/e/KBrEqTfU2Yc+rw719NZcoAsjzIZTKvxjF3p5x0auhOJWrQWE0gDQRONW
	 j83SBO6hvJWg26I2WdVvPm4ZVK+zLNjXRt2k23g8Ele8k4/yvm82MwY2xwqY/Nc0vlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078836;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ievH/Bo8PYBETkN2DTFVSlrtbIKE12Uo6lw08I4Y438=;
	b=VyKpFQ6968TZZxK918DEm7cDq7OkHYignDWBq3Bivfl55mnZfO3pFOt57PHGWebROIii
	 onry39H/Ryj5/NW8fv9LSPZ5k6UjF6X19kegaCNcYm8EzVmJRZOWSeL8bH/bCHEFfGcj5
	 6glt8FCGP6QxLIckF1WCntaPm0Mw1spBW9cUjaDE+l9m3V1/PPw2sPz+zcSKEQ31syTjB
	 bPZYEQKMRAFBG1qaDIkWNBqPBi88NFoPxb2biwMyx0W52KtHy4/nU73FWzY6IyubiUnQx
	 AHshHPWOCz9oL3Sm8VNiEstrQFwG8yul8P9GmEkdRavK0MJw0rMoAzq4huTNxHIniEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=f1N06tGO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.110
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021110.outbound.protection.outlook.com [40.107.42.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE9C60A3837
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 09:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EE9C60A3837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=f1N06tGO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WG6EI1S9VIPBlx8pxGKpg76GXJvMfc4paHjirqX65viEuRyR9D4mvOoC2QYAhSZv/JtrAqHhZquEZK0v9EehXYxpWiTKU0GU2G/z73lq3wFIV3PTiDy543gdLVcQeEYCcXAPuvgQhBkYLY9MVF7+vuk6HRBApfAkIc2iGM7qVPkTDP2to1BEUV/GJuutBRzxppcEbAV+SBMXsJgHS4Gy7cn7zzWD+ka+mWMmtzaR64LCyUnT1kHsUUZRxq7x26dJnCsoYQNXAwdYrel+HE5Ev0NHLMOLqkz8YtP6WijGg5KMI4CNc7JUZhmisEXSlg//GWtHW3bkL1kX2T17l5vafA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ievH/Bo8PYBETkN2DTFVSlrtbIKE12Uo6lw08I4Y438=;
 b=yPer9XLNFBME48/xfV6TqfCMmriByRjU8rEejkTkCofJbj6qnWiwD4OLZLRGjFxJXrAVjN30tRxMYAwLxxD5/sPESP/lVDIjfGdJmHo2ooSRmzJWDEFCY0uvpVcQ+cM1M9GIJ3eLnDVlEj+a/CFElULQmxkuHfvyBm5SIZTBz9Uqrj/icZylWp8iq/1KLcuGoZ2QmoTi0eVXmVgmWybSiXSceiI5NfzeVLR03/AHfEjCGlZ9r4yRn/cDwrbtQxgJnBq83hkFBn0VFsqgK5IhcihKmChk7xAk16kClAWHM6XNGSmDN491JHYdh58J8mmQIdDZaunAqoU7odQPKs0FyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ievH/Bo8PYBETkN2DTFVSlrtbIKE12Uo6lw08I4Y438=;
 b=f1N06tGO2ManluGfeyAW6SQVFxaUdKRc3+CS9LpnnuzeSIHOGrGqOyXtmXilIA4MpcgC0hDYwS2Iy1GA8IVdY/i1GwZ8mMfyJFSmvZWN2B+e1f/bIz7UcfKWRh2wn6JLymoctgfBHFZKlLJGHL+0IKmHN0bFRNeO6yH4Np5M1UygU3dzIgodVLUuUBmkng8koTuCm8DRBWsE3WtOski0x+TI6BJp5AsCzGjvwsa86YnmJqA+GMGVyNpd/Hk4N7P5q2A/D0ux53cw4v5S7auYQoROy+caR0uV1S64wLs5qBPyiWcPheNFBqF2wtM/8dbuQy5mvQUNxKT8zAk7Lcmmfw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SL2P216MB1466.KORP216.PROD.OUTLOOK.COM (2603:1096:101:33::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 09:00:28 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 09:00:28 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	festevam@gmail.com,
	kernel@pengutronix.de,
	nicolas.dufresne@collabora.com,
	ming.qian@oss.nxp.com,
	marek.vasut@mailbox.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v8 09/11] media: chips-media: wave6: Add performance profiling
Date: Thu, 19 Nov 2026 18:00:03 +0900
Message-Id: <5702baa6ed97eb30dec14bddba2919252ec8f3c8.1795075582.git.nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1795075577.git.nas.chung@chipsnmedia.com>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0060.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::8) To SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b9::8)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2441:EE_|SL2P216MB1466:EE_
X-MS-Office365-Filtering-Correlation-Id: 46a16730-03f5-4ebe-53ca-08df461b8eec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|52116014|376014|1800799024|366016|22082099003|18002099003|3023799007|56012099006|10067099003|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261022105027099003|261021121427099003|261022075727099003|261022115727099003|261009223027099003|261102123227099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	oBS+nEO5LPONPgMfTvtKwRShErr9yd+gaXZ+b2ViNTv/JBJxvb030rYxhCy2TV0OOJEMJqiClNEA/RC78NGQD1aXTmISVXA0TX/g6tx8VKeHgs8zlx1LwR3I9oSg6yCavZnkPOz2ECtU9H1xtVo3K9DDgiRQ0H5HRfIwZtGRNEuAC7MJgjAIBF1zKqJPm8MgG7fcyK7aD3AJmKWHfMoc6SzwePUwBwp8W4tdZ9euPXofGJ6dM6hvkS5b2CrHB6WDlk7ToNDrn5M3KyOgUQbwC8L/ChU7IOP7OH/DoYR5+wJyjAxV0EYj+U9T9siDk4Jif3nYf9DiM4JU1mejxF2sCPuogqO9WtT/OO00ll86gJOasgc0Occ2M6x5snGI0Mu5EchfFmuhjA7S85Jy0EajulKj3GPfA/RFFbsmTM4eew7t+iw8w0qH/8IPgHnzXHbz6NyHnukZi50C3Us3kw0hWXlMFvtWFxqSg/jzXIHs5BE2GL3HerFUjsH9U4q8pFXLTj+dpXlKePBiv7Ji6nfMRS8hXzQHoCQCEWPctBMDdZDlOMqOPxeHwdKEzNngNZVdIUvTkKIFtF6fJcx8HnBI+ubEsy79yN6Y7QOwOOe36Q8nxh/f+dRlvqclqL0LS8xtUN7fd1xyk7SaMZb39KxUTeRA+jQMKFVEV+UJUhm8rNMSTIxkPJ6IbenYcEBFWf9Xdj7aIZ0csiT0sdJqh5+PSQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(52116014)(376014)(1800799024)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(10067099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261022105027099003)(261021121427099003)(261022075727099003)(261022115727099003)(261009223027099003)(261102123227099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0O95Jmtm1N+pq37lKjQY9xxChRyBsDaM3EDsrKALYXO9xJWd2tiQ/1PSeViS?=
 =?us-ascii?Q?NGc7ih7Nz1HP1bIuXug+GPEyVFZV2hyLFv7KpInS8fqmtGW4muqmUHOaWVC2?=
 =?us-ascii?Q?0i6GdmoOjDZ1IpSR/RkJThf24oHsLyIwsXrBboBdiL//Y56VR6l+W6w29ci9?=
 =?us-ascii?Q?b1Ck0+cC5Vsk+MTHXhRP4N8+8TfaiPoKAuF/CQ7FIC/hvXGAwmVnUkHYdNQd?=
 =?us-ascii?Q?yqy9/PG8xJgkPnV+3vWMdnPRgFmlU66w5tgr/WJt9Kg64T4+ZWDk0YJ52zZI?=
 =?us-ascii?Q?GTR+Bk4NSl9PXTPV1Vfk3rO/v9RoSmORRe2NBAWcpy2TezFq549aw88xwzTc?=
 =?us-ascii?Q?4QiuTOrmDLHnQK5njyZjCfpXqi7CHlo1Wy3QS3jeJm8MX2WnQcXzZ+j8erBN?=
 =?us-ascii?Q?MyglvWP5ftAqOMU1CQKHmCa/J01+Xeyp1U8BdD34vEGwTQYyZGWYJe2RFtfB?=
 =?us-ascii?Q?sITPhLquQdsMX/uX9qu5NCGv4xkhL60uDBMhqR95QpCM/EkT8u1rN0In2qyF?=
 =?us-ascii?Q?qsxseoaKbRdfAhanc9VMwF1gOjS91gO9Hqa2p0hDSbe1DGq0Dei+2h7EcK5W?=
 =?us-ascii?Q?6CDsT1/8X8cJniPbe5eAHTu22o912cx0uz4NpZJLMWrsqXQbRDcUlmBZULbV?=
 =?us-ascii?Q?ciSx8RoRIiqWk5+PArptCs8ywiiDoDMffBrcUXWAmiJ+ZXVlfVmrP0UK0M6c?=
 =?us-ascii?Q?nADTqOOvAs9//KQV+pPD2ztJBHxNICuUs0uV0l6HSAKWTXDKmAWy34534OmZ?=
 =?us-ascii?Q?xvrs8rANfBw7s1RY+KVHWFa0Ay5lI2QQiI/ULV+pybm+rJgWvXivYoW7ev61?=
 =?us-ascii?Q?HHXiIVbBX6rjJ1oC5M9xeSTpqUe2+lWON4FJZyT0+DwvWp1Hw345NdUz8P6r?=
 =?us-ascii?Q?LMAMB8cDbOInpviF/Z2obgi7AGC94owX6vQVzQVS/XvNl0O5+U1kx6wjuksh?=
 =?us-ascii?Q?GbB19wcf6/oEW/Cibot0R/pj0cr6lgb9V73lB8jEX/CCF+NSw85n0c6mID5S?=
 =?us-ascii?Q?5CaOR++Aemfn2AmPbdiIjCR2jVP+p/sIJ1pDavB+5FDaaItRIJm0yQEXUXTq?=
 =?us-ascii?Q?Cda7YEmnOUZdFCUI+mwwY1ZwS2EN3SOFqtmfxf2par8pr9k7CK3evIdyVMUz?=
 =?us-ascii?Q?YcNcQroRSEKYYZIrlzKJsCqL/G+7xyaTPsL/CxLX7YBt/aE2JVB1rLGNEN/R?=
 =?us-ascii?Q?OBFOfaOFlPS/TMqD6HvenJXI1FyY2eZr+o/2cFtxxEb51xPug3ShV+7VYwtf?=
 =?us-ascii?Q?6zfTAygVccDPYnrR198DMGhvmMOuZGSN9QngY6UjldEgmpRmm+1Amuu12RMG?=
 =?us-ascii?Q?OVkj2fXoWh34+6P6gJgNItyDAOKh2lOS9cWoh+OPd4D2FRgWMEbyO6COMEUu?=
 =?us-ascii?Q?0WiusR7C65HQJ2TzKTHRVVe8w5Vi8kF8kpj5yU0mvmw4c92LnKDDWmUdqdSX?=
 =?us-ascii?Q?WqL/2dkGkEnFoEmD5Hi7SoH3rdBaT4nMuM/scd0Cjul578e3G4w1mlzzjy/g?=
 =?us-ascii?Q?zPSd99H8t2+W4ExtYBYoSUvxnBsiD8yYz9x8jAQ7k2UiskXzEwaRmXqqI+pL?=
 =?us-ascii?Q?CBHWn9m7yNw0zeDTFBGA5akeBBn8cgNWWQMIkrfq0PgDgAQhGDjo6J2EQ5si?=
 =?us-ascii?Q?LFnNF6JNJOc97+yvipJgin7Rf74XiNJshgJxNT343/A6PTzwWHuI3Zlxo0pA?=
 =?us-ascii?Q?+QSzhhoEPc/EHqfCY48wVu7jOHNQnn6YvRuUpA0C4WvfMosKkU5I10ehBTeh?=
 =?us-ascii?Q?w6UuUbQikEEefShZcXTfHZFwcuN+32I=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a16730-03f5-4ebe-53ca-08df461b8eec
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:00:28.7213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ux+dc8gYur3VO0tPHgugK8JS5XsB44oWVNaY/Z86D6h1vgPvvQYuNXfkHKku9Nb6X1ys+kW0HzOCVgI40rPRqmTk0d7t1u+CgqZKJz3Q3hY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1466

Add per-instance performance profiling to help identify whether a
throughput problem comes from the firmware or from the host side.

Record per-frame timestamps and the firmware-reported processing time,
and report the frame rates and latencies in the per-instance debugfs
file.

Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave6/wave6-hw.c     | 28 ++++++
 .../platform/chips-media/wave6/wave6-hw.h     |  2 +
 .../chips-media/wave6/wave6-regdefine.h       |  6 ++
 .../chips-media/wave6/wave6-vpu-core.h        | 10 ++
 .../chips-media/wave6/wave6-vpu-dbg.c         | 36 ++++++++
 .../chips-media/wave6/wave6-vpu-dec.c         | 15 +++
 .../chips-media/wave6/wave6-vpu-enc.c         | 13 +++
 .../chips-media/wave6/wave6-vpu-v4l2.c        | 91 +++++++++++++++++++
 .../platform/chips-media/wave6/wave6-vpuapi.h | 28 ++++++
 9 files changed, 229 insertions(+)

diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.c b/drivers/media/platform/chips-media/wave6/wave6-hw.c
index a53a87745366..8d590d8e74e4 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-hw.c
+++ b/drivers/media/platform/chips-media/wave6/wave6-hw.c
@@ -872,6 +872,20 @@ int wave6_vpu_dec_get_output_info(struct vpu_instance *inst, struct dec_output_i
 	info->timestamp = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_TIMESTAMP_HIGH);
 	info->timestamp = (info->timestamp << 32) | reg_val;
 
+	info->cycle.host_cmd_s = vpu_read_reg_relaxed(inst->dev, W6_RET_CQ_IN_TICK);
+	info->cycle.host_cmd_e = vpu_read_reg_relaxed(inst->dev, W6_RET_RQ_OUT_TICK);
+	info->cycle.proc_s = vpu_read_reg_relaxed(inst->dev, W6_RET_HW_RUN_TICK);
+	info->cycle.proc_e = vpu_read_reg_relaxed(inst->dev, W6_RET_HW_DONE_TICK);
+	info->cycle.vpu_s = vpu_read_reg_relaxed(inst->dev, W6_RET_FW_RUN_TICK);
+	info->cycle.vpu_e = vpu_read_reg_relaxed(inst->dev, W6_RET_FW_DONE_TICK);
+	info->cycle.frame_cycle = (info->cycle.vpu_e - info->cycle.host_cmd_s) *
+				  CYCLE_PER_TICK_VALUE;
+	info->cycle.proc_cycle = (info->cycle.proc_e - info->cycle.proc_s) *
+				 CYCLE_PER_TICK_VALUE;
+	info->cycle.vpu_cycle = ((info->cycle.vpu_e - info->cycle.vpu_s) -
+				 (info->cycle.proc_e - info->cycle.proc_s)) *
+				 CYCLE_PER_TICK_VALUE;
+
 	if (decoded_idx >= 0 && decoded_idx < WAVE6_MAX_FBS)
 		p_dec_info->dec_out_info[decoded_idx].decoded_poc = info->decoded_poc;
 
@@ -1882,6 +1896,20 @@ int wave6_vpu_enc_get_output_info(struct vpu_instance *inst, struct enc_output_i
 	info->timestamp = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_TIMESTAMP_HIGH);
 	info->timestamp = (info->timestamp << 32) | reg_val;
 
+	info->cycle.host_cmd_s = vpu_read_reg_relaxed(inst->dev, W6_RET_CQ_IN_TICK);
+	info->cycle.host_cmd_e = vpu_read_reg_relaxed(inst->dev, W6_RET_RQ_OUT_TICK);
+	info->cycle.proc_s = vpu_read_reg_relaxed(inst->dev, W6_RET_HW_RUN_TICK);
+	info->cycle.proc_e = vpu_read_reg_relaxed(inst->dev, W6_RET_HW_DONE_TICK);
+	info->cycle.vpu_s = vpu_read_reg_relaxed(inst->dev, W6_RET_FW_RUN_TICK);
+	info->cycle.vpu_e = vpu_read_reg_relaxed(inst->dev, W6_RET_FW_DONE_TICK);
+	info->cycle.frame_cycle = (info->cycle.vpu_e - info->cycle.host_cmd_s) *
+				  CYCLE_PER_TICK_VALUE;
+	info->cycle.proc_cycle = (info->cycle.proc_e - info->cycle.proc_s) *
+				 CYCLE_PER_TICK_VALUE;
+	info->cycle.vpu_cycle = ((info->cycle.vpu_e - info->cycle.vpu_s) -
+				 (info->cycle.proc_e - info->cycle.proc_s)) *
+				 CYCLE_PER_TICK_VALUE;
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.h b/drivers/media/platform/chips-media/wave6/wave6-hw.h
index 7adb0a07390e..fe2a09ec4c0f 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-hw.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-hw.h
@@ -34,6 +34,8 @@ enum product_id {
 
 #define MAX_CSC_COEFF_NUM		4
 
+#define CYCLE_PER_TICK_VALUE		256
+
 #define H265_NAL_UNIT_TYPE_IDR_W_RADL	19
 #define H265_NAL_UNIT_TYPE_IDR_N_LP	20
 
diff --git a/drivers/media/platform/chips-media/wave6/wave6-regdefine.h b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
index 1038b87b2ff9..55395d3fa4a4 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
@@ -110,6 +110,12 @@ enum wave6_interrupt_bit {
 #define W6_RET_INT_INSTANCE_INFO			(W6_REG_BASE + 0x21C)
 #define		INT_INSTANCE_INFO_CLEAR			0
 #define W6_RET_INSTANCE_ID				(W6_REG_BASE + 0x220)
+#define W6_RET_CQ_IN_TICK				(W6_REG_BASE + 0x23C)
+#define W6_RET_FW_RUN_TICK				(W6_REG_BASE + 0x240)
+#define W6_RET_HW_RUN_TICK				(W6_REG_BASE + 0x244)
+#define W6_RET_HW_DONE_TICK				(W6_REG_BASE + 0x248)
+#define W6_RET_FW_DONE_TICK				(W6_REG_BASE + 0x24C)
+#define W6_RET_RQ_OUT_TICK				(W6_REG_BASE + 0x250)
 
 /* COMMON - QUERY : GET_VPU_INFO */
 #define W6_RET_FW_VERSION				(W6_REG_BASE + 0x300)
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
index dc0b9867ca37..1c352016a688 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
@@ -32,6 +32,11 @@ struct vpu_buffer {
 	u32 force_i_frame_qp;
 	u32 force_p_frame_qp;
 	u32 force_b_frame_qp;
+	ktime_t ts_input;
+	ktime_t ts_start;
+	ktime_t ts_finish;
+	ktime_t ts_output;
+	u64 hw_time;
 	u32 average_qp;
 };
 
@@ -101,6 +106,7 @@ enum codec_std wave6_to_codec_std(enum vpu_instance_type type, unsigned int v4l2
 const char *wave6_vpu_instance_state_name(enum vpu_instance_state state);
 void wave6_vpu_set_instance_state(struct vpu_instance *inst,
 				  enum vpu_instance_state state);
+u64 wave6_vpu_cycle_to_ns(struct vpu_core_device *core, u64 cycle);
 int wave6_vpu_wait_interrupt(struct vpu_instance *inst, unsigned int timeout);
 int wave6_vpu_dec_register_device(struct vpu_core_device *core);
 void wave6_vpu_dec_unregister_device(struct vpu_core_device *core);
@@ -108,6 +114,10 @@ int wave6_vpu_enc_register_device(struct vpu_core_device *core);
 void wave6_vpu_enc_unregister_device(struct vpu_core_device *core);
 void wave6_vpu_device_run_timeout(struct work_struct *work);
 void wave6_vpu_finish_job(struct vpu_instance *inst);
+void wave6_vpu_record_performance_timestamps(struct vpu_instance *inst);
+void wave6_vpu_handle_performance(struct vpu_instance *inst,
+				  struct vpu_buffer *vpu_buf);
+void wave6_vpu_reset_performance(struct vpu_instance *inst);
 int wave6_vpu_init_m2m_dev(struct vpu_core_device *core);
 void wave6_vpu_release_m2m_dev(struct vpu_core_device *core);
 int wave6_vpu_subscribe_event(struct v4l2_fh *fh,
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
index 525e047ecebf..be1061b2b39f 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
@@ -15,7 +15,13 @@
 static int wave6_vpu_dbg_instance(struct seq_file *s, void *data)
 {
 	struct vpu_instance *inst = s->private;
+	struct vpu_performance_info *perf = &inst->performance;
 	struct vb2_queue *vq;
+	s64 tmp;
+	s64 fps;
+	s64 duration;
+	s64 ms[3];
+	s32 ns[3];
 
 	if (!inst->v4l2_fh.m2m_ctx)
 		return 0;
@@ -77,6 +83,36 @@ static int wave6_vpu_dbg_instance(struct seq_file *s, void *data)
 		   inst->error_buf_num,
 		   v4l2_m2m_has_stopped(inst->v4l2_fh.m2m_ctx));
 
+	seq_puts(s, "fps");
+	tmp = MSEC_PER_SEC * inst->processed_buf_num;
+	if (perf->ts_last > perf->ts_first + NSEC_PER_MSEC) {
+		duration = ktime_ms_delta(perf->ts_last, perf->ts_first);
+		fps = DIV64_U64_ROUND_CLOSEST(tmp, duration);
+		seq_printf(s, " actual: %lld;", fps);
+	}
+	duration = div_u64(perf->total_sw_time, NSEC_PER_MSEC);
+	if (duration > 0) {
+		fps = DIV64_U64_ROUND_CLOSEST(tmp, duration);
+		seq_printf(s, " sw: %lld;", fps);
+	}
+	duration = div_u64(perf->total_hw_time, NSEC_PER_MSEC);
+	if (duration > 0) {
+		fps = DIV64_U64_ROUND_CLOSEST(tmp, duration);
+		seq_printf(s, " hw: %lld", fps);
+	}
+	seq_putc(s, '\n');
+
+	ms[0] = div_s64_rem(perf->latency_first, NSEC_PER_MSEC, &ns[0]);
+	ms[1] = div_s64_rem(perf->latency_max, NSEC_PER_MSEC, &ns[1]);
+	ms[2] = div_s64_rem(ktime_sub(perf->ts_first, perf->ts_start), NSEC_PER_MSEC, &ns[2]);
+	seq_printf(s, "latency(ms) first: %lld.%06d, max %lld.%06d, setup %lld.%06d\n",
+		   ms[0], ns[0], ms[1], ns[1], ms[2], ns[2]);
+
+	ms[0] = div_s64_rem(perf->min_process_time, NSEC_PER_MSEC, &ns[0]);
+	ms[1] = div_s64_rem(perf->max_process_time, NSEC_PER_MSEC, &ns[1]);
+	seq_printf(s, "process frame time(ms) min: %lld.%06d, max %lld.%06d\n",
+		   ms[0], ns[0], ms[1], ns[1]);
+
 	if (inst->type == VPU_INST_TYPE_DEC) {
 		seq_printf(s, "%s order\n",
 			   inst->disp_mode == DISP_MODE_DISP_ORDER ? "display" : "decode");
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
index 7eab283ec9e7..4fa4371545f9 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
@@ -181,6 +181,7 @@ static void wave6_handle_bitstream_buffer(struct vpu_instance *inst,
 			return;
 		}
 
+		vpu_buf->ts_start = ktime_get_raw();
 		vpu_buf->consumed = true;
 		wave6_vpu_dec_set_rd_ptr(inst, rd_ptr, true);
 
@@ -304,6 +305,8 @@ static int wave6_vpu_dec_prepare_fb(struct vpu_instance *inst)
 
 	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_PIC_RUN);
 
+	wave6_vpu_record_performance_timestamps(inst);
+
 	return 0;
 
 error:
@@ -606,6 +609,10 @@ static void wave6_handle_decoded_frame(struct vpu_instance *inst,
 		dst_vpu_buf->used = true;
 		if (state == VB2_BUF_STATE_ERROR)
 			dst_vpu_buf->error = true;
+		dst_vpu_buf->ts_input = vpu_buf->ts_input;
+		dst_vpu_buf->ts_start = vpu_buf->ts_start;
+		dst_vpu_buf->ts_finish = ktime_get_raw();
+		dst_vpu_buf->hw_time = wave6_vpu_cycle_to_ns(inst->dev, info->cycle.frame_cycle);
 	}
 
 	if (state == VB2_BUF_STATE_ERROR) {
@@ -658,6 +665,9 @@ static void wave6_handle_display_frame(struct vpu_instance *inst,
 		vb2_set_plane_payload(&dst_buf->vb2_buf, i,
 				      inst->dst_fmt.plane_fmt[i].sizeimage);
 
+	vpu_buf->ts_output = ktime_get_raw();
+	wave6_vpu_handle_performance(inst, vpu_buf);
+
 	if (vpu_buf->error)
 		state = VB2_BUF_STATE_ERROR;
 	dst_buf->sequence = inst->sequence++;
@@ -1404,6 +1414,8 @@ static int wave6_vpu_dec_create_instance(struct vpu_instance *inst)
 
 	memset(&open_param, 0, sizeof(struct dec_open_param));
 
+	wave6_vpu_record_performance_timestamps(inst);
+
 	wave6_vpu_core_activate(inst->dev);
 	ret = pm_runtime_resume_and_get(inst->dev->dev);
 	if (ret) {
@@ -1567,6 +1579,7 @@ static int wave6_vpu_dec_prepare_decode(struct vpu_instance *inst)
 static void wave6_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_buffer *vpu_buf = wave6_to_vpu_buf(vbuf);
 	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
 
 	dev_dbg(inst->dev->dev, "type %4d index %4d size[0] %4ld size[1] : %4ld | size[2] : %4ld\n",
@@ -1574,6 +1587,7 @@ static void wave6_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
 		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
 
 	vbuf->sequence = inst->queued_src_buf_num++;
+	vpu_buf->ts_input = ktime_get_raw();
 
 	v4l2_m2m_buf_queue(inst->v4l2_fh.m2m_ctx, vbuf);
 }
@@ -1670,6 +1684,7 @@ static void wave6_vpu_dec_stop_streaming(struct vb2_queue *q)
 		goto exit;
 
 	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		wave6_vpu_reset_performance(inst);
 		inst->queued_src_buf_num = 0;
 		inst->processed_buf_num = 0;
 		inst->error_buf_num = 0;
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
index 4a0739033d1a..ca2d4051f9ad 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
@@ -791,6 +791,7 @@ static int wave6_vpu_enc_start_encode(struct vpu_instance *inst)
 
 	src_vbuf = wave6_to_vpu_buf(src_buf);
 	src_vbuf->consumed = true;
+	src_vbuf->ts_start = ktime_get_raw();
 	if (inst->src_fmt.num_planes == 1) {
 		frame_buf.buf_y = wave6_get_dma_addr(src_buf, 0);
 		frame_buf.buf_cb = frame_buf.buf_y + luma_size;
@@ -887,6 +888,12 @@ static void wave6_handle_encoded_frame(struct vpu_instance *inst,
 	dst_vpu_buf = wave6_to_vpu_buf(dst_buf);
 
 	dst_vpu_buf->average_qp = info->avg_ctu_qp;
+	dst_vpu_buf->ts_input = vpu_buf->ts_input;
+	dst_vpu_buf->ts_start = vpu_buf->ts_start;
+	dst_vpu_buf->ts_finish = ktime_get_raw();
+	dst_vpu_buf->hw_time = wave6_vpu_cycle_to_ns(inst->dev, info->cycle.frame_cycle);
+	dst_vpu_buf->ts_output = ktime_get_raw();
+	wave6_vpu_handle_performance(inst, dst_vpu_buf);
 
 	if (v4l2_m2m_is_last_draining_src_buf(inst->v4l2_fh.m2m_ctx, src_buf)) {
 		dst_buf->flags |= V4L2_BUF_FLAG_LAST;
@@ -2023,6 +2030,8 @@ static int wave6_vpu_enc_create_instance(struct vpu_instance *inst)
 
 	memset(&open_param, 0, sizeof(struct enc_open_param));
 
+	wave6_vpu_record_performance_timestamps(inst);
+
 	wave6_vpu_core_activate(inst->dev);
 	ret = pm_runtime_resume_and_get(inst->dev->dev);
 	if (ret) {
@@ -2179,6 +2188,8 @@ static int wave6_vpu_enc_prepare_fb(struct vpu_instance *inst)
 
 	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_PIC_RUN);
 
+	wave6_vpu_record_performance_timestamps(inst);
+
 	return 0;
 
 error:
@@ -2267,6 +2278,7 @@ static void wave6_vpu_enc_buf_queue(struct vb2_buffer *vb)
 	if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
 		vbuf->sequence = inst->queued_src_buf_num++;
 
+		vpu_buf->ts_input = ktime_get_raw();
 		vpu_buf->force_key_frame = inst->enc_ctrls.force_key_frame;
 		inst->enc_ctrls.force_key_frame = false;
 		vpu_buf->force_frame_qp = !inst->enc_ctrls.frame_rc_enable;
@@ -2363,6 +2375,7 @@ static void wave6_vpu_enc_stop_streaming(struct vb2_queue *q)
 		goto exit;
 
 	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		wave6_vpu_reset_performance(inst);
 		inst->queued_src_buf_num = 0;
 		inst->processed_buf_num = 0;
 		inst->error_buf_num = 0;
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
index 6980b126dee5..3ec01ec867df 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
@@ -5,6 +5,9 @@
  * Copyright (C) 2026 CHIPS&MEDIA INC
  */
 
+#include <linux/clk.h>
+#include <linux/math64.h>
+
 #include "wave6-vpu.h"
 #include "wave6-vpu-core.h"
 #include "wave6-trace.h"
@@ -228,6 +231,20 @@ void wave6_vpu_set_instance_state(struct vpu_instance *inst,
 	inst->state = state;
 }
 
+u64 wave6_vpu_cycle_to_ns(struct vpu_core_device *core, u64 cycle)
+{
+	unsigned long rate;
+
+	if (!core->num_clks || !core->clks)
+		return 0;
+
+	rate = clk_get_rate(core->clks[0].clk);
+	if (!rate)
+		return 0;
+
+	return div64_ul(cycle * NSEC_PER_SEC, rate);
+}
+
 int wave6_vpu_wait_interrupt(struct vpu_instance *inst, unsigned int timeout)
 {
 	int ret;
@@ -387,6 +404,80 @@ void wave6_vpu_finish_job(struct vpu_instance *inst)
 	v4l2_m2m_job_finish(inst->dev->m2m_dev, inst->v4l2_fh.m2m_ctx);
 }
 
+void wave6_vpu_record_performance_timestamps(struct vpu_instance *inst)
+{
+	if (WARN_ON(!inst))
+		return;
+
+	if (inst->state == VPU_INST_STATE_NONE &&
+	    !inst->performance.ts_start)
+		inst->performance.ts_start = ktime_get_raw();
+
+	if (inst->state == VPU_INST_STATE_PIC_RUN &&
+	    !inst->performance.ts_first)
+		inst->performance.ts_first = ktime_get_raw();
+}
+
+void wave6_vpu_handle_performance(struct vpu_instance *inst, struct vpu_buffer *vpu_buf)
+{
+	s64 latency, time_spent;
+
+	if (WARN_ON(!inst || !vpu_buf))
+		return;
+
+	inst->performance.ts_last = vpu_buf->ts_output;
+
+	latency = vpu_buf->ts_output - vpu_buf->ts_input;
+	time_spent = vpu_buf->ts_finish - vpu_buf->ts_start;
+
+	if (!inst->performance.latency_first)
+		inst->performance.latency_first = latency;
+	inst->performance.latency_max = max_t(s64, latency, inst->performance.latency_max);
+
+	if (!inst->performance.min_process_time)
+		inst->performance.min_process_time = time_spent;
+	else if (inst->performance.min_process_time > time_spent)
+		inst->performance.min_process_time = time_spent;
+
+	if (inst->performance.max_process_time < time_spent)
+		inst->performance.max_process_time = time_spent;
+
+	inst->performance.total_sw_time += time_spent;
+	inst->performance.total_hw_time += vpu_buf->hw_time;
+}
+
+void wave6_vpu_reset_performance(struct vpu_instance *inst)
+{
+	if (WARN_ON(!inst))
+		return;
+
+	if (inst->processed_buf_num) {
+		s64 tmp;
+		s64 fps_act = 0, fps_sw = 0, fps_hw = 0;
+		s64 duration;
+		s64 latency_ms;
+		s32 latency_ns;
+		struct vpu_performance_info *perf = &inst->performance;
+
+		tmp = MSEC_PER_SEC * inst->processed_buf_num;
+		duration = ktime_ms_delta(perf->ts_last, perf->ts_first);
+		if (duration > 0)
+			fps_act = DIV64_U64_ROUND_CLOSEST(tmp, duration);
+		duration = div_u64(perf->total_sw_time, NSEC_PER_MSEC);
+		if (duration > 0)
+			fps_sw = DIV64_U64_ROUND_CLOSEST(tmp, duration);
+		duration = div_u64(perf->total_hw_time, NSEC_PER_MSEC);
+		if (duration)
+			fps_hw = DIV64_U64_ROUND_CLOSEST(tmp, duration);
+		latency_ms = div_s64_rem(perf->latency_first, NSEC_PER_MSEC, &latency_ns);
+		dev_dbg(inst->dev->dev,
+			"[%d] fps actual: %lld, sw: %lld, hw: %lld, latency(ms) %lld.%06d\n",
+			inst->id, fps_act, fps_sw, fps_hw, latency_ms, latency_ns);
+	}
+
+	memset(&inst->performance, 0, sizeof(inst->performance));
+}
+
 static const struct v4l2_m2m_ops wave6_vpu_m2m_ops = {
 	.device_run = wave6_vpu_device_run,
 	.job_ready = wave6_vpu_job_ready,
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
index bc3d7e192904..00596504c3f5 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
@@ -339,6 +339,18 @@ struct instance_buffer {
 	dma_addr_t ar_base;
 };
 
+struct report_cycle {
+	u32 host_cmd_s;
+	u32 host_cmd_e;
+	u32 proc_s;
+	u32 proc_e;
+	u32 vpu_s;
+	u32 vpu_e;
+	u32 frame_cycle;
+	u32 proc_cycle;
+	u32 vpu_cycle;
+};
+
 struct color_param {
 	u32 color_range;
 	u32 matrix_coefficients;
@@ -423,6 +435,7 @@ struct dec_output_info {
 	int error_reason;
 	int warn_info;
 	unsigned int sequence_no;
+	struct report_cycle cycle;
 	dma_addr_t release_disp_frame_addr[WAVE6_MAX_FBS];
 	dma_addr_t disp_frame_addr[WAVE6_MAX_FBS];
 	u64 timestamp;
@@ -671,6 +684,7 @@ struct enc_output_info {
 	bool encoding_success;
 	struct enc_report_fme_sum fme_sum;
 	struct enc_report_mv_histo mv_histo;
+	struct report_cycle cycle;
 	u64 timestamp;
 	dma_addr_t src_y_addr;
 	dma_addr_t custom_map_addr;
@@ -839,6 +853,18 @@ struct vpu_instance_ops {
 	void (*finish_process)(struct vpu_instance *inst, bool error);
 };
 
+struct vpu_performance_info {
+	ktime_t ts_start;
+	ktime_t ts_first;
+	ktime_t ts_last;
+	s64 latency_first;
+	s64 latency_max;
+	s64 min_process_time;
+	s64 max_process_time;
+	u64 total_sw_time;
+	u64 total_hw_time;
+};
+
 /**
  * struct vpu_instance - VPU instance structure
  * @list:		List head for VPU core device instance list
@@ -883,6 +909,7 @@ struct vpu_instance_ops {
  * @error_recovery:	Error recovery flag
  * @disp_mode:		Display mode for decoder V4L2 control
  * @enc_ctrls:		Encoder V4L2 control and streaming parameters
+ * @performance:	Performance information
  * @debugfs:		Debugfs entry
  */
 struct vpu_instance {
@@ -943,6 +970,7 @@ struct vpu_instance {
 	enum display_mode disp_mode;
 	struct enc_controls enc_ctrls;
 
+	struct vpu_performance_info performance;
 	struct dentry *debugfs;
 };
 
-- 
2.41.0.windows.3

