Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB487361652
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 10:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472026; cv=none; b=gqPXms6aiY1o/I209UZHtR7aD3HGkZ429Cn7M5cUQZZnXHVkNVgqABXY3ihK2rY/+z83HhidXeXqDnYhpMh7VW6W3CdALGNxDG9tGMJwr3yyQNzO1ntWPh5midyRhWDyqwJMCmS24owVq/11Jhn47+Wh9WJGSdf50lXzfNv1Ajg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472026; c=relaxed/simple;
	bh=EUwITNGph9Sz556YywpxKThBBpgFxFypVVqI/HuOP1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C6sSewPG6+o3HZju3RRRLSJy6L1PCrNSPGnDY4hiAZbyTNBQtUYV4v87C2aRW6SQbdy8sZoBwySyMP+InjRs+3J7gFey6qTariX3Gn1osJeid3pnH5pfrpBEO/oeG4y4SJ/+t66nCZ+cOUSQtGgtTDxQNtQuyfwprNIAZyF6kHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJUfNhBx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gCU+21z4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJUfNhBx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gCU+21z4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6flnR1850956
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 10:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r+J+wnhjyG1N51NHWly4N6P+NOWErvlBDtOdGlcbqgU=; b=CJUfNhBxOo3pTxZ4
	3RO9aPIy1FWoIA4JcU/SRpJHHUjytf6O7B4S4+yYEoy2dQZzhO90ZraiU6+8t1Mc
	udl/2arYKyWRAnKczl6u1c4p88hus91WNjoIsH3levkx5WlVB/5L5cGajkf7nWML
	sLqJEZANkA1qQacK/4gecfSV9VFCP2O6mRBiqgjAcP0obJTIAPCjqumX7s86wHAJ
	HGEjrz2ButmdihkBA+ugqPoiY+KSTvN6qRyfhJmFcrUTc15CmH2MZL4i0tUi9sC/
	rgC1U+a1JQIkp7Z5d1OUoHptzl8HAdh9c3IgcgWbnJifq/0DmxWq+mAB2mbinWUF
	e1oqtQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bprej12j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 10:13:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a341ac9fso27844385a.3
        for <imx@lists.linux.dev>; Thu, 15 Jan 2026 02:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768472016; x=1769076816; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+J+wnhjyG1N51NHWly4N6P+NOWErvlBDtOdGlcbqgU=;
        b=gCU+21z4ebo66VTOOi/51BYRudeFPhNT9JbJ8VAalEq5kvsRWHrzOiuYu11b75tgUc
         3lwv04eKlFStTykwOyWvSTtyDKlwbWtoArcOU1zXPhVVWbZAxZHXzcnvKJlfP+tRVgek
         6g8uw7LlXF/LpaojA/qtWcWyBGFClGJpz54Xa0Fb8kCIwXlojel6fJr9aAU2CdvxX6ue
         cFQe8P5VGafuMbYgpsSq+rL0QNEcftZWUCFMw/BppixRVimn3cRmb/moUzAd08RI9xdj
         IX/jRkJosEqtbS24/NDqhHNy6omNDHvVltzovDXqgKeHWTwQmT1O7Lf3IsembOhqwKI9
         qA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472016; x=1769076816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r+J+wnhjyG1N51NHWly4N6P+NOWErvlBDtOdGlcbqgU=;
        b=WBYONeVjsPWSEg2wCeilPma/oh5fsq+9G7XyAevHdV3dNkCJNZKQQ8LIBGfrPhTBjZ
         llXF4luz32wZaGmrwOCAQOPqBtVnLR9Anz8Vq585JB9SK8rGMpHZeKdLPgHIYewoESmy
         5yzjJKutr5bWlXbDH47K0FrFNLROgT/o6G0bu08K53QmE5eF9IaVjZpQstKApqRjX8R1
         y1/PbiXhYFqo/j1G3m56SufV/04f6E+lpvjS4sejZMsnf3NA1g3EGZ0PbQIy8kTzbWhW
         BKARsfXZAu1WBTxsnMtEeYBF7Gj9JQAXNNfKgxhmU7SAn+qkg4cpCqj7xKjBbD4bsIf0
         qmJw==
X-Forwarded-Encrypted: i=1; AJvYcCXQtFJiCjc2EEMkNoFn2PvXrRIi07VpGkyN+guYaWQHIqdvJVi6Cc5/oTOiBeIEhBtqbk8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLI/6nCZLk00HU4cbO/kXoRYyx45HP6Th8z1pxVk48q3OGm1zZ
	gCLKziES6EGVAYOU56tOSVAszuCxoDD/Pm81ikhJCxNqGYuKvcikFZvo/fKZJrXycnqV2KSVPZ+
	SiKlkBNaXMIFJv+6xlQ/6WeRO5U8A7tsn7GfWn6lL6K/yQ832qyttO73x3ZW2aBc=
X-Gm-Gg: AY/fxX6fQyAGQbcXfhQ7BZ9o5h11jJARFB6OOvm8d+sGC1tW7IY9M0SNkssi5NbNWt4
	6O+/z4LtkP1wOTu0Ekl+GgXdB7nq3fWHYDNDRAH4JlIQtKAQqdMacTsBXVf/vSlNAwGQUkYDFeq
	0z/043XUlmFO4v8aumkjAivG31q05Jc8fCsb3dOWmtvMGMP3hQi06k7zjY7Y5flgNeL3K005sOy
	qhtNUi26kP7JlffIpMshLDSo0HHtxGM87wVyyAVuAJtODASqUGexFWnM38MQOy2KlDa3aBCAHvD
	lyTIvmStQ1qn2LKbYOI+dfLZes/qG6bYE0Ih4O9ZFF6DckzUWQtXnjw7BFWsF8wR7JYLQPXZ0bS
	7Eal0AAYRyzzNSkVbex6HmYfP+hV4fL05y1Zz6AR4M97GJUsPCnWrA/wrolazAQC8g8odpdduwe
	tv
X-Received: by 2002:a05:620a:2552:b0:8b2:e922:5297 with SMTP id af79cd13be357-8c52fb1ccdemr819225685a.21.1768472016116;
        Thu, 15 Jan 2026 02:13:36 -0800 (PST)
X-Received: by 2002:a05:620a:2552:b0:8b2:e922:5297 with SMTP id af79cd13be357-8c52fb1ccdemr819219585a.21.1768472015581;
        Thu, 15 Jan 2026 02:13:35 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772340b9sm199959576d6.26.2026.01.15.02.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:13:34 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 18:12:40 +0800
Subject: [PATCH v3 4/5] arm64: dts: qcom: talos: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-sm6150_evk-v3-4-81526dd15543@oss.qualcomm.com>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
In-Reply-To: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768471975; l=1538;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=EUwITNGph9Sz556YywpxKThBBpgFxFypVVqI/HuOP1I=;
 b=0q1i37h0jVD3ntw9Vu3U70sABycxfu87F4li7lGcRJwkx/MEcqkj7wdamB2OCdQqakoNOQgsG
 V8ZIfTI3VktCPlJ3kOvcr4OtTPhZwG8rakNTebLe6U4d+JV39oMNoNU
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfX8iNBjAYLL7Oz
 KOCFz3ahHvC2q/S8l34e+IVss5fzQvyk2MKNUemmOqV+8LIPAv3xyKTnG3EgNdNCKhLMHI1rUTT
 Csj80OJtcDO70MZwtMKiYXXTR5NiW0ldQVoY4Xgu9RZ8LmPN3BLf9Pso4b053wFtDJ8A9loTPcT
 2TzdEJ13flNT7rSWPEw6MdxnT4QZu8x9//GrkSAhhUrfYqrYRFA5NtXVBGNLQcz8NUOiI+gUY6g
 MjYqfho8gDYAVyqWjLzJzFJToZyQdKeDmzWeeykmRf0Z1O7lyd0UCv3WTnCH0L+fYvbdMwX3kzc
 HPZ3Lu1frpdW+RItm56apOe02PBWRD3dCw6zQhlkVb7Vr7j+20wFyrXYNdWVwruBrF+YUkdnyv0
 vRx/cgpvmE/6Hl/bCZQZVa7ANwruNQh9o7588FmMU9t0UccP4tu1fMWkHmnOrjhbGUc/jJhJm1o
 p0is58EXTLwzJFUweIg==
X-Proofpoint-ORIG-GUID: BUIgEKGGf481B_xH1xvkd8S4atSx2YUI
X-Authority-Analysis: v=2.4 cv=Rc+dyltv c=1 sm=1 tr=0 ts=6968bdd4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=tfCBMw9KTM5U2-pTabYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: BUIgEKGGf481B_xH1xvkd8S4atSx2YUI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150073

Define pinctrl definitions to enable camera master clocks on Talos.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 162bbe353b62342478885f22972a816f1b60d820..f77c7faa97561a0a95974de1a39cc4ba0e43f663 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1554,6 +1554,34 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio29";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio30";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio31";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci_i2c0_default: cci-i2c0-default-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";

-- 
2.34.1

