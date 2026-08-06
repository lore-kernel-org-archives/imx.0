Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB343470E9B
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 11:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786016625; cv=none; b=YOq2sKqOsTNos5AiWwGnRJa2Zaumj1iETrTH5aqnxklSSC8jPdgRMcjuLYVvp7rjYeuxKn1UrOodKZ5bnSFef+uZBsttGeXj20vgPwXNxyc9dbGfigwa6PX8IBCLy50+qaYM4wuCBk6DTgc4HMY0sYc4eRAOB2ruj6Hte7wDa7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786016625; c=relaxed/simple;
	bh=Vh3lESIeL6qTm46nCHD7WoUqzT6Ku3AruMEQsvI8yTw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jphuP1c/H9eZnuNhU54iTNrNLMWNtNK9E92tXy5IVGX+xN1KyXc8alUQ5DTn6ryPXLPGT3fe4CtnaAQo8Gx3pt3JBs3OmaFyau80ZURQjmkGt+QfO1B7Q5iNxlBGGVMWJ7ohyI78snglTPOTICzb8OyPfq5fHE2zFY6HdMvDOPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SO/+OpCc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V4BPo7lw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SO/+OpCc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V4BPo7lw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nkYC1871415
	for <imx@lists.linux.dev>; Thu, 6 Aug 2026 11:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PLJ+zO8fHCwqHnlO5zRh4H
	AUmHBZQtEJHNPOmGYhT5U=; b=SO/+OpCcSdK54xgZgq0Wk3CutUMIkz3EFP9GWm
	WBscpylzt7kRthiPAN8ECFEV4QaVGXADgpJ25hHzwfHnw7x3vP+wI5Ty5J/ke7i4
	gIA1wQLCNisNh53As6UVFss1Igli1d3aUsUs+cuwFLp4GqxcD1RnsDrjvXebCHLs
	2QMD/sBHwj951W9i/mgGsSU7M4J2mIiCK20DyMKegsq3sa+ZYUIWYqaoR8NwxMgK
	oWLmqQ7zyflM46q28OWI2Q8vQrwFlEXK4Dtg6tfv918rp2bXd97RmWQ/vQ0ylxaP
	vzEtlRhUu9FXgyzkc72bTz0bWdAF7+37ArzG+SKaTkIFLrDQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjud1w3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 06 Aug 2026 11:43:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c856470fe9fso1655475a12.2
        for <imx@lists.linux.dev>; Thu, 06 Aug 2026 04:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786016622; x=1786621422; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PLJ+zO8fHCwqHnlO5zRh4HAUmHBZQtEJHNPOmGYhT5U=;
        b=V4BPo7lwkd5E9+Xmrwap12zejD2ZGhzwJhvpSBZRQP4S94jEAm9sVJhph0b6AJW9MO
         Ws+F7Cm9K3lnzDXtEARLFOrmwsPEp4VO9nujLa/H3riVewAJ6IxGLXJsLbbzLIJMpmXl
         N5wRT9m9PuhFynQMNtMQZ+7IFPy4fjjA3NiPBX6Skx4hWZOrfowffqtLQOyz6B5JeKo5
         Mp7dlEh3LMu8GeGA39BoJLoK+Vj0yBbfKGMZ2rMQVLLBzTkqGoq56r6lHh14fGhVQTPo
         1s0+F3AR436RcQ5UqPM8mpU/FwQikmQ1vTz45vd0FtM4rRds+cfIYBboBYpGOJ7x8bZ0
         luBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786016622; x=1786621422;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PLJ+zO8fHCwqHnlO5zRh4HAUmHBZQtEJHNPOmGYhT5U=;
        b=ei5TsFZUoXLbwaus/R/zHAW0k4KejW7K7mbD9fR+455OtZOjGiRGyyx9HCXvz+zw7w
         3v68r+zEI0/FSNLy4aWaKK18mSBFMiyjEYuzf16KJI+vWCMEHdjn5YDOiQiGRuV+8N6w
         SYcuvB/gPH0GyV3WmdIEdHjjBQivRaox9A5JmkdYcEAAKhJMierRfzDIvr7liTsnNDsS
         oVDKpS0O/zqRL8EHPbZJ810YlDVxcPk5Fl2qbroQFfuk2MR+Lt5zgsWZbkpdEbeOD3Mz
         7lYBNrkfTKUmYOAB+tBJym6vpltrcDROrCPLoyHKxyrj5VABC2xzlTFJ9JPSyIAjsUre
         AG5Q==
X-Forwarded-Encrypted: i=1; AHgh+RpcvpKui2fKqYVs/asLSphMF13Bjotg+xJDrXiVZcORQPNn8q2glci73PDxmTjZxyW5T4Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmHOoQ0xKYN4ovXwhy+Kc5VmOALnJGlrEDmrTY3F13RWYQ5QXJ
	yP1UM0iwbyD37aPjGFEkqt799GPLsLaUaXpWF4D51uICoc6eKBiHWs/Ca0eKqR3EOajfsBmHp9Y
	pxjzdgdVj12W9ys7erkOrucRxwr4Xb/CXt9BV4lz4t/GrDbEy3wg7Qz0=
X-Gm-Gg: AR+sD13gHQDrtzNELzKKi2hLNaB30GMYhFPxVEH2uKrQclCyroevra/LR4qEYImxoS7
	IsUmQPV9ejSf1eKQMISHfBJPuaYuT/17pX0uSBwn3OmGCRntAHJ7py7cIRs0w72g44A4A7vNU5U
	jya5ckibwXx+JzJE+TuoHbF6eG7C1jpu7nHTpppaGnC/C+zTWFdBZfYXAbbQA8UTdc+CeA4yAeh
	GtIVQPpHQXDYv+jUMFwGAvwZ9C9/qgSKp8HUQ0dfZa8CgR4J3F5F+uRCSyi3yWV37VbkWC0oPiz
	Cm+g7hjPPBMKOWDJNClKnIOv+aXkQJKNRrPTQo+rr8q8cuSUDP6dq6YugkTi+bjbBvTd0lglfLr
	Th6f8YHO0t2jmYYq+NxMV8spjilM76Ks=
X-Received: by 2002:a05:6a00:12d6:b0:84c:1cd2:142b with SMTP id d2e1a72fcca58-84f2e031769mr14671849b3a.9.1786016621596;
        Thu, 06 Aug 2026 04:43:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:12d6:b0:84c:1cd2:142b with SMTP id d2e1a72fcca58-84f2e031769mr14671783b3a.9.1786016621100;
        Thu, 06 Aug 2026 04:43:41 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b75dcsm1234756b3a.34.2026.08.06.04.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:43:40 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v7 0/5] Add CAMSS and IMX577 sensor support for Shikra EVK
Date: Thu, 06 Aug 2026 17:13:25 +0530
Message-Id: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF1zdGoC/43STW7DIBAF4KtEXpeI4WfAWeUeVRcwQIPaxI1x3
 FZR7l7iVEoWdtUN0kOab95izk2JfY6l2azOTR/HXHJ3qME8rRraucNrZDnU3AgukGuBrOzyW+8
 YuX0p7DoRPxklTIiONKJv6uRHH1P+mtTnl1vu4/FU8eH22XhXIqNuv8/DZgWGQwpOJG2jVJq45
 klJ3rYGfCBuKCAo9K65Wrtchq7/ngqPMGF/dhuBcYZKB0GWjHZmexzy+nhy79f16/pM7CjuFHI
 7T4lKkYNWok8goN12pcxQ8oECPU/JSlmwUllIyga+QKl/UKpSnrwGbsFI7RcofacMyHlKVyp4L
 X0EHUilBQofKLFAYaUMKUyt916FmVZPv1dluV4mnA2eEBMP1sy0uVwuPwkyZOPDAgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786016613; l=5187;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=Vh3lESIeL6qTm46nCHD7WoUqzT6Ku3AruMEQsvI8yTw=;
 b=o/36NYy1clh5A+c1LDaAFLnChOxBkD35/yG9f3IIy9r1utY+KY54c25j80XLIJn6NfqSceMos
 8+eVRPP2VIMAe5LJ7Uy5oMRAEkXBlw0EKcNuq90OQ5/MWUiIClsf8pY
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfX13pogy3HzBdT
 DQ88o3GmXJRcibYxSVsk/cGp+jLzxPG7nn8p95+lWH1dWFbiGFUcfLRB3B4hw3F4bbXDNS2ZpY+
 JXt8FWhR4YGRUAqe/dMEbzFdRaNdwsv0tXOsaxZs4qSUzM/+plVVBIatdmhzwTQlck4wYFDMNXY
 uz6Uhn4ZNYwb6UJqwdseQL/jEiuAoysRyqWvuC04TeQYNQiknzbnUepx2IdP9SUfKsUvoAqiLv4
 3rql9INodmwIbCZ9YrQvo9I8cmSN6P8Gl1lbxjk/dofL3Uxbjl0iE2FIgc3hd8n6sdJPrPcm+J0
 CYFnAnviOm5nXYlAW4AsgynRkIuzEsgvSrRs+c6jYqU+IXPYIkVEzFXr+vBjp2qUDOLrjpGYoNz
 r/rHoGwCXLRhq0K8WHp04Tbpm+ESZL+XJdccZzaZ9i0V/UhDVqM2/obNkI8sR83whtZ9NPw6Snw
 OdzJMmtRvXVC6ScWV7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfX7Pxis8TWnt/8
 YNlJleW5Yr7vbM9E+dYtRnrnV46QQAJ71CfDm/Lg+UoThdVv+06Yd7HFvt4XL1E4Ydq4+i95A1W
 KgzovqC7hTKthIhjJDo9zARUjp+OYLY=
X-Proofpoint-GUID: PmTI993xjvzE2Frn6jVuB6j_KP3fHP9S
X-Proofpoint-ORIG-GUID: PmTI993xjvzE2Frn6jVuB6j_KP3fHP9S
X-Authority-Analysis: v=2.4 cv=DeInbPtW c=1 sm=1 tr=0 ts=6a74736e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E40xv7DK0V-5u9Ck0vwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060092

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
Changes in v7:
- No changes in patches
- Rebase on top of linux-next (20260805), fixing the conflicts.
- Link to v6: https://lore.kernel.org/r/20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com

Changes since last v6 RESEND:
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
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso |  79 +++++++++
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |  79 +++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 197 +++++++++++++++++++++
 4 files changed, 363 insertions(+)
---
base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
change-id: 20260526-shikra-camss-review-cf6f66ac566b

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

