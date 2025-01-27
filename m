Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BE1201261;
	Mon, 27 Jan 2025 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982013; cv=none; b=ZHJya1Jd0WS7WGKdgVLFAdINQrx4goa+0gnL5+zvfOdCYqKU+Tn7XbxBsyR3kckOhcMrJ9tzGqPYToi8JHp/DG3ft/w7la0Sd/7lcG8o6r0PkRFH89dXzdsG0Qzt4XE+2uXvMTyS05mnA1dZS6FBxc8MXftxUOGn78jjvGcuuD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982013; c=relaxed/simple;
	bh=1sjh2+ve+pLpl+qs4JFyeDCujvbM9xUUKhOAy+ucg7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jcGP9F+7Cm7HGH6iIT7yiSiFpuqjmSsZj8W2WFJMSk4XjnUzWekULd/8StcLnEYXUSNFFkuwttKJhCF8iGeBi7HIzjCf18VgUqbQhrb9zz8xvDDbi4mUw1HhbJEMiIRtXaW6Jp9i3ik6rEXz2IKMRDRcSSGOdSaX5I7ldSWhibM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYW6w0cj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYW6w0cj"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43635796b48so27914525e9.0;
        Mon, 27 Jan 2025 04:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982010; x=1738586810; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcoOAINXi+2TT4WH3C7O8RVypx2rPa3EoGFaB3IYNWM=;
        b=TYW6w0cjt5iGX4JWGOzu+xosb4lhS4xsPs/uAiMhU49HBoFjjktHKkF7X8ZZ+VSgXf
         VHMmcrzmGKm90vxUKNdAk4x9ERXa8LTKRs0qXig2biq7r3iTfWYVUXtBGjVBFpRqlOcX
         sMaNDD7tpYQoSrPTLR06aMbJtiCGR3KpHXvHge0KSzW6oW9GkA8uyCse7MMfefSIQxvy
         0iH+nh3Sukoko7yqnkL9ZBQXjKCHhjr0yVF9u3Uth/9wmpRbKr8q8aP1SSbHbiixEbZM
         hQTQY2cl/GGi/GPA/J6uNwQlGZ6PnlF/tqV3+pwZHn+mICSOU5uv4c6Uhs5HRqufoogJ
         zIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982010; x=1738586810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcoOAINXi+2TT4WH3C7O8RVypx2rPa3EoGFaB3IYNWM=;
        b=ez166ekbwU8eKcZzqJPgh0We22ZhdGOBpYaw83Xv5b8e7uHYRGDGYT/Asfag8GGfG4
         5akYPVaiF/QH1Hh5WFZFoCvzokstcMqxRnO7RxTC6g2kvjWmfDxjr6mP4EbCy4Sprsqe
         jBC1c0ZdT1NbprxS1XrKfU6rf0bpFv2rmopAr1KFgAMd51jsm6f1AexGSv9c9eextYdN
         vVKq77oWP/fQkzp8QfOMJV8ZYgrfQQJa/8vi5+CB/RHc4iVklXEw7tgEqZDr1s6ac3a9
         CLz4fqKLnIiP3SAOzdIMkmWLVjlP1ikOSqXcx82GqucGVNH15eT6U9ahWmJc4kpOn5Ww
         gsgg==
X-Forwarded-Encrypted: i=1; AJvYcCUlqEPxO6mzgWbo99Dzgz5B9cfPBJvDcsNdkVP65KLXmcAle+pPwNl+hLyrJTzwI2EWcaU=@lists.linux.dev, AJvYcCWj0/RWogmqH7ojHWPsj1rUgcjLvaX3FOLT5DhJeHvJ+qbooO+HA9iDQy0C5lXC4FdXy8iVstRnlZNul4U=@lists.linux.dev
X-Gm-Message-State: AOJu0YweOPWJbEQRVASjH5oAuhZZaXwZUnY2RhRpttqmCvdqfesPsbV1
	SaUpaPt6vRilBdsQjmGeFi8PkYpGsCmEGaE2G/M2ZIfKpWmNDPCA
X-Gm-Gg: ASbGncufEC8KFrOdFvJ1h9/x7i5wrCOOlRa5pfIWNCeyQeazDAT9e/YI7BxVWvjZqLi
	Pq9uOnIEiOtv8ZOr5M+kf06fzpYGBlxMIxAOYbQgxl9jEYbM8G5Ujs2iXYZmTKSsXgFsadYxIDm
	9Y2OmQvFYb4AHxGy7ahccn3ikfBj4QHHORCkoPorJG10qDKYuOX+vVzk5OqO9rzPm49eJHTTr/l
	DSH0sCrODdvDbW7MCwJkSsmREDuC1XSKmZz4DH4o+dcJK4v3o7IgVC3Pvnzj+aPGMsveiGQhjZC
	oDjy
X-Google-Smtp-Source: AGHT+IGhmYg12Hp8C0sebLYNbpYEvgc+ZIGcISfxxuByIVWp5JGbDaNxubM4KFeyOPfLyoSuuyFpOg==
X-Received: by 2002:a05:600c:4fcf:b0:434:e892:1033 with SMTP id 5b1f17b1804b1-438bd052fedmr122721625e9.2.1737982009910;
        Mon, 27 Jan 2025 04:46:49 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c4199sm10751183f8f.89.2025.01.27.04.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:49 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:08 +0100
Subject: [PATCH RFC 13/14] ahci: sata_highbank: Switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-13-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1472; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=1sjh2+ve+pLpl+qs4JFyeDCujvbM9xUUKhOAy+ucg7E=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4AsVMoZcFzlRd2JDEQ88PbQqwdNE+u1+HM/7
 InzrdmEGLCJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eALAAKCRDnIYpo1BLC
 tYfgD/9CwqCJAL0ulfW78Tlar3+UngP9sSkslf0UBkWDJnt4X7LIk87zcfAI5d3iefV2cAxTmK6
 ao6wf5Y/ide4fMP3fOjap2jpht64DGEZavpEL8GrI/Bo7gf2DlChRJcjBUsqxnebyIiPeS58kwA
 4Ydddyz1Zp+F6Bqr2PqKRcpDrdblMuBUrblp4S6RITvqSIv9IZSBj8yLj2z/WfMhBaIv4ISIXiK
 C+n0JjmBLFqa7Pk7CSLczgOHh1qLfy60JwWNpIIZFmBbZONE1M6m2UZVNss/7xARXhfAKEzrx6L
 DK8pVWyDBJVOyvBet3rdvhuYkOqcea3nzmwMoZ0lg4cb6fBT5cUpo1bcyt+E/zs09IfK+sNOoGa
 iDWuOLdAluiRBtMpbYuqK/ldHaIkS8ranmgpAtvOTHP95HRNUuaMJaNz2oHDqrNFJ8oVLbIC7UT
 CNgM6tRXgfLK9nXJ39KBzBHAXflILB/eoTLEgykEpIctgdzntr7A3xjhnHFlk93/KGogBdIzft4
 PgQjO5+3/+TzxWIlVGJv7uUky1Ai0/n6KWK33bcRt6qpdzx+EwZD4/lwARWR4W6PO6E0LvwEvBo
 gHHRkONnnXc77U0KFLN01MFF/quoo7+Cj09FU+f4Fh5Yxil+Jsh5XooE0uhQRLYhEWxBWKPATpI
 QwAKsZ+clVVBIXA==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/sata_highbank.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/ata/sata_highbank.c b/drivers/ata/sata_highbank.c
index c8c817c51230a74df721016eb80238c188d96d01..c387e50485b974fa2f2defc0bd1ea8cd43dc14bb 100644
--- a/drivers/ata/sata_highbank.c
+++ b/drivers/ata/sata_highbank.c
@@ -565,7 +565,6 @@ static int ahci_highbank_probe(struct platform_device *pdev)
 	return rc;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int ahci_highbank_suspend(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
@@ -609,17 +608,17 @@ static int ahci_highbank_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(ahci_highbank_pm_ops,
-		  ahci_highbank_suspend, ahci_highbank_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_highbank_pm_ops,
+				ahci_highbank_suspend,
+				ahci_highbank_resume);
 
 static struct platform_driver ahci_highbank_driver = {
 	.remove = ata_platform_remove_one,
 	.driver = {
 		.name = "highbank-ahci",
 		.of_match_table = ahci_of_match,
-		.pm = &ahci_highbank_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_highbank_pm_ops),
 	},
 	.probe = ahci_highbank_probe,
 };

-- 
2.48.0

