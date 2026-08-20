Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB64C391E78
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 19:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787255340; cv=none; b=FfOKTVWXJLGfCnz0ZZjkiypL0R1VBfyh6zOYjbGoiTUx+A2VwWKcHT9YlJHzdaAVcCw+Jq7SAWcvqGI9mWxaBky9b62VTo67vvfVaQcs8gW55jjOKY/QPsblkSAk5p7x3L2lEsQOgFIquX7ewVS7MqZPB0xZOSxj7tx/RpoWqtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787255340; c=relaxed/simple;
	bh=u3LVJlrV2TA9ikLtD5YVW5Qnc251euZUSpcSxft7hu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VaRexvKS2gyomTY3Bbta5lO/r/wEE5okMCgKQ6ZG4l2an7pJ2THLAGWZg2X3gQoif++XsOL7C58z2dJLO3glD5YCO8WHSkwCNrQvCr/akwJy5dRLnl2bFfpFt1ZcWaRqxRY15mUcYXIn+HbRB2irPuIwRoYFNuJQ1i9esai+PKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rw49asBN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BS2z9ox/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rw49asBN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BS2z9ox/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIItZI3705825
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 19:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2UnZhL42BZO
	zUigVArKOkVoW3gNb0xtMC9LmMxlRmPE=; b=Rw49asBNDE8qcdtvR6pXpRZLrgh
	+q91xMEh/wfc38Rp2OMDkB8i9YUCHlI1DQc0VmH1xRIuYBjNSKcV/w8eZRZ+zsKK
	GON4SoEvUFETvRRK1XoSp+HNv80RLqAP+zbiC+slbm8TVWVApDpa1WOkMQ9fu2Ho
	Z3oG/wtLfumLhMMx/GL79kMk+gyWqRWsvq162m88r24BCSkP6mlBbo48otVzGebT
	j90BsJndgT/ZoOXZiPXi3wAq6ZCXrBvS1YOOy51udY91K/fMkq7ozwOA5naagTKu
	BmStAKVqekHzfTrsgjrGM87qsflAVhAqmRszx4vRPiDpDpwveThGDr0XYiQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7ufqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 19:48:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936e393061dso17701885a.2
        for <imx@lists.linux.dev>; Thu, 20 Aug 2026 12:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787255337; x=1787860137; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2UnZhL42BZOzUigVArKOkVoW3gNb0xtMC9LmMxlRmPE=;
        b=BS2z9ox/XWqAHJC2VebvaWzZD5AD3LkVoI50cYy6aOKkoqu8oB08BJgYyeYjEJjvs/
         08zEtYnKjTpfmQotT1T1F8c10zbcJAtJhtxedrVwnps8leX7Q+FI+EesnJgBDGQqhgjX
         +Gb1L0Jv07svt6jjPu13DWkdIAlqPkY/M2b1E4uwryk9zXiwVykgVvfli9/rJGesZbIk
         T3/7JCU/M2v3PhqdJRqZPU73s/8cwtV11Sn7ExNayMA2XYcbzc/ptS9dwIvMku2DA86g
         42HzDZjcsabcuQp2tUj3Yg827DQTr4jJ6hgj4/+c1JpKX/XZtRdS0+JP+H/4jA7ucx4Y
         ukWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787255337; x=1787860137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2UnZhL42BZOzUigVArKOkVoW3gNb0xtMC9LmMxlRmPE=;
        b=cYIS8wTIkT1kX/uNCRKiONCWipR35V8I3WP4D2XS1hcMi/dS+zesW43LvMwcCO71O7
         NP03OeazPTFy6zEChdqW8F4+7EqztTr57Wtp0OZMxHQl97oP4+zERU1YoYcxGHSOGhqc
         d2XsnsxHiwpp9QFJuM0oqWYlEo39VuYPQ3NBkk1VywsaWp80/VWJ22InGBSO/wAiq7TR
         /t07D+cxe+hXgsNznvqHNZTD7nNHZFp3U5YI0fpzKI44SxuccKQPJ1PI7ImL9VzTxTIg
         9DnUUv8xNkmaviEzcyYigaT47o63bwDTBf1Z3YjboB2DHeELMhVn+/iRfvrbXw4LvrLZ
         Az5w==
X-Forwarded-Encrypted: i=1; AHgh+RqNQeRQb2H+LkBdvLpmh0ngvyNfAVfxhiyEPgyZFi0vaaXoDdh2USwRY6Wfhm7diFRefVU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMOs2euBtnmHIURVBQYQ6whn7JzUpsrmE1jYbsblFigaFDfWMW
	D/MAmG4z+95DAZKswP08mwG0qbtCvjxAkIYzCYA6z+HJKHzYCoggs6A9R6caE7rzHu2uKi3uLWJ
	Y8hBVuAzO9rQFBBFAQv6fKna29a7PvUZvI2PVVZ/CSqcT62FFfiP3AdA=
X-Gm-Gg: AR+sD10E2cI+lJ5FlZjgO7XToOn04zos4bepHHuxHejnmobboyiP6rsTRKZCvy9PR/k
	ZrxaDIaiEpW1HJWk7mB4vWRHYDM962s1SBt1SvrmQOJTtsYj+yi7VQPDS6Vjw3pC7EnfpTQJKs2
	LVviNLL7psEybzLkE1gz8OgKwrMrIYCjABRIprMmzTpLkY7lQv8Qw2HMDawyEhRPVx/QyTMcD1B
	0/1WntrqaFeqSsle8NaCmWX6P7qb7hOcRwjT3lIpK5E6VTmLcZf33ijsF6n1WhfR6jEQBbuU7FI
	B3RXta1zhei7e2WbbYe/bAPdeUq+1msXNl0eJuMQ8OReMt2Lf1uOfngDjLg9p2VQjkQzTtckfBP
	nGEZ2LPhw5uGg
X-Received: by 2002:a05:620a:2982:b0:936:6c8a:f7aa with SMTP id af79cd13be357-9373942ee43mr53886785a.4.1787255337104;
        Thu, 20 Aug 2026 12:48:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2982:b0:936:6c8a:f7aa with SMTP id af79cd13be357-9373942ee43mr53879585a.4.1787255336046;
        Thu, 20 Aug 2026 12:48:56 -0700 (PDT)
Received: from shalem ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459198ec5sm113433266b.34.2026.08.20.12.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 12:48:55 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v3 1/3] module: add SCMI device table alias support
Date: Thu, 20 Aug 2026 21:48:48 +0200
Message-ID: <20260820194850.459739-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
References: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX0M4D6WxN99BJ
 rsXIEhXhXFMExoudyRU93WOvm9GztGyfjzlPkukZBLbIk4vMRUiPBvvhJV9R5dpyPMJqhqp7MIM
 Lb1oLXPNB3DDb8LdWxoOfrYsU0bp1tEdyjcfSTxQzw0OrGGO6vKNFXw8DhJb4WMGsZSV6PGfEWO
 nGc/vgajXwhNpjx7Qch04ovKsoYDE55FpJWGIdbCuYHA/X25jFOo/yXdORAR4Soy7gCXvjD3Aik
 ESZ4CbkTPz9KaHG8+9IaQNMqLeK3XGTC3eNx5jlP5fRnIf+zbisuIVOYrM6YKVEQAA0qvb/t70N
 3mRuZ1verF9g+dzC84AZkOL8wQrKwb3lyNn+vPQrYaPiFPSJiQZPLtM3MKI30pmYvSPhu3GWQPg
 0KPKIVjy6aFthtljLPisul9M+GX9+dfzV/0592Mk8ahx6d3BE3pY5OOvgEjXbxtsA5rGA0VHW6E
 +ifcCSW/GHFlYp2QOsQ==
X-Proofpoint-ORIG-GUID: opDtkrrOwzZoyx8QkrBrq2wEytereVVR
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a875a2a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8
 a=NbjprmzQH6tOvfj-_-IA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX2wk0CMReHIyA
 WOB1OcRKLIh3ERfIslYsWBg8QW429R0oEACvdDj08BG60fCBSxqy0RongV65osjuBfnYQ0FZf5w
 RE20MeLUjvZ+tGnYHM1gVk9UXYYYZPI=
X-Proofpoint-GUID: opDtkrrOwzZoyx8QkrBrq2wEytereVVR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200149

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

SCMI client drivers already describe their bus match data with
MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
SCMI device tables. As a result, SCMI modules do not get generated module
aliases from their id tables.

Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
visible to modpost, add the corresponding generated offsets and teach
file2alias to emit scmi:<protocol>:<name> aliases.

Use the same stable alias format for SCMI device uevents and sysfs
modaliases. The previous string included the instance-specific device
name, which is not useful for matching modules.

Assisted-by: Codex:GPT-5.5
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v3:
- Adjust for ad428f5811bd ("mod_devicetable.h: Split into per subsystem
  headers")
- Add '\n' to modalias_show() output, matching other subsystems' modalias
- Link to v2: https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/

Changes in v2:
- Drop #include <linux/mod_devicetable.h> from scmi_protocol.h
- Link to v1: https://patch.msgid.link/20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com
---
 MAINTAINERS                       |  1 +
 drivers/firmware/arm_scmi/bus.c   | 21 ++++++++++-----------
 include/linux/device-id/scmi.h    | 19 +++++++++++++++++++
 include/linux/mod_devicetable.h   |  1 +
 include/linux/scmi_protocol.h     |  6 +-----
 scripts/mod/devicetable-offsets.c |  4 ++++
 scripts/mod/file2alias.c          | 11 +++++++++++
 7 files changed, 47 insertions(+), 16 deletions(-)
 create mode 100644 include/linux/device-id/scmi.h

diff --git a/MAINTAINERS b/MAINTAINERS
index fc6ca082106f..ee5beee606fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26334,6 +26334,7 @@ F:	drivers/pmdomain/arm/
 F:	drivers/powercap/arm_scmi_powercap.c
 F:	drivers/regulator/scmi-regulator.c
 F:	drivers/reset/reset-scmi.c
+F:	include/linux/device-id/scmi.h
 F:	include/linux/sc[mp]i_protocol.h
 F:	include/trace/events/scmi.h
 F:	include/uapi/linux/virtio_scmi.h
diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 793be9eabaed..d12d5de15a1a 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -13,11 +13,12 @@
 #include <linux/of.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/device.h>
 
 #include "common.h"
 
-#define SCMI_UEVENT_MODALIAS_FMT	"%s:%02x:%s"
+#define SCMI_UEVENT_MODALIAS_FMT	SCMI_MODULE_PREFIX "%02x:%s"
 
 BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
 EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
@@ -141,7 +142,7 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
 	int ret = 0;
 	const struct scmi_device_id *entry;
 
-	for (entry = id_table; entry->name && ret == 0; entry++)
+	for (entry = id_table; entry->name[0] && ret == 0; entry++)
 		ret = scmi_protocol_device_request(entry);
 
 	return ret;
@@ -197,18 +198,18 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 {
 	const struct scmi_device_id *entry;
 
-	for (entry = id_table; entry->name; entry++)
+	for (entry = id_table; entry->name[0]; entry++)
 		scmi_protocol_device_unrequest(entry);
 }
 
 static int scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
 				      const struct scmi_device_id *id_table)
 {
-	if (!id_table || !id_table->name)
+	if (!id_table || !id_table->name[0])
 		return 0;
 
 	/* Always skip transport devices from matching */
-	for (; id_table->protocol_id && id_table->name; id_table++)
+	for (; id_table->protocol_id && id_table->name[0]; id_table++)
 		if (id_table->protocol_id == scmi_dev->protocol_id &&
 		    strncmp(scmi_dev->name, "__scmi_transport_device", 23) &&
 		    !strcmp(id_table->name, scmi_dev->name))
@@ -245,7 +246,7 @@ static struct scmi_device *scmi_child_dev_find(struct device *parent,
 	struct device *dev;
 
 	id_table[0].protocol_id = prot_id;
-	id_table[0].name = name;
+	strscpy(id_table[0].name, name, sizeof(id_table[0].name));
 
 	dev = device_find_child(parent, &id_table, scmi_match_by_id_table);
 	if (!dev)
@@ -282,8 +283,7 @@ static int scmi_device_uevent(const struct device *dev, struct kobj_uevent_env *
 	const struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
 	return add_uevent_var(env, "MODALIAS=" SCMI_UEVENT_MODALIAS_FMT,
-			      dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
-			      scmi_dev->name);
+			      scmi_dev->protocol_id, scmi_dev->name);
 }
 
 static ssize_t modalias_show(struct device *dev,
@@ -291,9 +291,8 @@ static ssize_t modalias_show(struct device *dev,
 {
 	struct scmi_device *scmi_dev = to_scmi_dev(dev);
 
-	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT,
-			  dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
-			  scmi_dev->name);
+	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT "\n",
+			  scmi_dev->protocol_id, scmi_dev->name);
 }
 static DEVICE_ATTR_RO(modalias);
 
diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
new file mode 100644
index 000000000000..4150481524d4
--- /dev/null
+++ b/include/linux/device-id/scmi.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef LINUX_DEVICE_ID_SCMI_H
+#define LINUX_DEVICE_ID_SCMI_H
+
+#ifdef __KERNEL__
+#include <linux/types.h>
+typedef unsigned long kernel_ulong_t;
+#endif
+
+#define SCMI_NAME_SIZE		32
+#define SCMI_MODULE_PREFIX	"scmi:"
+
+struct scmi_device_id {
+	__u8 protocol_id;
+	char name[SCMI_NAME_SIZE];
+	kernel_ulong_t driver_data;
+};
+
+#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index a397213bedac..d241421c36aa 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -49,6 +49,7 @@
 #include "device-id/pnp.h"
 #include "device-id/rio.h"
 #include "device-id/rpmsg.h"
+#include "device-id/scmi.h"
 #include "device-id/sdio.h"
 #include "device-id/sdw.h"
 #include "device-id/serio.h"
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 5ab73b1ab9aa..ba53302d95f5 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -9,6 +9,7 @@
 #define _LINUX_SCMI_PROTOCOL_H
 
 #include <linux/bitfield.h>
+#include <linux/device-id/scmi.h>
 #include <linux/device.h>
 #include <linux/notifier.h>
 #include <linux/types.h>
@@ -951,11 +952,6 @@ struct scmi_device {
 
 #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
 
-struct scmi_device_id {
-	u8 protocol_id;
-	const char *name;
-};
-
 struct scmi_driver {
 	const char *name;
 	int (*probe)(struct scmi_device *sdev);
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index b4178c42d08f..da5bd712c8da 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -144,6 +144,10 @@ int main(void)
 	DEVID(rpmsg_device_id);
 	DEVID_FIELD(rpmsg_device_id, name);
 
+	DEVID(scmi_device_id);
+	DEVID_FIELD(scmi_device_id, protocol_id);
+	DEVID_FIELD(scmi_device_id, name);
+
 	DEVID(i2c_device_id);
 	DEVID_FIELD(i2c_device_id, name);
 
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 8d36c74dec2d..a5283f4c8e6f 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -852,6 +852,16 @@ static void do_rpmsg_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
 }
 
+/* Looks like: scmi:NN:S */
+static void do_scmi_entry(struct module *mod, void *symval)
+{
+	DEF_FIELD(symval, scmi_device_id, protocol_id);
+	DEF_FIELD_ADDR(symval, scmi_device_id, name);
+
+	module_alias_printf(mod, false, SCMI_MODULE_PREFIX "%02x:%s",
+			    protocol_id, *name);
+}
+
 /* Looks like: i2c:S */
 static void do_i2c_entry(struct module *mod, void *symval)
 {
@@ -1491,6 +1501,7 @@ static const struct devtable devtable[] = {
 	{"virtio", SIZE_virtio_device_id, do_virtio_entry},
 	{"vmbus", SIZE_hv_vmbus_device_id, do_vmbus_entry},
 	{"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
+	{"scmi", SIZE_scmi_device_id, do_scmi_entry},
 	{"i2c", SIZE_i2c_device_id, do_i2c_entry},
 	{"i3c", SIZE_i3c_device_id, do_i3c_entry},
 	{"slim", SIZE_slim_device_id, do_slim_entry},
-- 
2.55.0

