Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2446E374A19
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 15:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140217; cv=none; b=jCuBHbRcsgT9Fal1GrIkP5ntoUonK+X0c46rIM3gl+v5rCRjaWfxLKjWBpfT+uoKvcpn96dHQs04Saka2sDzYT/6jhQaXEwlb8+KgkhIDFjEX2HuVWWlrx5E+VnH8enuvtDtvb1UVMHCyvzQlEEyZriccIFeMegoHJsh/OxSiN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140217; c=relaxed/simple;
	bh=szpOo+mPYKm0LXPJUJFcdhCvXOCrq2ifJ7UtblEKc/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Viz0e0F+mM6xvCHhMXEhuSxZl+LX4l7rR372GkQg82DFZyBBJJq5Z9A+W4do2Z7UJM+YbgqzkOVrn9Mwb2Kx9Th8q6AX1mHtWOoDRPuA1uo1NxazlhmMCpGBpbE3HXfA81+80PT9Hq303lRc/QF+AR4L0c7zeWVZrTyrPESS7kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JSBk6OLS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hKfdOWbI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JSBk6OLS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hKfdOWbI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BFAIfq659053
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 15:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rwTwbnbLuewFhORIlKB/7285T0JExk01gwH
	+AlWop+Y=; b=JSBk6OLSYPVo74ybSiJ5pOAIuWOhMqYRVF3bJjJ4te8EWZHEVsB
	6P48U0FsSQD38omr1YfnWtUqMlE2RtE1EZN+KvDOAKBvrLeAsIPFTWtanj6GYNRb
	INFOi4U/juywHFVEtgR1IeuwVhvrMWgdRJ6mm/lmrOC7Bnkp4v+31HD8wiWYeN7U
	mW8pF0ib+ZH2kzcLYzTy+RPNG/ZCUyqkBxwQ3av9AMDlBspiFNRECHJHhng/3+t2
	5q/Mmf1oUchSMnKKZsW2cHV12StDlTTpPc8LHlo6cY5G597CXH7urVcKTJ4ys+2C
	QYRepI0tumv0DA+srB5dj/PK/vnjvuEnbmg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmm22r1p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 15:23:34 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-980b637ed69so170982241.1
        for <imx@lists.linux.dev>; Fri, 11 Sep 2026 08:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789140214; x=1789745014; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwTwbnbLuewFhORIlKB/7285T0JExk01gwH+AlWop+Y=;
        b=hKfdOWbIBvWRshDF4xWCFTRliRBQRAinQHXnuIXqXXDCmThvhBo52UhRNcJ21+k7Q5
         EyLbDFvg11x7/1USWXZ3Iw7lb7z79uv190mGyXEDrUvaD2mPnpowdQDUKcUrywHsNcvD
         X6ho6AJSyDKEBIKe49yy37LLQdYnFg+HUSZuxjM4ZbI2E8lZ9VGtgnfc8bYEeDDKvCa+
         tDMIlxohOtueE5eiSgg0IGzbMai+l/1GjXGy1Fg2mc9lKYxGA/rjH8m5AYGC9N/cxsVp
         +X26nUJB+w7mCWVeoBCsteGU4oDrQScGr3UhP/5uHopMcJUB3mzIWXtBUBzzyt7NzJ5X
         DCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140214; x=1789745014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwTwbnbLuewFhORIlKB/7285T0JExk01gwH+AlWop+Y=;
        b=D29sGE8swhJ/b9Wc8egu5oI14EpcT6PwRljA7UYZlb0UWkrcjSDJ1UldZDatfXGzZM
         ctOEEoojn/ydyltyUQcBW2hmc+S13WcvrG/OlkwAzNyI4JeFtiIYEDDw3TaieD7I9P3J
         8kvnAEgnUHMWRymlI++juAA7lKfbu2tIpDRNFG+3vdhAc/OCNaXeSxqebG+oCpkSSvS5
         w78+3KNC0CiCmRwV76QCiTxEfnCNIl5fg+8RzRx/WAMjO3hfsNImLa07RP/rfawIlZsz
         jkswtTVJZ7JE349MuxtU/1PS1H+iXPTlRBuD8J9K7jtJELSVisOS6zRGtAJ5NtW4Tmy5
         Ts1g==
X-Forwarded-Encrypted: i=1; AKwUvBxnoW/IKhdIj7WPXYqIXqx1/WGqAGhZCMlZkLbhVG+A5bd8LvG89LNEhnBdle6rG2CL/4Q=@lists.linux.dev
X-Gm-Message-State: AFuF++k7wpIbGEZOjQJndj+h/HnxP0Ax3mek79V1zED3F+33hhSTRSq2
	O93y+m+fyHfAm++E/bLUkb+pEX3mn3k+Wb2pMaPlaNDEnlQVmVKJBR8By90vVVqAzSYRGIGJY3p
	TZJdT+cp7okizjqL2zGIHeDVAIrCIu4Q5G9r+bE1t/7BtkLlWU8RDzDI=
X-Gm-Gg: AYBFou0f8sUcJXOFSv9myILsXtvFb++lzpBCSEzy7UNLHiBiN5hOs9KPpkeqPraF9K/
	OhuOUD9Ip4JOqYWWSqXE25b70f8q/TxFhGJYKH4hkLaG++WZnllzDf6oYThXRY10ffGavvnK43t
	Y7oAWo2Tx0+bLvTsgpHWH8HCoyUxbNz+H59b+SJiUEpBECiwSDy9/mgFZWUKGcdeKjvtFaFP298
	E4htvgq+IWOMC5kfTzKKMwiwW2uozzTNVDPbv47HOVQnqaWh44MukiXiXSPSAsueI+ZuBSdDFVJ
	MhDiFwCS3T0n7nZjkW4cREhsMpOBqx53Fs88V+6T0/QgEuRSi8qPFQMdzBixK2hfsBKRbliH3cA
	jam7FbjqPz2f7nv6EUCCAXFDCjjPhpUdEmPe8MkFHuSC7wdavKUPzaCvZIIiPqxqbqB8jlMTIcn
	WJyqp2cX6jZmrP6e5jZDZMcTf74V2LMxQf52Cz
X-Received: by 2002:a05:6102:3a13:b0:778:71e5:45d3 with SMTP id ada2fe7eead31-792ab142031mr5533610137.9.1789140213600;
        Fri, 11 Sep 2026 08:23:33 -0700 (PDT)
X-Received: by 2002:a05:6102:3a13:b0:778:71e5:45d3 with SMTP id ada2fe7eead31-792ab142031mr5533490137.9.1789140213093;
        Fri, 11 Sep 2026 08:23:33 -0700 (PDT)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614323csm94042566b.59.2026.09.11.08.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:23:31 -0700 (PDT)
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
Subject: [PATCH v6 0/4] firmware: arm_scmi: fix module auto-loading
Date: Fri, 11 Sep 2026 17:23:25 +0200
Message-ID: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX5+s2mXImJoRK
 ioUJp2Qsfn3E/dApfNj8I9ypW3xd0tcJOeMOwlx1bcf5rboSbZiTZJLNyCm/5QtgUzfsm4EWXG1
 UxsOGR4xSLm5x/6YFjCNtdN97WjakFewM7/LDmURFVRj9fGgRUaOmAQXcdfuYc+GYgzFgEaK1Wt
 jmXCDY7BUc5IpLtvqKnq41wv/FQSVv4IqqyuRrzZKnSHH9B3qZW1q/UPAQJdTdDJxSBwvk29QGR
 H8bxAYnD2gh6rQiDpX7xlX2wE4udAoULAn9U7bCDKfKGaj21SQ8SrAn4+2eKkJlnUJSeXGf0Lfg
 31yyftWhs5XeSLlJ5jW6JIunV8BmF0P1uA6T1Kflqkv68pH4uZ9nWGHAQVXHNLuqxxddbfRuE46
 j0ljVAXXAPHXxT8sH/IWTjX1L1/iJfRwQLPFc78GbiEbtuYKy+m4TGQLivh1f3lhIxD+8uskHmA
 6q4VIvFkfoGdsTsS6NQ==
X-Authority-Analysis: v=2.4 cv=LPDz05W9 c=1 sm=1 tr=0 ts=6aa41cf6 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pQ3uMOGh0wyPnyaBa88A:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: vt02-sDlZfUiB7OftwcZLJJp2oMed0fD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxNCBTYWx0ZWRfX0onf58Jl3NFc
 N/yA2eb10zeh5C5Hufx4/ILOjbCA8FFpaI4dDXoRH8pe9+Yg4wGa1UsKDmKu/rBTZESHPMo6osa
 ixBcoFcXI1z9lQ7InU/XUo5wJ8MRM3w=
X-Proofpoint-GUID: vt02-sDlZfUiB7OftwcZLJJp2oMed0fD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110214

Hi All,

Here is v6 of the patch series fixing arm_scmi module autoloading this
combines:

1. Patch 1/4 from Bjorn to add support for scmi bus modaliases to modpost:
https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/

2. 2 SCMI bus code bug-fixes.
 
3. A new patch to always create devices for standard protocols, replacing
Cristian's patch to pre-register the standard protocol device-ids from v4.

1. is not enough by itself because driver module auto-loading requires
the devices to already be created for udev to get the necessary uevents
based on which udev auto-loads modules.

But SCMI devices are only created after their { protocol, name } device-id
has been registered which is done from scmi_driver_register(), creating
a circular dependency.

3. breaks the circular dependency by always creating devices for standard
protocols without relying on the requested-devices list. This creates
devices before the module with the driver is loaded, after which module
auto loading works the same as it does on any other bus.

I've tested this on a T14s Snapdragon laptop with Fedora's kernel config
where scmi_cpufreq is a module. With this series scmi_cpufreq correctly
autoloads even if it is not included in the initramfs.

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

Hans de Goede (3):
  firmware: arm_scmi: Fix scmi_protocol_table_register() error handling
  firmware: arm_scmi: Fix scmi_protocol_device_unrequest() race
  firmware: arm_scmi: Always create devices for standard protocols

 MAINTAINERS                       |   1 +
 drivers/firmware/arm_scmi/bus.c   | 107 +++++++++++++++++++++++-------
 include/linux/device-id/scmi.h    |  17 +++++
 include/linux/scmi_protocol.h     |   6 +-
 scripts/mod/devicetable-offsets.c |   5 ++
 scripts/mod/file2alias.c          |  12 ++++
 6 files changed, 118 insertions(+), 30 deletions(-)
 create mode 100644 include/linux/device-id/scmi.h

-- 
2.55.0

