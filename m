Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A13392C2D
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 05:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772170223; cv=none; b=jDL93VsPlKviZJYFFEJyDUXzOYiL6f7iy+L92cYMwID6kS2Yo6seT5ArufUYetUGO3SXYRFXuleopjdBv1rqnTO/KSgZGzgIXtr/UaFlS8u1OHfEiB75XFa9hUbdIxm7rltZiUYXw4224PwELqrLmCSqLcwANH0jJCHNAA7H7X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772170223; c=relaxed/simple;
	bh=GJsl/EZBcLAwCQGDbtrIwTEUvsx90G4RjDRSHaHtCXw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fnFCqJ08Iq+FhcH5052vFiQXZkX4SlkftcsYpu3B1F5YlboH4TVVlCH93+0tRkHoIzXRCYHsAPovTO1DxZF9W86Tlj3rdy8HYsVYoMFb2xeYH7H7uRlfo0jBIEjL7WEzbullbL6oTxMVdtFzBl/GWg0u8wcmkIPhnYqXSplZQws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKhh+pin; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jp74F+Qo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FKhh+pin";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jp74F+Qo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K11T2403203
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 05:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HJn9ZHvf9FI4W4WNYfDcOy
	VsafvW7lubtQ2GHHlairk=; b=FKhh+pinY+/YaQp3ER/MfFUCP/d9wDyoa4o3+t
	zg7jxURdZQWse9Vx30RxhcxyxfNFsEmRlGTHEtU9tCAb/caI3OzeVoVjbg5cfFIa
	4IKiddnOk2b6oWfNy9lL/GM1j8+TJVr3NaLxrEaNLbQqYd6lx0WPvgXRcOd6c4as
	yThIwXt53MEBjl8rO52P5JHJ23adnPYJaDLMe2Tp+XlDqoLNJ7/DGtH6buxoq3Wc
	Gf5iqcq6jlXfsHzb0m8FJh15tjp+NmeKhum+c+kKYCiax1e/Cm+Rha/mYs5hi07q
	P1wcMECobaXiqHLYY6VIsUE+L1GwCOjJUyTmIg1SqIh8NUiQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjw239fry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 05:30:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-506b1524dfeso143158141cf.2
        for <imx@lists.linux.dev>; Thu, 26 Feb 2026 21:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772170218; x=1772775018; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HJn9ZHvf9FI4W4WNYfDcOyVsafvW7lubtQ2GHHlairk=;
        b=jp74F+QohpkOHDFTmUeNKfgnqw+e7PFHSda+S6awOUwx216iiRIFW2GD/KSaFKABmi
         WgBc3wLusvICPeSADbtLH8AtfsXTDqoA6NIlL1OyB9/ZvUj/MDHwggcExXf0WE3EtCXp
         fWQ0JvAhgYlQApC1d0OrzbDlvKJf0ZH+NDAENdiajkMx6KRGhNHUK/tSbwZP4hUIUSYi
         hvXyT52CWrX+mKwbtWGLUKkxRzzSWm18s2o55a6ql6ZEW20l21vfEgr5jdo1IzQdM5eA
         XQMOLQkCRwhhLcNBnAI5ksNyV+GN647YAnn8GBJhHijm9zGV/zVLZjv2AaVbv0Y9fzzi
         5aKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170218; x=1772775018;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJn9ZHvf9FI4W4WNYfDcOyVsafvW7lubtQ2GHHlairk=;
        b=hsn3pVrR8A0Xct10SrqGTTn0DU9AwSIjD1WMCxWL4FdeuWTZSINZW7ISQi0J5Cxw6u
         knIpPLJ/Akuh20eY2mdo4ypIAMqs1VKwhnvXFxofJHhWro8EAQvUAeJrNJ5v47g5GNoi
         9wfJUZrp6+tMMiV8qcdJnWPug09f/e+ENzySrbleN9pS2FfIC8rJXPZ/ofrzPhrNjqpG
         rolH5u4ZAj1ZmN/BGD+hyORWWrR/0k/UixVMWqrRsbaSba6/PEPQcnMK5u5ZVzFUxPMo
         sm9pK0SFz+1h+f93Tu/AKrOsHBUNep7X91ZKGzmEnUIPYdulXUTCtoByUhM/qBfWkjZ9
         549w==
X-Forwarded-Encrypted: i=1; AJvYcCUbBvfY6aeAktv8DSDc9JceAHb4QtsT8xsskXdAYRTV/CCvt8ppmCKAwnd8Kf2auzErJJQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFrH1otR4Xmk6ut9rwggR6aKV4xooDXKJrRwPesNKiq02pXDoQ
	DeGLq5YRx7xOzFqKuQUDsZp8F8VUk2sO6UDzgajMrm7rn5ZH3IjVkS6EIWP9+9B8jGq0/ADP2Sb
	TeSCDiPg6bTGjzp/yNT6YX55YRUWK93gF3miJw3NiDCBDrmrO4dFWSPo=
X-Gm-Gg: ATEYQzwChpNaHLc5/V8yBwF2r6TzJtmGAzgUGj1lJbCymlWB+Wa2NRv5mYVeDYHZmcc
	ito5HH8ZU/bYFRIoeUNcyY8JQeTNsgh62xfk3/cIUYJ3Ay8cX2BbM7PajMvodP1TVpMqvjwvCdi
	sV3ye5ekZuaWhPj8XJ+cEWokdd6U5ZW6BJyxMD3nu3kCZ0tZEkQ48GChSo4ydpHvfngclAQ67OE
	g84+EaxNKS1aU31NiYp1U5wMPHNtvY7aAv7i0hsb9OKdhYq7zGiDa4vcyTqw+FKjhSIaCg7FXHN
	voZnsPBJt+rLShK0P3xaiqDpR/jMkrA6ukZdP9HhTsTU8Y7Oz7PLd/3ZJs/avW55S9Pf/yZc9OG
	frYF0L9k6trg+Q4Qd5nmmqEmMlyKuZCuhpWSNfrfQK74a6j8qYS4M7BkDJcRSnklfEt10pSPrSr
	pSNQhYe0z2Z3mU
X-Received: by 2002:a05:622a:1101:b0:4f4:de66:5901 with SMTP id d75a77b69052e-507527cb1f9mr21107041cf.5.1772170218263;
        Thu, 26 Feb 2026 21:30:18 -0800 (PST)
X-Received: by 2002:a05:622a:1101:b0:4f4:de66:5901 with SMTP id d75a77b69052e-507527cb1f9mr21106691cf.5.1772170217868;
        Thu, 26 Feb 2026 21:30:17 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744afa7d7sm36590121cf.32.2026.02.26.21.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:30:17 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Add Hamoa EVK camera DTSO
Date: Fri, 27 Feb 2026 13:29:38 +0800
Message-Id: <20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMIroWkC/2WP62qDQBCFX0X2dwdmr9p9lRLK3qxDq6auEUvIu
 2fVkBb68xzmfHxzZTlNlDKz1ZVNaaFM41ACf6lY6NzwkYBiyUygMChEDZ3rR/eelk8QSuvoWiV
 jY1i5P0+ppXVnvZ2OPKXvS0HOR/lLtFXhaaw5wsoThEwCzt0PtEZJ5Y3mUTq7SPbX4rGRXIJX8
 EXDZYUhrTMIDSih1HHOtPEa5IgQXJ8zcI2mrZX3O/H1P3H7yhwW++DpstO0CI0OGFV0jV34Nvc
 ul9ux72m21SHwoLDT7XYHY2KbfVEBAAA=
X-Change-ID: 20260227-hamoa_evk-2455daf43d86
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772170211; l=3165;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=GJsl/EZBcLAwCQGDbtrIwTEUvsx90G4RjDRSHaHtCXw=;
 b=8RV7fA/Sx1rI6qohw3+zb1LKEYDpePCGdcv7PiS3aBrOv03aRI3r6pv4Gg73BxcSzTs+QRu06
 fLTfZK5SwEZBxqkZrbXaCwIg39Nn4+ww05FHBxniBH+AvqVQbZNOcGo
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: 7IFAhWvmBHIwFN6ziyzfGk7p8sWreSyo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA0MyBTYWx0ZWRfX4r0AoP53FcgP
 UeoI/8kME3UdMKQke4BUYFwEjDKQIRQs0wveseQn6rHt2tdh+7qECRAwVfWGoeIJlq5hWF2/8MM
 NIO2sWEdf0mG423XF9hIqipuJAJwzdwLJTCxh25bAPZWpPjAOgNlUu4/UC68kNXQDCstSeNK6tZ
 xII/Qq5NPLlV0RkhN2AEY5N6tcu9Zzo7r1kVQQTOrwpN24YZSb/nZ0mYSDV4/AObmOHD1EJHJ4A
 yvkt1rlqLYcGfcA3ZHB45bhrvHsiEtXv2DL0fWnDsUlzSWUrEdOy7eF0pL1tRhmSkz8aGytsguv
 1NJY1M02er3FDs71LuvIfHobOGTK1E8MdhSmwNcdrJfRiWlU8M5jG1XEm3eNSpKfjMU92nNqk18
 XUxC7FlKV2Ify/1LU/b9gGfDsAIDkAAHYmOWp3JdsPSllJerw/QLOCBTAQcT+UbW9SG5jVkSQRQ
 HBsRVMURFUooq/ODUew==
X-Authority-Analysis: v=2.4 cv=cJHtc1eN c=1 sm=1 tr=0 ts=69a12beb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OrI9xjwDScBevOMuhrwA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7IFAhWvmBHIwFN6ziyzfGk7p8sWreSyo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270043

Hamoa EVK is  based on the Qualcomm X1e80100 SoC.
It lacks a camera sensor in its default configuration.
This series enables the IMX577 sensor via CSIPHY1 through device tree overlay.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl -d /dev/media0 --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

Dependencies: https://lore.kernel.org/all/20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org/

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Tingguo Cheng (1):
      arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M regulator

Wenmeng Liu (1):
      arm64: dts: qcom: hamoa-iot-evk-camera-imx577: Add DT overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         | 16 +++++
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        | 15 ++++
 4 files changed, 117 insertions(+)
---
base-commit: be8c02c846f256767d06a28759bbc7cc0257a1ad
change-id: 20260227-hamoa_evk-2455daf43d86
prerequisite-change-id: 20250710-x1e-csi2-phy-f6434b651d3a:v3
prerequisite-patch-id: b92aa0af5255e56e1a53fe2bc06d8bb57f155117
prerequisite-patch-id: d39af25f984300c48e6eddc4c7bfe64caae1d61e
prerequisite-change-id: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a:v9
prerequisite-patch-id: eb97bd225a1426e2761a40a8793dcfeebf801673
prerequisite-patch-id: 0dd709980bffcbfc3c007c8fb8b2688cd2bd5e49
prerequisite-patch-id: 3c7474e4c705da65499de17ce4b7090bd8a8a2e1
prerequisite-patch-id: 270d82b4c1760f1ec0a64a1b56c68ce26e6ae3b1
prerequisite-patch-id: 4f11e3d079a484008a03ce750952d6e2933c0253
prerequisite-patch-id: ec15148282029b78c452ef5445b0346dfb7ae43b
prerequisite-patch-id: 570b65b326f4c684d813f6ebeda152378dc2a47f
prerequisite-change-id: 20260226-x1e-camss-csi2-phy-dtsi-52c85c0d4da8:v1
prerequisite-patch-id: 33b8d2fd11bfd7ed5c846c8e56713e0f13908da1
prerequisite-patch-id: ada8ee35053d0c5db6a290449ce479af06974776
prerequisite-patch-id: 25f09813cee88243e1bdc01b9df9d4fb9de3ff5c
prerequisite-patch-id: 5f2c62b86829efaf76f2ba2342a991199575751d
prerequisite-patch-id: 4d000086386a3b344b1d6d345ab93d9b2b569615
prerequisite-patch-id: 89bc5fa963a75ec2b85403160f884353baea5bc0
prerequisite-patch-id: 1f22ff7fc93d0135e8759d45955bf998b037e11e
prerequisite-patch-id: 09910d9b9b2231a65fcac9ada44c7b2f7b7a9a04
prerequisite-patch-id: 09444936808e801a58c83356c9ae95415bacc83a
prerequisite-patch-id: 98c6a10ce51f628ebecb59a447c891884b297444
prerequisite-patch-id: c3e8d5e110bf0e25a534bbe911c43996c21d2cb2

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

