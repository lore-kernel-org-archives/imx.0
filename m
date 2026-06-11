Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011055.outbound.protection.outlook.com [40.107.130.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67249377544
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 08:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166103; cv=fail; b=OG5lAoey8OGheWP9wKMDYwdHVIuM0/Ldo+o2HeK2WxhA3fAeceI88sDppQBrIvdJ8QO1QYRb8vnPLi9iZhRnX/2CwEKVuRo0GCK5cKMMwJJZwbQzelZLmTrDHIraX07//MlVV1Cgd6pU7GNKyJxWGEHWFKr5iDKCYrFaaHSpmm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166103; c=relaxed/simple;
	bh=3TS9i4F3k3IR8ivbhcWpT5KalveqNJZxLNLxin4mzws=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=uWTSF8qOGWBglFlUp6SuFrWnTL4espRFz/iY1tduVg9EozBB+mGKsy1h+8WjaApY8dNCHnVRD6wvGpRdkBodL0NSVVDrwPrOHujpFunJEfGxsxcEwmrYkLKASm/Uor5fWyA+d5AbGiCZT58JCrmbPjFxCqrXGPbHkMVFU/HcxAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Zt4ln6QX; arc=fail smtp.client-ip=40.107.130.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Zt4ln6QX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIouqzQOWdyi3JEUcCy0tVtaF+o1mNpWVLZQb+XekCSj0CVq7Qiqtc24Lr8ahMKeSOGgKOkPoTOwS746rzP7VgvaS4BP2vEZIZQrOjrX++iSkSaCHvz5mBxqMpgf6xkS7b4xW1Fi4opJflwggMOsG6NakFrRdNaISUYXX7FBfqKMya+YGVQSzBBssZOWsADQZmVhsqK+e8YbVBd2GYAbx/j2lUwiafsQCWs0BXnWYq0cDjlpFMnA8O6apZnS3waOayEu+j7DI+N0xvS1IEJbC/FTKWKJnKthFyhN3Zu620QNubk/9HWyYW/7cYgJmO9ksALgvYiz4u0S7SBBY1vz1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeyZv9YANvqgSv3/788OMvDS4uZMpCAoBr4PCpwB82A=;
 b=Mq4ry6vJiIAICtfs+cP2PhkENjhxOfuZPZCXCb1Borqkz9pp5z2qjJ0SqGcBKVdp0WsEgGxVsD81nqmIADJCFbPL0PG8n2aCLmmqgCFUvgYh7OPUbIeU29dUQYD0HmZfoHcwZVk2XRL15b/ERHwayy9dS0TnoibZKVzuLuKjRNpIAoj2E1Oo7AJZr7IlT7GmsyCfzTPIKsN3ipJ07JF94qLk0O3Jp+g16yUaUKmEoy+XRQsg70xqjzEr6achPzExcRPg1Lqybl0169VPBcOEb/VorINSRyr1xvhEb5PQ2Xxlq5Z5UvbnWOovF37AajZ8hXHGuInpztbeZeix6xx9dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeyZv9YANvqgSv3/788OMvDS4uZMpCAoBr4PCpwB82A=;
 b=Zt4ln6QXY1RkYUFkPAjRHcdEInZ9nw+h2yFVHZRDVTzXc/jADSKQ+euWXX8vzkbmGyOQs6p5MxmIyt/ISa5G//6PjfNM7uEBrQ77xXE1W5tJFu4AYgwJ80FHok0rjHe6q3Di5kCNMISPKQTXtRicwsXT69dCZmCttRnqgQa6plHtIYMWX4IAKawYtJA18gEkXmcnIZ6jQNE8dpLJ5zqE9gmMXQ6w/LNV5uWblSDQsAGO7VPsQPEcnivte+m4gS4r3k7NTmrR2TwIw3F2uYUBjCtIDihvTC7JGtK0llSyk2d+TJVbcPY+iDzXs0QkSlnAubv7OeX1hXW5tsMnWv1SAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8570.eurprd04.prod.outlook.com (2603:10a6:20b:435::12)
 by DB9PR04MB8332.eurprd04.prod.outlook.com (2603:10a6:10:24f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 08:21:38 +0000
Received: from AM9PR04MB8570.eurprd04.prod.outlook.com
 ([fe80::c9cc:24fa:6f6d:fb03]) by AM9PR04MB8570.eurprd04.prod.outlook.com
 ([fe80::c9cc:24fa:6f6d:fb03%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 08:21:38 +0000
From: Ming Qian <ming.qian@oss.nxp.com>
Date: Thu, 11 Jun 2026 17:17:00 +0900
Subject: [PATCH] media: amphion: Remove obsolete frame_count check in
 venc_start_session
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-amphion-enc-log-v1-1-5c0b503dd8ad@oss.nxp.com>
X-B4-Tracking: v=1; b=H4sIAPtuKmoC/yXMwQ5FMBCF4VeRWZvEEJV4FbGgnTJCSYtIxLure
 5dfcs5/Q2AvHKBObvB8SpDVRVCagB47NzCKiYY8y1WmiLBbtjFukJ3GeR3QGkumUlT0pYb42jx
 buX7Fpv07HP3Eev8y8Dwv4dnkDHMAAAA=
X-Change-ID: 20260611-amphion-enc-log-fdf1d7613b5c
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ming Qian <ming.qian@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0327.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::6) To AM9PR04MB8570.eurprd04.prod.outlook.com
 (2603:10a6:20b:435::12)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8570:EE_|DB9PR04MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: a07eaab3-f5fd-4fa8-7c82-08dec7927586
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|23010399003|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	gYQjP2J1pF0pld1IlgUxiLPH1EPwaq55pmlWyFJoleqSJ5KvF7ggRFRkb4FJYawH8hiItBpk7EmKvVToFecSi6OiJpqiUZXcxg6dJMlcVD1u1PmIwRXo4t38yQNlEr2hlHjCXsiy0C5hSQNPjgmb047C1KC3QzSdh3VXa5dqmcp+UtcV706sNBspyGhPrW05932Kw1k1MRfIWiE54TESejBa41NSIkGOT2DsN3DoNo9mU9GSyl/dUVnsrP5UrFPBww8eei8cJNxZjBsI8Bv4wfNiXJIiSS5zvDV4GDBo1q5P72zurxu+ApHhLCzGWJAaJBr55+SUhshdRGGJomj3HJdSWe8ebaf+2rNZpx04JhcOTyD0cP0ZQtUjK6OwazfwlC3idNv6skB/GgWapKXUg9oGIsPpl53XFjtgj8PaedTjOeD0jMPN38v3kawQtHXlcxQiRQophpE3U2TSNFkmGOK3HHJrnc2DDF+Xh5GTlI8rv0fl/eq5pl0PvuoPz1WfHLS6pvrKNLFMMS7fI3gaKNM8gz07EQZL2jRLvFv4/brq7FR6CKkERy8LEG1ByizRQjVtJQF2tOBXMDLRCrx3TRtPopg2a1gfy0ivvTu9zwR90FCcDuA4tQOsM0+ed+4mjCfJ4WDRfICqhTGXrqXxh2oMlLhXiB4b4vAKjLG0/mDCSD8Wi4TGjAUrqE2CvdJT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8570.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(23010399003)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajRJUjkvVnZpdWJJUnNBd1kwdFcwYVRlS0dnZnR1TE9WbnkrVVM2Unc0VE1E?=
 =?utf-8?B?TGhQdXpSNkE1UlNxRURUckVmWUl2S2x1RHBscC9zYXVUOWkzWEZkdisxTTlD?=
 =?utf-8?B?eWoyVENGS3owU3k4djJXc3h6TkNPZGJCR2wxZS9EWS81cHpKU3dGT3pUeFhH?=
 =?utf-8?B?cS9CVVVLVGEvQm1WQnE4dllNR1BCRXZNU1M3WkFKdlVNRGNRTkNPaTV5QnFM?=
 =?utf-8?B?RmVQWFl3Tmd4WFBEc2F4WkE5MkRDTzNFSmVtRE5KbFQzRForUEY3cTJEcWIx?=
 =?utf-8?B?ZTY2WVVSdXk4UWFjcFpWWDJvbmlEMUIrU2VKUFRmbDN1V0RnSi9lL0p1SmRU?=
 =?utf-8?B?NStNUG1DU3lGck84RkZxWE9COUNDcUhrL1VIeW5kdXJST2gyZ2RXbzlGLzJu?=
 =?utf-8?B?U1lNbjhjSHZYSTN1ckR3Y25YdG5uL1g2WVhOZ005ZXQ4Y0hBNWFrbjRWU0l0?=
 =?utf-8?B?RFpnYVhHMXFnN3J4a09ac3phWG92N3RGV1oxYzNMNHhMY2dOU1JtR2lzdnIy?=
 =?utf-8?B?cE5seXZCblUvbnU2dmxEUEl5WE1FelM3OGNHSGJYR1IwbFZicmhKSCtXR0Rj?=
 =?utf-8?B?VzF2QTliNW5XSllUWFJpOHBQQlBOSU9LMktjVE5ybldna3oyTGJxSjN2Q2lO?=
 =?utf-8?B?UDNGdmlkK01yMHNNTVN1MzI4bUtOcGJhWW9LZjh0NVlsQWVoNHFiZGdkUkYv?=
 =?utf-8?B?eng4WTZTVWVEdFFtZlVrZ01ySVVkQVZaZXlqaHgrOVMvSGFob3BaRnltWElI?=
 =?utf-8?B?OWQvbFJNaFVWM05SbnhPcWlRdldNZFNubmtZN2ZYVktmdEVWcWZwMWxQdTN0?=
 =?utf-8?B?dDNETjRoNTBXK1E3RjlRblpRaGNQOXIxQ0ZHZDNoaHdGWGpqYk4wUkhieVlE?=
 =?utf-8?B?b0s1RFpDRkU2Yyt1QVdWRmhteUJMUVljY2JWL21LdWtxS1grdU93QTVPVENl?=
 =?utf-8?B?SjdLUm5IcnZic2RwNE9YMDFuQitkbnZFSEhtSG5FNGF6MFBabUkwTnhBdEVW?=
 =?utf-8?B?cGh0ZDJYUUVQVDRrYTVZV3B2NHJvWW05Yk9nTlVzeXI1YzNKK2ErMCtxVmlD?=
 =?utf-8?B?OUNUQkJhLy9QbkZmTWpaTjlTOEpZSG5iYS9HUnNCaTVtVjQvZjMwOTNxa0FE?=
 =?utf-8?B?ZndIM1dZYUNTSmJ5K3pGaVBUWExncW9yakhBZTBZazJXQTBNQ0FYa3VyRXZR?=
 =?utf-8?B?M25LQ0pQL29DWlNDMUZJR1ZaUGFBaC9kV0NyYUhHTnBRbnJLQUxaUks1R2JX?=
 =?utf-8?B?dkU0Y1N1ZlZoUmJYRGsxZzFIMFpvR0xxMmt0ajRkQSs5RHQwcGptRGdWZVlL?=
 =?utf-8?B?NGhpdld6elZHREtCaTFLaVBNVU03Ukh2RFlIZHFWaEEzUHVjUHFsY2hkb2hn?=
 =?utf-8?B?NlVIdFl6VWM1aTYwRnRSaVRKMG41VGZsZUVvd2hEaWxwL2ZLRWlhTGJ1bjdk?=
 =?utf-8?B?WkhwRTNJWElmQUV4U1UvM0JUa0pMYzJVNXBRS1NQS3Z0czhqc0J3cExrY3RD?=
 =?utf-8?B?QlhydmEwVGxYR2w1SEFZbnIxZUpzWG9xYUkzWVdnVlM3SWo2RUNyQnRNcU5O?=
 =?utf-8?B?dmtGYTNmQ2Q4azArcVExSXNVM3dIVHlBS0RxNFY0L0RFTGpqL0MxaDJnQjVo?=
 =?utf-8?B?V1VsZGorazcyQ29zNFZYQndablhYenNicURaVXVoeTlkemF1dXdhMnRoUUNi?=
 =?utf-8?B?UVlLbUdoM3FjQXVxK0dBY0NWajJqVkg5UzhoUit4VTdJUGxzeS9Eakh6dm1T?=
 =?utf-8?B?bzdyVElBU245Ny9XSnVDWDE4VjFZNkdIUEFKSmVhcDFRWUM5NGZHOEJDK3pa?=
 =?utf-8?B?a1VIWFEzTnJRTDM3dDQyTnA5c0F3QThQL3pBemdJcHF0Yy9MenFKM096a0h3?=
 =?utf-8?B?LzdZNGc0WWFscjhaZjRzWmRzcTlWL3EvY012TGNpWk4yRnhTSW1VZ25Qd3Ur?=
 =?utf-8?B?OUd3dGZzQjV0eGYvcCtvaE9zT2YzL21EY001K2p6UUcvaVJ3cFpzbGJPUDkv?=
 =?utf-8?B?RmFOMEwwWTNTZDhEUSt6V2swOW1nWnJDcWt0SkpYMnhzdW4vTWEzd0w5THNj?=
 =?utf-8?B?bjFQdktzMkdUL3l0cEhWQ3pWRHFUS3g3MXdsS2VmbE9uLzJUUE0reVl4b3Fy?=
 =?utf-8?B?azRKdCtvSk9Db1p6VGJMQ2xyS0RrTHRobldHcDJKdHVSL0JoMGxNVnRWWkFO?=
 =?utf-8?B?amVjMGtQTlM1S0h3dEJ0UXJaNjcvcjBtZkVFVEYyYWZQZjFrVVVMMk8waGxL?=
 =?utf-8?B?UHFzMnRhUGNjU01qMkF4UWEyVUVHWi9OUW1HSGw0Y2pUNUJxS0Z4ckxFcGVR?=
 =?utf-8?B?aGZqSnNUUzF3NHdlc3FidXRLSnJ6c2c5WlVNUEpBMVlYTDhjeWZIdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a07eaab3-f5fd-4fa8-7c82-08dec7927586
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8570.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:21:38.5820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDzFia0wKBilYIvyFw0yMYmZ143VR/vjDKz71jECFnREI60o6JeEtJcpQSacBP53HMimwJqLgr03jazLq4HgEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8332

The dev_err log warning about no input when starting was originally
meaningful when min_queued_buffers was set, as it indicated an abnormal
condition. However, since commit 5633ec763a2a ("media: amphion: Drop
min_queued_buffers assignment") removed the min_queued_buffers
assignment, having frame_count == 0 at start is a normal condition.

Remove this misleading log that no longer serves any purpose.

Fixes: 5633ec763a2a ("media: amphion: Drop min_queued_buffers assignment")
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
Remove a misleading dev_err log in the encoder start session path that
became obsolete after the min_queued_buffers removal.
---
 drivers/media/platform/amphion/venc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/amphion/venc.c b/drivers/media/platform/amphion/venc.c
index 0b3d58b9f2f7..2ba4ae20f829 100644
--- a/drivers/media/platform/amphion/venc.c
+++ b/drivers/media/platform/amphion/venc.c
@@ -973,8 +973,6 @@ static int venc_start_session(struct vpu_inst *inst, u32 type)
 	venc->ready_count = 0;
 	venc->stopped = false;
 	vpu_process_output_buffer(inst);
-	if (venc->frame_count == 0)
-		dev_err(inst->dev, "[%d] there is no input when starting\n", inst->id);
 
 	return 0;
 error:

---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20260611-amphion-enc-log-fdf1d7613b5c

