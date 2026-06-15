Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694083BB685
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507562; cv=none; b=cU550n4plCFdV2uFdr/dXftmEhUTxPeW1uw0+3GvAXalFXqX0LLwyHjQyDBCtF4iOeWyMB65jChxHns9F9y5bHLpy7LD1bIFvvsk6UsC08+9sVJwDvjsAa5fijyQfhfjrRwHwspQlm5de6OGA/4jXe1XvM61bK6iglhcdD8m5TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507562; c=relaxed/simple;
	bh=IrUmHrBRqkDfW33Cxo+N1eCKaHZXw08FALCQEegKAw0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=evXyrZyFMWhz8syvdvPTULVYCvaODglUMXsvND9BUl8+MZu50Xoa0y9KShKluBLihLfsPu5GBJ/XJCEpxCdAgyvCre9WG/p5glIjPOk8dlgwJkDIiMwxGsAeVHc9ESuHSnUKCltuFwGQ2TmvGac3bO/7Tw9A1g9pqSEqd0VlwQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HilPuDdj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZiDXziH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HilPuDdj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZiDXziH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6Kuup3911602
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dtGXzzXGIJJhIcmQFrksFN
	DykhrwB6PnwdRQr25l7qQ=; b=HilPuDdjj1OrO7g0mjHnpbyEO5NhUCALWWYlay
	z2EfX4OUpyHYV5uniyt0sftardFLDEzGdVRVdYO8/Mvmanlieech+tHwPXgux86c
	oXmols6D1QEkrsjt3mILjv4mAOHaypCdZ8hui5RI0dEA1DbCNOb0YCkX59J0Itrl
	CWymD6TLVDKy8iHeiU7n4baJ279u2g/3JiC1AHkwLLYInyOWYFg5tOvsdPfZ3q2m
	l1GjNz/mDH4/qq7lrmnFcsg95C0OzrsKu/ZznV2WqXbLJrMRFontLYqeWfgq/6a6
	bA40L/WSTQyCy/T2MsqyY2Ttp+IH8OKwAQIpG85JUf5E85iQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6x5te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 07:12:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d6389bbf4so3301934a91.3
        for <imx@lists.linux.dev>; Mon, 15 Jun 2026 00:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781507559; x=1782112359; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dtGXzzXGIJJhIcmQFrksFNDykhrwB6PnwdRQr25l7qQ=;
        b=XZiDXziHD+NLpfgOqPF9vqLZYORi8Uarz91+ZC0m+xoRKM2P4yROQ+GblIUD6dBoBd
         VfSJG8C1OSE/FmNl75KQkk0KIZCxeR2SQs9GekNcgnIEaBzBbEZbSg3tf3AW7al7SpFh
         HgQk8D+dAkfletFNSboB1qAKNmigQH+jH7LELEcNwMGOcYEqHmOll23sHjREO8brjBD6
         Y/AtbUgJrtaxrhCne4ybmFdSP/h9mbfVNxbHwDQ7VWc0gbWysCcoiNGZGBRXhnbbuoIF
         J8XEMFiSqcDWKPQ147vwljMunYaSZBJsm6AqOjn5aFuWVIiKBiwQVOV2s6y8HozHg9FU
         nKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507559; x=1782112359;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtGXzzXGIJJhIcmQFrksFNDykhrwB6PnwdRQr25l7qQ=;
        b=pP4RNFvbKOxfQ5fUeDq1nDFYtNMf6A87rOgAy/jxs+QEikcdQUouSNxQSQLJHB2mPI
         BGzh+f+hU33M2caQ3QwHb9zd5tA0VIl/cWQ742xoErbW+786MrUBq5Lbggh2mPlV/biN
         Q+L0bz8Oy2OawGkl+P6rDG/+9ii+IpQXpGgAmVuVqIDY0ZFmWQYitHWPnAPgBwWkblBq
         DmwEcaLRGvdoHug18BbxiMfwtyF0aFY96V6SAoM706rKFBW4FpuczaLsbOU4R34tc2It
         MnT5e89Ja+tRZ+WAqkW0OS6LR2+nvEVjY3Nam6h2PazYhNN+cCZNGLUzN0Q4DZsJ8VYJ
         jl7A==
X-Forwarded-Encrypted: i=1; AFNElJ9j6jJRFxvnKcNwBppMxpPOpipjbXsupLj2OKKEsoA/vaB6B34gNDwGm17BVOjACXmfsVg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwlA64vO+1BaU4chK4m1MROQG1vj1BO5g1PZI5MDeZrE2/GBImb
	zMOfQhj4aP2BHe/YroCEIdOTaqw2RB0p0Ik3n6pOgs2ZRZIVaAiomWqhAGVsgZBE/oA593daiej
	oA1L4BhsjWb5in7BXLVhLxfn+buuowlo1uZ4OP61X7itXtZFxN+GLhNU=
X-Gm-Gg: Acq92OGq2epdlC2Epfg1s65R5FXJYSJjK4bcG4AV1h8k/Ee1QkD6k0Pps6SmeqE8i6e
	iocNbXP7U/pcb47M4b61O2YtRbkqTlJyHVCgNMhWXBjIfQzGl9NVg/mKWd1DkhtSEHzb69dYXtX
	uOZN8Pva8/cXMh5ZzuQdoHtW3Nee4uZXIzpL1Dhwbfs52BcDocSkxD02Kd48qUbmiX47R1imulM
	VfkEFn2yUd1viuzH4jQwrLTxsY3XaaL+gxcUU9uVkJujE4KUqBimDo5/IL4B6GkwJ0mUMT/sxVy
	rjsTfkF86JWXNaFzVBhPiPTv2P9Ua+FjMJTLnAm6eGLj8YYN0Z2jFkxu8EH9j1LyN8LSUlWvlvw
	AdZRJ2ykPtDr/wrNL26V5WP+3DBC1RU5bFlnMBxnYWE8IpdoKu7s8
X-Received: by 2002:a17:90b:4c4e:b0:36d:7b62:4767 with SMTP id 98e67ed59e1d1-37c2bc4375emr9441061a91.5.1781507559266;
        Mon, 15 Jun 2026 00:12:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4e:b0:36d:7b62:4767 with SMTP id 98e67ed59e1d1-37c2bc4375emr9441017a91.5.1781507558739;
        Mon, 15 Jun 2026 00:12:38 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm14867474a91.16.2026.06.15.00.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:12:38 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v3 0/6] Add CAMSS and IMX577 sensor support for Shikra EVK
Date: Mon, 15 Jun 2026 12:42:11 +0530
Message-Id: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMylL2oC/32QwW7DIBBEf8XiXCKDYR37lP+IeoAFYpQ4jsGhr
 SL/e7GtqFUV9bLSrDRvdvZBog3eRtIWDxJs8tEP1yyqt4Jgp64nS73JmvCSQyk50Nj5c1AUVR8
 jXRz2g6IDB6BQAmiSnbdgnf9cqcf3TQc73jN82pZEq2gpDn3vp7ZQ2oJk+6pGXZHfwW2xxTL2j
 DUTNbU0TS2kAAFtEq8MgjdPwwmRhlufJ17OkfKyEdY45ypdtkmS5brOx2kIX+sLElvP+7dtYrS
 kIKThuMdaqvowTn433tVlKbTLY8Um/oOCcv8axTMKFWsq0I5x1hyGGP+g5nn+Bq8WycmmAQAA
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781507551; l=5077;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=IrUmHrBRqkDfW33Cxo+N1eCKaHZXw08FALCQEegKAw0=;
 b=O2ujAcCjZj9ALcD348LR57pwCkphyltvWZ7PmPcj9JVeMHfVleiQlVTybdHNUzV1YbtmkVsUL
 ChzDQDRdqhuAEV5NYwSccyP97VC6uUYFT0mklWthkVRE+isLKDZYBFt
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX2jrpSpU+ab9y
 9lJcLUQLetamtHzd7bJkHX3lrz0ihb5yB3aZUYItP9kenhNxS7IusujzQ0M0BIkohngRNoG300H
 k+8kO90mToN7prx8c4JxZ2sibagTdXs=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2fa5e8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SCY8RljC4g58VSpTV0sA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: n_6DH8OL47Gn7I8lGeCNEBIktCBD6UL_
X-Proofpoint-ORIG-GUID: n_6DH8OL47Gn7I8lGeCNEBIktCBD6UL_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX3LzljGMyefx2
 3G/5Sg3AllS5poeDYfqYvGzG33tMmZYmz49P11r1OV9lD6CX6UQGW3BjbxfVHj8GBaNFEoPmFBm
 K+DvaDkiyl5RDqVAIZ74jRHCbJmJFOnyNqQHyfvkCE2HywssgALQ6KRyc9Okhaq8T+N3MDLY6KX
 Ht+HZysoqn7LyosVbprIqGMzXCg+Cl5USFX+Z3f7pWI35cDvMA3udEJzvkOj32zXJfmM3wBoX5O
 a5JyrFQUSRCUDr3JKMK/yqwdzol8Jv+lwuk+laF2/RMZSUJ+BjEC7PkmEBua/luZiCVKglL7/e3
 k9g3zDcZuu+FNfgwSz8SNOcTHsNNcDSejF/Auobm3b24eww256laALwOqGJLq9Zt+wpqQpV6Zt/
 qxAh3jmTwGc6pN0KQjjH70FwXJkTyUFTuo9aP52sL4o9ugGW9nt/EzHNqre8v+JWq17oPrUn68f
 7PhNWtDN3eliIL4sVrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150073

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

The Shikra CAMSS binding patch does not depend on the rest of the series
and can go through the media tree on its own.

This patch series depends on patch series:
https://lore.kernel.org/all/20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com/
https://lore.kernel.org/all/20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com/

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes in v3:
- Drop dt-bindings: i2c: qcom-cci: Document Shikra compatible; already
  picked by Andi Shyti into her i2c tree (now in linux-next as e3a8f8329397)
- Preserve blank line after compatible const in qcom,qcm2290-camss.yaml (Krzysztof)
- Add blank line between iommus and power-domains in CAMSS node (Vladimir)
- Fix data-lanes numbering to start from 1 in all endpoints (Vladimir)
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
base-commit: abe651837cb394f76d738a7a747322fca3bf17ba
change-id: 20260526-shikra-camss-review-cf6f66ac566b
prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v4
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v5
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

