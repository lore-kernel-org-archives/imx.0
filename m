Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1183BFAF5
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 10:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740063; cv=none; b=PPGcPQTV+HzpKhX8Y1sE+feg17QVFEe/n7J7kwzOOyKMTEboYFiZfE+xHSyobQIXTBp8O9B+PHAyvluWG915ijpVbCeBd6c47m7YlDxpDaU7YSIv8uho5K295jNl5UTpPxkg6zhJXdz50nfmUUdoeAcTZMyy/05iZvw2YM0I7aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740063; c=relaxed/simple;
	bh=KLIlR+koIz0OfzI6bzUVYKFw5N6U8gqdkPJ1VJ8XM2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ePQOd9aVvDZij/vkiW1CqKsdhRAKFfN6+dfXejDs6GdDTdoA89mKzALugufyM6JfU3G2A957U0/xqr0q6jgn6NhVOceAZTxuLUJF+YcrKn3DUlUZmkA5SW6irRc7Mixzb1PtJIUY7H0ofPis4IdJRv94tyFSSzsxZIihKFR/fos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W+Q+4SpV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AzsonNlM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W+Q+4SpV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AzsonNlM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGeL8017345
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 10:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FqF/pFKdhvjVFIbFaRcdom011G7Oq3Fs4Hs
	sXxqokMA=; b=W+Q+4SpVqz9ejYQlSvt5l7ukSyfc5ROPRWIcw/r6+1/zD+VHomr
	yPU1pRVgMjR4iwz3+fCSC6EV3osKC2qgMO7rOIObmiUTMQuGtnLutiLi95NO5A68
	eN/7W8z7h15krKQEtgA0LpHI8/mnqPnduJAtIPUbOMHYvd3vNPsXzxQlgS9I3WGd
	Vkr7BXW5p23g+xrt+tarXk/6hEaZjGuk0GkbUiCR10S7NkLek6vwDNqR26jjEvdi
	BXUIC2KCg2bb29mgBHpsnEdIARdSh0/LMKi7D4JKDCk2I1sWNFkX60R3j1aLET9Y
	tMzUAmvjhKY4Kq+aNfIfdoCDiXqTjorQntA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn3duj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 10:27:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a9764f0so7696011cf.1
        for <imx@lists.linux.dev>; Wed, 26 Aug 2026 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740057; x=1788344857; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FqF/pFKdhvjVFIbFaRcdom011G7Oq3Fs4HssXxqokMA=;
        b=AzsonNlM/dwtMxs5ZMz8ej8+RMimMzm2KJqOlGh0uJ+CN/PhWDCTlxLHVEsZ1bOszU
         3NlzV257h98Vydt4ouXCqH3HoYuVB80Ud9DED9qpGcUrmwkIoc0A4VOOEEveo0r0v7U4
         SG8DeSjMZnHTGVadbDFwmogaWkP0gpwVwgS05sOLi2hgpNk45OEEyhoYUuDx6qFsp0sN
         /OauHBxc2/LMMVztNZM1hQZEudthARpIRkhwJ8TYN81MJBz3vLJxP3/v9oMFhNOuI6v2
         QS23Nnq/wDAJEE7M0cOg1BH2co7QWfXRSn6sugHQsi9ir1RfzMSOq/YmJ4vkXtQDqrcQ
         2LWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740057; x=1788344857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqF/pFKdhvjVFIbFaRcdom011G7Oq3Fs4HssXxqokMA=;
        b=Nww542s+jVsrp+puziVivRGQNP2OONcirUCSuGcJyZShVWpDrJKwpe1p1ZNWc2wGFn
         y5brJwe9U/l7E5l9Lz7cplgR5OeQTCVh0FbQPVvJnR5TTrCxcLjpWtrrrCOnggCXSDBI
         3R8HqL/UJsorJ7GOqSAd+B/mTr3vA7s58f8YfkCn77XmNI6rO7nLFUb8vrOY11xGcWXc
         iD59T33G4wAsO0UFmzx1IHOr/FM69bYw/G8dTHl8XBH2lSc5mE5kpBbuSJLyhfglMRDD
         RDo9mMhJPOIKY4QrX1pIIxsKbSi9Bkv7WzraJKaFDO8+mNA2BfaQ3zK2QTKWiT87KJzz
         Gznw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/OLRrTZMHHeUJ5wwMvALjv9J1qR+i/OjL6wYAH3yHtrx3WWG9o/utHjkw3zh5dHMNPpg=@lists.linux.dev
X-Gm-Message-State: AFuF++mgahcE2Ux4HkNWPIJx48Am1e+uTHyCuQzERnmK7K2qM9ZRJ7sN
	kaXDcWMZF4f4oGj4EtLDj301DPOgTtjJr28GWmvNHRscL91vsK0nTsXayi/M0FL6BYLWjQkcUZZ
	lQWLlMmvUVAwPMiKNncPk4VXk7oS9jYBZNqNwsV026P1CgymfiBFpmIw=
X-Gm-Gg: AR+sD11n4W4VoyCIfz7lG8s4n4kuhi/NYEJb55D12cnNfUJ91Z5BTSnckj84H9Vj9Xn
	4YEDhASN6k9jdNHRPR2xuCQDOiNPO+su2rOQG2UJRq5oUKaEoS6AaLMHpdB0DM/ZphFflsU2yPe
	+hVau6S0dp8/OIu8zXG6o+Ijd2JPwfX0VZzb2v8QnJJhRrUskKcdzLXCMdEaxT2p2WMGz6VY+Ww
	0KT7g07/BxzsUrJUfFbX24qX6e/xri5CrrJcybp1Gm5ZE2Smzf64dj+jFux3yEj3o32VLvlryu+
	0nJ7W7BkKXqopwH4qo8SYNRLh3DyCNyRFr3RvWeelE8/HoFol7ccMg44k1FN/JETK/JICAcAkWU
	1mL6vUenmF6NJuoa5vT0+zG4CdiX4ggkR67crvanUeVyKDABYPpCTmvLgXvApcXBRNfrIQ2RMId
	uHTbp/tclZl4BPi7k=
X-Received: by 2002:a05:622a:4a83:b0:52d:cf84:e98 with SMTP id d75a77b69052e-52e423a4a9amr55060921cf.33.1787740056712;
        Wed, 26 Aug 2026 03:27:36 -0700 (PDT)
X-Received: by 2002:a05:622a:4a83:b0:52d:cf84:e98 with SMTP id d75a77b69052e-52e423a4a9amr55060421cf.33.1787740056283;
        Wed, 26 Aug 2026 03:27:36 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d68d1sm506364966b.11.2026.08.26.03.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:27:35 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] firmware: arm_scmi: fix module auto-loading
Date: Wed, 26 Aug 2026 12:27:31 +0200
Message-ID: <20260826102734.31766-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kVGsGPTGwao3RLo2R-QDUi-Dmu2H92t4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX0KONxZXOrMar
 G2PvT7zGTiVss4K86cDgyYgaaFrBW0EQ4UdhzT1Ruu/BarRVO5aOV2Jpy451ipQMHtut46hPBFh
 5hoNIWcjJ6vLe7j4A2X3JfBBd+596ec=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfXz4ciYs8MlNi8
 kjo33GpsohHAaBu3Wb2JxglfKOKAsHSZCZIaGq0DVQ4ysZatxze6O0r3mvbW40b4yeslz9keFMH
 CKbqToRGJV0os/2TXXZ4uTtGaK6TvagrpeFlAE8bT0XFHlPypHemgW4sggdGfv0oeMTC0YSAGn4
 woM21OgP9LaNj3JdHv0EYI8Si6Ob2iq368tcmrz0ZCgxBja5yPDcAxczMlsHw+L91D0GMt7CrFv
 w7bWn6pfxSF6qWlMUImg/BouqYse7r8BUPjgPfla7f9x0Oy46nFGsjJLv61lXt0Smy1sWyrIceE
 BugHXsre4nddwGkTxDogVmDCW4zZBlrLKfmgHyGyFEMgwqyUdIXQeHVfKUAFMAm4GlzjiIQesFg
 QlVJmR5C18PSftYlimS4c7jSebIVzb8AF64QDMieeFBaSTxphx5/3+8QCRhHhiXcDOb1WfftmDC
 oT/LDZfIKVaalFCl/Dg==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8ebf99 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8
 a=7CQSdrXTAAAA:8 a=QYgjaYqrS4LJc6J_j6wA:9 a=a_PwQJl-kcHnX1M80qC6:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: kVGsGPTGwao3RLo2R-QDUi-Dmu2H92t4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260087

Hi All,

Here is a patch series fixing arm_scmi module autoloading this combines:

1. Patch 1/2 from Bjorn to add support for scmi bus modaliases to modpost:
https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/

2. RFC 2/2 from Cristian which pre-populates the scmi { protocol, name }
tupple list with standard protocol info to break the circular dep:
https://patch.msgid.link/20250203100154.140877-2-cristian.marussi@arm.com

1. is not enough by itself because driver module auto-loading requires
the devices to already be created for udev to get the necessary uevents
based on which udev auto-loads modules.

But SCMI devices are only created after their { protocol, name } tupples
have been registered which is done from scmi_driver_register(), creating
a circular dependency.

2. breaks the circular dependency by pre-populating the { protocol, name }
list with the standard protocols. This allows the devices to be created
before the module with the driver is loaded, after which module auto
loading works the same as it does on any other bus.

I've tested this on a T14s Snapdragon laptop with Fedora's kernel config
where scmi_cpufreq is a module. With this series scmi_cpufreq correctly
autoloads even if it is not included in the initramfs.

I've added a 3th patch extending the pre-populating to also include all
the { protocol, name } tupples for the in tree SCMI drivers for IMX
vendor protocols, so that module auto-loading will work for all in tree
drivers.

Out of tree drivers can still register new tupples as before but their
modules will need to be manually loaded (also as before).

Changes in v4:
- Drop unused driver_data member from struct scmi_device_id (Uwe)
- Drop device-id/scmi.h include from mod_devicetable.h (Uwe)
- Add device-id/scmi.h to devicetable-offsets.c and file2alias.c (Uwe)

Changes in v3:
- v3 is the first series combining Bjorn and Christian's work see above.

Regards,

Hans


Bjorn Andersson (1):
  module: add SCMI device table alias support

Cristian Marussi (1):
  firmware: arm_scmi: Pre-register protocol, name tupples for standard
    protocols

Hans de Goede (1):
  firmware: arm_scmi: Pre-register protocol, name tupples for IMX
    protocols

 MAINTAINERS                       |  1 +
 drivers/firmware/arm_scmi/bus.c   | 75 +++++++++++++++++++++++--------
 include/linux/device-id/scmi.h    | 17 +++++++
 include/linux/scmi_protocol.h     |  6 +--
 scripts/mod/devicetable-offsets.c |  5 +++
 scripts/mod/file2alias.c          | 12 +++++
 6 files changed, 93 insertions(+), 23 deletions(-)
 create mode 100644 include/linux/device-id/scmi.h

-- 
2.55.0

