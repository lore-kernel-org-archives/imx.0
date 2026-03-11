Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DB43DE42D
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245312; cv=none; b=JkwqqhYdd9Ny9f3He9okONmJpsz0QW6aiVySXiWasl7GPFQJdgEJ6yfFD264VIpIWiEHVknUWMbNCuZNv/E3NKAwLihEYZpapAJ44NsQQ/8RNcjtyn2Sp3rgSyhGCL0K4b0klYI2uCRnjUYwP6NyxvNsFe/tU3d6lvg33JsYZzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245312; c=relaxed/simple;
	bh=OOkLDhK3JsTYE1V/32ZvYJef0A3NvUMo5Dy1LiBK+q8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fqXgeXfd5CCF9ORbbFeovWDqfY/cMswMq8XvQuefoM5t1NkAiT7EmxpCmGHq0hqN4TS8JJ6w+dS6kILxSwWA/lqHupqBs8f2lGgdLtBBNMDC12Z/yj/DbDF7LuP6mBMBcbFtbypzBtT4Etj8By0xU1KNJia9i+hMYPK9F2+jg9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Of30gtOD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C3bh3+MI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Of30gtOD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C3bh3+MI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BA5ZlI294237
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lICmcRczp7taqbCRzngMqOPWmAjXGILM5iRx7llg7dA=; b=Of30gtODIzQXCai3
	cHhcVRdvElDj7B4VL9w0q0gJHqvePhcP1ULP30unzFzgy6QxiMa+uQlQLGSssYLX
	OrYL0jhW994HYmjNdzpm3ZQZ8xfxG0WVtjQOB3Kgn8oFd9GaycWZnJbW3sDopFvJ
	roMX2V2Ubn2eWB3qqNhNU+KgT1aNmGScLv/DIYDeriBnWCzi/CcCZjoSl6h8Yemi
	7fKyDUCXP2mKtuv8eMOI915sQcDec1HwPxS9xIuZwxPzmMByAbtSZNwTFNr9J3Y1
	nVqThZrkAzNP4abnGLVMVuFS0sA+U1PdB9JjL00+FrjNLRJY3XTM621qJF3d9loF
	VQTSqA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu6bb9atx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:30 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94eb58770d2so16853018241.3
        for <imx@lists.linux.dev>; Wed, 11 Mar 2026 09:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245310; x=1773850110; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lICmcRczp7taqbCRzngMqOPWmAjXGILM5iRx7llg7dA=;
        b=C3bh3+MIyQ84nbvSX4LW4b0ozDcpRn4WsCDfRdmrixerCPfx7eE8DgbUKwr9OeFKhV
         JKsQ0Nxo1UcT2tTWihhePjQ54ShfVfLuuk4F3M0XpK6niDCHBufb7E9jqEW8vJG4J+d/
         dUu7BBicWidVGcPCLNcieUpUcrP2vLIL5PIZvA6mWKRyLPDlTyzmGTt8xL1TSXaWGIc+
         y/YrgXBWxVa4oaVQiW7StpnMeY1ZqB9rumVEikqw2ASL3eF1iX+lgZ0gVrYc2aigLTfj
         Wz5TvGsPL4zHSX54R3iEe703sYTrAK2EYPM2hRkgkwkw7e7rzG4/VdqDJ0b3ms+LErom
         RA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245310; x=1773850110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lICmcRczp7taqbCRzngMqOPWmAjXGILM5iRx7llg7dA=;
        b=Vw3EeGaxWHWcslQ0ifUYv2cFPJNdpA+seF6duDHUKx77tvAope+Bvgs2Hz4Xb2KqPI
         AXDER7xEAflBeytc0HBS3R9qnZiK30FhvUi+AyantufCC0acDu5SuLLmchJ/ZYWFHFUs
         pyREFX34B6Lp8d8m1DjTvvUncTVym7RpGn+EIOx6S9+7wSFG/0btbd9QHk5L2FQP6lgK
         jjfgrOzeRLReC3e8IYAKbhk6Cclr2/D9OIREaaT+76mkVBTAACmgN+L3rqho0VW4SMTL
         hKwoAc4m9WmXboCu5GTy8mQcadV2FtfIWw3V11kRyxCYwsJEsBeqA751D48jU5f2Bpgs
         M0Lg==
X-Forwarded-Encrypted: i=1; AJvYcCW5PFKwOCzRFZ555kGJkhS41FQP8XYdMVJB5m7U1lqM0MT5ZGag5E+MGGbKrM6U2Cn7NP0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpiIKn4AOYHrqlk3HNT5EqhRTShMpnO6ESSC3WG6vuSQV2oFVi
	xfZaUn5JX4kwM+Fpi5lGHTS5RxCRLG0AV2U2t/AxGl3X06iZHXw6RV8MV0Xw/V0snNctHH79GNP
	MvKp5JFb/3kbxbwpXTD+cZ6Z4XVKOOqiaiR8+FGzJnGUZANTJBYey2ZQ=
X-Gm-Gg: ATEYQzxtoYJ1YOqcJl8kTPsmikGs9nYHe73KOu8fyRp2vo/M8eFKiPYVB598tjLWEEW
	/ydIlRNbFi9EusVxpavPg8e2nikX/g0G/4lbwiaqTdndc6vyH85FlfQZ4kUYON6pkoEfBBN0Oo7
	eaxovarJSG076SG8le+Ofx5qFK0JUWmRWs/HOpfvHpR7QMA4pISRnVwIBGdYgaFher1Uh+laOY1
	AltDlAIPLSwCfzoZ5P1ljPB8WOMW5ATZctOW0udMX8vMp21Vc1Ecct7tCv/flemdbPGfF60qSto
	aHO4ud0jMlKvd7Bd2fFPp7lP5oVc9xTVHkADWwby/4DhkOCdM/4nM9rBBIBImsukM0/Cv5Aig39
	vFm5vEFz7wsk5IDU1HC/aXd4Ij6uO9kojy3vRvJrBWtWZ
X-Received: by 2002:a05:6102:cc6:b0:5ff:befc:6769 with SMTP id ada2fe7eead31-601def32261mr1232121137.19.1773245309813;
        Wed, 11 Mar 2026 09:08:29 -0700 (PDT)
X-Received: by 2002:a05:6102:cc6:b0:5ff:befc:6769 with SMTP id ada2fe7eead31-601def32261mr1232095137.19.1773245309350;
        Wed, 11 Mar 2026 09:08:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:08:01 +0100
Subject: [PATCH 05/12] ARM: dts: imx6xp: Use undeprecated reset-gpios
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-5-ea1cc09fba84@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2223;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OOkLDhK3JsTYE1V/32ZvYJef0A3NvUMo5Dy1LiBK+q8=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGmxk2PIVXuRC130iHSJs1+ZsAOV5nFu/np6qPXSB6xFzMWcj
 4kCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJpsZNjAAoJEME3ZuaGi4PXYPoP/2WY
 f1UHu6fqZtqhj/8R+2xjVUdLFhZGTG3kTBK8piqz/Sc9VgyLqaS8VtmzYizmNRXEBQSXjKI0Mlk
 1veVqdAbR2fSegGbQOd/7LmktLkg2IP/mGff9tyU/ZuM56WmoTt5RkMtYF2sSJ0uewAcFi3Kq1Y
 0Ya8y0pWqrIxaQsHJDIX2kZlaF++nVd1MlII/VEIiqcRSCJ1hneSfo7zuARbh60AsNbn64aLHJK
 V42TSePkcXBU4DhBLYHhV0vozubGARPtJuzIJSMpKa4r9+O05Blo534xglMGFjdbpccldV8oIIW
 gdJj7+4SXjaDg2sZVA+i6ClsjTsvQ5+0Lz5cXrxHNPeqfYCLg+M/RAIeeroTZJxT+H6pspe7syb
 2pqzvBdq7HhwVMxRo3cmThzFsuM2Dcg0cDy9+zr8RyyZUeXkaQPnE+Bzkkp8GAfuQujyYA9pFeC
 l7Scopjn9TIQ5bXtcPLElJ/0H+e9d2HxbBQGmYi6mlmFHl8+Tc9qaPh+99sSatMjlrnKotid0ch
 ZYJ3JaMcz+FrO2JguE7WDaitlOsu2GRosEA306IQbB1KF5fRYjmTxxrMSBPmlojaHVXP9vljuRF
 FaUbzL9BCah6I9Dx1TO9d1cR6vG81pjJ8Of8WZSATWXAY3YEQlh/g3Rhfn5kKMpdhjBUshgmPwg
 q7SZZ
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: K7-mtbM4mNcgAwWCoDlIFF6fGlZacnoN
X-Proofpoint-GUID: K7-mtbM4mNcgAwWCoDlIFF6fGlZacnoN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfX2ZaPLsI7YqLi
 E8rusS2dnjKq3liUn5ZaR9YeCsywK6OGPEKWyPOz3PpoE83JUKUMLc9P2gwJ0pxqFokqQElIdhB
 VOcjLymM12uFTADlnJrH3WPwHTJoTfiKQ4WNbMWyJyApSVymQw1VajONoAZVs8eZhsZZbC3hzrI
 WmSUWNdAe+Y+63dbSi3VHaS68UTpM1YaBsTRt0t5x/Ja8TljxdHiufnyQ0rXDv9tikWVr1LTRlX
 0EcQP2oglrWh2WQG2elI5fQh0l4Pbcsu9rRBINqWtfNCI8g/sRj3Zw2Cog1LiWKinXx43Akfhwz
 MrpNz35/ftoXJKgyva9uug393HtDuEMqNXfvbLE/RRwXwdFoYSnuSihNi/T8d0voWER/wzPlNCn
 jbaShEoBs6ec9EpPk7tfzRZhOQ1XHXCikg3DiEek3+IwfMTuS9JReJ928DBgk8JD7Lfm/qXFYAf
 2lo5+KpH7fO0IaJpluQ==
X-Authority-Analysis: v=2.4 cv=CKwnnBrD c=1 sm=1 tr=0 ts=69b1937e cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8h7fRtSIOQ1pb8j5ki0A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110136

Freescale i.MX6 PCIe host controller bindings through referenced
snps,dw-pcie-common.yaml schema already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
add snps,dw-pcie.yaml") in 2021.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi                | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts b/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts
index 1c1515a854c8..6dd382cffa3d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts
@@ -224,7 +224,7 @@ &i2c3 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 10 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 10 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
index 3e238d8118fa..11e8efcc1fce 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
@@ -282,7 +282,7 @@ codec: wm8962@1a {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio2 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie_gpio>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts b/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts
index 2ffbe2df4776..6dd626f15a9e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dts
@@ -499,7 +499,7 @@ MX6SX_PAD_SD4_DATA7__USDHC4_DATA7	0x170f9
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 6 GPIO_ACTIVE_HIGH>;
+	reset-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;
 	reset-gpio-active-high;
 	status = "okay";
 };

-- 
2.51.0

