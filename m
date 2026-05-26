Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69611405C26
	for <imx@lists.linux.dev>; Tue, 26 May 2026 17:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815579; cv=none; b=n74lD1Fie9+7Y1X7cy7wtg13nEHw+GF89i8ReGKHKrIqogUZ2AT7O7PmDPlr59ecbXf5MxuZvHDZ4DBlCQYtmexDhOwGhdBk4qgLjasLxnktIE8YNX/GE0yfecgjUFt7fUwXjllUX2J+MFa2c7hZIlAh52FRdD4+DSCwYcW6CPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815579; c=relaxed/simple;
	bh=z16XuHj1A7vELH7YEt8PGS9A3NivYQGTOASzze0I4ig=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AOYARIiTM8upZlq3NkG2J/f/ctVdPOaZ1DbrWp/4B7e46FBkxuA27OmCEAhkYc4qL0+V6w2m4f3fWvVzt+QYvAFu0ePblnik/WqITtkOGyFINjXKTGvB7eAI/ERO2HlF5vOdLSVchM/u04JxQcjQu4XVRS/hhXy0nlQHrS2sWw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TFZ5hjAF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UGYeZopc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TFZ5hjAF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UGYeZopc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH1dUZ3147085
	for <imx@lists.linux.dev>; Tue, 26 May 2026 17:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Pow14EwOIn0od75ybgcQR4
	L1r35iLvKxModRsY1OKyI=; b=TFZ5hjAFp43/hPTprCZQ0Gv8xR/rKTIXOujJnz
	DMVhYAHCyC6omlIDU5q2X7jxeX5ccmj91xfrs/JMGgHOczzgT4n3QEZIyyBCbFjF
	xZ29ME/hIXH5si0epr/l4zJ8V0e9P2/7+xKyA+ooJAqy9OuYDXjneshXs9S7wS1O
	Mm1B4HE1Y6BUW4mNkVbpQt20RyLp5xuvEie9kxaUbODIoV2Rv6xVzom7NYNUaUx4
	3s9xGTKGWpQOAHelvzQgUFrJsQH8oms9YQFSQ0qLbn6wa15vImnJSeeIxnqs5zjm
	JSHGASxB4caap1TkUIydwonG6KgmwUUvoaLv+RTDJNM5rwbw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3u412-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 26 May 2026 17:12:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-83544d05c5aso5426806b3a.2
        for <imx@lists.linux.dev>; Tue, 26 May 2026 10:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815576; x=1780420376; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pow14EwOIn0od75ybgcQR4L1r35iLvKxModRsY1OKyI=;
        b=UGYeZopccOgPir7Yi9iZSg0ldWrg6eArXJ07Evzuu0HGMYQC2wgbdYwJZBGpFu5TAp
         ZVNElt06KyGnJxfaWB9/GWCYzE+64XltlsCIdRJPUKi/zl32HfHJ8wJ2MBRWp/U5uLsk
         t/0qcLPfjGvkNRr83MPFjKcU+Bw442J2u2NQpbA7yG/swIf+irRlOaSTR74dUfXStmOP
         OiI5ybm0kERyt1Z0Odbr8cs0BA2hCzWmS0EhAc2kUSfqTPkq0+vJPrtu3C+484d4/RCn
         dcAk9CWxbD/WyusRxMtW9SMf8heF8iFZVJGJADCPwXjhTy39CCXybz3DE1d+NyQZknTI
         Hpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815576; x=1780420376;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pow14EwOIn0od75ybgcQR4L1r35iLvKxModRsY1OKyI=;
        b=Wa0hENiy68ox3DcILV6rd1sv6hUwdABu3ueuXDLn3fAqSVpJ7aEyjxXhW/G2/rYv5a
         K/8LtAauN+NSfChhp34Uyj3RO4wWGv1TQXLRpM+31t6H8bvdGshb9D/pY4l/i/3H+1x2
         WX1TbzH6RcIoJZm7izRn+C8K/rOnz8B1F1etbGhInpikdEu/97LhP7aK+2KuXHewvLug
         sSE+6gkOqgKy1nbZrFy6IfURXODqXm+nGOIoC5dxlOLWZmJ74duhm+U1c2kNDZNv11H8
         8SYPfVl3uOhzJRxuqzMcO+x1BXVezKDCnUmEGzr73F4RfLWE8KhWIfnbV7aHBVM+jDAd
         +wgw==
X-Forwarded-Encrypted: i=1; AFNElJ9HyjOs9xtx3K78pHFtx43eZtpReNz646g8tbE6NVEYmQGvZ6VVld5dU+pcbOQ0jpTjKCY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAwCP1z8c6b+147/6+FVuC10nZs0tt4EP2A/dKuRCqCzDe9vgC
	cn3NQaDfqtLve0JhQEThhFcVJ/ARt95Bno969UhvVKJzev43YCQ53VSEv9nB0R0+nZ/zlH2aAaf
	6f0prssgtnQEK00QKcpyfgYTSK3Np32jBFoRp9QQc7wXvyn+4V2OysP8=
X-Gm-Gg: Acq92OEow0iMeLlOb8ShPpPuqYg0WxL6b+3pGIxoektbiif9EjZc2ZBQ2eLtAONOt3s
	EjulXYx18XSjoiPPVF+woSfb+rkTzTMNuRbvFpFTyxvvXnpef7qIEuSsa4YfziXNE4f/CpyXUDs
	0XzcCGoyjSofhmPiCfbOkLRCgfJdqiWuxHmaiYi+Rxwgp8wYHBljJFDFpe9S802R4aeXlwvzXdT
	TYipd5itRM2i2ZLZx3yM66bIAIg6IOic+w3WY9GQTw3EUZLA+fw3Ahtg6ItXB3Isurrh9O6QVd+
	yAI+Z0BVeiZERlt/Zpiqyq7c7IEiZI5OH8RKkyUALIkXgLRqxwG2XDwTmzi2miXWJ5TxoM2f5jp
	uxrzIEFgD+4boF5L8c7G5X/ao28HXz/8jqoP4BjazHEilEthZQNNt
X-Received: by 2002:a05:6a00:124d:b0:835:cc47:6ff8 with SMTP id d2e1a72fcca58-8415f3a54bemr18300630b3a.45.1779815576078;
        Tue, 26 May 2026 10:12:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:124d:b0:835:cc47:6ff8 with SMTP id d2e1a72fcca58-8415f3a54bemr18300594b3a.45.1779815575564;
        Tue, 26 May 2026 10:12:55 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:12:54 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH 0/8] Add CAMSS and IMX577 sensor support for Shikra EVK
Date: Tue, 26 May 2026 22:42:44 +0530
Message-Id: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIzUFWoC/02OWwqDMBQFtyL3uwHzuj62UvyIyU0NRW0Tawvi3
 ptWCv2cA2eYDRLFQAnaYoNIa0hhnjLwUwF2MNOFWHCZQZQCSy2QpSFco2HWjCmxz4OezHr0iMZ
 qxB7y8xbJh9fXeu4OjnR/ZPlyjNCbRMzO4xiWtmiM6RXJkmztfZYIgdjImhuhdNVw56Un8lTBf
 1RbHEmc/5LcwlylXVMprVBhu0ro9v0NFga5fuIAAAA=
X-Change-ID: 20260526-shikra-camss-review-cf6f66ac566b
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX2/AchNCKFlu1
 qiF2o5IS2e7blWvafwAoTMwgkt4sZRqbDPBfHfyIh0vdaXJh4Havc/ssk82Rh/9/mVf6k6MWSUd
 EPb6l2ros/R420DFXavqBUa3KE31FoN2cMZH+Q8KHTIIsMks81xFVbsVCY1On+Pqzl0YzLtkV0G
 wWQFraKCC8N1Kbyy+MpbtlvoB+nHhkPwEZW3I3iJbcZIOku+jjx/sRu9eO4SvSX9WwxH8XEXL6R
 6kklZu0TQJm3NbNyZdz9rks8qqiGwREGX6LyoandaQmX+ytWWE+IIvEvVC9eENtLhdThpXKsVzD
 baXwELW91Ae1nolMJf59Ou1WLuKtk+jkc3sA0mGfPr4OnCo67yM9hF9gwHOuPDhbojgAAFbO2dD
 nAA8yYowme258qX5qKHPS6EdnHa/L7WWdG8oQ9DR4RHgAqGHYU/ZL7aMlONyjkOJaEDdnGx+Hcc
 9Apw4Od46c5e305+RoA==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a15d499 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0ARVRLQPdUDne_cnrioA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: vZtq5TwImNlKxuxGb1m0wNQrdNMX8EaS
X-Proofpoint-GUID: vZtq5TwImNlKxuxGb1m0wNQrdNMX8EaS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260149

Shikra EVK is based on the Qualcomm Shikra SoC.
It lacks a camera sensor in its default configuration.
This series adds CAMSS driver support, CCI definitions and enables
the 22-pin IMX577 sensor via CSIPHY0 through a device tree overlay.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,qcm2290-camss.yaml dt_binding_check W=1
- make CHECK_DTBS=1 W=1 qcom/shikra-cqm-evk-imx577-camera.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-iqs-evk-imx577-camera.dtb
- make CHECK_DTBS=y W=1 dtbs

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Nihal Kumar Gupta (7):
      dt-bindings: media: qcom: Add Shikra CAMSS compatible
      dt-bindings: i2c: qcom-cci: Document Shikra compatible
      arm64: dts: qcom: shikra: Add CAMSS node
      arm64: dts: qcom: shikra: Add CCI definitions
      arm64: dts: qcom: shikra: Add pin configuration for mclks
      arm64: dts: qcom: shikra-cqm-evk-imx577-camera: Add DT overlay
      arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay

Prashant Shrotriya (1):
      media: qcom: camss: add support for QCM2390 camss

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 .../bindings/media/qcom,qcm2290-camss.yaml         |   6 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   8 +
 .../dts/qcom/shikra-cqm-evk-imx577-camera.dtso     |  63 +++++++
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |  63 +++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 197 +++++++++++++++++++++
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   1 +
 drivers/media/platform/qcom/camss/camss.c          |  13 ++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 10 files changed, 355 insertions(+), 1 deletion(-)
---
base-commit: 9aab4e30ec8ffc5622669381a245791df3feefe7
change-id: 20260526-shikra-camss-review-cf6f66ac566b
prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v3
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
prerequisite-patch-id: 391f9dffceaac9f44df7c2daffafb66fa379ca35
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 7e351b93b3a238145ca642143bd0824bb90e98ce

Best regards,
-- 
Nihal Kumar Gupta <nihalkum@qti.qualcomm.com>

