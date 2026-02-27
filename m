Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359B539447B
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 05:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772170228; cv=none; b=dhmlfUKumgT9rMn7WUp7mGhGhxBwgoegrilxZq5zhL1rLD1tZ1/ExrVG6wJhJqX/TBQc6jghOtMFiM1v5j0e2P/GUI36IaAE8Zc4DW4BssL5nUSClXc3P9JVCB3UEDLHQymNyfUbQb6y0q54fdWktPtNOU6ZdceW2435YkVNRsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772170228; c=relaxed/simple;
	bh=aQgfcz1YjB/i3xUfDXtNpad593tmxbzP8ow++UtlM5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rEAu8UjSu5ikfqiLf7+LGCVsP5G09LIGfrGhj9n3wPt0E0I67fdnFMOxAXXZJ6gEn78UIydH6SzUpR8MG5naLvIxIwayYgMYxDBi3aoYgbuIinfWxuPfmEsk4NZwQSATrmf8Iw5MNRx8NDyNx6j8kjn/kYwtNXExsEAk6wByCu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGuh+4E0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=krKTKPyo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGuh+4E0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="krKTKPyo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K76V2982545
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 05:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D8+2DDHAbEBXrW17Y32AaXMrRCjta1cm7TYgGHH2v8g=; b=KGuh+4E02b29G3iK
	uei2w9gFmGEF9kqf7+If44Tr0n9m5Jo7rlWrQwo5DXYlpxJ9nHmOoEG3V0n1Qk2F
	+N0aFzEj9FfuzOxFs+VkOzUwyWCDuargARpERKWuU+0uatLrF5ERzUR1WPFEqvrL
	R641gQlvVZHYgw1cX7BLf/Ezetm9wWCU8dDPOJ5ytjMesEILTtgcDfj6T/PLQ99Z
	Jxh3Afgk5W60Y8Y5UXy7MvZUMH0j+4YYJclKaA3WD1gpGMOWxeO8MPQ2WsUuqX1y
	k4xT66/kP+FTMZ+uxIyOWX1O38GkCqbSpzxexyCwupwjlxxkMEFAt/+kWm4Pqn43
	8lnaLw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjk2v3usg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 05:30:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8954c8b3d61so185944156d6.0
        for <imx@lists.linux.dev>; Thu, 26 Feb 2026 21:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772170224; x=1772775024; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8+2DDHAbEBXrW17Y32AaXMrRCjta1cm7TYgGHH2v8g=;
        b=krKTKPyo4fYECt/rQDvRjkQjyRgNEgIZKWnYL7tloQkoYej93WedCdNqJMpdjgA4sO
         mxTEVoeB4BC8po6Bld08Z1MQ9VQECGTI/aoHKuQ4x8OW/9V/ZpOYfn3JNue9R+0FfOEB
         LK0J9IJ+mcZGhTyW2PQM5G6ykU/wTqJwTc24dJr1EbLEGkYzXrU+0A7/pImolUGtvzlt
         AhGSJboEA3ZfqlUJQ/wJHq7xxJTsZhxZEP4ZTk1KAPFYugqD1RpHGN8CQTIf/wGiGsVy
         mGTk+HpOkW6iyS5h792eni8V3vvcLL1CNJ6mLPk3sBpiR3yfXUA9JC7vSQS5A5y9P4Q9
         zQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170224; x=1772775024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D8+2DDHAbEBXrW17Y32AaXMrRCjta1cm7TYgGHH2v8g=;
        b=pBa+u//+Xvq/V26JG0Px3pGhQR3i8szpI/wPEWU/NMzBSwKeujqLgfQEfVU7RsPxmd
         WLE9CTdVH+M4xMMbldpIXbXp2yu0Z9hGo/3RaYuGoZzgX/u3mwwqxaVU9P/oxVkEq2jJ
         kHkrm1+VRtpZO0awJmjwc6Kx0mLfzmWlwI+AQKdziKo0P1ny4OBGZYeo7WkdjxlP0uYr
         ilaKQHWm34WqchwgYMzEa5eaUGJ+r4lo6IRguy9vO1mP+y+mWsKPyjGVK2ivUVgHrWAM
         y5tVOJwEnOyUlotLaoYadN6fZcholajYF1THk+SYnTI9+VkJq/t/3TD/4pMdx6XFg4Np
         skeg==
X-Forwarded-Encrypted: i=1; AJvYcCW6rGrwqMYPFa7+kzFbdpe9+yLyA8PtfuFtVsh4ekg03tU1sGgis0MY1yojQSHvO46yqO0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZf5hl6sgb8Qga1nuYBYAGw0x/DEs25mzT0eZEAFfasXlFMzkk
	N4JEXUHEDXhULcT52UpzoH95sg5J9sf95iWXyEyjKSL7zlGDMSd5Orbc3du9B13m8UDjyWhbLAe
	h1ikcUQAp08kvUTsyMm5/luueY/wtrpbu4aMkZZ2riXHWSlICYDI4oLM=
X-Gm-Gg: ATEYQzwMFaYaBDGczZ5S2+1X57ip390NDKQaXeghUwTWVEyt0C1QjgEoKpojW2An7iw
	+H1UgKqYt4G4Z6XD+KbGA24NAIghfnUNqsFIZQxdW6dcbPAFheU3+h5TtvfA4dydOBDvxFqHovJ
	vLBIsYRfXzChpjXFhxIltDpGKDbXBjkfxotK3gaVA2zUktTY0s+c+SMz3cxNh8px3wdC7k14pyX
	jV9eAol4uXIM0nQSFQoctjPEk1uM2dg1aGNux25T919hylamW98ANG6TZOw9/3TSdB1eEw/5aSs
	bUHod3199UKJ32o2OUlkEtTds173h/2hDeVaHD5vtkpfGqdBoLiOjsW3E71KtW/PGgJMUAiIC3y
	axrI+XEQYelo1V+IHLjAE61xH9WHbiJ4dIrlYwVcebXCPb9ojdjAptZ2Sg14UaYY5a3XTxZUTPu
	sy9fD7gMLsebAs
X-Received: by 2002:a05:6214:27ce:b0:899:aa05:385c with SMTP id 6a1803df08f44-899c6766096mr72358826d6.4.1772170224363;
        Thu, 26 Feb 2026 21:30:24 -0800 (PST)
X-Received: by 2002:a05:6214:27ce:b0:899:aa05:385c with SMTP id 6a1803df08f44-899c6766096mr72358556d6.4.1772170223962;
        Thu, 26 Feb 2026 21:30:23 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744afa7d7sm36590121cf.32.2026.02.26.21.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:30:23 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 13:29:39 +0800
Subject: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M
 regulator
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-hamoa_evk-v1-1-36f895a24d8f@oss.qualcomm.com>
References: <20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com>
In-Reply-To: <20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772170211; l=1119;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=IYed/TsJ48NYi3YoYbst6rSy78cyZz0ZOFAmgBTc1rY=;
 b=wcDlf/QkDAgruk00v1eTPzarMz1jhDFufYxGfhLpm+N+2tOKBdGxcP8oE/vadjS6BrYi5JBJb
 aNQq5XBz2O6CeNBibWUQdjQeMjYGsWsx9DQ9sEo3CsF2XkVn/zjQChr
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: hSxDU0mLv0S55c1qpYaOBoqq2HIJhbLY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA0MyBTYWx0ZWRfXyO+HCXFD0+Ue
 IIMKy/1sMfngJ+Hwi+qsZChRrU/F8OYR6JfYuxrQWIqn8vOGuKS7m1TbHfi6bGYKHyfdhkpUX68
 1+NQ9eBSR7qOq6ilrxpuACWgslW5vAICsAJ6aWTPt2iIpU9oqQyKdBj1m839F7KbelloxX+haJm
 fcez6IXRm28OjTBqtypet8nbQ43yFXD9fHl16AB1NUY8oZNijdpkO9rU6r/fpm2OQSEQjcTFhvk
 YlCdEmovZGZayCh6OKIhRgaOlKTsAYy7OdYyYr7rYMfF4JiVsfSySHAdh9omwT+jC49bqj0YTro
 1lWfeTTDK0kQ4UJtViOmilX9bnATJhYFE+3ZMBvN1pZXataCDLefhS+TV5eHMOvuHSiIeUjmjP7
 J+edPbuno6rqQSL1JOhPLiHNi3etQeevx79DTK9mZzdpy0XfJ1XN9N2WfaG7dxRB9F1dyQhAEiu
 cIn2WqwvGDGL1a4iI2g==
X-Authority-Analysis: v=2.4 cv=PO8COPqC c=1 sm=1 tr=0 ts=69a12bf1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Qfmkza9QUpqA5zW9Gk0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: hSxDU0mLv0S55c1qpYaOBoqq2HIJhbLY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270043

From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>

Add pm8010 L4M regulator which is used by Camera I2C pull-up.

Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
index b8e3e04a6fbd489f66bb44a02aba7b9746f30fe2..5d9af325c931ebbc9f3f8261d427a31e6da090be 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
@@ -376,6 +376,21 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	/* PM8010_M */
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vrer_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &iris {

-- 
2.34.1

