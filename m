Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05594377578
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 09:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704111; cv=none; b=oGZKCV7L+wCkqBFSM4HG//+3lPUGg7H8ao4Iy3dKI/OWkcIgrFynEEh7r/Lsq9EJF/jzag8J/AY0+mP44vuzFGE7KmeDS7oOAFL5WUBPTlYAkLUgVfUPOLWOnwxjXbFxuR0m5c8veHgJijmyr7y5ANKxxh7sU4TkC7CRBqFXAdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704111; c=relaxed/simple;
	bh=psIXUkMn5+R5k4TdgFnB0WZTOygVxEGKBTdZs3l2WGc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lHIxoKLXcTUF6F2dO1mh3m8uG85swvBn1bM83Cv6Avtv17kC4w4CtckW3NaHHh5Ciwb2N0Mh1AuyHVwkBdNGvqsBU2HUhz50JrGOPu+fAxUA2XK6mbUiMzFc6C3GAzWrS3WnLICKSDvDfsYiTCpnDkTI/bNnEhYEVtjhByrX7yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RdQJgTBn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EggFWQlM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RdQJgTBn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EggFWQlM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6253AAAj865414
	for <imx@lists.linux.dev>; Thu, 5 Mar 2026 09:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9uMywlkuTKkzvOtJwTHxup
	57VnJ284vbdhoXFQYAsUg=; b=RdQJgTBnBTp6E/tuzzGJ1MPF4ZjdP2+esGps7f
	LuhmfZJKAlddrS80rXFkNWvQ3GhHttlOSAv1z5lpHyh12fj/S5uXQwSqAxu2FYto
	jPxwWm2cZ4PNHmPMfSKP+G7Sp3SKW8ERZepVbvVcKQ8TyroMT4ly6UnadJqd7hJl
	oG6cuSqp5HfzcgUYhDNo5ABLwDmXUBJXdueWiklibrFVEJ5Clj+WowjvL0l4aVoO
	6ojG3YcP5IlP0MpDa8BnVZJCA1UmdzeIDMHAg+z6cLvw8lXCUkjUFvl5qHVgrmUo
	PhwK7ZxOk+EaVOm7BrbayGOZiUZIulJiIeAJXbuQx5LUFyig==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk17su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 05 Mar 2026 09:48:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50620483ff6so591155671cf.0
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 01:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704107; x=1773308907; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9uMywlkuTKkzvOtJwTHxup57VnJ284vbdhoXFQYAsUg=;
        b=EggFWQlMk4SfT7sj+SipwGLpZd0BXJq+wvb2nLswDkN38FvDMRjKdAz1mVl2l9ioVW
         S6c28PeMZbDNHjInI4/zDi3VZKaYJo/f1Vw3+bqKHBa3hhOmz3dRmMCyEsKa1x+lMSKC
         hW1ESjr7wl2LB2UJEqeybsUbjXKKjAL6KHL2VpJPkLutpgV+YbA+ctDHBjp3FWUbPiJ4
         moiUmyL1TR2sD/uF5ew36saOV48m9l9fsIYvt/d+Qv9L+H0FGEq1KH4oTCZYk/xdkvzo
         Ox5tQKevxWV2HP+b9H5wtqAEoISDOKve6I4wjQPDboqxZb4xQ6Bji76aXKP4yrehdz83
         74XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704107; x=1773308907;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uMywlkuTKkzvOtJwTHxup57VnJ284vbdhoXFQYAsUg=;
        b=CltZwfAvJ2/CL3rAbr4UdwXA4iTAmkOv7sU8FS/AjBOuh9B+QSvf3yR/4TgKRpeNdB
         6sb+U52duJbaNIxAG+ajQiwGyNwY+SL9MIOpeZgMy/l3op4pLOSFdSyF/dijXIm7TGsB
         LFENGleWPQfBxgiu0zX0JW0IGAGbrS2RYVQg6lU2/zKrOAnChnOTif9LqyL7lvog3zum
         aesVfgam1sY3pzaRezmTuKrMq9KO/OW1tNlvrqL4KZWUbCJTYxDxdao6vAjjiPPZGTW/
         Pu4C3cO5Ml/aDkQSHuFPV9HKys/Tj/R13N+PHOtWqf45DMTeSqfWBUHs3v/pLATa3trt
         jT6A==
X-Forwarded-Encrypted: i=1; AJvYcCU0VnJbdPi8y2m+zCxRertWBEHZO9Dmstp1juaOFAwRipqUar4XNbpp+ceXNjAsEVeTHxY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhSkIjxQ889gnSzeHt9c871TObVYhX8LwNmkLHDaA90WMcWo0a
	EIaOmOfWi1ZkUJeskoRgPl6Mqkb2oxHfGlMG7/h9oz/Qk7NIT+7ypqzqh1FKRQVECFULbc2Xxwj
	lNu+8X2qfr083ypaUlW+bCMUor/jD8VoFEGOOLZjCuYiDxQCjJ7SwMTI=
X-Gm-Gg: ATEYQzyBU8m2LU3F0EqJ9ThOYY7TGx2Z9fh80cTJsjdSlgRAPonDhnVBryuAH7NgHUf
	g5rIs0P7RNE8kbSMKVW364tY+0xFOOnlSSiNgQwbOi3Tq+S/aGrl2jIg5syUhFaxxPEGulpNSk7
	aHDxiLdwZy4+vYVn1pXigcN7Eg6MontDv1b2phEL1DBcMQXn+OTrRv2BICrIxz6JGfZUj1Q+u49
	+46TeoKAIBk0E8q5tBogWae6AgEt2JvPSZ6BBFZU+Gk3BERRwAY0KeBzvPOyG0Vqbw21/rSYugW
	MjMd4qBcAzXMrLG9ZT1NK6teLiLH9bWR15wQo7v4PL+o+SdU99CJLljlzWDt+3hqxCQjlCsKXIq
	w70nc9peDoMWozh73+Pdu9AbY28N8KKrBXOX4vsH0mSJPEzjp8v7sHmqMpFp/ZRbDtUB21c0Va3
	XFW+tSfc9WcjQY
X-Received: by 2002:a05:622a:1909:b0:506:98c9:a3e5 with SMTP id d75a77b69052e-508db35c1e2mr68938001cf.35.1772704107069;
        Thu, 05 Mar 2026 01:48:27 -0800 (PST)
X-Received: by 2002:a05:622a:1909:b0:506:98c9:a3e5 with SMTP id d75a77b69052e-508db35c1e2mr68937761cf.35.1772704106529;
        Thu, 05 Mar 2026 01:48:26 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074496300fsm177126211cf.2.2026.03.05.01.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:48:25 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v6 0/5] Add CCI and imx577 sensor support for Talos evk
Date: Thu, 05 Mar 2026 17:48:11 +0800
Message-Id: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFtRqWkC/3XQwW7DIAwG4FeJOI8IDCQhp75HNU2QuC1a07SQo
 E1V331Oekml9YJkBJ/t/84SxoCJtcWdRcwhhfFCRfVRsO7kLkfkoaeagQAjAYCnoZJGfGH+5g1
 67C3ag/Idow/XiIfws2L7T6pPIU1j/F3tDMvtwlRCimrLZOCCey8ldL5Rfa13Y0rlbXbnbhyGk
 g62aFltBGleBEVCIw1UfS+N0eqNoDfC6ypZk+CsaHptGwtYvxHMe8GQIJT1shbaCPffDI9nSBF
 vMwU9PZNiA6bk1qDbYpWVAAm0oi2lVU1lNZecHqfxnHG+pimiG3bHwYXzyhLqXUK+9AlTW+S6F
 Dx2QP0ef4P7mtzgAQAA
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
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772704098; l=3459;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=psIXUkMn5+R5k4TdgFnB0WZTOygVxEGKBTdZs3l2WGc=;
 b=TE/lqu7xbHnOc+2UELh7+dMJu0JAe1+ryIaqgvIFDYuThmkLOYD0u1zWmJeJJF+uqrKNUCkNX
 fgGoDBHzqggDmz536KNeduNSG3S8XPJ+/yf0jylsI+nuH2wr2w1R2MO
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: NP1RtjhPlh55YNOGp847n57jo1hRRM1U
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a9516b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ld4WfEqAmRoefWT_AfQA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: NP1RtjhPlh55YNOGp847n57jo1hRRM1U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OCBTYWx0ZWRfX1bMHR8wlSbiy
 r3ExCXIkOFab9cDdM1t8NvYJr7UTsDWTXdjZi3zgOdi6F1vCNxZ+GuCHrnhOps1E+xt5aia4jrC
 PQeJ80y8lEYShcwVQm+9AsXaFSvjsSh7NDMp93X6FttlRbdgGcGE9T3TCalsAA4nvrBV9Jr+VNr
 vP6ctQeT3entlg+4KpmQWrq2yCZ71YQxeJpczUCACGo44LfgrwPyCxTDwhcCZVODECno85Tfd32
 KOd2/QD5P3ujpBz+i/660exrmOZX9jbKcbdhigq85HuP6XuNdDA91ddyexzBy6r4IC2Cx6QNKIx
 y1rChm31Ry20DkbKF0sp1dQfNk67Vf9QsAgREIKKfKwxZFT/OubGCI+hgU69dpxGsyu2wLveEKU
 q4kEuWuwZWRJ9iYrn1WgLKSjkdbBh2ZMFMYMYeLi08RqOfKmYSN+tTwSfU7BbggNoVq5puOwWlH
 haTcM3z2rYBWC7YA+3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050078

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
https://lore.kernel.org/all/20260302121159.1938694-1-tessolveupstream@gmail.com/

Changes in v6:
- Adjust patch order. -- Krzysztof
- Change MCLK pinctrl name and add reset pinctrl. -- Konrad
- Fix typo, rename imx577_ep1 to imx577_ep. -- vladimir
- Link to v5: https://lore.kernel.org/r/20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com

Changes in v5:
- Modify the commit message of the cci dt-binding patch.
- Link to v4: https://lore.kernel.org/r/20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com

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
      dt-bindings: i2c: qcom-cci: Document sm6150 compatible
      arm64: dts: qcom: talos: Add camss node
      arm64: dts: qcom: talos: Add CCI definitions
      arm64: dts: qcom: talos: Add camera MCLK pinctrl
      arm64: dts: qcom: talos-evk-camera: Add DT overlay

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +
 .../boot/dts/qcom/talos-evk-camera-imx577.dtso     |  63 +++++
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi        |   7 +
 arch/arm64/boot/dts/qcom/talos.dtsi                | 279 +++++++++++++++++++++
 5 files changed, 354 insertions(+)
---
base-commit: 9fad1d148df6f36105159c2503d0ecb1397bc89a
change-id: 20251222-sm6150_evk-8ebed9e9f3bc
prerequisite-message-id: 20260302121159.1938694-1-tessolveupstream@gmail.com
prerequisite-patch-id: 065fda916d7faca61113e1230fcc0ce3916442fe
prerequisite-patch-id: c009966e432e7f11bbb895167e32e517b6ff76e3
prerequisite-patch-id: a44d58bc0cfaab99dff8c4e12ecd0312447766be

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

