Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB381FECCD;
	Mon, 27 Jan 2025 12:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982004; cv=none; b=EiATloUPcg1oWCvlVuA29bZQ6fFklD31ce4iZm24wQLXznEiIw7BEZH08ZThyrhi9pQmyh3N/rB2BOTGt4uk4Zdq7UpwB8bbwd1P4VoJ+rSGSgDBpBtpiqH8nWUNqBhEXuu97HAAjLhFwJlSjPiTgtLp2WfS9wIcuh4vnsZYVGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982004; c=relaxed/simple;
	bh=JYTAGA6KLOpq1lfyYvO54YfNSto58DDQ8IbvFm0AQbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TBZhb5z2ylbcAgJV4dwzw5ERVNdSCh8t/MWAY/2vjkjJV66NVm/BUh2WyLfXeiYAaChhYv5LpvYOOeoIHQuUDF7S5n8gG3SW7te4AfGT6UyXMN+uyWnMRKvTQe6WnMUImrqlk4JSr548zUQNsS8VINlP8NQ5dtaQDUXhvGYI7Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OoRfwSLx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OoRfwSLx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43690d4605dso29132485e9.0;
        Mon, 27 Jan 2025 04:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982001; x=1738586801; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PqAXhIk6/9U92F97+2iMV3noNDyf/KAzFHUwKQrXPko=;
        b=OoRfwSLxuG9xYCbuq+8WdjcZtbxgvkwP0VCAHn3O0k7SXmZfkTqEoHw41qw4Mxl7IC
         n6JnWmP5fEpmSO/E0f2nEHpjm9lMVO8mPwuCLplQCc9y1kRgDblmk1zLBvz3lpl0dBfK
         u7qpd2ra7ogbBIrLCzkvF14Lui35rCCPnaCIB7msqzfMukJm1XaUZRhYA8RBg7FsTegY
         HSZrLn3/fe5/OJVBStmUvHaTclRQqALlzX7wWASG8cA1sfRgB5LpZYMj8AsSgtibmJBz
         HHTWZu59H1VdXRu5jJcQkZNSRq5Azo1HwoNqSv3c9ifYaJIgf1ACJTFgQKu+a78fT1qp
         Aing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982001; x=1738586801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PqAXhIk6/9U92F97+2iMV3noNDyf/KAzFHUwKQrXPko=;
        b=YMmLV07O1ci4BDLuniCFcFp5RV9nKN/w7xn3n8TkXt4E6wb6zklgzDR788awiSk8Eg
         LAy/9DMv36bwMLEe4hnDX7Br33CLyNiVSoRl72gSqaeHU5bPr4q8gsNyZ6YC1muZXh/O
         X5LPAlGPnIK+JEj2TfTsz3Tq8ZxY81wOS/3HnDQxozWYWj/MzD9NO7d4xUbon4xl7sFO
         9du6JS+C5o6Ysnfl7SIEXDJR/Zy5z51OXoFiwoZdEc3DsEeAhEDlSU86I/TLwBhJqlKc
         HbYhQleq0DdvMDIu7hz6vshM7rOp6rbuISp+qe4vt9L5LeALpxxvDGhCrRWege7wfmLE
         BsKA==
X-Forwarded-Encrypted: i=1; AJvYcCV6bKZ7T147sh06ygZN5Rd16G3Aqr9H1ra7QeTdfYeMW2ULbqYsR6dYODAU/B0qXTc7wOKilOnRB1yHoJs=@lists.linux.dev, AJvYcCX8PEHnduTgS43+j5f3DYfNliSMlpAWOG3HD+AK8uEtRCApyD6Bc6M2ch48avYTnGlAXCY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyyu0WviUxZgClg5fREyQ0TLGOvgRO2s/iImYS4kfZlQhOYzUQt
	tHXzWV5qivw1AVCbu+1iv5oGKaNRojz9YZdJX4cNt/dyaeVBMdmw
X-Gm-Gg: ASbGncv13ErOiOg3qQ3M5pjLKXQeojSb+4KWTOwn4Mv45VtUVVtcdcN9fc3QHYaJyzk
	cs+kiI3fYklCcqj3WmLUUd8tq3DV03tf9HnyObOZHkzcFNFpUXbYc7XdXzlGiciYxqE0zwBbXGf
	q/opf19RIoboIzc5ggZhLvniPE6J4U96wB2Y/QU12no/iUfN6sLsZ/v1AQSiehgcFml0En46yWk
	81M8hzwDSz3cMtzpPC24osIi1+Qt/447Rnu+Rq1jH+tsriHs+pgDmdQxs8hZ2++yCjWDQYOFo3x
	DRI+
X-Google-Smtp-Source: AGHT+IHpARUyFT0W0Y2128Q/x2wbxMx49MWeGsOuOnwEQsnLMO4O10VSBaMiBE+MwkR8ginshDZ66Q==
X-Received: by 2002:a05:600c:5101:b0:434:f925:f5c9 with SMTP id 5b1f17b1804b1-438913c85e0mr362999315e9.6.1737982000814;
        Mon, 27 Jan 2025 04:46:40 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd48b11esm134149285e9.19.2025.01.27.04.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:40 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:45:58 +0100
Subject: [PATCH RFC 03/14] ahci: da850: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-3-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=JYTAGA6KLOpq1lfyYvO54YfNSto58DDQ8IbvFm0AQbU=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4Ar7H3XRvBHkCDJtwncEn6hACRSaM/B9MM3j
 TUlZmcdsxuJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKwAKCRDnIYpo1BLC
 td/kD/9fRfNqFvH78A73Xd9ZGCO8XYqGGm4sadBSeVvFoAPKLlbostOLn0qrxKrBKAASdfHqsaj
 T/2jrg0tSmdNVfMU8W/4oUg5coJHOYRBw7F2NCVWhufeBLqKUxlOIn41IvdoXEMhVGczp7x66HA
 eVtALOskcYztnLiGnh3dG4UHpgI9zcbAuZZvVqr+NeCFLzMTrINpprX+Kwplsd5vfjrcLkEkCxK
 ZXedZ9qdyxy8+UWffwJRw5YJIIKc0sB+dv6k+vY7Man1vO/kjVwnqgaa1SyziRV4+TIkNO7oUuE
 7JZgVZR/5Ziu/eHN9Tuih4WuzF7wLEC+iPdGS8n/8LFu4ox5bCJFQb5iw0RzrZ+lbcp3HWBxddH
 5Tr1VGbsnJF2G82s1MqRFeVz3D3Bi3WUU/Ms0i8NcIkjH7LpkT1lHh1Ab6R4wDkWuG9/vI4D3Xj
 QC5Omh1e+vXMm1xxQxa6hak4AiSlSrswqIikBW2TebydWVHYF9i2ql4uqij/pkDMj0cKkacwNIR
 LYhGQXC9ScWUnTz34+qUc3wODdoz3WA246fpAvohnH9YEGmac6ra73KaPeidcuF9k3vZErcQIX8
 wN8mk7rbta1YD1fblRlqH0liNKjhbZcZZdQjjwbhmQ9jSgzP0S35D2ySR5Wa4+kTKrZ4c1JHODj
 zO3u5VfhG1/FLcA==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_da850.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/ahci_da850.c b/drivers/ata/ahci_da850.c
index ca0924dc5bd26ba424b26bd040bf83720c96b56f..698b0c30de0d65423f932ab3c3d95787b692cb37 100644
--- a/drivers/ata/ahci_da850.c
+++ b/drivers/ata/ahci_da850.c
@@ -227,8 +227,9 @@ static int ahci_da850_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static SIMPLE_DEV_PM_OPS(ahci_da850_pm_ops, ahci_platform_suspend,
-			 ahci_platform_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_da850_pm_ops,
+				ahci_platform_suspend,
+				ahci_platform_resume);
 
 static const struct of_device_id ahci_da850_of_match[] = {
 	{ .compatible = "ti,da850-ahci", },
@@ -242,7 +243,7 @@ static struct platform_driver ahci_da850_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = ahci_da850_of_match,
-		.pm = &ahci_da850_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_da850_pm_ops),
 	},
 };
 module_platform_driver(ahci_da850_driver);

-- 
2.48.0

