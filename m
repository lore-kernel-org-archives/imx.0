Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E631FF7A0;
	Mon, 27 Jan 2025 12:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982006; cv=none; b=uVM7FCDl78NhTFdsppRQoW9i227pKS2Cba9xbE/9GpJTryjEgJ3iLQujGwzvj/W4QhCsbAdZ2lA6zaVjDJFVt8cVRzI2XgJRqCZv4TvvPI0MHmxOVnjo9gcSTGdm0vz0t6cSTCKN3CIK48mIjonhSJsaWIqheN11rMlWBl+FEsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982006; c=relaxed/simple;
	bh=MLMI+xe4jCIVViG+z4qmFWASYnmXjrbqAPj9rw3IXr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hfAS8SnazaDv9ch8RCK/Cxmea1aRMp4BkprWEliWEH8Dun7mM3JfO1xxhbbL/xtVIHkLWlku8W8fWtaDPsLs1ApCHAteQEpat3uXXu53o+md2//V0YHI7u+uJaLBufphDu2zWZaoXPGNdc+zzJD/t7XItoKJWdOUQNUZWBsyFaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djsDq0zd; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djsDq0zd"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43622267b2eso45486145e9.0;
        Mon, 27 Jan 2025 04:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982002; x=1738586802; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cVfs7u/bC6+4J/CfEnlWiXT6DaEn0LhRfzsd996fsQY=;
        b=djsDq0zdIe6UyKQhd81h8fyFDk6udM4VDrfmPlEfbAwnqndOphjL8W/J3maKPOdwXU
         kIJItkcilSDwpvLtDSVzEgisAVrC5e80dnv8pcCJxFYOAxk9LIHW4FQlv8S37DmcHXrx
         /eRdsE7wSpK4lv3wXccN6wfHV9DVpdFd4C23s6kL2yyGlq2gX23Z5VVSfz/wITrbe0lf
         yBxH11UOezqIKEhJeDLp3iido/xtnuzIy/6tBPMb6M+CxCXE0012cArVHI5GHEjX43bH
         0Z9Zp5sbf0L+5bbhMmALx88Iu2/zRTwIL4kEO20uucDH3ItlWeipIQtlBJDrWi7cMMUU
         iqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982002; x=1738586802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVfs7u/bC6+4J/CfEnlWiXT6DaEn0LhRfzsd996fsQY=;
        b=o9qCEVQ7yhHscHcK+EuTLhn9nsDIRrC+P/3n119sKNhRBsABWt4FmKMNC+BkpIElzC
         gTYua3m3gTnrKpCNpA6/Gm73RDedcsr0wPeHaqEfYoRILxz6DJhXwOuHPBxcx433pLwc
         RQ5G77o9+99UBjLDb34JhBhbCy0etWCs1ZIVzAicpmqRa8d27luqeh4gIRxDynmNORbF
         BpEqAj//Evf/lvaG2UsnEXUHJ5ins8CFkrP7It6ggjKFiDCNJ/Q+jiFCQy+YKcfw8Akz
         0eGoXP855ciQA0fWWAA+EPiAe7XlHZW0WKmsnI4SAT1YLw+sA47dHIguQq/tNIEz44vE
         hyTw==
X-Forwarded-Encrypted: i=1; AJvYcCW3D7vgiSZqQZnYSEAzHevYGwcceG0EHVnEMPm8KfZtrn3gjXIZzcGmIvmhJm2lfoBWLCE=@lists.linux.dev, AJvYcCW9CBv0QaeLrYcUTbf6DrL0yMs4BhKG4d5Hw0dDStvkWTGmWfzii9w5Q/tIAGf9WVkOOJcjIbSS+kSwUqA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIo2cPECGl22cQUY3qX2a0avAdHYJ8Z2JU6p5mp6VT9Cfcrgus
	FhUYuOnQn+2hQUHgIHF3+QZBDE6I7z6gZfP25ui7Kd4eM58sQSJ3
X-Gm-Gg: ASbGncvlOzk8G9AVd2FGbT/zULS9qAaijh8P3NdY5CEqhTHdzwK1SXF4uyv6Xo99yN1
	j4NvaJPudK23a4QiQsUDHg4QGR+/ofepBtQyVhFACyrkOjZ1mMNChzkA9mNwHafbusUFONGrK2q
	EANahPhK5v3BKdDm2ByaLRlaEnVxLUaUrvvLeZthZ8ZR3UtPQgBjlJOie0+7FYt5yl33OM/XRLp
	kosaLRJ+xCp5tavqKMVDsYF+cEYB3n5SVeq4vdQLe/uPutmBkVPeLM9F3pkUy8VnKyZsKUcNTc9
	o+yt
X-Google-Smtp-Source: AGHT+IHO/ZR9VI0DRMcofIQwLzf01DYV/sQAqDzIwYKFLnZG8rtRUybzRdSJJBgxpXuRFsHSUi3z3A==
X-Received: by 2002:a05:600c:c87:b0:434:ff30:a159 with SMTP id 5b1f17b1804b1-438912d54b1mr408036395e9.0.1737982001587;
        Mon, 27 Jan 2025 04:46:41 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd508257sm129236735e9.23.2025.01.27.04.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:41 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:45:59 +0100
Subject: [PATCH RFC 04/14] ahci: dm816: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-4-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=MLMI+xe4jCIVViG+z4qmFWASYnmXjrbqAPj9rw3IXr4=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4ArKDkEFE9Y3A5/bmNOJMKuAZd/TGXo/Hnk0
 /0p5XyElHiJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKwAKCRDnIYpo1BLC
 tURaEACTN9XCdcNODbQBu+CcA358dwkWhwqcBpvBKiMOZuk7+bUram3CM+KscfMs2J4gd6MtfN/
 mJ32c1MQWHifQWvKWmdGr0ooGdtSGWohsgTrfVhi9KB8eGk6x0bHW7Oa6nMO/+bH1XBpsB0NGt8
 lXIhrHV9Aro7NvZiAp6oOB3ttVN38qKt9pdnA5zp/rNFfrnOZcYhx//s8ZOiR21PnNyOVag8OmA
 OTqWHR3pWFfC2fzT5NUG00T6TKnBaQhXEXczoDingtphAfQmOMG+y1za+ZrtTM1Ahb7gNuf47Ja
 3Fm6oikO5kNJqf7VkX4HSIYGpMhV8E0eadZxxZnnfo5NnGwwwlWDmYx/H6XTI4+Tp2uxJip3Ul+
 zosr9bo6XJW2rslEkJwDfPeeM9AIvuGfRgiQPuX6O0tiZeWFKEiDrHCpXfY5EC2vu7irMCitW2M
 JBW/vef5FWcx0wvsnOQ7Qi7ZyPtx6LXjxikC7Y2LS+TaLuoDlLWV+4mJrtniq2Gd0iFHqRsaaKK
 RPUxZjtg8KwWy0iUFXZGrQu6+Lc0VEmI1hmkEBZndGhBBo7Rh0sWQ/tlkvBFPkG+jU3/scbaqmZ
 gs/H79R23Gep2Ovribf5X2LTQYpPgNuxj/tbNOCOKw+TxFhMGgxXHZhZ1o6J+D9DVTps9jbb3ty
 0tD1wvT4bx+yMwg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_dm816.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/ahci_dm816.c b/drivers/ata/ahci_dm816.c
index b08547b877a1f77ba220e925de321ed034147d7b..cb30a55945b8bdb1efefab192575864220215d08 100644
--- a/drivers/ata/ahci_dm816.c
+++ b/drivers/ata/ahci_dm816.c
@@ -170,9 +170,9 @@ static int ahci_dm816_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static SIMPLE_DEV_PM_OPS(ahci_dm816_pm_ops,
-			 ahci_platform_suspend,
-			 ahci_platform_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_dm816_pm_ops,
+				ahci_platform_suspend,
+				ahci_platform_resume);
 
 static const struct of_device_id ahci_dm816_of_match[] = {
 	{ .compatible = "ti,dm816-ahci", },
@@ -186,7 +186,7 @@ static struct platform_driver ahci_dm816_driver = {
 	.driver = {
 		.name = AHCI_DM816_DRV_NAME,
 		.of_match_table = ahci_dm816_of_match,
-		.pm = &ahci_dm816_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_dm816_pm_ops),
 	},
 };
 module_platform_driver(ahci_dm816_driver);

-- 
2.48.0

