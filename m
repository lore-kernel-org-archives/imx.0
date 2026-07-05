Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648F43A1D0C
	for <imx@lists.linux.dev>; Sun,  5 Jul 2026 19:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280450; cv=none; b=MB8Um5pwrf2tcQTZPsm3SZsNafH9TQk+fkLj0uXCoFHtZWRtPGQahKh/8V1spVNcpWuzuflbgoYKdqHXmnNdaDTPjHnT1vVpmBNavvrtL5hShIcCqDwV8JPJa8IW5xBD28Jm4yKAz5CB7nsjPYrxoTYwhL9dIIcv4MhrTNRH0w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280450; c=relaxed/simple;
	bh=uWGYzLdeRrzr6t0aAVNStOMdR0p2+G904nfPHoPwpPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mt1xoRvIuEolM8r6kAsPvZo10czg1F5+MDLjz084dUUKbnhqIoi50pH3iHyaZ/7awpU41AAXIWlpdLsOFFQ0JfBnpFlGB4rqWgDhNev8TygvMu9PYad30z8vP63LmHO10lOxxUvGWdAPY2xiYxFiPpZxjKpnWdAq30Kv2JMqm6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lc/WGFTE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cmXJxYtn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lc/WGFTE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cmXJxYtn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hiq1S2273691
	for <imx@lists.linux.dev>; Sun, 5 Jul 2026 19:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7OthzF5yzbE
	g8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=; b=Lc/WGFTEsBR6FyBf8pb2q2cTo/S
	IRTkAnMpy4BZluObjv10Ds1+8wWUnkRZLMFnZfxn4lwUf9wNpTCxvblYHfxq/YKl
	Ovc/Cj5jLSEuk8ulecmXZk1CDgTUxGIQtjZKnuWR+K1jUu+ftDDZonwnoZEjSzlk
	ct1xTk+NVIo42IekyeGwdAr5vq+YHarJ6RB16P36dz97W6pvhWCceSyR2czSTYp6
	hSXnIp2oW/ZkZTxzubwpV++50pKMPkSorshnXRFfqderNm50KPgm9F/0EgLX4x+X
	hMm6Gy4Wmztc6y63i7GrlHroXX0TGdaLddDcR9h9VbzCKd2rrL7p6658Gqg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnkmbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 05 Jul 2026 19:40:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88fc985a65so3719795a12.2
        for <imx@lists.linux.dev>; Sun, 05 Jul 2026 12:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280446; x=1783885246; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OthzF5yzbEg8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=;
        b=cmXJxYtnVmvZD9DsfdolHaRuHkkwY2E+SppdPeLnHGF1lacVpGjOy1Ry0I8tTlmLSE
         3Xus1oIAM0eSarMIkgVHjMZW1u0c8yphaNHkca3ohfvimnQYymlrj1N5x7aUgL/Od8vU
         mGxj4VPdO0hivr5sZRj9+ntpgbimMPCuwQ2brqwgfHg/dvGemrD6QITrsxefpN6KBqWo
         C1f9BXdeZbkJTggtuhnGUajc3+CXCtUnhIA0yIyE2gcIT/tmpB08Qlf/Ve/nbtvktwNz
         hv5o4rCn+bUCPlX7xZM2WW3FcjWm0ZamlM3WPX19mhhBpln0An5gbt5HwjArgLHzb42x
         y0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280446; x=1783885246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7OthzF5yzbEg8KQGkSEAgoedjCLI4POQTlWuL9KBHJU=;
        b=H2gedHxxpCBEpkByDFgWNum1byHYieiK4ty9+yl2Is7P0dZOwANxZYujAJqh309BVF
         B3cTxsTlQvkHsK/OdBzoBf+fvU38BwI+E5gVygIeTgmZ3X0CA+e2xcg1O5NLe3AAi/n3
         4LH4uLMrnWM5lNm/LDS5KI8ny26pIQhRsy9flbKPbBEH8UTe9BcpVbdqAqa6HAeAlAx+
         cfYD9URBsfRTNyx+c+p8GtELwa71ItXUQGk4iTIw9YwbFuC1aOheq40cMgYMJGjrewNf
         FgQH3LeFh8a3xJwuNWwmsjLQ1VjIZ5rXdreq/moRRw+oxYjhGdiwSGvZlIUpEtp+fUQy
         oECQ==
X-Forwarded-Encrypted: i=1; AHgh+RpwVlGIu4ZcOhc2dgd+6gkFb7Dl/WldkQm6by18ydwA8TXy9qMMei3lcCIWZSU82euNh2A=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOWlepYbgwwEVOr/xUlg1KvSVMQ9zdQpATgIr32GVTMzv0+fjt
	wBXWZAm0aGN7p0IbaHeTvewv5z8/Ttil8OTpDEyKyObLZa+HGqOGXbMuOZg+rO4esX/TWcZGywB
	1UXfQ9ptOU3k/H8g5sZKMce7I0QpDpIO6SShXs+IA41psyysjcyeLEpQ=
X-Gm-Gg: AfdE7cnVmJel2J6RMhiMjRcaHcl4WxHRNahi/kwTUr66pXuflLDjEtRcVdvTaUkYjEG
	AaU9BR/PXCPQU7dX7rcxJq/A3QiFDV7my+Mw11pmVYwxM0Dz3P5+dJcAbCqkc5pY+oVBM5+YKY7
	JxZJwCuwZAtkWkkC+kF0DUnxF4sLsMQb4Qdh8T5LuFodHDb+Ct510AMenCKqQ7/RKYFDYxUdjOf
	Ux6yFlfqmJYh8+k3tRxqHHsF6kLvLD4XGaBcgyNEbwyHJucbwwkTglocD2nC7MzW4gzF9y8tl8j
	L8KFPQYaNxi3Lgacjeb2MLd8575vjehpFtNJCMndo9ceRYVMkUI1iyD2gP+B9ZyPPSUU/qJfmop
	iDQleWf3JHd3ILfds5DFs1I9UurusBFV4f+pVjg==
X-Received: by 2002:a05:6300:2211:b0:3bf:6c08:fb8c with SMTP id adf61e73a8af0-3c03e521435mr7049943637.60.1783280445929;
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
X-Received: by 2002:a05:6300:2211:b0:3bf:6c08:fb8c with SMTP id adf61e73a8af0-3c03e521435mr7049907637.60.1783280445455;
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:45 -0700 (PDT)
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
Subject: [PATCH 35/42] ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:11 +0530
Message-ID: <20260705194019.2565498-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX3F0R4a6wiJq7
 fKqJklHeN/KWMxKqMiADAeySWZ+r8p61VTD+zsgoUCVGt5R7DRvM5kx4NaJIFPqHgmptbqnpr+q
 nOzjgCA6KIm+JnxTC7NzrF8hs6GCar0=
X-Proofpoint-ORIG-GUID: _ZncZRmqmXqzThucjkcclpMLslptI3nW
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4ab33f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX3KGiLqtnhEkh
 CowdtOvX+FKFUKTI9tIhk40eV+pELzrArJBfCggxusI3nW7+ercPAvTb/DdOYJ/GNYPQBAAmOMz
 yekasbAmuyCzxbqOLookJ2usqWdvTKPGOGfKmXa0kv8dWW39AOQ4XmuasuMuD9uPfGo8TPPE4a4
 Rdf9k/EvkrKtVl4oIdfvEppSavnUUtVeDKKFyX7ihq62akxEKOf19LfnWLkyrRokAORwwdgLCE/
 qs3lAE9owCLzpF1CG1ro0y6uWzd7kD5DCA/nAzcd+uA2kSZNrqQdgA/e/Y8H8pC3zDGInIq15ak
 C7aWNwv2TyvLw48X1VRZsFkl/HwclZXtmD86QW7S+CYigVACxr87hHPXObHFF2dDrSbXRFq+o+s
 zvihMDrfkKjQFyodsRXSYlfwTxJbPraTBk0OQbj8MZ6+H/FVXmQvdw30ZlGjv9RGyzC5g0szivt
 e5hGuEIOiaja5ukXnOQ==
X-Proofpoint-GUID: _ZncZRmqmXqzThucjkcclpMLslptI3nW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 44a521c3a610..60576f885acd 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2836,7 +2836,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe_priv = afe->platform_priv;
 	afe->dev = &pdev->dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.53.0

