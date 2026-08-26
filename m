Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1862327E049
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 10:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740069; cv=none; b=DGm4J3bmmKHBOsDUN1oBfE2OrsEPW+bFKM3Xc1OeJS5uA10g3xgiQnZZz0jccny+eBaeQ+JNref/Qu7e+QIujGrRxKOYzOgsTDjIX3hApFohSZTiKEjPUj5RoUlDh8tl9ACgMVzv9tg9rKGqdxiIQyEAXAWQRwLtAZQpWxzKZxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740069; c=relaxed/simple;
	bh=4WRilBWhHzZLU8uvO/z39X42z49BUIa3+WWApYbxJ24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uHD5qiA9A4F/+sZebwHvPW5YyeS7yZ/7j5NSdiFOYNkWE1TVZaYj1xDaJqQD0e2eAYcrI3i6dFbLcWgaw3XjMFVpiNHeWB9OwjTDTwbPEfYxbILEBd7LEr3cXEu0T83s78Y47kxBYF40xNRnI70g8w6bMm+CB22oIJ+2yDiLzAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3ToAtLn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRHLZQgr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3ToAtLn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRHLZQgr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGdOS630855
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 10:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c5VY/KOB4mi
	ZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=; b=f3ToAtLnnYAf6zOg5679hxdEAY8
	VinJg18H1mIPlvYvTXCu7/GToxUrtiMSrz0i4hAGa6PGY9m8KC5p1dbA0/DjesFL
	dOCuxSXs+BwIxiv6K8fQJoKEdVI6f7mSCow6kKgymCiMH8ypSKsC/J2p5Ubw9f5k
	YooO9OMs4Yx7uMQmvG4yZcOXYy5Krbjq1qBAdQvdzvx/EpaLWWBLYtJ3zWiU90qA
	u0zX7s+7c6bK4AnHveNHlGMfy+2OO9Cia4QyjUVq5ZOnJNa5t6i2TiTf2TG4bg/t
	J0bJKZvwrSPXWN2foz57MQ5CRpf7vaP41N/vW+g+OdvJeN9kJsxVDTvzTzg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r0k1nd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 10:27:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe3fa93bso4754051cf.2
        for <imx@lists.linux.dev>; Wed, 26 Aug 2026 03:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740060; x=1788344860; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c5VY/KOB4miZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=;
        b=hRHLZQgrtwJ06zIintBz0SIHBgdGeDpdAvHIZuLGS1ZYDxWr3b3EIL9UPNNHtazFdb
         Ym0LRPQIYmvG+SibKiXjigSaEk+heduuz5esJoJFPQdfYMtpCCTnyFEpXmLJ6O3OSnp3
         gF7aOy8fF/HzMHpZAp/Fw2rSdCt5+YPYCI68ZaN7FDeFY1WR/n5tqYqgxnpCha4z2hbw
         vkQN4xdsgsnFekVWvxgCnTAadp3nWe+ctY2GsEedqGYlptV5ko1lNtAVpsblYEG/p6Ok
         rXl8cyR9qy2Sx/9tUPRCALbTb+l3mAExXwUYQCZ4ZNd5W2iCHCkCHQS/p3+nGpRAr8CC
         9OIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740060; x=1788344860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c5VY/KOB4miZQvykR/E8D9DhRmzVzOzBrO3/MiSseIo=;
        b=SfQy+Nqa5yxiTOvfp+0m7ajaICLiibc092pwaEWS3Bsiid6Ah+YY/cLvA6ZlzgMMze
         IxReXZEjn1RuDaDhF35c7bQUTialZbiuiSm4HZ65bRPU8YhkTBbT/xGpK3DvugRmxpzc
         jZvLkD85SwjLwRzaP4O4dBI6n6bVOMPKD44Ih82ObUkqgxV9IAjJn14wJ0LjalisI+TM
         seIfNOQ+fwxOOc9Wu9rDaTjTn/Xcp88A5yHEdbdWS8g1YxRNKfrrODdZ9+68Itfz71Ax
         9zW9mSJh5MmKd5BBRW2SabkILGKJdNmnBChB/ijUMZVm4ejl1xwJrDUWJFERVHwg07J2
         lnfg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3HTteo5/et2ZWorZLFORrYS1eNm+1XaGelm4IyWJJok7N3ln6bKkdndMRW21CG/GE1zc=@lists.linux.dev
X-Gm-Message-State: AFuF++nsu2Kn5r7xj6zCOQ+PJ4jGI5k1GAiC3i7WzMflMpsUlGfLqQGY
	6/75eHP9a8F6NoJwGnEBMRE3QL0x8Ijoq1FlQExgxhrg41gD2Fv4OWcR8nvRGSKHEwIpHLJczqg
	E4BEUNPISHEZhU/D7jvfPYfrSWK8fq1q1pgNNWVIvmxCW1yS94xkVbmM=
X-Gm-Gg: AR+sD10oisOZEAQA3dM9UQXC2oMh+F2mMX4eg7yF9XQiO4+MEOtL4kX6JwFGjGYhUqH
	OdkcFBbxdMTcdDlNUAj8bGTwOlxyZrNVjEeDsZ1IP7Yfg++TtZX4Z7e/vFtHJym/aPGc8VdV9oH
	BT8DYsX2DZNd9+uDUW0m+3hSc/3UN4YkxYru3YEzQwUnUz2MgmdeGbyG5JxYGJLMo7f8vg5KDwg
	3gk5SM55qPCWwRaaAr08eV3iEWc3jyj9WWml2TfSj5kBIIle3GFfC4xOeZ8EzKZS1jRlVeifpSO
	2yFk5wIr0KNj4Q+dHtqm7XGUucUUfYMOJDv78lJ9Dd34ijKbABFDDCauOB8tE84YkyXsrmBGLde
	C4wqnzDoLxdwTN+xnuYCcrLlkEi9669FIi3g8lo9HUXCPa064ETMMfOrq5fjZ7HmRuSCilZjMw/
	DfoutQ+wEysESvpvQ=
X-Received: by 2002:a05:622a:8c1c:b0:52f:4a76:750d with SMTP id d75a77b69052e-52f4a7675d1mr2032171cf.9.1787740059605;
        Wed, 26 Aug 2026 03:27:39 -0700 (PDT)
X-Received: by 2002:a05:622a:8c1c:b0:52f:4a76:750d with SMTP id d75a77b69052e-52f4a7675d1mr2031811cf.9.1787740059146;
        Wed, 26 Aug 2026 03:27:39 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d68d1sm506364966b.11.2026.08.26.03.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:27:38 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] firmware: arm_scmi: Pre-register protocol, name tupples for standard protocols
Date: Wed, 26 Aug 2026 12:27:33 +0200
Message-ID: <20260826102734.31766-3-johannes.goede@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=fPEJG5ae c=1 sm=1 tr=0 ts=6a8ebf9c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=VscC1fOeZKh3OTZq1J8A:9 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX4hf8cEqJZTA+
 +ysTrLW2ejuPZ4QlXOSEbTTHt+D2JLL1x9prC38hlK6vc4sYyRzWcQpT7m8z9eOg+YnnqYHxDT9
 KfnpH1dk6Cofq9stSa5u37jLKOpgtTs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX6l13c2Dto6GM
 l73F+vsB/k2QW8jX3JJv3G+BMr4Xgo+iZFDmLX/wOgfvh++Pf3Z3xtp5LXrfZJMxcnOL3ZxI6RP
 GvY0haqIy0flGxdwfUMlH/1F4PZvqY9jvdmS8vN/DVlcKyO8JKCXx2Z/oGtS4zAuXyQPbO51xjX
 wXDj4SywU/Pd2/JY4KrYEpymAExRWBfcH/EVjakXLjUDZVc5ox2OZ0Q5KwqO77FWIBS9A1sV3Fs
 LQaXgfu2GD+H18I3JdM5o75QZV+rXrnsOBCCu/hqY5qCFKr23N+IoR/n/oByyefi4jAFtebXG3W
 HFwWXxNZuq6pMalSvg0qZ5AqDCapubd9UzCzVaBcvsk2f2yMVcgfG+lef1XUGroNS0w92qJSVLr
 0eHPa0uNlfZmd5S5O6uaJuMyBnV0yNhVekKoe8Z8nvt5Dy30mR8yzPYyC69XrB5830b9xTFq0rU
 e6EMZvr8V35sT0PzGMA==
X-Proofpoint-ORIG-GUID: _FdS9057LWtb8FfUFImm6yo5YK03YXSB
X-Proofpoint-GUID: _FdS9057LWtb8FfUFImm6yo5YK03YXSB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260087

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

