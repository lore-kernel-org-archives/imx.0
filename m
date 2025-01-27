Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AB81FF7B9;
	Mon, 27 Jan 2025 12:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982006; cv=none; b=Dfye737stVBKqytUEjkBc3Wbo3L7gMV845UhoqvADJRB07xi+UArVN8fLbst3iwzKlyiU+ceE4L/hm1DAcJIUn8Oe/7QFJAl9csYckMkkSUXShlFaM0OymEn7E2O5O3wHA25GE/NfD+hP99W10zCK9v4S1DxR4/u4n2rmIKvlAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982006; c=relaxed/simple;
	bh=uk7o4XEuCDy+1MRV3EDgkqSFL3eYMvAL/KrkBwR1yb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AJjf3wUy2uqErGVWDyvvGOXpSY0N4jMwCiZ9tZvyloVXUdhhr3JoilgHeQPZPXMvC82Tu6awk5E/xis8HLHUMCCAc2sDcj6X/Pkf6MY7Os12+O5HgY1EYqIb8inf+VWe9vMc8IJ4KxwGHPt2wx1ADOCqno8psIe0SClln9/MF5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUDCMQhp; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUDCMQhp"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43618283d48so30768185e9.1;
        Mon, 27 Jan 2025 04:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982003; x=1738586803; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjKGQCjlxoKyHC3MWupm0EMlVBTxZVB63YoUYqEoKt0=;
        b=BUDCMQhpqjhJhgtQ5DqmzoVV0K1mrEdin7pqIzoE5aNkU+7V+F/sacdJqxCE/u0CI6
         9RvbKL5+wp+tVuW+BHyzsFTBxCAOKCcF5dJyP+0nziCdpGn9ap4mtu8eymi7R7OFQ1wv
         t7H1fWnW91VejNdyP94S2vsjMdyJsYRpZoY+Tygu06lBSXx3JDD6Wq2y+fBzHEGYpwew
         86/5IYb0ndhOUreq6tEXAN35ZwJlGR6U42e/QPO5aMtbZBTiTr5bLXIyQKChQM7zBf4F
         x0BQc1+H+fCkk9zsakjr2KcRC7/HwOTjsHfs4CvVdUk0orUO6jYD1EVr4T6ofc9YVwlv
         YW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982003; x=1738586803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjKGQCjlxoKyHC3MWupm0EMlVBTxZVB63YoUYqEoKt0=;
        b=HoJVfxGlmymAQTY7mI3K3DYw6MZ+I9nqAdqMrFPUHoTYhwLOk3AVMFI7FjDeq7WtJI
         GOoku37U1GB4JpJL4WXh2QcDfWSbkTASzRxBsEYzx8ucgU827yL8Wb/7UsHtHChTQBW8
         GZJnCmuqz0y9LtALyUZwOOPAONKnpanFkdE4RzhuBf3A7RztXLS4B5/cY0SJ9kBRw0yA
         XaxzlOs3qbTDp1VHUx+WObFb3687xqSFxkty6okak2dW2dWliZRILUVrohD9+FTDHPjI
         XRHw3ysw5CuLOnWIRdh9mzm4UU5avogeErJFEaJgsO5VNRfT7ENJl7aCV/Gjk8aZfeSZ
         IBHA==
X-Forwarded-Encrypted: i=1; AJvYcCUlMOkRnF4rEW9r/8P8qt17TiLcro2BsFJmfSt0ZrqiezVtsC8bT8Ck2hvnd/MVRprqr/8=@lists.linux.dev, AJvYcCX4VlVe9xqeNuws9Jq3gKFkZBfb7z3QT9KOMV8YopUufUf7IsmNZKWaiRFQdg9Bel3a6kNoo9usPDO4VI0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzEC2JEt09wKL6SUrWn70bn99wkUKESb2GKfVk1CrrbWd+9t5qS
	G+I3V+iELY9rn45+Q8LAt4f1KHoIynGDvJpyS8XhkWNCPc5+JKDA
X-Gm-Gg: ASbGncs1PP+2IRHuuIi+tsZQZt6BblTUkiS+WW0aqtA6Ygam52sjxOSXk6ixjG4Zl1q
	6SUpSakobjajeAv8fnHaeRVoXkznrEvGWFo+YlALCQv9SMuVC1jrOEzzQUpFyNXCdnzxOIwdbzq
	KOWMCvX7ig8fFzGKrnPSqQoMn5a0ZPLJUZmtTD3buPyYtUn7I5hcw6MidIfdCLLD/dWPh7kUcBr
	Helkzzgjd9nECNks1aIXKD0U0fms7KGk/QipWXjPvWFisRPSD8oFeueba2rWfiGYIgTHeCX0pHD
	6qJ7
X-Google-Smtp-Source: AGHT+IGprEO5pdaTEpJfI5A74FsQo9nZOJ84uFe/gZrOTEtv5xh0dMQj1A1tPsGDBpxW+UvsnKe8cQ==
X-Received: by 2002:a05:600c:1c84:b0:436:1b08:4c78 with SMTP id 5b1f17b1804b1-4389144fd70mr439685205e9.31.1737982003114;
        Mon, 27 Jan 2025 04:46:43 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f367sm130542655e9.7.2025.01.27.04.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:42 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:01 +0100
Subject: [PATCH RFC 06/14] ahci: mtk: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-6-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=uk7o4XEuCDy+1MRV3EDgkqSFL3eYMvAL/KrkBwR1yb8=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4ArP/dXj2VF2FWcstEGtxvysjudHRVgQcMUd
 svatcZOwv+JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKwAKCRDnIYpo1BLC
 tZl1EACcS6SONQyqCW76vwJqLeVZij81JJC6Lc6vlKZCqpF4aZfAWFaEhJwoQq2lvvaUkhxVbdn
 tI7F6zVdj6qTx/f+C8UiuT/NXdG2SAOS+vNLfh0lESSQq5FpO6z7T9iuAZa0QYI6qvoX6E39MHT
 1hoEBquSExHROVnPh9jmPhMC9YCbZ3lLDh67T+Q+xxvLw7OSbRqZ1JYlxJHQhBXhj4YPle8ZhH7
 Hlzjaishlt+hW8zL1qz6E4ERE/kXUFe5NGXeMTbCHVPfQcM7EktMEsJdLikHP3JSWz23Apabe8+
 3/Toun6cZcuUJxBFaAUrKSqGJhN6ujljWR6PTCIJMdR3IQ55grzKXm8Ydvu5vb0ifeOc/sN5JRV
 LooLjdM9domNcQM2schcY9SveR8a+DUDNbgZQYDEiUtzm1y5ZZu5Yi78yfFFvnRFfio8LOkVkd3
 G1OfRNEeXzIKVj6dL95ruGiZ5C1xwqkSxgVlhFW3TxilnrbMb1M0jkO3sUpLa7WEWy4YDclUr93
 tRAJ/feyNqI/3Yg7YwiG/RTxiL1PM4dDzWa02BTU/BebkeK9ECvVK/a+W4Apgsb8UfKOTQU+5jj
 nuBWGDhFl5Rr0H1L/nXncvlVYG2RQZFmzn8IwfcHbBca4T36PelFvgNiALqkjPJi3s4PkzzqfOY
 +XkNBgmtI5tEOXQ==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_mtk.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/ahci_mtk.c b/drivers/ata/ahci_mtk.c
index 7295b9066ae213a72a8c180a66ecfac8c2f46ff9..4afcf5e90e3b660f17b2eb0b1e3df446bef470da 100644
--- a/drivers/ata/ahci_mtk.c
+++ b/drivers/ata/ahci_mtk.c
@@ -163,8 +163,9 @@ static int mtk_ahci_probe(struct platform_device *pdev)
 	return err;
 }
 
-static SIMPLE_DEV_PM_OPS(ahci_pm_ops, ahci_platform_suspend,
-			 ahci_platform_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_pm_ops,
+				ahci_platform_suspend,
+				ahci_platform_resume);
 
 static const struct of_device_id ahci_of_match[] = {
 	{ .compatible = "mediatek,mtk-ahci", },
@@ -178,7 +179,7 @@ static struct platform_driver mtk_ahci_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = ahci_of_match,
-		.pm = &ahci_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_pm_ops),
 	},
 };
 module_platform_driver(mtk_ahci_driver);

-- 
2.48.0

