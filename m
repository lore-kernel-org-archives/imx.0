Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492793B637A
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 09:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786093806; cv=none; b=BJt9kg0ropWrrOPRvaozeoY3Y6oCiKLmrtIKtOsYfLVA/xAYHWLMZ5Tn79kCIKjW3F/f+W5+UqDLb/wRgcpgLxmU1hhF9vR4rbbO8C439PHttNjNpDAazxXVuFadz0d+3+qPC8+nwlYxV0SvdgeZcv5ohShzKdNlhHTG2xq3dyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786093806; c=relaxed/simple;
	bh=fXE63t+reDfxE+sqDQQS8BlL8hfF9EAW6qlirdeQqlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I3WYO3khfy85BnCyuZ1yRxiV9aYebHnAK9BwuPllaCtRJTA9p2YvF9mJxMjSCVMSGPOVYk96qBO5GptAtBR8ycbzGRiznqifefKzkge7vgsFuIx7vaMteIY+sSMVZCCSn3ksfLAKk6fIbDHjazU4WnmM5D+mZSNfoxAoSY5Wsqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pe5VAVMN; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pe5VAVMN"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca957432c7fso2974124a12.1
        for <imx@lists.linux.dev>; Fri, 07 Aug 2026 02:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786093804; x=1786698604; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KIWGEh9Ufcm6qiadbjnDxFEVPk5jpDGnhvZvsj6Ps4M=;
        b=pe5VAVMN6Db49AHd5FYgTLp64vP3kg26dbQ3z+EyhdJAPMjZOeRcP+BWjJuQJl4LxE
         yp+YcU+SdktE4oGTfd26qnGUoeSj3s+wqYWN30HB/magh4qopLLspVi1fcsF8Gocm/0f
         8NhidMxzTTVndLdcxwC8sfnJbotlRGC4gEZPB3/dmaKpNCWinHUV/W5d9++Uhuwp0LHi
         SFmhJ+AxhcYxaxV9fJArK5lwubier+lI4XqK1XchWvYV/FlG+fNqgfXdr9tjQEctrmfn
         x8J1ttTjkt+D4OEQVUvKNbQ6Lc8h+UDpV0Da3EM5cT/yeOzCtZRGtK+FK1g1y7CNikKm
         WjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786093804; x=1786698604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KIWGEh9Ufcm6qiadbjnDxFEVPk5jpDGnhvZvsj6Ps4M=;
        b=Slfddr12Qdmh3RqwobU+mwJZBNpBvTSHyt5adaw1DfG1pE/M+FTwkSyx7/RR5Wf4X0
         d8zNQ/NG56Qi5oFDtDYiAp0mF3ifPDnpiug2V4+LI2ctbK5OZ2mLYBeGQ6gMMrzZwGQK
         EIYVmDF8i45aitRETk6XI7Cm7AhlkdJyzAm8iam1dsa5aR+mhXh9zpi4zlw1g/HoZp14
         x1UtSz9wf4lm747N+uWV7y+XNpbSj2PxqXJNmx1zMWO25NRUP/DPyPiYrmxqNHwm9waK
         1cdf3Wn0WVftZ5mFOp8UX7MnRJp8KtOclITkdBl4VVh2ZPhRTmJv3EEPJyadeYvQ7qVm
         +kEQ==
X-Forwarded-Encrypted: i=1; AHgh+RqdBkVcOiCn+wdOyujdQaswiiry9f3CGmhzB2mtvFx3oB3IMDObbP1SEDKeER+l/IbSCZM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6tljycdvBhGlM8rhXQxZdwXODFsbLxyNlsS8GzMnE4TuBsGj5
	6oG+EdIRR872XurDuamC5L4Kz2dW+0UPskj2KB3x+jUJ+BzfQ1m5dA31
X-Gm-Gg: AR+sD11JK+OoVujMGoP8IwV1eo6+a2FLdqJJPD1+uGm82aB3aLCqDRBB1ouM7gUkKaF
	hL6akQkaKoYaiyX8elALA4r5/ZhK5E9LR77PqlXtVhuVUfeH6THCPbVdbptRmGpdyIzbydSAh1L
	2r4qCFgElmlcrqNFoUq+h8SN0vnU3BDI4531tY9Mz7vuMwU/ANBbhcLTCNQzsn2X0NifIm9+1UZ
	hKdRSzXbXUL8+uRtF9nLfeNfq6E10SRqBJZorxlOjYsJt7VOLSadvokmMMQvIYyJ2QUYpOg6tma
	2E83BnAk8OwwpfQ7E0ynRdZovqmzM8H5XTT0jxLIKSNVH1n4nyg6N7juRxEpiN9UHSVuf2EYL86
	SpjHW5jecAYguVxCYqurrW54sIZRr1i2AjrZftNuDMl47SI6xcKZjNAomsEzbBvOn+yuaGTWj4f
	n7iDZN+97zqX9YHYTlajbBTODSJdQuTzUiEKcir9SPzhlsoMiVQbiGwCK9Eb8bfipHErg2k1DGr
	0nQJXwLyIZZ6ZpA0dSHIHLmqXXXdAfbHHwvmBwJLeoI1ZEkZ9wfV8VWkuiaZENz3RT49qZcol5h
	89r8
X-Received: by 2002:a05:6a00:a116:b0:846:bc60:5bf7 with SMTP id d2e1a72fcca58-84f2dfcf7f5mr24182425b3a.6.1786093804529;
        Fri, 07 Aug 2026 02:10:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a552859sm715908b3a.42.2026.08.07.02.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:10:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yenchia Chen <yenchia.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Robin Gong <yibin.gong@nxp.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Zong Jiang <quic_zongjian@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Aniket Randive <aniket.randive@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] serial: qcom-geni: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 16:09:43 +0700
Message-ID: <20260807090945.41690-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 7ead87b4eb65..240a6d67d847 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1883,8 +1883,13 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	uport->irq = irq;
 	uport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE);
 
-	if (!data->console)
+	if (!data->console) {
 		port->wakeup_irq = platform_get_irq_optional(pdev, 1);
+		if (port->wakeup_irq < 0 && port->wakeup_irq != -ENXIO) {
+			ret = port->wakeup_irq;
+			goto error;
+		}
+	}
 
 	if (of_property_read_bool(pdev->dev.of_node, "rx-tx-swap"))
 		port->rx_tx_swap = true;
-- 
2.43.0

