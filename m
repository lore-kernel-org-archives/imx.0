Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6A321B420
	for <imx@lists.linux.dev>; Fri,  8 Nov 2024 15:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731080163; cv=none; b=BhRY90seR/DAPe7z8SynD3/FcSihTqjXX+W79KSh3YDqfUekAvuPi6yXFJchCn2cbVeYV45ddYC92qoiohVDw4SQrEV17JGtG0efvIvt29XuRkEM1U/S25HmnemnRy4F/dlSISaiWpW3Jg431qGP4iQUFw2ZZ+ijdbqV4bFZqPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731080163; c=relaxed/simple;
	bh=PQ/aJvm69j4lPhF8o2Xa28OhkWmIoRJK40HEev5Priw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X5MEzLvfLzJILlqTqJS4GhCaPb5n9DjFZn6y+NeKCJ+NwvhhkoK+zLgF52KL/CQqnzxjcpX8r3aWo2gW5il0ueyjPQtSmHe6JRDX4HcDnMIQ/4G7gRzpb0PE+zjAkXN3B5lCRy9ZT7J8YmyI4dMJ/QeETAkUl2RvrIcAZ8fHKbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVSNipB3; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVSNipB3"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso18962605e9.3
        for <imx@lists.linux.dev>; Fri, 08 Nov 2024 07:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731080160; x=1731684960; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2nVKb2hvRP3zLcKR7jduFefSLqPzAllC+DJORNI8QjA=;
        b=BVSNipB3zKrLzxeysfynIeSvZS46FdV1BeiolvMY1kokC1ZMWSy2WiJu17of2HLFBO
         abQr1WoUIqMdxzefcRZ925iGixEfjAdliJYfG3XoMAueruoZ6ztac/RZA/gpvxlf7wHP
         yJLnljP+hOlVQuMK7X2TKIkAxnYPHGAu9gMocccQMyftPSiLs8kcywjdaJxxa/TQAHIU
         j5vpi/WfjR+BYDwSCaNx36m2B4nG+0r7F+vVxakbq5W56/4o8aGVEht2lH5jrxGqKtNc
         pL671LJbZrCxky0UbEJxTRz2f0/BFEIMf0z9W5YToeNGoAs7S9DWcihMsI7YwEfaPUln
         b9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731080160; x=1731684960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2nVKb2hvRP3zLcKR7jduFefSLqPzAllC+DJORNI8QjA=;
        b=LzOK8WwOapgLfmZgvcFqD8XMd4cuioE5jPBuly8Mjh+8+IoX/YsOToc83ZrW5Z3BN2
         dPeX/lyIRjhSiJw/m+lbODoA4OkEFF8eyOTdZjnOToNW20Ml20jwji9OWwtdxXod8YZe
         JcWVqde4Pim3pVJbtiGMzHMNPV3WXpbd2pBZO0sJgtF3JvvnBewkMYFXYABO9Jd7eUcz
         NulFhd09OKiNgis+mpp5r+qk6WKvdbJTgP38ZP8qdkaSUmua4fF/uF4r3ULe2IcRDskM
         qRfQI96miP4V7KiNFpq8vdBfjGDeKJFCaRh6hlJAfIvpwMC4rThtR4NA2yb4PJZSRy//
         VAcA==
X-Forwarded-Encrypted: i=1; AJvYcCWlaY2m/RrARsgLoiFmpiw1XcvVdD8mYarfMGgwNyPJDySUlAK1lVBvNsB2OXMX/XHQrE0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwO0ywA2MLSl+IiO3O/+dOoErC8hKUXlGhU4beX92w7dv+BMFxt
	1KAxWJA0p3c6K0R6R/hnQd5SGyXYhtQZskh6bOiAwdYc/sS4eoelUyzXQIEU
X-Google-Smtp-Source: AGHT+IFuTl+S8WzS1KOeDdZG5ICETzGr8yuMTt04P9wVoRLrVQEU567NoDmp9dR1QkFr8R1TeWkRsg==
X-Received: by 2002:a05:600c:3ca0:b0:42c:b037:5f9d with SMTP id 5b1f17b1804b1-432b74fd71emr27480065e9.3.1731080159667;
        Fri, 08 Nov 2024 07:35:59 -0800 (PST)
Received: from eichest-laptop.gad.local ([2a02:168:af72:0:c5c8:af8e:e93d:4656])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b054b34csm74750545e9.14.2024.11.08.07.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 07:35:59 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: linux@armlinux.org.uk,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	wahrenst@gmx.net,
	elinor.montmasson@savoirfairelinux.com
Cc: linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v2] ARM: imx_v6_v7_defconfig: enable SND_SOC_SPDIF
Date: Fri,  8 Nov 2024 16:34:34 +0100
Message-ID: <20241108153546.268695-1-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Enable SND_SOC_SPDIF in imx_v6_v7_defconfig to support SPDIF audio.

With commit d469b771afe1 ("ARM: dts: imx6: update spdif sound card node
properties"), the more generic audio-codec property is used instead of
the old spdif-controller property. Since most i.MX6 boards now use the
audio-codec property together with the linux,spdif-dit and
linux,spdif-dir compatible driver, it makes sense to enable
SND_SOC_SPDIF in the imx_v6_v7_defconfig. This will ensure compatibility
with the updated device tree.

Without this change, boards that use the audio-codec property will show
the following error message during boot when using the
imx_v6_v7_defconfig and spdif audio is not working:
[   24.165534] platform sound-spdif: deferred probe pending: fsl-asoc-card: snd_soc_register_card failed

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
Changes in v2:
- Improve the commit message. (Stefan)
- Removed the fixed tag because it is not fix. It just improves the
  example configuration. (Stefan)

 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 333ef55476a3..c771d7dbcadc 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -321,6 +321,7 @@ CONFIG_SND_SOC_IMX_SGTL5000=y
 CONFIG_SND_SOC_FSL_ASOC_CARD=y
 CONFIG_SND_SOC_AC97_CODEC=y
 CONFIG_SND_SOC_CS42XX8_I2C=y
+CONFIG_SND_SOC_SPDIF=y
 CONFIG_SND_SOC_TLV320AIC3X_I2C=y
 CONFIG_SND_SOC_WM8960=y
 CONFIG_SND_SOC_WM8962=y
-- 
2.43.0

