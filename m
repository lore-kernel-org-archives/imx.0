Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A586155C1B9
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 14:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879521; cv=none; b=QAh8Zl/+1v4ordD+6LGaw4vdEUjJpOoZ2mBXfY0xugm3LnPEgKUrkqNPsPTypRQRxISh2bDTJbDRbL1hLD2dpLDij8hSglsPREf9GVKEPJsz5tCv4K7NcbTk477wi0Yy1QkQrhsDWJSuRTZ/jqgRbkZdM5WoHEvprFuS7EyT3/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879521; c=relaxed/simple;
	bh=M/9Buofcj2PjilwTJ9Q1IxG9YNjNHQfn3EQa0/hj4g8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cZbePVSyhjWrtGoMnUN2DY8gRzLd05oTudjG1t2MEjpBqE28ysBkywpJyv2ZBPVo5eobXsaZWfuKLzk69gdPcR/bsestKbApncdOKttycnPmzbsXO3CfPRgkV76maO4aVjZhSm3ym3xDRq/OJajq3p2BKYmh95VbzQPqnv0UEu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owMTvjhe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWu/sd9b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owMTvjhe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWu/sd9b"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Ej5G13483197
	for <imx@lists.linux.dev>; Tue, 8 Sep 2026 14:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1jTusoWpqoD9KCpjJ6MCY4jjjsYt3moPnSbDwm2nlw4=; b=owMTvjhep613AUYi
	4aYU2+30nMpcnpwJO5Rfep6JNhv4IcadNAWpS6ouRx4yDyrjf7QjLPv7rEyeTgqR
	pkL9wP2yLl90OATvPstL1HAn7ND2AjnYh8YVosI2nkop3fIrIcop4eT/L3x3qHsr
	QZlfcaHDLqpY9Oq5HSqTJpt56roGtDoNLtaqlZPZP/FFrSW14C4l/0XdUzpbE5LI
	fzNtGi01D9R+FypsogxfPd8wqyoiLwxOWXAyZAOqCZA8OJKo6KgtN2qs5HI68FI8
	JW3OVZyhHFM3zBBvDXvMVzSCiQg8dyEm41TgMo1wm51Z+SNp5lshyAEsq2/X0+zb
	el0aSQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjagujppr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 08 Sep 2026 14:58:20 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97cb2f3c6f7so356698241.2
        for <imx@lists.linux.dev>; Tue, 08 Sep 2026 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879500; x=1789484300; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1jTusoWpqoD9KCpjJ6MCY4jjjsYt3moPnSbDwm2nlw4=;
        b=dWu/sd9b4zjBXbSsUN/FKSMaP5IG5Ho+Kv8lY7ebbh3T9PSeLG7et6UK4PHVgr1ipT
         +/xW+urrnFMFizE1aJ8ptpatgfDKwyvJlpfmDuIAK7Unqa+rsPLGIAwbh0aROtP/fv1u
         u1JrBo5aFcKp402Rk5bao1C7d3d+mb7KkNS4XkJRFchTuxByGodmtKC03sMQZ6rNi8Fm
         9izxCr6aDECBJR4IowdA0PNuZMzq6kPZzPA/otMTbGZFRLkst7vjpqW9hWnDEHMwWwcq
         1Jxa/Z449vJUo1uBImvtpqv3J4RyYc0Z7y3rabiHNGmu4J8bZQggAs1ML/YCmbcCOVYz
         KrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879500; x=1789484300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jTusoWpqoD9KCpjJ6MCY4jjjsYt3moPnSbDwm2nlw4=;
        b=U9UVKRN4PbVjtuXr2zGSqBtL+G5iOuxA4OynQA8kmKwp4oGShJ5GHkta41J4gDfd8h
         m1Q+iA74sd8KR0ziNvsPEBNuf/0VIyQ8sLb95HHYt7xE848Qx/lUqcihvo5RpNv4ZTBd
         YgD+pI4licZAHkUBe/63REUsbBKVdoIhZr/8b2/Fi0fK+XnhYjGt3tpGVYgUSNtV1ufJ
         08EnLCJZOCCEULGiEku+Q7rcCQ95p8hbqJLhTN3K5UVS6Sg51vpfHxbv2yCGqtjVOmxE
         ta8mLcvJ1CH2ZPiIyGWh6LZkIgnQH38O8ZBBk/k1Jz/IYzfbqE7CfhN4DxBkjuQFXht5
         mm2g==
X-Forwarded-Encrypted: i=1; AKwUvBxTQ7ZZJy6CWdj/d1UkacNbDU3jqsdMX4QRNaarkFyOhFU9niTPwK6lReo0KdG1X99nL1Q=@lists.linux.dev
X-Gm-Message-State: AFuF++mMMiqmKHp1tffl9WcLn4tT3enpDsFTSr2TVV6aPcqsHWDgsv+2
	lnlYLKY7hGCvF+UStQ5OLgHd0bNTxu+j1z90vJUEG51bmeRaBfKfhcJvzy/CgLwjqyRDZU8/XwT
	A2/XPu2pUYVFr6nFXNMtMbCORKB8xYCGwwcmNA+s1MdTqwaLw0jWZTbI=
X-Gm-Gg: AYBFou3o4qpxBgTS68+6p4HG1o6WhotB5oqOly5iU9LfO9CInW9Yaa/TPql2tJJZzCa
	+/WioA+IdaLToiwqEiI3IWK1IG/mAjxThZO7uwHTAPUMOjsDCi7FrOPSE0cn8XQ9egKEx2f22mf
	aTUvrZ/mYJqALIr4GMHKNK+lv7mBauMFAcNxhYyVysRPH01xlqQsg7xniAILG9ZJuYDR/+u7awT
	Yz9GY/Dh92QODjIps4uYtapUF5ergcYFWl5Mv2+YN7ELxWLZ7ta0gj0hgxyHPzkHAPIBzm2jNYa
	Lii/S2XkKbrAY7yIbIN2rEPpHk6aMRz6Uo9DNvLkm89W1fm2orZy7K96jI+SIUXDoHO8unASB6F
	giDtfTnlt7MS1cDGoXZGbGSc6mIkK
X-Received: by 2002:a05:6102:2ac4:b0:778:30ee:f44b with SMTP id ada2fe7eead31-78a4ab31a99mr9637187137.13.1788879499702;
        Tue, 08 Sep 2026 07:58:19 -0700 (PDT)
X-Received: by 2002:a05:6102:2ac4:b0:778:30ee:f44b with SMTP id ada2fe7eead31-78a4ab31a99mr9637151137.13.1788879499260;
        Tue, 08 Sep 2026 07:58:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a2:f118:df09:fe51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm25191276f8f.37.2026.09.08.07.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:58:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 16:57:26 +0200
Subject: [PATCH net-next v14 07/10] net: stmmac: qcom-ethqos: fix SGMII
 loopback not set on resume after speed change
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-qcom-sa8255p-emac-v14-7-ec212b747a7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=M/9Buofcj2PjilwTJ9Q1IxG9YNjNHQfn3EQa0/hj4g8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoCJtPEfTx4lMAuscmYS50twwqIkudyRPZJ+SL
 07thj6YQuGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqAibQAKCRAFnS7L/zaE
 w7QzD/4wAkPdm1bk0HVl/ZJF/wSwT+FFKyLR7R6zsVVdqSLVbG98nFldIWBBhPCoHhWaa/nKYQ7
 ghiB/rKnjn1NjO607l+C6hKGRIjHhhIQeFTmfH6tkPTUDMYkoj5tNCLhclHbnI47ZcdcDGwFHQH
 DstjQXudubsIwU81fFgL54Mi6jMYquXGdb233Q6PBWFa7wNd5tnmhtYDwA60Ko43AHhHUJLMA+Y
 +t8bRqMav1PwRLp9XW6yLafq5BA3uW+VwmeciVdQHu3hIjWaOKOgzjdpcqRXpwyV7ptfQ3PdXdS
 LvJcTgA9f+1yXNRI0yCdULY+M4Iseb2LqdMy0XCWpnetbRvSjzJEH2OCR3Eu0siJfUwGVZmmlMF
 HjcMDh1hJuQwJ7Ej+iVTYo3K3KfTB81LP6BtA2WdDxvGSZSDKICJuAuK4z+hdtX3Ozrbsr0vx1D
 D+sRfyd1DP/QwVh0aGfKZmcUWS/zk5Tb/ZUJFx84TvCDXGRgH0tzsyT5elumuHqG1eDYa5GNtcS
 cTAGeh/iUjkMo61N5mshpV+kqCyOpFPh9RWH342EmuMli3GbOhyBCiWA3HD6Kun0XJSxeV4KsVO
 Gz7t4kA9KKjWTOBIGV3ASkOeawOEoSYwCODprNyTMVYyHIqN4Vh9SqwGDUauxzjecZQ9rWXBLTI
 iIAtQtTgM4Fw7hw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=TqLWQjXh c=1 sm=1 tr=0 ts=6aa0228c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=PjAGQVefHaMtIuCO3vkA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: By-37UYsffPG-JzxnpJUhKWBXg_vbiWM
X-Proofpoint-ORIG-GUID: By-37UYsffPG-JzxnpJUhKWBXg_vbiWM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfXzjPmwGW8a2fB
 jp8DKsVovkyY3VrFv2m982lddw4PhjaFj8KaqPotcqzAmRWcbuKo4/CZDc5Cihwx6RgPd8+h3h0
 BcIOvsNON7VuN8IFL3cA7UAqwBnrRBo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfX7TV64t1oz49o
 RnGNkm0tfjsIgNbTiLvyPb8JqoqoMrj10GIWqFhZQJhxlPxrUoSs2v4b3EDGjZA93ZM+cmTYxXY
 3bVDlxPe+HJDOkiaE4Lkt9ZZcagP5GW1uHD1P7N7CmDtfHmmIqN5De25UeOiK8VUWzuQcy1DU7P
 miVACAGdvW7IGznI40S5ucka2owZNm7LZWhA2wQI4lcMhoDRqLgzQH5l6f5muOPhPOpx+iKKo7a
 hx3svXcS4AZVgexrizenE+5ncjEzaSc1JAQukNjwco+woBzcqGdyD3i8mcZI3OS7sSExc8i3X/k
 4EZKvQ/mRLi/x15nU9gBvGLUpErqVbN5WHAtc1Mm1c9UAxGADvUAa3rREFeW4st9xjwgAqnQ6Zo
 5aL3HHyc8rJrApST363to/ZWliRaUL/rgNOE0pPC3xq/HzZ5UkuAIu8o89Hn3W1L/FBU7A3Jedy
 eydUN+drvegD6lpaWzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080161

The loopback in the MAC wrapper feeds the TX clock back into the RX path,
while the SerDes is being powered up. Without it, dwmac4_dma_reset()
polls a clock that never toggles and times out.

qcom_ethqos_set_sgmii_loopback() gates this on phy_mode being 2500BASEX.
mac_finish() now updates phy_mode to the runtime-resolved interface, any
subsequent resume with a 1G SGMII link skips the loopback setup and the
DMA reset hangs.

Extend the guard to include PHY_INTERFACE_MODE_SGMII.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index fd7414a50eb4e7d4d5adad7e93d49a55500c7f32..e067ceee016217c49d3b3d572fd9f33e562d1a75 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -190,7 +190,8 @@ static void
 qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
 {
 	if (!ethqos->needs_sgmii_loopback ||
-	    ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX)
+	    (ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX &&
+	     ethqos->phy_mode != PHY_INTERFACE_MODE_SGMII))
 		return;
 
 	rgmii_updatel(ethqos,

-- 
2.47.3

