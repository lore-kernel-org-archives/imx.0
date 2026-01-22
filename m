Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721263F23BA
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078469; cv=none; b=LDEvvdMfiGQmzgmo0iTRp6553IUNrdy4X+z6SHw5JnYoRz5h81davKdTJWw3lQpQVaD8/yvV3nsDvfIJepJOw9uk8uoYx+Mfz4Y8TeNUywdwuaCjaJe5L5z2KnwFzKZURrV/Nqq5HCgRoB20SV+ml5aPZdU/0VnDXwYewCytGv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078469; c=relaxed/simple;
	bh=J9VHQJQwue+LfT3z9SbqGo6EQB54j2aREQ5dCXhFV5I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iRCXATrHLzDYHM3y3VfTSN5Zr5t4Sq8l8tSDMvLI43fWM9v5R8A54efIh2cOtDFSmzAVAUlTtvLodidyJb6E3D4IgAaR54WmPjLu0fX4RCIy6XOLc0bbHJ3eRbuv/ZL/H5qSjruxDay0x655muE3I+X4if20VVYCf3lLMkDsDi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eIC1eHgP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Az8cFwrc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIC1eHgP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Az8cFwrc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M6rfJj724879
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LeFsxXU0vTUz3SkVxXpLyI
	coHY7U5CxMyBBnaUCUBTc=; b=eIC1eHgPYwDnnyccfnpKoNoemffF9htQcvn/qN
	+7GSaGkCk9YtwIX4TSv0Fng35FCeRg0QzecjMwQD+2PX6WuupzLTeECVy84E7f//
	nEq5JAo8VPDoW5IK49XO+BTM+HWV3jTAt4H7JUMmrrDaZ88b/oeL7JrgvgHCfbzj
	6JD1m52r0gSCjXpogCEwHqIJ3uwtGfBb9jgpas6TeUROnWR5BXV6dq4szMX56MAY
	BPd0rOACTBs4Fq2kaLJxD2VFYYZNwezhj2idwkAIe3v2SjsyvfA6aG/kMKcMcYbw
	7Ymh3A3nn5SS1BKugLtUhvrVpVLlC8FCphfErXe1xEiei8ug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buf1bgpqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:41:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c1cffa1f2dso526275485a.1
        for <imx@lists.linux.dev>; Thu, 22 Jan 2026 02:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078462; x=1769683262; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LeFsxXU0vTUz3SkVxXpLyIcoHY7U5CxMyBBnaUCUBTc=;
        b=Az8cFwrck8mDmw6sqdgAj+DZipwkgDt/GkWfPLsk60zuT08TT7l5QzBMRgJ4sMFL72
         icuxJXeDYwjd594ofvRgYitS3JsAxc2mQTdegZOIpTzPt7EYPdsnJAokwnJGD1sp4AID
         W7cTM3i0U1i4yHLaWrpoR7tJW5rzMqObrFTMmxo9GyYzYl+P2aIbOj3PpVu4Q4NyvKF3
         PkVKR/niX1a8Ly2IMmODYwV9nQCMUXqKltfUqSLBeeGF6HlrFzjmg7HV6E/dfbQ+hRKH
         UmfxRW45pwjwdxUJO57+dQ3NZrMZl43JXg59ZIXa15lwS/YxXpVkLdneoCIGrI4iu6hz
         RVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078462; x=1769683262;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeFsxXU0vTUz3SkVxXpLyIcoHY7U5CxMyBBnaUCUBTc=;
        b=J0taOYb1YfsvP2RtbXzjl1GAm3ygZfggyk/8nJmYTAQnp0yy5KDShtTXsaXhrL3f7L
         Xz7PRsB//A0z/zVFdXH55aObCmW+w77UIAibe+oOdGkreyeDRtySu3c+kDRy8+UuoTrt
         MbE2epUkmjiu0ZsoVHpK3fvoX2vq9bT4jDVOAJXefQvbvkXJDp1ZLYi/kRs1HYyZiGly
         ZsOpl4CIL/ATciddluMNUDvyUtrOM752/lf+5QTVc1OSrgZGRqJo8KgRXqpy0TWMvS/p
         xoOXq3HXGlzZR89tr1ju2P9nN+A72Caq7UeZXEEHWXtjcTrMExd+/ntvz3K3ZZ2+QpiN
         gi1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4WigR5mmHV12PMUoGmaENMBKbm00IEx/SzWRislgnTSvVRWmt7uFUA01oKyi5uKfyH8Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5nhnBy+s0z8ktZnnJjoc+85/DDiM32Og60zxRkgqJ4pafSTZQ
	a6CzoeEH2m8G43KAqeJxU0Zr+2w5kSJN124WKFNqMeIJZRlg6sL39t/SlbF+QBqX/nbJ1yT1y/i
	BmTiWl/moaY0P4mkQYzmuv15j55dRi28vSSlgQB8aJyVCZSzGv9P7MvI4N+R2/MKdXg==
X-Gm-Gg: AZuq6aLQ3Fa7LhQVWC/uQZBH4cD04+uEV5bC0QFN9HDd2fF3Rb5FOt+SoOeytVuOyXl
	U/vXy1VTGU76//tkkGwL7AjzJuBUqD+zwZmAmZe/YxxwraWb/wsfDbhlqhQu7TfKnipjEqj1IGT
	yYZLyHbd5HUWb0ZBjkd0Lc4iBQTaGD1m3KS7TbuJvkcMzB4XkfpbN9BQ0R5BoKQ8J+i3BS/ExYc
	LPx5Iq5RG8WIweQkEDsZSJqiIxZTRaW1nUJ608ZxJEuM24W/8FF90HXrVmkHQN2wQ52pbPe4JHm
	DtcKZ0LaoRt3o7aUMKNnsjxaYS83iv838Wcem9fOF2++Gje/3lW+24uADY9y4zzhRluoRcHIwvq
	LMLFW/etGfySbPeeG3PODNYvH983XB8aYvJzIhnJcrmIElCl9C5ub6GPeaXd2l8T/VFjnUFNtUL
	gg
X-Received: by 2002:a05:620a:2954:b0:883:647b:6dec with SMTP id af79cd13be357-8c6da87eed6mr313576285a.3.1769078462462;
        Thu, 22 Jan 2026 02:41:02 -0800 (PST)
X-Received: by 2002:a05:620a:2954:b0:883:647b:6dec with SMTP id af79cd13be357-8c6da87eed6mr313572685a.3.1769078462005;
        Thu, 22 Jan 2026 02:41:02 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a7260229sm1387868685a.42.2026.01.22.02.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:41:01 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v4 0/5] Add CCI and imx577 sensor support for Talos evk
Date: Thu, 22 Jan 2026 18:40:45 +0800
Message-Id: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK7+cWkC/23PzWrDMAwH8FcJPs/B8teSnPoeYxQ7UVuzuGmtx
 HSUvvucdIcOdhH8hf2TdGeEKSCxrrqzhDlQmM4l6LeK9Sd3PiIPQ8lMCmlASskpWjBij/mLN+h
 xaLE9KN+z8uGS8BBuG/bxWfIp0Dyl783Ocu2ujBUg7CuTJRfcewDZ+0YN73o3EdXXxY39FGNdC
 lu1rF4EMH8EVYQGjLTDAMZo9Y/weC6Y8LqUI+fnliwikduO7H5hDUIIrWpQIMBqDry8pWnMuFx
 oTuji7hhdGDe1mN4R8nVMmLsq2xpannpb5j1+APYBlOBcAQAA
X-Change-ID: 20251222-sm6150_evk-8ebed9e9f3bc
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078453; l=2958;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=J9VHQJQwue+LfT3z9SbqGo6EQB54j2aREQ5dCXhFV5I=;
 b=eOeg/peQAM3pR8Iz3aQql6aI9gbuvkoWl2HlGTz9wHB+2MJbTxOUur1dxebKnEFVznbSaQgYf
 DsSvKxOc7FiAS+aYFIkakwwgthxepnDDxquYQqApf3fe+ATJq1KQ1vp
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: zAiEp_vNp5noyEnViCx7DXiOmZ4TzVSM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NiBTYWx0ZWRfX3WlkE7gArtRG
 zJx+uatGaboJ6hJ3zqBjrKCMZb1hRiKu0ObOMZrJgV3/ND9iFatb6gY0OjrktkX69ydmgJ3UWRB
 HAgPQW0WEedfAtyyIa2XkPPyWoIvp3PLr3WpxM7g8FK9PGsji53T8OniDJLdxq/MdxFYt4M6SjH
 RpUMVEYoLHLGPUwgCw3nGjnkz3vQA2OuBiVoKjU1E9ZmROIwgJo+amrABX7kpYoQldN2+tsDUiZ
 0pqtjJHgYbmbGsSlOknxTlGHgByqQujWbeLkuOfT431ZuLxDjJCCQMJGbPSmctfo1HNqcRrZXZv
 OAZE3XiCaWUKazT8L+7+7L8ujDACVO+rk8+Rx1YuHXlOqSi6mla6hwtzNY0jNwDcfZlqOTRtb9w
 SyAO5GUqAfuPCNXt/wfvRecycpmpvRFkdNdPHXdP0sa4bZ4l0Pycx1048SlO3G7JLuiThIcV472
 nMnxDHsZ6AXYQaGB4XQ==
X-Authority-Analysis: v=2.4 cv=G+0R0tk5 c=1 sm=1 tr=0 ts=6971febf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=EncVXgJB8TypbGqEiwsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: zAiEp_vNp5noyEnViCx7DXiOmZ4TzVSM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220076

Talos EVK is  based on the Qualcomm SM6150 SoC.
It lacks a camera sensor in its default configuration.
This series adds CCI support and enables the IMX577 sensor via CSIPHY1
through device tree overlay.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl -d /dev/media0 --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

This patch series depends on patch series:
https://lore.kernel.org/lkml/20260114100043.1310164-1-tessolveupstream@gmail.com/

Changes in v4:
- Add CCI properties to the existing portfolio. -- Loic, Krzysztof
- Modify the incorrect dtb install configuration. -- Vladimir
- Link to v3: https://lore.kernel.org/r/20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com

Changes in v3:
- Add generic names for the CCI clock. -- Loic, Krzysztof
- Split cci node, removed double space. -- Dmitry
- Rename camera dtso name, add detailed description. -- Dmitry,
  Vladimir, Bryan
- Add dtbo-y for dtso. -- Rob
- Interrupts cell change adaptation.
- Delete cci sleep pinctrl state.
- Link to v2: https://lore.kernel.org/r/20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com

Changes in v2:
- Modify the CCI dts style and commit msg. - Konrad
- Split mclk change as a separate patch. - Vladimir
- Remove clock-lanes. - Vladimir
- Add mclk3(GPIO31). - Vladimir
- Link to v1:
  https://lore.kernel.org/all/20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com/

---
Wenmeng Liu (5):
      arm64: dts: qcom: talos: Add camss node
      dt-bindings: i2c: qcom-cci: Document sm6150 compatible
      arm64: dts: qcom: talos: Add CCI definitions
      arm64: dts: qcom: talos: Add camera MCLK pinctrl
      arm64: dts: qcom: talos-evk-camera: Add DT overlay

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +
 .../boot/dts/qcom/talos-evk-camera-imx577.dtso     |  63 +++++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 279 +++++++++++++++++++++
 4 files changed, 347 insertions(+)
---
base-commit: c8a4a774a9b0d2c86593492625874e27e9cbc9a9
change-id: 20251222-sm6150_evk-8ebed9e9f3bc
prerequisite-message-id:20260114100043.1310164-1-tessolveupstream@gmail.com
prerequisite-patch-id: 065fda916d7faca61113e1230fcc0ce3916442fe
prerequisite-patch-id: eddd1b1714715707d386608e4f9b24396f51cd44
prerequisite-patch-id: ae777d7e17e32afc36fd1f741bb57ff0d3556841

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

