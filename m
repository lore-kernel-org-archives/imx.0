Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DD63DE44B
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 09:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934930; cv=none; b=rkSthvqo0uv0sXOMbApWqfbrIGP4ecgZ3PU/mTA8kYn/hLixSYZjXNsdYWdFwwqjYeFJzWiRBT25xYR1JZJhyjhQuGOcZAs5FHHJY1iYDVCIAgXHCSXtpWBnfduOsraq12ft1CwxyqemVLHnLRsUjpMDKDSuQDc1c39CIAV6WtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934930; c=relaxed/simple;
	bh=PuN8ENYNOK4zFEX7iR5tP4Qc4qPqD1yrqd+US3xeGx0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bHIE1Wc+gYyX3Td1hUM5Z3aW/vO82lP11t9X+HRV0K/S/wgGDSlE8yCRURKdYvBTWuzzxEJDejoD9BjFgWEgWAVDt3ccga3N3ZddrFLVCCXHpFKHexTWUyvB+kw1VGUE8ZEnt7OqRR3dK5Q/Xt0IS1IVZii2PmLIjVXM4+4DGGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+ZsdQW+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LWajrote; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+ZsdQW+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LWajrote"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NhFP469297
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 09:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q0wnSw6IM70ZatIRQ0h/nF
	SD5yzhjm8eQKBwsFtZV7A=; b=d+ZsdQW+UAY71hYNVEJ643lTUkZjPviGbuF5op
	k0sEWRytegRpGwtK9ToTMm7Dz9hL3MCKu/ULcWKIAjCI6Nak9Fke9FpxK05xy7Op
	12SUOXu2GO2cYp4hlF90R2u2/z16pC8CPZzUjo95r8sG30urqX3iijmeWSZX8T7D
	KeN9lL2hSHgaFifpHC2o3b6TJuCiLFA0dvsP11Yb6Yj0qiRxC2i079ldTVBZUnoP
	alKO6zA21PiXRhWpO/HGC48Ym+fqE6bjiW1Mql6Gs4Q2IpgIFjf+jYDTgDtIF9jH
	3fg1gm7d3v5/q7IqAouL/d4iDlH8rix+HL7R15/Kd7S6lBhg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf485dqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 09:28:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8484f26852dso3712158b3a.1
        for <imx@lists.linux.dev>; Mon, 13 Jul 2026 02:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934926; x=1784539726; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q0wnSw6IM70ZatIRQ0h/nFSD5yzhjm8eQKBwsFtZV7A=;
        b=LWajroteIdCqSNPZCvxYn41Rfg/jpbc3cn1wmWRlIwX3sbwsZuATF7odnBGlPJUrzB
         IMJD5hC/rrbRDGvQD8fj2t28y5yZLkeZhUTOy0Pu8QFMihWTcZ92D1XT4a4gKaOQyZEa
         UZTSDzfmoV+4yOxCreQFs3TbwFMTPtfvqXhg2pbpCEvbWx9frMh2qXHgVj7mweoRGqeY
         /xpZuO4bhr/L0Szt7vVWZM9UpdMRjklbeFLco9s9P36CUi17puFOjmUa2UBFt8qZHgpw
         FQGbWQ31vVfHxUnfIhCT7cy5HKWWeqMv1Tea9PVGkBJ4+InHjuaihkWs0O/OHO1wfeRR
         8moQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934926; x=1784539726;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q0wnSw6IM70ZatIRQ0h/nFSD5yzhjm8eQKBwsFtZV7A=;
        b=cEhSnrqHANRImm/ncXCbIFy+jEZ9pLpRxrYRNktcNfLwdqPADIKOJYNw9YJue4R11O
         urRZFxX0Sk+qJW0DlLg2qp1qClLW7/uwpqf7mP+GOocAzDf8TnElYJ6Kgkujh+lFvXrW
         fe4SpYpePZecza62Y9kgx0WMbt5qxdjBaI6HXLF9Gnf+mStVa13aGmPTQA2uoKmxq1rm
         4zPNNkU1zVCGGWp0dTPSxvki0iC12equaZ1nHBvCv+UdLGLzW8/ESjaAClIYFI5GZupT
         EMJQUZG3Fb3Chj8SlAiBWP3trXUit9dMlMjHt0li4ZzXgUUomqlGVX7NIALER+Eol4mm
         afKA==
X-Forwarded-Encrypted: i=1; AHgh+RqKl///iWxlRLK0VXg9QeIZ1muvkfIFy6YaBv/7NaU07N1IXQVaMVr4tEL6rPOgmC8vdsE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyfa0at4x1jP6ksVmtIMmr1QKRi6ctpo0ReIKnf+7TKzljZl8q1
	a9N5p1vWfqRhlGHnDng/qf5WjmQFp1/iOIf93rj/EkfP5BIyj9PMj+UgtgAG7qasiSuYmBtNyS2
	HjOSlvqpAOeqOXfVDzRU4vEFs5ElvXqoudgyxL9r0aqTbgGoYzEAsmG0=
X-Gm-Gg: AfdE7clpDmSsMT3XXr+6b3qZq96kkGp+kIcMrntbETKnVWCV5TQV8ipv8lkVz9TocQS
	PTh9+siguUIw3PPqzmsBE6TklaaJbpUzAB+Zcaq3bfFQu3OpxizGE1dpRUkle+FZ5PAOnoMnhMj
	sneVZbY81KXztHgfCjTVqiGvXRb1atkMjbp/8wDR0Ut2kzRgYexnLT3/1/5k1IK8dtmYvp2PTJ9
	iWkyz+GlvtvX12CXTyNQtPVyMfYTkq0KuUQRQErohog/Fq3xK84Sphna8DOLcgZWtMMZtxuiIIv
	80Er8uDyiRSUVIRenazkUfg7X1KMYK67QOumeYn+wZgEMW5Pwb90y7zwR+cQijSI+53UHa9DFdt
	i+WP9Y5dm/puM2UC8Cvd0rk4tyj/iCtxdAX/j1dChMg==
X-Received: by 2002:a05:6a21:648e:b0:3bf:80c9:6b3e with SMTP id adf61e73a8af0-3c1109f717cmr8402596637.30.1783934925936;
        Mon, 13 Jul 2026 02:28:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:648e:b0:3bf:80c9:6b3e with SMTP id adf61e73a8af0-3c1109f717cmr8402553637.30.1783934925471;
        Mon, 13 Jul 2026 02:28:45 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm47495569eec.24.2026.07.13.02.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:28:45 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v5 0/6] Add CAMSS and IMX577 sensor support for Shikra EVK
Date: Mon, 13 Jul 2026 14:58:31 +0530
Message-Id: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMCvVGoC/43OTW7DIBAF4KtYrEvE8DMmWeUeVReAoUat4xoct
 1Xkuwc7i3ThRN2M9Ea8b7iQ7FP0mRyqC0l+ijn2pxLUS0Vca07vnsamZMIZR6Y40tzGj2SoM13
 OdGn4b+oCBkTjFKIlpfmVfIg/q/r6dsvJD+eCj7clsSZ76vqui+Ohst7XKBoVhASyvG9jHvv0u
 35qgrXw9P4ElFGUquFOu1qZ+jiMcTeczedyYlfGyk78TiHT2xQvlDOwF2gDcNgf+5w3KPGHArV
 NiUJp0EJqCFI37AEl/0HJQllnFTANtVB2g5rn+QrMUnlzzgEAAA==
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783934917; l=4511;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=PuN8ENYNOK4zFEX7iR5tP4Qc4qPqD1yrqd+US3xeGx0=;
 b=EKIr3fC4K4hhA9EAn48PYmRKnOCL56cBopti13qR6AQU4CmzUuuVy6UWePcII27pGzhDh20fI
 UycOoqoIeOICfIByBVGqXJqdTH1mDw6i/FM7OrwttkHWBF5eRfn2avS
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX6GeCahyuj6OH
 H6sKtHPgKyVuEwPrJwBTvvq2VeaOkQt5R0M9NnnFmudGYo9PA1F74spTSpA51I/aB99fc3wo7jl
 WdjOMM9C/2h+9shM2e2G+2d5Uj/f8r4=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a54afce cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SCY8RljC4g58VSpTV0sA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX7YkiK6EvrEB6
 wIyXQrEnrvicANvz5rgxRmYWGyGzL5HhfMiarL69MTFmENxwhQOYtk7WNcrGNfEuqJqHeWl7W7v
 Lef0Gdi7C4d52BS6xRvWnyPbFu5dLOBT9ZL86FGioL+pSNdPw8X4vwaUd+i0MhUw3s8r7j9madV
 Q8UzYFPPAZ3ZKZ1jDyMrs8gxl+C+tVgq3pdCV0t9udUekQ14w1cWYRiOoLtSCP9j41ARpedrVtP
 mtAfRTpDDCC/JLz8SI8YAmmJosguWRdlg4iIzBoG9F4gBT5ongylc8gl5JlCxaGHJO1ZAaqgvvO
 YW7Id6X6vROBN2PWO5i2a4NgLyObdJCdcTjCYwrsuHDErsnRHawVUgE7ixZVOBtXWNVird2vSFQ
 jvqXAdIQhYZWLYJw5jhfSY6bieP7rckxlR/fKj6MGGysCRPQykO2+0UC0FvEf2TeWz78etF/dET
 Aztvq2Xh31YaOQOcyIA==
X-Proofpoint-GUID: VHpzWYQlG4EVCFs4e_ZrhM3-nycy67oT
X-Proofpoint-ORIG-GUID: VHpzWYQlG4EVCFs4e_ZrhM3-nycy67oT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130098

Shikra EVK is based on the Qualcomm Shikra SoC.
It lacks a camera sensor in its default configuration.
This series adds CAMSS driver support, CCI definitions and enables
the 22-pin IMX577 sensor via CSIPHY1 through device tree overlays.

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
- make CHECK_DTBS=y W=1 qcom/qrb2210-rb1-vision-mezzanine.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-cqm-cqs-evk-imx577-camera.dtb
- make CHECK_DTBS=1 W=1 qcom/shikra-iqs-evk-imx577-camera.dtb
- make CHECK_DTBS=y W=1 dtbs

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes in v5:
- Rebase on top of linux-next (20260710)
- Drop dependency on shikra-dt series; now in linux-next
- Drop dependency on shikra-gcc-rpmcc-clks series; now in linux-next
- TLMM pin entries roughly sorted by the pin index (Konrad)
- Link to v4: https://lore.kernel.org/r/20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com

Changes in v4:
- Fix data-lanes numbering to start from 1 in all endpoints (Vladimir)
  Missed in last rev.
- Link to v3: https://lore.kernel.org/r/20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com

Changes in v3:
- Drop dt-bindings: i2c: qcom-cci: Document Shikra compatible; already
  picked by Andi Shyti into her i2c tree (now in linux-next as e3a8f8329397)
- Preserve blank line after compatible const in qcom,qcm2290-camss.yaml (Krzysztof)
- Add blank line between iommus and power-domains in CAMSS node (Vladimir)
- Move cam1_reset_default pinctrl state from board .dts files into the
  mezzanine .dtso overlay files (Vladimir)
- Collect Reviewed-by tags
- Link to v2: https://lore.kernel.org/r/20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com

Changes in v2:
- Drop qcm2390_resources struct and CAMSS_2390 enum; use qcom,qcm2290-camss
  as fallback compatible string since Shikra CAMSS is register-compatible
  with QCM2290 (Loic, Bryan)
- Use oneOf in iommus to describe all valid SID combinations: VFE-only
  (Shikra) and VFE+CDM+OPE read+OPE write (QCM2290/Agatti); add
  per-entry descriptions naming each SID (Krzysztof, Bryan)
- Rename shikra-cqm-evk-imx577-camera overlay to
  shikra-cqm-cqs-evk-imx577-camera, shared by both CQM and CQS EVK
  boards which use the same PM4125 PMIC and camera supply rails (Bryan)
- Add reset-gpios pinctrl state for IMX577 sensor (gpio33, cam1-reset-default-state)
- Add comment in overlay DTS explaining absent regulators are powered
  by the daughter board (Bryan)
- Collect Reviewed-by tags
- Add reset-gpios pinctrl state for IMX577 sensor.
- Link to v1: https://lore.kernel.org/r/20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com

---
Nihal Kumar Gupta (6):
      dt-bindings: media: qcom: Add Shikra CAMSS compatible
      arm64: dts: qcom: shikra: Add CAMSS node
      arm64: dts: qcom: shikra: Add CCI definitions
      arm64: dts: qcom: shikra: Add pin configuration for mclks
      arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
      arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay

 .../bindings/media/qcom,qcm2290-camss.yaml         |  15 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   8 +
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso |  79 ++++++++
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |  79 ++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 198 +++++++++++++++++++++
 5 files changed, 377 insertions(+), 2 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260526-shikra-camss-review-cf6f66ac566b

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

