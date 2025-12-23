Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEE334DCD6
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484324; cv=none; b=LhLdxb+NypSSgv3OBguHId4ePbW7+pQWYb47+/7bzSWwNByxIashf1H16/q+xK5Smt8RmHToKkDu2TINNPAg6tWQtiapLM9aFOGAryiFaVXY8k+1TcllsI9xNlUan6iyP7RgOv9S1CT87e6TLjgvC2DH8wqYxBpQjug1WawppGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484324; c=relaxed/simple;
	bh=a8UV6upSERzZiMxLa4pbl6Zm2TvGnZjx+Xqv9pXzXFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XiwQO0HGRsHGqsxw5zoJyWqaDjPqqmkxqqblor6SzzBUfsD6WpkpAPjcFMuGarzezYSE7svKA5UW6pb/u88kCiCpnzKeVi6EW+YeYIQN2ezKKadWXARGjYUgYmjT6TKOrUHJxYRxVeLkW2nd5+ROefBJpTFmtyRuSYEARUETbqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8SyapOH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUvNndcX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8SyapOH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NUvNndcX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNA0fSr2198818
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=; b=M8SyapOHuaKCmK6g
	DClYf9gv36ai/lBT6210yhTCG69DPzfV4PSPqoPtoAaH98/gPeppl/Els9g0sHu4
	dH3FiE7x3fAWRInzkFlJBSV461c2/rxqCsGSU329wslt4kBl970M/v5mPRadGxAw
	ZK5sWyqlaE8HNx9yFQKpQs+XAftrIBkQTy/sfm3jkwMePKoooxVtkMLdpw/wDB3j
	Tx/wKhUja8eC5Bb6/z/egevEOpgzblyWPRAcH1PVM2v/SlLeVRefgmPEwf1ifi62
	C+6no1YsDgwrvdY9aaF7Vt7ALSZFwNffg88Czh5lCnlgCqz40Nm/8svU8ItoGh2Z
	W1cJAw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b73fwurs6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:05:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f4a5dba954so113268601cf.0
        for <imx@lists.linux.dev>; Tue, 23 Dec 2025 02:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484317; x=1767089117; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=;
        b=NUvNndcXDN82TevrEc7Uiu0dqdMBxrfPf4ae4WZLi7irp3VFrD5VVNidNXY9RsCZwg
         DW8HEwaXylQ/o9obwQjuS8rFwsz5qkz5m99vuhD5RSnGXcHw7Um+wKNuc94Emp7ELJwC
         Fajp3mpmZ2DyUrvg0a0SboXfy8QxjMnRzwxOcVXu1BCkIeFum6pCF9xl3x3xujSvi5uf
         J2vZ7KiV0E9eSfGq3UFrZNhouEiL4FMyS3+aocf8aRYODOYR7Vfca/pZAvNBKpUp9NU8
         HXS1ODo3U7BWoCtiMvrsmsrhHNEy0n4se6eMrLUac7kyz0UahYbptmxRnhqjjWerjywS
         hYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484317; x=1767089117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=;
        b=K24RJqOetjIRvSu9WU/TH2uMmRxWGXmqZ/FIW/pSXzyUP0WZjMXuHz86pcncMmW7UD
         UUYMyVyH0tljGjzO0ZSlZrq1VVuRCyTpk0f1KpsAgTlULNGFMnc4JRXf8K6v6km6npOe
         oFP+39sSxdWCfpcJLFoKDolRRzZEEkOVEu0JC1rIyLjlwyMT2iYMylVFJPenGNywY7Fl
         Eu4xhsHkHh3UXYdZ1bP0bIStgw+Wjf8VtacCDMqNcRbMnsQkswmEkQaf/8Faosqi/lTe
         3kERlKPWi2/B8DXfje2H4GlvufNvKNaQ6yXbxbunHJL7QLQy/q2gawzLWEZ0PvzzPCf4
         Cmfw==
X-Forwarded-Encrypted: i=1; AJvYcCWSB5Y+TP1A4O0+Z0HCJR/h4RVBu/DOTAwGDDv+JewW6QQAtvrOT0xLxY8Iz6vWVPAfxcw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZYxSmNXXwPBUVdhovVH6p1c9AF7wL0k1yzLLXVm8HVxl3pyrB
	8ToDu7csHGMV0oA9hVuvkj/GIk6kitJ22K6q1nIs7/lASwADz3kqzx8fZKnRRolxpJzwBbEfCFU
	8qm/iOgJk5ktjUM2vMxw+T3/INzodK4RVaC2XtkYS35KAjzrmEkgK+po=
X-Gm-Gg: AY/fxX6PQI+0bDR8bP0HHdRLUuASuY/VvHpWSYQNnJZbv2LyuPCa56UUrYaiO/zxOBR
	fUfKopWI0ZTzU3SOmHtPDtbKtPxEtD06fSZZpN+EMraiuKekyOe+/W/gKS4rtOMQ2Kg8WcSqKm5
	hGZdxyBwKjTXBCGp5h6Y+px8A5CBIX/xuGu+6P4vN/U9qFs68L7GE56JHt1X9bQw3Q3rabs/H7N
	uNpV33Fb/isW5O8KjJvU3G/h9HHBYqszn1+DlBxJbojspo28jy3EPPDU7LnIkMDA0f5MZ+gXEFI
	84P+9bsdKgNmhOv2pqP+7d9unDNopVYYHaMVmKpcT1Wjxp5sfG1K1s7pAnCX72I8vxzQg07VJ4X
	N96YhZyoDcA3N0PYhnPnuOa8RwXUmQKNeTAElHp8=
X-Received: by 2002:ac8:6f06:0:b0:4f0:2b7e:c5c5 with SMTP id d75a77b69052e-4f4abbc7a72mr186179411cf.0.1766484317230;
        Tue, 23 Dec 2025 02:05:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyr+cM52EnsiY9X9JwqntnVrF5BgN6w1ESxc7f6rP9YwP41RmdhZKCpIzJx2dLAd8JqdWN6w==
X-Received: by 2002:ac8:6f06:0:b0:4f0:2b7e:c5c5 with SMTP id d75a77b69052e-4f4abbc7a72mr186179071cf.0.1766484316736;
        Tue, 23 Dec 2025 02:05:16 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:48 +0100
Subject: [PATCH 10/12] i2c: gpio: set device parent and of_node through the
 adapter struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-10-4829b1cf0834@oss.qualcomm.com>
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=825;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=a8UV6upSERzZiMxLa4pbl6Zm2TvGnZjx+Xqv9pXzXFc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlEeUL/Q15FR1biYp9tcKOXI8bceDaDmm4nY
 pSDfzSVR1mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppRAAKCRAFnS7L/zaE
 w5H7D/9X5cvGLgf2JsLNSOAwLw9m6VU91GHNuXNctR1mCyxTnB1fkm7XnMj0pPmDNHVPUKlxZXy
 +y2zTwPZV/WGJitWyRS/ppkDKVJhOAhqmd8/266hcra08tpgC6E9U7V7nKET2Q2g7b8ZoLc8CpZ
 mPy0wVx57FkzZe1y5sVSfkGVMFxQ3wnALDH1JkHHgzAwfLt6HArLLSL8O5d0qbxXdAR1+JT57Eg
 Sn0RwrdFX39zMO6h4kCG0SoDeH1nXAOQ6TzzcUxvq6kk8ySWqHCnoFfdr4A6o9+ELVCAGDD7zb5
 DWkHQum7SRuPbiOQvEvp/cs4ym+eCOB9MhsWnJbvImHjaxR3v2eXwEVwpwTV8M3GxkP6tooqRT8
 7iEeJaAoY1NzmtTdGoaX+6w12Fs11xnwTsO078o2mL0o78A1kcmhZWJKO3O3zpZTfpHpfERG2Yq
 brr0oyrgv+7HmaEwzDYh1lOW1+6gPN2nubx3213yEXiDOwMLHFY9ESAUJLLBy5iBWfbgrmwiGLd
 aLiaZXAzAtbFj5x4jJ7I0/SewRlt9itvnAlHyKMFVw+IsofVej07D4ZVwAP3AZDuf7+DOL6Dbtm
 Dp6s2jvv0ty9RTnVGoeSbXXoT/L+yuOuoJmSs6lsjxNpSCOTHtP81AacY0NC59lU5KiRClUdsra
 i6GRY6JVgaFIeXQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=694a695d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hPzHJ5MbA3fyhucrTyIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX1NutSvRSpkfW
 qW6Ai9LvueWbscTvxG2d0W8OZuu+CZK9uSyiqkOolsNEGW9FPZUysralZhrAyRWPJjvypdRlaej
 NPh3CT6C8jSSPGRZMF4qXs7CQdpOh6skG8aOx4AStdh0+vFEFhx5peUz5XGYFwNqe87kzRRG0AQ
 BqcyM5pG+cn5PYhV5dybvl7oN+Fo2coFp/HJNwtclU4dBx9cuAdRdLhkAs5fw7zT59QwDdlfExv
 bQOCU8jaxK8ViZPTdIzUAsw7kfEzGRuSAnfkALG1cnn600dLbP0BdfO4nOIrZ8P9L0DE7JwUsrj
 zoGOFZe8CegKbHQwzAazd8Gc/GxorO7rEJNNRjssg0fk2OKDJxq89rt71DGrOzEPYz2NL91kYvg
 ZsotsTLYqy2kVAp7JZ3xw/Cslsl4pE+3behWVJqu8HmJ9S3t3VM3hoxL+AMvVwWixv6/um7SatQ
 RLCrjtejbKbG7xljb8A==
X-Proofpoint-GUID: vNtmsgdi5KZDqZRQouJGn0O52zGi1sIB
X-Proofpoint-ORIG-GUID: vNtmsgdi5KZDqZRQouJGn0O52zGi1sIB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Configure the parent device using the dedicated field in struct
i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index f4355b17bfbf15c402e71096ccbb99f5a35bb479..78f8bc2525be6d1fd9a7907df4c253f33bbec9f0 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -425,7 +425,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 
 	adap->algo_data = bit_data;
 	adap->class = I2C_CLASS_HWMON;
-	adap->dev.parent = dev;
+	adap->parent = dev;
 	device_set_node(&adap->dev, fwnode);
 
 	adap->nr = pdev->id;

-- 
2.47.3

