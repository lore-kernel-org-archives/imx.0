Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B341D402424
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343104; cv=none; b=aLBLcHmqWmystR2zrKT9BOp3unc0JtA/FJxSImh0cHuLLwaiK2VfABgwqqATw9ekdJUJQk8CafhGczDqZhKQ8M3516feNsQtXzyzcO5uZncs5rrFnT2HsAbvGfEMXaHq44wusuHwcRj2tnBev+80894SotqcLyTjHkXEUNyO+Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343104; c=relaxed/simple;
	bh=okCFCbRAc+6noYCZhUa9P4+dnrKGsmwQbeCL9ESxXoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RQyiGBCif3ReooL6lIPDeFBm7A5daTRXAntH1A/HFv5ObWK5fQMCTCxkVzCLbZEqnScGa1vemu0n65mZ3vwpCSct42NYW+NUeqFYTJ3Szp3tACIfVCBkoiwyYO0z8NnlWDuNar+xaCTLhk6IzdDkT61DBtEopKDj1z+11PZPais=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/JBTheu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EzQtRo6T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/JBTheu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EzQtRo6T"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CJGMko4132454
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x+9XW7vfZaDu8NmPyNpd7RXAAdKnbnXlX5Wd8i6InOU=; b=H/JBTheuNdlh5Bo1
	WQ2iZ/nH5d9rg3IxdpZd0T3RvimYsq7OxnvSATKJZMT4p3DQfqKrgH+eFjwW6MWO
	CTT1z6ef4JJUpS60nEl9qXIBo5LjwullndRGEyCUflVubKxwGM89grYOZB3FzasF
	EA25CFylXTLx8ndlEhHg0fqSivn1/yW8OcbQSbfsdcALAoLZcCmNfCKfn5OclIKm
	OQ4++9ubE9dPks25z3RTnYiP4Mi0f4exUlbyZjQoMc3cd7zrzmQGuF1yLebcpdfp
	IeJM9W6sU3tg4s0GPcAPfSO1h3JGzXZb3Q/GJxJhv7SwU/mW3D7gD5CHiv4Ei6O0
	tWDXjQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w3awd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd81506677so764358485a.1
        for <imx@lists.linux.dev>; Thu, 12 Mar 2026 12:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343101; x=1773947901; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+9XW7vfZaDu8NmPyNpd7RXAAdKnbnXlX5Wd8i6InOU=;
        b=EzQtRo6Tyq//d+tak+q4mdvZvYZjXMpqIfo1LVvzD1CRQcDJmTz7QhUPPdU1mKuVhp
         YVdPP6vbR3gBzhUmrLMBwbOQlb00JlfWxA0VqN4eatkAy5Rk/PSFxSYWi2IysPBUJOJy
         +5Y4JPa2CByOQi86d8cjLo08InxdStEUVOrGaTJZEpMh9ZmZV+FSSmxheVVhy0cP6VVu
         khp4lOsn3xDKzKNGSCGqvjOHzZmYjxWJFe8zz+LR+40AWVdgPSCNVJ2912LpfbIrj/fL
         lSH+he6IHBLtDVUp4JO7OFp0cg8ztvbLY7psFgaFnkfYaGuZR+o5kzVTZ17Zxoe/slJh
         TO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343101; x=1773947901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x+9XW7vfZaDu8NmPyNpd7RXAAdKnbnXlX5Wd8i6InOU=;
        b=Egd/bfULTPAUpTeYwrLxSqiESw/4CHciV4l6iqS2bHGP0+A2tmdMWGTFCrIA+yHNtV
         rfd1KXcd9vJsyKXGy7zY6Bku9fEWgeMIjtbTeN9eaiaQmPrYRjoMQX0QV6OSxR2oMFvX
         hRWEk0+YDK5ZhY/+rQQfWbBgxUtRia1dksFC+d+KHH6+liuSh3hAD8Q0lt0hVZ+QLZUR
         BUN0OIgS8vURWLl5Eki67A68W5aJMrObbcPuF4JGLG4CCwfvYcpp8yIETGOxk4uPAxf6
         ZO1yc38KeBC7fBqj0mGgdQOp6OWOLJpfWcjhwWlr8BARo09Lml57j7HqGEznGClOk9Pv
         qkEg==
X-Forwarded-Encrypted: i=1; AJvYcCVkSdRY9P6vqqHYTzOZAfFHv31dunE75xxHO6ZrP+kfMqQsxion2pR6B1u8ANLPuF0UE1Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/JEdfO3p6OsPiAZerfSf537a4k/bEqu4twk4ypikmTXOSWpCA
	Z/keuMuj2dtSgA5CjTv4HxrldJ/fecD532+Sr/GG7mhccLIpzFbxaoo9fyZBiruwcedewFBVKlr
	H9myQAF3zNHwAqQWSul+eV4sZAdKFMMT5GfepEZhrMyHeJ/cW3RXWscg=
X-Gm-Gg: ATEYQzy7L0f16xMWCTCxrW7a3WtTtCpuKZ2hXcV3S5rmxahLr41YR5X5h8pt7S9BQYO
	NFDXz7q5EO8nvguVaRCD/73GhY1tv98U72r9tD3fPycTkKHywpk6nBtcNsdMpERro4hHYvLl3ds
	B8gfL5nY6kcKlawEqQFYfMSl+53Q2W3a19ilnE6fIp5SlZvvf3bmJ4yQkDSK8MFlwDdYwZbN1Eb
	WD9qy1RU4bxxWdIRTg95GS6kCjv75W2yD++Qtii4DppEeKdlz7hxZHKS6rO91trc6KgRwzLBf9/
	j+5ivpttpxfbfozv1eGJOyODQycFiT8MJgCCCxAKrbnd8/r7LLU55yfJjVlcc/VbKUEUK3niVLy
	0K9DXuZm39iDhSZpxungTDhNrVxQXSNPoc0N6FKCkBX3g
X-Received: by 2002:a05:620a:4d5:b0:8cd:b626:cdf1 with SMTP id af79cd13be357-8cdb626d117mr76167485a.46.1773343101107;
        Thu, 12 Mar 2026 12:18:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4d5:b0:8cd:b626:cdf1 with SMTP id af79cd13be357-8cdb626d117mr76163185a.46.1773343100450;
        Thu, 12 Mar 2026 12:18:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:17:52 +0100
Subject: [PATCH v2 05/12] arm64: dts: imx8: Use undeprecated reset-gpios
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-dts-snps-reset-gpios-v2-5-0d5040eb4a1e@oss.qualcomm.com>
References: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
In-Reply-To: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
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
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2890;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=okCFCbRAc+6noYCZhUa9P4+dnrKGsmwQbeCL9ESxXoY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFlucTKXuhI/+bUlAAr1ol5ZMSA3gi2hw+Pb
 v1q0d1r33SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRZQAKCRDBN2bmhouD
 1yWvD/94DlbtVJG5ChNG/ZRexVSm5IWZghRwXXrMlPRJpFNH371UMGyhXuJRmWraX2POKnKOmxZ
 o5MVcL2Qm0PMj34NiB4HwOHVLUDJ1FD8f5O472uKCq1TYyOAtbXfWOKmZM+uOu5vQQ5coj3Onx8
 7R68P9kX3NyBH/z+FsYMJdhU1pT3SNzCfC2UANbGkqT86RK/yXv7PORaunygcNn7+9Dw4lj2rUX
 rNKWD0sacnSTavQQSd7MUYnvTL2XMNt1x78ZKCuYL1EikboDFE/1u3TDkLKT72zBlUfNWt4jthW
 Ra43WA2j56Y0Y8XHDHO5zPqq0gUQo5uruymXcvZvSBXBrIuEgAEa8lvk556njXXtk3QKnc+Xaiy
 HX33sSvDV69+5ql2CNJxTJuR3A8rXEZj/45pm5AwEqDqk7e4Zq4/e1iQLoNimPUFShGEtKnZhu8
 rGwvwdNyWjzapRaqovk3NBdFfoCM5GktJfB+62u6U4ufnfGF4pCtVjK9J3VR3XEL28KBnhJozMj
 U+09+IgX+Ng9ik5BKEydprb28zo7lOcrImusTvlIYYDcRNJ7ALzr8vX7r8nuI2RgbbB1+CIJeYA
 zLdG/0Ve2qbSXUR8p+fAkPTCKbuhcbzvJizIZ8sGYU3ez7vkt7A2bUrZC+0EW2pyetJS9paV3Ss
 sWU9CNcuO/KuZXg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: ITb0v0yDoWnUPILRo7B5zrRWfMOdRekB
X-Authority-Analysis: v=2.4 cv=Cpays34D c=1 sm=1 tr=0 ts=69b3117e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=8f9FM25-AAAA:8 a=EUspDBNiAAAA:8 a=lgRk19EvD0hfQEPH5KAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-ORIG-GUID: ITb0v0yDoWnUPILRo7B5zrRWfMOdRekB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfX8WhVI7/eAqm1
 oue32+iGHi7IktqS58EylXi9cRitX245K9nJBSOLQw3b0hs0kRw2ad3dIkhKzTI3o9JvyhjwpKK
 BPKXXAq0kHsaObde3u4pHv5Wk+2wNvE1RjpeQF5cKmZgf+KJXjIK2w8K3d7VToc5DGvkiz4seVL
 2EmaKLL+GfIN3Lu61mcQgEXzdm3seKCpfsyTYkCWpnm4xBpAzcw7coxZRmfOcU6nXWpc9rJVQmr
 NgywHTeSV8IPnTFbgJw+w3AJRyMFr1+kKGs5CmCHFZjc8h2wkSWWYE2ClHjV3u1Vz/A/+9sYozp
 dMFR1g9+xI583zEWtLIhW+cNEog7dQq6BW6hINoyhW+Ym4Uj0/XDokOujuL7YHEruUhfYvmG8E0
 PP/BgjL17EQPGtvjJWvJ8s22ZYGUXxvioJAPUxVeLALW3fuxvIYlApwQ31nyovyGrZfIYnIVFDm
 TQNqdmXwCb4z9hCF8vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120156

Freescale i.MX8 PCIe host controller bindings, through referenced
snps,dw-pcie-common.yaml schema, already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" which is deprecated since commit 42694f9f6407
("dt-bindings: PCI: add snps,dw-pcie.yaml") in 2021.

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts       | 4 ++--
 arch/arm64/boot/dts/freescale/tqma8xxs.dtsi         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 6fc82b5eb58c..6d8a57ff56c2 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -806,7 +806,7 @@ &pciea {
 	pinctrl-0 = <&pinctrl_reset_moci>;
 	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
 	phy-names = "pcie-phy";
-	reset-gpio = <&lsio_gpio0 30 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio0 30 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie_switch>;
 };
 
@@ -816,7 +816,7 @@ &pcieb {
 	pinctrl-0 = <&pinctrl_pcieb>, <&pinctrl_wifi>;
 	phys = <&hsio_phy 1 PHY_TYPE_PCIE 1>;
 	phy-names = "pcie-phy";
-	reset-gpio = <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
index 5c68d33e19f2..bdd1dbc6b322 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
@@ -651,7 +651,7 @@ &pcie0 {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
 	pinctrl-names = "default";
-	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcieb>;
 	vpcie3v3aux-supply = <&reg_pcieb>;
 	status = "okay";
@@ -662,7 +662,7 @@ &pcie0_ep {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
 	pinctrl-names = "default";
-	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcieb>;
 	status = "disabled";
 };
diff --git a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
index bfc918f18d01..677a05b38391 100644
--- a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
@@ -407,7 +407,7 @@ &pcieb {
 	phy-names = "pcie-phy";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcieb>;
-	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
 };
 
 &sai1 {

-- 
2.51.0

