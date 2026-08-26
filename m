Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471B23C277C
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 10:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740068; cv=none; b=eaEx/qsHtK3l38ugv/PPC3NhmRGGPspYW58tnXgaO1au8RDyxXMe75BT3pNx+z+rovB1xxebuDKX7oWrZ0yuuMqueBp/JSUANzGgydDi8NJ8SmumxuUiq+U3RAS9Vii3dBSXf8hHyUHFAoPsNfxUohnp5SH7ydWkmgAjumUeyDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740068; c=relaxed/simple;
	bh=Lf0DV6zqTiNRbRqg0PwFD+T9VOrPKtziLfLRHxcXw+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tYdH/45of5jM89Nxn/v8ELL3OjtjRrA/c1CC/u/XJbshUgAuNC7BR5Bnh9xXxL+X2lXbEp8zeJuW0UZ9MCsXRRy9Ywt6dawWKTIev3z/MhWytMfTQihkB6xD0BEGzsFvWU1kqetOTillDTGNBliHS6GZhYYlLxCeuuogNFqAAdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rc1NaWyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LzOG7SVu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rc1NaWyI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LzOG7SVu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAH3AX518240
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 10:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gbJ+FmOGmDz
	b9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=; b=Rc1NaWyIaY7ZCx9lrwqpQlqjhuG
	Jkt1Edc+sE4suC4XX8di+BV6gXRtEKcWnDl5zOghZIQ3NmzVc5WG+gu8kL7NEKyv
	3+z39tbHV+FRro5ovW9bbzlreg0MhpZj1HkgcJrOZsAEYdIjHnPrbHTwckRidgQ4
	4Sh2VDN72DFdLj9j2O9BIBS+hOTfSKamgMX5jqdYGWpMNY/hr2o8J4AvJLoeKERw
	QGYkeOxZV/7znyLfr6e+lNJBWXMMnOiQYRD8ZSLqdHsF/f42T8PWSfYt1A7G8u5e
	WgN0RBfFdrRUDWfFC3E96RoOCfk4RyeHsircR6JcCSWTtGhTSfmOxEtPfYw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9x2n02xj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 10:27:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8b0a08d2so3628641cf.0
        for <imx@lists.linux.dev>; Wed, 26 Aug 2026 03:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740061; x=1788344861; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbJ+FmOGmDzb9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=;
        b=LzOG7SVuB4gBM1xXn0dydLk6Vxf2FS6rRt2SU/GhBeDp2NnpAKp+HH8hbBYIA+WXbA
         6xwoOisJmi89fcDFWFFteLM720VAlNvp2m5tTLFGZkUEg/2QRVhAuBri2lB++VWWQwJ3
         JXewVnvUvDTk0dKUbAk4ZyBXRIAQG1PkZWLAnypUi3WJpub6m6di9RiwMYKVtbitvuvv
         hrDMtKC2V6QuVVDwdA8hB08Aq9d1Jqmr3fo5DoDhVmIRH9TmxNyj0H4wSsdYYj2qO2mn
         OfbdWsrWVXLZMIQnbv9vJUjqrICG8yCutPI0y3hg0xbB/aYFRF0DvkbG5Pp0JyYrecLt
         QXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740061; x=1788344861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gbJ+FmOGmDzb9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=;
        b=keuP1ZR1zJNgr42Bgk+WEI5uZpbeUzkbAryl9zpGTfwhQuWG5A00U9FEcV7VYQjuTk
         /7sJoaq9wF4M7qIsNcjwr0242DJx5KYOdOG6KMGoHDWCXHQ+lY9TRBPDEIUYaAO1DdGB
         6JamWgKGCXx7NlmE5zihTq+xOWvDnZMddvMpgQAEkEU8/z1uLkFTEmJ2RqvZXGwHEoSf
         eYV6g73kgCzz6nqTGAjOneyPFvRh+s1Dm4DS6d6lQTI6VFxAMYROTEgwUsfcnOW/uwtQ
         2ty0vIHabbhJlPfR9W8XIEBBWGHILUqN6gAf5Cm7SbVzLHXGr1TUTMSVhIx4ES6eSdEe
         buYg==
X-Forwarded-Encrypted: i=1; AHgh+RoXmVkGkfbYqHelWxVk3RhbDkOSSMO+6QFCclLrKXotSkKwRzu87jXJu0EUjd6skx3vteU=@lists.linux.dev
X-Gm-Message-State: AFuF++nwKxw1pXrbpC8zQQqBfQPejHGYFr1Nuj42wbiOaoGaEyyWGKYw
	tsi+z0q8IYnG6yWtFK6bRvnZNhIO3kLQmEqMJdmbbcqoj+eXAL62OC//rXQibSG1YR8hPVGTb7Z
	G7GIlsDxG3r3hrfxLRUl3keOrwbam0mJlFgJRmuHIM+yi4eiT9S1VC5U=
X-Gm-Gg: AR+sD13GduVoGKdG1/cdlI+zGURhw/qMm5fUtF9beVigHQn1W4s4JETpMYZq5Palz2x
	PHCkcDeJsD6yt73NbUl58wh9URGeCiLbRsYiCS5A4o9bgZJrQv5ljm8epj8tUwsRjZws8vbvBl2
	ZQudB4ydnSjS85GnHuvXPco3DfPvj/CgtaBEYMVClRwp55esxAIV8zbQ3ocXWylbTPFTfPV+s6L
	XWUQIQTrHWm7Pr+UX2kWtLdbcgpppnu1vFUHrunND/fpY1Grd/ZOsKD7Qf/q2BR4jsAKSuSFjMP
	g18soqA9vN0yP/P5vDgODfn1yoj0cqhkJ9OQaMN7q7bzsYUGc4egFMGynr9FPoLKfg6IUxjzrn7
	0tqvnsK1lb0+WnZVxDedD5eFXn/2D2kBSWmpg6YRtoEDjir3Ou4FdlsyhucdgnZ8wUJBaA5rh5b
	rMynuG8peBifUW/58=
X-Received: by 2002:ac8:5f10:0:b0:52d:6afd:7db5 with SMTP id d75a77b69052e-52e4230c933mr43890911cf.25.1787740061201;
        Wed, 26 Aug 2026 03:27:41 -0700 (PDT)
X-Received: by 2002:ac8:5f10:0:b0:52d:6afd:7db5 with SMTP id d75a77b69052e-52e4230c933mr43890631cf.25.1787740060761;
        Wed, 26 Aug 2026 03:27:40 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d68d1sm506364966b.11.2026.08.26.03.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:27:39 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] firmware: arm_scmi: Pre-register protocol, name tupples for IMX protocols
Date: Wed, 26 Aug 2026 12:27:34 +0200
Message-ID: <20260826102734.31766-4-johannes.goede@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: tAsJKcbOtPhflengh4eaovjUlqDdngIh
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX2mAaLSMt3qrb
 SMWECLBo8aACYCK3Bkm6Kif4B6alUSucOITi+EFDzLATrRfI8NNa0auaczBH0h32qBdNDIphotV
 RH7MAERAgCtFYkat790mtpU6SnKlHZI=
X-Proofpoint-GUID: tAsJKcbOtPhflengh4eaovjUlqDdngIh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX2OdH9u0N68E/
 iIooTdEkvTHhBbJ6wGgQeedaD6T0KN5buELOtTtNykiJitY8/QKKeaeLXhpG0OAxyITU0zg2hzF
 xK67l89ZSujtTQIR0uv4ORO7Lx7LiHkHleFNAVgJZAugf7kht469LPGnEYMx8g8aSKHrnipUteJ
 HGkY9hV6EJmXGEucKwNu40yj73SroI1UfHAM+MvGJnCf7nuV6Vgz7BG0vWUUg+uk1gih9R9QEc1
 9AOjn+WoeArx0U3cmF1p+xd9cxVBqmlB9j34Y6A7D5ebF9v0J/Rl5vtK6dFRi81C7K9FC7U6VGu
 C2afsP5r3quGb266UxK9RZX+8ADsr9vOVTauCh7dLkblhN8rf89Yfzpp2q5lSjyz0TliE78PPLd
 cwl4c3RKNLBe+HUbLC7yfgN/PCPqLIKFs5XdVTg96DvxiarZ7oQaMByAQaMM3cHwE9xtCghMPhy
 oA8iF2anEEDn2V/WDgQ==
X-Authority-Analysis: v=2.4 cv=PPQ/P/qC c=1 sm=1 tr=0 ts=6a8ebf9d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=88Q6Yv8u5fullXUEwxUA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260087

There are in tree drivers for various IMX vendor protocols, also
pre-register the { protocol, name } tupples for these to make module
auto-loading work for these in tree drivers.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v3:
- New patch in v3 of this patch-set
---
 drivers/firmware/arm_scmi/bus.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 111727904a89..9f5740dc606f 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/device.h>
+#include <linux/scmi_imx_protocol.h>
 
 #include "common.h"
 
@@ -580,8 +581,8 @@ static void scmi_devices_unregister(void)
 	bus_for_each_dev(&scmi_bus_type, NULL, NULL, __scmi_devices_unregister);
 }
 
-/* Standard protocols table */
 static const struct scmi_device_id scmi_std_id_table[] = {
+	/* Standard protocols */
 	{ SCMI_PROTOCOL_POWER, "genpd" },
 	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
 	{ SCMI_PROTOCOL_PERF, "perf" },
@@ -594,6 +595,12 @@ static const struct scmi_device_id scmi_std_id_table[] = {
 	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
 	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
 	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	/* Vendor protocols with in tree drivers */
+	{ SCMI_PROTOCOL_IMX_BBM, "imx-bbm-key" },
+	{ SCMI_PROTOCOL_IMX_BBM, "imx-bbm-rtc" },
+	{ SCMI_PROTOCOL_IMX_CPU, "imx-cpu" },
+	{ SCMI_PROTOCOL_IMX_LMM, "imx-lmm" },
+	{ SCMI_PROTOCOL_IMX_MISC, "imx-misc-ctrl" },
 	{ },
 };
 
-- 
2.55.0

