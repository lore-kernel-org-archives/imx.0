Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759FB212542
	for <imx@lists.linux.dev>; Sun, 18 Jan 2026 20:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768769440; cv=none; b=d7Ulekgj2XdfadFHFgIOM4FJRhIsmaZreCL+7PguKUz4qmPj5r86zUOZx8D8ULkCAohboSvlEDOZS1bAoE6+LTgu4ItqeGgaxdWYGgmyCF4Os3Uuikwb603Y4gzamISBdhwzpSYcTDWeCXif/xwyHgTLbjxhKDhjGrnYh2MWsqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768769440; c=relaxed/simple;
	bh=12pYU0nsh1edvtQBn+62FSk6cQSXGIkciUmANowJnNo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dEaQOOCeoyVcN25/UgnevFwDMzXRiDVOb0DFCE0Z/isZWI42pzDXb+A9ve/oAklQZ4t8pVb1pMfZMVAB+C25/hcBphYgN2QV4rDLVIITX/IjR37DJcxb/GewR0D8ffiQj/UJKcpEMO3FFh+70O/ZZkeMjV9e3mNOP44fz2SHJXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxmJBocG; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxmJBocG"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12331482b8fso4980195c88.1
        for <imx@lists.linux.dev>; Sun, 18 Jan 2026 12:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768769438; x=1769374238; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Puynjv+Dl13PC2EAzTsegEpQBiQKymq7P+RdFdVlq08=;
        b=cxmJBocGQPvbLqei8pzVvuLzxhyb3LivQ3fWfpGFxdsHFE8udu4qXdEN+K7RMEvpca
         MNhZZUch/+ZA6DYdQ7Ct5cZEpJ5yaMe1C6Q8lQsCzYPX6a6VIB1EqNTHKYufL+9QJ1f1
         SIoXdVCVyZn6fcWnPO6y1nBeYQMfl88fVNvqHyOUjkVdHWtwBNi21FpUC8LJl9wK714n
         3INMBtSAAU4obP9SJXG1La49MuF+CQTFx6RRArRfWeH8cDxk8tyDj7JbYFQJS8RD65BB
         XJ4ewr79QbOAFlcvqK9JXrRMK2nWjZiXUuDZNLiM1oNCXQn/Oj2ZeBGBinD0kzLYPcB5
         2fWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768769438; x=1769374238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Puynjv+Dl13PC2EAzTsegEpQBiQKymq7P+RdFdVlq08=;
        b=Aj+m5A3yvdLpTllDc9USmR9gANFzBYikcjg6B4SWzR4w8W5a5xu0zKZW/yjMtRI8/B
         1LFlpYP6dTCDFYEyn0Rsv7S5vi+Eujy+0/Oj0NINyxPWQWCDWoelAen3/Qy7ro9rscmH
         EDXMfK6/LgZnsO71y+FBNbhQ28I7mJHNMvO6ItaGCU2Pl9A3NsH2BLEXqJfKBvYPHNKD
         WKTZ6k70M298W5HUIuOv692PIc/3cuRoDk3em6JYhgZgFB688scrutvx8bp7bkFdttzU
         RqwY0TG8H8LZR15wtHuoFirJklxhNeSfN9qLzIwI8Y83DRwu255EisY3LAlqO3M7gMv1
         9Dkw==
X-Forwarded-Encrypted: i=1; AJvYcCW8ZUl9Bi87s9I0TtxGrILTeMfKAwtBBk1V4oq5DwFX+w/ytuMeznrzMDgE8dUt7dNxg6k=@lists.linux.dev
X-Gm-Message-State: AOJu0YyugQsI5NG+5RtEjKSHxdH7MSIShbKoySzeTNa0wb7Ki5+k9ooY
	M6v4UIBmac8D1KzjfKoulO49SbytAWX60MqlnmPh+FtHejqfSH5f4rY6
X-Gm-Gg: AY/fxX5JKPVPSGa+q6qT9yA+ceKK3ZxZ4Adme4oqLWR3u1hQP7gbKTeu0pW0za3FJGX
	fZP7PZDar7FcymyJ26oJNgBX1mARQhZgqjX6TMOGLaTeFD8esXcvbPwwTUgh3a39pGJcvnRhkSg
	IsUsoUKtFvkciUKvy6hBi0uwtSBWhVs3WAUVbf2scfjHzohgda7YGCqWZAOA6zYD2Zp5C9EL+ZL
	m7r0LZMlk3Cn07g1AexeZ+YAOy4hXBsIfn7zGglirLnOuIokgHvrLOUWCC7XdF3TTcq5KfEV0sH
	uyCpwrsybYmb88vmW2sBJ++YDwtJKqWF4KxcNqBszlwOsusUgMw8Wnzheke2NFt2iFFa5bShzzp
	YZSoGLqSaZKp0E0Kf0oiW4O8BIK/28q0h+cNJDlSRW5myzwEqIVeAwrKf1LdfOvpMFSAGnuKW0P
	/jcBrZgw==
X-Received: by 2002:a05:7300:cd99:b0:2a4:3593:6474 with SMTP id 5a478bee46e88-2b6b410367bmr6876089eec.36.1768769437417;
        Sun, 18 Jan 2026 12:50:37 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61::1001])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3619a7bsm10167364eec.19.2026.01.18.12.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 12:50:35 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH RESEND] ASoC: fsl: imx-card: Do not force slot width to sample width
Date: Sun, 18 Jan 2026 17:50:30 -0300
Message-Id: <20260118205030.1532696-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx-card currently sets the slot width to the physical sample width
for I2S links. This breaks controllers that use fixed-width slots
(e.g. 32-bit FIFO words), causing the unused bits in the slot to
contain undefined data when playing 16-bit streams.

Do not override the slot width in the machine driver and let the CPU
DAI select an appropriate default instead. This matches the behavior
of simple-audio-card and avoids embedding controller-specific policy
in the machine driver.

On an i.MX8MP-based board using SAI as the I2S master with 32-bit slots,
playing 16-bit audio resulted in spurious frequencies and an incorrect
SAI data waveform, as the slot width was forced to 16 bits. After this
change, audio artifacts are eliminated and the 16-bit samples correctly
occupy the first half of the 32-bit slot, with the remaining bits padded
with zeroes.

Cc: stable@vger.kernel.org
Fixes: aa736700f42f ("ASoC: imx-card: Add imx-card machine driver")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/imx-card.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 28699d7b75ca..05b4e971a366 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -346,7 +346,6 @@ static int imx_aif_hw_params(struct snd_pcm_substream *substream,
 			      SND_SOC_DAIFMT_PDM;
 		} else {
 			slots = 2;
-			slot_width = params_physical_width(params);
 			fmt = (rtd->dai_link->dai_fmt & ~SND_SOC_DAIFMT_FORMAT_MASK) |
 			      SND_SOC_DAIFMT_I2S;
 		}
-- 
2.34.1

