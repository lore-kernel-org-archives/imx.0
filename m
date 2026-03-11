Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01A43E0C5D
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245310; cv=none; b=mOvN/94ik2eMQuKl3+oV2oIN9+hhWPS2hQm+7S272BOq1QOI+TgYawNEzYFbV/dMWs+5XzddCpvnw+RLov/c6lISB4sonvUnuzZiT+EGtivc3toZsMNjzoEqJCUs1JK+NdpmlWIpGJYWlrWRua+kitR1pL5Vm5c3mUNiCw3Zpv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245310; c=relaxed/simple;
	bh=CbxUYYhcGr5bAijJBwqMSOgztEvk7KUeq6ljk3HDbJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ilvEczfAz2WqKQapVGtharVqcUx4VF6VREYFSjIrDl96hqin+52saGUBvV2W82YbnmtlzU+VIVmq6AyWYUt9PVBJ3DkthiuAcE6zXPdtJoxdmY/8okNzsR5RW7DKAu2HeK8s6sJAClcdAH+FVFRXaV9GmRQqQ3UpF1LsypquFbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fgzx9HBy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KjKva2HA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fgzx9HBy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KjKva2HA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BCR2881439686
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mElEGJc/QiRCvz5IlwWov/EZdnYuY229D3PB+C8fVNE=; b=Fgzx9HByGfIdmAdp
	O6LwzAW5seEUYvidmrjvNhfmsNeTP+S3RlaQA+7AAuqz8WqqCjRt4xxDeb8wBY98
	gf9+npYgercvq+zI5Hlij799cXbMos6OyrBKyis9Y2wbtm1zPCxzIm9UaOXW0Uvo
	kumY/L6JT5/TReBD5etcMOoUsdlhQQRG3i2y5NibEsXeFKYUcVCbcRLGxOvb0hp8
	zn1taouTr37y6AnLk0VFu7XRBXEv44Wi37IUgaN7MOR2OFfJBpqSnSGC4fmlVlcK
	RMdBBLPtuhcsZ8Z2dH0XcQiLnfgeTq41JC1oAXMNRzEjzi8DduCbklWjrhfhNLxJ
	neSrsg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu38yj3nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094741c1c1so897161cf.1
        for <imx@lists.linux.dev>; Wed, 11 Mar 2026 09:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245307; x=1773850107; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mElEGJc/QiRCvz5IlwWov/EZdnYuY229D3PB+C8fVNE=;
        b=KjKva2HA+MacVodHwm0Y0r4OM2TEJKGGCC+fNg7eqIRxDqNSWr6rbQQrj1y3KZydfg
         qujf569B+005Ro7kgQ5JKu29OshenJNTZQuD1sjha7kVeivo4mJAq5qaDgpaia7BlfBw
         RaMmukXVAB8aOY25glmvMknksm8sDJScSI1bT6H2UFbe1F60d29F93WeM64GFQifMyVt
         QQl+dTfU1Y+HmlQO+WTAL7QzzTsgAccMxTuIzCnnmm0mfW3IpQlJ47SiJmZhlQvq/esl
         /RrqHR7y476Wepyg2ZFndVMPN57kWayIPr8+s1mbS+HIFPwjpWEpCT7j2p1o45nrbXiE
         eWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245307; x=1773850107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mElEGJc/QiRCvz5IlwWov/EZdnYuY229D3PB+C8fVNE=;
        b=g/jbo/6KQU72oTdzvMfO9Pp/pknwA/sqPLy+mziC/lC/ekMD0MESVcIepTeu+jvlw9
         Gv1CKwDtvuo62SUm54NYXQy/2f38K0X0eLHE+2+oAheJw1TxTbC1tQi3HenChQIO3i6D
         qQsnU/pE+NmzccAAYA1ElpzyEYA0kEtgVTzv76Aw6Ikf3EnksPV+S2f/T//sSoCwS04f
         7IWuslnKQ/G5//3BJXTcG7SgpKTFsy4xDhTZ9MhmZMerXvCQsOGFFwanrGZFFfRliB17
         N+AzxdIFrUXMoN8BhfxNIIFLLXL36iMi3QGLwSWGTYBf3eAZYHql+7nG8YtfoCp39BJx
         fGGA==
X-Forwarded-Encrypted: i=1; AJvYcCXawnoQOuUrAB/m7bBw28DQvyF9jW8M93VMAIHc3XRHYMZCcOAMRmHckT4s3nFCNquLH78=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5Z6P3h7Tymqpn/e54nzfA4DyxJ37Q/ahXJo+8rhVAJVlsvAHO
	t8NKj6407rFolYQ4dzXTw9W//S4+UWahg8oBaAnfSW3sFQxAlVPPLyKr4IRAjyvMQz3jG/j/jVF
	7bYaSlEGdIo1P7qYwnGbSMahbGJml/7tHepJca9lAIMkybc/R0Wr4Wwo=
X-Gm-Gg: ATEYQzygpMr8bZzqegoJpJUIXxbB34T7wE7CuG9WBmsmbtvGiwrI793c4jLtUnz2608
	YHGWkluz+UNQTDllU/dd0xw0WWM6stBn720DgsClggIpBQDo2Ca2wWQ1pDYyVnXfXFIVa2hIwcv
	sBQMXgusWSxzp5zWIlz4/v6wDUb9x3LQA8vKQvKBBYToYL3Sh6DfZfCrg6qhTkHIFj9o2ACA6/D
	N4YaND6jr9xTCEsbsVcTZvKhSBEs5BW1zkTaa/Xc5WccnBMm0PjeW1SUNABKbwgMyS5vHU0fJ8+
	Tu954MKkgom0TxO/byWnr8frAjLgH8ICevuwb1NBCJM6dTA5UOJfE1MHahj5iPJw1qMPA1Mtqqw
	ZlR8oEFjh5aPSM+KI3EbR+HkGkjEVLgTKvgBdC5RnkgEG
X-Received: by 2002:ac8:580b:0:b0:509:cbc:1277 with SMTP id d75a77b69052e-5093a16af68mr40237171cf.41.1773245306984;
        Wed, 11 Mar 2026 09:08:26 -0700 (PDT)
X-Received: by 2002:ac8:580b:0:b0:509:cbc:1277 with SMTP id d75a77b69052e-5093a16af68mr40236581cf.41.1773245306490;
        Wed, 11 Mar 2026 09:08:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:08:00 +0100
Subject: [PATCH 04/12] ARM: dts: imx6qp: Use undeprecated reset-gpios
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-4-ea1cc09fba84@oss.qualcomm.com>
References: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
In-Reply-To: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=971;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CbxUYYhcGr5bAijJBwqMSOgztEvk7KUeq6ljk3HDbJo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsZNiu8NEgmuXR+CahaN5WfJ3wczpP0TVQ9YuS
 igvpG3jCT2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGTYgAKCRDBN2bmhouD
 1wRuD/9lbnGnZakL3WnrxuZFyn6eVTWDihodOeuH6JYoKFuJJppPZkn3YPc5C5E/2l9yt6mPD+r
 QizQ9iKXrCBCdyzTHbM1rwzJudPL8dMvyvLeFdD3pablT5aItj7fWsM02y76bqnnXNNAf8twDgn
 Xh8Kr8RuKN4tegOd6c1DNmU2HYJqns0yCP3ZW1ZpDF8sycGxbgBz3fMIz14rENv9tpLRZ/qeCTn
 bZap+dQQV/u1fFjudn5reRYtdfO4oqIz74vQeLgcKAOlXig9jlh3tBW7ek0UBNMS+1cp53FV39A
 T0LZPQc826ZNsbfISYXE7LRb3NTTHy1uS0lD/5b2xnniyfJdWJiRdLj6uMDkQwxjGHUg8N3fmUe
 8Q6ZrPLRkYfPOzEl1U7QbN6dZt3FwUiRpWJ7lgwT5xTUzS+jJhUMpqZWqr+6iUiMlnVPAXC83TY
 0l2+9udTaJZtwldg8c1F0JQvTTjcGhQqU9grMGHRs0f59jQidXRse9TRBJ0bY7ApfCwYSpSGQBN
 AGPwDVwzvIviA8jpmMfQiYsphmuJ+OOcKc7beTmIdHBNUuAJAks/QFTrXWEmF3JJLN71uaYQhvU
 LXvBHSn1LgCLjTisURJzZX8yplxAES0M0QiiWXmInsQr4g4JXRgwNiFK1CS4R0RcgohaqclTol2
 cGkH+XfX91wJgOA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfX3Y5RjT5/YYFk
 82WyhV8u6jbeT0M+sE8TCgfpqCg0ZR7CZGnm6TVY1oF1Tv0ml/pRME1SOC3uX3bXuCDGMx7Pq39
 RYIhAQYsSOdE8awgBWIGks2lr6rTWqpvBlTv2klffQ0MdRG9m+GyIDxqaRhb0C+44eNk1UAs5Qw
 FrkILRTRgtNLgyq9PDZ8ZtfvlBVEH1iYs0tExxEfZAU0HM/4q9Sx4o6bHWWEXsi+QfJZ0pY47mJ
 Zhj6SHeVae2bqiR9qTHcPMvxuCunJaqzyoeEOSF9FzzDRou4kSNhqLf+KJaW1Gz1PtJasR7VE/2
 LTMOcVC/2F87p5dJxTFFotiE3p6eueSB2qlYqEz/2zvX4opO0nvZjKRazTB9xR7wL3us3locWvl
 8zVig24ZbcKlef8pNnq7HfC7PNPMs2y7CD79vnj4PuicvTFKyyFkva4hgwmmBsDSYV6MTwMcwWD
 Olv8aB2fK8xm14e+RrQ==
X-Proofpoint-GUID: TJSHmzBB10wUGoVytJhOU7y3DnfSZJlO
X-Proofpoint-ORIG-GUID: TJSHmzBB10wUGoVytJhOU7y3DnfSZJlO
X-Authority-Analysis: v=2.4 cv=Cq+ys34D c=1 sm=1 tr=0 ts=69b1937b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gppIO-ZMk2ssqBZJiK0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110136

Freescale i.MX6 PCIe host controller bindings through referenced
snps,dw-pcie-common.yaml schema already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
add snps,dw-pcie.yaml") in 2021.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts b/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
index c5b220aeaefd..2eb84308f9ae 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
@@ -45,7 +45,7 @@ MX6QDL_PAD_GPIO_6__ENET_IRQ		0x000b1
 };
 
 &pcie {
-	reset-gpio = <&max7310_c 5 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&max7310_c 5 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 

-- 
2.51.0

