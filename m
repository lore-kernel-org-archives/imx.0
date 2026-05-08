Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D460175A93
	for <imx@lists.linux.dev>; Fri,  8 May 2026 11:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240499; cv=none; b=DLj1SMiNzzetJThIsNY54IuWGjMaJ2OEThxDNc/ULDMt/oXZ6Se8f8AC5IxhM+tS90tVJZ2gZKBN3UViACT0rLsgdJAFZ1gfLnfierqKrep3FPaTtQMxRbu1+JsQ/W5E53/iQE2654c/BN8j7D4xqsqyAjmvceKMvM8MmIsq1nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240499; c=relaxed/simple;
	bh=4icgvbXTmREACRNwNtLec/LL7hmKBfhtcMJvtLBARXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TyHQxya1buImUuY4ugNdvVI3geAUqnX9h18gwBkwfxwzhbqxsmDOhshmdQ+AgAXmAF3DwOUvYdtdcUGeQYvyCWPP2KY76+Uc7d8LDftI3QX6qoHJZaL1OSmXZLp5nqnWiR4ctpfy4mJ8IkhdeFzCXAnQ6boBWd2i0V7rvbS4b7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GROTOrvt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnBiV8Kv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GROTOrvt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jnBiV8Kv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648ADAdm2183596
	for <imx@lists.linux.dev>; Fri, 8 May 2026 11:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z5cLcgdWoMYt7Epxbuuba1uCp6kFzhol+vAL7YhruF4=; b=GROTOrvtWA91ya+I
	NIjaF3PW3PCAsgzZsy2oyd2C7Vd/4dk5qmzcPtNztQxDdFWO8IOSkldBjfZCmJ+m
	fl8XmvU9DK4jQbhlM1ABMg2GVID6sagid2m3qIDiZ9ofop60FiK2Sui6dKR/03Y+
	sFEe72L3B3yUxM7X8uLM5hmlEDgjHhiR7RomqqG7Dskj2JV4jMMe34EPlTJeIvOR
	NUa8OEln/6whOjFKX/KJTLNp6l/1sh7xM4UlSB73ujmissSmoklFuSmg/g+wWJTI
	ivc2OmWdlaAdm1Q0BQ5VyVRYK88ScfE9jlLpCt8SAn3nB2Kki/pLEz32tgA0tcSs
	azLRVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10pyb6h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 08 May 2026 11:41:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ebe2c596c6so328285085a.1
        for <imx@lists.linux.dev>; Fri, 08 May 2026 04:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240496; x=1778845296; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5cLcgdWoMYt7Epxbuuba1uCp6kFzhol+vAL7YhruF4=;
        b=jnBiV8Kvby0u0PW5It/SMxHuOP4+bgloz0ywntXDlSV/0a3RhddO2Wv3Rz/8PaD/31
         VVkiKr2qU+WdJfThZYHx14hX/3zhaeUtEhvNi3D9I3DEhvuP/vl/sfzSaGTca90+AZwA
         ImMGqPFcVYB3jAxckBW16sekv1nBUKOz3cnCZyYBMlBmG3edAQuxyjHLLcsocYhQO9vG
         v3vWQhcgz5yg2ipl4EqJ8Il0e0QsCbZzT987rQ9FvyRKcgnnsEoEAbkhIAt32qvhYX4R
         N88hfGSBEIfpsHV0C4gE67Bh7O0wpqc/mwzEOpjD3NBM9JHqEbjpmMheR/uyx0CKX55L
         dWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240496; x=1778845296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z5cLcgdWoMYt7Epxbuuba1uCp6kFzhol+vAL7YhruF4=;
        b=mbRLHTnshIVyFt098wCJOC8PHecWOJc5FoksQuUMjIK3H7cDCyPXsJnQZ1kQbvot6o
         V9j7bueL+Ub6PVnxbmhNqC+8bbjjfdC78dod+aZIuFwIZ8+yXxcvfNVPNlBSgac22hy/
         5s1q0R0goA7wOjS8RcQUmbMFxB8kNYXcoNaui9GT4GxwpB25rPyb0wl7J+eub+RJl1wI
         vvyypCDcFKU89m4yKHh4Fl0ap8g3g4VK0H9wmciNsMOFChsRYXHs1ANaA1j1qkjdh39K
         BMA1gCV0iJfmYZTKI90DtuA9te5h12lPRK1qtuJjftrQfvx6kmRCOU7Er66aEz4OFLz0
         T5YA==
X-Forwarded-Encrypted: i=1; AFNElJ9KUPHyGS+aeH4nvT3bPRJ5xKZJ1c/TH8DiWQ6baCUQ/8YkG+Oukebp3PfIr5bMiWV9nsg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYc8FDuC75WwUQAom+J5kjKTrNdR5qDVJaKc3If3nDDy5TjCHW
	/wYOpS+ecrneQhvr9w2IyvNUqZCp/3qAILpSRbhp+rZh41ZDTP5IWXkKytLqsbWCtk4OCfJ4U9L
	ySGuMOmNP8AAA+iuwnlcINLAMWAHeu+q+L/kjjRhmCKk48M9o0FAVtrc=
X-Gm-Gg: AeBDieuhCldOf6/PoDo5ZTrotevRaeha+DN52CXiCc5+2xD7tyIF/P1DFxFiaJfsdQB
	kzJUn/qW4iZkCKpB2qOibQNDT6RP7+PwUL9rVo+K/1cZ7eyG1rSD8qrOAcYQs735Iek/AGU9H20
	754/U45GjRiT4IeaK37CiS8etf4D55HtCiEJuHRAPyOGaqD04HwTJWdMMapF1z42/4XJv8vy810
	h6p5asMzFldtT/NydzC2jQ488WF9KKnV0P8kwwvQMo0meG6iSkJ2HEk0xF+ORpkEeapfhlXxFuy
	ZTU9ytbj/GWBq5YBZz1CSexbbYqYcRN7FJC1v6xImdjdCSa1qeATuHhN3W6OwyTH8rrxKHym7f1
	rhX67eyM0C8C1jdVPj2R3j3xZGingi+LGzYOFKJNoEM0gOO5xYUrLJMaTgCl37s09Xgnmad0+j6
	tvqfenIsRSUv+U
X-Received: by 2002:a05:620a:4451:b0:8d7:e3ab:4c17 with SMTP id af79cd13be357-904d64e8cc8mr1794330685a.41.1778240495888;
        Fri, 08 May 2026 04:41:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4451:b0:8d7:e3ab:4c17 with SMTP id af79cd13be357-904d64e8cc8mr1794325485a.41.1778240495351;
        Fri, 08 May 2026 04:41:35 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:34 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:40:01 +0800
Subject: [PATCH v2 5/7] arm64: dts: qcom: hamoa: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-5-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=1588;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=4icgvbXTmREACRNwNtLec/LL7hmKBfhtcMJvtLBARXM=;
 b=CA1/7Y7o0nrqBZMiJFg5zW+YvMWC9lI4uYv6wvbhS3Hi2zKo+2rpb1GtKXFI+XgOs67OVIK5S
 MZTOB/rA+OvAoRCv5/tiwiIWbm6/BowPi8q/rYzmtiQ8jdGcn9W9EZm
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=DZUnbPtW c=1 sm=1 tr=0 ts=69fdcbf1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=MjFiaTNPcx9fmn49iVYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: mJ8KdM88hc2HJQe7J9PB7RTVr6KoXvot
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfXzexstC2CQ84I
 PRd9u5XPecL8Rlnq3ozofaAF4sdNrpX8c7lB5cmd3WoHUMZ8RF8mL9SZieoZ2M9IwBKjrUeg95Y
 HkVYqMb2rtfVjQq0qG8u+NzNXc5BlimNj44aBJhNNdQpdXhrVqsXO8JKMJELI4GQgbpCK+kDkVz
 AlbI5UEPRbR8y2RWDVxtxHSHlGNMWnCE9Cond7dCdzdujuex/6l59dUITm6LWeTJzrCyw5pez8/
 JbkaaGqD8I5LAkjSJsf5/EnBMJEMjF41MwxQi/ttxjkyuKio2UisfSEf4/Pg5VkMN/jYj+SE7xh
 BDZa875KcdW39X055rDCuahUA6nKNZCLiLHdQUBg95hQ7E/Jp/eN9TEyuMXP7Okr8xMLChbZH6V
 IHiLFI5ciKhYrJo3L/x6Je/r2eLHdU661RlbTri7pl17InHc164qu/yyTHWMmyBsRzMfwyKj57e
 6o2oQ+Tln7UktmbSSpg==
X-Proofpoint-ORIG-GUID: mJ8KdM88hc2HJQe7J9PB7RTVr6KoXvot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080121

Define pinctrl definitions to enable camera master clocks on hamoa.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 086c94217eee64756b734f436f1f0b49d49dc582..235076c808e6f6b5f7861dfc5d2703ee46c6ae9a 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6462,6 +6462,41 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio97";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio99";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio100";
+				function = "cam_aon";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				cci0_i2c0_default: cci0-i2c0-default-pins {
 					/* cci_i2c_sda0, cci_i2c_scl0 */

-- 
2.34.1

