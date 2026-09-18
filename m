Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE51636167B
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 09:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723797; cv=none; b=UtZeRC206FYHLgJzVcMo63+CIg++mMTF/NdsgopGKttYtqPEsWjAweVXPqf+C0o8dUqmT16WIUG+bqYvzJdZPIchHmJogb489u/AMQb22k1n/MvUPT+K+w5RTUQBp8NKY3uk/W2v2CWFT2WpHjgnsbi3z309chMIzFCuYs1GEkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723797; c=relaxed/simple;
	bh=X4o6heKdgqyedmdhEI5qR6NAH2RMCo1d01E+qxeNtvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mGGcIBlLItOVJsdc22O6tR0ahaN/xDmZ12dNIDBHk2Ungnh15vjbCFuHv1bkwN7nh3dcAOBeU2v4/xdA8dIBoL8lExV1DdhmxgvAgmzIThHr+743CuMD8ws6DC+u8wrch1al9NjB6VL8BMjHEXzOdvD0c+Pc8bKfD78kc+Zizcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fffPpa5/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BAhk7QCl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fffPpa5/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BAhk7QCl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I8kdGA132284
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 09:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=18TSNXZJv4cHi+Va+9V9JUhcYS6Hb20z/2P
	F/wFYxfI=; b=fffPpa5/8Y+LmheYil3ZBLqczHXazeQzdAFtQsjrGDuA6HpUQg+
	Mz2FbRvF3hISFFd2465/0CRYGiQk/j/iFLbhH4qXOWbtVIpNfBwU5ufS2XPWkBID
	ObYTcOooT+DHaW80RpfwaoxbLZZqoxb3E0+4VqZfJomBBCjrrzKs52yHE/HVoffl
	80FHd4gX1Fyt3SyKqXXVeZy0fRVJW1z5kHhAw5PD6yXnrfKCGdDJAgMQpe7xGvu7
	mhunvHqv3jGo0sik2vkDKXPtmSZxFoeerQ7UHCTXIs5ta9QPNnFDiJd4xbOAfuhD
	Qtky/WnN9FPpPjSDD+uDbcf4GBEwJds04JQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs23905y0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 09:29:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1bffc2eeso145921585a.2
        for <imx@lists.linux.dev>; Fri, 18 Sep 2026 02:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789723794; x=1790328594; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=18TSNXZJv4cHi+Va+9V9JUhcYS6Hb20z/2PF/wFYxfI=;
        b=BAhk7QClkNmX9Ls6skHLHZXG6JVbGnss+H7XEsN6wfFKStG6z2EDjDU9sVCLG9W1pN
         iJ2ZEd5dY6XSVrhmEFaQ3u6+Phv5m3nQzf16Azw/5hYuKKGHEdiEoCQgTyhJHnBj1P5X
         yPQ1ZcKnxIu1hLiclF3YnQ3jMsqTuQiuwI86QydSdUN5JKkzgogKcmns6glxQ7frGjVI
         8WRXRpNobq9/csiTqzgFNUGhYw00r8SXyxpHs5jneDsbc6Kc8NcFSSGlJBZGKLbKl0pe
         St1/iHKhlcqK0evpbFsT1gAQ9IHMfnefMoTOatHX3oU4hqqpKIFbpAeLM7J2cNSiXN+V
         N0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723794; x=1790328594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=18TSNXZJv4cHi+Va+9V9JUhcYS6Hb20z/2PF/wFYxfI=;
        b=0xWBYcgJxAKzBPaceX/RdgiKnesL0PBs1bbGuEiCoWuotw+5leIP/0d6RVVbGPA86+
         /dWHHMPmA/56mmm+S2e1KkgJVb3LukhocktvSXj9OU8i3nWSLPaBQUFJZMKACZvjQkq1
         cq3QjIXpleUmd3mZjlRwQskQigAHwIzDTExpeOgxJNsDqe4db6+Va1IHo065NDghd5al
         /eUMw2mqxtyNGlIEk01u849i04Op923+4E2rHz+ITy+vRu0HmLcY2Xz5mWIRh8PIHHGu
         IeJ1I0nZrKH5PWE8A0VE2/bkKzRouvaOmvt98JSdzcvs/R9xFpOh5YZRcToZRiPT6TMF
         5wiw==
X-Forwarded-Encrypted: i=1; AKwUvBz9EeT8gd1G0ZbI9NbGQbb3wrqZlHAtINQmqn3iZ/W6jn47uTsWN1hP/DT8DeCX88t/i9Y=@lists.linux.dev
X-Gm-Message-State: AFuF++ly0t5ik2sCO/us8aydyPQiG9yMn5Loh9nPBbwahP2BcDgnTKyf
	rrxQ07iW6RypCY/LMvihD+5qYNpiCNbo8+sBTXzwfEYZSMCrnMcqB59vh1aDoh9UqpMMx2QXt/W
	gnu1ZAUOImCNTEZAM9NEJfScpK/DrJ/4cGalC4lC8KEcnKk6H2rpMQEM=
X-Gm-Gg: AYBFou12OrkqeX6Xc5W/36cbT1W53+oLnhwClM2t8IramhtPeIjEktPzL0tUkC9GdBF
	7Fjzg0UkzDd3a2wBYEcYKgsd1gzEuccoyfoUa5eB5uRuGJ3vl969rS44HNhqipu+xX8p1vYqbtx
	QEMPJgIU6x5ExsOM99gQP34TphkEyttBOE8+i+wncepdOesU+7b/3r0zyRfGbb6CIUJoABbnIKD
	OULi7hYM771gzrbF6Q1LnPTLo1f/oz9HFKgUoy8WhuE3WSKbDMUtw1AVZvL+cY8+y+Vxn9PbWOf
	wZN4DGrnvkuw+PVWXrMg+e5VKrYApEO9fVo7H/qpd1zFn0QhT6VE2F1ql5VnAAhI1pCv2/ItQaD
	+mFPvkR8JRfT+iuyUkmQ1cC7EVgpSxcyGPvVxq4pYtjIWSMYfussiUINwywr6XEEC+1d4XUd2Oa
	1Ng1R7QHtRc+E=
X-Received: by 2002:a05:620a:700a:b0:934:946d:599d with SMTP id af79cd13be357-93bdc704c80mr245526085a.33.1789723793811;
        Fri, 18 Sep 2026 02:29:53 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:934:946d:599d with SMTP id af79cd13be357-93bdc704c80mr245524085a.33.1789723793406;
        Fri, 18 Sep 2026 02:29:53 -0700 (PDT)
Received: from t14s (2001-1c00-0c32-7800-07d4-cca3-ec08-7ac7.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:7d4:cca3:ec08:7ac7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6bc0sm36796166b.60.2026.09.18.02.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:29:52 -0700 (PDT)
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
Subject: [PATCH v7 0/2] firmware: arm_scmi: fix module auto-loading
Date: Fri, 18 Sep 2026 11:29:49 +0200
Message-ID: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfX0+I5YVfp5eIU
 AweVIpNHOHQGlM0AEFSnPhZ1uTg9nVx/tZiJ8NleZp4tl1GmdYkdzh9sdGSX2eyKAaQi6WpNF8O
 3BK8uOPLK/d8mAZu2HaBW4flqu80Xeo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzMSBTYWx0ZWRfX1wOhi9Kw+yRB
 EqpxDSBIVJxPTk/q21dSp0EaCP+NLsShuXKtoAA25Qfcuty+++TMf3l1KAqCz0lMzyyWEYYc00K
 kEnRhg+osPy2iayWTbVmysNIFwjxf84iMJvmCH+rtYY2+aNkAI3YiRLDCuOcd+TAm/haAQKV/J0
 eGHbAIT39xk48yVjORh6p6UfEGh+hZAn6Pqv7zjTkVu868bMDSE314ALIQxw3s7+gM5i7Y3hUjQ
 cn0x6NPHzTu67wdpaZLoGUIKjutN33XEEdo+thKHoZ1ZeSYpWAVYL7WGzC+xDLXmpZ3iNsVhWpE
 XdyZD1SoOg8B2/RndsuFVEk8/kZB3zplqedyx6HWJEHdp7RQU4b0UAicH2JY6rKUo9RO11cUp6n
 rgF+1c9eZrkSfhZypmm/z8WNGhuSBBbF5B6aYFM6SzAkUmN7fHUXYf9VccXIkhVjkC+41qetZO4
 wTje4VS1Vwqule3vS1A==
X-Proofpoint-ORIG-GUID: 5Axe-nTtuzGbl46I6NvjXJTYAykeLyzI
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad0492 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=X-UiWFXO2YgWyHAQv0wA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 5Axe-nTtuzGbl46I6NvjXJTYAykeLyzI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180131

Hi All,

Here is v7 of the patch series fixing arm_scmi module autoloading this
combines:

1. Patch 1/2 from Bjorn to add support for scmi bus modaliases to modpost:
https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/

2. A new patch 2/2 to always create devices for standard protocols,
replacing Cristian's patch to pre-register the standard protocol device-ids
from v4.

1. is not enough by itself because driver module auto-loading requires
the devices to already be created for udev to get the necessary uevents
based on which udev auto-loads modules.

But SCMI devices are only created after their { protocol, name } device-id
has been registered which is done from scmi_driver_register(), creating
a circular dependency.

2. breaks the circular dependency by always creating devices for standard
protocols without relying on the requested-devices list. This creates
devices before the module with the driver is loaded, after which module
auto loading works the same as it does on any other bus.

I've tested this on a T14s Snapdragon laptop with Fedora's kernel config
where scmi_cpufreq is a module. With this series scmi_cpufreq correctly
autoloads even if it is not included in the initramfs.

Changes in v7:
- Rebase on top of v7.3-rc3
- Drop:
  "firmware: arm_scmi: Fix scmi_protocol_table_register() error handling"
  "firmware: arm_scmi: Fix scmi_protocol_device_unrequest() race"
  these issues are already fixed through other patches in v7.3-rc3

Changes in v6:
- New: "firmware: arm_scmi: Fix scmi_protocol_device_unrequest() race"
- Add Fixes tags to the bug-fix patches
- Replace the if (!phead) return NULL; early exit with return scmi_dev;
  Since a standard protocol device may have been created at this point
  (from local Shashiko run)

Changes in v5:
- New patch: "firmware: arm_scmi: Fix scmi_protocol_table_register()
  error handling"
- Replace "Pre-register protocol, name tupples for standard protocol" with
  "Always create devices for standard protocols" pre-registering requires
  scmi_protocol_device_request() to allow duplicate device-ids, but then if
  the first driver of two with duplicate devce-ids gets unloaded device
  creation for the second driver will fail. Allowing duplicates causes all
  kinds of problems, so this new approach avoids this.
- Drop "Pre-register protocol, name tupples for IMX protocols" patch.
  Shashiko rightfully turns out this will cause problems if other vendors
  also use the same vendor protocol-id space values, e.g. 0x80, 0x81 are
  likely to also be used by other vendors.

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

Hans de Goede (1):
  firmware: arm_scmi: Always create devices for standard protocols

 MAINTAINERS                       |  1 +
 drivers/firmware/arm_scmi/bus.c   | 71 +++++++++++++++++++++++++------
 include/linux/device-id/scmi.h    | 17 ++++++++
 include/linux/scmi_protocol.h     |  6 +--
 scripts/mod/devicetable-offsets.c |  5 +++
 scripts/mod/file2alias.c          | 12 ++++++
 6 files changed, 93 insertions(+), 19 deletions(-)
 create mode 100644 include/linux/device-id/scmi.h

-- 
2.55.0

