Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7733C3458
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 19:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787255345; cv=none; b=j+f4JgmZy93tIom6npRdF2O8tGzPq9aFEGGMT04gqkm7FlATSY36F/J3kqDs+3WdlVzeF/TmjZFkOXoc/QohquTBDo6+FS2PElAM/1zmbuJX/7H6MK4+2QIonXt+bXRnRRYLCA9j/Poy4AwUdBs3IboXsWTSa0zuxT+SA2uuSPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787255345; c=relaxed/simple;
	bh=Lf0DV6zqTiNRbRqg0PwFD+T9VOrPKtziLfLRHxcXw+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGDIxR7SFWyQjgbTkrjZHllaIaOcrD8xFgoUAN0TJnt/V93A+V7CAcDFFEGXhBurrY6CiRjpuNN38KoKNkMG3C2Gg2GZCLnHLZtl1xWaK5YWn5z+QhfaIItgQmTW0sX1i6O2B5Q1VNbrsN3ssZ48VZ1nm2hTMPOZcwBjDDbFUl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3O/WUVI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OjUinGl2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3O/WUVI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OjUinGl2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIIutE571534
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 19:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gbJ+FmOGmDz
	b9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=; b=C3O/WUVIys4ElKd4LJDGfaih8am
	CMM4C5GhUxPMgEVmQHnGmtChtz6W9H1+0BzjPj8WFolQKvn1EyoiTw9luB1CodGd
	cqF5E/RX5CyEyqkKEHkZLzMlQ/s+RBH+rSf+ktOBKxwTRx082kHzxg1ZiCepKQ6d
	7/mM906fhyR9D+f5ql5NNNWsnJzco4NDlUtdCA5vTAHRCElDYMhFuAo0AIPj9BBH
	GXZiTYo0qXri8xXVMWGuXtnwKKJNSruEMUhu3MFFKA57gC1CPCm7FKgdj/eOgBvP
	ihtOAjiCkF46+7wNxCxXWO/BbxnRj1Ala3KN0UBpzdFxL42NGu6Aiq+I/BA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xgcb0cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 19:49:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e695a3b28so153387485a.1
        for <imx@lists.linux.dev>; Thu, 20 Aug 2026 12:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787255340; x=1787860140; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbJ+FmOGmDzb9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=;
        b=OjUinGl271CgQ+k/4QXGdFhcRrTRPcRSHjWQRx5NRKZkXSHEC86pUMJZalv4HUs4QV
         OGdLBAMCZCJf8gP/94Ivhth+rCuVkENKbm8i7b57Wvx/124Lrz+Q2TKIFsmlolLiM/rx
         AjHrsl0saJYTJMDqZWpMvsoXuMTnB57jgk2JFNixyWlNdWkl/PAedJ9EggWusrBFijNy
         zq9EqVSkbEr283sKL58TMZ05T7SCSUhC2/X6M8vaINLRLeuBSf3a9UC6K1OQdOdXl7rE
         n6odgGyV0pbPzuX8+StxxMmWdvrLJFEGCclnYRLOM6OJ8Ch/E1aMA4mctfUSZpb0CWpT
         vmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787255340; x=1787860140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gbJ+FmOGmDzb9CCf6V3nGKJG3Pm04UC3Lj/S2Ts4X5Q=;
        b=GW+L95VgexWpWlZI2ezeqNaDy/UKy0rKov5MlIRnFf9ROzrKV51Wy14iEkvmr2k+HC
         jrAvI675bI+REpLNMduvz3WzvKOLhT0ItDG1cmgJ+Xnerj4tOyRFmmF3G+YlRBx/nTy4
         bx924FRN12S8BJJehbFfZH3omD90qSExcmAVBx176UMzFiMrKvDZpy3AcKtvafinH1NQ
         1aa0+tFR6t/SgVZBs/U77RXNFgMoB5X7PmHnxzjMksH1A8nFB4hxvrFZi1Xmb4I1eBuQ
         rcZ77WLIg6wJ9vqhz2Jn8p6E4PoMVhFgCcgoCMdpWZ104VMata4RFUZpMAbET1X5lzwd
         jcQw==
X-Forwarded-Encrypted: i=1; AHgh+RrjkXBPzUG/5IJnahczgz6Om0+dTtwEQQumUBeVvNnP2yGh1Un83WlSfvp4RkU6EICLS/U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy06kzHO/d8C0FvpdfUfZOFkvhHEvRWpJY6J3T2mMfaiMydlz8I
	qTLSrHOKfg9aecMrdjzRrhS/dacJuoVXNchoApz+PODRpZssrkbq4firMX1qUay1SqS2Yyvr/r7
	yixAlgNHsG8vKkCG3YYxzAeSYTM/mNjYssxjqT4KyE3pmcuisfFhoV6I=
X-Gm-Gg: AR+sD13ckEh8PsfPAJ7ArjOpzm2PBplZyvBV9xly/H9JCOJRKAo20TrhPMnZBT8lXCT
	NJrGReZ2BEzMa/anwoDiCSZeMLvEzWWh7lXg/NtkwGZZNkemx9eUGKrrBSys6g7rN6NU7ns/PjD
	09KkHkZWMhSugNGnj+MD4K6+R0tNrqmFTJmdwY7UkHvq9u2RPEKmc15Pl4tTnp2zp2UUXaQX1iT
	W8JXEcdiEiMAuM6jT+jYluwLYnlr06BLLzumdbSjV1vZMvm7445F+mxg52pMXz1MMVReUXp6NkH
	hw+fxGHIRQ+znnRquMRD+PQeD6+zam4AhIoxuiSfo0FfNVLdyEDoQB6cbiKx2imGU0/0daSiaCp
	d622COZUWhDAz
X-Received: by 2002:a05:620a:268f:b0:92b:6e09:b0d9 with SMTP id af79cd13be357-9372858eaaemr977538285a.21.1787255340097;
        Thu, 20 Aug 2026 12:49:00 -0700 (PDT)
X-Received: by 2002:a05:620a:268f:b0:92b:6e09:b0d9 with SMTP id af79cd13be357-9372858eaaemr977533285a.21.1787255339638;
        Thu, 20 Aug 2026 12:48:59 -0700 (PDT)
Received: from shalem ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459198ec5sm113433266b.34.2026.08.20.12.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 12:48:58 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] firmware: arm_scmi: Pre-register protocol, name tupples for IMX protocols
Date: Thu, 20 Aug 2026 21:48:50 +0200
Message-ID: <20260820194850.459739-4-johannes.goede@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=GPM41ONK c=1 sm=1 tr=0 ts=6a875a2d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=88Q6Yv8u5fullXUEwxUA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: sxiKjPnGdX_7n_GEB58fgD_8Htkd0e-a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX2STUu6rXUiMV
 mfK0ARwwjWr2Ut2gkfjhLYT9hbtAh3xTTFzsk9qzFEAYYu73R4r+/YmA9Czma4KLEqCL8kYONbT
 4Yes8SLR4YIN5+CTJ+DaKdrzfQUSbLGc3dt/mgw2dvSZgDWImpyBMjtf2NpiqwRgcsrdAvkDqhz
 UO7Y198uxK995cZfV3fsAx8Ew5f7FQzSm0TEIftAEEAjJ16EIyZ5C9TffzjS/cdZrc7HtwYYLYp
 8ZFb5Dbwo7QzonOE31Bb4ETpvcIvy6gDRN6pxBaVrb/YkI+XiGcc/kZ4fPxpalkeiVeVekMQxsF
 PcLXONz3hVMLBBU/RvZNFnRs74ahwkj1LeRTS6tZg/ZoeiLqeYUsNjxxKbYs8JCy2iI7sytVwZ1
 0BX8vIYXPHG6gxhpF3ii7gjnyWRjQ1FmS1At4CRbX1itqXILPy7oPLy30iIjq3PCgm6dPEGrqF1
 NAVTnjTkPFWIi7ic4wA==
X-Proofpoint-GUID: sxiKjPnGdX_7n_GEB58fgD_8Htkd0e-a
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX3qU5m0G45vUD
 NJaIIn2EHWx0NkqQg8h14CFINTYq7AtwRofBSqaR5e0ItoF/2Fb54HceC8ax7P0G0UNZlwB871g
 GUiO7PRnDddSLvXBEa1Z7qeEq8HKAiY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200149

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

