Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866C5559CBC
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 14:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879512; cv=none; b=YAXiRWBJPBTZ6R41BlGgXYHT8Qr8opJOy8d9BnBLqnlpwVeys4Yn5nI2WjOhktSJ2FdYRF3J/qr/44ojKDWoBis6EecE6Pt1aFVmaY2xpEvP8S4Mnm0Iu90Hn5HRYEpFTOY5EEit1hTTUdKzzl3WHUL2r3FIR4Vtw2ESkzUBbpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879512; c=relaxed/simple;
	bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tedpAeUEm2wK/md/nFJIkeIBAVVBCAlV2sqFM/8TusMHDw7kagW0nOnJjlCmAP/g+8I9jYKrjQkfT8TMFgVLVWhDz/rKlyYAnxSjrDQn6jMVinhxh3wCvxzZ3/OE8Ba1OPl5lDLb8+GYZpvmMN67I9xda2C93njp3dFvQqS4RAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TlfY/+70; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrNlz4J0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TlfY/+70";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KrNlz4J0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Ej3Ln3275676
	for <imx@lists.linux.dev>; Tue, 8 Sep 2026 14:58:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=; b=TlfY/+70lYPBwKfG
	8C+dPQvcTQV5IWcBhMbPO3VQCQZbx9FGQlPPtyxXFmZ2ZPNkrjBxPpSwG8FxPQRX
	IkPviXWaBMs5F7rOTPVAklbcam91LZ5oLtPhuhV27it6Ai6880PRcG6CqxGaf9Ix
	kCawijrWOm5I+qk/2ewAvYYCZd175r699olAl6bWXKgp102LwYvOsdFY31olu5SZ
	Ug6q/2vRt+a5KBrUdSgr02i9M5w5Vbe13ToeJ2JPg2U2XESm5HdG5WY7tLgMbfgt
	hIgwfGrq5kBar8GOh6Be2mUM+m5MDsCFQGeVHzke756Waxuz8EejSIJxKkwieNvq
	qIa3sw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwm4g5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 08 Sep 2026 14:58:15 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78a686d205cso2316191137.0
        for <imx@lists.linux.dev>; Tue, 08 Sep 2026 07:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879494; x=1789484294; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=KrNlz4J0IsNe+PfYPp8tcl1LIb+JuvJMqj4JOYG+OMRJaiysvfSSfNpIJntJ3dkGTB
         o1KlH8j3agPMhVVLxqUd9Sgea6zxPi9PcXw7qheAAVxy9ONXqEceSsbPwa23jxFdLltE
         JnSAH0kJxiz8UDjj9ArBWsGres+9C+gaiJqjbR+FQS/9dNHcDPH9hCswmdsNhsOK6XO3
         viqAL8pppIGlsBTUVGOakkb/4SLWoc9Hk60EIO1Wi2R6nFm1WRmhcUfbexddsQ8RAsOP
         jnIAxLcKqf0uPTIXhRMqeEEqaSpO4zGwanJ6jP0ejDZ8P1g6Qo7y4VmUY4ss/kOPm2Vv
         2p/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879494; x=1789484294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=Vk6ci7Wcn8q6tDPkqFlDflmL/fd+s8L/Ov9IWsRAfyc0VpyaO/PWNtHEYSlWsXSTuA
         bYskbmVEnZ0Rgn/UELNgx8nZ8Er0d3gOd9hJIdCQuXH5aUfJ0g66V74TOHSH+wUlg0ku
         VNucB+CSyPxnESVYrfTkncVZUksocaQsaMqavlCk9rS/tsJnfIZED7NWlqXVct6QUv7j
         AdfLPLl3vowzKWmWN2wxN7FNeGZbWlCxDQW+t/xwDyycpGMSaFohCifCtKCYMrOKh2jm
         uKvnu+IbQUO8PlOZGTIuZ+migs1LV/pEoAZfocj5jKQMy27Zm+8sE5TLFSQSucz0qQr+
         5xiA==
X-Forwarded-Encrypted: i=1; AKwUvBw5DLEArp2CjM8oU9u/FLqy7DzydcVELvUFtYbKXtYBMc+ImhxmArBUhCyeD5KDVr8diu4=@lists.linux.dev
X-Gm-Message-State: AFuF++kWSC+r5gDmRI8btfQEAgzmGVWIya5wHDPwfhtbqPy5cAaPLtpw
	1UVbgmuqp3gJ8b4l5hd8DUgGqwTMMqOPXpXBiacBDEwZlq8zr9NMHl/iMcXVfIJ8tFfeO+nALB+
	s4VPupSfMN8iUUBX4wiP8dynaeq/wqzYH4c01zzzdjE5d9lVxVqBhfpg=
X-Gm-Gg: AYBFou07f1YWGQkwwAxTlZVJRH3sui2lgz+qvbTwhMYe74ZH/E+UgedbNWUyoUm+bIf
	GD1LVQVzkUGEFEoxuqsRyoggeVnRymAFfoL5A/+P+VAhWnYBjJD2U3JIv0SANbpvTcoxbi4yXmy
	QBJPYQs4uKf8JdexycstcAyiNVSZxOFrHZyKyiHciZINQPQWiK1ET9CUEM93sx6DjOQ1f/8An2L
	kBzBgh7dqkW+blTueFcrv8gW0AkbJm3v+Ugu9r9LMt4/8V4db3gY8Iunnu2Onk2PgsB2VAY+aOZ
	lM+ZtkwsghOU9UyT8C27Erp5Okbdco6BBMej8H5lLMmcyYB6GHTpBKeE68twCRPCFgazhMNDVvj
	yYUBmN9QwbWFSJwJKvWDC63fzUGSC
X-Received: by 2002:a05:6102:54a8:b0:785:c960:ff85 with SMTP id ada2fe7eead31-78a4a8e5299mr12862119137.7.1788879494602;
        Tue, 08 Sep 2026 07:58:14 -0700 (PDT)
X-Received: by 2002:a05:6102:54a8:b0:785:c960:ff85 with SMTP id ada2fe7eead31-78a4a8e5299mr12862044137.7.1788879494031;
        Tue, 08 Sep 2026 07:58:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a2:f118:df09:fe51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm25191276f8f.37.2026.09.08.07.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:58:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 16:57:24 +0200
Subject: [PATCH net-next v14 05/10] net: stmmac: qcom-ethqos: set serdes
 mode before powerup
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-qcom-sa8255p-emac-v14-5-ec212b747a7d@oss.qualcomm.com>
References: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
In-Reply-To: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoCJr2HJy3rNOohKIofZRC/HrZwZ9P0zZOWRXQ
 S51BxunZFiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqAiawAKCRAFnS7L/zaE
 w1OnEAC2YRnquSZ8wqTHNjfW4N3WzbgI3U5rbMQqt5bXxKUwgjLXrFzhBTY8uZA1Uu0+YoP08u1
 hQ46nB7p89WKc1VrhJY1U3TBBxcnlyLqIkl2hqgHtf1fSMUN4qgDtlqVocrwtLo2m5B+ZkA+SNW
 BABXgXrQBkl+InavpYsVxDOsCYpsIkjcfcmemRkzzDrsydaAUlT8Ov9GJ2BYIOGg7WDuD4Rz+ik
 d+Y690KTRpYoKbThlgXcMVH24nuDtDCJNvpc1ldLVtyFga2uu6MbHTKv/6UbAFvDX+QPpMGFrAe
 Oy6Toa8Mi0W/hKPw3y8okYWSFMnIFgjaM4kxHqbSwGsaNVS0b+9EVcOCZtCExYoaUn9Pimgu3fT
 RtbsIwGW0KLpbisASrL4SCIbir8WO67kRTu+ghSfBbEDc6lZbBQ3rj1O2Of6YuerpwjRD3KvuGL
 ipmpqBLUgXTallF0viP/60sN8lmlCHK/P40dgJmAQqQDeJ8FPkbVhTaFywQtHpXvZqHlH8Z4PAu
 vYOZLTFTPtfeOKLdmOcry2ULa5ykPNwawmv9hfmoKv37Jms7ueFEvSgx6/1ZJOGmzQQ7BGMKch5
 F+tv2Ty8o6jwM4rTrDx8+PYus1TZZCr5JRunxR90WQ1+tThTC+LYar9fGlOy+BPfOTWZf4VN7WF
 5ZP/X8M2ZwFQnFg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6aa02287 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=lIIuVyqIMTwqdMfQNTsA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfXwQP6QyguakTB
 CsEDd5ZMLuTQaKTj6pjZ7rCuzi4ZylmXSWqgdm4v4xq1AvFuAmr6iaE94zQ2Hi9y+ap+FR2EO6x
 sCmkXvSum243/mG0K2FEZxxspoIsvsv4BxoP8VjRh9PHBXt1HSFWj4ZfHYV9o2C6NdKDeVrKiKd
 HQ9Gs8bP6zgMCc4eqiwCIyTODB9mOAd1LtL59fdFMkrNC9/2PYcSN7fT8pjDcHvjCd+ZPflvYJf
 BKFeGMmbbkdSoFExR7817k7XlRzGJLcyRJiECTdovgKFoQ9CpWD1Hq4L3cqqispKdcxqUSxRGtW
 M8frGMjy6QFMJPO6a68La2qt82Zt5iLrdXgeRAFJjJkibgSgGNTaT2q3Y2ltR8C4gdQ593+Ho/f
 lJ+2a17gHNxVwGPclLPou8jP9MMiSlYUP7P2+xA97xlHy8R0YbcfnTmw/iOVXh058RWPXlksAnD
 efGE03v3sHYAN208Ljw==
X-Proofpoint-ORIG-GUID: 5c77PlJ9yUogbhjHhTmcXJeaFUuNGUJu
X-Proofpoint-GUID: 5c77PlJ9yUogbhjHhTmcXJeaFUuNGUJu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfX1RGvM1Foh1sl
 5VahAsxVp8NGx6V3d2DjrCPbDGY+BiDdYu0TvNvwKom0FiFzhwBb1grDzJg5V8J5LKYC8UbxuFM
 WWSWGIQUNHwI1qr1KB6//sdPqeKWOZ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080161

Call phy_set_mode_ext() before phy_power_on() in
qcom_ethqos_serdes_powerup(). This is harmless for existing users but on
SCMI systems this is required for the PHY driver to select the right
performance level - which translates to the link speed. This is done
ahead of adding support for the firmware-managed EMAC on Qualcomm sa8255p.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..47b70b5e706f221c01f1c0ae3b1acafae6641165 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -601,10 +601,19 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	if (ret)
 		return ret;
 
+	ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+			       ethqos->phy_mode);
+	if (ret)
+		goto err_out;
+
 	ret = phy_power_on(ethqos->serdes_phy);
 	if (ret)
-		phy_exit(ethqos->serdes_phy);
+		goto err_out;
 
+	return 0;
+
+err_out:
+	phy_exit(ethqos->serdes_phy);
 	return ret;
 }
 

-- 
2.47.3

