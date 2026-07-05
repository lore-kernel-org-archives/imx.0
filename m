Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB783A785D
	for <imx@lists.linux.dev>; Sun,  5 Jul 2026 19:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280493; cv=none; b=e1vli30z9K7D2DP5zB+fkhUUPhI8ceDBNt/GBzj/IxYhYMvXiYrtPMhvrCM8kbn/iyu4Gnm7QXM4I6DahT4aMjz1zEbV6/6/TGQvREhVHVIAWFvDSGKzUEXtkc7fZRkV9DhSQUMObLdXXgfbVB9LufFTSlpiedFUxcOnei59rJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280493; c=relaxed/simple;
	bh=ih+WmqIWK722niQ5u1H1E9UksjJJYkGhr2LClEew4jI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ivfzi5oop4Gqv9m+zJXkLix9AqI2ONAj292XtheawRYv9aBiDPmkb+Q/A+nuiR37on41uuSCAAMoY5O+T50R1Cpc27bXBDGD0YxLd1u4c0qY9r9ebT9Ilxyk3DQ2gsroMMpN+m7/vc/ZpiJv8nBgPrasjI5PEQGk1c6hGXO707A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LEH8gBGq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bpbfIuk5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LEH8gBGq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bpbfIuk5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HhbSs2324480
	for <imx@lists.linux.dev>; Sun, 5 Jul 2026 19:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	keNlL6A8+I5pnaNawbDLPC3Skjo9l1+hFMmFLmQIfDI=; b=LEH8gBGqre98aZ5S
	R+gXIdM13wWVBKCaHBPzQIy3YO16XtaM2Yeu1rWWcKE8Ahh7phGi5PdgSe6faHYh
	NZ6WuJayU3dm2BjN9bw+VBE+ZM79Gb5/VMy0wrJmVG9PAL4oi/vWr8CCwZvut6LG
	bgx8kYmZdMLIw+hO7G1imKVsWOK46Uaj/pGQFCjPL0CK5llMYjmxUaWFjupRdJAp
	DojiJvRtFxtp1fbC0Y51KdHDxd4iTgLcudGv/2y9joceF7NK21EqPuFhp9vBp/DG
	Mr1h6o1uwl/xqAgXXnlbwqyx/z4fTFXUP1+eeaAFH0RCQyOQiLqKrFrdvXcDdzoo
	l70Dvg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgum87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 05 Jul 2026 19:41:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so3281137a12.0
        for <imx@lists.linux.dev>; Sun, 05 Jul 2026 12:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280491; x=1783885291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keNlL6A8+I5pnaNawbDLPC3Skjo9l1+hFMmFLmQIfDI=;
        b=bpbfIuk52XpwtLb7/xtPKHvlspULaIQEP6ZsZHAv0ajQFQ/U3hmCEaJC0ew8EAUysZ
         Q3IMwAZOkz0RFroHoUOHaR36OC+3fYwWXFfKvF/gKHbMDJCw+ttmxZQoIzISepZw8oEJ
         YsjQlc0ANEX1ABMvIDm0pi4r4icPfdbvzxM7C7l5QIin7mkA6BvVzpzmsZqVhf04Ktu1
         UcraCcs9mvXQF4OcD+R5Paf96bBloai9kQEInqi0NySzTsiTsW3o4uBWehFv6QJOiPsd
         ghLvzgTDWHJ/6sA86ks+N3mdDQFTxfDQW7WZzD3xwk4IiOrvqhBhlUuc/zar7l+dJvyO
         3iMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280491; x=1783885291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=keNlL6A8+I5pnaNawbDLPC3Skjo9l1+hFMmFLmQIfDI=;
        b=lnqFxdtw9oweWMegTxgRfenHBq0M8yAVeL7Hc+tOKT3hDLK2nQx6ruezyfRsCwfSHV
         SSu3j5cJQ42nhTkiy0BXzxcfcFKEXT3kvsUdzqBJGJEJB49AyUNFe65MD6OjdklR901b
         j31WYacsOfYrS/xJzLKpX6sE27nPUKPl2ye1pfcmsnE7Cn0EEabhY+OnYbd/UUgo8FC6
         MqRADRNaSFMXCSzBA1AsYehxUg3WfWk7CNEcZHSI5YFLFTBB+723+Q9SxTSys1ZvSALX
         DYK8rKSFv/NoKMStBMTN71qKFD/EEy7an+O+tzCAFCgBzLnTRhu2Aj/0fs/e+RGGusII
         AEJA==
X-Forwarded-Encrypted: i=1; AHgh+RoICCjVVpscU+Mufc0+Q3P8cYTm4XpHKxpnbdT0ann3dMKD4dm+vdDu7xEDHHcwgvtEk/0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ9En8eKdcdvHssbE3P6kyibn2Fh1dYkAdLc6h6NyVb30k1BZ3
	hudpcXr9hN7lCliy9KNdJF3epOduF7e++CS2LcSWKX3xjXCnll/zkBQ2zqI0HgLqFy1sWLetpPw
	9wYXa4RDpDzxf88WB6Rtvrc1I2lY5J8Q3scS0wbh99sllwduHt/pyISw=
X-Gm-Gg: AfdE7ckxc9FbCyV9mvSGXjKf06sChD3XVvEMIuJiDkgB51N2VMSWNndsqK662RlfM2U
	Vrh8W46+DO94m/kmgPg618mMjhVUPmPNwG8ZnSy8ysJwWKQTUL7m+Xg6jW2hP9ct5btkJyeMceN
	y4iNTSQ/2mH5GpfVpIvqHA4/zi3WbITeK1L25nBmFYkxB/b3R8i1dWFQpaVhAhkfYQdGcdG312o
	g7/vBceyAhyMcHb4oSvKoaiZbbZ22m30PQ6f+5vlL/hNbMzhbukNkyc42ZIDDmrT7P3EcAM+pGz
	YUMINNRP/YGR4ZFhh4jvsdQuHHtlpZbVN4Bulf4BIxEZxT4I5HKEaGTOmMHjPk0lF8FqZ3tztZW
	AJP3tYIKRYENqxEpnMDsbdYAcc9vM6zMLr9EpZQ==
X-Received: by 2002:a05:6a21:4cc6:b0:3bf:a0e5:99a5 with SMTP id adf61e73a8af0-3c03e509089mr7554468637.47.1783280490840;
        Sun, 05 Jul 2026 12:41:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc6:b0:3bf:a0e5:99a5 with SMTP id adf61e73a8af0-3c03e509089mr7554455637.47.1783280490326;
        Sun, 05 Jul 2026 12:41:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:30 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 42/42] ASoC: sprd: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:18 +0530
Message-ID: <20260705194019.2565498-10-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4ab36b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=99hAX-h0IAisWkWT3OgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: sglkeJ44on7VluJfK_THPE_s_QO59_lP
X-Proofpoint-GUID: sglkeJ44on7VluJfK_THPE_s_QO59_lP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXwnPnHyOCKtiz
 vFgFvp5ii88sXBvbtpbVNeAQ7mo0898Edsj8TAdEU5gjaC2nF20pXl5khjrmMZiqRQrnGRXGgGT
 Hvp4CdTKE5uQwzIzcBdbrjjyU0JNOWg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX39EpKFN0wEj2
 NHBcojBQcIZ5LZCBjKs5VVavGqij/CK8oZG9qFumgItfFpMYLT84T1wecroeByTAhbiqmi7MKBl
 H44lF7MJX2B2mgamL/WJi4Gzu3rBdqnJpMGWO5Erwver/B7Wi+1EFnEjMRjrE5rRiEIccbajUBu
 PUITJi+xxWJf1vB3tQgq4qPS2sVSz62Q2NxvWx8vqjFsShZrcXxhwk/8hEMaYg4EkjhHX/1cQRQ
 1mv981tezgKkF67IR7vumWAtpaYE/RTiwE6S6iN5oPhlKPxpMsYcQFSCxWlX82sbx+PgSxvPpb5
 xkddfS3k5Ny1/zpjNZpLL1zH/SzNThK7VFFQgYK5oKb+XoeQ3Xk+86k4ikrk4Kv5V9uQqPpOBVJ
 gc51Noe1Tdp/gXU99w9O7rV4Qrh+6qYd/9OiWSj1tbIDp4lqJk9DfIlduvTNWCSuegx2xZ8AkoB
 9iHSH2DKMK7bC4bucLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup — the driver has no remove function. Also drop the
now-unused local variable np.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sprd/sprd-pcm-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index cbf5bf82d96e..220f55d475af 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -459,10 +459,9 @@ static const struct snd_soc_component_driver sprd_soc_component = {
 
 static int sprd_soc_platform_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	int ret;
 
-	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
+	ret = devm_of_reserved_mem_device_init(&pdev->dev);
 	if (ret)
 		dev_warn(&pdev->dev,
 			 "no reserved DMA memory for audio platform device\n");
-- 
2.53.0

