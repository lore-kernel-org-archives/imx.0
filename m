Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC76472F71
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 13:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937984; cv=none; b=VgDDu8e7+aBQ8HhWeRd7Eec3BvYAiiuuo1cCtjd80I8HLBo5PWRyw5gvaWj5mB7UfaznQFoGMWbjSSxuzfcwrNmNH9X7foeEAeBMBcpxdbRVQGrFQ8ZocDYtdPYKv8654f2I+wb/0UjaN2cFa0NkMgmBgCojbKcSnG6o2sXzUs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937984; c=relaxed/simple;
	bh=IU2FxDbVpzPCuR4skclReRjkiNxGfVidNVcC+7xKNfg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mjuXBbb7CQjmngducgZeHAwAyKTq0Gq5Olklhx0puo5aiLukr1E/TWMqgPTBc3CUTTv/A8cR20blnM2zttO7c+bGXntIDqJU7LyfR3Yh/23hd9FpaGo+yXQmHlX2rRNlBTWzCWzPN3nZ+CTN5v6Q9GXmAxA3MPO2Q/ypxgzG6SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Phra8zm6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=byC2ANm/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Phra8zm6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="byC2ANm/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675Cg2xd3472485
	for <imx@lists.linux.dev>; Wed, 5 Aug 2026 13:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NP32AYQSHmO+6xgXTmdEjr
	L55vQh0b/6Xjmlx1f++L8=; b=Phra8zm6tPbCBk5x/bOy2O6PLAvMmpNWxLwGfc
	P5SzA0kxRpyE88EfHq6gI19N7SGuXpeEOzeGZCUFNYLFaFpB3iSLzzpYsReOrNdn
	Se+756U6I15PewihFHw7fGlzz4TpSrg2yL4w1ENmMAmEh5S+Y7SbkUz4OLkCGZjW
	sgDJOTvdYbGeWbk0nlyy6zG384HSDwA/lArY/AyH7Tmg6UuFYy/+ijYv0XTcpWEQ
	vEpQn+BUSNMNG643V+CwCKL1nBZWSqrWnKckcVOm8MfaFNxDpVssihylRXsBM6uF
	61bsW2XGN/5b0wgc/u+GJyR4f5VWAtHsbnUnv3VnmdjPGeFA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5dk0am2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 05 Aug 2026 13:53:01 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81aea53d559so19184617b3.0
        for <imx@lists.linux.dev>; Wed, 05 Aug 2026 06:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785937980; x=1786542780; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NP32AYQSHmO+6xgXTmdEjrL55vQh0b/6Xjmlx1f++L8=;
        b=byC2ANm/aFKbNBO+Ev4WfiV88pqjgkw4xmUDvGUOf25NIb/+VOG4ejzJQ84J1ASHdh
         IJSsvs6Yuf44qTw0Khil+eWtxsA8UGpbB2TXvcu7OqKO7TruSzBJt5LuF+QnxScWIbVP
         JURukA1lKAHRCrnt0hI/wrrX/N0rU+MLS0mm8ewd4URh+smjzwA+n0dzvdJoKtyh0pWD
         TbfFfMN8IGsMbe5F2DHET7MBl+Nm2Z+Fv+FkS5VFoStuv6+FnB2jwCl9QnBflMZkc0OJ
         gUCMPtu5vJZOxXnYwZrMlYFrv3Ii9vgnsBGhMDe+xc3xRa1Lqk/b5TqGgpk1k/agFXB1
         A5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937980; x=1786542780;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NP32AYQSHmO+6xgXTmdEjrL55vQh0b/6Xjmlx1f++L8=;
        b=Uj5tL7rReNo0udWfXDGBsJUuFlQp7liZWEJV6MKG+o56EkSJn/8Khf2bFDm15JjDkG
         7Ivyw7sSC3mVOZ0VlS3utC4E85amP4SJ2QdMO8BnssWzQ9rat6++/YLqkUlHVpLi8Y8s
         du9wHMvmvAGaOoDtlA/6alSAKF/h8UrCcyQi0aIGfJtAtHZPnecbr7Ty7EcNl1ZIey2q
         gADFpEtxlLd6CF/gNMKzjlW3PtxLO4dA+Noq1yRBtq4I09DegNHa0sLXMHqFS9glYDOw
         +2kRx1/sSUrJVcJqnnVB24acphJnk4QbtDwr0CZTMc8RiSx7TsCWdbzOruL6mbAPegXp
         NUuw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8Fc7G/henihXh8WNh5ASo6tGQNYWXR3HOxAnSJ4xm34rprxT8VbYtiXxGdZcigoIREaw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/8Nkz8alUWuvfnAqko1g4HWwTyhGiLJaFG+dEtDx/R5gjagWg
	P9WIfZ+StfRU4I5ZDxOJ5awDTFholwpc5M9y9d1OizUuHDQddWS0DJkdayvZS72L2q364B4bdL/
	r9DyuOJaRr45p58iSm+QF6WU477LUDJ4VXDJfBJQfJQmQoGmDhGSoiV4=
X-Gm-Gg: AR+sD11zewu2MlSb8Wc6FrG8P3JTpZ/BBSllCuAzL5u4/ZwjUTbJMxEoNgJPdUQdL42
	5/2T+Cv4w0su4vI2gECn4eonqFqG6Wf1qaPbnvCIIBQtA9IclSr6idKP0fAFRy7PRvpPXGcr7OH
	B/6+gvzWGCeyM8LBxpck1d5DcmvFNJpRV/ywhDl/x6tVeQbnbedZ57BJbeFWYwWBRQkhZE+xRNg
	q0rkPxTL2EkUyUvlz8bI7AEQdyCQB7Xhw++mAZ92ELTBszLXgLrDrp8lAHB4EyoLddxChnk6/6g
	eEYXO/OCNGQeXJohXq5WN4Dr6kSxk8jZ+UJdI+8kcMnTHjV04acCG8aSBVmm1+PysSTQfdMMs+c
	nQzt3s8f4XRYFb+3RCboRc+vWxP94v8M=
X-Received: by 2002:a05:690c:e0ca:b0:821:e0a:6cd9 with SMTP id 00721157ae682-8210e0a7c2bmr4624897b3.17.1785937980164;
        Wed, 05 Aug 2026 06:53:00 -0700 (PDT)
X-Received: by 2002:a05:690c:e0ca:b0:821:e0a:6cd9 with SMTP id 00721157ae682-8210e0a7c2bmr4624587b3.17.1785937979597;
        Wed, 05 Aug 2026 06:52:59 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8201320ec71sm20892517b3.12.2026.08.05.06.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:52:59 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH RESEND v6 0/5] Add CAMSS and IMX577 sensor support for
 Shikra EVK
Date: Wed, 05 Aug 2026 19:22:45 +0530
Message-Id: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC1Ac2oC/43Ou07DMBQG4FepPOMqx5djt1MHujLAiBh8JVZJQ
 +M0gKq+O25AaocEsVg6tv/v/CeSQ5dCJuvFiXRhSDm1+zLg3YK42uxfA02+zIRVDCvJkOY67Tp
 DnWlyppdE+KAuYkQ0TiJaUpLvXYjpc1SfyeP2aftwT15+7rtwOJYl/e+jNTlQ1zZN6tcLG4JC7
 mXkAsb/dcp9232N5QYYA3/2GIBWFIX0zGmnpFGbQ5+Wh6N5u6xYlmNkB3alsNLTFCuUM7DiaCM
 wWG3anCcofkOBnKZ4oTRoLjREoX01Q4l/UKJQ1lkJlQbFpZ2h5JVSwKcpWShvJbcBpHcizlB4Q
 7EZCgulnMC4stYKP9XqfD5/A2yXy0VsAgAA
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785937970; l=4965;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=IU2FxDbVpzPCuR4skclReRjkiNxGfVidNVcC+7xKNfg=;
 b=O7Q39imTU4H44WaXf6L/z63Ee0Hsn4QYm/xw3GR+mn8uCnTi43LT99N6YTCtGR2X5yHGt57E0
 VeF/kQTQvL8D8kG0EqQIIvLcc3f6TToqQBUHpp9YpIDv2X3tGpHZtMp
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: G5yOF9aaIVEjh6j4NFymQYGFT8M3Tp1E
X-Authority-Analysis: v=2.4 cv=Or9/DS/t c=1 sm=1 tr=0 ts=6a73403d cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SCY8RljC4g58VSpTV0sA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfXwxjX2LZ4oTQo
 Pq5HpfSC4/3otZ/a4/Uxm7Id4jAGDOF7uzwD7Sbs+YR4YVQJA77Mtlz7KL2f82P6u1G5WQaopLF
 PDsE9E3AVsVQl+XiQfnLTUkuhdD95RVQPeR//XLmj01EoX+Qi05elKCokF1uhJNDyyqLAUjHj6s
 KyAUVIlxA+rdGvMkvKg0t6O5mCJg9OtSTfO0XV76wFxLsz56Y2IwOHL5UCC/GabiZY9mbtFphmt
 9ySuy7OGS5rInwY/JuNh8Bt+UbWFJg+mlXMAlB+0AHKfwLWTKgdGpFfFZgNrSMfUBtCvze0Lihi
 +oVvwP1hITxboESEoow7usJN77M2ZKAWZYLYq9Jx/Jl0QkWzCxV7EFSOXqwOqtz7Nqu0yiETjeI
 nRY9lLY8I19noBIfjUBCkh/HIIILXmJRRfelQSFHf1vz4dkCm0mw3xnxI2HXxe4Uouy9AO4UDEz
 MIGNZN5t6jdKQQp4bIA==
X-Proofpoint-GUID: G5yOF9aaIVEjh6j4NFymQYGFT8M3Tp1E
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfX7ANDEyB6A3GV
 mpOBhejFH/OknlKR9C4sOsZRjeREGhx6/b0qeBtqY7Mo4/bEEnPFlgB1DN2r159jIrbvrjA4dSI
 lsnDOth5snlB6NDWL/AORNuHBIoS4Lg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050112

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
Changes since last v6:
- No changes in patches
- Drop dt-bindings: media: qcom: Add Shikra CAMSS compatible; already
  picked by Bryan into media tree (now in linux-next as 32179a552b8e)
- Rebase on top of linux-next (20260804)
- Link to v6: https://lore.kernel.org/r/20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com

Changes in v6:
- Rebase on top of linux-next (20260721)
- Sort CAMSS by unit-address numerically - sashiko
- Collected Reviewed-by tag (Loic)
- Link to v5: https://lore.kernel.org/r/20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com

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
Nihal Kumar Gupta (5):
      arm64: dts: qcom: shikra: Add CAMSS node
      arm64: dts: qcom: shikra: Add CCI definitions
      arm64: dts: qcom: shikra: Add pin configuration for mclks
      arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
      arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay

 arch/arm64/boot/dts/qcom/Makefile                  |   8 +
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso |  79 ++++++++
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |  79 ++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 198 +++++++++++++++++++++
 4 files changed, 364 insertions(+)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260526-shikra-camss-review-cf6f66ac566b

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

