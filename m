Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3EE4D797D
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 11:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645275; cv=none; b=bPtz5krwAVK0+BtyD+85/m0TEuh1UkPHexgrW/0xAIrcARe9Oo2jtfRAhc2Wj9YmBzfe659EXRx7dbH1T3kusaorTmKMdqjyM80PHRIouLuwgDC+aKKkaQMaXcfgya8xpNnyCiWThatWrIDQOwPf7toAaYLEEVZNS0+KkJW0FZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645275; c=relaxed/simple;
	bh=X94IXHplgaWDpwnKRfo/yBezpYjKyFyoBsVavimemek=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EKw4gluvs3OVKI7rJBrvudsG5ToNIy9waqySyY+6Ibt/7PrHbiJsoERh8itsoRGy+nXUz/S/q8Gm/rWflxR3Bmg97glPSxn0/88PxCdq6cescZFEGLGQrlMXihaOaRKyuwACZ16/WEd1xJJf08sjPluLLkq3IQNp+LFVaIjyu6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LZaQrk0R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCHAN8bC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LZaQrk0R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCHAN8bC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZVe9746431
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 11:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lK4Nws3QJXDFQ9Jm1Y7KZq
	vQh+UgSSV/pCMJhv6VQvs=; b=LZaQrk0RLUZUN+k9BG18VH0XduHq/+1dibaHD/
	/d5tJ6Rla8MLIbfOblzcZ4Nt7E0ETCdX5/m1hzyZns9vIwgWp2PoeXeIPcnUPk1X
	FVNSqzuxI00BhQEAQTC0/kx934KUgxB8cjyUlR3mWwODSfq4zg8y7fC9CkeEBgD/
	WiY/WsyiTkHWHLCaadc3D3krVhUMMYyKhcVt0RI6rWIaGeIAENtoCfbCMVnSIkW8
	JnIx314I5TwILQ2QQwWyDNUbvB9VkTvbKi9SxSMFgJGWZGPQkXUXXdbvIqKm/Iv/
	io2fKZBi2m6iDTbLwNMhXnwT6Ric8aoXyI3Lt3qXXIRaLDuQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra8rn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 11:41:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso633319a12.3
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 04:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789645272; x=1790250072; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lK4Nws3QJXDFQ9Jm1Y7KZqvQh+UgSSV/pCMJhv6VQvs=;
        b=kCHAN8bCLJw0Xtwo/jkb57PbI98fAkwsNWfXtbIiI+W7Tz7I9bB/4nlCKKDSUCXMiM
         JlbuSxKAUhY4GHuzdKQJFFnx3fjy2Pm5T2TggcClATg1a4cjWSkw++yFKth523tZlaNv
         9YAiff+IjF3jstIgQ0RdfMhD31094bbXkr9e+j6wftjQpN7JEVyBq7E7kNcsh+6ZpFcV
         HovQned2qZX312i9zPOjl58QQB4yU9S24pwAx8o9CPuZcOPda19TpEMHk17BnsUXodPM
         sSTg6zd7VZBipmrgnHAgbYvTFFNFWGWYilsNkaiNINEa/RcVjRPTZfS79j5f3qg1d3Ka
         n1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645272; x=1790250072;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lK4Nws3QJXDFQ9Jm1Y7KZqvQh+UgSSV/pCMJhv6VQvs=;
        b=DMjwzGdYxfuygo85GOt46vTi/lg6ib/caPkN+v8HcJzA+vccNdXrmNzGWMR50CXMKX
         XlCGETHFT3DNJo5cL+RYc+VZ+vPTuUq7SmdaPDFjROYPYt3NUWXzgibHjUpRV16a2UV3
         NMDuyhqj70bmEF3+fSk8ZlBbMYLYWOBZ5QrsvnCPWAYHGOCKDQ22UPf83qhL0V3zh9lw
         QrAQ8vVZFlTeWSdyRASMIZ6NsmMLml3DdUjasydaTO5yeIxiWqjuzxqh7rXl/EJh7o/P
         BHhU8/YSGQ1kGOQ9WYt/Hp6Mukpo//7OUFMhB7G9v9eeq2E8Q4qO/fu2qT54g7eFX1ut
         bxhw==
X-Forwarded-Encrypted: i=1; AKwUvBzx0k4lCDNceyRW1L62tb7yL+5H55H+7hBVnHX63Mk7rfo/F9zqjgL3FwK5vCzL8dmcInw=@lists.linux.dev
X-Gm-Message-State: AFuF++m7bsTBIpqdeA737VvlOwcL9FRjfctdjTjjum8vjX7QMbwIZyt/
	wCbUeUnEliL17k8DsPW0n8cCzuZ/Zg1V9WqMS1p5FBWGHCqyDPIerI5tKJOdxE7KFSFQq37H5Zm
	+W60dVDiXz+7uF/7NNiUjo20cuLzaK6f0ZEyl/ePmlOGTKAydlXaF99Q=
X-Gm-Gg: AYBFou034vyyLj64ZJf3vZ70oDUyqbJ31q2t78V24uFGXHaO7MxKakLCgz8KnK6o9o+
	75nQ/ZNpGC6SlBG6Lcpu2D47XPKiHWNZKSA0w5Eqyn0sKLzrBU2QhTSpEmACwEC3uIuWvrqztSS
	eWWPgECuDyT7hk7SMVdK+ZFT7P8xeNShcYcdwxhxkKYpOxlykea+kYrenD86YLgAsZZnaXG4DZg
	2gwIk0jJI8mvwP2ydnkZR41UZKtuG6Af1Gz7BvQkXh+ivOZYfAIAR3I+iKRz5JaofRHA6VPm9lr
	iQmbD3DWhzPurdbh8kJyOAx5ipYIRLc4mKHa3PfLJr0cS47oSnHw6mmO508ISYYG/ttW5EYMOZ9
	UQbqeCfxEHT766q1ONo1syl2oSP5/VA==
X-Received: by 2002:a05:6a21:6b10:b0:3da:3bdb:b22a with SMTP id adf61e73a8af0-3dd5f71a912mr16946183637.20.1789645271816;
        Thu, 17 Sep 2026 04:41:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b10:b0:3da:3bdb:b22a with SMTP id adf61e73a8af0-3dd5f71a912mr16946121637.20.1789645271310;
        Thu, 17 Sep 2026 04:41:11 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc1178sm3066557a12.30.2026.09.17.04.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:41:10 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v8 0/5] Add CAMSS and IMX577 sensor support for Shikra EVK
Date: Thu, 17 Sep 2026 17:10:59 +0530
Message-Id: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMvRq2oC/43STW7DIBAF4KtErOuIvxlwVrlH1QUM0KA2cWMct
 1WUuxcnlZKFXXWD9JDm40nMmZXY51jYZnVmfRxzyd2hBvu0YrRzh9fY5FAzk1wiB4lN2eW33jX
 k9qU000T8bChhQnQEiJ7VyY8+pvx1VZ9fbrmPx1PFh9sl867Ehrr9Pg+blTBcpOBkAhuVBuLAk
 1a8bY3wgbihgEKjd2yydrkMXf99LTyKK/Znt1E0vEENQZIlA85sj0NeH0/ufXp+XY8rO8o7hdz
 OU7JS5ESr0CchRbvtSpmh1AMlYJ5SlbLCKm1F0jbwBUr/g9KV8uRBcCuMAr9AwZ0yQs1TUKngQ
 fkoIJBOCxQ+UHKBwkoZ0pha770OM62efrfKclgmnA2eEBMP1iy0Mfc2li8sgZl+zijkKaADRzP
 U5XL5AQ1HJuMOAwAA
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
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789645263; l=5479;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=X94IXHplgaWDpwnKRfo/yBezpYjKyFyoBsVavimemek=;
 b=gETS5vn21OyH33oMEWqrEpoWxl2v1dGy47y4OeYMvQJDW2MQeD6KrgtcQc57XZZBa7gZAi4ML
 rWlUGdDgB5HCC6QwRJWlgTVwNvCOHyrtbzWM986vARfD2RrJOagYeMJ
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX9rooX+b+ulc4
 m6KSzvgYkShX92YW0EboF6pTs5ecNRL1ptkkPnmtBD/R6c6idKJWm5B+jg0znN2IZjOW5xQjct9
 3MkiqLesv+eO8p6sHSl1rkCrmnjcgcQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX1RuYxSpfvac+
 Wsp4pXuxPoQi2f88VTWXhe5nf16W0ZIK/rC6DmIsJ3ZRnomuCvPLmiJoHUrYfsOOOdaRAv7tyx7
 uzPlAnI8KsKyHhA4Jt5GzI40S/amJuzyvbfAbicTgdF4Di4lX2GRF3SNJCucPo3droXiG9xSmtJ
 /8zsyqRDRAIHMqI8x1oUEDNY+B6HvemKkHlgd7x3A/PacG9+BEg1cuhrqO1E/xnNZMnodlP7Y2+
 bfTeJZhPDOIB9GWdRX9QhiUtmMHqZa39Dybi0Wn/EvE2GJrVSDmLf1uSSb09Hnle+UAE7owehLq
 KdPseYLKPp7x3D00UyVt1NGUrDK7fI4sKrHR7/a8anHC79udoycot2jeo1LS/Su3Hpwsjh3AuPW
 2tx7DwEafKujgjS8rw/EWCjaWUHt//e0yuARSDDxwZm1rNJl3Y21BpUgcc7OQ+NR0pAm+uYkHfX
 LtfBzh5M1h4PCh4Rf+w==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aabd1d8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=E40xv7DK0V-5u9Ck0vwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: VbRntRMAWIjtIgrjRnulUsb_SaqDPoGV
X-Proofpoint-ORIG-GUID: VbRntRMAWIjtIgrjRnulUsb_SaqDPoGV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170162

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
Changes in v8:
- No code changes; Updated patch subjects to end with "for Shikra" (Bjorn)
- Rebase on top of linux-next (20260916)
- Link to v7: https://lore.kernel.org/r/20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com

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
      arm64: dts: qcom: shikra: Add CAMSS node for Shikra
      arm64: dts: qcom: shikra: Add CCI definitions for Shikra
      arm64: dts: qcom: shikra: Add mclks pin configuration for Shikra
      arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera: Add DT overlay for Shikra
      arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay for Shikra

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

