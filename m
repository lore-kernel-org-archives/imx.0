Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE3941737F
	for <imx@lists.linux.dev>; Sat, 29 Aug 2026 19:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032526; cv=none; b=eLZywfHdCVlysxXVx23NMhkGJ7xTigCCWitp+IkFPOHSf/Gf4YkpQkGPjfCme28zImIR0cm9KlM4SEVzJmTjOaGicO+bQkwsF0GKMxwX0DnvbMiD1K+QZeQyqVIHyIeSqEvBsph+YljJgSSFxspwxE8zhnJPGoeVeEBxsqOuXH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032526; c=relaxed/simple;
	bh=w66JHtaqYu6BtNB8TaZPdSDZZgYslAu8moQz0zGwRD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mJHg6u4Y2olBPWq03DVdZ7+Qi6TAIFVICtzTN9Ad7gDxM+4QA4jniDhIRO5GSExmpO1QUbE5psJNVYU7LQr+9mdggKfFS7RnM/IV2919ShGnEsbO6P0lsDV860Rx0k6n2m9ik3M9tlBlGzkJiKpAGdAfVaM6bPPr5hX20zXqit0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeU391y3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+JtbZud; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeU391y3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+JtbZud"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TIK07E2021085
	for <imx@lists.linux.dev>; Sat, 29 Aug 2026 19:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UE0sMOBybnNkYtc0us0FNHcXyb+U+7zgcvo
	3E/nh92M=; b=WeU391y3EN2EAeWizyqkPS9VYRMrMaNbiAj1iZtZQ8YwMfV6c+g
	tmWEAHFuozPD53FpbZrgWQZ5R9Zkrr4Aa1gtPEbnNSuLuScG7MQtnYnRjJavOaOf
	haOqeJdQCWRelvArqRENAKjM/6+DMPEi89oPoqLxWIf9SLzNupzGSOpVeF/rcStZ
	hf/EYrqJM1O5XcLILqDeZHPHjtGrKKNz+kcioyAqGUWN38e5xQYSNSuEiI9H9O8o
	Cl6P1HsI7idBTp0cl68SJdbHTy23TjxkTAjHrpkEfa/MwobotvqRlWhLhqsxCQ2V
	B0a8mk2eeF7Bgq3Chi04iLHOpERke/5Do+w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6dsj5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 29 Aug 2026 19:42:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so42881761cf.2
        for <imx@lists.linux.dev>; Sat, 29 Aug 2026 12:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032520; x=1788637320; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UE0sMOBybnNkYtc0us0FNHcXyb+U+7zgcvo3E/nh92M=;
        b=H+JtbZudFP3uMQKNZcTqsu2HWgssxhaB8Yp9kkcoRV8k7FZ+l04Vcrvzh0TuB0ycRA
         jjeEqlv8W2ySvOqNbo3xxYPo79lmkimtEgttQh7bgNNqZr6WR7A/27cjj2q04eHiwbYZ
         U/akxgXljQvCoMDvBV6xLAcLtUIR0AHoV0PF/hNcd1kh0AKXacs1t9fx10z7eJQGJKsL
         Uy2/9JvQ4OoHC0iIw48DKYcds89moeQwCLcRqRQvtcyJR2JpfJdu9zbb9Iw0kn2Pqd2P
         1yUkUsRkYUkkypX8dnh8nW+pAA/HcBEvppTTbssmzGUDkXei7r+Hf8UdyCJIuIIIl+RN
         gNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032520; x=1788637320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UE0sMOBybnNkYtc0us0FNHcXyb+U+7zgcvo3E/nh92M=;
        b=aDSRlWLvoUZ3UE9GfqPi6nsmpFBrEgEaAVOsNQcUn5HXehDupSfYyF5ZzlGdGazKS8
         yHsj0anJkXfzWYxJM8BO6IVWkcIwtSQ4BdqlQ2Y8zALiZV2fGkfUs++G8utRRl0hNP3D
         qrCIpA6nMrNik3eyfNYd4PgLsDxLBb8Ep0IIQ/6V0PCaYGum0heb+r+B136UaQldbVQU
         m/VBCMoDchyB3nI7xyIU0Kn2uq8SlnlNoyrURschy/Zv5vUzFqF3djH2APWbRvmZd/F1
         /SPYOFRV71AfG3ZP/4vfmGYYlQ6JkMyHCE8B42En4YhBTae0ACVJV5OfL1b0o6OE437c
         0/xA==
X-Forwarded-Encrypted: i=1; AHgh+Rpc7HhuwzQ5ClVc63lLk6nbExJYMk/ig3Y5PTm8+SarE20H9ztG2TbfSDOMGYKu82T3Skc=@lists.linux.dev
X-Gm-Message-State: AFuF++nM50ZXkIrXe/6b1AvdklL2vSntxXR+qgVXbD5y2VYDdyYTNzBg
	L2W0VisPi1ONGpzaidSXm1gNwISKaGFNsTnWDzs/cLLg13zQmw9yIK2PU7hFjQV6iLlakPLmnaQ
	W7e0THdSd6dkzGZh9vKncZtUUCvTZ5kr7/+txK7LebNcxz3M1rIsY7eU=
X-Gm-Gg: AR+sD11yhzfWs2ZtB+/YR1yetP8B8iTba/hrVOOuT3whu5iGaAeCKuZV/iUYqJY4SFT
	YBHyK/H/cYSxiILwJ60SReXG3cWtseMkMup7391N6WyMuP6tUQgvFVzhK9dvQZtE0AMcNYhoy8T
	Rfsu6aAwH4eZkhQfMi6Z384a1HwjryjHu8//QtdjAHnKKQuqHE6Lmg3+AZsaP+2xpHi45UccuTh
	XriQ5jvVMEMbLrBu1NoKbBWoEgDK4RUspZA5zna3dlu8Jjj0JEhzhxBEcK3P5zG38H84f4NCJbz
	c1rWyi5E/1gbV8RcOqEzh5ggntFw9VNmVhBrLYu7ZQ9HuDZi8JyrRQF+S9PrCzt6hOlqM/SyS/T
	zf2qhAo2WUpeBFWE=
X-Received: by 2002:a05:622a:858b:b0:52f:b9ad:9dc1 with SMTP id d75a77b69052e-52fb9adaa2fmr158668581cf.20.1788032520104;
        Sat, 29 Aug 2026 12:42:00 -0700 (PDT)
X-Received: by 2002:a05:622a:858b:b0:52f:b9ad:9dc1 with SMTP id d75a77b69052e-52fb9adaa2fmr158668181cf.20.1788032519645;
        Sat, 29 Aug 2026 12:41:59 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cc9497b3esm109116615e9.5.2026.08.29.12.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:41:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ASoC: dt-bindings: imx-audmux: Replace tabs with spaces
Date: Sat, 29 Aug 2026 21:41:55 +0200
Message-ID: <20260829194154.108191-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1317; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=w66JHtaqYu6BtNB8TaZPdSDZZgYslAu8moQz0zGwRD0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzYDrucOEqKbgwzMI9GFk+bfUoET/OAaI0FuE
 1AwPwDyxwmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM2AwAKCRDBN2bmhouD
 1yTxD/wKCcZV032FBhJ4DJlVj52zDbEY6vtEQN1S4V9nAb0+kVofU2g7A6V3jNORq72dYl2DOJn
 3PSXvU01Q9j8UAWFG3w/tsec32sPcJCr6jSq9KH3RZwujUqV9JQGgnNLCrblhLe/D7/FLiQqMxM
 sRgXNWFUza8+56/+Yp4tz2nkkkbN4Urx00SaVxdeu+CBAtB4GsE4vtDdx8OJ/B6mt4/jvJ3b2cU
 RVYz7quvNf8Jq1bI7a9Tx7l6SfFrJ8kspS+K6VboYo58UAtxsQ8r+dnuYMf+jrC9Hqk18QiSqnM
 l8FfbDE9EmNt0wh5uTsD/k/KgwBNzMW574Pkbg8bREwntzgSl2+jtxFA3jC3KGDSWH8bm4Du+iv
 TiLa3FDw1UIVExBtxTv1WtmQ/dKUF9dy5rTZPnjzYRp0iqottMCyK45pGv4bRMnC4/f+/gihsZY
 M/0h4BeZzJWe5K1kHF1mHXYU93Ag2u+stShAyjLkfKjgoI6G1q/Juv23mTiv+6sQhZggHSp4Osh
 v7skbiV9MZZV0SeAxhHo1dzNLKHcazp1GIE6JLgCXo45NdxiCxx9sOLfeCPR0M+ejE485U6c467
 RqEfFbtJcuaro89VgPDDLEN9V0zZNFkX6PDHCpREw+5GyKf8VoS1XbxECY9aVh/kbQQFHP4jOfM jHVBKmsQ9gUpG0Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX5X3i45PqZ2a0
 UowJIwKxQSG8z+gwQx1zMFohYyr715HAc2d0nws8BNKpYUX6D/EyvaQdPwQma/Vs8KnkeHywzDV
 OMCwVCp1T/baGPi5XeyZqGM7EWUsDK4ynzEgcdxyG+9XU/OkwSWc2U/5p8I6iCqxaObw0lk4eqy
 hLNjt1g/bb0vWB5m9vUYOG0Ca8Xr6kYiPyU+ve9gbxi7CmBR1evrVjoYPlHCCpBv5Odcxrp7riU
 B8eF1jVlgcX+Vzr5K/cEq5JHU0gRZ3hx7Dr/elRQPvuV8CP7p+fuzdstwEWaI5wZRJWD8C6J1KX
 DgU/wqHf93fl9LummtkjVi8nPvoNvvfKHWp0sN6dnNLtTLk/ga7yBqMs6DktHDlk5tDs+2U97Zo
 bhZkX3NrzP2vGRq+S9ccMUALVyC55EVk1RXWguBSaCM/fr1ky6WA5xbmeRar3ZwKE7592xxJ05n
 oybGxSzItcB5Dtw/QVA==
X-Proofpoint-GUID: 4k7KdaVfR8Wq1bxYkmAkAHxvmoFFGMo9
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a933609 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=i9mLyMywaSABm-nTGLoA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfXyrjmXzwktBVf
 gNSqoItRT8jZ/cx91T8ZllgafQuvfM0ibNsTunj9DNjzgwTU6nN2XIYDgGK4OUmXoiTjECv1K1k
 Mm4pHeIZ8OKiUCrgKo+1zfibfhpUlhs=
X-Proofpoint-ORIG-GUID: 4k7KdaVfR8Wq1bxYkmAkAHxvmoFFGMo9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290171

YAML files do not use spaces, even within the values in DTS.  No
functional change, although dt-style-check will warn about it
("[tab-in-yaml] tab character not allowed in DTS example").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/imx-audmux.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/imx-audmux.yaml b/Documentation/devicetree/bindings/sound/imx-audmux.yaml
index dab45c310670..501af1add3c1 100644
--- a/Documentation/devicetree/bindings/sound/imx-audmux.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audmux.yaml
@@ -101,10 +101,10 @@ examples:
         mux-ssi1 {
             fsl,audmux-port = <0>;
             fsl,port-config = <
-                IMX_AUDMUX_V2_PTCR_SYN		0
-                IMX_AUDMUX_V2_PTCR_TFSEL(2)	0
-                IMX_AUDMUX_V2_PTCR_TCSEL(2)	0
-                IMX_AUDMUX_V2_PTCR_TFSDIR	0
+                IMX_AUDMUX_V2_PTCR_SYN      0
+                IMX_AUDMUX_V2_PTCR_TFSEL(2) 0
+                IMX_AUDMUX_V2_PTCR_TCSEL(2) 0
+                IMX_AUDMUX_V2_PTCR_TFSDIR   0
                 IMX_AUDMUX_V2_PTCR_TCLKDIR      IMX_AUDMUX_V2_PDCR_RXDSEL(2)
               >;
         };
-- 
2.53.0

