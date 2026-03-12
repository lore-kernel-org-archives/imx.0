Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA0731AF1F
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343090; cv=none; b=UarkJSX4vrMx0KUoTbkdPCtugmaI8zbfvFVUNqZyCCA3V6B9ER8ZZ9gIvME0t8yia7ID6EutdENq4qXhe2NjfJD/gUIxp5eqDKTyVJ4ZbGitgeWEDC4As840lW8lPXw+i2IS/gKJOJCQkcjn3Oi3CrOG1NWLMMOeJth2//dbq24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343090; c=relaxed/simple;
	bh=yzJYxCpjEKgZzmXVMKoAXtrX4nMn457FYKnE9adZi5I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=vD7fOoSsU8zLt7umofvHid9b3WVsseGYpAdxYZ2lS1H09AGh1PPneZSCY3D+OLQ8mjSxkVOf0LcJrApG7aLwVZcjdb1aH0E4GAZtmmSSfI83TIXcipDJjb97K6kGhkwqWPDJUMzlShHqM2UeP/puhdlbO2yqElD0vrdKp0HI+h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IeT3ObRZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQ6YZuvH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IeT3ObRZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQ6YZuvH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9tYUk4132977
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qUMXYVupAC/oXs1qHQXgK4
	lz3qO12f7R15hKpGsftlk=; b=IeT3ObRZ3TmfjGHBmLChx3FwtTv8XxtT77f+2A
	nNOYuVbPVNXZQyI5tXLoYA2pA/fD2e1djNYt/EeodGFfPEQfHfjurkqrBp1LASHa
	0cMV2HtyJ2fwG45r/sQ0vv06DP+3Ff6gQdBTciUOGNf1ynO5C33OWhuJpAhtfB8s
	tYDOjqbjBCfgMwxbr9ACfgJYE7NHPlQ1+MKriIJFN8mntEOlz5vFDad+7KARJuj3
	AXyJGICnu7F3XVaVp42QqIGu8sniZFyc/gnDfm6nP85GeYTkcPc2/Dc+WpfZHa0s
	mrjBfaL6d9K0ylOmHQxKM1a8yJMjkdjcmyd79ganHNOZIixA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w3av6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd83cfb36cso948306585a.3
        for <imx@lists.linux.dev>; Thu, 12 Mar 2026 12:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343087; x=1773947887; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qUMXYVupAC/oXs1qHQXgK4lz3qO12f7R15hKpGsftlk=;
        b=JQ6YZuvHDI11zaZlsxYtVmk5t8oVTlQwUm/bvOQmkUGl1oz03KFQ2oqXPMeUZw4MV8
         vtT2qGE5b8bdUjg5fbsLevaPVtrd7QaJ0gJGsJh/msL99Unlk+VZUBH/kJLmUe01U/xZ
         ZTs0LGMXP3759IIjcGibASHJQyIeUxaqAGlNEbknlqIwy5BG7RUghtpoGIzywu072k0R
         lJ/on18hBzOCn3iGTDLyzrjuDEUMBz7zELBKqFusy7KJ5i5bWPc0oID3OvkZgqsHadCv
         zX+Ifaes85O+ZshF4dOZ7RexEauJ9EJPepy/+ChZzlLQwVmAjch0wvhmCrmR+EBeLT1T
         NHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343087; x=1773947887;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUMXYVupAC/oXs1qHQXgK4lz3qO12f7R15hKpGsftlk=;
        b=Y4gOjmTuiR466AONQbtjWaTKFPlH3yiTK8K0MonTlCV0hzt2JjqXu06VO6ZiaJ3aO/
         BBW3yxEMaImprIkdkqdSkNaPXthGWeX9gKJunyTeXEMgg7po5Au94zpGBwcTNgUXn5DP
         bpGs//uHbON4MWdIcD53gWrZ+mvwJ1Ue1WcHjrieG4yprb1/t0sZTFIzDgcMM+udrgdw
         HF79PAvIVe+w9WPJoUfOsaNjBCCMCHopWClOJRZqdvehwBWqYj6bvCpcy6/N5LnV9Gu9
         2PmJdn+anZB9siakGqggUUwKyPCRXeFiw7xjXQVE0AUJEhAi5lXZO7IDlanzS1vc6EX6
         v0qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWU+sn1bkg20TnkggNvAA+JdYnH2Ivc79DlO2aL+ytpWh6pmOGtUMvHwxAQqfDoH2d6pI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxlc0laa5+ElbHeBRZmvPyeIMMaQtR8MOgYIopkpchnhoX7PqHb
	/N6SDSLDIrY+i7tveO3B6TlidaFIA9rDpcbosNL0415aApjelJ2/iJdQH4QHWuODNdncBRYEuD+
	Z1D3q2WV49aew5mw+6/Rl9u3tsTI6ixi7hHaxf33PaHxjOTzQlhPYsXE=
X-Gm-Gg: ATEYQzybjt2OKTOl+7Ml6Q6Fzcsi0mYWCfJgUPRTrOfra+qFMi/eIhESAdkE9rsd5kC
	iDBPxcodOaFP2AyLjYWMMUwvOrMtzfAsNQzv9OOtIaomJoh7YI9/eQDEYla2RcAzI9ygY5EpFez
	JSEyKzH8XpW7zHQn9AVIVpAfU6wyH9zonV+cuCHhm/Pz5RGgAEkq69hjUVEtqACY2lN3GzmHe6U
	eih7/HEMUlWlJrLuVmRzfmQ74kBt/Z4q2FmCCZ/IlzZ7NilE0r9Ayn2IPLIQ6O8jnbyLCOZ7N+T
	/rUxcCPqYS+e27c+rLLchXaBABUv2wH8N3/tQwzpts2OQOsjoUZzZ3WHhco6iDJMi0ei/cDoaR2
	2YUolkTl1+bv6K5/RvO0O1fYLYvBOoOutNiGRYybYQcqP
X-Received: by 2002:a05:620a:2981:b0:8cd:94a5:2f25 with SMTP id af79cd13be357-8cdb5b49103mr118583085a.41.1773343086587;
        Thu, 12 Mar 2026 12:18:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2981:b0:8cd:94a5:2f25 with SMTP id af79cd13be357-8cdb5b49103mr118578685a.41.1773343086095;
        Thu, 12 Mar 2026 12:18:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 00/12] arm64: dts: nxp: Use undeprecated reset-gpios
Date: Thu, 12 Mar 2026 20:17:47 +0100
Message-Id: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFsRs2kC/4WNTQ6CMBCFr0Jm7ZD+GIOuvIdhUdsBJhGKHSQa0
 rtbuYCbl3wved/bQCgxCVyqDRKtLBynAuZQgR/c1BNyKAxGmZOyWmNYBGWaBRMJLdjPHAUDKeu
 CUa6xGsp0TtTxe9fe2sIDyxLTZ39Z9a/9I1w1KiSnvVfn7u6a4zWK1M+Xe/g4jnUJaHPOXyfzC
 Vm/AAAA
X-Change-ID: 20260311-dts-snps-reset-gpios-de03ad20a831
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@dh-electronics.com, linux@ew.tq-group.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9529;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yzJYxCpjEKgZzmXVMKoAXtrX4nMn457FYKnE9adZi5I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFgKLZLtH04fDkf73Anx21BTomoRLU+LeXpZ
 JhMLwpiUxGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRYAAKCRDBN2bmhouD
 1+WFD/sGzjjDT1fhLI8Ug9jLpLXqkhRqOVEvQcQQmKBlEoV/OxAp13ULz6VVzj/pWoxPMHttABm
 L44EfwlGhNGqBR9o5bltL1bmEMc96MlXaUH8ff7LSyuPEh2bIz8Vxjk/oOHLX+bIuzQ8LMLbqmW
 CTPsGTCZ9HmnLbS73BDemeRUY8ZeNoz0DAHM/WeKvYt7rw8miZ9L+PNo038+ldrJjFlsmJ9YO3n
 k/JCDkJ01oucg1JOdhbpPs7W/p+Mb29hXxRrfAdEGnaSuj9t/0Dk34rgSrumP74qzfJz44HjMHb
 szaUdogaOp/0Ou0YTEUkr7Z8vEVZgTNkJ+t17BUrplJq3/aUt/AdKjj73f1dI9d3rBYsGLoc6jd
 LHXcK+poamD3mFVz6pxIHBc0u3NQkXPKrjhiwzUkWsNIHXx/7UuNopRlmJ67F8H6dy1K0GdKqHM
 LCDyE5FJmm+KBsd8kuje46/yePpia8+74wh1lbSD0E15mUssXJQOZ8ibVVHboQp/cDY6vopVyIy
 qdCFQ99zuiBrYXp8syglc63ZYqMsf7w0p7tyT8yGlcCfvYnDlAfBknOwzbSwHDL4OWFXxtWq4Bu
 htIjub0ZyLwHb8LoDfLg7qQgv3EdMWFEisCeRWos7y4NVGqpWmWa6VCgwhUrFh5VBJIxbcFofFB
 tEy1pDhnh7AcULg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 8vDR4oMs3Pmng-KxwyHqpnpWNK8PAG8m
X-Authority-Analysis: v=2.4 cv=Cpays34D c=1 sm=1 tr=0 ts=69b3116f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JG9a4EfIwmMJyLezLg0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 8vDR4oMs3Pmng-KxwyHqpnpWNK8PAG8m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfX2pr5A+vPhy0C
 ZhM0j+cPt00Jm0/C9b2/1oPMwfVh1pbnRErfySm3tSZ+YUrYNl3uVfw66gqu9Bmg+mDGuKEyE3H
 cBsrHpX6u8j9PtlWNoUgRAz6w/8b6b5ZRJHzXTOOyI9VU2w45xnY+mlAV5RBUd1zCDag/0c3xlV
 ve1KiHVzil4cm80sFNmD9gt/KqMsSFz1xsEu5G0U+/EkcVClGsuOAf9KpOivrt5NXxv3Rpq/4yN
 KkgdMQ3BNpJGHNULgNX1ODadUQJYGmu5LedkzUPx9AGQW9CZ2C65+08LIynUWFPRMtuHEIhO5wz
 mE0zdatvN5+jj1Evxchs2LYbeMeLhmrgvJkRjHKWNY6yA/3pZjfCIRKmhoYKLlo5Vifl+StBGme
 FOmWewy7Stx4CYCXfMPPQ8t2IbSmL7NNn+ImBNNl6Ilx/fAad7W3lk/VOhAAPFCV8kOAImytsrw
 ox3BB7112i8YDRCoJUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120156

Changes in v2:
- Minor fixes in subject and commit msgs.
- Add tags
- Drop also reset-gpio-active-high for imx6sx and imx6q. These patches
  have actual impact on U-Boot, thus move them to the end.
  I will end the patch changing U-Boot in separate posting.
- Link to v1: https://patch.msgid.link/20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com

Freescale i.MX6 PCIe host controller bindings through referenced
snps,dw-pcie-common.yaml schema already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
add snps,dw-pcie.yaml") in 2021.

This fixes future warnings expected when this is applied:
https://lore.kernel.org/linux-devicetree/20260312184344.42337-3-krzysztof.kozlowski@oss.qualcomm.com/

Best regards,
Krzysztof

---
Krzysztof Kozlowski (12):
      ARM: dts: imx6dl: Use undeprecated reset-gpios
      ARM: dts: imx6qdl: Use undeprecated reset-gpios
      ARM: dts: imx6qp: Use undeprecated reset-gpios
      ARM: dts: imx7d: Use undeprecated reset-gpios
      arm64: dts: imx8: Use undeprecated reset-gpios
      arm64: dts: imx8mm: Use undeprecated reset-gpios
      arm64: dts: imx8mp: Use undeprecated reset-gpios
      arm64: dts: imx8mq: Use undeprecated reset-gpios
      arm64: dts: imx8qm-mek: Use undeprecated reset-gpios
      arm64: dts: imx95: Use undeprecated reset-gpios
      ARM: dts: imx6q: Use undeprecated reset-gpios and drop reset-gpio-active-high
      ARM: dts: imx6sx: Use undeprecated reset-gpios and drop reset-gpio-active-high

 arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi               | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts               | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi                          | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi                  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi                    | 3 +--
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts               | 3 +--
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts                    | 3 +--
 arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi                           | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts                          | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts                     | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts                        | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts                          | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts                         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi                      | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi                | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi                   | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi                        | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw552x.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5913.dtsi                       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi                 | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi                | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi                    | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi               | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi                         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi                | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi               | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi                  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi                | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi                         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi                      | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi                     | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi                     | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts                      | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts                    | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi                           | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts            | 3 +--
 arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts                            | 2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts                             | 2 +-
 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi                 | 4 ++--
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts                       | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi          | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi                       | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts                | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts            | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts           | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts              | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts              | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts              | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts              | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi                    | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts                 | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts                 | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts                 | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi                     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts                        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dts           | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts              | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi                    | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts                        | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts                | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi                 | 4 ++--
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts                        | 4 ++--
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts                   | 2 +-
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts                  | 2 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts                   | 4 ++--
 arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts            | 4 ++--
 arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts              | 4 ++--
 arch/arm64/boot/dts/freescale/tqma8xxs.dtsi                         | 2 +-
 99 files changed, 107 insertions(+), 111 deletions(-)
---
base-commit: 283366d30bb599dee322996c9007ee5a9989cd9d
change-id: 20260311-dts-snps-reset-gpios-de03ad20a831

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

