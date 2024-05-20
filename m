Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2054.outbound.protection.outlook.com [40.107.22.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59C41CD37
	for <imx@lists.linux.dev>; Mon, 20 May 2024 08:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716195343; cv=fail; b=H6qfhFE0vYoRf0O+rvrPjV/omW0I7mdoMu4HvxHVPZcz5mx+Fgg2pq/rodts2dXeFoY7f14k5LL8nUH22m//aW6q5uOUY+Ih6XBypI8fTOp5zniwiLBKb1qx9lW3DogFc8SEKQZwIu/INbgwTfPapsoIZuVjRFgyzBF4m1i8Hyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716195343; c=relaxed/simple;
	bh=FGb15c5m30Vxs4SJ9wfy6ye0IbYovtLHI6qkWCYYuOs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jD1Wax8BLV9atD3iv/cqYuhf6wjRqg3v9BCIB9krB7IgcKixSulyigLjBxHT4Db7X5ydGbgP1TIBZ8w5eB4r/2VZ4FpXQ90zuTKJvlMNspHWKZ6Xm15RIPNdGngGYuRBXsTl9OMkjgTBS572Nji+Zj7Vy8NLRS7oWsxJamvYh0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=oVC4QtNu; arc=fail smtp.client-ip=40.107.22.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="oVC4QtNu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jf1mGEp5YStthCqq69smzDvsCrVMViZDOJi2zhlDJx1SVP5VFVd7amV3JFY36y4o5e9o8/4PRs0lxdQD6D0zkhTFdDsSaqo4Kr3SJBMu92J2VAZdkwYNvXUjsXwACyvTRKiZViEVhTn5eY4XMYRwig38YUQeUDZr7Kw/Ki2vhGTfTguY4UXS8sm946pZ92zmqePgpIEQ1FkM3FJsWwGWvEW/NCyd1T1qVcHmuC+BGxn840iNyX3HCTlgH/L1bQhIx0feVMt5+gReJkP8TT5BzpEUOgxVSNuwm7hKvBcfOJ0l5LPXzFRYJe7mhSKVUGuE3cWQirgN84upoT4AyHpW7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDTBbgpO+wbOTV0yzye33Vzc1h58uZ/+lQT6ih8zxBg=;
 b=n08zocFhk0gTTcgH4hn5dyeNvEdCkezRARq9802T6BXI4ONELpbGn7hV27k0CYgAknRrH8EE+RcCVIasJg8OviqxLqI/gzH1XMMieckO9Xij8rzSNZCwWXAGz9JS93ylosA7kBxSodShNBTKGq2Z6rJyz5u2pu7cKwcFQdTJrPLDgRyDLNSxEVAEQ2mz7fRf2SVOzkYL8Ibx5wc8et51yHSuLvrD91SRW4IefGJqdVfNCvJgAo0xgwCGemI8pZy0a2lXCi1yUM//VIsjxfLjlMeZyyfHKcxZU8Xm94om3ynLg9po7pI9aH0kwJkwDPvyrAplODbbKkyDlFw5x1vaeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDTBbgpO+wbOTV0yzye33Vzc1h58uZ/+lQT6ih8zxBg=;
 b=oVC4QtNuxg23mRm8vD3XOtDpwFl/wvF3DyoKgtfnn04AzSkBLNSw16IqJA7ALppEaDlV8CHChkXmq0682i0Bt/pbtvqNpPIMR3NqQW57ekYWNv0gwfeDGlr99WQ8qhgydo/+BIGFS549HMVrO/FaBPwFOwgPnEnRmLFYl3e5g+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 08:55:36 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::8d2f:ac7e:966a:2f5f]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::8d2f:ac7e:966a:2f5f%6]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 08:55:36 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: frank.li@nxp.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] ALSA: usb-audio: fix potential use after free issue when remove module snd-usb-audio
Date: Tue, 21 May 2024 01:03:49 +0800
Message-Id: <20240520170349.2417900-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0233.apcprd06.prod.outlook.com
 (2603:1096:4:ac::17) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI1PR04MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: 60406dae-446d-4625-c891-08dc78aa9d8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|376005|1800799015|52116005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0+gQEjXTXNZS8vEa/k/mAa3GBsmefdek3GFx4ZrSrfmg6Jc8m9XO6oVIjCNE?=
 =?us-ascii?Q?4Wmg3YC1oTevcFD5UAT/NHKIaKwtpq72ee8I5cb1nxVTYKggU97xW+XPx1uP?=
 =?us-ascii?Q?FGz5gzSu8XSlTvWlg/trFLXSKV8cNR/s/bagT5rMgJ6yqPEImoRMT88Xuvs/?=
 =?us-ascii?Q?0Se3UpLNrSgyv9qMIuYkozKuXNly1TdEhSlRA85xL1UtIQOF8VWtrWAckHWP?=
 =?us-ascii?Q?yimVEsTwWj+dMM61yD7r67XxKoPLNupYLHXGDzQ6hKObLuJ7CIV5KxrXtBEj?=
 =?us-ascii?Q?jL05YznCZdRlqQNuTAI15MUnEDnS1EEmEkBc8P1XavKO58MkUivXxeiTh9cl?=
 =?us-ascii?Q?LLQllJU1nvKiQ9fVvOF2Py7cG6pMvnPrnBDGp37yeypRiWsyzsXEFKzXlCu/?=
 =?us-ascii?Q?SuCLMCsvWsIMRAEixWoygmZOgU7lJzi2oecFmv8aQ0a78fP+Px5ZUTr65QHJ?=
 =?us-ascii?Q?8dl3WfpzoQmH9qf0j7kpR5fbgHgdrsRhDtVssunmQdTqsQ3MmK+Tz5lBM93D?=
 =?us-ascii?Q?QLkjtAwtpB1jJdFoYNKOfExDCLTxwB56bDGK7dMKrikFEOI/pydkwWPwqlsx?=
 =?us-ascii?Q?Y7ywqvORI3ylXq9nXb5JxVpn23rrSGx2x7MeI6Enw74RgC1KHUj9k0IXc2mA?=
 =?us-ascii?Q?OzAEYBhygfMelp8GPl/cQGheMhX9Pe5BmGrLyfj9xMw7bJkmfDFj0TlvD9Au?=
 =?us-ascii?Q?vxzBjAbyb840QQtotVAcTAI5gA53ehEXVEYjU+eW9G7P3YaHcvV/dCFRHQ9V?=
 =?us-ascii?Q?wShjgRcy4UKPbbi81J84GtUHcToDyJk8bXcTQJfYBf61+Xcxmv5O7t24dCIY?=
 =?us-ascii?Q?bUUPXJrfetSWJS8hI+EeKiSLgpZLYOOykH30W8C/Egh+PCHqTl4q7CZy2mkA?=
 =?us-ascii?Q?TDVqtEQ3dEddnwUTcZZMT1yawBr3CAPL5AnokLDLAkJbci2n+VnkVIoMHckI?=
 =?us-ascii?Q?6RLKVb/aJT/sQ3/PitP4b6J2coOy4H73Go693X+eA8GbbGaiXNnllWct10H5?=
 =?us-ascii?Q?aJOhdcLwKtevH0qvZ6W+cmpLsRNiyWwMYFqeGBIynajMUrXj5oX4Wpx/nSWD?=
 =?us-ascii?Q?K6YBYt2qSEBKZYls+uAX2qU9kRRtlHee+0lSuT2BWO98fkftVEAfKPZbRtoA?=
 =?us-ascii?Q?S8Fxv8ecLHsihCCACB+rhvzTGFVuC+UMYIW0mx1y4I+FNLbwTEDDBW5n3kV2?=
 =?us-ascii?Q?XcDt8kcVafWzWf94w0jiTh6w4ZWQ9y0nHW83VYCVQhJkBE+grbimyQRzGx3T?=
 =?us-ascii?Q?7AHffn5TUHjmZ6vHqwPltVdMT4s+q/7J2/NYP1dkGc6v1kWmlCylv2Wn0AH8?=
 =?us-ascii?Q?wCwlfxnF/lQhj2gy2gYnAFgUTbso1yx23vj9ztkxrVUzAA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VPeFpEjuq98zA5VTCs1S1EFjxy+O5sz4w69pCsaomirW3aBciOC43JkK9Uhm?=
 =?us-ascii?Q?lPmLJGV4YS+zbuIL36NYFu6iGS2xh6jVzxrhAOKSDVwd//HEqtc87Qv/w8xW?=
 =?us-ascii?Q?hs8v7YMFKvE1MUdPdLm3SyhMnSIo3Td8zB/361yaktrmldwqAAI6vmiz2enQ?=
 =?us-ascii?Q?L8EXk5FuCeVoiFgVRSVc3s7T6fH79kOq1nqXLw/dyh88GA7mjKZyi0xEnOMo?=
 =?us-ascii?Q?SXDReRsz39pd6/n+WMQB/Uc8oNnk3rHcN+EFerjr0lok4Kvb99GPlyxGO19Y?=
 =?us-ascii?Q?/YagLkmcNiNgFKe7OumEaft/qxrHfsIjZAe0ulIr2SdNIaoPmbG00/gE09jP?=
 =?us-ascii?Q?tVkOECRRyAC8yIEp2Y+Z+NJSao4Z04JWI4mNLfBn9098MaJelp6/R0kMyfVG?=
 =?us-ascii?Q?8kW7VCtTT4Fi3VttV1p6NU+iF0OckhwDHvqQPphMnRpQ56qutYuDCCPA8vsv?=
 =?us-ascii?Q?tAD2Vny+8soItudiJ2c3HG6SZw7cc1QHg++yoQ1BpupPr9WGIw/NKqsEP7+6?=
 =?us-ascii?Q?2ePFNJV/PjCBhF27YWlAxEAkKhPU327BMQt0mcXN3Or2IOVL0BxyrNK8a5Ak?=
 =?us-ascii?Q?vtCnysMAXwrqWDr+WmStB4wwcg9eSudvp/VtTwpbIIhtYc0koS8g/3Ls2fcd?=
 =?us-ascii?Q?lobjgaIPnq8kOSxqPLG1epyE2IoCIUBT9acZp0p4uyXHhh6baFUEcBsHbFwl?=
 =?us-ascii?Q?R0QLpyH/aoCRO2YhgWi4b7EqXcn5ACd/rLphPxg12QqEutd+/rRvC01v82HE?=
 =?us-ascii?Q?YkqVlX74kREpezXCuirNhU1ushdtLk4ieZzM1v5vfXx0HcNajVazCW45wfJz?=
 =?us-ascii?Q?9JZ0BXyhIo6WBrJSq58ztnjOliTnU8cEMbuxVrIgSCQg3js4Jn9pE60DGVRE?=
 =?us-ascii?Q?7ajC2/6QyzE79jKrxaVKegDKTfT0XyCKulFYshpHlbcjjksiTqui36fIag6L?=
 =?us-ascii?Q?WS3shGldnI+5c/iko3EIy6Ewo23lJ6HzfYsGUoUvWaTJliYS427UjSNG6Ckh?=
 =?us-ascii?Q?LX9DR2f41OCRkE+EuIFWN/Zir5WQfCDS5htM8mfEwOd6w74AEQWAuFHAhLgV?=
 =?us-ascii?Q?ZySBIp7IKDjweWrnO772noPjWISUP5l0D+fY5fIrhZkKUJJvnjWmac+dh/8R?=
 =?us-ascii?Q?P/WpQYxsD4WwJRsEE05QQOir4iuWKwHPNX5mW6+01vVtp9foZD9apmM0C2ge?=
 =?us-ascii?Q?kjvmfcvU6595Lw5kzDeiMgPuG1umO6h/UUO8xPM9gUESX6R0FSr20mYWsPkO?=
 =?us-ascii?Q?dsCV2JfPgkD3An8ep16JNVeC/EC529Kw7zKDSWYqxmPWhovsvwKMKkcAtUA0?=
 =?us-ascii?Q?cEGQvRGyNtyJbwfVQ1JXU2cP+KQisBAq8ydhNmZL5T9z/eNmGjicWRGakvHH?=
 =?us-ascii?Q?VcWzcPr3UwYijK5Ew+0FPxU/a9Z1eiIT8bULdJNWHjQq8uk6OWtmETnMulYe?=
 =?us-ascii?Q?o2dao8ESeeTGMrJi2HI43W0zK0+MbGOIKa4Qgi0qmOR2ezkO9tPOW+tpbf45?=
 =?us-ascii?Q?5npqr7rHdMAUf3VDimFt7KQ14Xg5jONwjTenYLAQEysvIImSLZYx4rHYJVlB?=
 =?us-ascii?Q?5kneCocBceL9iRTKQj65PYjZbot1//XjTNTgWICO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60406dae-446d-4625-c891-08dc78aa9d8f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 08:55:36.5798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jT5b+KxUYCSBG9jmUQMOg+gEfjS7cfNMCUULBb5ZmbYOCN/YF6pTQvrNTkUy0e2sxplej8OH1mjcbmZf5KOjGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

When remove module snd-usb-audio, snd_card_free_when_closed() will not
release the card resource if the card_dev refcount > 0 and
usb_audio_disconnect() will return directly, finally kernel will release
the module resource. Then if the userspace continue to cleanup sound card
resources, such as close controlC0, the closing path will touch this
modules' code, unfortunately it just got released and the kernel will
dump below error:

[  183.450073] Internal error: Oops: 0000000086000007 [#1] PREEMPT SMP
[  183.456345] Modules linked in: snd_usbmidi_lib snd_hwdep [last unloaded: snd_usb_audio]
[  183.464373] CPU: 0 PID: 537 Comm: wireplumber Not tainted 6.6.23-06215-gc5317d88b3ec #708
[  183.472552] Hardware name: NXP i.MX93 11X11 EVK board (DT)
[  183.478039] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  183.485004] pc : 0xffff80007c19a3b0
[  183.488507] lr : snd_pcm_dev_free+0x3c/0x70
[  183.492708] sp : ffff800085c77af0
[  183.496030] x29: ffff800085c77af0 x28: dead000000000122 x27: ffff0000079f8090
[  183.503188] x26: ffff0000079f8090 x25: ffff00000e78c270 x24: ffff00000e78c000
[  183.510336] x23: ffff00000e78c1a8 x22: ffff00000e78c000 x21: ffff00000b6a2718
[  183.517486] x20: ffff800082608180 x19: ffff00000d2d7400 x18: 0000000000000000
[  183.524635] x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffffa0000b90
[  183.531786] x14: 0000000000000000 x13: 0000000000000000 x12: ffff700010b8ef49
[  183.538939] x11: 1ffff00010b8ef48 x10: ffff700010b8ef48 x9 : 0000000000000000
[  183.546086] x8 : ffff800085c77a50 x7 : ffff00006ccd77b0 x6 : 0000000000000003
[  183.553236] x5 : 00000000000000c0 x4 : ffff00000ea57000 x3 : dfff800000000000
[  183.560386] x2 : 0000000000000007 x1 : ffff80007c19a3b0 x0 : ffff00000d2d7400
[  183.567539] Call trace:
[  183.569992]  0xffff80007c19a3b0
[  183.573134]  __snd_device_free+0x94/0x16c
[  183.577156]  snd_device_free_all+0x70/0xe8
[  183.581258]  release_card_device+0x30/0xc0
[  183.585363]  device_release+0x50/0x10c
[  183.589124]  kobject_put+0xe0/0x184
[  183.592634]  put_device+0x14/0x24
[  183.595954]  snd_card_file_remove+0x158/0x22c
[  183.600322]  snd_ctl_release+0x174/0x194
[  183.604256]  snd_disconnect_release+0x128/0x178
[  183.608798]  __fput+0x160/0x3d0
[  183.611955]  __fput_sync+0x74/0x84
[  183.615370]  __arm64_sys_close+0x4c/0x8c
[  183.619302]  invoke_syscall+0x60/0x184
[  183.623072]  el0_svc_common.constprop.0+0x114/0x13c
[  183.627960]  do_el0_svc+0x30/0x40
[  183.631288]  el0_svc+0x38/0x70
[  183.634356]  el0t_64_sync_handler+0x120/0x12c
[  183.638724]  el0t_64_sync+0x190/0x194
[  183.642403] Code: ???????? ???????? ???????? ???????? (????????)
[  183.648497] ---[ end trace 0000000000000000 ]---

To fix the issue, use snd_card_free() to release all resources (including
all files attached to the card_dev) instead snd_card_free_when_closed().
Then, even the userspace trying to cleanup the resources, kernel will not
touch the released code memory.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 sound/usb/card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 1b2edc0fd2e9..5e799f147eb5 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -992,7 +992,7 @@ static void usb_audio_disconnect(struct usb_interface *intf)
 	if (chip->num_interfaces <= 0) {
 		usb_chip[chip->index] = NULL;
 		mutex_unlock(&register_mutex);
-		snd_card_free_when_closed(card);
+		snd_card_free(card);
 	} else {
 		mutex_unlock(&register_mutex);
 	}
-- 
2.34.1

