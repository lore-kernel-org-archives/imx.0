Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4463D1CD7
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 09:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786093823; cv=none; b=DcR4HLbviFp2bwiXEmnbDnSuolZKOV3BPrfmIHYIa3phkmuq5te/fAdnzVEPKca8DucRRV3Zdsl5HEm193MmBD96FfqabfpH3ua0KsY6VPRGczwKNAoqY7D2ddHAUg9M2lL97QC8gHL91heLTCP1zYg2LQZPwknz28iAWdw4qlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786093823; c=relaxed/simple;
	bh=zmd+hXMz/1zZGAjuKxtwL7umtro7DdjiUAmgu9dyibQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qmYOxUcxMoeWh5MkoBKUAURq861aN+ULCRAlavdM5qAgTgXwXiVtTiz+o6Twg1eZfw6+e2owOYJ7K1+OQsgoBEdaLigGUpmcGp5oJbf/GS52T6fzhKMYJh5SY5fOcOBM9q84AakrU2/0caSjx9zD9ej7/KtmN2ygTHWZD+xpLQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nl9DF6rD; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nl9DF6rD"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-848643382fcso3513639b3a.1
        for <imx@lists.linux.dev>; Fri, 07 Aug 2026 02:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786093822; x=1786698622; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElLqReA861EolgaVnlXggqBl/5aqmb9EAPSEfZwWA+w=;
        b=Nl9DF6rDqQ8hGoAttb1tde0bmpFmrJPhyOt9Q5Eqm6P+awWpTngtUl1F50+YKMCm0g
         7dRSpaKZb92nVcXXUHpVNZ7djlS8cA+t0i9h3m22/BddOV4oh/YRUl0aAQm3ZTmoKOah
         94K4TP2Rgq0bWgkpv/1WtGkuDZeh3YW49hZhb+uMcGgX5LrbO/vtGpqddDldT6bFNvfp
         zMp2iXclL/OCqLKVbmnAOxiJa2eETZMJ7jaQCzbF5Jm4J5NsShD6Y/j7dKPLwopSH195
         dwAn8yaO40TZAsFIEgOVlM6BJ3XImSX7eaQ3sHjvGFsshcPTcDpE/RApnx3uy+TCuolp
         +3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786093822; x=1786698622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElLqReA861EolgaVnlXggqBl/5aqmb9EAPSEfZwWA+w=;
        b=D+W0Z9WTnhfrL4E2Aa3Oy78RXXrlWXqvSF69JRfbvtFw1ASgJVohIiOFJH49ITyG8y
         YNRJCpIQJbRDjaLXlM9BjRtDn9PBjUms3ni3iSvHZvfXzNNhOmb1vhtGquTKldjLkAc2
         76hNamrmmMfPbCNVHnnTc+v5187yK5/rrPc5eD4SAylHvoHh+XqpsEpRa8CXjxYb5mu/
         3r7kZd2pEr01qVE7qVg0jAUQlyjBBEub3nmD+0AtsF5pxxomvmjlljwN1BaR5ZbWjvtP
         K3Pizi/A8Jp4RUf8+C8DKBohgZ/De19SuPIOGdTlhiaKotLdj/tFJhoTbfFwH34EcWNL
         8B1Q==
X-Forwarded-Encrypted: i=1; AHgh+RqJbz7clepPSCG/8QfTmXH7qSitRKi5y+GrEkyZJr6/YiI3BFwbuDJMCYmd9mYSS8W5lnk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvKhHN28rAXEQ67fZKjxLNbvTxAIlSkeT8J/abJ3seV4nKZqI6
	QAitRk30tacFo1n0s/vIsh+Fec5Y+h688uQJpP/S7KPs33Qt2n76lFPj
X-Gm-Gg: AR+sD10FamAObzlbyMfGgsz0uualGeKosx+ar04GVyIXPDEhM5cYMzZs6NCmq2803Mg
	OHWvhfUAByQJbbKQn8rEne62E7MB1OcBWRGsRiWKH8ISvFNv8JUZFQtzDOqMUXB6oy16mlHZSC1
	Etqb8U7dAE4q++A22BhqLSv6Kwf6WTl/R7o6HKRxzTqPu3J7H5SAxZxH1MVS62C2zJkgnNIm+GZ
	g/6dYJismGlackMqcJ7/Q49hj+Hcs2TT3gKhVzOeQltyHwD8WODYxYy/N9k5h07zNBkqFxEmXfe
	t7IBzZ2EBlC0A3nLRwYhPjLqr+c64/fU56cfCkglYuRR0z3FDnMIaY6fvTs/X0kA0XN29prlMAv
	D5g5bIjdcyav+2KMT3HShybKOEKgipKhTfOL7QvtPzihzBKyRouS06xxNci/T1Uk1OyiHqRE18j
	EwLrJ+BF9n48QCOTox/DQ9/d6rYPuWgSJKVLDrSdHwl3DiNk3ZR84kHG4fYiPXIQNnB97wY6RHr
	Y3Ci5MWNXowlBNcR6nC5YNmIn/a+XlngAGQ0UuyFIaNGP3VIUQsJFqCIAKP6WU3MDGI+jhtqJqx
	ihBE
X-Received: by 2002:a05:6a00:f99:b0:845:ebbf:e7be with SMTP id d2e1a72fcca58-84f2e03954amr24222618b3a.23.1786093821837;
        Fri, 07 Aug 2026 02:10:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a552859sm715908b3a.42.2026.08.07.02.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:10:21 -0700 (PDT)
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
Subject: [PATCH 3/3] serial: 8250_mtk: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 16:09:45 +0700
Message-ID: <20260807090945.41690-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807090945.41690-1-phucduc.bui@gmail.com>
References: <20260807090945.41690-1-phucduc.bui@gmail.com>
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
 drivers/tty/serial/8250/8250_mtk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index e6a56cf54ae0..d0d2aecf9005 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -587,6 +587,8 @@ static int mtk8250_probe(struct platform_device *pdev)
 		return data->line;
 
 	data->rx_wakeup_irq = platform_get_irq_optional(pdev, 1);
+	if (data->rx_wakeup_irq < 0 && data->rx_wakeup_irq != -ENXIO)
+		return data->rx_wakeup_irq;
 
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
-- 
2.43.0

