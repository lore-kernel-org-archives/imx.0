Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A251438836E
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 18:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372538; cv=none; b=QzDgIaFNdYW94bn1+vHtqKbXfSvsfKYCpYkkrKDkP90wYWab40mpdtw33qDsZfK7kYOhOYz279vdsHvRYdsoh1tepH7V++nzLhWQ9K396hKE1bNLtWWekn1ejUucTP25GGlCPej+HzGd4IPHoxOURAn2mpIyXiz23FBH++X4LMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372538; c=relaxed/simple;
	bh=qqYzxrvaW33GugN1wfMmttWK+is/52VK42xgNKdCyJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LyOWQx9x8heeuLSHxxhwnoZoNzz6sShhhlYVvB8aQdfxQ5hHimyCIiY+rCCcM11oM2B5PNP4oRTe/9OqzRKjCt0a0WBpv32abiprxYyQd1c/tHaEGZ9WASYU1f3D4hTfLBIERevYHVDO2VuEyhykmo+2xe0iTX3pTiQtyazob1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=llUct4c5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bxxdtsCQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="llUct4c5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bxxdtsCQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr4Ie1072140
	for <imx@lists.linux.dev>; Wed, 2 Sep 2026 18:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8/6R5LUyWsU
	dJmgkPC8R28H+x4JiDbGyxUBi1wvYWmg=; b=llUct4c580shIcDg73MLmvRVJL3
	rYZ5pZ9DZzYgOKGXpvVH51WqQKdKZGK0PGjK9aV8Hr1J3M2iqjaQLjf2LDMvlBPL
	hGv4+zlqEgaLeoNRQZNR7JIwSs9oQY5MuTyqhkp/X4yGCaDWUxWBssoBt9vrMFl2
	oqayeEXnypFPbNivWamumxlt7OdkxXSXtATWmzYewVhTVTXHt+A25SKtlpDQbpcf
	Ym7HOMI6Hyyef9p04dBmlKhMLPacd8l6gHKILQZWe4yWuE9Mai44qxXUUg1A4UYG
	7YqV04PHb9ztuflJhayzP1qtYP19J4Lyx9oGNlqz4sapzGCUBxi2DPgp+Gw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja197u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 02 Sep 2026 18:08:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so374485285a.2
        for <imx@lists.linux.dev>; Wed, 02 Sep 2026 11:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788372535; x=1788977335; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/6R5LUyWsUdJmgkPC8R28H+x4JiDbGyxUBi1wvYWmg=;
        b=bxxdtsCQVIugp1+TxQL2/I0Awwor0MxnC+3XZgxlN6oaUlgqvlFGUqIjV6KIJV7kES
         FJgaFKIJ6HZheH1pzH4EIkuQmed+X6h2u7ou7+pve7I5mClywjHNAq8rSNyALYaM+IC8
         8K2DmP5exggHy3Of0bpOEShB6tIE5Gm6yjNOe+Na35x2mA5fAdPjFrFqsNbNaaOi3Euj
         DsQVEhM9Z/cZ/bPDrDuFPIoA2KIcpDK9628oQkLnDhhYu+pTrCx1Z7Q4EgJT3uPXRh52
         iF3eC/3fSBJLpnZ1Kv/1wJS0XL+9jV5+fdUTf+asqX7HsWalOMA5N1Xb3JF464f/0BDr
         H7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788372535; x=1788977335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8/6R5LUyWsUdJmgkPC8R28H+x4JiDbGyxUBi1wvYWmg=;
        b=AIWSS4r2v0ZYsjaFMR8IylvsiBPr2JkUGqQIbPy3N6vLVmT7p8mL+7UIhxAnK8zb3O
         wlDjKZSzh0FzyebUFwgOgsDeXNqWGJq3aOV4byDG0yNNZag4yFMXX72JirdPBCX3AdbV
         eiTneLtlpPTRTnPYWG4ffMFH0TlAvcS2a85CEbWiA/CIdGwTe85XjiOvDJp8p9IrXk7I
         uCy5KtGH7fJfuhYx3yoAqGJhB4oTVaCC+gLzqaWCW/ZOeiZbmCJZicrj/GRfqP+VGUTI
         ahskRUoye8juAPBpmjGjOowwZcXbIjYG821DBuwZTlnAibOLyXDxlb8lCYxJLALQ4c44
         pZag==
X-Forwarded-Encrypted: i=1; AKwUvBzaPDluI9s7ZZ/Htp4d+cfOIZLg7IMSztiXeO3y7YyhRVRxO7JZH/+Nty6zKbH/HgcS/Xo=@lists.linux.dev
X-Gm-Message-State: AFuF++kz0y+1e0tosYUP/mRR6Uw0r0MkjfgLdY+vOPmicC+b8U0Byc9u
	rPElpouo3QRlprkGlntNiL7Nbq6SHgrhieiMNXPBSx/VcY1MDuMUuKigTV8J8SJCwq4GRgASxSJ
	J0G+kGzxblWFjPBCl0YBlf7yuO1CFPz9hucg6Exw7NA1uVVoFBUDy+i0=
X-Gm-Gg: AYBFou17NtUQsQSlj4McQ8P1wB5uJnv1lF5bOHap2Rv5P+BCHwhiJIM/wQFw16eJZpl
	iq/0RVC4zOfc0oy6yDGt9KdirALaa/s3y8JdIOe3dRRbgHE38z4Sw5k+HC+M1vt28ho5FEzeBSX
	xR5K4BLjUYtNuBWFEsIwDUbCEcWE1pIwesSc5Xk+OCzt+g1ZuoUcXTQvUNx8R3fVbelFfw1Cj8k
	IIIvEM8/i9LTXiTCwkxkzXFw94xh/l3JCcNAXqnJ7604+IDY95lN6BbZXgYdX5oXZ6ugxE77c0i
	k/DSDnVLo7PXN+Y9qCAUeCcGDKoWAgro0q0mzyF7rE91D4yrjQT35+I/BDqJ+Pag3Zt1GZWowRu
	uqw6flgPqPCZlvqGFDkKI6cc+y1sD92jh7Z8taCZ1A49Bb6ksPGM59zJ82s/mKFatsqaqao7HWS
	oFLLisnMbk3X7oCP8=
X-Received: by 2002:a05:620a:711b:b0:937:27fb:96f8 with SMTP id af79cd13be357-93960fe4a2bmr717704185a.41.1788372534599;
        Wed, 02 Sep 2026 11:08:54 -0700 (PDT)
X-Received: by 2002:a05:620a:711b:b0:937:27fb:96f8 with SMTP id af79cd13be357-93960fe4a2bmr717694085a.41.1788372533835;
        Wed, 02 Sep 2026 11:08:53 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895d68sm1444041a12.4.2026.09.02.11.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:08:52 -0700 (PDT)
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
Subject: [PATCH v5 2/3] firmware: arm_scmi: Fix scmi_protocol_table_register() error handling
Date: Wed,  2 Sep 2026 20:08:43 +0200
Message-ID: <20260902180844.41230-3-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902180844.41230-1-johannes.goede@oss.qualcomm.com>
References: <20260902180844.41230-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: j98RcYfHS2ydB8PWeaIozZrOV_tNtQQP
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a986637 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=mtY6ubt43vOedHXxatAA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE2MCBTYWx0ZWRfXyjV/zZgcB082
 Vn30YluFZWsstl0m/sYYV338VymR1uZxemTYQdXF2kw0GpSQpfQMHsTGGhCsDFYWNEntoH6jsH1
 kr898ZWya3iSAJJrq9V4BG2Knl4L8VU=
X-Proofpoint-ORIG-GUID: j98RcYfHS2ydB8PWeaIozZrOV_tNtQQP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE2MCBTYWx0ZWRfX2GdPOZ57/oHz
 UXqPcaADdWOcigr6mU47FBzM9IWL0rVTuw69KuqxDPHRwrW/PEYcrT71zRj+XSQNdvFTMWOMSP1
 FvCYkzyfbyyBqMkpcf8J1/4eAJIU8LfhjYwDd+1og9iislngX664ktkZhAMtTHP2MyDysZN6g/O
 TAeS7uguaCASUm79LZb7MZMo+JI6xjvWZ5EHII1sD3llb/Ed9uX+TUAgStdV5DrJhNWHl4o04P8
 N+En6A6+x45F07rLJzXH7bpUKi1tbHue0k3zqM3o+HzBucJvgTm49CjL4htKMnpiuobYxUTdhtz
 c/Sw6UvvG2Tgqkk3O/7Wfb/xuYp4F530Uhbs9bo1tcmUIMmTAMkJmeVJe2NWDTGAeLeSZTm/zAY
 BHV1kQMT75DibenacTo2aYPnMdF1Ultq+itjOBc0AsYrHdvhoKtzmYysl2zgWidbOnmn+DlqD7S
 0lpv3Zz94VJw0Xu1p3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020160

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

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
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

