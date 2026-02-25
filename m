Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334843E8C7A
	for <imx@lists.linux.dev>; Wed, 25 Feb 2026 17:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772039529; cv=none; b=CxKCoJjcx4ZioxN3KXUfl1WA78DGSy6nWzydhAQlTRgdsrzWLunRGn3wS+chD6za7KLcdrD3FcmLphbjHqFkwvNFAneBnvAUMjdpETOwMvI4C4ufIhjLzNeNAVNl+b9DWps5z0Zbe0wyKDoxAFl9n8QuGMCiMQ88NX3JdVilBVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772039529; c=relaxed/simple;
	bh=lUtIgAbMh/vNpRAdiwHHkrbPL+Vk6Sh4GYYNaqza5DU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ii9734PwHdpx2G3GfMSYLdlhk5OL4vC3LlXSNmapQ+kLg43o9Kak2ODORzvefuU87yF3OweT1m8i1Arq2EGjZq8/WtO4+JZj0ijUTyVTh0H1VT2fTaq/swsafstx3Yw1W9JtJUNalQltz8flhqnt8S/ixiVkST1NPHj//ti4jqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B0KSE6v2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Voj9Twkl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B0KSE6v2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Voj9Twkl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PH5cuj1363560
	for <imx@lists.linux.dev>; Wed, 25 Feb 2026 17:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uAXRlKsSKgVHXRo/hlqcCpXBiAKwXP05ii0
	Mt1jrQg8=; b=B0KSE6v2BR2faMgYkKqV5TeNf1Gqsf5Bdwcu5HGNAhTwbpqLuh4
	53VT2GyzzV5skXuIbp+HAb8yViDEVPuKdNamsy94Ew9JGcHdV3I6CTZfZrwMGj9s
	FxBSQDlLw8+PF5lQYyhgU2Dec/6XAKcD48nxbyFmC6kAGWA/MfwXPImWI0NhS8Ln
	erbvfrP1scZuEfbdAhxEHFRcZoSTtBvNMlM42oT82ndi1cUSw5RWHXOjKCFlGQqT
	OhVFAB+zsfcDBEQzbeNBFIyC9ByxGbv99Ru8dj2PdvDay7SzVpT6M8qSnnVAiWuC
	fmLdnFweiXgdQrevL/Zqp1EYFd7jEAE+7xw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chp15avqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 25 Feb 2026 17:12:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-896f84e69b6so692582526d6.0
        for <imx@lists.linux.dev>; Wed, 25 Feb 2026 09:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772039525; x=1772644325; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uAXRlKsSKgVHXRo/hlqcCpXBiAKwXP05ii0Mt1jrQg8=;
        b=Voj9Twklb86bXx1By0NMJXISKt2y5DRo5H1fdzpOXi8r5HxWJ4Fix0yOtc7drotJkI
         jcrocFcauuM/kijnqH/7sa4RXal1T9Z/6nZqXMrIDXXodelltCr0h5U55IL/a9tdtj32
         Vc1zbIIeNrzRtak+kxET7dIHCyDP/dgn6zp578mLGmgFSFnTMQwmtLSl5KAOgj35iyH9
         Z7LoHOLLqzZbHi1wkhARO7Squv4MRvZ7JlNj5Auc3FomeKCNG0b2Lk5LOlxIv3j6cwIO
         46LlM/bOgzKO0FHyFKyH5k08gbkNTGg/y9f+A5r+KVXnmwuIQmU8koPAAqhfU6MB/Bm5
         TYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772039525; x=1772644325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAXRlKsSKgVHXRo/hlqcCpXBiAKwXP05ii0Mt1jrQg8=;
        b=vFSSQ34bDbe74qitPrCCWQofiJxTvZol54Qu2H6RvaV9EGFYA1moSeDWbuTPv0RWhb
         jriL7VD80QMgk+CYvrZWEGLS2vYPe1CYuR5w7OKQ4yiwShrNDgL1yzdj2PdcEalmGY8P
         qSbZpf6qCXYp+th3w5tOTY1D+boMxmZDRmpOA+A70zIznCQV0ibOYwQZx8qPodDNYDNm
         V+fudrGHSB9oaIAv45RP/KZoF2MFVWs6nVBcFF6wwO9ftMPz6u+o62Rw7xyu8Wm4eYFc
         4vnDejvETfeqP0CQPYf7jM7lH6Czj6Z8Jn128R5ZTKNMGa9W3m4b6W7jyp58mIe4UJw0
         afoA==
X-Forwarded-Encrypted: i=1; AJvYcCVpyF5R7gmDFVmaxToKiAceU4bWtVYOaFa0logdvxBGCWA6Q/d9ElzdOcQeE1qt2DBJbgY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLPcCE7AtyiG8ej0Kk+k5JUhqP6G5AcCIvHIxG53dku+ikX94M
	PIN8XxqidYn9HfhZK/TaY6Lz6u9fDLBCzA4TaK1zcXH1zV1wpmtpXFAs8omJwVermMNsqYg7jD8
	LjfUN1i1lJ0SFM9FKgUsXrZluvruswDq0rTGX8YZwM9zho72h4g5RmWY=
X-Gm-Gg: ATEYQzx0ujZdFKoLLvVLwasPZRkAf9PSrdln5xIlSv9lV8oDKPhR7L24A2ibGtoXpd7
	1RVs1Fykjamc+E+TAlDnUq3oH3BB+NxsoFiiE2VT+nUDOqraF1iDlNIXA7SMBhzZoiTjLJ3rNJ2
	DX9aDwFLcdzYLxnivsuBObq6hPXZ3P74UATd6rzgaXsUd2JCDpJRXDkBr33UbFReaas931ZDyl4
	xreiUxQWRzIOfsJOKDI5dEHW8fEpDdXY+1mN3bQHPZmovPofTTZCmnlHy4O1SX9k9YT9/ElsZ4x
	FKuBSA4Zq+v3wh9qFX4L9uKanXf5AuzLVnvJ9uj07LW6FzDiOVVrv5VGOdbGZW9e/y3mNl4m4Cu
	eRDDbBm368ZggG0nmWJxqpMsaJZRoDW4+wKMsPA==
X-Received: by 2002:a05:620a:454d:b0:8c7:806:386 with SMTP id af79cd13be357-8cbbcf97f2dmr180915085a.34.1772039524759;
        Wed, 25 Feb 2026 09:12:04 -0800 (PST)
X-Received: by 2002:a05:620a:454d:b0:8c7:806:386 with SMTP id af79cd13be357-8cbbcf97f2dmr180885485a.34.1772039521931;
        Wed, 25 Feb 2026 09:12:01 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6854c7sm186988115e9.0.2026.02.25.09.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 09:12:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>, linux@ew.tq-group.com,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        markus.niebel@tq-group.com, matthias.schiffer@tq-group.com,
        alexander.stein@ew.tq-group.com
Subject: [PATCH] ARM: MAINTAINERS: TQ: Orphan TQ Systems boards
Date: Wed, 25 Feb 2026 18:11:36 +0100
Message-ID: <20260225171135.122955-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1575; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=lUtIgAbMh/vNpRAdiwHHkrbPL+Vk6Sh4GYYNaqza5DU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpny1H1OE3Y0Zw2+jF8iqQR9ncHs2XAfCuD6jNY
 yg1lhx0aeyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZ8tRwAKCRDBN2bmhouD
 1z2cEACPrAM7M39NN5/GiyNmPWC51/WqMFstXNtfr92G2BKdF13xgZYoo/jFhKt4ed2CA4JRW/S
 d4SpDiefTVbEl2q7SizU7thmiKY80CUNa/5MzJ4D9aa04P0UjcT9sln8cX9sAxYS3WLa4en+jVr
 giCnZQaHaccNekgM0jyGyR0OgQUkp4Hnnae+fZHx3VsZ6HOY366llKj50QUST4B6v9zTEgxGjRX
 xlnXqhkyjaYcaTe6t6xxPwlSBCi2EvGALNN05Ab+e2Q/5Gmh4D6faGd/Z63wWPQEaLE5QH8jfqr
 voliSKNnogG/BAh2+AcK36XVZ66HkWosvbKH9Jw2zbeIyAoMHh7e8wAcTNT1R3NjMdhjHz0nIC4
 t6jnH7o1uChADZ4ZZGRZPMG0tyzdfSFl+osFpPFQeC8v/g09qGaVfmj1w8hcfUf/mgN+15d8h7Y
 A7ylhEHWQke3gGNo5iyd8CI24PZXmbeIFzKDUlD7PpCWzPI+aMTN34+dZFVjMaBRuztJTzV1xuU
 Gppujo2WK5PXzlpojUXx6diJWSPCKQohIEl3V7rMQpbnc6hRftU+lpfe4qJeRL5Rhds7EOcLx6j
 qR1IOGKSN9GZ1VxaVPsQxMhuh7zJhhd2qEWHQnlwg4QyINmC3mrWEOhSWWRyHwPhOZouDEZ75nS FLN8nE9LEL98+7A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE2NSBTYWx0ZWRfX6uQrDzbseL4V
 Vw8LyjkyeJvFpqWolYNfGRdR+JLePcVT24Flhg+sivDVFcUNqZvDT7TDWs6LtC2M2d0mCSy2NwG
 LybnasMaiza4zTL7X9HwZNhKiI+mgDdFktZSGBZmmDB0qmF6Tsog/4psgSzHb+EwyqTzc0AE3Is
 m3tBN6xgyq+Iuo7VcXjLU0I9W5H6yNunIxJm+hHAdc9y8TCfoN6qLa/caSj1bAaLfPZDsIr8jpm
 0h8yT1NsPhj+G/BW9rKujvMVuiM4ogO4U8RRq1OSRVdqFUhNE82Ks6nBnvOUapR+9pafw3CQYMw
 1BT/F47uHbNkFWUj87whjK9XYU3ZtKja9EYqpdm4ZYqLDKm7AAhXsXF2CqF0TMC/qQGYaIEdxkE
 PAFCwA07RsQmqt4sXWG3psggsvKdHaTk4y42cGaikSGZmDDG8IVY2w26ZQ0hckOr1ZAWDMLXu16
 nLF3VZkm6X79Npvts7Q==
X-Proofpoint-GUID: l83baqcWVXT0V9JvV1KpO-eGcIuzBbzK
X-Proofpoint-ORIG-GUID: l83baqcWVXT0V9JvV1KpO-eGcIuzBbzK
X-Authority-Analysis: v=2.4 cv=etXSD4pX c=1 sm=1 tr=0 ts=699f2d65 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=8f9FM25-AAAA:8
 a=VwQbUJbxAAAA:8 a=1TEZt6uuAAAA:8 a=EUspDBNiAAAA:8 a=MG-3fz8axUtF_4d9Gg0A:9
 a=iYH6xdkBrDN1Jqds4HTS:22 a=uSNRK0Bqq4PXrUp6LDpb:22 a=K6b9sarf6D5yyto29Wkr:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250165

Emails to all TQ maintainers bounce for a month or longer, because their
systems decided to block smtp.kernel.org.  This is nothing which can be
fixed by Linux Foundation IT staff, but aggresive and irresponsible
email provider.

There were no answers from linux@ew.tq-group.com or anyone else in TQ
Systems after my inquiries about this problem, thus assume the mainline
efforts are abandoned.

  <Markus.Niebel@tq-group.com>: host mx01.hornetsecurity.com[94.100.132.8] said:
    554 5.5.4 Your IP address 172.105.4.254 has a bad reputation.

  <matthias.schiffer@tq-group.com>: host mx01.hornetsecurity.com[94.100.132.8]
    said: 554 5.5.4 Your IP address 172.105.4.254 has a bad reputation.

  <alexander.stein@ew.tq-group.com>: host mx01.hornetsecurity.com[94.100.132.8]
    said: 554 5.5.4 Your IP address 172.105.4.254 has a bad reputation.

Cc: markus.niebel@tq-group.com
Cc: matthias.schiffer@tq-group.com
Cc: alexander.stein@ew.tq-group.com
Cc: linux@ew.tq-group.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index faa914a5f34d..f446fb30cf6c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26781,7 +26781,7 @@ F:	drivers/hwmon/pmbus/tps546d24.c
 
 TQ SYSTEMS BOARD & DRIVER SUPPORT
 L:	linux@ew.tq-group.com
-S:	Supported
+S:	Orphan
 W:	https://www.tq-group.com/en/products/tq-embedded/
 F:	arch/arm/boot/dts/nxp/imx/*mba*.dts*
 F:	arch/arm/boot/dts/nxp/imx/*tqma*.dts*
-- 
2.51.0

