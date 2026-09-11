Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C3737B3F7
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 15:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140224; cv=none; b=j21go5gt8yPE+S8vmT3B1DuIOB463p0CQS4zPHrCsfspLYfWRsL5adNgJMgVrVmBb4yGRSieYhfkuNkdZdH8SaDclgCLFz7jfCXqE0Up6yWMQLsvBq8l5vQcLvA0ZMz1iyvxnPsktKSV1tSou1Qrku8Q/OIX45XnjJuesfKPcos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140224; c=relaxed/simple;
	bh=fOozqXRREZdVE1IpU1zeudvT0HR4HrTNyPKFTzqIpmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A6+EUaTZNg5AkOanwRINkn0L83/grwvtEtdH4XGLVQDpKTk04tdeXoC9JZ2Ca1cnjL7ONlR4BD/nf0AXSVT5M6qkzV9MnC1xq4Fbg9Y4rT+sWAzlKBX19rdlllaG0r7mUO2khr7mt0ehsRjXmoPn0cAFyZlKFpXcYKlb3JT1J9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dp4kRRQp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hVF8tuWw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dp4kRRQp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hVF8tuWw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmFl4798927
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 15:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g5ESSTcnZuT
	5ralQyPBxo3SGry0UvUcfoIReYTVE9Ig=; b=Dp4kRRQpf311WuUvZyTt1GXXi8G
	mQYJJF0dlzq5DsvMj5qcT8+2XoHzzdBcsvCTXIZycX1tPeuDr4fJwTrinWI+XCIS
	RZr9KMknF8zabRu1Z99rhRnOTBmnz+oGP3KkyHZ/x/7Zkp/P/UnBfrcxzuo8rRxS
	AYpK2/Xy0wzFGf0g/R79AgTuzeqTejBhWQo53tpIEBFMzeeLvKLYRq+pN/aM+N/y
	Rh7oNoGRbqeQPF7851HTH+/1Hbt0SxLjaX2xCcry4jhnQpsiJR0/LIXHo9rO0VF0
	5rigtLFxh9aHI/uR1xm1pDcI2KT+d9BFbPNeCGMghN2kgL8UZSAg7Qt34eQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q147mu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 15:23:41 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-785b66a7017so237392137.2
        for <imx@lists.linux.dev>; Fri, 11 Sep 2026 08:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789140221; x=1789745021; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g5ESSTcnZuT5ralQyPBxo3SGry0UvUcfoIReYTVE9Ig=;
        b=hVF8tuWwO7PHlgNppJ5AzJAVlyWUeUAQcBsonWK1iT3XXNrWfN9IUtxcyiSjwihN+o
         wI2zZKrVQp5D1TWivPtIv40g4juuRVNyGlupKgo9s+a8e1tEHjab+o0czeoTRC7LOLew
         ZEDDwVre26buVEXO7IIFgaL5uB6oJVOjQbZfsF61/tmKpmFbobcA/4fJ6b7RxBXvYkQK
         fAZAKtn26pTv8qwngtVKbdErxzzBXpfLNYn+e2UV6l/+w9921rTAI0VaQ8arpVl3U+h+
         GIOlPEJ0Rw6F1BE+5tA/PNl9kIz88c4cMVv/j2ee25J2IWfutpzP/7TCVz7EtQcr0bSP
         msMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140221; x=1789745021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g5ESSTcnZuT5ralQyPBxo3SGry0UvUcfoIReYTVE9Ig=;
        b=naDZTaPOALm1RIR5FyvHcsIjq/K0EC7hluu79r0oX64nPzHHuREZcP/PXTKLHyVN27
         jAUdJXhitDZO+slvvX5XTXLmQkEAujFpHlhZwgnKCYyKXn50dGE7I5LWx1m1KNJZ0II8
         0fgAdayC7k0OXAyOv5EEccLHkJc8eAO0JLT9hfbnrneN2738CcAgJo5UkO+yZbbpb17X
         uFDdsPGUihRHpbq87D2P5SN4a4q9oXp/5YkVBpVmfyzLVvHBHxmngLgdrvU2XnRrJiHs
         OG4uEoO/67NU28OnGTqkRd6VNEGYUVDkzqS61SPfh6WngFjUmLJ/pVTuoCmWINOJjHq0
         EeXA==
X-Forwarded-Encrypted: i=1; AKwUvBzvM/FO0cBCcTl9d/MtUG7ha5ozisIqN8zYuRlASwAskmz5aXENElVvj1ZV4L/DqtcrAUw=@lists.linux.dev
X-Gm-Message-State: AFuF++kXMog+LKdWgeR7SzZ8MAZGzotdpCxMctGOzlYWG3ak8dGn5CBI
	Bh44PVkI63oT5k0Ur+yeIKL6OwQHb5Qj4lajNUftt4R3MyhcjQYGhGM3TzGc+sDkbem1FNIzYiQ
	4R6nci5xaSyFRzAZRMSKXOWngqqLpcVcTtkgpC5Vl65lAd1o4So6TG5s=
X-Gm-Gg: AYBFou2NIf2wip2fXHl6Ad8MXNEB2tOyOJbcYJRr+4lF6avvklKCz2WYNa003CyB5gk
	OqpJEGbYCjvekVDYNYu598zfVPBW7yCZD0R8H/t/ocKNjqDPFH+QF/YFfHtSPCrwf36gd1A1BFl
	qp30BMCkTu5WrfgF998VK1rVYCzHJ6X24Zo22qdLBylj7IEFuZjnqVaLZq6UvR8fH6lZz1Wv+mG
	xfua/VMwY3jfoFQfECJbivYQAEzWAoZbvwVjc+NkONxNVLdZ+CtgtVlTdf1Cs31fks1b7TipFYk
	M6GHmo2ErU+yQmygtqEcVfOWPl64KTJHy19jxjoYwFJIGu7XmPIB9sJwsygj5rMnmuIMvOIRY3b
	AKtYiIFEzT+O0xlLM4xI12N61Tg0+Q+/2vMCd/CbysvG28WXrbpcpz5Z4IKDJ7ESIzM28qzt+Tb
	bzhqtoBusuFqy2DbbCKzTVIA==
X-Received: by 2002:a05:6102:1953:b0:78f:7135:b4ff with SMTP id ada2fe7eead31-792a52b9d3fmr5324945137.2.1789140220681;
        Fri, 11 Sep 2026 08:23:40 -0700 (PDT)
X-Received: by 2002:a05:6102:1953:b0:78f:7135:b4ff with SMTP id ada2fe7eead31-792a52b9d3fmr5324849137.2.1789140220237;
        Fri, 11 Sep 2026 08:23:40 -0700 (PDT)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614323csm94042566b.59.2026.09.11.08.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:23:36 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/4] firmware: arm_scmi: Fix scmi_protocol_table_register() error handling
Date: Fri, 11 Sep 2026 17:23:27 +0200
Message-ID: <20260911152329.5822-3-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa41cfd cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=mtY6ubt43vOedHXxatAA:9
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX0BTmvOfeYut4
 UQO2xlpcoaT+m3J6M0U3rCBsEXNC5SaHdlcgy/dma23KGZlnHQIlR5REtvBKCKUhoE0riZP1QVG
 fuyhXJrXIO/exZ3/2srvNiUKcX6VdWnuuLwTkm4iL3V3bglgz65egM5d5qQnZ7AVA3lZ530QSEt
 kkveEzFqckenQvLMcLaKyr0aOatRRY44G9TyPtSUCT/vKpab7brW/j4WYB+5/nf2h61Bndw/pSX
 F9OBU+m2bDDQX6n+avvW62JG6YHj/TpEyQ6H2w9DIvRo/qZTYHdXWJkqmaziZa0CmIrAzJFrzus
 RFSiy5n/NG8BhlS0kNeZNpb5Ph0ri/fyV5zWTp6qrSLAj4MQWnluS+Beh0mAyzcUPtTzekr9UKm
 ZVQ01EjOyAbWF0wGyyNLENnlXqYpjx/hSmgSG+Y8eC93uI0JYwIxVmeTMhvpUbTUsQ4sSGtJjOx
 1zYRzps+bcGaw6ybixw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfXxy59oOpgkY+5
 /2mBtlXOrTNhf9xSCkPMXUFxJPujjaf927iz2S1l0JNs95uo0DLSqzN2oKK50CmEImtHiIKemoh
 aiu3PI+2seUaDEt0AkmG/YE1C7NZ9cM=
X-Proofpoint-GUID: PmUX42onpfg30amIibai7mnuQJ0uMg39
X-Proofpoint-ORIG-GUID: PmUX42onpfg30amIibai7mnuQJ0uMg39
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110214

scmi_protocol_table_register() stops at the first failure to request
one of the scmi_device_id-s into scmi_requested_devices, but it leaves any
previously successfully requested device-ids in place.

Unrequest any successfully requested device-ids on error to fix this.

The code manually unrequests these rather then calling
scmi_protocol_table_unregister() because one way this can fail is because
of duplicate device-ids and in that case the original device-id must not
be unrequested.

This also moves scmi_protocol_table_register() to below
scmi_protocol_device_unrequest() since it now calls that local function.

Fixes: 2858f6e5f064 ("firmware: arm_scmi: Add multiple protocols registration support")
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v6:
- Add Fixes tag

Changes in v5:
- New patch in v5 of this series
---
 drivers/firmware/arm_scmi/bus.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index d12d5de15a1a..6f667e4ffeed 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -137,17 +137,6 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 	return ret;
 }
 
-static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
-{
-	int ret = 0;
-	const struct scmi_device_id *entry;
-
-	for (entry = id_table; entry->name[0] && ret == 0; entry++)
-		ret = scmi_protocol_device_request(entry);
-
-	return ret;
-}
-
 /**
  * scmi_protocol_device_unrequest  - Helper to unrequest a device
  *
@@ -193,6 +182,25 @@ static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table
 	mutex_unlock(&scmi_requested_devices_mtx);
 }
 
+static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
+{
+	int i, ret;
+
+	for (i = 0; id_table[i].name[0]; i++) {
+		ret = scmi_protocol_device_request(&id_table[i]);
+		if (ret)
+			goto error;
+	}
+
+	return 0;
+
+error:
+	while (--i >= 0)
+		scmi_protocol_device_unrequest(&id_table[i]);
+
+	return ret;
+}
+
 static void
 scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 {
-- 
2.55.0

