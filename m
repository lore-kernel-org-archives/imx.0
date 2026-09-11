Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC21B3815DE
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 15:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140232; cv=none; b=Cq7u7CkLAEzy4xCe83LBMkbbPhzVIQm9gN0dacR75YdBV5h4a06tiHYHqq30gSkbeYEjYT1HnuzfeO8Tk7VT3+JMfcpVbyP75BAIRenozpptYTIjAprwVkd2rytw9w2VvqAFE6qFXxwYfSQ7ON6XPVxgKYnVMS+hpqKx/bFplms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140232; c=relaxed/simple;
	bh=IuAWYhrq8iC+CikdHI/e1ECe/txOrhjj6EPDSmygtY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cXSQMCHw/OY6lgkMHC4Sg3CQTGyfa/fzFNWXov8Z0YwcW+vRci1IzVyTy4yGdp+q1C7X8Yw+HoNArlXE04J06F5MpM//LPLXn6BTDYun4RGTf0MsgN+W3e8pwwsvUnqXrNo+tQBpl2+xiCvJzqs1hJCVRt3tbp9ew9Ok9+yw4Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LhMHT+xB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDs+mZL1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LhMHT+xB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDs+mZL1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm2UQ442908
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 15:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mZj8U1PD25c
	E+8ESg/8vDL8EK7ciOY34ML1dGtbAf+A=; b=LhMHT+xBhFwTdV7bkSdWxz4EoAC
	z7U/u39CJNv7+23UyJYMvjDYMEGHhjYtseSJJci9B0nWGAImnllxhTjT0EANdoKP
	O0D4JBPXRbsyNibsjRLB1PDsU7yNh/QaRMmRbqfRkzOZZ1O1flN8oloWTgobel/R
	IZXEaxIvwmnbmwUbO2FFAb44stsRh+9EwQdAiFTWW4r1lIJOfnYoBLXOcc5Jfz6t
	acExdXWI4GV1osNWm9kSyXrS9jbH72IQhj7vmOCHuTfn55h8fGXsH0rp8Fyf6AfX
	9kEIFFa5/DRPc4fMAv7p4LQVQQ9KeWYmcZyeujF6e8i+L2GmhgV/24R4f1Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg2knv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 15:23:49 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-79129463bb2so274498137.0
        for <imx@lists.linux.dev>; Fri, 11 Sep 2026 08:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789140229; x=1789745029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZj8U1PD25cE+8ESg/8vDL8EK7ciOY34ML1dGtbAf+A=;
        b=dDs+mZL1+KwH0/var0fcG3W4+/yMUAcPDT/0FIV7zSRrSelCp/6cYStSB7iWZ07vRw
         CsndlnHgclGmaLSDOOWW3lVgIMWfJpVUiw3f87mTrt8AqbBwipU7SPJYTeNrjRuE2Lar
         hDg4fQvu/mbRY+O1siI653RBZTaiMio32aLK+XnjRytb95dXpaZeGspACqYICdyzPPe/
         9DXzp0DWf50dmanPlqMgIYD8tj61Nt679HNW1NVDr6O/Z9iIbvJSLXJtYNtOyI4jAQRZ
         4vgYzrCyGCyzW41ik/VeTEpijuJxiQgLC4Km36hHofFA3oz+KWiZINtmcybPdfruGJ2E
         At4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140229; x=1789745029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mZj8U1PD25cE+8ESg/8vDL8EK7ciOY34ML1dGtbAf+A=;
        b=W11Nc17miUESw6haCFwFfVxdB7tLef0bZRUX9wOZqeyawTGqO5SdnxhDsTWu5cksWy
         H4mliEtWFMixZAfYwOT2pEwXYN763NJt/DgaRj3TzOavoJzMKlinsnmeE1uuSUydV09B
         yAIlEo0qx3qtr8DFxqI5GQiSFJcgv/Q9kI3wxzEK5ucxG2Ss5EiUrPjpaYmBaiUEE82Z
         LZxZl3jvwT6KWMsutGwxx5Ltl51JtRkE9nPz+dgDOvhQUhd7SvZ6ZsHqKWvu0cLfD5t/
         PllOZXzoO1PnTa/w+REKNX9A6OrEQmdFWFe9+as5L/FZScffNP0pPeQL+fWE+2+QrQGU
         XeUg==
X-Forwarded-Encrypted: i=1; AKwUvBxvLVwXEbeRMFqvnM+8R6Xf7O2B9uxEEeC1pOTWH5i8KLsyhEvjuqv0GXMGxftFI+jhMDM=@lists.linux.dev
X-Gm-Message-State: AFuF++l6poBF5OYb3daQ80kO/L7xqaHMCM6z53Y/XAsfzuAWeo19p58i
	QiJUeZid31Ll3WQ/dEI0uK8AyWHZw8jga6yjoXj4nPAjI5lGSo0UP816+GswELKMEl165EDMmg9
	l4XnHEpnSnaGYYypfnp50+Va/sFdrwedxRvR4a8NWl2EH6fMi73TqNes=
X-Gm-Gg: AYBFou1pvGk09v67rs5+kEF4zUeHaRycNzJ7cqSVP39AD35HYzcKK2vqglbsSrexQmd
	rRR3Ltva70ikCGbUWqu9K8ix7eK0HgF8K8PcYdRjOqMqPNYzjJrrHAUGOMk8HPCQb/urJda6mkj
	3Sg73LgcsWRvVmfIQZVkaaxmATM9ynVCPQ8nbxvB9ZrG00/+fWEfyDEn381OMncCtWJ8D8ZEcr8
	fCf5BuyQZXrURsCQpFOS+3OG0QfvkOWqZDR17R+y8fwM1m/jBCkAzGmaWETpePRJwfwfBgTv9SY
	OD6paAWpCWvsBWXFHa8Z/ad6QPHFlpJDNvO9ADxbXJgiydY9J2MA3KIZHTbCc0tsJGY+wSkd8Au
	L6SlrK52czhryCZHBwFpcy3SAY6z3FJiqCFc4e3tKj077xkJZJcBOPWJUygy/E5qt5EGHYqp6TW
	ajYEpjXoZb0MMJBl3RR+gzZBklectqSVJJjScp
X-Received: by 2002:a05:6102:c8d:b0:793:980a:d1ff with SMTP id ada2fe7eead31-7939829b4d3mr3029890137.3.1789140228752;
        Fri, 11 Sep 2026 08:23:48 -0700 (PDT)
X-Received: by 2002:a05:6102:c8d:b0:793:980a:d1ff with SMTP id ada2fe7eead31-7939829b4d3mr3029791137.3.1789140228322;
        Fri, 11 Sep 2026 08:23:48 -0700 (PDT)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614323csm94042566b.59.2026.09.11.08.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:23:44 -0700 (PDT)
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
Subject: [PATCH v6 4/4] firmware: arm_scmi: Always create devices for standard protocols
Date: Fri, 11 Sep 2026 17:23:29 +0200
Message-ID: <20260911152329.5822-5-johannes.goede@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Wt-gECxn2R8ZkpO1RSR106YULJJDYZm4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX12PZOq4ADsKL
 xjvasM8P/WDbhvQ2x0Wuym64Zwyte5V97bAezNFmKj7wyoxWMjxtHPasH8PGtxLlBUNhQOGp2k0
 5v+vXLEM6TT+3TUmR+igRkOzviAeoKw=
X-Proofpoint-GUID: Wt-gECxn2R8ZkpO1RSR106YULJJDYZm4
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa41d05 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=l971TreVHldC-rsvbM8A:9
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX7t/yCZh2xZmB
 HXvUl8ytfrQBdxhajt5MUfEJoPkH4clc7cprPvWny7J1aOJfNeruPnzGrl5r4Go5PHjwCATG7Tf
 I7dy9IzAhAY4R278AGzBgfc2T8DQziPpWcCnpbdphdn9kO/BePqoJxYtmbjVOyQ1JeJl1WX+E1/
 ukXjtniQ8m3t6eG1i+EvdDn/3KwlptQywrEHb6LvU751cHM2qfmzAiY6EBq7yFKiKxnJNzBT7T2
 vopt4xv3MrgR/Ajc2wlfyR9y2aQBQAZjKNHm550reZ4cTA8aI8jgUZmO+gTTiJmbYOQU2O9lcaI
 eARVjSH0MyfHQm+kN1DL4X+hwuFRaRbu7QHeofOgyKXQ3S/SXSsipX29ebfgA0hg1fJMR2+VFu6
 dWLvLTeehmMhPaUTFQgnpjh/a80YW2a5JjmRLGJlmgP1bU3sF8BdKyzZJfJwLnSlUEXQImI03jl
 L1gVpwNTt8+EzLOIIBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110214

Protocol driver module auto-loading requires the devices to already be
created for udev to get the necessary uevents based on which udev loads
modules. But SCMI devices are only created after their { protocol, name }
device-id has been added to the requested-devices list which is done from
scmi_driver_register().

This creates a circular dependency where device creation is waiting for
the driver to register and loading the module with the driver is waiting
for the device to be created.

Add a list of standard protocol device-ids and always create devices for
these without relying on these being added to the requested-devices list.

This removes the circular dependency, fixing module auto-loading.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v6:
- Replace the if (!phead) return NULL; early exit with return scmi_dev;
  Since a standard protocol device may have been created at this point.

Changes in v5:
- This is a new patch in v5 replacing "Pre-register protocol, name tupples
  for standard protocol". Pre-registering requires
  scmi_protocol_device_request() to allow duplicate device-ids, but then if
  the first driver of two with duplicate devce-ids gets unloaded device
  creation for the second driver will fail. Allowing duplicates causes all
  kinds of problems, so this new approach avoids this.
---
 drivers/firmware/arm_scmi/bus.c | 50 +++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 651d4ba06574..ea59dcd95b6a 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -511,6 +511,34 @@ _scmi_device_create(struct device_node *np, struct device *parent,
 	return sdev;
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
+static bool scmi_device_id_in_std_id_table(const struct scmi_device_id *id)
+{
+	for (int i = 0; scmi_std_id_table[i].name[0]; i++) {
+		if (scmi_std_id_table[i].protocol_id == id->protocol_id &&
+		    !strcmp(scmi_std_id_table[i].name, id->name))
+			return true;
+	}
+
+	return false;
+}
+
 /**
  * scmi_device_create  - A method to create one or more SCMI devices
  *
@@ -540,22 +568,38 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 {
 	struct list_head *phead;
 	struct scmi_requested_dev *rdev;
-	struct scmi_device *scmi_dev = NULL;
+	struct scmi_device *sdev, *scmi_dev = NULL;
 
 	if (name)
 		return _scmi_device_create(np, parent, protocol, name);
 
+	/*
+	 * Always create devices for standard protocols, even if the device-ids
+	 * have not been registered into scmi_requested_devices yet. This allows
+	 * auto-loading of SCMI protocol driver modules for standard protocols.
+	 */
+	for (int i = 0; scmi_std_id_table[i].name[0]; i++) {
+		if (scmi_std_id_table[i].protocol_id != protocol)
+			continue;
+
+		sdev = _scmi_device_create(np, parent, protocol, scmi_std_id_table[i].name);
+		if (sdev)
+			scmi_dev = sdev;
+	}
+
 	mutex_lock(&scmi_requested_devices_mtx);
 	phead = idr_find(&scmi_requested_devices, protocol);
 	/* Nothing to do. */
 	if (!phead) {
 		mutex_unlock(&scmi_requested_devices_mtx);
-		return NULL;
+		return scmi_dev;
 	}
 
 	/* Walk the list of requested devices for protocol and create them */
 	list_for_each_entry(rdev, phead, node) {
-		struct scmi_device *sdev;
+		/* Standard proto matches already have their dev created above */
+		if (scmi_device_id_in_std_id_table(rdev->id_table))
+			continue;
 
 		sdev = _scmi_device_create(np, parent,
 					   rdev->id_table->protocol_id,
-- 
2.55.0

