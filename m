Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36091FDA89;
	Mon, 27 Jan 2025 12:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982002; cv=none; b=Nkt9e22A7mRp3LN6scyD0sVszuTyXyBFMVaOid0H7CZHUOQ0dPd14eBdYoGtmPz00pe/en8NQHPUBaDPUXvz8vMoBmtLBx/FcVfIE7Uaphe/cuES06bJANfMMiEXBCvsKbzEu140KtJPvnnIxA8MXftgVZbbhFUpWb/35BN8t2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982002; c=relaxed/simple;
	bh=4mWrBHSk0HW6moMZXG5yPVWArdrATyoEJrN0gimIFl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EZw0g66N/0antDSDJgDo7tAJ1rKaz5rNP1jub5R2rRgwCsEYAAgaz5mH6jFfLnDrAomgOsgZCoeBoUrT3O8s+udvUPXsmZRfGWDDJmfiyf/pm8TmwWU7NruSgtssDDvCjGPzvilPZwCekKYDsOf+IFCoGsSE2gXOI3G1mVd9FKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNRTpR5H; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNRTpR5H"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso29048875e9.0;
        Mon, 27 Jan 2025 04:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737981999; x=1738586799; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5UXpQLaAZHWEyD0pxCkPC9tyYvCIT3KFA3QpJPSo0x8=;
        b=lNRTpR5HRcQ5f41CPephaS5dyAWb5eUJ4yBVfrkjKtdWmPQY0P3YkFL5q/OoZhQmbc
         RocIo4BIFcw3THXzeML/ETBoYh4efurYvCkZv18D1IR5bovAqDTfel2JAjq/E0UlS0gV
         UUJ4zsQW8/kv7ndLRBRwFzMbcxN3Tj6Ehy8BhlAUmDRz9Z6E/JVLpT/CjBCfJlmcKhFr
         R3aJ3jUR3zm330TrxuJyMNqTDtjoAY4zQV/1j904F5Oy2wHMS4ahsHglYyPlnKGAVi4d
         g+AWi+TaUa3engKBV/1F3EbWG75RxWNnxdWR/w9coRydtxjONnEkakJ2BeLLUwhrHzV4
         EsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737981999; x=1738586799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UXpQLaAZHWEyD0pxCkPC9tyYvCIT3KFA3QpJPSo0x8=;
        b=rky8XdoUZOMtbqHb2fHbVIkzLVBxWkmUwZr6T/hQ5DLUNC6cSyi0v6Qc1SpzaJCzey
         HZiyP2b2tFVXN2sRkYo10jPKTLb/Ov0/CFNOQCmAvMef1Mn3F9mkE8XXAFuE25fZN6V7
         r7L9olGKIusR4ogi40DG3RMpzOf8rS8NUiAIdip/g3NsKjrUP2hNbYjYAebA2d7lHvy2
         stKrSD94m7MnwG1lH8VPcqgNyyIML8lCpZ+DATFTkb3Oi0+/rwjxR3IYqxBZhwPXLpd4
         ecRyo7EQSNI7IBUe403Kx00OPVtIn1Er0FVAWoO7Lb63O7Rl26Gseuy0FkfiWgPpilKD
         lqYg==
X-Forwarded-Encrypted: i=1; AJvYcCUJiUBys4Zj5ogIXz2SM+wElk+pZciYSEs+gekq72Nomqad0vuXLZbSS3hz0QAM1h7Li5k=@lists.linux.dev, AJvYcCW7gkSHzHjA1xbviTlou7sOyioxDEv3w/43jzvNngwF9qYE1NSczP1HIdnczOaBMaed0awnKA2a33Geu54=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWrhszd24Ro/6ioT6yjQsOvMp6BEK3BWWrOKbUXsmFfPYEid9P
	PP/3QdlvMd3LVQw4dpmFj3KyF8peTRhZZm0sSh590USgAU8tmoFij9rTsg==
X-Gm-Gg: ASbGnctzJLFs4YHhmUI1HYjc6pwCnQ7lKtQgb6ZhZaM2wpmBAnHnva5kDZdjP0XjfDJ
	RSr80KCgIfAgz9fKUQU/1fEg4J929IagxImrUDkMTUOqwt9OJjqgArSY7/kFZ+s/LVbno1HHd+Z
	qkOg8z/E1MMRILzQ8n4dyEwaMdTDk2Kzqt6O7h9c5lP9HOSC7HeYdrnvAHQY7DRtBH+rdq+Xtir
	dhttwekXFSJZT+nMwa8Ffr1iTu3DPxK2nzzXs3ExHEsgzTdPD3pDfoqdHRDcg3JrpKtvjXx6Ce1
	VnYv
X-Google-Smtp-Source: AGHT+IFcpebGZaqOLXYWPaGFtndOOwU8Vjebxht6JbYpi1k2FlAk2skEDPVNNfLGXRNNRoy7L722kw==
X-Received: by 2002:a05:600c:b8a:b0:431:5e3c:2ff0 with SMTP id 5b1f17b1804b1-438913c9f66mr357781595e9.8.1737981998728;
        Mon, 27 Jan 2025 04:46:38 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd501c2dsm129176715e9.13.2025.01.27.04.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:38 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:45:56 +0100
Subject: [PATCH RFC 01/14] ahci: brcm: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-1-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=4mWrBHSk0HW6moMZXG5yPVWArdrATyoEJrN0gimIFl0=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4AqwZw5/RPua7LmhyMMUY1qD4nk4fuWdEjvn
 fkcBz0A+ICJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKgAKCRDnIYpo1BLC
 tZSMD/9QFx/Dg/L9PZ311iYUySiZ5aaWZQ+jU5ysXXdpxQh+9iGpTrscQRBVfUbxFgoRJOSW2Kz
 /LxP0K7C6laA7kH3NsToFv20OKKvAo8JE/WrsxBNU2jNxzXaaIq/qRjOFJFXOGqFduVyTxASc/D
 rtGK8zEksr6Ulazfl5E0iRx1TPrAR9NlKBvV0KAVSkAlDV+MZQ+S7Ym6ZmXk+6ilwUZeFANJY6V
 gEdR88tKc1CpsaswbsvubsiNYIoES3v4zcEGFWVJ87Zfe9Z9wqmEHrgB6G4DExJA1BkUzMDNKOt
 jCw1z1SJ05MeOeoDOaTWUKNBLjXsa9aqII8RXNQG+DQIlHq8ucSEbgEtYkhspqDfet8IBpPo/Gn
 lsRRuzRsrL/BthLog1m9OUJ7ex7384StiA+Xk1HgskC6pid6pOIUUEXB0irM3UvKWfAmCtvCiW9
 o2eReO7PMqmkdf98ZwYMiP51i6TTly7NcLNSJOvYsQL0RqJaXTx3DMrb76yAQMCgex5b35hVK+7
 wIY8Mvcvf+Qf+TOMoGYpx0AYeDw08fHub0truLO8SjYyrgmQh9QK+uF5pbweufGV/RxBxMjiAAs
 WoIUly+qQrUHuAK8PEwzjqcw1LDHLo4xd+sDE3Y55CJrne0v2nDd0QTopi3kcz7woJeJWjG8b0i
 wvyJKOEETeFoxvQ==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_brcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/ahci_brcm.c b/drivers/ata/ahci_brcm.c
index 29be74fedcf01934e436481c66cb8d329284d599..3d43ed5db6078b3f07440f21aae6edf73d1da7f2 100644
--- a/drivers/ata/ahci_brcm.c
+++ b/drivers/ata/ahci_brcm.c
@@ -362,7 +362,7 @@ static int brcm_ahci_suspend(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused brcm_ahci_resume(struct device *dev)
+static int brcm_ahci_resume(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
 	struct ahci_host_priv *hpriv = host->private_data;
@@ -570,7 +570,7 @@ static void brcm_ahci_shutdown(struct platform_device *pdev)
 		dev_err(&pdev->dev, "failed to shutdown\n");
 }
 
-static SIMPLE_DEV_PM_OPS(ahci_brcm_pm_ops, brcm_ahci_suspend, brcm_ahci_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_brcm_pm_ops, brcm_ahci_suspend, brcm_ahci_resume);
 
 static struct platform_driver brcm_ahci_driver = {
 	.probe = brcm_ahci_probe,
@@ -579,7 +579,7 @@ static struct platform_driver brcm_ahci_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = ahci_of_match,
-		.pm = &ahci_brcm_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_brcm_pm_ops),
 	},
 };
 module_platform_driver(brcm_ahci_driver);

-- 
2.48.0

