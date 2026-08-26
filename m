Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDE836BCED
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 10:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740065; cv=none; b=tad+xPH5ItYT4rk5PYLO6+zYmaZvJ55cPwNcKZKKPXBvsiySJ8hfNE6Hs3L+ggJAY6E+uoCGdtQjBzqq9ZLyN2uVzHAAcnuxBo7p8f+gfODagR0jTH5TVoiuEwSYsQ7G56T0RHXewBzHOOTXDMK/GbqVDnS8ZtCtidQsC8QcrFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740065; c=relaxed/simple;
	bh=vSYj1Ys/owwCN8sFbLJ/5CPpCU7lY6/j6/iPP19TXz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sSAnJR+w/S4hDaCSgCOy54d8SEUwqUaP9/hPltsbhvwDuvLV9Ed8mb/8FZuaMHutU/7ApksqLapNu5auDSh+Pob/Ln9IhWbjjwnQvhuTlfYIsuzXpg7oq7p1W4gJBX21+hcJC1CUqkFuVRNY42LkyyYKaFKxX2JwKdE6mj/9W4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osi5enMX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JXwjTuK3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="osi5enMX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JXwjTuK3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAHfHE109234
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 10:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pEM9jPOOZuj
	CwjK6sG3Tm845ZU4s2wO25Iym0LKZjIU=; b=osi5enMX4P/i451oYkNBNO3R8ad
	PXigVu4raCKysQ9kxZ/Idb8DXn95IdRrcUnu5vtWcdmC5bBv0Zp4SuF6OViExIvN
	GthIo/uiTK8/3IqP7K0lZf7hwaO5GaVoHTV2HREUOh2vYcr8c9dTV6aVaRTOscjY
	aBYzKQxixMntjDhbtfja1Cs+LZcoqzzn92r1TQqgTLVuPBql0+AGIn7k/1AOI4Bm
	dYmNENqBsaX6UOoPUkmD86UYJZqs1q9c6LyrC5OEsyXphgSElM6L+2cY/Cln8jHu
	7R238DUpV/QwQZDwiomPQ8DKilVRySS3x8DeayhiXVAJ1iuxb/tgKIuQwCA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9g9bwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 10:27:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ee59064d2so1224661cf.1
        for <imx@lists.linux.dev>; Wed, 26 Aug 2026 03:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740058; x=1788344858; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pEM9jPOOZujCwjK6sG3Tm845ZU4s2wO25Iym0LKZjIU=;
        b=JXwjTuK3SPspG41FbzI0H/+h9ssJKniCG93IZHkYDDpV1srn21TxbGjowVbcPsLpVv
         pxziDiOHmEY5DrOObVrX5CCBcClR+Dc6Vyb7sDUf3D9xuHPRWSvvLQfR5nDgZk35015q
         t9K7X6zPZqcHi7GsUgOB/zScFVgw1h2Qf66/R6rFCu9lukLioHhxuKihwnMf+kq7QWoJ
         BC0ERxr67UdLKf0gBzrcb2RK03uELjGphCGJP9XYCzoUHXI3q2CJkCG3gF3xV9Ks6rzz
         o9q4hi+XyYlBw4RUUG9vLaEcp7j4SGdqyF7n79LDQVwBaRuoMqnXMKqSZZIhm/HZO1YH
         bZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740058; x=1788344858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pEM9jPOOZujCwjK6sG3Tm845ZU4s2wO25Iym0LKZjIU=;
        b=E3QbXM3sHKMgENDCAyqge3WFE3h6oEbj9TjLxAo9YCah7GdjexcpcWj1ZtOD/BxtJo
         h12ZvJgs0lA6AaNXIpVgjiMwfiuoutKWxYzMAWHzrnNEMI7vFENp+Nf1y+8fpwtnGswE
         K4IBBYh1aV6kqxb7IzDbE+hCs10TGiVsYPFdorOZs+cV4L7KMV4c6ojryXYCjlEXFNxp
         4nxMeZwC9K9S560M4fNfT+E9ZlNgjCWsOnEMGIllQXHOPBrAponNd4JR+8/exEg5LdUo
         vuN/mkumRCQyy2OGzwjGR63wC+gnwSM55W2AUItYWF1wgCWs2xzN1fN/z1RvGOzmIlNA
         2C5w==
X-Forwarded-Encrypted: i=1; AHgh+RqmYwX/Z6a7WCa6DbXBYkYeTahmZByMzyThTMPXqhh2wG7ZEmZgrUtNUPOruTOaZWM3JTk=@lists.linux.dev
X-Gm-Message-State: AFuF++kVuCMeh4Qv0bHj3tSWnkzZiARmsYOfCpDdFKB7GoyXM4/CGw5C
	LzwNcnetRHOvQSAYSkkehbD1fY+oHyQlMZqsebms5O5gwbP/aoavchjbsARCO+LOA2JENxYe0NQ
	4PQ/mSITTI6DUQ+EeVNeIy2sx4ZMGRO2bPISNge2Go6v29NKQp/CqFio=
X-Gm-Gg: AR+sD10z14uXmdp3zuxWdluoq+hegj7HK7DIeIl6SNj+de5IAOZdSXEn1p4zXcdadu8
	sQD8JfwlGdO2ymuQmbTJ2i9hLu8+nzAPpSwwOciOjFMHco2fUMC0mGF/zH1ViNyAR1P/ig22HH3
	eCWGPtc5T5viJYPI/I8K2Prv1mQRa0me3oas0Ku/B3hHoWKpkwnSqCB31h2DerI+AtCBhrAYNQq
	3kkGbY1l/VQRVL9SL750B6YNLsw81qAunjmf+cfkRV6gbdlQnQ9HbEiye8WWfdBqqdtDkjU3R3d
	pOFVijotx/v56bjEqSlPup6howLkoGqIFb/gpKgP+j5utIya5KXIapOFegG97MQy7qChA7zaaJS
	6+s8D7z4RNz/ldhf9iCIunUSZ4tfmMPzrW6xDyOaTgJC2mEAO71QW+2SmveMe/By+xART9QEWwQ
	d3Ib3YFU+/wzas88Y=
X-Received: by 2002:a05:622a:118d:b0:51b:fb5f:b263 with SMTP id d75a77b69052e-52e2ec1e5demr130566591cf.4.1787740058124;
        Wed, 26 Aug 2026 03:27:38 -0700 (PDT)
X-Received: by 2002:a05:622a:118d:b0:51b:fb5f:b263 with SMTP id d75a77b69052e-52e2ec1e5demr130566251cf.4.1787740057635;
        Wed, 26 Aug 2026 03:27:37 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d68d1sm506364966b.11.2026.08.26.03.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:27:36 -0700 (PDT)
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
Subject: [PATCH v4 1/3] module: add SCMI device table alias support
Date: Wed, 26 Aug 2026 12:27:32 +0200
Message-ID: <20260826102734.31766-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826102734.31766-1-johannes.goede@oss.qualcomm.com>
References: <20260826102734.31766-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oFHZPGLUM3rbFDcQCyd2Gb0QBQZGw-Jm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX/9uKad7QCjHV
 E4jQ5oo9oBIsv/gQRgo1L0D/8ONLISWNOD+tA9fQzne2OSkqVhP81IOMoC6tw1/JiSSO16G2fyP
 LsSaK1oKnIFjzD2UQSCGaKhJgZPpM2O4rLyBPIGGo4zYZN/GKyjWuq2+GHQ4FrnO1qWerhZqrzR
 ub1cQIWF340yD1aDnSTf2O6iUm7sXbfwcyEiCSvslNM7gzocdy0o5TKKsrSfQcP/PF5HSmbYlaH
 WQRtyZGPOZs+uUcIExsznQPJhgBQkn8LNtzE0Ptr7yrkAAFq6yHVzC+iqujAL8cks2IoJD9b4SC
 LrPoxJknTsL8VMYir6u9rg4ciIxvYvcMmmx41cvb8tJGdjCippsa4Jp+krzVY7ykETaEYbGr+NU
 TBdY5OGSS2v+G5wpG1Mtt1coRTXDm15gxV+PEvj1OrVpjc3+I1Wn4lNNLL38BEkOIyZheyeoAWc
 aQM+fAmx3uO74H/wANw==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8ebf9a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=NbjprmzQH6tOvfj-_-IA:9 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfXweTzTZmqkget
 e4zqlogR8r5ethlK33w9x7irmyhXvbAekunH/1Q4GPg1lCf6aWVHi3J6834n2dx0455RqbQLRTc
 5ZcllkLanTb3lPfzNt+zbJYQsi3eEzg=
X-Proofpoint-ORIG-GUID: oFHZPGLUM3rbFDcQCyd2Gb0QBQZGw-Jm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260087

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
Changes in v4:
- Drop unused driver_data member from struct scmi_device_id (Uwe)
- Drop device-id/scmi.h include from mod_devicetable.h (Uwe)
- Add device-id/scmi.h to devicetable-offsets.c and file2alias.c (Uwe)

Changes in v3:
- Adjust for ad428f5811bd ("mod_devicetable.h: Split into per subsystem
  headers")
- Add '\n' to modalias_show() output, matching other subsystems' modalias

Changes in v2:
- Drop #include <linux/mod_devicetable.h> from scmi_protocol.h
- Link to v1: https://patch.msgid.link/20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com
---
 MAINTAINERS                       |  1 +
 drivers/firmware/arm_scmi/bus.c   | 21 ++++++++++-----------
 include/linux/device-id/scmi.h    | 17 +++++++++++++++++
 include/linux/scmi_protocol.h     |  6 +-----
 scripts/mod/devicetable-offsets.c |  5 +++++
 scripts/mod/file2alias.c          | 12 ++++++++++++
 6 files changed, 46 insertions(+), 16 deletions(-)
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
index 000000000000..1b4ccfa9dcc5
--- /dev/null
+++ b/include/linux/device-id/scmi.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef LINUX_DEVICE_ID_SCMI_H
+#define LINUX_DEVICE_ID_SCMI_H
+
+#ifdef __KERNEL__
+#include <linux/types.h>
+#endif
+
+#define SCMI_NAME_SIZE		32
+#define SCMI_MODULE_PREFIX	"scmi:"
+
+struct scmi_device_id {
+	__u8 protocol_id;
+	char name[SCMI_NAME_SIZE];
+};
+
+#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
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
index b4178c42d08f..91ec3704ee2b 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #define COMPILE_OFFSETS
+#include <linux/device-id/scmi.h>
 #include <linux/kbuild.h>
 #include <linux/mod_devicetable.h>
 
@@ -144,6 +145,10 @@ int main(void)
 	DEVID(rpmsg_device_id);
 	DEVID_FIELD(rpmsg_device_id, name);
 
+	DEVID(scmi_device_id);
+	DEVID_FIELD(scmi_device_id, protocol_id);
+	DEVID_FIELD(scmi_device_id, name);
+
 	DEVID(i2c_device_id);
 	DEVID_FIELD(i2c_device_id, name);
 
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 8d36c74dec2d..5379b1def07b 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -121,6 +121,7 @@ typedef struct {
 /* Big exception to the "don't include kernel headers into userspace, which
  * even potentially has different endianness and word sizes, since
  * we handle those differences explicitly below */
+#include "../../include/linux/device-id/scmi.h"
 #include "../../include/linux/mod_devicetable.h"
 
 struct devtable {
@@ -852,6 +853,16 @@ static void do_rpmsg_entry(struct module *mod, void *symval)
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
@@ -1491,6 +1502,7 @@ static const struct devtable devtable[] = {
 	{"virtio", SIZE_virtio_device_id, do_virtio_entry},
 	{"vmbus", SIZE_hv_vmbus_device_id, do_vmbus_entry},
 	{"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
+	{"scmi", SIZE_scmi_device_id, do_scmi_entry},
 	{"i2c", SIZE_i2c_device_id, do_i2c_entry},
 	{"i3c", SIZE_i3c_device_id, do_i3c_entry},
 	{"slim", SIZE_slim_device_id, do_slim_entry},
-- 
2.55.0

