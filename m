Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6EC1FECC1;
	Mon, 27 Jan 2025 12:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982007; cv=none; b=my+hQNVhm2Oaywz03mXSZxP62aIigNnTkeMcIauGy4jTyKxnz0oGPqXaQFic2+D12Kb+Ky8CXTvTtb8Mu1TUq+zzu5LQszjdr4PpCZO8rKx3zICTEmG2bjVRFF+6BUzyeMVcIw9H5cDLwgwEYMY8Z0L1HcJsYT7jvmSuTQavUb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982007; c=relaxed/simple;
	bh=1NlgzpHbgQbix3Tjr1cyaZKDfkb/onDz8/2tsI8b2ZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FAFtSXHhgq7auKZbGNnHYzE0jw0/Sf699r7CTO/zURC4OO58p+tIyiX9s+/ESg1rHUiRGnZATUGFIR2i3yOqJJoW/bbLDSNpKjWCla+OVQIB7dQL5t8+6cJz8YIDSPeH4xV4L2IMFz1bUYYrtgH7z3Ggf7BGKsAGDJ0FVYk0D6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbJ+J8iB; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbJ+J8iB"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38a34e8410bso2194383f8f.2;
        Mon, 27 Jan 2025 04:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982002; x=1738586802; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nESEkcTInuMDz2GsfwYxT1TFIHgtEftiPAD53B8tFuM=;
        b=EbJ+J8iBnS9XYzIKvLto1oe8Sl7prbR/kgXY0BG9aH0xSTyW0OIXZbJxpX1sAkgM77
         7Fr1HEjEMDSQfdFCPqF7hr8XiwH5NPXqyLalBtp2MvgH5de5yqnYMrFwRUpqw4yZ9ZpP
         1C6C6rL6JDOMukm4XN+zjIzt96b86m+S15BVyU+U9YFGFxUFJrAxdc/Pr6jSR2oIuOgB
         wythkBMFNQO4GsqJUEFvdbxssTzH0LWyN9U3/F/wzl2u2VgqdrcW+Sq3wEDnBqbrS6Ml
         uZFlEZDakgNTeI1A8LJLNj6H9ARP5Vt4fz/NvtIurIVSy7OxAtTpsaRIWRaCYzqbt57Y
         7kRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982002; x=1738586802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nESEkcTInuMDz2GsfwYxT1TFIHgtEftiPAD53B8tFuM=;
        b=EBHufA7qm9bFqWXtuulVHxlhUdnONE9GaNLDFy5/dTuohwZO/rZOSEZ+0KBihTBN2R
         jVOhTRDlbUtCLOdsw99SfOCa4aHNwtprtt71cK9msEySktNvI+V87xd37dM7XVWMB1Vo
         MzzIuxJQkEmDSP5IB+dlHNAg6v3ErrXAVzQmOcgpBsatg5h0uSgcsAObJ/o0rynhAaME
         cr5jBPIjh9H7FyLll4aVn3zv3AHatC5oKFyQ13mZ9cT1Df2YLb3DqxrFkz8rH5vj+Pnw
         KbXcKEr/qESTNjeaEgEK74bKdKWAGAHWthK/8KH/0r/DmfXYZC15U8Y2Njn2wWjyd6m+
         FrcA==
X-Forwarded-Encrypted: i=1; AJvYcCVKslIqU5VAq3j2qj7cI9kF5En1UC4ThdW+vHU2etXRFxhWW9Wu6TDkknxiUYbwzC1ihIY=@lists.linux.dev, AJvYcCXQErAt4kxrDyz4Mzs7wiuH3JUdWmDKRCFZ+JwsVXonNWkIPatI/A+uM5Iq7HxVmI4bi9cS4w8JOHEdw+k=@lists.linux.dev
X-Gm-Message-State: AOJu0YyIhXPmIzucoI/69bOeYaf6MNYQ86ZzdVDK2Y5zfJ0Um1HYiDa4
	6Jdefzxuuoi/Q02vTeYOKci6Dk8N1oR+K1jci+8I3BLcaxaJj9cJ
X-Gm-Gg: ASbGncuVdcjasZxp5DOcnemdSf0yf5uTzB9NxJMFl0XG4eNXTDzlo5JgpqkTbJ3/nn7
	tFoHUDPA9wsgKQJMslrLTxLLNJ1dUhJ7ShXIDCgPobOmkaNULC8HvqhkvFuT+WiBeKVZ0msklyx
	mKSjKpdt5gyiYSKUKyKFg6nZZnFoA7IPHkSciEqS2XkYFjgd+pfGdq8MaBcWKcLANa1CtZL1N7S
	7ZEWz0D+XI79eu8mDGDbq2cGZvLDIf3iLxEqO5BEy5/ubonRPUuQ1DhVR7ljmpi1ZZDZrk1xOEG
	QiE+
X-Google-Smtp-Source: AGHT+IHrX173KgA+rgqZHkHs3tuUNpSaSEXjwu22A+m8kddcmuDUjvM5y8f1hco6MglQt+NpNTfPtw==
X-Received: by 2002:a5d:6d86:0:b0:385:e38f:8cc with SMTP id ffacd0b85a97d-38bf59e1e56mr47569296f8f.38.1737982002399;
        Mon, 27 Jan 2025 04:46:42 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d6f8sm10808250f8f.28.2025.01.27.04.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:42 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:00 +0100
Subject: [PATCH RFC 05/14] ahci: imx: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-5-f8f50c821a2a@gmail.com>
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
In-Reply-To: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=1NlgzpHbgQbix3Tjr1cyaZKDfkb/onDz8/2tsI8b2ZE=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4ArlLlDES8G6JKV9p0Op22wBYtl2rLb+V7Ti
 W+1qGzGlf6JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKwAKCRDnIYpo1BLC
 tcRbEACFMbe4lquiTg8wH1+fz/lciO+CSZR8KZFmtd+230WvkforLr5uPcLRedFysFe+Cff1WYs
 np7nr5MxphXZtLMUZSOxyo55mDN/cHAkMS4qWD7moxUnteX2uM2MfdYeAMzLBN9LlTQGscTFfft
 w/1ceUvnn/Np65CvWQbfGNy/BGY4B1IBS9x7cFnExYD49LbBPhU7m5aOi5TG/FabGKZzKAt1Eu/
 09kLqOs/xGogNLtYuEBy81+YCsRy+STuk6e1RP15jI96c3EyEgcXVvT1HBJqtmR5LDFmrzuh54u
 +H49Rc6/zpPai2e5km04GAJbJq1wNG8/ICar4FSN52KQoixJsv3ce9jJD/T4YQHRqt9IwmBv3PM
 FxUU0nSqVpOW2F3v1nehYSCCkTNX8NHdtISGNhtwHPTarAgtssNkuJSetHNJ5Wg1plR1nwUfzFf
 AXYCLS22gsqcHsClW6YseBZUsEX32zXkgL+EceWNozcTjKu9z0KzpRCAnjUPeS3WQE/R+M1abeO
 LJMKdS8C18mKQQ5LCp27eeA09XzI8Uqjvq3tvHyXGazGku36zGm8mGTRn+ppZYn0fa8qYtYd9qM
 hJwdL3XU11O4J0pt7nbGccn4oVSwn7GWba5qhczK5wU2DadFkkkKJn5gyHSPY60Glr/kyI3vYJN
 k/vV81JDW/BJV+w==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_imx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/ahci_imx.c b/drivers/ata/ahci_imx.c
index f01f08048f97aa230877e413ba6e416d79779c1b..ec75a16c630a79ce10ea98b16c44c9a3908f869f 100644
--- a/drivers/ata/ahci_imx.c
+++ b/drivers/ata/ahci_imx.c
@@ -993,7 +993,6 @@ static void ahci_imx_host_stop(struct ata_host *host)
 	clk_disable_unprepare(imxpriv->sata_clk);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int imx_ahci_suspend(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
@@ -1021,9 +1020,8 @@ static int imx_ahci_resume(struct device *dev)
 
 	return ahci_platform_resume_host(dev);
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(ahci_imx_pm_ops, imx_ahci_suspend, imx_ahci_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_imx_pm_ops, imx_ahci_suspend, imx_ahci_resume);
 
 static struct platform_driver imx_ahci_driver = {
 	.probe = imx_ahci_probe,
@@ -1031,7 +1029,7 @@ static struct platform_driver imx_ahci_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = imx_ahci_of_match,
-		.pm = &ahci_imx_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_imx_pm_ops),
 	},
 };
 module_platform_driver(imx_ahci_driver);

-- 
2.48.0

