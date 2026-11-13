Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596017;
	b=IHRSDv8gg94IbMO72zSZ5lRR7rSfEoGrKJQeiBTwUq4lAJ81RskhSr+GexZX3OWSj1Pb
	 gBGjRlC97A85+poXa4JQKOE9P71sBpSEI6glcqAz/xpJYYoqDVyOT5Dj9aJS3GQq+Fz48
	 sk9CjU4FllhLNDZ4TIUeNM7v3tcxsivH41oBJhJy5XD3L1wvHArkQrnrYHvH92/5Ldic3
	 Y7Lg+xHd+wpcSUda8HuQhbHFKpMqrAxmT3Mp9gpjtGJnesc7poLzJt7SLB/LSUqmU/fTX
	 zwKx2x/KN2mPRlZsUIjeTNPFjeP6cKATgm5YciK8H3vNd6vv5XJjHJIaWMMMGrUTLKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596017;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=l2PvIst1nSNtsSgCfOGUiLnxVZGWtnnZ0YcAmiGkyHs=;
	b=evgU8HsSM6PcThW7M8v66P6GDXcOTrJN2cGCWvtsm7dbAHMajQ7WHOUb33IHCsvXtB0N
	 aO3PU7+3EZrSdNltl0G5+FXbW3/4Cg+aOReDv8yZmdy+tipp78O6tHn7+b0I4YgL2KNT/
	 oamQUIMvDetoEqd6iS6iipe2woZfG/vwFv0/Yp3eZ5f7GOjm4d3oMdiJckOt4CsrDmte5
	 HqWV1ZzVprfWVjKWwPNprh1zPEknqukdQeld3LDnMDPk8rZhGgT+dSHbmGgKxGQygGfHF
	 FuATOqOI86pJl/7/vdcTiReBcHJTXVxVeerOgOyBD17mTb7EJoUYEEbRl758/5pfW4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KX3Su90H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="h6B1l+/z";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D64D606A89D
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 18:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D64D606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KX3Su90H;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h6B1l+/z
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFQtBX074761
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 18:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=l2PvIst1nSNtsSgCfOGUiLnxVZGWtnnZ0Yc
	AmiGkyHs=; b=KX3Su90H6zNk/whbgSOKrnl9q9niXstvLfV+dkJIx2xWM+EnwAx
	G1fTGg+o+T+jz7kUWrtAvMX6Z/kd1Oon5TbYSlQnjQgbkB+huAQjiTZLV0smTTEs
	m3K5v2PX0Llu0qRr/DkLPWWff2H3FBHAcHgm4U1AeiTRQ1971M76ZAa5y6GTrP+w
	k6cnFcJaZoqmC8iERmkz8xvA/UzC15aN80Y0D7X4oaksuAzf2edKgONva5tBqlv3
	iPGlYfzPp1u6z+YYkxFUUC2E1z7TQ5hFCEjsF1AkGNXu9tzjr00G0lzGnmlukpx/
	S9auHcz7LkkVgxUVCLfr7Lowcl/AdJBbMuQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mu3us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 18:53:35 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9987bffdecdso1309334241.2
        for <imx@lists.linux.dev>; Fri, 13 Nov 2026 10:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596014; x=1795200814; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l2PvIst1nSNtsSgCfOGUiLnxVZGWtnnZ0YcAmiGkyHs=;
        b=h6B1l+/znu46mS2ZBZhtlg+wzvWUWwNLQa/dGcrHRLPDmJ7YpjhSbk1cs1DJvQkfu/
         hvNV8lAXxIhCdkbBYAazG9hOY9W/7vwjj60gHTqDGG86uWDh+3KL9Qda6tf5H4MlLReH
         yMy+mm/lmtXu8XklpiVsYk91RUT+IXSMcvgnbXiTknzLsn13Fl5hGnyJVIygDmj/C37I
         c/0lLaReGVypGJtGN+C6ljEgoiQgkgytgzF2+ixao6IhZausQkgeNIhL1CKIINuseEUQ
         JWoj+48Uy1uOx8JM6rDQLUG/Sm4opnq2hmgL/wJFD4vahliySf/upZBaMuTahVO+JlVE
         AelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596014; x=1795200814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l2PvIst1nSNtsSgCfOGUiLnxVZGWtnnZ0YcAmiGkyHs=;
        b=LBreoicpZNxNQQllH9aDH3hm11sdp6ScUZFG2Je7WBM6O/8Q0et8K51Y5W71ua7BSM
         3zAYwK3+GEkVcevihwIC8cDz5rQoTwk/Hy+sQ+uJzLvfubqE6j9dN5OUxC2djx+pCOIX
         gISHB9Gn/fIoObw4g3Hzw/evYCjqV4Ou/Zt9ntl4KZg/zlWoDbB/EZwIbXhbaSLX8l+A
         KNWV2rCpv5IFqxbYDpxA4FE4R7FqpwI7S0Yv7cMZBAlVCjcmwes6anuH6SXWLgw23dKt
         yIJKd/eI7Rz4xWnkBjzlrDdnolMTMltQyit0O4ONp68y35A5HnVdGOfY7j/seueNuwdT
         iJjQ==
X-Forwarded-Encrypted: i=1; AL+hErEeS8xqho19yBtVbzd+iEp5nLQLaIOYvrnyrnG1WRhdbi7h5M+fF6za9aUSnAJxAChJQKE=@lists.linux.dev
X-Gm-Message-State: APuU4Z8HZuTrAMIPM5xCGlNeSVvTsIJ5nSlyyTipb809A4SyiEmrJGEF
	t8sEIUXQuFMJKv+fMrz1ieIdeNRowgR1vFTkUKUuLWuNK8Tq1nCHCh/OgTyvVZRMvOdxx3rs5Vc
	K8nV6nUrkW3MgUjdSTgiBETTmu88kM6+UuO7YEKVytL43nVlx6h+QOyg=
X-Gm-Gg: AYBFou3UIJpL8+SPkcao+NvYQePjU3n+Qhxt+vjtvtZFdXSPx6LaA4qeNfLMFuo112Y
	EWHsDyZ6kBuv8vcZgi+3cQYHgNQ+LhDUTkHmNlNwfTRSnz73OZLwY/cA9qODN7IS8l1elgCIDts
	r9wJ6iTHvpVW8MMmM5RJu56PeoSzZLk0OE9BPXi04Ar6OZBXxIg+9iS8BLhBBnpRde7oOn27aGH
	s409XT3nc2w0KTS+EDjJZKCnqTsGstAgW2m8F4RJW7XR3lmEFz7WfpD0X/izSFrD6Gy0KgtK8Wt
	juOWOlq7JKZo5OWEmBL3OWa3SACafEV3KWwQmvyP0zbbWguc1e8Y3VhKJnnvwgGqvqBOpMkNiOc
	FeUD/mRvMvNhAPMHvgjpZnRaL902/+pznwyLSs5mcm0DZASB4jz8zxnD3+K9OVg==
X-Received: by 2002:a05:6102:2ac4:b0:7d0:5688:f4fd with SMTP id ada2fe7eead31-7d64d739f03mr1455761137.17.1794596014363;
        Fri, 13 Nov 2026 10:53:34 -0800 (PST)
X-Received: by 2002:a05:6102:2ac4:b0:7d0:5688:f4fd with SMTP id ada2fe7eead31-7d64d739f03mr1455751137.17.1794596013869;
        Fri, 13 Nov 2026 10:53:33 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm172988585e9.15.2026.11.13.10.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:53:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-bsp@toradex.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: freescale: Correct white-space style
Date: Fri, 13 Nov 2026 19:53:30 +0100
Message-ID: <20261113185329.183113-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4167; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Akuw++ZUVXXh5XdKDs7G2azKQzusj232NcYmjWrfWVQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91ypbZ7kYSkueWNwNYWavUzn8QEvcbWxnBjIM
 PjQ4q2VSx6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdcqQAKCRDBN2bmhouD
 1+YaD/wNQzJZ+dGmeqnE4K90ELgmA3GZPhP/jaw9F7jiIWd6nQucoDoP5I/P/OspFqkS3CG5tGf
 Fc3ZKVGzeTkZTdPNLFWldGWHCQJ8Jf5Spvg8YDirEXxdBWtlppBvvzW8242+mWoMzngjDb+9qhs
 LyWAKYjCs9IJINN49eICXgO7GAVu2s3lEYayCD/V+WZZsugZbnrT7pxlyR83LMGnnE0f5B4meKe
 Q+8bpJ1KuMq8r5Az9FasyFKHkNcbdc4znilhNKZuGFEtFeQLK/NZDXZ7vZS4RY2mWSrxkVtaF2Y
 ds05QNLoZikZSqrmbyTOtwxYhF6Blyw1b/TIHeI+HzIpYvafaUc6QqJ9uyENv+nzCze2j8Qz3sl
 e3LLxJPnNh7lLhoeLo7YRFDCMdyc2JkDZtDV4/wmaKX3UJXcUmMloroC9k/vMjeRFpu3iCOkfVJ
 PH46vtrfajc+05XBxxpOGFcsge3r6qDNnQ6KmIVCafrnWLX2jvQCvShNWVAzfwXOUa+SIb9dRcg
 JptOyT/LJ4cWrtbFKso1oQNzcqNE3BUaFhpFWTS/FoT3hOARCil+GJ6WnykjmH491T2GpYTT+sO
 +V/N6ZRmroFt5+Ex7hMXwyAefBi4L8+ouY4M43+Kh4HcNHHXKlESrGjZbDYFGY2bDC65Q8E7sm1 rRwIdMJTfbNaCSg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CGs-KGT-cqdLD_I1SjJ7hd-dHRZhCp8h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX+DA1dluiccRn
 2lh0B7A+4KwIudgDu9mAmDnuDRJs5BZSld3vlOp+WKaw0etnCUooAHIzMT+prJfhqBk4CLHddvw
 WzDFii3HDY8SoG+eLJwwLRM8OeoMYDze26oUQ6Nq13ENb3ugW7FaAmQEiW1MgzCwyL/wDYWe455
 bru+Pd1X+EDYzL+1SHRiDnGd4VHy7z7h9hMjZFeXn7laRY/LlQy14MpO/UJYf//02y2UzotVs0H
 5GHzGIyb/lOrjJWnQXVl8jdiHILK4ld8hf98kwQljQo1uI3k0qZ6ht8+25Z0SHBpbr/pYUDHuj/
 rKH1Vv6p55s/n6nTIuGtHZ52cvPAFmIKtUpThYkNe5wm+B0LabcCyGjB0T8DE2ORtADMvwlqAyt
 lOPhCws/J0/Iut38NzStFibn7ad/kPH8754W3nB8JkTSbOduFVlMGj0tuBmYUZFOrmnJHbPQRAu
 h5jfvqeoBBvc1sSHLIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX/R1H7f6wcTEG
 TIsfcACeoVQfSFh4x2V6+t/4HZ869KfGqN886H/xHo4dXt/t4nWCRVPB1ThHeKRyipugJJDzcEh
 eztFKXYR6m5L4HGIE2pFs1xpzshxps8=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af75caf cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=cbNUTa_LnN-H9OvA4PwA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: CGs-KGT-cqdLD_I1SjJ7hd-dHRZhCp8h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

Correct minor style issues around white-spaces (e.g. double space before
'=', missing space before bracket or colon) to fix dt-style-check
warnings like:

  imx91-toradex-osm.dtsi:75: [redundant-whitespace] extra whitespace after :

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi    | 2 +-
 arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx952-evk.dts         | 4 ++--
 arch/arm64/boot/dts/freescale/imx952.dtsi            | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
index a44351133428..666c0cbac94e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
@@ -163,7 +163,7 @@ &acm {
 };
 
 &asrc0 {
-	fsl,asrc-rate  = <48000>;
+	fsl,asrc-rate = <48000>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi b/arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi
index 9d990937fd8d..ee89e96ce1ba 100644
--- a/arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-toradex-osm.dtsi
@@ -72,7 +72,7 @@ pinctrl_spi_b_cs0_gpio: gpio1io11grp {
 	};
 
 	/* OSM GPIO_A_0 */
-	pinctrl_gpio_a0:  gpio2io0grp {
+	pinctrl_gpio_a0: gpio2io0grp {
 		fsl,pins = <MX91_PAD_GPIO_IO00__GPIO2_IO0	0x139e>; /* OSM D17 */
 	};
 
@@ -122,7 +122,7 @@ pinctrl_gpio_a6: gpio4io14grp {
 	};
 
 	/* OSM GPIO_A_7 */
-	pinctrl_gpio_a7:  gpio4io15grp {
+	pinctrl_gpio_a7: gpio4io15grp {
 		fsl,pins = <MX91_PAD_ENET2_MDIO__GPIO4_IO15	0x139e>; /* OSM L17 */
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi b/arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi
index ea5e6055e3f5..1fb49e06d2c8 100644
--- a/arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-toradex-osm.dtsi
@@ -126,7 +126,7 @@ pinctrl_spi_b_cs0_gpio: gpio1io11grp {
 	};
 
 	/* OSM GPIO_A_0 */
-	pinctrl_gpio_a0:  gpio2io0grp {
+	pinctrl_gpio_a0: gpio2io0grp {
 		fsl,pins = <MX93_PAD_GPIO_IO00__GPIO2_IO00	0x139e>; /* OSM D17 */
 	};
 
@@ -176,7 +176,7 @@ pinctrl_gpio_a6: gpio4io14grp {
 	};
 
 	/* OSM GPIO_A_7 */
-	pinctrl_gpio_a7:  gpio4io15grp {
+	pinctrl_gpio_a7: gpio4io15grp {
 		fsl,pins = <MX93_PAD_ENET2_MDIO__GPIO4_IO15	0x139e>; /* OSM L17 */
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 047dfde20718..d98dc1358fd3 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -303,7 +303,7 @@ &asrc1 {
 				 <&scmi_clk IMX952_CLK_AUDIOPLL1>;
 	assigned-clock-rates = <3932160000>, <3612672000>,
 			       <393216000>, <361267200>, <49152000>;
-	fsl,asrc-rate  = <48000>;
+	fsl,asrc-rate = <48000>;
 	status = "okay";
 };
 
@@ -317,7 +317,7 @@ &asrc2 {
 				 <&scmi_clk IMX952_CLK_AUDIOPLL1>;
 	assigned-clock-rates = <3932160000>, <3612672000>,
 			       <393216000>, <361267200>, <49152000>;
-	fsl,asrc-rate  = <48000>;
+	fsl,asrc-rate = <48000>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 4930e09e0206..4a737d2620a2 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -904,7 +904,7 @@ asrc1: asrc@43000000 {
 				dma-names = "rxa", "rxb", "rxc",
 					    "txa", "txb", "txc";
 				#sound-dai-cells = <0>;
-				fsl,asrc-rate  = <8000>;
+				fsl,asrc-rate = <8000>;
 				fsl,asrc-width = <16>;
 				status = "disabled";
 			};
@@ -945,7 +945,7 @@ asrc2: asrc@430f0000 {
 				dma-names = "rxa", "rxb", "rxc",
 					    "txa", "txb", "txc";
 				#sound-dai-cells = <0>;
-				fsl,asrc-rate  = <8000>;
+				fsl,asrc-rate = <8000>;
 				fsl,asrc-width = <16>;
 				status = "disabled";
 			};
-- 
2.53.0

