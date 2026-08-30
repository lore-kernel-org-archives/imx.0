Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF603939A3
	for <imx@lists.linux.dev>; Sun, 30 Aug 2026 08:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788079259; cv=none; b=se45xkwOx4SowxMi3zF/Ezy7ocfLPBScBasf6Fxd9xEhIxpMW4svoIk2C6P1pwgXkYm7Abe5Dm1ZwcPHLR0bc7G/Hwqo3eSWISM30Hiri2WuAxk/rm7HJ6hjLr2yrLEcbb6mlX0qvoqofm5odCB5etOjizKmtxxI6naFrVndnL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788079259; c=relaxed/simple;
	bh=xstTPquafbNGlKwlQsKZ7eJq5FPgU6WMbUCfJXuADdE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m/5ILFmSGz2cHUtSIPJEOhSXExBDJDRtsd9riVtukKYbRfnwpF2772vwztOfuKxcHyOxVFutXoWGql2Hj3fhbE0uzg/jyPOE6Be8dqKHhEyqJVvygKrUmmzbMlBB7/vAbV1WUj5nQAA6kA7qFwYmqJu/ER+5NPLXslySVxUgAWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S5IhCqd/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XX3Ig6W7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S5IhCqd/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XX3Ig6W7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U5vTgw834230
	for <imx@lists.linux.dev>; Sun, 30 Aug 2026 08:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=M/Nytepkmt/ZP2rVkdCu7doVcdz2bZqfv3E
	nSqqfb8w=; b=S5IhCqd/1yiomJiHtcsSCPVCmHL/DPZNP3Afc88iJsUa4NgF2+H
	+u6Vvasdq3BRQ7Qznqvk8FONNef7TuMqgNfkx6qbWSIDUm0kRgdIBEXZQR5cWxuc
	5ZXl9nVNrv3H5EZEHgS8OdEMPzuglitZ01eHLTEHuZk9qvjtkK5YJTrlW+wyDsLU
	7ioH9VrIstWJRr2OmAI/bBMlzJNq6Gf3nXEswresLi5y+1ks02H3qw/cxt9pdbbr
	34YICvvBsM7o2reA9bngHgAjmWYgr5lXU6VkOgn6+n9Q+NwKFBNuMUqe39Gi2fZu
	Ar2z0lmKXlxznMXO0fnwsy3soIExWRxUbaQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhmtn1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 30 Aug 2026 08:40:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e80ce3597so12017276d6.1
        for <imx@lists.linux.dev>; Sun, 30 Aug 2026 01:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788079256; x=1788684056; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M/Nytepkmt/ZP2rVkdCu7doVcdz2bZqfv3EnSqqfb8w=;
        b=XX3Ig6W7Aapqa/zYcziSqpRHWYqln5NprmUv657mfQ/mCfoPjJDmZ8nB58pGty8GVX
         xl+hdZQAA8uczfwDzYUc43flrvTRbodTwZGjVBXrXb4KKoc5jiUiE7mm8XSe1d6B1gwy
         ZSE7A+tqH8u5OAiqGDmQv+diYFrZBh1oT+8stgCQCm9f6itzsF/zyXZu+kTfq+CiudAK
         SwIITzv03KXDRJG+Kt4qhhRy6polT5SucT2Gipt3Kn4uiIxXa2GfaxSuOjBZ9x6NYMxR
         ZW02GaTskfiDystZOGilX8zvpWFgeidxLSlZI+6rUpL2X8/rXwZVk24H/Fdf8gAf1fPb
         /U5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788079256; x=1788684056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/Nytepkmt/ZP2rVkdCu7doVcdz2bZqfv3EnSqqfb8w=;
        b=LOgQ3a+2qF4TcLX1Hqni/+V9C+GYjy5wLe1wnYrOLDA+/mtB0h4XalOq7FnZvW4Xb6
         uFtRjEnq+znWLWQ/iQI+YZK5w5zMKWiy+Ky6IL2GEgjC//ltWbd7ldt5f8BIO4KH9Fk0
         1VO0sEitODRxTlvKKAmQnnr5cD9f6mrUhgf8H8612iUPAP1oEvZDEU+4bjmqyhmgomSy
         9grzoJ1AJ9NzytVAdOK8IFBFOy4KXiM3e0j5EZWM9C2wB6QpULVvwenQJd/eXAhJKR4m
         HjnMQV8F40Pzh8FIYAGebxH5S82rh0RAuZHOaYH71iBlX0dg1N0476DCroYaB6hr8LQO
         +JOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqe7ctRatUX993QKv3nhd6buKeEC74hPhJbBSFSv8eNqaVP/cROJjoVs7sBmadMqsvELak=@lists.linux.dev
X-Gm-Message-State: AFuF++neCHoH9P1RTFU48zcAU4XEDIxgMIyC4LmftQx2zeVpMvRBr/Hk
	K84MJuy5ZCLjfbiMrh/BwEEyXJlsUWKPscOnFkPcDVkAj2gOc7TSKgboiI+6045+6+sjTrrEbAA
	+5v3zhUzekTOvLmlADRbTcZg7RCgVsc1b1aKCnFwzHGX2rhwFMx9d4wg=
X-Gm-Gg: AR+sD10EUScJFNUH+ylFC2JAhnbc3vduNuG7/Z5TJxXa9ofUVotVFxs87P4l+Ju2BDS
	xe1C0Zj1MDqnJ6UakEbLnD0KK07/LHjpHlZtCbFpJiVAsMepEHYXRxQD7YMnsP9nPtCRkh2hKFu
	+u8DyGUZOG5nL7mozLXN+omZ9Gy/6XKU4oJxODvrmMSTTQbg13bhtGt20RcJO0MGnyLQxP9jDgo
	GxrLYDJ6ebyJwoKo19oA8HqLsZZ6yqJqQMp1BoNBYQ8qVLxX3QXVzdbE0y+bwUIBixAmB9Srs1m
	+wkUefvk9aBGrxOF9qFBjjmXBwOV57Nn4CdkodbM9XVgWUApti9EQxYPNFhCe/rUD4buS7w8Oqv
	68nSObc5NiMm5n2w=
X-Received: by 2002:a05:622a:2588:b0:52f:a178:4c59 with SMTP id d75a77b69052e-52fb9657401mr225644611cf.37.1788079255890;
        Sun, 30 Aug 2026 01:40:55 -0700 (PDT)
X-Received: by 2002:a05:622a:2588:b0:52f:a178:4c59 with SMTP id d75a77b69052e-52fb9657401mr225644401cf.37.1788079255534;
        Sun, 30 Aug 2026 01:40:55 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b963c3c0asm314870005e9.10.2026.08.30.01.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 01:40:54 -0700 (PDT)
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
Subject: [PATCH v2] ASoC: dt-bindings: imx-audmux: Replace tabs with spaces
Date: Sun, 30 Aug 2026 10:40:47 +0200
Message-ID: <20260830084046.14679-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1385; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=xstTPquafbNGlKwlQsKZ7eJq5FPgU6WMbUCfJXuADdE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqk+yOzvIYQOZZBzBQj6W1Qw9AqvmkZDdJ/+c6L
 pnuewph0cuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapPsjgAKCRDBN2bmhouD
 1ytkD/4qT4rdd3yN7yDIh42thkTo+Unwa2sFG31D9cU3y7Mjm2p5Xq0Dg3hI7zzGFyqWeKDZQLd
 ow5ABRV1PGgwuEic9y2reK+Okt+dWElZBc/09FeWtcJY0hRcUSVZpTqpdSOCPfccLZvWBH44Xko
 tbK6f7710D+MNASE4jDx0xIyqEdMhSNwiJscYiKUKucg1MOSufYlRYa3sj4E93IWZZF3SOWT5ga
 r1jT70VNPX7FiVOTquQoanidMyYoZDJvqjx+3MpoDPN79lSK2w1HciOsoD32E6nGW9utrc0kJlx
 OPbwVKT7gISsR4j4nKtI1PtSY6H3Z76oke4iG+QYkqyESDzfjCFFWhOKK7Mg1FIWsgWTVgAfO0i
 Kv4P7rzu3/MlT0CdTzBVG7g0mOLLMWfD0FcBypJ45JUxJtdXyEbDVGTf/kJdBT/p5qTUiQKl/wO
 W5ysEOZiE150cZWvpfrjsobpzeGHXCxpusk9BqLgHLQr5OUlDh1KDV80IhMR2NJtjdxpEubuP2s
 mBsBXlHJFPCOmiRRwGhs6gwUFzAZBL8ie+o7V5DRnMaztcrN0wPdreMDLCDXheljmOoLfZyhq51
 O4gPbISfvBcyvAB6QfgVByG7Nm+kk1mB0aC7AXVsxEGWkGSM3BikOf+IC3vXPkbgmE6GVca9zN6 jbEY2GFGR+K9sHg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA3MSBTYWx0ZWRfX5VnmAq8YMURF
 RbpreocTLimSMwinKg1M7G2Sq8ZkIuTE01kMHw9HHlH9grgMX2+6njMK52xwwK5C3uTQZQCKJHo
 cFxNX8cG1vYbswDOyY0sIrAjvVnnned9ps7d6P3egfBbOf6I5t5AgeeIKW/Q5Ek3x1ZW0Ui0Leo
 foNzNgwQQUOrWw1jEVVrWHSGLaAwm0cdJ+McKxqYrXCFo914oTjHjgeEkn5z6UTKapifw76siuA
 OjM2a5nixhS7ce+g0cIU575icCA8nZvKCetxvI0vl1M9JdzwXONA7KhYSmQKI1G289fVg56m5YF
 nvj+8XimO6PjGQAbFa0CpW5EzAVr0wpqLunJULyHODwBKJ/RJjVdOkWOTxgFxUo4M1sYYT/WwQT
 02oYrEimPDPzc0JborY4xd4GNKbmnQK+K+ZJNuAA7DSHLKVOG2g/vou7oLw2Cj52nA2U3qQXCL0
 1xsjhb7uCWcpmoD9a+A==
X-Proofpoint-ORIG-GUID: dM_D7IRc_a7PjziHQNZ62gJ-BmCrKpaG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA3MSBTYWx0ZWRfX7QsVIq/cpfqr
 zfCj0KUh6LYVbz/VUtH6rj1uqglnsh0xdTp7DUAcP2rHwAPsmYa2yiZAsr8F9/ZGGCPOPSxDs9M
 KX4fFs4eL3F1le9ZoZB1mMG+NzVyGw4=
X-Proofpoint-GUID: dM_D7IRc_a7PjziHQNZ62gJ-BmCrKpaG
X-Authority-Analysis: v=2.4 cv=bpl8wkai c=1 sm=1 tr=0 ts=6a93ec98 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=i9mLyMywaSABm-nTGLoA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300071

YAML files do not use tabs, even within the values in DTS.  No
functional change, although dt-style-check will warn about it
("[tab-in-yaml] tab character not allowed in DTS example").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Correct logic in commit msg spaces->tabs
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

