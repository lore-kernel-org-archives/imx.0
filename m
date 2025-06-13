Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A2B24169B
	for <imx@lists.linux.dev>; Fri, 13 Jun 2025 19:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749843819; cv=none; b=sYbXShVdM4MwVC1kfi7IYhjHD72uM7i0J9QTLSI6KGw2xLO7dYWDio3kMX063dIdtIiTvxybhNcXhbMPtJ34BnsjLF9jon+590+sKb9Y/3PGlKr//DyowS/20Ofu8/08JIjAE+ikKO9eKcN1I0IygagCHGbaYHgLkYnT/6dC1Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749843819; c=relaxed/simple;
	bh=ZaoZKZQZADem2BCfh2iMDReIBn0a8RhtRJb8n9Q2ESk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MSga+L7pQryMjy0X8bFi6h1X9HjSPZ1tnHxx0pzhTZTwsjHnOThPw4WVFlVcqqKYxKsNM/bjD+4XUc0p99O2wZnUwH9XgY3wLaesZBHbMxrCdpLVirIIDzn7ikQzN13tuCw0XGXOegRKs1ESXYS4TeVZqcLE11KKbXiMEKOqQuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8OablL8; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8OablL8"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-adb5cb6d8f1so438596466b.3
        for <imx@lists.linux.dev>; Fri, 13 Jun 2025 12:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749843816; x=1750448616; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dgt/50QF/JqAiUR0QT0950rpV9eyWAU1dWz6lsV+G/U=;
        b=m8OablL8pZE3mUxYq+ENFArhKQXh606vsF/PY1pWf3sRHLUG5/5TT+nvT9MvLKj5Ni
         d3/Q7Ghuj1Dr7TrrkXnXLx8HeL+fmhreyu3P8/CJdj4G/nPvRCF9avHHfNCJj8MXu4r3
         8gJ/JBA34ERdg/d7+g6CMxxDdeuT6dPqi3WzEUcL/lojAfC2yFBmzLDx0hvNN/AD9MPr
         I/n43IMgjLeIrQDCbGyUX09RS9eiY8URz/lomfEH8gJ0f6M0IiamczqyDvgmuueZeAiw
         4MPMECpaBLQy73sHb4X1kszlOrl9iPBVAgPa1IX/o5p3oo3GLK+ZrGF8S0TfTUlPXP87
         8hdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749843816; x=1750448616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dgt/50QF/JqAiUR0QT0950rpV9eyWAU1dWz6lsV+G/U=;
        b=nXUmd4VlaX/KqeiCNNWq9oelPPxjLhDwwr3ZN+8f98PFlYsqjOTH0iS6APwhNRRWiE
         QpEH9RIxgDnQlhY6LKLvWI7BHqLoy4zvl6ClX5WPm0Rn7hroMWlmq4IPvh3Wj0SQ6SSi
         giEZh0J183PA8g17w56Ag89pEkUy68gjK+2QnPq7/ngm4J6WiUTevyI7PExdR91Eis9L
         Xl7wrGt1vlqI3OEHuTQRCUYQ+xkw1G74m9MH3s0Ch15XOG/bsRaVsN67uOBe8O4kkqkh
         2jlFNUllpDBsqpAZzJNSSEt6E0xypnXADDNeZjRzj8NT6mxrWOL4a/UDZkO3gcYp+pfu
         4ZUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxgxaAdzWuJh5QnEAlGPNawbKdNmyTPWbkFRDOqsOq+b8visdWzhjypTx8Dyo6jIRRQgA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2f/bNkmyFjJykfOQUh5cXPS6hDTX2K6rxWj6GCWWZjgom+O9+
	p69mChvSReCS4eyEUcpSWFaNJFhv4GDB6jKX9POfEr9gqvAZ+VBEDJ+T
X-Gm-Gg: ASbGnctquf7acIZ/qBN0ttl5OcAAmjs1f8Id4bReN+Uus96ynNinz+hk9r6VvtgLB36
	Uygeld+hgYRlXW9lxj8MvRQB5kaptEPY9an3c2A6v4zYSk65Pz6i3cNXjTobHIbL2yH7giWWGHc
	e+r9ukX+MPnlAKtQ0ZASl/Mm40lmOltpxZYjJt/2MQdtZ0ZjPZtQoPIHWIawvTtrW+irA12I9yM
	jrS2sYsILFVeaCk+u4U6GLtzmNedK/oJ4QgDnyy7OErKRaKwULXIgQr6lmEBPbNYPEcOePti11+
	JX2CVoUt5AIAyIn2u9Rueg227z95ylp4HA1tEvEi1ZMMTqEJNNCFdTcv1UizEDjgIgNyTlvSmcX
	tmw5L+4Q9EHe7xwbXKL03zVI=
X-Google-Smtp-Source: AGHT+IFpVmmbzidAFPH6s1at1uCKqw6CJ9ipqwmnxcHj1rMJRNOo8Y5nrc4qCBez3R9Guw5kAWM57w==
X-Received: by 2002:a17:907:785:b0:ade:7512:d9ba with SMTP id a640c23a62f3a-adfad358c88mr43903366b.26.1749843815851;
        Fri, 13 Jun 2025 12:43:35 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8159e24sm176836466b.34.2025.06.13.12.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 12:43:35 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: SOF: imx8: add core shutdown operation for imx8/imx8x
Date: Fri, 13 Jun 2025 15:43:10 -0400
Message-Id: <20250613194310.1128733-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Currently, the DSP core from i.MX8QM/i.MX8QXP is able to operate while the
firmware image is being loaded. Because of this, the DSP may change the
content of the firmware data just after it was loaded, thus leading to the
data having unexpected values when the DSP is reset (via run()).

Fix this by implementing the core_shutdown() operation that will put the
DSP in stall during suspend(). The stall will be removed during the run()
opertion, thus guaranteeing that the DSP core will not be able to run
while the firmware image is being loaded.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 sound/soc/sof/imx/imx8.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index a40a8047873e..b73dd91bd529 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -40,6 +40,19 @@ struct imx8m_chip_data {
 	struct reset_control *run_stall;
 };
 
+static int imx8_shutdown(struct snd_sof_dev *sdev)
+{
+	/*
+	 * Force the DSP to stall. After the firmware image is loaded,
+	 * the stall will be removed during run() by a matching
+	 * imx_sc_pm_cpu_start() call.
+	 */
+	imx_sc_pm_cpu_start(get_chip_pdata(sdev), IMX_SC_R_DSP, false,
+			    RESET_VECTOR_VADDR);
+
+	return 0;
+}
+
 /*
  * DSP control.
  */
@@ -281,11 +294,13 @@ static int imx8_ops_init(struct snd_sof_dev *sdev)
 static const struct imx_chip_ops imx8_chip_ops = {
 	.probe = imx8_probe,
 	.core_kick = imx8_run,
+	.core_shutdown = imx8_shutdown,
 };
 
 static const struct imx_chip_ops imx8x_chip_ops = {
 	.probe = imx8_probe,
 	.core_kick = imx8x_run,
+	.core_shutdown = imx8_shutdown,
 };
 
 static const struct imx_chip_ops imx8m_chip_ops = {
-- 
2.34.1

