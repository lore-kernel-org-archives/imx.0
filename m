Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC30B1FFC7C;
	Mon, 27 Jan 2025 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982009; cv=none; b=EAZpyLayXalvZgPKKyPKYRy+GUGNttvPuf0VeN/xrbfnfLE/RROxvzf1P/Oqp2D10zHPJ2ZGXYjAgn36cqv4s/xQFeHN+lYEY3h/6pgCx3uv239bNQkKMUC8vIKIfsh9Zo98c5f9POdeirD/ITvKh5vdzLy5Nzx0I6ArUVNuBKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982009; c=relaxed/simple;
	bh=4ewGqTecw9fB2ZWQrXC3ww6+O0Pce0mhF6dQFMkMaFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZCiHDWIgP4wBHNFoZNaTnrCxPUiRK52runEmS8etg9n1Ssqgnh6oGerXf+WwC/Fw4Cxk1im6zumsNgwT3e2O1gJqbA77on2naHU3I/9TpGIiWzm723Kmd8frvLdkthpA1DCBIyV1WFOODwztxGbyXE8UT4QNQ9/TFNUJHlSjlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWWgr98o; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWWgr98o"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43622267b2eso45486885e9.0;
        Mon, 27 Jan 2025 04:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982006; x=1738586806; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXNi3EOoOoj09C+mWJNSCmBp9EDVd6qCUzZ8imkNOb4=;
        b=BWWgr98onuWJjL/NQl24xGkh0BPW1r9ScmBT+TUdkBYXhna2xdYEwsfcpB1NaOqxYh
         BJ09Cqqt6w03i15CB/dCuCbb/G6utEVvKp4rTl8rsGBX2C47zzEmcuC30fTpEkpjIVZX
         noiHdy3qx/uku3jL/U9jSf+1sc1yt2LqZlQIc/1HbF2CII1xbTvz0O4qyFz5eo5/2vdW
         hVdSh8xSKxW2p3WKq021NxcKozJS+sIM7/B39c2rKbiRpJDNQEv8D07FA/YvEhQfo2C2
         y+ioqlih8t91xAUv/tjVojtXR967CXyZ0sm1yGHRF1qeUe0WNaaHXdEp1JYvxPoMw7fL
         yXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982006; x=1738586806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXNi3EOoOoj09C+mWJNSCmBp9EDVd6qCUzZ8imkNOb4=;
        b=JlPG6AIi+THEcBzAyiibj/zf1c3XowNoR+9jGuzh7Pj8TPW402RVUDOhQJmq0LZNr6
         q9Dn5klOScpSwdKpqes5v1omlzR8K3x0cHa3Aavf1kHe8as1/ZzptoL146jLxVnGT4dE
         U9dVLjY5T1SmaWzHZo9ZnRmrR7Jnhhn5kPRymFXZnyf8Taxwg+Xaj0g6z40oOoJcuOaB
         zDoHYn8HuBk3SEJpJjZ88vMr4pkcpIBbIvgTwwMRrsvj6V3lA2ZW2NO3nxIVkDVhmbLB
         Wqg9EBBhsK9HUgAWmUrjD4EAHmNDM6nEO1qxE+C5wzXZWl8jhglPMGBHXuna/tnxpgFs
         NsTA==
X-Forwarded-Encrypted: i=1; AJvYcCUBgKfATMBYK0srGQOpiLCxS8uKfsIjJo4KKz6R9Zxv9N0L0a8mW0yGn/3PTnMRSFvXBxA7C6xof1THkN4=@lists.linux.dev, AJvYcCUVt2jSyFGKV8cWsEBHHZDJoNFLPbu/O7WCLSNcX206BYxWGSB/SeblqzbMbbj9h7VcOis=@lists.linux.dev
X-Gm-Message-State: AOJu0Yylrs8kJ7HRo/zFepUGuhnRnQFGPTa7BDfb+tPeSjitwCY1sND0
	0rUeeP5FtoOZW4uNMXDC5N6o9IOwM1YpfQBDDPfS0/Beul2TICfq
X-Gm-Gg: ASbGncvb+1cv4a0Cx9GS8UHi1NLxRVwbNrzdvqI0cU+Pr4NBuX5jiouIc18PNXLS2ym
	bfIndmclxgTyGYnH6KpAR86vPOi1ZD89huSsGAUpxHZYNUAv5XAJdLehANhI47F0R1He9xO8f4E
	F3a8zmslUGkMtG5O+QvmJ/iis1I4afETjkI6Zo1rUOHFIdHKUvPTcN96QT2XSUTfMZNh7P/YRye
	zFBStB8yf0UfhPZdgSYtJoFiL/iZ260Jp1swolr3Ig5haOLgjY401zy78jK0CfdnOJ04wb0Ad6V
	ncoC
X-Google-Smtp-Source: AGHT+IEAjBouqDFRRxREIp+llJfmCSrig9ltB26U/3ZnCQ2AVFGrx3mRWJPMehdo1wr/ju3fkhOnbw==
X-Received: by 2002:a05:600c:a45:b0:436:faeb:2a0b with SMTP id 5b1f17b1804b1-438913e32bemr392457615e9.15.1737982005836;
        Mon, 27 Jan 2025 04:46:45 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4857b8sm129474675e9.15.2025.01.27.04.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:45 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:04 +0100
Subject: [PATCH RFC 09/14] ahci: seattle: Switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-9-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=4ewGqTecw9fB2ZWQrXC3ww6+O0Pce0mhF6dQFMkMaFA=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4AsXoc9CTFQybRCbZpaLcS7DyP9PPRpr3K/f
 7ALURRpv46JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eALAAKCRDnIYpo1BLC
 tcAeD/4+rRt217wlEAkj+zo4D1LMo+fJcoATk6JOdCwjeGtexKKz6F9bpW6+T9FpMEJkOyevd60
 iaqxz3f/TQ6Kc/vLiCrfAw02zyzvVW1bmI2vr6XRy33K3GYx65AN5MzmInaKwZuP27yx3FoCEob
 Fq84oTZcaoRCOteJdcfabhn1WzmnWa1bFqTVInQ8rrVzds723AZtiJeU2MCURZaofqq6K2DEFoR
 6CBVFgMGxgQuoDByUrb1SjmmissVuqdRtPQYnY4w+7Lb5CsyVNasfoa9IzmEpYFj07JYeqr8KVF
 c4wIM1JMg15XUKNN7Vu6riEMnpiQJePD3TjaSjJziXPkCw5+LATokEW01/ElnQCnqz1EPKSwk5A
 7cTrnEAdX0Xrtu911/9qHXoi490oklQqvbkcs4d6rGYCfn0dyRBAEyXhgK1sFXGjFg4lahWO3AB
 E0uEEl3kf1fg89jgW3cHATh7pSdhxuVO02VKELQS49Jg3XBSvqHDsbk1L/dSuoGig44rYsLnGMl
 J9rTAyJzfpdbcjtzhyLeej+OkYVXhXluhO/C3/gz+C8nESIR9+rKjwJv7yPz3VJkdveQRoLj8Ei
 clkKmuOelYUGxSjj8X3LxYfnNEI0pkLiZ5bdxTdrlbUKRiPJ61CB6WK/cwmunp2Wt8p307RtmTA
 gS8bW2aVFjdIBWg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_seattle.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/ahci_seattle.c b/drivers/ata/ahci_seattle.c
index 3f16c167840222e0de935f7fe44b3d83b95bc16c..4b67f3aa5787de433c8bcc1bb4965a887709aa9c 100644
--- a/drivers/ata/ahci_seattle.c
+++ b/drivers/ata/ahci_seattle.c
@@ -174,8 +174,9 @@ static int ahci_seattle_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static SIMPLE_DEV_PM_OPS(ahci_pm_ops, ahci_platform_suspend,
-			 ahci_platform_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_pm_ops,
+				ahci_platform_suspend,
+				ahci_platform_resume);
 
 static const struct acpi_device_id ahci_acpi_match[] = {
 	{ "AMDI0600", 0 },
@@ -189,7 +190,7 @@ static struct platform_driver ahci_seattle_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.acpi_match_table = ahci_acpi_match,
-		.pm = &ahci_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_pm_ops),
 	},
 };
 module_platform_driver(ahci_seattle_driver);

-- 
2.48.0

