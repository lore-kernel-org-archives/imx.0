Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8353E171F
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 09:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934961; cv=none; b=M+9m1zfnUQQ7PwYxwqmlIkX75Fx+EIign9vjJtEda9a8YoCw6H3LlfEjZSn29PjHngT0UT6F8YVZvqaEvIuT8lrTNO024JQygEa++t4r7hPsKCEPW4gFr/64cjcMcjgOVdxYi0PIrHoTZGh3B9fA0vgTiloDa6v/t8jykEwaMts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934961; c=relaxed/simple;
	bh=T/77rBwVVX1NnOpvQiwPTXRSL9axwN7LYY783rOf818=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mDm5QsJRJ29DIkq+vuOErnklkJhKqrCBnh4jpFks9rqRHHrjjCTSOQXylEK7A88RsSB3KIiKhSbFtTfSu8krJBSj5P4xLdt9HEcUZTjAZXfH1lcSr+ZGaIMDKkICd0VeLRHvUk3qafoVH7P3799bTkM3oNHlPnG/KAA2yNgYCYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QA4wMyOX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXzcWuvw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QA4wMyOX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXzcWuvw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9R9PQ1122963
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 09:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UPqYujuhCNHw+HoasKyvOKVVzVHElhECYsLHzz2QeUw=; b=QA4wMyOXTHlPrPYY
	fmbDcsl12WcIp0j/1fnBKt9ju0ZslspQRbo7j+ChnOaGWHuurGRLbrQJrfNb9y+j
	E2hxYcJ0AJ/17yxnEYP2OhC36TKbFa17kjypEy0oCjol5/WiIUkW7N55axO3ta1i
	/jo30J60RtwFBaXfU7HWOx/jEeBY4z14TJvTb1jvCtgpdCN3y1t+Z9c+zGcQIdJK
	8Yp7GIFgqag4gvFZnzI11Oox+fOoZa3hBhbIlduyzm4dVn27r7vWN1AYx9VfiqwW
	g8x6XPJY9z4+w/yaRiYhZZMS4APJlJ4bOJZ60DG+uId5lG+AcxU/pjB8bA4NST0/
	kuhLKQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda00ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 09:29:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so2311762a91.0
        for <imx@lists.linux.dev>; Mon, 13 Jul 2026 02:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934958; x=1784539758; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPqYujuhCNHw+HoasKyvOKVVzVHElhECYsLHzz2QeUw=;
        b=MXzcWuvwAUhyXBqW3qJBabfbSEZs3WUsC3GKxWwqWYjtGwzzIgqNCsA+HGvxBoPkgq
         97EDZjGs9EsDleKJJ4VCoBPCDooV4sf/aqx2J0dHLKq/3nEx6W4WC59/SJqAPM4tTB3D
         wr9l/COU+43B02fHnQW1/PcueqkHU0Np7TWbjujA9qHjC5VHuMmuZz4rPlm9e8SAJbpK
         gIZ9sh9+N3L94+j0vOUF1ewqSv4ryHWILbQRuv2QJs9CBkrEnByrIYC8dpWRPwSnyHSZ
         5fzqpStn+59eP/LJBxa2EO6zO4XEDpV4Yu17At92iw8Cd4y6n1kKzDeiarDjg+2H4+2V
         6iRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934958; x=1784539758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPqYujuhCNHw+HoasKyvOKVVzVHElhECYsLHzz2QeUw=;
        b=qrxSK3teaWc0rbu8uIDKlxx1XvUvBNGnCODfivtwcxLtuLb63fHF7bQH4HWzZ7Q+Fo
         MWeGAm7PeTBazKTPw4QZP2/wpktkvlT9jGvTdIvBseyN5M/RMUz1IFe8RTSVm5Zu0veW
         m0oHFTvvq2TuzkJc6TJY7v2iAgpB8vZBX9vaKbMxo+v4osqiZ6g7kz6igqDuHyUBcW20
         qj9ScXpWWC0oRVxG3keP7Q7+lxnlRQ6CFrCmmtk4cA4V35OzcGaKMW19JgR7bdpH8bXq
         WCP85lyENHd17+BsdbttkQ0KtAxo1jTmS2ZGQ3Hy+jjPhJFzcjtS5E/Ju5xwVGHzEGbT
         J2mQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0cwxjsC7jxrSWBOq5BeL9yIMHXDNZA69Uo2nTZYsiVOyPl/tmJl6JivoFUqSefBGFsMA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0HwSJGywoX0DhZ3r6b3y2y0BReg1G1WN40mf8m2v0OedzznK6
	HyUW+Os2MJp507E7HOpU/1A+1ARiYvb/Zl4JN8mAckx2m3bn4p3LJJZ2OYj4YuIvGRq6MIxuT2J
	eLqAQ/xwdwGqiUnryf7e5BJJ7lne9bCQEx8W04/KNlLi4XKouyQs6W2U=
X-Gm-Gg: AfdE7clIT4XJ2aPVLdArBDojo0191Xie4yJOIK1eaY0vAvKeMG9lzEVv8lIPHMRmBkL
	20x48byn4JbrZeYyHqHByjdBPT+500OjY52Fli7m/lzbV541hmHrSpQhw11MCA6G449GesVyMI2
	9jfwwUdV+pNsJPvilTW4o9KX1v7ECjJLCsWdkJft5e6Fj1Fk0HvBXp4yrBGT+cAmGZ4q9okBO1h
	QhI/b6xB47aoGwtTwVyZTdVC/SEglsmkxB8UfR9ws7nTIEieYSby7+JoH/foGyFqmXUk/7KSca8
	rZyj3cOut1opTA+T0QSjz8SXjdQXtGBMVmUDHq5unzkjFo+lB0bC7E8Y1NC7vZGcHjIqithrh4r
	/nCytZgg2wErd+XMcqJjwVfyMVlPdvk7aCbw2vMzgzg==
X-Received: by 2002:a17:90b:3807:b0:36d:b12b:f57d with SMTP id 98e67ed59e1d1-38d15364aefmr13934323a91.12.1783934957764;
        Mon, 13 Jul 2026 02:29:17 -0700 (PDT)
X-Received: by 2002:a17:90b:3807:b0:36d:b12b:f57d with SMTP id 98e67ed59e1d1-38d15364aefmr13934278a91.12.1783934957232;
        Mon, 13 Jul 2026 02:29:17 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm47495569eec.24.2026.07.13.02.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:29:16 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:58:35 +0530
Subject: [PATCH v5 4/6] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-camss-review-v5-4-db53be15dc4f@oss.qualcomm.com>
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783934917; l=1547;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=T/77rBwVVX1NnOpvQiwPTXRSL9axwN7LYY783rOf818=;
 b=U6/UJ0ZuhTgT42D+LrPdvk+x0l9xbREy7lCdtIpjjzj7ojVC+DQMTPnJ75Fvh3wtLcFCoWcKC
 sDZmCvEJtCLBbWwZWcb9u5o5dodmN2XL/mIv5EVEys8KgJyKuveg38c
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NyBTYWx0ZWRfX1ePq5TgR2vwe
 AgTXFnUBKVH2zWL15kBH7ZtPu8Xg8FPmGviHoyotoULh2urTgvL8v/qLwePXvNPL3vFoXkXDC8v
 psC4K59LfFMAOTo4I+8FzO3ZzVMRiJM=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a54afee cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PMLJDkNcKfHmOO-cHakA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cp6iPXjBJcH4y2vdago6RrLW3HFy0LEh
X-Proofpoint-ORIG-GUID: cp6iPXjBJcH4y2vdago6RrLW3HFy0LEh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NyBTYWx0ZWRfX95LbGTQVJgxl
 UCOvZMD5ex7ni0lkxQi2ZnW9MMRA+fZk/Ro8JjXlFtIwYyCb+pAFkrK9eHPzEHV/0p9Z6RC0vM/
 b+a3ViTwmFqVc4T6VW/F+H8gfuSTrC8ouMT5NY3yZIdl6BugzedH2KodYKnEVcNooyHQBI0HykG
 jZPI87/vEbGBaClRxP5EqOfUz6R7URlDs0nqxAu3fIDq5je+M0IXOZOWWV91JSxlxJILf2ORMkB
 awZOqgZ5ttgpQeGxqxKuacijUeCp0e+bw8gd4wMciYDAE6C09B+MgBLWFdUfQ038t3XdxTnqMd/
 89hQfCrKcQ36assrqsQ8Bc6Wr6XF75HCHV87Z8yx4mWgaQUpxMl1iG9tlHtwuSiJ+vpgFXo8jLn
 lVPo0vQAfDoo1mg4OCdClhHlu91RB/ONMymrCtf4zgUWu6zRh2vxVeIt6ELRDGnwZwGY2Te0JZ5
 LjT59ABWj42OblbEw/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130097

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 18da1380e52acdd8813625eaceac796e342efd16..d87a87b3a23cc869d35cbb9c2f802d425c9eb94d 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -387,6 +387,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";

-- 
2.34.1

