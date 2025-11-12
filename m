Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C79832825C
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 17:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762967914; cv=none; b=ew/zv9Z7D0qKuY+K8zPKMZ1dGjE4P7aywyPv8WfOxjGkE67HVu8/JsVUSkOixT7nzzpYxvnOIZJlmHym/uqA7Xvy3MDpF+MRBCGQE0bwPDTM0lwPuSj2T27Jcg+pZIEzotIjwaNeVqSqn9g/rm3c2SsO1q4BEJtC8xOHd9/RFWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762967914; c=relaxed/simple;
	bh=jMpPXYaKDkwcVsPk8JTKIBY+RZIzXHL7r/ukT6REJIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hnpknO5kYpx2iEa2LKsUwx85YDTe9wpb9UDEugcOFEyWK8ow6QMNOQcMbpfB2m6tE801Dkud6d8IBGRSi4lG6fKQikrAB4phifrHRVHKzmXySNTuzOJm9LSsnu6+bAveUMQKOJYWnlDBbOX84E07HrbtGfrTjbHktSyEzwcJAvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=L9cYihCl; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="L9cYihCl"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b7272012d30so185196266b.2
        for <imx@lists.linux.dev>; Wed, 12 Nov 2025 09:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1762967911; x=1763572711; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fFp1zvnznBgN+0T1h+jmPtm8mqRaI84OPEX4IDfRKM=;
        b=L9cYihCl521NDM63r+2h068/rMbuQKpnFJMe3ri9dOGUzEiGzFZmMxUVirvBvrKoBj
         A2+ILONMi2r3E8jVP8gTpTxlFfGsa+SlODHQYh9dJz5DlkFGRqHgwYxFE0qkamHN6n/Z
         t4o/TV8Ozo9yPvreuc6PZqV0BORIuY2o7Apbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762967911; x=1763572711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8fFp1zvnznBgN+0T1h+jmPtm8mqRaI84OPEX4IDfRKM=;
        b=tE3XPu3KZkNAA6Om5bQfJm7Hwj5dIQYnUiY9kcC8BMf72ly+wqistSc6wzXv3UnMLT
         7DHVcvH8gKoHKsxjr0nPVMsDUo7cWibFTTmxoNJSIeKzD2VC8qh7n7FlkCfl/8kVQ3rv
         slVmryZt0mkiQn8WeN702EOFWJJ5GaMyMfk0Ge3ApvlHu4RAa34JfcK75jVZQ8w7oC1c
         3ac+vjX2CeJL5T4u/l0Pz9ZXHkDOb3J5DZGfGj7bFW3T6nLOCj1QRB97stDLjLdahd3l
         GXFFIABAkbn0RJjp4E8y8lZJT8mHU+4XemdhM4zxRvqYy+hoQUeuBHhD9JlGi/xJ5fGx
         PbNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/b/u53bu2pduu1eJNQnYc6LZlgFeHVrQ2qJHBGaE0sKBg/LIq00ohVO9ztBqHeZYZP5A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5gBd67doanghoa/sxgry5oulTqFOD4bjszQnZ1gLAPKp8pEBE
	/PbNBXwE9mKJIZhAOfw9M7OGp4sfKw92jyA1n7+ENwdqY7yW04rE+YE2m6lNFiV9LP8=
X-Gm-Gg: ASbGncu46NO8hIvPqxgBi3KljivYfec+6MXspaEpLvXo5gcwpCGkyK/zM0rE3GQ68yu
	WCIOxuLpeINXkn/dMtuhstsGqhAYc3kphCTOnxmswTlgGST8FUYQn2JZyDw7krWOTRBJym5oZJu
	CbfTCVzFB9Li2BotA71aSocAIUKphHEIeK1NrN0lpgTJO93dCOviATVODkD0HfI+K9bZIhr56ld
	xOoukpSwOGTuHwWmUDTn2FWeHMbi624T8WBHO3+ZAEfEr/V5uPJ5GuXnZZ06qvSLX9A3Y3WD2Dx
	uTkrgqYRAELBvJpeB5+41FBcxyw+UdQqwg4H6mhqcV/2Hd8jbDiGfxUPYruTr89BPsHKEie8j/i
	b71YUEguL2FduZKRQ+rO6rWXz8tMNgN2ofHWEZhTayb08CTUXkROaNB4LSUnCBi0kqnbSuKDvsM
	qiGjDVxyYouH/EH3Zx8uWtNUHw5eT5CzhoPKxVV9YHt3KOovtx7edsnElWDt4M6KGbWJeP1RGP6
	XDpOSFIHQ1sSaHAOx3UW8SfSPtJtOnT7VAkjoJbeuBNPxirMlUMfvg=
X-Google-Smtp-Source: AGHT+IEEV00bHQWd/lidxf8la3g3vKUR8rGrFzsvXovQz2c7aRvWz16PbrAlC12SmBL57s3JHbjEbg==
X-Received: by 2002:a17:907:60d3:b0:b4e:a47f:715d with SMTP id a640c23a62f3a-b733198d584mr376086166b.17.1762967910867;
        Wed, 12 Nov 2025 09:18:30 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-71-163.retail.telecomitalia.it. [79.54.71.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b73381dd3besm180731866b.43.2025.11.12.09.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 09:18:30 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH v2 2/2] ARM: mxs_defconfig: enable sound drivers for imx28-amarula-rmm
Date: Wed, 12 Nov 2025 18:17:13 +0100
Message-ID: <20251112171820.4046537-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112171820.4046537-1-dario.binacchi@amarulasolutions.com>
References: <20251112171820.4046537-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable TLV320AIC3X I2C codec and simple-card support used on Amarula
rmm board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Drop 1/3 patch "ASoC: mxs-saif: support usage with simple-audio-card"
  because merged in linux-next.

 arch/arm/configs/mxs_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index 3b08c63b6de4..603fb003b223 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -100,6 +100,8 @@ CONFIG_SND=y
 CONFIG_SND_SOC=y
 CONFIG_SND_MXS_SOC=y
 CONFIG_SND_SOC_MXS_SGTL5000=y
+CONFIG_SND_SOC_TLV320AIC3X_I2C=y
+CONFIG_SND_SIMPLE_CARD=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
-- 
2.43.0

base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
branch: imx28-amarula-rmm-audio
