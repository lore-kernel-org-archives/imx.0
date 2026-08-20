Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6DB3E0724
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 19:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787255343; cv=none; b=jVt818f0HRvbUwiZmIghwLLOdxcqXCsNSVuk1GDUEp0+0WxdL4IqP/8jPtfJxwLWeQWlGNwdMlc9zmfL8gyMKKIDfgMP7j55xva0L6ffe4QsoM/B9iINmYCTfHFlwAn+HYHMARfc3NyQfh5xJtDimMrLv5UGzPsox5YQnOm9eM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787255343; c=relaxed/simple;
	bh=4WRilBWhHzZLU8uvO/z39X42z49BUIa3+WWApYbxJ24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uNtwsecmlgkah4L5aQDQZMZrZOz2PBzFejyZREBvZKlpXKsF+m8Xjeoni59D2fQMUd0wNcW12+JkEoFSwCc38VWld/IdLSn9OuRUGYG3+orI7TH2oouH8Zw9Sktfov95w2kGlof6ZGQd+zkGUcI3H+nrADWwZYweyKj6X32h62c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDgaiLCF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PkAu4jjN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDgaiLCF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PkAu4jjN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIJ4AC3795500
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 19:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c5VY/KOB4mi
	ZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=; b=cDgaiLCF1U6QfVNFp8f+3Ueeh38
	InEt1JCa4eRGJny6UkdnXEJduqbZYLnvFt/R7f1JjpPhw+dCn5cwsdyn9DVuZvN5
	MR9Rh2dDKKSWPNk5njY0QlSYqEY4sC42FK4qrG5G1wXoEAdNdGHbqqVW91c2Mh+D
	TkJ3Z5ec90h/HvI/ErXO2xmJRbAkTJKXYD+6+0Nvpryy8oLEH5x0/6yOKFX1sjFw
	OapQzIlmLGUwMhI8298Gu8xvKxwyRvx1g/DFoOeAa8wyToJIcYCcb90gbxe6Do2G
	3TH7HGHYaPnn5AcjlZJwU9lTrkxnKnvSyil5/iVeeEsHGa9vmeqvqSRmntg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xbvb0uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 19:48:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-904ee4473a8so2437216d6.2
        for <imx@lists.linux.dev>; Thu, 20 Aug 2026 12:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787255339; x=1787860139; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5VY/KOB4miZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=;
        b=PkAu4jjNW/is9Hjd4QoR9bSI4fvuZqhn976yqwn36B4pBzDjy6AZaZXuztmTQ72uj1
         CcDXKv0Obi8rhBzKXVal58oYPlLl33uVyyV9YwZUMSeJgAFlkAmjwLvrQfPHPNBRGBO8
         C8T4PClMwaIhXGp/U9dipybxECqp9f1w6Dr57MZPV2oo5/varkDMwalyes8E6OVZTtej
         rAoyDzfl5DLofewQc3rf3g5oTQ5VYs1PnCxxwschG7UX6X6+gtMzvedhAxz1vfeQLVYQ
         4Xj5hh3YY9NPmjaowEFKK/v/UWRx7iWEgLfMthgnXnQaCa6ckeG56N+LtC4S7QR1kDhu
         uHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787255339; x=1787860139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5VY/KOB4miZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=;
        b=Kgk/KSHse/aFsu3gfEU+kL99alVNqLVnuc7ppQUxwdsti7hAzo1h9apoiDuWnuxkFe
         M/AjGc76lTOnaOth0iizS5A5IqKk9xXcmh+LO79YlRYf0Xd3zBmLxHkk+TspOoCgM/jW
         KDUWCBArGLSir/gJv+dLO439ImouQqV3JU34Qu+H+NR6k5fIo3t0ftvwnTEKS3ayszEn
         +lDvPvJ12/igmDzMZlncd0aIC+B0WSLA1foLSMkHiRrs+VaGQAJEjwuTtakjoM0naK26
         9RYf9jiFNXW+iyPBmXYKgeqriu51FxBJDGX9b6RXMmpU7XnTyTAwfPSgCdlY/8xxssBh
         uvyQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNQOh2SB+Ld6irS+ABZroAvJ9Qmt6qpTpwlylSYBm1j6RGCudR4nNQDFOXymQScO41UjI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAGzwleGpETL5QxVHCFNbt0ar5l4G50Gq9kYxPQuccr9rz8MmH
	n3FhV9fbKowjQ+3/c7k7vMAg1qMmgFadkrcqM4ShwnY3eMeyfYq8D8ILN1Y2N4J+ms4LxP6xuLm
	JRuRKuNOQTw25lbWTnuN4zZQY8XZw1vWeNH8Nzn86nn42evlQFxH2TPI=
X-Gm-Gg: AR+sD127BtAlwtL5ljxQXmUauwII7qSl5EGU/BCPAEfEFBLGitCPEljui3NGLatjqu0
	FhNwYv2NrW4fKyx+yQC9gbiLwDWOERt8eiT1pr7Ks3phIhVIMX2210VSfm2yJBu7E/XIpO/RaBN
	f0kzJn38u4mT4jWBLJqymxM8rmJyVNJCUMsrIncjoNVZLXPuuwhpAWhP87CV+aacxvOszvTBsyJ
	YATS5dmUnVnHhfulXIAdy8Q//qw3nmGHohjhYhHAXi286dh9F9lHuDBY2x6yj9hzY7HzB2ZAGyE
	75pj2thBpDWpMBX84PyFfNhyn0BxiedpvZV3rJH/5qVWCX3wrbWMpG6GWXCkZjIW9AmylBABXdM
	7zQsy7x1i8zYJ
X-Received: by 2002:a05:620a:4014:b0:936:8840:427f with SMTP id af79cd13be357-937395429e3mr52937785a.4.1787255339193;
        Thu, 20 Aug 2026 12:48:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4014:b0:936:8840:427f with SMTP id af79cd13be357-937395429e3mr52930085a.4.1787255338126;
        Thu, 20 Aug 2026 12:48:58 -0700 (PDT)
Received: from shalem ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459198ec5sm113433266b.34.2026.08.20.12.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 12:48:56 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] firmware: arm_scmi: Pre-register protocol, name tupples for standard protocols
Date: Thu, 20 Aug 2026 21:48:49 +0200
Message-ID: <20260820194850.459739-3-johannes.goede@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=AMKAkK6n c=1 sm=1 tr=0 ts=6a875a2b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=VscC1fOeZKh3OTZq1J8A:9 a=pJ04lnu7RYOZP9TFuWaZ:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfXyCbf7Cp7xd1o
 lT+wIiF1d8NewfgeQGJxjKaN7ZhZBazsDwebjIpjJwK6tXOPatXWyb7emMZc+QDCK746apmhedE
 oODyUHPaiGDblrAN/TNVrHBIEayVppK2QD7UQ0tsSEEgTE40cHRPO0/yYC2ZQCBgLti3COUb2xP
 mIveaszpgGyD5unE+BeHChsfAaADdJcgpWHAxS5pJE0iCFgL7opOP2v+h++/Q3o2zBdOJKJbMmY
 q9gtsBWho22472NjVSxBOvuOzrJeS47h26uFVf2F300anO+seY9ieTLZfrek6Hk5Acxkd+ojLkm
 b5YfVPpe1gFf48pZF5H1r6ixaYd2peQFd6R+5V6+34Bm3IUA1VarugTxwRLAwYLm6VYr88EO2h5
 kZwhCTde1JSidv0CiNoKktLOQUZy6EA+c2RX3Qx+Wlr3Mgv3g2N5ej42QDNytma6gyxvCH579Wf
 vDXWvpy5lh/IXmqrjNg==
X-Proofpoint-GUID: H6BVN_tnOjKwYqHFsf0EDV2WrkMKHKse
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX1ND9QbDjYMNp
 iW970OZDOqSWYQk9PJx2FI218XQjFO1Pvz9gawporlTYNEeFGrVFHmpD6Z6pWgbRwNibN6O06k3
 j8DIvBBWJCk65Xdy81/mxh7D/EfHaE4=
X-Proofpoint-ORIG-GUID: H6BVN_tnOjKwYqHFsf0EDV2WrkMKHKse
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200149

From: Cristian Marussi <cristian.marussi@arm.com>

Driver module auto-loading requires the devices to already be created for
udev to get the necessary uevents based on which udev auto-loads modules.
But SCMI devices are only created after their { protocol, name } tupples
have been registered which is done from scmi_driver_register().

This creates a circular dependency where device creation is waiting for
the driver to register and loading the module with the driver is waiting
for the device to be created.

Pre-register the tupples for standard protocols to break this circular
dependency.

Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v3:
- Drop adding of a bus uevent function this is already done
- Update comments and commit message with a better explanation of why
- Link to v1/RFC: https://patch.msgid.link/20250203100154.140877-2-cristian.marussi@arm.com
---
 drivers/firmware/arm_scmi/bus.c | 47 ++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index d12d5de15a1a..111727904a89 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -77,12 +77,13 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 	if (phead) {
 		head = phead;
 		list_for_each_entry(rdev, head, node) {
+			/* pr_debug() because dups are expected for std protocols */
 			if (!strcmp(rdev->id_table->name, id_table->name)) {
-				pr_err("Ignoring duplicate request [%d] %s\n",
-				       rdev->id_table->protocol_id,
-				       rdev->id_table->name);
-				ret = -EINVAL;
-				goto out;
+				pr_debug("Device already requested [%d] %s\n",
+					 rdev->id_table->protocol_id,
+					 rdev->id_table->name);
+				mutex_unlock(&scmi_requested_devices_mtx);
+				return 0;
 			}
 		}
 	}
@@ -579,17 +580,49 @@ static void scmi_devices_unregister(void)
 	bus_for_each_dev(&scmi_bus_type, NULL, NULL, __scmi_devices_unregister);
 }
 
+/* Standard protocols table */
+static const struct scmi_device_id scmi_std_id_table[] = {
+	{ SCMI_PROTOCOL_POWER, "genpd" },
+	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
+	{ SCMI_PROTOCOL_PERF, "perf" },
+	{ SCMI_PROTOCOL_PERF, "cpufreq" },
+	{ SCMI_PROTOCOL_CLOCK, "clocks" },
+	{ SCMI_PROTOCOL_SENSOR, "hwmon" },
+	{ SCMI_PROTOCOL_SENSOR, "iiodev" },
+	{ SCMI_PROTOCOL_RESET, "reset" },
+	{ SCMI_PROTOCOL_VOLTAGE, "regulator" },
+	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	{ },
+};
+
 static int __init scmi_bus_init(void)
 {
 	int retval;
 
 	retval = bus_register(&scmi_bus_type);
-	if (retval)
+	if (retval) {
 		pr_err("SCMI protocol bus register failed (%d)\n", retval);
+		return retval;
+	}
+
+	/*
+	 * Driver module auto-loading requires the devices to already be created
+	 * for udev to get the necessary uevents. But the devices are only
+	 * created after their { protocol, name } tupples have been registered
+	 * which is done from scmi_driver_register(). Pre-register the tupples
+	 * for known (in tree) drivers to break this circular dependency.
+	 */
+	retval = scmi_protocol_table_register(scmi_std_id_table);
+	if (retval) {
+		bus_unregister(&scmi_bus_type);
+		return retval;
+	}
 
 	pr_info("SCMI protocol bus registered\n");
 
-	return retval;
+	return 0;
 }
 subsys_initcall(scmi_bus_init);
 
-- 
2.55.0

