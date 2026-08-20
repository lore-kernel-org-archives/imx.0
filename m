Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB8637F01D
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 19:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787255338; cv=none; b=M9w3w7e3MIV3ejxZWFas8HOSjhIXxwomJazDp+trxXtIl6AFHZGi0QeTa0d6FMzNoadyBq5jEEH1EW8vA6obqrhlrXZ5nd4MvmzD4h6wcsAFMP+25fSYUJQSJJqA/hhjTzIoxBGdGCEGf0UHu8UCWVhQQPmsYyODl1BwzJz1Onw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787255338; c=relaxed/simple;
	bh=C8tLQCcUPVyl+nU7V9GvLsHmUI3vby175dXTcf2BV9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PVHqoeqBmrnhyxCHjQCoREcdS1JUpi5u24CRf/qSZHidgyCeg73oYZJbIwCXOy4+fEMe1XuUZfsAGUek9xCxFfSwam3CaRrPk8HfK4mmX70l96ZSRhi00H0MKYTZ6+/64vKZFPck18UDDL0cI019j3OyNzuwtRoDSq1f/KK8exw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOWetbHj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IaQDOT9Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOWetbHj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IaQDOT9Y"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIIutC571534
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 19:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=x2Cmaab1c8skxG2XWMAOAO6+MfGSdVWYe9e
	RT+Q7FR0=; b=DOWetbHjIo3hBlH5OepFF2/oJtZ9sj1U5SchZFWIhPK9l2Wv4yA
	wku2TSLme2SYWGRTyUNtwtxGkUq0f8aTT8+W9YjBaFuZpOgWkwL+Rz2rvIjMt2TX
	P1zt+CMJGxoNXfLp7KzLU7+Kw4EofrpCUqYwSW3R327aMkwwJJAqqBFCsZZfZ8Jj
	fU8em8swmTbbBkz0MJJ0YhWmzRC8HZXDhFL8dNdMIL3hgoQscfu/mUTM+hg9R8v7
	G5QZ4bXXVccc8858rLayGlRBhA3r6dA0wkJQmHmIStKX8ooYO1ISX9h+rDYa2afT
	Qt3SZFMXTU9KJRmo4htp0GnEV5FMMgZEKYA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xgcb0ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 19:48:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9368f2b7b2bso22420685a.0
        for <imx@lists.linux.dev>; Thu, 20 Aug 2026 12:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787255335; x=1787860135; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x2Cmaab1c8skxG2XWMAOAO6+MfGSdVWYe9eRT+Q7FR0=;
        b=IaQDOT9YqDH4FomqZ7/6ts/6RCCYMVLVY6WF2wsg0DQiWiG5q2lz5y7vFLrcbZHZFC
         9ngOpPjLx7N8a/xCVssEFplZ28rRoALFZomndygHpdV+P/Pue9roRSxZgj5R+qc6Jv6Y
         roE+kd30jSx+u9gGae31XB9tzQquSuowYHUl/Gi96o7jvzrZ8EHKlZu53MSBGgrk7kcu
         YlnRipJZViMRtuJDU0FTFi9nFGf9NE1f4T+f8+oXS4b1gGjqr6DwSPRg+q2LJwv6Ay+z
         SAcx8D5LYpcrjDf1CUM4mG9yDvjLY4rqUKRquE8qQR4BlCiZjcuMgqINMGwvG+DR6md+
         W/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787255335; x=1787860135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x2Cmaab1c8skxG2XWMAOAO6+MfGSdVWYe9eRT+Q7FR0=;
        b=dV3jCRhFdl3TKCBuEvq2TzZIPGY5EqWtMW/Y2IpBuBA8DJ9IkGS2QVuOPZ1+EK48Jp
         isS3lsc5Qf0/enE0GxkYu0+We1G9vLpZEAvHhcrar+J04PL0kBXWT2VMjAAQbJ16hwUo
         SgWyqWizk0Sufbgubok7Z6Iuz3ys8WtcdG4coaik3LIx143SUfAMNOVfsyDVbDLa28l3
         j8Eh1mHmhfzeP5bmTidNqN2i7TrCDXts7HJ9r87SaAh3HjqYtyD60lEGZjDpBGnTaEp1
         vraLC2c/AdbV7Kv0Zrv/4QvLqGVtknV045w/A46gdwj47H7yjJUKsbUhJaa6kbGOjKRQ
         m5gA==
X-Forwarded-Encrypted: i=1; AHgh+RqtWqvFd+9onXaPZNrELegaI740gglf2W0toecuUxWf0QBgq74GkQD3IGZZVLa3LoPauSU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOJNpyankhFS6CtVdgVOK9Alv6O/voKd2WqgEXVHHKy1Wo72Ng
	V8KJafYxvDyh3iXZz3q4epDkqSCrKdEdCQsUQ1zB7FUF2HTjogdw9MAlC2WwuQL+bdfSktV31Su
	h89Z0fxq+21mdTIC3CdDmxjvNL5P89OvRTYC2OFiWAWzOMuPh/hPdFmc=
X-Gm-Gg: AR+sD12uNnvp7EKbLX7cq6k/HVTXc7VbcmuCkrhfEWT+RyA+70yD0DyENiGZtVc9qX4
	XR1r4PrEzGVaaevz7qIv+nAkl9pEc6Jua9rEiaeaX76bEmV8dYY42C5aK/O0i/IqzWqSKHvUvtk
	j8IVwjblmiEfuKGFdMGsBUJ+YJEdWqsE3eigXqAaoY9Bly45sXUiCn4RugeJRCKrxpMjFIKrSvk
	w29+Q+w88laQMRSVzEJZMm1clGTp6kX5msqwwxJHgivx71hRXTXprEPA0T7YCjOB2IyrIWXysR2
	yLnIIaBwi8q4XG1tOfC4WiBWL5QtxC43RPLsyvl+YDuUbhsGcFd29oXR5YPornF4SsZTyEQHwsq
	Of0s5TUafOd3+
X-Received: by 2002:a05:620a:319e:b0:936:ea3d:9313 with SMTP id af79cd13be357-93739497c75mr56867685a.20.1787255335006;
        Thu, 20 Aug 2026 12:48:55 -0700 (PDT)
X-Received: by 2002:a05:620a:319e:b0:936:ea3d:9313 with SMTP id af79cd13be357-93739497c75mr56863585a.20.1787255334517;
        Thu, 20 Aug 2026 12:48:54 -0700 (PDT)
Received: from shalem ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459198ec5sm113433266b.34.2026.08.20.12.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 12:48:53 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] firmware: arm_scmi: fix module auto-loading
Date: Thu, 20 Aug 2026 21:48:47 +0200
Message-ID: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GPM41ONK c=1 sm=1 tr=0 ts=6a875a28 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8
 a=7CQSdrXTAAAA:8 a=QYgjaYqrS4LJc6J_j6wA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: WVVC0XlhBotorCvZdLdlf1JZWx-rtboY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX2vJkcnLSzpAb
 eTPvgvZjXJ7y/3rSwsTJgkIkmH4yUTiLmvTpIFz9y1Y7+93c9HuAvknB0vLbMiEbJU4r6l/QTcd
 yBWrpVbWsBifahY1h4kQZwRmnu4G4qlCFVJ+XYA8rOvyYOgDndZ3Dvlg2Znp+GtSPsxEyuCz+NJ
 oULTiC+Qd55uuLM4tEN3sn5Xguf/LyyD++yO+uFKe7HeW8mormt+oVRyxynhZGpDXMNl3LB+QZ9
 dDGePT/1wLBZKKGJew1Q42UZQiLdd7/npdjcjTNq5FdCiWUSFuEK377AdnkPWj7Q+LiXZeCPzmU
 TcRJiJVfrING78m+ZDakc3clUyF7gzGCXBtB4jFYHPVu+kdkYWDD+trE+H92Meom/Dgzo11pDKV
 iZwF3tj8CiKFZyLS4ez8tIlXxobUTFHs05NoS41cDrp2rzU73qAVWtXZdDKt+s7yNf7VACwKSoi
 xfcvi/BOS3savsxX/2w==
X-Proofpoint-GUID: WVVC0XlhBotorCvZdLdlf1JZWx-rtboY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX+mYA0ha6FUO0
 xIfybAydyLllOvBT9FCaaouDZumapMNZ30g9+DnVo1NOTCSXMFUqzbdBYQpU41eRUfvjOgJUVwq
 FwILVjHdg8sCp05Me1gHYmF+XxQgrH8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200149

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
 include/linux/device-id/scmi.h    | 19 ++++++++
 include/linux/mod_devicetable.h   |  1 +
 include/linux/scmi_protocol.h     |  6 +--
 scripts/mod/devicetable-offsets.c |  4 ++
 scripts/mod/file2alias.c          | 11 +++++
 7 files changed, 94 insertions(+), 23 deletions(-)
 create mode 100644 include/linux/device-id/scmi.h

-- 
2.55.0

