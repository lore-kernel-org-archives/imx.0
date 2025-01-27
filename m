Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6288C200BA9;
	Mon, 27 Jan 2025 12:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982011; cv=none; b=fZZTAhp1PWY0MVZazuavDr42sniBj5LCHZK+djJ/ZD0rh9bObnfc+cmRPLurSzEmv7C3OSnd5nvmdL8KWRf6XpYTRUDfoZBtJ1ZBgbYs06D1gMGYSylv6qF44Ax0QrLsomXiu21MwHY0A1IxYbg07Xstds6TCVLWTdO4lEQ3avk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982011; c=relaxed/simple;
	bh=W9yVEdw4qSI4n7OCj5u/OGHoNGxhi+e4Ou6sa0uyD7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xz6OiCV2FqYmzqYsUW4FHluKZj5G/nZL73HvikWTx31qrd3y58qV4Zd7EHHG4TIbdZXbfb1OYfJ0hLyzBsaOSVbA4FKOCUM5iWs8c5zqJb+V3uVUEIsXVKt/HjjAMiY8V58JdA3NlVqYMSze9rfBZrztwazowLoTrPDICBtUxTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVqYJG3Y; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVqYJG3Y"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436281c8a38so30596265e9.3;
        Mon, 27 Jan 2025 04:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982008; x=1738586808; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KyTcZ2hwVqzXcvZadTxLwsKyE/CzZeUWttlSS9sOM8o=;
        b=BVqYJG3YTFbkwsD9S94FBgND/fBOPuE9o69Q6sxTheKJyBd8cpVUu4Laia6I3R4DEw
         vUnUPdqszy1cLu2bb9wHiMNPqco6ZDBadN5jZFbSnjKYPEN7y7Z/A5wtOc/Q0oq+sGy0
         GPERK40266v992tGZmudVhM3AppVhNHiEOpi9ppF7I5nM3RuTVzADpWqbjSLPSQ1SeBl
         /q5ln9tpPV3ZFG5groIMpIvd522/4wNe5nQCXWd3eFH3cG1Po5wRkda38wvrKmnAnrQ1
         WdAuD+pD5W0tXyV7XJcn+ksOF9jOEohsMiKh283wLP88SBSnGwvoHyjkWLTtRQXqk8+T
         tNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982008; x=1738586808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyTcZ2hwVqzXcvZadTxLwsKyE/CzZeUWttlSS9sOM8o=;
        b=sPhmzEx6jDwMU/H0Xr9mHJ+dG0aKBUnAA+rGcS1bv6EcETwoH8g5fLK/XIwr00zIVY
         OH9ayQ8kIM/4uCLPhoDnsh0PEmeZteIAg+sKv/pkjJ0k9mNtT0Ma4o1pGQPgmG4zxY0m
         gZEUjlUarEG+EXGuASZtlQHR0V59TL/YLB8agOrsGbCJi3+DbR2gEXuuWY3NjcyiO5Ih
         +Wo7Q2wiRZd5wRL7GbRZMqr2sCThR6UFTuaZW8JMxe5wscKyATsrA9HPUGHHNjnwiH17
         S8S4YVGCZeY+WWEdBORnwGCOsk5xpsLBPWSbXKmZGDqIlVoKlXyH1s7Bw4zKaFUhKvSo
         FNpw==
X-Forwarded-Encrypted: i=1; AJvYcCVM3V6uLxKO7+oRsEarWOCVApjK1Za0tKeNmwLlvIYlgv+InuV+GzyqG8SD9JmlOVUdrnM=@lists.linux.dev, AJvYcCVueGH9KmEmCUlt3FjbshwIz7pEKfEAwBG2IlT2KZo/sj3S1wTS2nNPRsT0d/mMHh/aTezW/++fXLIBn5k=@lists.linux.dev
X-Gm-Message-State: AOJu0YyyWSr5dJe23b+Uq93B/4s6srifIsoTAcY00PcDz/Zseev3sQzI
	ADmQMcdj/2E9z6oj/sZE11sOIOtacViQ7n9XQe1r5lAvp85J/WjT
X-Gm-Gg: ASbGnctrmJ4UmsXHiYY2u8i7UiOtzDZ3B1NdI6sbP5v9shxxLf6FM4Vzibyp45SKhDs
	ygyW//FdKXgM10gG5lbeN5VpB52qWB1iR1SxfiEqBkiBCTu6n7sknzKOL+d5YXwCFOzgyrd5Gbo
	JYT8ePEPw4/9cCK+43Z8ox7+z3pLZaZ5mPT6d8pNErUgD/Se27J/s2nY1IL6WO/9Nw3+igJ3z9T
	yToK/Mkivn4qT++yEnSwFAVZJ35aF7yMR08bb+uxY3NXvVCi8oGcjcxM7VAsWggu/tasvLkgZCk
	H2Zv
X-Google-Smtp-Source: AGHT+IFg//5LwYfTEQFnuSRS+BvJlK0U1CIpZoSn+yBRmJA85z19Z9oAChFCXf49dqnRysAazQ+L1g==
X-Received: by 2002:a5d:4f8f:0:b0:386:4a24:18f2 with SMTP id ffacd0b85a97d-38bf566f3d7mr31426711f8f.25.1737982007652;
        Mon, 27 Jan 2025 04:46:47 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1764d3sm11150284f8f.19.2025.01.27.04.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:47 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:06 +0100
Subject: [PATCH RFC 11/14] ahci: pata_arasan_cf: Switch from
 CONFIG_PM_SLEEP guards to pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-11-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1488; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=W9yVEdw4qSI4n7OCj5u/OGHoNGxhi+e4Ou6sa0uyD7U=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4AsXHhQC6f7LA3oB6K4p2SmmbhUaUWGrqpy+
 0C1WwXAqe2JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eALAAKCRDnIYpo1BLC
 tefCD/9fpGNoUqDi51K2tB2D9CFl8CeeHTF4pr8xRoOQ4wHxFq1j34zFjU0zF3FMPafOKzx2ZpU
 M0H+96OFbAZFRVUbx4TMhBAUFbWDJmYEZaD37c+ZiNhwe04QMF5xjCOdcOzfOxq20XK75ysaLym
 SaEYxQu2bvz+1luQsRFAMDy9qgE3lU/RwHZX4Fnoi+LNBgCnzFobqD6AcCGplQY5GczK23KyIy/
 Qnsf/uNpvh0qhLhkT9z8qojEvpxvy0B4Gjbrg/7C+/W16wnfh6q4tPxknNPELUPgowGCKyPBXMF
 N2H3TS21r18cdyWUIRFdZQyKfD1OV7qvTeVtnZKZKJx8S0YDBEOafcZmRlXuFLUlOOikIvDDfmy
 60XDP8DfgiBRt8SNQMvttfg5JDwQ06nB2k5WmpKgJKIaH2Isb79axwMaocq7jKHGJ5zU3EM2LKt
 P1CSwU1T2RyRAP2moyDlxIQWHKwt7l6spquHZS/azAm9qYKh7V/NjXg9ojMSyKAsxzSieNlYfi9
 RrD8Ciy49bQb8tFtcEPD+4NAYZxTqA+rQL0enjR0VFqy1U24bMwVr3zTYFYzUNtPBruiDyS6Ihl
 ZS8SJ3BU1M8Kn7kD1mDYNNod/D6qYBF9ziEv26ZHOM3Irpk2//In81xjJi8n2RRxWRWc32SzYmY
 kSDFGSf9UT/2Vqw==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/pata_arasan_cf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/pata_arasan_cf.c b/drivers/ata/pata_arasan_cf.c
index 514d549286b56eabe07dfc2b3a961ef0f7c983f2..3ec03147a8fbe30e9f82c184d7a9c32cabcfdb92 100644
--- a/drivers/ata/pata_arasan_cf.c
+++ b/drivers/ata/pata_arasan_cf.c
@@ -926,7 +926,6 @@ static void arasan_cf_remove(struct platform_device *pdev)
 	cf_exit(acdev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int arasan_cf_suspend(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
@@ -950,9 +949,8 @@ static int arasan_cf_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(arasan_cf_pm_ops, arasan_cf_suspend, arasan_cf_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(arasan_cf_pm_ops, arasan_cf_suspend, arasan_cf_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id arasan_cf_id_table[] = {
@@ -967,7 +965,7 @@ static struct platform_driver arasan_cf_driver = {
 	.remove		= arasan_cf_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
-		.pm	= &arasan_cf_pm_ops,
+		.pm	= pm_sleep_ptr(&arasan_cf_pm_ops),
 		.of_match_table = of_match_ptr(arasan_cf_id_table),
 	},
 };

-- 
2.48.0

